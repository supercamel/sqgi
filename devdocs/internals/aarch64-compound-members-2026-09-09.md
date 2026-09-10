# AArch64 compound member arithmetic: work in progress, 2026-09-09

Status: **uncommitted, not yet accepted**. The predecessor
[checked-slot/direct-math iteration](guarded-slots-direct-math-2026-09-09.md)
is committed and pushed as `953b5b4`. This experiment adds general numeric
compound member operations to native AArch64 loops and reduces repeated
lookups in scalar member stores. Fresh JIT/PGO/LTO cross-runtime runs are
complete and **reject that revision**: larger-record processing regresses
9–20% across two seeds. A subsequent checked native table-read revision
also remains **unaccepted**: PGO/LTO application gains are confirmed, but
the independent table-owner holdout regresses 4–5%. Do not confuse
the ordinary Release development numbers below with optimized-build results.
The initial reference-store candidate passes Release and sanitizer correctness
checks but fails its development performance gate: large owner sets are
2.78–2.99× slower. Its diagnosis and preserved samples are at the end.
The [owner-index follow-up](owner-index-2026-09-09.md) fixes those large-history
regressions but exposes 14–34% method-heavy regressions. It remains unaccepted;
that report tracks the newest profiles and native-frame journal revision.

## Evidence and implementation

The predecessor's current-binary profile put 53.71% of aggregate self samples
in SQVM::Execute and 10.26% in SQTable::Get. Record-update loops rejected
at `unsupported loop COMPARITH get`, while their ordinary reads and scalar
stores were already supported. This identifies a reusable missing operation,
not a benchmark-specific loop pattern.

The first lowering adds constant-key numeric COMPARITH (+=, -=, *=, /=, %=)
using existing guarded member reads, scalar arithmetic and logged stores.
The existing SQJitKeyFlow analysis proves the literal key from bytecode;
a sampled string pointer matching a literal is not sufficient. Dynamic or
unproven keys retain fallback. Existing array handling is retained.
Receiver observations include values loaded from arrays, not only stale
entry-stack slots. The receiver, key and RHS survive until a private scratch
result is published through the logged store. User overloads and callbacks
remain in the VM. This extends loop-region execution, not frame/direct-call
coverage or all possible member/index key forms.

The added tests initially failed their native-route assertions because a
receiver loaded from an array had no usable entry-stack observation.
Using the existing slot-observation metadata corrected the route; passing
semantic results alone were not treated as evidence of native execution.

The first five matched application pairs at seed 83/400,003 iterations gave:

| Component | Baseline ns | First prototype ns | Speedup |
| --- | ---: | ---: | ---: |
| records_64 | 287.06 | 258.09 | 1.112× |
| records_4096 | 336.42 | 401.21 | 0.839× |

The approximately 19% larger-record slowdown prevents accepting the first
prototype. [All first-prototype samples](compound-members-prototype-applications-2026-09-09.json)
are retained.

A subsequent profile of that same prototype ran all eight application
components at three million iterations, one warmup, seed 83, pinned CPU 4,
`perf record -F 499 -g --call-graph dwarf,8192`. It captured 3,424 samples,
none lost, approximately 15.53 billion user cycles. Aggregate self shares:

| Symbol | Self samples |
| --- | ---: |
| SQTable::Get | 22.51% |
| SQJitWriteLog::RecordMember | 11.63% |
| SQVM::Execute | 11.14% |
| sqjit_a64_helper_array_get_object | 5.35% |
| sqjit_a64_helper_table_get_integer | 3.84% |
| SQTable::Set | 3.32% |
| sqjit_a64_helper_member_set_integer_logged | 3.22% |
| SQTable::GetRaw | 3.16% |

Local capture: `/tmp/sqgi-compound-prototype-profile.{data,log}`.
These shares identify remaining work; they are not per-component speedups.
Scalar stores were resolving the member, looking it up again for raw undo
storage, and resolving it again for assignment.

The revision uses one borrowed raw slot for each scalar store, first logging
the exact old value and only then assigning. The target is retained for the
helper's lifetime; the undo log retains every displaced owner. No callback
or structural mutation occurs while that local slot is borrowed. It is not
cached across helpers or loop iterations. Root resolution preserves the
existing shadowing rules: a raw-slot miss alone cannot choose the root.
This applies to table/instance integer, boolean and float member stores in
both loop and frame lowering. No names, input sizes or address alignment
special cases are introduced, and undo-log limits/failure behavior remain.

## Ordinary Release comparison

Baseline `953b5b4` was confirmed up-to-date (`ninja: no work to do`) and
preserved before editing:

- `/tmp/sqgi-compound-baseline-release-20260909.UICRYQ/sqgi`
- SHA-256 `192855dd70da5a641d148425cdd58531fd30811033b4e58c96911da23722d42e`.

First prototype preserved at:

- `/tmp/sqgi-compound-first-release-20260909.O3JeXu/sqgi`
- SHA-256 `d6fb841066cabdbfd4e2b49c2957246fb6204c9fe8ed6b6a3bacaf440387248d`.
- Source delta from `953b5b4`: `/tmp/sqgi-compound-first-lowering.patch`.

Revised prototype:

- `build-jit-release/sqgi`
- SHA-256 `23a3a01335916c3eb4035bdd50a605dc1a250b045fb1645f276446013f305232`.

All three are GCC 13.3 Release, native AArch64 JIT ON, int64/double,
**LTO OFF and PGO OFF**. The ordinary build is a development comparison;
the predecessor's preserved PGO/LTO executable is not overwritten.

Five alternating pairs, five warmups, fresh processes, CPU 4, threshold 1,
Orange Pi 5 Pro/RK3588S, ondemand governor, maximum 2.304 GHz. No build or
sanitizer jobs ran during timings; unrelated workstation activity was not
controlled. All checksums match between the builds. These paired runs use
the first baseline output as reference; native/interpreter semantic checks
are separate. Raw JSON records all samples, outputs and executable/source
hashes. Nanoseconds per iteration, lower is faster.

| Component | Baseline ns | Revised ns | Speedup |
| --- | ---: | ---: | ---: |
| route_balanced | 52.50 | 52.69 | 0.996× |
| route_skewed | 48.80 | 48.96 | 0.997× |
| pricing_events | 54.60 | 54.40 | 1.004× |
| filter_stream | 51.38 | 51.34 | 1.001× |
| records_64 | 286.83 | 200.40 | 1.431× |
| records_4096 | 338.82 | 340.52 | 0.995× |
| word_count | 261.73 | 260.66 | 1.004× |
| graph_walk | 10.97 | 10.94 | 1.003× |

[Revised application samples](compound-members-resolved-applications-2026-09-09.json).

The 64-record candidate range is 197.17–210.34 ns (6.6% of median); the
4,096-record range is 296.49–345.44 ns (14.4%). The larger-record median is
0.5% slower than its matched baseline. The earlier material slowdown is
not reproduced in this run; more seeds and optimized-build confirmation
are required. Other application medians are within 0.5%.

All 15 original kernel medians stay within 0.6% in five subsequent alternating
pairs at the original 160,000 base count (3.2 million for scaled kernels).
This includes arrays, vectors, calls and both math kernels. These do not
establish Node/GJS parity or application-wide improvements.

[Revised kernel samples](compound-members-resolved-kernels-2026-09-09.json).

## Correctness so far

The current revision passes 98/98 selected ordinary Release CTests,
excluding the existing root-owned install artifact and the package-manager
test. This includes all 28 JIT-labelled tests.

The compound-member test compares complete state snapshots against the
interpreter for tables and instances, rotating receivers, all five numeric
operators, compound-expression results, integer/float fields, zero/one/many
iterations, a one-record alias set, 257 extra fields, late division-by-zero
and type failures, delegates/metamethods, string fallback and changing
dynamic keys. It asserts actual native loop successes for tables and
instances and native guard failures for the late-failure path.

A separate numeric-store test overwrites the only reference to a class
with a release hook that inserts 256 receiver fields. It verifies native
execution, exactly one release, final values and rehash visibility.
Existing tests retain raw live/dead weak references on rollback, simulate
undo allocation failure, and cover member/array lifetime and alias behavior.

Debug ASan/UBSan (-O1 -g -mstrict-align, JIT ON, no PGO/LTO) passes 98/99;
the sole failure remains the previously reproduced scalar-leaf teardown
assertion `_gc_chain == NULL`. It is not suppressed or counted as a pass.
The eight application, six member and six method holdouts pass at 20,003
iterations/one warmup with explicit leak and stack-use-after-return checks,
without sanitizer reports.

Logs: `/tmp/sqgi-compound-resolved-{release-tests,asan-build,asan-tests,asan-applications,asan-members,asan-methods}.log`.

## Rejected PGO/LTO confirmation

A fresh GENERATE/training/USE build at
`/tmp/sqgi-compound-pgo-20260909.m3rPcm` has completed with native JIT and
LTO ON, GCC 13.3 Release, int64/double, ASan OFF. Training and final USE
tests both pass 99/99, including installation (excluding only the package
manager). Training uses the same original kernel/execution/Vec3 recipe
described above, with independent holdouts excluded. The executable SHA-256 is
`46d7392666c5896f9445a8dabb387cff070bf0b34a35b38c96a37e8fdee96962`;
90 PGO files hash to
`91d9f4be34f44404df5ffd6d6c4fa0f554c0ea80a991ea02c87d0fbed9f0da83`.
There are 22 missing-profile warnings for unused standalone bundled
Squirrel/sqstdlib targets, none for SQGI core, and no coverage mismatches.
Logs: `/tmp/sqgi-compound-pgo-{configure,generate-build,training-tests,training-kernels,training-execution,training-vec3,use-configure,use-build,tests}.log`.

Five rotating cross-runtime rounds completed with five warmups, fresh
processes, CPU 4 and a JIT-off checksum reference. All checksums matched for
SQGI baseline/candidate, Node 18.19.1, GJS 1.80.2 module mode and Python
3.13.2. No build, sanitizer or profiler jobs ran during timings; unrelated
workstation activity was uncontrolled.

| Component | Seed / iterations | Baseline ns | Candidate ns | Speedup |
| --- | --- | ---: | ---: | ---: |
| records_64 | 83 / 400,003 | 243.74 | 215.75 | 1.130× |
| records_4096 | 83 / 400,003 | 285.66 | 343.54 | 0.832× |
| records_64 | 17 / 200,000 | 243.71 | 219.82 | 1.109× |
| records_4096 | 17 / 200,000 | 313.39 | 342.91 | 0.914× |

The 4,096-record candidate's min-to-max range is 14.5% of its median with
seed 83 and 23.3% with seed 17. No samples were excluded. Despite this
variance, both seed medians regress materially. Other application medians
are within 1.4%. Original kernels are mostly unchanged, with direct calls
2.4% slower and object-member writes 1.6% slower. Independent member/method
timing was deferred because this candidate already fails the regression gate.

[All kernels](compound-members-pgo-kernels-2026-09-09.json),
[applications seed 83](compound-members-pgo-applications-seed83-2026-09-09.json),
[applications seed 17](compound-members-pgo-applications-seed17-2026-09-09.json).

A fresh profile of the rejected optimized executable used all eight
application components at three million iterations, one warmup, seed 83,
CPU 4, `perf record -F 499 -g --call-graph dwarf,8192`: 2,969 samples, none
lost, approximately 13.394 billion user cycles. Aggregate self shares:

| Symbol | Self samples |
| --- | ---: |
| sqjit_a64_get_member_value | 16.08% |
| SQJitWriteLog::RecordMember | 12.08% |
| SQVM::Execute | 12.06% |
| sqjit_a64_helper_array_get_object | 5.09% |
| SQObjectPtr::operator= | 5.04% |
| sqjit_a64_helper_table_get_integer | 4.05% |
| sq_member_raw_slot | 3.43% |
| SQTable::Get | 3.24% |

Local profile: `/tmp/sqgi-compound-pgo-profile.{data,log}`. This identifies
repeated native member lookup as a general next target, not a per-component
causal breakdown of the larger-record regression.

## Follow-up in development

Native numeric constant-key table reads now have an inline checked index
hint in both AArch64 loop and whole-function lowering. The current receiver's
type, node bounds, key type/identity and value type are checked before a
scalar load. Misses enter the existing lookup helper rather than aborting
the loop. No receiver or node is retained by the hint; no callback occurs
while reading a borrowed node. Different layouts and root/delegate/type
fallback retain ordinary lookup semantics. No workload names or size rules
are introduced.

A new route test exposed pre-existing guard churn for ordinary field reads
from array-loaded records, reproduced with the preserved resolved-store
binary. The loop read path now consults its newer receiver slot observation
when the VM entry snapshot has no known member result. The
observation selects only a guarded value kind; it cannot authorize an
unchecked runtime access.

Separately, the old sanitizer teardown assertion was traced to the nested
AArch64 native-call helper passing a live caller slot to the scalar-return
ABI. That ABI writes raw tags/bits, leaking the overwritten receiver/callee
owner. The helper now receives into a fresh SQObjectPtr and publishes through
normal assignment only on success. Before the table-read follow-up, this
change alone made the scalar-leaf test and all 99 selected strict-alignment
ASan/UBSan CTests pass with leak and stack-use-after-return checks enabled.
Logs: `/tmp/sqgi-call-result-asan-{build,leaf,tests}.log`. A focused repeated
call reference-count test is added; no checks or assertions were disabled.
That exact new test, compiled once and linked against the preserved rejected
PGO library, fails the reference-count check. Running the same executable
against the new ordinary Release library passes. This is an ABI-compatible
runtime ablation, not a timing comparison. Local executable and old-library
log: `/tmp/sqgi-native-return-regression-20260909.B8eVvW/`.

