Dump of assembler code from 0xfffff7fa0000 to 0xfffff7fa2000:
   0x0000fffff7fa0000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa0004:	910003fd	mov	x29, sp
   0x0000fffff7fa0008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa000c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa0010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa0014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa0018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa001c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa0020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa0024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa0028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa002c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa0030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa0034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa0038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fa003c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa0040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0044:	d63f0200	blr	x16
   0x0000fffff7fa0048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa004c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa0050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa0054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa0058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa005c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa0060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa0064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa0068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa006c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fa0070:	36d801d1	tbz	w17, #27, 0xfffff7fa00a8
   0x0000fffff7fa0074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa007c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0080:	54000281	b.ne	0xfffff7fa00d0  // b.any
   0x0000fffff7fa0084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fa0088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa008c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa009c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa00a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa00a4:	54000169	b.ls	0xfffff7fa00d0  // b.plast
   0x0000fffff7fa00a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa00ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa00b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa00b4:	36d80091	tbz	w17, #27, 0xfffff7fa00c4
   0x0000fffff7fa00b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa00bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa00c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa00c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fa00c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fa00cc:	1400000e	b	0xfffff7fa0104
   0x0000fffff7fa00d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa00d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa00d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa00dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa00e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa00e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa00e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa00ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa00f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa00f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa00f8:	d63f0200	blr	x16
   0x0000fffff7fa00fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0100:	5400d920	b.eq	0xfffff7fa1c24  // b.none
   0x0000fffff7fa0104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa0108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa010c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fa0110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa0114:	36d80211	tbz	w17, #27, 0xfffff7fa0154
   0x0000fffff7fa0118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa011c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0124:	540001e1	b.ne	0xfffff7fa0160  // b.any
   0x0000fffff7fa0128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa012c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa013c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0148:	540000c9	b.ls	0xfffff7fa0160  // b.plast
   0x0000fffff7fa014c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa0158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa015c:	1400000e	b	0xfffff7fa0194
   0x0000fffff7fa0160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0168:	aa1303e1	mov	x1, x19
   0x0000fffff7fa016c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa0174:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0178:	aa1603e5	mov	x5, x22
   0x0000fffff7fa017c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa0180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0188:	d63f0200	blr	x16
   0x0000fffff7fa018c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0190:	5400d4e0	b.eq	0xfffff7fa1c2c  // b.none
   0x0000fffff7fa0194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa0198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa019c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa01a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa01a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa01a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa01ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa01b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa01b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa01b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa01bc:	d63f0200	blr	x16
   0x0000fffff7fa01c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa01c4:	5400d380	b.eq	0xfffff7fa1c34  // b.none
   0x0000fffff7fa01c8:	14000001	b	0xfffff7fa01cc
   0x0000fffff7fa01cc:	14000001	b	0xfffff7fa01d0
   0x0000fffff7fa01d0:	14000001	b	0xfffff7fa01d4
   0x0000fffff7fa01d4:	14000001	b	0xfffff7fa01d8
   0x0000fffff7fa01d8:	14000001	b	0xfffff7fa01dc
   0x0000fffff7fa01dc:	14000001	b	0xfffff7fa01e0
   0x0000fffff7fa01e0:	14000001	b	0xfffff7fa01e4
   0x0000fffff7fa01e4:	14000001	b	0xfffff7fa01e8
   0x0000fffff7fa01e8:	14000001	b	0xfffff7fa01ec
   0x0000fffff7fa01ec:	14000001	b	0xfffff7fa01f0
   0x0000fffff7fa01f0:	14000001	b	0xfffff7fa01f4
   0x0000fffff7fa01f4:	14000001	b	0xfffff7fa01f8
   0x0000fffff7fa01f8:	14000001	b	0xfffff7fa01fc
   0x0000fffff7fa01fc:	14000001	b	0xfffff7fa0200
   0x0000fffff7fa0200:	14000001	b	0xfffff7fa0204
   0x0000fffff7fa0204:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa0208:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa020c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa0210:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa0214:	36d80211	tbz	w17, #27, 0xfffff7fa0254
   0x0000fffff7fa0218:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa021c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0220:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0224:	540001e1	b.ne	0xfffff7fa0260  // b.any
   0x0000fffff7fa0228:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa022c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0230:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0234:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0238:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa023c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0240:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0244:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0248:	540000c9	b.ls	0xfffff7fa0260  // b.plast
   0x0000fffff7fa024c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0250:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0254:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa0258:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa025c:	1400000e	b	0xfffff7fa0294
   0x0000fffff7fa0260:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0264:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0268:	aa1303e1	mov	x1, x19
   0x0000fffff7fa026c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0270:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa0274:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0278:	aa1603e5	mov	x5, x22
   0x0000fffff7fa027c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa0280:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0284:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0288:	d63f0200	blr	x16
   0x0000fffff7fa028c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0290:	5400cd60	b.eq	0xfffff7fa1c3c  // b.none
   0x0000fffff7fa0294:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0298:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa029c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa02a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa02a4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa02a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa02ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa02b0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa02b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa02b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa02bc:	d63f0200	blr	x16
   0x0000fffff7fa02c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa02c4:	5400cc00	b.eq	0xfffff7fa1c44  // b.none
   0x0000fffff7fa02c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa02cc:	37d806a9	tbnz	w9, #27, 0xfffff7fa03a0
   0x0000fffff7fa02d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa02d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa02d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa02dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa02e0:	540001c1	b.ne	0xfffff7fa0318  // b.any
   0x0000fffff7fa02e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa02e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa02ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa02f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa02f4:	54000121	b.ne	0xfffff7fa0318  // b.any
   0x0000fffff7fa02f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa02fc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa0300:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa0304:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0308:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa030c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa0310:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa0314:	14000030	b	0xfffff7fa03d4
   0x0000fffff7fa0318:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa031c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0324:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0328:	54000120	b.eq	0xfffff7fa034c  // b.none
   0x0000fffff7fa032c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0338:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa033c:	54000321	b.ne	0xfffff7fa03a0  // b.any
   0x0000fffff7fa0340:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa0344:	9e620120	scvtf	d0, x9
   0x0000fffff7fa0348:	14000002	b	0xfffff7fa0350
   0x0000fffff7fa034c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa0350:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0354:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa035c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0360:	54000120	b.eq	0xfffff7fa0384  // b.none
   0x0000fffff7fa0364:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0368:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa036c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0370:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0374:	54000161	b.ne	0xfffff7fa03a0  // b.any
   0x0000fffff7fa0378:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa037c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa0380:	14000002	b	0xfffff7fa0388
   0x0000fffff7fa0384:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa0388:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa038c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa0390:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0398:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa039c:	17ffffde	b	0xfffff7fa0314
   0x0000fffff7fa03a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa03a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa03a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa03ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa03b0:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa03b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa03b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa03bc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa03c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa03c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa03c8:	d63f0200	blr	x16
   0x0000fffff7fa03cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa03d0:	5400c3e0	b.eq	0xfffff7fa1c4c  // b.none
   0x0000fffff7fa03d4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa03d8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa03dc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa03e0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa03e4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa03e8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa03ec:	36d801d1	tbz	w17, #27, 0xfffff7fa0424
   0x0000fffff7fa03f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa03f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa03f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa03fc:	54000281	b.ne	0xfffff7fa044c  // b.any
   0x0000fffff7fa0400:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa0404:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0408:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa040c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0410:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0414:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0418:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa041c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0420:	54000169	b.ls	0xfffff7fa044c  // b.plast
   0x0000fffff7fa0424:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0428:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa042c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0430:	36d80091	tbz	w17, #27, 0xfffff7fa0440
   0x0000fffff7fa0434:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0438:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa043c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0440:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa0444:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa0448:	1400000e	b	0xfffff7fa0480
   0x0000fffff7fa044c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0450:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0454:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0458:	aa1503e2	mov	x2, x21
   0x0000fffff7fa045c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa0460:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0464:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0468:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa046c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0470:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0474:	d63f0200	blr	x16
   0x0000fffff7fa0478:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa047c:	5400bec0	b.eq	0xfffff7fa1c54  // b.none
   0x0000fffff7fa0480:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa0484:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0488:	540003a0	b.eq	0xfffff7fa04fc  // b.none
   0x0000fffff7fa048c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa0490:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa0494:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa0498:	36d801d1	tbz	w17, #27, 0xfffff7fa04d0
   0x0000fffff7fa049c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa04a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa04a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa04a8:	540002a1	b.ne	0xfffff7fa04fc  // b.any
   0x0000fffff7fa04ac:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa04b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa04b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa04b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa04bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa04c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa04c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa04c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa04cc:	54000189	b.ls	0xfffff7fa04fc  // b.plast
   0x0000fffff7fa04d0:	36d8008d	tbz	w13, #27, 0xfffff7fa04e0
   0x0000fffff7fa04d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa04d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa04dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa04e0:	36d80091	tbz	w17, #27, 0xfffff7fa04f0
   0x0000fffff7fa04e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa04e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa04ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa04f0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa04f4:	b900016d	str	w13, [x11]
   0x0000fffff7fa04f8:	1400000e	b	0xfffff7fa0530
   0x0000fffff7fa04fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa0500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0504:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0508:	aa1503e2	mov	x2, x21
   0x0000fffff7fa050c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa0510:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0514:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0518:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa051c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0524:	d63f0200	blr	x16
   0x0000fffff7fa0528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa052c:	5400b980	b.eq	0xfffff7fa1c5c  // b.none
   0x0000fffff7fa0530:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa0534:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0538:	540004a0	b.eq	0xfffff7fa05cc  // b.none
   0x0000fffff7fa053c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa0540:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa0544:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa0548:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa054c:	54000400	b.eq	0xfffff7fa05cc  // b.none
   0x0000fffff7fa0550:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa0554:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa0558:	36d801d1	tbz	w17, #27, 0xfffff7fa0590
   0x0000fffff7fa055c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0560:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0564:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0568:	54000321	b.ne	0xfffff7fa05cc  // b.any
   0x0000fffff7fa056c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa0570:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0574:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0578:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa057c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0580:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0584:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0588:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa058c:	54000209	b.ls	0xfffff7fa05cc  // b.plast
   0x0000fffff7fa0590:	36d8008d	tbz	w13, #27, 0xfffff7fa05a0
   0x0000fffff7fa0594:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0598:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa059c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa05a0:	36d80091	tbz	w17, #27, 0xfffff7fa05b0
   0x0000fffff7fa05a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa05a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa05ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa05b0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa05b4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa05b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa05bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa05c0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa05c4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa05c8:	1400000e	b	0xfffff7fa0600
   0x0000fffff7fa05cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa05d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa05d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa05d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa05dc:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa05e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa05e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa05e8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa05ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa05f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa05f4:	d63f0200	blr	x16
   0x0000fffff7fa05f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa05fc:	5400b340	b.eq	0xfffff7fa1c64  // b.none
   0x0000fffff7fa0600:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0604:	37d806a9	tbnz	w9, #27, 0xfffff7fa06d8
   0x0000fffff7fa0608:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa060c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0614:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0618:	540001c1	b.ne	0xfffff7fa0650  // b.any
   0x0000fffff7fa061c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa062c:	54000121	b.ne	0xfffff7fa0650  // b.any
   0x0000fffff7fa0630:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa0634:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa0638:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa063c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0644:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa0648:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa064c:	14000030	b	0xfffff7fa070c
   0x0000fffff7fa0650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0654:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa065c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0660:	54000120	b.eq	0xfffff7fa0684  // b.none
   0x0000fffff7fa0664:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa066c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0674:	54000321	b.ne	0xfffff7fa06d8  // b.any
   0x0000fffff7fa0678:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa067c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa0680:	14000002	b	0xfffff7fa0688
   0x0000fffff7fa0684:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa0688:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa068c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0698:	54000120	b.eq	0xfffff7fa06bc  // b.none
   0x0000fffff7fa069c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa06a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa06a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa06a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa06ac:	54000161	b.ne	0xfffff7fa06d8  // b.any
   0x0000fffff7fa06b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa06b4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa06b8:	14000002	b	0xfffff7fa06c0
   0x0000fffff7fa06bc:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa06c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa06c4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa06c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa06cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa06d0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa06d4:	17ffffde	b	0xfffff7fa064c
   0x0000fffff7fa06d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa06dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa06e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa06e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa06e8:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa06ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fa06f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa06f4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa06f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa06fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0700:	d63f0200	blr	x16
   0x0000fffff7fa0704:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0708:	5400ab20	b.eq	0xfffff7fa1c6c  // b.none
   0x0000fffff7fa070c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa0710:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa0714:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa0718:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa071c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa0720:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa0724:	36d801d1	tbz	w17, #27, 0xfffff7fa075c
   0x0000fffff7fa0728:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa072c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0730:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0734:	54000281	b.ne	0xfffff7fa0784  // b.any
   0x0000fffff7fa0738:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa073c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0740:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0744:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0748:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa074c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0750:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0754:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0758:	54000169	b.ls	0xfffff7fa0784  // b.plast
   0x0000fffff7fa075c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0760:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0764:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0768:	36d80091	tbz	w17, #27, 0xfffff7fa0778
   0x0000fffff7fa076c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0770:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0774:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0778:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa077c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa0780:	1400000e	b	0xfffff7fa07b8
   0x0000fffff7fa0784:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0788:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa078c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0790:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0794:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa0798:	aa1403e4	mov	x4, x20
   0x0000fffff7fa079c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa07a0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa07a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa07a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa07ac:	d63f0200	blr	x16
   0x0000fffff7fa07b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa07b4:	5400a600	b.eq	0xfffff7fa1c74  // b.none
   0x0000fffff7fa07b8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa07bc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa07c0:	540003a0	b.eq	0xfffff7fa0834  // b.none
   0x0000fffff7fa07c4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa07c8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa07cc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa07d0:	36d801d1	tbz	w17, #27, 0xfffff7fa0808
   0x0000fffff7fa07d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa07d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa07dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa07e0:	540002a1	b.ne	0xfffff7fa0834  // b.any
   0x0000fffff7fa07e4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa07e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa07ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa07f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa07f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa07f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa07fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0800:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0804:	54000189	b.ls	0xfffff7fa0834  // b.plast
   0x0000fffff7fa0808:	36d8008d	tbz	w13, #27, 0xfffff7fa0818
   0x0000fffff7fa080c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0810:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0814:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0818:	36d80091	tbz	w17, #27, 0xfffff7fa0828
   0x0000fffff7fa081c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0820:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0824:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0828:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa082c:	b900016d	str	w13, [x11]
   0x0000fffff7fa0830:	1400000e	b	0xfffff7fa0868
   0x0000fffff7fa0834:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa0838:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa083c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0840:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0844:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa0848:	aa1403e4	mov	x4, x20
   0x0000fffff7fa084c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0850:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa0854:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0858:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa085c:	d63f0200	blr	x16
   0x0000fffff7fa0860:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0864:	5400a0c0	b.eq	0xfffff7fa1c7c  // b.none
   0x0000fffff7fa0868:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa086c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0870:	540004a0	b.eq	0xfffff7fa0904  // b.none
   0x0000fffff7fa0874:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa0878:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa087c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa0880:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa0884:	54000400	b.eq	0xfffff7fa0904  // b.none
   0x0000fffff7fa0888:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa088c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa0890:	36d801d1	tbz	w17, #27, 0xfffff7fa08c8
   0x0000fffff7fa0894:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0898:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa089c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa08a0:	54000321	b.ne	0xfffff7fa0904  // b.any
   0x0000fffff7fa08a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa08a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa08ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa08b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa08b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa08b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa08bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa08c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa08c4:	54000209	b.ls	0xfffff7fa0904  // b.plast
   0x0000fffff7fa08c8:	36d8008d	tbz	w13, #27, 0xfffff7fa08d8
   0x0000fffff7fa08cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa08d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa08d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa08d8:	36d80091	tbz	w17, #27, 0xfffff7fa08e8
   0x0000fffff7fa08dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa08e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa08e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa08e8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa08ec:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa08f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa08f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa08f8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa08fc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa0900:	1400000e	b	0xfffff7fa0938
   0x0000fffff7fa0904:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa090c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0910:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0914:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa0918:	aa1403e4	mov	x4, x20
   0x0000fffff7fa091c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0920:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa0924:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa092c:	d63f0200	blr	x16
   0x0000fffff7fa0930:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0934:	54009a80	b.eq	0xfffff7fa1c84  // b.none
   0x0000fffff7fa0938:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa093c:	37d806a9	tbnz	w9, #27, 0xfffff7fa0a10
   0x0000fffff7fa0940:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa094c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0950:	540001c1	b.ne	0xfffff7fa0988  // b.any
   0x0000fffff7fa0954:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa095c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0964:	54000121	b.ne	0xfffff7fa0988  // b.any
   0x0000fffff7fa0968:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa096c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa0970:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa0974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa097c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa0980:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa0984:	14000030	b	0xfffff7fa0a44
   0x0000fffff7fa0988:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa098c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0994:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0998:	54000120	b.eq	0xfffff7fa09bc  // b.none
   0x0000fffff7fa099c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa09a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa09a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa09a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa09ac:	54000321	b.ne	0xfffff7fa0a10  // b.any
   0x0000fffff7fa09b0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa09b4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa09b8:	14000002	b	0xfffff7fa09c0
   0x0000fffff7fa09bc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa09c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa09c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa09c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa09cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa09d0:	54000120	b.eq	0xfffff7fa09f4  // b.none
   0x0000fffff7fa09d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa09d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa09dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa09e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa09e4:	54000161	b.ne	0xfffff7fa0a10  // b.any
   0x0000fffff7fa09e8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa09ec:	9e620121	scvtf	d1, x9
   0x0000fffff7fa09f0:	14000002	b	0xfffff7fa09f8
   0x0000fffff7fa09f4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa09f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa09fc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa0a00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0a04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0a08:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa0a0c:	17ffffde	b	0xfffff7fa0984
   0x0000fffff7fa0a10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0a14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0a18:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0a1c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0a20:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa0a24:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0a28:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0a2c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa0a30:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0a34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0a38:	d63f0200	blr	x16
   0x0000fffff7fa0a3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0a40:	54009260	b.eq	0xfffff7fa1c8c  // b.none
   0x0000fffff7fa0a44:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa0a48:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa0a4c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa0a50:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa0a54:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa0a58:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa0a5c:	36d801d1	tbz	w17, #27, 0xfffff7fa0a94
   0x0000fffff7fa0a60:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0a64:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0a68:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0a6c:	54000281	b.ne	0xfffff7fa0abc  // b.any
   0x0000fffff7fa0a70:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa0a74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0a78:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0a7c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0a80:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0a84:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0a88:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0a8c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0a90:	54000169	b.ls	0xfffff7fa0abc  // b.plast
   0x0000fffff7fa0a94:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0a98:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0a9c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0aa0:	36d80091	tbz	w17, #27, 0xfffff7fa0ab0
   0x0000fffff7fa0aa4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0aa8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0aac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0ab0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa0ab4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa0ab8:	1400000e	b	0xfffff7fa0af0
   0x0000fffff7fa0abc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0ac0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0ac4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0ac8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0acc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa0ad0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0ad4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0ad8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa0adc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0ae0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0ae4:	d63f0200	blr	x16
   0x0000fffff7fa0ae8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0aec:	54008d40	b.eq	0xfffff7fa1c94  // b.none
   0x0000fffff7fa0af0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa0af4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0af8:	540003a0	b.eq	0xfffff7fa0b6c  // b.none
   0x0000fffff7fa0afc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa0b00:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa0b04:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa0b08:	36d801d1	tbz	w17, #27, 0xfffff7fa0b40
   0x0000fffff7fa0b0c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0b10:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0b14:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0b18:	540002a1	b.ne	0xfffff7fa0b6c  // b.any
   0x0000fffff7fa0b1c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa0b20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0b24:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0b28:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0b2c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0b30:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0b34:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0b38:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0b3c:	54000189	b.ls	0xfffff7fa0b6c  // b.plast
   0x0000fffff7fa0b40:	36d8008d	tbz	w13, #27, 0xfffff7fa0b50
   0x0000fffff7fa0b44:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0b48:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0b4c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0b50:	36d80091	tbz	w17, #27, 0xfffff7fa0b60
   0x0000fffff7fa0b54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0b58:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0b5c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0b60:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa0b64:	b900016d	str	w13, [x11]
   0x0000fffff7fa0b68:	1400000e	b	0xfffff7fa0ba0
   0x0000fffff7fa0b6c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa0b70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0b74:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0b78:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0b7c:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa0b80:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0b84:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0b88:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa0b8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0b90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0b94:	d63f0200	blr	x16
   0x0000fffff7fa0b98:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0b9c:	54008800	b.eq	0xfffff7fa1c9c  // b.none
   0x0000fffff7fa0ba0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa0ba4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0ba8:	540004a0	b.eq	0xfffff7fa0c3c  // b.none
   0x0000fffff7fa0bac:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa0bb0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa0bb4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa0bb8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa0bbc:	54000400	b.eq	0xfffff7fa0c3c  // b.none
   0x0000fffff7fa0bc0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa0bc4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa0bc8:	36d801d1	tbz	w17, #27, 0xfffff7fa0c00
   0x0000fffff7fa0bcc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0bd0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0bd4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0bd8:	54000321	b.ne	0xfffff7fa0c3c  // b.any
   0x0000fffff7fa0bdc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa0be0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0be4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0be8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0bec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0bf0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0bf4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0bf8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0bfc:	54000209	b.ls	0xfffff7fa0c3c  // b.plast
   0x0000fffff7fa0c00:	36d8008d	tbz	w13, #27, 0xfffff7fa0c10
   0x0000fffff7fa0c04:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0c08:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0c0c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0c10:	36d80091	tbz	w17, #27, 0xfffff7fa0c20
   0x0000fffff7fa0c14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0c18:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0c1c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0c20:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa0c24:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa0c28:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa0c2c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa0c30:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa0c34:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa0c38:	1400000e	b	0xfffff7fa0c70
   0x0000fffff7fa0c3c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0c40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0c44:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0c48:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0c4c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa0c50:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0c54:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0c58:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa0c5c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0c60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0c64:	d63f0200	blr	x16
   0x0000fffff7fa0c68:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0c6c:	540081c0	b.eq	0xfffff7fa1ca4  // b.none
   0x0000fffff7fa0c70:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0c74:	37d806a9	tbnz	w9, #27, 0xfffff7fa0d48
   0x0000fffff7fa0c78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0c7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0c80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0c84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0c88:	540001c1	b.ne	0xfffff7fa0cc0  // b.any
   0x0000fffff7fa0c8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0c90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0c94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0c98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0c9c:	54000121	b.ne	0xfffff7fa0cc0  // b.any
   0x0000fffff7fa0ca0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa0ca4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa0ca8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa0cac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0cb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0cb4:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa0cb8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa0cbc:	14000030	b	0xfffff7fa0d7c
   0x0000fffff7fa0cc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0cc4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0cc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0ccc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0cd0:	54000120	b.eq	0xfffff7fa0cf4  // b.none
   0x0000fffff7fa0cd4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0cd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0cdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0ce0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0ce4:	54000321	b.ne	0xfffff7fa0d48  // b.any
   0x0000fffff7fa0ce8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa0cec:	9e620120	scvtf	d0, x9
   0x0000fffff7fa0cf0:	14000002	b	0xfffff7fa0cf8
   0x0000fffff7fa0cf4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa0cf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0cfc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0d04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0d08:	54000120	b.eq	0xfffff7fa0d2c  // b.none
   0x0000fffff7fa0d0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0d10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0d14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0d18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0d1c:	54000161	b.ne	0xfffff7fa0d48  // b.any
   0x0000fffff7fa0d20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa0d24:	9e620121	scvtf	d1, x9
   0x0000fffff7fa0d28:	14000002	b	0xfffff7fa0d30
   0x0000fffff7fa0d2c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa0d30:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa0d34:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa0d38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0d3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0d40:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa0d44:	17ffffde	b	0xfffff7fa0cbc
   0x0000fffff7fa0d48:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0d4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0d50:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0d54:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0d58:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa0d5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0d60:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0d64:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa0d68:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0d6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0d70:	d63f0200	blr	x16
   0x0000fffff7fa0d74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0d78:	540079a0	b.eq	0xfffff7fa1cac  // b.none
   0x0000fffff7fa0d7c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa0d80:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa0d84:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa0d88:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa0d8c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa0d90:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa0d94:	36d801d1	tbz	w17, #27, 0xfffff7fa0dcc
   0x0000fffff7fa0d98:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0d9c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0da0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0da4:	54000281	b.ne	0xfffff7fa0df4  // b.any
   0x0000fffff7fa0da8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa0dac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0db0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0db4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0db8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0dbc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0dc0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0dc4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0dc8:	54000169	b.ls	0xfffff7fa0df4  // b.plast
   0x0000fffff7fa0dcc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0dd0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0dd4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0dd8:	36d80091	tbz	w17, #27, 0xfffff7fa0de8
   0x0000fffff7fa0ddc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0de0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0de4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0de8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa0dec:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa0df0:	1400000e	b	0xfffff7fa0e28
   0x0000fffff7fa0df4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0df8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0dfc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0e00:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0e04:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa0e08:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0e0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0e10:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa0e14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0e18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0e1c:	d63f0200	blr	x16
   0x0000fffff7fa0e20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0e24:	54007480	b.eq	0xfffff7fa1cb4  // b.none
   0x0000fffff7fa0e28:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa0e2c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0e30:	540003a0	b.eq	0xfffff7fa0ea4  // b.none
   0x0000fffff7fa0e34:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa0e38:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa0e3c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa0e40:	36d801d1	tbz	w17, #27, 0xfffff7fa0e78
   0x0000fffff7fa0e44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0e48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0e4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0e50:	540002a1	b.ne	0xfffff7fa0ea4  // b.any
   0x0000fffff7fa0e54:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa0e58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0e5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0e60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0e64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0e68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0e6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0e70:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0e74:	54000189	b.ls	0xfffff7fa0ea4  // b.plast
   0x0000fffff7fa0e78:	36d8008d	tbz	w13, #27, 0xfffff7fa0e88
   0x0000fffff7fa0e7c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0e80:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0e84:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0e88:	36d80091	tbz	w17, #27, 0xfffff7fa0e98
   0x0000fffff7fa0e8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0e90:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0e94:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0e98:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa0e9c:	b900016d	str	w13, [x11]
   0x0000fffff7fa0ea0:	1400000e	b	0xfffff7fa0ed8
   0x0000fffff7fa0ea4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa0ea8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0eac:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0eb0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0eb4:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa0eb8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0ebc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0ec0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa0ec4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0ec8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0ecc:	d63f0200	blr	x16
   0x0000fffff7fa0ed0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0ed4:	54006f40	b.eq	0xfffff7fa1cbc  // b.none
   0x0000fffff7fa0ed8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa0edc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0ee0:	540004a0	b.eq	0xfffff7fa0f74  // b.none
   0x0000fffff7fa0ee4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa0ee8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa0eec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa0ef0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa0ef4:	54000400	b.eq	0xfffff7fa0f74  // b.none
   0x0000fffff7fa0ef8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa0efc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa0f00:	36d801d1	tbz	w17, #27, 0xfffff7fa0f38
   0x0000fffff7fa0f04:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0f08:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0f0c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0f10:	54000321	b.ne	0xfffff7fa0f74  // b.any
   0x0000fffff7fa0f14:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa0f18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0f1c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0f20:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0f24:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0f28:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0f2c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0f30:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0f34:	54000209	b.ls	0xfffff7fa0f74  // b.plast
   0x0000fffff7fa0f38:	36d8008d	tbz	w13, #27, 0xfffff7fa0f48
   0x0000fffff7fa0f3c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0f40:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0f44:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0f48:	36d80091	tbz	w17, #27, 0xfffff7fa0f58
   0x0000fffff7fa0f4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0f50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0f54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0f58:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa0f5c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa0f60:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa0f64:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa0f68:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa0f6c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa0f70:	1400000e	b	0xfffff7fa0fa8
   0x0000fffff7fa0f74:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0f78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0f7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0f80:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0f84:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa0f88:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0f8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0f90:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa0f94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0f98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0f9c:	d63f0200	blr	x16
   0x0000fffff7fa0fa0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0fa4:	54006900	b.eq	0xfffff7fa1cc4  // b.none
   0x0000fffff7fa0fa8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0fac:	37d806a9	tbnz	w9, #27, 0xfffff7fa1080
   0x0000fffff7fa0fb0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0fb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0fb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0fbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0fc0:	540001c1	b.ne	0xfffff7fa0ff8  // b.any
   0x0000fffff7fa0fc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0fc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0fcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0fd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0fd4:	54000121	b.ne	0xfffff7fa0ff8  // b.any
   0x0000fffff7fa0fd8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa0fdc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa0fe0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa0fe4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0fe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0fec:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa0ff0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa0ff4:	14000030	b	0xfffff7fa10b4
   0x0000fffff7fa0ff8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa0ffc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1004:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1008:	54000120	b.eq	0xfffff7fa102c  // b.none
   0x0000fffff7fa100c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa1010:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1014:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1018:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa101c:	54000321	b.ne	0xfffff7fa1080  // b.any
   0x0000fffff7fa1020:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa1024:	9e620120	scvtf	d0, x9
   0x0000fffff7fa1028:	14000002	b	0xfffff7fa1030
   0x0000fffff7fa102c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa1030:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1034:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1038:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa103c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1040:	54000120	b.eq	0xfffff7fa1064  // b.none
   0x0000fffff7fa1044:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa104c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1050:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1054:	54000161	b.ne	0xfffff7fa1080  // b.any
   0x0000fffff7fa1058:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa105c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa1060:	14000002	b	0xfffff7fa1068
   0x0000fffff7fa1064:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa1068:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa106c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa1070:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1078:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa107c:	17ffffde	b	0xfffff7fa0ff4
   0x0000fffff7fa1080:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1084:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1088:	aa1303e1	mov	x1, x19
   0x0000fffff7fa108c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1090:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa1094:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1098:	aa1603e5	mov	x5, x22
   0x0000fffff7fa109c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa10a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa10a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa10a8:	d63f0200	blr	x16
   0x0000fffff7fa10ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa10b0:	540060e0	b.eq	0xfffff7fa1ccc  // b.none
   0x0000fffff7fa10b4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa10b8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa10bc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa10c0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa10c4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa10c8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa10cc:	36d801d1	tbz	w17, #27, 0xfffff7fa1104
   0x0000fffff7fa10d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa10d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa10d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa10dc:	54000281	b.ne	0xfffff7fa112c  // b.any
   0x0000fffff7fa10e0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa10e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa10e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa10ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa10f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa10f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa10f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa10fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa1100:	54000169	b.ls	0xfffff7fa112c  // b.plast
   0x0000fffff7fa1104:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1108:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa110c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1110:	36d80091	tbz	w17, #27, 0xfffff7fa1120
   0x0000fffff7fa1114:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1118:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa111c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1120:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa1124:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa1128:	1400000e	b	0xfffff7fa1160
   0x0000fffff7fa112c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1130:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1134:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1138:	aa1503e2	mov	x2, x21
   0x0000fffff7fa113c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa1140:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1144:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1148:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa114c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1150:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1154:	d63f0200	blr	x16
   0x0000fffff7fa1158:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa115c:	54005bc0	b.eq	0xfffff7fa1cd4  // b.none
   0x0000fffff7fa1160:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa1164:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa1168:	540003a0	b.eq	0xfffff7fa11dc  // b.none
   0x0000fffff7fa116c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa1170:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa1174:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa1178:	36d801d1	tbz	w17, #27, 0xfffff7fa11b0
   0x0000fffff7fa117c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1180:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1184:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa1188:	540002a1	b.ne	0xfffff7fa11dc  // b.any
   0x0000fffff7fa118c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa1190:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1194:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1198:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa119c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa11a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa11a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa11a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa11ac:	54000189	b.ls	0xfffff7fa11dc  // b.plast
   0x0000fffff7fa11b0:	36d8008d	tbz	w13, #27, 0xfffff7fa11c0
   0x0000fffff7fa11b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa11b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa11bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa11c0:	36d80091	tbz	w17, #27, 0xfffff7fa11d0
   0x0000fffff7fa11c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa11c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa11cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa11d0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa11d4:	b900016d	str	w13, [x11]
   0x0000fffff7fa11d8:	1400000e	b	0xfffff7fa1210
   0x0000fffff7fa11dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa11e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa11e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa11e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa11ec:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa11f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa11f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa11f8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa11fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1200:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1204:	d63f0200	blr	x16
   0x0000fffff7fa1208:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa120c:	54005680	b.eq	0xfffff7fa1cdc  // b.none
   0x0000fffff7fa1210:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa1214:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa1218:	540004a0	b.eq	0xfffff7fa12ac  // b.none
   0x0000fffff7fa121c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa1220:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa1224:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa1228:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa122c:	54000400	b.eq	0xfffff7fa12ac  // b.none
   0x0000fffff7fa1230:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa1234:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa1238:	36d801d1	tbz	w17, #27, 0xfffff7fa1270
   0x0000fffff7fa123c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1240:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1244:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa1248:	54000321	b.ne	0xfffff7fa12ac  // b.any
   0x0000fffff7fa124c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa1250:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1254:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1258:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa125c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1260:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1264:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa1268:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa126c:	54000209	b.ls	0xfffff7fa12ac  // b.plast
   0x0000fffff7fa1270:	36d8008d	tbz	w13, #27, 0xfffff7fa1280
   0x0000fffff7fa1274:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1278:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa127c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1280:	36d80091	tbz	w17, #27, 0xfffff7fa1290
   0x0000fffff7fa1284:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1288:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa128c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1290:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa1294:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa1298:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa129c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa12a0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa12a4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa12a8:	1400000e	b	0xfffff7fa12e0
   0x0000fffff7fa12ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa12b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa12b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa12b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa12bc:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa12c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa12c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa12c8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa12cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa12d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa12d4:	d63f0200	blr	x16
   0x0000fffff7fa12d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa12dc:	54005040	b.eq	0xfffff7fa1ce4  // b.none
   0x0000fffff7fa12e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa12e4:	37d806a9	tbnz	w9, #27, 0xfffff7fa13b8
   0x0000fffff7fa12e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa12ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa12f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa12f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa12f8:	540001c1	b.ne	0xfffff7fa1330  // b.any
   0x0000fffff7fa12fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1300:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1308:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa130c:	54000121	b.ne	0xfffff7fa1330  // b.any
   0x0000fffff7fa1310:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa1314:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa1318:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa131c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1324:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa1328:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa132c:	14000030	b	0xfffff7fa13ec
   0x0000fffff7fa1330:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa1334:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1338:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa133c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1340:	54000120	b.eq	0xfffff7fa1364  // b.none
   0x0000fffff7fa1344:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa1348:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa134c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1350:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1354:	54000321	b.ne	0xfffff7fa13b8  // b.any
   0x0000fffff7fa1358:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa135c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa1360:	14000002	b	0xfffff7fa1368
   0x0000fffff7fa1364:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa1368:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa136c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1374:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1378:	54000120	b.eq	0xfffff7fa139c  // b.none
   0x0000fffff7fa137c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1380:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1388:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa138c:	54000161	b.ne	0xfffff7fa13b8  // b.any
   0x0000fffff7fa1390:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa1394:	9e620121	scvtf	d1, x9
   0x0000fffff7fa1398:	14000002	b	0xfffff7fa13a0
   0x0000fffff7fa139c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa13a0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa13a4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa13a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa13ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa13b0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa13b4:	17ffffde	b	0xfffff7fa132c
   0x0000fffff7fa13b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa13bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa13c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa13c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa13c8:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa13cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa13d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa13d4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa13d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa13dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa13e0:	d63f0200	blr	x16
   0x0000fffff7fa13e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa13e8:	54004820	b.eq	0xfffff7fa1cec  // b.none
   0x0000fffff7fa13ec:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa13f0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa13f4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa13f8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa13fc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa1400:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa1404:	36d801d1	tbz	w17, #27, 0xfffff7fa143c
   0x0000fffff7fa1408:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa140c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1410:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa1414:	54000281	b.ne	0xfffff7fa1464  // b.any
   0x0000fffff7fa1418:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa141c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1420:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1424:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa1428:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa142c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1430:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa1434:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa1438:	54000169	b.ls	0xfffff7fa1464  // b.plast
   0x0000fffff7fa143c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1440:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa1444:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1448:	36d80091	tbz	w17, #27, 0xfffff7fa1458
   0x0000fffff7fa144c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1450:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa1454:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1458:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa145c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa1460:	1400000e	b	0xfffff7fa1498
   0x0000fffff7fa1464:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1468:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa146c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1470:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1474:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa1478:	aa1403e4	mov	x4, x20
   0x0000fffff7fa147c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1480:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa1484:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1488:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa148c:	d63f0200	blr	x16
   0x0000fffff7fa1490:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1494:	54004300	b.eq	0xfffff7fa1cf4  // b.none
   0x0000fffff7fa1498:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa149c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa14a0:	540003a0	b.eq	0xfffff7fa1514  // b.none
   0x0000fffff7fa14a4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa14a8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa14ac:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa14b0:	36d801d1	tbz	w17, #27, 0xfffff7fa14e8
   0x0000fffff7fa14b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa14b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa14bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa14c0:	540002a1	b.ne	0xfffff7fa1514  // b.any
   0x0000fffff7fa14c4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa14c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa14cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa14d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa14d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa14d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa14dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa14e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa14e4:	54000189	b.ls	0xfffff7fa1514  // b.plast
   0x0000fffff7fa14e8:	36d8008d	tbz	w13, #27, 0xfffff7fa14f8
   0x0000fffff7fa14ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa14f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa14f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa14f8:	36d80091	tbz	w17, #27, 0xfffff7fa1508
   0x0000fffff7fa14fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1500:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa1504:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1508:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa150c:	b900016d	str	w13, [x11]
   0x0000fffff7fa1510:	1400000e	b	0xfffff7fa1548
   0x0000fffff7fa1514:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa1518:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa151c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1520:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1524:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa1528:	aa1403e4	mov	x4, x20
   0x0000fffff7fa152c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1530:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa1534:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1538:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa153c:	d63f0200	blr	x16
   0x0000fffff7fa1540:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1544:	54003dc0	b.eq	0xfffff7fa1cfc  // b.none
   0x0000fffff7fa1548:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa154c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa1550:	540004a0	b.eq	0xfffff7fa15e4  // b.none
   0x0000fffff7fa1554:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa1558:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa155c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa1560:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa1564:	54000400	b.eq	0xfffff7fa15e4  // b.none
   0x0000fffff7fa1568:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa156c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa1570:	36d801d1	tbz	w17, #27, 0xfffff7fa15a8
   0x0000fffff7fa1574:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1578:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa157c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa1580:	54000321	b.ne	0xfffff7fa15e4  // b.any
   0x0000fffff7fa1584:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa1588:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa158c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1590:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa1594:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1598:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa159c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa15a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa15a4:	54000209	b.ls	0xfffff7fa15e4  // b.plast
   0x0000fffff7fa15a8:	36d8008d	tbz	w13, #27, 0xfffff7fa15b8
   0x0000fffff7fa15ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa15b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa15b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa15b8:	36d80091	tbz	w17, #27, 0xfffff7fa15c8
   0x0000fffff7fa15bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa15c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa15c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa15c8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa15cc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa15d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa15d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa15d8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa15dc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa15e0:	1400000e	b	0xfffff7fa1618
   0x0000fffff7fa15e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa15e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa15ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fa15f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa15f4:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa15f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa15fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1600:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa1604:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1608:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa160c:	d63f0200	blr	x16
   0x0000fffff7fa1610:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1614:	54003780	b.eq	0xfffff7fa1d04  // b.none
   0x0000fffff7fa1618:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa161c:	37d806a9	tbnz	w9, #27, 0xfffff7fa16f0
   0x0000fffff7fa1620:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa1624:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa162c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1630:	540001c1	b.ne	0xfffff7fa1668  // b.any
   0x0000fffff7fa1634:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa163c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1640:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1644:	54000121	b.ne	0xfffff7fa1668  // b.any
   0x0000fffff7fa1648:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa164c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa1650:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa1654:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa165c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa1660:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa1664:	14000030	b	0xfffff7fa1724
   0x0000fffff7fa1668:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa166c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1670:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1674:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1678:	54000120	b.eq	0xfffff7fa169c  // b.none
   0x0000fffff7fa167c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa1680:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1688:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa168c:	54000321	b.ne	0xfffff7fa16f0  // b.any
   0x0000fffff7fa1690:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa1694:	9e620120	scvtf	d0, x9
   0x0000fffff7fa1698:	14000002	b	0xfffff7fa16a0
   0x0000fffff7fa169c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa16a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa16a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa16a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa16ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa16b0:	54000120	b.eq	0xfffff7fa16d4  // b.none
   0x0000fffff7fa16b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa16b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa16bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa16c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa16c4:	54000161	b.ne	0xfffff7fa16f0  // b.any
   0x0000fffff7fa16c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa16cc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa16d0:	14000002	b	0xfffff7fa16d8
   0x0000fffff7fa16d4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa16d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa16dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa16e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa16e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa16e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa16ec:	17ffffde	b	0xfffff7fa1664
   0x0000fffff7fa16f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa16f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa16f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa16fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1700:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa1704:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1708:	aa1603e5	mov	x5, x22
   0x0000fffff7fa170c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa1710:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1714:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1718:	d63f0200	blr	x16
   0x0000fffff7fa171c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1720:	54002f60	b.eq	0xfffff7fa1d0c  // b.none
   0x0000fffff7fa1724:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa1728:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa172c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa1730:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa1734:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa1738:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa173c:	36d801d1	tbz	w17, #27, 0xfffff7fa1774
   0x0000fffff7fa1740:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1744:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1748:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa174c:	54000281	b.ne	0xfffff7fa179c  // b.any
   0x0000fffff7fa1750:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa1754:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1758:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa175c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa1760:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1764:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1768:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa176c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa1770:	54000169	b.ls	0xfffff7fa179c  // b.plast
   0x0000fffff7fa1774:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1778:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa177c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1780:	36d80091	tbz	w17, #27, 0xfffff7fa1790
   0x0000fffff7fa1784:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1788:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa178c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1790:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa1794:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa1798:	1400000e	b	0xfffff7fa17d0
   0x0000fffff7fa179c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa17a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa17a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa17a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa17ac:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa17b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa17b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa17b8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa17bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa17c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa17c4:	d63f0200	blr	x16
   0x0000fffff7fa17c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa17cc:	54002a40	b.eq	0xfffff7fa1d14  // b.none
   0x0000fffff7fa17d0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa17d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa17d8:	540003a0	b.eq	0xfffff7fa184c  // b.none
   0x0000fffff7fa17dc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa17e0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa17e4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa17e8:	36d801d1	tbz	w17, #27, 0xfffff7fa1820
   0x0000fffff7fa17ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa17f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa17f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa17f8:	540002a1	b.ne	0xfffff7fa184c  // b.any
   0x0000fffff7fa17fc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa1800:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1804:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1808:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa180c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1810:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1814:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa1818:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa181c:	54000189	b.ls	0xfffff7fa184c  // b.plast
   0x0000fffff7fa1820:	36d8008d	tbz	w13, #27, 0xfffff7fa1830
   0x0000fffff7fa1824:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1828:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa182c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1830:	36d80091	tbz	w17, #27, 0xfffff7fa1840
   0x0000fffff7fa1834:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1838:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa183c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1840:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa1844:	b900016d	str	w13, [x11]
   0x0000fffff7fa1848:	1400000e	b	0xfffff7fa1880
   0x0000fffff7fa184c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa1850:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1854:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1858:	aa1503e2	mov	x2, x21
   0x0000fffff7fa185c:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa1860:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1864:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1868:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa186c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1870:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1874:	d63f0200	blr	x16
   0x0000fffff7fa1878:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa187c:	54002500	b.eq	0xfffff7fa1d1c  // b.none
   0x0000fffff7fa1880:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa1884:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa1888:	540004a0	b.eq	0xfffff7fa191c  // b.none
   0x0000fffff7fa188c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa1890:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa1894:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa1898:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa189c:	54000400	b.eq	0xfffff7fa191c  // b.none
   0x0000fffff7fa18a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa18a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa18a8:	36d801d1	tbz	w17, #27, 0xfffff7fa18e0
   0x0000fffff7fa18ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa18b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa18b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa18b8:	54000321	b.ne	0xfffff7fa191c  // b.any
   0x0000fffff7fa18bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa18c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa18c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa18c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa18cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa18d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa18d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa18d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa18dc:	54000209	b.ls	0xfffff7fa191c  // b.plast
   0x0000fffff7fa18e0:	36d8008d	tbz	w13, #27, 0xfffff7fa18f0
   0x0000fffff7fa18e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa18e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa18ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa18f0:	36d80091	tbz	w17, #27, 0xfffff7fa1900
   0x0000fffff7fa18f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa18f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa18fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1900:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa1904:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa1908:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa190c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa1910:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa1914:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa1918:	1400000e	b	0xfffff7fa1950
   0x0000fffff7fa191c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa1920:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1924:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1928:	aa1503e2	mov	x2, x21
   0x0000fffff7fa192c:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa1930:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1934:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1938:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa193c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1940:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1944:	d63f0200	blr	x16
   0x0000fffff7fa1948:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa194c:	54001ec0	b.eq	0xfffff7fa1d24  // b.none
   0x0000fffff7fa1950:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa1954:	37d806a9	tbnz	w9, #27, 0xfffff7fa1a28
   0x0000fffff7fa1958:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa195c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1964:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1968:	540001c1	b.ne	0xfffff7fa19a0  // b.any
   0x0000fffff7fa196c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1970:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1978:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa197c:	54000121	b.ne	0xfffff7fa19a0  // b.any
   0x0000fffff7fa1980:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa1984:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa1988:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa198c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1994:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa1998:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa199c:	14000030	b	0xfffff7fa1a5c
   0x0000fffff7fa19a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa19a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa19a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa19ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa19b0:	54000120	b.eq	0xfffff7fa19d4  // b.none
   0x0000fffff7fa19b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa19b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa19bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa19c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa19c4:	54000321	b.ne	0xfffff7fa1a28  // b.any
   0x0000fffff7fa19c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa19cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa19d0:	14000002	b	0xfffff7fa19d8
   0x0000fffff7fa19d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa19d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa19dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa19e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa19e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa19e8:	54000120	b.eq	0xfffff7fa1a0c  // b.none
   0x0000fffff7fa19ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa19f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa19f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa19f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa19fc:	54000161	b.ne	0xfffff7fa1a28  // b.any
   0x0000fffff7fa1a00:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa1a04:	9e620121	scvtf	d1, x9
   0x0000fffff7fa1a08:	14000002	b	0xfffff7fa1a10
   0x0000fffff7fa1a0c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa1a10:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa1a14:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa1a18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1a1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1a20:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa1a24:	17ffffde	b	0xfffff7fa199c
   0x0000fffff7fa1a28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1a2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1a30:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1a34:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1a38:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fa1a3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1a40:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1a44:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa1a48:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1a4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1a50:	d63f0200	blr	x16
   0x0000fffff7fa1a54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1a58:	540016a0	b.eq	0xfffff7fa1d2c  // b.none
   0x0000fffff7fa1a5c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa1a60:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa1a64:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa1a68:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa1a6c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa1a70:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa1a74:	36d801d1	tbz	w17, #27, 0xfffff7fa1aac
   0x0000fffff7fa1a78:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1a7c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1a80:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa1a84:	54000281	b.ne	0xfffff7fa1ad4  // b.any
   0x0000fffff7fa1a88:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa1a8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1a90:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1a94:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa1a98:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1a9c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1aa0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa1aa4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa1aa8:	54000169	b.ls	0xfffff7fa1ad4  // b.plast
   0x0000fffff7fa1aac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1ab0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa1ab4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1ab8:	36d80091	tbz	w17, #27, 0xfffff7fa1ac8
   0x0000fffff7fa1abc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1ac0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa1ac4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1ac8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa1acc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa1ad0:	1400000e	b	0xfffff7fa1b08
   0x0000fffff7fa1ad4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1ad8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1adc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1ae0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1ae4:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7fa1ae8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1aec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1af0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa1af4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1af8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1afc:	d63f0200	blr	x16
   0x0000fffff7fa1b00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1b04:	54001180	b.eq	0xfffff7fa1d34  // b.none
   0x0000fffff7fa1b08:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa1b0c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa1b10:	540003a0	b.eq	0xfffff7fa1b84  // b.none
   0x0000fffff7fa1b14:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa1b18:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa1b1c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa1b20:	36d801d1	tbz	w17, #27, 0xfffff7fa1b58
   0x0000fffff7fa1b24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1b28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1b2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa1b30:	540002a1	b.ne	0xfffff7fa1b84  // b.any
   0x0000fffff7fa1b34:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa1b38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1b3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1b40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa1b44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1b48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1b4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa1b50:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa1b54:	54000189	b.ls	0xfffff7fa1b84  // b.plast
   0x0000fffff7fa1b58:	36d8008d	tbz	w13, #27, 0xfffff7fa1b68
   0x0000fffff7fa1b5c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1b60:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa1b64:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1b68:	36d80091	tbz	w17, #27, 0xfffff7fa1b78
   0x0000fffff7fa1b6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1b70:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa1b74:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1b78:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa1b7c:	b900016d	str	w13, [x11]
   0x0000fffff7fa1b80:	1400000e	b	0xfffff7fa1bb8
   0x0000fffff7fa1b84:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa1b88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1b8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1b90:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1b94:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7fa1b98:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1b9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1ba0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa1ba4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1ba8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1bac:	d63f0200	blr	x16
   0x0000fffff7fa1bb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1bb4:	54000c40	b.eq	0xfffff7fa1d3c  // b.none
   0x0000fffff7fa1bb8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1bbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1bc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1bc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1bc8:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7fa1bcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1bd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1bd4:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fa1bd8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1bdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1be0:	d63f0200	blr	x16
   0x0000fffff7fa1be4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa1be8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa1bec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa1bf0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa1bf4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa1bf8:	d65f03c0	ret
   0x0000fffff7fa1bfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1c00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1c04:	b900028a	str	w10, [x20]
   0x0000fffff7fa1c08:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa1c0c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa1c10:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa1c14:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa1c18:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa1c1c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa1c20:	d65f03c0	ret
   0x0000fffff7fa1c24:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa1c28:	17fffff5	b	0xfffff7fa1bfc
   0x0000fffff7fa1c2c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa1c30:	17fffff3	b	0xfffff7fa1bfc
   0x0000fffff7fa1c34:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa1c38:	17fffff1	b	0xfffff7fa1bfc
   0x0000fffff7fa1c3c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa1c40:	17ffffef	b	0xfffff7fa1bfc
   0x0000fffff7fa1c44:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa1c48:	17ffffed	b	0xfffff7fa1bfc
   0x0000fffff7fa1c4c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa1c50:	17ffffeb	b	0xfffff7fa1bfc
   0x0000fffff7fa1c54:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa1c58:	17ffffe9	b	0xfffff7fa1bfc
   0x0000fffff7fa1c5c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa1c60:	17ffffe7	b	0xfffff7fa1bfc
   0x0000fffff7fa1c64:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa1c68:	17ffffe5	b	0xfffff7fa1bfc
   0x0000fffff7fa1c6c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa1c70:	17ffffe3	b	0xfffff7fa1bfc
   0x0000fffff7fa1c74:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa1c78:	17ffffe1	b	0xfffff7fa1bfc
   0x0000fffff7fa1c7c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa1c80:	17ffffdf	b	0xfffff7fa1bfc
   0x0000fffff7fa1c84:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa1c88:	17ffffdd	b	0xfffff7fa1bfc
   0x0000fffff7fa1c8c:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa1c90:	17ffffdb	b	0xfffff7fa1bfc
   0x0000fffff7fa1c94:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa1c98:	17ffffd9	b	0xfffff7fa1bfc
   0x0000fffff7fa1c9c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa1ca0:	17ffffd7	b	0xfffff7fa1bfc
   0x0000fffff7fa1ca4:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa1ca8:	17ffffd5	b	0xfffff7fa1bfc
   0x0000fffff7fa1cac:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa1cb0:	17ffffd3	b	0xfffff7fa1bfc
   0x0000fffff7fa1cb4:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa1cb8:	17ffffd1	b	0xfffff7fa1bfc
   0x0000fffff7fa1cbc:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa1cc0:	17ffffcf	b	0xfffff7fa1bfc
   0x0000fffff7fa1cc4:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa1cc8:	17ffffcd	b	0xfffff7fa1bfc
   0x0000fffff7fa1ccc:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa1cd0:	17ffffcb	b	0xfffff7fa1bfc
   0x0000fffff7fa1cd4:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa1cd8:	17ffffc9	b	0xfffff7fa1bfc
   0x0000fffff7fa1cdc:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa1ce0:	17ffffc7	b	0xfffff7fa1bfc
   0x0000fffff7fa1ce4:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa1ce8:	17ffffc5	b	0xfffff7fa1bfc
   0x0000fffff7fa1cec:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa1cf0:	17ffffc3	b	0xfffff7fa1bfc
   0x0000fffff7fa1cf4:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa1cf8:	17ffffc1	b	0xfffff7fa1bfc
   0x0000fffff7fa1cfc:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa1d00:	17ffffbf	b	0xfffff7fa1bfc
   0x0000fffff7fa1d04:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa1d08:	17ffffbd	b	0xfffff7fa1bfc
   0x0000fffff7fa1d0c:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa1d10:	17ffffbb	b	0xfffff7fa1bfc
   0x0000fffff7fa1d14:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa1d18:	17ffffb9	b	0xfffff7fa1bfc
   0x0000fffff7fa1d1c:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa1d20:	17ffffb7	b	0xfffff7fa1bfc
   0x0000fffff7fa1d24:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fa1d28:	17ffffb5	b	0xfffff7fa1bfc
   0x0000fffff7fa1d2c:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7fa1d30:	17ffffb3	b	0xfffff7fa1bfc
   0x0000fffff7fa1d34:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7fa1d38:	17ffffb1	b	0xfffff7fa1bfc
   0x0000fffff7fa1d3c:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7fa1d40:	17ffffaf	b	0xfffff7fa1bfc
   0x0000fffff7fa1d44:	00000000	udf	#0
   0x0000fffff7fa1d48:	00000000	udf	#0
   0x0000fffff7fa1d4c:	00000000	udf	#0
   0x0000fffff7fa1d50:	00000000	udf	#0
   0x0000fffff7fa1d54:	00000000	udf	#0
   0x0000fffff7fa1d58:	00000000	udf	#0
   0x0000fffff7fa1d5c:	00000000	udf	#0
   0x0000fffff7fa1d60:	00000000	udf	#0
   0x0000fffff7fa1d64:	00000000	udf	#0
   0x0000fffff7fa1d68:	00000000	udf	#0
   0x0000fffff7fa1d6c:	00000000	udf	#0
   0x0000fffff7fa1d70:	00000000	udf	#0
   0x0000fffff7fa1d74:	00000000	udf	#0
   0x0000fffff7fa1d78:	00000000	udf	#0
   0x0000fffff7fa1d7c:	00000000	udf	#0
   0x0000fffff7fa1d80:	00000000	udf	#0
   0x0000fffff7fa1d84:	00000000	udf	#0
   0x0000fffff7fa1d88:	00000000	udf	#0
   0x0000fffff7fa1d8c:	00000000	udf	#0
   0x0000fffff7fa1d90:	00000000	udf	#0
   0x0000fffff7fa1d94:	00000000	udf	#0
   0x0000fffff7fa1d98:	00000000	udf	#0
   0x0000fffff7fa1d9c:	00000000	udf	#0
   0x0000fffff7fa1da0:	00000000	udf	#0
   0x0000fffff7fa1da4:	00000000	udf	#0
   0x0000fffff7fa1da8:	00000000	udf	#0
   0x0000fffff7fa1dac:	00000000	udf	#0
   0x0000fffff7fa1db0:	00000000	udf	#0
   0x0000fffff7fa1db4:	00000000	udf	#0
   0x0000fffff7fa1db8:	00000000	udf	#0
   0x0000fffff7fa1dbc:	00000000	udf	#0
   0x0000fffff7fa1dc0:	00000000	udf	#0
   0x0000fffff7fa1dc4:	00000000	udf	#0
   0x0000fffff7fa1dc8:	00000000	udf	#0
   0x0000fffff7fa1dcc:	00000000	udf	#0
   0x0000fffff7fa1dd0:	00000000	udf	#0
   0x0000fffff7fa1dd4:	00000000	udf	#0
   0x0000fffff7fa1dd8:	00000000	udf	#0
   0x0000fffff7fa1ddc:	00000000	udf	#0
   0x0000fffff7fa1de0:	00000000	udf	#0
   0x0000fffff7fa1de4:	00000000	udf	#0
   0x0000fffff7fa1de8:	00000000	udf	#0
   0x0000fffff7fa1dec:	00000000	udf	#0
   0x0000fffff7fa1df0:	00000000	udf	#0
   0x0000fffff7fa1df4:	00000000	udf	#0
   0x0000fffff7fa1df8:	00000000	udf	#0
   0x0000fffff7fa1dfc:	00000000	udf	#0
   0x0000fffff7fa1e00:	00000000	udf	#0
   0x0000fffff7fa1e04:	00000000	udf	#0
   0x0000fffff7fa1e08:	00000000	udf	#0
   0x0000fffff7fa1e0c:	00000000	udf	#0
   0x0000fffff7fa1e10:	00000000	udf	#0
   0x0000fffff7fa1e14:	00000000	udf	#0
   0x0000fffff7fa1e18:	00000000	udf	#0
   0x0000fffff7fa1e1c:	00000000	udf	#0
   0x0000fffff7fa1e20:	00000000	udf	#0
   0x0000fffff7fa1e24:	00000000	udf	#0
   0x0000fffff7fa1e28:	00000000	udf	#0
   0x0000fffff7fa1e2c:	00000000	udf	#0
   0x0000fffff7fa1e30:	00000000	udf	#0
   0x0000fffff7fa1e34:	00000000	udf	#0
   0x0000fffff7fa1e38:	00000000	udf	#0
   0x0000fffff7fa1e3c:	00000000	udf	#0
   0x0000fffff7fa1e40:	00000000	udf	#0
   0x0000fffff7fa1e44:	00000000	udf	#0
   0x0000fffff7fa1e48:	00000000	udf	#0
   0x0000fffff7fa1e4c:	00000000	udf	#0
   0x0000fffff7fa1e50:	00000000	udf	#0
   0x0000fffff7fa1e54:	00000000	udf	#0
   0x0000fffff7fa1e58:	00000000	udf	#0
   0x0000fffff7fa1e5c:	00000000	udf	#0
   0x0000fffff7fa1e60:	00000000	udf	#0
   0x0000fffff7fa1e64:	00000000	udf	#0
   0x0000fffff7fa1e68:	00000000	udf	#0
   0x0000fffff7fa1e6c:	00000000	udf	#0
   0x0000fffff7fa1e70:	00000000	udf	#0
   0x0000fffff7fa1e74:	00000000	udf	#0
   0x0000fffff7fa1e78:	00000000	udf	#0
   0x0000fffff7fa1e7c:	00000000	udf	#0
   0x0000fffff7fa1e80:	00000000	udf	#0
   0x0000fffff7fa1e84:	00000000	udf	#0
   0x0000fffff7fa1e88:	00000000	udf	#0
   0x0000fffff7fa1e8c:	00000000	udf	#0
   0x0000fffff7fa1e90:	00000000	udf	#0
   0x0000fffff7fa1e94:	00000000	udf	#0
   0x0000fffff7fa1e98:	00000000	udf	#0
   0x0000fffff7fa1e9c:	00000000	udf	#0
   0x0000fffff7fa1ea0:	00000000	udf	#0
   0x0000fffff7fa1ea4:	00000000	udf	#0
   0x0000fffff7fa1ea8:	00000000	udf	#0
   0x0000fffff7fa1eac:	00000000	udf	#0
   0x0000fffff7fa1eb0:	00000000	udf	#0
   0x0000fffff7fa1eb4:	00000000	udf	#0
   0x0000fffff7fa1eb8:	00000000	udf	#0
   0x0000fffff7fa1ebc:	00000000	udf	#0
   0x0000fffff7fa1ec0:	00000000	udf	#0
   0x0000fffff7fa1ec4:	00000000	udf	#0
   0x0000fffff7fa1ec8:	00000000	udf	#0
   0x0000fffff7fa1ecc:	00000000	udf	#0
   0x0000fffff7fa1ed0:	00000000	udf	#0
   0x0000fffff7fa1ed4:	00000000	udf	#0
   0x0000fffff7fa1ed8:	00000000	udf	#0
   0x0000fffff7fa1edc:	00000000	udf	#0
   0x0000fffff7fa1ee0:	00000000	udf	#0
   0x0000fffff7fa1ee4:	00000000	udf	#0
   0x0000fffff7fa1ee8:	00000000	udf	#0
   0x0000fffff7fa1eec:	00000000	udf	#0
   0x0000fffff7fa1ef0:	00000000	udf	#0
   0x0000fffff7fa1ef4:	00000000	udf	#0
   0x0000fffff7fa1ef8:	00000000	udf	#0
   0x0000fffff7fa1efc:	00000000	udf	#0
   0x0000fffff7fa1f00:	00000000	udf	#0
   0x0000fffff7fa1f04:	00000000	udf	#0
   0x0000fffff7fa1f08:	00000000	udf	#0
   0x0000fffff7fa1f0c:	00000000	udf	#0
   0x0000fffff7fa1f10:	00000000	udf	#0
   0x0000fffff7fa1f14:	00000000	udf	#0
   0x0000fffff7fa1f18:	00000000	udf	#0
   0x0000fffff7fa1f1c:	00000000	udf	#0
   0x0000fffff7fa1f20:	00000000	udf	#0
   0x0000fffff7fa1f24:	00000000	udf	#0
   0x0000fffff7fa1f28:	00000000	udf	#0
   0x0000fffff7fa1f2c:	00000000	udf	#0
   0x0000fffff7fa1f30:	00000000	udf	#0
   0x0000fffff7fa1f34:	00000000	udf	#0
   0x0000fffff7fa1f38:	00000000	udf	#0
   0x0000fffff7fa1f3c:	00000000	udf	#0
   0x0000fffff7fa1f40:	00000000	udf	#0
   0x0000fffff7fa1f44:	00000000	udf	#0
   0x0000fffff7fa1f48:	00000000	udf	#0
   0x0000fffff7fa1f4c:	00000000	udf	#0
   0x0000fffff7fa1f50:	00000000	udf	#0
   0x0000fffff7fa1f54:	00000000	udf	#0
   0x0000fffff7fa1f58:	00000000	udf	#0
   0x0000fffff7fa1f5c:	00000000	udf	#0
   0x0000fffff7fa1f60:	00000000	udf	#0
   0x0000fffff7fa1f64:	00000000	udf	#0
   0x0000fffff7fa1f68:	00000000	udf	#0
   0x0000fffff7fa1f6c:	00000000	udf	#0
   0x0000fffff7fa1f70:	00000000	udf	#0
   0x0000fffff7fa1f74:	00000000	udf	#0
   0x0000fffff7fa1f78:	00000000	udf	#0
   0x0000fffff7fa1f7c:	00000000	udf	#0
   0x0000fffff7fa1f80:	00000000	udf	#0
   0x0000fffff7fa1f84:	00000000	udf	#0
   0x0000fffff7fa1f88:	00000000	udf	#0
   0x0000fffff7fa1f8c:	00000000	udf	#0
   0x0000fffff7fa1f90:	00000000	udf	#0
   0x0000fffff7fa1f94:	00000000	udf	#0
   0x0000fffff7fa1f98:	00000000	udf	#0
   0x0000fffff7fa1f9c:	00000000	udf	#0
   0x0000fffff7fa1fa0:	00000000	udf	#0
   0x0000fffff7fa1fa4:	00000000	udf	#0
   0x0000fffff7fa1fa8:	00000000	udf	#0
   0x0000fffff7fa1fac:	00000000	udf	#0
   0x0000fffff7fa1fb0:	00000000	udf	#0
   0x0000fffff7fa1fb4:	00000000	udf	#0
   0x0000fffff7fa1fb8:	00000000	udf	#0
   0x0000fffff7fa1fbc:	00000000	udf	#0
   0x0000fffff7fa1fc0:	00000000	udf	#0
   0x0000fffff7fa1fc4:	00000000	udf	#0
   0x0000fffff7fa1fc8:	00000000	udf	#0
   0x0000fffff7fa1fcc:	00000000	udf	#0
   0x0000fffff7fa1fd0:	00000000	udf	#0
   0x0000fffff7fa1fd4:	00000000	udf	#0
   0x0000fffff7fa1fd8:	00000000	udf	#0
   0x0000fffff7fa1fdc:	00000000	udf	#0
   0x0000fffff7fa1fe0:	00000000	udf	#0
   0x0000fffff7fa1fe4:	00000000	udf	#0
   0x0000fffff7fa1fe8:	00000000	udf	#0
   0x0000fffff7fa1fec:	00000000	udf	#0
   0x0000fffff7fa1ff0:	00000000	udf	#0
   0x0000fffff7fa1ff4:	00000000	udf	#0
   0x0000fffff7fa1ff8:	00000000	udf	#0
   0x0000fffff7fa1ffc:	00000000	udf	#0
End of assembler dump.
