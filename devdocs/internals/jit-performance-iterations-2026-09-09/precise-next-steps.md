# Remaining work on the experimental precise tier

The canonical-slot compiler and real side-exit tests now exist. This replaces
the earlier unimplemented outline, but does not satisfy the performance goal.
The experiment remains disabled by default. Preserve the earlier retained and
prototype executables, patches and evidence when continuing.

## Earlier correctness and performance status through V5

[The V3 member-contract candidate](precise-members-v3/README.md) resolves all 29
additional enabled AArch64 assertions exposed by V2. Raw compilation explicitly
omits side-exit permission; tests of precise calls establish real VM frames and
require native success. Borrowed root reads and executing-VM root stores preserve
receiver provenance and delegation. Reference-valued SET results check combined
drops before effects. Separate tests retain raw rollback and precise-prefix
contracts, including a two-alias heap/result release witness.

Enabled/disabled Release and strict sanitizer suites pass 100/100 each; all 41
holdouts agree. Existing x64/QEMU defects remain: 27 release-ordering and five
native result-coverage assertions. Legacy loop takeover remains excluded for
precise artifacts because it fails the JCMP temporary-release contract. Do not
restore it without fixing and retaining the generated-code witness.

V3's unchanged 56-component study yields 1.1305× versus the audit (owners 1.5451×,
methods 1.5959×), but table/class events regress repeatedly to 0.7474× / 0.6691×
in the same-binary enabled/disabled ablation. records_4096 also regresses in an
ablation despite mixed results across the two full-study seeds. Array append's
large full-study slowdown is not reproduced by toggling precise exits alone.
These require investigation before promotion. Owner/method/root_integer JIT
regressions versus interpreter also remain, at 1.8645× / 1.6435× / 1.4342×.

Fresh V3 owner profile: precise_step 53.75%, CanRelease 18.36%, precise_member
15.96%, no lost samples. The trace has 70 native returns and no side exits.
The scalar-check experiment keeps the existing reference predicate but avoids
out-of-line calls for non-reference values. Five rounds show 1.0776× owners,
1.0161× members and 1.0071× methods versus V3, with all correctness gates passing.
Its array_append repeat regresses again and remains under diagnosis. The next
candidate specializes opcode helpers and removes GET's redundant local pin;
its full correctness gates pass. Five rotating rounds show 1.3832× owners,
1.0517× members and 1.1257× methods versus V4. Four-warmup replication confirms
1.4861× owners versus V3 and 1.3781× versus V4. Fresh V5 profiles of all seven
suites have no lost samples. GETK/GET/SET helpers account for 52.08% of owner
self samples, including inlined member lookup; CanRelease is 10.77%.

The latest JIT/interpreter ratios are 1.2500× owners, 1.4652× methods and 1.2879×
root_integer. These are still regressions. V5 remains disabled by default and
needs its unchanged full 56-component study with both application acceptance
seeds/counts. Do not relabel V3's 1.1305× aggregate as V5 or infer a new aggregate
by multiplying results from separate targeted batches.

Array-append attribution is now more constrained: an identical-V5 executable
control produces an apparent 18.5% speedup, and isolated tracing with four/five
warmups shows matching aggregate route counters across audit/V3/V4/V5 and
medians within 3%. Keep the original full-suite samples and score component;
these controls show instability but do not identify its mechanism. The identical
application control stays within 2.5%, so the mixed records_4096 result still
needs investigation. All control, profile and comparison data is archived in
[the V5 evidence](precise-specialized-v5/README.md).

## Next performance experiments

V5 emits scalar literals, non-owning moves, integer arithmetic and local
increments directly, hoists the VM pointer and specializes the checked opcode
helpers. Floating arithmetic and owning member operations still use helpers.
The current profile points to member access first, followed by release guards
and floating operations. Compare against the frozen V5 executable and preserve
all earlier evidence; new effects need new lifetime/continuation proofs.

Useful next possibilities:

1. Inline floating and mixed numeric arithmetic, with runtime tags and exact
   NaN/comparison/zero semantics. Every slow branch must precede any VM write.
2. Cache existing-member addresses per native frame/site. The accepted subset
   has no calls, JS allocation, insertion, deletion or resize, so table slots,
   instance fields and array backing storage cannot structurally move during a
   successful activation. A cache must still check owner identity and key tag/
   bits, handle weak values, and never dereference a stale owner. Prove lifetime
   and absence of address reuse before caching, and invalidate on every new
   effect admitted to the tier. Hoist loop-invariant receivers only when their
   slots and dependent owners are not overwritten across the loop.
3. Inline a GET when its source is scalar and the old VM temporary is non-owning.
   Read first, move the old destination into the temporary, then publish the
   scalar result. The destination itself may own a reference: ownership moves,
   rather than being discarded. Source/receiver/destination aliases and the
   next comparison's release must retain explicit witnesses.
4. A no-ancestor-pin proof can support direct non-final reference checks between
   helpers. The local log is empty; if there is no enclosing active journal and
   no pending/helper-local pin, physical refcounts represent real ownership.
   Respect GC mark-bit masking and the number of drops. A final drop still needs
   the original graph/weak-observer proof or an interpreter exit. New helper
   callbacks or allocations that can reenter the VM would invalidate the proof.

These are implementation options to test, not assumptions permitting weaker
release semantics. Do not infer acceptance from owner gains alone: repeat the
unchanged 56-component mix, both application seeds, warmup variation, independent
holdouts, sanitizer/native-route gates, fresh profiles and eventual matched
PGO/LTO before declaring the original goal complete.


## Concrete follow-ups for the specialized helper profile

- A per-frame member-address cache can share entries between compatible GETK
  sites or GET/SET register pairs, while still checking owner identity and key
  tag/bits on every use. Sharing matters for short callees whose individual sites
  run only once per activation. The accepted subset cannot allocate a new JS
  object or resize/insert/delete members; this is the proof against owner-address
  reuse and slot movement within one activation. Cache values must always be
  reloaded. Root fallback needs separate provenance; start with ordinary raw
  slots. Do not reuse this proof if the tier gains allocation, calls or structural
  mutation. Persistent caches need a separate lifetime/shape proof.
- Existing interpreter SQMemberCache objects pin their class. Reusing their fill
  helper would introduce a hidden owner, allocation and possible release during
  native execution. Do not import it without accounting for those effects. A
  borrowed, activation-local cache avoids that ownership change.
- CanRelease checks scalar-array contents before counting physical owners. A
  precise-only non-final-reference fast path could avoid those scans when its
  own log is empty and no ancestor log/pending helper pin exists. It must mask
  the GC mark bit, honor the combined drop count and preserve the general
  predicate for final drops or any ancestor. Add a generated-code witness with
  ancestor journal pins before relying on this proof.
- The records_4096 samples span roughly 0.22–0.30 microseconds in both SQGI binaries. The function contains allocation/structural operations and
  cannot use the precise whole-function tier. Earlier instruction rejection
  before allocating SQBytecodeAnalysis is a possible cold-path cleanup, not an
  established explanation or fix. Compare native route/counters and cache/branch
  profiles before attributing its mixed results to layout or measurement noise.


## After the member-cache experiments

V6 adds activation-local raw slot addresses and passes all enabled/disabled
Release/sanitizer gates and 41 holdouts. Targeted five-round results versus V5:
1.0844× owners, 1.0136× members, 0.9893× methods. The captured recycle bytecode
shows current/epoch/scale constants traveling through reused key registers;
GETK names them directly. V7 follows dominating LOAD/MOVE/DLOAD definitions
within one basic block and shares these constant-key entries. It stops at
leaders/joins and unknown writes. New tests cover joins, copies, DLOAD's second
write winning, and a scalar receiver with the same raw bits as a cached table.
V7's full correctness gates pass; its unchanged full-mix timing is in progress.

Two general follow-ups are supported by source inspection, not yet implemented:

- Avoid allocating a cache for a group with one site that cannot repeat in the
  activation. It cannot hit and only adds initialization/miss overhead. Count
  compatible sites and conservatively mark every backward-edge interval as
  potentially repeated. Keep groups with multiple sites or loop participation.
  Update the >64-entry fixture to put its distinct reads in a loop, so it still
  exercises the capacity fallback. Root single-store callees are a likely
  beneficiary; confirm in measurements rather than assuming it.
- The precise tier records no pins, undo entries or pending writes, yet creates
  and destroys a full empty SQJitWriteLog per call. Source search shows active_logs
  is used only by journal registration and CanRelease's pin census. A contextual
  release predicate could inspect the existing ancestor chain without registering
  an empty child log. Preserve the old method for unregistered/contextless logs.
  Only when the context has no active ancestor logs may a masked physical
  refcount greater than the combined drop count bypass the scalar-array scan;
  every final drop and every ancestor chain must retain the original proof.
  Add generated-code ancestor-pin/combined-drop witnesses and run shared/x64
  checks before accepting this change. It must not treat helper pins as real
  owners; current GET/SET guards run before helper-local reference copies, and
  LOAD's prototype literal remains a real surviving owner.

These follow-ups target short-call overhead and the remaining release checks.
Native scalar GET fast paths are another option: on a valid cache hit, read the
scalar source first, require a non-owning old VM temporary, move the old
destination's ownership into that temporary and publish the scalar without a
helper. All guards must precede the first VM write. Reference-source and owning-
temporary cases must retain the checked helper until separately proven safe.


## V7 measured checkpoint and V8 experiment

V7's completed fixed-mix study gives 1.296240× aggregate speedup over the audit,
11.819697× Node / 7.847137× GJS geometric time and 39.647304× / 19.236469× p90.
Owners improve 2.709376× and methods 1.833909×. Two event regressions remain:
8.6% more table-event time and 18.1% more class-event time. JIT-on/off penalties
are 1.069189× owners, 1.418752× methods and 1.324953× root_integer. No default
promotion; neither milestone is met. V7 replaces the earlier incomplete-study
status, not the earlier evidence. See its README and full raw results.

The next source experiment removes the precise tier's empty SQJitWriteLog and
adds CanReleaseInContext. With ancestors present it delegates to the existing
full pin census. With none, it accepts masked physical refs > combined drops
before scanning scalar arrays; final drops retain the original leaf/weak/graph
proof. New generated tests pin a combined-SET owner in two ancestor journals
and require a real side exit with exactly one committed prefix. Shared tests
cover pending pins, GC mark masking, weak death and pin-index allocation failure.
This is under validation; no V8 performance result is claimed here yet.


