# Possible follow-up for native instruction attribution

Source inspection found no perf-map or jitdump registration in the current JIT
sources. Existing flat profiles show generated code under anonymous JIT addresses;
separate GDB captures prove native structure but come from different processes.
Do not join absolute addresses across those processes or infer precise instruction
hotspots from unrelated mappings.

If V20 moves most float cycles out of named lookup helpers, richer native symbol
and code-lifetime records would make register-residency work easier to justify.
Consider opt-in perf-map/jitdump output associated with installed artifacts, with
correct names, code sizes, addresses and mapping lifetimes. Keep it disabled for
accepted timings and verify any profile instrumentation overhead separately.
Dynamic mapping reuse and alternate loops need explicit treatment; a stale symbol
map must not attribute a new mapping's samples to a retired function. This is a
proposal, not implemented instrumentation or an additional completion claim.
