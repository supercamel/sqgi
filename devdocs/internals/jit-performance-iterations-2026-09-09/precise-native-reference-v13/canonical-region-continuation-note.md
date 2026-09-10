# Canonical loop continuation considerations after V13

Design findings only; no new loop runtime implementation is claimed. The
existing canonical-loop-entry-next.md requirements remain authoritative.

The VM currently calls the loop hook while executing JCMP/JZ, with ci->_ip
already pointing one instruction beyond that header. A new region may complete
several iterations and then exit before this same header's temporary release.
Blindly setting ci->_ip back to the header and continuing can immediately retry
the same native failure. An explicit result must distinguish resuming another
bytecode, executing the current header in the interpreter, and a genuine entry
miss. Do not overload rollback-oriented failure to describe committed effects.

One possible runtime contract is to validate the native continuation first, then
return an explicit execute-current-bytecode status when the exit is exactly the
currently fetched header. In that case ci->_ip must be restored to header+1 so
the VM executes the original JCMP/JZ once with current canonical slots. Other
valid exits resume at their exact IP. Errors raise without replay. This needs
native-prefix, repeated-iteration and final-temporary-release witnesses; it is
not established merely by successful numeric loops.

Loop start may precede the selected header because the backedge recomputes its
operands. A region must distinguish its initial entry offset from branch targets
within the body. Full CFG boundaries still govern literal-cache grouping. An
entry at the header must not redundantly replay the already executed prefix.
Exits to an earlier prefix need their own retry policy; no unexamined IP change
should bypass validation of frame, closure, stack base and bounds.

Method-call preparation may be the first unsupported instruction, before the
argument reads that profiling attributes to the VM. Supporting only a prefix up
to PREPCALL could leave much of the useful work interpreted. Consider the real
bytecode and measure any proposed region, including cache-init and entry costs.
If PREPCALL is added later, its two output assignments and VM temporary release
need a separate combined-drop/alias proof. It must not invoke a callee or extend
borrowed cache lifetimes across CALL. Supporting CALL itself is a different,
larger contract involving stack movement, reentry, exceptions and cache reset.

Preserve profitable existing private loops and V9 receiver variants, keep bounded
per-header state, and do not enable the excluded private-spill takeover for
precise whole functions. Native mapping lifetime, callback order and precise
error propagation remain required independently of any speedup.
