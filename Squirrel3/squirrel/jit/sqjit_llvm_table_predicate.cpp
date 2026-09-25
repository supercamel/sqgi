// Read-only table predicates with scalar scratch values. Arguments remain
// pinned in the caller; no heap, stack or VM temporary changes before success.
// A failed lookup/type guard can therefore replay the original function.
#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqstring.h"
#include "sqbytecode.h"
#include "sqjit_context.h"
#include "sqjit_write_log.h"
#include "sqjit_llvm_objects.h"
#include <llvm-c/Analysis.h>
#include <llvm-c/Core.h>
#include <llvm-c/Error.h>
#include "llvm_jit.h"
#include <llvm-c/Target.h>
#include <llvm-c/Transforms/PassBuilder.h>
#include <memory>
#include <mutex>
#include <stdexcept>
#include <cstdint>

namespace {
bool scalar(const SQObject &v) {
    return sq_type(v)==OT_NULL || sq_type(v)==OT_BOOL || sq_isnumeric(v);
}

// Locals are non-owning SQObject values, never fabricated SQObjectPtr objects.
// GETK only reads immutable argument slots and only produces scalar values.
SQInteger read_field(const SQObject *owner,const SQObjectPtr *key,SQObject *out,SQInteger *hint) {
    if(sq_type(*owner)!=OT_TABLE)return 0;
    auto value=_table(*owner)->GetRawSlotHint(*key,*hint);
    if(!value || !scalar(*value))return 0;
    *out=*value;
    return 1;
}

SQInteger entry_safe(SQJitContext *ctx,SQObjectPtr *stack,SQClosure *closure) {
    if(!ctx->active_vm || !closure || closure->_env)return 0;
    auto &temporary=ctx->active_vm->temp_reg;
    if(!SQJitWriteLog::CanReleaseInContext(*ctx,temporary))return 0;
    if(sq_type(stack[0])==OT_TABLE && sq_type(ctx->active_vm->_roottable)==OT_TABLE &&
       _table(stack[0])==_table(ctx->active_vm->_roottable))return 1;
    // The framed return adapter replaces slot zero before clearing arguments.
    // Prove that cannot destroy an observable receiver, even after every
    // parameter alias and the old VM temporary have been dropped.
    if(ISREFCOUNTED(sq_type(stack[0]))) {
        SQUnsignedInteger drops=0;
        for(SQInteger n=0;n<closure->_function->_nparameters;++n)
            if(sq_type(stack[n])==sq_type(stack[0]) && _rawval(stack[n])==_rawval(stack[0]))++drops;
        if(sq_type(temporary)==sq_type(stack[0]) && _rawval(temporary)==_rawval(stack[0]))++drops;
        if(!SQJitWriteLog::CanReleaseInContext(*ctx,stack[0],drops))return 0;
    }
    return 1;
}

SQInteger publish(SQJitContext *ctx,SQObjectPtr *out,const SQObject *value,SQInteger touched) {
    if(!scalar(*value))return SQ_JIT_NATIVE_GUARD_FAILED;
    if(touched)ctx->active_vm->temp_reg.Null();
    *out=*value;
    return SQ_JIT_NATIVE_RETURNED;
}

// Numeric operations run in ordinary C++, just as in the interpreter. No FP
// operation is speculated across a bytecode branch by the LLVM optimizer.
SQInteger compare(const SQObject *left,const SQObject *right,SQInteger op) {
    if(!sq_isnumeric(*left) || !sq_isnumeric(*right))return 0;
    SQInteger order;
    if(sq_type(*left)==sq_type(*right)) {
        if(_rawval(*left)==_rawval(*right))order=0;
        else if(sq_type(*left)==OT_INTEGER)order=_integer(*left)<_integer(*right)?-1:1;
        else order=_float(*left)<_float(*right)?-1:1;
    } else {
        const SQFloat a=tofloat(*left),b=tofloat(*right);
        order=a==b?0:a<b?-1:1;
    }
    bool result=op==CMP_G?order>0:op==CMP_GE?order>=0:op==CMP_L?order<0:order<=0;
    return result?2:1; // Zero is a guard failure, not a false comparison.
}

SQInteger equal(const SQObject *a,const SQObject *b) {
    if(sq_type(*a)==sq_type(*b)) {
        if(sq_type(*a)==OT_FLOAT)return _float(*a)==_float(*b);
        if(sq_type(*a)==OT_STRING)return _rawval(*a)==_rawval(*b) ||
            (_string(*a)->_len==_string(*b)->_len &&
             !memcmp(_stringval(*a),_stringval(*b),sq_rsl(_string(*a)->_len)));
        return _rawval(*a)==_rawval(*b);
    }
    return sq_isnumeric(*a) && sq_isnumeric(*b) && tofloat(*a)==tofloat(*b);
}

bool eligible(SQFunctionProto *p,SQBytecodeAnalysis &analysis) {
    if(!p || p->_bgenerator || p->_varparams || p->_ndefaultparams || p->_noutervalues ||
       p->_nparameters<1 || p->_nparameters>8 || p->_stacksize<p->_nparameters || p->_stacksize>32 ||
       p->_ninstructions<1 || p->_ninstructions>64 ||
       !analysis.Build(p->_instructions,p->_ninstructions,p->_stacksize))return false;
    bool member=false;
    std::vector<SQSlotSet> initialized(p->_ninstructions);
    std::vector<bool> reached(p->_ninstructions,false);
    reached[0]=true;
    for(SQInteger n=0;n<p->_nparameters;++n)initialized[0].set(n);
    auto merge=[&](SQInteger target,SQSlotSet state) {
        if(target<0 || target>=p->_ninstructions)return false;
        if(reached[target])initialized[target]&=state;
        else {reached[target]=true;initialized[target]=state;}
        return true;
    };
    for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
        const auto &i=p->_instructions[ip];const auto &f=analysis.facts[ip];
        if(f.target>=0 && (f.target<=ip || f.target>=p->_ninstructions))return false;
        for(SQInteger n=0;n<p->_nparameters;++n)if(f.writes.test(n))return false;
        auto literal=[&](SQInteger index){return index>=0 && index<p->_nliterals;};
        switch(i.op) {
        case _OP_GETK:
            if(i._arg2>=p->_nparameters || !literal(i._arg1) || sq_type(p->_literals[i._arg1])!=OT_STRING)return false;
            member=true;break;
        case _OP_LOAD:
            if(!literal(i._arg1) || !scalar(p->_literals[i._arg1]))return false;break;
        case _OP_DLOAD:
            if(!literal(i._arg1) || !literal(i._arg3) || !scalar(p->_literals[i._arg1]) || !scalar(p->_literals[i._arg3]))return false;break;
        case _OP_EQ:case _OP_NE:
            if(i._arg3 && !literal(i._arg1))return false;break;
        case _OP_CMP:case _OP_JCMP:
            if(i._arg3!=CMP_G && i._arg3!=CMP_GE && i._arg3!=CMP_L && i._arg3!=CMP_LE)return false;break;
        case _OP_LINE:case _OP_LOADINT:case _OP_LOADBOOL:case _OP_LOADNULLS:
        case _OP_MOVE:case _OP_DMOVE:case _OP_AND:case _OP_OR:case _OP_NOT:
        case _OP_JMP:case _OP_JZ:case _OP_RETURN:break;
        default:return false;
        }
        if(!reached[ip])continue;
        if((f.reads & ~initialized[ip]).any())return false;
        auto state=initialized[ip]|f.kills;
        if(f.fallthrough && !merge(ip+1,state))return false;
        if(i.op==_OP_AND || i.op==_OP_OR)state.set(i._arg0);
        if(f.target>=0 && !merge(f.target,state))return false;
    }
    return member;
}

void checked(LLVMErrorRef e) {
    if(!e)return;
    auto text=LLVMGetErrorMessage(e);LLVMDisposeErrorMessage(text);
    throw std::runtime_error("LLVM table predicate compilation failed");
}
struct Artifact {
    LLVMOrcLLJITRef jit=nullptr;
    std::vector<SQInteger> hints;
    ~Artifact(){if(jit)if(auto e=LLVMOrcDisposeLLJIT(jit))LLVMConsumeError(e);}
    static void release(void *p){delete static_cast<Artifact *>(p);}
};
struct IR {
    LLVMOrcThreadSafeContextRef thread=LLVMOrcCreateNewThreadSafeContext();
    LLVMContextRef c=LLVMOrcThreadSafeContextGetContext(thread);
    LLVMModuleRef module=LLVMModuleCreateWithNameInContext("table_predicate",c);
    LLVMBuilderRef b=LLVMCreateBuilderInContext(c);
    ~IR(){LLVMDisposeBuilder(b);if(module)LLVMDisposeModule(module);LLVMOrcDisposeThreadSafeContext(thread);}
};
}

bool sqjit_llvm_table_predicate_compile(SQFunctionProto *p,SQJitNative *native) {
    SQBytecodeAnalysis analysis;
    if(!native || !eligible(p,analysis))return false;
    static_assert(sizeof(SQFloat)==8 && sizeof(SQInteger)==8,"64-bit LLVM ABI required");
    static std::once_flag initialized;
    std::call_once(initialized,[]{if(LLVMInitializeNativeTarget() || LLVMInitializeNativeAsmPrinter())throw std::runtime_error("LLVM unavailable");});
    std::unique_ptr<Artifact> artifact(new Artifact);checked(sqgi_llvm::create_jit(&artifact->jit));
    artifact->hints.assign(p->_ninstructions,-1);
    IR ir;auto c=ir.c;auto b=ir.b;auto word=LLVMInt64TypeInContext(c),byte=LLVMInt8TypeInContext(c);
    auto tagtype=LLVMIntTypeInContext(c,sizeof(SQObjectType)*8),ptr=LLVMPointerTypeInContext(c,0);
    LLVMSetTarget(ir.module,LLVMOrcLLJITGetTripleString(artifact->jit));
    LLVMSetDataLayout(ir.module,LLVMOrcLLJITGetDataLayoutStr(artifact->jit));
    LLVMTypeRef params[]={ptr,ptr,ptr};auto fn=LLVMAddFunction(ir.module,"table_predicate",LLVMFunctionType(word,params,3,false));
    auto entry=LLVMAppendBasicBlockInContext(c,fn,"entry"),fail=LLVMAppendBasicBlockInContext(c,fn,"guard_failed");
    std::vector<LLVMBasicBlockRef> blocks(p->_ninstructions);
    for(auto &block:blocks)block=LLVMAppendBasicBlockInContext(c,fn,"bytecode");
    auto number=[&](SQInteger n){return LLVMConstInt(word,(uint64_t)n,true);};
    auto pointer=[&](const void *v){return LLVMConstIntToPtr(number((uintptr_t)v),ptr);};
    auto address=[&](LLVMValueRef base,size_t offset){auto n=number(offset);return LLVMBuildGEP2(b,byte,base,&n,1,"address");};
    auto call=[&](uintptr_t target,LLVMTypeRef result,std::vector<LLVMValueRef> args){
        std::vector<LLVMTypeRef> types;for(auto a:args)types.push_back(LLVMTypeOf(a));
        auto type=LLVMFunctionType(result,types.data(),types.size(),false);
        return LLVMBuildCall2(b,type,LLVMConstIntToPtr(number(target),ptr),args.data(),args.size(),"helper");
    };
    LLVMPositionBuilderAtEnd(b,fail);LLVMBuildRet(b,number(SQ_JIT_NATIVE_GUARD_FAILED));
    LLVMPositionBuilderAtEnd(b,entry);
    std::vector<LLVMValueRef> slots(p->_stacksize);
    for(SQInteger n=0;n<p->_stacksize;++n) {
        if(n<p->_nparameters)slots[n]=address(LLVMGetParam(fn,0),n*sizeof(SQObjectPtr));
        else {slots[n]=LLVMBuildAlloca(b,LLVMArrayType(byte,sizeof(SQObject)),"scalar_local");LLVMSetAlignment(slots[n],alignof(SQObject));}
    }
    auto touched=LLVMBuildAlloca(b,word,"temporary_touched");LLVMBuildStore(b,number(0),touched);
    auto guard=[&](LLVMValueRef ok){auto next=LLVMAppendBasicBlockInContext(c,fn,"guard_ok");LLVMBuildCondBr(b,ok,next,fail);LLVMPositionBuilderAtEnd(b,next);};
    auto tag=[&](LLVMValueRef slot){return LLVMBuildLoad2(b,tagtype,address(slot,offsetof(SQObject,_type)),"tag");};
    auto bits=[&](LLVMValueRef slot){return LLVMBuildLoad2(b,word,address(slot,offsetof(SQObject,_unVal)),"bits");};
    auto is_tag=[&](LLVMValueRef value,SQObjectType type){return LLVMBuildICmp(b,LLVMIntEQ,value,LLVMConstInt(tagtype,type,false),"type");};
    auto scalar_guard=[&](LLVMValueRef slot){auto t=tag(slot);guard(LLVMBuildOr(b,LLVMBuildOr(b,is_tag(t,OT_NULL),is_tag(t,OT_BOOL),"null_bool"),LLVMBuildOr(b,is_tag(t,OT_INTEGER),is_tag(t,OT_FLOAT),"numeric"),"scalar"));};
    auto store=[&](LLVMValueRef slot,LLVMValueRef value,SQObjectType type){LLVMBuildStore(b,value,address(slot,offsetof(SQObject,_unVal)));LLVMBuildStore(b,LLVMConstInt(tagtype,type,false),address(slot,offsetof(SQObject,_type)));};
    auto copy=[&](LLVMValueRef dst,LLVMValueRef src){auto t=tag(src),v=bits(src);LLVMBuildStore(b,v,address(dst,offsetof(SQObject,_unVal)));LLVMBuildStore(b,t,address(dst,offsetof(SQObject,_type)));};
    auto truth=[&](LLVMValueRef slot){
        auto v=bits(slot);auto zero=LLVMBuildICmp(b,LLVMIntEQ,v,number(0),"zero");
        auto float_zero=LLVMBuildAnd(b,is_tag(tag(slot),OT_FLOAT),LLVMBuildICmp(b,LLVMIntEQ,LLVMBuildAnd(b,v,number(INT64_MAX),"absolute_bits"),number(0),"float_zero"),"signed_zero");
        return LLVMBuildNot(b,LLVMBuildOr(b,zero,float_zero,"false"),"truth");
    };
    auto ctx=pointer(&sqjit_context(p->_sharedstate));
    guard(LLVMBuildICmp(b,LLVMIntNE,call((uintptr_t)&entry_safe,word,{ctx,LLVMGetParam(fn,0),LLVMGetParam(fn,2)}),number(0),"entry_safe"));
    LLVMBuildBr(b,blocks[0]);
    for(SQInteger ip=0;ip<p->_ninstructions;++ip) {
        LLVMPositionBuilderAtEnd(b,blocks[ip]);const auto &i=p->_instructions[ip];bool terminal=false;
        auto dst=slots[i._arg0<p->_stacksize?i._arg0:0];
        switch(i.op) {
        case _OP_LINE:break;
        case _OP_LOAD:copy(dst,pointer(&p->_literals[i._arg1]));break;
        case _OP_DLOAD:copy(dst,pointer(&p->_literals[i._arg1]));copy(slots[i._arg2],pointer(&p->_literals[i._arg3]));break;
        case _OP_LOADINT:store(dst,number((SQInt32)i._arg1),OT_INTEGER);break;
        case _OP_LOADBOOL:store(dst,number(i._arg1!=0),OT_BOOL);break;
        case _OP_LOADNULLS:for(SQInteger n=0;n<i._arg1;++n)store(slots[i._arg0+n],number(0),OT_NULL);break;
        case _OP_MOVE:case _OP_DMOVE:
            scalar_guard(slots[i._arg1]);copy(dst,slots[i._arg1]);
            if(i.op==_OP_DMOVE){scalar_guard(slots[i._arg3]);copy(slots[i._arg2],slots[i._arg3]);}break;
        case _OP_GETK:
            guard(LLVMBuildICmp(b,LLVMIntNE,call((uintptr_t)&read_field,word,{slots[i._arg2],pointer(&p->_literals[i._arg1]),dst,pointer(&artifact->hints[ip])}),number(0),"field_found"));
            LLVMBuildStore(b,number(1),touched);break;
        case _OP_EQ:case _OP_NE:{
            auto result=call((uintptr_t)&equal,word,{slots[i._arg2],i._arg3?pointer(&p->_literals[i._arg1]):slots[i._arg1]});
            if(i.op==_OP_NE)result=LLVMBuildXor(b,result,number(1),"not_equal");
            store(dst,result,OT_BOOL);break;
        }
        case _OP_NOT:store(dst,LLVMBuildZExt(b,LLVMBuildNot(b,truth(slots[i._arg1]),"not"),word,"bool"),OT_BOOL);break;
        case _OP_CMP:case _OP_JCMP:{
            auto result=call((uintptr_t)&compare,word,{slots[i._arg2],slots[i.op==_OP_JCMP?i._arg0:i._arg1],number(i._arg3)});
            guard(LLVMBuildICmp(b,LLVMIntNE,result,number(0),"numeric"));
            auto condition=LLVMBuildICmp(b,LLVMIntEQ,result,number(2),"comparison");
            if(i.op==_OP_CMP)store(dst,LLVMBuildZExt(b,condition,word,"bool"),OT_BOOL);
            else {LLVMBuildStore(b,number(1),touched);LLVMBuildCondBr(b,condition,blocks[ip+1],blocks[analysis.facts[ip].target]);terminal=true;}
            break;
        }
        case _OP_AND:case _OP_OR:{
            auto take=truth(slots[i._arg2]);if(i.op==_OP_AND)take=LLVMBuildNot(b,take,"short_circuit");
            auto assign=LLVMAppendBasicBlockInContext(c,fn,"short_value");LLVMBuildCondBr(b,take,assign,blocks[ip+1]);
            LLVMPositionBuilderAtEnd(b,assign);scalar_guard(slots[i._arg2]);copy(dst,slots[i._arg2]);LLVMBuildBr(b,blocks[analysis.facts[ip].target]);terminal=true;break;
        }
        case _OP_JZ:LLVMBuildCondBr(b,truth(dst),blocks[ip+1],blocks[analysis.facts[ip].target]);terminal=true;break;
        case _OP_JMP:LLVMBuildBr(b,blocks[analysis.facts[ip].target]);terminal=true;break;
        case _OP_RETURN:
            if(i._arg0==255)LLVMBuildRet(b,number(SQ_JIT_NATIVE_GUARD_FAILED));
            else LLVMBuildRet(b,call((uintptr_t)&publish,word,{ctx,LLVMGetParam(fn,1),slots[i._arg1],LLVMBuildLoad2(b,word,touched,"touched")}));
            terminal=true;break;
        default:return false;
        }
        if(!terminal) {
            if(ip+1>=p->_ninstructions)return false;
            LLVMBuildBr(b,blocks[ip+1]);
        }
    }
    char *message=nullptr;
    if(LLVMVerifyModule(ir.module,LLVMReturnStatusAction,&message)){LLVMDisposeMessage(message);return false;}
    LLVMDisposeMessage(message);
    auto options=LLVMCreatePassBuilderOptions();auto error=LLVMRunPasses(ir.module,"default<O2>",nullptr,options);LLVMDisposePassBuilderOptions(options);checked(error);
    auto module=LLVMOrcCreateNewThreadSafeModule(ir.module,ir.thread);ir.module=nullptr;
    checked(sqgi_llvm::add_module(artifact->jit, module));
    LLVMOrcExecutorAddress code=0;checked(LLVMOrcLLJITLookup(artifact->jit,&code,"table_predicate"));
    native->_code.SetExternal((void *)(uintptr_t)code,artifact.release(),Artifact::release);
    native->_stack_live_slots=p->_nparameters;native->_stack_storage_slots=p->_nparameters;
    return true;
}
