# Compact native value journals, 2026-09-09

Status: **experimental, uncommitted, unaccepted; no PGO/LTO claim**.
Next iteration: [guarded array-construction hints](array-construction-hints-2026-09-09.md).
This continues the [logical-stack ownership investigation](logical-slots-2026-09-09.md).
The prior prototype preserved the reproduced AArch64 stack-release ordering,
but incurred 3.9-4.5x the committed build's time on method workloads. The extra
scalar GET fast path did not reach most of those costs. This revision changes
the shared journal's representation, not bytecode selection or release policy.

## Evidence and mechanism

The preceding frozen prototype's six-method profile captured 6,224 samples,
none lost, approximately 28.37 billion user cycles. Self shares included Index
8.92%, RecordStackSlot 7.92%, FinishStackWrite 6.47%, Grow 5.62%, IndexPin 4.72%,
RetainValue 4.70%, ReleaseEntry 4.09%, Append 3.79%, and CanRelease 3.75%.
Profile and report: `/tmp/sqgi-logical-slots-get-elision-methods.data` and
`/tmp/sqgi-logical-slots-get-elision-methods-flat.log`.

Stack snapshots and lifetime-only pins previously occupied the same 64-byte
entry as a member store, including unused target/key fields. They also caused
the member journal to grow and build destination/owner indexes even when only
a few actual heap locations were written.

The new representation uses two streams:

- Heap entries retain array/member destinations and their raw old values.
- Compact entries contain one value, an optional stable stack address, and the
  heap-entry count at insertion. A null address means a lifetime-only pin.

Compact entries are 32 bytes on this int64/double AArch64 build. Both streams
retain the existing eight-entry inline threshold, grow with checked allocation,
and use independent lazy indexes. The global 65,536-entry limit counts both
streams; deduplication still works at the limit. Array-size records start a
new deduplication epoch in both streams.

The insertion boundary merges the streams in their original order. Rollback
walks them in reverse together, not one entire stream followed by the other.
Cleanup preserves the preceding implementation's reverse order for a total
inline-sized history and forward order for a grown history. Entries remain
constructed and the journal stays registered through all release-hook reentry.

Pin accounting includes both streams and the staged destination. The small
linear scan retains the original budget of 24 reference fields, but a compact
entry contributes one field instead of three. The indexed census grows for
the combined reference-field bound and indexes both streams incrementally.
Clearing any pin invalidates both census cursors before invoking a callback.
No pins become program owners and no final-release guard is weakened.

The tradeoff is larger inline journal storage: sizeof(SQJitWriteLog) rises
from 696 to 1,000 bytes. The old size is confirmed by the preserved binary's
allocation instruction; the new size and 64/32-byte entry sizes by debugger
type information. Native emitters continue to derive frame space from sizeof;
the three-argument native entry ABI and heap object layouts are unchanged.
Larger frames may reduce compilation coverage, so this is not assumed to be
a free improvement.

## Validation

Selected AArch64 Release CTests: **97/98**. Strict-alignment ASan/UBSan:
**98/99**, with leak and stack-use-after-return detection and no sanitizer
reports. Both retain only the `assign_refs` native-frame coverage failure.
The package test is excluded from both suites; ordinary Release also excludes
the existing root-owned install artifact. All 27 stack release-order cases
and the existing native object-plan/leaf/memory coverage checks pass.

New shared tests cover:

- Alternating heap and stack undo APIs on the same stable destination, in
  both insertion orders, at 1 and 19 destinations and across a resize epoch.
- Fourteen separately injected compact/heap growth and indexing failures;
  each restores the exact prefix and balances every retained reference.
- One shared capacity limit, including successful deduplication at capacity.
- Mixed heap/stack/retained pin census after growth, a nested journal, and
  an actual additional owner that must still authorize a release.
- Inline and indexed cleanup reentry with heap and compact entries interleaved.

The final expanded shared unit passes separately in Release, ASan/UBSan and
cross-compiled x64 under QEMU. The x64 focused suite remains 2/3: write-log and
memory pass; member-plan retains its 27 unimplemented stack-order cases and
seven existing route failures. This storage change does not implement x64
logical stack transitions.

All 41 independent application/member/method/owner/float/root components pass
under ASan/UBSan with JIT both off and on, 20,003 iterations, one warmup,
seed 83. Row counts are checked, script/sanitizer errors rejected, and paired
checksums agree within 1e-10 relative tolerance. These are correctness runs,
not timing results.

Logs:

- `/tmp/sqgi-compact-values-release-tests.log`
- `/tmp/sqgi-compact-values-release-log-tests.log`
- `/tmp/sqgi-compact-values-asan-tests.log`
- `/tmp/sqgi-compact-values-asan-log-tests.log`
- `/tmp/sqgi-compact-values-x64-tests.log`
- `/tmp/sqgi-compact-values-x64-log-tests.log`
- `/tmp/sqgi-compact-values-asan-SUITE-jit{0,1}.log`

## Frozen provenance

GCC 13.3 ordinary Release, native AArch64 JIT ON, int64/double, PGO OFF,
LTO OFF, ASan OFF. The executable statically includes the engine. Snapshot:
`/tmp/sqgi-compact-values-release-20260909.jqAEbv/sqgi`, SHA-256
`57f148f9dff7299effb236a07a1bdc5213a82d3cb4163b3230fe532369435fe3`.
Its CMakeCache is alongside the executable.

Source delta from committed `953b5b4`, excluding untracked reports:
`/tmp/sqgi-compact-values-source.patch`, SHA-256
`8203973ea6d584a7ce1165cb971dc2ad843f9b4f1f1a1808e29ebb680be20b82`.

The immediate predecessor is
`/tmp/sqgi-logical-slots-get-elision-20260909.f4bB6z/sqgi`, SHA-256
`97517a191cde9d02dc4187bf5efaf01ff64ecde3d322e5bd6fecc1a84a090270`.
The committed ordinary Release baseline is
`/tmp/sqgi-compound-baseline-release-20260909.UICRYQ/sqgi`, SHA-256
`192855dd70da5a641d148425cdd58531fd30811033b4e58c96911da23722d42e`.
Neither reference is an acceptable substitute for all current ownership tests.

## First storage revision: gains and regressions

Five rotating rounds, five warmups, fresh processes, CPU 4, ondemand governor.
No build, sanitizer or profiler jobs ran during timing; unrelated workstation
activity was not controlled. All checksums match. The method/owner runner also
checks an independent JIT-off reference; the paired application/kernel runner
uses the first baseline output as its reference. All SQGI builds below have
JIT ON and PGO/LTO OFF.

Methods, 200,000 iterations, medians in ns:

| Workload | Committed | Preceding prototype | Compact values | Speedup vs preceding |
| --- | ---: | ---: | ---: | ---: |
| transfer_table | 420.16 | 1861.95 | 1484.29 | 1.254x |
| transfer_class | 434.17 | 1921.12 | 1561.67 | 1.230x |
| transfer_mixed | 481.19 | 1921.55 | 1562.08 | 1.230x |
| publish_table | 359.93 | 1501.97 | 1076.67 | 1.395x |
| publish_class | 365.12 | 1538.14 | 1112.66 | 1.382x |
| publish_mixed | 394.92 | 1535.61 | 1114.92 | 1.377x |

These reduce the new journal overhead, not the committed baseline's runtime:
the candidate still takes 2.82-3.60x the committed build's time. [Method samples](compact-values-release-methods-2026-09-09.json).

Original kernels, five alternating pairs at 160,000 base iterations:
dynamic_member improves 2279.59 -> 1836.14 ns (1.242x). Calls, numeric loops,
dynamic-key access, object-member write fallback, floats and math are largely
unchanged. Array read regresses 61.09 -> 67.07 ns (9.8%); array write
86.47 -> 88.61 ns (2.5%); append 132.56 -> 136.89 ns (3.3%). [Kernel samples](compact-values-release-kernels-ablation-2026-09-09.json).

Applications, seed 83 and 400,003 iterations, five alternating pairs against
the preceding prototype: records_64 regresses 131.43 -> 140.11 ns (6.6%),
records_4096 231.38 -> 248.85 ns (7.6%); other components remain within 0.4%.
[Application ablation](compact-values-release-applications-ablation-2026-09-09.json).
A separate committed-baseline comparison still has record gains but routing,
pricing/filtering and graph regressions: graph_walk is 10.95 -> 16.25 ns.
[Committed-baseline applications](compact-values-release-applications-baseline-2026-09-09.json).

The ownership holdout also prevents accepting the first storage revision.
Five rotating rounds at 200,000 iterations reproduce substantial regressions
versus the preceding prototype: table owner sets 2/19 are 21.6%/20.3% slower;
class sets 1/5/257 are 26.9%/20.0%/17.6% slower. Other owner cases range from
5.8% faster to 1.9% slower. All sizes and receiver kinds are retained in the
[owner samples](compact-values-release-owners-2026-09-09.json); the favorable
cases do not offset the regressions.

## Regression diagnosis and revised lookup code

Three fresh profiles use the frozen first compact-values revision, CPU 4,
cycles:u at 499 Hz, DWARF/8192 call stacks, no concurrent timing/build/test jobs:

| Profile | Samples | Approximate cycles | Lost |
| --- | ---: | ---: | ---: |
| array_read_kernel, three calls of 24 million iterations | 2380 | 10.78 billion | 0 |
| all eight applications, 3 million iterations, one warmup, seed 83 | 2643 | 11.89 billion | 0 |
| all ten owners, 400,000 iterations, one warmup | 5057 | 22.97 billion | 0 |

The array profile uses `/tmp/sqgi-compact-values-array-profile.nut`, which loads
the existing kernel file, runs its ordinary correctness checks, and repeatedly
calls the existing array_read_kernel with checksum 60,000,000. It does not
duplicate or change the kernel. The other two use the original holdout files.

Array self shares: FindValue 18.40%, FinishStackWrite 18.29%, RecordStackSlot
9.38%, EnsureValueIndex 6.62%. Owner self shares: FindValue 23.52%,
FinishStackWrite 11.60%, CanRelease 6.89%, CountPins 6.44%, EnsureValueIndex
3.34%. The application profile puts 13.05% in ContainsMember<false>.
Captures/reports are `/tmp/sqgi-compact-values-{array,applications,owners}.data`
and `/tmp/sqgi-compact-values-{array,applications,owners}-flat.log`.

Disassembly confirms the first representation refactor introduced unconditional
calls from RecordStackSlot to EnsureValueIndex and FindValue. The revision
restores an inline index-ready check with cold BuildValueIndex allocation,
specializes lookup by stack-address versus retained-value semantics, and gives
the value/member lookup definitions normal C++ inline visibility. Stack lookup
no longer tests retained-value tags; the separate retained-value specialization
still compares raw tags and identity. No lookup rules or ownership checks change.
The revised RecordStackSlot assembly has neither extra call on its common path;
only index construction and append remain out of line.

The revised runtime passes 97/98 selected Release CTests and 98/99 strict
ASan/UBSan CTests, with the same single coverage failure and no sanitizer
reports. x64 remains 2/3 with exactly the same 27 ordering and seven route
failures. The 41 sanitized JIT-on/off holdouts also pass again. Logs use
`/tmp/sqgi-compact-values-inline-{release,asan,x64}-tests.log` and
`/tmp/sqgi-compact-values-inline-asan-SUITE-jit{0,1}.log`.

Revised frozen executable:
`/tmp/sqgi-compact-values-inline-release-20260909.xCPsDY/sqgi`, SHA-256
`41285a98bc757043a96ba0d3d16e5023bc07933a466c74048162c90908da664d`.
The CMakeCache is alongside it; build options match the first prototype.
Revised source delta: `/tmp/sqgi-compact-values-inline-source.patch`, SHA-256
`cff4a9c3636a5bbc0773a267ef2288a053d229824cdab65a926f35c587f7805b`.

## Revised lookup measurements

Five alternating kernel pairs against the preceding logical-slot prototype,
with the same 160,000 base count, five warmups and CPU 4:

| Kernel | Preceding ns | Revised compact ns | Speedup |
| --- | ---: | ---: | ---: |
| direct_call | 34.07 | 34.12 | 0.998x |
| numeric_loop | 22.71 | 22.73 | 0.999x |
| dynamic_member | 2272.31 | 1632.78 | 1.392x |
| array_append | 131.04 | 127.86 | 1.025x |
| array_write | 86.29 | 81.09 | 1.064x |
| array_read | 61.12 | 58.44 | 1.046x |
| vector | 372.68 | 379.26 | 0.983x |
| matrix | 317.34 | 313.53 | 1.012x |

The first storage revision's array regression is no longer reproduced. The
vector medians regress 1.8%, with overlapping min-to-max ranges of
370.38-381.29 ns (preceding) and 372.59-383.33 ns (candidate); this is retained
as an unresolved small change, not silently excluded. Other kernel medians
are within 0.5%. [All revised kernel samples](compact-values-inline-release-kernels-ablation-2026-09-09.json).

