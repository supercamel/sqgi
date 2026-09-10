# Native call frame bounds and tail admission, 2026-09-09

Status: **development candidate, not accepted**. Continues the ownership-history
diagnosis in [inline ownership checks](inline-ownership-checks-2026-09-09.md)
after the [snapshot-cache rejection](stack-snapshot-hints-2026-09-09.md).
Native AArch64 Release, JIT ON, PGO/LTO OFF. Existing correctness/coverage
debt still prevents acceptance, a fresh optimized-build claim, or a push.
The nine-suite performance gate also fails: root updates, transfer methods
and word counting regress. Fixes remain WIP for revision, not a promoted
performance baseline. Reinstating the reference leak is not a valid remedy.

Follow-up: [private-result publication](private-result-publication-2026-09-09.md)
removes redundant staging, improving method and owner workloads, but its
floating-call/vector regressions and the existing correctness gates still
prevent acceptance. That report contains the newer development measurements.

## Evidence and changes

The preceding owner profiles place roughly 14–15% of self cycles in stack
snapshot lookup and 9–10% in release eligibility. Identical calls can alternate
between whole-function execution and release-guard/loop fallback, changing
elapsed time by about fourfold. This iteration investigates the VM owners
behind that history dependence; it does not weaken the final-release guard.

A fresh-VM regression reproduces references stranded outside the live VM
stack after a larger native callee returns through a smaller caller. With
8/16/24 reference locals, the preceding engine retains the array in slots
10–17 / 10–25 / 10–33 after the root frame has returned (`_top == 0`).
The interpreter controls pass. The test clears the legitimate `temp_reg`
owner explicitly and inspects a weak reference, isolating the leaked owners.
Diagnostic: `/tmp/sqgi-native-frame-boundary-test.log`.

Frameless VM dispatch and AArch64 nested native calls now check two bounds:
allocated storage for all accessed slots, and live VM storage for slots that
can receive reference owners. Failure returns to ordinary frame establishment
and interpreter/native-frame dispatch before entering the unsafe edge. No
frame is resized inside a transaction. Raw C++ callers retain their separate
buffer contract and the three-argument native ABI.

The native artifact records the two extents. AArch64 records actual physical
reference publications/materializations; x64 scalar locals, borrowed pointers
and inlined leaf arguments stay private, while materialized array creation
records its VM destination. CPP scalar/accessor/setter stubs publish no local
VM owners. Scalarized entries propagate their lowered storage bound rather
than assuming the original prototype's register extent. Ordinary frame entry
checks allocated storage too. Unknown metadata remains conservative. The
write-log frame is unchanged at 1,000 bytes; there is no snapshot cache.

The cleanup fixture initially showed that tail-only callees never became hot:
the VM's tail-call path established a frame but skipped JIT admission. It now
performs the same entry notification/execution attempt after `StartCall`,
retaining the existing tail-frame extent and return handling.

That new coverage exposed an equality-lowering defect on **both** AArch64 and
x64: materializing the right operand clobbered the scratch register already
holding the left. Whole-function and loop equality/inequality lowering now
materialize both operands before loading the comparison registers. Existing
inlined scalar-leaf lowering already ordered them correctly. Asymmetric,
negative, equal/unequal, literal and tail-call cases exercise the fix.

Early method heating also changed compilation selection: `factory` received
a materialized native entry, with zero successes and seven frame guard
failures, instead of the existing pure scalar-replacement plan. Proven object
elimination/inlining now precedes materialized machine-code compilation
(after small CPP specializations). This is a general optimization ordering,
not a named-workload rule. Failed object plans still fall through to normal
backend compilation with transient retry information retained. The existing
lookup-invalidation assertions pass unchanged. New checks explicitly warm
constructors/methods before their caller and require real scalarized native
success. Populated caller buffers verify synthetic registers do not overwrite
unrelated reference owners, including exact final reference counts.

## Provenance and validation

