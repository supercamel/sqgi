# Native logical stack ownership, 2026-09-09

Follow-up: [compact value journals](compact-values-2026-09-09.md) separate
stack snapshots and lifetime pins from heap-store entries. That experiment
remains unaccepted; this report describes its preceding implementation.

Status: **uncommitted, unaccepted; no fresh PGO/LTO or parity claim**.
This continues the [heap release-effects investigation](release-effects-2026-09-09.md).
The canonical-stack prototype fixes the reproduced AArch64 stack release-order
failures and restores native reference exchange, but introduces substantial
runtime overhead. Scalar elision recovers part of that overhead. The implementation
does not yet cover all native paths; the remaining gaps below block acceptance.

## Ownership mechanism

Native whole-function AArch64 code stages ordinary bytecode destination writes
through the shared journal. `BeginStackWrite` snapshots the destination and
holds its old value before a boxed helper can materialize into that VM slot.
`FinishStackWrite` restores the staged value before applying assignment semantics
or the interpreter's GET swap through the active VM's `temp_reg`. The pending
reference is counted as a journal pin, not as program ownership. A final drop
with potentially observable destruction still exits to interpreter replay.

This gives ordinary native reference locals actual owners in the corresponding
VM slots. A MOVE cannot remain a borrowed alias of an input that is later
overwritten. GET preserves the interpreter's delayed temporary release: its next
read captures the old value before releasing the temporary, and a subsequent
read observes the release hook. DLOAD, DMOVE and LOADNULLS process destinations
sequentially. Existing raw native callers without an active VM use a journal-local
temporary instead.

Repeated stack snapshots are indexed by address, preserving the original undo
value while retaining distinct later displaced owners. Scalar-only repetitions
need one snapshot, not one entry per write. Unit checks cover aliasing, boxed
helper materialization, exact heap/stack/temporary rollback and reference counts.

Scalar-replacement bytecode has compiler-private synthetic registers, not original
VM stack coordinates. It is excluded from this publication mechanism. Publishing
those synthetic slots broke object-plan coverage in an initial experiment;
the exclusion restores that coverage but is not proof of complete scalarized
lifetime semantics.

## Profile-directed scalar elision

The eager prototype's kernel profile sampled 3,601 events, none lost, approximately
16.40 billion user cycles. Self shares were 19.66% RecordStackSlot, 15.21%
FinishStackWrite, 11.19% CanRelease and 6.77% BeginStackWrite. Data and flat report:
`/tmp/sqgi-logical-slots-eager-kernels-v2.data` and
`/tmp/sqgi-logical-slots-eager-kernels-flat.log`.

The first revision skips scalar assignment publication when the physical VM
destination is non-owning. A runtime tag check establishes this on first use;
subsequent private scalar writes reuse a conservative basic-block-local proof.
Calls, unmodelled writes and block leaders clear the proof. Reference writes
remain checked. Arithmetic computes only in private native storage before this
decision, without publishing to the VM or invoking callbacks.

Five alternating kernel pairs against the eager prototype, five warmups, CPU 4,
160,000 base iterations (3.2 million for scaled kernels), matching checksums:

| Kernel | Eager ns | Scalar-assignment elision ns | Speedup |
| --- | ---: | ---: | ---: |
| numeric_loop | 520.29 | 22.74 | 22.877x |
| array_append | 504.99 | 131.13 | 3.851x |
| array_write | 384.33 | 86.11 | 4.463x |
| array_read | 173.30 | 60.24 | 2.877x |
| math_intrinsic | 973.05 | 208.66 | 4.663x |
| dynamic_member | 2402.44 | 2312.70 | 1.039x |

These recover regressions introduced by the eager prototype, **not gains over
the committed baseline**. [All 15 kernels and raw samples](logical-slots-scalar-kernels-ablation-2026-09-09.json)
are preserved; this paired runner uses the baseline's first result as reference,
not an independent interpreter run. Release has JIT ON, PGO OFF and LTO OFF.

A fresh profile of that frozen scalar-assignment revision used all 15 kernels,
400,000 base iterations, one warmup, CPU 4, cycles:u at 499 Hz and DWARF/8192
call stacks. It captured 3,176 samples, none lost, approximately 14.33 billion
cycles. Self shares: SQVM::Execute 12.98%, RecordStackSlot 7.93%, FinishStackWrite
5.16%, Index 3.38%, finish helper 2.16%, CanRelease 2.14%, RetainValue 1.94%.
Capture: `/tmp/sqgi-logical-slots-scalar-kernels.data`; report:
`/tmp/sqgi-logical-slots-scalar-kernels-flat.log`.

The next revision extends elision to guarded scalar GETs. It checks **both**
the actual destination and the active VM temporary for reference ownership.
Only if both are non-owning can their stale scalar bits be left untouched;
the new result remains in private native storage. Every typed GET still runs
its ordinary read/type guards. Boxed GET helpers stage before materialization;
typed private results stage after the read when needed. Raw native invocations
without an active VM keep the checked fallback. No workload identifiers, input
sizes, sampled-value exceptions or relaxed release guards are introduced.

## Validation

The scalar-assignment revision plus the added literal/arithmetic/branch cases
passes 97/98 selected AArch64 Release CTests and 98/99 strict ASan/UBSan CTests.
The single failure is the `assign_refs` native-frame coverage assertion for
sole-owner array replacement. There are no sanitizer reports. The package test
is excluded from both suites; ordinary Release also excludes its existing
root-owned install artifact. The assertion is not disabled or counted as a pass.
Logs: `/tmp/sqgi-logical-slots-scalar-v2-tests.log` and
`/tmp/sqgi-logical-slots-scalar-asan-tests.log`.

The GET-elision revision adds float-member and scalar-array GET release tests,
bringing the AArch64 ordering matrix to 27 cases: nine operations across direct
userdata, arrays containing userdata and tables containing userdata. Controls
run through the interpreter; warmups assert native whole-function execution.
Release remains 97/98, with all ordering cases passing and only the same
`assign_refs` coverage failure. Log:
`/tmp/sqgi-logical-slots-get-elision-tests.log`.

That exact GET-elision revision also passes 98/99 strict ASan/UBSan CTests,
with only the same native-coverage assertion and no sanitizer reports. All
41 application/member/method/owner/float/root holdout components pass under
ASan/UBSan in both JIT modes at 20,003 iterations, one warmup and seed 83.
Row counts are checked, script/sanitizer errors rejected, and JIT-on/off
checksums agree within 1e-10 relative tolerance. These are validation, not
performance measurements. Full suite log:
`/tmp/sqgi-logical-slots-get-elision-asan-tests.log`; individual logs:
`/tmp/sqgi-logical-slots-get-elision-asan-SUITE-jit{0,1}.log`.

The shared journal/memory tests pass in the cross-compiled x64/QEMU check.
Before the two extra GET cases, member-plan still has 21 stack-order failures
and seven native-route failures: x64 does not yet call the logical-stack API.
Five of those route failures were independently shown to remain with the heap
release barrier disabled; they are not all caused by the ownership work.
Log: `/tmp/sqgi-logical-slots-scalar-x64-tests.log`.

Rebuilding the final 27-case source for x64 confirms the six added GET cases
also fail ordering there; the same seven native-route failures remain.
Write-log and memory tests still pass (2/3 selected tests overall).
Log: `/tmp/sqgi-logical-slots-get-elision-x64-tests.log`.

## Frozen build provenance

All are GCC 13.3 ordinary Release, int64/double, native AArch64 JIT ON,
PGO OFF, LTO OFF, ASan OFF. SQGI statically includes its engine code.

| Revision | Executable directory under /tmp | Executable SHA-256 |
| --- | --- | --- |
| Eager logical slots | sqgi-logical-slots-eager-20260909.Nxkwbs | 3aede9e4b2ca4eeeb49a798e5bd6737cd084a7793c69545a860deead97455e35 |
| Scalar assignments | sqgi-logical-slots-scalar-20260909.eENNcW | c857b407ed7fbffd45f77cde110cc86b51b5a02dc1199e8926e8181f09c38868 |
| Scalar GET elision | sqgi-logical-slots-get-elision-20260909.f4bB6z | 97517a191cde9d02dc4187bf5efaf01ff64ecde3d322e5bd6fecc1a84a090270 |

Source deltas from `953b5b4`, excluding untracked reports:

- `/tmp/sqgi-logical-slots-eager-source.patch`:
  `04ab4e2786807e6ad8ff133596d43b696c2c1aca3ae78275ef595e1ab6d22a22`.
