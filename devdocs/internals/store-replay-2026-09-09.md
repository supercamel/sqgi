# Existing-slot stores and correct miss replay, 2026-09-09

Status: development candidate, uncommitted and unaccepted. Continues
[borrowed member guards](borrowed-guards-2026-09-09.md). Release/native JIT
ON, PGO/LTO OFF; preserved optimized binaries/profiles remain unchanged.

## Profile and initially attempted optimization

The preceding frozen candidate's six-method profile captures 5,105 samples,
zero lost, about 23.216 billion cycles: member_store_slot 10.94% self,
reference-store helper 7.83%, journal RecordMember 5.37%, Append 4.12%.
The slot helper's normal-hit path pays for a 144-byte frame, stack-canary
work and many saved registers needed by its value-producing miss fallback.
See `/tmp/sqgi-borrowed-guards-{methods-profile.data,store-annotate.log,reference-store-annotate.log}`.

An initial noinline separation of the miss path built and passed the three
focused member/leaf/journal tests. It was frozen for diagnosis, not accepted:
`/tmp/sqgi-store-fallback-outlined-release-20260909.IMtjDB/sqgi`, SHA-256
`a62e234dc0689e098228315e87f3dd62c953e3faab2353e6aa671d7810093c07`.
Tracked patch `/tmp/sqgi-store-fallback-outlined-source.patch`, SHA-256
`23d77975cc14c1d2a70fac398f021d5ebf5d15d9baac7582329055fc04bcae68`.

## Read fallback is not write fallback

Targeted mutation checks exposed two pre-existing correctness defects in
that miss path, also reproduced with committed `953b5b4` ordinary Release:

- Install an instance `_set` after warming a method that writes a missing
  field/global: the interpreter invokes `_set` and leaves the root unchanged;
  native code instead changes the root and never invokes `_set`.
- Give a method a different closure root before warming: the interpreter's
  SET fallback writes the active VM root; native code writes the closure's
  root, which is only appropriate for GET fallback.

Reproducer `/tmp/sqgi-store-fallback-instance.nut`; interpreter output is
`setter:7:1` and `roots:37:101`, versus native `setter:29:0` and `roots:7:37`.
Logs `/tmp/sqgi-store-fallback-instance-{interpreter,outlined,committed}.log`
preserve the failures. The earlier `.call()`-based probe did not exercise
native entry for the relevant calls; its passing output was not accepted
as native coverage. The method-call reproducer confirms native compilation
and execution in its trace.

The current implementation keeps existing writable-slot resolution and its
ownership unchanged. A miss now returns guard failure, rolls back any
earlier native writes and replays through the interpreter. It no longer
reuses the read-target helper; the obsolete helper and temporary fallback
object are removed. No native ABI, receiver/value ownership, old-owner
retention or log rollback order is changed. The current three-argument
native ABI does not expose the active VM/root, so a correct native root
store fallback needs additional guarded execution-context support. This
loss of root-miss native coverage is explicit, not a parity/acceptance claim.

## Validation and additional holdouts

New C++ interpreter/native tests cover existing-field native execution,
deletion followed by delegated `_set`, exact replay of an earlier increment,
root fallback after removing the delegate, newly installed instance `_set`,
a different closure root, and reference-valued root assignment identity.
They require native guard failures at the cold path as well as native
successes for existing fields; a never-compiled function cannot satisfy them.

Release passes 98/98 selected tests; strict-alignment ASan/UBSan passes
99/99. The same documented exclusions apply: sqgipkg in both builds and
the root-owned Release install-manifest failure only in Release. Sanitizers
retain leak and use-after-return checks, with no new suppressions.
Logs `/tmp/sqgi-store-replay-{release-build,focused-tests,release-tests,asan-build,asan-tests}.log`.
All 40 sanitized holdout components pass (the existing 37 plus three new
root components), with no script/ASan/UBSan errors in
`/tmp/sqgi-store-replay-asan-*.log`. The later four-case root suite also passes
sanitizers (`/tmp/sqgi-store-replay-asan-roots-v2.log`), for 41 unique sanitized
holdouts. All 56 final timing components have completed five rounds, including
root ablation and a second application seed. The combined candidate is still
rejected by regressions.

Frozen executable:
`/tmp/sqgi-store-replay-release-20260909.i4Egpe/sqgi`, SHA-256
`6f11ef8c7eafbc747538225d43111dadc62f0c92289e423551552acc811cd93f`.
Tracked patch from `953b5b4`: `/tmp/sqgi-store-replay-source.patch`, SHA-256
`e79b8922cf0f926520942b813ce0e4b1d43700377a31ea569c54f368e955b5c2`.
GCC 13.3 Release, JIT ON, int64/double, PGO/LTO OFF; cache preserved beside
the binary. New untracked benchmark sources are not included in the tracked
patch; their SHA-256 identities are:

- SQGI: `bbb5ff1defcb6b4b3fbd0850513ad067ca51881a95870eacded11a0fb694022d`.
- Node/GJS: `13f3f394f7b8cf79f0d6a9a150dfebef2a372b9906f5d0934361173d1178e751`.
- Python: `85d55b7fd01b41e194e8af6067274df79fc0e604fe8482435125736840dd4328`.

Three new PGO-excluded holdouts in `test/bench_root_workloads.nut` compare
receiver-field integer writes, shared-root integer writes and shared-root
reference publication from methods. All final receiver/root state contributes
to the checksums. Matching Node/GJS and pure-Python ports exercise each
language's own mutable shared-binding semantics (not a promise of identical
lookup implementations or dynamic-language guarantees). The cross-runtime
runner now accepts `--suite roots`; it retains interpreter reference checks,
rotating fresh processes, raw samples, variance and build/profile provenance.
Five-runtime smoke checks (SQGI interpreter/JIT, Node, GJS module, Python)
agree at 20,003 iterations. Their timings overlapped sanitizer validation
and are not performance evidence. No benchmark or script name is inspected
by the compiler; the new cases make potential root-miss regressions visible.

## Ordinary Release timing gates

Five rotating rounds, five warmups, fresh processes on CPU 4, with no
concurrent builds, sanitizers or profilers. Checksums match across compared
binaries; the member/root runners also establish a JIT-off reference. The
workstation and ondemand frequency governor are uncontrolled, and no samples
are removed. Committed baseline is ordinary `953b5b4` (`192855dd...`), not
its optimized PGO/LTO build. The previous candidate is `39e7be6b...`.

### Methods, 200,000 iterations

| Component | Committed ns | Previous ns | Replay ns | Extra time vs committed |
| --- | ---: | ---: | ---: | ---: |
| transfer_table | 419.390 | 438.645 | 424.520 | 1.2% |
| transfer_class | 433.530 | 515.205 | 493.525 | 13.8% |
| transfer_mixed | 479.930 | 502.420 | 483.595 | 0.8% |
| publish_table | 358.880 | 424.200 | 412.610 | 15.0% |
| publish_class | 364.350 | 472.635 | 444.810 | 22.1% |
| publish_mixed | 394.030 | 461.335 | 438.615 | 11.3% |

The normal-hit simplification improves these medians 1.028-1.063x against
the preceding candidate, but does not eliminate the material regressions.
Candidate sample ranges are just 0.15-0.66% of median, much smaller than
the regressions against committed Release.
[Method samples](store-replay-release-methods-2026-09-09.json).

### New shared-root holdouts, 200,000 iterations

JIT ON, PGO/LTO OFF; Node 18.19.1, GJS 1.80.2 module mode, Python 3.13.2:

| Component | Committed ns | Replay ns | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: |
| receiver_integer | 73.415 | 64.350 | 4.487 | 6.015 | 229.325 |
| root_integer | 282.440 | 284.310 | 6.665 | 18.740 | 248.050 |
| root_reference | 245.640 | 284.275 | 7.210 | 15.880 | 195.724 |

Receiver-field writes improve 1.141x. Root integer time increases 0.7%, and
root reference publication regresses **15.7%** (candidate sample range only
0.4% of median). SQGI takes 14-43x Node's and 11-18x GJS's time on these
cases; root cases are also slower than Python. This new gate explicitly
prevents accepting normal-field gains while ignoring shared-state costs.
The old baseline is semantically correct on these unshadowed, same-root
inputs; the separate rebinding/different-root tests expose its bugs.
[Root samples and full provenance](store-replay-release-roots-2026-09-09.json).

### Applications, seed 83 / 400,003 iterations

| Component | Committed ns | Replay ns | Baseline/candidate |
| --- | ---: | ---: | ---: |
| route_balanced | 53.087 | 51.377 | 1.033x |
| route_skewed | 50.412 | 51.372 | 0.981x |
| pricing_events | 54.787 | 56.650 | 0.967x |
| filter_stream | 51.722 | 54.592 | 0.947x |
| records_64 | 287.598 | 122.012 | 2.357x |
| records_4096 | 339.427 | 240.116 | 1.414x |
| word_count | 262.526 | 261.686 | 1.003x |
| graph_walk | 10.962 | 10.957 | 1.000x |

Small-record updates continue to improve; remaining call-heavy application
regressions and method/root failures still block promotion. Large-record
timings have varied substantially across iterations; raw samples must be
consulted before treating the exact 1.414x median as stable.
[Application samples](store-replay-release-applications-2026-09-09.json).
The small/large-record candidate ranges are 5.5% / 27.1% of median. Other
application candidate ranges are 0.4-1.2%.

### Original kernels

Five rounds at 160,000 base iterations, retaining original scale factors:

| Kernel | Committed ns | Replay ns | Baseline/candidate |
| --- | ---: | ---: | ---: |
| direct_call | 42.251 | 34.275 | 1.233x |
| branch_call | 39.336 | 31.853 | 1.235x |
| float_call | 28.048 | 20.504 | 1.368x |
| numeric_loop | 22.706 | 22.693 | 1.001x |
| vector | 377.163 | 373.013 | 1.011x |
| dynamic_member | 722.375 | 699.181 | 1.033x |
| dynamic_key_get_set | 183.069 | 183.456 | 0.998x |
| object_member_write_fallback | 468.881 | 468.344 | 1.001x |
| array_append | 82.119 | 79.469 | 1.033x |
| array_write | 33.425 | 33.375 | 1.001x |
| array_read | 9.218 | 9.224 | 0.999x |
| array_float | 6.673 | 6.756 | 0.988x |
| math_intrinsic | 233.394 | 193.875 | 1.204x |
| math_variable | 254.850 | 211.863 | 1.203x |
| matrix | 302.175 | 302.262 | 1.000x |

Earlier call/math gains remain. Dynamic-member candidate spread is 0.2% of
median versus a 3.3% speedup. Append's median improves, but its candidate
range is 34.1% of median; this is not a stable append speedup claim. Array
float is 1.2% slower with a 4.6% range. All samples, including these outliers,
remain in [kernel results](store-replay-release-kernels-2026-09-09.json).

### Remaining independent holdouts

Five rounds, five warmups, 200,000 iterations, Node 18.19.1 and JIT-off
checksum reference. For table-owner widths 1/2/5/19/257, committed medians
around 298 ns become 153.66/173.11/167.84/165.98/174.14 ns. Class medians
around 305-306 ns become 271.73/289.89/291.82/289.90/298.12 ns. All are
faster, but these are combined-candidate gains, not an isolated attribution
to the store-helper edit. [Owner samples](store-replay-release-owners-2026-09-09.json).

Six event/buffer/calibration medians are unchanged to 0.6% faster.
[Member samples](store-replay-release-members-2026-09-09.json).

Seven floating holdouts retain their prior improvements: filter 30.46 to
23.20 ns, channels_4 105.92 to 78.10, pressure_8 212.43 to 153.39,
integration 43.73 to 37.28, retained_input 57.54 to 43.91, branching 37.66
to 31.43, and helper_control 64.69 to 55.50. These are approximately
1.17-1.39x speedups, not a new floating arithmetic transformation.
[Floating samples](store-replay-release-floats-2026-09-09.json).

## Confirmation and expanded root coverage

Seed 17/200,000 repeats the 64-record gain: 287.965 to 122.070 ns (2.359x).
Large records are 332.080 to 245.060 ns (1.355x), but the candidate range
is 44.9% of median, so no exact stable large-record gain is claimed. Balanced
routing is 3.2% faster; skewed routing, pricing and filtering still take
5.0%, 4.2% and 6.6% longer than committed Release. Word counting and graph
traversal remain essentially unchanged.
[Second-seed samples](store-replay-release-applications-seed17-2026-09-09.json).

The initial three root cases were also compared directly to the preceding
borrowed-guard candidate: receiver/root integer medians are within 0.2%,
and root-reference publication improves from 302.465 to 284.905 ns (1.062x).
Thus the 15.7% root-reference regression against committed Release is an
accumulated regression, not evidence that this correctness fix created it.
[Initial root ablation](store-replay-release-roots-ablation-2026-09-09.json).

The final root suite adds `root_integer_result`, a method which updates
shared state and computes a returned value. A trivial setter returning its
argument is handled by the existing C++ setter specialization; a computed
return exercises a different compilation path and must also be represented.
The original three cases are unchanged. Their v1 sources and runner are
preserved at `/tmp/sqgi-store-replay-release-20260909.i4Egpe/roots-v1/` so
the earlier result hashes remain reproducible. Final four-case medians:

| Component | Committed ns | Replay ns | Node ns | GJS ns | Python ns |
| --- | ---: | ---: | ---: | ---: | ---: |
| receiver_integer | 73.455 | 64.405 | 4.467 | 5.940 | 228.880 |
| root_integer | 282.830 | 283.420 | 6.660 | 18.450 | 247.873 |
| root_reference | 245.360 | 284.985 | 7.181 | 15.835 | 196.010 |
| root_integer_result | 336.890 | 292.460 | 5.775 | 6.095 | 271.443 |

The computed-return case improves 1.152x against committed Release and
1.098x against the preceding candidate (321.510 to 292.925 ns in the
separate ablation). The final root-reference case still regresses 16.1%
versus committed Release, while improving 1.057x against the preceding
candidate. These do not resolve the poor shared-root performance: the
computed-return case is still approximately 51x Node's and 48x GJS's time.
[Final root samples](store-replay-release-roots-v2-2026-09-09.json),
[final root ablation](store-replay-release-roots-v2-ablation-2026-09-09.json).

The runtime binary is unchanged (`6f11ef8c...`). Final tracked source patch
(runner expects four root cases): `/tmp/sqgi-store-replay-source-v2.patch`,
SHA-256 `359552e27a79cd3ff22add1bf5d9b55695df1272c05f3cb81cd2573f5c24d6c1`.
Final root source hashes:

- SQGI: `acf647eee37be91950b8e9e25a57b1363dfd2fe4a360e8d37a52e12220ec3641`.
- Node/GJS: `c8d2101987c2bd15a2c687c07106f58fcbb4bd99781d75e06f7b69af68706b3a`.
- Python: `eba93fc356b255e71d1b0f4af36c5a4d5ebf02089f9812564315ed88ded4fc01`.

## Follow-up profiles and next architectural target

After all timings, serial profiles used CPU 4, cycles:u at 499 Hz,
8,192-byte DWARF stacks, 1,200,000 iterations and one warmup. Both retain
all samples with none lost. Captures:
`/tmp/sqgi-store-replay-{methods,roots}-profile.{data,log}`.

Methods: 4,894 samples, about 22.279 billion cycles. Self shares are VM
Execute 41.98%, reference-store helper 13.50% (now includes inlined slot
resolution), journal RecordMember 5.83%, table_get_array_ptr 4.09%, Append
3.97%, try_execute_closure 3.24%, journal destruction 2.39%, SQTable::Get
2.38%, Index 2.31%. The removed slot-helper sample share must not simply
be counted as eliminated work; some work moved into the caller. The fresh
method trace still shows the outer loop rejected at internal branch 105,
whole-frame setup rejected at SET 87, and transfer executing natively.

Root holdouts: 1,667 samples, about 7.566 billion cycles. VM Execute is
47.78% self; native-loop attempts 4.53%, current-frame attempts 3.92%,
FallBackSet 3.91%, SQTable::Set 3.25%, StartCall 3.00%, direct native-call
attempts 2.89%, SQTable::Get 2.75%, Return 2.54%, LeaveFrame 2.29%, VM Set
1.99%, prototype backoff checks 1.75%. This is predominantly interpreter
execution/call overhead and repeated unsuccessful native attempts, not just
field hash lookup. Fresh short traces are
`/tmp/sqgi-store-replay-{methods,roots}-trace.log` (31 iterations/one warmup).

The next high-leverage work is correct guarded access to the VM's root during
native execution, plus general loop-join support. A read-only design audit
located VM-aware frame/direct/loop entry points in sqjit.cpp, but generated
code, native-to-native calls and object-plan entries still use the existing
three-argument ABI. A potential ABI-preserving approach is a weak observed-VM
root dependency checked at those entry points and propagated through native
callees; it must handle different VMs, root rebinding, weakref lifetime,
callee recompilation, interpreter `_set`/delegation ordering, and original
bytecode root-fallback eligibility despite folded stack aliases. Merely
embedding the closure's root or guarding only top-level callers is not enough.
This design is not implemented or claimed safe yet. Unconditional execution
context overhead on all native calls also needs measurement, not assumption.

The C++ setter specialization and the general backend must both be considered
when restoring useful native coverage. General forward-branch compilation
likewise requires explicit slot/prepared-call/alias state merges, not removal
of a rejection check. Further shrinking helper costs alone cannot address
the dominant missing native coverage in these profiles.

No fresh PGO training, commit or push occurred. Correctness is improved and
several broad development workloads are faster, but method, application and
shared-root regressions still reject the combined candidate. The original
full parity goal remains active; this iteration does not establish completion.
