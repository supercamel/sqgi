# Evidence to revisit after V27 profiling

The accepted V26 rotate_buffers capture contains 7884 code bytes in an 8192-byte
mapping, 52 BLR x16 instructions and no direct BL. The native owning-slot store
word used by the richer SET path is absent. This is a code-size lead, not proof
of its optimization tier or of a prospective speedup. Existing V26 member
profiles show checked GETK, copy, release and PREPCALL helpers remain material.
Confirm the actual successful emission tier and the V27 profile before changing
policy. Candidate experiments are shared helper argument setup at rich tiers,
or a larger bounded emission buffer; compare native-route coverage, code sizes,
compile costs and unchanged paired timings. Do not let optional code growth
silently discard established fast paths. Resource failure must still stop the
attempt rather than retrying another layout.

The V26 owner profile attributes 12.04% to DLOAD. Its captured recycle bytecode
has a DLOAD at IP18 that loads the same immutable `scale` string into slots8/9.
A native double load would need combined old-owner drop checks before either
write, exact handling of destination aliases, mark-bit preservation and ancestor
pins. Two calls to the existing single-copy emitter are insufficient: the second
check could fail after the first write. Preserve the full interpreter sequence
and exact resume point. Any draft must await fresh V27 evidence and isolated
validation; no V28 production edits have been made.

The V28 draft now chooses shared helper argument setup before considering a
larger buffer. A blanket buffer increase could also change the private compiler
route chosen before the expanded precise fallback (compile_proto.inc:4795+).
The shared setup draft changes only precise emission and preserves every
currently fitting layout. This avoids assuming broader private native coverage
has the same canonical lifetime behavior. Both canonical-loop design notes were
rechecked against the current bool loop API: committed exits at the fetched
header still require an explicit execute-current status to avoid replay/retry,
and CALL handling would require stack/caches/code-lifetime changes. Those
broader requirements remain open; do not remove the existing precise-entry
exclusion in sqjit_try_execute_current_loop.
