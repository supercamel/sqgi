// Experimental Squirrel LLVM tier: rooted boxed baseline plus guarded pure regions.
#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "squserdata.h"
#include "kernel/inline.h"
#include <llvm-c/Analysis.h>
#include <llvm-c/Core.h>
#include <llvm-c/Error.h>
#include <llvm-c/LLJIT.h>
#include <llvm-c/Target.h>
#include <llvm-c/Transforms/PassBuilder.h>
#include <cstdint>
#include <cstddef>
#include <cstdlib>
#include <cstring>
#include <memory>
#include <mutex>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
struct Observation {
    int pc;SQNativeClosure *closure;SQKernelInline kernel;
    int prep=-1;SQUserData *receiver=nullptr;
    Observation(int pc,SQNativeClosure *closure,SQKernelInline kernel):pc(pc),closure(closure),kernel(std::move(kernel)) {}
};
struct Invocation {uint64_t *receivers[16]{};};
struct Code {
    LLVMOrcLLJITRef jit=nullptr;
    int (*entry)(SQVM*,int,SQObjectPtr**,SQInteger,Invocation*)=nullptr;
    SQInteger entries=0, operations=0, direct_operations=0, leaf_calls=0;
    int lowered=0, direct=0;
    std::vector<Observation> observed;
    std::unique_ptr<Code> fused;
    bool attempted=false;
    SQInteger fused_entries=0, inlined_calls=0, prepared_calls=0;
    ~Code(){if(jit)if(auto e=LLVMOrcDisposeLLJIT(jit))LLVMConsumeError(e);}
};
bool inlineable(const SQKernelInline &k) {
    const auto &f=k.module->functions[k.function];
    if(!f.owner.empty() || f.parameters.size()>4 || f.code.size()>64)return false;
    for(const auto &p:f.parameters)if(p.borrowed() || p.type==sqkernel::Type::F64)return false;
    for(const auto &i:f.code){
        if(i.type==sqkernel::Type::F64)return false;
        switch(i.op){
        case sqkernel::Op::Constant:case sqkernel::Op::Copy:case sqkernel::Op::Add:
        case sqkernel::Op::Sub:case sqkernel::Op::Mul:case sqkernel::Op::Neg:
        case sqkernel::Op::Eq:case sqkernel::Op::Ne:case sqkernel::Op::Lt:
        case sqkernel::Op::Le:case sqkernel::Op::Gt:case sqkernel::Op::Ge:break;
        case sqkernel::Op::Return:return true;
        default:return false;
        }
    }
    return false;
}
bool prepared_method(const Observation &o) {
    const auto &f=o.kernel.module->functions[o.kernel.function];
    if(o.prep<0 || !o.receiver || f.owner.empty() || f.parameters.empty() ||
        !f.parameters[0].instance || f.parameters.size()>5)return false;
    for(size_t n=1;n<f.parameters.size();++n)if(f.parameters[n].borrowed())return false;
    return true;
}
bool can_fuse(SQFunctionProto *p,const std::vector<Observation> &observed) {
    if(p->_bgenerator || p->_varparams || p->_ninstructions>256 || p->_stacksize>64)return false;
    bool loop=false;
    auto writable=[&](int slot){return slot>=p->_nparameters && slot<p->_stacksize;};
    for(int pc=0;pc<p->_ninstructions;++pc){
        const auto i=p->_instructions[pc];
        if((i.op==_OP_JMP || i.op==_OP_JZ || i.op==_OP_JCMP) && pc+1+i._arg1<=pc)loop=true;
        switch(i.op){
        case _OP_LINE:case _OP_JMP:case _OP_JZ:case _OP_JCMP:case _OP_RETURN:break;
        case _OP_CALL: {
            if(i._arg0!=255 && !writable(i._arg0))return false;
            const Observation *found=nullptr;for(const auto &o:observed)if(o.pc==pc)found=&o;
            if(!found)return false;
            bool method=prepared_method(*found);
            if(!method && !inlineable(found->kernel))return false;
            if(i._arg3!=found->kernel.module->functions[found->kernel.function].parameters.size()+(method?0:1))return false;
            break;
        }
        case _OP_PREPCALLK: {
            bool found=false;
            for(const auto &o:observed)if(o.prep==pc && prepared_method(o))found=true;
            if(!found || !writable(i._arg0) || !writable(i._arg3))return false;
            break;
        }
        case _OP_DLOAD:
            if(!writable(i._arg0) || !writable(i._arg2) ||
                (p->_literals[i._arg1]._type & SQOBJECT_REF_COUNTED) ||
                (p->_literals[i._arg3]._type & SQOBJECT_REF_COUNTED))return false;
            break;
        case _OP_DMOVE:if(!writable(i._arg0)||!writable(i._arg2))return false;break;
        case _OP_INCL:if(!writable(i._arg1))return false;break;
        case _OP_PINCL:if(!writable(i._arg1)||!writable(i._arg0))return false;break;
        case _OP_LOAD:if(p->_literals[i._arg1]._type & SQOBJECT_REF_COUNTED)return false;
            // fall through
        case _OP_LOADINT:case _OP_LOADBOOL:case _OP_MOVE:case _OP_NOT:
        case _OP_ADD:case _OP_SUB:case _OP_MUL:case _OP_CMP:
            if(!writable(i._arg0))return false;break;
        default:return false;
        }
    }
    return loop;
}
// Called only after the fused entry guard: every managed value is owned by an
// unchanged parameter or its validated method delegate. No assignment here can
// release its final strong owner.
int materialize(SQVM *v,const SQObject *objects,int pc) {
    auto *p=_closure(v->ci->_closure)->_function;
    v->ci->_ip=p->_instructions+pc;
    for(int n=p->_nparameters;n<p->_stacksize;++n)v->_stack[v->_stackbase+n]=SQObjectPtr(objects[n]);
    return pc;
}
bool fused_guard(SQVM *v,const Code &code,Invocation &invocation) {
    if(v->_nnativecalls+1>MAX_NATIVE_CALLS)return false;
    const auto *p=_closure(v->ci->_closure)->_function;
    auto *slots=&v->_stack[v->_stackbase];
    for(size_t n=0;n<code.observed.size();++n){
        const auto &o=code.observed[n];
        SQNativeClosure *native=nullptr;
        for(int a=0;a<p->_nparameters;++a){
            if(o.receiver){
                if(sq_type(slots[a])!=OT_USERDATA || _userdata(slots[a])!=o.receiver)continue;
                auto *delegate=_userdata(slots[a])->_delegate;SQObjectPtr callable;
                if(!delegate || !delegate->Get(p->_literals[p->_instructions[o.prep]._arg1],callable) ||
                    sq_type(callable)!=OT_NATIVECLOSURE || _nativeclosure(callable)!=o.closure)continue;
                if(!sqgi_kernel_inline_receiver(o.kernel,slots[a],invocation.receivers[n]))continue;
                native=_nativeclosure(callable);
            }else if(sq_type(slots[a])==OT_NATIVECLOSURE && _nativeclosure(slots[a])==o.closure)native=_nativeclosure(slots[a]);
        }
        SQKernelInline current;
        if(!native || native->_env || native->_nparamscheck || !native->_typecheck.empty() ||
            !sqgi_kernel_describe_leaf(native->_leaf,native->_leaf_context,current) ||
            current.identity!=o.kernel.identity || current.context!=o.kernel.context || current.leaf!=o.kernel.leaf)return false;
    }
    // Old managed temporaries must have an unchanged owner: a parameter or a
    // method in a receiver parameter's validated delegate. No VM reentry occurs
    // while locals are unmaterialized, so those ownership edges remain stable.
    for(int n=p->_nparameters;n<p->_stacksize;++n)if(slots[n]._type & SQOBJECT_REF_COUNTED){
        bool rooted=false;
        for(int a=0;a<p->_nparameters;++a)if(slots[n]._type==slots[a]._type && _rawval(slots[n])==_rawval(slots[a]))rooted=true;
        for(const auto &o:code.observed)if(o.receiver && sq_type(slots[n])==OT_NATIVECLOSURE && _nativeclosure(slots[n])==o.closure)rooted=true;
        if(!rooted)return false;
    }
    return true;
}
int prepared_call(const SQKernelInline *kernel,sqkernel::Call *call) {
    // Retains the existing per-call floating environment and kernel fuel/error ABI.
    return sqkernel::execute(kernel->prepared,*call);
}
void prepared_error(SQVM *v,const SQKernelInline *kernel,const sqkernel::Call *call,int status) {
    try {
        const auto &f=kernel->module->functions[kernel->function];
        std::string message=kernel->module->filename+":"+std::to_string(call->error_line)+": "+f.name+": "+sqkernel::status_name(sqkernel::Status(status));
        v->Raise_Error("%s",message.c_str());
    }catch(...){v->Raise_Error("kernel: failed to allocate error diagnostic");}
}
void release(void *p){delete static_cast<Code*>(p);}
void checked(LLVMErrorRef e){if(e){char *s=LLVMGetErrorMessage(e);std::string msg(s);LLVMDisposeErrorMessage(s);throw std::runtime_error(msg);}}
bool numeric(const SQObjectPtr &o){return sq_type(o)==OT_INTEGER || sq_type(o)==OT_FLOAT;}
// 0: next, 1: branch, 2: interpreter handoff before effects, -1: VM error.
// Each instantiation has a constant opcode; there is no runtime opcode switch.
template<int Op> int step(SQVM *v,int pc) {
    auto *p=_closure(v->ci->_closure)->_function;
    auto *code=static_cast<Code*>(p->_llvm_code);
    const auto i=p->_instructions[pc];
    const int a=i._arg0,b=i._arg1,c=i._arg2,d=i._arg3;
    const SQInteger base=v->_stackbase;
    v->ci->_ip=p->_instructions+pc+1;
    auto reg=[&](int n)->SQObjectPtr& {return v->_stack[base+n];};
    try {
        switch(Op) {
        case _OP_LINE: break;
        case _OP_LOAD: reg(a)=p->_literals[b];break;
        case _OP_LOADINT: reg(a)=SQInteger(b);break;
        case _OP_LOADBOOL: reg(a)=bool(b);break;
        case _OP_LOADNULLS: for(int n=0;n<b;++n)reg(a+n).Null();break;
        case _OP_MOVE:reg(a)=reg(b);break;
        case _OP_DMOVE:reg(a)=reg(b);reg(c)=reg(d);break;
        case _OP_DLOAD:reg(a)=p->_literals[b];reg(c)=p->_literals[d];break;
        case _OP_NOT:reg(a)=bool(SQVM::IsFalse(reg(b)));break;
        case _OP_JZ: ++code->operations;return SQVM::IsFalse(reg(a))?1:0;
        case _OP_JCMP:
        case _OP_CMP: {
            SQObjectPtr left=reg(c),right=reg(Op==_OP_JCMP?a:b),out;
            if(!numeric(left)||!numeric(right))return 2;
            if(!v->CMP_OP(CmpOP(d),left,right,out))return -1;
            if(Op==_OP_JCMP){++code->operations;return SQVM::IsFalse(out)?1:0;}
            reg(a)=out;break;
        }
        case _OP_ADD:case _OP_SUB:case _OP_MUL: {
            SQObjectPtr left=reg(c),right=reg(b);
            if(!numeric(left)||!numeric(right))return 2;
            if(sq_type(left)==OT_INTEGER && sq_type(right)==OT_INTEGER) {
                // Define the existing machine-integer wrapping behavior without C++ UB.
                SQUnsignedInteger x=_integer(left),y=_integer(right),z;
                z=Op==_OP_ADD?x+y:Op==_OP_SUB?x-y:x*y;
                SQInteger out;std::memcpy(&out,&z,sizeof out);reg(a)=out;
            } else {
                SQFloat x=tofloat(left),y=tofloat(right);
                reg(a)=Op==_OP_ADD?x+y:Op==_OP_SUB?x-y:x*y;
            }
            break;
        }
        case _OP_INCL:case _OP_PINCL: {
            if(sq_type(reg(b))!=OT_INTEGER)return 2;
            SQObjectPtr old=reg(b);
            SQUnsignedInteger bits=SQUnsignedInteger(_integer(old))+SQUnsignedInteger(SQInteger(static_cast<signed char>(d)));
            SQInteger out;std::memcpy(&out,&bits,sizeof out);
            if(Op==_OP_PINCL)reg(a)=old;reg(b)=out;break;
        }
        case _OP_PREPCALLK: {
            // Direct delegate slots are pure lookups. Missing slots and dynamic
            // getters hand off before effects; re-read on every call, no stale cache.
            if(sq_type(reg(c))!=OT_USERDATA)return 2;
            auto *delegate=_userdata(reg(c))->_delegate;
            SQObjectPtr callable;
            if(!delegate || !delegate->Get(p->_literals[b],callable) ||
                sq_type(callable)!=OT_NATIVECLOSURE || !_nativeclosure(callable)->_leaf)return 2;
            reg(d)=reg(c);
            reg(a)=callable;
            break;
        }
        case _OP_CALL: {
            SQObjectPtr closure=reg(b);
            if(sq_type(closure)!=OT_NATIVECLOSURE)return 2;
            auto *native=_nativeclosure(closure);
            if(!native->_leaf || native->_env)return 2;
            if(!code->attempted && code->observed.size()<16) {
                bool seen=false;for(const auto &o:code->observed)if(o.pc==pc)seen=true;
                if(!seen){
                    SQKernelInline kernel;
                    if(sqgi_kernel_describe_leaf(native->_leaf,native->_leaf_context,kernel)){
                        Observation observation{pc,native,std::move(kernel)};
                        if(!observation.kernel.module->functions[observation.kernel.function].owner.empty()){
                            if(sq_type(reg(c))==OT_USERDATA)for(int prep=pc-1;prep>=0;--prep){
                                const auto &instruction=p->_instructions[prep];
                                if(instruction.op==_OP_PREPCALLK && instruction._arg0==b && instruction._arg3==c){
                                    observation.prep=prep;observation.receiver=_userdata(reg(c));break;
                                }
                            }
                        }
                        code->observed.push_back(std::move(observation));
                    }
                }
            }
            SQObjectPtr result;bool suspend=false,tail=false;
            ++code->leaf_calls;
            if(!v->CallNative(native,d,base+c,result,-1,suspend,tail))return -1;
            if(a!=255)reg(a)=result;
            break;
        }
        default:return 2;
        }
        ++code->operations;return 0;
    } catch(const std::exception &e){v->Raise_Error("LLVM Squirrel: %s",e.what());return -1;}
    catch(...){v->Raise_Error("LLVM Squirrel runtime failure");return -1;}
}
using Step=int(*)(SQVM*,int);
Step helper(int op){switch(op){
#define OP(x) case _OP_##x:return step<_OP_##x>;
OP(LINE) OP(LOAD) OP(LOADINT) OP(LOADBOOL) OP(LOADNULLS) OP(MOVE) OP(DMOVE) OP(DLOAD)
OP(PREPCALLK) OP(NOT) OP(JZ) OP(JCMP) OP(CMP) OP(ADD) OP(SUB) OP(MUL) OP(INCL) OP(PINCL) OP(CALL)
#undef OP
 default:return nullptr;
}}
struct IR {
    LLVMOrcThreadSafeContextRef ts=LLVMOrcCreateNewThreadSafeContext();
    LLVMContextRef ctx=LLVMOrcThreadSafeContextGetContext(ts);
    LLVMModuleRef module=LLVMModuleCreateWithNameInContext("squirrel",ctx);
    LLVMBuilderRef builder=LLVMCreateBuilderInContext(ctx);
    ~IR(){LLVMDisposeBuilder(builder);if(module)LLVMDisposeModule(module);LLVMOrcDisposeThreadSafeContext(ts);}
};
// Direct scalar lowering never releases a managed destination. A failed guard
// hands off before any write, so refcounting and metamethods remain VM-owned.
struct Scalars {
    IR &ir;
    LLVMValueRef fn, count,inlined,prepared,call_arguments,call_storage,snapshot=nullptr;
    bool shadow=false;
    std::vector<LLVMValueRef> tags,values;
    LLVMTypeRef i8,i32,i64,fp,ptr;
    Scalars(IR &ir,LLVMValueRef fn):ir(ir),fn(fn) {
        i8=LLVMInt8TypeInContext(ir.ctx);i32=LLVMInt32TypeInContext(ir.ctx);
        i64=LLVMInt64TypeInContext(ir.ctx);ptr=LLVMPointerTypeInContext(ir.ctx,0);
        fp=sizeof(SQFloat)==8?LLVMDoubleTypeInContext(ir.ctx):LLVMFloatTypeInContext(ir.ctx);
        count=LLVMBuildAlloca(ir.builder,i64,"direct.count");
        LLVMBuildStore(ir.builder,number(0),count);
        inlined=LLVMBuildAlloca(ir.builder,i64,"inlined.count");
        LLVMBuildStore(ir.builder,number(0),inlined);
        prepared=LLVMBuildAlloca(ir.builder,i64,"prepared.count");LLVMBuildStore(ir.builder,number(0),prepared);
        call_arguments=LLVMBuildArrayAlloca(ir.builder,i64,number(5),"kernel.arguments");
        call_storage=LLVMBuildArrayAlloca(ir.builder,i8,number(sizeof(sqkernel::Call)),"kernel.call");
        LLVMSetAlignment(call_storage,alignof(sqkernel::Call));
    }
    LLVMValueRef number(uint64_t x){return LLVMConstInt(i64,x,false);}
    LLVMValueRef tag(int x){return LLVMConstInt(i32,x,false);}
    LLVMValueRef memoryField(int slot,size_t offset) {
        auto b=ir.builder;
        auto stack=LLVMBuildLoad2(b,ptr,LLVMGetParam(fn,2),"stack");
        auto index=LLVMBuildAdd(b,LLVMGetParam(fn,3),number(slot),"index");
        auto bytes=LLVMBuildAdd(b,LLVMBuildMul(b,index,number(sizeof(SQObjectPtr)),""),number(offset),"");
        return LLVMBuildGEP2(b,i8,stack,&bytes,1,"slot");
    }
    LLVMValueRef field(int slot,size_t offset) {
        if(shadow)return offset==offsetof(SQObject,_type)?tags.at(slot):values.at(slot);
        return memoryField(slot,offset);
    }
    void shadow_frame(int slots) {
        auto b=ir.builder;
        for(int n=0;n<slots;++n){
            tags.push_back(LLVMBuildAlloca(b,i32,"local.tag"));
            values.push_back(LLVMBuildAlloca(b,i64,"local.bits"));
            LLVMBuildStore(b,LLVMBuildLoad2(b,i32,memoryField(n,offsetof(SQObject,_type)),""),tags.back());
            LLVMBuildStore(b,LLVMBuildLoad2(b,i64,memoryField(n,offsetof(SQObject,_unVal)),""),values.back());
        }
        shadow=true;
        snapshot=LLVMBuildArrayAlloca(b,i8,number(slots*sizeof(SQObject)),"materialized");
        LLVMSetAlignment(snapshot,alignof(SQObject));
    }
    void flush(int first,int pc) {
        auto b=ir.builder;
        for(int n=first;n<(int)tags.size();++n){
            auto at=number(n*sizeof(SQObject)+offsetof(SQObject,_type));
            LLVMBuildStore(b,type(n),LLVMBuildGEP2(b,i8,snapshot,&at,1,""));
            at=number(n*sizeof(SQObject)+offsetof(SQObject,_unVal));
            LLVMBuildStore(b,bits(n),LLVMBuildGEP2(b,i8,snapshot,&at,1,""));
        }
        LLVMTypeRef arguments[]={ptr,ptr,i32};auto ft=LLVMFunctionType(i32,arguments,3,false);
        LLVMValueRef args[]={LLVMGetParam(fn,0),snapshot,tag(pc)};
        auto address=LLVMConstIntToPtr(number(reinterpret_cast<uintptr_t>(materialize)),ptr);
        LLVMBuildCall2(b,ft,address,args,3,"");
    }
    void prepare_method(const Observation &o,const SQInstruction &instruction,LLVMBasicBlockRef next,LLVMBasicBlockRef fallback) {
        int source=instruction._arg2;
        guard(both(eq(type(source),tag(OT_USERDATA)),eq(bits(source),number(reinterpret_cast<uintptr_t>(o.receiver)))),fallback);
        store(instruction._arg3,type(source),bits(source));
        store(instruction._arg0,tag(OT_NATIVECLOSURE),number(reinterpret_cast<uintptr_t>(o.closure)));
        tick();LLVMBuildBr(ir.builder,next);
    }
    template<class Flush> void method_kernel(const Observation &o,size_t index,const SQInstruction &instruction,
                        LLVMBasicBlockRef next,LLVMBasicBlockRef fallback,Flush flush) {
        using namespace sqkernel;
        auto b=ir.builder;const auto &f=o.kernel.module->functions[o.kernel.function];
        guard(both(eq(type(instruction._arg1),tag(OT_NATIVECLOSURE)),eq(bits(instruction._arg1),number(reinterpret_cast<uintptr_t>(o.closure)))),fallback);
        int receiver=instruction._arg2;
        guard(both(eq(type(receiver),tag(OT_USERDATA)),eq(bits(receiver),number(reinterpret_cast<uintptr_t>(o.receiver)))),fallback);
        auto at=number(index);
        auto cells=LLVMBuildLoad2(b,ptr,LLVMBuildGEP2(b,ptr,LLVMGetParam(fn,4),&at,1,""),"receiver.cells");
        LLVMBuildStore(b,LLVMBuildPtrToInt(b,cells,i64,""),call_arguments);
        for(size_t n=1;n<f.parameters.size();++n){
            auto t=f.parameters[n].type;int slot=receiver+n;
            guard(eq(type(slot),tag(t==Type::I64?OT_INTEGER:t==Type::F64?OT_FLOAT:OT_BOOL)),fallback);
            auto value=bits(slot);
            if(t==Type::Bool)value=LLVMBuildZExt(b,LLVMBuildICmp(b,LLVMIntNE,value,number(0),""),i64,"");
            at=number(n);LLVMBuildStore(b,value,LLVMBuildGEP2(b,i64,call_arguments,&at,1,""));
        }
        auto member=[&](size_t offset){auto byte=number(offset);return LLVMBuildGEP2(b,i8,call_storage,&byte,1,"");};
        LLVMBuildStore(b,call_arguments,member(offsetof(Call,arguments)));
        LLVMBuildStore(b,number(0),member(offsetof(Call,result)));
        LLVMBuildStore(b,number(1000000),member(offsetof(Call,fuel)));
        LLVMBuildStore(b,number(0),member(offsetof(Call,error_line)));
        LLVMTypeRef arguments[]={ptr,ptr};auto ft=LLVMFunctionType(i32,arguments,2,false);
        auto descriptor=LLVMConstIntToPtr(number(reinterpret_cast<uintptr_t>(&o.kernel)),ptr);
        LLVMValueRef args[]={descriptor,call_storage};
        auto address=LLVMConstIntToPtr(number(reinterpret_cast<uintptr_t>(prepared_call)),ptr);
        auto status=LLVMBuildCall2(b,ft,address,args,2,"kernel.status");
        LLVMBuildStore(b,LLVMBuildAdd(b,LLVMBuildLoad2(b,i64,prepared,""),number(1),""),prepared);
        auto success=LLVMAppendBasicBlockInContext(ir.ctx,fn,"kernel.success");
        auto failure=LLVMAppendBasicBlockInContext(ir.ctx,fn,"kernel.error");
        LLVMBuildCondBr(b,eq(status,tag(Success)),success,failure);
        LLVMPositionBuilderAtEnd(b,failure);
        // A failure can follow writes. Materialize once, raise the native error,
        // and return the VM's error sentinel; never execute this CALL again.
        flush(o.pc+1);
        LLVMTypeRef error_args[]={ptr,ptr,ptr,i32};auto error_ft=LLVMFunctionType(LLVMVoidTypeInContext(ir.ctx),error_args,4,false);
        LLVMValueRef error_values[]={LLVMGetParam(fn,0),descriptor,call_storage,status};
        address=LLVMConstIntToPtr(number(reinterpret_cast<uintptr_t>(prepared_error)),ptr);
        LLVMBuildCall2(b,error_ft,address,error_values,4,"");LLVMBuildRet(b,tag(-1));
        LLVMPositionBuilderAtEnd(b,success);
        if(instruction._arg0!=255)store(instruction._arg0,tag(f.result==Type::Void?OT_NULL:f.result==Type::F64?OT_FLOAT:f.result==Type::Bool?OT_BOOL:OT_INTEGER),
            f.result==Type::Void?number(0):LLVMBuildLoad2(b,i64,member(offsetof(Call,result)),"kernel.result"));
        tick();LLVMBuildBr(b,next);
    }
    void inline_kernel(const Observation &o,const SQInstruction &call,LLVMBasicBlockRef next,LLVMBasicBlockRef fallback) {
        using namespace sqkernel;
        auto b=ir.builder;const auto &f=o.kernel.module->functions[o.kernel.function];
        guard(both(eq(type(call._arg1),tag(OT_NATIVECLOSURE)),eq(bits(call._arg1),number(reinterpret_cast<uintptr_t>(o.closure)))),fallback);
        std::vector<LLVMValueRef> regs(f.slots,number(0));
        for(size_t n=0;n<f.parameters.size();++n){
            int slot=call._arg2+1+n;auto t=f.parameters[n].type;
            guard(eq(type(slot),tag(t==Type::Bool?OT_BOOL:OT_INTEGER)),fallback);
            auto value=bits(slot);
            if(t==Type::Bool)value=LLVMBuildZExt(b,LLVMBuildICmp(b,LLVMIntNE,value,number(0),""),i64,"");
            regs[n]=value;
        }
        for(const auto &i:f.code){
            LLVMValueRef value=nullptr;
            switch(i.op){
            case Op::Constant:value=number(i.immediate);break;
            case Op::Copy:value=regs.at(i.a);break;
            case Op::Add:value=LLVMBuildAdd(b,regs.at(i.a),regs.at(i.b),"");break;
            case Op::Sub:value=LLVMBuildSub(b,regs.at(i.a),regs.at(i.b),"");break;
            case Op::Mul:value=LLVMBuildMul(b,regs.at(i.a),regs.at(i.b),"");break;
            case Op::Neg:value=LLVMBuildNeg(b,regs.at(i.a),"");break;
            case Op::Eq:case Op::Ne:case Op::Lt:case Op::Le:case Op::Gt:case Op::Ge: {
                auto pred=i.op==Op::Eq?LLVMIntEQ:i.op==Op::Ne?LLVMIntNE:i.op==Op::Lt?LLVMIntSLT:i.op==Op::Le?LLVMIntSLE:i.op==Op::Gt?LLVMIntSGT:LLVMIntSGE;
                value=LLVMBuildZExt(b,LLVMBuildICmp(b,pred,regs.at(i.a),regs.at(i.b),""),i64,"");break;
            }
            case Op::Return: {
                if(call._arg0!=255)store(call._arg0,tag(f.result==Type::Void?OT_NULL:f.result==Type::Bool?OT_BOOL:OT_INTEGER),f.result==Type::Void?number(0):regs.at(i.a));
                LLVMBuildStore(b,LLVMBuildAdd(b,LLVMBuildLoad2(b,i64,inlined,""),number(1),""),inlined);
                tick();LLVMBuildBr(b,next);return;
            }
            default:throw std::runtime_error("unsupported inlined kernel instruction");
            }
            regs.at(i.dst)=value;
        }
        throw std::runtime_error("inlined kernel missing return");
    }
    LLVMValueRef type(int slot){return LLVMBuildLoad2(ir.builder,i32,field(slot,offsetof(SQObject,_type)),"tag");}
    LLVMValueRef bits(int slot){return LLVMBuildLoad2(ir.builder,i64,field(slot,offsetof(SQObject,_unVal)),"value");}
    LLVMValueRef eq(LLVMValueRef a,LLVMValueRef b){return LLVMBuildICmp(ir.builder,LLVMIntEQ,a,b,"");}
    LLVMValueRef both(LLVMValueRef a,LLVMValueRef b){return LLVMBuildAnd(ir.builder,a,b,"");}
    LLVMValueRef scalar(int slot){if(shadow)return LLVMConstInt(LLVMInt1TypeInContext(ir.ctx),1,false);return eq(LLVMBuildAnd(ir.builder,type(slot),tag(SQOBJECT_REF_COUNTED),""),tag(0));}
    void guard(LLVMValueRef ok,LLVMBasicBlockRef fallback) {
        auto next=LLVMAppendBasicBlockInContext(ir.ctx,fn,"guard.ok");
        LLVMBuildCondBr(ir.builder,ok,next,fallback);LLVMPositionBuilderAtEnd(ir.builder,next);
    }
    void store(int slot,LLVMValueRef type,LLVMValueRef value) {
        LLVMBuildStore(ir.builder,type,field(slot,offsetof(SQObject,_type)));
        LLVMBuildStore(ir.builder,value,field(slot,offsetof(SQObject,_unVal)));
    }
    void tick(){auto b=ir.builder;LLVMBuildStore(b,LLVMBuildAdd(b,LLVMBuildLoad2(b,i64,count,""),number(1),""),count);}
    LLVMValueRef floatValue(LLVMValueRef type,LLVMValueRef bits) {
        auto b=ir.builder;
        auto raw=sizeof(SQFloat)==8?bits:LLVMBuildTrunc(b,bits,i32,"");
        return LLVMBuildSelect(b,eq(type,tag(OT_INTEGER)),LLVMBuildSIToFP(b,bits,fp,""),LLVMBuildBitCast(b,raw,fp,""),"");
    }
    bool emit(SQFunctionProto *proto,const SQInstruction &i,LLVMBasicBlockRef next,LLVMBasicBlockRef jump,LLVMBasicBlockRef fallback) {
        auto b=ir.builder;int a=i._arg0,c=i._arg2,d=i._arg3,r=i._arg1;
        switch(i.op) {
        case _OP_LINE:LLVMBuildBr(b,next);return true;
        case _OP_LOAD: {
            const auto &literal=proto->_literals[r];
            if(literal._type & SQOBJECT_REF_COUNTED)return false;
            uint64_t raw;std::memcpy(&raw,&literal._unVal,sizeof raw);
            guard(scalar(a),fallback);store(a,tag(literal._type),number(raw));break;
        }
        case _OP_DLOAD: {
            const auto &first=proto->_literals[r],&second=proto->_literals[d];
            if((first._type|second._type)&SQOBJECT_REF_COUNTED)return false;
            guard(both(scalar(a),scalar(c)),fallback);
            uint64_t one,two;std::memcpy(&one,&first._unVal,sizeof one);std::memcpy(&two,&second._unVal,sizeof two);
            store(a,tag(first._type),number(one));store(c,tag(second._type),number(two));break;
        }
        case _OP_LOADNULLS:
            for(int n=0;n<r;++n)guard(scalar(a+n),fallback);
            for(int n=0;n<r;++n)store(a+n,tag(OT_NULL),number(0));
            break;
        case _OP_NOT:case _OP_JZ: {
            int source=i.op==_OP_JZ?a:r;
            auto t=type(source),v=bits(source);
            auto raw=sizeof(SQFloat)==8?v:LLVMBuildTrunc(b,v,i32,"");
            auto zero=LLVMBuildFCmp(b,LLVMRealOEQ,LLVMBuildBitCast(b,raw,fp,""),LLVMConstReal(fp,0),"");
            auto falsy=LLVMBuildOr(b,eq(v,number(0)),both(eq(t,tag(OT_FLOAT)),zero),"");
            if(i.op==_OP_JZ){tick();LLVMBuildCondBr(b,falsy,jump,next);return true;}
            guard(scalar(a),fallback);store(a,tag(OT_BOOL),LLVMBuildZExt(b,falsy,i64,""));break;
        }
        case _OP_LOADINT:case _OP_LOADBOOL:
            guard(scalar(a),fallback);
            store(a,tag(i.op==_OP_LOADINT?OT_INTEGER:OT_BOOL),number(i.op==_OP_LOADINT?int64_t(r):bool(r)));break;
        case _OP_MOVE: {
            auto t=type(r),v=bits(r);
            if(!shadow)guard(both(scalar(a),eq(LLVMBuildAnd(b,t,tag(SQOBJECT_REF_COUNTED),""),tag(0))),fallback);
            store(a,t,v);break;
        }
        case _OP_DMOVE:
            if(!shadow)return false;
            store(a,type(r),bits(r));store(c,type(d),bits(d));break;
        case _OP_INCL:case _OP_PINCL: {
            guard(eq(type(r),tag(OT_INTEGER)),fallback);
            if(i.op==_OP_PINCL)guard(scalar(a),fallback);
            auto old=bits(r);auto value=LLVMBuildAdd(b,old,number(int64_t(static_cast<signed char>(d))),"");
            if(i.op==_OP_PINCL)store(a,tag(OT_INTEGER),old);
            store(r,tag(OT_INTEGER),value);break;
        }
        case _OP_ADD:case _OP_SUB:case _OP_MUL: {
            auto lt=type(c),rt=type(r),left=bits(c),right=bits(r);
            auto li=eq(lt,tag(OT_INTEGER)),ri=eq(rt,tag(OT_INTEGER));
            auto ln=LLVMBuildOr(b,li,eq(lt,tag(OT_FLOAT)),"");
            auto rn=LLVMBuildOr(b,ri,eq(rt,tag(OT_FLOAT)),"");
            guard(both(scalar(a),both(ln,rn)),fallback);
            auto integers=LLVMAppendBasicBlockInContext(ir.ctx,fn,"integer");
            auto floats=LLVMAppendBasicBlockInContext(ir.ctx,fn,"float");
            auto done=LLVMAppendBasicBlockInContext(ir.ctx,fn,"arithmetic.done");
            LLVMBuildCondBr(b,both(li,ri),integers,floats);
            LLVMPositionBuilderAtEnd(b,integers);
            auto value=i.op==_OP_ADD?LLVMBuildAdd(b,left,right,""):i.op==_OP_SUB?LLVMBuildSub(b,left,right,""):LLVMBuildMul(b,left,right,"");
            store(a,tag(OT_INTEGER),value);LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,floats);
            auto x=floatValue(lt,left),y=floatValue(rt,right);
            auto f=i.op==_OP_ADD?LLVMBuildFAdd(b,x,y,""):i.op==_OP_SUB?LLVMBuildFSub(b,x,y,""):LLVMBuildFMul(b,x,y,"");
            auto raw=LLVMBuildBitCast(b,f,sizeof(SQFloat)==8?i64:i32,"");
            if(sizeof(SQFloat)!=8)raw=LLVMBuildZExt(b,raw,i64,"");
            store(a,tag(OT_FLOAT),raw);LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,done);break;
        }
        case _OP_CMP:case _OP_JCMP: {
            if(i.op==_OP_JCMP && d==CMP_3W)return false;
            if(d!=CMP_G && d!=CMP_GE && d!=CMP_L && d!=CMP_LE && d!=CMP_3W)return false;
            int right=i.op==_OP_JCMP?a:r;
            guard(both(eq(type(c),tag(OT_INTEGER)),eq(type(right),tag(OT_INTEGER))),fallback);
            if(i.op==_OP_CMP)guard(scalar(a),fallback);
            auto x=bits(c),y=bits(right);
            if(d==CMP_3W){
                auto result=LLVMBuildSelect(b,eq(x,y),number(0),LLVMBuildSelect(b,LLVMBuildICmp(b,LLVMIntSLT,x,y,""),number(-1),number(1),""),"");
                store(a,tag(OT_INTEGER),result);break;
            }
            LLVMIntPredicate pred=d==CMP_G?LLVMIntSGT:d==CMP_GE?LLVMIntSGE:d==CMP_L?LLVMIntSLT:LLVMIntSLE;
            auto result=LLVMBuildICmp(b,pred,x,y,"");
            if(i.op==_OP_JCMP){tick();LLVMBuildCondBr(b,result,next,jump);return true;}
            store(a,tag(OT_BOOL),LLVMBuildZExt(b,result,i64,""));break;
        }
        default:return false;
        }
        tick();LLVMBuildBr(b,next);return true;
    }
};

std::unique_ptr<Code> lower(SQFunctionProto *p,const std::vector<Observation> *observed=nullptr){
    static std::once_flag once;
    std::call_once(once,[]{if(LLVMInitializeNativeTarget()||LLVMInitializeNativeAsmPrinter())throw std::runtime_error("LLVM native target unavailable");});
    std::unique_ptr<Code> code(new Code);
    checked(LLVMOrcCreateLLJIT(&code->jit,nullptr));
    if(observed)code->observed=*observed;
    IR ir;auto ctx=ir.ctx;auto b=ir.builder;
    LLVMSetTarget(ir.module,LLVMOrcLLJITGetTripleString(code->jit));
    LLVMSetDataLayout(ir.module,LLVMOrcLLJITGetDataLayoutStr(code->jit));
    auto i32=LLVMInt32TypeInContext(ctx);auto ptr=LLVMPointerTypeInContext(ctx,0);
    static_assert(sizeof(SQInteger)==8 && sizeof(SQObjectType)==4 && sizeof(SQObjectValue)==8,"LLVM scalar ABI requires 64-bit Squirrel");
    LLVMTypeRef helperArgs[]={ptr,i32};auto helperType=LLVMFunctionType(i32,helperArgs,2,false);
    LLVMTypeRef args[]={ptr,i32,ptr,LLVMInt64TypeInContext(ctx),ptr};auto type=LLVMFunctionType(i32,args,5,false);
    auto fn=LLVMAddFunction(ir.module,"boxed_entry",type);
    auto entry=LLVMAppendBasicBlockInContext(ctx,fn,"entry");
    auto error=LLVMAppendBasicBlockInContext(ctx,fn,"error");
    std::vector<LLVMBasicBlockRef> blocks;
    for(int n=0;n<p->_ninstructions;++n)blocks.push_back(LLVMAppendBasicBlockInContext(ctx,fn,"op"));
    auto constant=[&](int n){return LLVMConstInt(i32,uint32_t(n),false);};
    LLVMPositionBuilderAtEnd(b,entry);Scalars scalar(ir,fn);
    if(observed)scalar.shadow_frame(p->_stacksize);
    auto flush=[&](int pc){
        auto count=LLVMBuildLoad2(b,scalar.i64,scalar.count,"");
        for(auto counter : {&code->operations,&code->direct_operations}) {
            auto address=LLVMConstIntToPtr(scalar.number(reinterpret_cast<uintptr_t>(counter)),ptr);
            auto old=LLVMBuildLoad2(b,scalar.i64,address,"");
            LLVMBuildStore(b,LLVMBuildAdd(b,old,count,""),address);
        }
        if(observed){
            auto address=LLVMConstIntToPtr(scalar.number(reinterpret_cast<uintptr_t>(&code->inlined_calls)),ptr);
            LLVMBuildStore(b,LLVMBuildAdd(b,LLVMBuildLoad2(b,scalar.i64,address,""),LLVMBuildLoad2(b,scalar.i64,scalar.inlined,""),""),address);
            auto prepared_address=LLVMConstIntToPtr(scalar.number(reinterpret_cast<uintptr_t>(&code->prepared_calls)),ptr);
            LLVMBuildStore(b,LLVMBuildAdd(b,LLVMBuildLoad2(b,scalar.i64,prepared_address,""),LLVMBuildLoad2(b,scalar.i64,scalar.prepared,""),""),prepared_address);
            scalar.flush(p->_nparameters,pc);
        }
    };
    auto finish=[&](int pc){flush(pc);LLVMBuildRet(b,constant(pc));};
    LLVMPositionBuilderAtEnd(b,error);if(observed)LLVMBuildUnreachable(b);else finish(-1);
    LLVMPositionBuilderAtEnd(b,entry);
    if(observed)LLVMBuildBr(b,blocks[0]);
    else {
        auto dispatch=LLVMBuildSwitch(b,LLVMGetParam(fn,1),error,blocks.size());
        for(int n=0;n<(int)blocks.size();++n)LLVMAddCase(dispatch,constant(n),blocks[n]);
    }
    for(int n=0;n<(int)blocks.size();++n){
        auto ins=p->_instructions[n];LLVMPositionBuilderAtEnd(b,blocks[n]);
        auto target=[&](int at){if(at<0||at>=(int)blocks.size())throw std::runtime_error("invalid bytecode branch");return blocks[at];};
        if(ins.op==_OP_JMP){LLVMBuildBr(b,target(n+1+ins._arg1));++code->lowered;continue;}
        auto fallback=LLVMAppendBasicBlockInContext(ctx,fn,"handoff");
        LLVMPositionBuilderAtEnd(b,fallback);finish(n);
        LLVMPositionBuilderAtEnd(b,blocks[n]);
        if(observed && ins.op==_OP_CALL){
            const Observation *found=nullptr;for(const auto &o:*observed)if(o.pc==n)found=&o;
            if(!found)throw std::runtime_error("missing kernel profile");
            if(prepared_method(*found))scalar.method_kernel(*found,size_t(found-observed->data()),ins,target(n+1),fallback,flush);
            else scalar.inline_kernel(*found,ins,target(n+1),fallback);
            ++code->lowered;++code->direct;continue;
        }
        if(observed && ins.op==_OP_PREPCALLK){
            const Observation *found=nullptr;for(const auto &o:*observed)if(o.prep==n)found=&o;
            if(!found)throw std::runtime_error("missing method profile");
            scalar.prepare_method(*found,ins,target(n+1),fallback);
            ++code->lowered;++code->direct;continue;
        }
        if(n+1<(int)blocks.size() && scalar.emit(p,ins,target(n+1),
            (ins.op==_OP_JCMP||ins.op==_OP_JZ)?target(n+1+ins._arg1):nullptr,fallback)) {
            ++code->lowered;++code->direct;continue;
        }
        if(observed && ins.op!=_OP_RETURN)throw std::runtime_error("fused tier cannot call a boxed helper");
        auto h=helper(ins.op);
        if(!h){finish(n);continue;}
        ++code->lowered;
        LLVMValueRef values[]={LLVMGetParam(fn,0),constant(n)};
        auto address=LLVMConstIntToPtr(LLVMConstInt(LLVMInt64TypeInContext(ctx),reinterpret_cast<uintptr_t>(h),false),ptr);
        auto status=LLVMBuildCall2(b,helperType,address,values,2,"status");

        auto next=LLVMBuildSwitch(b,status,error,3);
        LLVMAddCase(next,constant(0),target(n+1));LLVMAddCase(next,constant(2),fallback);
        if(ins.op==_OP_JZ||ins.op==_OP_JCMP)LLVMAddCase(next,constant(1),target(n+1+ins._arg1));
    }
    char *message=nullptr;
    if(LLVMVerifyModule(ir.module,LLVMReturnStatusAction,&message)){std::string s(message);LLVMDisposeMessage(message);throw std::runtime_error(s);}
    LLVMDisposeMessage(message);
    auto options=LLVMCreatePassBuilderOptions();
    auto optimized=LLVMRunPasses(ir.module,"default<O2>",nullptr,options);
    LLVMDisposePassBuilderOptions(options);checked(optimized);
    if(std::getenv("SQGI_SQUIRREL_DUMP_IR"))LLVMDumpModule(ir.module);
    auto module=LLVMOrcCreateNewThreadSafeModule(ir.module,ir.ts);ir.module=nullptr;
    checked(LLVMOrcLLJITAddLLVMIRModule(code->jit,LLVMOrcLLJITGetMainJITDylib(code->jit),module));
    LLVMOrcExecutorAddress address;checked(LLVMOrcLLJITLookup(code->jit,&address,"boxed_entry"));
    code->entry=reinterpret_cast<int(*)(SQVM*,int,SQObjectPtr**,SQInteger,Invocation*)>(uintptr_t(address));return code;
}
int enter(SQVM *v,int pc){
    auto *p=_closure(v->ci->_closure)->_function;
    auto *code=static_cast<Code*>(p->_llvm_code);++code->entries;
    if(pc==0 && !code->attempted && code->entries>=2){
        code->attempted=true;
        if(can_fuse(p,code->observed))try{code->fused=lower(p,&code->observed);}catch(const std::exception &e){ if(std::getenv("SQGI_SQUIRREL_DUMP_IR"))fprintf(stderr,"fusion: %s\n",e.what()); }
    }
    Invocation invocation;
    if(pc==0 && code->fused && fused_guard(v,*code,invocation)){
        ++code->fused_entries;
        return code->fused->entry(v,pc,&v->_stack._vals,v->_stackbase,&invocation);
    }
    return code->entry(v,pc,&v->_stack._vals,v->_stackbase,nullptr);
}
SQFunctionProto *argument(HSQUIRRELVM v){HSQOBJECT o;if(SQ_FAILED(sq_getstackobj(v,2,&o))||sq_type(o)!=OT_CLOSURE)throw std::runtime_error("expected a Squirrel closure");return _closure(o)->_function;}
SQInteger compile(HSQUIRRELVM v){try{auto *p=argument(v);if(!p->_llvm_code){auto code=lower(p);p->_llvm_code=code.release();p->_llvm_release=release;p->_llvm_entry=enter;}sq_push(v,2);return 1;}catch(const std::exception &e){return sq_throwerror(v,e.what());}}
void integer(HSQUIRRELVM v,const char *name,SQInteger value){sq_pushstring(v,name,-1);sq_pushinteger(v,value);sq_newslot(v,-3,SQFalse);}
SQInteger info(HSQUIRRELVM v){
    try {
        auto *p=argument(v);auto *c=static_cast<Code*>(p->_llvm_code);
        auto *fused=c?c->fused.get():nullptr;
        sq_newtable(v);
        integer(v,"entries",c?c->entries:0);
        integer(v,"operations",(c?c->operations:0)+(fused?fused->operations:0));
        integer(v,"leaf_calls",c?c->leaf_calls:0);
        integer(v,"lowered",c?c->lowered:0);
        integer(v,"instructions",p->_ninstructions);
        integer(v,"direct",c?c->direct:0);
        integer(v,"direct_operations",(c?c->direct_operations:0)+(fused?fused->direct_operations:0));
        integer(v,"fused_entries",c?c->fused_entries:0);
        integer(v,"inlined_calls",fused?fused->inlined_calls:0);
        integer(v,"prepared_calls",fused?fused->prepared_calls:0);
        return 1;
    }catch(const std::exception &e){return sq_throwerror(v,e.what());}
}
}
extern "C" void sqgi_llvm_register(HSQUIRRELVM v){
    sq_pushroottable(v);sq_pushstring(v,"sqgi",-1);
    if(SQ_FAILED(sq_rawget(v,-2))){sq_poptop(v);return;}
    sq_pushstring(v,"llvm",-1);sq_newtable(v);
    sq_pushstring(v,"compile",-1);sq_newclosure(v,compile,0);sq_newslot(v,-3,SQFalse);
    sq_pushstring(v,"info",-1);sq_newclosure(v,info,0);sq_newslot(v,-3,SQFalse);
    sq_newslot(v,-3,SQFalse);sq_pop(v,2);
}
