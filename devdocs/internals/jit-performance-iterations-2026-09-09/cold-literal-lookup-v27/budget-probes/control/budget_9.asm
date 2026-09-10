Dump of assembler code from 0xfffff7fb0000 to 0xfffff7fb2000:
   0x0000fffff7fb0000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fb0004:	910003fd	mov	x29, sp
   0x0000fffff7fb0008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fb000c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fb0010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fb0014:	aa0003f3	mov	x19, x0
   0x0000fffff7fb0018:	aa0103f4	mov	x20, x1
   0x0000fffff7fb001c:	aa0203f5	mov	x21, x2
   0x0000fffff7fb0020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fb0024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fb0028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fb002c:	f90003e9	str	x9, [sp]
   0x0000fffff7fb0030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fb0034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fb0038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fb003c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fb0040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0044:	d63f0200	blr	x16
   0x0000fffff7fb0048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fb004c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fb0050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fb0054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fb0058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb005c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb0060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb0064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb006c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb0070:	36d801d1	tbz	w17, #27, 0xfffff7fb00a8
   0x0000fffff7fb0074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb007c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0080:	54000281	b.ne	0xfffff7fb00d0  // b.any
   0x0000fffff7fb0084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb0088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb008c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb009c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb00a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb00a4:	54000169	b.ls	0xfffff7fb00d0  // b.plast
   0x0000fffff7fb00a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb00ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb00b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb00b4:	36d80091	tbz	w17, #27, 0xfffff7fb00c4
   0x0000fffff7fb00b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb00bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb00c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb00c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb00c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb00cc:	1400000e	b	0xfffff7fb0104
   0x0000fffff7fb00d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb00d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb00d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb00dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb00e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fb00e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb00e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb00ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb00f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb00f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb00f8:	d63f0200	blr	x16
   0x0000fffff7fb00fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0100:	5400ce20	b.eq	0xfffff7fb1ac4  // b.none
   0x0000fffff7fb0104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb0108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb010c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fb0110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb0114:	36d80211	tbz	w17, #27, 0xfffff7fb0154
   0x0000fffff7fb0118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb011c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0124:	540001e1	b.ne	0xfffff7fb0160  // b.any
   0x0000fffff7fb0128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb012c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb013c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0148:	540000c9	b.ls	0xfffff7fb0160  // b.plast
   0x0000fffff7fb014c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb015c:	1400000e	b	0xfffff7fb0194
   0x0000fffff7fb0160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0168:	aa1303e1	mov	x1, x19
   0x0000fffff7fb016c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fb0174:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0178:	aa1603e5	mov	x5, x22
   0x0000fffff7fb017c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb0180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0188:	d63f0200	blr	x16
   0x0000fffff7fb018c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0190:	5400c9e0	b.eq	0xfffff7fb1acc  // b.none
   0x0000fffff7fb0194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb019c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb01a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb01a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb01a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb01ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb01b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb01b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb01b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb01bc:	d63f0200	blr	x16
   0x0000fffff7fb01c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb01c4:	5400c880	b.eq	0xfffff7fb1ad4  // b.none
   0x0000fffff7fb01c8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb01cc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb01d0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb01d4:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb01d8:	36d80211	tbz	w17, #27, 0xfffff7fb0218
   0x0000fffff7fb01dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb01e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb01e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb01e8:	540001e1	b.ne	0xfffff7fb0224  // b.any
   0x0000fffff7fb01ec:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb01f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb01f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb01f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb01fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0200:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0204:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0208:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb020c:	540000c9	b.ls	0xfffff7fb0224  // b.plast
   0x0000fffff7fb0210:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0214:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0218:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb021c:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb0220:	1400000e	b	0xfffff7fb0258
   0x0000fffff7fb0224:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0228:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb022c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0230:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0234:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fb0238:	aa1403e4	mov	x4, x20
   0x0000fffff7fb023c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0240:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb0244:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb024c:	d63f0200	blr	x16
   0x0000fffff7fb0250:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0254:	5400c440	b.eq	0xfffff7fb1adc  // b.none
   0x0000fffff7fb0258:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb025c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0260:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0264:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0268:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fb026c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0270:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0274:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb0278:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb027c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0280:	d63f0200	blr	x16
   0x0000fffff7fb0284:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0288:	5400c2e0	b.eq	0xfffff7fb1ae4  // b.none
   0x0000fffff7fb028c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0290:	37d806a9	tbnz	w9, #27, 0xfffff7fb0364
   0x0000fffff7fb0294:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0298:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb029c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb02a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb02a4:	540001c1	b.ne	0xfffff7fb02dc  // b.any
   0x0000fffff7fb02a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb02ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb02b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb02b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb02b8:	54000121	b.ne	0xfffff7fb02dc  // b.any
   0x0000fffff7fb02bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb02c0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb02c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb02c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb02cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb02d0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb02d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb02d8:	14000030	b	0xfffff7fb0398
   0x0000fffff7fb02dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb02e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb02e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb02e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb02ec:	54000120	b.eq	0xfffff7fb0310  // b.none
   0x0000fffff7fb02f0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb02f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb02f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb02fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0300:	54000321	b.ne	0xfffff7fb0364  // b.any
   0x0000fffff7fb0304:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb0308:	9e620120	scvtf	d0, x9
   0x0000fffff7fb030c:	14000002	b	0xfffff7fb0314
   0x0000fffff7fb0310:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb0314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb031c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0320:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0324:	54000120	b.eq	0xfffff7fb0348  // b.none
   0x0000fffff7fb0328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb032c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0334:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0338:	54000161	b.ne	0xfffff7fb0364  // b.any
   0x0000fffff7fb033c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0340:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0344:	14000002	b	0xfffff7fb034c
   0x0000fffff7fb0348:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb034c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0350:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb0354:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb035c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0360:	17ffffde	b	0xfffff7fb02d8
   0x0000fffff7fb0364:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0368:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb036c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0370:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0374:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fb0378:	aa1403e4	mov	x4, x20
   0x0000fffff7fb037c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0380:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb0384:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0388:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb038c:	d63f0200	blr	x16
   0x0000fffff7fb0390:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0394:	5400bac0	b.eq	0xfffff7fb1aec  // b.none
   0x0000fffff7fb0398:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb039c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb03a0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb03a4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb03a8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb03ac:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb03b0:	36d801d1	tbz	w17, #27, 0xfffff7fb03e8
   0x0000fffff7fb03b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb03b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb03bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb03c0:	54000281	b.ne	0xfffff7fb0410  // b.any
   0x0000fffff7fb03c4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb03c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb03cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb03d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb03d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb03d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb03dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb03e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb03e4:	54000169	b.ls	0xfffff7fb0410  // b.plast
   0x0000fffff7fb03e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb03ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb03f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb03f4:	36d80091	tbz	w17, #27, 0xfffff7fb0404
   0x0000fffff7fb03f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb03fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0400:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0404:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0408:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb040c:	1400000e	b	0xfffff7fb0444
   0x0000fffff7fb0410:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0414:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0418:	aa1303e1	mov	x1, x19
   0x0000fffff7fb041c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0420:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb0424:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0428:	aa1603e5	mov	x5, x22
   0x0000fffff7fb042c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb0430:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0438:	d63f0200	blr	x16
   0x0000fffff7fb043c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0440:	5400b5a0	b.eq	0xfffff7fb1af4  // b.none
   0x0000fffff7fb0444:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0448:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb044c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0450:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0454:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb0458:	aa1403e4	mov	x4, x20
   0x0000fffff7fb045c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0460:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb0464:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0468:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb046c:	d63f0200	blr	x16
   0x0000fffff7fb0470:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0474:	5400b440	b.eq	0xfffff7fb1afc  // b.none
   0x0000fffff7fb0478:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb047c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0480:	540004a0	b.eq	0xfffff7fb0514  // b.none
   0x0000fffff7fb0484:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0488:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb048c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0490:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0494:	54000400	b.eq	0xfffff7fb0514  // b.none
   0x0000fffff7fb0498:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb049c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb04a0:	36d801d1	tbz	w17, #27, 0xfffff7fb04d8
   0x0000fffff7fb04a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb04a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb04ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb04b0:	54000321	b.ne	0xfffff7fb0514  // b.any
   0x0000fffff7fb04b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb04b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb04bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb04c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb04c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb04c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb04cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb04d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb04d4:	54000209	b.ls	0xfffff7fb0514  // b.plast
   0x0000fffff7fb04d8:	36d8008d	tbz	w13, #27, 0xfffff7fb04e8
   0x0000fffff7fb04dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb04e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb04e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb04e8:	36d80091	tbz	w17, #27, 0xfffff7fb04f8
   0x0000fffff7fb04ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb04f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb04f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb04f8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb04fc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0500:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0504:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0508:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb050c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0510:	1400000e	b	0xfffff7fb0548
   0x0000fffff7fb0514:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0518:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb051c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0520:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0524:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb0528:	aa1403e4	mov	x4, x20
   0x0000fffff7fb052c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0530:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb0534:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0538:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb053c:	d63f0200	blr	x16
   0x0000fffff7fb0540:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0544:	5400ae00	b.eq	0xfffff7fb1b04  // b.none
   0x0000fffff7fb0548:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb054c:	37d806a9	tbnz	w9, #27, 0xfffff7fb0620
   0x0000fffff7fb0550:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0554:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb055c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0560:	540001c1	b.ne	0xfffff7fb0598  // b.any
   0x0000fffff7fb0564:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0568:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb056c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0570:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0574:	54000121	b.ne	0xfffff7fb0598  // b.any
   0x0000fffff7fb0578:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb057c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb0580:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0584:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb058c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb0590:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0594:	14000030	b	0xfffff7fb0654
   0x0000fffff7fb0598:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb059c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb05a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05a8:	54000120	b.eq	0xfffff7fb05cc  // b.none
   0x0000fffff7fb05ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb05b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb05b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05bc:	54000321	b.ne	0xfffff7fb0620  // b.any
   0x0000fffff7fb05c0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb05c4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb05c8:	14000002	b	0xfffff7fb05d0
   0x0000fffff7fb05cc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb05d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb05d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb05d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05e0:	54000120	b.eq	0xfffff7fb0604  // b.none
   0x0000fffff7fb05e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb05e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb05ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05f4:	54000161	b.ne	0xfffff7fb0620  // b.any
   0x0000fffff7fb05f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb05fc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0600:	14000002	b	0xfffff7fb0608
   0x0000fffff7fb0604:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb0608:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb060c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb0610:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0618:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb061c:	17ffffde	b	0xfffff7fb0594
   0x0000fffff7fb0620:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0624:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0628:	aa1303e1	mov	x1, x19
   0x0000fffff7fb062c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0630:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb0634:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0638:	aa1603e5	mov	x5, x22
   0x0000fffff7fb063c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb0640:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0644:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0648:	d63f0200	blr	x16
   0x0000fffff7fb064c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0650:	5400a5e0	b.eq	0xfffff7fb1b0c  // b.none
   0x0000fffff7fb0654:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb0658:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb065c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb0660:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0664:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0668:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb066c:	36d801d1	tbz	w17, #27, 0xfffff7fb06a4
   0x0000fffff7fb0670:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0674:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0678:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb067c:	54000281	b.ne	0xfffff7fb06cc  // b.any
   0x0000fffff7fb0680:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0684:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0688:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb068c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0690:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0694:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0698:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb069c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb06a0:	54000169	b.ls	0xfffff7fb06cc  // b.plast
   0x0000fffff7fb06a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb06a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb06ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb06b0:	36d80091	tbz	w17, #27, 0xfffff7fb06c0
   0x0000fffff7fb06b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb06b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb06bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb06c0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb06c4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb06c8:	1400000e	b	0xfffff7fb0700
   0x0000fffff7fb06cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb06d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb06d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb06d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb06dc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb06e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb06e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb06e8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb06ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb06f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb06f4:	d63f0200	blr	x16
   0x0000fffff7fb06f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb06fc:	5400a0c0	b.eq	0xfffff7fb1b14  // b.none
   0x0000fffff7fb0700:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0708:	aa1303e1	mov	x1, x19
   0x0000fffff7fb070c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0710:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb0714:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0718:	aa1603e5	mov	x5, x22
   0x0000fffff7fb071c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb0720:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0728:	d63f0200	blr	x16
   0x0000fffff7fb072c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0730:	54009f60	b.eq	0xfffff7fb1b1c  // b.none
   0x0000fffff7fb0734:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0738:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb073c:	540004a0	b.eq	0xfffff7fb07d0  // b.none
   0x0000fffff7fb0740:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0744:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0748:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb074c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0750:	54000400	b.eq	0xfffff7fb07d0  // b.none
   0x0000fffff7fb0754:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0758:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb075c:	36d801d1	tbz	w17, #27, 0xfffff7fb0794
   0x0000fffff7fb0760:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0764:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0768:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb076c:	54000321	b.ne	0xfffff7fb07d0  // b.any
   0x0000fffff7fb0770:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0774:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0778:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb077c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0780:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0784:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0788:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb078c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0790:	54000209	b.ls	0xfffff7fb07d0  // b.plast
   0x0000fffff7fb0794:	36d8008d	tbz	w13, #27, 0xfffff7fb07a4
   0x0000fffff7fb0798:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb079c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb07a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb07a4:	36d80091	tbz	w17, #27, 0xfffff7fb07b4
   0x0000fffff7fb07a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb07ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb07b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb07b4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb07b8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb07bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb07c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb07c4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb07c8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb07cc:	1400000e	b	0xfffff7fb0804
   0x0000fffff7fb07d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb07d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb07d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb07dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb07e0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb07e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb07e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb07ec:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb07f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb07f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb07f8:	d63f0200	blr	x16
   0x0000fffff7fb07fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0800:	54009920	b.eq	0xfffff7fb1b24  // b.none
   0x0000fffff7fb0804:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0808:	37d806a9	tbnz	w9, #27, 0xfffff7fb08dc
   0x0000fffff7fb080c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0810:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0814:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0818:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb081c:	540001c1	b.ne	0xfffff7fb0854  // b.any
   0x0000fffff7fb0820:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb082c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0830:	54000121	b.ne	0xfffff7fb0854  // b.any
   0x0000fffff7fb0834:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb0838:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb083c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0840:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0844:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0848:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb084c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0850:	14000030	b	0xfffff7fb0910
   0x0000fffff7fb0854:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0858:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb085c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0860:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0864:	54000120	b.eq	0xfffff7fb0888  // b.none
   0x0000fffff7fb0868:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb086c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0874:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0878:	54000321	b.ne	0xfffff7fb08dc  // b.any
   0x0000fffff7fb087c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb0880:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0884:	14000002	b	0xfffff7fb088c
   0x0000fffff7fb0888:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb088c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0890:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0898:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb089c:	54000120	b.eq	0xfffff7fb08c0  // b.none
   0x0000fffff7fb08a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb08a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb08a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb08ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb08b0:	54000161	b.ne	0xfffff7fb08dc  // b.any
   0x0000fffff7fb08b4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb08b8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb08bc:	14000002	b	0xfffff7fb08c4
   0x0000fffff7fb08c0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb08c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb08c8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb08cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb08d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb08d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb08d8:	17ffffde	b	0xfffff7fb0850
   0x0000fffff7fb08dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb08e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb08e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb08e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb08ec:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb08f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb08f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb08f8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb08fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0900:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0904:	d63f0200	blr	x16
   0x0000fffff7fb0908:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb090c:	54009100	b.eq	0xfffff7fb1b2c  // b.none
   0x0000fffff7fb0910:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb0914:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb0918:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb091c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0920:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0924:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb0928:	36d801d1	tbz	w17, #27, 0xfffff7fb0960
   0x0000fffff7fb092c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0930:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0934:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0938:	54000281	b.ne	0xfffff7fb0988  // b.any
   0x0000fffff7fb093c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0940:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0944:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0948:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb094c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0950:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0954:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0958:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb095c:	54000169	b.ls	0xfffff7fb0988  // b.plast
   0x0000fffff7fb0960:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0964:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0968:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb096c:	36d80091	tbz	w17, #27, 0xfffff7fb097c
   0x0000fffff7fb0970:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0974:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0978:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb097c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0980:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0984:	1400000e	b	0xfffff7fb09bc
   0x0000fffff7fb0988:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb098c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0990:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0994:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0998:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb099c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb09a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb09a4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb09a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb09ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb09b0:	d63f0200	blr	x16
   0x0000fffff7fb09b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb09b8:	54008be0	b.eq	0xfffff7fb1b34  // b.none
   0x0000fffff7fb09bc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb09c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb09c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb09c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb09cc:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb09d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb09d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb09d8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb09dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb09e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb09e4:	d63f0200	blr	x16
   0x0000fffff7fb09e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb09ec:	54008a80	b.eq	0xfffff7fb1b3c  // b.none
   0x0000fffff7fb09f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb09f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb09f8:	540004a0	b.eq	0xfffff7fb0a8c  // b.none
   0x0000fffff7fb09fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0a00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0a04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0a08:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0a0c:	54000400	b.eq	0xfffff7fb0a8c  // b.none
   0x0000fffff7fb0a10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0a14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0a18:	36d801d1	tbz	w17, #27, 0xfffff7fb0a50
   0x0000fffff7fb0a1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0a20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0a24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0a28:	54000321	b.ne	0xfffff7fb0a8c  // b.any
   0x0000fffff7fb0a2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0a30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0a34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0a38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0a3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0a40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0a44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0a48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0a4c:	54000209	b.ls	0xfffff7fb0a8c  // b.plast
   0x0000fffff7fb0a50:	36d8008d	tbz	w13, #27, 0xfffff7fb0a60
   0x0000fffff7fb0a54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0a58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0a5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0a60:	36d80091	tbz	w17, #27, 0xfffff7fb0a70
   0x0000fffff7fb0a64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0a68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0a6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0a70:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb0a74:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0a78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0a7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0a80:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0a84:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0a88:	1400000e	b	0xfffff7fb0ac0
   0x0000fffff7fb0a8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0a90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0a94:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0a98:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0a9c:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb0aa0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0aa4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0aa8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb0aac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0ab0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0ab4:	d63f0200	blr	x16
   0x0000fffff7fb0ab8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0abc:	54008440	b.eq	0xfffff7fb1b44  // b.none
   0x0000fffff7fb0ac0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0ac4:	37d806a9	tbnz	w9, #27, 0xfffff7fb0b98
   0x0000fffff7fb0ac8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0acc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0ad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0ad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0ad8:	540001c1	b.ne	0xfffff7fb0b10  // b.any
   0x0000fffff7fb0adc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0ae0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0ae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0ae8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0aec:	54000121	b.ne	0xfffff7fb0b10  // b.any
   0x0000fffff7fb0af0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb0af4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb0af8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0afc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0b00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0b04:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb0b08:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0b0c:	14000030	b	0xfffff7fb0bcc
   0x0000fffff7fb0b10:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0b14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0b18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0b1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0b20:	54000120	b.eq	0xfffff7fb0b44  // b.none
   0x0000fffff7fb0b24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0b28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0b2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0b30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0b34:	54000321	b.ne	0xfffff7fb0b98  // b.any
   0x0000fffff7fb0b38:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb0b3c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0b40:	14000002	b	0xfffff7fb0b48
   0x0000fffff7fb0b44:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb0b48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0b4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0b50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0b54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0b58:	54000120	b.eq	0xfffff7fb0b7c  // b.none
   0x0000fffff7fb0b5c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0b60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0b64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0b68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0b6c:	54000161	b.ne	0xfffff7fb0b98  // b.any
   0x0000fffff7fb0b70:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0b74:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0b78:	14000002	b	0xfffff7fb0b80
   0x0000fffff7fb0b7c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb0b80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0b84:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb0b88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0b8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0b90:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0b94:	17ffffde	b	0xfffff7fb0b0c
   0x0000fffff7fb0b98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0b9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0ba0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0ba4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0ba8:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb0bac:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0bb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0bb4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb0bb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0bbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0bc0:	d63f0200	blr	x16
   0x0000fffff7fb0bc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0bc8:	54007c20	b.eq	0xfffff7fb1b4c  // b.none
   0x0000fffff7fb0bcc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb0bd0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb0bd4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb0bd8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0bdc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0be0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb0be4:	36d801d1	tbz	w17, #27, 0xfffff7fb0c1c
   0x0000fffff7fb0be8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0bec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0bf0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0bf4:	54000281	b.ne	0xfffff7fb0c44  // b.any
   0x0000fffff7fb0bf8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0bfc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0c00:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0c04:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0c08:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0c0c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0c10:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0c14:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0c18:	54000169	b.ls	0xfffff7fb0c44  // b.plast
   0x0000fffff7fb0c1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0c20:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0c24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0c28:	36d80091	tbz	w17, #27, 0xfffff7fb0c38
   0x0000fffff7fb0c2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0c30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0c34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0c38:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0c3c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0c40:	1400000e	b	0xfffff7fb0c78
   0x0000fffff7fb0c44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0c48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0c4c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0c50:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0c54:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb0c58:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0c5c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0c60:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb0c64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0c68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0c6c:	d63f0200	blr	x16
   0x0000fffff7fb0c70:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0c74:	54007700	b.eq	0xfffff7fb1b54  // b.none
   0x0000fffff7fb0c78:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0c7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0c80:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0c84:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0c88:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb0c8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0c90:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0c94:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb0c98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0c9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0ca0:	d63f0200	blr	x16
   0x0000fffff7fb0ca4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0ca8:	540075a0	b.eq	0xfffff7fb1b5c  // b.none
   0x0000fffff7fb0cac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0cb0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0cb4:	540004a0	b.eq	0xfffff7fb0d48  // b.none
   0x0000fffff7fb0cb8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0cbc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0cc0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0cc4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0cc8:	54000400	b.eq	0xfffff7fb0d48  // b.none
   0x0000fffff7fb0ccc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0cd0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0cd4:	36d801d1	tbz	w17, #27, 0xfffff7fb0d0c
   0x0000fffff7fb0cd8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0cdc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0ce0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0ce4:	54000321	b.ne	0xfffff7fb0d48  // b.any
   0x0000fffff7fb0ce8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0cec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0cf0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0cf4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0cf8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0cfc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0d00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0d04:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0d08:	54000209	b.ls	0xfffff7fb0d48  // b.plast
   0x0000fffff7fb0d0c:	36d8008d	tbz	w13, #27, 0xfffff7fb0d1c
   0x0000fffff7fb0d10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0d14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0d18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0d1c:	36d80091	tbz	w17, #27, 0xfffff7fb0d2c
   0x0000fffff7fb0d20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0d24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0d28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0d2c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb0d30:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0d34:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0d38:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0d3c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0d40:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0d44:	1400000e	b	0xfffff7fb0d7c
   0x0000fffff7fb0d48:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0d4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0d50:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0d54:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0d58:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb0d5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0d60:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0d64:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb0d68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0d6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0d70:	d63f0200	blr	x16
   0x0000fffff7fb0d74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0d78:	54006f60	b.eq	0xfffff7fb1b64  // b.none
   0x0000fffff7fb0d7c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0d80:	37d806a9	tbnz	w9, #27, 0xfffff7fb0e54
   0x0000fffff7fb0d84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0d88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0d8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0d90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0d94:	540001c1	b.ne	0xfffff7fb0dcc  // b.any
   0x0000fffff7fb0d98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0d9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0da0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0da4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0da8:	54000121	b.ne	0xfffff7fb0dcc  // b.any
   0x0000fffff7fb0dac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb0db0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb0db4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0db8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0dbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0dc0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb0dc4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0dc8:	14000030	b	0xfffff7fb0e88
   0x0000fffff7fb0dcc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0dd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0dd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0dd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0ddc:	54000120	b.eq	0xfffff7fb0e00  // b.none
   0x0000fffff7fb0de0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0de4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0de8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0dec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0df0:	54000321	b.ne	0xfffff7fb0e54  // b.any
   0x0000fffff7fb0df4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb0df8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0dfc:	14000002	b	0xfffff7fb0e04
   0x0000fffff7fb0e00:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb0e04:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0e08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0e10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0e14:	54000120	b.eq	0xfffff7fb0e38  // b.none
   0x0000fffff7fb0e18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0e1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0e20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0e24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0e28:	54000161	b.ne	0xfffff7fb0e54  // b.any
   0x0000fffff7fb0e2c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0e30:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0e34:	14000002	b	0xfffff7fb0e3c
   0x0000fffff7fb0e38:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb0e3c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0e40:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb0e44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0e48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0e4c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0e50:	17ffffde	b	0xfffff7fb0dc8
   0x0000fffff7fb0e54:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0e58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0e5c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0e60:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0e64:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb0e68:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0e6c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0e70:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb0e74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0e78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0e7c:	d63f0200	blr	x16
   0x0000fffff7fb0e80:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0e84:	54006740	b.eq	0xfffff7fb1b6c  // b.none
   0x0000fffff7fb0e88:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb0e8c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb0e90:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb0e94:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0e98:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0e9c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb0ea0:	36d801d1	tbz	w17, #27, 0xfffff7fb0ed8
   0x0000fffff7fb0ea4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0ea8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0eac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0eb0:	54000281	b.ne	0xfffff7fb0f00  // b.any
   0x0000fffff7fb0eb4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0eb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0ebc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0ec0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0ec4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0ec8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0ecc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0ed0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0ed4:	54000169	b.ls	0xfffff7fb0f00  // b.plast
   0x0000fffff7fb0ed8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0edc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0ee0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0ee4:	36d80091	tbz	w17, #27, 0xfffff7fb0ef4
   0x0000fffff7fb0ee8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0eec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0ef0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0ef4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0ef8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0efc:	1400000e	b	0xfffff7fb0f34
   0x0000fffff7fb0f00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0f04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0f08:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0f0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0f10:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb0f14:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0f18:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0f1c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb0f20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0f24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0f28:	d63f0200	blr	x16
   0x0000fffff7fb0f2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0f30:	54006220	b.eq	0xfffff7fb1b74  // b.none
   0x0000fffff7fb0f34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0f38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0f3c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0f40:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0f44:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb0f48:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0f4c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0f50:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb0f54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0f58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0f5c:	d63f0200	blr	x16
   0x0000fffff7fb0f60:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0f64:	540060c0	b.eq	0xfffff7fb1b7c  // b.none
   0x0000fffff7fb0f68:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0f6c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0f70:	540004a0	b.eq	0xfffff7fb1004  // b.none
   0x0000fffff7fb0f74:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0f78:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0f7c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0f80:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0f84:	54000400	b.eq	0xfffff7fb1004  // b.none
   0x0000fffff7fb0f88:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0f8c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0f90:	36d801d1	tbz	w17, #27, 0xfffff7fb0fc8
   0x0000fffff7fb0f94:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0f98:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0f9c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0fa0:	54000321	b.ne	0xfffff7fb1004  // b.any
   0x0000fffff7fb0fa4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0fa8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0fac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0fb0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0fb4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0fb8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0fbc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0fc0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0fc4:	54000209	b.ls	0xfffff7fb1004  // b.plast
   0x0000fffff7fb0fc8:	36d8008d	tbz	w13, #27, 0xfffff7fb0fd8
   0x0000fffff7fb0fcc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0fd0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0fd4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0fd8:	36d80091	tbz	w17, #27, 0xfffff7fb0fe8
   0x0000fffff7fb0fdc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0fe0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0fe4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0fe8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb0fec:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0ff0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0ff4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0ff8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0ffc:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1000:	1400000e	b	0xfffff7fb1038
   0x0000fffff7fb1004:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1008:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb100c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1010:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1014:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb1018:	aa1403e4	mov	x4, x20
   0x0000fffff7fb101c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1020:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb1024:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1028:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb102c:	d63f0200	blr	x16
   0x0000fffff7fb1030:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1034:	54005a80	b.eq	0xfffff7fb1b84  // b.none
   0x0000fffff7fb1038:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb103c:	37d806a9	tbnz	w9, #27, 0xfffff7fb1110
   0x0000fffff7fb1040:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1044:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb104c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1050:	540001c1	b.ne	0xfffff7fb1088  // b.any
   0x0000fffff7fb1054:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1058:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb105c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1060:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1064:	54000121	b.ne	0xfffff7fb1088  // b.any
   0x0000fffff7fb1068:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb106c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb1070:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1074:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb107c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb1080:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1084:	14000030	b	0xfffff7fb1144
   0x0000fffff7fb1088:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb108c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1090:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1094:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1098:	54000120	b.eq	0xfffff7fb10bc  // b.none
   0x0000fffff7fb109c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb10a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb10a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb10a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb10ac:	54000321	b.ne	0xfffff7fb1110  // b.any
   0x0000fffff7fb10b0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb10b4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb10b8:	14000002	b	0xfffff7fb10c0
   0x0000fffff7fb10bc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb10c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb10c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb10c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb10cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb10d0:	54000120	b.eq	0xfffff7fb10f4  // b.none
   0x0000fffff7fb10d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb10d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb10dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb10e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb10e4:	54000161	b.ne	0xfffff7fb1110  // b.any
   0x0000fffff7fb10e8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb10ec:	9e620121	scvtf	d1, x9
   0x0000fffff7fb10f0:	14000002	b	0xfffff7fb10f8
   0x0000fffff7fb10f4:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb10f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb10fc:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb1100:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1104:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1108:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb110c:	17ffffde	b	0xfffff7fb1084
   0x0000fffff7fb1110:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1114:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1118:	aa1303e1	mov	x1, x19
   0x0000fffff7fb111c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1120:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb1124:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1128:	aa1603e5	mov	x5, x22
   0x0000fffff7fb112c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb1130:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1134:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1138:	d63f0200	blr	x16
   0x0000fffff7fb113c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1140:	54005260	b.eq	0xfffff7fb1b8c  // b.none
   0x0000fffff7fb1144:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb1148:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb114c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb1150:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb1154:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb1158:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb115c:	36d801d1	tbz	w17, #27, 0xfffff7fb1194
   0x0000fffff7fb1160:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1164:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1168:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb116c:	54000281	b.ne	0xfffff7fb11bc  // b.any
   0x0000fffff7fb1170:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb1174:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1178:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb117c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1180:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1184:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1188:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb118c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1190:	54000169	b.ls	0xfffff7fb11bc  // b.plast
   0x0000fffff7fb1194:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1198:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb119c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb11a0:	36d80091	tbz	w17, #27, 0xfffff7fb11b0
   0x0000fffff7fb11a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb11a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb11ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb11b0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb11b4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb11b8:	1400000e	b	0xfffff7fb11f0
   0x0000fffff7fb11bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb11c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb11c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb11c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb11cc:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb11d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb11d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb11d8:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb11dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb11e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb11e4:	d63f0200	blr	x16
   0x0000fffff7fb11e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb11ec:	54004d40	b.eq	0xfffff7fb1b94  // b.none
   0x0000fffff7fb11f0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb11f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb11f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb11fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1200:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb1204:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1208:	aa1603e5	mov	x5, x22
   0x0000fffff7fb120c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb1210:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1214:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1218:	d63f0200	blr	x16
   0x0000fffff7fb121c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1220:	54004be0	b.eq	0xfffff7fb1b9c  // b.none
   0x0000fffff7fb1224:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb1228:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb122c:	540004a0	b.eq	0xfffff7fb12c0  // b.none
   0x0000fffff7fb1230:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1234:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb1238:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb123c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1240:	54000400	b.eq	0xfffff7fb12c0  // b.none
   0x0000fffff7fb1244:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1248:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb124c:	36d801d1	tbz	w17, #27, 0xfffff7fb1284
   0x0000fffff7fb1250:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1254:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1258:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb125c:	54000321	b.ne	0xfffff7fb12c0  // b.any
   0x0000fffff7fb1260:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1264:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1268:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb126c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1270:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1274:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1278:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb127c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1280:	54000209	b.ls	0xfffff7fb12c0  // b.plast
   0x0000fffff7fb1284:	36d8008d	tbz	w13, #27, 0xfffff7fb1294
   0x0000fffff7fb1288:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb128c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1290:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1294:	36d80091	tbz	w17, #27, 0xfffff7fb12a4
   0x0000fffff7fb1298:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb129c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb12a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb12a4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb12a8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb12ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb12b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb12b4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb12b8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb12bc:	1400000e	b	0xfffff7fb12f4
   0x0000fffff7fb12c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb12c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb12c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb12cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb12d0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb12d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb12d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb12dc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb12e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb12e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb12e8:	d63f0200	blr	x16
   0x0000fffff7fb12ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb12f0:	540045a0	b.eq	0xfffff7fb1ba4  // b.none
   0x0000fffff7fb12f4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb12f8:	37d806a9	tbnz	w9, #27, 0xfffff7fb13cc
   0x0000fffff7fb12fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1300:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1308:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb130c:	540001c1	b.ne	0xfffff7fb1344  // b.any
   0x0000fffff7fb1310:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1314:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb131c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1320:	54000121	b.ne	0xfffff7fb1344  // b.any
   0x0000fffff7fb1324:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb1328:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb132c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1338:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb133c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1340:	14000030	b	0xfffff7fb1400
   0x0000fffff7fb1344:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1348:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb134c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1350:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1354:	54000120	b.eq	0xfffff7fb1378  // b.none
   0x0000fffff7fb1358:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb135c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1364:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1368:	54000321	b.ne	0xfffff7fb13cc  // b.any
   0x0000fffff7fb136c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb1370:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1374:	14000002	b	0xfffff7fb137c
   0x0000fffff7fb1378:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb137c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1380:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1388:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb138c:	54000120	b.eq	0xfffff7fb13b0  // b.none
   0x0000fffff7fb1390:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb139c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb13a0:	54000161	b.ne	0xfffff7fb13cc  // b.any
   0x0000fffff7fb13a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb13a8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb13ac:	14000002	b	0xfffff7fb13b4
   0x0000fffff7fb13b0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb13b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb13b8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb13bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb13c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb13c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb13c8:	17ffffde	b	0xfffff7fb1340
   0x0000fffff7fb13cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb13d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb13d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb13d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb13dc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb13e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb13e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb13e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb13ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb13f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb13f4:	d63f0200	blr	x16
   0x0000fffff7fb13f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb13fc:	54003d80	b.eq	0xfffff7fb1bac  // b.none
   0x0000fffff7fb1400:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb1404:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb1408:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb140c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb1410:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb1414:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb1418:	36d801d1	tbz	w17, #27, 0xfffff7fb1450
   0x0000fffff7fb141c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1420:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1424:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1428:	54000281	b.ne	0xfffff7fb1478  // b.any
   0x0000fffff7fb142c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb1430:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1434:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1438:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb143c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1440:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1444:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1448:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb144c:	54000169	b.ls	0xfffff7fb1478  // b.plast
   0x0000fffff7fb1450:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1454:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1458:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb145c:	36d80091	tbz	w17, #27, 0xfffff7fb146c
   0x0000fffff7fb1460:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1464:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1468:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb146c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1470:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1474:	1400000e	b	0xfffff7fb14ac
   0x0000fffff7fb1478:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb147c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1480:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1484:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1488:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb148c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1490:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1494:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb1498:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb149c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb14a0:	d63f0200	blr	x16
   0x0000fffff7fb14a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb14a8:	54003860	b.eq	0xfffff7fb1bb4  // b.none
   0x0000fffff7fb14ac:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb14b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb14b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb14b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb14bc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb14c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb14c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb14c8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb14cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb14d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb14d4:	d63f0200	blr	x16
   0x0000fffff7fb14d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb14dc:	54003700	b.eq	0xfffff7fb1bbc  // b.none
   0x0000fffff7fb14e0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb14e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb14e8:	540004a0	b.eq	0xfffff7fb157c  // b.none
   0x0000fffff7fb14ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb14f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb14f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb14f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb14fc:	54000400	b.eq	0xfffff7fb157c  // b.none
   0x0000fffff7fb1500:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1504:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb1508:	36d801d1	tbz	w17, #27, 0xfffff7fb1540
   0x0000fffff7fb150c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1510:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1514:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1518:	54000321	b.ne	0xfffff7fb157c  // b.any
   0x0000fffff7fb151c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1520:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1524:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1528:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb152c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1530:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1534:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1538:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb153c:	54000209	b.ls	0xfffff7fb157c  // b.plast
   0x0000fffff7fb1540:	36d8008d	tbz	w13, #27, 0xfffff7fb1550
   0x0000fffff7fb1544:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1548:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb154c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1550:	36d80091	tbz	w17, #27, 0xfffff7fb1560
   0x0000fffff7fb1554:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1558:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb155c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1560:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb1564:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb1568:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb156c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb1570:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1574:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1578:	1400000e	b	0xfffff7fb15b0
   0x0000fffff7fb157c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1580:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1584:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1588:	aa1503e2	mov	x2, x21
   0x0000fffff7fb158c:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb1590:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1594:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1598:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb159c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb15a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb15a4:	d63f0200	blr	x16
   0x0000fffff7fb15a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb15ac:	540030c0	b.eq	0xfffff7fb1bc4  // b.none
   0x0000fffff7fb15b0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb15b4:	37d806a9	tbnz	w9, #27, 0xfffff7fb1688
   0x0000fffff7fb15b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb15bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb15c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb15c8:	540001c1	b.ne	0xfffff7fb1600  // b.any
   0x0000fffff7fb15cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb15d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb15d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb15dc:	54000121	b.ne	0xfffff7fb1600  // b.any
   0x0000fffff7fb15e0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb15e4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb15e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb15ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb15f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15f4:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb15f8:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb15fc:	14000030	b	0xfffff7fb16bc
   0x0000fffff7fb1600:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1604:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb160c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1610:	54000120	b.eq	0xfffff7fb1634  // b.none
   0x0000fffff7fb1614:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb161c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1620:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1624:	54000321	b.ne	0xfffff7fb1688  // b.any
   0x0000fffff7fb1628:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb162c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1630:	14000002	b	0xfffff7fb1638
   0x0000fffff7fb1634:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb1638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb163c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1644:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1648:	54000120	b.eq	0xfffff7fb166c  // b.none
   0x0000fffff7fb164c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1650:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1658:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb165c:	54000161	b.ne	0xfffff7fb1688  // b.any
   0x0000fffff7fb1660:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb1664:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1668:	14000002	b	0xfffff7fb1670
   0x0000fffff7fb166c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb1670:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1674:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb1678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb167c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1680:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1684:	17ffffde	b	0xfffff7fb15fc
   0x0000fffff7fb1688:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb168c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1690:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1694:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1698:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb169c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb16a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb16a4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb16a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb16ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb16b0:	d63f0200	blr	x16
   0x0000fffff7fb16b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb16b8:	540028a0	b.eq	0xfffff7fb1bcc  // b.none
   0x0000fffff7fb16bc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb16c0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb16c4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb16c8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb16cc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb16d0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb16d4:	36d801d1	tbz	w17, #27, 0xfffff7fb170c
   0x0000fffff7fb16d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb16dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb16e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb16e4:	54000281	b.ne	0xfffff7fb1734  // b.any
   0x0000fffff7fb16e8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb16ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb16f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb16f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb16f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb16fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1700:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1704:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1708:	54000169	b.ls	0xfffff7fb1734  // b.plast
   0x0000fffff7fb170c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1710:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1714:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1718:	36d80091	tbz	w17, #27, 0xfffff7fb1728
   0x0000fffff7fb171c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1720:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1724:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1728:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb172c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1730:	1400000e	b	0xfffff7fb1768
   0x0000fffff7fb1734:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1738:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb173c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1740:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1744:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb1748:	aa1403e4	mov	x4, x20
   0x0000fffff7fb174c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1750:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb1754:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1758:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb175c:	d63f0200	blr	x16
   0x0000fffff7fb1760:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1764:	54002380	b.eq	0xfffff7fb1bd4  // b.none
   0x0000fffff7fb1768:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb176c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1770:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1774:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1778:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb177c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1780:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1784:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb1788:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb178c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1790:	d63f0200	blr	x16
   0x0000fffff7fb1794:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1798:	54002220	b.eq	0xfffff7fb1bdc  // b.none
   0x0000fffff7fb179c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb17a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb17a4:	540004a0	b.eq	0xfffff7fb1838  // b.none
   0x0000fffff7fb17a8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb17ac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb17b0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb17b4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb17b8:	54000400	b.eq	0xfffff7fb1838  // b.none
   0x0000fffff7fb17bc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb17c0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb17c4:	36d801d1	tbz	w17, #27, 0xfffff7fb17fc
   0x0000fffff7fb17c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb17cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb17d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb17d4:	54000321	b.ne	0xfffff7fb1838  // b.any
   0x0000fffff7fb17d8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb17dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb17e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb17e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb17e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb17ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb17f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb17f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb17f8:	54000209	b.ls	0xfffff7fb1838  // b.plast
   0x0000fffff7fb17fc:	36d8008d	tbz	w13, #27, 0xfffff7fb180c
   0x0000fffff7fb1800:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1804:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1808:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb180c:	36d80091	tbz	w17, #27, 0xfffff7fb181c
   0x0000fffff7fb1810:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1814:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1818:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb181c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb1820:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb1824:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb1828:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb182c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb1830:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb1834:	1400000e	b	0xfffff7fb186c
   0x0000fffff7fb1838:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb183c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1840:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1844:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1848:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb184c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1850:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1854:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb1858:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb185c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1860:	d63f0200	blr	x16
   0x0000fffff7fb1864:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1868:	54001be0	b.eq	0xfffff7fb1be4  // b.none
   0x0000fffff7fb186c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1870:	37d806a9	tbnz	w9, #27, 0xfffff7fb1944
   0x0000fffff7fb1874:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb1878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb187c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1880:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1884:	540001c1	b.ne	0xfffff7fb18bc  // b.any
   0x0000fffff7fb1888:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb188c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1890:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1894:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1898:	54000121	b.ne	0xfffff7fb18bc  // b.any
   0x0000fffff7fb189c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb18a0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb18a4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb18a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb18ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb18b0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb18b4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb18b8:	14000030	b	0xfffff7fb1978
   0x0000fffff7fb18bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb18c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb18c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb18c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb18cc:	54000120	b.eq	0xfffff7fb18f0  // b.none
   0x0000fffff7fb18d0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb18d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb18d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb18dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb18e0:	54000321	b.ne	0xfffff7fb1944  // b.any
   0x0000fffff7fb18e4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb18e8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb18ec:	14000002	b	0xfffff7fb18f4
   0x0000fffff7fb18f0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb18f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb18f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb18fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1900:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1904:	54000120	b.eq	0xfffff7fb1928  // b.none
   0x0000fffff7fb1908:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb190c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1914:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1918:	54000161	b.ne	0xfffff7fb1944  // b.any
   0x0000fffff7fb191c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb1920:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1924:	14000002	b	0xfffff7fb192c
   0x0000fffff7fb1928:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb192c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1930:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb1934:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb193c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb1940:	17ffffde	b	0xfffff7fb18b8
   0x0000fffff7fb1944:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1948:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb194c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1950:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1954:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb1958:	aa1403e4	mov	x4, x20
   0x0000fffff7fb195c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1960:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb1964:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1968:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb196c:	d63f0200	blr	x16
   0x0000fffff7fb1970:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1974:	540013c0	b.eq	0xfffff7fb1bec  // b.none
   0x0000fffff7fb1978:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb197c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb1980:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb1984:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb1988:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb198c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb1990:	36d801d1	tbz	w17, #27, 0xfffff7fb19c8
   0x0000fffff7fb1994:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1998:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb199c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb19a0:	54000281	b.ne	0xfffff7fb19f0  // b.any
   0x0000fffff7fb19a4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb19a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb19ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb19b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb19b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb19b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb19bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb19c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb19c4:	54000169	b.ls	0xfffff7fb19f0  // b.plast
   0x0000fffff7fb19c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb19cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb19d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb19d4:	36d80091	tbz	w17, #27, 0xfffff7fb19e4
   0x0000fffff7fb19d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb19dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb19e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb19e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb19e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb19ec:	1400000e	b	0xfffff7fb1a24
   0x0000fffff7fb19f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb19f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb19f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb19fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1a00:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb1a04:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1a08:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1a0c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb1a10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1a14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1a18:	d63f0200	blr	x16
   0x0000fffff7fb1a1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1a20:	54000ea0	b.eq	0xfffff7fb1bf4  // b.none
   0x0000fffff7fb1a24:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb1a28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1a2c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1a30:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1a34:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb1a38:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1a3c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1a40:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb1a44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1a48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1a4c:	d63f0200	blr	x16
   0x0000fffff7fb1a50:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1a54:	54000d40	b.eq	0xfffff7fb1bfc  // b.none
   0x0000fffff7fb1a58:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1a5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1a60:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1a64:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1a68:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fb1a6c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1a70:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1a74:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fb1a78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1a7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1a80:	d63f0200	blr	x16
   0x0000fffff7fb1a84:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb1a88:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb1a8c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb1a90:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb1a94:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb1a98:	d65f03c0	ret
   0x0000fffff7fb1a9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1aa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1aa4:	b900028a	str	w10, [x20]
   0x0000fffff7fb1aa8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb1aac:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb1ab0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb1ab4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb1ab8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb1abc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb1ac0:	d65f03c0	ret
   0x0000fffff7fb1ac4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb1ac8:	17fffff5	b	0xfffff7fb1a9c
   0x0000fffff7fb1acc:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb1ad0:	17fffff3	b	0xfffff7fb1a9c
   0x0000fffff7fb1ad4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb1ad8:	17fffff1	b	0xfffff7fb1a9c
   0x0000fffff7fb1adc:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fb1ae0:	17ffffef	b	0xfffff7fb1a9c
   0x0000fffff7fb1ae4:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb1ae8:	17ffffed	b	0xfffff7fb1a9c
   0x0000fffff7fb1aec:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb1af0:	17ffffeb	b	0xfffff7fb1a9c
   0x0000fffff7fb1af4:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb1af8:	17ffffe9	b	0xfffff7fb1a9c
   0x0000fffff7fb1afc:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb1b00:	17ffffe7	b	0xfffff7fb1a9c
   0x0000fffff7fb1b04:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb1b08:	17ffffe5	b	0xfffff7fb1a9c
   0x0000fffff7fb1b0c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb1b10:	17ffffe3	b	0xfffff7fb1a9c
   0x0000fffff7fb1b14:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb1b18:	17ffffe1	b	0xfffff7fb1a9c
   0x0000fffff7fb1b1c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb1b20:	17ffffdf	b	0xfffff7fb1a9c
   0x0000fffff7fb1b24:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb1b28:	17ffffdd	b	0xfffff7fb1a9c
   0x0000fffff7fb1b2c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb1b30:	17ffffdb	b	0xfffff7fb1a9c
   0x0000fffff7fb1b34:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb1b38:	17ffffd9	b	0xfffff7fb1a9c
   0x0000fffff7fb1b3c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb1b40:	17ffffd7	b	0xfffff7fb1a9c
   0x0000fffff7fb1b44:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb1b48:	17ffffd5	b	0xfffff7fb1a9c
   0x0000fffff7fb1b4c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb1b50:	17ffffd3	b	0xfffff7fb1a9c
   0x0000fffff7fb1b54:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb1b58:	17ffffd1	b	0xfffff7fb1a9c
   0x0000fffff7fb1b5c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb1b60:	17ffffcf	b	0xfffff7fb1a9c
   0x0000fffff7fb1b64:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb1b68:	17ffffcd	b	0xfffff7fb1a9c
   0x0000fffff7fb1b6c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb1b70:	17ffffcb	b	0xfffff7fb1a9c
   0x0000fffff7fb1b74:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb1b78:	17ffffc9	b	0xfffff7fb1a9c
   0x0000fffff7fb1b7c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb1b80:	17ffffc7	b	0xfffff7fb1a9c
   0x0000fffff7fb1b84:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb1b88:	17ffffc5	b	0xfffff7fb1a9c
   0x0000fffff7fb1b8c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb1b90:	17ffffc3	b	0xfffff7fb1a9c
   0x0000fffff7fb1b94:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb1b98:	17ffffc1	b	0xfffff7fb1a9c
   0x0000fffff7fb1b9c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb1ba0:	17ffffbf	b	0xfffff7fb1a9c
   0x0000fffff7fb1ba4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb1ba8:	17ffffbd	b	0xfffff7fb1a9c
   0x0000fffff7fb1bac:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb1bb0:	17ffffbb	b	0xfffff7fb1a9c
   0x0000fffff7fb1bb4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb1bb8:	17ffffb9	b	0xfffff7fb1a9c
   0x0000fffff7fb1bbc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb1bc0:	17ffffb7	b	0xfffff7fb1a9c
   0x0000fffff7fb1bc4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb1bc8:	17ffffb5	b	0xfffff7fb1a9c
   0x0000fffff7fb1bcc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb1bd0:	17ffffb3	b	0xfffff7fb1a9c
   0x0000fffff7fb1bd4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb1bd8:	17ffffb1	b	0xfffff7fb1a9c
   0x0000fffff7fb1bdc:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb1be0:	17ffffaf	b	0xfffff7fb1a9c
   0x0000fffff7fb1be4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb1be8:	17ffffad	b	0xfffff7fb1a9c
   0x0000fffff7fb1bec:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb1bf0:	17ffffab	b	0xfffff7fb1a9c
   0x0000fffff7fb1bf4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb1bf8:	17ffffa9	b	0xfffff7fb1a9c
   0x0000fffff7fb1bfc:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fb1c00:	17ffffa7	b	0xfffff7fb1a9c
   0x0000fffff7fb1c04:	00000000	udf	#0
   0x0000fffff7fb1c08:	00000000	udf	#0
   0x0000fffff7fb1c0c:	00000000	udf	#0
   0x0000fffff7fb1c10:	00000000	udf	#0
   0x0000fffff7fb1c14:	00000000	udf	#0
   0x0000fffff7fb1c18:	00000000	udf	#0
   0x0000fffff7fb1c1c:	00000000	udf	#0
   0x0000fffff7fb1c20:	00000000	udf	#0
   0x0000fffff7fb1c24:	00000000	udf	#0
   0x0000fffff7fb1c28:	00000000	udf	#0
   0x0000fffff7fb1c2c:	00000000	udf	#0
   0x0000fffff7fb1c30:	00000000	udf	#0
   0x0000fffff7fb1c34:	00000000	udf	#0
   0x0000fffff7fb1c38:	00000000	udf	#0
   0x0000fffff7fb1c3c:	00000000	udf	#0
   0x0000fffff7fb1c40:	00000000	udf	#0
   0x0000fffff7fb1c44:	00000000	udf	#0
   0x0000fffff7fb1c48:	00000000	udf	#0
   0x0000fffff7fb1c4c:	00000000	udf	#0
   0x0000fffff7fb1c50:	00000000	udf	#0
   0x0000fffff7fb1c54:	00000000	udf	#0
   0x0000fffff7fb1c58:	00000000	udf	#0
   0x0000fffff7fb1c5c:	00000000	udf	#0
   0x0000fffff7fb1c60:	00000000	udf	#0
   0x0000fffff7fb1c64:	00000000	udf	#0
   0x0000fffff7fb1c68:	00000000	udf	#0
   0x0000fffff7fb1c6c:	00000000	udf	#0
   0x0000fffff7fb1c70:	00000000	udf	#0
   0x0000fffff7fb1c74:	00000000	udf	#0
   0x0000fffff7fb1c78:	00000000	udf	#0
   0x0000fffff7fb1c7c:	00000000	udf	#0
   0x0000fffff7fb1c80:	00000000	udf	#0
   0x0000fffff7fb1c84:	00000000	udf	#0
   0x0000fffff7fb1c88:	00000000	udf	#0
   0x0000fffff7fb1c8c:	00000000	udf	#0
   0x0000fffff7fb1c90:	00000000	udf	#0
   0x0000fffff7fb1c94:	00000000	udf	#0
   0x0000fffff7fb1c98:	00000000	udf	#0
   0x0000fffff7fb1c9c:	00000000	udf	#0
   0x0000fffff7fb1ca0:	00000000	udf	#0
   0x0000fffff7fb1ca4:	00000000	udf	#0
   0x0000fffff7fb1ca8:	00000000	udf	#0
   0x0000fffff7fb1cac:	00000000	udf	#0
   0x0000fffff7fb1cb0:	00000000	udf	#0
   0x0000fffff7fb1cb4:	00000000	udf	#0
   0x0000fffff7fb1cb8:	00000000	udf	#0
   0x0000fffff7fb1cbc:	00000000	udf	#0
   0x0000fffff7fb1cc0:	00000000	udf	#0
   0x0000fffff7fb1cc4:	00000000	udf	#0
   0x0000fffff7fb1cc8:	00000000	udf	#0
   0x0000fffff7fb1ccc:	00000000	udf	#0
   0x0000fffff7fb1cd0:	00000000	udf	#0
   0x0000fffff7fb1cd4:	00000000	udf	#0
   0x0000fffff7fb1cd8:	00000000	udf	#0
   0x0000fffff7fb1cdc:	00000000	udf	#0
   0x0000fffff7fb1ce0:	00000000	udf	#0
   0x0000fffff7fb1ce4:	00000000	udf	#0
   0x0000fffff7fb1ce8:	00000000	udf	#0
   0x0000fffff7fb1cec:	00000000	udf	#0
   0x0000fffff7fb1cf0:	00000000	udf	#0
   0x0000fffff7fb1cf4:	00000000	udf	#0
   0x0000fffff7fb1cf8:	00000000	udf	#0
   0x0000fffff7fb1cfc:	00000000	udf	#0
   0x0000fffff7fb1d00:	00000000	udf	#0
   0x0000fffff7fb1d04:	00000000	udf	#0
   0x0000fffff7fb1d08:	00000000	udf	#0
   0x0000fffff7fb1d0c:	00000000	udf	#0
   0x0000fffff7fb1d10:	00000000	udf	#0
   0x0000fffff7fb1d14:	00000000	udf	#0
   0x0000fffff7fb1d18:	00000000	udf	#0
   0x0000fffff7fb1d1c:	00000000	udf	#0
   0x0000fffff7fb1d20:	00000000	udf	#0
   0x0000fffff7fb1d24:	00000000	udf	#0
   0x0000fffff7fb1d28:	00000000	udf	#0
   0x0000fffff7fb1d2c:	00000000	udf	#0
   0x0000fffff7fb1d30:	00000000	udf	#0
   0x0000fffff7fb1d34:	00000000	udf	#0
   0x0000fffff7fb1d38:	00000000	udf	#0
   0x0000fffff7fb1d3c:	00000000	udf	#0
   0x0000fffff7fb1d40:	00000000	udf	#0
   0x0000fffff7fb1d44:	00000000	udf	#0
   0x0000fffff7fb1d48:	00000000	udf	#0
   0x0000fffff7fb1d4c:	00000000	udf	#0
   0x0000fffff7fb1d50:	00000000	udf	#0
   0x0000fffff7fb1d54:	00000000	udf	#0
   0x0000fffff7fb1d58:	00000000	udf	#0
   0x0000fffff7fb1d5c:	00000000	udf	#0
   0x0000fffff7fb1d60:	00000000	udf	#0
   0x0000fffff7fb1d64:	00000000	udf	#0
   0x0000fffff7fb1d68:	00000000	udf	#0
   0x0000fffff7fb1d6c:	00000000	udf	#0
   0x0000fffff7fb1d70:	00000000	udf	#0
   0x0000fffff7fb1d74:	00000000	udf	#0
   0x0000fffff7fb1d78:	00000000	udf	#0
   0x0000fffff7fb1d7c:	00000000	udf	#0
   0x0000fffff7fb1d80:	00000000	udf	#0
   0x0000fffff7fb1d84:	00000000	udf	#0
   0x0000fffff7fb1d88:	00000000	udf	#0
   0x0000fffff7fb1d8c:	00000000	udf	#0
   0x0000fffff7fb1d90:	00000000	udf	#0
   0x0000fffff7fb1d94:	00000000	udf	#0
   0x0000fffff7fb1d98:	00000000	udf	#0
   0x0000fffff7fb1d9c:	00000000	udf	#0
   0x0000fffff7fb1da0:	00000000	udf	#0
   0x0000fffff7fb1da4:	00000000	udf	#0
   0x0000fffff7fb1da8:	00000000	udf	#0
   0x0000fffff7fb1dac:	00000000	udf	#0
   0x0000fffff7fb1db0:	00000000	udf	#0
   0x0000fffff7fb1db4:	00000000	udf	#0
   0x0000fffff7fb1db8:	00000000	udf	#0
   0x0000fffff7fb1dbc:	00000000	udf	#0
   0x0000fffff7fb1dc0:	00000000	udf	#0
   0x0000fffff7fb1dc4:	00000000	udf	#0
   0x0000fffff7fb1dc8:	00000000	udf	#0
   0x0000fffff7fb1dcc:	00000000	udf	#0
   0x0000fffff7fb1dd0:	00000000	udf	#0
   0x0000fffff7fb1dd4:	00000000	udf	#0
   0x0000fffff7fb1dd8:	00000000	udf	#0
   0x0000fffff7fb1ddc:	00000000	udf	#0
   0x0000fffff7fb1de0:	00000000	udf	#0
   0x0000fffff7fb1de4:	00000000	udf	#0
   0x0000fffff7fb1de8:	00000000	udf	#0
   0x0000fffff7fb1dec:	00000000	udf	#0
   0x0000fffff7fb1df0:	00000000	udf	#0
   0x0000fffff7fb1df4:	00000000	udf	#0
   0x0000fffff7fb1df8:	00000000	udf	#0
   0x0000fffff7fb1dfc:	00000000	udf	#0
   0x0000fffff7fb1e00:	00000000	udf	#0
   0x0000fffff7fb1e04:	00000000	udf	#0
   0x0000fffff7fb1e08:	00000000	udf	#0
   0x0000fffff7fb1e0c:	00000000	udf	#0
   0x0000fffff7fb1e10:	00000000	udf	#0
   0x0000fffff7fb1e14:	00000000	udf	#0
   0x0000fffff7fb1e18:	00000000	udf	#0
   0x0000fffff7fb1e1c:	00000000	udf	#0
   0x0000fffff7fb1e20:	00000000	udf	#0
   0x0000fffff7fb1e24:	00000000	udf	#0
   0x0000fffff7fb1e28:	00000000	udf	#0
   0x0000fffff7fb1e2c:	00000000	udf	#0
   0x0000fffff7fb1e30:	00000000	udf	#0
   0x0000fffff7fb1e34:	00000000	udf	#0
   0x0000fffff7fb1e38:	00000000	udf	#0
   0x0000fffff7fb1e3c:	00000000	udf	#0
   0x0000fffff7fb1e40:	00000000	udf	#0
   0x0000fffff7fb1e44:	00000000	udf	#0
   0x0000fffff7fb1e48:	00000000	udf	#0
   0x0000fffff7fb1e4c:	00000000	udf	#0
   0x0000fffff7fb1e50:	00000000	udf	#0
   0x0000fffff7fb1e54:	00000000	udf	#0
   0x0000fffff7fb1e58:	00000000	udf	#0
   0x0000fffff7fb1e5c:	00000000	udf	#0
   0x0000fffff7fb1e60:	00000000	udf	#0
   0x0000fffff7fb1e64:	00000000	udf	#0
   0x0000fffff7fb1e68:	00000000	udf	#0
   0x0000fffff7fb1e6c:	00000000	udf	#0
   0x0000fffff7fb1e70:	00000000	udf	#0
   0x0000fffff7fb1e74:	00000000	udf	#0
   0x0000fffff7fb1e78:	00000000	udf	#0
   0x0000fffff7fb1e7c:	00000000	udf	#0
   0x0000fffff7fb1e80:	00000000	udf	#0
   0x0000fffff7fb1e84:	00000000	udf	#0
   0x0000fffff7fb1e88:	00000000	udf	#0
   0x0000fffff7fb1e8c:	00000000	udf	#0
   0x0000fffff7fb1e90:	00000000	udf	#0
   0x0000fffff7fb1e94:	00000000	udf	#0
   0x0000fffff7fb1e98:	00000000	udf	#0
   0x0000fffff7fb1e9c:	00000000	udf	#0
   0x0000fffff7fb1ea0:	00000000	udf	#0
   0x0000fffff7fb1ea4:	00000000	udf	#0
   0x0000fffff7fb1ea8:	00000000	udf	#0
   0x0000fffff7fb1eac:	00000000	udf	#0
   0x0000fffff7fb1eb0:	00000000	udf	#0
   0x0000fffff7fb1eb4:	00000000	udf	#0
   0x0000fffff7fb1eb8:	00000000	udf	#0
   0x0000fffff7fb1ebc:	00000000	udf	#0
   0x0000fffff7fb1ec0:	00000000	udf	#0
   0x0000fffff7fb1ec4:	00000000	udf	#0
   0x0000fffff7fb1ec8:	00000000	udf	#0
   0x0000fffff7fb1ecc:	00000000	udf	#0
   0x0000fffff7fb1ed0:	00000000	udf	#0
   0x0000fffff7fb1ed4:	00000000	udf	#0
   0x0000fffff7fb1ed8:	00000000	udf	#0
   0x0000fffff7fb1edc:	00000000	udf	#0
   0x0000fffff7fb1ee0:	00000000	udf	#0
   0x0000fffff7fb1ee4:	00000000	udf	#0
   0x0000fffff7fb1ee8:	00000000	udf	#0
   0x0000fffff7fb1eec:	00000000	udf	#0
   0x0000fffff7fb1ef0:	00000000	udf	#0
   0x0000fffff7fb1ef4:	00000000	udf	#0
   0x0000fffff7fb1ef8:	00000000	udf	#0
   0x0000fffff7fb1efc:	00000000	udf	#0
   0x0000fffff7fb1f00:	00000000	udf	#0
   0x0000fffff7fb1f04:	00000000	udf	#0
   0x0000fffff7fb1f08:	00000000	udf	#0
   0x0000fffff7fb1f0c:	00000000	udf	#0
   0x0000fffff7fb1f10:	00000000	udf	#0
   0x0000fffff7fb1f14:	00000000	udf	#0
   0x0000fffff7fb1f18:	00000000	udf	#0
   0x0000fffff7fb1f1c:	00000000	udf	#0
   0x0000fffff7fb1f20:	00000000	udf	#0
   0x0000fffff7fb1f24:	00000000	udf	#0
   0x0000fffff7fb1f28:	00000000	udf	#0
   0x0000fffff7fb1f2c:	00000000	udf	#0
   0x0000fffff7fb1f30:	00000000	udf	#0
   0x0000fffff7fb1f34:	00000000	udf	#0
   0x0000fffff7fb1f38:	00000000	udf	#0
   0x0000fffff7fb1f3c:	00000000	udf	#0
   0x0000fffff7fb1f40:	00000000	udf	#0
   0x0000fffff7fb1f44:	00000000	udf	#0
   0x0000fffff7fb1f48:	00000000	udf	#0
   0x0000fffff7fb1f4c:	00000000	udf	#0
   0x0000fffff7fb1f50:	00000000	udf	#0
   0x0000fffff7fb1f54:	00000000	udf	#0
   0x0000fffff7fb1f58:	00000000	udf	#0
   0x0000fffff7fb1f5c:	00000000	udf	#0
   0x0000fffff7fb1f60:	00000000	udf	#0
   0x0000fffff7fb1f64:	00000000	udf	#0
   0x0000fffff7fb1f68:	00000000	udf	#0
   0x0000fffff7fb1f6c:	00000000	udf	#0
   0x0000fffff7fb1f70:	00000000	udf	#0
   0x0000fffff7fb1f74:	00000000	udf	#0
   0x0000fffff7fb1f78:	00000000	udf	#0
   0x0000fffff7fb1f7c:	00000000	udf	#0
   0x0000fffff7fb1f80:	00000000	udf	#0
   0x0000fffff7fb1f84:	00000000	udf	#0
   0x0000fffff7fb1f88:	00000000	udf	#0
   0x0000fffff7fb1f8c:	00000000	udf	#0
   0x0000fffff7fb1f90:	00000000	udf	#0
   0x0000fffff7fb1f94:	00000000	udf	#0
   0x0000fffff7fb1f98:	00000000	udf	#0
   0x0000fffff7fb1f9c:	00000000	udf	#0
   0x0000fffff7fb1fa0:	00000000	udf	#0
   0x0000fffff7fb1fa4:	00000000	udf	#0
   0x0000fffff7fb1fa8:	00000000	udf	#0
   0x0000fffff7fb1fac:	00000000	udf	#0
   0x0000fffff7fb1fb0:	00000000	udf	#0
   0x0000fffff7fb1fb4:	00000000	udf	#0
   0x0000fffff7fb1fb8:	00000000	udf	#0
   0x0000fffff7fb1fbc:	00000000	udf	#0
   0x0000fffff7fb1fc0:	00000000	udf	#0
   0x0000fffff7fb1fc4:	00000000	udf	#0
   0x0000fffff7fb1fc8:	00000000	udf	#0
   0x0000fffff7fb1fcc:	00000000	udf	#0
   0x0000fffff7fb1fd0:	00000000	udf	#0
   0x0000fffff7fb1fd4:	00000000	udf	#0
   0x0000fffff7fb1fd8:	00000000	udf	#0
   0x0000fffff7fb1fdc:	00000000	udf	#0
   0x0000fffff7fb1fe0:	00000000	udf	#0
   0x0000fffff7fb1fe4:	00000000	udf	#0
   0x0000fffff7fb1fe8:	00000000	udf	#0
   0x0000fffff7fb1fec:	00000000	udf	#0
   0x0000fffff7fb1ff0:	00000000	udf	#0
   0x0000fffff7fb1ff4:	00000000	udf	#0
   0x0000fffff7fb1ff8:	00000000	udf	#0
   0x0000fffff7fb1ffc:	00000000	udf	#0
End of assembler dump.
