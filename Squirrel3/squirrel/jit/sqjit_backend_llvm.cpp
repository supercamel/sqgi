/* LLVM lowering of the shared scalar plan, including whole-function loops.
 * No VM state is written until return: every failed guard can safely replay.
 */
#include "sqpcheader.h"
#include "sqvm.h"
#include "sqfuncproto.h"
#include "sqclosure.h"
#include "sqtable.h"
#include "sqjit_scalar_inline.h"
#include "sqjit_local_array.h"
#include "sqjit_local_graph.h"
#include "sqjit_numeric.h"
#include "sqjit_numeric_ops.h"
#include "sqjit_dynamic_array.h"
#include "sqjit_object_inline.h"
#include "sqjit_intrinsics.h"
#include "sqjit_llvm_objects.h"
#include "sqjit_backend.h"
#include "sqjit_leaf.h"
#include "sqjit_context.h"
#include "sqjit.h"
#include "sqjit_write_log.h"
#include <llvm-c/Analysis.h>
#include <llvm-c/Core.h>
#include <llvm-c/Error.h>
#include <llvm-c/LLJIT.h>
#include <llvm-c/Target.h>
#include <llvm-c/Transforms/PassBuilder.h>
#include <cstddef>
#include <cstdint>
#include <memory>
#include <mutex>
#include <stdexcept>
#include <cstring>
#include <algorithm>
#include <cstdlib>
#if defined(__x86_64__) || defined(_M_X64)
#include <xmmintrin.h>
#endif
extern bool sq_nativeclosure_is_default_len(SQNativeClosure *);
extern bool sq_nativeclosure_is_array_append(SQNativeClosure *);

