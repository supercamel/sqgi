#include "sqpcheader.h"
#include "sqvm.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqarray.h"
#include "sqstring.h"
#include "sqbytecode.h"
#include "sqjit_object_plan.h"
#include <algorithm>
#include <map>
#include <vector>

// This pass produces ordinary scalar bytecode for the existing backends. All
// objects are local, all calls are analyzed, and only a scalar can escape.
// Thus a native guard failure can replay the original function without heap
// rollback or materializing a partially executed object graph.
struct SQJitObjectPlan::Impl {
    enum Kind { UNKNOWN, SCALAR, LITERAL, ROOT, CLASS, INSTANCE, ARRAY, CALL };
    struct Value {
        Kind kind;
        SQInteger index;
        bool constant;
        SQObjectPtr literal;
        Value(Kind k=UNKNOWN,SQInteger i=-1):kind(k),index(i),constant(false) {}
    };
    struct Object { Kind kind; SQInteger klass; std::vector<Value> fields; };
    struct Class {
        SQObjectPtr weak, constructor;
        std::vector<SQObjectPtr> defaults;
    };
    struct Binding { SQObjectPtr key, weak; };
    struct Method { SQInteger klass, metamethod; SQObjectPtr key, weak; };
    struct RootFallback { SQInteger klass; SQObjectPtr key; };
    struct Prepared { SQClosure *closure; Value self; SQInteger klass; bool conversion; };
    struct Frame {
        SQFunctionProto *proto;
        std::vector<Value> values;
        std::vector<SQInteger> registers;
        bool root;
    };
    SQJitObjectPlan &owner;
    SQSharedState *shared;
    SQObjectPtr root, lowered;
    std::vector<Class> classes;
    std::vector<Binding> bindings;
    std::vector<Method> methods;
    std::vector<RootFallback> root_fallbacks;
    std::vector<Object> objects;
    std::vector<Prepared> prepared;
    std::vector<SQInstruction> code;
    std::vector<SQObjectPtr> literals;
    SQSlotSet used;
    SQInteger slots, parameters, visits, depth, loop_entry_objects;
    explicit Impl(SQJitObjectPlan &p):owner(p),shared(NULL),slots(0),parameters(0),visits(0),depth(0),loop_entry_objects(-1) {}
    bool Fail(const char *reason) { owner.reason=reason; return false; }
    SQInteger Allocate() {
        for(SQInteger n=parameters;n<MAX_FUNC_STACKSIZE;++n) if(!used.test(n)) {
            used.set(n); slots=std::max(slots,n+1); return n;
        }
        Fail("object inlining register limit"); return -1;
    }
    SQInteger Register(Frame &f,SQInteger n) {
        if(n<0 || n>=f.proto->_stacksize) return -1;
        if(f.registers[n]<0) f.registers[n]=Allocate();
        return f.registers[n];
    }
    SQInteger Literal(const SQObjectPtr &v) {
        for(size_t n=0;n<literals.size();++n)
            if(sq_type(literals[n])==sq_type(v) && _rawval(literals[n])==_rawval(v)) return n;
        literals.push_back(v); return literals.size()-1;
    }
    bool Emit(SQOpcode op,SQInteger a0=0,SQInteger a1=0,SQInteger a2=0,SQInteger a3=0) {
        if(code.size()>=2048 || a0<0 || a0>255 || a2<0 || a2>255 || a3<0 || a3>255)
            return Fail("object inlining instruction or register limit");
        code.push_back(SQInstruction(op,a0,a1,a2,a3)); return true;
    }
    bool Copy(Frame &f,SQInteger dst,const Value &source) {
        Value v=source; // dst may alias source's abstract register.
        if(dst==255) return true;
        if(dst<0 || dst>=f.proto->_stacksize) return false;
        if(v.kind==SCALAR) {
            SQInteger reg=Register(f,dst);
            if(reg<0 || (reg!=v.index && !Emit(_OP_MOVE,reg,v.index))) return false;
            v.index=reg;
        }
        f.values[dst]=v; return true;
    }
    bool Load(Frame &f,SQInteger dst,const SQObjectPtr &literal) {
        Value v(LITERAL); v.literal=literal; v.constant=true;
        if(sq_type(literal)==OT_INTEGER || sq_type(literal)==OT_FLOAT || sq_type(literal)==OT_BOOL) {
            SQInteger reg=Register(f,dst);
            if(reg<0 || !Emit(_OP_LOAD,reg,Literal(literal))) return false;
            v.kind=SCALAR; v.index=reg;
        }
        return Copy(f,dst,v);
    }
    bool StoreScalar(Value &dst,const Value &value) {
        if(value.kind!=SCALAR) return Fail("non-numeric virtual array element");
        if(dst.kind!=SCALAR) { dst=Value(SCALAR,Allocate()); if(dst.index<0) return false; }
        if(!Emit(_OP_MOVE,dst.index,value.index)) return false;
        dst.constant=false;
        return true;
    }
    SQInteger ClassIndex(SQClass *c) {
        for(size_t n=0;n<classes.size();++n) if(_class(_weakref(classes[n].weak)->_obj)==c) return n;
        if(classes.size()>=8 || c->_base || c->_udsize || c->_hook || c->_typetag)
            return Fail("native or inherited class in object kernel"),-1;
        // Skipping construction must not change the observable class lock.
        // Retry after an interpreted call has performed the first construction.
        if(!c->_locked) { owner.retryable=true; return Fail("object class awaits first construction"),-1; }
        SQObjectPtr ctor;
        if(!c->GetConstructor(ctor) || sq_type(ctor)!=OT_CLOSURE) return -1;
        Class spec; spec.weak=SQObjectPtr(c->GetWeakRef(OT_CLASS));
        spec.constructor=SQObjectPtr(_closure(ctor)->GetWeakRef(OT_CLOSURE));
        for(SQUnsignedInteger n=0;n<c->_defaultvalues.size();++n) {
            const SQObjectPtr &v=c->_defaultvalues[n].val;
            if(sq_type(v)!=OT_NULL && !sq_isnumeric(v) && sq_type(v)!=OT_BOOL) return -1;
            spec.defaults.push_back(v);
        }
        if(spec.defaults.empty() || spec.defaults.size()>8) return -1;
        classes.push_back(spec); return classes.size()-1;
    }
    SQClass *Klass(SQInteger n) const { return _class(_weakref(classes[n].weak)->_obj); }
    bool RootClass(const SQObjectPtr &key,Value &out) {
        SQObjectPtr value;
        if(!_table(_weakref(root)->_obj)->GetRaw(key,value) || sq_type(value)!=OT_CLASS) return false;
        SQInteger n=ClassIndex(_class(value)); if(n<0) return false;
        bool found=false;
        for(const Binding &b:bindings) found|=_rawval(b.key)==_rawval(key);
        if(!found) { Binding b; b.key=key; b.weak=classes[n].weak; bindings.push_back(b); }
        out=Value(CLASS,n); return true;
    }
    SQClosure *MethodClosure(SQInteger klass,const SQObjectPtr &key,SQInteger mm=-1) {
        SQObjectPtr value,index;
        SQClass *c=Klass(klass);
        if(mm>=0) value=c->_metamethods[mm];
        else {
            if(!c->_members->Get(key,index) || !_ismethod(index)) return NULL;
            value=c->_methods[_member_idx(index)].val;
        }
        if(sq_type(value)!=OT_CLOSURE) return NULL;
        for(const Method &m:methods) if(m.klass==klass && m.metamethod==mm &&
            (mm>=0 || _rawval(m.key)==_rawval(key))) return _closure(value);
        Method m; m.klass=klass; m.metamethod=mm; m.key=key;
        m.weak=SQObjectPtr(_closure(value)->GetWeakRef(OT_CLOSURE)); methods.push_back(m);
        return _closure(value);
    }
    SQInteger Field(SQInteger object,const SQObjectPtr &key) {
        SQObjectPtr index;
        if(!Klass(objects[object].klass)->_members->Get(key,index) || !_isfield(index)) return -1;
        return _member_idx(index);
    }
    bool NewInstance(SQInteger klass,Value &out) {
        if(objects.size()>=64) return Fail("virtual object limit");
        Object obj; obj.kind=INSTANCE; obj.klass=klass;
        for(const SQObjectPtr &v:classes[klass].defaults) {
            Value field(LITERAL); field.literal=v;
            if(sq_type(v)!=OT_NULL) {
                field=Value(SCALAR,Allocate());
                if(field.index<0 || !Emit(_OP_LOAD,field.index,Literal(v))) return false;
            }
            obj.fields.push_back(field);
        }
        objects.push_back(obj); out=Value(INSTANCE,objects.size()-1); ++owner.allocations_removed;
        return true;
    }
    bool Element(Frame &f,SQInteger dst,Value base,Value key,const Value *write) {
        if(base.kind!=ARRAY || key.kind!=SCALAR || objects[base.index].fields.empty()) return false;
        if(key.constant && sq_type(key.literal)==OT_INTEGER) {
            SQInteger n=_integer(key.literal);
            if(n<0 || n>=(SQInteger)objects[base.index].fields.size()) return false;
            if(write && !StoreScalar(objects[base.index].fields[n],*write)) return false;
            return Copy(f,dst,write?*write:objects[base.index].fields[n]);
        }
        const size_t count=objects[base.index].fields.size();
        SQInteger compare=Allocate(),constant=Allocate();
        if(compare<0 || constant<0 || (write && write->kind!=SCALAR)) return false;
        std::vector<SQInteger> exits;
        SQInteger result=dst==255?-1:Register(f,dst);
        for(size_t n=0;n<count;++n) {
            if(!Emit(_OP_LOADINT,constant,n) || !Emit(_OP_EQ,compare,constant,key.index)) return false;
            SQInteger skip=code.size(); if(!Emit(_OP_JZ,compare)) return false;
            Value &field=objects[base.index].fields[n];
            if(write) { if(!StoreScalar(field,*write)) return false; }
            if(dst!=255 && !Emit(_OP_MOVE,result,write?write->index:field.index)) return false;
            exits.push_back(code.size()); if(!Emit(_OP_JMP)) return false;
            code[skip]._arg1=code.size()-skip-1;
        }
        // A native THROW exits to the interpreter. All writes so far are to
        // virtual locals, so replay preserves the original exception and state.
        if(!Emit(_OP_THROW,0)) return false;
        for(SQInteger jump:exits) code[jump]._arg1=code.size()-jump-1;
        used.reset(compare); used.reset(constant);
        if(dst!=255) f.values[dst]=Value(SCALAR,result);
        return true;
    }
    bool Get(Frame &f,SQInteger dst,Value base,Value key) {
        if(base.kind==ARRAY) return Element(f,dst,base,key,NULL);
        if(key.kind!=LITERAL) return false;
        if(base.kind==INSTANCE) {
            SQInteger field=Field(base.index,key.literal);
            if(field<0) return false;
            return Copy(f,dst,objects[base.index].fields[field]);
        }
        Value result;
        return base.kind==ROOT && RootClass(key.literal,result) && Copy(f,dst,result);
    }
    bool Set(Frame &f,SQInteger dst,Value base,Value key,Value value) {
        if(base.kind==ARRAY) return Element(f,dst,base,key,&value);
        if(base.kind!=INSTANCE || key.kind!=LITERAL) return false;
        SQInteger field=Field(base.index,key.literal); if(field<0) return false;
        Value &old=objects[base.index].fields[field];
        // A field created only in the body does not exist on the zero-trip
        // path. Existing loop objects must keep their incoming field layout;
        // objects constructed inside the body can still initialize normally.
        if(base.index<loop_entry_objects && old.kind!=value.kind)
            return Fail("virtual field layout changes across loop");
        if(value.kind==SCALAR) { if(!StoreScalar(old,value)) return false; }
        else if(old.kind==LITERAL && sq_type(old.literal)==OT_NULL && value.kind==ARRAY) old=value;
        else return Fail("changing virtual object layout");
        return Copy(f,dst,value);
    }
    bool Prepare(Frame &f,const SQInstruction &i) {
        if(i._arg1<0 || i._arg1>=f.proto->_nliterals) return false;
        SQObjectPtr key=f.proto->_literals[i._arg1];
        Value source=f.values[i._arg2]; Prepared p={NULL,source,-1,false};
        if(source.kind==SCALAR && sq_type(key)==OT_STRING && scstrcmp(_stringval(key),_SC("tofloat"))==0) {
            p.conversion=true;
            SQInteger target=Register(f,i._arg0),receiver=Register(f,i._arg3);
            if(target<0 || receiver<0 || !Emit(_OP_PREPCALLK,target,Literal(key),source.index,receiver)) return false;
        }
        else if(source.kind==ROOT) {
            Value klass; if(!RootClass(key,klass)) return false; p.klass=klass.index;
        }
        else if(source.kind==INSTANCE) {
            p.closure=MethodClosure(objects[source.index].klass,key);
            if(!p.closure) {
                // An unqualified global is resolved only after the instance.
                SQObjectPtr shadow;
                SQClass *c=Klass(objects[source.index].klass);
                if(c->Get(key,shadow) || sq_type(c->_metamethods[MT_GET])!=OT_NULL ||
                    _table(shared->_instance_default_delegate)->Get(key,shadow)) return false;
                Value klass; if(!RootClass(key,klass)) return false; p.klass=klass.index;
                RootFallback fallback; fallback.klass=objects[source.index].klass; fallback.key=key;
                bool found=false;
                for(const RootFallback &old:root_fallbacks)
                    found|=old.klass==fallback.klass && _rawval(old.key)==_rawval(key);
                if(!found) root_fallbacks.push_back(fallback);
            }
        }
        else return false;
        prepared.push_back(p);
        f.values[i._arg0]=Value(CALL,prepared.size()-1);
        f.values[i._arg3]=source;
        return true;
    }
    bool Invoke(Frame &f,SQInteger dst,SQClosure *closure,std::vector<Value> args) {
        Value result;
        if(!Inline(closure,args,result,false)) return false;
        ++owner.calls_inlined;
        return Copy(f,dst,result);
    }
    bool Call(Frame &f,const SQInstruction &i) {
        Value callable=f.values[i._arg1];
        if(callable.kind!=CALL && callable.kind!=CLASS) return false;
        Prepared p={NULL,Value(ROOT),-1,false};
        if(callable.kind==CALL) p=prepared[callable.index]; else p.klass=callable.index;
        if(p.conversion) {
            if(i._arg3!=1 || i._arg0==255) return false;
            SQInteger dst=Register(f,i._arg0);
            if(!Emit(_OP_CALL,dst,Register(f,i._arg1),Register(f,i._arg2),1)) return false;
            f.values[i._arg0]=Value(SCALAR,dst); return true;
        }
        std::vector<Value> args;
        for(SQInteger n=0;n<i._arg3;++n) args.push_back(f.values[i._arg2+n]);
        if(args.empty()) return false;
        if(p.klass>=0) {
            Value instance;
            if(!NewInstance(p.klass,instance)) return false;
            args[0]=instance;
            SQClosure *ctor=_closure(_weakref(classes[p.klass].constructor)->_obj);
            Value ignored;
            if(!Inline(ctor,args,ignored,false)) return false;
            ++owner.calls_inlined;
            return Copy(f,i._arg0,instance);
        }
        args[0]=p.self;
        return p.closure && Invoke(f,i._arg0,p.closure,args);
    }
    bool Correspond(const Value &dst,const Value &src,std::map<SQInteger,SQInteger> &mapping,
        std::map<SQInteger,SQInteger> &reverse,std::map<SQInteger,SQInteger> &copies) {
        if(dst.kind!=src.kind) return false;
        if(dst.kind==SCALAR) { copies[dst.index]=src.index; return true; }
        if(dst.kind==LITERAL) return sq_type(dst.literal)==sq_type(src.literal) &&
            _rawval(dst.literal)==_rawval(src.literal);
        if(dst.kind!=INSTANCE && dst.kind!=ARRAY) return dst.index==src.index;
        auto old=mapping.find(dst.index),other=reverse.find(src.index);
        if(old!=mapping.end()) return old->second==src.index;
        if(other!=reverse.end()) return other->second==dst.index;
        mapping[dst.index]=src.index; reverse[src.index]=dst.index;
        const Object &a=objects[dst.index],&b=objects[src.index];
        if(a.klass!=b.klass || a.fields.size()!=b.fields.size()) return false;
        for(size_t n=0;n<a.fields.size();++n) if(!Correspond(a.fields[n],b.fields[n],mapping,reverse,copies)) return false;
        return true;
    }
    bool LoopCopies(Frame &f,const std::vector<Value> &header,const SQSlotSet &live) {
        std::map<SQInteger,SQInteger> mapping,reverse,copies;
        for(SQInteger n=0;n<f.proto->_stacksize;++n) if(live.test(n))
            if(!Correspond(header[n],f.values[n],mapping,reverse,copies)) return Fail("object aliases change across loop");
        // Parallel copies handle swaps without changing the incoming values.
        std::vector<std::pair<SQInteger,SQInteger>> pending;
        for(const auto &c:copies) if(c.first!=c.second) {
            SQInteger temp=Allocate(); if(temp<0 || !Emit(_OP_MOVE,temp,c.second)) return false;
            pending.push_back(std::make_pair(c.first,temp));
        }
        for(const auto &c:pending) { if(!Emit(_OP_MOVE,c.first,c.second)) return false; used.reset(c.second); }
        f.values=header;
        return true;
    }
    bool Inline(SQClosure *closure,const std::vector<Value> &arguments,Value &out,bool isroot) {
        if(!closure || closure->_env || !closure->_root ||
            _rawval(closure->_root->_obj)!=_rawval(_weakref(root)->_obj)) return Fail("bound or foreign-root method");
        SQFunctionProto *p=closure->_function;
        if(p->_bgenerator || p->_varparams || p->_noutervalues || p->_stacksize<=0 ||
            arguments.size()>(size_t)p->_nparameters || arguments.size()<(size_t)(p->_nparameters-p->_ndefaultparams) ||
            ++depth>12) return Fail("unsupported object method shape or recursion");
        SQBytecodeAnalysis analysis;
        if(!analysis.Build(p->_instructions,p->_ninstructions,p->_stacksize)) return false;
        SQInteger header=-1,backedge=-1;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            if(analysis.facts[ip].writes.test(0)) return Fail("method replaces receiver");
            SQInteger target=analysis.facts[ip].target;
            if(target>=0 && target<=ip) {
                if(!isroot || header>=0 || p->_instructions[ip].op!=_OP_JMP) return false;
                header=target; backedge=ip;
            }
        }
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) if(analysis.facts[ip].target>=0 && ip!=backedge) {
            if(ip!=header || p->_instructions[ip].op!=_OP_JCMP || analysis.facts[ip].target!=backedge+1)
                return Fail("object inlining supports straight-line methods and one counted loop");
        }
        Frame f; f.proto=p; f.root=isroot; f.values.resize(p->_stacksize); f.registers.resize(p->_stacksize,-1);
        if(isroot) for(SQInteger n=0;n<p->_nparameters;++n) f.registers[n]=n;
        for(SQInteger n=0;n<p->_nparameters;++n) {
            if(n<(SQInteger)arguments.size()) { if(!Copy(f,n,arguments[n])) return false; }
            else if(!Load(f,n,closure->_defaultparams[n-(p->_nparameters-p->_ndefaultparams)])) return false;
        }
        std::vector<Value> header_values;
        SQInteger header_offset=-1,exit_jump=-1;
        bool returned=false;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
            if(++visits>4096) return Fail("object inlining work limit");
            const SQInstruction &i=p->_instructions[ip];
            if(ip==header) {
                loop_entry_objects=objects.size();
                for(SQInteger n=0;n<p->_stacksize;++n) if(analysis.loop_written[ip].test(n)) f.values[n].constant=false;
                for(Object &o:objects) for(Value &v:o.fields) v.constant=false;
                header_values=f.values; header_offset=code.size();
            }
            if(ip==backedge+1 && exit_jump>=0) {
                code[exit_jump]._arg1=code.size()-exit_jump-1;
                loop_entry_objects=-1;
            }
            switch(i.op) {
            case _OP_LINE: break;
            case _OP_LOAD: if(!Load(f,i._arg0,p->_literals[i._arg1])) return false; break;
            case _OP_DLOAD:
                if(!Load(f,i._arg0,p->_literals[i._arg1]) || !Load(f,i._arg2,p->_literals[i._arg3])) return false;
                break;
            case _OP_LOADINT: if(!Load(f,i._arg0,SQObjectPtr((SQInteger)i._arg1))) return false; break;
            case _OP_LOADBOOL: { SQObjectPtr v; v._type=OT_BOOL; v._unVal.nInteger=i._arg1!=0; if(!Load(f,i._arg0,v)) return false; break; }
            case _OP_LOADNULLS:
                for(SQInteger n=0;n<i._arg1;++n) if(!Load(f,i._arg0+n,SQObjectPtr())) return false;
                break;
            case _OP_MOVE: if(!Copy(f,i._arg0,f.values[i._arg1])) return false; break;
            case _OP_DMOVE:
                if(!Copy(f,i._arg0,f.values[i._arg1]) || !Copy(f,i._arg2,f.values[i._arg3])) return false;
                break;
            case _OP_LOADROOT: f.values[i._arg0]=Value(ROOT); break;
            case _OP_PREPCALLK: if(!Prepare(f,i)) return Fail("unsupported inlined receiver or callee"); break;
            case _OP_CALL: case _OP_TAILCALL: if(!Call(f,i)) return false; break;
            case _OP_GETK: { Value key(LITERAL); key.literal=p->_literals[i._arg1]; if(!Get(f,i._arg0,f.values[i._arg2],key)) return false; break; }
            case _OP_GET: if(!Get(f,i._arg0,f.values[i._arg1],f.values[i._arg2])) return false; break;
            case _OP_SET: if(!Set(f,i._arg0,f.values[i._arg1],f.values[i._arg2],f.values[i._arg3])) return false; break;
            case _OP_NEWOBJ: {
                if(i._arg3!=NOT_ARRAY || i._arg1<0 || i._arg1>8 || objects.size()>=64) return false;
                Object o; o.kind=ARRAY; o.klass=-1; objects.push_back(o);
                f.values[i._arg0]=Value(ARRAY,objects.size()-1); ++owner.allocations_removed; break;
            }
            case _OP_APPENDARRAY: {
                Value a=f.values[i._arg0]; if(a.kind!=ARRAY || objects[a.index].fields.size()>=8) return false;
                Value v;
                if(i._arg2==AAT_STACK) v=f.values[i._arg1];
                else return Fail("non-parameter array initializer in object method");
                Value field; if(!StoreScalar(field,v)) return false;
                objects[a.index].fields.push_back(field); break;
            }
            case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD: {
                Value left=f.values[i._arg2],right=f.values[i._arg1];
                if(left.kind==INSTANCE) {
                    SQInteger mm=i.op==_OP_ADD?MT_ADD:i.op==_OP_SUB?MT_SUB:i.op==_OP_MUL?MT_MUL:i.op==_OP_DIV?MT_DIV:MT_MODULO;
                    SQClosure *method=MethodClosure(objects[left.index].klass,SQObjectPtr(),mm);
                    if(!method || !Invoke(f,i._arg0,method,{left,right})) return false;
                }
                else {
                    SQInteger reg=Register(f,i._arg0);
                    if(left.kind!=SCALAR || right.kind!=SCALAR || reg<0 || !Emit((SQOpcode)i.op,reg,right.index,left.index)) return false;
                    f.values[i._arg0]=Value(SCALAR,reg);
                }
                break;
            }
            case _OP_NEG: {
                Value src=f.values[i._arg1]; SQInteger dst=Register(f,i._arg0);
                if(src.kind!=SCALAR || dst<0 || !Emit(_OP_NEG,dst,src.index)) return false;
                f.values[i._arg0]=Value(SCALAR,dst); break;
            }
            case _OP_INCL: {
                // INCL has no result operand; only arg1 is read and written.
                Value src=f.values[i._arg1];
                if(src.kind!=SCALAR || !Emit(_OP_INCL,src.index,src.index,0,i._arg3)) return false;
                f.values[i._arg1].constant=false; break;
            }
            case _OP_PINCL: {
                Value src=f.values[i._arg1]; SQInteger dst=Register(f,i._arg0);
                if(src.kind!=SCALAR || dst<0 || !Emit((SQOpcode)i.op,dst,src.index,0,i._arg3)) return false;
                f.values[i._arg0]=Value(SCALAR,dst); f.values[i._arg1].constant=false; break;
            }
            case _OP_JCMP: {
                Value left=f.values[i._arg2],right=f.values[i._arg0];
                if(left.kind!=SCALAR || right.kind!=SCALAR || ip!=header) return false;
                exit_jump=code.size(); if(!Emit(_OP_JCMP,right.index,0,left.index,i._arg3)) return false; break;
            }
            case _OP_JMP:
                if(ip!=backedge || !LoopCopies(f,header_values,analysis.live_in[header]) ||
                    !Emit(_OP_JMP,0,header_offset-(SQInteger)code.size()-1)) return false;
                break;
            case _OP_RETURN:
                out=i._arg0==255?Value(LITERAL):f.values[i._arg1];
                returned=true; ip=p->_ninstructions; break;
            default: return Fail("unsupported instruction in object kernel");
            }
        }
        if(!returned) return false;
        for(SQInteger r:f.registers) if(r>=parameters) used.reset(r);
        --depth; return true;
    }
};

SQJitObjectPlan::SQJitObjectPlan():retryable(false),reason("object kernel not eligible"),
    allocations_removed(0),calls_inlined(0),impl(new Impl(*this)) {}
SQJitObjectPlan::~SQJitObjectPlan() {}
bool SQJitObjectPlan::Build(SQFunctionProto *proto,SQObjectPtr *entry,SQClosure *closure)
{
    if(!proto || !entry || !closure || closure->_env || proto->_noutervalues ||
        sq_type(entry[0])!=OT_TABLE || !closure->_root || sq_type(closure->_root->_obj)!=OT_TABLE ||
        _table(entry[0])!=_table(closure->_root->_obj)) return false;
    bool has_calls=false;
    for(SQInteger n=0;n<proto->_ninstructions;++n) has_calls|=proto->_instructions[n].op==_OP_CALL;
    if(!has_calls) return false;
    impl->shared=proto->_sharedstate; impl->root=SQObjectPtr(closure->_root);
    impl->parameters=impl->slots=proto->_nparameters;
    std::vector<Impl::Value> args; args.push_back(Impl::Value(Impl::ROOT));
    for(SQInteger n=1;n<proto->_nparameters;++n) {
        if(!sq_isnumeric(entry[n])) return false;
        args.push_back(Impl::Value(Impl::SCALAR,n));
    }
    Impl::Value result;
    if(!impl->Inline(closure,args,result,true) || !allocations_removed || !calls_inlined ||
        result.kind!=Impl::SCALAR || !impl->Emit(_OP_RETURN,1,result.index)) return false;
    SQFunctionProto *p=SQFunctionProto::Create(proto->_sharedstate,impl->code.size(),impl->literals.size(),
        proto->_nparameters,0,0,0,0,0);
    if(!p) return false;
    impl->lowered=SQObjectPtr(p); p->_stacksize=impl->slots;
    p->_bgenerator=false; p->_varparams=0; p->_name=proto->_name; p->_sourcename=proto->_sourcename;
    std::copy(impl->code.begin(),impl->code.end(),p->_instructions);
    for(size_t n=0;n<impl->literals.size();++n) p->_literals[n]=impl->literals[n];
    return true;
}
SQFunctionProto *SQJitObjectPlan::Lowered() const
{ return sq_type(impl->lowered)==OT_FUNCPROTO?_funcproto(impl->lowered):NULL; }
bool SQJitObjectPlan::Guard(SQObjectPtr *entry,SQClosure *closure) const
{
    const SQObject &root=_weakref(impl->root)->_obj;
    if(sq_type(root)!=OT_TABLE || sq_type(entry[0])!=OT_TABLE || _table(entry[0])!=_table(root) ||
        !closure->_root || _rawval(closure->_root->_obj)!=_rawval(root)) return false;
    for(const Impl::Binding &b:impl->bindings) {
        SQObjectPtr value;
        if(!_table(root)->GetRaw(b.key,value) || sq_type(value)!=OT_CLASS ||
            _rawval(value)!=_rawval(_weakref(b.weak)->_obj)) return false;
    }
    for(const Impl::Class &c:impl->classes) {
        const SQObject &object=_weakref(c.weak)->_obj;
        if(sq_type(object)!=OT_CLASS) return false;
        SQClass *klass=_class(object); SQObjectPtr constructor;
        if(!klass->_locked || klass->_base || klass->_udsize || klass->_hook || klass->_typetag ||
            !klass->GetConstructor(constructor) || sq_type(constructor)!=OT_CLOSURE ||
            _rawval(constructor)!=_rawval(_weakref(c.constructor)->_obj) ||
            klass->_defaultvalues.size()!=c.defaults.size()) return false;
        SQClosure *ctor=_closure(constructor);
        if(ctor->_env || !ctor->_root || sq_type(ctor->_root->_obj)!=OT_TABLE ||
            _rawval(ctor->_root->_obj)!=_rawval(root)) return false;
        for(size_t n=0;n<c.defaults.size();++n) {
            const SQObjectPtr &value=klass->_defaultvalues[n].val;
            if(sq_type(value)!=sq_type(c.defaults[n]) || _rawval(value)!=_rawval(c.defaults[n])) return false;
        }
    }
    for(const Impl::Method &m:impl->methods) {
        SQClass *c=impl->Klass(m.klass); SQObjectPtr value;
        if(m.metamethod>=0) value=c->_metamethods[m.metamethod];
        else if(!c->Get(m.key,value)) return false;
        if(sq_type(value)!=OT_CLOSURE || _rawval(value)!=_rawval(_weakref(m.weak)->_obj)) return false;
        SQClosure *method=_closure(value);
        if(method->_env || !method->_root || sq_type(method->_root->_obj)!=OT_TABLE ||
            _rawval(method->_root->_obj)!=_rawval(root)) return false;
    }
    for(const Impl::RootFallback &f:impl->root_fallbacks) {
        SQClass *c=impl->Klass(f.klass); SQObjectPtr shadow;
        if(c->Get(f.key,shadow) || sq_type(c->_metamethods[MT_GET])!=OT_NULL ||
            _table(impl->shared->_instance_default_delegate)->Get(f.key,shadow)) return false;
    }
    return true;
}
void SQJitObjectPlan::Mark(SQCollectable **chain)
{
#ifndef NO_GARBAGE_COLLECTOR
    SQSharedState::MarkObject(impl->lowered,chain);
#else
    (void)chain;
#endif
}
SQInteger sqjit_object_plan_entry(SQObjectPtr *stack,SQObjectPtr *out,SQClosure *closure)
{
    SQJitNative *native=closure->_function->_jit->_entry;
    SQJitObjectPlan *plan=native->_object_plan;
    if(!plan || !plan->Guard(stack,closure)) return SQ_JIT_NATIVE_GUARD_FAILED;
    return ((SQJitNativeObjectFn)plan->body._code.Entry())(stack,out,closure);
}
