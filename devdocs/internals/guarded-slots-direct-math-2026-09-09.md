# Checked table slots and direct AArch64 math calls, 2026-09-09

The combined implementation improves record updates **1.27–1.41×** across two
independent input seeds, table-method workloads **1.25–1.33×**, and original
math kernels **1.06–1.11×** against `9bc033d`. These are component measurements,
not end-to-end application or general Node/GJS parity claims. The final
seven-pair kernel check retains approximately 1% slower vector/direct-call
medians; array append is within 0.2%. All samples, including the rejected
cache-only candidate's regressions, are retained.

## Mechanisms and rationale

The initial application profile identified repeated receiver-specific cache
refills and weak-reference allocation. Table caches now retain only an index
hint, validated against the current receiver's bounds and requested key type
and identity on every hit. No shared shape is assumed. Receiver changes,
rehashing, deletion and slot reuse either preserve the matching field or
miss to ordinary lookup. Equal, non-identical strings still use the normal
content-equality lookup on a miss. Weak values keep normal dereference
semantics. Class caches retain their existing class-layout checks; table
hints retain no receiver. Obsolete table/cache version fields are removed
from the internal layout; all consumers are rebuilt together. The public
C API is unchanged.

The hint serves interpreter GETK/PREPCALLK and shared native math guards.
It does not add native coverage for record updates: their compound member
arithmetic still runs through the VM. The cache-only JIT-off comparison
reproduces the record gains, supporting applicability beyond native code.

The cache-only revision was held after original-count repeats reproduced
slower append and variable-math medians. Counters isolated a branch-prediction
lead in the guarded native-math path, rather than additional libm work.
The follow-up removes a general, redundant layer: AArch64 frame and loop
lowerers call the existing immutable audited math evaluator directly through
the scalar floating-point ABI. Compile-time spec/arity validation replaces
the shared dispatcher's repeated checks; closure identity guards and numeric
conversions remain. Both arguments are prepared in private slots before
loading FP argument registers, because preparing the second may call a helper.
No fast-math flags, approximate evaluators, benchmark names, input constants,
or address-padding workarounds are introduced. Other backends retain the
shared dispatcher.

The [cache-only experiment](table-slot-hints-2026-09-09.md) documents the
initial profile, ablation, failed regression check, and diagnostic selection
policy. Its benchmark tables are not the final combined results below.

## Build and measurement identity

Baseline: `9bc033d`, executable
`/tmp/sqgi-leaf-final-pgo-20260909.VirHdp/sqgi`, SHA-256
`e82f82a956ed18bdf1da3f85bc1c882561c9ef8ff2a3ad36d7495a4cd94c8796`.
Its 90 PGO files hash to
`2184d1bfbec21d52c51f9e549fcb410bdaafb026bc293f2a6d89c22956e8cf44`.

Combined candidate: the implementation accompanying this report, executable
`/tmp/sqgi-slot-math-pgo-20260909.wnI1gF/sqgi`, SHA-256
`47ed9fec3299141b8ddaa94f7e6aecf5fdaf9e5c228851e21f271e62329fd9c7`.
Its 90 PGO files hash to
`e2782c2088f93fd96ad66c2afdf7a0797ccfa92aa7d6cc0d72f9aacb1b371c7d`.

Both use GCC 13.3, Release (-O3), native AArch64 JIT, int64/double, LTO ON,
PGO USE and ASan OFF. The candidate used a fresh GENERATE/training/USE build.
Training comprised 99 selected CTests (excluding only
`^sqgi_test_sqgipkg$`), original kernels at 20,000 iterations/two warmups,
execution components at 20,000 iterations, and Vec3 variants at 20,000
iterations/two warmups. New correctness tests were included. Application,
member, owner, method, and floating holdouts and the diagnostic math-repeat
script were excluded. There are 22 missing-profile warnings for unused
standalone bundled Squirrel/sqstdlib targets, none for SQGI core, and no
coverage mismatches.

Host: Orange Pi 5 Pro (device-tree model), RK3588S, AArch64 Linux
6.1.0-1025-rockchip, CPU 4 pinned, maximum 2.304 GHz, ondemand governor.
Node 18.19.1, GJS 1.80.2 in module mode, Python 3.13.2. Cross-runtime runs use
five rotating rounds, five warmups, fresh processes and JIT threshold 1.
Each first obtains a JIT-off reference; integer checksums match exactly,
floating checksums within 1e-10. All checksums passed. No build/sanitizer
jobs ran during comparisons; unrelated workstation activity is uncontrolled.
Raw JSON records samples, source/executable/profile hashes, options, UTC
times and load averages. All tables use median nanoseconds per iteration;
speedup is baseline time divided by candidate time.

## Final cross-runtime comparisons

### Original kernels

160,000 base iterations, 3.2 million for scaled kernels.

| Workload | Baseline ns | Candidate ns | Speedup | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| direct_call | 38.38 | 38.32 | 1.00× | 6.78 | 10.69 | 336.30 |
| branch_call | 36.32 | 36.31 | 1.00× | 4.83 | 7.03 | 237.73 |
| float_call | 24.78 | 24.79 | 1.00× | 2.64 | 9.50 | 134.33 |
| numeric_loop | 22.77 | 22.79 | 1.00× | 7.45 | 12.75 | 239.56 |
| vector | 347.06 | 356.73 | 0.97× | 556.20 | 512.74 | 5147.08 |
| dynamic_member | 624.94 | 620.63 | 1.01× | 109.02 | 79.20 | 880.02 |
| dynamic_key_get_set | 165.38 | 162.79 | 1.02× | 62.27 | 27.90 | 405.23 |
| object_member_write_fallback | 395.29 | 382.85 | 1.03× | 12.68 | 47.04 | 684.41 |
| array_append | 76.52 | 77.75 | 0.98× | 39.86 | 18.40 | 221.60 |
| array_write | 25.54 | 25.51 | 1.00× | 4.60 | 6.06 | 187.64 |
| array_read | 10.34 | 10.23 | 1.01× | 2.63 | 3.52 | 83.75 |
| array_float | 6.80 | 6.76 | 1.01× | 2.19 | 3.07 | 73.75 |
| math_intrinsic | 225.84 | 207.86 | 1.09× | 41.15 | 9.87 | 560.72 |
| math_variable | 238.36 | 224.70 | 1.06× | 154.15 | 106.76 | 507.49 |
| matrix | 238.12 | 238.96 | 1.00× | 22.80 | 66.13 | 1138.68 |

[Raw kernel samples](table-slot-math-final-kernels-2026-09-09.json).

### Independent application components

Seed 83, 400,003 iterations.

| Workload | Baseline ns | Candidate ns | Speedup | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| route_balanced | 52.66 | 52.79 | 1.00× | 6.05 | 6.38 | 262.07 |
| route_skewed | 48.85 | 49.15 | 0.99× | 5.77 | 6.71 | 259.19 |
| pricing_events | 54.37 | 54.24 | 1.00× | 11.12 | 17.38 | 433.09 |
| filter_stream | 49.17 | 49.28 | 1.00× | 5.04 | 8.85 | 240.64 |
| records_64 | 343.28 | 243.13 | 1.41× | 15.51 | 38.58 | 572.48 |
| records_4096 | 404.84 | 300.13 | 1.35× | 20.01 | 42.77 | 658.54 |
| word_count | 207.10 | 208.56 | 0.99× | 74.24 | 123.38 | 366.79 |
| graph_walk | 11.01 | 11.00 | 1.00× | 4.78 | 6.73 | 129.61 |

[Seed 83 samples](table-slot-math-final-applications-seed83-2026-09-09.json).

Seed 17 at 200,000 iterations repeats the record gains: 343.55 → 243.54 ns
(1.41×) for 64 records, 396.62 → 313.22 ns (1.27×) for 4,096.
The larger record set varies substantially: candidate min-to-max range
relative to its median is 12.1% with seed 83 and 21.4% with seed 17.
The 64-record ranges are 0.82% and 0.21%. No samples were removed.
Other application components remain within 1% of their matched baseline.

[Seed 17 samples](table-slot-math-final-applications-seed17-2026-09-09.json).

Record processing still takes roughly 15–16× Node's time and 6–7× GJS's.
Object-member writes remain about 30× Node's time; improving table reads
alone does not eliminate member stores, dispatch or fallback costs. Vectors
remain faster than Node/GJS in this suite. Do not combine these heterogeneous
components into an unqualified overall speedup.

