
build-jit-audit-20260909/closure-witness-guards-v19/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a62f0 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_>:
   a62f0:	f100001f 	cmp	x0, #0x0
   a62f4:	fa401821 	ccmp	x1, #0x0, #0x1, ne	// ne = any
   a62f8:	540002ab 	b.lt	a634c <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x5c>  // b.tstop
   a62fc:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
   a6300:	f100005f 	cmp	x2, #0x0
   a6304:	fa401864 	ccmp	x3, #0x0, #0x4, ne	// ne = any
   a6308:	910003fd 	mov	x29, sp
   a630c:	a90153f3 	stp	x19, x20, [sp, #16]
   a6310:	aa0303f3 	mov	x19, x3
   a6314:	a9025bf5 	stp	x21, x22, [sp, #32]
   a6318:	aa0203f5 	mov	x21, x2
   a631c:	540000e0 	b.eq	a6338 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>  // b.none
   a6320:	b9401863 	ldr	w3, [x3, #24]
   a6324:	aa0103f4 	mov	x20, x1
   a6328:	52804001 	mov	w1, #0x200                 	// #512
   a632c:	72a10001 	movk	w1, #0x800, lsl #16
   a6330:	6b01007f 	cmp	w3, w1
   a6334:	54000100 	b.eq	a6354 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x64>  // b.none
   a6338:	d2800000 	mov	x0, #0x0                   	// #0
   a633c:	a94153f3 	ldp	x19, x20, [sp, #16]
   a6340:	a9425bf5 	ldp	x21, x22, [sp, #32]
   a6344:	a8c47bfd 	ldp	x29, x30, [sp], #64
   a6348:	d65f03c0 	ret
   a634c:	d2800000 	mov	x0, #0x0                   	// #0
   a6350:	d65f03c0 	ret
   a6354:	d37cee81 	lsl	x1, x20, #4
   a6358:	f9001fe4 	str	x4, [sp, #56]
   a635c:	8b010016 	add	x22, x0, x1
   a6360:	b8616801 	ldr	w1, [x0, x1]
   a6364:	f94006c0 	ldr	x0, [x22, #8]
   a6368:	97fff9aa 	bl	a4a10 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a636c:	b4000160 	cbz	x0, a6398 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0xa8>
   a6370:	b9400002 	ldr	w2, [x0]
   a6374:	52804001 	mov	w1, #0x200                 	// #512
   a6378:	72a10001 	movk	w1, #0x800, lsl #16
   a637c:	6b01005f 	cmp	w2, w1
   a6380:	54fffdc1 	b.ne	a6338 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>  // b.any
   a6384:	f9400401 	ldr	x1, [x0, #8]
   a6388:	f9401260 	ldr	x0, [x19, #32]
   a638c:	eb00003f 	cmp	x1, x0
   a6390:	9a9f17e0 	cset	x0, eq	// eq = none
   a6394:	17ffffea 	b	a633c <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x4c>
   a6398:	b5fffd14 	cbnz	x20, a6338 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>
   a639c:	f9401fe4 	ldr	x4, [sp, #56]
   a63a0:	aa1603e0 	mov	x0, x22
   a63a4:	aa1503e1 	mov	x1, x21
   a63a8:	aa0403e2 	mov	x2, x4
   a63ac:	97fff795 	bl	a4200 <_ZL28sqjit_a64_root_fallback_safeRK11SQObjectPtrPS0_S2_>
   a63b0:	3607fc40 	tbz	w0, #0, a6338 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>
   a63b4:	f9401fe4 	ldr	x4, [sp, #56]
   a63b8:	aa1503e2 	mov	x2, x21
   a63bc:	f9400480 	ldr	x0, [x4, #8]
   a63c0:	b9400081 	ldr	w1, [x4]
   a63c4:	97fff993 	bl	a4a10 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a63c8:	b5fffd40 	cbnz	x0, a6370 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x80>
   a63cc:	17ffffdb 	b	a6338 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>

Disassembly of section .fini:
