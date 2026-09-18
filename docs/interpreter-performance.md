# Interpreter performance experiments

The interpreter remains important for code the bytecode JIT cannot compile.
This experiment adds an integer comparison fast path and optional threaded
bytecode dispatch. No language semantics or dependencies change.

## Implementation

`SQVM::CMP_OP` handles two integer operands directly, avoiding the generic
object comparison helper. It compares rather than subtracting, so opposite
signed integer extremes are safe. Float, mixed numeric, string, object, and
metamethod comparisons retain the existing path.

`SQGI_THREADED_DISPATCH=ON` enables GCC/Clang computed-goto dispatch. Instruction
handlers first use ordinary gotos to leave their C++ scopes; only then does a
separate dispatch tail fetch and jump to the next instruction. This is essential:
a computed goto directly out of a handler would bypass local C++ destructors.
The GCC function-specific settings prevent tail merging and cross-jumping from
collapsing those dispatch sites. Other compiler settings remain unchanged.

The option defaults **OFF** because results are mixed. MSVC and ordinary builds
retain switch dispatch. The separate experimental `SQGI_ENABLE_LLVM_SQUIRREL`
boxed tier also retains switch dispatch so its per-instruction hook still runs;
the LLVM replacement bytecode-JIT backend works with threaded dispatch.
The bundled standalone libsquirrel target retains its switch implementation.

## Interpreter-only results

Median of five alternating before/after pairs, CPU 0, 160,000 requested
iterations and three warmups per workload. The harness scales iteration counts
for individual cases. Both binaries use `SQGI_JIT=0`, int64/double,
RelWithDebInfo, GCC 13.3, no LTO or PGO. The baseline is a copy made before these
interpreter edits. The after build combines integer comparisons and threaded
dispatch. These are ordinary Squirrel programs, not typed kernels.

Nanoseconds per iteration; negative time change is faster. All checksums matched
in every round. Changes of a few percent should be treated cautiously.

| Workload | Before | After | Time change |
|---|---:|---:|---:|
| direct_call | 56.745 | 56.188 | -1.0% |
| branch_call | 64.460 | 57.834 | -10.3% |
| float_call | 40.338 | 40.155 | -0.5% |
| numeric_loop | 28.541 | 29.267 | +2.5% |
| vector | 2634.850 | 2591.781 | -1.6% |
| dynamic_member | 256.406 | 256.956 | +0.2% |
| dynamic_key_get_set | 53.681 | 54.425 | +1.4% |
| object_member_write_fallback | 169.981 | 138.813 | -18.3% |
| array_append | 52.756 | 50.112 | -5.0% |
| array_write | 24.681 | 22.456 | -9.0% |
| array_read | 15.160 | 13.115 | -13.5% |
| array_float | 15.613 | 13.449 | -13.9% |
| math_intrinsic | 283.950 | 288.737 | +1.7% |
| math_variable | 258.056 | 250.431 | -3.0% |
| matrix | 366.069 | 401.100 | +9.6% |

The useful gains are object-valued member writes, branching calls, and local
array access. Matrix operations regress; numeric-loop and math results do not
justify enabling threaded dispatch globally. This is an opt-in experiment,
not a claim that all interpreter programs became faster.

Earlier experiments with interpreter-side JIT-disabled guards and comparison
inlining in the opcode switch regressed other workloads and were removed.

## Reproduction

Preserve a before binary before rebuilding. Reuse the same configured build directory (shown as `build-interpreter` below)
to preserve compiler, JIT, and kernel options:

```sh
cmake -S . -B build-interpreter -DSQGI_THREADED_DISPATCH=ON
cmake --build build-interpreter -j
python3 tools/run_runtime_benchmarks.py \
  --sqgi build-interpreter/sqgi --sqgi-baseline /path/to/before/sqgi \
  --jit 0 --suite kernels --runs 5 --iterations 160000 --warmups 3 --cpu 0 \
  --output /tmp/interpreter-comparison.json
```

The comparison runner also executes Node, GJS, and Python and checks each against
the interpreter reference. `--jit 0` applies to every supplied SQGI binary;
the default remains `--jit 1`. Build metadata records the dispatch option and
bytecode backend. To isolate dispatch alone, compare current-source builds with
the option ON and OFF.

## Correctness coverage

`test_interpreter_dispatch.nut` covers temporary closure cleanup, tail calls,
exception unwinding with captured locals, closed loop variables, generators,
coroutine suspension/resumption, and debugger hooks. It is registered with JIT
disabled and enabled. The integer edge tests additionally cover all relational
operators and three-way comparison across signed extremes, aliased operands,
and the noninteger/metamethod fallbacks.

Validation: 29 selected normal-build tests and eight ASan/UBSan tests passed,
including both new dispatch test modes. The standalone bundled switch-dispatch
library also builds successfully.

## With the LLVM bytecode JIT enabled

A separate five-run comparison (80,000 requested iterations, five warmups,
CPU 0) checks this interpreter change alongside the existing LLVM backend.
All five runtimes passed all 15 checksum comparisons in all five rounds.
Compiled scalar/array cases stayed close to their previous timings. The
interpreter fallback cases changed as follows (ns/iteration):

| Workload | Before | After |
|---|---:|---:|
| Vector operations | 2758.163 | 2671.788 |
| Dynamic members | 276.738 | 246.363 |
| Object-valued member writes | 164.875 | 138.887 |
| Array append | 44.125 | 41.837 |
| Math intrinsics | 286.687 | 288.888 |
| Variable math calls | 259.775 | 251.412 |
| Matrix operations | 370.500 | 401.438 |

The matrix regression persists with the JIT enabled, reinforcing the decision
to keep threaded dispatch opt-in.

## Dynamic object reads

With threaded dispatch, dynamic-key `GET` now borrows an existing table slot or instance field directly,
avoiding the general `SQVM::Get` path on a hit. It dereferences weak slots and
retains the result in the existing VM temporary before replacing the destination,
including when the destination owns the receiver. Missing slots, instance methods,
delegation, metamethods, and noninteger array indices keep the general lookup path.
Integer array reads remain the first fast-path check. No slot pointer survives
a callback, mutation, or instruction boundary.

A cycles profile of mixed object, dynamic-key, append, and math workloads placed
64.5% of samples in interpreter execution, 5.4% in member-cache hits, 3.5% in raw
slot lookup, and 4.5% combined in general VM/table reads. This change reduces
the latter lookup overhead; it does not compile dynamic object loops wholesale.

Five alternating before/after pairs, i7-12700 CPU 0, 80,000 iterations, five
warmups, LLVM bytecode JIT and threaded dispatch enabled, no LTO/PGO:

| Workload | Before (ns/iteration) | After | Speedup |
|---|---:|---:|---:|
| Dynamic members | 254.563 | 214.138 | 1.19× |
| Dynamic key get/set | 54.350 | 50.388 | 1.08× |
| Object-valued member writes | 144.138 | 137.575 | 1.05× |
| Vector operations | 2622.387 | 2579.750 | 1.02× |
| Matrix operations | 404.725 | 394.025 | 1.03× |

All 15 workload checksums matched in every pair. Small changes outside the
targeted reads should be treated as noise/code-layout effects. The new path
still leaves dynamic objects substantially behind Node/GJS.

The dispatch regression script now checks dynamic instance fields and methods,
receiver/destination aliasing, live/dead weak values, table growth and reinsertion,
delegate and metamethod fallbacks, missing keys, and array/string index fallbacks.
Eight selected tests passed in the LLVM build and eight under ASan/UBSan;
five also passed in the switch-dispatch, JIT-disabled build.

A separate five-pair experiment with switch dispatch and JIT disabled showed
no consistent object improvement (dynamic members 227.100 → 232.112 ns,
dynamic keys 63.488 → 61.725 ns), and vectors regressed by about 4.8%.
Consequently the optimization is guarded by `SQ_VM_THREADED`; switch dispatch
retains its original read handler. The speedups above apply to the experimental
threaded configuration, not to default builds.
