# Undo-journal owner indexing, 2026-09-09

Status: **development candidate, uncommitted and not accepted**. This builds
on the [reference-store work](aarch64-compound-members-2026-09-09.md), whose
native owner profile attributed 41.63% of self samples to RecordMember.
That implementation compared old-owner identity but hashed only receiver/key,
forcing all displaced owners of a field into one probe cluster.

## Mechanism and correctness

The journal now has a lazily allocated owner index hashing receiver, key and
old value's raw identity/type. The destination index contains only the first
member record per destination in an epoch. All distinct displaced owners still
remain in the ordered undo entries. Array-resize boundaries reset both indexes;
growth transfers entries and either both new indexes succeed or old storage
stays intact. Scalar-only logs do not allocate the owner index. Entry order,
raw weak references, capacity and rollback semantics are unchanged. There are
no benchmark names, input-size rules or address/alignment adjustments.

All 98 selected ordinary Release CTests pass, including 28 JIT tests. The
strict-alignment ASan/UBSan build passes 99/99 selected tests with leak and
stack-use-after-return checking enabled. All 37 independent holdout components
also pass sanitized runs at 20,003 iterations/one warmup, seed 83 for applications.
New journal tests exercise 73 owners shared across six destinations, scalar
initial values, distinct key/receiver identities, dead weak references, resize
epochs and each of 12 allocation-failure stages through index/storage growth.
Existing native assignment/loop/alias/late-rollback checks remain enabled.

Logs: `/tmp/sqgi-owner-index-{release-build,release-tests,asan-build,asan-tests}.log`
and `/tmp/sqgi-owner-index-asan-{application_workloads,member_workloads,member_methods,member_owners,float_workloads}.log`.

## Preserved build

- Executable: `/tmp/sqgi-owner-index-release-20260909.PWhomG/sqgi`.
- SHA-256: `9818f90cb842eb8c1a2e5c284997cad5cfa3c53ed0a4f8d121587caefdb7dc63`.
- Source delta from `953b5b4`: `/tmp/sqgi-owner-index-source.patch`.
- Patch SHA-256: `773ad778537ceecf8296b9548b0375a3f7f03d7c30e756414dbb7dd046cb0538`.
- GCC 13.3 Release, AArch64 native JIT ON, int64/double, **PGO and LTO OFF**.

These are development comparisons, not new JIT/PGO/LTO standings. Preserved
optimized binaries/profiles from earlier iterations are not overwritten.

## Development performance gate

Five rotating/alternating rounds, five warmups, fresh processes, pinned CPU 4
on RK3588S, ondemand governor. No compilation, sanitizer or profiler job ran
during timings; unrelated workstation activity was uncontrolled. All checksums
match; the owner runner additionally uses a JIT-off reference. No samples are
excluded. Times below are median ns/iteration, lower is better.

The owner comparison includes two preserved development builds: checked reads
(`fea4b4b8...`) before native reference stores, and reference stores (`04246f11...`)
before the journal index change. Node is 18.19.1.

| Component | Checked reads | Reference stores | Indexed owners | Node |
| --- | ---: | ---: | ---: | ---: |
| table_owners_1 | 298.24 | 206.90 | 221.04 | 8.87 |
| table_owners_2 | 298.08 | 227.98 | 245.05 | 8.77 |
| table_owners_5 | 297.77 | 233.60 | 227.93 | 8.38 |
| table_owners_19 | 297.78 | 271.11 | 230.18 | 8.35 |
| table_owners_257 | 298.21 | 823.51 | 237.07 | 8.84 |
| class_owners_1 | 305.64 | 288.72 | 301.71 | 8.40 |
| class_owners_2 | 305.88 | 306.76 | 322.75 | 8.33 |
| class_owners_5 | 305.57 | 316.93 | 309.95 | 8.22 |
| class_owners_19 | 306.01 | 351.09 | 311.00 | 8.19 |
| class_owners_257 | 306.03 | 906.13 | 317.45 | 8.48 |

The 257-owner indexing gain is 3.47× for tables and 2.85× for classes versus
the reference-store candidate. However small owner sets regress against that
candidate, and several class cases remain 1–6% slower than checked reads.
The two-owner class candidate's range is only 0.4% of its median; its 5.5%
regression against checked reads is not dismissed as noise.
[Owner samples](owner-index-release-owners-2026-09-09.json).

Application/kernel pairs use **committed `953b5b4` ordinary Release** as their
baseline (`192855dd...`), unlike the owner table's checked-read baseline.
At seed 83 / 400,003 application iterations, 64-record processing is
287.90 → 137.44 ns (2.095×), 4,096 records 319.92 → 242.54 ns (1.319×),
and balanced routing 53.11 → 49.79 ns (1.067×). Other medians are within 0.6%.
[Application samples](owner-index-release-applications-2026-09-09.json).

The 15 original kernels at 160,000 base iterations still reject this revision:
dynamic members are 722.47 → 788.42 ns (9.1% slower), matrices 301.85 → 309.98
ns (2.7% slower). Other medians are within 1.4%. The record and large-owner
gains do not waive these regressions.
[Kernel samples](owner-index-release-kernels-2026-09-09.json).

Fresh PGO/LTO confirmation remains pending; this candidate is not committed
or pushed.

## Follow-up profiles and hot-path revision

The same preserved indexed executable was profiled with user cycles at 499 Hz,
DWARF call chains (8,192 bytes), pinned CPU 4, JIT threshold 1. The ten owner
components used one million iterations/one warmup: 4,101 samples, none lost,
approximately 18.622 billion cycles. Aggregate self shares:

| Symbol | Self samples |
| --- | ---: |
| sqjit_a64_member_store_slot | 17.38% |
| SQTable::Get | 13.17% |
| sqjit_a64_get_member_value | 9.02% |
| SQJitWriteLog::ContainsMember<false> | 8.59% |
| SQJitWriteLog::RecordMember | 6.85% |
| sqjit_a64_helper_table_get_array_ptr | 5.64% |
| SQJitWriteLog::EnsureIndex | 1.50% |

The retained-owner probe cluster is gone. RecordMember alone is not a fair
before/after attribution because GCC now outlines the destination lookup;
the two reported journal functions together account for 15.44% of self samples.
Annotation confirms calls to EnsureIndex and EnsureOwnerIndex even on their
already-initialized or inline-storage paths. A new owner in a small transaction
also triggers a second search to determine whether its destination is new.

A separate 15-kernel profile at 800,000 base iterations/one warmup captures
4,583 samples, none lost, approximately 20.748 billion cycles. Its leading
self symbols are SQVM::Execute (17.83%), member_closure_guard (7.91%) and
SQTable::Get (7.30%). These aggregate profiles are diagnostic evidence, not
per-component speedups or an exact explanation of every regression.

Captures: `/tmp/sqgi-owner-index-{owners,kernels}-profile.{data,log}`;
annotation: `/tmp/sqgi-owner-index-owners-annotate.log`.

The next development revision keeps index-allocation checks inline and combines
small-history owner/destination lookup into one pass. The cold allocation and
index growth paths, thresholds, retained entries and rollback ordering remain
unchanged. This revision is still undergoing correctness/performance checks.

## Inline-check revision: rejected by method holdouts

The preserved follow-up is
`/tmp/sqgi-owner-index-inline-release-20260909.JLp5sr/sqgi`, SHA-256
`d6544e0d142442951161cb50d093c86ac8b8638ef933fdd8c90bc5ee6f54d4e5`.
Source delta: `/tmp/sqgi-owner-index-inline-source.patch`, SHA-256
`9c67c0ce60c697e736cb4f87283294704f48b06e742599aa5500919bde35df0f`.
Build options and timing protocol remain ordinary Release, JIT ON, PGO/LTO
OFF, five rounds and five warmups. Release passes 98/98 selected tests;
strict-alignment ASan/UBSan passes 99/99 and all 37 independent holdouts.
Logs: `/tmp/sqgi-owner-index-inline-{release-build,release-tests,asan-build,asan-tests}.log`
and `/tmp/sqgi-owner-index-inline-asan-*.log`.

Against committed `953b5b4` ordinary Release, records_64 is 288.28 → 132.17 ns
(2.181×) and records_4096 339.25 → 253.86 ns (1.336×), at seed 83/400,003.
Seed 17/200,000 repeats 2.177× and 1.254×. The large-record candidate's seed-83
min-to-max range is 26.0% of its median; do not imply a precise stable 1.336×
gain. Dynamic members remain 721.88 → 745.09 ns (3.2% slower), matrices
302.20 → 304.68 ns (0.8% slower).
[Applications](owner-index-inline-release-applications-2026-09-09.json),
[second seed](owner-index-inline-release-applications-seed17-2026-09-09.json),
[kernels](owner-index-inline-release-kernels-2026-09-09.json).

The owner suite now compares directly to the committed ordinary binary:
table widths 1/2/5/19/257 go from approximately 298 ns to
206.99/228.20/219.71/218.22/226.78 ns; classes go from approximately 305 ns
to 288.53/305.81/299.11/298.15/306.44 ns. The large-history regressions are
gone. [Owner samples](owner-index-inline-release-owners-baseline-2026-09-09.json).

However, all six method holdouts materially regress:

| Component | Committed ns | Candidate ns | Time increase |
| --- | ---: | ---: | ---: |
| transfer_table | 420.315 | 513.950 | 22.3% |
| transfer_class | 434.965 | 538.105 | 23.7% |
| transfer_mixed | 481.645 | 547.545 | 13.7% |
| publish_table | 361.130 | 464.825 | 28.7% |
| publish_class | 366.425 | 492.595 | 34.4% |
| publish_mixed | 395.425 | 487.340 | 23.2% |

[Method samples](owner-index-inline-release-methods-baseline-2026-09-09.json).
The six member and seven floating holdouts remain within 0.8% of baseline.
[Members](owner-index-inline-release-members-baseline-2026-09-09.json),
[floats](owner-index-inline-release-floats-baseline-2026-09-09.json).
This candidate is rejected pending revision, not promoted to PGO training.

### Method profile and next general mechanism

Fresh paired profiles use the preserved committed and inline-index executables,
all six methods at 1,200,000 iterations/one warmup, CPU 4, cycles:u at 499 Hz,
8,192-byte DWARF call chains, no concurrent builds. Baseline/candidate capture
4,442/5,513 samples, none lost, approximately 20.159/25.025 billion cycles.
Baseline SQVM::Execute is 76.11% self; candidate is 37.59%, with
member_store_slot 9.86%, reference_store helper 6.25%, RecordMember 5.41%,
SQTable::Get 4.37%, Append 4.00%, journal destructor 2.55%, Index 2.27%,
_int_free 1.44% and cfree 1.15%. Native execution reduces interpreter work
but lookup and journaling overhead outweigh it. Samples are diagnostic,
not an estimate of isolated optimization speedups.
Captures: `/tmp/sqgi-owner-inline-methods-{baseline,candidate}-profile.{data,log}`.

AArch64 currently lazily allocates the journal object on the heap for every
mutating native invocation. The next revision moves that object into aligned
native-frame storage, using the existing x64 journal lifetime API. Growth
and all rollback/retention entries remain unchanged. Initialization precedes
every possible guard; all exits destroy the journal without freeing its frame.
Mixed captured-input/member-owner growth and empty-guard tests exercise reused
poisoned storage. Correctness and performance confirmation are pending.

### Frame-owned journal result

Preserved executable: `/tmp/sqgi-frame-journal-release-20260909.HdYkF7/sqgi`,
SHA-256 `b1bb31ac63a1d430be05ab3468446cfab52a58f39bc0e11e3909553ecd32332b`.
Source delta `/tmp/sqgi-frame-journal-source.patch`, SHA-256
`7e50d4dbf360ef4cbde93f0fb4005b43444fe3a1b7473d8a7fd1e38ed3727b85`.
Ordinary Release, native JIT ON, PGO/LTO OFF; 98/98 selected tests pass.
The broader Release run passed 98/99: the install test cannot overwrite the
existing root-owned `build-jit-release/install_manifest.txt` (permission denied).
That failure is preserved in `/tmp/sqgi-frame-journal-release-tests.log`;
the established non-install selection is in `...-release-tests-selected.log`.
The separate strict-alignment sanitizer build passes 99/99 including install,
plus all 37 independent holdouts at 20,003 iterations/one warmup. No sanitizer
or assertion suppression was added. Logs `/tmp/sqgi-frame-journal-asan-*.log`.

Five rotating rounds, five warmups, CPU 4, 200,000 iterations, no concurrent
build/sanitizer/profile jobs, all checksums match:

| Component | Committed ns | Heap journal ns | Frame journal ns |
| --- | ---: | ---: | ---: |
| transfer_table | 420.27 | 514.11 | 489.89 |
| transfer_class | 434.63 | 540.48 | 513.33 |
| transfer_mixed | 481.69 | 547.88 | 519.91 |
| publish_table | 360.24 | 464.95 | 441.71 |
| publish_class | 365.68 | 492.07 | 468.76 |
| publish_mixed | 394.84 | 487.67 | 464.15 |

The journal allocation change improves all six by 1.049–1.054× versus the
heap candidate, but they remain 7.9–28.2% slower than committed SQGI.
[Paired method samples](frame-journal-release-methods-2026-09-09.json).
The 15 kernels at 160,000 base iterations retain a 2.0% dynamic-member
regression (722.48 → 737.09 ns), and matrices remain 0.8% slower.
[Kernel samples](frame-journal-release-kernels-2026-09-09.json).
This is useful mechanism evidence, not acceptance or new optimized standings.

### Reference-read follow-up

The paired method profile also identifies the array/member getter helpers.
The existing checked table-read index path is now extended from numeric values
to arrays, tables, instances, classes, closures and strings. It validates the
current receiver tag, current node bounds, key tag/identity and actual value
tag at every read. It keeps no node or receiver pointer across calls. Weakref,
layout, type and receiver-kind misses use the unchanged getter helper; returned
references use exactly its existing borrowed lifetime and displaced-owner log.
No invocation-long field cache or stable-heap assumption is introduced.

New tests compare frame and loop execution with the interpreter across table
growth, deletion/reinsertion, shrink, replacement, delegates, missing keys,
weakref liveness and changed tags. Each supported reference tag also gets a
fresh native-frame site with identity checks, so array-specialization fallback
cannot masquerade as broad native coverage. Verification is pending.

The first reference-read test run failed two differential checks, both for an
unqualified global read inside a table's `_get`. Interpreter execution correctly
recurses through the receiver metamethod and reports native stack overflow;
native execution incorrectly bypasses delegation and returns a root value.
This is not introduced by the new hint: the focused
`/tmp/sqgi-root-metamethod-regression.nut` reproduces it with committed `953b5b4`
and the preserved frame-journal executable (JIT OFF fails as expected, JIT ON
incorrectly succeeds). Outputs are preserved in
`/tmp/sqgi-root-metamethod-{baseline,frame}-jit{0,1}.log`.
An initial explicit delegated-field repro did not trigger the bug; it is kept
as `/tmp/sqgi-root-delegate-regression.nut` and `...-old-trace.log`, not counted
as a reproducer. The failing test/diagnostic runs remain at
`/tmp/sqgi-reference-hints-{release-tests,asan-tests,diagnostic-test,diagnostic2-test}.log`.

SQVM::Get visits receiver delegation/metamethods and default delegates before
root fallback. The AArch64 root helper checked that ordering only for instances.
It now also requires tables to have no delegate and no matching default member;
other receiver kinds use VM fallback, except null, which has no intervening
lookup. Existing receiver-owned raw fields still win normally. The same safety
predicate protects root-target resolution for stores. The recursive metamethod
case stays in the test suite; it is not rewritten to bypass receiver semantics.
Fresh correctness/sanitizer checks of this revision are pending.

After that fix, selected ordinary Release tests pass 98/98 and strict-alignment
ASan/UBSan tests pass 99/99, including the unchanged recursive metamethod
differential and fresh native sites for all six reference tags. The focused CLI
reproducer now agrees with the interpreter (`/tmp/sqgi-root-metamethod-fixed.log`).
Build/test logs: `/tmp/sqgi-reference-hints-root-{release-build,release-tests,asan-build,asan-tests}.log`.
The frozen executable is `/tmp/sqgi-reference-hints-release-20260909.vxPPja/sqgi`,
SHA-256 `e425b31d97605d80db4e699b67ec8139a11d9b4ff3ed811dc8f1bc8824a27d26`.
Source delta `/tmp/sqgi-reference-hints-source.patch`, SHA-256
`1de220ca9a3464637c28aa12c01461eb5ec8826549e870b1d0040fddb6608f53`.
Build settings remain ordinary Release/JIT ON, PGO/LTO OFF; benchmark results
and sanitized holdout checks are pending. No previous optimized binary/profile
has been overwritten, and this source is not accepted or committed.

All 37 sanitized holdout components pass for `e425b31...` at 20,003
iterations/one warmup. The five-round ordinary comparisons nevertheless reject
it. Tables benefit from the checked reference reads: transfer_table falls
489.96 → 439.57 ns versus the frame-only candidate, and table-owner cases are
169.61–188.35 ns versus committed SQGI's approximately 298 ns. Class methods
do not get those table-read gains: transfer_class is 434.75 → 517.94 ns and
publish_class 365.77 → 472.14 ns versus committed SQGI (19.1% / 29.1% slower).
All six methods remain 4.7–29.1% slower than committed SQGI; candidate
min-to-max ranges are 0.3–2.2%, so these are not dismissed as noise.
[Methods](reference-hints-release-methods-2026-09-09.json),
[owners](reference-hints-release-owners-2026-09-09.json).

More importantly, the overly conservative non-table root guard pushes ordinary
array-receiver calls back into the interpreter: routing, pricing and filtering
are 3.45–4.48× slower, while record processing still improves 2.186× / 1.342×.
The 15 kernels alone would not have caught this application regression.
[Applications](reference-hints-release-applications-2026-09-09.json),
[kernels](reference-hints-release-kernels-2026-09-09.json).

The next revision checks each receiver kind's actual default delegate, matching
SQVM::Get, rather than unconditionally rejecting non-table/non-null receivers.
Table delegation and instance `_get` still require VM fallback; numeric
array/string misses still cannot consult root. New tests require native frame
successes for ten receiver kinds and change an array default delegate after
warmup to ensure a newly shadowed global exits safely. This retains the
recursive metamethod correction while restoring ordinary root access. Build,
correctness and benchmark confirmation are pending. An initial test compile
used range-for on SQVector, which has no iterators; it was corrected to indexed
iteration. The failed build logs remain `/tmp/sqgi-root-receivers-{release,asan}-build.log`.

The corrected default-delegate implementation passes all 98 selected Release
tests, including native-route assertions for all ten implicit receiver kinds
and the post-compilation default-delegate mutation guard. Source/executable
are frozen for the next comparison:
`/tmp/sqgi-root-receivers-release-20260909.TRtupL/sqgi`, SHA-256
`d10b51dff49c9625cebaf8d3bfd98cda551458f5d733500e202a2c553be6f33e`;
`/tmp/sqgi-root-receivers-source.patch`, SHA-256
`423486dd623137ec2972aa96ff229b02b54ad1adcfca0cf01110214a638fb330`.
The build is still ordinary Release/JIT ON, PGO/LTO OFF. Logs use prefix
`/tmp/sqgi-root-receivers-corrected-`. Sanitizer and benchmark confirmation
are pending; all rejected samples remain preserved.

The corrected revision also passes 99/99 strict-alignment sanitizer tests and
all 37 sanitized holdout components (20,003 iterations/one warmup). Logs are
`/tmp/sqgi-root-receivers-corrected-asan-{tests,application_workloads,member_workloads,member_methods,member_owners,float_workloads}.log`.
Its complete ordinary performance gate, including both application seeds and
all member/method/owner/float holdouts, is now running serially without any
concurrent build, sanitizer or profiler process.

## Corrected root-receiver performance gate (still unaccepted)

Five matched ordinary Release rounds, five warmups, CPU 4, unchanged checksums.
The seed-83 applications at 400,003 iterations show that preserving native
root lookup removes the 3.45–4.48× fallback regression, but not its full cost:

| Component | Committed ns | Corrected candidate ns | Speedup |
| --- | ---: | ---: | ---: |
| route_balanced | 53.04 | 62.77 | 0.845× |
| route_skewed | 49.02 | 61.82 | 0.793× |
| pricing_events | 54.77 | 66.86 | 0.819× |
| filter_stream | 51.13 | 64.66 | 0.791× |
| records_64 | 287.67 | 130.18 | 2.210× |
| records_4096 | 331.49 | 267.12 | 1.241× |
| word_count | 262.52 | 261.66 | 1.003× |
| graph_walk | 10.96 | 10.96 | 1.000× |

The 18–26% application regressions are not offset against the record gains.
[Application samples](root-receivers-release-applications-2026-09-09.json).

