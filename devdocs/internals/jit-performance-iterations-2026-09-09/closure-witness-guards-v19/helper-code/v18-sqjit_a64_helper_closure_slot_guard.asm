
build-jit-audit-20260909/precise-integer-compare-v18/sqgi:     file format elf64-littleaarch64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

00000000000a0040 <_ZL35sqjit_a64_helper_closure_slot_guardP11SQObjectPtrxP9SQClosure>:
   a0040:	f100003f 	cmp	x1, #0x0
   a0044:	aa0003e3 	mov	x3, x0
   a0048:	fa40a844 	ccmp	x2, #0x0, #0x4, ge	// ge = tcont
   a004c:	fa401804 	ccmp	x0, #0x0, #0x4, ne	// ne = any
   a0050:	d2800000 	mov	x0, #0x0                   	// #0
   a0054:	54000120 	b.eq	a0078 <_ZL35sqjit_a64_helper_closure_slot_guardP11SQObjectPtrxP9SQClosure+0x38>  // b.none
   a0058:	d37cec21 	lsl	x1, x1, #4
   a005c:	52802004 	mov	w4, #0x100                 	// #256
   a0060:	8b010065 	add	x5, x3, x1
   a0064:	72a10004 	movk	w4, #0x800, lsl #16
   a0068:	d2800000 	mov	x0, #0x0                   	// #0
   a006c:	b8616861 	ldr	w1, [x3, x1]
   a0070:	6b04003f 	cmp	w1, w4
   a0074:	54000040 	b.eq	a007c <_ZL35sqjit_a64_helper_closure_slot_guardP11SQObjectPtrxP9SQClosure+0x3c>  // b.none
   a0078:	d65f03c0 	ret
   a007c:	f94004a0 	ldr	x0, [x5, #8]
   a0080:	eb02001f 	cmp	x0, x2
   a0084:	9a9f17e0 	cset	x0, eq	// eq = none
   a0088:	d65f03c0 	ret

Disassembly of section .fini:
