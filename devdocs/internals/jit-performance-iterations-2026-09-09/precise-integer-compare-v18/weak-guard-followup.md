# Follow-up for the closure-lifetime guard cost

This is an unimplemented proposal. The full V18 kernel batch records direct_call
and float_call just over 5% slower than audit. Preserve those samples. Separate
unchanged-script controls and generated-code captures must establish the size
and likely source of the regression before assigning a cause.

The lifetime fix must remain: activated contracts demonstrated actual closure
address reuse executing stale inline code without it. A pointer check alone is
not sufficient. Do not recover speed by pinning the original closure or omitting
the weak witness.

A bounded encoding improvement is possible without moving the guard. A retained
SQWeakRef witness has its original closure/native-closure type until destruction
clears it to OT_NULL; it cannot switch to a different referent. Verify every
write to that field in the current source. A single-bit type test can then
replace materializing a full type constant and comparing it, while keeping the
existing guard branch at the same instruction. AArch64 ANDS-immediate (TST)
would use the existing conditional-failure relocation and avoid introducing
new TBZ relocation handling. Check the actual instruction encoding, both closure
types, witness lifetime, failure before effects, code installation cleanup, and
the activated address-reuse and allocator-failure tests.

Do not hoist the guard to entry merely on an assumption that callees cannot die
or be replaced during native execution. That needs a separate proof covering
all accepted writes, allocation, callbacks, prepared calls and ownership. A
local encoding change has no such movement or lifetime extension.

The fixed-mix performance target still requires broader native coverage in
applications, member loops and guarded builtins. Lowering this correctness
guard's overhead cannot stand in for the full 56-component goal. PINCL and DLOAD
remain candidates only with their actual multi-output and combined-release proof.

## Completed V18 controls

regression-investigation.md now records both warmup histories and eight native
captures. Seven artifacts add eight instructions per guarded call (one to eight
sites each); array_append's entry is structurally unchanged and still noisy.
Consider folding the weak check into the existing closure guard helper as well
as local type-bit encoding. This avoids a second emitted guard sequence while
preserving the same identity check point. No such change is implemented in V18.
