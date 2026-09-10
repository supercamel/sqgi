# Source findings for broader native loop coverage

This is a follow-up design note, not implemented or accepted compiler behavior.
The active performance goal retains its full 56-component and correctness scope.

The V10 method trace records 840,126 native callee returns, but zero native loop
executions. The main methods loop is rejected for an internal branch; its other
path calls publish or transfer. The member suite similarly rejects the event
loop's class/table branch. AArch64 compile_loop explicitly rejects every JMP,
JZ or JCMP except its chosen header exit and final backedge (currently around
line 239). This is a structural limitation, not receiver-guard churn. V11's full
profiles should guide the next implementation priority.

One substantial route is a separate canonical-slot loop artifact, reusing the
precise compiler's actual GET/JCMP lifetime semantics. A region can execute both
internal branch paths and leave before an unsupported CALL or allocation, with
the committed prefix and canonical slots intact. The interpreter handles that
instruction; a later backedge may enter native code again. This could move the
loop's indexing, arithmetic and supported stores into native execution even
when its calls remain in the VM. It must be measured: native entry/cache setup
on every iteration may outweigh the saved dispatch for small prefixes.

Required distinctions and checks:

- This is not permission to enable legacy loop takeover for precise artifacts.
  The old private-spill/journal path still violates the retained temporary-
  release witness. A new route must execute the canonical helper/native release
  semantics and pass that exact generated witness, including callbacks before
  the following comparison/member read.
- Native region exit after effects must be reported as resumed execution at a
  validated IP. The current bool loop API cannot treat it as ordinary failure:
  returning false would replay the header. Invalid continuation metadata must
  raise without replay. Use a status that the VM backedge handler can distinguish
  from no artifact. Normal loop completion and a CALL boundary must also remain
  distinguishable in diagnostics from entry guards/backoff.
- A region needs a real unchanged VM frame, correct closure/stack base/depth,
  and its own native signature/metadata. Raw frameless callers must never enter
  it. Do not put a precise-entry function behind the legacy loop function type.
- All values are canonical at a boundary. Activation-local member caches die
  before the VM call and are rebuilt after entry; neither stack nor container
  addresses may survive a call, allocation, resize, or reentry. Code mappings
  remain alive while any native activation can return through them.
- Emit only validated region branches; exits outside the region publish the
  exact next bytecode. Preserve literal-dominance boundaries from the full CFG.
  Test both branch outcomes with native effects, not only a native prefix that
  immediately exits at the first branch.
- Avoid poisoning later hot loops by caching only an early initialization loop.
  Use bounded per-header state and separate static rejection from the existing
  private compiler's rejection cache. Preserve profitable private loops and V9's
  receiver variants. Code/mapping growth and entry overhead require measurement.
- Unsupported operations must exit before their effects. Test CALL errors,
  nested VMs, stack growth, method replacement, weak death, source/destination
  aliases, and callback-visible stores across interpreter boundaries. Keep the
  old rollback and precise-prefix tests separately authoritative.

A smaller independent option is native scalar reads from activation-local raw
member-cache hits. Current cache lifetime proofs already exclude calls,
allocation and structural mutation during an activation. Reuse the scalar
source/temporary-release proof, validate owner and dynamic-key identity before
reading a cached slot, and preserve the helper for reference/weak sources and
misses. Invariant parameter owners may eventually support entry-time raw-slot
resolution, but only after proving they are not overwritten across the region.
This must not silently extend the cache proof across an interpreted CALL.

Neither proposal replaces full-mix/both-seed timing, interpreter profitability,
strict sanitizer/native-route gates, existing x64 repairs or fresh matched
PGO/LTO confirmation. No V12 code has been implemented.