The table-read revision passes 98/98 selected ordinary Release CTests and
99/99 strict-alignment ASan/UBSan CTests with leak and stack-use-after-return
checks enabled. The package test is excluded from both; the ordinary build
also excludes its existing root-owned install artifact. Sanitized installation
passes. All 28 JIT-labelled tests pass. New tests verify whole-function and
loop native entry, exact interpreter agreement for integer/float fields,
rehashing, shrinking, reversed insertion order, replacement receivers,
table/instance changes, delegates, changed numeric tags, dead weakrefs and
missing members. Table layout changes do not increment native loop guard
failures. Initial tests deliberately failed native-route assertions until
the stale-observation problem was corrected; semantic-only success was not
counted as native coverage.

Logs: `/tmp/sqgi-table-read-hint-observed-{release-tests,asan-build,asan-tests}.log`.
Ordinary Release executable SHA-256:
`fea4b4b8e4c23d0919398b126755c77e0033085ce5bf1cbbbfe904443fba4545`.

All 37 application/member/method/owner/float holdout components also complete
under ASan/UBSan at 20,003 iterations and one warmup, with explicit leak and
stack-use-after-return checks and no reports. These runs are correctness
checks, not performance measurements. Logs:
`/tmp/sqgi-table-read-hint-asan-{application_workloads,member_workloads,member_methods,member_owners,float_workloads}.log`.

### Checked-read ordinary Release timings

Five alternating pairs against the same preserved `953b5b4` ordinary Release
baseline, five warmups, CPU 4, threshold 1, no concurrent build/sanitizer
jobs. All checksums match. Application seed 83 / 400,003 iterations:

| Component | Baseline ns | Checked-read ns | Speedup |
| --- | ---: | ---: | ---: |
| route_balanced | 52.92 | 53.04 | 0.998× |
| route_skewed | 48.41 | 49.31 | 0.982× |
| pricing_events | 55.00 | 54.97 | 1.001× |
| filter_stream | 50.92 | 51.84 | 0.982× |
| records_64 | 289.56 | 159.45 | 1.816× |
| records_4096 | 338.60 | 282.68 | 1.198× |
| word_count | 264.15 | 263.03 | 1.004× |
| graph_walk | 11.03 | 10.94 | 1.008× |

Candidate record ranges are 5.4% (64) and 14.2% (4,096) of median. In the
15 original kernels at 160,000 base iterations, most medians remain within
1%; math_intrinsic is 1.6% slower (8.2% candidate range). Array append is
0.8% slower with a 26.4% candidate range. Routing/filtering regressions and
these kernel medians remain part of acceptance assessment; the record gains
do not erase them.

[Checked-read application samples](compound-members-table-hint-release-applications-2026-09-09.json),
[kernel samples](compound-members-table-hint-release-kernels-2026-09-09.json).

The current source needs fresh optimized-build performance confirmation
before acceptance. A fresh GENERATE/training/USE build has completed in
`/tmp/sqgi-table-read-hint-pgo-20260909.SglKJT`, using the same training recipe
and holdout exclusions. Training and final USE CTests both pass 99/99,
including installation. Its executable SHA-256 is
`ac651a496ef53e4bfaaafeac0a9c22db6777f23a38ddceecc4a95652eef29207`;
90 PGO files hash to
`af24f3da7ed610c4e750edfc4a8d16c08fa0b4aac816c0ee403b125b51abc7cf`.
Build options remain GCC 13.3 Release, int64/double, native JIT ON, LTO ON,
PGO USE, ASan OFF. The 22 missing-profile warnings concern only unused
standalone bundled Squirrel/sqstdlib targets, none SQGI core; there are no
coverage mismatches. Logs: `/tmp/sqgi-table-read-hint-pgo-{configure,generate-build,training-tests,training-kernels,training-execution,training-vec3,use-configure,use-build,tests}.log`.

### Checked-read PGO/LTO application confirmation

Five rotating rounds, five warmups, CPU 4, with a JIT-off checksum reference
and the same runtime versions as above. No build, sanitizer or profiling
jobs ran concurrently. All checksums match. Seed 83 / 400,003 iterations:

| Component | Baseline ns | Checked-read ns | Speedup | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| route_balanced | 52.88 | 53.10 | 0.996× | 6.04 | 6.41 | 263.23 |
| route_skewed | 49.51 | 49.66 | 0.997× | 5.83 | 6.71 | 260.93 |
| pricing_events | 54.67 | 54.65 | 1.000× | 11.20 | 17.45 | 434.83 |
| filter_stream | 49.60 | 49.65 | 0.999× | 5.06 | 8.85 | 241.96 |
| records_64 | 244.87 | 169.96 | 1.441× | 15.60 | 38.79 | 574.79 |
| records_4096 | 310.06 | 284.40 | 1.090× | 20.00 | 43.47 | 664.36 |
| word_count | 209.77 | 207.33 | 1.012× | 74.16 | 124.31 | 370.53 |
| graph_walk | 11.07 | 11.05 | 1.002× | 4.81 | 7.15 | 130.15 |

Seed 17 / 200,000 iterations repeats the record gains: 244.44 → 174.88 ns
(1.398×) for 64 records and 289.49 → 273.27 ns (1.059×) for 4,096.
Other medians are within 1.3% of baseline. Candidate record min-to-max
ranges relative to median are 5.7% / 5.0% for 64 records and 15.3% / 21.7%
for 4,096 (seed 83 / 17). No samples were excluded. The larger-record gain
is smaller than its run-to-run range; further paired confirmation is useful.

Record updates still take approximately 11× / 13–14× Node's time and
4.4–4.5× / 6.3–6.5× GJS's time (64 / 4,096). This is progress, not parity
or an application-wide speedup claim.

[Seed 83 samples](compound-members-table-hint-pgo-applications-seed83-2026-09-09.json),
[seed 17 samples](compound-members-table-hint-pgo-applications-seed17-2026-09-09.json).

### Checked-read original kernels

Five rotating rounds at the original 160,000 base count (3.2 million for
scaled kernels), five warmups and JIT-off checksum reference; all pass.

| Component | Baseline ns | Checked-read ns | Speedup | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| direct_call | 38.32 | 38.34 | 0.999× | 6.78 | 10.72 | 335.33 |
| branch_call | 36.38 | 36.36 | 1.001× | 4.84 | 7.06 | 237.19 |
| float_call | 24.86 | 24.87 | 1.000× | 2.65 | 9.52 | 134.51 |
| numeric_loop | 22.83 | 22.81 | 1.001× | 7.47 | 12.78 | 238.26 |
| vector | 350.48 | 349.02 | 1.004× | 577.52 | 515.30 | 5163.12 |
| dynamic_member | 621.82 | 621.69 | 1.000× | 109.53 | 79.34 | 897.83 |
| dynamic_key_get_set | 163.30 | 163.60 | 0.998× | 62.46 | 27.97 | 405.88 |
| object_member_write_fallback | 383.44 | 383.99 | 0.999× | 12.66 | 47.14 | 684.72 |
| array_append | 78.61 | 78.36 | 1.003× | 38.05 | 18.66 | 221.88 |
| array_write | 25.63 | 25.71 | 0.997× | 4.58 | 6.14 | 186.39 |
| array_read | 10.26 | 10.28 | 0.998× | 2.64 | 3.53 | 83.19 |
| array_float | 6.78 | 6.78 | 1.000× | 2.20 | 3.08 | 73.61 |
| math_intrinsic | 207.76 | 205.57 | 1.011× | 41.26 | 10.18 | 558.34 |
| math_variable | 224.34 | 225.87 | 0.993× | 154.75 | 107.61 | 510.84 |
| matrix | 239.34 | 238.72 | 1.003× | 22.81 | 66.28 | 1140.27 |

Most original kernel medians are within 0.5% of baseline. Variable math is
0.7% slower; intrinsic math is 1.1% faster. These small changes are not
evidence of a general math optimization. The earlier rejected revision's
2.4% direct-call slowdown is not reproduced here. Vectors remain faster
than Node/GJS, but object-valued member writes remain roughly 30× Node's time.

[All original-kernel samples](compound-members-table-hint-pgo-kernels-2026-09-09.json).

### Independent holdouts: ownership regression blocks acceptance

Five rotating rounds, five warmups, 200,000 iterations, CPU 4, all checksums
matching a JIT-off reference. All six member, six method and seven floating
holdout medians are within 0.7% of baseline. This does not establish broader
performance gains outside the record-update components. Class-owner cases
also remain within 0.3%. Table-owner recycling, however, regresses at every
tested owner working-set size:

| Component | Baseline ns | Checked-read ns | Speedup |
| --- | ---: | ---: | ---: |
| table_owners_1 | 262.75 | 273.70 | 0.960× |
| table_owners_2 | 262.69 | 274.07 | 0.958× |
| table_owners_5 | 262.88 | 274.89 | 0.956× |
| table_owners_19 | 262.81 | 275.58 | 0.954× |
| table_owners_257 | 263.01 | 275.29 | 0.955× |

