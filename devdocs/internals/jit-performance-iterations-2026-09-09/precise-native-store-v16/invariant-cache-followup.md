# Follow-up: prove invariant cache operands

Beyond omitting definitely cold probes, inspect whether a cache group's receiver
operand is a canonical parameter never written anywhere in the accepted
function. With no calls, allocation, stack relocation or structural mutation,
that parameter retains the same tag/bits throughout the native activation. A
helper-populated cache entry therefore cannot change receiver identity. Literal
keys already have their immutable prototype identity; a dynamic key parameter
may be similarly invariant if no bytecode writes it.

A potential fast cache read/store can retain the nonnull-slot check while
omitting only operand comparisons whose invariance is proved from complete
bytecode write facts. Keep owner/key checks for every mutable operand. Consider
all branches, loops, multiple-output instructions and aliases; do not infer
invariance from a source variable name, one observed invocation or benchmark
shape. The compiler's accepted instruction set must make external mutation of
canonical parameter slots impossible. Container values still reload on every
use, and no cached address may survive a call or new activation.

The initial null check is essential: an invariant parameter may have an
unsupported type or key, and a helper miss must not become an unchecked pointer
read. Existing helper resolution still establishes the slot. Root/delegate
fallback remains uncached. Value reference/type checks and precise release
semantics remain separate from receiver/key identity. Userdata, weak values and
field contents can change even when the owning receiver does not.

If implemented, retain varied receiver types across activations, parameter-
overwrite witnesses, key-tag collisions, graph release/weak death and all native
store/read helper-count controls. Measure code size and full-mix timing. This is
not included in V16. Broader native loop/intrinsic/call coverage, scalar type
facts and register residency remain necessary directions for the full target.