## Source findings for the next native lowering experiment

The unchanged owner recycle function contains 36 bytecodes and nine GET/GETK
instructions. V7 still spends 8.54% of owner self samples in ADD helpers plus
2.09% in ARITH_OP. Native mixed/float ADD/SUB/MUL/DIV is a bounded next option:
integer-only operations must retain machine-word integer behavior, while either
float operand selects binary64, including IEEE division by zero. Bool/reference
operands must keep the checked helper. MOD's float fmod semantics need separate
lowering. Every destination-release and operand guard must precede the first
canonical write. Use signed-zero, NaN/infinity, mixed-integer and side-exit tests.

Array GET can avoid lookup/helper calls when the receiver is an array, its key
is an in-bounds integer, the source is scalar and the old VM temporary is non-
owning. Load the source before writing either destination; move the old logical
destination's tag/bits into the VM temporary without changing its refcount, then
publish the scalar. The old destination itself may own a graph. Reference-source
or owning-temporary cases still need the checked helper. RawValuesOffset and
RawSizeOffset are already available; negative indices must fail before any load.
A generated witness should put userdata into the GET destination and require
its callback at the following JCMP, preserving the prior committed store.

Code size matters: the native emitter has an 8-KiB buffer, and the >64-member-site
fixture requires real native coverage. Optional fast paths must not make a
previously supported large function fall out of native execution. Bound growth
or retry emission without optional fast paths; do not weaken the coverage test.

The root trace confirms counter_work's native loop initially runs but later
backs off: 96 guard failures, 12 backoffs and 139,932 skips in the diagnostic
run. RootCounter follows OwnCounter through that same caller; RootTransform has
a separate caller. There is only one cached loop artifact per prototype/header,
and guard feedback backs off rather than recompiling for a new receiver. This
supports further investigation of receiver transitions; it does not yet identify
a safe replacement policy or establish a measured fix.


## Current checkpoint: V8 complete

V8 is tested and measured, with complete evidence in precise-context-release-v8/.
The fixed mix improves 1.344599× versus the audit; Node/GJS geometric ratios are
11.381029× / 7.550150× and p90 ratios 36.920825× / 17.714817×. There are no >5%
audit regressions in this batch, although class events still take 4.6% more time.
Owners are approximately at interpreter parity (0.995662×), methods are 1.216587×
and root_integer 1.184149× interpreter time. Correctness passes 100/100 in enabled/
disabled Release/strict sanitizers plus 41 holdouts per build; x64 has the same
32 old member-plan failures. All seven fresh profiles have zero lost samples.
CanReleaseInContext is 5.49% of owner self samples; GETK/GET/ADD/ARITH_OP remain
large. This was the V8 checkpoint; the completed V9 continuation is recorded below.

The root-history control now establishes a strong next target: reversing only
case order moves root_integer 285.950→62.685 ns and receiver_integer
53.870→212.955 ns, replicated with four warmups. All algorithms/counts/checksums
are unchanged, but this diagnostic is excluded from the acceptance score.
Both aggregate traces have the same loop guard/backoff counts; they do not
identify the failing phase by themselves. Single-artifact loop specialization
and receiver ordering support the causal interpretation. Keep the original
benchmark order and improve receiver adaptation in the compiler/runtime.

Possible implementation: retain a bounded second loop variant, or safely
recompile after persistent guarded failure. SQJitProto currently embeds one
non-copyable SQJitCode. Install resets/unmaps the prior mapping and releases its
weak references, so replacing it can be unsafe while a recursive/nested native
activation still executes that code. Preserve active mapping lifetime and its
root weak references, guard changed methods/classes, bound recompilation and
allocation, and test alternating receivers as well as phased histories. Do not
bypass the precise artifact's legacy-loop exclusion or weaken release ordering.
Compare both histories, the original full mix, native-route counters and strict
shared tests before claiming this fixes the root regression.


## V9 measured checkpoint and next implementation

V9 retains at most two immutable loop mappings and one optional extra compile
attempt, preserving original code through recursion and alternate allocation
failure. It resolves both root receiver histories in the original benchmark and
four/five-warmup reversed-order controls. Integer-root stores improve 4.5844×
versus V8 and take 0.2617× interpreter time. Generated receiver/method/reentry
witnesses, real allocation faults before/after installation, all enabled/disabled
Release/sanitizer gates and both holdout builds pass. Shared x64 retains the same
32 old assertions. The full source and evidence are in precise-loop-variants-v9/.

The 56-case aggregate improves 1.376612× versus the audit, with Node/GJS geometric
ratios 11.106735× / 7.322802× and p90 36.852984× / 17.778860×. Owners are near
interpreter parity (0.993462×), methods remain slower (1.216516×). Class events
still take 5.97% more time than the audit. The direct V8/V9 control repeats a
1.29% incremental slowdown while complete member-route counters are identical,
with no loop execution or alternate compilation. Its mechanism remains open.

All seven fresh profiles have zero lost samples. Owner GETK/GET helpers account
for 29.45% of self samples; ADD plus ARITH_OP account for 13.36%. The existing
scalar-array GET and mixed/float arithmetic proposals above now have fresh
support. Implement a bounded native fast path with checked helper fallback.
GET must preserve the VM temporary ownership transfer, including owning logical
destinations and aliased receivers. Arithmetic must preserve integer-only word
semantics and mixed binary64 behavior, including signed zero, NaN/infinity and
floating division by zero. Every fallback guard precedes canonical writes.

The emitter has an 8 KiB buffer. Optional lowering must not turn a previously
compiled large function into fallback solely through code growth: use a bounded
fast-path budget or retry emission without optional lowering. Keep the >64-member-
site native-coverage witness effective. Source inspection confirms existing
binary64 emitters for load/store, signed integer conversion and ADD/SUB/MUL/DIV;
float MOD remains a separate fmod operation. That was the V9 checkpoint; V10/V11 are now implemented and recorded below.

VM execution remains 56.34% of member and 40.29% of method self samples. After
safe scalar fast paths, investigate call/loop eligibility and short-method costs;
do not simply disable the JIT. Preserve the legacy-loop exclusion for precise
whole functions. The milestone, default promotion, existing x64 repairs, full
Node/GJS targets and eventual fresh matched PGO/LTO confirmation remain open.


## V11 measured checkpoint and next work

V10 lowers scalar array GET and mixed/binary64 arithmetic, retaining helper
fallback and code-buffer retry. V11 applies the existing no-ancestor/non-final
release proof directly to an owning VM temporary. Marked counts, weak death,
ancestor pins, aliasing, GET/JCMP release order and code-size coverage have native
tests. Both versions pass four 100/100 gates and 41 holdouts per build; x64 retains
the same 32 preexisting member-plan assertions. V10 is a targeted/profiled
checkpoint, not a full-mix score. V11 has the completed full acceptance study.

V11's full-56 speedup is 1.431996× versus the audit, with Node/GJS geometric
ratios 10.665116× / 7.054688× and p90 31.999971× / 15.735258×. No >5% case regression
occurs in this batch, but class events remain 3.36% slower. The second application
seed is 0.999427× audit speed. Direct V9/V11 four-warmup comparisons give 1.178525×
owners and 1.029302× methods. On/off time ratios are 0.842822× owners, 1.180504×
methods and 0.261882× root_integer: methods and the <2× aggregate still block the
first milestone. Final targets, default promotion and fresh matched PGO/LTO are
also unmet.

Fresh owner self samples: GETK 18.13%, constant GET 2.61%, dynamic GET 3.47%,
constant SET 10.99%, other SET 5.25%, LOAD 9.02%, and contextual release 5.54%.
All seven profiles have zero lost samples. Recycle has a 208-byte frame and actual
floating/non-final-drop native instructions; transfer/publish frames are 176/144
bytes. The five native captures and checked helper-bypass controls are archived.

The next bounded lowering option is a scalar read from a validated activation-
local member-cache hit, reusing the array path's source/temporary release proof.
Validate owner/tag and dynamic key before touching the cached slot; retain
reference/weak sources and misses in the helper. Invariant parameter owners may
later support entry-time raw-slot resolution, only when full-CFG writes prove
they remain unchanged and the no-call/no-structural-mutation contract holds.

VM execution is still 57.64% of member and 41.02% of method self samples. Their
callee success counts do not establish native loop coverage: the traces show
zero native loop executions and static rejection of internal branches. See
canonical-loop-entry-next.md for a separate canonical-region route, validated
resume statuses, bounded header state and retained release/call-boundary tests.
Do not enable the old private-spill loop takeover for precise artifacts. That was the V11 checkpoint; V12 is now recorded below. Preserve all frozen V9/V10/V11 evidence and the
unchanged benchmark mix while continuing toward the complete goal.


## V12 checkpoint and next implementation

Native scalar member-cache hits are implemented and verified. The full-mix
speedup is 1.437964x audit, Node/GJS geometric ratios 10.612662x / 7.023121x,
p90 30.734116x / 15.500620x. Both warmup histories confirm ~4.3% owner gains and
~2.5% event gains versus V11, but transfer methods lose ~2%. On/off ratios remain
0.808679x owners, 1.184261x methods, 0.262060x integer roots. Neither milestone
is complete. All four 100/100 gates and 41 holdouts per build pass, with exactly
the same 32 x64 assertions. Seven fresh profiles have zero lost samples.

Next implement owning-source GET in the bounded precise tier if its lifetime
proof holds. V12 cache hits on reference-valued fields currently repeat lookup
in the helper. Read the saved precise-native-cache-v12/next-reference-read.md
before implementation: source pinning must precede a proven non-final temporary
drop, with alias-aware counter loads, exact GC marks and no added pin weakening
the original release guard. Keep weak sources, final drops and active ancestor
journals in checked paths. Require native helper-bypass positive controls and
userdata/weak/alias/prefix witnesses before measuring. That was the V12 checkpoint; V13 is now implemented and measured below.

Owner GETK still takes 13.64% of self samples; constant SET 11.23%, LOAD 10.14%,
contextual release 6.28%. Native reference reads are only one remaining cost.
Broader canonical loop coverage remains the larger separate task: method/member
VM execution is 40.07% / 56.42% and native loop executions remain zero. Preserve
the distinct continuation status and no-replay requirements in
canonical-loop-entry-next.md; do not enable legacy private-spill takeover.

Preserve V12's frozen executable and full evidence, unchanged 56-component mix,
both seeds, varied warmups and independent holdouts. Do not treat the 1.438x
checkpoint, removal of owner/root regressions, or subset improvements as goal
completion. Default promotion, x64 repairs and matched fresh PGO/LTO remain open.


## V13 checkpoint and next implementation

Owning-source array/cache GET is implemented with source pinning before temporary
drop and alias-aware count reload. Native lifetime witnesses, four 100-test gates,
41 holdouts per build and the unchanged x64 failure set are verified. Both warmup
histories confirm 13.5% owner and 4.1% method gains versus V12. Full-56 speedup is
1.474809x audit; Node/GJS geometric ratios 10.319610x / 6.821332x, p90 27.179286x /
15.026729x. On/off time ratios remain 0.711996x owners, 1.138319x methods and
0.261081x root_integer. Neither milestone is achieved.

The full seed17 study retains a 12.97% records_4096 slowdown. The direct control
finds a 17.57% median difference between identical V13 labels; seed83 controls are
much closer. This does not establish a repeatable V13 code regression, but the
variance source is unresolved. Keep the original component and raw samples in
the score. Do not declare the regression resolved or overwrite the initial data.

Fresh owner GET helpers fall below 0.5%; LOAD is 13.68%, constant SET 11.49%, DLOAD
5.67%, contextual release 5.64%, JCMP 5.27% and other SET 4.77%. A bounded V14 option
is native copy/store publication when the destination release is proven non-final,
reusing source-before-drop and alias-aware count logic. LOAD/MOVE and stores must
retain exact release order, ancestor accounting, helper fallback and code-budget
coverage. DLOAD and SET result writes require combined-drop proofs; do not silently
apply a single-destination guard to multiple aliased outputs.

Broader canonical regions remain the larger task: method/member VM execution is
44.27% / 57.27% of samples. Read precise-native-reference-v13/canonical-region-continuation-note.md together with canonical-loop-entry-next.md. A side exit back
to the current header must execute that bytecode in the VM once, not immediately
retry the same failing native entry. Calls, preparation, stack movement, mapping
lifetime and precise error continuation retain their separate requirements.

That was the V13 checkpoint; V14 is now recorded below. Preserve the frozen V13 measurements, earlier evidence,
the 56-component mix, both seeds and holdouts. Default promotion, x64 repairs,
records-variance resolution and fresh matched PGO/LTO remain outstanding.


## V14 checkpoint and next implementation

Native single-destination LOAD/MOVE copies are implemented with pre-pin release
guards, alias-aware count reload and weak-object identity. Four 100-test gates,
41 holdouts per build and the unchanged x64 assertions are verified. Both warmup
histories show ~10% owner and ~5.5% method gains versus V13. The full-56 result is
1.519989x audit; Node/GJS geometric ratios 10.035920x / 6.659229x and p90
26.467130x / 14.550669x. On/off ratios are 0.646362x owners, 1.073560x methods and
0.261589x root_integer. Neither milestone is complete.

No >5% case regression occurs in either seed in this batch, but records variance
remains open; preserve the V13 discrepancy and control data. The corrected weak
probe passes raw weak objects directly and verifies their source and return tags.
The initial source-array probe dereferenced its weak entries and is not evidence
of weak-object copying. The C++ direct weak tests remain authoritative as well.

Fresh owner profiles put LOAD/MOVE/GET helpers below 0.5%. Constant SET is 14.66%,
DLOAD 8.67%, PINCL 8.64%, other SET 5.51%, JCMP 4.80%, contextual release 4.80%.
Method/member VM shares remain 44.27% / 59.13%. Table_apply/apply now map 8192 bytes
instead of 4096, although local frames are unchanged and member timing is flat.

Next consider sharing the repeated cold precise-exit publication/epilogue to
recover code space, then native existing-slot SET when no separate result write
is needed. Read precise-native-copy-v14/next-stores-and-code-size.md. Keep every
release guard before source acquisition, reload aliased counts, preserve weak
assignment semantics, and retain the helper for structural mutation, sensitive
releases and multi-output cases. Do not weaken combined-drop or no-replay tests.
Broader canonical regions and call boundaries remain the larger follow-up;
V13's continuation note still applies. No V15 code is implemented.

Preserve the original 56-component mix, both seeds, holdouts, previous binaries
and all raw evidence. Default promotion, x64 repairs, records-variance resolution
and matched fresh PGO/LTO remain incomplete. Keep the complete goal active.

## V15 checkpoint and next implementation

V15 shares the cold precise-exit return without changing hot lowering. Its five
captured functions save 2932 emitted bytes; the two member callees return to
4 KiB mappings. Eight distinct error continuations and all retained witnesses
pass. Direct V14/V15 throughput is approximately flat, and no case regression
above 5% appears in full56, the second seed or either warmup control.

Implement native single-output existing-slot SET next; see
precise-shared-exit-v15/next-native-store.md. Recycle has four eligible SET sites
and 1452 bytes of buffer headroom, but actual emitted fit and helper bypass must
be checked. Retain multi-output helpers and release/alias/weak/ancestor proofs.
See intrinsic-coverage-followup.md for guarded builtin coverage as another
bounded option before or alongside general canonical regions. No V16 code is
implemented. The full target, method regression, x64 failures, timing variance
and matched PGO/LTO confirmation remain open.

## V16 checkpoint and next implementation

V16's native existing-slot SET improves owners 22.7–22.8% over V15, bringing the
full mix to 1.571985665x audit speed. The method interpreter regression remains,
and publish_table worsens 2.3–3.4%. See precise-native-store-v16/README.md for the
full metrics, strict checks, native helper bypass and append-regression controls.
No baseline component or sample was replaced.

First evaluate cold-cache-followup.md: omit only statically impossible cache-hit
paths, keeping direct array paths, helper cache population, later same-group hits
and all loop-first sites. Consider both reads and stores. Then evaluate
invariant-cache-followup.md using complete bytecode write facts. Current owner
profiles put PINCL at 10.12%, DLOAD 9.78%, and JCMP plus comparison helpers above
10%; each native lowering needs its actual single/multiple-output and temporary
release proof. Broader guarded builtin and canonical-loop/call coverage, x64
repairs, timing-variance investigation and matched PGO/LTO remain open. No V17
code is implemented. Preserve the complete original goal.

## V17 checkpoint

V17 implements the cold-cache and fixed-parameter proofs, with full56 speedup
1.584081995x audit. See precise-cache-proofs-v17/README.md for both warmup
histories, per-case limits, profiles and strict validation. No baseline component
was changed. The full performance goal remains active.

Next evaluate comparison-followup.md against the fresh owner profile: integer
JCMP must assign the actual VM temporary and preserve final-release side exits.
Do not enable legacy private-spill loop takeover for precise functions. Broader
native call/builtin coverage, x64 repairs and matched fresh PGO/LTO remain open.

## V18 checkpoint and validation correction

See precise-integer-compare-v18/validation-correction.md before relying on earlier
targeted-test claims. The corrected guards execute ten AArch64 generated-code
groups and the loop lifetime/adaptation contracts; independent host checks catch
future skipped bodies. Preserve the new weak lifetime guards and compact fallback,
the original fixture coverage, and all strict gates. Full56 speed is now
1.610484881x audit; the performance goal remains active.

Select further work from the fresh V18 profiles. Native PINCL and DLOAD require
combined output/release proofs; wider canonical loop/call and guarded builtin
coverage remains necessary. Do not substitute more owner-only wins for the full
56-component target. x64 repairs and matched fresh PGO/LTO remain open.

V18 controls identify a concrete next cost: eight emitted instructions per
closure-lifetime guard. Fold the weak witness check into the already-required
closure guard helper or use a cheaper local type-bit encoding, preserving its
check point and weak lifetime. Activated address-reuse contracts must stay green.
See precise-integer-compare-v18/regression-investigation.md for both warmup
histories, extra branch/filter costs and unresolved array-append variance.


## V19 checkpoint

Closure weak checks now run inside the existing identity helpers. Preserve the
new native-closure address-reuse test and V18's activated test requirements.
Review closure-witness-guards-v19/README.md and the fresh profiles for the measured
limits. Postfix increment currently falls back when its result destination owns
a reference: consider the existing checked non-final assignment proof, guarding
the integer source and every release before either publication. Same-slot
post-increment and final-release/ancestor cases need explicit generated witnesses.
Also investigate loop-guard-followup.md and weak-identity-followup.md in the V19
evidence: repeated borrowed lookup and closure guards account for 26.24% of the
fresh float profile. Pressure remains 2.3–3.4% slower than V18 despite smaller
code. No unmeasured hoist or replacement identity scheme is accepted.
Wider canonical loop/call coverage, x64 repairs, array-append variance and matched
fresh PGO/LTO remain open. Preserve the unchanged full goal and benchmark weights.


## V20 rejection and required hardening

V20 is not accepted: its new unused-receiver path releases a final-owned old
temporary after publishing the loop result. Add an entry non-reference guard for
every elided receiver/result destination and prove an unchanged parameter owns
the receiver. Require the new raw-frame publication witness and fresh gates and
timing before promotion. V19 remains the previous validated candidate.

The V20 prototype validates fixed root/parameter callees once per activation.
The full loop and all inlined callees must preserve the documented no-effect
proof; do not extend it to unknown calls or mutations. Keep the new entry guard
and unused-receiver tests, actual closure/native-closure address reuse, and V18's
activated groups. The paired decoder and lookup counts are in the V20 evidence.

Choose the next implementation from fresh profiles and the unchanged full56
results. Reference-destination PINCL, scalar register residency, and wider precise
loop/call coverage remain candidates; method interpreter overhead remains a major
gap. Preserve pressure and array-append controls and all open x64/PGO requirements.


## V21 validated replacement

V21 adds mandatory entry rejection for owning receiver/result destinations and
requires an unchanged canonical parameter to retain the elided receiver source.
The V20 failure remains archived; the same witness and new native final/nonfinal/
ancestor tests pass V21. Fresh full56 measurements and seven profiles are archived.

Use V21 as the next control. Choose further changes from its measured tail and
profiles. Wider precise call/loop coverage, reference-destination PINCL and scalar
register residency remain candidates. Preserve method profitability, pressure and
array controls, active generated-code groups, all lifetime/rollback gates, and
outstanding cross-backend and matched-PGO requirements. Do not attribute anonymous
native samples to GDB addresses from another process.

The additional V21 instruction profile now supplies a concrete next target:
1389 of 2112 native sampled IPs are stack load/store instructions (65.77%). The
same-process capture includes mapping lifetimes; all seven mappings structurally
match the frozen float-loop captures. See V21 `register-residency-next.md` and
`native-instructions/README.md`. Investigate bounded private float slot residency
while preserving helper clobbers, frame publication and rollback. PMU samples do
not establish exact instruction latency or attainable gain. Method dispatch and
owner PINCL/DLOAD remain separate costs; all earlier completion requirements stand.


## V22 private-slot forwarding

The next control is V22. The postpass covers caller and inlined-leaf private slots,
materializes at all branches/helper/alias boundaries, retains final direct stores,
and uses typed float copies. Expanded native tests and exact pre/post/installed
captures validate branch relocation, frame materialization and bit preservation.
Do not extend scratch lifetime across calls or joins without additional proof.

First use the repeated filter_stream regression and same-executable float-copy
ablation to restrict typed copies to successfully forwarded regions. Preserve
the full score including this regression. Then use the fresh instruction profile
to choose the next change.
Conditional boundaries and register moves remain potential native costs; owner
PINCL/DLOAD helpers and method VM dispatch remain independent larger gaps. Preserve
method profitability and all tail/regression controls. Existing x64 defects and
matched PGO/LTO remain required; do not redefine the full objective around float
microbenchmarks.


## V23 transactional float-copy conversion

Use V23 as the next control. GP copies remain intact unless scalar forwarding
succeeds; ten filter_stream instructions are restored, and eight paired forwarded/
array artifacts remain unchanged from V22 after relocation masking. Full timings
and both-seed controls are in the V23 artifact; preserve all regressions and tails.

Next use method/member VM samples for broader safe native coverage. Owner
PINCL/DLOAD and float register moves remain concrete local costs. A new canonical-
frame loop entry needs exact continuation and release semantics; do not enable
legacy private-spill takeover. Existing x64 defects and matched PGO/LTO remain open.

## V24 completed; V25 identity-preserving publication in progress

[V24 frozen evidence](precise-length-v24/README.md) retains all full56,
profitability, warmup4/5 controls, both application seeds, seven full profiles,
native captures and an isolated append probe. All measurement processes are
terminal. The combined control reporter was repaired to allow the extra Node
float-control column; successful timings were not repeated.

V24 is rejected as a performance candidate: array append repeatedly takes
about 31% more time than V23. Full56 still measures 1.806949370× audit, with
Node/GJS geometric ratios 8.455109/5.589492 and p90 24.873326/13.421299.
Preserve the ownership fixes and both receiver/callee regression witnesses.
Four 100-test runs, both 41-holdout sets and resource-failure retry probes pass;
x64 still has the same 32 known assertions. V23 is the last accepted performance
control. No matched PGO/LTO yet; all full-goal targets remain open.

The isolated probe finds one extra receiver-publication helper per append.
V25 first tests exact type/pointer equality before private, unstaged reference
publication: a self-assignment leaves its existing real owner and rollback state
intact. Changed destinations retain journal publication; GET/staged paths retain
their original semantics. This avoids relying on deadness or removing real
prepared owners. The V24 source is backed up in /tmp/sqgi-precise-before-v25
with all 96 hashes verified. No V25 performance result is accepted yet.

V25 is now frozen in identity-publication-v25, SHA256
10d209d2d40cd5114412c691c362f94753b06196280e5c78c80c87b728d75699.
All four 100-test gates, both 41-holdout sets and resource-failure probes pass;
x64 retains the same 32 known assertions. Both five-round kernel controls
(warmups4/5) restore append to ~126 ns and retain the math intrinsic improvement,
with no >5% kernel regression. Actual capture verifies 319 native appends with
only two receiver publications (one per invocation), using six new instructions.
The full56 study, profitability, seven fresh profiles, broader controls and
final acceptance remain. Captures and subsequent measurements must run serially;
confirm each live tool handle's terminal state before starting a dependent job.

V25 acceptance complete: job68500 terminated successfully, including all paired
controls. No full56 or control regression >5% appears in either warmup history or
identical candidate repeats. V25 is now the accepted control (full56 1.825291247×;
Node/GJS geometric 8.382561/5.554487, p90 24.228039/13.532819). Seven profiles have
zero lost samples. Methods still average 1.042785× JIT-off. V26's two-file draft
is ready to apply after verifying the current source against the frozen V25
manifest; it has not yet been compiled or measured.

V26 is applied and passes the 100-test release-enabled run and all thirteen
native groups. Owner native tracing removes 380/380 PINCL helper calls; 112
code-size fixtures execute and twelve prove same-tier fallback at 8 KiB.
Resource-failure probes, including the new PINCL install path, pass. Owner/member
pilot timings (warmups5/4, five rounds and an identical candidate repeat) are now
running; do not start builds or diagnostics until their live handle is terminal.
The remaining gates and full56/profile/control cycle still follow.

V26 pilots completed and their process is confirmed terminal. Both owner
warmup histories and repeats use 0.869–0.870 of V25 time; members are unchanged
(0.997–1.003). No >5% pilot regression. Raw pilots and verified summary are
archived in the V26 work-in-progress directory. Remaining gates have started.

V26 is frozen as owning-postincrement-v26 (80926f469e88e85b0311f03ad81e570b75bb4d7fd4222feb402380f96e970855).
All four 100-test release/strict-sanitizer runs and both 41-case holdout sets pass;
x64 has the same 32 known assertions. Six native captures verify 137 exact resume
guards. Recycle grows by 48 bytes to 7344; all other captured precise functions,
math entries, loops and append code remain unchanged after pointer normalization.
Full measurements have not started yet; a short method lookup probe is running.

V26 full56 timings are complete: 1.866476378× audit; Node/GJS geometric
8.186695/5.425420, p90 24.987213/13.449750. No >5% full56 regression.
Profitability/profiles are still running under tool session32993; confirm its
terminal state before diagnostics or controls. Prepared next: complete method
GET/GETK/SET and application entry/loop/call-helper probes, then V26 controls.
An uncompiled V27 cold literal lookup draft and native test group are archived
in cold-literal-lookup-v27-work-in-progress; production remains frozen V26.

V26 full study/profile process32993 is confirmed terminal0. All seven profiles
have zero lost samples. JIT-on/off ratios: owners0.395969, methods1.040916,
root_integer0.265052. Completed method tracing counts252 constant member
helpers, all first-bucket hits. Application tracing confirms4/2/2 successful
native loops and zero native-closure call helpers for route/pricing/filter.
The application probe's temporary-breakpoint bookkeeping failure is retained
and corrected with persistent return breakpoints plus matched pending entries.
Both diagnostic processes are terminal. Controls now run under session91154.
Do not start builds, tests, GDB or other profiling while those timings run.

V26 acceptance is complete: all controls and seven profiles pass, with no >5%
full56 or paired-control regression. Latest accepted full56 is1.866476378×audit;
Node/GJS geo8.186695/5.425420,p9024.987213/13.449750. The V27 cold literal lookup
draft remains outside production. Next verify the frozen base and back it up,
apply the two-file draft, build and debug the new native contracts, then verify
helper elimination, same-tier budget fallback and resource retry before pilots.

V26 is accepted and archived: 813 local artifact hashes and 6704 global hashes
were verified, including unchanged V24/V25 seals. V27 is now applied from a
verified96-file V26 backup at /tmp/sqgi-precise-before-v27. Release-enabled100
and14 native groups pass. CandidateSHA368d035b336f997a7f5a5e6a5bdbf7fa092ce53aa1d8f59e9ddb476f848eecfa.
Actual method tracing removes252/252 constant member helpers with84/84 native
success returns. All56 budget fixtures execute;14 refined cases prove same-tier
fallback. All9 resource cases pass after correcting a missing test interposer.
Remaining correctness gates are running; do not start timing before their
process is confirmed terminal. V27 six pilot runs are prepared but not started.

V27 now passes four 100-test runs, both 41-case holdouts, fourteen native groups,
nine resource cases and all six pilot groups. Methods use 0.935393–0.936459 of
V26 time; owners/members stay within 0.4%. Candidate is frozen as
cold-literal-lookup-v27, SHA368d035b336f997a7f5a5e6a5bdbf7fa092ce53aa1d8f59e9ddb476f848eecfa.
Full timing/profitability/profile pipeline is live under session36645. Captures
and controls remain pending; scripts are prepared under /tmp/sqgi-v27-*. No V28
production edit has been made. Code-size and DLOAD leads are recorded in the
V27 work-in-progress directory for evaluation against fresh profile evidence.

An unapplied/uncompiled V28 shared-helper draft is now archived at
shared-helper-v28-work-in-progress. It tries shared cold helper argument setup
only after all established layouts fail at a tier, preserving fast paths within
the existing 8 KiB buffer. Emission-complete marking follows trampoline emission
so tail overflow retains retry; resource-install failure still stops retries.
Do not apply until V27 fresh profiles and the prepared emission-tier probe supply
the next evidence. Production still hash-matches frozen V27.

V27 controls are complete but acceptance is HELD for records_4096 seed83.
Both warmup histories flag a different V27 copy at~8% overV26. The other copies
are-2.1%/+3.5%. An actual native probe shows identical2100-byte record_updates
loops and4successful returns in both versions; this is not a timing explanation.
Predeclared replication9296 is live:4blocks×5rotating rounds×both warmups,
identical copies of both versions, unchanged8application cases. Preserve all
original results and inspect the saved analysis policy before acceptance.
The V28 two-file draft is still unapplied; all96production hashes remainV27.

V27 acceptance is complete. Latest full56 is 1.878306123×audit;
Node/GJS geo 8.123046/5.399528, p90
23.026169/12.619815. All controls and seven profiles pass.
Use fresh profile evidence to select the next general improvement; preserve
precise ownership/exit checks and same-tier code-size fallback. Matched PGO/LTO
and the full goal remain outstanding.

V27 is ACCEPTED after fixed records_4096 replication resolved initial flags:
new-only ratios1.001013/0.998660; including original flagged controls,95%upper
bounds1.017432/1.030123. All original runs retained, full56unchanged1.878306123×.
V27local611files and global7677entries were verified before startingV28.

V28 shared-helper is now applied; backend unchanged since first application,
native test accessor and fit count corrected (24adds; original failures retained).
15native groups and100release tests pass. Buffer code now uses sharedtier3,
otherfivecanonicalcapturesunchanged. Remaining release/default,strictASAN,
holdout,x64gates run in session84296. No timing yet. Next confirm that handle
terminal, then probe shared-trampoline tail overflow and resource failure,
verify helper reduction on buffers, and run unchanged paired pilots.
