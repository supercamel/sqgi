# Next measured target: float stack residency

This is a follow-up proposal, not an implemented optimization. V21 has completed
fresh validation and measurement but the full performance goal remains active.

The separate same-process instruction profile attributes 2112/2142 samples to
seven live generated mappings. 1389 native sampled IPs (65.77%) are load/store
instructions addressing the native stack; 577 are floating instructions. Pressure
accounts for 974 samples and channels417. This supports investigating private
float slot residency. It does not prove exact memory latency or attainable speedup;
PMU skid and snapshot instrumentation remain explicit limits.

Start with bounded slot/register residency or measured local forwarding in the
existing private scalar loop compiler. Preserve ABI callee-saved state, helper-call
clobbers, loop/branch merges, scalar tags, canonical writeback, guard rollback,
ancestor journals, cold exits, and closure lifetime guards. Values required by a
helper or rollback path must remain materialized correctly. Do not reuse this
proof for canonical precise regions or enable legacy precise-loop takeover.

Use frozen V21 as the control. Keep both warmup histories, pressure, identical-build
repeats and the complete unchanged score. Owner PINCL/DLOAD helpers and method VM
dispatch remain independent measured costs; float gains alone cannot satisfy the
current p90 targets. Array append and large-record variance remain open. Existing
x64 failures and fresh matched PGO/LTO are still required.
