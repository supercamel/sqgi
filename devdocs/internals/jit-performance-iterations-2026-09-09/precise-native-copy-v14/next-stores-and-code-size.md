# Follow-up after V14 copies

No V15 code is implemented. V14's native captures show unchanged local frames,
but table_apply/apply mappings grow from 4096 to 8192 page-rounded bytes. Recycle
remains 8192; transfer/publish remain 4096. Member timing is approximately flat
in the targeted comparison. Preserve this code-size cost in the final report.

The next measured profile should determine the priority of native SET versus
other remaining helpers. Existing-slot stores with no separate result write
(arg0 is NO_RESULT, or arg0==arg3) are a bounded case: resolve/validate the slot,
load source tag/bits, guard the old heap destination before adding a source pin,
then pin and reload/drop the old count, as in V14. Plain SET stores weak objects
without dereferencing them. Misses, structural mutation, final releases, ancestor
journals and separate result writes retain the helper. Multiple outputs require
the existing combined-drop proof; never apply a single-slot guard to both.

Before optional store growth, consider sharing the cold precise-exit epilogue.
Each current helper guard emits a repeated result-tag/value publication and
register restore sequence. A stub could select its exact IP and branch to one
common publication/return block. Preserve a fresh output object, exact resume IP,
SIDE_EXIT status, frame restoration and all existing no-replay tests. This is a
code-size proposal, not established behavior or a measured speedup. The emitter's
bounded fallback tiers and native large-function coverage remain required.

Broader canonical loop coverage remains distinct and necessary for the larger
Node/GJS gap. Retain the current-header retry and call-boundary requirements in
V13's canonical-region-continuation-note.md. None of these proposals authorizes
legacy private-spill takeover for precise whole functions or drops any existing
lifetime, weakref, allocation-failure or cross-backend correctness requirement.
