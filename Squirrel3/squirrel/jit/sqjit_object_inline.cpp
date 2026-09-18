#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqclass.h"
#include "sqstring.h"
#include "sqbytecode.h"
#include "sqjit_leaf.h"
#include "sqjit_numeric_ops.h"
#include "sqjit_object_inline.h"
#include <algorithm>
#include <map>
#include <set>
#include <cstdint>

namespace {
bool same(const SQObject &a,const SQObject &b){return sq_type(a)==sq_type(b) && _rawval(a)==_rawval(b);}
bool callable(const SQObject &v){return sq_type(v)==OT_CLOSURE || sq_type(v)==OT_NATIVECLOSURE;}
bool snapshot(SQClass *c,const SQObjectPtr &key,SQJitClassBinding &b){
    if(!c->_locked || c->_base || c->_udsize || c->_defaultvalues.size()==0 || c->_defaultvalues.size()>8)return false;
    b.key=key;b.target=SQObjectPtr(c->GetWeakRef(OT_CLASS));b.constructor=c->_constructoridx;
    b.fields.resize(c->_defaultvalues.size());
    for(SQUnsignedInteger n=0;n<c->_defaultvalues.size();++n){
        const auto &v=c->_defaultvalues[n].val;auto t=sq_type(v);
        if(t!=OT_NULL && t!=OT_INTEGER && t!=OT_FLOAT && t!=OT_BOOL && t!=OT_STRING)return false;
        b.defaults.push_back(v);
    }
    SQObjectPtr iter,member,index;SQInteger next;
    while((next=c->_members->Next(false,iter,member,index))!=-1){
        iter=next;if(!_isfield(index))continue;
        if(sq_type(member)!=OT_STRING || _member_idx(index)>=(SQInteger)b.fields.size())return false;
        b.fields[_member_idx(index)]=member;
    }
    for(auto &field:b.fields)if(sq_type(field)!=OT_STRING)return false;
    for(SQUnsignedInteger n=0;n<c->_methods.size();++n){
        const auto &v=c->_methods[n].val;if(!callable(v))return false;
        b.methods.push_back(SQObjectPtr(_refcounted(v)->GetWeakRef(sq_type(v))));
    }
    for(SQInteger n=0;n<MT_LAST;++n){
        const auto &v=c->_metamethods[n];if(sq_type(v)!=OT_NULL && !callable(v))return false;
        b.metamethods.push_back(sq_type(v)==OT_NULL?SQObjectPtr():SQObjectPtr(_refcounted(v)->GetWeakRef(sq_type(v))));
    }
    return true;
}
SQInteger key_literal(SQFunctionProto *p,const SQBytecodeAnalysis &a,SQInteger ip,SQInteger reg){
    for(SQInteger at=ip-1;at>=0;--at){
        if(a.leaders[at+1])return -1;if(!a.facts[at].writes.test(reg))continue;
        const auto &i=p->_instructions[at];
        if(i.op==_OP_LOAD)return i._arg1;
        if(i.op==_OP_DLOAD)return i._arg2==reg?i._arg3:i._arg1;
        if(i.op==_OP_MOVE){reg=i._arg1;continue;}
        if(i.op==_OP_DMOVE){reg=i._arg2==reg && i._arg3!=i._arg0?i._arg3:i._arg1;continue;}
        return -1;
    }
    return -1;
}
using Refs=uint64_t;
struct Object {SQInteger klass;bool array;std::map<SQString *,Refs> fields;Refs values=0;Object(SQInteger k,bool a):klass(k),array(a){}};
// This analysis only finds candidate methods. The graph pass independently
// proves each inserted class guard at its exact program point before erasing it.
bool infer(SQFunctionProto *p,const SQBytecodeAnalysis &a,std::vector<std::vector<Refs>> &states,std::vector<Object> &objects){
    std::vector<SQInteger> created(p->_ninstructions,-1);
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){const auto &i=p->_instructions[ip];if(i.op==_OP_NEWOBJ || i.op==SQJIT_OP_INSTANCE){
        if(objects.size()==64)return false;created[ip]=objects.size();objects.emplace_back(i.op==SQJIT_OP_INSTANCE?i._arg1:-1,i.op==_OP_NEWOBJ && i._arg3==NOT_ARRAY);
    }}
    states.resize(p->_ninstructions);states[0].assign(p->_stacksize,0);
    bool changed=true;unsigned visits=0;
    while(changed){
        if(++visits>128)return false;changed=false;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip){
            if(states[ip].empty())continue;const auto &i=p->_instructions[ip];const auto in=states[ip];auto out=in;
            for(SQInteger r=0;r<p->_stacksize;++r)if(a.facts[ip].writes.test(r))out[r]=0;
            if(created[ip]>=0)out[i._arg0]=Refs(1)<<created[ip];
            else if(i.op==_OP_MOVE || i.op==_OP_DMOVE){out[i._arg0]=in[i._arg1];if(i.op==_OP_DMOVE)out[i._arg2]=i._arg3==i._arg0?out[i._arg0]:in[i._arg3];}
            else if(i.op==_OP_GET || i.op==_OP_GETK || i.op==_OP_SET || i.op==_OP_NEWSLOT || i.op==_OP_APPENDARRAY){
                SQInteger owner=i.op==_OP_GETK?i._arg2:i.op==_OP_APPENDARRAY?i._arg0:i._arg1;
                SQInteger lit=i.op==_OP_GETK?i._arg1:i.op==_OP_APPENDARRAY?-1:key_literal(p,a,ip,i._arg2);
                SQString *key=lit>=0 && lit<p->_nliterals && sq_type(p->_literals[lit])==OT_STRING?_string(p->_literals[lit]):nullptr;
                Refs value=0;
                for(size_t n=0;n<objects.size();++n)if(in[owner]&(Refs(1)<<n)){
                    auto &o=objects[n];
                    if(i.op==_OP_GET || i.op==_OP_GETK){if(o.array)value|=o.values;else if(key)value|=o.fields[key];else for(const auto &f:o.fields)value|=f.second;}
                    else {
                        Refs incoming=i.op==_OP_APPENDARRAY?(i._arg2==AAT_STACK?in[i._arg1]:0):in[i._arg3];
                        auto add=[&](Refs &field){Refs next=field|incoming;if(next!=field){field=next;changed=true;}};
                        if(o.array)add(o.values);else if(key)add(o.fields[key]);else for(auto &f:o.fields)add(f.second);
                    }
                }
                if(i.op==_OP_GET || i.op==_OP_GETK)out[i._arg0]=value;
                else if(i.op==_OP_SET && i._arg0!=255)out[i._arg0]=in[i._arg3];
            }
            auto merge=[&](SQInteger target){if(target<0 || target>=p->_ninstructions)return;if(states[target].empty()){states[target]=out;changed=true;return;}for(SQInteger r=0;r<p->_stacksize;++r){auto value=states[target][r]|out[r];if(value!=states[target][r]){states[target][r]=value;changed=true;}}};
            if(a.facts[ip].fallthrough)merge(ip+1);if(a.facts[ip].target>=0)merge(a.facts[ip].target);
        }
    }
    return true;
}
bool body_supported(SQFunctionProto *p){
    if(!p || p->_bgenerator || p->_varparams || p->_noutervalues || p->_ninstructions<=0 || p->_ninstructions>96)return false;
    SQBytecodeAnalysis a;if(!a.Build(p->_instructions,p->_ninstructions,p->_stacksize))return false;
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){const auto &i=p->_instructions[ip];
        if(a.facts[ip].target>=p->_ninstructions)return false;
        switch(i.op){
        case _OP_LINE:case _OP_LOAD:case _OP_DLOAD:case _OP_LOADINT:case _OP_LOADBOOL:case _OP_LOADNULLS:
        case _OP_MOVE:case _OP_DMOVE:case _OP_GET:case _OP_GETK:case _OP_SET:case _OP_APPENDARRAY:
        case _OP_ADD:case _OP_SUB:case _OP_MUL:case _OP_DIV:case _OP_MOD:case _OP_NEG:
        case _OP_EQ:case _OP_NE:case _OP_CMP:case _OP_JCMP:case _OP_JZ:case _OP_JMP:
        case _OP_RETURN:case _OP_INCL:case _OP_PINCL:case _OP_CALL:case _OP_TAILCALL:case _OP_PREPCALLK:break;
        case _OP_NEWOBJ:if(i._arg3!=NOT_ARRAY)return false;break;
        default:return false;
        }
        if((i.op==_OP_LOAD || i.op==_OP_DLOAD || i.op==_OP_GETK || i.op==_OP_PREPCALLK || ((i.op==_OP_EQ || i.op==_OP_NE)&&i._arg3) || (i.op==_OP_APPENDARRAY && i._arg2==AAT_LITERAL)) && (i._arg1<0 || i._arg1>=p->_nliterals))return false;
        if(i.op==_OP_DLOAD && i._arg3>=p->_nliterals)return false;
    }
    return true;
}
}

bool sqjit_class_bindings_match(const std::vector<SQJitClassBinding> &bindings,SQObjectPtr *entry,SQClosure *closure){
    if(!closure || closure->_env || sq_type(entry[0])!=OT_TABLE)return false;
    for(const auto &b:bindings){
        const auto &expected=_weakref(b.target)->_obj;SQObjectPtr value;
        if(sq_type(expected)!=OT_CLASS || !_table(entry[0])->GetRaw(b.key,value) || !same(value,expected))return false;
        auto c=_class(value);
        if(!c->_locked || c->_base || c->_udsize || c->_constructoridx!=b.constructor ||
           c->_defaultvalues.size()!=b.defaults.size() || c->_methods.size()!=b.methods.size())return false;
        for(size_t n=0;n<b.defaults.size();++n){
            if(!same(c->_defaultvalues[n].val,b.defaults[n]))return false;
            auto idx=c->_members->GetRawSlot(b.fields[n]);if(!idx || !_isfield(*idx) || _member_idx(*idx)!=(SQInteger)n)return false;
        }
        for(size_t n=0;n<b.root_keys.size();++n){
            const auto &method=_weakref(b.root_methods[n])->_obj;SQObjectPtr shadow;
            if(sq_type(c->_metamethods[MT_GET])!=OT_NULL ||
               _table(closure->_function->_sharedstate->_instance_default_delegate)->Get(b.root_keys[n],shadow) || c->_members->GetRawSlot(b.root_keys[n]) || sq_type(method)!=OT_CLOSURE || !_closure(method)->_root ||
               !same(_closure(method)->_root->_obj,entry[0]))return false;
        }
        for(size_t n=0;n<b.methods.size();++n)if(!same(c->_methods[n].val,_weakref(b.methods[n])->_obj))return false;
        for(SQInteger n=0;n<MT_LAST;++n){const SQObject &v=sq_type(b.metamethods[n])==OT_NULL?static_cast<const SQObject &>(b.metamethods[n]):_weakref(b.metamethods[n])->_obj;if(!same(c->_metamethods[n],v))return false;}
    }
    return true;
}

bool SQJitObjectInlinePlan::Build(SQFunctionProto *original,SQObjectPtr *entry,SQClosure *closure,const std::vector<SQInteger> &incoming){
    lowered.Null();bindings.clear();temporary_writes=incoming;retry=false;
    if(!original || !entry || !closure || closure->_env || sq_type(entry[0])!=OT_TABLE || original->_bgenerator ||
       original->_varparams || original->_noutervalues || original->_ndefaultparams || original->_ninstructions<=0 || original->_ninstructions>2048)return false;
    SQFunctionProto *p=original;bool expanded=false;
    for(unsigned round=0;round<128;++round){
        SQBytecodeAnalysis analysis;if(!analysis.Build(p->_instructions,p->_ninstructions,p->_stacksize))return false;
        std::vector<std::vector<Refs>> states;std::vector<Object> objects;
        if(!infer(p,analysis,states,objects))return false;
        SQInteger call=-1,prepare=-1,klass=-1;SQClosure *callee=nullptr;bool construct=false,metacall=false;
        for(SQInteger ip=0;ip<p->_ninstructions;++ip){const auto &i=p->_instructions[ip];
            if(states[ip].empty())continue;
            if(i.op==_OP_ADD || i.op==_OP_SUB || i.op==_OP_MUL){
                SQInteger candidate=-1;
                for(size_t n=0;n<objects.size();++n)if((states[ip][i._arg2]&(Refs(1)<<n)) && objects[n].klass>=0){
                    if(candidate>=0 && candidate!=objects[n].klass){candidate=-2;break;}candidate=objects[n].klass;
                }
                if(candidate>=0 && candidate<(SQInteger)bindings.size()){
                    const auto &cl=_weakref(bindings[candidate].target)->_obj;
                    if(sq_type(cl)!=OT_CLASS)return false;
                    const auto &method=_class(cl)->_metamethods[i.op==_OP_ADD?MT_ADD:i.op==_OP_SUB?MT_SUB:MT_MUL];
                    if(sq_type(method)==OT_CLOSURE && !_closure(method)->_env && _closure(method)->_function->_nparameters==2 && body_supported(_closure(method)->_function)){
                        call=ip;klass=candidate;callee=_closure(method);metacall=true;break;
                    }
                }
                continue;
            }
            if(i.op!=_OP_CALL || i._arg3<1)continue;
            SQInteger at=ip-1;while(at>=0){if(analysis.leaders[at+1])break;if(analysis.facts[at].writes.test(i._arg1))break;if(analysis.facts[at].writes.test(i._arg2)){at=-1;break;}--at;}
            if(at<0)continue;const auto &prep=p->_instructions[at];
            if(prep.op!=_OP_PREPCALLK || prep._arg0!=i._arg1 || prep._arg3!=i._arg2 || prep._arg0==prep._arg3 || prep._arg1<0 || prep._arg1>=p->_nliterals)continue;
            bool safe=true;for(SQInteger j=at+1;j<=ip;++j)if(analysis.leaders[j])safe=false;
            for(SQInteger j=at+1;j<ip;++j)if(analysis.facts[j].reads.test(prep._arg0) || analysis.facts[j].reads.test(prep._arg3))safe=false;
            if(ip+1<p->_ninstructions)for(SQInteger r:{(SQInteger)prep._arg0,(SQInteger)prep._arg3})if(r!=i._arg0 && analysis.live_in[ip+1].test(r))safe=false;
            if(!safe)continue;
            const auto &key=p->_literals[prep._arg1];if(sq_type(key)!=OT_STRING)continue;
            SQObjectPtr target;
            SQInteger candidate=-1;bool ctor=false;
            if(prep._arg2==0 && _table(entry[0])->GetRaw(key,target) && sq_type(target)==OT_CLASS){
                auto c=_class(target);if(!c->_locked){retry=true;return false;}
                for(size_t n=0;n<bindings.size();++n)if(same(_weakref(bindings[n].target)->_obj,target) && same(bindings[n].key,key))candidate=n;
                if(candidate<0){SQJitClassBinding b;if(bindings.size()==8 || !snapshot(c,key,b))return false;candidate=bindings.size();bindings.push_back(b);}
                if(!c->GetConstructor(target))return false;ctor=true;
            }else{
                Refs refs=states[at][prep._arg2];
                for(size_t n=0;n<objects.size();++n)if((refs&(Refs(1)<<n)) && objects[n].klass>=0){
                    if(candidate>=0 && candidate!=objects[n].klass){candidate=-2;break;}candidate=objects[n].klass;
                }
                if(candidate<0 || candidate>=(SQInteger)bindings.size())continue;
                const auto &cl=_weakref(bindings[candidate].target)->_obj;if(sq_type(cl)!=OT_CLASS)return false;
                auto c=_class(cl);auto idx=c->_members->GetRawSlot(key);
                if(!idx || !_ismethod(*idx))continue;target=c->_methods[_member_idx(*idx)].val;
            }
            if(sq_type(target)!=OT_CLOSURE || _closure(target)->_env || _closure(target)->_function->_nparameters!=i._arg3 || !body_supported(_closure(target)->_function))continue;
            call=ip;prepare=at;klass=candidate;callee=_closure(target);construct=ctor;break;
        }
        if(call<0)return expanded;
        const auto &i=p->_instructions[call];const auto &prep=p->_instructions[prepare>=0?prepare:call];auto body=callee->_function;
        // Reuse caller registers only when they are dead at this call. Input
        // operands remain reserved until all parameters have been copied.
        SQSlotSet busy=analysis.live_in[call]|analysis.facts[call].reads|analysis.facts[call].writes;
        SQInteger base=p->_nparameters,extent=body->_stacksize+2;
        for(;;++base){
            if(base+extent>SQJitLeafPlan::MAX_SCALAR_SLOTS)return false;
            bool available=true;for(SQInteger n=0;n<extent;++n)if(busy.test(base+n)){available=false;break;}
            if(available)break;
        }
        SQInteger slots=std::max<SQInteger>(p->_stacksize,base+extent),keyreg=base+body->_stacksize,valuereg=keyreg+1;
        // A method's implicit root lookup is only rewritten when its class
        // cannot shadow the name and its closure uses this exact root table.
        for(SQInteger at=0;at<body->_ninstructions;++at){const auto &op=body->_instructions[at];
            if(op.op!=_OP_PREPCALLK)continue;
            if(op._arg2!=0 || !callee->_root || !same(callee->_root->_obj,entry[0]))return false;
            const auto &key=body->_literals[op._arg1];const auto &cl=_weakref(bindings[klass].target)->_obj;
            SQObjectPtr target;
            if(sq_type(_class(cl)->_metamethods[MT_GET])!=OT_NULL ||
               _table(p->_sharedstate->_instance_default_delegate)->Get(key,target) ||
               _class(cl)->_members->GetRawSlot(key) || !_table(entry[0])->GetRaw(key,target) || sq_type(target)!=OT_CLASS)return false;
            bindings[klass].root_keys.push_back(key);
            bindings[klass].root_methods.push_back(SQObjectPtr(callee->GetWeakRef(OT_CLOSURE)));
        }
        std::vector<SQObjectPtr> literals(p->_literals,p->_literals+p->_nliterals);
        auto lit=[&](const SQObjectPtr &v){for(size_t n=0;n<literals.size();++n)if(same(v,literals[n]))return (SQInteger)n;literals.push_back(v);return (SQInteger)literals.size()-1;};
        std::vector<SQInteger> lm(body->_nliterals);for(SQInteger n=0;n<body->_nliterals;++n)lm[n]=lit(body->_literals[n]);
        std::vector<SQInstruction> code;std::vector<SQInteger> offsets(p->_ninstructions),returns,inner_offsets(body->_ninstructions);
        struct Fixup{SQInteger at,target;};std::vector<Fixup> branches,inner_branches;
        auto emit=[&](SQOpcode op,SQInteger a0=0,SQInteger a1=0,SQInteger a2=0,SQInteger a3=0){code.push_back(SQInstruction(op,a0,a1,a2,a3));};
        for(SQInteger ip=0;ip<p->_ninstructions;++ip){offsets[ip]=code.size();
            if(ip==prepare){if(!construct)emit(_OP_MOVE,prep._arg3,prep._arg2);else emit(_OP_LINE);continue;}
            if(ip!=call){if(analysis.facts[ip].target>=0)branches.push_back({(SQInteger)code.size(),analysis.facts[ip].target});code.push_back(p->_instructions[ip]);continue;}
            if(!construct)emit(SQJIT_OP_CLASS_GUARD,i._arg2,klass);
            if(metacall){emit(_OP_MOVE,base,i._arg2);emit(_OP_MOVE,base+1,i._arg1);}
            else for(SQInteger n=construct?1:0;n<i._arg3;++n)emit(_OP_MOVE,base+n,i._arg2+n);
            if(construct){
                emit(SQJIT_OP_INSTANCE,base,klass);
                const auto &b=bindings[klass];
                for(size_t n=0;n<b.fields.size();++n){emit(_OP_LOAD,keyreg,lit(b.fields[n]));emit(_OP_LOAD,valuereg,lit(b.defaults[n]));emit(_OP_NEWSLOT,255,base,keyreg,valuereg);}
            }
            for(SQInteger at=0;at<body->_ninstructions;++at){inner_offsets[at]=code.size();auto op=body->_instructions[at];
                if(op.op==_OP_RETURN){
                    if(!construct && i._arg0!=255){if(op._arg0==255)emit(_OP_LOADNULLS,i._arg0,1);else emit(_OP_MOVE,i._arg0,base+op._arg1);}
                    returns.push_back(code.size());emit(_OP_JMP);continue;
                }
                SQInteger target;if(sq_bytecode_branch_target(op,at,target))inner_branches.push_back({(SQInteger)code.size(),target});
                switch(op.op){
                case _OP_LINE:case _OP_JMP:break;
                case _OP_PREPCALLK:op._arg0+=base;op._arg1=lm[op._arg1];op._arg3+=base;break;
                case _OP_TAILCALL:case _OP_CALL:op.op=_OP_CALL;if(op._arg0!=255)op._arg0+=base;op._arg1+=base;op._arg2+=base;break;
                case _OP_LOAD:op._arg0+=base;op._arg1=lm[op._arg1];break;
                case _OP_DLOAD:op._arg0+=base;op._arg2+=base;op._arg1=lm[op._arg1];if(lm[op._arg3]>255)return false;op._arg3=lm[op._arg3];break;
                case _OP_LOADINT:case _OP_LOADBOOL:case _OP_LOADNULLS:case _OP_NEWOBJ:op._arg0+=base;break;
                case _OP_MOVE:case _OP_NEG:op._arg0+=base;op._arg1+=base;break;
                case _OP_DMOVE:op._arg0+=base;op._arg1+=base;op._arg2+=base;op._arg3+=base;break;
                case _OP_GET:op._arg0+=base;op._arg1+=base;op._arg2+=base;break;
                case _OP_GETK:op._arg0+=base;op._arg1=lm[op._arg1];op._arg2+=base;break;
                case _OP_SET:if(op._arg0!=255)op._arg0+=base;op._arg1+=base;op._arg2+=base;op._arg3+=base;break;
                case _OP_APPENDARRAY:op._arg0+=base;if(op._arg2==AAT_STACK)op._arg1+=base;else if(op._arg2==AAT_LITERAL)op._arg1=lm[op._arg1];break;
                case _OP_EQ:case _OP_NE:op._arg0+=base;op._arg2+=base;op._arg1=op._arg3?lm[op._arg1]:op._arg1+base;break;
                case _OP_JZ:op._arg0+=base;break;
                case _OP_JCMP:op._arg0+=base;op._arg2+=base;break;
                case _OP_INCL:case _OP_PINCL:if(op._arg0!=255)op._arg0+=base;op._arg1+=base;break;
                default:op._arg0+=base;op._arg1+=base;op._arg2+=base;break;
                }
                code.push_back(op);
            }
            for(auto b:inner_branches)code[b.at]._arg1=inner_offsets[b.target]-b.at-1;
            for(auto at:returns){
                code[at]._arg1=code.size()-at-1;
                if(code[at]._arg1==0)code[at]=SQInstruction(_OP_LINE,0,0,0,0);
            }
            if(construct && i._arg0!=255)emit(_OP_MOVE,i._arg0,base);
        }
        if(code.size()>2048)return false;
        for(auto b:branches)code[b.at]._arg1=offsets[b.target]-b.at-1;
        std::vector<SQInteger> touches;for(auto ip:temporary_writes){if(ip<0 || ip>=p->_ninstructions)return false;touches.push_back(offsets[ip]);}if(prepare>=0)touches.push_back(offsets[prepare]);
        auto result=SQFunctionProto::Create(p->_sharedstate,code.size(),literals.size(),p->_nparameters,0,0,0,0,0);if(!result)return false;
        result->_stacksize=slots;result->_bgenerator=false;result->_varparams=0;result->_name=p->_name;result->_sourcename=p->_sourcename;
        std::copy(code.begin(),code.end(),result->_instructions);std::copy(literals.begin(),literals.end(),result->_literals);
        lowered=SQObjectPtr(result);p=result;temporary_writes=std::move(touches);expanded=true;
    }
    return false;
}
SQFunctionProto *SQJitObjectInlinePlan::Lowered() const {return sq_type(lowered)==OT_FUNCPROTO?_funcproto(lowered):nullptr;}
