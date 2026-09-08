# AArch64 scalar call control flow, 2026-09-09

This iteration extends AArch64 native loops to inline bounded scalar callees
with forward branches and multiple returns. It targets reusable call and
control-flow machinery, without matching function names or benchmark values.

Status: the final optimized build passed all 99 selected correctness tests.
The scalar-call gains survived the ownership fix, two holdout seeds and a
paired confirmation. Sanitizers passed 98/99 tests; the remaining baseline
VM-teardown assertion is documented below. Broader Node/GJS parity is not achieved.

## Evidence and implementation

Before the change, the original branch-call kernel rejected native loop
compilation with `unsupported loop direct CALL`. Its leaf function could run
natively, but the enclosing loop still dispatched each call through the VM.
The independent application workloads reproduced this limit in event routing,
pricing and stream filtering.

The existing shared `SQJitLeafPlan` validates the callee's control flow and
propagates scalar types at joins. Its limits remain 64 instructions, 32 slots
and eight parameters including the receiver. AArch64 now lowers this plan
inside a loop, using private callee slots, guarded arguments and the existing
closure-identity guard. Every return copies its scalar result before joining
the caller. Result constants are cleared at the return join. Unsupported
callees retain interpreter fallback. Straight-line callees retain their
existing lowering.

The newly reachable loops also exposed an entry-load defect: a scalar first
read by `DMOVE` could be loaded inside the loop body on every iteration,
restoring the original VM value after native updates. Scalar values live at
the header are now loaded before the backedge target, using the existing
bytecode liveness analysis. This includes boolean values carried between
iterations.

Holdout LeakSanitizer validation subsequently exposed a reference leak in newly
reachable loops. Writeback selected raw scalar stores from the VM slot's tag
at compilation time, but a dead temporary can contain a string or other
reference on a later invocation. The implementation assigns scalar live-outs
through the existing reference-safe helpers, using the current VM tag. This
work occurs once at loop exit, not on every iteration. A focused regression
warms the loop with null temporaries and then repopulates those slots with a
string; its C++ companion checks the exact reference count and actual native
loop execution. The pre-fix candidate leaks; the revised candidate passes.

At 20,000 iterations and one warmup, JIT diagnostics for the application suite
changed from 159,998 native direct-call dispatches and no successful native
loops to one direct-call dispatch and eight successful native-loop invocations
across three loop prototypes, with zero loop guard failures. These are
execution-route counts, not timing measurements. Record updates still reject
at `COMPARITH get`; word counting still rejects its branch shape.

## Workloads and measurement

The new independent suite covers eight application components:

| Workload | Behavior |
| --- | --- |
| route_balanced | Array-fed scalar calls with roughly balanced branches |
| route_skewed | The same route logic with a mostly taken branch |
| pricing_events | Multiple early returns, parameter assignment, retained caller arguments |
| filter_stream | Mixed integer/double calls, branches and a running filter |
| records_64 | Mutable records with two field insertion orders |
| records_4096 | The same record algorithm with a larger working set |
| word_count | String-key lookup, insertion and repeated updates |
| graph_walk | Dependent reads through a permutation of 4,096 nodes |

These are component workloads rather than complete applications. The input
arrays are built outside timing. Each timed invocation includes its own
mutable state initialization. Node and GJS share the same JavaScript file;
Python uses standard objects, lists and dictionaries. Integer checksums are
compared exactly; doubles use a relative/absolute tolerance of 1e-10. Every
comparison first obtains a reference with SQGI's JIT disabled.

The baseline is commit `bcc797b`, built in
`/tmp/sqgi-pgo-bench-20260909.cin4E4`. The candidate is built in
`/tmp/sqgi-leaf-final-pgo-20260909.VirHdp`. Both use GCC 13.3, Release,
`SQ_ENABLE_JIT=ON`, `SQGI_ENABLE_LTO=ON`, int64/double, and
`SQGI_PGO_MODE=USE`. Each profile was generated in its own build directory
using the correctness suite, the original JIT kernels at 20,000 iterations
and two warmups, `bench_execution.nut` at 20,000 iterations, and
`bench_vec3.nut` at 20,000 iterations and two warmups. Candidate correctness
training additionally includes the new semantic regressions.

