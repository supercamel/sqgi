// LLVM 18 C API keeps the dependency isolated from SQGI's C++11 runtime.
#include "kernel.h"
#include <llvm-c/Analysis.h>
#include <llvm-c/Core.h>
#include <llvm-c/Error.h>
#include <llvm-c/LLJIT.h>
#include <llvm-c/Target.h>
#include <llvm-c/TargetMachine.h>
#include <llvm-c/Transforms/PassBuilder.h>
#include <cstddef>
#include <cstring>
#include <mutex>
#if defined(__x86_64__) || defined(_M_X64)
#include <xmmintrin.h>
#endif

namespace sqkernel {
namespace {
void checked(LLVMErrorRef error) {
    if(!error) return;
    char *text=LLVMGetErrorMessage(error);
    std::string message=text; LLVMDisposeErrorMessage(text);
    throw std::runtime_error("kernel LLVM: "+message);
}
void initialize() {
    static std::once_flag flag;
    std::call_once(flag,[] {
        unsigned major=0,minor=0,patch=0;
        LLVMGetVersion(&major,&minor,&patch);
        if(major!=18) throw std::runtime_error("kernel backend requires LLVM 18 runtime");
        if(LLVMInitializeNativeTarget() || LLVMInitializeNativeAsmPrinter())
            throw std::runtime_error("kernel LLVM native target unavailable");
    });
}
LLVMBool compiler_runtime_symbol(void *prefix,LLVMOrcSymbolStringPoolEntryRef symbol) {
    const char *name=LLVMOrcSymbolStringPoolEntryStr(symbol);
    if(*(const char*)prefix && name[0]==*(const char*)prefix) ++name;
    return !std::strcmp(name,"memcpy") || !std::strcmp(name,"memmove") ||
           !std::strcmp(name,"memset") || !std::strcmp(name,"__chkstk");
}
struct Lowering {
    LLVMOrcThreadSafeContextRef thread_context=nullptr;
    LLVMContextRef context=nullptr;
    LLVMModuleRef module=nullptr;
    LLVMBuilderRef builder=nullptr;
    LLVMTargetMachineRef machine=nullptr;
    LLVMPassBuilderOptionsRef passes=nullptr;
    ~Lowering() {
        if(passes) LLVMDisposePassBuilderOptions(passes);
        if(machine) LLVMDisposeTargetMachine(machine);
        if(builder) LLVMDisposeBuilder(builder);
        if(module) LLVMDisposeModule(module);
        if(thread_context) LLVMOrcDisposeThreadSafeContext(thread_context);
    }
};
}
class Executable {
public:
    LLVMOrcLLJITRef jit=nullptr;
    char symbol_prefix=0;
    int (*entry)(Call*)=nullptr;
    ~Executable() { if(jit) if(auto error=LLVMOrcDisposeLLJIT(jit)) LLVMConsumeError(error); }
    Status run(Call &call) const {return (Status)entry(&call);}
};
bool supported() {
#if defined(__x86_64__) || defined(_M_X64)
    return true;
#else
    return false; // Other hosts need floating-environment and platform validation.
#endif
}
const char *backend_name() { return "llvm"; }
std::shared_ptr<Executable> lower(const Function &f) {
    static_assert(offsetof(Call,result)==8 && offsetof(Call,fuel)==16 && offsetof(Call,error_line)==24,"kernel ABI requires 64-bit pointers");
    initialize();
    auto executable=std::make_shared<Executable>();
    checked(LLVMOrcCreateLLJIT(&executable->jit,nullptr));
    // Optimizers/codegen may introduce memory helpers or Windows stack probes.
    // Resolve only compiler-runtime helpers; source kernels cannot call externs.
    executable->symbol_prefix=LLVMOrcLLJITGetGlobalPrefix(executable->jit);
    LLVMOrcDefinitionGeneratorRef runtime=nullptr;
    checked(LLVMOrcCreateDynamicLibrarySearchGeneratorForProcess(&runtime,
        executable->symbol_prefix,compiler_runtime_symbol,&executable->symbol_prefix));
    LLVMOrcJITDylibAddGenerator(LLVMOrcLLJITGetMainJITDylib(executable->jit),runtime);
    Lowering l;
    l.thread_context=LLVMOrcCreateNewThreadSafeContext();
    l.context=LLVMOrcThreadSafeContextGetContext(l.thread_context);
    l.module=LLVMModuleCreateWithNameInContext(f.name.c_str(),l.context);
    l.builder=LLVMCreateBuilderInContext(l.context);
    auto b=l.builder;
    const char *triple=LLVMOrcLLJITGetTripleString(executable->jit);
    LLVMSetTarget(l.module,triple);
    LLVMSetDataLayout(l.module,LLVMOrcLLJITGetDataLayoutStr(executable->jit));
    LLVMTargetRef target=nullptr; char *error=nullptr;
    if(LLVMGetTargetFromTriple(triple,&target,&error)) {
        std::string message=error; LLVMDisposeMessage(error); throw std::runtime_error(message);
    }
    char *cpu=LLVMGetHostCPUName(),*features=LLVMGetHostCPUFeatures();
    l.machine=LLVMCreateTargetMachine(target,triple,cpu,features,LLVMCodeGenLevelAggressive,LLVMRelocDefault,LLVMCodeModelJITDefault);
    LLVMDisposeMessage(cpu); LLVMDisposeMessage(features);
    if(!l.machine) throw std::runtime_error("kernel LLVM target-machine creation failed");
    auto i64=LLVMInt64TypeInContext(l.context),i32=LLVMInt32TypeInContext(l.context);
    auto fp=LLVMDoubleTypeInContext(l.context),ptr=LLVMPointerTypeInContext(l.context,0);
    auto constant=[&](uint64_t value){return LLVMConstInt(i64,value,false);};
    auto fn_type=LLVMFunctionType(i32,&ptr,1,false);
    auto function=LLVMAddFunction(l.module,"kernel_entry",fn_type);
    auto ctx=LLVMGetParam(function,0);
    auto entry=LLVMAppendBasicBlockInContext(l.context,function,"entry");
    LLVMPositionBuilderAtEnd(b,entry);
    std::vector<LLVMValueRef> slots;
    for(int n=0;n<f.slots;++n) slots.push_back(LLVMBuildAlloca(b,i64,"slot"));
    auto fuel=LLVMBuildAlloca(b,i64,"fuel");
    auto field=[&](unsigned n) {auto offset=constant(n);return LLVMBuildGEP2(b,i64,ctx,&offset,1,"context.field");};
    auto fuel_field=field(2),result_field=field(1),line_field=field(3);
    LLVMBuildStore(b,LLVMBuildLoad2(b,i64,fuel_field,"initial.fuel"),fuel);
    auto args=LLVMBuildLoad2(b,ptr,field(0),"arguments");
    for(size_t n=0;n<f.parameters.size();++n) {
        auto offset=constant(n),address=LLVMBuildGEP2(b,i64,args,&offset,1,"argument");
        LLVMBuildStore(b,LLVMBuildLoad2(b,i64,address,"value"),slots[n]);
    }
    std::vector<LLVMBasicBlockRef> blocks;
    for(size_t n=0;n<=f.code.size();++n) blocks.push_back(LLVMAppendBasicBlockInContext(l.context,function,("instruction."+std::to_string(n)).c_str()));
    LLVMBuildBr(b,blocks[0]);
    auto load=[&](int s){return LLVMBuildLoad2(b,i64,slots.at(s),"value");};
    auto real=[&](LLVMValueRef v){return LLVMBuildBitCast(b,v,fp,"float");};
    auto boolean=[&](LLVMValueRef v){return LLVMBuildICmp(b,LLVMIntNE,v,constant(0),"condition");};
    auto finish=[&](Status status,int line) {
        if(status!=Success) LLVMBuildStore(b,constant(line),line_field);
        LLVMBuildStore(b,LLVMBuildLoad2(b,i64,fuel,"remaining.fuel"),fuel_field);
        LLVMBuildRet(b,LLVMConstInt(i32,status,false));
    };
    auto guard=[&](LLVMValueRef condition,Status status,int line) {
        auto okay=LLVMAppendBasicBlockInContext(l.context,function,"checked");
        auto failed=LLVMAppendBasicBlockInContext(l.context,function,"error");
        LLVMBuildCondBr(b,condition,okay,failed);
        LLVMPositionBuilderAtEnd(b,failed); finish(status,line);
        LLVMPositionBuilderAtEnd(b,okay);
    };
    for(size_t pc=0;pc<f.code.size();++pc) {
        const auto &i=f.code[pc];
        LLVMPositionBuilderAtEnd(b,blocks[pc]);
        LLVMValueRef a=i.a>=0?load(i.a):nullptr,c=i.b>=0?load(i.b):nullptr,out=nullptr;
        switch(i.op) {
        case Op::Constant:out=constant(i.immediate);break;
        case Op::Copy:out=a;break;
        case Op::Add:case Op::Sub:case Op::Mul:case Op::Div:
            if(i.type==Type::F64) {
                auto x=real(a),y=real(c);
                if(i.op==Op::Add) out=LLVMBuildFAdd(b,x,y,"add");
                else if(i.op==Op::Sub) out=LLVMBuildFSub(b,x,y,"subtract");
                else if(i.op==Op::Mul) out=LLVMBuildFMul(b,x,y,"multiply");
                else out=LLVMBuildFDiv(b,x,y,"divide");
                out=LLVMBuildBitCast(b,out,i64,"bits");
            } else {
                if(i.op==Op::Add) out=LLVMBuildAdd(b,a,c,"add");
                else if(i.op==Op::Sub) out=LLVMBuildSub(b,a,c,"subtract");
                else if(i.op==Op::Mul) out=LLVMBuildMul(b,a,c,"multiply");
                else {
                    auto nonzero=LLVMBuildICmp(b,LLVMIntNE,c,constant(0),"nonzero");
                    auto minimum=LLVMBuildICmp(b,LLVMIntEQ,a,constant(uint64_t(1)<<63),"minimum");
                    auto minus_one=LLVMBuildICmp(b,LLVMIntEQ,c,constant(UINT64_MAX),"minus.one");
                    auto overflow=LLVMBuildAnd(b,minimum,minus_one,"overflow");
                    guard(LLVMBuildAnd(b,nonzero,LLVMBuildNot(b,overflow,"no.overflow"),"valid"),ArithmeticError,i.line);
                    out=LLVMBuildSDiv(b,a,c,"divide");
                }
            } break;
        case Op::Neg:
            out=i.type==Type::F64?LLVMBuildXor(b,a,constant(uint64_t(1)<<63),"negate.sign"):LLVMBuildNeg(b,a,"negate");break;
        case Op::Eq:case Op::Ne:case Op::Lt:case Op::Le:case Op::Gt:case Op::Ge:
            if(i.type==Type::F64) {
                LLVMRealPredicate p=i.op==Op::Eq?LLVMRealOEQ:i.op==Op::Ne?LLVMRealUNE:i.op==Op::Lt?LLVMRealOLT:i.op==Op::Le?LLVMRealOLE:i.op==Op::Gt?LLVMRealOGT:LLVMRealOGE;
                out=LLVMBuildFCmp(b,p,real(a),real(c),"compare");
            } else {
                LLVMIntPredicate p=i.op==Op::Eq?LLVMIntEQ:i.op==Op::Ne?LLVMIntNE:i.op==Op::Lt?LLVMIntSLT:i.op==Op::Le?LLVMIntSLE:i.op==Op::Gt?LLVMIntSGT:LLVMIntSGE;
                out=LLVMBuildICmp(b,p,a,c,"compare");
            }
            out=LLVMBuildZExt(b,out,i64,"bool");break;
        case Op::Load:case Op::Store: {
            auto base=LLVMBuildIntToPtr(b,a,ptr,"array");
            auto address=LLVMBuildGEP2(b,i64,base,&c,1,"element");
            if(i.op==Op::Load) out=LLVMBuildLoad2(b,i64,address,"element.value");
            else LLVMBuildStore(b,load(i.dst),address);
            break;
        }
        case Op::Bounds:guard(LLVMBuildICmp(b,LLVMIntULT,a,constant(i.immediate),"in.bounds"),BoundsError,i.line);break;
        case Op::Require:guard(boolean(a),RequirementError,i.line);break;
        case Op::Tick: {
            auto remaining=LLVMBuildLoad2(b,i64,fuel,"fuel");
            guard(boolean(remaining),BudgetError,i.line);
            LLVMBuildStore(b,LLVMBuildSub(b,remaining,constant(1),"consume.fuel"),fuel);break;
        }
        case Op::Jump:LLVMBuildBr(b,blocks.at(i.immediate));break;
        case Op::JumpFalse:LLVMBuildCondBr(b,boolean(a),blocks[pc+1],blocks.at(i.immediate));break;
        case Op::Return:
            if(i.type!=Type::Void) LLVMBuildStore(b,a,result_field);
            finish(Success,0);break;
        }
        if(out) LLVMBuildStore(b,out,slots.at(i.dst));
        if(!LLVMGetBasicBlockTerminator(LLVMGetInsertBlock(b))) LLVMBuildBr(b,blocks[pc+1]);
    }
    LLVMPositionBuilderAtEnd(b,blocks.back());finish(RequirementError,0);
    auto verify=[&] {
        char *message=nullptr;
        if(LLVMVerifyModule(l.module,LLVMReturnStatusAction,&message)) {
            std::string text=message;LLVMDisposeMessage(message);throw std::runtime_error("invalid kernel LLVM IR: "+text);
        }
        LLVMDisposeMessage(message);
    };
    verify();
    l.passes=LLVMCreatePassBuilderOptions();
    checked(LLVMRunPasses(l.module,"default<O3>",l.machine,l.passes));
    verify();
    auto safe_module=LLVMOrcCreateNewThreadSafeModule(l.module,l.thread_context);
    l.module=nullptr; // ownership transfers to the JIT, including error paths
    checked(LLVMOrcLLJITAddLLVMIRModule(executable->jit,LLVMOrcLLJITGetMainJITDylib(executable->jit),safe_module));
    LLVMOrcExecutorAddress address=0;
    checked(LLVMOrcLLJITLookup(executable->jit,&address,"kernel_entry"));
    executable->entry=(int(*)(Call*))(uintptr_t)address;
    return executable;
}
Status execute(const Module &m,size_t index,Call &call) {
#if defined(__x86_64__) || defined(_M_X64)
    const auto &native=m.native.at(index);
    unsigned old=_mm_getcsr();
    _mm_setcsr((old & ~unsigned(0xe040)) | 0x1f80);
    Status result=native->run(call);_mm_setcsr(old);return result;
#else
    (void)m;(void)index;(void)call;
    throw std::runtime_error("kernel LLVM host not yet validated");
#endif
}
}
