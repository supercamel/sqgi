# JIT performance iterations, 2026-09-09

> **Validation correction (V18):** several targeted AArch64 test bodies through
> V17 were skipped by an undefined architecture macro. Their earlier validation
> claims are withdrawn. V18 activates them and fixes the exposed defects.
> [Correction and current evidence](jit-performance-iterations-2026-09-09/precise-integer-compare-v18/validation-correction.md).
> Historical timings and raw artifacts remain preserved.

This continues the [56-component profiling audit](jit-performance-audit-2026-09-09.md).
The active goal is at most 3× geometric-mean time and 10× p90 time against
both Node.js and GJS. The audited starting ratios are 15.355×/10.133×
geometric mean and 99.787×/51.086× p90 respectively. Final targets remain
unmet. Preexisting uncommitted engine work is preserved.

Latest complete candidate: [V8 contextual release checks](jit-performance-iterations-2026-09-09/precise-context-release-v8/README.md),
**1.3446× aggregate speedup** on the unchanged mix. Geometric time is
**11.3810× Node / 7.5502× GJS**; p90 is **36.9208× / 17.7148×**. No component
exceeds a 5% audit regression in this batch. Owners are approximately at
interpreter parity, but methods and integer-root stores remain slower than
JIT-off. The precise tier remains opt-in; the goal is active.

## Rejected: dense stack snapshot indices

A bounded map in each AArch64 native frame indexed stack snapshots directly,
including the VM temporary. Entries retained the original ordered undo stream;
one-based IDs after the structural epoch avoided stale snapshot reuse. Mixed
bound/unbound addresses, allocation failure, aliasing and rollback were tested.

Five rotating rounds against the frozen audit executable on CPU 4, five warmups:

| Suite | Components | Geometric-mean speedup | Component range |
| --- | ---: | ---: | ---: |
| Owners | 10 | 1.0066× | 0.9724–1.0273× |
| Methods | 6 | 1.0012× | 0.9952–1.0093× |
| Kernels | 15 | 1.0026× | 0.9857–1.0172× |

These differences do not justify the added frame storage and indexing paths.
The experiment was removed, including its API and dedicated tests; original
preexisting modifications were restored from the audited source snapshot.
The exact rejected binary is `build-jit-audit-20260909/rejected-dense-stack/sqgi`,
SHA-256 `e823d931498b7ca280142a829bc985f9d5ff181b96465d6bf6e3a06ea970d930`.
[Owner results](jit-performance-iterations-2026-09-09/rejected-dense-stack-owners.json),
[method results](jit-performance-iterations-2026-09-09/rejected-dense-stack-methods.json),
[kernel results](jit-performance-iterations-2026-09-09/rejected-dense-stack-kernels.json),
and the [full source delta](jit-performance-iterations-2026-09-09/rejected-dense-stack-full-source.patch)
are retained. That full delta includes the preexisting work and is not solely
the rejected experiment. The rejected build passed 98/99 selected Release
tests, retaining the audit's native-store coverage failure.

## Candidate: bounded scalar-array release proof

`CanRelease` accepts an array without a pin census if its current backing
capacity is at most 64 elements, it has no weak observer, and every element is
non-reference-counted. SQArray has no release hook or delegate. Thus releasing
this graph cannot invoke a child callback or make a weak reference die; the
capacity limit bounds both scanning and retained backing storage. No cached
contents or warmup assumptions enter this proof. Other arrays retain the
existing exact owner/pin accounting and final-release guard.

The journal still retains rollback snapshots and intermediate lifetime pins.
This change does not skip writes, bypass native coverage requirements, alter
benchmark programs, or relax release guards for observable graphs.

Unit checks cover mixed scalar contents, sizes 0/1/4/64, new weak observers,
real aliases and their removal, changed array/string children and backing
capacity above the bound. Existing final-release fixtures now retain actual
weak observers so their original rejection assertions continue testing an
observable release rather than conservative rejection of an empty graph.
A native test warms scalar-array replacement, then installs a weak observer
and passes the sole strong owner in the actual argument slot. Both interpreter
and JIT must expose death before the following root read.

The candidate passes **99/99 selected AArch64 Release tests and 99/99 strict
ASan/UBSan tests**, excluding only `sqgi_test_sqgipkg`. This fixes the audit's
`assign_refs` native-member-store coverage failure. The existing 27 release-hook
ordering cases remain passing. The shared x64/QEMU run passes four of five
test executables: member-plan retains 27 known stack-order failures and five
native assignment-result coverage failures, versus seven previous coverage
failures. The new weak-observer case passes. The x64 and other lifetime gaps
documented in the audit remain acceptance work, not passing checks.

An initial build mistakenly used `SQGI_ENABLE_JIT`; the corrected candidate
uses `SQ_ENABLE_JIT=ON`. No timings or JIT correctness claim use that initial
non-JIT build. The frozen candidate is
`build-jit-audit-20260909/scalar-array-v1/sqgi`, ordinary GCC 13.3 Release
`-O3 -DNDEBUG -g`, int64/double, PGO/LTO off.
[Change relative to the audit](jit-performance-iterations-2026-09-09/scalar-array-v1.patch).

Full five-round timing against the frozen audit, Node and GJS completes with
matching interpreter-reference checksums, including both application seeds and
all holdouts. Timing and build/sanitizer jobs do not overlap. The paired
56-component geometric-mean speedup is **1.0264×**. This is a retained development
improvement, not a claim that the broader uncommitted JIT series is merge-ready.

| Suite | Geometric-mean speedup against audit |
| --- | ---: |
| Kernels | 1.0026× |
| Applications, seed 17 | 1.0061× |
| Applications, seed 83 | 1.0092× |
| Roots | 1.0340× |
| Members | 0.9993× |
| Owners | 1.1105× |
| Methods | 1.0358× |
| Floats | 0.9979× |

All ten owner cases improve, by 4.91–17.60% less time. Four-warmup replication
improves all ten again (1.1220× geometric mean, component speedups
1.0635–1.2417×). The method cases improve 2.47–4.18% in time. Dynamic-member
time decreases 5.55%, repeated at 5.66%. The initial 4.99% array-append slowdown
does not repeat: the additional five-pair run is 3.53% faster. Neither the full
comparison nor the replication has a component more than 5% slower. All
samples remain included; the workstation and ondemand governor are not
exclusively controlled.

| Comparison with current reference measurements | Audit build | Scalar-array candidate |
| --- | ---: | ---: |
| Geometric mean / Node | 15.2975× | 14.9036× |
| Geometric mean / GJS | 10.1309× | 9.8700× |
| p90 / Node | 99.0308× | 89.9650× |
| p90 / GJS | 50.4739× | 43.8648× |

The first milestone and final goal remain unmet. The aggregate counts the
eight seed-17 application components once; seed 83 is a separate robustness
check. [Full summary and per-component ranges](jit-performance-iterations-2026-09-09/scalar-array-results/summary.json),
[kernel replication](jit-performance-iterations-2026-09-09/scalar-array-results/kernels-repeat.json),
[four-warmup owners](jit-performance-iterations-2026-09-09/scalar-array-results/owners-warmups4.json).
The candidate SHA-256 is
`3dda4f2a89cc878eb263b5815df0508fd593bb444f1c85626d1947c7a8de6610`.

Fresh owner and method profiles use the unchanged scripts, 200,000 iterations,
five warmups, CPU 4, 499 Hz user-cycle sampling and DWARF/8192 stacks. Both
have zero lost samples. Owner pin census falls below the report's 0.5% cutoff
(7.67% in the audit). Remaining owner self shares are 21.30% RecordStackSlot,
16.21% RetainValue, 9.60% PublishStackWrite and 9.08% CanRelease. Percentages
have different denominators; they do not establish absolute increases in the
remaining functions. Methods still spend 17.69% in SQVM::Execute and 9.75%
in CanRelease. Reducing the remaining stack and undo-log work is still central
to the goal.

All 41 independent holdout components also match strict-ASan JIT-off/on
at 20,003 iterations, one warmup and seed 83, with leak and
stack-use-after-return detection enabled and UBSan configured to halt.
Integer checksums compare exactly; floating checksums use 1e-10 tolerance.
The [study driver](jit-performance-iterations-2026-09-09/run_scalar_array_study.py)
preserves the audit's timing method and GLib-only GJS timer/argv adapters.

## Rejected: AArch64 reciprocal division

The audit's native assembly retained hardware division for literal divisors.
A separate candidate lowered positive int64 division/remainder with the signed
reciprocal algorithm already used by x64. It preserved signed truncation and
used the original hardware/guard path for zero, negative and dynamic divisors.
Only compiler-proven constants qualified; constants were cleared at CFG leaders.
It passed 99/99 selected Release and strict-ASan tests, all 41 sanitizer holdouts,
and roughly 700,000 deterministic generated-code checks against host division
and remainder, including signed extremes, multiples and random bit patterns.

GDB captures confirmed SDIV counts of zero in five native artifacts: numeric
loop (previously three), floating call (one), direct call (three), intrinsic
math (two) and matrix (eight). Correctness and removing SDIV did not translate
into a speedup on this host. Five paired kernel rounds against the scalar-array
candidate showed numeric_loop **23.139 → 24.425 ns**, branch_call
**32.666 → 34.674 ns**, direct_call **34.617 → 35.379 ns**, and intrinsic math
**204.875 → 212.044 ns**. Float call was essentially unchanged. The float
holdout showed mixed results. These measurements fail the performance gate;
they are not evidence that hardware division is generally slower or faster
on other processors. Reciprocal materialization and correction add instructions;
isolating their individual cost would require another experiment.

The reciprocal lowerings, new emit primitives and dedicated emitted-code tests
were removed. Their [runtime delta and initial tests](jit-performance-iterations-2026-09-09/aarch64-constant-division-v1.patch),
[kernel results](jit-performance-iterations-2026-09-09/rejected-reciprocal-kernels.json),
[float results](jit-performance-iterations-2026-09-09/rejected-reciprocal-floats.json),
assembly and validation logs are archived. The frozen rejected executable remains
`build-jit-audit-20260909/aarch64-constant-division-v1/sqgi`.

## Retained: constant operands and Boolean guards

The combined candidate retains hardware division, omits zero checks only for
compiler-proven nonzero divisors, and materializes small nonnegative constant
arithmetic operands with one MOV rather than reloading them from the native
stack. Zero and dynamically changing divisors retain their runtime guards.

Stronger route assertions also exposed a preexisting Boolean-parameter issue:
whole-function `ensure_word_slot` generated an integer guard for a Boolean
input, so compilation succeeded but every invocation exited. The candidate
uses a Boolean guard and preloads live Boolean parameters before branch/loop
targets. A loop-carried Boolean test also exposed missing NOT lowering. Native
logical NOT now handles guarded integer/Boolean inputs and preserves a Boolean
result tag; other input types retain interpreter fallback.

Tests cover integer and Boolean branch joins, mutation across loop backedges,
negative constants, zero-divisor errors, signed int64 extremes, result tags and
argument-type changes. Native-route assertions prevent interpreter fallback
from silently satisfying the new positive cases. A new logical-NOT release-hook
witness extends the AArch64 stack-order matrix to 30 cases. All pass. The final
runtime passes 99/99 selected Release and 99/99 strict-ASan/UBSan tests, plus
all 41 independent sanitizer holdout components. After strengthening the final
integer-NOT/native-route and release-order assertions, the two affected test
executables pass again in Release and strict ASan. The x64 rerun preserves its
known 27 ordering and five assignment-result coverage failures; its leaf tests
pass. This remains a development improvement with the audit's cross-backend
acceptance work outstanding.

Five rotating rounds on the unchanged 56-component mix yield **1.0323× aggregate
speedup against the frozen audit**. Both application seeds pass checksum
comparisons. No component exceeds a 5% slowdown in either seed. Seed 83 remains
a separate robustness check and is not double-counted in the aggregate.

| Suite | Geometric-mean speedup against audit |
| --- | ---: |
| Kernels | 1.0136× |
| Applications, seed 17 | 0.9950× |
| Applications, seed 83 | 1.0113× |
| Roots | 1.0454× |
| Members | 1.0052× |
| Owners | 1.1270× |
| Methods | 1.0288× |
| Floats | 1.0060× |

| Comparison with matched reference measurements | Audit build | Combined candidate |
| --- | ---: | ---: |
| Geometric mean / Node | 15.2900× | 14.8119× |
| Geometric mean / GJS | 10.1222× | 9.8057× |
| p90 / Node | 100.4269× | 90.3934× |
| p90 / GJS | 50.6074× | 43.9196× |

A separate five-pair kernel ablation against the scalar-array candidate gives
1.0100× geometric-mean speedup: branch-call improves 2.02%, while numeric-loop
and dynamic-member are essentially unchanged. This isolates the incremental
arithmetic/Boolean contribution from the larger scalar-array owner gains.
Four-warmup owner replication against the audit gives 1.1260× geometric mean,
with component speedups 1.0678–1.2342×. All rounds are retained, and accepted
timing batches do not overlap builds, tests or profiling.