Five application pairs at seed 83 / 400,003 iterations give records_64
130.91 -> 134.04 ns (2.4% slower), records_4096 273.60 -> 239.32 ns
(1.143x faster), and other medians within 0.5%. Record ranges overlap:
127.12-134.11 versus 131.03-136.21 ns (64), and 217.18-282.39 versus
232.92-260.40 ns (4,096). The smaller-record change needs another seed/repeat;
the larger-record median gain is smaller than its preceding run-to-run range.
[Revised application samples](compact-values-inline-release-applications-ablation-2026-09-09.json).

Five rotating method rounds, 200,000 iterations and five warmups, confirm
larger reductions after the lookup revision:

| Workload | Committed ns | Preceding ns | Revised compact ns | Speedup vs preceding |
| --- | ---: | ---: | ---: | ---: |
| transfer_table | 420.22 | 1856.99 | 1265.60 | 1.467x |
| transfer_class | 434.79 | 1927.86 | 1339.75 | 1.439x |
| transfer_mixed | 482.01 | 1920.37 | 1340.02 | 1.433x |
| publish_table | 360.27 | 1505.83 | 928.84 | 1.621x |
| publish_class | 366.17 | 1546.01 | 966.39 | 1.600x |
| publish_mixed | 396.06 | 1539.59 | 972.58 | 1.583x |

All checksums match the independent interpreter reference. These are
30-38% reductions versus the preceding prototype, but still 2.46-3.08x the
committed build's time. [Revised method samples](compact-values-inline-release-methods-2026-09-09.json).

## Confirmation runs

Five further kernel pairs confirm dynamic_member 2284.08 -> 1631.13 ns
(1.400x), array_read 61.08 -> 58.32 ns (1.047x), and array_write
86.48 -> 80.88 ns (1.069x). Vector is 381.48 -> 380.35 ns: the first
run's 1.8% regression does not repeat. Append is 128.49 -> 111.01 ns
(1.157x), a larger improvement than in the first run; do not substitute
this single larger result for the observed range of effects. Intrinsic
math is 203.00 -> 205.69 ns (1.3% slower) in this repeat.
[Repeat kernels](compact-values-inline-release-kernels-repeat-2026-09-09.json).

Seed 17 / 400,003 iterations repeats the smaller-record regression:
129.09 -> 132.68 ns (2.8% slower). Larger records are 263.03 -> 245.32 ns
(1.072x); other components are within 0.5%. The smaller-record change
is not dismissed because it repeats across both seeds.
[Second application seed](compact-values-inline-release-applications-seed17-2026-09-09.json).

Owner medians, all ten cases and both comparisons, ns:

| Workload | Preceding, five rounds | Compact, five rounds | Preceding, seven rounds | Compact, seven rounds |
| --- | ---: | ---: | ---: | ---: |
| table_owners_1 | 239.58 | 211.68 | 240.33 | 212.44 |
| table_owners_2 | 1032.93 | 942.36 | 1059.61 | 981.70 |
| table_owners_5 | 228.37 | 214.37 | 227.62 | 216.21 |
| table_owners_19 | 1049.42 | 960.31 | 1043.85 | 970.93 |
| table_owners_257 | 232.81 | 228.68 | 233.58 | 229.98 |
| class_owners_1 | 1121.56 | 1136.90 | 1125.20 | 1129.84 |
| class_owners_2 | 350.60 | 327.42 | 352.65 | 328.15 |
| class_owners_5 | 1146.35 | 1086.90 | 1165.48 | 1067.02 |
| class_owners_19 | 324.15 | 317.54 | 323.60 | 319.38 |
| class_owners_257 | 1185.56 | 1096.40 | 1190.97 | 1102.78 |

All match the JIT-off reference, with Node included in the rotation. Node
is 8.21-8.98 ns in the repeat. The first class_owners_1 comparison has
a 1.4% regression with non-overlapping ranges; its repeat is only 0.4%
slower. The other nine improve in both comparisons, but the large
receiver/working-set performance cliffs remain. Five-round committed
times are approximately 298-299 ns for tables and 306 ns for classes;
several experimental cases remain several times slower than those.
[Five owner rounds](compact-values-inline-release-owners-2026-09-09.json),
[seven owner rounds](compact-values-inline-release-owners-repeat-2026-09-09.json).

## Acceptance scope

This addresses a profiled storage/indexing cost shared by native backends.
It does not solve the remaining scalar/boxed typing gap, sole-owner graph
replacement, untracked call/constructor writes, x64/loop stack transitions,
or nested replay/commit issues documented in the preceding report. The whole
experimental series remains unaccepted until semantics and broad performance
gates pass. No commit, push or new PGO/LTO training has been performed.