Method medians remain 439.14/517.43/504.28 ns for table/class/mixed transfer,
424.96/473.37/461.71 ns for publication, versus approximately
420.13/434.48/481.40 and 359.78/365.72/394.39 ns for committed SQGI.
[Methods](root-receivers-release-methods-2026-09-09.json).
Table owners improve from approximately 298 ns to 170.14/185.46/179.09/181.22/
188.35 ns at widths 1/2/5/19/257; class owners are 291.73/311.57/301.61/303.23/
307.68 ns versus approximately 306 ns. The two-owner class remains 2.0% slower.
[Owners](root-receivers-release-owners-2026-09-09.json).
The six member holdouts are within 0.7% of committed SQGI.
[Members](root-receivers-release-members-2026-09-09.json).
Original kernels include a remaining 1.8% dynamic-member slowdown; matrices
are unchanged. Small scalar-call improvements and floating-array variability
are recorded without using them to waive the application/method regressions.
[Kernels](root-receivers-release-kernels-2026-09-09.json).

The remaining timing rounds and fresh profiles of the corrected frozen binary
will determine the next action. No fresh PGO training, acceptance, commit or
push is justified by this development gate.

All rounds subsequently completed with matching checksums. Seed 17/200,000
repeats the call-heavy application regressions (17.8–26.2% slower) and the
small-record gain (2.201×). The large-record median gain is 1.185×, but its
candidate min-to-max range is 49.2% of median (21.9% at seed 83); those medians
do not establish a precise large-record improvement. The call-heavy candidate
ranges are only 0.6–1.5% at seed 17, so their regressions are material.
[Second application seed](root-receivers-release-applications-seed17-2026-09-09.json).
All seven floating holdouts pass, with candidate medians unchanged to 3.9%
faster than the committed ordinary baseline; those results do not waive other
regressions. [Floating samples](root-receivers-release-floats-2026-09-09.json).

Fresh diagnostic profiles of the frozen corrected executable run serially
after all timing work: all eight applications at 3,000,000 iterations, seed 83,
one warmup; then all six method components at 1,200,000 iterations/one warmup.
Both use CPU 4, cycles:u, 499 Hz and 8,192-byte DWARF call chains. Captures
are `/tmp/sqgi-root-receivers-{applications,methods}-profile.{data,log}`.
These will identify the next reusable optimization; the new semantic guard
must not simply be removed to recover benchmark scores.

Both profiles completed without lost samples. Applications capture 2,782
samples / approximately 12.592 billion cycles; methods capture 5,122 samples /
23.235 billion cycles. Application self shares include SQVM::Execute 14.24%,
ContainsMember<false> 12.30%, SQTable::Get 12.09%, array_get_object 5.81%,
member_store_slot 3.89%, member_closure_guard 2.70% and root_fallback_safe
2.35%. The root safety helper has 6.98% inclusive samples in captured call
chains; these are not a wall-time attribution or evidence that all table
lookups come from that helper.

Method self shares are SQVM::Execute 39.28%, member_store_slot 11.36%, the
reference-store helper 6.33%, RecordMember 5.86%, Append 3.36%, member getter
3.17%, Index 2.64%, journal destructor 2.40%, SQTable::Get 2.25%, and array
member getter 1.66%. Journal allocation is gone, but repeated member resolution
and per-write bookkeeping remain significant; the surrounding VM also matters.

Root-helper annotation confirms a full value-returning SQTable::Get call and
temporary SQObjectPtr lifetime merely to check whether a default member exists.
An existing raw-slot presence query can avoid that temporary without dropping
shadow checks; this is the next small general candidate to measure, not yet
implemented. More aggressive guard hoisting would require a proof that native
helpers cannot mutate default delegates or release owners into callbacks.
Those invariants must not be inferred just from a benchmark's current inputs.
Annotations: `/tmp/sqgi-root-receivers-{root,record}-annotate.log`.

A short, non-timing trace of the same frozen executable also confirms that
the method driver's main loop is rejected at ip 105 for unsupported internal
branch shape, while transfer compiles and executes natively. The whole driver
also encounters unsupported object SET during setup. Thus the 39% VM share
is not evidence that the transfer body itself failed to compile; branch/loop
coverage is a separate broader opportunity. Trace:
`/tmp/sqgi-root-receivers-methods-trace.log` (31 iterations/one warmup).
No build, sanitizer, timing or profiler process remains running at this handoff.
