#include "llvm_jit.h"
#include <llvm-c/Core.h>
#include <llvm-c/IRReader.h>
#include <llvm-c/Target.h>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>

static void check(bool ok, const char *message) {
    if(!ok) { std::fprintf(stderr, "%s\n", message); std::exit(1); }
}
static void checked(LLVMErrorRef error) {
    if(!error) return;
    char *message = LLVMGetErrorMessage(error);
    std::fprintf(stderr, "%s\n", message);
    LLVMDisposeErrorMessage(message);
    std::exit(1);
}
static int64_t twice(int64_t n) { return n * 2; }

static LLVMOrcLLJITRef compile_and_run() {
    LLVMOrcLLJITRef jit = nullptr;
    checked(sqgi_llvm::create_jit(&jit));
    LLVMOrcCSymbolMapPair symbol{};
    symbol.Name = LLVMOrcLLJITMangleAndIntern(jit, "host_twice");
    symbol.Sym.Address = reinterpret_cast<uintptr_t>(&twice);
    symbol.Sym.Flags.GenericFlags = LLVMJITSymbolGenericFlagsExported | LLVMJITSymbolGenericFlagsCallable;
    checked(LLVMOrcJITDylibDefine(LLVMOrcLLJITGetMainJITDylib(jit), LLVMOrcAbsoluteSymbols(&symbol, 1)));
    // Exercise code, mutable data, constant data, external-call stubs and COFF
    // unwind relocations together. Volatile loads keep all data sections live.
    const char source[] = R"IR(
@counter = global i64 40
@increment = constant i64 3
declare i64 @host_twice(i64)
define i64 @entry(i64 %n) uwtable {
  %old = load volatile i64, ptr @counter
  %inc = load volatile i64, ptr @increment
  %call = call i64 @host_twice(i64 %n)
  %sum = add i64 %old, %inc
  %result = add i64 %sum, %call
  store volatile i64 %result, ptr @counter
  ret i64 %result
}
define double @entry_float(double %n) uwtable {
  %result = fadd double %n, 1.125
  ret double %result
}
)IR";
    auto context = LLVMOrcCreateNewThreadSafeContext();
    auto buffer = LLVMCreateMemoryBufferWithMemoryRangeCopy(source, std::strlen(source), "memory-test");
    LLVMModuleRef module = nullptr;
    char *error = nullptr;
    if(LLVMParseIRInContext(LLVMOrcThreadSafeContextGetContext(context), buffer, &module, &error)) {
        std::fprintf(stderr, "%s\n", error);
        LLVMDisposeMessage(error);
        std::exit(1);
    }
    LLVMSetTarget(module, LLVMOrcLLJITGetTripleString(jit));
    LLVMSetDataLayout(module, LLVMOrcLLJITGetDataLayoutStr(jit));
    auto thread_module = LLVMOrcCreateNewThreadSafeModule(module, context);
    LLVMOrcDisposeThreadSafeContext(context);
    checked(sqgi_llvm::add_module(jit, thread_module));
    LLVMOrcExecutorAddress entry, counter, increment;
    checked(LLVMOrcLLJITLookup(jit, &entry, "entry"));
    checked(LLVMOrcLLJITLookup(jit, &counter, "counter"));
    checked(LLVMOrcLLJITLookup(jit, &increment, "increment"));
    auto call = reinterpret_cast<int64_t (*)(int64_t)>(static_cast<uintptr_t>(entry));
    check(call(7) == 57 && call(2) == 64, "JIT code/data/callback result mismatch");
    LLVMOrcExecutorAddress float_entry;
    checked(LLVMOrcLLJITLookup(jit, &float_entry, "entry_float"));
    auto float_call = reinterpret_cast<double (*)(double)>(static_cast<uintptr_t>(float_entry));
    check(float_call(2.5) == 3.625, "JIT floating constant mismatch");
    check(*reinterpret_cast<int64_t *>(static_cast<uintptr_t>(counter)) == 64, "JIT mutable data mismatch");
#if defined(_WIN32) && (defined(__x86_64__) || defined(_M_X64))
    MEMORY_BASIC_INFORMATION code_info{}, data_info{}, constant_info{};
    check(VirtualQuery(reinterpret_cast<void *>(entry), &code_info, sizeof(code_info)) &&
          VirtualQuery(reinterpret_cast<void *>(counter), &data_info, sizeof(data_info)) &&
          VirtualQuery(reinterpret_cast<void *>(increment), &constant_info, sizeof(constant_info)), "VirtualQuery failed");
    check(code_info.Protect == PAGE_EXECUTE_READ, "JIT code must be executable and not writable");
    check(data_info.Protect == PAGE_READWRITE, "JIT mutable data must be writable and not executable");
    check(constant_info.Protect == PAGE_READONLY, "JIT constant data must be read-only and not executable");
    auto low = entry < counter ? entry : counter;
    if(increment < low) low = increment;
    auto high = entry > counter ? entry : counter;
    if(increment > high) high = increment;
    check(high - low < INT32_MAX, "JIT sections must fit COFF relative relocations");
#endif
    return jit;
}

int main() {
    check(!LLVMInitializeNativeTarget() && !LLVMInitializeNativeAsmPrinter(), "LLVM native target unavailable");
    // Keep some objects live while repeatedly removing/replacing others. This
    // creates address-space holes that exposed LLVM 18's default allocator bug.
    std::vector<LLVMOrcLLJITRef> live(12, nullptr);
    for(int round = 0; round < 8; ++round) {
        for(size_t i = 0; i < live.size(); ++i) {
            if(live[i]) checked(LLVMOrcDisposeLLJIT(live[i]));
            live[i] = compile_and_run();
        }
        for(size_t i = 0; i < live.size(); i += 2) {
            checked(LLVMOrcDisposeLLJIT(live[i]));
            live[i] = nullptr;
        }
    }
    for(auto jit : live) if(jit) checked(LLVMOrcDisposeLLJIT(jit));
    std::puts("LLVM JIT section memory and teardown tests passed");
}
