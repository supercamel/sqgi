# Next candidate: integer JCMP with the canonical VM temporary

This is a source-reviewed proposal, not an implemented or credited speedup.
V16's owner profile attributed 5.36% self time to the JCMP helper, 4.85% to ObjCmp,
2.42% to CMP_OP and 1.30% to IsFalse. V17's fresh zero-loss owner profile reports JCMP 6.20%, ObjCmp 4.65%,
CMP_OP 2.55% and IsFalse 1.85% (15.25% combined self time). PINCL is 10.28%
and DLOAD 9.17%. These are sampled proportions, not predicted speedups; the
comparison path remains a supported next implementation candidate.

The existing precise helper compares stack[arg2] against stack[arg0], assigns
the boolean to vm->temp_reg, and returns 1 for false or 2 for true. Native lowering
must preserve that temporary assignment, even when only the branch is consumed.
The existing final-temporary release witness and precise-function exclusion from
legacy private-spill loop takeover remain mandatory.

A bounded integer-only path can guard both source types before effects, compute
signed CMP_G/CMP_GE/CMP_L/CMP_LE into x12 with w13=OT_BOOL, and put bits+1 in x0.
The shared single-destination assignment routine can target x22 plus the real
SQVM::temp_reg offsets: scalar old temporary needs no release, and owning old
temporary requires no active ancestor journal and masked count greater than one
before publication. Preserve mark bits. That routine clobbers x9/x10/x14/x15/x17,
not x0, so the existing post-helper JCMP branch can consume the result after the
fast-done jump. Final or journal-sensitive temporary releases and numeric mixed
operands continue through the original helper, before any native effect.

Do not independently guard after changing the temporary. Each integer operand
guard must patch to the helper entry after the assignment emitter's own guard
patching. No callback, allocation or reentry is introduced. Check instruction
buffer fallback with the original large-function fixture unchanged.

Tests must cover signed extrema/equality in all four relations, true/false
branches, scalar/strong/weak/marked/sole-owner temporary values, two ancestor
journals, invalid and mixed operands, exact resumed IP and a committed prefix.
Require native-route evidence that integer JCMP bypasses its helper while the
final-release witness still exits at the comparison. Preserve all 56 benchmark
components, independent holdouts and both warmup histories. This proposal does
not broaden accepted opcodes or handle multi-output PINCL/DLOAD.