GCC 13.3 Release, int64/double, native AArch64 JIT, no sanitizers/PGO/LTO:
`/tmp/sqgi-native-frame-bounds-release-20260909.zvjNQg/sqgi`, SHA-256
`16ba9d31f73ddce9eafc8e68b5a617536b5acef0b8810a4db666109020877cc7`.
CMakeCache is alongside. Complete tracked delta from `953b5b4`:
`/tmp/sqgi-native-frame-bounds-source.patch`, SHA-256
`22aa8e653bc8fd3d26f2d9a4d792a544f578f625c33acb7435801179cc01b91d`.
The patch excludes untracked reports and benchmark ports.

Matched predecessor:
`/tmp/sqgi-inline-ownership-release-20260909.Qy4E0e/sqgi`, SHA-256
`a2fbea5e35971269185b7a324648e72a06617c644c4ace5cdbb559cc152eba13`.
Its build flags match. It fails the new reference-cleanup regression, so its
times are diagnostic comparisons, not a correctness-qualified acceptance bar.

- Selected Release: **97/98**. Excludes sqgipkg and the pre-existing root-owned
  sqgicheck_install artifact; neither exclusion is counted as a pass.
- Strict-alignment ASan/UBSan: **98/99**, excluding only sqgipkg. Leak and
  stack-use-after-return detection enabled, no sanitizer reports. Both AArch64
  suites retain only the known `assign_refs` native-store coverage failure.
- Expanded x64/QEMU: **4/5**. Write-log, memory, scalar-leaf and object-plan
  targets pass. Member-plan retains the existing 27 stack-release-order and
  seven native-route assertions. The newly exposed comparison error is fixed;
  the leaf target then passes without weakening its tests.

Logs: `/tmp/sqgi-native-frame-bounds-final-{release,asan}-tests.log` and
`/tmp/sqgi-native-frame-bounds-equality-x64-tests.log`. The earlier three-target
x64 subset alone was insufficient to discover the scalar comparison error.

All **41** independent application/member/method/owner/float/root components
also match strict-ASan JIT off/on at 20,003 iterations, one warmup, seed 83.
Names, row counts, iteration counts and exact integer checksums are checked;
float checksums use relative/absolute tolerance 1e-10. Script/sanitizer errors
are rejected. Log: `/tmp/sqgi-native-frame-bounds-asan-holdouts.log`.

All validation jobs reached terminal status before timing started, followed
by a process check for remaining build/test/profile jobs. These development
timings are not a substitute for the missing correctness gates or fresh
JIT/PGO/LTO confirmation.

## Completed rotating comparisons

Nine suites cover 56 distinct components, plus a second application seed and
second owner warmup count. Five rounds, fresh processes, CPU 4, JIT threshold
1, int64/double. Application/kernel/root runs rotate both SQGI binaries,
Node 18.19.1, GJS 1.80.2 module mode and Python 3.13.2. Member/method/owner/
float runs rotate both SQGI binaries and Node. All use an independent JIT-off
checksum reference; every checksum matches.

The batch spans 23:30:05–23:42:17 UTC on September 8 (09:30–09:42 September 9
Sydney). No build, test or profiler ran alongside timing. CPU 4 uses ondemand
with a 2.304 GHz maximum; raw host snapshots are retained. The workstation
was not exclusively controlled. No samples are discarded.

### Applications and cross-runtime gaps

Seed 83, 400,003 iterations, five warmups; median ns/iteration:

| Component | Previous SQGI | Candidate SQGI | Node | GJS | Python |
| --- | ---: | ---: | ---: | ---: | ---: |
| route_balanced | 51.87 | 51.89 | 5.96 | 6.40 | 261.34 |
| route_skewed | 51.09 | 51.29 | 5.76 | 6.65 | 258.72 |
| pricing_events | 57.24 | 57.27 | 11.09 | 17.31 | 432.50 |
| filter_stream | 55.37 | 54.97 | 5.02 | 8.66 | 240.04 |
| records_64 | 134.91 | 135.09 | 15.44 | 38.56 | 569.95 |
| records_4096 | 227.01 | 231.22 | 19.75 | 42.74 | 619.30 |
| word_count | 262.91 | 266.18 | 74.25 | 123.31 | 366.55 |
| graph_walk | 12.35 | 12.34 | 4.77 | 6.95 | 128.74 |

This is roughly 2.6–11.7 times Node's time, not parity. The large-record
median regresses 1.9%, with overlapping ranges (previous 220.06–298.56,
candidate 226.21–232.87 ns). Seed 17 at 200,000 iterations gives 235.36 →
236.93 ns (+0.7%); small records give 134.22 → 132.32 ns (-1.4%). There is
no repeated broad record gain.

Word counting regresses on both seeds: 262.91 → 266.18 ns (+1.2%) and
262.54 → 266.98 ns (+1.7%). Ranges do not overlap for either seed; for seed
17 they are 261.74–263.00 versus 266.47–267.28 ns. Remaining application
changes are below 0.8% in each seed.
[Seed 83](native-frame-bounds-release-applications-seed83-2026-09-09.json),
[seed 17](native-frame-bounds-release-applications-seed17-2026-09-09.json).

### Owner history: the fast fallback disappears

200,000 iterations. These settings are separate comparisons, not a selectable
best result. Median ns/iteration:

| Case | Previous, 5 warmups | Candidate, 5 | Previous, 4 warmups | Candidate, 4 |
| --- | ---: | ---: | ---: | ---: |
| table_owners_1 | 208.83 | 994.23 | 1010.56 | 1016.52 |
| table_owners_2 | 928.34 | 944.47 | 931.65 | 965.91 |
| table_owners_5 | 211.18 | 955.32 | 957.45 | 997.66 |
| table_owners_19 | 941.65 | 943.05 | 954.50 | 952.27 |
| table_owners_257 | 228.28 | 972.21 | 976.04 | 970.84 |
| class_owners_1 | 1119.59 | 1123.12 | 1121.35 | 1128.38 |
| class_owners_2 | 326.52 | 1058.79 | 1057.09 | 1060.46 |
| class_owners_5 | 1028.84 | 1045.77 | 1062.34 | 1075.66 |
| class_owners_19 | 315.17 | 1065.09 | 1065.08 | 1073.63 |
| class_owners_257 | 1088.39 | 1087.64 | 1079.14 | 1084.18 |

Cases that previously selected release-guard/loop fallback now take 3.2–4.8
times longer. The candidate instead has similar medians at both warmup
counts, with no fourfold swing. At four warmups the two binaries mostly take
similar time, but table_owners_2/5 regress 3.7%/4.2% (overlapping ranges).
The candidate is still approximately 107–133 times Node's time in the
five-warmup run. Removing the faulty history dependence exposes the cost of
the whole-function journal; it is not a speedup.
[Five warmups](native-frame-bounds-release-owners-2026-09-09.json),
[four warmups](native-frame-bounds-release-owners-warmups4-2026-09-09.json).

### Other holdouts and kernels

All use 200,000 iterations/five warmups, except original kernels at the
160,000 base count (3.2 million for scaled cases).

- Root integer updates: **329.25 → 345.11 ns (+4.8%)**, ranges
  328.96–331.37 versus 344.11–347.82. Ordinary receiver updates and transformed
  root results stay within 0.2%; root reference publication improves 2.4%
  with overlapping ranges. Root integer updates take 52 times Node's time.
  [Root workloads](native-frame-bounds-release-roots-2026-09-09.json).
- Transfer methods: table 1281.12 → 1310.96 ns (+2.3%), class 1355.82 →
  1385.05 (+2.2%), mixed 1351.33 → 1389.59 (+2.8%). All three ranges are
  non-overlapping. Publication methods vary from 0.9% faster to 0.7% slower.
  The six methods take about 46–76 times Node's time.
  [Methods](native-frame-bounds-release-methods-2026-09-09.json).
