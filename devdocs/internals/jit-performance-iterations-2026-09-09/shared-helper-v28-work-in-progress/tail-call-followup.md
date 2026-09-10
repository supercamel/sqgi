# Follow-up suggested by V28 helper tracing

V28 saves528checked helper calls in four buffer invocations but its first
five-round pilot improves buffer time by only about6.3%. This does not establish
where the remaining cycles go; inspect the fresh full-study profiles first.

The current shared trampoline saves FP/LR, prepares five arguments, calls the
helper with BLR x16, restores FP/LR, and returns. A bounded general follow-up is
a tail branch to the checked helper: the original BL at the call site already
puts the guard continuation in LR. Load context at the original SP displacement,
prepare unchanged canonical arguments, then BR x16. The helper's RET would
return directly to the original status guard. The x6 cache address remains
activation-local and no code or container lifetime extends across a call.

This is a proposal, not implemented or timed behavior. Validate ABI, exact
resume guards, native helper returns, shared rich and helper-only tier7 routes,
resource failure/retry, boundary-size behavior, and all lifetime/native gates.
Do not change production code or builds during V28 measurements. Do not infer
a speedup from the shorter instruction sequence. Keep both old and new forms
reviewable and measure unchanged full56 and controls before acceptance.
