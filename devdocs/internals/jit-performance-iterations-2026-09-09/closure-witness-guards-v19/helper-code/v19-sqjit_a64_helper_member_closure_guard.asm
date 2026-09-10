
build-jit-audit-20260909/closure-witness-guards-v19/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a63d0 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_>:
   a63d0:	f100001f 	cmp	x0, #0x0
   a63d4:	fa401821 	ccmp	x1, #0x0, #0x1, ne	// ne = any
   a63d8:	540002ab 	b.lt	a642c <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x5c>  // b.tstop
   a63dc:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
   a63e0:	f100005f 	cmp	x2, #0x0
   a63e4:	fa401864 	ccmp	x3, #0x0, #0x4, ne	// ne = any
   a63e8:	910003fd 	mov	x29, sp
   a63ec:	a90153f3 	stp	x19, x20, [sp, #16]
   a63f0:	aa0303f3 	mov	x19, x3
   a63f4:	a9025bf5 	stp	x21, x22, [sp, #32]
   a63f8:	aa0203f5 	mov	x21, x2
   a63fc:	540000e0 	b.eq	a6418 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>  // b.none
   a6400:	b9401863 	ldr	w3, [x3, #24]
   a6404:	aa0103f4 	mov	x20, x1
   a6408:	52802001 	mov	w1, #0x100                 	// #256
   a640c:	72a10001 	movk	w1, #0x800, lsl #16
   a6410:	6b01007f 	cmp	w3, w1
   a6414:	54000100 	b.eq	a6434 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x64>  // b.none
   a6418:	d2800000 	mov	x0, #0x0                   	// #0
   a641c:	a94153f3 	ldp	x19, x20, [sp, #16]
   a6420:	a9425bf5 	ldp	x21, x22, [sp, #32]
   a6424:	a8c47bfd 	ldp	x29, x30, [sp], #64
   a6428:	d65f03c0 	ret
   a642c:	d2800000 	mov	x0, #0x0                   	// #0
   a6430:	d65f03c0 	ret
   a6434:	d37cee81 	lsl	x1, x20, #4
   a6438:	f9001fe4 	str	x4, [sp, #56]
   a643c:	8b010016 	add	x22, x0, x1
   a6440:	b8616801 	ldr	w1, [x0, x1]
   a6444:	f94006c0 	ldr	x0, [x22, #8]
   a6448:	97fff972 	bl	a4a10 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a644c:	b4000160 	cbz	x0, a6478 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0xa8>
   a6450:	b9400002 	ldr	w2, [x0]
   a6454:	52802001 	mov	w1, #0x100                 	// #256
   a6458:	72a10001 	movk	w1, #0x800, lsl #16
   a645c:	6b01005f 	cmp	w2, w1
   a6460:	54fffdc1 	b.ne	a6418 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>  // b.any
   a6464:	f9400401 	ldr	x1, [x0, #8]
   a6468:	f9401260 	ldr	x0, [x19, #32]
   a646c:	eb00003f 	cmp	x1, x0
   a6470:	9a9f17e0 	cset	x0, eq	// eq = none
   a6474:	17ffffea 	b	a641c <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x4c>
   a6478:	b5fffd14 	cbnz	x20, a6418 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>
   a647c:	f9401fe4 	ldr	x4, [sp, #56]
   a6480:	aa1603e0 	mov	x0, x22
   a6484:	aa1503e1 	mov	x1, x21
   a6488:	aa0403e2 	mov	x2, x4
   a648c:	97fff75d 	bl	a4200 <_ZL28sqjit_a64_root_fallback_safeRK11SQObjectPtrPS0_S2_>
   a6490:	3607fc40 	tbz	w0, #0, a6418 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>
   a6494:	f9401fe4 	ldr	x4, [sp, #56]
   a6498:	aa1503e2 	mov	x2, x21
   a649c:	f9400480 	ldr	x0, [x4, #8]
   a64a0:	b9400081 	ldr	w1, [x4]
   a64a4:	97fff95b 	bl	a4a10 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a64a8:	b5fffd40 	cbnz	x0, a6450 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x80>
   a64ac:	17ffffdb 	b	a6418 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQWeakRefS2_+0x48>

Disassembly of section .fini:
