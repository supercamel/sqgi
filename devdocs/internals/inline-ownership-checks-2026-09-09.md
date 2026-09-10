# Inline scalar ownership checks, 2026-09-09

Status: experimental, uncommitted, unaccepted. Native AArch64 JIT ON,
ordinary Release, PGO/LTO OFF. Continues
[array-construction hints](array-construction-hints-2026-09-09.md).

Follow-up: [stack-snapshot lookup experiment](stack-snapshot-hints-2026-09-09.md),
rejected after broad measurements; its runtime cache was removed.

## Evidence and chosen mechanism

The preceding five-pair kernel comparisons put float-array reads at
6.82 -> 9.38 ns versus the compact prototype, a 37.6% regression. Construction
hints made the whole function compile, replacing the previous faster loop
region. A subsequent profile puts 9.44% of candidate self cycles in
scalar_get_can_elide. Generated-code disassembly shows a helper call solely
to check ownership tags, plus repeated mask construction/test sequences for
scalar stack writes. The timing comparisons precede the unrelated project
CTest discovered later; those subsequent profiles may be contended, as
documented in the preceding report. They motivate a general lowering change,
not a claim that the helper alone accounts for the complete regression.

The emitted predicate now reloads the current context's active VM, branches
to the existing checked path if it is null, checks the physical destination's
reference bit, and checks the actual VM temporary's reference bit. Only when
both are clear does it skip the journal-backed GET publication. It does not
infer old-slot ownership from the new scalar result. Raw native callers still
take the checked path using their journal-local temporary. No ownership
result is cached across calls, writes, joins or iterations.

Scalar private-result writes replace load/mask/AND/compare/branch with a tag
load and TBZ. A compile-time assertion ties the native bit number to the VM
reference-tag definition. The existing block-local invalidation rules are
unchanged. The same checks apply to all scalar results and typed GETs in
ordinary AArch64 whole functions; there is no array or benchmark-name dispatch.
The three-argument native ABI, runtime object/journal layouts, release guards,
rollback semantics and x64/loop lowering are unchanged.

## Low-level validation

The new TBZ/TBNZ emit/patch helpers reject invalid registers, bit numbers,
source offsets/opcodes, misalignment, full/invalid buffers and displacements
outside [-32768, 32764] bytes. Bounds are checked before signed subtraction
to avoid overflow on extreme caller-provided offsets. Rejected patches retain
the original instruction and rejected emissions retain the caller's patch
position. Four exact encodings (bits 0/27/32/63, both directions and range
endpoints) match the system GNU assembler. Oracle artifacts:
`/tmp/sqgi-bit-branch-oracle.s` and `.o`.

Standalone emitter tests cover these cases plus invalid ownership-predicate
arguments. The linked memory test installs and executes the emitted predicate
for all 324 pairs of the 18 VM tags, with active VM, no active VM, and a
changed active-VM pointer (973 checks including the null-stack/no-VM case).
It compares against the original C++ reference-bit predicate. Fixtures use
raw objects and never dereference reference-tag payloads. Full runtime tests
separately exercise actual VM offsets, live references and callbacks.

Disassembly of the frozen revised float reduction confirms the active-VM
load/null branch, both tag tests, retained checked fallback, and TBZ private
scalar writes, with no scalar_get_can_elide helper call. Artifacts:
`/tmp/sqgi-inline-ownership-float-disassembly.gdb` and `.log`.

## Benchmark observability

The paired execution and member runners now record UTC start/end timestamps,
host load averages and CPU governor/current/maximum frequency around each
child process, including the member runner's interpreter reference. These
snapshots are outside the workload's own timing interval. Missing cpufrequency
files are tolerated. No process command lines or unrelated project details
are collected into benchmark artifacts. This makes later host overlap
auditable; it does not guarantee isolation or justify deleting noisy samples.

## Frozen provenance

GCC 13.3 Release, int64/double, native JIT ON, PGO/LTO/ASan OFF.
Executable: `/tmp/sqgi-inline-ownership-release-20260909.Qy4E0e/sqgi`, SHA-256
`a2fbea5e35971269185b7a324648e72a06617c644c4ace5cdbb559cc152eba13`.
CMakeCache is alongside. Full tracked delta from committed 953b5b4, including
runner metadata changes but excluding untracked reports:
`/tmp/sqgi-inline-ownership-source-v2.patch`, SHA-256
`80f2dd1dfddffe632c5bf17fd75a2a68b0aa0ff08c41aada8f96794fe56302d6`.