The new application suite and its ports are excluded from profile training.
The comparison runner records executable and source hashes, profile identity,
build settings, runtime versions, CPU settings, raw samples and timing spread.

## Final results

Five rotating rounds per suite, five full warmups per process, CPU 4 on a
Rockchip RK3588S (2.304 GHz maximum, ondemand governor). Node was v18.19.1,
GJS 1.80.2 in module mode, and Python 3.13.2. Both SQGI builds use JIT, PGO
and LTO. Each has 90 profile files. Final candidate executable SHA-256:
`e82f82a956ed18bdf1da3f85bc1c882561c9ef8ff2a3ad36d7495a4cd94c8796`.
Candidate profile SHA-256:
`2184d1bfbec21d52c51f9e549fcb410bdaafb026bc293f2a6d89c22956e8cf44`.

The original suite used 160,000 base iterations (3.2 million for its scaled
kernels). The independent suite used 200,000 iterations with seed 17, then
400,003 iterations with seed 83. All checksums matched across every runtime
and the JIT-off reference. No agent build or sanitizer jobs ran during these
final comparisons; unrelated workstation activity remained present.
Numbers below are median nanoseconds per iteration; lower is faster.

### Original kernels

| Workload | Baseline ns | Candidate ns | Speedup | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| direct_call | 39.11 | 38.80 | 1.01× | 6.85 | 10.91 | 340.95 |
| branch_call | 103.55 | 36.82 | 2.81× | 4.89 | 7.20 | 240.54 |
| float_call | 25.45 | 25.26 | 1.01× | 2.67 | 9.66 | 136.24 |
| numeric_loop | 23.10 | 23.10 | 1.00× | 7.57 | 12.93 | 242.74 |
| vector | 351.97 | 353.43 | 1.00× | 597.38 | 526.65 | 5208.51 |
| dynamic_member | 638.83 | 633.89 | 1.01× | 110.63 | 80.28 | 897.79 |
| dynamic_key_get_set | 168.01 | 165.58 | 1.01× | 63.10 | 28.16 | 411.74 |
| object_member_write_fallback | 406.76 | 401.78 | 1.01× | 12.79 | 47.76 | 692.56 |
| array_append | 79.33 | 69.01 | 1.15× | 34.51 | 19.13 | 225.58 |
| array_write | 26.83 | 25.89 | 1.04× | 4.59 | 6.15 | 189.88 |
| array_read | 10.38 | 10.37 | 1.00× | 2.67 | 3.56 | 85.07 |
| array_float | 6.89 | 6.94 | 0.99× | 2.22 | 3.13 | 74.80 |
| math_intrinsic | 230.05 | 231.29 | 0.99× | 42.10 | 10.25 | 568.05 |
| math_variable | 242.91 | 240.44 | 1.01× | 157.71 | 107.80 | 518.76 |
| matrix | 241.63 | 242.00 | 1.00× | 23.07 | 66.99 | 1153.17 |

[Final raw samples and provenance](aarch64-leaf-final-kernels-2026-09-09.json).

The branch-call kernel improved **2.81×**. Its remaining gap is 7.53 times
Node's time and 5.12 times GJS's time, versus 21.19 and 14.39 times before.
Variable math improved about 1%, and float-call was also within 1% of baseline:
the earlier apparent math regression did not recur. Vector, floating-array,
intrinsic-math and matrix medians were within 1% of baseline. Array append
had a 30% candidate sample range, so its apparent 15% gain is not attributed
to this optimization.

### Independent components, seed 83

| Workload | Baseline ns | Candidate ns | Speedup | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| route_balanced | 149.83 | 54.04 | 2.77× | 6.08 | 6.53 | 266.39 |
| route_skewed | 144.49 | 50.18 | 2.88× | 5.92 | 6.76 | 266.67 |
| pricing_events | 192.66 | 55.90 | 3.45× | 11.36 | 17.71 | 441.34 |
| filter_stream | 161.29 | 50.06 | 3.22× | 5.11 | 9.26 | 247.18 |
| records_64 | 356.78 | 350.28 | 1.02× | 15.93 | 39.10 | 581.45 |
| records_4096 | 443.94 | 437.16 | 1.02× | 20.57 | 44.46 | 681.56 |
| word_count | 212.86 | 211.77 | 1.01× | 75.94 | 127.61 | 376.91 |
| graph_walk | 11.15 | 11.34 | 0.98× | 4.86 | 7.11 | 131.74 |

[Seed 83 raw samples and provenance](aarch64-leaf-final-applications-seed83-2026-09-09.json).

The call-heavy components retain **2.77–3.45×** gains with this second seed
and irregular trip count. Their candidate sample ranges were 1.3–3.4% of
their medians. SQGI is still substantially slower than Node/GJS; record
mutation remains particularly expensive. These are component measurements,
not proof of end-to-end application parity.

### Variation and paired confirmation

The seed-17 cross-runtime run encountered substantial workstation outliers:
balanced routing ranged from 53 to 136 ns, and 64-record updates from 350 to
967 ns. Its apparent 14% record-update improvement did not reproduce in the
second seed. The 4,096-record variant also remained noisy in seed 83.
[Seed 17 raw samples](aarch64-leaf-final-applications-seed17-2026-09-09.json)
retain all outliers; no samples were discarded.

A subsequent SQGI-only confirmation used seven alternating pairs, seed 17,
200,000 iterations and five warmups on CPU 4. Both executable hashes match
the final cross-runtime comparison. All checksums matched.

| Workload | Seed 17, cross-runtime | Seed 83, cross-runtime | Seed 17, paired |
| --- | ---: | ---: | ---: |
| route_balanced | 2.74× | 2.77× | 2.75× |
| route_skewed | 2.91× | 2.88× | 2.84× |
| pricing_events | 3.41× | 3.45× | 3.45× |
| filter_stream | 3.14× | 3.22× | 3.21× |
| records_64 | 1.14× | 1.02× | 1.03× |
| records_4096 | 1.02× | 1.02× | 1.01× |
| word_count | 1.01× | 1.01× | 1.01× |
| graph_walk | 0.98× | 0.98× | 1.00× |

[Paired samples, output and executable/source identities](aarch64-leaf-final-applications-confirmation-2026-09-09.json).

The repeat confirms the call improvements, while record updates, word counting
and graph traversal remain essentially unchanged. Small control-workload
differences are not claimed as gains. No material regression was reproduced
in the final broad suite and paired confirmation.

### Earlier measurements

The initial scalar-call candidate, before the reference-writeback fix, was
`/tmp/sqgi-leaf-pgo-20260909.KKizCU/sqgi`, SHA-256
`26065e2d9df52a445327326a81bd286b33e06ffbe679024a87c3f1ef31531c83`.
Its original [kernel results](aarch64-leaf-kernels-2026-09-09.json),
[seed-17 holdouts](aarch64-leaf-applications-seed17-2026-09-09.json),
[seed-83 holdouts](aarch64-leaf-applications-seed83-2026-09-09.json), and
[quieter kernel confirmation](aarch64-leaf-confirmation-2026-09-09.json)
are retained as historical evidence. Initial runs overlapped sanitizer work;
the quieter confirmation suspended those jobs and did not reproduce the
initial variable-math slowdown. Those artifacts are superseded by the final
results above and do not validate the pre-fix candidate's ownership behavior.

## Validation and remaining work

The final PGO/LTO build passed all 99 CTest cases selected by excluding
`sqgi_test_sqgipkg`. The new native-route test verifies actual AArch64 loop
execution. Semantic regressions cover branch joins, early returns, retained
arguments, integer/double arithmetic, booleans carried between iterations,
closure replacement and interpreter fallback after an inlined division guard.
The guard test also checks that prior native table writes are rolled back
before interpretation resumes.

An unoptimized Debug ASan/UBSan run passed the new regressions, including the
native route and rollback checks. It exposed timer/fixture failures under
concurrent load; the async and download cases passed on serial reruns. Several
existing tests exceeded their 30/60-second limits at this build setting.
The scalar-leaf C++ test asserted at VM teardown (`_gc_chain == NULL`).
An isolated checkout of baseline `bcc797b`, built with the same Debug
ASan/UBSan options, reproduces the same assertion. That issue predates this
optimization and remains unresolved.

Profiling the unexpectedly slow sanitizer run found 99.47% of samples in
`__asan_stack_malloc_0/1`. Disassembly showed missing fake-stack flag cleanup,
matching the [GCC FakeStack cleanup fix](https://gcc.gnu.org/pipermail/gcc-cvs/2025-January/416553.html).
On the installed GCC 13.3, a standalone 200,000-call reproducer exceeded five
seconds with ordinary ASan flags; adding `-mstrict-align` emitted the cleanup
and completed in 0.02 seconds. This is a sanitizer-build workaround, not a
change to benchmark compiler options or a disabled sanitizer check.

The revised candidate's fresh Debug `-O1 -g -mstrict-align` build retained
assertions, ASan, UBSan, leak checking and stack-use-after-return checking.
All 99 selected CTests completed in 15.48 seconds: 98 passed, with only the
same baseline scalar-leaf teardown assertion failing. The eight application
components passed without leaks at 20,003 iterations, one warmup and seed 83.
The final added ownership tests (C++ reference counts plus script/native-route
regressions) passed on a separate three-test rerun. All eight application
checksums also matched exactly at JIT thresholds 1 and 1,000, including
compilation after interpreted iterations. Artifacts are in
`/tmp/sqgi-leaf-asan-strict-20260909.M32jMl` and
`/tmp/sqgi-leaf-asan-strict-{tests,applications,regressions}.log`.

## Profile guiding the next iteration

With the initial scalar-call candidate, a cycles profile of all eight application components at
1,000,000 iterations, one warmup and seed 83 recorded about 4,000 samples
with none lost. It used the candidate PGO/LTO executable, pinned to CPU 3,
`perf record -F 499 -g --call-graph dwarf,8192`. These percentages are aggregate
self time, not benchmark speedups or a breakdown of any one component:

| Symbol | Sample share |
| --- | ---: |
| SQVM::Execute | 40.13% |
| SQTable::Get | 8.97% |
| sq_member_cache_fill | 8.22% |
| SQVM::Get | 4.42% |
| SQTable::_Get | 3.70% |
| sqjit_a64_helper_member_closure_guard | 3.30% |
| sqjit_a64_get_member_value | 2.82% |
| SQVM::DerefInc | 2.47% |

Call stacks also place weak-reference allocation and reclamation under
`sq_member_cache_fill`. The current table cache is receiver-identity-specific,
so cycling through distinct records refills it even when their fields match.
Separately, AArch64's loop `COMPARITH` lowering handles arrays but not member
updates: `row.count += 1` rejects the entire record loop. General guarded
member read/modify/write lowering is therefore a concrete next target, with
receiver-independent checked slot hints a further runtime opportunity.
Neither proposed change is included in the results above.

Local profiling artifacts: `/tmp/sqgi-leaf-applications-profile.data`,
`/tmp/sqgi-leaf-applications-profile.log`, and
`/tmp/sqgi-leaf-applications-profile-summary.txt`.

Next priorities are the general object/array paths that prevent record updates
and string-key control flow from becoming native loops, followed by closure
guard overhead and scalar spill traffic in already-native loops. The measured
record-update and dynamic-member gaps remain substantially larger than the
remaining pure-array gaps. Keep this new suite outside PGO training in future
iterations, and retain the second seed and working-set variants when evaluating
changes.
