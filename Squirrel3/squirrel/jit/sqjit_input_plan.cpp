#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqarray.h"
#include "sqstring.h"
#include "sqbytecode.h"
#include "sqjit_input_plan.h"
#include "sqjit_leaf.h"
#include "sqjit_intrinsics.h"
#include "sqjit_numeric_ops.h"
#include <algorithm>
#include <cstring>

extern bool sq_nativeclosure_is_default_len(SQNativeClosure *);

namespace {
bool same(const SQObject &a,const SQObject &b) {
    return sq_type(a)==sq_type(b) && _rawval(a)==_rawval(b);
}
bool raw_get(const SQObjectPtr &base,const SQObjectPtr &key,SQObjectPtr &value) {
    if(sq_type(base)==OT_INSTANCE) return _instance(base)->Get(key,value);
    if(sq_type(base)==OT_TABLE) return _table(base)->GetRaw(key,value);
    return false;
}
// Execution cannot allocate, run callbacks, or collect garbage. Borrowing
// values from the still-live arguments avoids reference-count traffic while
// checking a read-only snapshot. Weak values are read just as in VM GET.
bool borrow_get(const SQObject &base,const SQObjectPtr &key,SQObject &out) {
    const SQObjectPtr *slot=nullptr;
    if(sq_type(base)==OT_INSTANCE) {
        auto object=_instance(base);auto member=object->_class->_members->GetRawSlot(key);
        if(!member)return false;
        if(_isfield(*member))slot=&object->_values[_member_idx(*member)];
        else {out=object->_class->_methods[_member_idx(*member)].val;return true;}
    } else if(sq_type(base)==OT_TABLE)slot=_table(base)->GetRawSlot(key);
    if(!slot)return false;
    out=_realval(*slot);return true;
}
SQJitSlotKind scalar_kind(const SQObject &v) {
    return sq_type(v)==OT_INTEGER?SQ_JIT_SLOT_INT:sq_type(v)==OT_FLOAT?SQ_JIT_SLOT_FLOAT:
        sq_type(v)==OT_BOOL?SQ_JIT_SLOT_BOOL:SQ_JIT_SLOT_UNKNOWN;
}
bool no_shadow(SQSharedState *ss,const SQObject &base,const SQObjectPtr &key,bool checked_getter=false) {
    if(sq_type(base)!=OT_INSTANCE || _instance(base)->_class->_members->GetRawSlot(key) ||
       (!checked_getter && sq_type(_instance(base)->_class->_metamethods[MT_GET])!=OT_NULL)) return false;
    return !_table(ss->_instance_default_delegate)->GetRawSlot(key);
}
}

SQInteger SQJitInputBindings::Read(SQObjectPtr *entry,SQClosure *closure,SQInteger *values) const {
    if(!entry || !closure || closure->_env || !values || nodes.size()>MAX_INPUTS) return 0;
    SQSharedState *ss=closure->_function->_sharedstate;
    if(array_length && (sq_type(ss->_array_len_closure)!=OT_NATIVECLOSURE ||
       !sq_nativeclosure_is_default_len(_nativeclosure(ss->_array_len_closure)))) return 0;
    SQObject resolved[MAX_INPUTS];
    for(size_t n=0;n<nodes.size();++n) {
        const auto &b=nodes[n]; SQObject &v=resolved[n];
        switch(b.source) {
        case SQJitInputBinding::Argument: v=entry[b.index]; break;
        case SQJitInputBinding::EntryClosure: v._type=OT_CLOSURE;v._unVal.pClosure=closure;break;
        case SQJitInputBinding::Field:
            if(!borrow_get(resolved[b.parent],b.key,v)) return 0;
            break;
        case SQJitInputBinding::Element:
            if(sq_type(resolved[b.parent])!=OT_ARRAY || b.index<0 || b.index>=_array(resolved[b.parent])->Size()) return 0;
            v=_realval(_array(resolved[b.parent])->_values[b.index]);
            break;
        case SQJitInputBinding::Metamethod:
            if(sq_type(resolved[b.parent])!=OT_INSTANCE) return 0;
            v=_instance(resolved[b.parent])->_class->_metamethods[b.index]; break;
        case SQJitInputBinding::Root:
            if(sq_type(resolved[b.parent])!=OT_CLOSURE || !_closure(resolved[b.parent])->_root) return 0;
            v=_closure(resolved[b.parent])->_root->_obj; break;
        case SQJitInputBinding::RootFallback:
            if(!no_shadow(ss,resolved[b.parent],b.key,b.lookup>=0) || !borrow_get(resolved[b.owner],b.key,v)) return 0;
            if(b.lookup>=0 && !same(_instance(resolved[b.parent])->_class->_metamethods[MT_GET],resolved[b.lookup]))return 0;
            break;
        }
        if(sq_type(v)!=b.type) return 0;
        if(b.type==OT_INSTANCE && (sq_type(_weakref(b.expected)->_obj)!=OT_CLASS ||
           _instance(v)->_class!=_class(_weakref(b.expected)->_obj))) return 0;
        if(b.type==OT_ARRAY && b.length>=0 && _array(v)->Size()!=b.length) return 0;
        if(b.type==OT_CLOSURE) {
            if(!same(v,_weakref(b.expected)->_obj) || _closure(v)->_env) return 0;
        }
        if(b.type==OT_NATIVECLOSURE) {
            if(!same(v,_weakref(b.expected)->_obj) || _nativeclosure(v)->_env) return 0;
            const auto *spec=sqjit_math_spec(_nativeclosure(v));
            if(b.math>=0 && (!spec || spec->kind!=b.math)) return 0;
        }
        if(scalar_kind(v)!=SQ_JIT_SLOT_UNKNOWN) std::memcpy(&values[n],&v._unVal,sizeof(SQInteger));
    }
    return 1;
}