### Independent member and method workloads

Five rotating rounds, 200,000 iterations, five warmups, CPU 4; unchanged
workloads excluded from training, with JIT-off checksum references.

| Workload | Baseline ns | Candidate ns | Speedup | Node ns |
| --- | ---: | ---: | ---: | ---: |
| table_events_97 | 486.14 | 430.55 | 1.13× | 75.52 |
| class_events_97 | 372.32 | 367.40 | 1.01× | 74.39 |
| buffers_7 | 361.79 | 350.87 | 1.03× | 12.41 |
| buffers_31 | 361.87 | 351.50 | 1.03× | 12.36 |
| calibrate_17 | 64.70 | 64.58 | 1.00× | 8.78 |
| calibrate_67 | 65.28 | 65.02 | 1.00× | 8.32 |
| transfer_table | 475.36 | 358.37 | 1.33× | 17.89 |
| transfer_class | 380.11 | 371.88 | 1.02× | 17.69 |
| transfer_mixed | 468.11 | 434.40 | 1.08× | 29.12 |
| publish_table | 369.32 | 295.88 | 1.25× | 13.42 |
| publish_class | 307.44 | 301.66 | 1.02× | 13.72 |
| publish_mixed | 363.98 | 339.70 | 1.07× | 20.89 |

[Member samples](table-slot-math-final-members-2026-09-09.json),
[method samples](table-slot-math-final-methods-2026-09-09.json).

The varied 97-record event workload improves 1.13×. Table-based
transfer/publish improve 1.33×/1.25×; mixed table/class workloads improve
1.08×/1.07×. These independent workloads support a general table-access
benefit rather than only an effect on the new record-update component.

Seven independent floating workloads remain within 0.6% of baseline,
including helper_control at 59.16 → 59.37 ns. No floating-holdout speedup is
demonstrated by this revision; the 6–11% math gain refers to the original
math kernels. All 15 audited evaluators have semantic/native-route tests.

[Floating holdout samples](table-slot-math-floats-2026-09-09.json).

Five additional alternating execution-suite pairs at 160,000 iterations
leave temporary arrays (145.69 → 145.55 ns), GI scalar calls
(1471.93 → 1471.28 ns), and parameter-array guards (11.52 → 11.51 ns)
approximately unchanged. GI clock calls measure 682.03 → 687.29 ns
(0.8% slower). All four checksums match. This suite was included in PGO
training, so it is a regression check rather than an independent holdout.

[Execution-suite samples](table-slot-math-final-execution-2026-09-09.json).

## Confirmation, variance, and counter evidence

A final seven alternating SQGI-only pairs at the original 160,000 count
measures intrinsic math 225.22 → 202.68 ns (1.11×) and variable math
237.81 → 224.56 ns (1.06×). Object-member writes improve 1.03×.
Vector is 349.04 → 352.39 ns (about 1% slower), direct calls
38.21 → 38.61 ns (about 1% slower), and append 77.33 → 77.49 ns
(0.2% slower). Other medians are within 1.7%.

The cross-runtime vector median was 2.8% slower and append 1.6% slower
(candidate append sample range 13.6%). The final paired check does not
reproduce a material append regression; it does not establish an append
gain either. Keep the approximately 1% vector/direct-call differences
visible. The initial five-pair combined run also retained the math gains;
none of these runs replaces or erases the failed cache-only experiment.

[Seven-pair confirmation](table-slot-math-final-kernel-confirmation-2026-09-09.json),
[initial combined pairs](table-slot-math-kernel-pairs-2026-09-09.json).

The diagnostic script retains the full original suite prelude, then repeats
the unchanged variable-math workload 24 times at 160,000 iterations and
five warmups. It is not an independent application or cross-runtime result.
Cache-only runs 1–6 were a condition-finding search stopped at the first
24-repeat mean above 0.26 us. All six are retained. Baseline has one counter
run; the combined candidate has three fixed runs with none discarded.

| Diagnostic run | Instructions, billions | Cycles, billions | Branch misses, millions | Repeat median ns |
| --- | ---: | ---: | ---: | ---: |
| Baseline | 64.863 | 23.682 | 10.15 | 241.57 |
| Cache-only fast 1 | 64.833 | 23.730 | 10.26 | 240.52 |
| Cache-only slow 6 | 64.833 | 25.224 | 81.92 | 267.85 |
| Combined 1 | 60.471 | 23.079 | 31.25 | 227.98 |
| Combined 2 | 60.471 | 22.838 | 10.21 | 224.73 |
| Combined 3 | 60.471 | 22.811 | 8.30 | 224.16 |

The cache-only fast/slow runs retire effectively identical instruction
counts, with about eightfold more branch misses in the slow case. The exact
address/history trigger is not proven. Direct evaluator calls reduce retired
instructions about 6.7%; all three combined runs beat the old fast regime.
Residual branch variability remains (8–31 million misses); the old slow
regime was not reproduced, not proven impossible.

[Raw counter text, output, hashes, and reproduction recipe](table-slot-math-dispatch-counters-2026-09-09.json).

## Correctness and remaining limits

- Fresh PGO training: 99/99 selected CTests passed.
- Final PGO/LTO USE build: 99/99 passed, including installation; a subsequent
  pre-commit rerun also passed 99/99.
- Ordinary Release: all 28 focused JIT/cache tests passed.
- Debug ASan/UBSan (-O1 -g -mstrict-align): 98/99 passed, retaining assertions,
  leak checking and stack-use-after-return checking. The remaining scalar-leaf
  `_gc_chain == NULL` teardown assertion was reproduced on untouched baseline
  code in the [previous iteration](aarch64-leaf-control-flow-2026-09-09.md).
  It is still an unresolved defect, not a passing sanitizer suite. Strict
  alignment is the documented installed-GCC sanitizer workaround, not a
  benchmark flag or disabled sanitizer check.
- All eight application and seven floating holdouts passed sanitizer checks
  at 20,003 iterations/one warmup without leaks.
- At the default JIT threshold 1000, all eight application checksums match
  the interpreter at 20,003 iterations/one warmup/seed 83; native diagnostics
  report ten successful loop executions and zero guard failures. Performance
  tables use threshold 1 and warmed measurements, not startup latency.

Cache tests cover receiver alternation, differing insertion orders, colliding
key reuse, bounds/null/type checks, weak values, exact ownership counts,
class/table transitions, sparse caches, delegates, method replacement and
_get fallback. A deterministic 4,096-step structural-mutation stress compares
131,072 hinted reads with ordinary lookup across 17 tables. Native math tests
cover all 15 audited evaluators in both frame and loop execution, signed zero,
negative/exceptional FP values and retained mixed integer/float arguments.
Native execution was tested on AArch64, not an x64 host; x64 emitters and
shared correctness tests run here but do not establish x64 runtime performance.

Build/test logs remain locally under
`/tmp/sqgi-slot-math-pgo-{training-tests,tests,use-build}.log` and
`/tmp/sqgi-direct-math-{release-tests,asan-tests,asan-applications,asan-floats}.log`.

## Updated profile and next bottleneck

A fresh profile of the combined binary uses all eight application components,
three million iterations, one warmup, seed 83, CPU 4:
`perf record -F 499 -g --call-graph dwarf,8192`. It captured 2,910 samples,
none lost, approximately 13.20 billion user cycles. Aggregate self shares:

| Symbol | Self sample share |
| --- | ---: |
| SQVM::Execute | 53.71% |
| SQTable::Get | 10.26% |
| sqjit_a64_get_member_value | 4.22% |
| SQTable::Set | 3.11% |
| sqjit_a64_helper_member_closure_guard | 3.07% |
| SQVM::Get | 2.90% |
| SQVM::DerefInc | 2.69% |
| SQVM::ARITH_OP | 1.45% |

These are sample shares, not causal speedups or normalized per-component
costs. The capture lives at
`/tmp/sqgi-slot-math-final-applications-profile.{data,log}`.
Record loops still reject at `unsupported loop COMPARITH get`. Word counting
also has unsupported loop branch structure. The next broad target is
general member read-modify-write/native object handling with correct alias,
lifetime and guard-failure behavior, assessed against the unchanged member,
method and application holdouts. Full application validation and broad
Node/GJS parity remain unfinished.
