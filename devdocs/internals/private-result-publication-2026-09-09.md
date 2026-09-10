# Private-result publication, 2026-09-09

Status: **development candidate, not accepted**. Continues the
[native-frame bounds investigation](native-frame-bounds-2026-09-09.md).
Release, native AArch64 JIT ON, PGO/LTO OFF. Existing correctness/coverage
failures remain acceptance blockers; no new optimized-build result is claimed.
The performance gate also fails: the repeated kernel comparison confirms
floating-call and vector regressions. The implementation remains WIP for
revision, not a promoted baseline, despite its object-heavy improvements.

## Profile and reusable mechanism

The preceding correctness-fixed engine's owner profile places 17.56% of
self cycles in `RecordStackSlot`, 16.05% in `FinishStackWrite`, 12.78% in
`RetainValue`, 9.36% in `CanRelease`, and 7.36% in `CountPins`: 63.11% total.
`BeginStackWrite` adds 2.40%, and its generated-call helper another 0.99%.
Capture: `/tmp/sqgi-native-frame-bounds-candidate-owners.data` and
`/tmp/sqgi-native-frame-bounds-candidate-owners-flat.log`; 12K cycle samples,
zero lost, approximately 56.414 billion sampled event cycles.

The emitter already distinguishes operations whose result is computed in
private native storage from helpers that overwrite the physical VM slot.
For private results, the old path first snapshots/stages the old owner and
then immediately restores that same owner before publishing the result.
This iteration fuses those two calls into `PublishStackWrite`: snapshot the
unchanged destination, preserve the replacement across aliases, check the
same final-release condition, and perform the same assignment or GET swap.
It removes redundant pending-value retain/restore/release operations and
one generated helper call, not the rollback snapshot or release barrier.

Applicable sites are private arithmetic/literal/MOVE results and typed GETs
already classified as not physically writing the destination. Boxed GETs,
multi-destination instructions, and staged writes retain Begin/Finish.
Scalar ownership guards, actual VM `temp_reg` checks, canonical-slot bounds,
synthetic-register exclusions and post-MOVE alias materialization are
unchanged. The three-argument native ABI and 1,000-byte journal layout are
unchanged. No benchmark matching, identity cache, or cached release decision
is introduced.

## Provenance and validation

Frozen candidate: `/tmp/sqgi-private-publication-release-20260909.9BzzAQ/sqgi`,
SHA-256 `8be77bfed7e19e42e6dbece793d5cd79a47b98b903eeee27c38f66b162858394`.
CMakeCache is alongside. Full tracked WIP delta from `953b5b4`:
`/tmp/sqgi-private-publication-source.patch`, SHA-256
`fa0a8ca07aeb401834c2a77a21f5ce4fa67d241e85ef2bfe30bdfe2e9f413c64`.
The patch excludes untracked reports and benchmark ports.

Matched predecessor: `/tmp/sqgi-native-frame-bounds-release-20260909.zvjNQg/sqgi`,
SHA-256 `16ba9d31f73ddce9eafc8e68b5a617536b5acef0b8810a4db666109020877cc7`.
Both are GCC 13.3 Release, int64/double, native AArch64 JIT, no PGO/LTO or
sanitizers. The older leaking inline-ownership engine is not the comparison
target: restoring its unsafe fast route would not be a valid speedup.

The logical-stack tests now exercise both staged and fused APIs, including
mixed boxed publication, real VM temporary ownership, final-owner rejection,
exact rollback and bounded repeated scalar snapshots. Additional tests cover
all destination/temporary/external-source aliases for assignment and GET,
commit and rollback, exact reference counts, weakly observed self-assignment,
null destinations, a pending staged write, temporary snapshot capacity
failure, and failed index allocation followed by a successful retry.

- Selected Release: **97/98**, only the existing `assign_refs` AArch64
  native-store coverage assertion fails. Excludes sqgipkg and the existing
  root-owned installation artifact; neither exclusion counts as a pass.
  `/tmp/sqgi-private-publication-final-release-tests.log`.
