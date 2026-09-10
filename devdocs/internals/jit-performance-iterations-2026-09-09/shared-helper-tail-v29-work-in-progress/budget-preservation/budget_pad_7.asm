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
   0x0000fffff7fb00ec:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb00f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb00f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb00f8:	d63f0200	blr	x16
   0x0000fffff7fb00fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0100:	5400d820	b.eq	0xfffff7fb1c04  // b.none
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
   0x0000fffff7fb017c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb0180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0188:	d63f0200	blr	x16
   0x0000fffff7fb018c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0190:	5400d3e0	b.eq	0xfffff7fb1c0c  // b.none
   0x0000fffff7fb0194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb019c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb01a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb01a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb01a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb01ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb01b0:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb01b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb01b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb01bc:	d63f0200	blr	x16
   0x0000fffff7fb01c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb01c4:	5400d280	b.eq	0xfffff7fb1c14  // b.none
   0x0000fffff7fb01c8:	14000001	b	0xfffff7fb01cc
   0x0000fffff7fb01cc:	14000001	b	0xfffff7fb01d0
   0x0000fffff7fb01d0:	14000001	b	0xfffff7fb01d4
   0x0000fffff7fb01d4:	14000001	b	0xfffff7fb01d8
   0x0000fffff7fb01d8:	14000001	b	0xfffff7fb01dc
   0x0000fffff7fb01dc:	14000001	b	0xfffff7fb01e0
   0x0000fffff7fb01e0:	14000001	b	0xfffff7fb01e4
   0x0000fffff7fb01e4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb01e8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb01ec:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb01f0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb01f4:	36d80211	tbz	w17, #27, 0xfffff7fb0234
   0x0000fffff7fb01f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb01fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0200:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0204:	540001e1	b.ne	0xfffff7fb0240  // b.any
   0x0000fffff7fb0208:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb020c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0210:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0214:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0218:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb021c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0220:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0224:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0228:	540000c9	b.ls	0xfffff7fb0240  // b.plast
   0x0000fffff7fb022c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0230:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0234:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0238:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb023c:	1400000e	b	0xfffff7fb0274
   0x0000fffff7fb0240:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0244:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0248:	aa1303e1	mov	x1, x19
   0x0000fffff7fb024c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0250:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb0254:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0258:	aa1603e5	mov	x5, x22
   0x0000fffff7fb025c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb0260:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0264:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0268:	d63f0200	blr	x16
   0x0000fffff7fb026c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0270:	5400cd60	b.eq	0xfffff7fb1c1c  // b.none
   0x0000fffff7fb0274:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb027c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0280:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0284:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb0288:	aa1403e4	mov	x4, x20
   0x0000fffff7fb028c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0290:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb0294:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb029c:	d63f0200	blr	x16
   0x0000fffff7fb02a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb02a4:	5400cc00	b.eq	0xfffff7fb1c24  // b.none
   0x0000fffff7fb02a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb02ac:	37d806a9	tbnz	w9, #27, 0xfffff7fb0380
   0x0000fffff7fb02b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb02b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb02b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb02bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb02c0:	540001c1	b.ne	0xfffff7fb02f8  // b.any
   0x0000fffff7fb02c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb02c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb02cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb02d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb02d4:	54000121	b.ne	0xfffff7fb02f8  // b.any
   0x0000fffff7fb02d8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb02dc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb02e0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb02e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb02e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb02ec:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb02f0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb02f4:	14000030	b	0xfffff7fb03b4
   0x0000fffff7fb02f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb02fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0304:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0308:	54000120	b.eq	0xfffff7fb032c  // b.none
   0x0000fffff7fb030c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0310:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0314:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0318:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb031c:	54000321	b.ne	0xfffff7fb0380  // b.any
   0x0000fffff7fb0320:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0324:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0328:	14000002	b	0xfffff7fb0330
   0x0000fffff7fb032c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb0330:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0334:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0338:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb033c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0340:	54000120	b.eq	0xfffff7fb0364  // b.none
   0x0000fffff7fb0344:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0348:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb034c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0350:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0354:	54000161	b.ne	0xfffff7fb0380  // b.any
   0x0000fffff7fb0358:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb035c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0360:	14000002	b	0xfffff7fb0368
   0x0000fffff7fb0364:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb0368:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb036c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb0370:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0374:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0378:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb037c:	17ffffde	b	0xfffff7fb02f4
   0x0000fffff7fb0380:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0384:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0388:	aa1303e1	mov	x1, x19
   0x0000fffff7fb038c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0390:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb0394:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0398:	aa1603e5	mov	x5, x22
   0x0000fffff7fb039c:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb03a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb03a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb03a8:	d63f0200	blr	x16
   0x0000fffff7fb03ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb03b0:	5400c3e0	b.eq	0xfffff7fb1c2c  // b.none
   0x0000fffff7fb03b4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb03b8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb03bc:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb03c0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb03c4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb03c8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb03cc:	36d801d1	tbz	w17, #27, 0xfffff7fb0404
   0x0000fffff7fb03d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb03d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb03d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb03dc:	54000281	b.ne	0xfffff7fb042c  // b.any
   0x0000fffff7fb03e0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb03e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb03e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb03ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb03f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb03f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb03f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb03fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0400:	54000169	b.ls	0xfffff7fb042c  // b.plast
   0x0000fffff7fb0404:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0408:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb040c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0410:	36d80091	tbz	w17, #27, 0xfffff7fb0420
   0x0000fffff7fb0414:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0418:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb041c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0420:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb0424:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb0428:	1400000e	b	0xfffff7fb0460
   0x0000fffff7fb042c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0434:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0438:	aa1503e2	mov	x2, x21
   0x0000fffff7fb043c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb0440:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0444:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0448:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb044c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0454:	d63f0200	blr	x16
   0x0000fffff7fb0458:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb045c:	5400bec0	b.eq	0xfffff7fb1c34  // b.none
   0x0000fffff7fb0460:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb0464:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0468:	540003a0	b.eq	0xfffff7fb04dc  // b.none
   0x0000fffff7fb046c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb0470:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb0474:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb0478:	36d801d1	tbz	w17, #27, 0xfffff7fb04b0
   0x0000fffff7fb047c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0480:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0484:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0488:	540002a1	b.ne	0xfffff7fb04dc  // b.any
   0x0000fffff7fb048c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb0490:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0494:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0498:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb049c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb04a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb04a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb04a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb04ac:	54000189	b.ls	0xfffff7fb04dc  // b.plast
   0x0000fffff7fb04b0:	36d8008d	tbz	w13, #27, 0xfffff7fb04c0
   0x0000fffff7fb04b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb04b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb04bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb04c0:	36d80091	tbz	w17, #27, 0xfffff7fb04d0
   0x0000fffff7fb04c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb04c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb04cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb04d0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb04d4:	b900016d	str	w13, [x11]
   0x0000fffff7fb04d8:	1400000e	b	0xfffff7fb0510
   0x0000fffff7fb04dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb04e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb04e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb04e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb04ec:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb04f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb04f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb04f8:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb04fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0500:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0504:	d63f0200	blr	x16
   0x0000fffff7fb0508:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb050c:	5400b980	b.eq	0xfffff7fb1c3c  // b.none
   0x0000fffff7fb0510:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0514:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0518:	540004a0	b.eq	0xfffff7fb05ac  // b.none
   0x0000fffff7fb051c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0520:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0524:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0528:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb052c:	54000400	b.eq	0xfffff7fb05ac  // b.none
   0x0000fffff7fb0530:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0534:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0538:	36d801d1	tbz	w17, #27, 0xfffff7fb0570
   0x0000fffff7fb053c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0540:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0544:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0548:	54000321	b.ne	0xfffff7fb05ac  // b.any
   0x0000fffff7fb054c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0550:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0554:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0558:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb055c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0560:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0564:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0568:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb056c:	54000209	b.ls	0xfffff7fb05ac  // b.plast
   0x0000fffff7fb0570:	36d8008d	tbz	w13, #27, 0xfffff7fb0580
   0x0000fffff7fb0574:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0578:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb057c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0580:	36d80091	tbz	w17, #27, 0xfffff7fb0590
   0x0000fffff7fb0584:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0588:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb058c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0590:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb0594:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb0598:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb059c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb05a0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb05a4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb05a8:	1400000e	b	0xfffff7fb05e0
   0x0000fffff7fb05ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb05b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb05b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb05b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb05bc:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb05c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb05c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb05c8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb05cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb05d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb05d4:	d63f0200	blr	x16
   0x0000fffff7fb05d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb05dc:	5400b340	b.eq	0xfffff7fb1c44  // b.none
   0x0000fffff7fb05e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb05e4:	37d806a9	tbnz	w9, #27, 0xfffff7fb06b8
   0x0000fffff7fb05e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb05ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb05f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05f8:	540001c1	b.ne	0xfffff7fb0630  // b.any
   0x0000fffff7fb05fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0608:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb060c:	54000121	b.ne	0xfffff7fb0630  // b.any
   0x0000fffff7fb0610:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0614:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb0618:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb061c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0624:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb0628:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb062c:	14000030	b	0xfffff7fb06ec
   0x0000fffff7fb0630:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0634:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb063c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0640:	54000120	b.eq	0xfffff7fb0664  // b.none
   0x0000fffff7fb0644:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0648:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb064c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0650:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0654:	54000321	b.ne	0xfffff7fb06b8  // b.any
   0x0000fffff7fb0658:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb065c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0660:	14000002	b	0xfffff7fb0668
   0x0000fffff7fb0664:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb0668:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb066c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0670:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0674:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0678:	54000120	b.eq	0xfffff7fb069c  // b.none
   0x0000fffff7fb067c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0680:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0688:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb068c:	54000161	b.ne	0xfffff7fb06b8  // b.any
   0x0000fffff7fb0690:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb0694:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0698:	14000002	b	0xfffff7fb06a0
   0x0000fffff7fb069c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb06a0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb06a4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb06a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb06ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb06b0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb06b4:	17ffffde	b	0xfffff7fb062c
   0x0000fffff7fb06b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb06bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb06c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb06c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb06c8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb06cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb06d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb06d4:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb06d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb06dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb06e0:	d63f0200	blr	x16
   0x0000fffff7fb06e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb06e8:	5400ab20	b.eq	0xfffff7fb1c4c  // b.none
   0x0000fffff7fb06ec:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb06f0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb06f4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb06f8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb06fc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0700:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb0704:	36d801d1	tbz	w17, #27, 0xfffff7fb073c
   0x0000fffff7fb0708:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb070c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0710:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0714:	54000281	b.ne	0xfffff7fb0764  // b.any
   0x0000fffff7fb0718:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb071c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0720:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0724:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0728:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb072c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0730:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0734:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0738:	54000169	b.ls	0xfffff7fb0764  // b.plast
   0x0000fffff7fb073c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0740:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0744:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0748:	36d80091	tbz	w17, #27, 0xfffff7fb0758
   0x0000fffff7fb074c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0750:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0754:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0758:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb075c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb0760:	1400000e	b	0xfffff7fb0798
   0x0000fffff7fb0764:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0768:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb076c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0770:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0774:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb0778:	aa1403e4	mov	x4, x20
   0x0000fffff7fb077c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0780:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb0784:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0788:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb078c:	d63f0200	blr	x16
   0x0000fffff7fb0790:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0794:	5400a600	b.eq	0xfffff7fb1c54  // b.none
   0x0000fffff7fb0798:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb079c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb07a0:	540003a0	b.eq	0xfffff7fb0814  // b.none
   0x0000fffff7fb07a4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb07a8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb07ac:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb07b0:	36d801d1	tbz	w17, #27, 0xfffff7fb07e8
   0x0000fffff7fb07b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb07b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb07bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb07c0:	540002a1	b.ne	0xfffff7fb0814  // b.any
   0x0000fffff7fb07c4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb07c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb07cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb07d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb07d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb07d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb07dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb07e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb07e4:	54000189	b.ls	0xfffff7fb0814  // b.plast
   0x0000fffff7fb07e8:	36d8008d	tbz	w13, #27, 0xfffff7fb07f8
   0x0000fffff7fb07ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb07f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb07f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb07f8:	36d80091	tbz	w17, #27, 0xfffff7fb0808
   0x0000fffff7fb07fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0800:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0804:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0808:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb080c:	b900016d	str	w13, [x11]
   0x0000fffff7fb0810:	1400000e	b	0xfffff7fb0848
   0x0000fffff7fb0814:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0818:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb081c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0820:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0824:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb0828:	aa1403e4	mov	x4, x20
   0x0000fffff7fb082c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0830:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb0834:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0838:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb083c:	d63f0200	blr	x16
   0x0000fffff7fb0840:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0844:	5400a0c0	b.eq	0xfffff7fb1c5c  // b.none
   0x0000fffff7fb0848:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb084c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0850:	540004a0	b.eq	0xfffff7fb08e4  // b.none
   0x0000fffff7fb0854:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0858:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb085c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0860:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0864:	54000400	b.eq	0xfffff7fb08e4  // b.none
   0x0000fffff7fb0868:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb086c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0870:	36d801d1	tbz	w17, #27, 0xfffff7fb08a8
   0x0000fffff7fb0874:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0878:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb087c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0880:	54000321	b.ne	0xfffff7fb08e4  // b.any
   0x0000fffff7fb0884:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0888:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb088c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0890:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0894:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0898:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb089c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb08a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb08a4:	54000209	b.ls	0xfffff7fb08e4  // b.plast
   0x0000fffff7fb08a8:	36d8008d	tbz	w13, #27, 0xfffff7fb08b8
   0x0000fffff7fb08ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb08b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb08b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb08b8:	36d80091	tbz	w17, #27, 0xfffff7fb08c8
   0x0000fffff7fb08bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb08c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb08c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb08c8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb08cc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb08d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb08d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb08d8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb08dc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb08e0:	1400000e	b	0xfffff7fb0918
   0x0000fffff7fb08e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb08e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb08ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fb08f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb08f4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb08f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb08fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0900:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb0904:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0908:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb090c:	d63f0200	blr	x16
   0x0000fffff7fb0910:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0914:	54009a80	b.eq	0xfffff7fb1c64  // b.none
   0x0000fffff7fb0918:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb091c:	37d806a9	tbnz	w9, #27, 0xfffff7fb09f0
   0x0000fffff7fb0920:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb092c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0930:	540001c1	b.ne	0xfffff7fb0968  // b.any
   0x0000fffff7fb0934:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb093c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0940:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0944:	54000121	b.ne	0xfffff7fb0968  // b.any
   0x0000fffff7fb0948:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb094c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb0950:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb095c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb0960:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb0964:	14000030	b	0xfffff7fb0a24
   0x0000fffff7fb0968:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb096c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0974:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0978:	54000120	b.eq	0xfffff7fb099c  // b.none
   0x0000fffff7fb097c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0980:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0988:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb098c:	54000321	b.ne	0xfffff7fb09f0  // b.any
   0x0000fffff7fb0990:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0994:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0998:	14000002	b	0xfffff7fb09a0
   0x0000fffff7fb099c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb09a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb09a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb09a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb09ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb09b0:	54000120	b.eq	0xfffff7fb09d4  // b.none
   0x0000fffff7fb09b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb09b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb09bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb09c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb09c4:	54000161	b.ne	0xfffff7fb09f0  // b.any
   0x0000fffff7fb09c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb09cc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb09d0:	14000002	b	0xfffff7fb09d8
   0x0000fffff7fb09d4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb09d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb09dc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb09e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb09e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb09e8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb09ec:	17ffffde	b	0xfffff7fb0964
   0x0000fffff7fb09f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb09f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb09f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb09fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0a00:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb0a04:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0a08:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0a0c:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb0a10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0a14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0a18:	d63f0200	blr	x16
   0x0000fffff7fb0a1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0a20:	54009260	b.eq	0xfffff7fb1c6c  // b.none
   0x0000fffff7fb0a24:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb0a28:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb0a2c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb0a30:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0a34:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0a38:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb0a3c:	36d801d1	tbz	w17, #27, 0xfffff7fb0a74
   0x0000fffff7fb0a40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0a44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0a48:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0a4c:	54000281	b.ne	0xfffff7fb0a9c  // b.any
   0x0000fffff7fb0a50:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb0a54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0a58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0a5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0a60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0a64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0a68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0a6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0a70:	54000169	b.ls	0xfffff7fb0a9c  // b.plast
   0x0000fffff7fb0a74:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0a78:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0a7c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0a80:	36d80091	tbz	w17, #27, 0xfffff7fb0a90
   0x0000fffff7fb0a84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0a88:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0a8c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0a90:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb0a94:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb0a98:	1400000e	b	0xfffff7fb0ad0
   0x0000fffff7fb0a9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0aa0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0aa4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0aa8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0aac:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb0ab0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0ab4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0ab8:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb0abc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0ac0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0ac4:	d63f0200	blr	x16
   0x0000fffff7fb0ac8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0acc:	54008d40	b.eq	0xfffff7fb1c74  // b.none
   0x0000fffff7fb0ad0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb0ad4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0ad8:	540003a0	b.eq	0xfffff7fb0b4c  // b.none
   0x0000fffff7fb0adc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb0ae0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb0ae4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb0ae8:	36d801d1	tbz	w17, #27, 0xfffff7fb0b20
   0x0000fffff7fb0aec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0af0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0af4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0af8:	540002a1	b.ne	0xfffff7fb0b4c  // b.any
   0x0000fffff7fb0afc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb0b00:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0b04:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0b08:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0b0c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0b10:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0b14:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0b18:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0b1c:	54000189	b.ls	0xfffff7fb0b4c  // b.plast
   0x0000fffff7fb0b20:	36d8008d	tbz	w13, #27, 0xfffff7fb0b30
   0x0000fffff7fb0b24:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0b28:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0b2c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0b30:	36d80091	tbz	w17, #27, 0xfffff7fb0b40
   0x0000fffff7fb0b34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0b38:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0b3c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0b40:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb0b44:	b900016d	str	w13, [x11]
   0x0000fffff7fb0b48:	1400000e	b	0xfffff7fb0b80
   0x0000fffff7fb0b4c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0b50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0b54:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0b58:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0b5c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb0b60:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0b64:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0b68:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb0b6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0b70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0b74:	d63f0200	blr	x16
   0x0000fffff7fb0b78:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0b7c:	54008800	b.eq	0xfffff7fb1c7c  // b.none
   0x0000fffff7fb0b80:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0b84:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0b88:	540004a0	b.eq	0xfffff7fb0c1c  // b.none
   0x0000fffff7fb0b8c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0b90:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0b94:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0b98:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0b9c:	54000400	b.eq	0xfffff7fb0c1c  // b.none
   0x0000fffff7fb0ba0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0ba4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0ba8:	36d801d1	tbz	w17, #27, 0xfffff7fb0be0
   0x0000fffff7fb0bac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0bb0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0bb4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0bb8:	54000321	b.ne	0xfffff7fb0c1c  // b.any
   0x0000fffff7fb0bbc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0bc0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0bc4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0bc8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0bcc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0bd0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0bd4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0bd8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0bdc:	54000209	b.ls	0xfffff7fb0c1c  // b.plast
   0x0000fffff7fb0be0:	36d8008d	tbz	w13, #27, 0xfffff7fb0bf0
   0x0000fffff7fb0be4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0be8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0bec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0bf0:	36d80091	tbz	w17, #27, 0xfffff7fb0c00
   0x0000fffff7fb0bf4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0bf8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0bfc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0c00:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb0c04:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb0c08:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0c0c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0c10:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb0c14:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb0c18:	1400000e	b	0xfffff7fb0c50
   0x0000fffff7fb0c1c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0c20:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0c24:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0c28:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0c2c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb0c30:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0c34:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0c38:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb0c3c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0c40:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0c44:	d63f0200	blr	x16
   0x0000fffff7fb0c48:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0c4c:	540081c0	b.eq	0xfffff7fb1c84  // b.none
   0x0000fffff7fb0c50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0c54:	37d806a9	tbnz	w9, #27, 0xfffff7fb0d28
   0x0000fffff7fb0c58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0c5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0c60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0c64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0c68:	540001c1	b.ne	0xfffff7fb0ca0  // b.any
   0x0000fffff7fb0c6c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0c70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0c74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0c78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0c7c:	54000121	b.ne	0xfffff7fb0ca0  // b.any
   0x0000fffff7fb0c80:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0c84:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb0c88:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0c8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0c90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0c94:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb0c98:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb0c9c:	14000030	b	0xfffff7fb0d5c
   0x0000fffff7fb0ca0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0ca4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0ca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0cb0:	54000120	b.eq	0xfffff7fb0cd4  // b.none
   0x0000fffff7fb0cb4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0cb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0cbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0cc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0cc4:	54000321	b.ne	0xfffff7fb0d28  // b.any
   0x0000fffff7fb0cc8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0ccc:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0cd0:	14000002	b	0xfffff7fb0cd8
   0x0000fffff7fb0cd4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb0cd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0cdc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0ce4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0ce8:	54000120	b.eq	0xfffff7fb0d0c  // b.none
   0x0000fffff7fb0cec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0cf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0cf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0cf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0cfc:	54000161	b.ne	0xfffff7fb0d28  // b.any
   0x0000fffff7fb0d00:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb0d04:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0d08:	14000002	b	0xfffff7fb0d10
   0x0000fffff7fb0d0c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb0d10:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0d14:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb0d18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0d1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0d20:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb0d24:	17ffffde	b	0xfffff7fb0c9c
   0x0000fffff7fb0d28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0d2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0d30:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0d34:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0d38:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb0d3c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0d40:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0d44:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb0d48:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0d4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0d50:	d63f0200	blr	x16
   0x0000fffff7fb0d54:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0d58:	540079a0	b.eq	0xfffff7fb1c8c  // b.none
   0x0000fffff7fb0d5c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb0d60:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb0d64:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb0d68:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0d6c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0d70:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb0d74:	36d801d1	tbz	w17, #27, 0xfffff7fb0dac
   0x0000fffff7fb0d78:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0d7c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0d80:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0d84:	54000281	b.ne	0xfffff7fb0dd4  // b.any
   0x0000fffff7fb0d88:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb0d8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0d90:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0d94:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0d98:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0d9c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0da0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0da4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0da8:	54000169	b.ls	0xfffff7fb0dd4  // b.plast
   0x0000fffff7fb0dac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0db0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0db4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0db8:	36d80091	tbz	w17, #27, 0xfffff7fb0dc8
   0x0000fffff7fb0dbc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0dc0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0dc4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0dc8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb0dcc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb0dd0:	1400000e	b	0xfffff7fb0e08
   0x0000fffff7fb0dd4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0dd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0ddc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0de0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0de4:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb0de8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0dec:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0df0:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb0df4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0df8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0dfc:	d63f0200	blr	x16
   0x0000fffff7fb0e00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0e04:	54007480	b.eq	0xfffff7fb1c94  // b.none
   0x0000fffff7fb0e08:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb0e0c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0e10:	540003a0	b.eq	0xfffff7fb0e84  // b.none
   0x0000fffff7fb0e14:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb0e18:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb0e1c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb0e20:	36d801d1	tbz	w17, #27, 0xfffff7fb0e58
   0x0000fffff7fb0e24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0e28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0e2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0e30:	540002a1	b.ne	0xfffff7fb0e84  // b.any
   0x0000fffff7fb0e34:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb0e38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0e3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0e40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0e44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0e48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0e4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0e50:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0e54:	54000189	b.ls	0xfffff7fb0e84  // b.plast
   0x0000fffff7fb0e58:	36d8008d	tbz	w13, #27, 0xfffff7fb0e68
   0x0000fffff7fb0e5c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0e60:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0e64:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0e68:	36d80091	tbz	w17, #27, 0xfffff7fb0e78
   0x0000fffff7fb0e6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0e70:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0e74:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0e78:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb0e7c:	b900016d	str	w13, [x11]
   0x0000fffff7fb0e80:	1400000e	b	0xfffff7fb0eb8
   0x0000fffff7fb0e84:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0e88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0e8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0e90:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0e94:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb0e98:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0e9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0ea0:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb0ea4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0ea8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0eac:	d63f0200	blr	x16
   0x0000fffff7fb0eb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0eb4:	54006f40	b.eq	0xfffff7fb1c9c  // b.none
   0x0000fffff7fb0eb8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0ebc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0ec0:	540004a0	b.eq	0xfffff7fb0f54  // b.none
   0x0000fffff7fb0ec4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0ec8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0ecc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0ed0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0ed4:	54000400	b.eq	0xfffff7fb0f54  // b.none
   0x0000fffff7fb0ed8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0edc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0ee0:	36d801d1	tbz	w17, #27, 0xfffff7fb0f18
   0x0000fffff7fb0ee4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0ee8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0eec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0ef0:	54000321	b.ne	0xfffff7fb0f54  // b.any
   0x0000fffff7fb0ef4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0ef8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0efc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0f00:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0f04:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0f08:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0f0c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0f10:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0f14:	54000209	b.ls	0xfffff7fb0f54  // b.plast
   0x0000fffff7fb0f18:	36d8008d	tbz	w13, #27, 0xfffff7fb0f28
   0x0000fffff7fb0f1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0f20:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0f24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0f28:	36d80091	tbz	w17, #27, 0xfffff7fb0f38
   0x0000fffff7fb0f2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0f30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0f34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0f38:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb0f3c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb0f40:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0f44:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0f48:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb0f4c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb0f50:	1400000e	b	0xfffff7fb0f88
   0x0000fffff7fb0f54:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0f58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0f5c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0f60:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0f64:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb0f68:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0f6c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0f70:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb0f74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0f78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0f7c:	d63f0200	blr	x16
   0x0000fffff7fb0f80:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0f84:	54006900	b.eq	0xfffff7fb1ca4  // b.none
   0x0000fffff7fb0f88:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0f8c:	37d806a9	tbnz	w9, #27, 0xfffff7fb1060
   0x0000fffff7fb0f90:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0f94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0f98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0f9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0fa0:	540001c1	b.ne	0xfffff7fb0fd8  // b.any
   0x0000fffff7fb0fa4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0fa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0fac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0fb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0fb4:	54000121	b.ne	0xfffff7fb0fd8  // b.any
   0x0000fffff7fb0fb8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0fbc:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb0fc0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0fc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0fc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0fcc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb0fd0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb0fd4:	14000030	b	0xfffff7fb1094
   0x0000fffff7fb0fd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0fdc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0fe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0fe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0fe8:	54000120	b.eq	0xfffff7fb100c  // b.none
   0x0000fffff7fb0fec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0ff0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0ff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0ff8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0ffc:	54000321	b.ne	0xfffff7fb1060  // b.any
   0x0000fffff7fb1000:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb1004:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1008:	14000002	b	0xfffff7fb1010
   0x0000fffff7fb100c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb1010:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1014:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1018:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb101c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1020:	54000120	b.eq	0xfffff7fb1044  // b.none
   0x0000fffff7fb1024:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1028:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb102c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1030:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1034:	54000161	b.ne	0xfffff7fb1060  // b.any
   0x0000fffff7fb1038:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb103c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1040:	14000002	b	0xfffff7fb1048
   0x0000fffff7fb1044:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb1048:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb104c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb1050:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1054:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1058:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb105c:	17ffffde	b	0xfffff7fb0fd4
   0x0000fffff7fb1060:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1064:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1068:	aa1303e1	mov	x1, x19
   0x0000fffff7fb106c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1070:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb1074:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1078:	aa1603e5	mov	x5, x22
   0x0000fffff7fb107c:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb1080:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1084:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1088:	d63f0200	blr	x16
   0x0000fffff7fb108c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1090:	540060e0	b.eq	0xfffff7fb1cac  // b.none
   0x0000fffff7fb1094:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb1098:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb109c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb10a0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb10a4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb10a8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb10ac:	36d801d1	tbz	w17, #27, 0xfffff7fb10e4
   0x0000fffff7fb10b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb10b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb10b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb10bc:	54000281	b.ne	0xfffff7fb110c  // b.any
   0x0000fffff7fb10c0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb10c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb10c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb10cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb10d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb10d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb10d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb10dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb10e0:	54000169	b.ls	0xfffff7fb110c  // b.plast
   0x0000fffff7fb10e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb10e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb10ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb10f0:	36d80091	tbz	w17, #27, 0xfffff7fb1100
   0x0000fffff7fb10f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb10f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb10fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1100:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb1104:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb1108:	1400000e	b	0xfffff7fb1140
   0x0000fffff7fb110c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1110:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1114:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1118:	aa1503e2	mov	x2, x21
   0x0000fffff7fb111c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb1120:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1124:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1128:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb112c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1130:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1134:	d63f0200	blr	x16
   0x0000fffff7fb1138:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb113c:	54005bc0	b.eq	0xfffff7fb1cb4  // b.none
   0x0000fffff7fb1140:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb1144:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1148:	540003a0	b.eq	0xfffff7fb11bc  // b.none
   0x0000fffff7fb114c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb1150:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb1154:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb1158:	36d801d1	tbz	w17, #27, 0xfffff7fb1190
   0x0000fffff7fb115c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1160:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1164:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1168:	540002a1	b.ne	0xfffff7fb11bc  // b.any
   0x0000fffff7fb116c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb1170:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1174:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1178:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb117c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1180:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1184:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1188:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb118c:	54000189	b.ls	0xfffff7fb11bc  // b.plast
   0x0000fffff7fb1190:	36d8008d	tbz	w13, #27, 0xfffff7fb11a0
   0x0000fffff7fb1194:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1198:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb119c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb11a0:	36d80091	tbz	w17, #27, 0xfffff7fb11b0
   0x0000fffff7fb11a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb11a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb11ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb11b0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb11b4:	b900016d	str	w13, [x11]
   0x0000fffff7fb11b8:	1400000e	b	0xfffff7fb11f0
   0x0000fffff7fb11bc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb11c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb11c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb11c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb11cc:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb11d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb11d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb11d8:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb11dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb11e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb11e4:	d63f0200	blr	x16
   0x0000fffff7fb11e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb11ec:	54005680	b.eq	0xfffff7fb1cbc  // b.none
   0x0000fffff7fb11f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb11f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb11f8:	540004a0	b.eq	0xfffff7fb128c  // b.none
   0x0000fffff7fb11fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1200:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb1204:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb1208:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb120c:	54000400	b.eq	0xfffff7fb128c  // b.none
   0x0000fffff7fb1210:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1214:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb1218:	36d801d1	tbz	w17, #27, 0xfffff7fb1250
   0x0000fffff7fb121c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1220:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1224:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1228:	54000321	b.ne	0xfffff7fb128c  // b.any
   0x0000fffff7fb122c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1230:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1234:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1238:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb123c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1240:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1244:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1248:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb124c:	54000209	b.ls	0xfffff7fb128c  // b.plast
   0x0000fffff7fb1250:	36d8008d	tbz	w13, #27, 0xfffff7fb1260
   0x0000fffff7fb1254:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1258:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb125c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1260:	36d80091	tbz	w17, #27, 0xfffff7fb1270
   0x0000fffff7fb1264:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1268:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb126c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1270:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb1274:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb1278:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb127c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb1280:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb1284:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb1288:	1400000e	b	0xfffff7fb12c0
   0x0000fffff7fb128c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1290:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1294:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1298:	aa1503e2	mov	x2, x21
   0x0000fffff7fb129c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb12a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb12a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb12a8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb12ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb12b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb12b4:	d63f0200	blr	x16
   0x0000fffff7fb12b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb12bc:	54005040	b.eq	0xfffff7fb1cc4  // b.none
   0x0000fffff7fb12c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb12c4:	37d806a9	tbnz	w9, #27, 0xfffff7fb1398
   0x0000fffff7fb12c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb12cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb12d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb12d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb12d8:	540001c1	b.ne	0xfffff7fb1310  // b.any
   0x0000fffff7fb12dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb12e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb12e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb12e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb12ec:	54000121	b.ne	0xfffff7fb1310  // b.any
   0x0000fffff7fb12f0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb12f4:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb12f8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb12fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1304:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb1308:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb130c:	14000030	b	0xfffff7fb13cc
   0x0000fffff7fb1310:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1314:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb131c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1320:	54000120	b.eq	0xfffff7fb1344  // b.none
   0x0000fffff7fb1324:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1328:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb132c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1330:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1334:	54000321	b.ne	0xfffff7fb1398  // b.any
   0x0000fffff7fb1338:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb133c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1340:	14000002	b	0xfffff7fb1348
   0x0000fffff7fb1344:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb1348:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb134c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1350:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1354:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1358:	54000120	b.eq	0xfffff7fb137c  // b.none
   0x0000fffff7fb135c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1360:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1368:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb136c:	54000161	b.ne	0xfffff7fb1398  // b.any
   0x0000fffff7fb1370:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1374:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1378:	14000002	b	0xfffff7fb1380
   0x0000fffff7fb137c:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb1380:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1384:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb1388:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb138c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1390:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb1394:	17ffffde	b	0xfffff7fb130c
   0x0000fffff7fb1398:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb139c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb13a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb13a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb13a8:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb13ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fb13b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb13b4:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb13b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb13bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb13c0:	d63f0200	blr	x16
   0x0000fffff7fb13c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb13c8:	54004820	b.eq	0xfffff7fb1ccc  // b.none
   0x0000fffff7fb13cc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb13d0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb13d4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb13d8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb13dc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb13e0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb13e4:	36d801d1	tbz	w17, #27, 0xfffff7fb141c
   0x0000fffff7fb13e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb13ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb13f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb13f4:	54000281	b.ne	0xfffff7fb1444  // b.any
   0x0000fffff7fb13f8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb13fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1400:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1404:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1408:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb140c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1410:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1414:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1418:	54000169	b.ls	0xfffff7fb1444  // b.plast
   0x0000fffff7fb141c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1420:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1424:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1428:	36d80091	tbz	w17, #27, 0xfffff7fb1438
   0x0000fffff7fb142c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1430:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1434:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1438:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb143c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb1440:	1400000e	b	0xfffff7fb1478
   0x0000fffff7fb1444:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1448:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb144c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1450:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1454:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb1458:	aa1403e4	mov	x4, x20
   0x0000fffff7fb145c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1460:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb1464:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1468:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb146c:	d63f0200	blr	x16
   0x0000fffff7fb1470:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1474:	54004300	b.eq	0xfffff7fb1cd4  // b.none
   0x0000fffff7fb1478:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb147c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1480:	540003a0	b.eq	0xfffff7fb14f4  // b.none
   0x0000fffff7fb1484:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb1488:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb148c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb1490:	36d801d1	tbz	w17, #27, 0xfffff7fb14c8
   0x0000fffff7fb1494:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1498:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb149c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb14a0:	540002a1	b.ne	0xfffff7fb14f4  // b.any
   0x0000fffff7fb14a4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb14a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb14ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb14b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb14b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb14b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb14bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb14c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb14c4:	54000189	b.ls	0xfffff7fb14f4  // b.plast
   0x0000fffff7fb14c8:	36d8008d	tbz	w13, #27, 0xfffff7fb14d8
   0x0000fffff7fb14cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb14d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb14d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb14d8:	36d80091	tbz	w17, #27, 0xfffff7fb14e8
   0x0000fffff7fb14dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb14e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb14e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb14e8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb14ec:	b900016d	str	w13, [x11]
   0x0000fffff7fb14f0:	1400000e	b	0xfffff7fb1528
   0x0000fffff7fb14f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb14f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb14fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1500:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1504:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb1508:	aa1403e4	mov	x4, x20
   0x0000fffff7fb150c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1510:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb1514:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1518:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb151c:	d63f0200	blr	x16
   0x0000fffff7fb1520:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1524:	54003dc0	b.eq	0xfffff7fb1cdc  // b.none
   0x0000fffff7fb1528:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb152c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1530:	540004a0	b.eq	0xfffff7fb15c4  // b.none
   0x0000fffff7fb1534:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1538:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb153c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb1540:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1544:	54000400	b.eq	0xfffff7fb15c4  // b.none
   0x0000fffff7fb1548:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb154c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb1550:	36d801d1	tbz	w17, #27, 0xfffff7fb1588
   0x0000fffff7fb1554:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1558:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb155c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1560:	54000321	b.ne	0xfffff7fb15c4  // b.any
   0x0000fffff7fb1564:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1568:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb156c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1570:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1574:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1578:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb157c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1580:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1584:	54000209	b.ls	0xfffff7fb15c4  // b.plast
   0x0000fffff7fb1588:	36d8008d	tbz	w13, #27, 0xfffff7fb1598
   0x0000fffff7fb158c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1590:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1594:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1598:	36d80091	tbz	w17, #27, 0xfffff7fb15a8
   0x0000fffff7fb159c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb15a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb15a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb15a8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb15ac:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb15b0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb15b4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb15b8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb15bc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb15c0:	1400000e	b	0xfffff7fb15f8
   0x0000fffff7fb15c4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb15c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb15cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb15d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb15d4:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb15d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb15dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb15e0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb15e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb15e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb15ec:	d63f0200	blr	x16
   0x0000fffff7fb15f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb15f4:	54003780	b.eq	0xfffff7fb1ce4  // b.none
   0x0000fffff7fb15f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb15fc:	37d806a9	tbnz	w9, #27, 0xfffff7fb16d0
   0x0000fffff7fb1600:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1604:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb160c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1610:	540001c1	b.ne	0xfffff7fb1648  // b.any
   0x0000fffff7fb1614:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb161c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1620:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1624:	54000121	b.ne	0xfffff7fb1648  // b.any
   0x0000fffff7fb1628:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb162c:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb1630:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1634:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb163c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb1640:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb1644:	14000030	b	0xfffff7fb1704
   0x0000fffff7fb1648:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb164c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1650:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1654:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1658:	54000120	b.eq	0xfffff7fb167c  // b.none
   0x0000fffff7fb165c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1660:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1668:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb166c:	54000321	b.ne	0xfffff7fb16d0  // b.any
   0x0000fffff7fb1670:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb1674:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1678:	14000002	b	0xfffff7fb1680
   0x0000fffff7fb167c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb1680:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1684:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb168c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1690:	54000120	b.eq	0xfffff7fb16b4  // b.none
   0x0000fffff7fb1694:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1698:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb169c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb16a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb16a4:	54000161	b.ne	0xfffff7fb16d0  // b.any
   0x0000fffff7fb16a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb16ac:	9e620121	scvtf	d1, x9
   0x0000fffff7fb16b0:	14000002	b	0xfffff7fb16b8
   0x0000fffff7fb16b4:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb16b8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb16bc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb16c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb16c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb16c8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb16cc:	17ffffde	b	0xfffff7fb1644
   0x0000fffff7fb16d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb16d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb16d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb16dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb16e0:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb16e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb16e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb16ec:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb16f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb16f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb16f8:	d63f0200	blr	x16
   0x0000fffff7fb16fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1700:	54002f60	b.eq	0xfffff7fb1cec  // b.none
   0x0000fffff7fb1704:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb1708:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb170c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb1710:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb1714:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb1718:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb171c:	36d801d1	tbz	w17, #27, 0xfffff7fb1754
   0x0000fffff7fb1720:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1724:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1728:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb172c:	54000281	b.ne	0xfffff7fb177c  // b.any
   0x0000fffff7fb1730:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb1734:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1738:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb173c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1740:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1744:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1748:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb174c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1750:	54000169	b.ls	0xfffff7fb177c  // b.plast
   0x0000fffff7fb1754:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1758:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb175c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1760:	36d80091	tbz	w17, #27, 0xfffff7fb1770
   0x0000fffff7fb1764:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1768:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb176c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1770:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb1774:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb1778:	1400000e	b	0xfffff7fb17b0
   0x0000fffff7fb177c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1780:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1784:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1788:	aa1503e2	mov	x2, x21
   0x0000fffff7fb178c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb1790:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1794:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1798:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb179c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb17a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb17a4:	d63f0200	blr	x16
   0x0000fffff7fb17a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb17ac:	54002a40	b.eq	0xfffff7fb1cf4  // b.none
   0x0000fffff7fb17b0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb17b4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb17b8:	540003a0	b.eq	0xfffff7fb182c  // b.none
   0x0000fffff7fb17bc:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb17c0:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb17c4:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb17c8:	36d801d1	tbz	w17, #27, 0xfffff7fb1800
   0x0000fffff7fb17cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb17d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb17d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb17d8:	540002a1	b.ne	0xfffff7fb182c  // b.any
   0x0000fffff7fb17dc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb17e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb17e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb17e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb17ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb17f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb17f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb17f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb17fc:	54000189	b.ls	0xfffff7fb182c  // b.plast
   0x0000fffff7fb1800:	36d8008d	tbz	w13, #27, 0xfffff7fb1810
   0x0000fffff7fb1804:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1808:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb180c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1810:	36d80091	tbz	w17, #27, 0xfffff7fb1820
   0x0000fffff7fb1814:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1818:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb181c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1820:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb1824:	b900016d	str	w13, [x11]
   0x0000fffff7fb1828:	1400000e	b	0xfffff7fb1860
   0x0000fffff7fb182c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb1830:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1834:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1838:	aa1503e2	mov	x2, x21
   0x0000fffff7fb183c:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb1840:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1844:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1848:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb184c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1850:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1854:	d63f0200	blr	x16
   0x0000fffff7fb1858:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb185c:	54002500	b.eq	0xfffff7fb1cfc  // b.none
   0x0000fffff7fb1860:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb1864:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1868:	540004a0	b.eq	0xfffff7fb18fc  // b.none
   0x0000fffff7fb186c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1870:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb1874:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb1878:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb187c:	54000400	b.eq	0xfffff7fb18fc  // b.none
   0x0000fffff7fb1880:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1884:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb1888:	36d801d1	tbz	w17, #27, 0xfffff7fb18c0
   0x0000fffff7fb188c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1890:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1894:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1898:	54000321	b.ne	0xfffff7fb18fc  // b.any
   0x0000fffff7fb189c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb18a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb18a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb18a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb18ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb18b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb18b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb18b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb18bc:	54000209	b.ls	0xfffff7fb18fc  // b.plast
   0x0000fffff7fb18c0:	36d8008d	tbz	w13, #27, 0xfffff7fb18d0
   0x0000fffff7fb18c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb18c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb18cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb18d0:	36d80091	tbz	w17, #27, 0xfffff7fb18e0
   0x0000fffff7fb18d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb18d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb18dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb18e0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb18e4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb18e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb18ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb18f0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb18f4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb18f8:	1400000e	b	0xfffff7fb1930
   0x0000fffff7fb18fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1900:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1904:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1908:	aa1503e2	mov	x2, x21
   0x0000fffff7fb190c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb1910:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1914:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1918:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb191c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1920:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1924:	d63f0200	blr	x16
   0x0000fffff7fb1928:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb192c:	54001ec0	b.eq	0xfffff7fb1d04  // b.none
   0x0000fffff7fb1930:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1934:	37d806a9	tbnz	w9, #27, 0xfffff7fb1a08
   0x0000fffff7fb1938:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb193c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1944:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1948:	540001c1	b.ne	0xfffff7fb1980  // b.any
   0x0000fffff7fb194c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb195c:	54000121	b.ne	0xfffff7fb1980  // b.any
   0x0000fffff7fb1960:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb1964:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb1968:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb196c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1974:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb1978:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb197c:	14000030	b	0xfffff7fb1a3c
   0x0000fffff7fb1980:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1984:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb198c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1990:	54000120	b.eq	0xfffff7fb19b4  // b.none
   0x0000fffff7fb1994:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb1998:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb199c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb19a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb19a4:	54000321	b.ne	0xfffff7fb1a08  // b.any
   0x0000fffff7fb19a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb19ac:	9e620120	scvtf	d0, x9
   0x0000fffff7fb19b0:	14000002	b	0xfffff7fb19b8
   0x0000fffff7fb19b4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb19b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb19bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb19c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb19c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb19c8:	54000120	b.eq	0xfffff7fb19ec  // b.none
   0x0000fffff7fb19cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb19d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb19d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb19d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb19dc:	54000161	b.ne	0xfffff7fb1a08  // b.any
   0x0000fffff7fb19e0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb19e4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb19e8:	14000002	b	0xfffff7fb19f0
   0x0000fffff7fb19ec:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb19f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb19f4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb19f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb19fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1a00:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb1a04:	17ffffde	b	0xfffff7fb197c
   0x0000fffff7fb1a08:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1a0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1a10:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1a14:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1a18:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fb1a1c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1a20:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1a24:	d294c490	mov	x16, #0xa624                	// #42532
   0x0000fffff7fb1a28:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1a2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1a30:	d63f0200	blr	x16
   0x0000fffff7fb1a34:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1a38:	540016a0	b.eq	0xfffff7fb1d0c  // b.none
   0x0000fffff7fb1a3c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb1a40:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb1a44:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb1a48:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb1a4c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb1a50:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb1a54:	36d801d1	tbz	w17, #27, 0xfffff7fb1a8c
   0x0000fffff7fb1a58:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1a5c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1a60:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1a64:	54000281	b.ne	0xfffff7fb1ab4  // b.any
   0x0000fffff7fb1a68:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb1a6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1a70:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1a74:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1a78:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1a7c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1a80:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1a84:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1a88:	54000169	b.ls	0xfffff7fb1ab4  // b.plast
   0x0000fffff7fb1a8c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1a90:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1a94:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1a98:	36d80091	tbz	w17, #27, 0xfffff7fb1aa8
   0x0000fffff7fb1a9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1aa0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1aa4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1aa8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb1aac:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb1ab0:	1400000e	b	0xfffff7fb1ae8
   0x0000fffff7fb1ab4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1ab8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1abc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1ac0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1ac4:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fb1ac8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1acc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1ad0:	d2956a10	mov	x16, #0xab50                	// #43856
   0x0000fffff7fb1ad4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1ad8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1adc:	d63f0200	blr	x16
   0x0000fffff7fb1ae0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1ae4:	54001180	b.eq	0xfffff7fb1d14  // b.none
   0x0000fffff7fb1ae8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb1aec:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1af0:	540003a0	b.eq	0xfffff7fb1b64  // b.none
   0x0000fffff7fb1af4:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb1af8:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb1afc:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb1b00:	36d801d1	tbz	w17, #27, 0xfffff7fb1b38
   0x0000fffff7fb1b04:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1b08:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1b0c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1b10:	540002a1	b.ne	0xfffff7fb1b64  // b.any
   0x0000fffff7fb1b14:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb1b18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1b1c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1b20:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1b24:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1b28:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1b2c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1b30:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1b34:	54000189	b.ls	0xfffff7fb1b64  // b.plast
   0x0000fffff7fb1b38:	36d8008d	tbz	w13, #27, 0xfffff7fb1b48
   0x0000fffff7fb1b3c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1b40:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1b44:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1b48:	36d80091	tbz	w17, #27, 0xfffff7fb1b58
   0x0000fffff7fb1b4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1b50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1b54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1b58:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb1b5c:	b900016d	str	w13, [x11]
   0x0000fffff7fb1b60:	1400000e	b	0xfffff7fb1b98
   0x0000fffff7fb1b64:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb1b68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1b6c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1b70:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1b74:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fb1b78:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1b7c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1b80:	d282a010	mov	x16, #0x1500                	// #5376
   0x0000fffff7fb1b84:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1b88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1b8c:	d63f0200	blr	x16
   0x0000fffff7fb1b90:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1b94:	54000c40	b.eq	0xfffff7fb1d1c  // b.none
   0x0000fffff7fb1b98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1b9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1ba0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1ba4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1ba8:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fb1bac:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1bb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1bb4:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fb1bb8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1bbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1bc0:	d63f0200	blr	x16
   0x0000fffff7fb1bc4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb1bc8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb1bcc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb1bd0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb1bd4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb1bd8:	d65f03c0	ret
   0x0000fffff7fb1bdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1be0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1be4:	b900028a	str	w10, [x20]
   0x0000fffff7fb1be8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb1bec:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb1bf0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb1bf4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb1bf8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb1bfc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb1c00:	d65f03c0	ret
   0x0000fffff7fb1c04:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb1c08:	17fffff5	b	0xfffff7fb1bdc
   0x0000fffff7fb1c0c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb1c10:	17fffff3	b	0xfffff7fb1bdc
   0x0000fffff7fb1c14:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb1c18:	17fffff1	b	0xfffff7fb1bdc
   0x0000fffff7fb1c1c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb1c20:	17ffffef	b	0xfffff7fb1bdc
   0x0000fffff7fb1c24:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb1c28:	17ffffed	b	0xfffff7fb1bdc
   0x0000fffff7fb1c2c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb1c30:	17ffffeb	b	0xfffff7fb1bdc
   0x0000fffff7fb1c34:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb1c38:	17ffffe9	b	0xfffff7fb1bdc
   0x0000fffff7fb1c3c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb1c40:	17ffffe7	b	0xfffff7fb1bdc
   0x0000fffff7fb1c44:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb1c48:	17ffffe5	b	0xfffff7fb1bdc
   0x0000fffff7fb1c4c:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb1c50:	17ffffe3	b	0xfffff7fb1bdc
   0x0000fffff7fb1c54:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb1c58:	17ffffe1	b	0xfffff7fb1bdc
   0x0000fffff7fb1c5c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb1c60:	17ffffdf	b	0xfffff7fb1bdc
   0x0000fffff7fb1c64:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb1c68:	17ffffdd	b	0xfffff7fb1bdc
   0x0000fffff7fb1c6c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb1c70:	17ffffdb	b	0xfffff7fb1bdc
   0x0000fffff7fb1c74:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb1c78:	17ffffd9	b	0xfffff7fb1bdc
   0x0000fffff7fb1c7c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb1c80:	17ffffd7	b	0xfffff7fb1bdc
   0x0000fffff7fb1c84:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb1c88:	17ffffd5	b	0xfffff7fb1bdc
   0x0000fffff7fb1c8c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb1c90:	17ffffd3	b	0xfffff7fb1bdc
   0x0000fffff7fb1c94:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb1c98:	17ffffd1	b	0xfffff7fb1bdc
   0x0000fffff7fb1c9c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb1ca0:	17ffffcf	b	0xfffff7fb1bdc
   0x0000fffff7fb1ca4:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb1ca8:	17ffffcd	b	0xfffff7fb1bdc
   0x0000fffff7fb1cac:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb1cb0:	17ffffcb	b	0xfffff7fb1bdc
   0x0000fffff7fb1cb4:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb1cb8:	17ffffc9	b	0xfffff7fb1bdc
   0x0000fffff7fb1cbc:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb1cc0:	17ffffc7	b	0xfffff7fb1bdc
   0x0000fffff7fb1cc4:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb1cc8:	17ffffc5	b	0xfffff7fb1bdc
   0x0000fffff7fb1ccc:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb1cd0:	17ffffc3	b	0xfffff7fb1bdc
   0x0000fffff7fb1cd4:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb1cd8:	17ffffc1	b	0xfffff7fb1bdc
   0x0000fffff7fb1cdc:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb1ce0:	17ffffbf	b	0xfffff7fb1bdc
   0x0000fffff7fb1ce4:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb1ce8:	17ffffbd	b	0xfffff7fb1bdc
   0x0000fffff7fb1cec:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb1cf0:	17ffffbb	b	0xfffff7fb1bdc
   0x0000fffff7fb1cf4:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb1cf8:	17ffffb9	b	0xfffff7fb1bdc
   0x0000fffff7fb1cfc:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb1d00:	17ffffb7	b	0xfffff7fb1bdc
   0x0000fffff7fb1d04:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fb1d08:	17ffffb5	b	0xfffff7fb1bdc
   0x0000fffff7fb1d0c:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fb1d10:	17ffffb3	b	0xfffff7fb1bdc
   0x0000fffff7fb1d14:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fb1d18:	17ffffb1	b	0xfffff7fb1bdc
   0x0000fffff7fb1d1c:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fb1d20:	17ffffaf	b	0xfffff7fb1bdc
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
