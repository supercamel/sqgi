
build-jit-audit-20260909/precise-integer-compare-v18/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a4db0 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP15SQNativeClosure>:
   a4db0:	f100005f 	cmp	x2, #0x0
   a4db4:	fa401864 	ccmp	x3, #0x0, #0x4, ne	// ne = any
   a4db8:	54000061 	b.ne	a4dc4 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP15SQNativeClosure+0x14>  // b.any
   a4dbc:	d2800000 	mov	x0, #0x0                   	// #0
   a4dc0:	d65f03c0 	ret
   a4dc4:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   a4dc8:	910003fd 	mov	x29, sp
   a4dcc:	f9000bf3 	str	x19, [sp, #16]
   a4dd0:	aa0303f3 	mov	x19, x3
   a4dd4:	97ffff0b 	bl	a4a00 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a4dd8:	b4000180 	cbz	x0, a4e08 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP15SQNativeClosure+0x58>
   a4ddc:	b9400002 	ldr	w2, [x0]
   a4de0:	52804001 	mov	w1, #0x200                 	// #512
   a4de4:	72a10001 	movk	w1, #0x800, lsl #16
   a4de8:	6b01005f 	cmp	w2, w1
   a4dec:	540000e1 	b.ne	a4e08 <_ZL55sqjit_a64_helper_object_ptr_member_native_closure_guardxxPK11SQObjectPtrP15SQNativeClosure+0x58>  // b.any
   a4df0:	f9400400 	ldr	x0, [x0, #8]
   a4df4:	eb13001f 	cmp	x0, x19
   a4df8:	f9400bf3 	ldr	x19, [sp, #16]
   a4dfc:	9a9f17e0 	cset	x0, eq	// eq = none
   a4e00:	a8c27bfd 	ldp	x29, x30, [sp], #32
   a4e04:	d65f03c0 	ret
   a4e08:	f9400bf3 	ldr	x19, [sp, #16]
   a4e0c:	d2800000 	mov	x0, #0x0                   	// #0
   a4e10:	a8c27bfd 	ldp	x29, x30, [sp], #32
   a4e14:	d65f03c0 	ret

Disassembly of section .fini:
