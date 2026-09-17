#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqstring.h"
#include "sqbytecode.h"
#include "sqjit_leaf.h"
#include "sqjit_intrinsics.h"
#include "sqjit_backend.h"
#include "sqjit_numeric.h"
#include "sqjit_numeric_ops.h"
#include <algorithm>

bool SQJitNumericPlan::Build(SQFunctionProto *p,SQObjectPtr *entry,SQClosure *closure,
    const std::vector<SQInteger> &incoming) {
    lowered.Null();bindings.clear();temporary_writes.clear();
    if(!p || !entry || !closure || p->_bgenerator || p->_varparams || p->_noutervalues || p->_ndefaultparams ||
       p->_nparameters<1 || p->_nparameters>SQJitLeafPlan::MAX_PARAMETERS || p->_nparameters>p->_stacksize ||
       p->_ninstructions<=0 || p->_ninstructions>2048 ||
       p->_stacksize<=0 || p->_stacksize>=SQJitLeafPlan::MAX_SCALAR_SLOTS)return false;
    SQBytecodeAnalysis analysis;
    if(!analysis.Build(p->_instructions,p->_ninstructions,p->_stacksize))return false;
    std::vector<SQInstruction> code(p->_instructions,p->_instructions+p->_ninstructions);
    std::vector<bool> preparations(p->_ninstructions,false);
    SQInteger scratch=p->_stacksize;
    bool changed=false;
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){
        const auto &i=p->_instructions[ip];
        if(analysis.facts[ip].target>=p->_ninstructions)return false;
        if(i.op!=_OP_CALL)continue;
        SQInteger prep=ip-1;
        while(prep>=0){
            if(analysis.leaders[prep+1])break;
            if(analysis.facts[prep].writes.test(i._arg1))break;
            if(analysis.facts[prep].writes.test(i._arg2)){prep=-1;break;}
            --prep;
        }
        if(prep<0 || preparations[prep])continue;
        const auto &prepare=p->_instructions[prep];
        if(prepare.op!=_OP_PREPCALLK || prepare._arg3!=i._arg2 || prepare._arg0!=i._arg1 ||
           prepare._arg0==prepare._arg3 || prepare._arg1<0 || prepare._arg1>=p->_nliterals)continue;
        bool safe=true;
        for(SQInteger at=prep+1;at<=ip;++at)if(analysis.leaders[at])safe=false;
        for(SQInteger at=prep+1;at<ip;++at)
            if(analysis.facts[at].reads.test(prepare._arg0) || analysis.facts[at].reads.test(prepare._arg3))safe=false;
        if(ip+1<p->_ninstructions)for(SQInteger r:{(SQInteger)prepare._arg0,(SQInteger)prepare._arg3})
            if(r!=i._arg0 && analysis.live_in[ip+1].test(r))safe=false;
        if(!safe)continue;
        const auto &key=p->_literals[prepare._arg1];
        if(sq_type(key)!=OT_STRING)continue;
        SQInteger kind=-1;
        if(prepare._arg2==0 && sq_type(entry[0])==OT_TABLE && !closure->_env){
            SQObjectPtr value;
            if(_table(entry[0])->GetRaw(key,value) && sq_type(value)==OT_NATIVECLOSURE && !_nativeclosure(value)->_env){
                const auto *spec=sqjit_math_spec(_nativeclosure(value));
                if(spec && spec->nargs+1==i._arg3)kind=spec->kind;
            }
        }else if(i._arg3==1 && _string(key)->_len==7 && !memcmp(_stringval(key),_SC("tofloat"),7*sizeof(SQChar)) &&
                 sqjit_number_conversion_guard(closure,&key)==SQ_JIT_NATIVE_RETURNED)kind=0;
        if(kind<0)continue;
        SQInteger dst=i._arg0==255?scratch:(SQInteger)i._arg0;
        if(kind==0){
            code[prep]=SQInstruction(_OP_MOVE,prepare._arg3,prepare._arg2);
            code[ip]=SQInstruction(SQJIT_OP_TOFLOAT,dst,i._arg2);
        }else{
            code[prep]=SQInstruction(_OP_LINE);
            code[ip]=SQInstruction(SQJIT_OP_MATH,dst,i._arg2+1,i._arg3==3?i._arg2+2:i._arg2+1,kind);
        }
        // PREPCALLK drops the VM temporary's previous owner even though the
        // callable itself is eliminated. Reuse the scalar tier's release guard.
        temporary_writes.push_back(prep);preparations[prep]=true;changed=true;
        bool duplicate=false;for(const auto &b:bindings)if(b.kind==kind && _string(b.key)==_string(key))duplicate=true;
        if(!duplicate)bindings.push_back({key,kind});
    }
    if(!changed)return false;
    for(auto ip:incoming){if(ip<0 || ip>=p->_ninstructions)return false;temporary_writes.push_back(ip);}
    std::sort(temporary_writes.begin(),temporary_writes.end());temporary_writes.erase(std::unique(temporary_writes.begin(),temporary_writes.end()),temporary_writes.end());
    auto result=SQFunctionProto::Create(p->_sharedstate,code.size(),p->_nliterals,p->_nparameters,0,0,0,0,0);
    if(!result)return false;
    lowered=SQObjectPtr(result);result->_stacksize=scratch+1;result->_bgenerator=p->_bgenerator;result->_varparams=p->_varparams;
    result->_name=p->_name;result->_sourcename=p->_sourcename;
    std::copy(code.begin(),code.end(),result->_instructions);std::copy(p->_literals,p->_literals+p->_nliterals,result->_literals);
    return true;
}
SQFunctionProto *SQJitNumericPlan::Lowered() const {return sq_type(lowered)==OT_FUNCPROTO?_funcproto(lowered):nullptr;}
