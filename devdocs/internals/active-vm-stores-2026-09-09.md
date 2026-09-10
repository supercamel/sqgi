# Scoped VM context for native stores, 2026-09-09

Status: **rejected by a newly reproduced release-hook ordering bug**;
uncommitted and unaccepted. The expanded member-plan regression test currently
fails. The earlier full-suite passes below predate that additional coverage
and do not establish semantic correctness. Follows
[correct miss replay](store-replay-2026-09-09.md). Native JIT ON,
Release GCC 13.3, int64/double, PGO/LTO OFF. Preserved optimized
PGO binaries and training profiles are unchanged.

The [release-effect follow-up](release-effects-2026-09-09.md) adds a shared
heap-release barrier and cross-backend validation. It fixes the eight heap
ordering reproductions below, but twelve new VM-stack ordering cases still
fail and valid reference exchanges lose native coverage. No new performance
result or acceptance is claimed for that partial follow-up.

## Profile-directed mechanism

The preceding root-workload profile captured 1,667 samples, zero lost,
about 7.566 billion cycles: VM Execute 47.78% self, native-loop attempts
4.53%, current-frame attempts 3.92%, FallBackSet 3.91%, SQTable::Set 3.25%,
StartCall 3.00%. The reference and computed-return root-store loops and
methods compiled, repeatedly failed guards and backed off. The method
profile also retained 41.98% VM Execute self. Captures and traces are
`/tmp/sqgi-store-replay-{roots,methods}-{profile.data,profile.log,trace.log}`.

Root fallback needs the executing VM, not the closure's GET root. A scoped
borrowed `active_vm` in the per-shared-state JIT context is installed at
all three VM-to-native entry routes (frame, direct call and loop), with
RAII restoration on return. Nested native calls inherit the context;
re-entry on another VM sharing that state restores the previous VM. No
TLS/global root cache, retained root dependency, native ABI change or
callee-propagation metadata is required. Its entry overhead must be
measured, including on functions that do not access roots.

Eligible native SET helpers resolve existing receiver slots first. On a
miss, an implicit table receiver without a delegate or an instance without
`_set` may resolve an existing slot in `active_vm->_roottable`. Other cases
retain transactional guard failure and interpreter replay. Root selection
is fresh per miss, with existing raw-owner retention and reverse rollback.
GET lookup, default delegates and closure roots are not used for SET.

Eligibility follows the original bytecode receiver index, including before
mapping an inlined callee's registers. A folded alias of register zero
must not acquire implicit-receiver root fallback. Calling a raw artifact
without a VM scope fails root misses safely; existing receiver hits still
work. Shared-state concurrent use remains subject to the VM's existing
serialization requirements.

The C++ setter selector now declines an observed missing implicit-receiver
field that its existing-field-only stub cannot execute. The artifact is
reset before general backend compilation; the stub itself does not gain
unlogged root writes or altered ownership. Selection is based on bytecode
and observed member applicability, never benchmark/script names.

New coverage also exposed boolean member-store emitters requiring integer
slots even for known booleans. They now use the existing word-slot handling
and preserve boolean tags in assignment results. Arithmetic continues to
require numeric types. Boolean comparison expressions remain a separate
unsupported opcode route; no comparison/loop-join optimization is claimed.

## Validation and provenance

The final ordinary build passes 98/98 selected tests, including native
backend, ownership, guard and fuzz coverage. Existing exclusions remain:
sqgipkg and the previously documented root-owned Release install manifest.
Log: `/tmp/sqgi-active-vm-release-tests-v2.log`.

New tests require actual native successes for root-setting methods, root
loops and inlined calls. They cover different closure and VM roots, two
VMs sharing one compiled artifact, root rebinding and weak lifetime,
release-hook re-entry into another VM, context restoration, wrong receiver
types, boolean/float/reference stores, exact live/dead weak-owner rollback
after a late guard, safe raw invocation without context, and an explicit
receiver alias checked against the interpreter. Existing `_set` mutation
and delegated replay checks remain. Test failures during development are
preserved in the earlier numbered logs; they are not final passes.

Frozen executable:
`/tmp/sqgi-active-vm-release-20260909.M6ZeTz/sqgi`, SHA-256
`c36c16c3976d9b1a863cd8fe873cc6bc27b62091f0f6b22d0932972d2562cdcd`.
Cache is preserved alongside it. Tracked patch from `953b5b4`:
`/tmp/sqgi-active-vm-source.patch`, SHA-256
`383846685c91cf41b0e984da2fe72bde7bfed6add28dfcc925870599954c71df`.
Member-plan test SHA-256:
`a2a243721be9b550555b7fa5ae76e703e19f4f97066ae6bad3d593d805f2bbdf`.
Untracked four-case root benchmark sources retain the v2 hashes documented
in the preceding report; they are not included in the tracked patch.