namespace {
// Specialize types, lookup dependencies and small array lengths, never numeric
// field contents. All successful paths are read-only and cannot invoke user
// callbacks. Thus entry guard failure or scalar arithmetic failure can replay.
struct Builder {
    struct Value {
        enum Kind { Unknown, Constant, Input, Scalar, LengthCall, Missing } kind=Unknown;
        SQObjectPtr literal;
        SQInteger index=-1;
        SQJitSlotKind type=SQ_JIT_SLOT_UNKNOWN;
        static Value constant(const SQObjectPtr &v) { Value r;r.kind=Constant;r.literal=v;return r; }
        static Value input(SQInteger n) { Value r;r.kind=Input;r.index=n;return r; }
    };
    SQJitInputBindings bindings;
    std::vector<SQObjectPtr> observed,literals;
    std::vector<SQInstruction> code;
    SQSharedState *ss;
    SQInteger slots=1,visits=0,depth=0;
    bool touched=false;
    explicit Builder(SQSharedState *state):ss(state) {}
    SQInteger reg() { return slots<SQJitLeafPlan::MAX_SCALAR_SLOTS?slots++:-1; }
    SQInteger literal(const SQObjectPtr &v) {
        for(size_t n=0;n<literals.size();++n) if(same(literals[n],v)) return n;
        literals.push_back(v);return literals.size()-1;
    }
    bool emit(SQOpcode op,SQInteger a0=0,SQInteger a1=0,SQInteger a2=0,SQInteger a3=0) {
        if(a0<0 || code.size()>=2048) return false;
        code.push_back(SQInstruction(op,a0,a1,a2,a3));return true;
    }
    SQObjectType type(const Value &v) const {
        if(v.kind==Value::Constant) return sq_type(v.literal);
        if(v.kind==Value::Input) return bindings.nodes[v.index].type;
        return v.kind==Value::Scalar?sqjit_scalar_type(v.type):OT_NULL;
    }
    bool scalar(Value &v) {
        if(v.kind==Value::Scalar) return true;
        auto kind=v.kind==Value::Constant?scalar_kind(v.literal):
            v.kind==Value::Input?scalar_kind(observed[v.index]):SQ_JIT_SLOT_UNKNOWN;
        if(kind==SQ_JIT_SLOT_UNKNOWN) return false;
        SQInteger dst=reg();if(dst<0) return false;
        if(v.kind==Value::Constant) {if(!emit(_OP_LOAD,dst,literal(v.literal)))return false;}
        else if(!emit(SQJIT_OP_INPUT_LOAD,dst,v.index,0,kind)) return false;
        v.kind=Value::Scalar;v.index=dst;v.type=kind;v.literal.Null();return true;
    }
    bool add(SQJitInputBinding b,const SQObjectPtr &observed_value,Value &out) {
        b.type=sq_type(observed_value);
        if(b.type==OT_INSTANCE) b.expected=SQObjectPtr(_instance(observed_value)->_class->GetWeakRef(OT_CLASS));
        else if(b.type==OT_CLOSURE || b.type==OT_NATIVECLOSURE) {
            b.expected=SQObjectPtr(_refcounted(observed_value)->GetWeakRef(b.type));
            if(b.type==OT_CLOSURE && _closure(observed_value)->_env) return false;
            if(b.type==OT_NATIVECLOSURE && _nativeclosure(observed_value)->_env) return false;
        } else if(b.type!=OT_ARRAY && b.type!=OT_TABLE && scalar_kind(observed_value)==SQ_JIT_SLOT_UNKNOWN) return false;
        for(size_t n=0;n<bindings.nodes.size();++n) {
            const auto &old=bindings.nodes[n];
            if(old.source==b.source && old.parent==b.parent && old.index==b.index && old.owner==b.owner && same(old.key,b.key)) {
                out=Value::input(n);return true;
            }
        }
        if(bindings.nodes.size()==SQJitInputBindings::MAX_INPUTS) return false;
        out=Value::input(bindings.nodes.size());bindings.nodes.push_back(b);observed.push_back(observed_value);return true;
    }
    bool length(Value array,SQInteger &size) {
        if(array.kind!=Value::Input || type(array)!=OT_ARRAY) return false;
        size=_array(observed[array.index])->Size();
        if(size>16) return false;
        bindings.nodes[array.index].length=size;return true;
    }
    bool root(Value closure,Value &out) {
        if(closure.kind!=Value::Input || type(closure)!=OT_CLOSURE || !_closure(observed[closure.index])->_root) return false;
        SQJitInputBinding b;b.source=SQJitInputBinding::Root;b.parent=closure.index;
        return add(b,SQObjectPtr(_closure(observed[closure.index])->_root->_obj),out) && type(out)==OT_TABLE;
    }
    bool get(Value base,Value key,Value &out) {
        if(base.kind!=Value::Input || key.kind!=Value::Constant) return false;
        SQObjectPtr value;SQJitInputBinding b;b.parent=base.index;
        if(type(base)==OT_ARRAY && sq_type(key.literal)==OT_INTEGER) {
            b.source=SQJitInputBinding::Element;b.index=_integer(key.literal);
            if(!_array(observed[base.index])->Get(b.index,value)) return false;
        } else if(raw_get(observed[base.index],key.literal,value)) {
            b.source=SQJitInputBinding::Field;b.key=key.literal;
            if(sq_type(b.key)!=OT_STRING) return false;
        } else if(type(base)==OT_INSTANCE) {
            b.source=SQJitInputBinding::Metamethod;b.index=MT_GET;
            value=_instance(observed[base.index])->_class->_metamethods[MT_GET];
            Value method;
            return sq_type(value)==OT_CLOSURE && add(b,value,method) && call(method,{base,key},out) && out.kind!=Value::Missing;
        } else return false;
        touched=true;return add(b,value,out);
    }
    bool prepare(Value base,const SQObjectPtr &key,Value owner,Value &out) {
        if(sq_type(key)!=OT_STRING) return false;
        if(type(base)==OT_ARRAY && scstrcmp(_stringval(key),_SC("len"))==0) {
            if(sq_type(ss->_array_len_closure)!=OT_NATIVECLOSURE ||
               !sq_nativeclosure_is_default_len(_nativeclosure(ss->_array_len_closure))) return false;
            bindings.array_length=true;out.kind=Value::LengthCall;return true;
        }
        if(base.kind!=Value::Input) return false;
        SQObjectPtr value;
        if(raw_get(observed[base.index],key,value)) return get(base,Value::constant(key),out);
        if(!no_shadow(ss,observed[base.index],key,true)) return false;
        SQInteger lookup=-1;
        const auto &getter=_instance(observed[base.index])->_class->_metamethods[MT_GET];
        if(sq_type(getter)!=OT_NULL) {
            // A type-checked index getter can decline string names by throwing
            // null. Prove that outcome without emitting arithmetic or effects,
            // then guard its identity alongside the usual root fallback rules.
            SQJitInputBinding dependency;dependency.source=SQJitInputBinding::Metamethod;
            dependency.parent=base.index;dependency.index=MT_GET;
            Value method,result;size_t before=code.size();
            if(sq_type(getter)!=OT_CLOSURE || !add(dependency,getter,method) ||
               !call(method,{base,Value::constant(key)},result) || result.kind!=Value::Missing || code.size()!=before)return false;
            lookup=method.index;
        }
        Value table;if(!root(owner,table) || !raw_get(observed[table.index],key,value)) return false;
        SQJitInputBinding b;b.source=SQJitInputBinding::RootFallback;b.parent=base.index;b.owner=table.index;b.key=key;
        b.lookup=lookup;
        touched=true;return add(b,value,out);
    }
    bool compare(Value left,Value right,SQOpcode op,SQInteger cmp,Value &out) {
        if(left.kind!=Value::Constant || right.kind!=Value::Constant) return false;
        bool answer;
        if(op==_OP_EQ || op==_OP_NE) {
            if(sq_type(left.literal)==OT_FLOAT || sq_type(right.literal)==OT_FLOAT) return false;
            answer=same(left.literal,right.literal);if(op==_OP_NE)answer=!answer;
        } else {
            if(sq_type(left.literal)!=OT_INTEGER || sq_type(right.literal)!=OT_INTEGER) return false;
            auto a=_integer(left.literal),b=_integer(right.literal);
            if(cmp==CMP_L)answer=a<b;else if(cmp==CMP_LE)answer=a<=b;
            else if(cmp==CMP_G)answer=a>b;else if(cmp==CMP_GE)answer=a>=b;else return false;
        }
        out=Value::constant(SQObjectPtr(answer));return true;
    }
    bool truth(const Value &v,bool &out) {
        if(v.kind!=Value::Constant) return false;
        SQObjectPtr value=v.literal;out=!SQVM::IsFalse(value);
        return true;
    }
    bool call(Value callable,const std::vector<Value> &args,Value &out) {
        if(callable.kind==Value::LengthCall) {
            SQInteger n;if(args.size()!=1 || !length(args[0],n)) return false;
            out=Value::constant(SQObjectPtr(n));return true;
        }
        if(callable.kind!=Value::Input) return false;
        if(type(callable)==OT_NATIVECLOSURE) {
            const auto *spec=sqjit_math_spec(_nativeclosure(observed[callable.index]));
            if(!spec || args.size()!=size_t(spec->nargs+1)) return false;
            Value a=args[1],b=args[spec->nargs==2?2:1];
            if(!scalar(a) || !scalar(b) || a.type==SQ_JIT_SLOT_BOOL || b.type==SQ_JIT_SLOT_BOOL) return false;
            bindings.nodes[callable.index].math=spec->kind;
            out.kind=Value::Scalar;out.type=SQ_JIT_SLOT_FLOAT;out.index=reg();
            return emit(SQJIT_OP_MATH,out.index,a.index,b.index,spec->kind);
        }
        if(type(callable)!=OT_CLOSURE || ++depth>8) return false;
        auto p=_closure(observed[callable.index])->_function;
        if(p->_bgenerator || p->_varparams || p->_ndefaultparams || p->_noutervalues ||
           args.size()!=size_t(p->_nparameters) || p->_stacksize<p->_nparameters ||
           p->_stacksize>MAX_FUNC_STACKSIZE || p->_ninstructions<=0 || p->_ninstructions>256) return false;
        SQBytecodeAnalysis analysis;
        if(!analysis.Build(p->_instructions,p->_ninstructions,p->_stacksize)) return false;
        std::vector<Value> v(p->_stacksize);
        std::copy(args.begin(),args.end(),v.begin());
        for(SQInteger ip=0;ip<p->_ninstructions;) {
            if(++visits>4096 || !analysis.facts[ip].valid) return false;
            const auto &i=p->_instructions[ip];SQInteger next=ip+1;
            // Incoming owners remain intact, including those in inlined calls.
            for(SQInteger n=0;n<p->_nparameters;++n) if(analysis.facts[ip].writes.test(n)) return false;
            auto load=[&](SQInteger n,Value &dst) {
                if(n<0 || n>=p->_nliterals) return false;
                auto t=sq_type(p->_literals[n]);
                if(t!=OT_NULL && t!=OT_STRING && scalar_kind(p->_literals[n])==SQ_JIT_SLOT_UNKNOWN) return false;
                dst=Value::constant(p->_literals[n]);return true;
            };
            switch(i.op) {
            case _OP_LINE:break;
            case _OP_LOAD:if(!load(i._arg1,v[i._arg0]))return false;break;
            case _OP_DLOAD:if(!load(i._arg1,v[i._arg0]) || !load(i._arg3,v[i._arg2]))return false;break;
            case _OP_LOADINT:v[i._arg0]=Value::constant(SQObjectPtr(SQInteger(SQInt32(i._arg1))));break;
            case _OP_LOADBOOL:v[i._arg0]=Value::constant(SQObjectPtr(i._arg1!=0));break;
            case _OP_LOADNULLS:for(SQInteger n=0;n<i._arg1;++n)v[i._arg0+n]=Value::constant(SQObjectPtr());break;
            case _OP_MOVE:v[i._arg0]=v[i._arg1];break;
            case _OP_DMOVE:v[i._arg0]=v[i._arg1];v[i._arg2]=v[i._arg3];break;
            case _OP_GETK: {
                Value key;if(!load(i._arg1,key) || !get(v[i._arg2],key,v[i._arg0]))return false;break;
            }
            case _OP_GET:if(!get(v[i._arg1],v[i._arg2],v[i._arg0]))return false;break;
            case _OP_PREPCALLK: {
                Value key,base=v[i._arg2],target;
                if(i._arg0==i._arg3 || !load(i._arg1,key) || !prepare(base,key.literal,callable,target))return false;
                v[i._arg3]=base;v[i._arg0]=target;touched=true;break;
            }
            case _OP_CALL:case _OP_TAILCALL: {
                bool tail=i.op==_OP_TAILCALL && type(v[i._arg1])==OT_CLOSURE;
                std::vector<Value> arguments(v.begin()+i._arg2,v.begin()+i._arg2+i._arg3);
                Value result;if(!call(v[i._arg1],arguments,result))return false;
                if(tail || result.kind==Value::Missing){out=result;--depth;return true;}
                if(i._arg0!=255)v[i._arg0]=result;break;
            }
            case _OP_ADD:case _OP_SUB:case _OP_MUL:case _OP_DIV:case _OP_MOD: {
                Value a=v[i._arg2],b=v[i._arg1],r;
                if(!scalar(a) || !scalar(b) || a.type==SQ_JIT_SLOT_BOOL || b.type==SQ_JIT_SLOT_BOOL)return false;
                r.kind=Value::Scalar;r.index=reg();r.type=a.type==SQ_JIT_SLOT_FLOAT || b.type==SQ_JIT_SLOT_FLOAT?SQ_JIT_SLOT_FLOAT:SQ_JIT_SLOT_INT;
                if(!emit((SQOpcode)i.op,r.index,b.index,a.index))return false;v[i._arg0]=r;break;
            }
            case _OP_TYPEOF: {
                auto t=type(v[i._arg1]);const SQChar *name=t==OT_INTEGER?_SC("integer"):t==OT_FLOAT?_SC("float"):t==OT_BOOL?_SC("bool"):
                    t==OT_STRING && v[i._arg1].kind==Value::Constant?_SC("string"):nullptr;
                if(!name)return false;v[i._arg0]=Value::constant(SQObjectPtr(SQString::Create(ss,name)));break;
            }
            case _OP_EQ:case _OP_NE:case _OP_CMP:case _OP_JCMP: {
                Value right,result;
                if((i.op==_OP_EQ || i.op==_OP_NE) && i._arg3){if(!load(i._arg1,right))return false;}
                else right=v[i.op==_OP_JCMP?i._arg0:i._arg1];
                if(!compare(v[i._arg2],right,(SQOpcode)i.op,i._arg3,result))return false;
                if(i.op==_OP_JCMP){if(!_integer(result.literal))next=analysis.facts[ip].target;}
                else v[i._arg0]=result;break;
            }
            case _OP_JZ:case _OP_AND:case _OP_OR: {
                Value condition=v[i.op==_OP_JZ?i._arg0:i._arg2];bool yes;
                if(!truth(condition,yes))return false;
                if(i.op==_OP_JZ){if(!yes)next=analysis.facts[ip].target;}
                else if(yes==(i.op==_OP_OR)){v[i._arg0]=condition;next=analysis.facts[ip].target;}
                break;
            }
            case _OP_JMP:next=analysis.facts[ip].target;break;
            case _OP_FOREACH: {
                SQInteger size;if(!length(v[i._arg0],size))return false;
                const Value iter=v[i._arg2+2];
                if(iter.kind!=Value::Constant || (sq_type(iter.literal)!=OT_NULL && sq_type(iter.literal)!=OT_INTEGER))return false;
                SQInteger n=sq_type(iter.literal)==OT_NULL?0:_integer(iter.literal);
                if(n<0 || n>size)return false;
                if(n==size)next=analysis.facts[ip].target;
                else {
                    Value key=Value::constant(SQObjectPtr(n)),element;
                    if(!get(v[i._arg0],key,element))return false;
                    v[i._arg2]=key;v[i._arg2+1]=element;v[i._arg2+2]=Value::constant(SQObjectPtr(n+1));
                    next=ip+2; // Array iteration skips the generator-only POSTFOREACH.
                    if(ip+1>=p->_ninstructions || p->_instructions[ip+1].op!=_OP_POSTFOREACH)return false;
                }
                break;
            }
            case _OP_RETURN:
                if(i._arg0==255)return false;out=v[i._arg1];--depth;return true;
            case _OP_THROW:
                if(v[i._arg0].kind!=Value::Constant || sq_type(v[i._arg0].literal)!=OT_NULL)return false;
                out.kind=Value::Missing;--depth;return true;
            default:return false;
            }
            if(next<0 || next>=p->_ninstructions)return false;
            ip=next;
        }
        return false;
    }
};
}