[Full summary and per-component ranges](jit-performance-iterations-2026-09-09/aarch64-guards-results/summary.json),
[kernel ablation](jit-performance-iterations-2026-09-09/aarch64-guards-results/kernels-ablation.json),
and [four-warmup replication](jit-performance-iterations-2026-09-09/aarch64-guards-results/owners-warmups4.json)
contain the raw comparisons. The final executable is
`build-jit-audit-20260909/aarch64-guards-v1/sqgi`, SHA-256
`56833662e563372afb3fa6a21c489017833cf0dc13a71543bbc199b3299df1eb`.
The [combined retained delta](jit-performance-iterations-2026-09-09/retained-combined.patch)
contains all six changed engine/test files relative to the original audited
source, including the final strengthened tests. The earlier guards patch is
an initial experiment snapshot, not the complete final test delta.

Fresh profiles use CPU 4, five warmups, 499 Hz user-cycle sampling and DWARF/8192
stacks: 200,000 owner iterations and 160,000 kernel iterations. Both have zero
lost samples. Owner self shares are **21.70% RecordStackSlot, 15.55% RetainValue,
9.36% CanRelease and 9.16% PublishStackWrite**. The pin census remains below the
0.5% reporting cutoff. Kernel samples still spend 18.07% in SQVM::Execute.
These shares describe the new profile denominator and do not establish absolute
increases in individual functions. [Profiles and capture manifest](jit-performance-iterations-2026-09-09/aarch64-guards-profiles/manifest.json)
also archive five fresh native assembly captures; the diagnostic GDB run exits
normally. Its timings are not included in performance results. Raw perf data
is retained beside the frozen executable.

The first milestone and final goal remain unmet. Builds are still ordinary
Release without PGO/LTO; matched fresh PGO/LTO confirmation remains required
before final acceptance. The [next ownership experiment](jit-performance-iterations-2026-09-09/next-ownership-experiment.md)
defines precise side-exit and lifetime contracts needed to address the remaining
journal costs. It is an implementation outline, not a completed optimization.

## Experimental: precise side exits

An opt-in canonical-slot compiler now resumes the interpreter at the failing
bytecode with completed writes preserved. It includes generated-code lifetime,
late-guard and loop-continuation witnesses. The initial prototype records no
owner-side snapshots or retained-value lookups and yields 1.0515× owner speedup
against the previous retained build, with 1.337× on the dynamic-member kernel.
It remains disabled by default: the full enabled native-route matrix exposes
additional root/result coverage and caller-contract work.

[Prototype contract, measurements and correctness evidence](jit-performance-iterations-2026-09-09/precise-canonical-v1/README.md)
and [remaining promotion gates and experiments](jit-performance-iterations-2026-09-09/precise-next-steps.md)
record the current state. The [scalar follow-up](jit-performance-iterations-2026-09-09/precise-scalar-v2/README.md)
inlines scalar operations and hoists VM lookup. Five rotating rounds give
**1.3459× owner speedup versus the retained build** and 1.2837× versus the first
prototype; the dynamic-member kernel improves 1.4001× versus retained. Its owner
trace has 70 native returns and zero side exits. Neither prototype has a full
56-component acceptance result; the V2 enabled member-plan matrix has 29
failing assertions, resolved by V3 below. Neither changes the retained aggregate or completes the goal.


## Precise member contracts and full-mix measurement

The [V3 candidate](jit-performance-iterations-2026-09-09/precise-members-v3/README.md)
resolves the 29 enabled AArch64 assertions, preserving raw rollback checks and
requiring actual native success for VM-frame callers. It implements borrowed
root resolution and combined heap/result release checks. Enabled and disabled
Release/strict sanitizer runs pass 100/100 each, plus 41 holdouts in each build.
The existing x64/QEMU defects remain open.

Five rotating rounds on the unchanged 56 components give **1.1305× aggregate
speedup**, 1.5451× owners and 1.5959× methods versus the frozen audit. Candidate
geometric ratios are **13.4718× Node / 8.9336× GJS**, with p90 67.3645× / 32.5515×.
The candidate remains disabled by default: repeated event-record regressions
and an inconsistent but recurring records_4096 regression prevent promotion.
Same-binary ablations and fresh profiles are archived with the complete raw
results and a verified patch against the audited working tree.

V3 owners, methods and integer-root stores take 1.8645×, 1.6435× and 1.4342×
interpreter time. The first milestone and final goal remain unmet.


## Scalar release checks and specialized helpers

[V4](jit-performance-iterations-2026-09-09/precise-scalar-check-v4/README.md)
keeps the reference-release predicate but bypasses its out-of-line call for
scalars, improving owners 1.0776× versus V3. [V5](jit-performance-iterations-2026-09-09/precise-specialized-v5/README.md)
selects an opcode-specific helper at compile time and removes GET's redundant
local reference pin. Five rotating rounds improve owners **1.3832×**, members
1.0517× and methods **1.1257×** versus V4. Four-warmup replication confirms
**1.4861× owners versus V3**. Dynamic-member kernel time improves another 1.1113×
versus V4. Both new candidates pass 100/100 enabled/disabled Release and strict
sanitizer tests, plus all 41 holdouts per build. All 88 original benchmark,
top-level test-script and driver files remain unchanged.

V5's measured JIT/interpreter ratios shrink to **1.2500× owners**, **1.4652×
methods** and **1.2879× root_integer**, from original audit penalties 2.916×,
2.640× and 1.395×. The regressions are smaller but remain. Fresh profiles of all
seven suites identify GETK/GET/SET helpers as 52.08% of owner self samples,
including member lookup that the C++ compiler now inlines into those helpers.

The repeated array_append slowdown is not attributable to the new code from
these five-sample studies: an identical-binary control gives an apparent 18.5%
speedup, while isolated four/five-warmup diagnostics have matching aggregate
native-route counters and medians within 3% across audit/V3/V4/V5. All raw data
is preserved, and array_append remains in the unchanged full-mix score. The
records_4096 variation remains unresolved. V5 still needs its full 56-component
and both-seed performance study; V3's aggregate must not be presented as V5's.
All precise-tier changes remain opt-in. The goal is active and neither its
first milestone nor final targets are met; matched PGO/LTO also remains pending.


## Activation-local member caches and the V7 full-mix result

[V6](jit-performance-iterations-2026-09-09/precise-member-cache-v6/README.md)
caches borrowed raw member addresses for one native activation. Receiver/key
checks, current-value reloads and a bounded frame preserve the existing no-
allocation/no-callback/no-structural-mutation contract. [V7](jit-performance-iterations-2026-09-09/precise-literal-cache-v7/README.md)
shares constant-key GET/GETK/SET entries using dominating LOAD/MOVE/DLOAD facts
within a basic block. Branch joins, receiver/key tag collisions, weak values,
between-call table/array changes and capacity overflow have generated-code tests.
Both pass 100/100 enabled/disabled Release and strict sanitizer tests, plus all
41 independent holdouts per build.

