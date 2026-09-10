# Coverage follow-up after the native-store candidate

Source inspection identifies another bounded option alongside the separate
canonical-loop-region design. Buffer rotation includes scalar equality/branches
and a string len call; calibration includes numeric tofloat calls. The precise
whole-function compiler currently rejects EQ/NE, PREPCALL/PREPCALLK and CALL.
It cannot run these loops as whole native functions even though their core
existing-slot stores and arithmetic are supported. This is an instruction-set
coverage gap, not evidence of a timing improvement from any proposed change.

Investigate guarded, non-allocating builtin operations using actual closure
identity and argument metadata. The existing sqjit_number_conversion_guard checks
the number delegate, exact tofloat function, parameter/type checks and lack of
bound environment. A precise implementation would additionally need exact
PREPCALL source/receiver/destination/temp semantics, all alias and combined-drop
checks, and interpreter-equivalent call-slot cleanup. Keep ordinary calls out of
this tier until their stack growth, reentry and cache invalidation are separately
proved. Never recognize a function or benchmark by name to bypass these checks.

Default delegates are mutable. Replacing or binding the builtin, changing its
metadata, unexpected receiver types, weak values, final destination releases and
ancestor pins must take a checked continuation before effects. The array len
special path in SQVM::Execute differs from normal PREPCALL temporary handling;
string and number operations cannot assume that array shortcut's semantics.
Native intrinsic support must not widen the existing borrowed-cache lifetime to
include arbitrary calls. Scalar EQ/NE also need exact numeric cross-type and
NaN semantics plus destination release ordering.

This path might enable some complete effectful functions without per-iteration
native-region entry overhead. Functions with initial allocation or arbitrary
method calls still require broader region/call support. Compare both approaches
using unmodified workloads, native-route witnesses and fresh profiles. This note
is source-derived prioritization only; neither intrinsic extension nor a new
loop region is implemented in V15.
