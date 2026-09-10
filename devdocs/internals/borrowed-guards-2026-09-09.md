# Immediate borrowed member guards, 2026-09-09

Status: development candidate, not accepted, uncommitted. Continues
[root presence queries](root-presence-2026-09-09.md). The preserved optimized
baselines and PGO profiles are unchanged; current development uses GCC 13.3
Release, native AArch64 JIT ON, PGO/LTO OFF.

## Evidence and mechanism

Before this change, a fresh eight-application profile of the preceding
`68e907b0...` binary captured 2,748 samples, none lost, approximately
12.464 billion cycles. CPU 4, cycles:u/499 Hz, 8,192-byte DWARF stacks,
3,000,000 iterations/one warmup/seed 83. Capture:
`/tmp/sqgi-root-presence-applications-profile.{data,log}`.
Self shares include SQTable::Get 9.29%, root_fallback_safe 5.39% and
member_closure_guard 2.27%; both closure and object identity guards copy
member values into temporary SQObjectPtrs solely to compare them.

The new internal accessor borrows only for an immediate identity or presence
comparison, without reference-count increments/decrements or temporary
ownership. It supports table values, instance fields and methods, and class
defaults and methods. It preserves Get semantics: table/field weakrefs are
dereferenced; class method weakrefs are not. A present null/dead weakref is
not a missing member. Root/default-delegate ordering remains unchanged.

No borrowed address survives a callback, store, structural mutation, or
owner release. No shape/member cache, invocation-long borrow, benchmark
recognition, or guard hoisting was added. Ordinary value reads retain their
existing owning behavior. Object-pointer conversion now accepts the raw
SQObject base type for inspection only.

## Correctness validation

New interpreter/native tests create fresh direct and nested call sites for
tables, instance fields/methods and class defaults/methods. They verify native
frame execution, changed closure identity, live/dead weakrefs, null and
restored members. Live table/field weakrefs must pass the native identity
guard; weak methods must preserve the interpreter's failure semantics.
Existing intrinsic-replacement, root/default-shadowing, ownership, release
hook, assignment alias and late-rollback tests remain enabled.

Correctness logs: `/tmp/sqgi-borrowed-guards-{release-build,focused-tests,release-tests,asan-build,asan-tests}.log`.
Final class-default coverage adds rebuild/retest logs with the same prefix.
Release passes 98/98 selected tests; strict-alignment ASan/UBSan passes
99/99, plus all 37 independent holdout components (20,003 iterations,
one warmup, application seed 83). Holdout logs have no script/sanitizer
errors. Release excludes sqgipkg and the previously documented root-owned
install-manifest failure; isolated sanitizers exclude only sqgipkg and do
test install. ASan leak and use-after-return checks remain enabled; no
suppression was added. Sanitized holdout logs use the same prefix followed
by `asan-{application_workloads,member_workloads,member_methods,member_owners,float_workloads}.log`.

All 15 original kernels and 37 independent holdout timing gates are complete.
This is not a fresh optimized PGO/LTO result and remains unaccepted.

Frozen executable:
`/tmp/sqgi-borrowed-guards-release-20260909.82qHzS/sqgi`, SHA-256
`39e7be6b4f6ff00787cce67dc2fd9b0a2db340a537c59ddc3e63c030281e9276`.
Tracked source delta from `953b5b4`:
`/tmp/sqgi-borrowed-guards-source.patch`, SHA-256
`0be527a20ed6cb214edbb000bfcd0257bb5a663349c335f1abe143837e29e8fb`.
The cache is preserved beside the binary. Disassembly confirms the closure
guard invokes the borrowed accessor and directly checks its tag/pointer;
there is no temporary SQObjectPtr cleanup or reference-count update.

## Ordinary Release comparisons

Five rotating rounds, five warmups, fresh processes pinned to CPU 4. All
checksums agree; the method runner also checks a JIT-off reference. No build,
sanitizer or profiling job ran concurrently; workstation activity and the
ondemand frequency governor were uncontrolled. No samples were removed.
Baseline is committed `953b5b4` ordinary Release (`192855dd...`), except the
explicit presence-only application ablation (`68e907b0...`).

### Application ablation and committed baseline

At seed 83/400,003 iterations, replacing only the presence candidate's
owning guards improves routing/pricing/filter medians by 1.148x, 1.131x,
1.113x and 1.122x respectively. Small records improve 1.8%, word counting
0.4%, graph traversal 0.1%; large records slow 1.4%, with a 28.9% candidate
min-to-max range relative to median (228.886-304.575 ns).
[Ablation samples](borrowed-guards-release-applications-ablation-2026-09-09.json).

Seed 17/200,000 compares to the committed ordinary binary:

| Application | Committed ns | Borrowed ns | Baseline/candidate |
| --- | ---: | ---: | ---: |
| route_balanced | 52.880 | 51.460 | 1.028x |
| route_skewed | 49.215 | 51.360 | 0.958x |
| pricing_events | 54.650 | 56.765 | 0.963x |
| filter_stream | 50.470 | 54.660 | 0.923x |
| records_64 | 287.765 | 133.505 | 2.155x |
| records_4096 | 319.820 | 252.840 | 1.265x |
| word_count | 262.635 | 261.070 | 1.006x |
| graph_walk | 10.945 | 10.935 | 1.001x |

The three remaining call-heavy regressions are 4.4%, 3.9% and 8.3% extra
time, materially smaller but not eliminated. Seed-17 candidate ranges are
5.3% of median for small records and 6.4% for large records; seed-83 large
records above remain much noisier. Do not transfer exact speedups between
seeds, binaries or build modes.
[Committed baseline samples](borrowed-guards-release-applications-baseline-2026-09-09.json).

### Original kernels

Five rounds at 160,000 base iterations (scaled cases retain their original
scaling); median nanoseconds per benchmark operation:

| Kernel | Committed ns | Borrowed ns | Baseline/candidate |
| --- | ---: | ---: | ---: |
| direct_call | 42.323 | 34.271 | 1.235x |
| branch_call | 39.395 | 31.965 | 1.232x |
| float_call | 27.825 | 20.549 | 1.354x |
| numeric_loop | 22.710 | 22.731 | 0.999x |
| vector | 375.794 | 374.738 | 1.003x |
| dynamic_member | 722.056 | 722.175 | 1.000x |
| dynamic_key_get_set | 183.544 | 183.181 | 1.002x |
| object_member_write_fallback | 468.813 | 468.725 | 1.000x |
| array_append | 79.812 | 81.019 | 0.985x |
| array_write | 33.513 | 33.450 | 1.002x |
| array_read | 9.230 | 9.233 | 1.000x |
| array_float | 6.753 | 6.816 | 0.991x |
| math_intrinsic | 230.031 | 195.069 | 1.179x |
| math_variable | 254.238 | 211.856 | 1.200x |
| matrix | 302.400 | 302.719 | 0.999x |

Call and math improvements extend beyond the application ablation. Direct,
branch and float-call candidate ranges are 0.5%, 0.8% and 1.8% of median.
Append's 1.5% regression is not dismissed, but its samples vary widely
(63.213-83.919 ns, 25.6% of median); array-float's 0.9% regression has a
3.1% candidate range. Most other medians change by less than 0.4%.
[Kernel samples](borrowed-guards-release-kernels-2026-09-09.json).

### Method-heavy holdouts still reject the combined candidate

Five rounds/200,000 iterations, including the preceding presence candidate
and Node 18.19.1 in the rotation:

| Method | Committed ns | Presence ns | Borrowed ns | Node ns |
| --- | ---: | ---: | ---: | ---: |
| transfer_table | 420.445 | 440.270 | 439.925 | 17.99 |
| transfer_class | 434.455 | 518.620 | 516.235 | 18.00 |
| transfer_mixed | 481.340 | 505.960 | 502.265 | 29.09 |
| publish_table | 360.140 | 425.995 | 425.185 | 13.45 |
| publish_class | 366.285 | 472.030 | 473.515 | 13.75 |
| publish_mixed | 394.415 | 460.950 | 464.125 | 20.91 |

Borrowing changes these medians by less than 0.8% against the preceding
candidate and does not fix their 4.3-29.3% regressions versus committed
Release. Their mutating-callee path needs a different general optimization;
original-kernel call improvements do not waive this gate.
[Method samples](borrowed-guards-release-methods-2026-09-09.json).
Method candidate min-to-max ranges are 0.4-0.8% of their medians, far below
the regressions; these cannot be dismissed as workstation timing noise.

### Remaining independent holdouts

All use five rotating rounds, five warmups and 200,000 iterations; their
checksums match Node and a JIT-off reference. All remain excluded from PGO
training. Node is 18.19.1; the SQGI comparison remains ordinary Release.

Table-owner widths 1/2/5/19/257 improve from roughly 298 ns to
170.25/185.03/182.53/180.90/188.62 ns. Corresponding class-owner medians
improve from roughly 305-306 ns to 284.93/303.64/294.88/294.96/300.00 ns.
The former large-owner regression remains resolved. These compare the
combined candidate to committed Release, not just this guard change.
[Owner samples](borrowed-guards-release-owners-2026-09-09.json).

All six event/buffer/calibration member medians are within 0.5% of committed
Release. [Member samples](borrowed-guards-release-members-2026-09-09.json).

The seven floating holdouts independently exercise calls, multiple scalar
arguments, preserved inputs and branching. They all improve:

| Floating holdout | Committed ns | Borrowed ns | Baseline/candidate | Node ns |
| --- | ---: | ---: | ---: | ---: |
| filter | 30.965 | 23.315 | 1.328x | 2.45 |
| channels_4 | 104.950 | 77.605 | 1.352x | 5.42 |
| pressure_8 | 212.615 | 153.360 | 1.386x | 10.33 |
| integration | 43.195 | 36.930 | 1.170x | 7.82 |
| retained_input | 57.090 | 43.955 | 1.299x | 4.31 |
| branching | 37.755 | 31.495 | 1.199x | 6.44 |
| helper_control | 65.030 | 54.685 | 1.189x | 3.63 |

Candidate sample ranges are 0.7-2.8% of median except helper_control at
5.6%, smaller than their measured gains. These support generalization
beyond the original kernels, but SQGI is still approximately 4.7-15.1x
Node's time here. They do not establish PGO/LTO gains or parity.
[Floating samples](borrowed-guards-release-floats-2026-09-09.json).

## Follow-up profiles and remaining architectural work

After all timings completed, the frozen candidate was profiled serially with
cycles:u/499 Hz, DWARF stacks of 8,192 bytes, CPU 4, JIT threshold 1 and one
warmup. Method workloads use 1,200,000 iterations; applications use 3,000,000
and seed 83. Neither profile loses samples. Captures:
`/tmp/sqgi-borrowed-guards-{methods,applications}-profile.{data,log}`.

Methods: 5,105 samples, approximately 23.216 billion cycles. Self shares:
VM Execute 39.05%, member_store_slot 10.94%, reference-store helper 7.83%,
journal RecordMember 5.37%, Append 4.12%, table_get_array_ptr 3.98%,
try_execute_closure 3.41%, journal Index 2.76%, journal destruction 2.53%,
and SQTable::Get 2.42%. Identity guards are not the main remaining method
cost. Annotation of member_store_slot shows its cold root-fallback/value
temporary path adds a 144-byte frame, stack-canary work and many saved
registers even for normal writable-slot hits. Reference-store annotation
also shows temporary value/target ownership and journal work. Captures:
`/tmp/sqgi-borrowed-guards-{store,reference-store}-annotate.log`.
These are opportunities to investigate, not projected wall-time savings.

Applications: 2,627 samples, approximately 11.859 billion cycles. Self shares:
VM Execute 15.21%, journal ContainsMember<false> 12.96%, root safety 5.28%,
array_get_object 4.99%, member_store_slot 4.96%, SQTable::Get 4.86%, borrowed
member lookup 3.59%, and scalar member-store helper 2.10%. Hash lookup,
transaction bookkeeping and interpreter coverage remain shared bottlenecks.

A fresh short trace (`/tmp/sqgi-borrowed-guards-methods-trace.log`, 31 iterations,
one warmup) confirms transfer compiles and executes natively, while the outer
method driver still rejects its hot internal branch at bytecode 105. Its
whole-frame setup also rejects object-member SET at bytecode 87. Forward
control-flow joins remain a broad opportunity, but require correct merging
of slot representations, prepared-call metadata and deferred stack aliases;
removing the branch rejection alone is not safe.

Next work should address the measured member-store/callee overhead while
preserving all ownership and rollback guarantees, and expand general control
flow support with explicit join semantics. This guard optimization is useful
across applications, kernels and independent float holdouts, but the combined
candidate still fails material method/application regression gates. No PGO
retraining, commit, push or parity claim follows from these results. The
original full goal remains active.