V7's five rotating full-mix rounds give **1.2962× speedup against the frozen
audit**, including **2.7094× owners** and **1.8339× methods**. Geometric time
ratios fall to **11.8197× Node / 7.8471× GJS**, with p90 **39.6473× / 19.2365×**.
The separate application seed83/400003 check is 1.0027× audit speed. Four-warmup
replication confirms another 1.0774× owners and 1.0377× methods versus V6.

Table events still take 8.6% more time and class events 18.1% more time than the
audit, with disjoint five-sample ranges. Those regressions block promotion.
Array append and records_4096 do not regress in this batch; all previous raw
samples and controls remain preserved. No benchmark or score component changed.
JIT/interpreter penalties remain **1.0692× owners**, **1.4188× methods** and
**1.3250× root_integer**, so the first milestone is still unmet.

All seven fresh V7 profiles have zero lost samples. CanRelease is now 14.70%
of owner self samples; the member suite still spends 51.18% in VM execution.
The captured owner function uses 1,200 bytes of native local storage, including
an empty journal. This motivates removing empty-journal setup/cleanup while
preserving ancestor-pin accounting. Full evidence, warmup checks, independent
checksums and raw perf data are linked from V7. All precise changes remain
opt-in; the final targets and matched fresh PGO/LTO check are still outstanding.


## Empty journal removal and receiver-history diagnosis

[V8](jit-performance-iterations-2026-09-09/precise-context-release-v8/README.md)
removes empty per-call journal setup/cleanup from the precise tier. Its contextual
release check preserves the existing ancestor-pin census and final-drop proof;
with no ancestors, a surviving real owner avoids container scanning. Generated
nested-pin/combined-drop witnesses and shared pending-pin/GC/weak/failure tests
pass. Release and strict sanitizer suites pass 100/100 enabled and disabled,
plus all 41 holdouts per build. x64/QEMU retains exactly the existing 32 member-
plan assertions; its six other executables, including new journal tests, pass.

Five rotating rounds give **1.3446× full-mix speedup**, **2.8961× owners** and
**2.1629× methods** against the audit. Node/GJS geometric time is **11.3810× /
7.5502×**, with p90 **36.9208× / 17.7148×**. Table events are now 4.9% faster
than the audit; class events remain 4.6% slower with disjoint sample ranges.
No case exceeds a 5% regression in this batch. Four-warmup comparisons confirm
1.0751× owners, 1.1768× methods and 1.0437× members versus V7. The second
application seed is 0.9931× audit speed, with no >5% component regressions.

Fresh profiles have zero lost samples. Release checks fall to 5.49% of owner
self samples, while GET/GETK and arithmetic helpers dominate. Native local frame
storage falls from 1,200 to 208 bytes. JIT-on/off ratios are **0.9957× owners**
(approximately parity), **1.2166× methods** and **1.1841× root_integer**.

A five-round same-binary case-order diagnostic repeats with four/five warmups:
integer-root stores improve from about 286 ns to 63 ns when their receiver runs
first, while receiver-field stores slow from 54 ns to 213 ns. The other root
cases stay nearly unchanged. The single cached loop specialization and guard-
backoff policy match this history dependence. The accepted benchmark order is
unchanged; the fix must adapt generated code to receiver changes. Artifact
lifetime during reentry and method replacement must be tested before replacing
or retaining additional loop variants.

All original 88 benchmark/test-script/driver hashes and earlier frozen binaries
remain intact. Both milestones and fresh matched PGO/LTO confirmation remain
outstanding; there is no default promotion or completion claim.


## Bounded loop variants resolve integer-root history dependence

[V9](jit-performance-iterations-2026-09-09/precise-loop-variants-v9/README.md)
retains an immutable second loop mapping after a previously successful mapping
hits a replayable guard failure. It tries the last successful variant first and
bounds both mappings and recompilation attempts. Receiver alternation, third-
receiver fallback, method replacement/address reuse, recursive mapping lifetime,
and allocation failure before/after executable installation have explicit tests.
All 100 enabled/disabled Release/strict-sanitizer tests and 41 holdouts per build
pass. x64 retains exactly the same 32 preexisting member-plan assertions.

Integer-root stores improve **4.5844× versus V8**, 286.340→62.460 ns, in the
original benchmark order. Four/five-warmup reversed-order controls keep both
receiver-field and root stores fast. The one-warmup trace falls from 208 guards,
26 backoffs and 599,795 skips to one guard and no backoffs/skips. The actual native
mappings are captured and byte-verified unchanged on subsequent calls.

The unchanged 56-component aggregate is **1.3766× faster than the audit**.
Node/GJS geometric ratios are **11.1067× / 7.3228×** and p90 ratios **36.8530× /
17.7789×**. Owners improve 2.8860× and methods 2.1462× versus the audit. Both
application seeds retain checksums; the separate seed83 result is 0.9977× audit
speed. Class events remain **5.97% slower** than the audit, with disjoint sample
ranges. Four-warmup V8/V9 replication shows a smaller 1.29% incremental class-
event slowdown; aggregate route counters match, with no native loop executions.
Its mechanism remains unresolved and promotion remains blocked.

JIT-on/off time is **0.9935× owners**, **1.2165× methods** and **0.2617× integer
roots**. The root regression is removed, owners remain approximately at parity,
and methods still regress. Seven fresh profiles have zero lost samples. GETK,
GET and arithmetic remain owner hotspots; VM execution consumes 56.34% of member
and 40.29% of method self samples. Native scalar reads and mixed/float arithmetic,
then short-method execution costs, are the next targets.

All 88 original benchmark/test-script/driver hashes and previous frozen binaries
are preserved. Both milestones and fresh matched PGO/LTO confirmation remain
outstanding. The experiment remains opt-in and the goal remains active.


## Native scalar reads, floating arithmetic and non-final temporary drops

[V10](jit-performance-iterations-2026-09-09/precise-native-scalars-v10/README.md)
adds scalar array reads and mixed/binary64 ADD/SUB/MUL/DIV. It preserves ownership
transfer into the VM temporary, integer error paths and exact side exits, and
retries without optional lowering if the emission buffer fills. Its targeted
five-round owner gain is 1.0592× versus V9; no full-mix V10 score is claimed.

[V11](jit-performance-iterations-2026-09-09/precise-native-release-v11/README.md)
extends those reads to owning temporaries when no ancestor journal exists and
another real owner survives. The native decrement masks the GC mark only for
comparison and preserves it in storage. Generated weak-lifetime, marked-count,
ancestor-pin and release-order witnesses pass. Both versions pass 100/100 enabled
and disabled Release/strict-sanitizer checks plus all 41 holdouts per build.
x64 retains the exact same 32 existing member-plan assertions. Checked debugger
controls verify actual helper bypass; failed initial diagnostic captures remain
preserved and are superseded by successful controls.