Baseline ranges are approximately 0.1% of median; candidate ranges are
0.2–0.8%. This is not dismissed as ordinary timing noise or offset against
record gains. The commit remains held. A seven-round repeat at 400,003
iterations reproduces the regression: table-owner medians are 262.43–262.73
ns in baseline and 273.26–275.21 ns in the candidate (0.954–0.960×).
Class-owner cases remain within 0.4%. The separate five-round JIT-off
control at 200,000 iterations also reproduces the table regression:
265.32–266.19 → 275.39–278.75 ns (0.954–0.964×), while class cases remain
within 0.3%. All checksums match in both repeats. This rules out execution
of the new native table-read instructions as the cause; it does not by
itself distinguish profile-driven code generation from other interpreter
or binary-layout effects.

A trace of the candidate confirms `recycle` rejects both whole-function and
loop compilation at its object-valued member store (ip 7). That is an
existing broad native-coverage gap. The regression cannot be accepted merely
because this workload remains interpreted.

Profiles of the same preserved baseline/candidate executables run all ten
owner components at three million iterations/one warmup, CPU 4,
`perf record -e cycles:u -F 499 -g --call-graph dwarf,8192`. Candidate:
12,262 samples, none lost, approximately 55.789 billion cycles, 93.07% self
in SQVM::Execute and 3.28% in SQTable::Get. Baseline: 12,044 samples, none
lost, approximately 54.821 billion cycles, 93.10% in SQVM::Execute and 2.90%
in SQTable::Get. Aggregate samples include both table and class components;
they are not a per-opcode causal diagnosis. Instruction-level comparison is
the next step. Local captures:
`/tmp/sqgi-table-read-hint-{pgo,baseline}-owners-profile.{data,log}`;
trace: `/tmp/sqgi-table-read-hint-pgo-owners-trace.log`.

Three alternating hardware-counter pairs run all ten owner components at
one million iterations and one warmup (the benchmark also computes an
initial expected result). Median totals:

| Counter | Baseline | Checked-read candidate | Candidate / baseline |
| --- | ---: | ---: | ---: |
| User cycles | 18,281,133,338 | 18,614,292,904 | 1.0182× |
| User instructions | 59,722,187,920 | 59,692,199,279 | 0.9995× |
| User branch misses | 217,310 | 14,354,353 | 66.05× |

The total-branches event is unsupported on this PMU, so no branch-miss rate
is inferred from it. Supported counters report 100% enabled time. The large
miss-count increase with effectively unchanged instruction count points to
branch prediction, rather than extra interpreter work. The table-cache hit
instructions in both annotated binaries are largely identical but reordered
relative to other blocks. A subsequent branch-miss capture at one million
iterations/one warmup, sampling every 2,003 user branch-miss events, collects
7,499 samples with none lost; 98.76% land in SQVM::Execute. The largest
sample cluster is in the literal-load/reference-assignment handler, with
others around array reads and dispatch/swap paths. PMU sampling skid means
the landing instruction is not necessarily the mispredicted branch, so this
is not yet an exact-branch causal diagnosis. No address padding, alignment
selection or special handling for this benchmark is introduced.

Raw counter CSVs and corresponding outputs:
`/tmp/sqgi-table-read-hint-owner-counters-{baseline,candidate}-{1,2,3}.{csv,log}`.
Cycle annotations:
`/tmp/sqgi-table-read-hint-{pgo,baseline}-owners-annotate.log`.
Branch capture/annotation:
`/tmp/sqgi-table-read-hint-owner-branch-{profile.data,profile.log,annotate.log}`.
[Archived counter samples and checksums](compound-members-table-hint-owner-counters-2026-09-09.json).

[Seven-round repeat](compound-members-table-hint-pgo-owners-repeat-2026-09-09.json),
[JIT-off diagnostic](compound-members-table-hint-pgo-owners-jit-off-2026-09-09.json).

The member runner now accepts `--jit 0` for this diagnostic, retaining its
default of 1 and recording the setting in metadata. JIT-off diagnostic
results must not be presented as the requested JIT-enabled standings.

[Member samples](compound-members-table-hint-pgo-members-2026-09-09.json),
[method samples](compound-members-table-hint-pgo-methods-2026-09-09.json),
[owner samples](compound-members-table-hint-pgo-owners-2026-09-09.json),
[floating samples](compound-members-table-hint-pgo-floats-2026-09-09.json).
The rejected PGO executable and
all raw samples remain preserved. The ordinary resolved-store executable
is also preserved at `/tmp/sqgi-compound-resolved-release-20260909.IfOKO0/sqgi`.
The checked-read ordinary Release executable is preserved at
`/tmp/sqgi-table-read-hint-release-20260909.z3i6wT/sqgi`; its source delta from
`953b5b4` (including the diagnostic runner option) is
`/tmp/sqgi-table-read-hint-source.patch`. Neither preserved PGO executable
should be rebuilt with modified source or reused training data.