namespace {
struct NumericVector { SQInteger *data; SQUnsignedInteger size,capacity; };
void vector_init(NumericVector *v){v->data=nullptr;v->size=v->capacity=0;}
void vector_destroy(NumericVector *v){std::free(v->data);}
SQInteger vector_grow_append(NumericVector *v,SQInteger value){
    if(v->capacity>SIZE_MAX/(2*sizeof(SQInteger)))return 0;
    SQUnsignedInteger capacity=v->capacity?v->capacity*2:8;
    void *data=std::realloc(v->data,capacity*sizeof(SQInteger));if(!data)return 0;
    v->data=(SQInteger *)data;v->capacity=capacity;v->data[v->size++]=value;return 1;
}
SQInteger vector_bindings_match(SQSharedState *ss){
    return sq_type(ss->_array_append_closure)==OT_NATIVECLOSURE && sq_nativeclosure_is_array_append(_nativeclosure(ss->_array_append_closure)) &&
        sq_type(ss->_array_len_closure)==OT_NATIVECLOSURE && sq_nativeclosure_is_default_len(_nativeclosure(ss->_array_len_closure));
}
void checked(LLVMErrorRef error) {
    if(!error) return;
    char *message = LLVMGetErrorMessage(error);
    LLVMDisposeErrorMessage(message);
    throw std::runtime_error("LLVM compilation failed");
}
struct Artifact {
    LLVMOrcLLJITRef jit = nullptr;
    std::vector<SQJitScalarBinding> bindings;
    std::vector<SQJitNumericBinding> numeric_bindings;
    std::vector<SQJitClassBinding> class_bindings;
    ~Artifact() { if(jit) if(auto e = LLVMOrcDisposeLLJIT(jit)) LLVMConsumeError(e); }
    static void release(void *p) { delete static_cast<Artifact *>(p); }
};
SQInteger temporary_safe(SQJitContext *context) {
    return !context->active_vm || SQJitWriteLog::CanReleaseInContext(*context, context->active_vm->temp_reg);
}
SQInteger graph_lengths_match(SQSharedState *ss,SQInteger flags) {
    if(flags&1){
        const auto *slot=_table(ss->_string_default_delegate)->GetRawSlot(ss->_array_len_key);
        if(!slot)return 0;
        const SQObject &value=sq_type(*slot)==OT_WEAKREF?_weakref(*slot)->_obj:static_cast<const SQObject &>(*slot);
        if(sq_type(value)!=OT_NATIVECLOSURE || !sq_nativeclosure_is_default_len(_nativeclosure(value)))return 0;
    }
    if((flags&2) && (sq_type(ss->_array_len_closure)!=OT_NATIVECLOSURE ||
        !sq_nativeclosure_is_default_len(_nativeclosure(ss->_array_len_closure))))return 0;
    return 1;
}
SQInteger numeric_bindings_match(Artifact *artifact,SQObjectPtr *stack,SQClosure *closure) {
    for(const auto &binding:artifact->numeric_bindings){
        if(binding.kind==0){if(sqjit_number_conversion_guard(closure,&binding.key)!=SQ_JIT_NATIVE_RETURNED)return 0;}
        else {
            if(!closure || closure->_env || sq_type(stack[0])!=OT_TABLE)return 0;
            SQObjectPtr value;
            if(!_table(stack[0])->GetRaw(binding.key,value) || sq_type(value)!=OT_NATIVECLOSURE || _nativeclosure(value)->_env)return 0;
            const auto *spec=sqjit_math_spec(_nativeclosure(value));if(!spec || spec->kind!=binding.kind)return 0;
        }
    }
    return 1;
}
SQInteger class_bindings_match(Artifact *artifact,SQObjectPtr *stack,SQClosure *closure){return sqjit_class_bindings_match(artifact->class_bindings,stack,closure);}
SQInteger bindings_match(Artifact *artifact, SQObjectPtr *stack, SQClosure *closure) {
    if(!closure || closure->_env || sq_type(stack[0]) != OT_TABLE) return 0;
    for(const auto &binding : artifact->bindings) {
        const SQObject &expected = _weakref(binding.target)->_obj;
        if(sq_type(expected) != OT_CLOSURE || _closure(expected)->_env) return 0;
        SQObjectPtr actual;
        if(!_table(stack[0])->GetRaw(binding.key, actual) || sq_type(actual) != OT_CLOSURE ||
           _closure(actual) != _closure(expected)) return 0;
    }
    return 1;
}
struct IR {
    LLVMOrcThreadSafeContextRef thread = LLVMOrcCreateNewThreadSafeContext();
    LLVMContextRef context = LLVMOrcThreadSafeContextGetContext(thread);
    LLVMModuleRef module = LLVMModuleCreateWithNameInContext("squirrel_leaf", context);
    LLVMBuilderRef b = LLVMCreateBuilderInContext(context);
    ~IR() {
        LLVMDisposeBuilder(b);
        if(module) LLVMDisposeModule(module);
        LLVMOrcDisposeThreadSafeContext(thread);
    }
};
// Assignment must release a caller's previous managed result, including when
// the result slot aliases an argument. All input loads precede this call.
SQInteger publish(SQObjectPtr *out, SQInteger value, SQInteger kind, SQJitContext *context, SQInteger touched) {
    // Entry proved this drop unobservable. Delay it until successful completion
    // so guard failures and zero-trip paths preserve the interpreter's owners.
    if(touched && context && context->active_vm) context->active_vm->temp_reg.Null();
    if(kind == SQ_JIT_SLOT_FLOAT) {
        SQFloat number; std::memcpy(&number, &value, sizeof(number)); *out = number;
    } else {
        *out = value;
        if(kind == SQ_JIT_SLOT_BOOL) out->_type = OT_BOOL;
    }
    return SQ_JIT_NATIVE_RETURNED;
}
// Ordinary LLVM FP optimizations assume the standard rounding environment.
// Preserve non-default host state by declining execution, never changing it.
SQInteger floating_environment_safe() {
#if defined(__x86_64__) || defined(_M_X64)
    return (_mm_getcsr() & 0xffc0) == 0x1f80;
#elif defined(__aarch64__) && defined(__linux__)
    uint64_t fpcr;
    __asm__ __volatile__("mrs %0, fpcr" : "=r"(fpcr) : : "memory");
    // Conservatively accept only default controls: nearest rounding, gradual
    // underflow, no default-NaN mode or traps (including newer FPCR controls).
    // FPSR contains accumulated status, not controls, and need not be zero.
    return fpcr == 0;
#else
    return 0;
#endif
}
SQInteger run_floating(SQJitNativeObjectFn body, SQObjectPtr *stack, SQObjectPtr *out, SQClosure *closure) {
    if(!floating_environment_safe()) return SQ_JIT_NATIVE_GUARD_FAILED;
    return body(stack, out, closure);
}
bool lower(SQFunctionProto *p, SQObjectPtr *stack, SQClosure *closure, SQJitNative *native,
           SQJitCompileAttempt &attempt) {
    static_assert(sizeof(SQFloat) == 8, "LLVM scalar backend requires double precision");
    static_assert(sizeof(SQInteger) == 8, "LLVM scalar backend requires 64-bit integers");
    if(!p)return attempt.Reject(-1,SQ_JIT_REJECT_OPCODE,"missing function");
    for(SQInteger ip=0;ip<p->_ninstructions;++ip)
        if(p->_instructions[ip].op>=SQJIT_OP_TOFLOAT)
            return attempt.Reject(ip,SQ_JIT_REJECT_OPCODE,"internal numeric IR in original bytecode");
    SQJitScalarInlinePlan inlining;
    if(stack && !SQJitLeafPlan::Eligible(p, true) && inlining.Build(p, stack, closure)) p = inlining.Lowered();
    std::vector<SQInteger> temporary_writes;
    if(inlining.Lowered()) temporary_writes = inlining.temporary_writes;
    SQJitObjectInlinePlan objects;
    if(objects.Build(p,stack,closure,temporary_writes)){p=objects.Lowered();temporary_writes=objects.temporary_writes;}
    else if(objects.retry)attempt.MarkTransient();
    SQJitNumericPlan numeric;
    if(numeric.Build(p,stack,closure,temporary_writes)){
        p=numeric.Lowered();temporary_writes=numeric.temporary_writes;
    }
    SQJitLocalArrayPlan arrays;
    if(!SQJitLeafPlan::Eligible(p, true) && arrays.Build(p, temporary_writes)) {
        p = arrays.Lowered(); temporary_writes = arrays.temporary_writes;
    }
    SQJitLocalGraphPlan graph;
    if(!SQJitLeafPlan::Eligible(p,true) && graph.Build(p,temporary_writes)) {
        p=graph.Lowered();temporary_writes=graph.temporary_writes;
    }
    SQJitDynamicArrayPlan dynamic;
    if(!SQJitLeafPlan::Eligible(p,true) && dynamic.Build(p,temporary_writes)){
        p=dynamic.Lowered();temporary_writes=dynamic.temporary_writes;
    }
    if(!stack || !native || !SQJitLeafPlan::Eligible(p, true))
        return attempt.Reject(-1, SQ_JIT_REJECT_OPCODE, "LLVM requires a scalar function");
    std::vector<SQJitSlotKind> arguments(p->_nparameters, SQ_JIT_SLOT_UNKNOWN);
    for(SQInteger i = 1; i < p->_nparameters; ++i) {
        auto type = sq_type(stack[i]);
        if(type != OT_INTEGER && type != OT_BOOL && type != OT_FLOAT) {
            attempt.MarkTransient();
            return attempt.Reject(-1, SQ_JIT_REJECT_GUARD, "LLVM requires scalar arguments");
        }
        arguments[i] = type == OT_INTEGER ? SQ_JIT_SLOT_INT : type == OT_FLOAT ? SQ_JIT_SLOT_FLOAT : SQ_JIT_SLOT_BOOL;
    }
    SQJitLeafPlan plan;
    if(!plan.Build(p, arguments, true))
        return attempt.Reject(-1, SQ_JIT_REJECT_OPCODE, "LLVM scalar type flow rejected");
    bool floating = plan.return_kind == SQ_JIT_SLOT_FLOAT;
    for(const auto &node : plan.instructions) {
        if(!node.reachable) continue;
        floating = floating || node.result == SQ_JIT_SLOT_FLOAT;
        for(const auto &value : node.incoming) floating = floating || value.kind == SQ_JIT_SLOT_FLOAT;
    }
    static std::once_flag initialized;
    std::call_once(initialized, [] {
        unsigned major, minor, patch; LLVMGetVersion(&major, &minor, &patch);
        if(major != 18 || LLVMInitializeNativeTarget() || LLVMInitializeNativeAsmPrinter())
            throw std::runtime_error("LLVM 18 native target unavailable");
    });
    std::unique_ptr<Artifact> artifact(new Artifact);
    artifact->bindings = std::move(inlining.bindings);
    artifact->numeric_bindings=std::move(numeric.bindings);
    artifact->class_bindings=std::move(objects.bindings);
    checked(LLVMOrcCreateLLJIT(&artifact->jit, nullptr));
    // Bind only audited math entries that LLVM intrinsics may call. Do not
    // expose arbitrary process symbols to ordinary Squirrel source.
    const char *math_names[]={nullptr,"sqrt","sin","cos","asin","acos","log","log10","tan","atan","floor","ceil","exp","fabs","atan2","pow"};
    std::vector<LLVMOrcCSymbolMapPair> math_symbols;
    for(unsigned n=1;n<=SQ_NATIVE_MATH_POW;++n){
        const auto *spec=sq_native_math_spec((SQNativeMathKind)n);LLVMOrcCSymbolMapPair symbol{};
        symbol.Name=LLVMOrcLLJITMangleAndIntern(artifact->jit,math_names[n]);
        symbol.Sym.Address=spec->unary?(uintptr_t)spec->unary:(uintptr_t)spec->binary;
        symbol.Sym.Flags.GenericFlags=LLVMJITSymbolGenericFlagsExported|LLVMJITSymbolGenericFlagsCallable;
        math_symbols.push_back(symbol);
    }
    checked(LLVMOrcJITDylibDefine(LLVMOrcLLJITGetMainJITDylib(artifact->jit),LLVMOrcAbsoluteSymbols(math_symbols.data(),math_symbols.size())));
    IR ir;
    LLVMSetTarget(ir.module, LLVMOrcLLJITGetTripleString(artifact->jit));
    LLVMSetDataLayout(ir.module, LLVMOrcLLJITGetDataLayoutStr(artifact->jit));
    auto c = ir.context; auto b = ir.b;
    auto word = LLVMInt64TypeInContext(c), byte = LLVMInt8TypeInContext(c);
    auto real = LLVMDoubleTypeInContext(c);
    auto pointer = LLVMPointerTypeInContext(c, 0);
    LLVMTypeRef params[] = {pointer, pointer, pointer};
    auto fn = LLVMAddFunction(ir.module, floating ? "squirrel_body" : "squirrel_entry", LLVMFunctionType(word, params, 3, false));
    if(floating) LLVMSetLinkage(fn, LLVMInternalLinkage);
    auto entry = LLVMAppendBasicBlockInContext(c, fn, "entry");
    auto fail = LLVMAppendBasicBlockInContext(c, fn, "guard_failed");
    std::vector<LLVMBasicBlockRef> blocks(p->_ninstructions);
    for(SQInteger i = 0; i < p->_ninstructions; ++i)
        if(plan.instructions[i].reachable) blocks[i] = LLVMAppendBasicBlockInContext(c, fn, "bytecode");
    auto integer = [&](SQInteger v) { return LLVMConstInt(word, (uint64_t)v, true); };
    auto helper_call=[&](uintptr_t address,LLVMTypeRef result,std::vector<LLVMValueRef> args){
        std::vector<LLVMTypeRef> types;for(auto a:args)types.push_back(LLVMTypeOf(a));
        auto type=LLVMFunctionType(result,types.data(),types.size(),false);
        return LLVMBuildCall2(b,type,LLVMConstIntToPtr(integer(address),pointer),args.data(),args.size(),result==LLVMVoidTypeInContext(c)?"":"helper");
    };
    LLVMValueRef vector=nullptr;
    if(dynamic.Lowered()){
        LLVMPositionBuilderAtEnd(b,entry);vector=LLVMBuildAlloca(b,LLVMArrayType(byte,sizeof(NumericVector)),"numeric_vector");LLVMSetAlignment(vector,alignof(NumericVector));
        helper_call((uintptr_t)&vector_init,LLVMVoidTypeInContext(c),{vector});
    }
    LLVMPositionBuilderAtEnd(b, fail);
    if(vector)helper_call((uintptr_t)&vector_destroy,LLVMVoidTypeInContext(c),{vector});
    LLVMBuildRet(b, integer(SQ_JIT_NATIVE_GUARD_FAILED));
    LLVMPositionBuilderAtEnd(b, entry);
    std::vector<LLVMValueRef> locals(p->_stacksize);
    for(auto &local : locals) local = LLVMBuildAlloca(b, word, "local");
    auto touched = LLVMBuildAlloca(b, word, "temporary_touched");
    LLVMBuildStore(b, integer(0), touched);
    auto guard = [&](LLVMValueRef ok) {
        auto next = LLVMAppendBasicBlockInContext(c, fn, "guard_ok");
        LLVMBuildCondBr(b, ok, next, fail); LLVMPositionBuilderAtEnd(b, next);
    };
    auto address = [&](SQInteger slot, size_t field) {
        auto offset = integer(slot * sizeof(SQObjectPtr) + field);
        return LLVMBuildGEP2(b, byte, LLVMGetParam(fn, 0), &offset, 1, "slot");
    };
    if(vector){
        auto result=helper_call((uintptr_t)&vector_bindings_match,word,{LLVMConstIntToPtr(integer((uintptr_t)p->_sharedstate),pointer)});
        guard(LLVMBuildICmp(b,LLVMIntNE,result,integer(0),"array_bindings_valid"));
    }
    if(!temporary_writes.empty()) {
        // GET/PREPCALL normally overwrite the VM's temporary. A potentially final, observable
        // previous owner must be released by the interpreter at its normal
        // point, before any binding lookup or scalarized array operation.
        LLVMTypeRef types[] = {pointer};
        auto type = LLVMFunctionType(word, types, 1, false);
        auto target = LLVMConstIntToPtr(integer((uintptr_t)&temporary_safe), pointer);
        LLVMValueRef args[] = {LLVMConstIntToPtr(integer((uintptr_t)&sqjit_context(p->_sharedstate)), pointer)};
        guard(LLVMBuildICmp(b, LLVMIntNE, LLVMBuildCall2(b, type, target, args, 1, "temporary"), integer(0), "temporary_safe"));
    }
    if(!artifact->bindings.empty()) {
        LLVMTypeRef types[] = {pointer, pointer, pointer};
        auto type = LLVMFunctionType(word, types, 3, false);
        auto target = LLVMConstIntToPtr(integer((uintptr_t)&bindings_match), pointer);
        LLVMValueRef args[] = {LLVMConstIntToPtr(integer((uintptr_t)artifact.get()), pointer), LLVMGetParam(fn, 0), LLVMGetParam(fn, 2)};
        guard(LLVMBuildICmp(b, LLVMIntNE, LLVMBuildCall2(b, type, target, args, 3, "bindings"), integer(0), "bindings_valid"));
    }
    if(graph.string_length || graph.array_length){
        LLVMTypeRef types[]={pointer,word};auto type=LLVMFunctionType(word,types,2,false);
        auto target=LLVMConstIntToPtr(integer((uintptr_t)&graph_lengths_match),pointer);
        LLVMValueRef args[]={LLVMConstIntToPtr(integer((uintptr_t)p->_sharedstate),pointer),integer((graph.string_length?1:0)|(graph.array_length?2:0))};
        guard(LLVMBuildICmp(b,LLVMIntNE,LLVMBuildCall2(b,type,target,args,2,"length_bindings"),integer(0),"length_bindings_valid"));
    }
    if(!artifact->numeric_bindings.empty()){
        LLVMTypeRef types[]={pointer,pointer,pointer};auto type=LLVMFunctionType(word,types,3,false);
        auto target=LLVMConstIntToPtr(integer((uintptr_t)&numeric_bindings_match),pointer);
        LLVMValueRef args[]={LLVMConstIntToPtr(integer((uintptr_t)artifact.get()),pointer),LLVMGetParam(fn,0),LLVMGetParam(fn,2)};
        guard(LLVMBuildICmp(b,LLVMIntNE,LLVMBuildCall2(b,type,target,args,3,"numeric_bindings"),integer(0),"numeric_bindings_valid"));
    }
    if(!artifact->class_bindings.empty()){
        auto result=helper_call((uintptr_t)&class_bindings_match,word,{LLVMConstIntToPtr(integer((uintptr_t)artifact.get()),pointer),LLVMGetParam(fn,0),LLVMGetParam(fn,2)});
        guard(LLVMBuildICmp(b,LLVMIntNE,result,integer(0),"class_bindings_valid"));
    }
    for(SQInteger i = 1; i < p->_nparameters; ++i) {
        auto tagType = LLVMIntTypeInContext(c, sizeof(SQObjectType) * 8);
        auto tag = LLVMBuildLoad2(b, tagType, address(i, offsetof(SQObject, _type)), "tag");
        guard(LLVMBuildICmp(b, LLVMIntEQ, tag, LLVMConstInt(tagType, sqjit_scalar_type(arguments[i]), false), "type_guard"));
        LLVMBuildStore(b, LLVMBuildLoad2(b, word, address(i, offsetof(SQObject, _unVal)), "argument"), locals[i]);
    }
    LLVMBuildBr(b, blocks[0]);
    auto load = [&](SQInteger slot) { return LLVMBuildLoad2(b, word, locals[slot], "value"); };
    auto store = [&](SQInteger slot, LLVMValueRef value) { LLVMBuildStore(b, value, locals[slot]); };
    auto literal = [&](SQInteger index) {
        SQInteger bits;
        std::memcpy(&bits, &p->_literals[index]._unVal, sizeof(bits));
        return integer(bits);
    };
    auto cmp = [&](unsigned op, SQInteger left_slot, SQInteger right_slot, SQInteger ip) {
        auto left = load(left_slot), right = load(right_slot);
        const auto &types = plan.instructions[ip].incoming;
        auto left_kind = types[left_slot].kind, right_kind = types[right_slot].kind;
        if(left_kind == SQ_JIT_SLOT_FLOAT || right_kind == SQ_JIT_SLOT_FLOAT) {
            auto a = left_kind == SQ_JIT_SLOT_FLOAT ? LLVMBuildBitCast(b, left, real, "float_left") : LLVMBuildSIToFP(b, left, real, "convert_left");
            auto z = right_kind == SQ_JIT_SLOT_FLOAT ? LLVMBuildBitCast(b, right, real, "float_right") : LLVMBuildSIToFP(b, right, real, "convert_right");
            // ObjCmp first compares raw bits for equal tags; otherwise it
            // returns -1 for ordered less-than and +1 for everything else.
            // Thus opposite signed zeros and NaN payloads must not be lowered
            // as ordinary IEEE <=/>=. Mixed numeric tags use numeric equality.
            auto equal = left_kind == right_kind ? LLVMBuildICmp(b, LLVMIntEQ, left, right, "same_bits") :
                LLVMBuildFCmp(b, LLVMRealOEQ, a, z, "numeric_equal");
            auto less = LLVMBuildAnd(b, LLVMBuildNot(b, equal, "different"),
                LLVMBuildFCmp(b, LLVMRealOLT, a, z, "ordered_less"), "less");
            if(op == CMP_L) return less;
            if(op == CMP_LE) return LLVMBuildOr(b, equal, less, "less_equal");
            if(op == CMP_GE) return LLVMBuildNot(b, less, "greater_equal");
            return LLVMBuildNot(b, LLVMBuildOr(b, equal, less, "less_equal"), "greater");
        }
        LLVMIntPredicate predicate = op == CMP_G ? LLVMIntSGT : op == CMP_GE ? LLVMIntSGE : op == CMP_L ? LLVMIntSLT : LLVMIntSLE;
        return LLVMBuildICmp(b, predicate, left, right, "compare");
    };
    for(SQInteger ip = 0; ip < p->_ninstructions; ++ip) {
        if(!plan.instructions[ip].reachable) continue;
        attempt.SetIP(ip);
        LLVMPositionBuilderAtEnd(b, blocks[ip]);
        if(std::binary_search(temporary_writes.begin(), temporary_writes.end(), ip)) LLVMBuildStore(b, integer(1), touched);
        const auto &i = p->_instructions[ip];
        bool terminal = false;
        switch(i.op) {
        case SQJIT_OP_VECTOR_APPEND:case SQJIT_OP_VECTOR_GET:case SQJIT_OP_VECTOR_LEN:{
            if(!vector)return attempt.Reject(ip,SQ_JIT_REJECT_OPCODE,"missing private vector");
            auto field=[&](size_t offset){auto n=integer(offset);return LLVMBuildGEP2(b,byte,vector,&n,1,"vector_field");};
            auto sizep=field(offsetof(NumericVector,size)),datap=field(offsetof(NumericVector,data));
            auto size=LLVMBuildLoad2(b,word,sizep,"size");
            if(i.op==SQJIT_OP_VECTOR_LEN){store(i._arg0,size);break;}
            if(i.op==SQJIT_OP_VECTOR_GET){
                auto index=i._arg3?literal(i._arg1):load(i._arg1);
                guard(LLVMBuildICmp(b,LLVMIntULT,index,size,"index_valid"));
                auto data=LLVMBuildLoad2(b,pointer,datap,"elements"),cell=LLVMBuildGEP2(b,word,data,&index,1,"element");
                store(i._arg0,LLVMBuildLoad2(b,word,cell,"value"));break;
            }
            auto value=load(i._arg1),capacity=LLVMBuildLoad2(b,word,field(offsetof(NumericVector,capacity)),"capacity");
            auto fast=LLVMAppendBasicBlockInContext(c,fn,"append"),grow=LLVMAppendBasicBlockInContext(c,fn,"grow"),done=LLVMAppendBasicBlockInContext(c,fn,"appended");
            LLVMBuildCondBr(b,LLVMBuildICmp(b,LLVMIntULT,size,capacity,"room"),fast,grow);
            LLVMPositionBuilderAtEnd(b,grow);auto ok=helper_call((uintptr_t)&vector_grow_append,word,{vector,value});
            guard(LLVMBuildICmp(b,LLVMIntNE,ok,integer(0),"grown"));LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,fast);auto data=LLVMBuildLoad2(b,pointer,datap,"elements"),cell=LLVMBuildGEP2(b,word,data,&size,1,"element");
            LLVMBuildStore(b,value,cell);LLVMBuildStore(b,LLVMBuildAdd(b,size,integer(1),"next_size"),sizep);LLVMBuildBr(b,done);
            LLVMPositionBuilderAtEnd(b,done);store(i._arg0,integer(0));break;
        }
        case SQJIT_OP_TOFLOAT:{
            auto value=load(i._arg1);
            if(plan.instructions[ip].incoming[i._arg1].kind!=SQ_JIT_SLOT_FLOAT)
                value=LLVMBuildBitCast(b,LLVMBuildSIToFP(b,value,real,"tofloat"),word,"float_bits");
            store(i._arg0,value);break;
        }
        case SQJIT_OP_MATH:{
            const auto *spec=sq_native_math_spec((SQNativeMathKind)i._arg3);
            const char *names[]={nullptr,"llvm.sqrt","llvm.sin","llvm.cos",nullptr,nullptr,"llvm.log","llvm.log10",nullptr,nullptr,"llvm.floor","llvm.ceil","llvm.exp","llvm.fabs",nullptr,"llvm.pow"};
            LLVMValueRef args[2];SQInteger regs[]={i._arg1,i._arg2};
            for(SQInteger n=0;n<spec->nargs;++n){auto v=load(regs[n]);args[n]=plan.instructions[ip].incoming[regs[n]].kind==SQ_JIT_SLOT_FLOAT?LLVMBuildBitCast(b,v,real,"math_arg"):LLVMBuildSIToFP(b,v,real,"math_convert");}
            LLVMTypeRef types[]={real,real};auto type=LLVMFunctionType(real,types,spec->nargs,false);LLVMValueRef target;
            if(names[i._arg3]){
                auto id=LLVMLookupIntrinsicID(names[i._arg3],strlen(names[i._arg3]));
                target=LLVMGetIntrinsicDeclaration(ir.module,id,&real,1);
            }else target=LLVMConstIntToPtr(integer(spec->unary?(uintptr_t)spec->unary:(uintptr_t)spec->binary),pointer);
            auto value=LLVMBuildCall2(b,type,target,args,spec->nargs,"math");
            store(i._arg0,LLVMBuildBitCast(b,value,word,"math_bits"));break;
        }
        case _OP_LINE: break;
        case _OP_LOADINT: store(i._arg0, integer((SQInt32)i._arg1)); break;
        case _OP_LOADFLOAT: return attempt.Reject(ip, SQ_JIT_REJECT_OPCODE, "32-bit float bytecode is unsupported");
        case _OP_LOADBOOL: store(i._arg0, integer(i._arg1 != 0)); break;
        case _OP_LOAD: store(i._arg0, literal(i._arg1)); break;
        case _OP_DLOAD: store(i._arg0, literal(i._arg1)); store(i._arg2, literal(i._arg3)); break;
        case _OP_MOVE: case _OP_DMOVE:
            store(i._arg0, load(i._arg1));
            if(i.op == _OP_DMOVE) store(i._arg2, load(i._arg3));
            break;
        case _OP_INCL: case _OP_PINCL: {
            auto old = load(i._arg1);
            if(i.op == _OP_PINCL) store(i._arg0, old);
            store(i._arg1, LLVMBuildAdd(b, old, integer((signed char)i._arg3), "increment"));
            break;
        }
        case _OP_NEG: store(i._arg0, LLVMBuildNeg(b, load(i._arg1), "negate")); break;
        case _OP_ADD: case _OP_SUB: case _OP_MUL: case _OP_DIV: case _OP_MOD: {
            auto left = load(i._arg2), right = load(i._arg1);
            LLVMValueRef value;
            if(plan.instructions[ip].result == SQ_JIT_SLOT_FLOAT) {
                const auto &types = plan.instructions[ip].incoming;
                left = types[i._arg2].kind == SQ_JIT_SLOT_FLOAT ? LLVMBuildBitCast(b, left, real, "float_left") : LLVMBuildSIToFP(b, left, real, "convert_left");
                right = types[i._arg1].kind == SQ_JIT_SLOT_FLOAT ? LLVMBuildBitCast(b, right, real, "float_right") : LLVMBuildSIToFP(b, right, real, "convert_right");
                if(i.op == _OP_ADD) value = LLVMBuildFAdd(b, left, right, "float_add");
                else if(i.op == _OP_SUB) value = LLVMBuildFSub(b, left, right, "float_subtract");
                else if(i.op == _OP_MUL) value = LLVMBuildFMul(b, left, right, "float_multiply");
                else value = LLVMBuildFDiv(b, left, right, "float_divide");
                value = LLVMBuildBitCast(b, value, word, "float_bits");
            } else if(i.op == _OP_DIV || i.op == _OP_MOD) {
                guard(LLVMBuildICmp(b, LLVMIntNE, right, integer(0), "nonzero"));
                auto overflow = LLVMBuildAnd(b,
                    LLVMBuildICmp(b, LLVMIntEQ, left, integer(INT64_MIN), "minimum"),
                    LLVMBuildICmp(b, LLVMIntEQ, right, integer(-1), "minus_one"), "overflow");
                guard(LLVMBuildNot(b, overflow, "safe_division"));
                value = i.op == _OP_DIV ? LLVMBuildSDiv(b, left, right, "divide") : LLVMBuildSRem(b, left, right, "remainder");
            } else if(i.op == _OP_ADD) value = LLVMBuildAdd(b, left, right, "add");
            else if(i.op == _OP_SUB) value = LLVMBuildSub(b, left, right, "subtract");
            else value = LLVMBuildMul(b, left, right, "multiply");
            store(i._arg0, value); break;
        }
        case _OP_EQ: case _OP_NE: {
            auto value = LLVMBuildICmp(b, i.op == _OP_EQ ? LLVMIntEQ : LLVMIntNE,
                load(i._arg2), i._arg3 ? literal(i._arg1) : load(i._arg1), "equal");
            store(i._arg0, LLVMBuildZExt(b, value, word, "boolean")); break;
        }
        case _OP_CMP:
            store(i._arg0, LLVMBuildZExt(b, cmp(i._arg3, i._arg2, i._arg1, ip), word, "boolean")); break;
        case _OP_JCMP: case _OP_JZ: {
            auto condition = i.op == _OP_JCMP ? cmp(i._arg3, i._arg2, i._arg0, ip) :
                LLVMBuildICmp(b, LLVMIntNE, load(i._arg0), integer(0), "truth");
            LLVMBuildCondBr(b, condition, blocks[ip + 1], blocks[ip + 1 + i._arg1]);
            terminal = true; break;
        }
        case _OP_JMP: LLVMBuildBr(b, blocks[ip + 1 + i._arg1]); terminal = true; break;
        case _OP_RETURN: {
            if(vector)helper_call((uintptr_t)&vector_destroy,LLVMVoidTypeInContext(c),{vector});
            LLVMTypeRef types[] = {pointer, word, word, pointer, word};
            auto type = LLVMFunctionType(word, types, 5, false);
            auto target = LLVMConstIntToPtr(integer((uintptr_t)&publish), pointer);
            LLVMValueRef args[] = {LLVMGetParam(fn, 1), load(i._arg1), integer(plan.instructions[ip].incoming[i._arg1].kind),
                LLVMConstIntToPtr(integer((uintptr_t)&sqjit_context(p->_sharedstate)), pointer),
                LLVMBuildLoad2(b, word, touched, "temporary_was_touched")};
            LLVMBuildRet(b, LLVMBuildCall2(b, type, target, args, 5, "publish"));
            terminal = true; break;
        }
        default: return attempt.Reject(ip, SQ_JIT_REJECT_OPCODE, "LLVM leaf opcode not implemented");
        }
        if(!terminal) LLVMBuildBr(b, blocks[ip + 1]);
    }
    if(floating) {
        // Keep the environment guard outside the optimized FP body. Ordinary
        // LLVM FP operations are speculatable, so an IR branch alone cannot
        // prevent arithmetic moving ahead of the guard and trapping under a
        // host's unmasked exceptions. The opaque C++ call is the boundary.
        auto wrapper = LLVMAddFunction(ir.module, "squirrel_entry", LLVMFunctionType(word, params, 3, false));
        auto block = LLVMAppendBasicBlockInContext(c, wrapper, "floating_entry");
        LLVMPositionBuilderAtEnd(b, block);
        LLVMTypeRef types[] = {pointer, pointer, pointer, pointer};
        auto type = LLVMFunctionType(word, types, 4, false);
        auto target = LLVMConstIntToPtr(integer((uintptr_t)&run_floating), pointer);
        LLVMValueRef args[] = {fn, LLVMGetParam(wrapper, 0), LLVMGetParam(wrapper, 1), LLVMGetParam(wrapper, 2)};
        LLVMBuildRet(b, LLVMBuildCall2(b, type, target, args, 4, "guarded_floating_body"));
    }
    char *error = nullptr;
    if(LLVMVerifyModule(ir.module, LLVMReturnStatusAction, &error)) {
        LLVMDisposeMessage(error);
        return attempt.Reject(-1, SQ_JIT_REJECT_RESOURCE, "LLVM IR verification failed");
    }
    LLVMDisposeMessage(error);
    auto options = LLVMCreatePassBuilderOptions();
    auto passError = LLVMRunPasses(ir.module, "default<O2>", nullptr, options);
    LLVMDisposePassBuilderOptions(options); checked(passError);
    auto module = LLVMOrcCreateNewThreadSafeModule(ir.module, ir.thread); ir.module = nullptr;
    checked(LLVMOrcLLJITAddLLVMIRModule(artifact->jit, LLVMOrcLLJITGetMainJITDylib(artifact->jit), module));
    LLVMOrcExecutorAddress code = 0;
    checked(LLVMOrcLLJITLookup(artifact->jit, &code, "squirrel_entry"));
    native->_code.SetExternal((void *)(uintptr_t)code, artifact.release(), Artifact::release);
    native->_stack_live_slots = p->_nparameters;
    native->_stack_storage_slots = p->_nparameters;
    return true;
}
}
SQJitCompileResult sqjit_backend_compile_proto(SQFunctionProto *p, SQObjectPtr *stack,
    SQClosure *closure, SQJitNative *native, bool allow_side_exits) {
    SQJitCompileAttempt attempt(p, SQ_JIT_BACKEND_LLVM);
    try {
        if(lower(p,stack,closure,native,attempt))return attempt.Finish(true);
        if(native && !native->_scalarized && sqjit_llvm_table_predicate_compile(p,native))
            return SQJitCompileResult::Success(SQ_JIT_BACKEND_LLVM);
        if(allow_side_exits && !native->_scalarized && sqjit_context(p->_sharedstate).precise_exits) {
            auto result=sqjit_llvm_object_compile(p,0,p->_ninstructions-1,0,&native->_code,false);
            if(result){native->_requires_vm_frame=true;native->_stack_live_slots=p->_stacksize;native->_stack_storage_slots=p->_stacksize;return result;}
        }
        return attempt.Finish(false);
    } catch(const std::exception &) {
        attempt.Reject(-1, SQ_JIT_REJECT_RESOURCE, "LLVM compiler resource failure");
        return attempt.Finish(false);
    }
}
bool sqjit_backend_loop_find_region(SQFunctionProto *p,SQInteger header,SQInteger *first,SQInteger *last,SQInteger *exit) {
    return sqjit_llvm_object_region(p,header,first,last,exit);
}
SQJitCompileResult sqjit_backend_compile_loop(SQFunctionProto *p,SQObjectPtr *,SQClosure *,
    SQInteger first,SQInteger header,SQInteger last,SQInteger,SQJitProto *jit,SQJitCode *code) {
    return sqjit_llvm_object_compile(p,first,last,header,code?code:(jit?&jit->_loop_code:nullptr),true);
}