- Expanded x64/QEMU: **4/5**. Write-log, memory, leaf and object-plan pass;
  member-plan retains the same 27 stack-release-order and seven native-route
  failures. `/tmp/sqgi-private-publication-x64-tests.log`.
- Strict-alignment ASan/UBSan: **98/99**, excluding only sqgipkg. Leak and
  stack-use-after-return detection enabled, no sanitizer reports; same
  `assign_refs` coverage failure. `/tmp/sqgi-private-publication-asan-tests.log`.
- All **41** independent application/member/method/owner/float/root components
  match strict-ASan JIT off/on at 20,003 iterations, one warmup, seed 83.
  Names, counts, iterations and exact integer checksums are checked; floats
  use relative/absolute tolerance 1e-10. Script/sanitizer errors are rejected.
  `/tmp/sqgi-private-publication-asan-holdouts.log`.

All validation jobs reached terminal status before timing started, followed
by a process check. All nine suites completed, covering 56 distinct components
plus a second application seed and owner warmup history. The batch ran from
2026-09-08 23:53:20 through 2026-09-09 00:06:00 UTC (09:53–10:06 Sydney).
Log: `/tmp/sqgi-private-publication-timings.log`. Supplemental regression
repeats and the initial post-change profiles also completed. PGO/LTO
confirmation remains pending.

## Completed development comparisons

Five rounds, fresh processes, CPU 4, five warmups unless otherwise stated,
JIT threshold 1. Application/kernel/root runs rotate both SQGI builds,
Node 18.19.1, GJS 1.80.2 in module mode and Python 3.13.2; member-family
runs rotate both SQGI builds and Node. All establish an independent JIT-off
checksum reference. No builds, tests or profiling run concurrently with
timing. The workstation and ondemand governor are not exclusively controlled;
all samples are retained. Positive time changes below mean slower.

### Object methods

200,000 iterations. All six components improve, and every candidate sample
is below every predecessor sample. The gain is broad across table, class and
mixed receiver representations, but not remotely performance parity yet.

| Component | Previous ns | Candidate ns | Time change | Candidate / Node time |
| --- | ---: | ---: | ---: | ---: |
| transfer_table | 1312.12 | 1208.02 | -7.93% | 68.78x |
| transfer_class | 1386.62 | 1280.19 | -7.68% | 72.18x |
| transfer_mixed | 1388.23 | 1280.58 | -7.75% | 43.99x |
| publish_table | 925.02 | 843.91 | -8.77% | 62.92x |
| publish_class | 961.05 | 879.00 | -8.54% | 64.42x |
| publish_mixed | 963.76 | 878.76 | -8.82% | 42.02x |

[Raw method samples](private-publication-release-methods-2026-09-09.json).

### Reference owners, five warmups

200,000 iterations. All ten cases improve by 10.89–14.09%, with disjoint
predecessor/candidate sample ranges in every case. The changed operation is
ordinary register publication, not an owner-count/working-set specialization.
The four-warmup replication also improves all ten cases by 11.71–14.68%,
again with disjoint ranges. The benefit is not limited to the previous
five-warmup execution history.

| Working set | Table previous ns | Table candidate ns | Class previous ns | Class candidate ns |
| --- | ---: | ---: | ---: | ---: |
| 1 | 1007.44 | 874.21 | 1120.64 | 982.21 |
| 2 | 932.32 | 814.54 | 1049.35 | 908.00 |
| 5 | 944.66 | 811.57 | 1034.63 | 922.00 |
| 19 | 946.10 | 824.80 | 1055.91 | 930.86 |
| 257 | 972.55 | 861.03 | 1087.39 | 963.10 |

[Raw owner samples](private-publication-release-owners-2026-09-09.json).
[Four-warmup replication](private-publication-release-owners-warmups4-2026-09-09.json).

### Application and root checks

