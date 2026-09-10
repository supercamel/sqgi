# V20 implementation and proof limits

This iteration follows V19's verified mixed result. The complete performance goal,
full56 weights, both application seeds, correctness gates, and frozen earlier
artifacts are unchanged. The implementation changes compile_loop.inc and extends
the existing contracts/intrinsic tests; no benchmark is edited.

## Entry guard reuse

A conservative allowlist admits scalar operations, control flow, scalar literals,
and existing call lowerings. Heap reads/stores, allocation and unknown operations
reject the optimization. Every inlined closure must satisfy SQJitLeafPlan::Eligible,
which excludes heap access, outer/default/generator state, backward edges and
reads/writes of its receiver. Existing audited numeric math/conversion/length
lowerings cannot reenter the VM. Any new call lowering must preserve that proof
or invalidate scalar_guard_region.

Only a canonical parameter slot never written anywhere in the loop qualifies as
a guard receiver/callee. Root receiver aliases carry canonical slot zero. Borrowed
lookup remains the existing helper, including root/delegate provenance and V19's
retained weak lifetime check. No strong callee pin is added. Entry guards deduplicate
only matching receiver register, literal index, weak witness and closure type.

After complete emission and the whole-region proof, entry transfers to copies of
those guards after the final epilogue and returns to the loop header. Guard failures
reach the original rollback path before any body effect. Repeated sites branch
past their original checks. Original bytes remain unreachable at bypassed sites;
this avoids a general native-code compaction/relocation change. Every copied
argument/helper constant is unchanged, and failure branches are relocated explicitly.
If optional copies exceed the 8192-byte buffer, retain per-site checks. No entry
cache or borrowed address survives an activation. Live code retains weak witnesses
and the existing root witness; installation failure preserves previous mappings.

## Direct closure parameter receiver preparation

A new native coverage assertion exposed an existing MOVE/DMOVE problem: preparing
a direct closure call's table receiver demanded OT_INTEGER. V19 also produces zero
native successes for that fixture. The saved pre-fix GDB capture records the type
failure at offset 300; its pre-fix executable was not separately frozen. V19's
retained engine was used independently with the new test executable to establish
the preexisting failure (`sqgi-precise-v20-v19-contract-control.log`).

The fix permits a private stack-object alias only for the immediately following
CALL's receiver/result slot, when its scalar leaf never accesses `this` and a full
leaf plan proves scalar arguments and result. The CALL overwrites that slot with
a scalar result; no live reference writeback is omitted. The callee identity guard
still runs before specialized execution. DMOVE's second source observes its first
assignment. Rebinding to a callee that uses `this` falls back and retains normal
receiver semantics.

If a later inlined callee defeats whole-loop purity after this preparation, compile
once more with both optimizations disabled, before installing any code. The mixed
fixture confirms the original unsupported-loop fallback and correct stores/results.
The first test expectation incorrectly required an installed in-loop mapping for
this unsupported shape; the retained failed gate and corrected explicit rejection
assertion document that correction. Native-success assertions for supported pure
parameter calls and the mutation-negative fixtures remain required and pass.

## Direct route evidence

The separate checksum-checked route script uses 7, 19 and 37 iterations. V19's pure
root loop performs 126 lookup helpers across three native entries. V20 performs
three helpers across three entries. The primary-map instrumentation observes ten V19 parameter entries that fail
before their closure helper; the diagnostics include its alternate mapping and
report twelve total attempts, eleven failures and one success. V20 has three
parameter entries, all successful, and one helper per entry. Existing/new compiled-loop counters and the native
closure lifetime fixture require actual native success; this is not inferred from
code installation alone.

Positive tests cover duplicate sites, fixed closure parameters, ordinary and
native closure address reuse, weak death, empty loops, and rebinding to scalar and
receiver-using callees. Negative tests cover root mutation through an alias,
inlined heap mutation, and a later effectful callee. Independent AArch64 host checks
require the new test group to run, alongside V18's ten precise groups and all earlier
adaptation/lifetime contracts. Release and strict sanitizer checks remain separate
from accepted timing and from debugger/profile work.
