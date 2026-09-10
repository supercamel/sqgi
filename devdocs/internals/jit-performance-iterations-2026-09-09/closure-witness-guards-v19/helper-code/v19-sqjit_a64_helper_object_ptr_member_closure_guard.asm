
build-jit-audit-20260909/closure-witness-guards-v19/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a4e30 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQWeakRef>:
   a4e30:	f100005f 	cmp	x2, #0x0
   a4e34:	fa401864 	ccmp	x3, #0x0, #0x4, ne	// ne = any
   a4e38:	54000300 	b.eq	a4e98 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x68>  // b.none
   a4e3c:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   a4e40:	910003fd 	mov	x29, sp
   a4e44:	a90153f3 	stp	x19, x20, [sp, #16]
   a4e48:	aa0303f3 	mov	x19, x3
   a4e4c:	52802003 	mov	w3, #0x100                 	// #256
   a4e50:	72a10003 	movk	w3, #0x800, lsl #16
   a4e54:	b9401a74 	ldr	w20, [x19, #24]
   a4e58:	6b03029f 	cmp	w20, w3
   a4e5c:	540000a0 	b.eq	a4e70 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x40>  // b.none
   a4e60:	d2800000 	mov	x0, #0x0                   	// #0
   a4e64:	a94153f3 	ldp	x19, x20, [sp, #16]
   a4e68:	a8c27bfd 	ldp	x29, x30, [sp], #32
   a4e6c:	d65f03c0 	ret
   a4e70:	97fffee8 	bl	a4a10 <_ZL33sqjit_a64_borrow_member_ptr_valuex15tagSQObjectTypePK11SQObjectPtr>
   a4e74:	b4ffff60 	cbz	x0, a4e60 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x30>
   a4e78:	b9400001 	ldr	w1, [x0]
   a4e7c:	6b14003f 	cmp	w1, w20
   a4e80:	54ffff01 	b.ne	a4e60 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x30>  // b.any
   a4e84:	f9400401 	ldr	x1, [x0, #8]
   a4e88:	f9401260 	ldr	x0, [x19, #32]
   a4e8c:	eb00003f 	cmp	x1, x0
   a4e90:	9a9f17e0 	cset	x0, eq	// eq = none
   a4e94:	17fffff4 	b	a4e64 <_ZL48sqjit_a64_helper_object_ptr_member_closure_guardxxPK11SQObjectPtrP9SQWeakRef+0x34>
   a4e98:	d2800000 	mov	x0, #0x0                   	// #0
   a4e9c:	d65f03c0 	ret

Disassembly of section .fini:
