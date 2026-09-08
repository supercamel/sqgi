# Checked table slot hints, 2026-09-09

Historical cache-only experiment. The [final combined implementation and
validation](guarded-slots-direct-math-2026-09-09.md) supersede the preliminary
follow-up below; all cache-only measurements remain unchanged.

Status: the cache-only candidate is **not accepted for release**. Record and
member gains generalize across the holdouts, and the fresh PGO/LTO build
passed 99/99 selected tests. Sanitizers passed 98/99 with the previously
reproduced scalar-leaf VM-teardown assertion remaining. However, repeating
the original kernel trip count reproduced slower array-append and
variable-math medians. The regression investigation and a follow-up math
lowering prototype are described below. All benchmark tables in this report
describe the cache-only binary, not the follow-up prototype.

## Profile and mechanism

A profile of baseline `9bc033d` running all eight independent application
components placed 42.88% of aggregate self samples in `SQVM::Execute`,
10.22% in `SQTable::Get`, 6.01% in `sq_member_cache_fill`, and 3.24% in
`SQTable::_Get`. Weak-reference allocation and reclamation also appeared
under cache refills. The capture used CPU 4, one million iterations, one
warmup and seed 83, with `perf record -F 499 -g --call-graph dwarf,8192`.
No samples were lost. These are aggregate sample shares, not speedups or
percentages of an individual component.

The old table cache retained a weak reference to one receiver and checked its
identity and layout version. Cycling through records therefore refilled it
even when the requested field occupied the same position.

The replacement stores only an index hint for tables. Every hit checks the
current receiver's type, index bounds, key type and raw key identity before
reading the value. It does not assume a shared shape or retain a table, key,
or borrowed slot pointer. A different field at the old index misses; rehashes,
deletions, shrinking and receiver changes need no version counter. A same-key
field that still occupies the hinted index remains valid after mutation.
Equal but non-identical strings can miss the hint and use the existing
content-equality lookup. Reads still dereference weak values normally.

The shared helper serves interpreter `GETK`/`PREPCALLK` sites and native math
guards. Class and instance caches retain their existing class-layout checks;
each cache still belongs to a single constant-key bytecode site. Table cache
fills release any previously cached class. Table versions and per-cache
versions are removed because no remaining consumer needs them. All internal
consumers are rebuilt together; no public C API changes.

This is a supporting-runtime optimization, not new AArch64 instruction
lowering. It contains no benchmark/function-name matching or input constants.
It can benefit applications that repeatedly access records or other tables,
including execution that remains interpreted.

## Builds and validation

Baseline: `9bc033d`, preserved in
`/tmp/sqgi-leaf-final-pgo-20260909.VirHdp/sqgi`, SHA-256
`e82f82a956ed18bdf1da3f85bc1c882561c9ef8ff2a3ad36d7495a4cd94c8796`.

Candidate: `/tmp/sqgi-slot-hint-pgo-20260909.AqwIFD/sqgi`, SHA-256
`eadb8d9dfce30b7bd962d4334814c2bdc5afe4078f029f62316c0fec921f5fc9`.
Both are GCC 13.3 Release, int64/double, native AArch64 JIT, LTO and PGO USE.
The candidate's 90 profile files hash to
`c8bad21006340beedc8d8d13013201577d50884085aaaae52463fc0b0c2b45f9`.

Training was performed in GENERATE mode in the same candidate directory:
99 selected CTests, original JIT kernels at 20,000 iterations/two warmups,
execution components at 20,000 iterations, and Vec3 variants at 20,000
iterations/two warmups. The new cache correctness tests are included.
Application, member, owner, method and float holdouts remain excluded.
All training tests passed, as did all 99 tests after rebuilding in USE mode.
The package-manager test was excluded, as in the baseline. The fresh build's
install test passed. Missing-profile warnings concern only unused standalone
bundled Squirrel/sqstdlib shared-library targets, not SQGI core; there were
no profile mismatches.

The cache tests cover alternating receivers, no weak-reference allocation,
same-index reuse by a colliding key, key types, invalid bounds, null keys,
weak values and exact reference counts, class/table transitions, rehashes,
shrinking and clears. A deterministic 4,096-step mutation test compares
131,072 hinted reads against ordinary lookup across 17 tables. Script coverage
also exercises repeated method calls, method replacement, delegates and
`_get` fallback. Existing native math and backend-route tests passed.

The regular Release build passed 98/98 selected tests (excluding its existing
root-owned install artifact and the package-manager test). The fresh optimized
build passed 99/99, including installation. Debug ASan/UBSan with
`-O1 -g -mstrict-align` passed 98/99, retaining assertions, leak checking and
stack-use-after-return checking. The remaining `_gc_chain == NULL` assertion
in the scalar-leaf C++ test was already present in the
[previous iteration](aarch64-leaf-control-flow-2026-09-09.md).
The application and mixed-member suites also passed sanitizer checks at
20,003 iterations and one warmup, without leaks. The strict-alignment option
is the previously documented GCC sanitizer workaround, not a benchmark flag.

Local logs: `/tmp/sqgi-slot-hint-{release-full-tests,asan-tests,asan-applications,asan-methods}.log`
and `/tmp/sqgi-slot-hint-pgo-{training-tests,tests,use-build}.log`.

## Measurements

Five rotating rounds, five warmups, fresh processes, CPU 4 on RK3588S
(maximum 2.304 GHz, ondemand governor), Node 18.19.1, GJS 1.80.2 in module
mode and Python 3.13.2. All cross-runtime runs first obtain a JIT-off
correctness reference. Integer checksums are exact; floats use tolerance
1e-10. No build or sanitizer jobs run during these comparisons; unrelated
workstation activity is not controlled. Raw samples, outliers, executable
and source hashes, build/profile identities, UTC times and load averages
are retained. Timings below are median nanoseconds per iteration, lower
being faster.

### Original kernels

160,000 base iterations (3.2 million for scaled kernels). All checksums
matched. The array-append median in this cross-runtime run is slower and
is discussed separately below; it is not silently discarded.

| Kernel | Baseline ns | Candidate ns | Speedup | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| direct_call | 38.95 | 39.40 | 0.99× | 6.86 | 10.81 | 342.24 |
| branch_call | 36.78 | 36.62 | 1.00× | 4.90 | 7.08 | 241.14 |
| float_call | 25.20 | 25.11 | 1.00× | 2.68 | 9.57 | 135.66 |
| numeric_loop | 23.05 | 23.02 | 1.00× | 7.53 | 12.83 | 242.40 |
| vector | 352.44 | 350.17 | 1.01× | 576.60 | 520.94 | 5197.56 |
| dynamic_member | 635.78 | 625.29 | 1.02× | 111.28 | 79.69 | 887.20 |
| dynamic_key_get_set | 167.08 | 163.96 | 1.02× | 63.34 | 28.05 | 421.46 |
| object_member_write_fallback | 399.61 | 392.60 | 1.02× | 12.80 | 47.39 | 690.13 |
| array_append | 64.61 | 79.34 | 0.81× | 33.82 | 19.14 | 223.12 |
| array_write | 25.94 | 25.81 | 1.01× | 4.65 | 6.13 | 188.94 |
| array_read | 10.39 | 10.39 | 1.00× | 2.68 | 3.54 | 84.71 |
| array_float | 6.81 | 6.85 | 0.99× | 2.23 | 3.10 | 74.54 |
| math_intrinsic | 228.89 | 227.94 | 1.00× | 41.67 | 10.10 | 562.95 |
| math_variable | 244.71 | 245.99 | 0.99× | 157.35 | 108.83 | 509.84 |
| matrix | 243.74 | 240.84 | 1.01× | 23.15 | 66.65 | 1148.39 |

[Raw samples and provenance](table-slot-hints-kernels-2026-09-09.json).

### Independent components, seed 83

400,003 iterations. All checksums matched.

| Component | Baseline ns | Candidate ns | Speedup | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| route_balanced | 53.00 | 53.13 | 1.00× | 6.01 | 6.46 | 263.42 |
| route_skewed | 48.98 | 49.40 | 0.99× | 5.81 | 6.71 | 260.87 |
| pricing_events | 54.61 | 54.55 | 1.00× | 11.19 | 17.46 | 435.41 |
| filter_stream | 49.41 | 49.13 | 1.01× | 5.07 | 8.79 | 241.96 |
| records_64 | 345.14 | 244.93 | 1.41× | 15.65 | 38.78 | 574.60 |
| records_4096 | 383.36 | 280.97 | 1.36× | 19.96 | 42.91 | 628.37 |
| word_count | 208.54 | 209.74 | 0.99× | 75.65 | 123.75 | 369.32 |
| graph_walk | 11.05 | 11.07 | 1.00× | 4.80 | 6.92 | 129.70 |

[Raw samples and provenance](table-slot-hints-applications-seed83-2026-09-09.json).

The 64-record workload improved 1.41× with a candidate sample range of 0.18%
of the median. The 4,096-record median improved 1.36×, but both binaries
encountered large outliers (47% candidate range, 41% baseline range). Its
relative gain was subsequently confirmed with seed 17 and alternating pairs.
The other six components were within 1% of baseline in this run.

### Confirmation and independent member workloads

The second input used seed 17 and 200,000 iterations. Record updates improved
1.40×/1.37×. A further seven alternating SQGI-only pairs at the same settings
retained 1.41×/1.36× gains. Five pairs with JIT disabled, seed 83 and 200,000
iterations reproduced 1.40×/1.36× gains, confirming that the benefit applies
to the shared interpreter paths as well. The other application components
remained approximately flat; no call improvement is attributed to this change.

| Component | Seed 17 | Seed 83 | Seven pairs, seed 17 | JIT off, seed 83 |
| --- | ---: | ---: | ---: | ---: |
| route_balanced | 0.99× | 1.00× | 1.00× | 0.99× |
| route_skewed | 0.98× | 0.99× | 1.00× | 1.00× |
| pricing_events | 1.01× | 1.00× | 1.00× | 0.99× |
| filter_stream | 0.99× | 1.01× | 1.01× | 1.00× |
| records_64 | 1.40× | 1.41× | 1.41× | 1.40× |
| records_4096 | 1.37× | 1.36× | 1.36× | 1.36× |
| word_count | 0.99× | 0.99× | 0.99× | 1.00× |
| graph_walk | 1.00× | 1.00× | 1.00× | 1.00× |

[Seed 17 cross-runtime samples](table-slot-hints-applications-seed17-2026-09-09.json),
[seven-pair confirmation](table-slot-hints-application-confirmation-2026-09-09.json),
[JIT-off comparison](table-slot-hints-interpreter-2026-09-09.json).

Two more independent member suites used five rotating rounds, 200,000
iterations and five warmups on CPU 4, comparing the same SQGI builds with
Node. Both first obtain a JIT-off reference and all checksums matched.
These suites and their ports are unchanged and excluded from PGO training.

| Workload | Baseline ns | Candidate ns | Speedup | Node ns |
| --- | ---: | ---: | ---: | ---: |
| table_events_97 | 495.44 | 448.04 | 1.11× | 76.69 |
| class_events_97 | 379.63 | 380.90 | 1.00× | 75.54 |
| buffers_7 | 368.95 | 358.79 | 1.03× | 12.58 |
| buffers_31 | 369.45 | 359.90 | 1.03× | 12.56 |
| calibrate_17 | 66.09 | 65.50 | 1.01× | 9.03 |
| calibrate_67 | 66.29 | 66.16 | 1.00× | 8.47 |
| transfer_table | 486.33 | 376.44 | 1.29× | 18.26 |
| transfer_class | 389.19 | 388.46 | 1.00× | 18.46 |
| transfer_mixed | 479.19 | 444.69 | 1.08× | 29.69 |
| publish_table | 375.75 | 304.82 | 1.23× | 13.59 |
| publish_class | 313.72 | 312.49 | 1.00× | 13.69 |
| publish_mixed | 370.33 | 351.60 | 1.05× | 21.30 |

[Event/buffer/calibration samples](table-slot-hints-members-2026-09-09.json),
[transfer/publish samples](table-slot-hints-methods-2026-09-09.json).

The 97-record event workload gains 1.11× despite varied field insertion
orders and unrelated extra fields. Table-based transfer/publish workloads
gain 1.29×/1.23×; mixed table/class receivers gain 1.08×/1.05×. Class-only
controls stay within 0.4% of baseline. Fixed-receiver buffer workloads gain
about 3%, and floating-array calibration remains within 1%.
These results support applicability beyond the new record-update component,
but they are still component benchmarks rather than complete applications.

### Variance and regressions

In the original cross-runtime kernel run, array append had a 23% slower
candidate median, but its samples ranged from 59 to 81 ns and the baseline
from 60 to 79 ns. Both runtimes and Node trended downward over the rounds.
Seven subsequent alternating pairs at 240,000 base iterations instead
measured 63.47 to 56.53 ns (1.12×), while all other kernel medians were
within 2% of baseline. Variable math's cross-runtime median and this
larger-trip-count paired median were within 1%. Neither result is sufficient
to dismiss the original-trip-count regression. No array-append gain is claimed.

[Seven-pair kernel samples](table-slot-hints-kernel-confirmation-2026-09-09.json).

Five further alternating pairs at the original 160,000 base iterations
produced the following medians. These prevent accepting the cache-only
candidate as regression-free:

| Kernel | Baseline ns | Candidate ns | Change in time |
| --- | ---: | ---: | ---: |
| array_append | 64.12 | 69.86 | +8.9% |
| math_variable | 240.82 | 281.02 | +16.7% |

[Original-trip-count repeat](table-slot-hints-kernel-original-count-2026-09-09.json).

Array-append baseline samples were 62–66 ns and candidate samples 62–76 ns.
Variable math was 240–243 ns for the baseline; the candidate had three samples
near 281 ns and two near 242 ns. The latter is a distinct process-level
performance regime, not merely a single slow timer sample.

## Post-change profile and regression investigation

A matched three-million-iteration application profile, one warmup, seed 83,
CPU 4 and 499 Hz recorded 3,954 baseline and 3,458 candidate samples, with
none lost. The following are aggregate self sample shares, not individual
workload speedups. Larger remaining shares do not imply increased absolute
cost when other work has been removed.

| Symbol | Baseline | Cache-only candidate |
| --- | ---: | ---: |
| SQVM::Execute | 43.09% | 48.80% |
| SQTable::Get | 16.41% | 18.09% |
| sq_member_cache_fill | 4.94% | below 0.5% |
| SQTable::_Get | 2.18% | below 0.5% |
| SQRefCounted::GetWeakRef | 1.09% | below 0.5% |
| malloc | 1.14% | below 0.5% |

The targeted refill/allocation cost is removed from the prominent samples.
Native diagnostics still report eight successful loop executions across
three loop prototypes, with zero guard failures; record loops still reject
at `COMPARITH get`. The shared-runtime improvement has not expanded their
native coverage.

To investigate variable math, a temporary diagnostic copies the unmodified
kernel script and appends 24 calls to `bench_one` for `math_variable_kernel`,
retaining the complete original suite prelude. Each repeat keeps 160,000
iterations and five warmups. This script is excluded from PGO training and
is not used for a cross-runtime performance claim.

A sampled run reproduced the slower regime throughout the 24 repeats.
The extra samples concentrate in native-call guards and the shared unary
dispatcher; the libm calculations themselves do not explain the increase.
The unary dispatcher has the same instruction sequence in both builds,
although its address changes. A subsequent counter capture found fast and
slow regimes within the **same cache-only executable**:

| Counter | Fast run 1 | Slow run 6 |
| --- | ---: | ---: |
| Retired instructions | 64,833,143,854 | 64,833,144,086 |
| Cycles | 23,729,864,567 | 25,223,737,451 |
| Branch mispredictions | 10,261,538 | 81,923,689 |
| L1 data-cache misses | 1,355,080 | 1,380,913 |
| L1 instruction-cache misses | 324,282 | 319,572 |

The near-identical instruction counts and approximately eightfold branch-miss
increase identify branch prediction as a concrete regression lead. They do
not yet prove which address/history interaction triggers it. Runs 1–5 were
fast; the diagnostic search stopped after capturing the slower run 6. This
was condition-finding for diagnosis, not selective benchmark aggregation.
All ordinary benchmark samples above remain unchanged.

Local artifacts: `/tmp/sqgi-slot-hint-{baseline,candidate}-profile.{data,log}`,
`/tmp/sqgi-slot-hint-math-probe.nut`,
`/tmp/sqgi-slot-hint-math-{baseline,candidate}.{data,log}`, and
`/tmp/sqgi-slot-hint-math-candidate-{counters,counter-output}-{1..6}.log`.

## Follow-up validation history

The AArch64 whole-function and loop lowerers now have an experimental direct
call to the immutable audited math evaluator, using the scalar floating-point
ABI. Closure identity guards and integer-to-float conversions remain in
place. Both arguments are prepared in private slots before loading FP
argument registers, preserving the caller's values and handling helpers
needed during conversion. This removes shared per-operation dispatch and
its redundant pointer/arity checks; it does not substitute approximate math
or match benchmark names or values.

The prototype passes all 28 focused Release JIT/cache tests. New tests cover
all 15 audited evaluators in actual native loop regions, signed zero,
exceptional floating values and mixed integer/float binary arguments.
The fresh combined build in
`/tmp/sqgi-slot-math-pgo-20260909.wnI1gF` passed 99/99 selected CTests after
PGO training and rebuilding with LTO/PGO USE. Sanitizers passed 98/99, with
the same baseline teardown assertion; application and floating holdouts
also passed without leaks. At this stage performance validation was still
in progress and array-append variation needed resolution. The final report
linked above records the subsequent cross-runtime runs, seven-pair repeat,
remaining small regressions and accepted combined revision.

The combined executable SHA-256 is
`47ed9fec3299141b8ddaa94f7e6aecf5fdaf9e5c228851e21f271e62329fd9c7`.
Its first five original-trip-count pairs against `9bc033d` improved intrinsic
math from 226.88 to 204.46 ns (1.11×) and variable math from 238.01 to
225.07 ns (1.06×). All five variable-math samples were 224.94–226.88 ns.
Array append was 78.84 to 77.24 ns in this repeat, with substantial spread;
no append gain is claimed. Other kernel medians were within 1.2%, apart
from a 3.3% object-member-write improvement. The seven independent floating
controls stayed within 0.6% of baseline. These are preliminary confirmations,
not a replacement for the final full cross-runtime runs linked above.

[Combined candidate kernel pairs](table-slot-math-kernel-pairs-2026-09-09.json),
[independent floating controls](table-slot-math-floats-2026-09-09.json).