V11's unchanged 56-component aggregate is **1.4320× faster than the audit**,
including **3.3995× owners** and **2.2356× methods**. Node/GJS geometric time ratios
are **10.6651× / 7.0547×** and p90 ratios **32.0000× / 15.7353×**. Both application
seeds retain checksums; the separate seed83 result is 0.9994× audit speed. No case
exceeds a 5% regression, but class events remain 3.36% slower with disjoint sample
ranges. The original benchmark algorithms and weights remain unchanged.

Direct four-warmup V9/V11 controls confirm 1.1785× owner and 1.0293× method speed.
JIT-on/off ratios are **0.8428× owners**, **1.1805× methods** and **0.2619× integer
roots**. Owners and integer roots are now faster than the interpreter; methods
still regress, and the aggregate remains below the 2× first milestone.

Seven fresh V11 profiles have zero lost samples. Dynamic GET falls to 3.47% of
owner self samples, while named member reads/stores dominate remaining helpers.
VM execution remains 57.64% of member and 41.02% of method self samples. Native
captures verify all five relevant callees and retain the owner function's
208-byte local frame. Further member-cache lowering and broader canonical loop
coverage are the next targets, with the original lifetime witnesses retained.

The complete 27-file patch reconstructs the current runtime/tests against the
original audit snapshot; all 88 original benchmark/test-script/driver hashes and
earlier frozen artifacts are preserved. Both milestones, existing x64 repairs,
and matched fresh PGO/LTO confirmation remain outstanding. The experiment stays
opt-in and the performance goal remains active.


## V12: native scalar cache hits

[V12](jit-performance-iterations-2026-09-09/precise-native-cache-v12/README.md)
validates borrowed cache addresses and reads scalar results natively, retaining
V11's temporary-release and weak/ancestor fallback rules. Three bounded emission
tiers preserve earlier array/float coverage if cache lowering fills the buffer.
New cache-hit userdata, GC-mark, ancestor-pin and changing-value-type witnesses
pass all four 100/100 Release/sanitizer gates and 41 holdouts per build. x64
retains its same 32 existing assertions. A positive-control probe reduces target
GET helper calls from 129 to 39 across twelve native calls with exact results.

The unchanged full-56 aggregate is **1.437964x faster than the audit**; owner
speed is **3.536012x** and method speed **2.224221x**. Node/GJS geometric time
ratios are **10.612662x / 7.023121x**, with p90 **30.734116x / 15.500620x**.
Neither application seed has a >5% regression; the separate seed83 result is
0.998776x audit speed. No full-mix case regresses over 5%. Table events improve
10.12%; class events are approximately at parity with overlapping sample ranges.

Direct V11/V12 controls confirm about 4.3% owner and 2.5% event gains under both
four and five warmups, but transfer methods lose roughly 2%. Reference-valued
reads currently enter the scalar check and then repeat lookup in the helper;
that is the next bounded optimization candidate. JIT-on/off time ratios are
**0.808679x owners**, **1.184261x methods** and **0.262060x root_integer**.
The method regression and <2x aggregate continue to block the first milestone.

Seven fresh profiles have zero lost samples. Named GETK helpers still account
for 13.64% of owner self samples; method/member VM execution remains
40.07% / 56.42%, with zero native loop executions. Five native captures confirm
the cache path and earlier floating lowering, preserving the 208-byte owner
frame and 8192-byte mapped size. The complete audit patch still reconstructs
27 changed files. V12 corrects an inherited source-manifest omission by including
the already-patched leaf test, bringing the manifest to 94 files. All 88 original
benchmark/test-script/driver hashes and previous frozen artifacts are preserved.

The goal remains active and the tier remains opt-in. Reference-valued native
reads and broader canonical loop coverage are next; final Node/GJS targets,
existing x64 repairs and matched fresh PGO/LTO confirmation remain outstanding.


## V13: native reference-valued reads

[V13](jit-performance-iterations-2026-09-09/precise-native-reference-v13/README.md)
adds source pinning to native array/cache reads. Release guards run before that
pin, and the old temporary's count is reloaded afterwards to preserve source/temp
aliases. Weak sources and sensitive final/ancestor releases retain the helper.
Native userdata, exact-count, marked-count and weak-death witnesses pass all four
100-test Release/sanitizer gates and 41 holdouts per build. Existing x64 failures
remain exactly the same 32 assertions. A checked positive control reduces read
helper calls from 36 to 21; the remainder is expected cache misses and weak reads.

Five-round direct controls at both four and five warmups show **13.5% faster
owners** and **4.1% faster methods** than V12. The unchanged full-56 score is
**1.474809x faster than the audit**, including **4.053592x owners** and
**2.293635x methods**. Node/GJS geometric time ratios are **10.319610x / 6.821332x**,
with p90 **27.179286x / 15.026729x**. JIT-on/off ratios are **0.711996x owners**,
**1.138319x methods** and **0.261081x root_integer**. Methods still regress and
the aggregate remains below the 2x first milestone.

The full mix retains a **12.97% records_4096 slowdown** in seed17, with wide
overlapping ranges. Seed83 is 0.997482x audit speed overall, with no >5% case
regression. Direct four-label controls reproduce **17.57% between identical V13
commands** in seed17, versus 3.09% in seed83; both V13 labels beat that control's
audit median in seed17. A repeatable V13 code regression is not established, but
the source of the variance remains open. The initial result stays in the score;
no favorable control replaces it.

Seven fresh profiles have zero lost samples. Owner GET helpers fall below 0.5%;
LOAD (13.68%) and SET (11.49% constant plus 4.77% other) are now prominent remaining
helpers. Method/member VM execution remains 44.27% / 57.27% of samples. Five native
captures verify source pinning without larger frames or loss of floating paths.
The complete 27-file reconstruction, 94-source manifest, 88 unchanged benchmark
hashes, both application seeds, raw controls and all earlier artifacts are retained.

The tier stays opt-in and the goal remains active. Native copies/stores and broader
canonical loop coverage remain next, alongside the unresolved records variance,
existing x64 repairs and eventual matched fresh PGO/LTO confirmation.


## V14: native single-destination copies

[V14](jit-performance-iterations-2026-09-09/precise-native-copy-v14/README.md)
lowers LOAD/MOVE and scalar constant loads into proven non-final destinations.
It guards before adding a source pin, reloads aliased counts after the pin, and
preserves GC marks and raw weak-reference identity. Final/ancestor-sensitive drops
retain exact helper continuations; DLOAD and SET combined-drop rules are unchanged.
Native copy/lifetime witnesses pass four 100-test Release/sanitizer gates and
41 holdouts per build. x64 retains its existing 32 assertions. The corrected
weak-object debugger control verifies fifteen native returns and 32-to-zero
copy/load helper calls; the earlier array-source fixture and its limitation
remain documented and preserved.

Both warmup histories confirm **about 10% faster owners** and **5.5% faster
methods** than V13. The unchanged full-56 score is **1.519989x faster than the
audit**, including **4.466628x owners** and **2.434441x methods**. Node/GJS geometric
time ratios are **10.035920x / 6.659229x**, with p90 **26.467130x / 14.550669x**.
No case regresses over 5% in this batch or the second application seed; seed83
application speed is 0.991173x audit speed. Records timings remain variable, and
the prior identical-binary discrepancy is not declared resolved.

JIT-on/off ratios are **0.646362x owners**, **1.073560x methods**, and **0.261589x
root_integer**. The method penalty is smaller but still present; the aggregate
also remains below the 2x first milestone. Seven profiles have zero lost samples.
Owner LOAD/MOVE/GET helpers fall below 0.5%, leaving SET (14.66% constant plus
5.51% other), DLOAD (8.67%) and PINCL (8.64%) prominent. Method/member VM execution
remains 44.27% / 59.13% of self samples.

All five native captures retain their local frame sizes and floating paths.
Two member callees grow from 4096 to 8192 mapped bytes; this cost is recorded
alongside their approximately flat timing. Native guarded stores and shared cold
exit code are next candidates, with broader canonical loop/call coverage still
required. The complete patch reconstructs 27 files, and 94 source plus 88 original
benchmark/driver hashes are verified. The tier stays opt-in and the goal remains
active; existing x64 repairs, variance resolution and fresh matched PGO/LTO remain
outstanding.

## V15: shared precise side-exit returns

[Full V15 evidence](jit-performance-iterations-2026-09-09/precise-shared-exit-v15/README.md).
Frozen SHA256 `2d487564d42242918bbd145c3c24deec01f9e94417787a48c74f1dba5cfb2fe1`.
Every failing helper retains its exact IP stub but shares one result publication
and frame restoration per function. Eight new late-error witnesses pass without
replaying prefixes. The native decoder verifies all 87 guard/IP stubs across five
functions. Recycle shrinks 7924→6740 emitted bytes; table_apply/apply each shrink
4176→3676 and return from 8 KiB to 4 KiB mappings. All hot lowering and local
frames remain unchanged in those captures. The five functions save 2932 emitted
bytes and 8192 mapped bytes.

Full56 audit speedup is **1.514416839x**; geometric time ratios are
**10.081837x Node / 6.678454x GJS**,
and p90 **25.501541x / 14.698213x**.
No >5% case regression occurs in the fixed mix or seed83. Seed83 application
speed is 1.008503x audit. Direct V14/V15 suite
comparisons remain within 0.5% under both warmup histories: retain for code space,
not an incremental throughput claim. On/off time ratios are 0.648098 owners,
1.073574 methods and 0.262459 integer root; the method regression remains.

Release and strict sanitizer builds each pass 100 tests enabled/default and all
41 holdouts. x64 retains the same 32 known assertions (six of seven executables
pass). Seven profiles have zero lost samples. No old evidence or benchmark is
replaced. Records_4096 variance remains unresolved. Next: guarded native
single-output existing-slot stores, then broader loop/intrinsic/call coverage.
Neither the first milestone nor the full goal is complete.

## V16: native existing-slot stores

[Full V16 evidence](jit-performance-iterations-2026-09-09/precise-native-store-v16/README.md).
Frozen SHA256 `f99f3a6a2386bca4a09095ba8fc6c41695484fd33003688989c7e182475a7273`.
Native SET handles existing slots with no separate result write, sharing validated
addresses with GET and single-destination ownership checks with COPY. Weak values
are stored raw; sensitive releases and multi-output writes retain the helper.
Thirty ownership and twenty-four weak cases cover arrays/tables/instances and both
supported result forms, plus polymorphic and invalid-operand loops. Debugger
controls reduce 36 SET helper calls to eight cold resolutions with 12 native
successes and no guard/side exits. All 14 eligible stores are captured in five
functions; code grows 2704 bytes, including two member mappings returning to 8 KiB.

Full56 speedup is **1.571985665x audit**; geometric time ratios are
**9.708637x Node / 6.431963x GJS**,
and p90 **24.934516x / 14.265827x**.
Owners gain 22.7–22.8% directly over V15, methods 1.1–1.6%, members 1.2–1.3%.
Publish_table is 2.3–3.4% slower. Array_append is 11.08% slower than audit in the
fixed mix and stays in the aggregate; separate unchanged-script controls and
interpretation are preserved in the V16 report. Neither application seed has a
>5% regression. Seed83 speed is 0.996844x audit.

On/off time ratios are 0.527772 owners,
1.063623 methods and
0.262601 root_integer; method
regression remains. Release and strict sanitizer builds each pass 100 tests
on/default and 41 holdouts. x64 retains its 32 known assertions; seven profiles
have zero lost samples. Owner SET helpers fall below 0.5%; PINCL/DLOAD/JCMP and
broader native coverage now matter. Next evaluate impossible cold cache probes
and provably invariant operands. Neither milestone nor full goal is complete.

## V17: proofs for cache checks

[Full V17 evidence](jit-performance-iterations-2026-09-09/precise-cache-proofs-v17/README.md).
Frozen SHA256 `63de3d98bca2856a0ce2589ae1615fa80f0c11218bc1010d1cbc787363692d4e`.
First-use cache probes are omitted only outside every backward-branch span;
unchanged parameter receivers/keys omit redundant identity checks after a
nonnull cache hit. Complete write facts cover conditional and multi-output
writes. Array guards, helper cache population and ownership semantics remain.
New tests cover cold/loop/conditional uses, mutable parameters, key tag collisions,
second-DLOAD writes and exact invalid-operand exits. Debugger controls each make
14 necessary SET helper calls and 20 native returns without guard/side exits.
Five native captures save 3056 code bytes and 8192 mapped bytes; all 87 exact-IP
exit sites pass decoding.

Full56 speedup is **1.584081995x audit**. Geometric time ratios are
**9.634058x Node / 6.382689x GJS**;
p90 ratios are **24.522956x / 14.191829x**.
Direct controls and every >5% regression are recorded in the report.
On/off time ratios are 0.521151 owners,
1.045156 methods and
0.261063 root_integer.
All four 100-test gates and both 41-holdout runs pass; x64 retains the same 32
assertions. Seven profiles have zero lost samples. Neither milestone nor full
goal is complete; next evaluate integer JCMP with its real temporary assignment.

## V18: activated validation, lifetime repair and integer comparisons

[Full V18 evidence](jit-performance-iterations-2026-09-09/precise-integer-compare-v18/README.md).
Frozen SHA256 `7bbbf925b5f7d9c1777a300a3d23646b0c0f47f9f9cdc5998033dd6f8f84ab12`.

The corrected test guards expose and now cover stale closure-address reuse and
large-function native-coverage gaps. Weak lifetime guards protect specialized
closures without extending their lifetime. A compact helper-call fallback keeps
the original eight-exit and 70-member-site functions native within 8 KiB. Fixture
repairs preserve their intended release, weak, alias and multi-output contracts.
Integer JCMP now assigns the actual VM temporary natively; 76 debugger observations
verify its boolean before RETURN, while 24 exact failure sites preserve sensitive
releases and nonnumeric fallback. Frozen CLI helper calls fall from 40 to four
mixed-float cases, with 40 native successes and no exits.

Full56 speedup is **1.610484881x audit**. Geometric time ratios are
**9.533846x Node / 6.305092x GJS**;
p90 ratios are **25.044114x / 14.052388x**.
Direct warmup controls, every per-case regression and profitability are retained
in the report. All four 100-test gates and both 41-case holdout runs pass with
explicit activation evidence. Seven profiles have zero lost samples. The same
32 x64 assertions remain. Neither milestone nor the full goal is complete.

V18's owner gain repeats at 14.6–14.7%, but direct/float calls and several float
workloads regress. [The full investigation](jit-performance-iterations-2026-09-09/precise-integer-compare-v18/regression-investigation.md)
uses 40 full-kernel and 50 full-float timed processes plus eight native captures.
It identifies eight added instructions per guarded call; the stale-closure fix
must remain while that overhead is reduced. Array-append's identical-binary
variance remains unresolved. No fixed-mix component or sample is replaced.


## V19: closure witness helper guards

V19 folds lifetime checks into the existing closure identity helper and retains
weak witnesses. The new native-closure address-reuse contract executes a real
compiled loop and rejects stale inlined math after closure death. Four 100-test
runs and both 41-holdout sets pass; the same 32 x64 assertions remain open.

Unchanged full56 speedup is 1.612804330× audit; Node/GJS geometric ratios
9.482733/6.278747, p90
24.846929/14.043077. Both warmup histories, repeated
controls, exact per-case regressions and seven fresh profiles are retained in
[the V19 evidence](jit-performance-iterations-2026-09-09/closure-witness-guards-v19/README.md).
The original performance goal remains active.


## V20 rejected: scalar loop entry guards

V20 is rejected after an additional raw-frame release-order witness. Its measured
1.749× speedup is provisional, and V19 remains the previous validated candidate.
See the V20 receiver-publication failure evidence. V20 validates invariant callees
once per proven scalar-loop activation, preserving
weak lifetime and existing fallback semantics. A direct closure parameter's unused
receiver can now remain private until its scalar result overwrite. The native
route probe reduces 126 root lookups to three across three entries; explicit
mutation, rebinding, address-reuse and native-coverage contracts pass.

Full56 speedup is 1.749222226× audit. Node/GJS geometric time ratios are
8.738534/5.755491, and p90 ratios are
24.952637/13.948677. See [the V20 evidence](jit-performance-iterations-2026-09-09/scalar-loop-entry-guards-v20/README.md)
for all per-case controls, regressions, both application seeds, profiles and limits.
Four 100-test runs and both 41-holdout sets pass. Existing x64 failures and matched
fresh PGO/LTO remain open; the full performance goal remains active.


## V21: receiver entry guards

V21 fixes the release-order regression that rejected V20. Owning receiver/result
temporaries reject before effects; scalar temporaries still execute natively.
The retained standalone reproducer fails frozen V20 and passes frozen V21, and
permanent native tests cover final/nonfinal owners and ancestor journal pins.
Four 100-test runs and both 41-holdout sets pass, with actual generated-code coverage.

Fresh unchanged full56 speedup: **1.756968834× audit**. Node/GJS geometric
ratios are 8.716162/5.762824; p90 ratios are
25.024323/13.794949. See [V21 evidence](jit-performance-iterations-2026-09-09/receiver-entry-guards-v21/README.md)
for controls, regressions, both application seeds, profiles and correctness limits.
The performance goal, existing x64 defects and fresh matched PGO/LTO remain open.


## V22: private local-slot forwarding

V22 forwards private 64-bit slots through scratch FP registers inside proven
scalar native regions, including inlined callee temporaries. Branch/call/alias
boundaries materialize the original frame; typed float copies and next-use checks
avoid unnecessary register transfers. Native bit/alias/helper-clobber/branch tests,
all four 100-test runs and both 41-holdout sets pass.

Fresh full56 speedup: **1.794565216× audit**. Node/GJS geometric ratios are
8.509880/5.641085; p90 ratios are
24.233821/13.762369. See [V22 evidence](jit-performance-iterations-2026-09-09/local-slot-forwarding-v22/README.md)
for the rejected preliminary pilots, controls, static transformation checks,
profiles, regressions and limits. The repeated filter_stream regression is
explicitly retained, with a same-executable ten-instruction ablation to guide the
next general fix. Full targets, existing x64 defects and fresh
matched PGO/LTO remain open.


## V23: transactional float-copy conversion

V23 retains original GP float copies unless the scalar forwarding transaction
succeeds. Failed or inapplicable forwarding preserves the original bytes, including
late buffer exhaustion. Native payload/fallback tests, all four 100-test runs and
both 41-holdout sets pass. Paired captures retain V22's forwarded code and restore
the ten filter_stream GP copy instructions isolated by the prior experiment.

Fresh full56 speedup: **1.791497689× audit**. Node/GJS geometric ratios are
8.547046/5.651919; p90 ratios are
24.339757/13.629196. [V23 evidence](jit-performance-iterations-2026-09-09/transactional-float-copies-v23/README.md)
retains all controls, regressions, code checks and fresh profiles. Full targets,
existing x64 defects and matched PGO/LTO remain open.


## V24: precise length coverage and prepared-call ownership

The full unchanged 56-component study measures **1.806949370× audit**; Node/GJS
geometric ratios are **8.455109/5.589492**, p90 **24.873326/13.421299**.
V24 is rejected as a performance candidate because paired controls reproduce
an approximately 31% array-append regression. Its release-order correctness
fixes remain. All four 100-test runs and both 41-holdout sets pass; x64 keeps
the same 32 known failures. [V24 evidence](jit-performance-iterations-2026-09-09/precise-length-v24/README.md)
includes all timings, repeats, profiles, native captures and the isolated probe
identifying one extra journal publication per append. V23 is the last accepted
performance result. The full goal and matched PGO/LTO remain open.


## V25: identity-preserving reference publication

V25 avoids redundant journal publication when the real destination already owns
the exact same object. Changed owners and GET swaps retain the checked paths.
Both kernel controls recover append from ~167 ns to ~126 ns and retain the math
intrinsic gain. Four 100-test runs, both 41-holdout sets and resource-failure
probes pass; x64 retains the same 32 known assertions.

Fresh full56 speedup is **1.825291247× audit**; Node/GJS geometric ratios are
**8.382561/5.554487**, p90 **24.228039/13.532819**, with no >5% full56 regression.
[The V25 evidence](jit-performance-iterations-2026-09-09/identity-publication-v25/README.md)
includes the full results and isolated machine-code/helper-count verification.
Profitability, all seven fresh profiles and final paired controls are complete.
Both warmup histories and identical-binary repeats have no >5% regression against
V23. V25 is the latest accepted full performance result. Methods remain 1.042785×
JIT-off runtime, so the first milestone is still unmet.
All full-goal targets, known x64 defects and matched PGO/LTO remain open.


## V26: guarded owning post-increment

V26 eliminates the checked PINCL helper when an integer post-increment can
release its old result owner without callbacks. All guards precede both VM
writes. A richer layout falls back to the existing layout at the same code tier;
resource failures retain later retry. Actual tracing removes 380 helper calls
across 380 native loop iterations. Four 100-test runs, both 41-holdout sets,
resource probes and 137 exact native resume guards pass; x64 keeps its 32 known
assertions. All fourteen paired control groups pass with no >5% regression.

Fresh full56 speedup is **1.866476378× audit**; Node/GJS geometric ratios are
**8.186695/5.425420**, p90 **24.987213/13.449750**. No component regresses >5% versus
the audit. [V26 evidence](jit-performance-iterations-2026-09-09/owning-postincrement-v26/README.md)
retains all timings, profiles, controls, source/binary identities and native
probes. V26 is the latest accepted performance result. Methods remain
1.040916× JIT-off time; the first milestone and full engine targets remain
unmet. Matched PGO/LTO remains outstanding.


## V27: guarded cold literal lookup

Cold constant-key table and instance-field access now probes the current first
bucket, preserving full type/identity/bounds checks and checked helper fallback.
Tracing verifies 252 helper calls eliminated across 84 successful native returns.
All four 100-test runs, both 41-case holdouts, resource probes and 137 exact native
resume guards pass; x64 keeps its 32 known assertions. All fourteen paired
control groups were investigated. Initial seed83 records_4096 copies flagged
~8% regressions; a fixed replication with repeats of both versions found new
ratios1.001013/0.998660. Including original results,95%upper bounds stay below1.05
for both warmups. All initial flags and raw runs are retained.

Fresh full56 speedup is **1.878306123× audit**; Node/GJS geometric ratios are
**8.123046/5.399528**, p90 **23.026169/12.619815**. No component regresses >5% versus
the audit. [V27 evidence](jit-performance-iterations-2026-09-09/cold-literal-lookup-v27/README.md)
retains all timings, seven profiles, controls, source/binary identities and native
probes. V27 is the latest accepted performance result. Methods use
0.976511× JIT-off time. First milestone met:
False; engine ratio targets met: False.
Matched PGO/LTO remains outstanding.


## V28: shared helper setup

Shared helper setup retains tier 3 native member reads within the unchanged
8192-byte buffer. Actual checked helper calls fall 1772→1244, with code shrinking
7884→7408 bytes. Both warmup histories and candidate repeats agree on the buffer
improvement. All control flags have been investigated and resolved under the
predeclared fixed-replication criterion; original results are retained.
Semantic and native gates pass.

Fresh full56 speedup is **1.881308282× audit**; Node/GJS geometric ratios are
**8.101546/5.382928**, p90 **23.657897/12.577691**.
[V28 evidence](jit-performance-iterations-2026-09-09/shared-helper-v28/README.md)
retains unchanged full56/both-seed timings, seven profiles, source and binary
identities, resource/boundary probes, and interpreter profitability. V28 is the
latest accepted performance result. First milestone: False;
engine targets: False. Matched PGO/LTO remains outstanding.

V28 also retains a smaller records_4096 slowdown: new seed17/four-warmup paired
time is1.87%longer than V27 (95%interval+0.15%to+3.72%). This is below the
predeclared5%material-regression threshold, but it is not dismissed as noise.
[Details and sealed evidence](jit-performance-iterations-2026-09-09/v28-records-small-regression.md).


## V29: shared helper tail branch

V29 is accepted. The shared helper block shrinks from 40 to 24 bytes and
returns directly to the original call-site continuation. Buffer runtime falls
by about 4.3–4.6% in the pilots. Full56 speedup is **1.882226095× audit**;
Node/GJS geometric runtime ratios are **8.119330/5.370798**,
p90 **23.761645/12.629266**. All fourteen paired control
groups have no >5% flag against V28, retaining both versions' repeats and both
application seeds/counts and warmup histories. Semantic and native gates pass;
x64 retains the same 32 known assertions.

[V29 evidence](jit-performance-iterations-2026-09-09/shared-helper-tail-v29/README.md)
retains full results, seven fresh profiles, exact native captures, source and
binary identities, resource/budget probes and interpreter profitability.
V29 is the latest accepted full result. First milestone: False;
engine targets: False. Matched PGO/LTO remains outstanding.

## V30: signed constant division — stopped before performance acceptance

The current source includes positive constant-divisor lowering in all three
AArch64 compiler paths, with signed semantics and old-layout code-budget fallback.
All four 100-test runs, both 41-holdout runs, 16 native groups, strict sanitizer
checks and the eight-test x64 comparison passed their recorded gates (x64 retains
the same 32 known member assertions). Constant proofs, 48 paired budget fixtures,
14 installation cases and the original resource/lifetime checks are preserved.

The user requested stopping and committing on 2026-09-10. Four pilot groups
completed; warmup4 members was interrupted and warmup4 owners was not run.
V30 has no full56 result and is not performance-accepted. The completed warmup5
methods/owners groups were nearly flat, while members regressed 0.72% in aggregate
and calibration cases regressed about 2.3–2.6%. Repeated-call fault probes also
confirmed an existing private proto/loop allocation-failure retry gap, unchanged
from V29. Neither the performance targets nor matched PGO/LTO are complete.

[V30 checkpoint and partial evidence](jit-performance-iterations-2026-09-09/constant-division-v30-work-in-progress/README.md).
V29 remains the latest accepted full performance result.