Immediate predecessor:
`/tmp/sqgi-array-construction-release-20260909.mSbyBy/sqgi`, SHA-256
`ab4be51f528d770b287282b793db81f06ec4388072806db1cf3065c1ed771335`.
The earlier compact baseline remains available to test whether the original
float regression is actually recovered, not merely reduced.

Selected Release tests pass 97/98 and strict-alignment ASan/UBSan tests pass
98/99, with only the existing assign_refs native coverage failure and no
sanitizer reports. Leak and stack-use-after-return detection are enabled.
Focused x64/QEMU tests remain 2/3: write-log and memory pass, member-plan
retains its 27 stack-order and seven route failures. The AArch64 emitter and
executable-predicate tests pass in Release and ASan/UBSan.

All 41 independent application/member/method/owner/float/root components match
between JIT off/on with ASan/UBSan, 20,003 iterations, one warmup and seed 83.
Expected row/iteration counts are checked and script/sanitizer errors rejected.
These are correctness checks, not timing results. Logs:
`/tmp/sqgi-inline-ownership-{release,asan,x64}-tests.log` and
`/tmp/sqgi-inline-ownership-asan-holdouts.log`.

The full source delta still matches the frozen patch hash. All validation
processes finished before timing began; a process check showed no other build,
CTest or perf-record job running then. This is a start-of-run observation,
not a guarantee against later workstation activity. No commit, push or fresh
PGO/LTO training is justified by this stage.

## First timing comparisons

Five alternating pairs, five warmups, CPU 4, same frozen binaries and ordinary
Release/JIT settings. Kernel base count 160,000 (3.2 million for scaled cases).
All checksums match. No SQGI build, sanitizer or profile jobs run during timing;
start-of-run and intervening process checks show no other such jobs. Per-process
UTC/load/frequency snapshots are retained. The first kernel comparison spans
22:32:00-22:32:59 UTC (08:32 local); CPU snapshots show ondemand at 2.304 GHz.
This does not establish exclusive workstation access.

Against the immediate construction-hint predecessor:

| Workload | Preceding ns | Inline-check ns | Speedup |
| --- | ---: | ---: | ---: |
| direct_call | 34.62 | 34.83 | 0.994x |
| branch_call | 32.34 | 32.52 | 0.994x |
| float_call | 20.90 | 20.98 | 0.996x |
| numeric_loop | 23.00 | 23.06 | 0.998x |
| vector | 383.68 | 382.58 | 1.003x |
| dynamic_member | 1656.03 | 1648.34 | 1.005x |
| dynamic_key_get_set | 186.75 | 185.22 | 1.008x |
| object_member_write_fallback | 472.79 | 473.43 | 0.999x |
| array_append | 115.20 | 114.53 | 1.006x |
| array_write | 37.10 | 37.26 | 0.996x |
| array_read | 9.65 | 7.51 | 1.285x |
| array_float | 9.38 | 7.19 | 1.304x |
| math_intrinsic | 210.41 | 210.44 | 1.000x |
| math_variable | 226.46 | 220.31 | 1.028x |
| matrix | 316.49 | 317.64 | 0.996x |

Thus the change removes 22.2%/23.3% of integer/float read time, but it does not
recover the entire earlier float regression. A separate five-pair comparison
against the pre-construction compact build gives array_float 6.833 -> 7.184 ns,
still 5.1% slower. That comparison gives array_read 59.16 -> 7.50 ns (7.889x)
and array_write 82.04 -> 37.19 ns (2.206x), largely including the previous
construction-hint gain. Those are not committed-baseline gains. Intrinsic
math remains 1.2% slower than compact in this comparison; variable math is
3.6% faster. Remaining kernel medians differ by at most 1.6%.
[Immediate ablation](inline-ownership-release-kernels-ablation-2026-09-09.json),
[pre-construction comparison](inline-ownership-release-kernels-compact-2026-09-09.json).

## Application holdouts

Five alternating pairs at each of seeds 83 and 17, 400,003 iterations:

| Application | Preceding ns, seed 83 | Inline ns, seed 83 | Preceding ns, seed 17 | Inline ns, seed 17 |
| --- | ---: | ---: | ---: | ---: |
| route_balanced | 52.67 | 52.33 | 52.31 | 52.43 |
| route_skewed | 51.96 | 51.65 | 51.98 | 52.12 |
| pricing_events | 57.99 | 58.11 | 58.13 | 58.02 |
| filter_stream | 55.82 | 55.81 | 55.79 | 55.81 |
| records_64 | 135.88 | 137.94 | 135.88 | 136.85 |
| records_4096 | 244.16 | 246.33 | 245.09 | 244.67 |
| word_count | 266.44 | 266.16 | 265.11 | 265.45 |
| graph_walk | 16.46 | 12.49 | 16.50 | 12.61 |

