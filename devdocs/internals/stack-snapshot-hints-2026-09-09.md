# Stable stack-snapshot lookup hints, 2026-09-09

Status: **rejected**. The cache runtime changes were removed after measurement;
the expanded snapshot tests and configurable-warmup runner are retained.
The frozen candidate and raw results below remain available. Continues
[inline ownership checks](inline-ownership-checks-2026-09-09.md). Ordinary
AArch64 Release, JIT ON, PGO/LTO OFF; no new PGO/LTO claim.
The subsequent [native-frame bounds investigation](native-frame-bounds-2026-09-09.md)
reproduces and fixes leaked callee locals, removes the alternating owner
route, and records fresh cross-runtime results and remaining regressions.

## Evidence and mechanism

The preceding owner profile, recorded after our validation and timing jobs,
assigns 14.83% of self cycles to RecordStackSlot, 13.01% to FinishStackWrite,
10.16% to RetainValue,
9.21% to CanRelease and 7.78% to CountPins. Stable stack addresses are hashed
or linearly searched again on each logical bytecode destination publication.

The rejected candidate's journal keeps eight direct-mapped, one-based 32-bit indices
into its compact value-entry stream. This is a fixed 32-byte, non-owning
lookup hint, independent of benchmark names, owner counts and receiver types.
The address of any stable SQObjectPtr cell selects the hint; equality with
the saved entry's actual address is always checked. No raw entry pointer is
cached across allocation/growth. The stream is append-only, with at most
65,536 total entries, so every nonzero index stays in bounds. Comparing that
one-based index with the current epoch also rejects empty and stale hints.

A miss uses the existing checked lookup/append path. Failed allocations
publish no hint. A hit still compares the current slot tag and value against
the saved snapshot and retains a newly displaced owner through the existing
RetainValue API. It never caches CanRelease, refcounts or owner eligibility.
Mixed rollback order, pin census, callbacks and structural epochs are
unchanged. The private journal frame grows from 1,000 to 1,032 bytes on this
build; the three-argument native ABI and VM object layouts are unchanged.

New tests visit 41 stable addresses in a permuted order, exercise immediate
hits and conflicts, alternate scalar/reference writes, force repeated stream
growth, and revisit every address across three structural epochs. Exact
journal sizes, refcounts and interleaved commit/rollback outcomes are checked.
Another test fails index allocation, checks that an existing hint remains
usable without allocation, and safely retries the missed address. Existing
allocation-failure, poisoned-frame, nested-log and cleanup-reentry tests are
retained.

## Benchmark call history

The preceding diagnostic shows repeated identical owner calls alternating
between whole-function execution and a release-guard failure followed by
native-loop execution. The guard observes a final array owner left in VM
state. Five warmups plus the checksum/reference and measured calls can select
different paths in adjacent cases. This is not fixed by the lookup hint.
The loop backend's incomplete logical-stack semantics remain a separate
correctness problem; its shorter time is not an acceptance target obtained by
removing the whole-function guard.

The member benchmark runner now accepts non-negative `--warmups`, defaulting
to the previous five. It forwards the same count to both SQGI and Node and
records it in metadata. Paired four- and five-warmup runs can expose this
history dependence without changing the workloads or discarding slow cases.
Timing results from those settings must be reported separately.

## Frozen provenance and validation

GCC 13.3 Release, int64/double, native AArch64 JIT ON, PGO/LTO/ASan OFF.
Executable `/tmp/sqgi-stack-snapshot-hints-release-20260909.eTpXFu/sqgi`,
SHA-256 `8ae82bd4ecda744cfed052f24f442ec208d0052dcf32efa92d68b80c92d2c6c8`.
CMakeCache is alongside. Full tracked delta from committed 953b5b4:
`/tmp/sqgi-stack-snapshot-hints-source.patch`, SHA-256
`e37a402d12e80db22398dd7b511264bca40c536911868cef637da47a9d49d5d3`.
The patch includes runner changes but excludes untracked reports.

Immediate predecessor `/tmp/sqgi-inline-ownership-release-20260909.Qy4E0e/sqgi`,
SHA-256 `a2fbea5e35971269185b7a324648e72a06617c644c4ace5cdbb559cc152eba13`.
Neither executable contains PGO or LTO. GDB confirms the new private journal
size is 1,032 bytes on the corresponding ASan build.

The final source snapshot passes 97/98 selected Release tests and 98/99
strict-alignment ASan/UBSan tests, with the same assign_refs native-coverage
assertion failing and no sanitizer reports. ASan leak and stack-use-after-return
detection are enabled. Release excludes sqgipkg and the pre-existing root-owned
sqgicheck_install artifact; ASan excludes only sqgipkg. Exclusions are not
counted as passes. The focused x64/QEMU suite remains 2/3: write-log and
memory pass, and member-plan retains 27 stack-order and seven route failures.
No new failure is accepted as an optimization tradeoff.

All 41 independent application/member/method/owner/float/root components also
match between strict-ASan JIT off/on at 20,003 iterations, one warmup and seed
83, checking row names/counts, iteration counts, exact integer checksums and
floating checksums at relative/absolute tolerance 1e-10. Script and sanitizer
errors are rejected. Logs: `/tmp/sqgi-stack-snapshot-hints-{release,asan,x64}-tests.log`
and `/tmp/sqgi-stack-snapshot-hints-asan-holdouts.log`.

All validation handles reached terminal status before timing began, and a
process check showed no build, CTest, SQGI or perf job still running. Eight
five-round comparisons now cover owners at both four/five warmups, members,
methods, floats, kernels and application seeds 83/17. Host snapshots are
retained; this does not establish exclusive workstation access.

## Owner timing: warmup history matters

Five rotating rounds at 200,000 iterations, independent JIT-off checksum
reference, CPU 4. Every checksum matches. Median ns per iteration:

| Case | Previous, 5 warmups | Hint, 5 warmups | Previous, 4 warmups | Hint, 4 warmups |
| --- | ---: | ---: | ---: | ---: |
| table_owners_1 | 208.53 | 213.91 | 1010.06 | 970.22 |
| table_owners_2 | 949.71 | 896.05 | 961.24 | 912.38 |
| table_owners_5 | 208.84 | 215.34 | 966.59 | 940.27 |
| table_owners_19 | 958.76 | 917.60 | 968.11 | 921.77 |
| table_owners_257 | 227.92 | 225.63 | 980.16 | 947.44 |
| class_owners_1 | 1129.38 | 1089.17 | 1131.71 | 1089.90 |
| class_owners_2 | 327.12 | 330.10 | 1059.34 | 1019.95 |
| class_owners_5 | 1067.47 | 1039.39 | 1083.23 | 1040.23 |
| class_owners_19 | 316.51 | 316.95 | 1067.20 | 1033.74 |
| class_owners_257 | 1078.84 | 1064.63 | 1079.73 | 1069.80 |

At four warmups all ten components take 0.9-5.1% less time. At five warmups,
the costly cases improve 1.3-5.6%, but table_owners_1 and table_owners_5 take
2.6% and 3.1% more time. The first case has non-overlapping ranges:
207.20-208.94 versus 213.61-214.19 ns. This regression cannot be called noise
or cancelled by gains on the slower route. Class_owners_2 is also 0.9% slower,
with non-overlapping ranges. The hint remains unaccepted.

Changing only the warmup count moves some cases by a factor of roughly four,
in both binaries. Accordingly, the fixed-five-warmup table is not a stable
description of owner-working-set scaling, and no speedup is claimed by
comparing different warmup settings.
[Five warmups](stack-snapshot-hints-release-owners-2026-09-09.json),
[four warmups](stack-snapshot-hints-release-owners-warmups4-2026-09-09.json).

## Other completed suites

All comparisons use the same two frozen binaries, five rounds, CPU 4 and five
warmups. The entire eight-suite batch spans 22:50:21-22:57:32 UTC (08:50-08:57
Sydney). Endpoint CPU snapshots show ondemand at 2.304 GHz. No build, test or
profile jobs ran during the batch; unrelated workstation access was not
exclusively controlled. Every checksum matches.

All six method components improve, but remain far from Node (ns/iteration):

| Method | Previous | Hint | Node |
| --- | ---: | ---: | ---: |
| transfer_table | 1264.90 | 1204.95 | 17.71 |
| transfer_class | 1344.83 | 1287.98 | 17.62 |
| transfer_mixed | 1344.66 | 1286.84 | 29.15 |
| publish_table | 934.46 | 920.87 | 13.43 |
| publish_class | 987.12 | 953.30 | 13.75 |
| publish_mixed | 984.50 | 959.74 | 20.90 |

That is 1.5-4.7% less time, still approximately 44-73 times Node's time.
The six member components are within 0.4%. Floating holdouts range from
1.2% faster to 1.4% slower; pressure_8 regresses 151.10 -> 153.17 ns and
retained_input 44.50 -> 44.95 ns. These are not claimed as general float gains.
[Methods](stack-snapshot-hints-release-methods-2026-09-09.json),
[members](stack-snapshot-hints-release-members-2026-09-09.json),
[floats](stack-snapshot-hints-release-floats-2026-09-09.json).

