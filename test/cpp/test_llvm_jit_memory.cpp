#include "llvm_jit.h"
#include <llvm-c/Core.h>
#include <llvm-c/IRReader.h>
#include <llvm-c/Target.h>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <limits>
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
#if defined(_WIN32) && defined(__MINGW32__) && defined(__x86_64__)
    check(std::strstr(LLVMOrcLLJITGetTripleString(jit), "windows-gnu") != nullptr,
          "MinGW must use its runtime ABI even with an MSVC-built LLVM DLL");
#endif
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
declare void @sincos(double, ptr, ptr)
define void @entry_sincos(double %x, ptr %out) uwtable {
  %cosine = getelementptr double, ptr %out, i64 1
  call void @sincos(double %x, ptr %out, ptr %cosine)
  ret void
}
define i64 @entry_stack(i64 %n) uwtable {
  %storage = alloca [65536 x i8], align 16
  %last = getelementptr [65536 x i8], ptr %storage, i64 0, i64 65535
  store volatile i8 90, ptr %last
  %index = and i64 %n, 32767
  %slot = getelementptr [65536 x i8], ptr %storage, i64 0, i64 %index
  %value = trunc i64 %n to i8
  store volatile i8 %value, ptr %slot
  %actual = load volatile i8, ptr %slot
  %sentinel = load volatile i8, ptr %last
  %wide = zext i8 %actual to i64
  %tail = zext i8 %sentinel to i64
  %result = add i64 %wide, %tail
  ret i64 %result
}
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
    LLVMOrcExecutorAddress sincos_entry, stack_entry;
    checked(LLVMOrcLLJITLookup(jit, &sincos_entry, "entry_sincos"));
    checked(LLVMOrcLLJITLookup(jit, &stack_entry, "entry_stack"));
    auto sincos_call = reinterpret_cast<void (*)(double, double *)>(static_cast<uintptr_t>(sincos_entry));
    double results[2] = {-123.0, -456.0};
    sincos_call(0.5, results);
    check(std::fabs(results[0] - std::sin(0.5)) < 1e-14 &&
          std::fabs(results[1] - std::cos(0.5)) < 1e-14, "JIT sincos helper ABI/result mismatch");
    sincos_call(-0.0, results);
    check(results[0] == 0.0 && std::signbit(results[0]) && results[1] == 1.0, "JIT sincos signed zero mismatch");
    sincos_call(std::numeric_limits<double>::infinity(), results);
    check(std::isnan(results[0]) && std::isnan(results[1]), "JIT sincos domain mismatch");
    // This must execute a real 64 KiB frame and the compiler-selected Win64
    // stack probe. Calling a probe directly with the C ABI would not test it.
    auto stack_call = reinterpret_cast<int64_t (*)(int64_t)>(static_cast<uintptr_t>(stack_entry));
    check(stack_call(7) == 97 && stack_call(32766) == 344, "JIT large stack frame/probe mismatch");
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
    std::puts("LLVM JIT section memory, compiler helpers and teardown tests passed");
}