Graph walking is 24.1%/23.6% faster in time, a 1.318x/1.308x speedup on an
independent application excluded from PGO training. This demonstrates reach
beyond the constructed-array kernels. Small-record updates are 1.5%/0.7%
slower and remain under scrutiny; the other six components are within 0.9%.
These data do not erase the wider experimental series' committed-baseline
regressions or establish Node/GJS parity.
[Seed 83](inline-ownership-release-applications-seed83-2026-09-09.json),
[seed 17](inline-ownership-release-applications-seed17-2026-09-09.json).

## Remaining completed holdouts

Five rotating rounds, five warmups, 200,000 iterations, CPU 4. The member
runner checks each result against an independent JIT-off run. All checksums
match. These are ordinary Release/JIT results, not PGO/LTO confirmation.

| Suite | Change in candidate median time versus immediate predecessor |
| --- | --- |
| Six member workloads | Within 0.4% |
| Seven floating-point workloads | Within 0.6% |
| Six method workloads | Within 0.8% |
| Ten owner workloads | 1.6% faster to 1.0% slower |

The method workloads still take 46-75 times Node's time. Selected examples:
transfer_table 1,293.78 versus 18.08 ns, transfer_class 1,370.76 versus
18.31 ns, and publish_mixed 979.48 versus 21.11 ns. There is no broad
object-heavy improvement in this iteration.
[Members](inline-ownership-release-members-2026-09-09.json),
[floats](inline-ownership-release-floats-2026-09-09.json),
[methods](inline-ownership-release-methods-2026-09-09.json),
[owners](inline-ownership-release-owners-2026-09-09.json).

## Post-change profiles and call-history diagnostic

After all timing jobs completed, CPU-4 cycles:u profiles at 499 Hz with DWARF
call graphs recorded 1,322 float samples and 4,086 owner samples, none lost.
The float profile uses three 120-million-iteration reductions with checksum
240,000,000 each. Almost all float samples are generated code; the removed
scalar_get_can_elide helper is gone. The unchanged owner suite uses 400,000
iterations and one warmup. Its largest self-cycle shares are RecordStackSlot
14.83%, FinishStackWrite 13.01%, RetainValue 10.16%, CanRelease 9.21%,
CountPins 7.78%, and RecordMember 5.22%. Profiles are diagnostic, not timing
samples. Artifacts: `/tmp/sqgi-inline-ownership-{float,owners}.data` and the
corresponding `-profile.log` / `-flat.log` files.

A fresh-process diagnostic copies the unchanged OwnerRecord/recycle/owners
functions, then selects one owner count or reverses the case order. All 16
processes (two receiver kinds, four order/selection variants, JIT off/on)
finish and paired checksums match. The isolated width-2 case takes about
0.23 us with JIT; in a five-case run the same width takes about 0.93-0.96 us.
Neither receiver kind nor working-set size alone explains the cliffs.

Tracing ten identical width-1 class calls resolves the ambiguity: after
initial compilation the calls alternate between roughly 0.99 us in the
whole-function path and 0.21 us after release-guard failure and native-loop
fallback. The failed guard reports array tag 134217792, two physical refs
and one journal pin. Backoff counters remain zero. The fixed warmup count
and seven calls per official case select alternating routes; reversing five
cases does not change that parity. This is a route/ownership-history issue,
not evidence that particular owner counts intrinsically cost four times more.
The loop backend still lacks full logical stack transition coverage, so its
speed must not be obtained by weakening the whole-function release guard.

Diagnostic artifacts: `/tmp/sqgi-inline-ownership-owner-order.nut`,
`/tmp/sqgi-inline-ownership-owner-order.log`, and
`/tmp/sqgi-inline-ownership-owner-repeat-trace.log`. The driver gained an
optional repeat mode after the first 16-process run; the benchmark functions
were not modified. These one-sample traced observations are not substituted
for the official five-round measurements.

Next work targets stable stack-snapshot lookup, the largest shared journal
hotspot, while retaining every ownership guard and epoch/rollback rule.
Member-runner warmup counts will be configurable so comparisons can expose
both call-history routes. Remaining semantic failures, the 5.1% float gap,
small-record regression and larger committed-baseline regressions stay open.