- `/tmp/sqgi-logical-slots-scalar-source.patch`:
  `c5ddd46ef4f81f618df48779b6a8a91792568604c2429ffc9f75d6e40cedf8de`.
  This snapshot predates the extra literal/arithmetic/branch test cases.
- `/tmp/sqgi-logical-slots-get-elision-source.patch`:
  `10ea3113f7989b5dc203777189cd87c5f58e03dcf1984a4f417bd6d6d669313d`.

## GET-elision performance assessment

Five alternating pairs per suite, five warmups, CPU 4, fresh processes,
ondemand governor. No build, sanitizer or profiler runs overlapped timings;
unrelated workstation activity was not controlled. Checksums match in every
paired run. PGO/LTO are OFF for both sides. Small changes should not be read
as established wins; raw samples are retained without exclusions.

Against the scalar-assignment predecessor, scalar GET elision does **not**
recover the array or dynamic-member regressions. Numeric loops are unchanged;
array read is 60.23 -> 61.09 ns, array write 86.24 -> 86.69 ns, and dynamic
member 2282.34 -> 2272.12 ns. Intrinsic math improves 209.03 -> 202.79 ns
(1.031x), but that isolated change does not establish broad effectiveness.
The candidate array-read range is 61.05-61.33 ns, and array append ranges
114.04-146.41 ns. [All GET-elision ablation samples](logical-slots-get-elision-kernels-ablation-2026-09-09.json).

The separate comparison against the committed `953b5b4` ordinary Release
baseline establishes the remaining cost of the complete experimental series:

| Kernel | Committed ns | Candidate ns | Candidate / committed time |
| --- | ---: | ---: | ---: |
| direct_call | 42.15 | 34.01 | 0.807x |
| numeric_loop | 22.71 | 22.75 | 1.002x |
| dynamic_member | 722.28 | 2281.21 | 3.158x |
| array_append | 79.94 | 132.48 | 1.657x |
| array_write | 33.52 | 86.39 | 2.577x |
| array_read | 9.32 | 61.15 | 6.565x |
| math_intrinsic | 228.85 | 202.66 | 0.886x |
| matrix | 301.94 | 317.39 | 1.051x |

[All committed-baseline kernel samples](logical-slots-get-elision-kernels-baseline-2026-09-09.json).
The older baseline does not satisfy the new release-order tests; these are
performance cost comparisons, not evidence that its semantics are sufficient.

Independent applications, seed 83 and 400,003 iterations:

| Component | Committed ns | Candidate ns | Candidate / committed time |
| --- | ---: | ---: | ---: |
| route_balanced | 52.91 | 51.64 | 0.976x |
| route_skewed | 49.01 | 51.05 | 1.042x |
| pricing_events | 54.69 | 57.54 | 1.052x |
| filter_stream | 50.51 | 55.01 | 1.089x |
| records_64 | 287.85 | 128.67 | 0.447x |
| records_4096 | 346.27 | 290.70 | 0.840x |
| word_count | 262.76 | 262.71 | 1.000x |
| graph_walk | 10.97 | 16.25 | 1.482x |

The 4,096-record candidate ranges 230.40-304.54 ns, so its median improvement
needs further confirmation. The graph regression is not such a noisy case:
its candidate range is 16.247-16.290 ns. Record gains do not offset the
regressions in routing, pricing, filtering or graphs. [All application samples](logical-slots-get-elision-applications-baseline-2026-09-09.json).

Five rotating method-holdout rounds at 200,000 iterations compare three SQGI
builds and Node, with five warmups and an independent JIT-off checksum reference.
All six checksums match throughout. Medians in ns:

| Method workload | Committed | Scalar assignments | GET elision | Node |
| --- | ---: | ---: | ---: | ---: |
| transfer_table | 420.17 | 1848.99 | 1878.58 | 17.93 |
| transfer_class | 435.01 | 1909.55 | 1910.63 | 18.12 |
| transfer_mixed | 481.79 | 1915.64 | 1932.42 | 29.12 |
| publish_table | 359.93 | 1498.54 | 1507.54 | 13.38 |
| publish_class | 366.49 | 1535.29 | 1550.26 | 13.79 |
| publish_mixed | 395.27 | 1534.53 | 1547.80 | 20.87 |

GET elision does not recover the 3.92-4.47x cost versus the committed baseline.
Its medians are 0.1-1.6% slower than the scalar-assignment predecessor in these
cases; ranges and every sample are in the [method holdout results](logical-slots-get-elision-methods-2026-09-09.json).
The complete candidate fails the broad performance gate. The extra GET fast
path has not demonstrated broad benefit and is not accepted on the strength
of one math median or its diagnostic example below.

## Why the scalar GET fast path misses major workloads

A separate debugger diagnostic compares identical integer-array reduction
bodies, one constructing its array locally and one receiving it as a parameter.
Each performs 12 calls with eight reads. All results equal the expected 52.
Breakpoints count actual runtime helper entries, not compiler intentions:

| Input provenance | Boxed array reads | Scalar elision checks | Checked GET finishes |
| --- | ---: | ---: | ---: |
| Locally constructed array | 96 | 0 | 96 |
| Parameter array | 0 | 96 | 0 |

Source inspection agrees: `emit_new_array` marks a fresh array without an
observed element type; its unknown-result GET uses the boxed helper. Parameter
observations can select a guarded scalar read. This demonstrates why merely
making already-typed GETs cheaper does not reach the locally constructed-array
case. It is a path diagnostic, not a benchmark or justification for assuming
all unknown array values are integers. A general fix must derive types from
construction/consumer constraints or handle boxed values efficiently, retaining
guards for changed tags, weakrefs and alias mutation.

Diagnostic files: `/tmp/sqgi-logical-get-diagnostic.nut`,
`/tmp/sqgi-logical-get-diagnostic.gdb`, and
`/tmp/sqgi-logical-get-diagnostic-v2.log`. They use the frozen GET-elision binary.

A fresh profile of that same binary runs all six method holdouts, 400,000
iterations, one warmup, CPU 4, cycles:u at 499 Hz with DWARF/8192 call stacks.
It captures 6,224 samples, none lost, approximately 28.37 billion cycles.
Self shares:

| Symbol | Self share |
| --- | ---: |
| SQVM::Execute | 10.54% |
| SQJitWriteLog::Index | 8.92% |
| SQJitWriteLog::RecordStackSlot | 7.92% |
| SQJitWriteLog::FinishStackWrite | 6.47% |
| SQJitWriteLog::Grow | 5.62% |
| SQJitWriteLog::IndexPin | 4.72% |
| SQJitWriteLog::RetainValue | 4.70% |
| SQJitWriteLog::ReleaseEntry | 4.09% |
| SQJitWriteLog::Append | 3.79% |
| SQJitWriteLog::CanRelease | 3.75% |
| SQJitWriteLog destructor | 3.03% |

This points to the mixed journal's indexing, entry growth, ownership tracking
and cleanup as general overhead worth redesigning, not just the scalar GET
helper. VM stack snapshots currently consume full member-sized entries, with
unused target/key fields, and share the growth/indexing machinery. Any compact
stack-journal design must preserve ordered rollback relative to heap entries,
all pins during nested calls, allocation-failure behavior and native frame
limits. Merely raising inline capacity can trade allocator cost for larger
frames and reduced compilation coverage; that needs its own evidence.

Profile: `/tmp/sqgi-logical-slots-get-elision-methods.data`; flat report:
`/tmp/sqgi-logical-slots-get-elision-methods-flat.log`. Profiling/debugging ran
after all timings and did not overlap build or sanitizer jobs.

## Remaining acceptance gaps

The stack mechanism covers selected ordinary AArch64 whole-function writes,
not loop-region lowering, x64, all call/preparation/constructor writes, inlined
synthetic frames or scalarized input/temporary lifetimes. Nested native commits
followed by parent rollback require a further replay/ownership audit. The
conservative final-release check still rejects sole-owner graph replacement.
Those gaps cannot be fixed by treating journal pins as program ownership or
committing a prefix and then replaying the original function's effects twice.

The current candidate fails the broad regression assessment and needs a
revised ownership/storage design, complete semantic coverage, and only then
fresh trained PGO/LTO confirmation. Neither
the large eager-to-elided speedups nor sanitizer silence establishes parity
or acceptance. Nothing from this experimental series has been committed/pushed.