Final strict-alignment ASan/UBSan validation passes 99/99 (excluding only
sqgipkg, including installation), with leak and use-after-return detection
enabled and no added suppressions. Log:
`/tmp/sqgi-active-vm-asan-tests-v2.log`; build log uses the same prefix.
All 41 sanitized holdout components pass at 20,003 iterations, one warmup,
application seed 83, with no script or sanitizer errors:
`/tmp/sqgi-active-vm-asan-{application_workloads,member_workloads,member_methods,member_owners,float_workloads,root_workloads}.log`.
These were validation runs, not performance samples.

## Initial root-store ablation

Five rotating rounds, fresh processes, five warmups, 200,000 iterations,
CPU 4, with an independent JIT-off checksum reference. No concurrent build,
sanitizer or profiler; workstation activity and ondemand frequency remain
uncontrolled. All raw samples, including outliers, are retained.

| Component | Previous 6f11ef8c ns | Scoped VM ns | Previous/current |
| --- | ---: | ---: | ---: |
| receiver_integer | 64.310 | 64.200 | 1.002x |
| root_integer | 283.845 | 265.385 | 1.070x |
| root_reference | 285.910 | 81.185 | 3.522x |
| root_integer_result | 292.700 | 64.635 | 4.528x |

Candidate ranges relative to median are 1.1%, 4.1%, 8.8%, and 0.5%
respectively. Receiver-only time is effectively unchanged; reference and
computed-return root gains are much larger than the ranges. The integer
case remains expensive: its caller shares one compiled loop across
different receiver classes, unlike the separate reference/transformed
callers. A follow-up trace/profile is needed before attributing its
remaining cost to a particular compiler mechanism.
[Ablation samples](active-vm-release-roots-ablation-2026-09-09.json).

## First regression gate

Five rotating rounds of the six method holdouts at 200,000 iterations,
including a JIT-off reference and Node, reproduce an additional 2.0-2.8%
regression relative to the previous candidate:

| Component | Committed ns | Previous ns | Scoped VM ns |
| --- | ---: | ---: | ---: |
| transfer_table | 420.335 | 426.100 | 438.035 |
| transfer_class | 434.050 | 493.810 | 504.470 |
| transfer_mixed | 481.605 | 484.975 | 497.495 |
| publish_table | 359.810 | 413.580 | 421.705 |
| publish_class | 365.520 | 445.690 | 455.800 |
| publish_mixed | 394.980 | 439.890 | 449.385 |

This candidate is rejected pending revision; the root gains do not offset
method regressions. [Method samples](active-vm-release-methods-2026-09-09.json).
Ordinary-call measurement and profiling are needed to distinguish entry
context cost from the changed normal-hit store helper path.

Applications at seed 83 / 400,003 iterations retain a 2.221x small-record
gain versus committed Release (288.170 to 129.744 ns). Large records are
345.382 to 237.948 ns but the candidate range is 27.4% of median. Balanced
routing improves 2.4%; skewed routing, pricing and filtering take 3.4%,
4.3% and 8.6% longer. Word counting and graph traversal are effectively
unchanged. [Cross-runtime application samples](active-vm-release-applications-2026-09-09.json).

The original 15-kernel ablation against the previous candidate shows direct
calls unchanged (34.259 to 34.210 ns), branch calls 1.8% faster, but float
calls 4.2% slower (20.530 to 21.386 ns). Vectors, dynamic members and matrices
take 1.9%, 1.6% and 2.3% longer. Append is noisy and is not a stable regression
claim without its raw range. [Kernel ablation](active-vm-release-kernels-ablation-2026-09-09.json).
These results do not exonerate unconditional VM-entry overhead, but also do
not support assigning the entire member slowdown to it.

## Follow-up profile and normal-hit revision

After timing, CPU-4 cycles:u profiles at 499 Hz / DWARF 8,192 bytes,
1,200,000 iterations and one warmup captured:

- Methods: 5,027 samples, zero lost, approximately 22.821 billion cycles.
  Execute is 40.06% self; the now-out-of-line slot resolver 7.90%, reference
  store helper 7.43%, RecordMember 6.58%, array-member getter 4.74%, Append
  3.91%, direct native-call entry 3.04%.
- Roots: 875 samples, zero lost, approximately 3.905 billion cycles.
  Execute is 23.15% self, resolver 10.76%, direct native-call entry 5.73%,
  borrowed member guard 5.67%, RecordMember 5.00%, native-loop attempts 4.09%.

Captures/reports: `/tmp/sqgi-active-vm-{methods,roots}-{profile.data,profile.log,report.log}`.
The new short root trace (`/tmp/sqgi-active-vm-roots-trace.log`) confirms
reference/transformed loops execute natively without their former backoff.
The shared counter loop compiles for the first receiver class, then backs
off when invoked with the other class. Bounded polymorphic loop versions
or more general call dispatch are architectural follow-ups, not benchmark
name-based exceptions. Neither is implemented in this revision.

The large standalone resolver also executes on normal member hits. The
next revision separates root-miss ownership/checks into a non-inlined helper
and leaves ordinary raw-slot lookup inline, preserving all semantics and
context selection. This targets the measured normal-hit call/frame overhead;
the old resolver's sample share cannot simply be counted as eliminated work.
The root-context candidate above remains frozen. The split-helper revision
passed the then-existing 98 Release / 99 ASan/UBSan selected tests, but was
not timed before the additional ordering checks below rejected it.

Split-helper executable:
`/tmp/sqgi-active-vm-cold-release-20260909.p9p3X8/sqgi`, SHA-256
`7172f6ec333ae31a88adb1482d0b5112246fa0cdec17d4a497b1fa689fcb68b1`.
Tracked patch before the ordering tests:
`/tmp/sqgi-active-vm-cold-source.patch`, SHA-256
`e0bf61762b75b72e9585a4e7e41cddefa005b4d1b210bc00b7bb934b85e285cc`.
Logs: `/tmp/sqgi-active-vm-cold-{release-build,release-tests,asan-build,asan-tests}.log`.

## Correctness rejection: release effects are not just lifetime safety

The previous release-hook checks established lifetime, exactly-once release,
rehash safety and VM-context restoration, but did not check whether a hook
runs before a following observable read. New `root_release_order` tests
expose the gap. After warming a native method equivalent to
`root_value=value; return root_value+1`, the old root value is replaced by an
object whose release hook changes that same root slot to 99. Calling with
value 5 returns **100 in the interpreter, but 6 natively**; both release the
old object exactly once. A delayed callback is still a language-semantic
failure, even when ownership and sanitizer checks pass.

The mismatch reproduces for all four owner shapes:

- a directly stored userdata with a release hook;
- an array containing that userdata;
- a table containing that userdata;
- two root slots sharing the userdata, both overwritten before the read.

The last case has multiple references before the first write; the journal's
extra owner references then conceal the interpreter's final release at the
second write. A simple original-refcount-equals-one guard is insufficient.
Checking only direct userdata/instance hooks also misses transitive release
through containers. The same four shapes also fail when accessed as ordinary
explicit members of a table argument, with no root fallback in the bytecode.
Both Release and strict ASan/UBSan reproduce all eight ordering mismatches;
sanitizers report no memory errors. This confirms a shared journal-effect
issue, not just root selection. No claim is made about untested earlier
frozen binaries.

Release reproduction: `/tmp/sqgi-active-vm-release-order-test-v2.log`.
The expanded source patch is `/tmp/sqgi-active-vm-release-order-source.patch`,
SHA-256 `4f6525cfb330ef3afc85aaa19ec76720abd9d50454e25e04c96c67b244045767`.
Test source SHA-256:
`7d8a8cc75c15ea4fab61a9b294bbc809350234a93533d4b4ff3ff6cfad648f8c`.
The runtime remains the frozen split-helper binary above; only regression
tests changed after its freeze. Final root-plus-member reproductions are
`/tmp/sqgi-active-vm-release-order-test-v3.log` and
`/tmp/sqgi-active-vm-release-order-asan-test-v2.log`.
The final expanded patch is `/tmp/sqgi-active-vm-release-order-source-v2.patch`,
SHA-256 `4b94fbc70a8ee6506120c135932076f93123408c12c669549bbe4b7aba86b7f3`;
test SHA-256 `f6df969eac5ae781aef52a0e93e16b5b4de82480a4b5a7f8f022749eeb56ef9f`.

Further timing/PGO work is paused while revising this mechanism. The next
step is callback-effect-aware native store eligibility or precise side exits
at observable release boundaries, including transitive/aliased ownership.
Simply dropping owner pins can invalidate native borrows; committing prior
writes and then replaying the original region can duplicate side effects.
Any solution must preserve both lifetime and ordering across member, array,
stack and nested native-call paths. It must be a general mechanism rather
than excluding a particular hook, script or benchmark.

The remaining broad timing gates and final performance assessment are not
complete, and benchmark checksum success must not be used to excuse this
semantic failure.
No fresh PGO training, commit or push has occurred. The full parity goal
remains active; this is not an acceptance or completion claim.
