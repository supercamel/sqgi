# Further JIT math optimization

This pass builds on the [bytecode/JIT optimization implementation](bytecode-jit-implementation-2026-09-07.md).
The comparison baseline is that previous working-tree build, including its first
native x86 math implementation; it is not the older `31142ce` commit.

## Implementation

The x86 whole-function and loop paths now use native signed integer-to-float
conversion and call the existing audited floating evaluators directly through
XMM0/XMM1. This removes conversion and math-dispatch helper calls without changing
the evaluator or adding algebraic approximations. System V and Win64 argument
encodings are covered by the encoder tests.

`SQJitX64Calls::HoistGuards` moves invariant root-table callee and numeric delegate
checks before a pure region. It refuses hoisting when the region writes its
receiver, mutates heap state, or accesses outers. CALL/TAILCALL remain eligible
because this lowerer only admits audited pure math/conversion calls. Any future
call lowering that can reenter the VM must disable or revise that assumption.
All checks still execute on every native entry, including loop entry. A failed
check uses the existing interpreter fallback. Hoisted table checks use uncached
reads so replacing an old cache owner cannot run release hooks in the prologue.

Mutating regions retain checks at their original sites. The regression suite
changes `this.sqrt` between two calls and verifies the interpreter's error and
final mutation, catching an incorrectly hoisted second check. It also replaces
`sqrt` between entries to warmed whole functions and loop regions and asserts
native guard failure before fallback.

Testing exposed two related conversion correctness gaps. AArch64 now checks the
actual `tofloat` delegate at PREPCALL/PREPCALLK sites. The shared conversion guard
also rejects native closures with bound environments: those replace the numeric
receiver, even when their function pointer and parameter signature are unchanged.
A test reproduced the wrong result before that guard was added.

## Measurements

Linux x86_64, Intel Core i7-12700, GCC 13.3 Release. Five comparisons at 80,000
iterations, hotness threshold 1, with baseline/optimized order alternated.
Processes were pinned to CPU 0 and timings ran without concurrent builds/tests.
Times are median microseconds per benchmark iteration. Hardware performance
counters were unavailable (`perf_event_paranoid=4`); these are wall-clock
measurements and code-path comparisons, not sampled hardware profiles.

| Kernel | Previous JIT | New JIT | Improvement over previous JIT | New JIT / interpreter speedup |
| --- | ---: | ---: | ---: | ---: |
| array_append | 0.037538 | 0.040263 | 0.932x | 1.647x |
| array_write | 0.010725 | 0.010200 | 1.051x | 3.157x |
| direct_call | 0.035841 | 0.038174 | 0.939x | 1.806x |
| dynamic_key_get_set | 0.062812 | 0.067925 | 0.925x | 0.920x |
| dynamic_member | 0.255812 | 0.270312 | 0.946x | 0.982x |
| math_intrinsic | 0.089150 | 0.021075 | 4.230x | 13.038x |
| math_variable | 0.081112 | 0.032775 | 2.475x | 7.399x |
| matrix | 0.418012 | 0.433250 | 0.965x | 0.997x |
| numeric_loop | 0.009879 | 0.009864 | 1.002x | 3.665x |
| object_member_write_fallback | 0.187375 | 0.198162 | 0.946x | 0.971x |
| vector | 2.769988 | 2.855362 | 0.970x | 1.012x |

The original math kernel improves **4.23x** over the previous JIT and **13.04x**
over its interpreter run. A new `math_variable` kernel varies every math input
and includes sqrt, sin, cos, log, atan2 and pow; it improves **2.48x** over the
previous JIT and **7.40x** over its interpreter run. Separate internal route
observations confirm native frame and direct execution of both kernels.

Removing helper dispatch/conversion alone measured about 1.24x on the original
math kernel in an earlier unpinned five-run comparison. Hoisting repeated checks
accounts for the larger combined gain. The original kernel has several constant
arguments, so its result should not be treated as a forecast for arbitrary math
applications; the variable-input kernel provides a second case.

Untargeted workloads do not show a general speedup. Several medians are 3–8%
slower than the saved baseline, while the numeric loop is essentially unchanged.
Interpreter-only timings also moved, so the cause of those smaller differences
has not been isolated; code layout and execution variability remain possible
contributors. The complete table is retained rather than claiming universal
improvement.

A rollback-log growth experiment transferred references instead of copying and
releasing them. It was removed after five alternating comparisons showed no win
for distinct writes (16,000-write medians: baseline 548.2 us, experiment 574.1 us).
The prior log implementation remains intact. New mixed array/member growth
lifetime checks remain useful coverage. The permanent write benchmark now batches
invocations, with configurable repetitions, to reduce timer/scheduling noise.

## Validation

- x86 Release: 85/85 tests pass, excluding the previously failing external
  packaging-download test.
- x86 ASAN+UBSAN with leak detection: 85/85 pass with the same exclusion.
- After the final prologue lookup adjustment, all 9 affected JIT contract,
  encoder, value, intrinsic, write-log and performance tests pass in both builds.
- AArch64: all 8 focused core executables pass under `qemu-aarch64-static`,
  including the new delegate-rebinding and bound-environment cases.
- The expanded performance correctness script passes in the JIT-disabled build.
- Float contracts cover all 15 audited functions, normal and negative inputs,
  signed zero, infinities, NaNs, binary argument order, and signed conversion at
  mantissa and integer-range boundaries. Tests assert native execution.
- Existing late-mutation rollback tests pass, alongside new root-callee mutation,
  numeric-delegate rebinding and bound-receiver regressions.
- Win64 validation is encoding coverage; this pass does not establish Windows
  runtime correctness. AArch64 results are emulated, not hardware speed claims.

## Reproduction

```sh
# Run each build serially on an available CPU; use the matching library path.
LD_LIBRARY_PATH=BUILD taskset -c 0 python3 tools/run_jit_median_benchmarks.py --sqgi BUILD/sqgi --runs 5 80000
PYTHONDONTWRITEBYTECODE=1 LD_LIBRARY_PATH=BUILD python3 tools/run_jit_write_log_benchmarks.py --sqgi BUILD/sqgi --runs 5 --repetitions 50
ctest --test-dir BUILD -E '^sqgi_test_sqgipkg$' --output-on-failure
```

Session evidence is under `/tmp/sqgi-jit-next-20260907/`: `baseline/` contains the
saved executable and matching shared library; `pinned-medians.log` and
`pinned-samples.json` contain final timings; `routes.log` contains native-route
observations. Release/sanitizer/AArch64 and focused regression logs are there too.
These are session artifacts rather than repository dependencies.