- Members: class events improve 1.4%, calibration cases 2.3–2.6%; buffer
  cases regress 0.8–0.9%, with non-overlapping ranges. Table events improve
  0.4%. [Members](native-frame-bounds-release-members-2026-09-09.json).
- All seven float medians remain within 0.8%; no general float speedup.
  [Floats](native-frame-bounds-release-floats-2026-09-09.json).
- Original kernels: vector 381.08 → 375.36 ns (-1.5%), dynamic member
  1650.00 → 1623.51 (-1.6%), object-valued member write 468.41 → 472.96
  (+1.0%, non-overlapping ranges). Other medians stay within 0.7%.
  SQGI beats Node/GJS on the vector kernel, but the dynamic-member kernel
  takes 14.9 times Node's time and is also slower than Python. This contrast
  must not be hidden by selecting only the favorable application table.
  [All 15 kernels](native-frame-bounds-release-kernels-2026-09-09.json).

The batch driver reached terminal status; log:
`/tmp/sqgi-native-frame-bounds-timings.log`.

## Post-timing profiles and next revision

Profiles run only after all timing jobs finish, CPU 4, cycles:u at 499 Hz,
DWARF 8,192-byte stacks. The matched root-suite profiles use four million
iterations and one warmup, collect roughly 3,000 samples each, none lost:
15.063 billion previous cycles versus 15.633 billion candidate cycles.
VM Execute accounts for 21.61% / 21.43% self; direct dispatch 3.76% / 4.53%.
The candidate's frame-bounds function itself is 0.58%. Dispatch annotation
also shows the metadata loads/checks on the hot entry path. This is evidence
of additional admission work, **not** an isolated explanation of the complete
root or word-count regression; compilation selection and code-layout effects
still need ablation.

The candidate owner profile at 400,000 iterations/four warmups collects
roughly 12,000 samples, none lost, 56.414 billion cycles. Self shares:

| Journal operation | Self cycles |
| --- | ---: |
| RecordStackSlot | 17.56% |
| FinishStackWrite | 16.05% |
| RetainValue | 12.78% |
| CanRelease | 9.36% |
| CountPins | 7.36% |
| RecordMember | 3.54% |

The first five alone account for 63.1%. This profile includes warmup calls;
older profiles containing alternating loop/whole-function execution are not
matched per-route cycle measurements.

A final paired trace repeats the identical width-1 class call ten times:
the previous engine alternates approximately 0.21 / 1.00 us with final-array
release guards on even calls; the candidate's warmed calls stay 0.989–0.997
us with no alternating release guards. All 20 checksums are 59,820,412.
This confirms that cleanup/admission fixed the route history, while the
whole-function journal remains the dominant performance problem.

Artifacts: `/tmp/sqgi-native-frame-bounds-{previous-roots,candidate-roots,candidate-owners}.data`,
corresponding `-flat.log` files, `/tmp/sqgi-native-frame-bounds-direct-annotate.log`,
and `/tmp/sqgi-native-frame-bounds-profiles.log` (including both call traces).
All profile and trace handles are terminal.

The next revision must reduce repeated owner/snapshot bookkeeping through
general compiler lifetime/alias proofs or safe side exits, not by restoring
the invalid fast route. Redundant admission checks for already-established
frames are another measured opportunity. Neither change is implemented or
claimed here. Earlier object-plan analysis may also increase compilation
cost; the warmed suites do not establish cold-start performance.

## Remaining architectural work

The new bounds prevent reference publication beyond live VM cleanup storage;
they do not implement native side exits, fix all constructor/CALL temporary
transitions, or make nested child commit followed by parent rollback safe.
The x64/loop logical-stack semantics and the AArch64 final-owner store coverage
gap remain open. No owner-route speedup will be claimed by weakening a release
guard or choosing a warmup count that selects an incompletely modeled route.
