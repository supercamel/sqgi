# Next candidate: native single-output existing-slot SET

V15 frees 1184 bytes in recycle and 500 bytes in each member callee without
changing their hot operations. This creates room for a bounded native store
experiment, subject to the fresh V15 profile. No native SET implementation is
included in V15.

Accept only SET with arg0 == NO_RESULT or arg0 == arg3. Any separate result
assignment retains the current helper's combined-drop proof. Do not extend the
single-destination proof to DLOAD, PINCL or multi-output SET.

Resolve the target address through the existing integer-array bounds check or
activation-local cache identity checks. A cache slot must never be dereferenced
before owner tag/bits and dynamic key tag/bits match. Misses retain the helper,
including root fallback, new slots and structural mutation. Do not cache root or
delegate fallback. Integer-array bounds must remain unsigned so negative indices
fail. The accepted bytecodes still cannot allocate, call or relocate containers.

Load source tag and bits from canonical stack[arg3] before any write. Check the
old heap destination before adding a source pin: scalar is safe; a reference
requires no ancestor journals and masked physical count > 1. Sensitive drops
retain the helper. Pin all owning source kinds, including raw weak-reference
objects, then reload the destination count for source/destination aliases,
decrement while preserving the collector mark, and publish the loaded tag/bits.
The VM temporary is not modified by SET. No guard may follow the first effect.

A shared emission helper for single-destination assignment could serve COPY and
SET after their source and target-address preparation. Keep GET's different
assignment-to-temp/Swap semantics separate. If address-resolution emission is
shared with GET, retain all old GET witnesses and verify both helper bypasses;
do not silently broaden the cache lifetime or weak-value behavior.

Required semantic witnesses include array/cache destinations; scalar/reference/
live-weak/dead-weak sources; self-aliases and other real owners; marked counts;
final userdata and graph release at the interpreter's exact point; two ancestor
journals; the NO_RESULT and arg0==arg3 forms; separate-result fallback; missing
key, negative/out-of-range array index, receiver/key tag collision, root fallback
and changed slot contents. Count committed prefixes once and require positive
native coverage, not merely matching interpreter output. A debugger helper probe
must use direct weakref locals (array GET dereferences weak slots) and a frozen
V15 control with exact checked counts.

Adding optional lowering must retain the 8 KiB buffer, bounded fallback tiers,
allocation-failure semantics and large-function native coverage. Measure code
size, direct V15/candidate warmup controls, full56/both seeds, JIT-on/off, strict
sanitizers, independent holdouts and profiles. The unresolved x64 assertions and
records_4096 timing variance remain open. Broader loop/call coverage and eventual
fresh matched PGO/LTO confirmation remain necessary for the full goal.