Application seed 83, 400,003 iterations: routing, pricing, filtering, word
counting and graph traversal are within 0.48% of the predecessor. Small and
large record medians increase 1.77% and 1.73%, but ranges overlap widely:
132.222–137.659 vs 129.509–139.111 ns for 64 records, and 223.398–230.568 vs
217.698–239.788 ns for 4,096 records. Neither a stable record regression nor
a record gain is established by this run. Seed 17 at 200,000 iterations
does not reproduce the slowdown: record medians decrease 0.96% and 0.81%,
also with overlapping ranges; other application changes are within 0.73%.
[Application samples](private-publication-release-applications-seed83-2026-09-09.json).
[Second application seed](private-publication-release-applications-seed17-2026-09-09.json).

Latest completed cross-runtime application medians (seed 83, ns/iteration):

| Component | SQGI JIT | Node | GJS | Python |
| --- | ---: | ---: | ---: | ---: |
| route_balanced | 52.05 | 6.00 | 6.36 | 260.05 |
| route_skewed | 51.16 | 5.76 | 6.65 | 257.09 |
| pricing_events | 57.57 | 11.09 | 17.31 | 430.46 |
| filter_stream | 54.92 | 5.01 | 8.72 | 239.79 |
| records_64 | 135.51 | 15.46 | 38.54 | 566.94 |
| records_4096 | 229.01 | 19.80 | 42.52 | 621.83 |
| word_count | 265.97 | 73.83 | 122.73 | 366.54 |
| graph_walk | 12.37 | 4.77 | 6.75 | 127.78 |

These are **not PGO/LTO results**. SQGI still takes roughly 2.6–11.6 times
Node's time across these applications; the method/owner gains do not imply
application parity or a general application speedup.

Root integer updates decrease from 343.435 to 334.685 ns (-2.55%), with
disjoint ranges 342.820–345.660 and 333.515–336.110 ns. Root reference
publication decreases 1.03%, with overlapping ranges; receiver integer and
root integer-result cases are within 0.22%. This does not isolate the entire
root improvement to publication: shared code/layout also changes.
[Root samples](private-publication-release-roots-2026-09-09.json).

### Standard kernels and other holdouts

160,000 base iterations (3.2 million for the scaled call/numeric/read cases).
Dynamic members decrease 7.09%, from 1628.700 to 1513.269 ns, with disjoint
ranges 1625.206–1641.056 vs 1511.919–1513.588 ns. Math intrinsics decrease
2.17%, also with disjoint ranges. Floating calls increase 2.52%, branching
calls 1.22%, and vectors 1.11%, all with overlapping ranges; these increases
require replication rather than declaring the regression gate passed.
Other kernel medians change by less than 0.77%.
[Kernel samples](private-publication-release-kernels-2026-09-09.json).

The six member/array/calibration holdouts are within 0.64% of the predecessor,
with overlapping ranges. Float filter increases 1.18%, with slightly
overlapping ranges; other float medians are within 0.65%.
[Member samples](private-publication-release-members-2026-09-09.json),
[float samples](private-publication-release-floats-2026-09-09.json).

### Supplemental regression gate: failed

Five alternating SQGI-only kernel pairs at the same 160,000 base iterations
confirm two regressions. These repeats compare checksums against the first
baseline run; the preceding five-runtime run separately checked these same
inputs against a JIT-off reference. No sample is dropped.

| Component | Previous ns | Candidate ns | Time increase | Previous range ns | Candidate range ns |
| --- | ---: | ---: | ---: | ---: | ---: |
| float_call | 20.616 | 21.366 | 3.64% | 20.405–20.687 | 21.044–21.694 |
| vector | 370.381 | 383.412 | 3.52% | 369.300–376.506 | 376.812–385.381 |

Both repeated ranges are disjoint. Dynamic-member improvement repeats at
6.89%; math-intrinsic improvement repeats at 2.10%. The branching-call
slowdown does not repeat (-0.96%).
[Kernel replication](private-publication-release-kernels-repeat-2026-09-09.json),
log `/tmp/sqgi-private-publication-kernels-repeat.log`.

The longer float holdout replication uses 800,000 iterations, five rotating
rounds, five warmups and the same independent interpreter reference. All
seven medians are within 0.40%, with overlapping ranges. Filter is +0.09%:
the earlier filter slowdown is not reproduced.
[Longer float replication](private-publication-release-floats-repeat-2026-09-09.json),
log `/tmp/sqgi-private-publication-floats-repeat.log`.

## Post-change profiles and remaining diagnosis

After timing/repeats finished, paired owner profiles use 400,000 iterations,
four warmups, CPU 4, `cycles:u` at 499 Hz, DWARF/8192 call stacks. Both have
zero lost samples. Approximate event cycles decrease from 55.690 billion
to 49.180 billion (-11.69%), consistent with the independent timing gain.

| Owner self-cycle share | Previous | Candidate |
| --- | ---: | ---: |
| RecordStackSlot | 18.04% | 19.60% |
| RetainValue | 12.26% | 13.69% |
| CanRelease | 9.62% | 9.14% |
| CountPins | 7.32% | 7.68% |
| FinishStackWrite | 15.82% | 2.96% |
| PublishStackWrite | absent | 9.08% |
| sqjit_write_log_ensure | 3.82% | 2.59% |

Shares have different denominators: larger lookup shares do not establish
more absolute lookup work. Snapshot/retention/release accounting still
consumes 50.11% of candidate self cycles, before publication itself.
The release predicate, rollback snapshots and physical VM ownership are
unchanged; reducing this remaining cost needs its own proof and tests.
Artifacts: `/tmp/sqgi-private-publication-{previous,candidate}-owners.data`,
`-owners-run.log` and `-owners-flat.log`.

Initial paired floating-call/vector profiles first load and warm the standard
suite through `loadfile(...).acall(...)`, then call its existing functions
for 120 million / six million iterations, retaining five warmups. Diagnostic
`/tmp/sqgi-private-publication-profile-kernel.nut`, SHA-256
`7bf386cb58f1cb80cd26258c04e5ebff9f23a7c7fab24c6222119b31ff52462d`.
All 16 checksums per pair match, as do all ten owner checksums; no script
errors or lost samples. These are profiles, not additional timing rounds.

The extended float profile places 11.61%/11.80% of self cycles in the
borrowed-member helper and 6.07%/5.98% in the closure guard, with most other
samples in generated instructions. However, total event cycles are almost
identical (47.911/47.905 billion); extended float times differ only 0.66%.
Extended vector profiles likewise have almost identical total cycles
(43.962/43.968 billion) and only 0.58% different final timings. This modified
harness does **not** reproduce the complete regression and cannot dismiss
the original two five-round comparisons. Artifacts:
`/tmp/sqgi-private-publication-{previous,candidate}-{float_call,vector}.data`
and corresponding `-run.log`/`-flat.log` files.

A second diagnostic preserves the original top-level script and appends
extended calls without the `acall` wrapper:
`/tmp/sqgi-private-publication-profile-direct.nut`, SHA-256
`f56dcc6898c1b7991f5188e856c330ae23af5027f687f68f5eb581e2bf987392`.
All four captures complete, with zero lost samples and all 16 checksums per
pair matching. Extended float is 20.958 vs 21.228 ns (+1.29%), total cycles
47.628 vs 47.730 billion. Extended vector is 378.522 vs 372.379 ns (-1.62%),
total cycles 44.259 vs 43.526 billion. These also do not consistently
reproduce the shorter benchmark regressions. Artifacts:
`/tmp/sqgi-private-publication-direct-{previous,candidate}-{float,vector}.data`
and corresponding `-run.log`/`-flat.log` files.

Both builds' borrowed-member helper and closure-guard text sizes are
unchanged (948 and 240 bytes), but their addresses shift by 848 bytes. This
is evidence to investigate layout, not proof that layout causes the measured
regression; generated-code/route comparison and unprofiled replication remain
necessary. No alignment padding or workload-specific exception is introduced
to force these two cases to pass.

All jobs are terminal. Frozen source identity still matches the worktree's
tracked delta, and all nine raw result files have five complete rounds with
the expected component counts and no script errors. The next step is to
isolate the floating-call/vector regression without weakening ownership,
then obtain a fresh paired PGO/LTO comparison with holdouts excluded from
training. Existing x64 release-order and AArch64 native-coverage failures
must also be resolved before acceptance. No new PGO training, commit or push
is included in this iteration; the full parity goal remains active.
