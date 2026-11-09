# Experimental LLVM tier for ordinary Squirrel

LLVM builds with `SQ_ENABLE_JIT=OFF` now expose an explicit opt-in prototype:

```squirrel
local run = function(fn, n) {
    local total = 0;
    for (local i = 0; i < n; i++) total += fn(i);
    return total;
};
sqgi.llvm.compile(run); // Compiles this closure's shared function prototype.
local result = run(module.twice, 100);
local stats = sqgi.llvm.info(run);
```

The initial tier is a **hybrid boxed baseline**. Eligible hot integer-kernel
loops can subsequently promote to [guarded kernel inlining](inlined-calls.md).
[Ordinary scalar loops and stateful method loops](prepared-methods.md) also have
specialized paths.
Other code retains the baseline and interpreter paths described below. Compilation preserves closure identity. Other closures
sharing the same function prototype use the same executable, with their own
normal environments and outer variables. Compilation is explicit, synchronous
and idempotent. LLVM compilation failures throw before installing an executable.

LLVM emits native control flow and direct guarded scalar instructions for integer
and mixed floating-point addition/subtraction/multiplication, scalar loads/moves,
integer increments/comparisons, truth tests and conditional branches. Integer
arithmetic wraps without LLVM overflow assumptions. Floating operations use no
fast-math or contraction flags. Float comparisons retain the VM's existing NaN
and raw-value comparison behavior through interpreter handoff.

In the baseline, every raw destination write first checks that it will not overwrite a managed
reference. Managed assignments and nonnumeric arithmetic hand off before effects,
so the VM performs reference releases and metamethod dispatch. Slots remain
materialized at boundaries; LLVM can optimize the scalar instructions, but this
is not whole-function unboxing or kernel inlining. Less common operations still
use opcode-specific runtime helpers. Stack storage is reloaded across helper
calls, so stack relocation does not invalidate a cached register pointer.

Registered native leaf functions (including typed kernel exports and methods)
are called from compiled blocks through `CallNative`, retaining arity/type checks,
argument marshalling, kernel error handling and floating-environment management.
This baseline path skips interpreter CALL dispatch. It does not inline kernels or remove
boxing, marshalling, method lookup or all VM transitions.

Every unsupported instruction returns its exact bytecode position to the normal
interpreter. The interpreter executes that instruction once, then can re-enter
compiled code at the next position. This is a normal execution handoff, not
speculative replay or reconstruction of optimized locals. It covers tables,
classes, strings, metamethods, GI calls, callbacks, exceptions, generators and
coroutine suspension using existing VM behavior. Native callbacks with bound
environments also use the interpreter path. Debug hooks bypass compiled code.

All managed values stay in normal rooted VM slots; this tier does not cache stack
addresses across callbacks. The function prototype owns the executable and
releases it with its usual lifetime. It introduces no new garbage collector.
The existing handwritten bytecode JIT remains off and this prototype API is not
built when that JIT is enabled, kernels are disabled, or the NATIVE kernel backend
is selected. LLVM Windows support has not been validated.

`info(closure)` returns cumulative `entries`, `operations` (successful direct
and helper operations), `direct_operations`, and `leaf_calls` (attempted direct
leaf calls). Static `lowered`/`instructions` and `direct` counts show compiled
coverage. Guards may still hand off dynamically; these are not fully-compiled
coverage claims. Direct-operation counters accumulate locally and flush at
handoffs, avoiding a shared counter write for every scalar instruction. Set
`SQGI_SQUIRREL_DUMP_IR=1` to inspect optimized IR.

## Validation and performance

Run `test/test_llvm_squirrel.nut`, `demo/kernels/boxed_squirrel.nut` and
`demo/benchmarks/kernels/boxed_squirrel.nut` using the LLVM build. The integration
test covers changing numeric/string types, direct exports and methods, errors
without repeated writes, tables/arrays, traps, captured variables/defaults,
GC/stack growth, generators, suspension, GI object calls and callbacks, bound
native environments, debug hooks and executable lifetime.

Measurements on the development i7-12700, pinned CPU 0, RelWithDebInfo,
LLVM 18, handwritten JIT off (nanoseconds per loop iteration):

| Workload | Interpreter | Direct LLVM | Interpreter / LLVM |
|---|---:|---:|---:|
| Integer arithmetic | 12.89 | 3.13 | 4.12× |
| Mixed floating arithmetic | 13.76 | 3.66 | 3.76× |
| Floating recurrence | 15.79 | 4.55 | 3.47× |
| Conditional integer loop | 17.55 | 2.74 | 6.41× |
| Tiny typed kernel call and accumulation | 24.77 | 19.32 | 1.28× |

The previous helper-only tier measured 19.22 ns for integer arithmetic and
29.46 ns for kernel calls. Direct lowering removes helper calls from the scalar
loops; compiled kernel calls still validate and marshal boxed arguments.
Compilation now takes roughly 6–8 ms per small function, excluded from timing.
The benchmark validates checksums and uses separate equivalent prototypes,
one million iterations per sample, warmup, alternating order and medians of
11 samples. These are local microbenchmarks, not whole-application speedups.

`test/test_llvm_scalars.nut` adds 1,239 differential scalar cases plus managed
assignment, signed-zero, overflow and metamethod/error handoff checks. The
optimized arithmetic IR contains no calls to per-operation helpers.

The subsequent inlining tier retains unboxed state across eligible regions and
specializes stable integer-export targets. [Ordinary regions and prepared
methods](prepared-methods.md) extend that promotion to eligible scalar loops and
stateful methods; methods still use their native floating-environment wrapper.

The subsequent [tiny-call pass](tiny-calls.md) prepares kernel adapters once and
keeps direct typed-method lookups inside compiled caller loops.

[Guarded kernel inlining](inlined-calls.md) now promotes eligible hot pure-integer
caller loops, eliminating their native boundary and per-iteration slot traffic.
