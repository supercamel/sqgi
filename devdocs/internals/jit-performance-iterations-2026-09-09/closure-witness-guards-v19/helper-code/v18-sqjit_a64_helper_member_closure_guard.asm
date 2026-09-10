
build-jit-audit-20260909/precise-integer-compare-v18/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a5890 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_>:
   a5890:	f100001f 	cmp	x0, #0x0
   a5894:	fa401821 	ccmp	x1, #0x0, #0x1, ne	// ne = any
   a5898:	540003eb 	b.lt	a5914 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0x84>  // b.tstop
   a589c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
   a58a0:	f100005f 	cmp	x2, #0x0
   a58a4:	fa401864 	ccmp	x3, #0x0, #0x4, ne	// ne = any
   a58a8:	910003fd 	mov	x29, sp
   a58ac:	a90153f3 	stp	x19, x20, [sp, #16]
   a58b0:	aa0203f4 	mov	x20, x2
   a58b4:	a9025bf5 	stp	x21, x22, [sp, #32]
   a58b8:	aa0303f5 	mov	x21, x3
   a58bc:	540000c1 	b.ne	a58d4 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0x44>  // b.any
   a58c0:	a94153f3 	ldp	x19, x20, [sp, #16]
   a58c4:	d2800000 	mov	x0, #0x0                   	// #0
   a58c8:	a9425bf5 	ldp	x21, x22, [sp, #32]
   a58cc:	a8c47bfd 	ldp	x29, x30, [sp], #64
   a58d0:	d65f03c0 	ret
   a58d4:	aa0103f3 	mov	x19, x1
   a58d8:	d37cec21 	lsl	x1, x1, #4
   a58dc:	f9001bf7 	str	x23, [sp, #48]
   a58e0:	8b010017 	add	x23, x0, x1
   a58e4:	aa0403f6 	mov	x22, x4
   a58e8:	b8616801 	ldr	w1, [x0, x1]
   a58ec:	f94006e0 	ldr	x0, [x23, #8]
   a58f0:	97fffc44 	bl	a4a00 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a58f4:	b4000240 	cbz	x0, a593c <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0xac>
   a58f8:	b9400002 	ldr	w2, [x0]
   a58fc:	52802001 	mov	w1, #0x100                 	// #256
   a5900:	72a10001 	movk	w1, #0x800, lsl #16
   a5904:	6b01005f 	cmp	w2, w1
   a5908:	540000a0 	b.eq	a591c <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0x8c>  // b.none
   a590c:	f9401bf7 	ldr	x23, [sp, #48]
   a5910:	17ffffec 	b	a58c0 <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0x30>
   a5914:	d2800000 	mov	x0, #0x0                   	// #0
   a5918:	d65f03c0 	ret
   a591c:	f9400400 	ldr	x0, [x0, #8]
   a5920:	a94153f3 	ldp	x19, x20, [sp, #16]
   a5924:	eb15001f 	cmp	x0, x21
   a5928:	a9425bf5 	ldp	x21, x22, [sp, #32]
   a592c:	9a9f17e0 	cset	x0, eq	// eq = none
   a5930:	f9401bf7 	ldr	x23, [sp, #48]
   a5934:	a8c47bfd 	ldp	x29, x30, [sp], #64
   a5938:	d65f03c0 	ret
   a593c:	b5fffe93 	cbnz	x19, a590c <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0x7c>
   a5940:	aa1703e0 	mov	x0, x23
   a5944:	aa1603e2 	mov	x2, x22
   a5948:	aa1403e1 	mov	x1, x20
   a594c:	97fffa29 	bl	a41f0 <_ZL28sqjit_a64_root_fallback_safeRK11SQObjectPtrPS0_S2_>
   a5950:	3607fde0 	tbz	w0, #0, a590c <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0x7c>
   a5954:	f94006c0 	ldr	x0, [x22, #8]
   a5958:	aa1403e2 	mov	x2, x20
   a595c:	b94002c1 	ldr	w1, [x22]
   a5960:	97fffc28 	bl	a4a00 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a5964:	b4fffd40 	cbz	x0, a590c <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0x7c>
   a5968:	b9400002 	ldr	w2, [x0]
   a596c:	52802001 	mov	w1, #0x100                 	// #256
   a5970:	72a10001 	movk	w1, #0x800, lsl #16
   a5974:	6b01005f 	cmp	w2, w1
   a5978:	54fffca1 	b.ne	a590c <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0x7c>  // b.any
   a597c:	17ffffe8 	b	a591c <_ZL37sqjit_a64_helper_member_closure_guardP11SQObjectPtrxPKS_P9SQClosureS2_+0x8c>

Disassembly of section .fini:
