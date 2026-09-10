# Integration still required before this is a candidate

The isolated emitter/test draft is not compiled, assembler-verified, or applied.
No performance claim. V29 session19747 must terminate before any build; its
captures and paired controls also need to finish before production edits.

## Precise canonical compiler

Add a positive-divisor proof per instruction, using the complete prototype CFG.
Follow LOADINT, integer LOAD/DLOAD and MOVE backward only within the current
basic block; stop at leaders or any non-copy definition. Do not reuse sampled
entry-stack values as constants. Keep operand type guards and destination
ownership guard; omit the integer zero/-1 branches only for the proven positive
case, then call the new emitter. Preserve the first two type-guard destinations
into the existing floating fallback and all guard-before-write semantics.

Add a constant-lowering switch to the per-tier emitter. Retry the old arithmetic
layout at the same tier/features before sacrificing native coverage when the
new sequence exhausts the 8192-byte budget. Only emission overflow retries;
allocation or installation failures must retain one-attempt resource semantics.
Retain final compact fallback and tail-emission completion ordering from V28.

## Private prototype and loop compilers

Both emit_binary lambdas already hold sound slots[right].known_const and
const_value metadata. Use only positive integer constants after existing operand
checks. Otherwise emit the existing divisor load, zero guard and SDIV/MSUB.

Optional code growth needs a whole-emission retry using the old arithmetic
layout. Prototype emitter: buffer declared near line210, Install near4773;
new fields on native are committed only after Install. Loop emitter has its
own recursive fallback for unused-receiver publication near5229: carry the
constant-lowering option through that call and avoid overwriting an inner
failure/overflow result from an outer RAII destructor. No retry after Install.

The loop register-forwarding pass already admits 0x9b integer multiplies and
shifted ADD. The draft additionally recognizes only the ASR/LSR immediate
bitfield aliases used by the emitter. Verify dirty slots and native execution
across these operations; do not broaden memory/call barriers.

## Required actual execution

The adapted arithmetic test shares the existing positive-divisor property
corpus between x64 and AArch64: 173 divisors, signed extrema, adjacent multiples,
and 2000 random inputs per division/remainder function. On AArch64 it checks
absence of SDIV and calls the emitted code via SQJitCode. Zero/negative inputs
must refuse lowering without emitting bytes. Assembler/encoding validation and
actual native tests are still pending. Preserve x64 float-cache tests.

Add compiler-route witnesses for literal/constant-pool and moved divisors,
positive powers and non-powers, aliases, branch joins and loop-carried writes,
zero/-1/negative fallback, floats, owning destinations, committed effects and
exact side exit. Observe actual native counters and disassembly, not merely
interpreter checksum success. Prove formerly fitting layouts still fit and
allocation/install failures do not gain speculative retry. Then all existing
strict correctness, native and holdout gates, unchanged timing and profiles.