bool SQJitInputPlan::Build(SQFunctionProto *p,SQObjectPtr *entry,SQClosure *closure) {
    lowered.Null();bindings=SQJitInputBindings();temporary_writes.clear();
    if(!p || !entry || !closure || closure->_env || sq_type(entry[0])!=OT_INSTANCE ||
       p->_nparameters<1 || p->_nparameters>SQJitLeafPlan::MAX_PARAMETERS) return false;
    Builder b(p->_sharedstate);std::vector<Builder::Value> args;
    for(SQInteger n=0;n<p->_nparameters;++n) {
        SQJitInputBinding input;input.source=SQJitInputBinding::Argument;input.index=n;
        Builder::Value value;if(!b.add(input,entry[n],value))return false;args.push_back(value);
    }
    SQJitInputBinding input;input.source=SQJitInputBinding::EntryClosure;
    Builder::Value method,result;
    // An explicit marker ensures the scalar tier checks the scratch owner
    // before taking snapshots and drops it only after successful execution.
    b.emit(_OP_LINE);
    if(!b.add(input,SQObjectPtr(closure),method) || !b.call(method,args,result) ||
       !b.scalar(result) || !b.emit(_OP_RETURN,1,result.index) || !b.touched) return false;
    auto out=SQFunctionProto::Create(p->_sharedstate,b.code.size(),b.literals.size(),1,0,0,0,0,0);
    if(!out)return false;
    lowered=SQObjectPtr(out);out->_stacksize=b.slots;out->_bgenerator=false;out->_varparams=0;
    out->_name=p->_name;out->_sourcename=p->_sourcename;
    std::copy(b.code.begin(),b.code.end(),out->_instructions);
    std::copy(b.literals.begin(),b.literals.end(),out->_literals);
    bindings=std::move(b.bindings);temporary_writes.push_back(0);return true;
}
SQFunctionProto *SQJitInputPlan::Lowered() const {
    return sq_type(lowered)==OT_FUNCPROTO?_funcproto(lowered):nullptr;
}
