# Next ownership experiment: precise exits from real VM frames

This is the original preimplementation outline. Experimental implementations
now exist in [canonical-v1](precise-canonical-v1/README.md) and
[scalar-v2](precise-scalar-v2/README.md); neither is promoted to the default tier.
The remaining acceptance work is tracked in [precise-next-steps.md](precise-next-steps.md).
The retained scalar-array proof removes most owner pin-census cost, but fresh
sampling still assigns 37.25% of owner self cycles to RecordStackSlot and
RetainValue. Dense snapshot indices and reciprocal division were measured and
rejected. Further small arithmetic changes do not address this dominant cost.

The next substantial experiment should evaluate native whole-function code
that resumes the interpreter at the failing bytecode, preserving completed
effects, instead of journaling and replaying the entire function. Begin with a
bounded subset: real VM frames, ordinary typed arithmetic/branches and guarded
existing-member/array reads and writes. Exclude allocation, structural mutation,
calls, scalarized object programs and unmodelled bytecodes initially. Selection
must follow supported operations and effect proofs, never workload names.

## Required contracts

1. Add an explicit native side-exit status and a validated resume bytecode IP.
   `sqjit_try_execute_current` can update the existing `ci->_ip` and return to
   VM dispatch. A frameless direct call has no resumable callee frame: mark such
   artifacts as requiring a frame and reject frameless/inlined entry into them.
   Merely returning the existing guard-failed status would replay committed
   writes and is incorrect.
2. Keep ordinary entry guards on the unchanged-entry fallback path. A guard
   during parameter preload may fire before later native spill slots are
   initialized, so it cannot use a normal instruction's exit map.
3. Map instruction guards to their **incoming** state. Materialize live scalar
   values with their correct tags; reference values must have real owners in
   canonical VM slots. A failed GET must not flush its newly computed result
   over an incoming scalar operand that the interpreter needs to retry.
4. Put readonly release-effect prechecks before any overwrite of a native
   destination spill. For guarded raw reads, checking a future drop early can
   be safe; performing the release before the read is not. Preserve GET's
   read-then-temporary-release-and-swap behavior exactly.
5. Preserve the VM temporary effect of JCMP as well as GET. Native CMP currently
   branches without modelling all temporary releases. Non-owning temporary
   tags can permit elision; an observable drop must exit before the comparison.
   Add a release-order witness rather than assuming existing GET tests cover it.
6. Shared release checks still need ancestor-journal pins and pending writes
   excluded from program ownership. A no-replay journal mode must not simply
   bypass CanRelease or treat pending references as real owners. Structural
   mutations and helpers that can fail after effects need an explicit contract
   or must stay outside the initial subset.
7. No code mapping may be freed while an outer native activation can return to
   it. Any later guard-driven recompilation policy needs active-code lifetime
   tracking; resetting a shared prototype on an inner/reentrant miss is unsafe.

## Tests before performance acceptance

- A late failing guard after several stores must preserve each earlier store
  exactly once and resume at the correct instruction.
- GET with destination/input aliasing and a failing temporary release must
  retry using the incoming scalar value, not a partially computed result.
- Direct and wrapped release hooks, weak observers, receiver/root fallback,
  aliased member destinations and changing branch tags must agree with JIT-off.
- JCMP must release an observable previous temporary at the interpreter's point.
- Frameless callers, native callers, root entry and tail calls must obey the
  frame requirement; reentry into another VM must not resume the wrong frame.
- Existing stack bounds, cleanup, rollback, allocation-failure and shared x64
  checks remain enabled. Unsupported paths retain their existing checked route.
- Positive witnesses must assert the new native route and a real side exit;
  interpreter-only success cannot establish the contract.

First measure owner and method workloads against the frozen audited and retained
builds with native success/exit counts. If this eliminates enough journaling to
produce a substantial gain, extend coverage and repeat the unchanged full
56-component study, both application seeds, varied warmups, sanitizers, and
eventual matched PGO/LTO confirmation. The overall performance goal remains active.

After the exit contract is proven, use the same effect restrictions to examine
hoisting stable existing-field addresses and array backing pointers. Existing
slot writes do not rehash tables or resize arrays, but dynamic element tags and
aliasing still need guards. This could remove repeated helper calls beyond the
journal savings. A no-ancestor-pin proof may also permit inline non-final
reference-count checks, preserving GC mark-bit masking and falling back to the
shared release predicate whenever the proof does not hold. These are separate
follow-up experiments, not assumptions that justify skipping current checks.
