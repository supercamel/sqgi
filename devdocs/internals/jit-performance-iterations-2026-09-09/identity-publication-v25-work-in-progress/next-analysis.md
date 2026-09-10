Follow-up after V25 validation/measurement (no V26 source edits yet)

V24 profiles show owner DLOAD ~10.34%, PINCL ~9.83%. Inspection corrects the
older generic suggestion to simply add native PINCL: precise_fast already
lowers integer PINCL when its old destination is non-owning. Captured recycle
bytecode uses PINCL dst7/source6; dst7 previously holds local old (record.current),
so its destination ownership guard sends the common case to the C++ helper.
A useful experiment is checked native PINCL for a surviving old destination,
with all release checks preceding either scalar write. Preserve MARK masking,
no-ancestor fast proof, source/destination overlap, integer wrap, float fallback,
exact committed-IP exits and release-hook ordering. Do not blindly reuse
precise_assign's done/guard targets: its internal guards currently resolve to
its end, so appending the second PINCL write there would execute that write on
failure. Emit the atomic two-destination operation with correctly placed exits.

DLOAD currently always takes its C++ helper and requires a combined-drop census
when old destinations alias. Both literal pins and current owners matter; no
first assignment may execute before both old-owner checks succeed. A new pin
must not make a final owner look non-final. Source/destination identity and equal
destinations need the VM's sequential assignment behavior.

Native code budget matters: recycle is 7296 bytes, rotate_buffers 7884 of 8192.
New optional fast paths must not force losing a previously fitting higher tier.
Consider trying the richer layout then the existing layout at the SAME tier
before lowering tiers. Verify actual selected code, never assume source changes
imply native coverage. No workload-name selection or unsafe legacy loop takeover.

The much larger remaining goal also needs method/VM coverage improvements:
V24 methods spend ~46% in Execute and still average 1.047x JIT-off time;
object_member_write_fallback remains ~471 ns (37x Node). The full56 target and
fresh matched PGO/LTO remain unchanged.