The next iteration must address the owner regression with a general runtime
or compiler mechanism and rerun the acceptance checks. The owner trace's
unsupported object-valued member store is a broad native-coverage target;
the instruction/branch evidence also warrants interpreter dispatch analysis.
Choosing code addresses or adding padding until one benchmark improves is
not an acceptable fix. The full goal remains open and this revision is not
committed or pushed.

## Next candidate: reference stores and literal-read coverage

The owner profile/trace above motivated general AArch64 object-valued member
stores in both whole-function and loop lowering (including existing inlined
callees). Constant-key stores accept guarded array/object pointers and boxed
VM-stack values. Receiver/root resolution and exact raw undo values use the
existing scalar-store machinery. Assignment results are supported, not only
discarded writes. No benchmark code, sizes, names or code addresses select
this path.

The first trace passed the formerly unsupported SET but still rejected
`recycle` at a floating arithmetic instruction. The preceding literal member
read was encoded as LOAD/GET rather than GETK; the generic getter left a
boxed representation with stale entry-slot observations. Bytecode-proven
literal LOAD/GET now uses the same guarded member-read path as GETK, in both
whole-function and loop lowering. Unknown/dynamic keys retain dynamic lookup.
The resulting owner trace confirms native whole-function compilation and
execution, not just successful interpreted results.

Two new tests failed before corresponding fixes:

- Capturing `(t.current=a)` and then overwriting `a` changed the captured
  result because it was a deferred alias of the argument's VM slot. Results
  now capture guarded bits, and lifetime-only undo-log entries independently
  retain reference-valued results until native commit/rollback. These entries
  deduplicate by identity, obey allocation/capacity failure and never write
  the heap during rollback.
- A later guard failure after `a=t.empty` replayed the interpreter with the
  modified argument. Native input snapshots now preserve overwritten live-in
  slots for regions whose getters/call materialization can write the VM
  stack. These are bounded log entries recorded before executing the body;
  rollback restores them along with heap writes. Successful execution keeps
  its writes. This is not a full-stack snapshot on every native invocation.

New tests cover assignment receiver/value/result aliases, nested assignments,
changed input tags, late failures after VM argument overwrite, rotating owner
sets of 1/2/19/257 with up to 511 iterations, zero/one-trip cases, table/class
receivers and aliased destinations. Complete state snapshots agree with the
interpreter. Native whole-function successes and loop successes/late guards
are asserted. Separate log tests cover retained-owner identity/refcounts,
growth/index allocation failure, capacity, commit and mixed stack/heap rollback.

Existing limitations are not hidden by these tests: general internal branches
in AArch64 loop regions remain unsupported (`cycle`'s string-valued diamond
still falls back), as do dirty object-valued loop live-outs. Null/unknown boxed
assignment-result captures retain VM fallback; stored boxed values themselves
can still have those tags. Supporting an owned boxed native representation
remains further work. The rotating `owner_sequence` test exercises the new
loop route independently of the branch-heavy fallback test.

This candidate passes all 98 selected ordinary Release tests, including all
28 JIT tests. Its preserved development binary is
`/tmp/sqgi-reference-stores-release-20260909.IPBBw4/sqgi`, SHA-256
`04246f11729a95a0252042d4082ea012aa8c64c812fdee1468562341584ce5af`.
It has native JIT ON, but **LTO and PGO OFF**. The complete tracked source
delta from `953b5b4` is `/tmp/sqgi-reference-stores-source.patch`, SHA-256
`3222dea9b431b6f9425d7b32933b329e040b014defac754667a25a3b95102346`.

Logs: `/tmp/sqgi-reference-stores-{release-build,release-tests,owner-trace}.log`.
The strict-alignment ASan/UBSan build passes all 99 selected CTests, including
installation, with leak and stack-use-after-return checking enabled. All 37
application/member/method/owner/float holdout components pass sanitized runs
at 20,003 iterations, one warmup (application seed 83), without reports.
Logs: `/tmp/sqgi-reference-stores-asan-{build,tests,application_workloads,member_workloads,member_methods,member_owners,float_workloads}.log`.

### Reference-store development timing gate: rejected

These comparisons are **ordinary Release, JIT ON, PGO/LTO OFF** against the
preserved checked-read development build `fea4b4b8...` (not committed `953b5b4`
and not either optimized executable). Five rotating/alternating rounds, five
warmups, CPU 4, same RK3588S host/governor. No build, sanitizer or profiling
jobs ran during timings; unrelated workstation activity was uncontrolled.
All checksums agree. Owner runs use an explicit JIT-off reference.

Application seed 83 / 400,003 iterations:

| Component | Checked-read ns | Reference-store ns | Speedup |
| --- | ---: | ---: | ---: |
| route_balanced | 53.06 | 49.67 | 1.068× |
| route_skewed | 48.76 | 49.08 | 0.994× |
| pricing_events | 54.49 | 54.91 | 0.992× |
| filter_stream | 51.01 | 51.36 | 0.993× |
| records_64 | 159.63 | 127.32 | 1.254× |
| records_4096 | 275.06 | 234.56 | 1.173× |
| word_count | 261.31 | 262.08 | 0.997× |
| graph_walk | 10.95 | 10.96 | 0.999× |

The candidate record ranges are 5.4% and 28.9% of median (64 / 4,096);
no samples are excluded. Larger-record improvement needs repeat confirmation.
[Application samples](reference-stores-release-applications-2026-09-09.json).

Owner holdouts / 200,000 iterations:

| Component | Checked-read ns | Reference-store ns | Node ns |
| --- | ---: | ---: | ---: |
| table_owners_1 | 297.88 | 208.99 | 8.88 |
| table_owners_2 | 297.76 | 229.06 | 8.77 |
| table_owners_5 | 297.63 | 236.38 | 8.38 |
| table_owners_19 | 297.65 | 273.37 | 8.36 |
| table_owners_257 | 298.10 | 827.80 | 8.94 |
| class_owners_1 | 305.36 | 290.24 | 8.39 |
| class_owners_2 | 305.52 | 308.18 | 8.33 |
| class_owners_5 | 305.33 | 320.49 | 8.18 |
| class_owners_19 | 305.76 | 353.53 | 8.20 |
| class_owners_257 | 305.77 | 914.82 | 8.50 |

The 257-owner cases are 2.78× / 2.99× slower despite executing natively.
Their candidate ranges are 3.6% / 2.8%, so the regression is material.
Small table-owner cases improve, but these cannot justify accepting the
larger-set and class-owner regressions.
[Owner samples](reference-stores-release-owners-2026-09-09.json).

The 15 original kernels at 160,000 base iterations also expose smaller
regressions: dynamic members 720.85 → 744.82 ns (3.3% slower), matrices
301.73 → 316.29 ns (4.8% slower), array append 79.96 → 80.83 ns (1.1%
slower). Vectors improve 1.1%; the other medians are within 0.9%.
Object-valued member-write fallback is unchanged at 468.56 ns. The new
native store path does not imply all object-writing workloads are native.
[Kernel samples](reference-stores-release-kernels-2026-09-09.json).

The candidate is rejected at this development gate. Further holdout timing
and fresh PGO/LTO confirmation are deferred until regressions are revised.
There is no fresh optimized-build result for this newer candidate, and none
of this iteration is committed or pushed.

### Native owner regression profile

The preserved `04246f11...` executable was profiled across all ten owner
components at one million iterations, one warmup, CPU 4,
`perf record -e cycles:u -F 499 -g --call-graph dwarf,8192`.
It captured 5,944 samples, none lost, approximately 27.066 billion user
cycles. Aggregate self shares (not per-component attribution):

| Symbol | Self samples |
| --- | ---: |
| SQJitWriteLog::RecordMember | 41.63% |
| sqjit_a64_member_store_slot | 12.25% |
| SQTable::Get | 8.78% |
| sqjit_a64_get_member_value | 6.30% |
| sqjit_a64_helper_table_get_array_ptr | 3.62% |
| sqjit_a64_helper_member_set_reference_logged | 2.69% |
| SQJitWriteLog::Contains | 2.53% |

Instruction annotation concentrates RecordMember samples in its retained-owner
probe loop. Source inspection establishes a scaling problem: the lookup checks
old-owner identity, but hashes only receiver/key, so every displaced owner of
one field starts at the same bucket. Large owner sets therefore require long
linear probes even after the index grows. This is a general undo-journal
indexing issue, not a reason to specialize the JIT for owner-set sizes.

The next revision should index owner identity separately from destination
identity while preserving every required owner, the first rollback value,
raw weak references, allocation failure and structural-change ordering. The
remaining member lookup costs and dynamic-member/matrix regressions also
remain acceptance requirements; fixing one profile hotspot cannot waive them.

Local captures: `/tmp/sqgi-reference-stores-owner-profile.{data,log}` and
`/tmp/sqgi-reference-stores-owner-annotate.log`.
