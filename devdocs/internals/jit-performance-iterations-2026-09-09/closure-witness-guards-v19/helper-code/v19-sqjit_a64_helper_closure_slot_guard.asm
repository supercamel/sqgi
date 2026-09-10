
build-jit-audit-20260909/closure-witness-guards-v19/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a0040 <_ZL35sqjit_a64_helper_closure_slot_guardP11SQObjectPtrxP9SQWeakRef>:
   a0040:	f100003f 	cmp	x1, #0x0
   a0044:	aa0003e3 	mov	x3, x0
   a0048:	fa40a844 	ccmp	x2, #0x0, #0x4, ge	// ge = tcont
   a004c:	fa401804 	ccmp	x0, #0x0, #0x4, ne	// ne = any
   a0050:	d2800000 	mov	x0, #0x0                   	// #0
   a0054:	540000e0 	b.eq	a0070 <_ZL35sqjit_a64_helper_closure_slot_guardP11SQObjectPtrxP9SQWeakRef+0x30>  // b.none
   a0058:	b9401844 	ldr	w4, [x2, #24]
   a005c:	52802005 	mov	w5, #0x100                 	// #256
   a0060:	72a10005 	movk	w5, #0x800, lsl #16
   a0064:	d2800000 	mov	x0, #0x0                   	// #0
   a0068:	6b05009f 	cmp	w4, w5
   a006c:	54000040 	b.eq	a0074 <_ZL35sqjit_a64_helper_closure_slot_guardP11SQObjectPtrxP9SQWeakRef+0x34>  // b.none
   a0070:	d65f03c0 	ret
   a0074:	d37cec21 	lsl	x1, x1, #4
   a0078:	8b010065 	add	x5, x3, x1
   a007c:	b8616861 	ldr	w1, [x3, x1]
   a0080:	6b04003f 	cmp	w1, w4
   a0084:	54ffff61 	b.ne	a0070 <_ZL35sqjit_a64_helper_closure_slot_guardP11SQObjectPtrxP9SQWeakRef+0x30>  // b.any
   a0088:	f94004a1 	ldr	x1, [x5, #8]
   a008c:	f9401040 	ldr	x0, [x2, #32]
   a0090:	eb00003f 	cmp	x1, x0
   a0094:	9a9f17e0 	cset	x0, eq	// eq = none
   a0098:	d65f03c0 	ret

Disassembly of section .fini:
