
build-jit-audit-20260909/closure-witness-guards-v19/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a4dc0 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP9SQWeakRef>:
   a4dc0:	f100005f 	cmp	x2, #0x0
   a4dc4:	fa401864 	ccmp	x3, #0x0, #0x4, ne	// ne = any
   a4dc8:	54000300 	b.eq	a4e28 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x68>  // b.none
   a4dcc:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   a4dd0:	910003fd 	mov	x29, sp
   a4dd4:	a90153f3 	stp	x19, x20, [sp, #16]
   a4dd8:	aa0303f3 	mov	x19, x3
   a4ddc:	52804003 	mov	w3, #0x200                 	// #512
   a4de0:	72a10003 	movk	w3, #0x800, lsl #16
   a4de4:	b9401a74 	ldr	w20, [x19, #24]
   a4de8:	6b03029f 	cmp	w20, w3
   a4dec:	540000a0 	b.eq	a4e00 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x40>  // b.none
   a4df0:	d2800000 	mov	x0, #0x0                   	// #0
   a4df4:	a94153f3 	ldp	x19, x20, [sp, #16]
   a4df8:	a8c27bfd 	ldp	x29, x30, [sp], #32
   a4dfc:	d65f03c0 	ret
   a4e00:	97ffff04 	bl	a4a10 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a4e04:	b4ffff60 	cbz	x0, a4df0 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x30>
   a4e08:	b9400001 	ldr	w1, [x0]
   a4e0c:	6b14003f 	cmp	w1, w20
   a4e10:	54ffff01 	b.ne	a4df0 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x30>  // b.any
   a4e14:	f9400401 	ldr	x1, [x0, #8]
   a4e18:	f9401260 	ldr	x0, [x19, #32]
   a4e1c:	eb00003f 	cmp	x1, x0
   a4e20:	9a9f17e0 	cset	x0, eq	// eq = none
   a4e24:	17fffff4 	b	a4df4 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x34>
   a4e28:	d2800000 	mov	x0, #0x0                   	// #0
   a4e2c:	d65f03c0 	ret

Disassembly of section .fini:
