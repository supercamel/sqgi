// LLVM 18 C API keeps the dependency isolated from SQGI's C++11 runtime.
#include "kernel.h"
#include "math.h"
#include <llvm-c/Analysis.h>
#include <llvm-c/Core.h>
#include <llvm-c/Error.h>
#include <llvm-c/LLJIT.h>
#include <llvm-c/Target.h>
#include <llvm-c/TargetMachine.h>
#include <llvm-c/Transforms/PassBuilder.h>
#include <cstddef>
#include <cstring>
#include <cstdlib>
#include <cstdio>
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
struct JitOwner {
    LLVMOrcLLJITRef jit=nullptr;
    char symbol_prefix=0;
    size_t object_bytes=0;
    ~JitOwner() { if(jit) if(auto error=LLVMOrcDisposeLLJIT(jit)) LLVMConsumeError(error); }
};
class Executable {
public:
    std::shared_ptr<JitOwner> owner;
    int (*entry)(Call*)=nullptr;
    bool floating=true;
    Status run(Call &call) const {return (Status)entry(&call);}
};
bool supported() {
#if defined(__x86_64__) || defined(_M_X64) || (defined(__aarch64__) && defined(__linux__))
    return true;
#else
    return false; // Other hosts need floating-environment and platform validation.
#endif
}
const char *backend_name() { return "llvm"; }
void lower(Module &m) {
    static_assert(offsetof(Call,result)==8 && offsetof(Call,fuel)==16 && offsetof(Call,error_line)==24 && offsetof(Call,error_function)==28 && sizeof(Call)==32,"kernel ABI requires 64-bit pointers");
    initialize();
    auto owner=std::make_shared<JitOwner>();
    checked(LLVMOrcCreateLLJIT(&owner->jit,nullptr));
    LLVMOrcObjectTransformLayerSetTransform(LLVMOrcLLJITGetObjTransformLayer(owner->jit),
        [](void *context,LLVMMemoryBufferRef *object)->LLVMErrorRef {
            auto &owner=*static_cast<JitOwner*>(context);
            size_t bytes=LLVMGetBufferSize(*object);
            // Object bytes include metadata, so this is a conservative emitted
            // object budget, not a claim about text or machine stack size.
            if(bytes>16*1024*1024-owner.object_bytes) {
                LLVMDisposeMemoryBuffer(*object);*object=nullptr;
                return LLVMCreateStringError("kernel module object budget exceeded (16777216 bytes)");
            }
            owner.object_bytes+=bytes;
            return LLVMErrorSuccess;
        },owner.get());
    // Optimizers/codegen may introduce memory helpers or Windows stack probes.
    // Resolve only compiler-runtime helpers; source kernels cannot call externs.
    owner->symbol_prefix=LLVMOrcLLJITGetGlobalPrefix(owner->jit);
    LLVMOrcDefinitionGeneratorRef runtime=nullptr;
    checked(LLVMOrcCreateDynamicLibrarySearchGeneratorForProcess(&runtime,
        owner->symbol_prefix,compiler_runtime_symbol,&owner->symbol_prefix));
    LLVMOrcJITDylibAddGenerator(LLVMOrcLLJITGetMainJITDylib(owner->jit),runtime);
    // Intrinsics may lower to these exact libm entry points on older CPUs.
    // Bind audited wrappers explicitly rather than widening process lookup.
    std::vector<LLVMOrcCSymbolMapPair> math_symbols;
    size_t math_count; const auto *catalog=math_builtins(math_count);
    for(size_t n=0;n<math_count;++n) {
        const auto &spec=catalog[n];
        if(!spec.intrinsic || !std::strcmp(spec.name,"abs")) continue;
        LLVMOrcCSymbolMapPair symbol{};
        symbol.Name=LLVMOrcLLJITMangleAndIntern(owner->jit,spec.name);
        symbol.Sym.Address=spec.binary?(uintptr_t)spec.binary:(uintptr_t)spec.unary;
        symbol.Sym.Flags.GenericFlags=LLVMJITSymbolGenericFlagsExported | LLVMJITSymbolGenericFlagsCallable;
        math_symbols.push_back(symbol);
    }
    auto symbols=LLVMOrcAbsoluteSymbols(math_symbols.data(),math_symbols.size());
    auto define_error=LLVMOrcJITDylibDefine(LLVMOrcLLJITGetMainJITDylib(owner->jit),symbols);
    if(define_error) { LLVMOrcDisposeMaterializationUnit(symbols); checked(define_error); }
    Lowering l;
    l.thread_context=LLVMOrcCreateNewThreadSafeContext();
    l.context=LLVMOrcThreadSafeContextGetContext(l.thread_context);
    l.module=LLVMModuleCreateWithNameInContext(m.filename.c_str(),l.context);
    l.builder=LLVMCreateBuilderInContext(l.context);
    auto b=l.builder;
    const char *triple=LLVMOrcLLJITGetTripleString(owner->jit);
    LLVMSetTarget(l.module,triple);
    LLVMSetDataLayout(l.module,LLVMOrcLLJITGetDataLayoutStr(owner->jit));
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
    std::vector<LLVMTypeRef> result_types;
    std::vector<LLVMValueRef> functions;
    std::vector<LLVMTypeRef> signatures;
    const bool noinline=std::getenv("SQGI_KERNEL_NOINLINE")!=nullptr;
    for(size_t index=0;index<m.functions.size();++index) {
        const auto &f=m.functions[index];
        std::vector<LLVMTypeRef> args;
        if(f.checked) args.push_back(ptr);
        for(const auto &p:f.parameters) args.push_back(p.borrowed()?ptr:p.type==Type::F64?fp:i64);
        for(const auto &p:f.parameters) if(p.dynamic) args.push_back(i64);
        LLVMTypeRef fields[]={i32,f.result==Type::F64?fp:i64};
        auto result_type=f.checked?LLVMStructTypeInContext(l.context,fields,2,false):
            f.result==Type::Void?LLVMVoidTypeInContext(l.context):fields[1];
        result_types.push_back(result_type);
        auto type=LLVMFunctionType(result_type,args.data(),args.size(),false);
        auto function=LLVMAddFunction(l.module,("kernel.body."+std::to_string(index)).c_str(),type);
        LLVMSetLinkage(function,LLVMInternalLinkage);
        if(noinline) LLVMAddAttributeAtIndex(function,LLVMAttributeFunctionIndex,
            LLVMCreateEnumAttribute(l.context,LLVMGetEnumAttributeKindForName("noinline",8),0));
        functions.push_back(function); signatures.push_back(type);
    }
    for(size_t index=0;index<m.functions.size();++index) {
    const auto &f=m.functions[index];
    // Emit the public ABI directly from the same IR. Keeping a checked-return
    // aggregate shim around the hot entry inhibited loop optimizations and
    // added tiny-call overhead. Private helper bodies still use typed calls.
    for(bool public_entry: {false,true}) {
    auto function=public_entry?LLVMAddFunction(l.module,("kernel.entry."+std::to_string(index)).c_str(),fn_type):functions[index];
    auto result_type=result_types[index];
    auto ctx=(public_entry || f.checked)?LLVMGetParam(function,0):nullptr;
    auto entry=LLVMAppendBasicBlockInContext(l.context,function,"entry");
    LLVMPositionBuilderAtEnd(b,entry);
    std::vector<LLVMValueRef> storage;
    for(const auto &region:f.local_storage)
        storage.push_back(LLVMBuildArrayAlloca(b,i64,constant(region.cells),"local.storage"));
    std::vector<LLVMValueRef> slots(f.slots,nullptr);
    for(int n=0;n<f.slots;++n) slots[n]=LLVMBuildAlloca(b,f.slot_types[n]==Type::F64?fp:i64,"slot");
    auto fuel=LLVMBuildAlloca(b,i64,"fuel");
    auto field=[&](unsigned n) {auto offset=constant(n);return LLVMBuildGEP2(b,i64,ctx,&offset,1,"context.field");};
    auto fuel_field=ctx?field(2):nullptr,line_field=ctx?field(3):nullptr;
    if(ctx) LLVMBuildStore(b,LLVMBuildLoad2(b,i64,fuel_field,"initial.fuel"),fuel);
    auto public_args=public_entry?LLVMBuildLoad2(b,ptr,ctx,"arguments"):nullptr;
    for(size_t n=0;n<f.argument_slots();++n) {
        LLVMValueRef value=nullptr;
        if(public_entry) {
            auto offset=constant(n);auto address=LLVMBuildGEP2(b,i64,public_args,&offset,1,"argument");
            value=LLVMBuildLoad2(b,i64,address,"argument.value");
        } else value=LLVMGetParam(function,n+(f.checked?1:0));
        if(!public_entry && n<f.parameters.size()) {
            const auto &p=f.parameters[n];
            if(p.borrowed()) value=LLVMBuildPtrToInt(b,value,i64,"argument.bits");
            else if(p.type==Type::F64) value=LLVMBuildBitCast(b,value,i64,"argument.bits");
        }
        if(f.slot_types[n]==Type::F64) value=LLVMBuildBitCast(b,value,fp,"argument.float");
        LLVMBuildStore(b,value,slots[n]);
    }
    std::vector<LLVMBasicBlockRef> blocks;
    for(size_t n=0;n<=f.code.size();++n) blocks.push_back(LLVMAppendBasicBlockInContext(l.context,function,("instruction."+std::to_string(n)).c_str()));
    LLVMBuildBr(b,blocks[0]);
    auto load=[&](int s){
        auto value=LLVMBuildLoad2(b,f.slot_types.at(s)==Type::F64?fp:i64,slots.at(s),"value");
        return f.slot_types[s]==Type::F64?LLVMBuildBitCast(b,value,i64,"bits"):value;
    };
    auto real=[&](LLVMValueRef v){return LLVMBuildBitCast(b,v,fp,"float");};
    auto boolean=[&](LLVMValueRef v){return LLVMBuildICmp(b,LLVMIntNE,v,constant(0),"condition");};
    auto finish=[&](Status status,int line,LLVMValueRef value) {
        if(!public_entry && !f.checked) {
            if(status!=Success) {LLVMBuildUnreachable(b);return;}
            if(f.result==Type::Void) LLVMBuildRetVoid(b);
            else LLVMBuildRet(b,f.result==Type::F64?real(value):value);
            return;
        }
        if(status!=Success) {
            uint32_t location[]={uint32_t(line),uint32_t(index)};
            uint64_t packed;std::memcpy(&packed,location,sizeof(packed));
            LLVMBuildStore(b,constant(packed),line_field);
        }
        if(public_entry) {
            if(status==Success && value) LLVMBuildStore(b,value,field(1));
            LLVMBuildStore(b,LLVMBuildLoad2(b,i64,fuel,"remaining.fuel"),fuel_field);
            LLVMBuildRet(b,LLVMConstInt(i32,status,false));return;
        }
        LLVMBuildStore(b,LLVMBuildLoad2(b,i64,fuel,"remaining.fuel"),fuel_field);
        auto result=LLVMBuildInsertValue(b,LLVMGetUndef(result_type),LLVMConstInt(i32,status,false),0,"status");
        auto returned=value?value:constant(0);
        if(f.result==Type::F64) returned=real(returned);
        result=LLVMBuildInsertValue(b,result,returned,1,"result");
        LLVMBuildRet(b,result);
    };
    auto guard=[&](LLVMValueRef condition,Status status,int line) {
        auto okay=LLVMAppendBasicBlockInContext(l.context,function,"checked");
        auto failed=LLVMAppendBasicBlockInContext(l.context,function,"error");
        LLVMBuildCondBr(b,condition,okay,failed);
        LLVMPositionBuilderAtEnd(b,failed); finish(status,line,nullptr);
        LLVMPositionBuilderAtEnd(b,okay);
    };
    for(size_t pc=0;pc<f.code.size();++pc) {
        const auto &i=f.code[pc];
        LLVMPositionBuilderAtEnd(b,blocks[pc]);
        LLVMValueRef a=i.a>=0?load(i.a):nullptr,c=i.b>=0?load(i.b):nullptr,out=nullptr;
        switch(i.op) {
        case Op::Constant:out=constant(i.immediate);break;
        case Op::Copy:out=a;break;
        case Op::LocalAddress:out=LLVMBuildPtrToInt(b,storage.at(i.immediate),i64,"local.address");break;
        case Op::LocalZero:
            LLVMBuildMemSet(b,storage.at(i.immediate),LLVMConstInt(LLVMInt8TypeInContext(l.context),0,false),constant(f.local_storage.at(i.immediate).cells*8),8);break;
        case Op::Call: {
            const auto &site=f.calls.at(i.immediate);
            const auto &callee=m.functions.at(site.function);
            std::vector<LLVMValueRef> arguments;
            if(callee.checked) arguments.push_back(ctx);
            for(size_t n=0;n<site.arguments.size();++n) {
                auto value=load(site.arguments[n]);
                if(n<callee.parameters.size()) {
                    const auto &p=callee.parameters[n];
                    if(p.borrowed()) value=LLVMBuildIntToPtr(b,value,ptr,"call.pointer");
                    else if(p.type==Type::F64) value=real(value);
                }
                arguments.push_back(value);
            }
            if(callee.checked) LLVMBuildStore(b,LLVMBuildLoad2(b,i64,fuel,"remaining.fuel"),fuel_field);
            auto result=LLVMBuildCall2(b,signatures[site.function],functions[site.function],arguments.data(),arguments.size(),
                !callee.checked && callee.result==Type::Void?"":"helper");
            if(!callee.checked) {
                if(i.dst>=0) out=i.type==Type::F64?LLVMBuildBitCast(b,result,i64,"helper.bits"):result;
                break;
            }
            LLVMBuildStore(b,LLVMBuildLoad2(b,i64,fuel_field,"callee.fuel"),fuel);
            auto status=LLVMBuildExtractValue(b,result,0,"helper.status");
            auto okay=LLVMAppendBasicBlockInContext(l.context,function,"helper.ok");
            auto failed=LLVMAppendBasicBlockInContext(l.context,function,"helper.failed");
            LLVMBuildCondBr(b,LLVMBuildICmp(b,LLVMIntEQ,status,LLVMConstInt(i32,Success,false),"success"),okay,failed);
            LLVMPositionBuilderAtEnd(b,failed);
            if(public_entry) LLVMBuildRet(b,status);
            else {
                auto failure=LLVMBuildInsertValue(b,LLVMConstNull(result_type),status,0,"propagate.error");
                LLVMBuildRet(b,failure);
            }
            LLVMPositionBuilderAtEnd(b,okay);
            if(i.dst>=0) {
                out=LLVMBuildExtractValue(b,result,1,"helper.value");
                if(i.type==Type::F64) out=LLVMBuildBitCast(b,out,i64,"helper.bits");
            }
            break;
        }
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
        case Op::Rem: {
            guard(LLVMBuildICmp(b,LLVMIntNE,c,constant(0),"nonzero"),ArithmeticError,i.line);
            // LLVM srem(INT64_MIN,-1) is poison. Remainder by -1 is always
            // zero, so use +1 instead, including if optimization speculates.
            auto minus_one=LLVMBuildICmp(b,LLVMIntEQ,c,constant(UINT64_MAX),"minus.one");
            auto divisor=LLVMBuildSelect(b,minus_one,constant(1),c,"remainder.divisor");
            out=LLVMBuildSRem(b,a,divisor,"remainder");
            break;
        }
        case Op::Math: {
            const auto &spec=math_builtin(i.immediate);
            LLVMTypeRef args_type[]={fp,fp};
            auto result_type=spec.predicate?LLVMInt1TypeInContext(l.context):fp;
            auto type=LLVMFunctionType(result_type,args_type,spec.arity(),false);
            LLVMValueRef callee=nullptr;
            if(spec.intrinsic) {
                callee=LLVMGetNamedFunction(l.module,spec.intrinsic);
                if(!callee) callee=LLVMAddFunction(l.module,spec.intrinsic,type);
            } else {
                uintptr_t address=spec.unary?(uintptr_t)spec.unary:
                    spec.binary?(uintptr_t)spec.binary:(uintptr_t)spec.predicate;
                callee=LLVMConstIntToPtr(constant(address),ptr);
            }
            LLVMValueRef args[]={real(a),spec.binary?real(c):nullptr};
            auto result=LLVMBuildCall2(b,type,callee,args,spec.arity(),"math.result");
            out=spec.predicate?LLVMBuildZExt(b,result,i64,"math.bool"):
                LLVMBuildBitCast(b,result,i64,"math.bits");
            break;
        }
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
        case Op::Bounds:guard(LLVMBuildICmp(b,LLVMIntULT,a,i.b>=0?c:constant(i.immediate),"in.bounds"),BoundsError,i.line);break;
        case Op::Require:guard(boolean(a),RequirementError,i.line);break;
        case Op::Tick: {
            auto remaining=LLVMBuildLoad2(b,i64,fuel,"fuel");
            guard(boolean(remaining),BudgetError,i.line);
            LLVMBuildStore(b,LLVMBuildSub(b,remaining,constant(1),"consume.fuel"),fuel);break;
        }
        case Op::Jump:LLVMBuildBr(b,blocks.at(i.immediate));break;
        case Op::JumpFalse:LLVMBuildCondBr(b,boolean(a),blocks[pc+1],blocks.at(i.immediate));break;
        case Op::Return:
            finish(Success,0,i.type!=Type::Void?a:nullptr);break;
        }
        if(out) {if(f.slot_types.at(i.dst)==Type::F64) out=real(out); LLVMBuildStore(b,out,slots.at(i.dst));}
        if(!LLVMGetBasicBlockTerminator(LLVMGetInsertBlock(b))) LLVMBuildBr(b,blocks[pc+1]);
    }
    LLVMPositionBuilderAtEnd(b,blocks.back());finish(RequirementError,0,nullptr);
    }
    }
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
    for(auto function=LLVMGetFirstFunction(l.module);function;function=LLVMGetNextFunction(function))
        for(auto block=LLVMGetFirstBasicBlock(function);block;block=LLVMGetNextBasicBlock(block))
            for(auto instruction=LLVMGetFirstInstruction(block);instruction;instruction=LLVMGetNextInstruction(instruction)) ++m.stats.llvm_instructions;
    if(std::getenv("SQGI_KERNEL_DUMP_IR")) {
        char *ir=LLVMPrintModuleToString(l.module);
        std::fprintf(stderr,"; kernel function: %s\n%s\n",m.filename.c_str(),ir);
        LLVMDisposeMessage(ir);
    }
    auto safe_module=LLVMOrcCreateNewThreadSafeModule(l.module,l.thread_context);
    l.module=nullptr; // ownership transfers to the JIT, including error paths
    checked(LLVMOrcLLJITAddLLVMIRModule(owner->jit,LLVMOrcLLJITGetMainJITDylib(owner->jit),safe_module));
    std::vector<std::shared_ptr<Executable>> entries;
    for(size_t index=0;index<m.functions.size();++index) {
        LLVMOrcExecutorAddress address=0;
        checked(LLVMOrcLLJITLookup(owner->jit,&address,("kernel.entry."+std::to_string(index)).c_str()));
        auto executable=std::make_shared<Executable>();
        executable->owner=owner;
        executable->floating=uses_floating_environment(m.functions[index]);
        executable->entry=(int(*)(Call*))(uintptr_t)address;
        entries.push_back(std::move(executable));
    }
    m.stats.object_bytes=owner->object_bytes;
    m.native=std::move(entries);
}