The 15 original kernels use the 160,000 base count (3.2 million for scaled
cases). Vector improves 381.84 -> 370.82 ns, dynamic_member 1632.77 ->
1596.71 ns, append 130.22 -> 124.96 ns, and intrinsic math 205.68 ->
200.74 ns. These represent 2.2-4.0% less time. Float calls regress
20.346 -> 20.674 ns (1.6%); their ranges overlap, but that median is still
reported. Integer reads are 7.464 -> 7.408 ns and float-array reads
7.143 -> 7.098 ns. Other kernel medians remain within 0.9%.
[Kernel samples](stack-snapshot-hints-release-kernels-2026-09-09.json).

The eight application holdouts at 400,003 iterations are mostly unchanged.
Record updates at 4,096 records improve 234.57 -> 232.46 ns on seed 83 and
228.62 -> 222.97 ns on seed 17 (0.9%/2.5% less time). Small-record updates
are flat / 0.4% slower. Graph walking is 0.9% faster / 0.6% slower. Remaining
medians range from 1.2% faster to 1.0% slower. There is no broad application
gain comparable to the preceding iteration's graph improvement.
[Seed 83](stack-snapshot-hints-release-applications-seed83-2026-09-09.json),
[seed 17](stack-snapshot-hints-release-applications-seed17-2026-09-09.json).

## Matched profiles and rejection

After the batch reached terminal status, matched cycles:u profiles at 499 Hz
with DWARF call graphs run the unchanged owner suite at 400,000 iterations,
four warmups, CPU 4. Both collect roughly 7,000 samples with none lost, and
all ten checksums agree. Approximate total cycles are 36.159 billion previous
and 35.337 billion candidate. Self-cycle shares:

| Function | Previous | Hint |
| --- | ---: | ---: |
| RecordStackSlot | 14.05% | 9.86% |
| FinishStackWrite | 13.03% | 13.15% |
| RetainValue | 10.39% | 11.11% |
| CanRelease | 9.60% | 9.62% |
| CountPins | 6.97% | 6.99% |
| RecordMember | 5.60% | 6.36% |

This supports reduced snapshot-lookup cost, not elimination of the overall
journal bottleneck. Shares are relative to each run and the profiles include
warmup calls on both whole-function and loop routes; they are not isolated
per-route cycle measurements. Artifacts:
`/tmp/sqgi-stack-snapshot-hints-{previous,candidate}-owners.data` and
`/tmp/sqgi-stack-snapshot-hints-profiles.log`.

Despite the lookup and method gains, the non-overlapping 2.6% table-owner
regression at five warmups fails the no-material-regression gate. The runtime
cache was therefore removed, not stacked onto the next candidate. The rebuilt
Release SQGI executable is byte-identical to the preserved inline-ownership
predecessor (SHA-256 a2fbea5e35971269185b7a324648e72a06617c644c4ace5cdbb559cc152eba13).
The 32-byte frame increase is a possible contributor, not a demonstrated
cause; code-layout effects are also not isolated by this experiment.

The permuted-address/epoch/growth/refcount/rollback and allocation-recovery
tests remain, generalized to the existing snapshot index. No cache-specific
zero-allocation-on-hit requirement is imposed after removal. Next work must
separate the lookup benefit from frame/code-layout changes and address the
ownership-aware whole-function/loop execution mismatch. Simply selecting the
fast loop route or weakening final-release checks would not meet the goal.
No commit, push, fresh PGO/LTO claim or parity claim follows from this attempt.

The restored engine-only tracked diff exactly matches the preceding frozen
inline-ownership patch (engine-diff SHA-256
`d3fe3b1b07806ae0ef44191c7bf88170251f564bae5563bc5bdc782c901ae74a`).
The complete restored source patch, including the retained tests and runner
option, is `/tmp/sqgi-stack-snapshot-restored-source.patch`, SHA-256
`b4a8650d881825d1b7fe829a5360ec1598823ebdce4b455e2f5ebf207b4da94f`.
This is distinct from the rejected candidate's patch and executable above.

After removal, the final retained test source passes 97/98 selected Release
tests and 98/99 strict-ASan/UBSan tests, again only the known assign_refs
native-coverage assertion failing. Focused x64/QEMU remains 2/3 with the same
34 member-plan failures. All 41 independent components were rerun with the
restored ASan runtime at JIT off/on and match, with no sanitizer reports.
Restoration logs: `/tmp/sqgi-stack-snapshot-restored-{release,asan}-final-tests.log`,
`/tmp/sqgi-stack-snapshot-restored-x64-tests.log`, and
`/tmp/sqgi-stack-snapshot-restored-asan-holdouts.log`. All build, test, timing
and profile handles have reached terminal status. The broader goal remains
unfinished; existing native semantic/coverage and performance gaps remain.
