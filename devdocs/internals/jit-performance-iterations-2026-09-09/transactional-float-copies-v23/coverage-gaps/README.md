# Coverage gap probe

The unchanged V23 benchmark functions were captured in GDB, together with their
actual backend rejections. rotate_buffers has 53 bytecodes and 12 slots. Its whole-
function compiler rejects CALL at IP26 as "unsupported CALL array len"; its loop
compiler rejects the conditional shape at IP14. IP25 is PREPCALLK for literal
"len", followed immediately by a one-argument CALL at IP26. Equality is at IP13.

This confirms that the proposed expanded precise fallback can reach a currently
rejected shape. It does not prove a new implementation correct or faster. Full
bytecodes/literals, all captured rejection sites and the GDB transcript are kept.
The four target functions are rotate_buffers, object_member_write_fallback_kernel,
members and event_records. No benchmark or runtime source was changed for this
probe; no timing was measured concurrently with it.