PreparedCall prepare(const Module &m,size_t index) {
    const auto &native=m.native.at(index);
    return {native->entry,native->floating};
}
Status execute(const Module &m,size_t index,Call &call) {return execute(prepare(m,index),call);}
Status execute(PreparedCall prepared,Call &call) {
#if defined(__x86_64__) || defined(_M_X64)
    if(!prepared.floating)return (Status)prepared.entry(&call);
    unsigned old=_mm_getcsr();
    _mm_setcsr((old & ~unsigned(0xe040)) | 0x1f80);
    Status result=(Status)prepared.entry(&call);_mm_setcsr(old);return result;
#elif defined(__aarch64__) && defined(__linux__)
    if(!prepared.floating)return (Status)prepared.entry(&call);
    // Kernels promise a normalized FP environment, unlike speculative
    // bytecode entries which decline non-default host controls. Restore both
    // controls and accumulated status on success, checked errors and unwinding.
    struct FloatingState {
        uint64_t control, status;
        FloatingState() {
            __asm__ __volatile__("mrs %0, fpcr\n\tmrs %1, fpsr"
                : "=r"(control), "=r"(status) : : "memory");
            __asm__ __volatile__("msr fpcr, xzr\n\tmsr fpsr, xzr" : : : "memory");
        }
        ~FloatingState() {
            __asm__ __volatile__("msr fpcr, %0\n\tmsr fpsr, %1"
                : : "r"(control), "r"(status) : "memory");
        }
    } state;
    return (Status)prepared.entry(&call);
#else
    (void)prepared;(void)call;
    throw std::runtime_error("kernel LLVM host not yet validated");
#endif
}
}
