#include "sqpcheader.h"
#include "sqfuncproto.h"
#include "sqstring.h"
#include "sqbytecode.h"
#include "sqjit_leaf.h"
#include "sqjit_numeric_ops.h"
#include "sqjit_dynamic_array.h"
#include <algorithm>

bool SQJitDynamicArrayPlan::Build(SQFunctionProto *p,const std::vector<SQInteger> &incoming){
    lowered.Null();temporary_writes.clear();
    if(!p || p->_bgenerator || p->_varparams || p->_noutervalues || p->_ndefaultparams ||
       p->_ninstructions<=0 || p->_ninstructions>512 || p->_stacksize<=0 ||
       p->_stacksize>=SQJitLeafPlan::MAX_SCALAR_SLOTS || p->_nparameters<1 ||
       p->_nparameters>SQJitLeafPlan::MAX_PARAMETERS || p->_nparameters>p->_stacksize)return false;
    SQInteger create=-1,array=-1;
    for(SQInteger ip=0;ip<p->_ninstructions;++ip)if(p->_instructions[ip].op==_OP_NEWOBJ){
        const auto &i=p->_instructions[ip];
        if(create>=0 || i._arg3!=NOT_ARRAY || i._arg1!=0 || i._arg0<p->_nparameters)return false;
        create=ip;array=i._arg0;
    }
    if(create<0)return false;
    SQBytecodeAnalysis analysis;
    if(!analysis.Build(p->_instructions,p->_ninstructions,p->_stacksize))return false;
    std::vector<SQInstruction> code(p->_instructions,p->_instructions+p->_ninstructions);
    std::vector<bool> prepared(p->_ninstructions,false);
    bool append=false;
    for(SQInteger ip=0;ip<p->_ninstructions;++ip){
        const auto &i=p->_instructions[ip];const auto &f=analysis.facts[ip];
        if(f.target>=p->_ninstructions || (f.target>=0 && (ip<create || f.target<=create)))return false;
        if(ip<=create)continue;
        if(f.writes.test(array))return false;
        if(f.reads.test(array)){
            if(i.op==_OP_GET && i._arg1==array && i._arg2!=array){
                code[ip]=SQInstruction(SQJIT_OP_VECTOR_GET,i._arg0,i._arg2);temporary_writes.push_back(ip);
            }else if(i.op==_OP_GETK && i._arg2==array){
                if(i._arg1<0 || i._arg1>=p->_nliterals || sq_type(p->_literals[i._arg1])!=OT_INTEGER)return false;
                code[ip]=SQInstruction(SQJIT_OP_VECTOR_GET,i._arg0,i._arg1,0,1);temporary_writes.push_back(ip);
            }else if(i.op!=_OP_PREPCALLK || i._arg2!=array)return false;
        }
        if(i.op==_OP_JCMP)temporary_writes.push_back(ip);
        if(i.op!=_OP_CALL)continue;
        SQInteger prep=ip-1;
        while(prep>=create){
            if(analysis.leaders[prep+1])break;
            if(analysis.facts[prep].writes.test(i._arg1))break;
            if(analysis.facts[prep].writes.test(i._arg2)){prep=-1;break;}
            --prep;
        }
        if(prep<=create || prepared[prep])return false;
        const auto &op=p->_instructions[prep];
        if(op.op!=_OP_PREPCALLK || op._arg2!=array || op._arg0!=i._arg1 || op._arg3!=i._arg2 || op._arg0==op._arg3 ||
           op._arg1<0 || op._arg1>=p->_nliterals)return false;
        for(SQInteger at=prep+1;at<=ip;++at)if(analysis.leaders[at])return false;
        for(SQInteger at=prep+1;at<ip;++at)
            if(analysis.facts[at].reads.test(op._arg0) || analysis.facts[at].reads.test(op._arg3))return false;
        if(ip+1<p->_ninstructions)for(SQInteger r:{(SQInteger)op._arg0,(SQInteger)op._arg3})
            if(r!=i._arg0 && analysis.live_in[ip+1].test(r))return false;
        const auto &key=p->_literals[op._arg1];if(sq_type(key)!=OT_STRING)return false;
        auto name=[&](const SQChar *s,SQInteger n){return _string(key)->_len==n && !memcmp(_stringval(key),s,n*sizeof(SQChar));};
        if((name(_SC("append"),6) || name(_SC("push"),4)) && i._arg3==2){
            if(i._arg0!=255 && ip+1<p->_ninstructions && analysis.live_in[ip+1].test(i._arg0))return false;
            code[ip]=SQInstruction(SQJIT_OP_VECTOR_APPEND,p->_stacksize,i._arg2+1);append=true;
        }else if(name(_SC("len"),3) && i._arg3==1)
            code[ip]=SQInstruction(SQJIT_OP_VECTOR_LEN,i._arg0==255?p->_stacksize:(SQInteger)i._arg0);
        else return false;
        code[prep]=SQInstruction(_OP_LINE);prepared[prep]=true;
    }
    if(!append)return false;
    for(SQInteger ip=0;ip<p->_ninstructions;++ip)if(p->_instructions[ip].op==_OP_PREPCALLK && !prepared[ip])return false;
    code[create]=SQInstruction(_OP_LOADINT,array,0);
    for(auto ip:incoming){if(ip<0 || ip>=p->_ninstructions)return false;temporary_writes.push_back(ip);}
    std::sort(temporary_writes.begin(),temporary_writes.end());temporary_writes.erase(std::unique(temporary_writes.begin(),temporary_writes.end()),temporary_writes.end());
    auto result=SQFunctionProto::Create(p->_sharedstate,code.size(),p->_nliterals,p->_nparameters,0,0,0,0,0);
    if(!result)return false;
    lowered=SQObjectPtr(result);result->_stacksize=p->_stacksize+1;result->_bgenerator=false;result->_varparams=0;
    result->_name=p->_name;result->_sourcename=p->_sourcename;
    std::copy(code.begin(),code.end(),result->_instructions);std::copy(p->_literals,p->_literals+p->_nliterals,result->_literals);
    return true;
}
SQFunctionProto *SQJitDynamicArrayPlan::Lowered() const {return sq_type(lowered)==OT_FUNCPROTO?_funcproto(lowered):nullptr;}
