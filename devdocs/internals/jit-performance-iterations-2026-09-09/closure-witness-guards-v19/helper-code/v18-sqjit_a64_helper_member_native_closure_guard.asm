
build-jit-audit-20260909/precise-integer-compare-v18/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a5980 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_>:
   a5980:	f100001f 	cmp	x0, #0x0
   a5984:	fa401821 	ccmp	x1, #0x0, #0x1, ne	// ne = any
   a5988:	540003eb 	b.lt	a5a04 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0x84>  // b.tstop
   a598c:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
   a5990:	f100005f 	cmp	x2, #0x0
   a5994:	fa401864 	ccmp	x3, #0x0, #0x4, ne	// ne = any
   a5998:	910003fd 	mov	x29, sp
   a599c:	a90153f3 	stp	x19, x20, [sp, #16]
   a59a0:	aa0203f4 	mov	x20, x2
   a59a4:	a9025bf5 	stp	x21, x22, [sp, #32]
   a59a8:	aa0303f5 	mov	x21, x3
   a59ac:	540000c1 	b.ne	a59c4 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0x44>  // b.any
   a59b0:	a94153f3 	ldp	x19, x20, [sp, #16]
   a59b4:	d2800000 	mov	x0, #0x0                   	// #0
   a59b8:	a9425bf5 	ldp	x21, x22, [sp, #32]
   a59bc:	a8c47bfd 	ldp	x29, x30, [sp], #64
   a59c0:	d65f03c0 	ret
   a59c4:	aa0103f3 	mov	x19, x1
   a59c8:	d37cec21 	lsl	x1, x1, #4
   a59cc:	f9001bf7 	str	x23, [sp, #48]
   a59d0:	8b010017 	add	x23, x0, x1
   a59d4:	aa0403f6 	mov	x22, x4
   a59d8:	b8616801 	ldr	w1, [x0, x1]
   a59dc:	f94006e0 	ldr	x0, [x23, #8]
   a59e0:	97fffc08 	bl	a4a00 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a59e4:	b4000240 	cbz	x0, a5a2c <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0xac>
   a59e8:	b9400002 	ldr	w2, [x0]
   a59ec:	52804001 	mov	w1, #0x200                 	// #512
   a59f0:	72a10001 	movk	w1, #0x800, lsl #16
   a59f4:	6b01005f 	cmp	w2, w1
   a59f8:	540000a0 	b.eq	a5a0c <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0x8c>  // b.none
   a59fc:	f9401bf7 	ldr	x23, [sp, #48]
   a5a00:	17ffffec 	b	a59b0 <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0x30>
   a5a04:	d2800000 	mov	x0, #0x0                   	// #0
   a5a08:	d65f03c0 	ret
   a5a0c:	f9400400 	ldr	x0, [x0, #8]
   a5a10:	a94153f3 	ldp	x19, x20, [sp, #16]
   a5a14:	eb15001f 	cmp	x0, x21
   a5a18:	a9425bf5 	ldp	x21, x22, [sp, #32]
   a5a1c:	9a9f17e0 	cset	x0, eq	// eq = none
   a5a20:	f9401bf7 	ldr	x23, [sp, #48]
   a5a24:	a8c47bfd 	ldp	x29, x30, [sp], #64
   a5a28:	d65f03c0 	ret
   a5a2c:	b5fffe93 	cbnz	x19, a59fc <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0x7c>
   a5a30:	aa1703e0 	mov	x0, x23
   a5a34:	aa1603e2 	mov	x2, x22
   a5a38:	aa1403e1 	mov	x1, x20
   a5a3c:	97fff9ed 	bl	a41f0 <_ZL28sqjit_a64_root_fallback_safeRK11SQObjectPtrPS0_S2_>
   a5a40:	3607fde0 	tbz	w0, #0, a59fc <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0x7c>
   a5a44:	f94006c0 	ldr	x0, [x22, #8]
   a5a48:	aa1403e2 	mov	x2, x20
   a5a4c:	b94002c1 	ldr	w1, [x22]
   a5a50:	97fffbec 	bl	a4a00 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a5a54:	b4fffd40 	cbz	x0, a59fc <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0x7c>
   a5a58:	b9400002 	ldr	w2, [x0]
   a5a5c:	52804001 	mov	w1, #0x200                 	// #512
   a5a60:	72a10001 	movk	w1, #0x800, lsl #16
   a5a64:	6b01005f 	cmp	w2, w1
   a5a68:	54fffca1 	b.ne	a59fc <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0x7c>  // b.any
   a5a6c:	17ffffe8 	b	a5a0c <_ZL44sqjit_a64_helper_member_native_closure_guardP11SQObjectPtrxPKS_P15SQNativeClosureS2_+0x8c>

Disassembly of section .fini:
