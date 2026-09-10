
build-jit-audit-20260909/precise-integer-compare-v18/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a4e20 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQClosure>:
   a4e20:	f100005f 	cmp	x2, #0x0
   a4e24:	fa401864 	ccmp	x3, #0x0, #0x4, ne	// ne = any
   a4e28:	54000061 	b.ne	a4e34 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQClosure+0x14>  // b.any
   a4e2c:	d2800000 	mov	x0, #0x0                   	// #0
   a4e30:	d65f03c0 	ret
   a4e34:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   a4e38:	910003fd 	mov	x29, sp
   a4e3c:	f9000bf3 	str	x19, [sp, #16]
   a4e40:	aa0303f3 	mov	x19, x3
   a4e44:	97fffeef 	bl	a4a00 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a4e48:	b4000180 	cbz	x0, a4e78 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQClosure+0x58>
   a4e4c:	b9400002 	ldr	w2, [x0]
   a4e50:	52802001 	mov	w1, #0x100                 	// #256
   a4e54:	72a10001 	movk	w1, #0x800, lsl #16
   a4e58:	6b01005f 	cmp	w2, w1
   a4e5c:	540000e1 	b.ne	a4e78 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQClosure+0x58>  // b.any
   a4e60:	f9400400 	ldr	x0, [x0, #8]
   a4e64:	eb13001f 	cmp	x0, x19
   a4e68:	f9400bf3 	ldr	x19, [sp, #16]
   a4e6c:	9a9f17e0 	cset	x0, eq	// eq = none
   a4e70:	a8c27bfd 	ldp	x29, x30, [sp], #32
   a4e74:	d65f03c0 	ret
   a4e78:	f9400bf3 	ldr	x19, [sp, #16]
   a4e7c:	d2800000 	mov	x0, #0x0                   	// #0
   a4e80:	a8c27bfd 	ldp	x29, x30, [sp], #32
   a4e84:	d65f03c0 	ret

Disassembly of section .fini:
