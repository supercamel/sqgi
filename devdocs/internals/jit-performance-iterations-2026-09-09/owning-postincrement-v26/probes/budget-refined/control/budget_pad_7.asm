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
   0x0000fffff7fb0058:	14000001	b	0xfffff7fb005c
   0x0000fffff7fb005c:	14000001	b	0xfffff7fb0060
   0x0000fffff7fb0060:	14000001	b	0xfffff7fb0064
   0x0000fffff7fb0064:	14000001	b	0xfffff7fb0068
   0x0000fffff7fb0068:	14000001	b	0xfffff7fb006c
   0x0000fffff7fb006c:	14000001	b	0xfffff7fb0070
   0x0000fffff7fb0070:	14000001	b	0xfffff7fb0074
   0x0000fffff7fb0074:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb0078:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb007c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb0080:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb0084:	36d80211	tbz	w17, #27, 0xfffff7fb00c4
   0x0000fffff7fb0088:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb008c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0090:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0094:	540001e1	b.ne	0xfffff7fb00d0  // b.any
   0x0000fffff7fb0098:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb009c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb00a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb00a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb00a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb00ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb00b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb00b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb00b8:	540000c9	b.ls	0xfffff7fb00d0  // b.plast
   0x0000fffff7fb00bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb00c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb00c4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb00c8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb00cc:	1400000e	b	0xfffff7fb0104
   0x0000fffff7fb00d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb00d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb00d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb00dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb00e0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb00e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb00e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb00ec:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fb00f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb00f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb00f8:	d63f0200	blr	x16
   0x0000fffff7fb00fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0100:	5400ede0	b.eq	0xfffff7fb1ebc  // b.none
   0x0000fffff7fb0104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb0108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb010c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb0110:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fb0114:	36d80211	tbz	w17, #27, 0xfffff7fb0154
   0x0000fffff7fb0118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb011c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0124:	540001e1	b.ne	0xfffff7fb0160  // b.any
   0x0000fffff7fb0128:	f9402e6f	ldr	x15, [x19, #88]
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
   0x0000fffff7fb0154:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb0158:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb015c:	1400000e	b	0xfffff7fb0194
   0x0000fffff7fb0160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0168:	aa1303e1	mov	x1, x19
   0x0000fffff7fb016c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0170:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb0174:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0178:	aa1603e5	mov	x5, x22
   0x0000fffff7fb017c:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fb0180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0188:	d63f0200	blr	x16
   0x0000fffff7fb018c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0190:	5400e9a0	b.eq	0xfffff7fb1ec4  // b.none
   0x0000fffff7fb0194:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb0198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb019c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb01a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb01a4:	54000421	b.ne	0xfffff7fb0228  // b.any
   0x0000fffff7fb01a8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb01ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb01b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb01b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb01b8:	54000381	b.ne	0xfffff7fb0228  // b.any
   0x0000fffff7fb01bc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb01c0:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fb01c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb01c8:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fb01cc:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fb01d0:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fb01d4:	91000580	add	x0, x12, #0x1
   0x0000fffff7fb01d8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb01dc:	36d80211	tbz	w17, #27, 0xfffff7fb021c
   0x0000fffff7fb01e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb01e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb01e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb01ec:	540001e1	b.ne	0xfffff7fb0228  // b.any
   0x0000fffff7fb01f0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb01f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb01f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb01fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0200:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0204:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0208:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb020c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0210:	540000c9	b.ls	0xfffff7fb0228  // b.plast
   0x0000fffff7fb0214:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0218:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb021c:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fb0220:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fb0224:	1400000e	b	0xfffff7fb025c
   0x0000fffff7fb0228:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb022c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0230:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0234:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0238:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb023c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0240:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0244:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fb0248:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb024c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0250:	d63f0200	blr	x16
   0x0000fffff7fb0254:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0258:	5400e3a0	b.eq	0xfffff7fb1ecc  // b.none
   0x0000fffff7fb025c:	f100041f	cmp	x0, #0x1
   0x0000fffff7fb0260:	5400df80	b.eq	0xfffff7fb1e50  // b.none
   0x0000fffff7fb0264:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb0268:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb026c:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fb0270:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0274:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0278:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fb027c:	36d801d1	tbz	w17, #27, 0xfffff7fb02b4
   0x0000fffff7fb0280:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0284:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0288:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb028c:	54000281	b.ne	0xfffff7fb02dc  // b.any
   0x0000fffff7fb0290:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb0294:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0298:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb029c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb02a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb02a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb02a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb02ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb02b0:	54000169	b.ls	0xfffff7fb02dc  // b.plast
   0x0000fffff7fb02b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb02b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb02bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb02c0:	36d80091	tbz	w17, #27, 0xfffff7fb02d0
   0x0000fffff7fb02c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb02c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb02cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb02d0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb02d4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb02d8:	1400000e	b	0xfffff7fb0310
   0x0000fffff7fb02dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb02e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb02e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb02e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb02ec:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb02f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb02f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb02f8:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fb02fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0304:	d63f0200	blr	x16
   0x0000fffff7fb0308:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb030c:	5400de40	b.eq	0xfffff7fb1ed4  // b.none
   0x0000fffff7fb0310:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb0314:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0318:	540003a0	b.eq	0xfffff7fb038c  // b.none
   0x0000fffff7fb031c:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fb0320:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fb0324:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb0328:	36d801d1	tbz	w17, #27, 0xfffff7fb0360
   0x0000fffff7fb032c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0330:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0334:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0338:	540002a1	b.ne	0xfffff7fb038c  // b.any
   0x0000fffff7fb033c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb0340:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0344:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0348:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb034c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0350:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0354:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0358:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb035c:	54000189	b.ls	0xfffff7fb038c  // b.plast
   0x0000fffff7fb0360:	36d8008d	tbz	w13, #27, 0xfffff7fb0370
   0x0000fffff7fb0364:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0368:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb036c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0370:	36d80091	tbz	w17, #27, 0xfffff7fb0380
   0x0000fffff7fb0374:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0378:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb037c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0380:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb0384:	b900016d	str	w13, [x11]
   0x0000fffff7fb0388:	1400000e	b	0xfffff7fb03c0
   0x0000fffff7fb038c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0390:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0394:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0398:	aa1503e2	mov	x2, x21
   0x0000fffff7fb039c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb03a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb03a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb03a8:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fb03ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb03b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb03b4:	d63f0200	blr	x16
   0x0000fffff7fb03b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb03bc:	5400d900	b.eq	0xfffff7fb1edc  // b.none
   0x0000fffff7fb03c0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb03c4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb03c8:	540004a0	b.eq	0xfffff7fb045c  // b.none
   0x0000fffff7fb03cc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb03d0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb03d4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb03d8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb03dc:	54000400	b.eq	0xfffff7fb045c  // b.none
   0x0000fffff7fb03e0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb03e4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb03e8:	36d801d1	tbz	w17, #27, 0xfffff7fb0420
   0x0000fffff7fb03ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb03f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb03f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb03f8:	54000321	b.ne	0xfffff7fb045c  // b.any
   0x0000fffff7fb03fc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0400:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0404:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0408:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb040c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0410:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0414:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0418:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb041c:	54000209	b.ls	0xfffff7fb045c  // b.plast
   0x0000fffff7fb0420:	36d8008d	tbz	w13, #27, 0xfffff7fb0430
   0x0000fffff7fb0424:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0428:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb042c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0430:	36d80091	tbz	w17, #27, 0xfffff7fb0440
   0x0000fffff7fb0434:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0438:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb043c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0440:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb0444:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb0448:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb044c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0450:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb0454:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb0458:	1400000e	b	0xfffff7fb0490
   0x0000fffff7fb045c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0460:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0464:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0468:	aa1503e2	mov	x2, x21
   0x0000fffff7fb046c:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb0470:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0474:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0478:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb047c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0480:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0484:	d63f0200	blr	x16
   0x0000fffff7fb0488:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb048c:	5400d2c0	b.eq	0xfffff7fb1ee4  // b.none
   0x0000fffff7fb0490:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0494:	37d806a9	tbnz	w9, #27, 0xfffff7fb0568
   0x0000fffff7fb0498:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb049c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb04a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb04a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb04a8:	540001c1	b.ne	0xfffff7fb04e0  // b.any
   0x0000fffff7fb04ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb04b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb04b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb04b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb04bc:	54000121	b.ne	0xfffff7fb04e0  // b.any
   0x0000fffff7fb04c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb04c4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb04c8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb04cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb04d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb04d4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb04d8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb04dc:	14000030	b	0xfffff7fb059c
   0x0000fffff7fb04e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb04e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb04e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb04ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb04f0:	54000120	b.eq	0xfffff7fb0514  // b.none
   0x0000fffff7fb04f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb04f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb04fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0500:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0504:	54000321	b.ne	0xfffff7fb0568  // b.any
   0x0000fffff7fb0508:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb050c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0510:	14000002	b	0xfffff7fb0518
   0x0000fffff7fb0514:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb0518:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb051c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0524:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0528:	54000120	b.eq	0xfffff7fb054c  // b.none
   0x0000fffff7fb052c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0530:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0534:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0538:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb053c:	54000161	b.ne	0xfffff7fb0568  // b.any
   0x0000fffff7fb0540:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb0544:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0548:	14000002	b	0xfffff7fb0550
   0x0000fffff7fb054c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb0550:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0554:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb0558:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb055c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0560:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0564:	17ffffde	b	0xfffff7fb04dc
   0x0000fffff7fb0568:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb056c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0570:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0574:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0578:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb057c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0580:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0584:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb0588:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb058c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0590:	d63f0200	blr	x16
   0x0000fffff7fb0594:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0598:	5400caa0	b.eq	0xfffff7fb1eec  // b.none
   0x0000fffff7fb059c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb05a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb05a4:	540004a0	b.eq	0xfffff7fb0638  // b.none
   0x0000fffff7fb05a8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb05ac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb05b0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb05b4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb05b8:	54000400	b.eq	0xfffff7fb0638  // b.none
   0x0000fffff7fb05bc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb05c0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb05c4:	36d801d1	tbz	w17, #27, 0xfffff7fb05fc
   0x0000fffff7fb05c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb05cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb05d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb05d4:	54000321	b.ne	0xfffff7fb0638  // b.any
   0x0000fffff7fb05d8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb05dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb05e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb05e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb05e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb05ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb05f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb05f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb05f8:	54000209	b.ls	0xfffff7fb0638  // b.plast
   0x0000fffff7fb05fc:	36d8008d	tbz	w13, #27, 0xfffff7fb060c
   0x0000fffff7fb0600:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0604:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0608:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb060c:	36d80091	tbz	w17, #27, 0xfffff7fb061c
   0x0000fffff7fb0610:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0614:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0618:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb061c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb0620:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb0624:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0628:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb062c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb0630:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb0634:	1400000e	b	0xfffff7fb066c
   0x0000fffff7fb0638:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb063c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0640:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0644:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0648:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb064c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0650:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0654:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb0658:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb065c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0660:	d63f0200	blr	x16
   0x0000fffff7fb0664:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0668:	5400c460	b.eq	0xfffff7fb1ef4  // b.none
   0x0000fffff7fb066c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0670:	37d806a9	tbnz	w9, #27, 0xfffff7fb0744
   0x0000fffff7fb0674:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb067c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0680:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0684:	540001c1	b.ne	0xfffff7fb06bc  // b.any
   0x0000fffff7fb0688:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb068c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0698:	54000121	b.ne	0xfffff7fb06bc  // b.any
   0x0000fffff7fb069c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb06a0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb06a4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb06a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb06ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb06b0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb06b4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb06b8:	14000030	b	0xfffff7fb0778
   0x0000fffff7fb06bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb06c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb06c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb06c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb06cc:	54000120	b.eq	0xfffff7fb06f0  // b.none
   0x0000fffff7fb06d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb06d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb06d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb06dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb06e0:	54000321	b.ne	0xfffff7fb0744  // b.any
   0x0000fffff7fb06e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb06e8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb06ec:	14000002	b	0xfffff7fb06f4
   0x0000fffff7fb06f0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb06f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb06f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb06fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0700:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0704:	54000120	b.eq	0xfffff7fb0728  // b.none
   0x0000fffff7fb0708:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb070c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0710:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0714:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0718:	54000161	b.ne	0xfffff7fb0744  // b.any
   0x0000fffff7fb071c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb0720:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0724:	14000002	b	0xfffff7fb072c
   0x0000fffff7fb0728:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb072c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0730:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb0734:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0738:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb073c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0740:	17ffffde	b	0xfffff7fb06b8
   0x0000fffff7fb0744:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0748:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb074c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0750:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0754:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb0758:	aa1403e4	mov	x4, x20
   0x0000fffff7fb075c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0760:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb0764:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0768:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb076c:	d63f0200	blr	x16
   0x0000fffff7fb0770:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0774:	5400bc40	b.eq	0xfffff7fb1efc  // b.none
   0x0000fffff7fb0778:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb077c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0780:	540004a0	b.eq	0xfffff7fb0814  // b.none
   0x0000fffff7fb0784:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0788:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb078c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0790:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0794:	54000400	b.eq	0xfffff7fb0814  // b.none
   0x0000fffff7fb0798:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb079c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb07a0:	36d801d1	tbz	w17, #27, 0xfffff7fb07d8
   0x0000fffff7fb07a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb07a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb07ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb07b0:	54000321	b.ne	0xfffff7fb0814  // b.any
   0x0000fffff7fb07b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb07b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb07bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb07c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb07c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb07c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb07cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb07d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb07d4:	54000209	b.ls	0xfffff7fb0814  // b.plast
   0x0000fffff7fb07d8:	36d8008d	tbz	w13, #27, 0xfffff7fb07e8
   0x0000fffff7fb07dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb07e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb07e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb07e8:	36d80091	tbz	w17, #27, 0xfffff7fb07f8
   0x0000fffff7fb07ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb07f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb07f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb07f8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb07fc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb0800:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0804:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0808:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb080c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb0810:	1400000e	b	0xfffff7fb0848
   0x0000fffff7fb0814:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0818:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb081c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0820:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0824:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb0828:	aa1403e4	mov	x4, x20
   0x0000fffff7fb082c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0830:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb0834:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0838:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb083c:	d63f0200	blr	x16
   0x0000fffff7fb0840:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0844:	5400b600	b.eq	0xfffff7fb1f04  // b.none
   0x0000fffff7fb0848:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb084c:	37d806a9	tbnz	w9, #27, 0xfffff7fb0920
   0x0000fffff7fb0850:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0854:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0858:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb085c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0860:	540001c1	b.ne	0xfffff7fb0898  // b.any
   0x0000fffff7fb0864:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb086c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0870:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0874:	54000121	b.ne	0xfffff7fb0898  // b.any
   0x0000fffff7fb0878:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb087c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb0880:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0884:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0888:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb088c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb0890:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0894:	14000030	b	0xfffff7fb0954
   0x0000fffff7fb0898:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb089c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb08a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb08a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb08a8:	54000120	b.eq	0xfffff7fb08cc  // b.none
   0x0000fffff7fb08ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb08b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb08b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb08b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb08bc:	54000321	b.ne	0xfffff7fb0920  // b.any
   0x0000fffff7fb08c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb08c4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb08c8:	14000002	b	0xfffff7fb08d0
   0x0000fffff7fb08cc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb08d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb08d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb08d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb08dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb08e0:	54000120	b.eq	0xfffff7fb0904  // b.none
   0x0000fffff7fb08e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb08e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb08ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb08f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb08f4:	54000161	b.ne	0xfffff7fb0920  // b.any
   0x0000fffff7fb08f8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb08fc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0900:	14000002	b	0xfffff7fb0908
   0x0000fffff7fb0904:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb0908:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb090c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb0910:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0918:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb091c:	17ffffde	b	0xfffff7fb0894
   0x0000fffff7fb0920:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0924:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0928:	aa1303e1	mov	x1, x19
   0x0000fffff7fb092c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0930:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb0934:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0938:	aa1603e5	mov	x5, x22
   0x0000fffff7fb093c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb0940:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0944:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0948:	d63f0200	blr	x16
   0x0000fffff7fb094c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0950:	5400ade0	b.eq	0xfffff7fb1f0c  // b.none
   0x0000fffff7fb0954:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0958:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb095c:	540004a0	b.eq	0xfffff7fb09f0  // b.none
   0x0000fffff7fb0960:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0964:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0968:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb096c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0970:	54000400	b.eq	0xfffff7fb09f0  // b.none
   0x0000fffff7fb0974:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0978:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb097c:	36d801d1	tbz	w17, #27, 0xfffff7fb09b4
   0x0000fffff7fb0980:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0984:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0988:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb098c:	54000321	b.ne	0xfffff7fb09f0  // b.any
   0x0000fffff7fb0990:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0994:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0998:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb099c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb09a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb09a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb09a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb09ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb09b0:	54000209	b.ls	0xfffff7fb09f0  // b.plast
   0x0000fffff7fb09b4:	36d8008d	tbz	w13, #27, 0xfffff7fb09c4
   0x0000fffff7fb09b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb09bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb09c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb09c4:	36d80091	tbz	w17, #27, 0xfffff7fb09d4
   0x0000fffff7fb09c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb09cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb09d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb09d4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb09d8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb09dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb09e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb09e4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb09e8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb09ec:	1400000e	b	0xfffff7fb0a24
   0x0000fffff7fb09f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb09f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb09f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb09fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0a00:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb0a04:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0a08:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0a0c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb0a10:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0a14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0a18:	d63f0200	blr	x16
   0x0000fffff7fb0a1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0a20:	5400a7a0	b.eq	0xfffff7fb1f14  // b.none
   0x0000fffff7fb0a24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0a28:	37d806a9	tbnz	w9, #27, 0xfffff7fb0afc
   0x0000fffff7fb0a2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0a30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0a34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0a38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0a3c:	540001c1	b.ne	0xfffff7fb0a74  // b.any
   0x0000fffff7fb0a40:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0a44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0a48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0a4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0a50:	54000121	b.ne	0xfffff7fb0a74  // b.any
   0x0000fffff7fb0a54:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb0a58:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb0a5c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0a60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0a64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0a68:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb0a6c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0a70:	14000030	b	0xfffff7fb0b30
   0x0000fffff7fb0a74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0a78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0a7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0a80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0a84:	54000120	b.eq	0xfffff7fb0aa8  // b.none
   0x0000fffff7fb0a88:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0a8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0a90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0a94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0a98:	54000321	b.ne	0xfffff7fb0afc  // b.any
   0x0000fffff7fb0a9c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb0aa0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0aa4:	14000002	b	0xfffff7fb0aac
   0x0000fffff7fb0aa8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb0aac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0ab0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0ab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0ab8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0abc:	54000120	b.eq	0xfffff7fb0ae0  // b.none
   0x0000fffff7fb0ac0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0ac4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0ac8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0acc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0ad0:	54000161	b.ne	0xfffff7fb0afc  // b.any
   0x0000fffff7fb0ad4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb0ad8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0adc:	14000002	b	0xfffff7fb0ae4
   0x0000fffff7fb0ae0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb0ae4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0ae8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb0aec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0af0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0af4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0af8:	17ffffde	b	0xfffff7fb0a70
   0x0000fffff7fb0afc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0b00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0b04:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0b08:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0b0c:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb0b10:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0b14:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0b18:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb0b1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0b20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0b24:	d63f0200	blr	x16
   0x0000fffff7fb0b28:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0b2c:	54009f80	b.eq	0xfffff7fb1f1c  // b.none
   0x0000fffff7fb0b30:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0b34:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0b38:	540004a0	b.eq	0xfffff7fb0bcc  // b.none
   0x0000fffff7fb0b3c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0b40:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0b44:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0b48:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0b4c:	54000400	b.eq	0xfffff7fb0bcc  // b.none
   0x0000fffff7fb0b50:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0b54:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0b58:	36d801d1	tbz	w17, #27, 0xfffff7fb0b90
   0x0000fffff7fb0b5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0b60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0b64:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0b68:	54000321	b.ne	0xfffff7fb0bcc  // b.any
   0x0000fffff7fb0b6c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0b70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0b74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0b78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0b7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0b80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0b84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0b88:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0b8c:	54000209	b.ls	0xfffff7fb0bcc  // b.plast
   0x0000fffff7fb0b90:	36d8008d	tbz	w13, #27, 0xfffff7fb0ba0
   0x0000fffff7fb0b94:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0b98:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0b9c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0ba0:	36d80091	tbz	w17, #27, 0xfffff7fb0bb0
   0x0000fffff7fb0ba4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0ba8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0bac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0bb0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb0bb4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb0bb8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0bbc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0bc0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb0bc4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb0bc8:	1400000e	b	0xfffff7fb0c00
   0x0000fffff7fb0bcc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0bd0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0bd4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0bd8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0bdc:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb0be0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0be4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0be8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb0bec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0bf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0bf4:	d63f0200	blr	x16
   0x0000fffff7fb0bf8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0bfc:	54009940	b.eq	0xfffff7fb1f24  // b.none
   0x0000fffff7fb0c00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0c04:	37d806a9	tbnz	w9, #27, 0xfffff7fb0cd8
   0x0000fffff7fb0c08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0c0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0c10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0c14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0c18:	540001c1	b.ne	0xfffff7fb0c50  // b.any
   0x0000fffff7fb0c1c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0c20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0c24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0c28:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0c2c:	54000121	b.ne	0xfffff7fb0c50  // b.any
   0x0000fffff7fb0c30:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb0c34:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb0c38:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0c3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0c40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0c44:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb0c48:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0c4c:	14000030	b	0xfffff7fb0d0c
   0x0000fffff7fb0c50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0c54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0c5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0c60:	54000120	b.eq	0xfffff7fb0c84  // b.none
   0x0000fffff7fb0c64:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0c68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0c6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0c70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0c74:	54000321	b.ne	0xfffff7fb0cd8  // b.any
   0x0000fffff7fb0c78:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb0c7c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0c80:	14000002	b	0xfffff7fb0c88
   0x0000fffff7fb0c84:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb0c88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0c8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0c90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0c94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0c98:	54000120	b.eq	0xfffff7fb0cbc  // b.none
   0x0000fffff7fb0c9c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0ca0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0ca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0ca8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0cac:	54000161	b.ne	0xfffff7fb0cd8  // b.any
   0x0000fffff7fb0cb0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb0cb4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0cb8:	14000002	b	0xfffff7fb0cc0
   0x0000fffff7fb0cbc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb0cc0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0cc4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb0cc8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0ccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0cd0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0cd4:	17ffffde	b	0xfffff7fb0c4c
   0x0000fffff7fb0cd8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0cdc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0ce0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0ce4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0ce8:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb0cec:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0cf0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0cf4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb0cf8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0cfc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0d00:	d63f0200	blr	x16
   0x0000fffff7fb0d04:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0d08:	54009120	b.eq	0xfffff7fb1f2c  // b.none
   0x0000fffff7fb0d0c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0d10:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0d14:	540004a0	b.eq	0xfffff7fb0da8  // b.none
   0x0000fffff7fb0d18:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0d1c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0d20:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0d24:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0d28:	54000400	b.eq	0xfffff7fb0da8  // b.none
   0x0000fffff7fb0d2c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0d30:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0d34:	36d801d1	tbz	w17, #27, 0xfffff7fb0d6c
   0x0000fffff7fb0d38:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0d3c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0d40:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0d44:	54000321	b.ne	0xfffff7fb0da8  // b.any
   0x0000fffff7fb0d48:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0d4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0d50:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0d54:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0d58:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0d5c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0d60:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0d64:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0d68:	54000209	b.ls	0xfffff7fb0da8  // b.plast
   0x0000fffff7fb0d6c:	36d8008d	tbz	w13, #27, 0xfffff7fb0d7c
   0x0000fffff7fb0d70:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0d74:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0d78:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0d7c:	36d80091	tbz	w17, #27, 0xfffff7fb0d8c
   0x0000fffff7fb0d80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0d84:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0d88:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0d8c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb0d90:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb0d94:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0d98:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0d9c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb0da0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb0da4:	1400000e	b	0xfffff7fb0ddc
   0x0000fffff7fb0da8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0dac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0db0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0db4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0db8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb0dbc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0dc0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0dc4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb0dc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0dcc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0dd0:	d63f0200	blr	x16
   0x0000fffff7fb0dd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0dd8:	54008ae0	b.eq	0xfffff7fb1f34  // b.none
   0x0000fffff7fb0ddc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0de0:	37d806a9	tbnz	w9, #27, 0xfffff7fb0eb4
   0x0000fffff7fb0de4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0de8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0dec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0df0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0df4:	540001c1	b.ne	0xfffff7fb0e2c  // b.any
   0x0000fffff7fb0df8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0dfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0e00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0e04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0e08:	54000121	b.ne	0xfffff7fb0e2c  // b.any
   0x0000fffff7fb0e0c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb0e10:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb0e14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0e18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0e1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0e20:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb0e24:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0e28:	14000030	b	0xfffff7fb0ee8
   0x0000fffff7fb0e2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0e30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0e34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0e38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0e3c:	54000120	b.eq	0xfffff7fb0e60  // b.none
   0x0000fffff7fb0e40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0e44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0e48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0e4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0e50:	54000321	b.ne	0xfffff7fb0eb4  // b.any
   0x0000fffff7fb0e54:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb0e58:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0e5c:	14000002	b	0xfffff7fb0e64
   0x0000fffff7fb0e60:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb0e64:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0e68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0e6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0e70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0e74:	54000120	b.eq	0xfffff7fb0e98  // b.none
   0x0000fffff7fb0e78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0e7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0e80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0e84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0e88:	54000161	b.ne	0xfffff7fb0eb4  // b.any
   0x0000fffff7fb0e8c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb0e90:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0e94:	14000002	b	0xfffff7fb0e9c
   0x0000fffff7fb0e98:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb0e9c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0ea0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb0ea4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0ea8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0eac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0eb0:	17ffffde	b	0xfffff7fb0e28
   0x0000fffff7fb0eb4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0eb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0ebc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0ec0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0ec4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb0ec8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0ecc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0ed0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb0ed4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0ed8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0edc:	d63f0200	blr	x16
   0x0000fffff7fb0ee0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0ee4:	540082c0	b.eq	0xfffff7fb1f3c  // b.none
   0x0000fffff7fb0ee8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0eec:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0ef0:	540004a0	b.eq	0xfffff7fb0f84  // b.none
   0x0000fffff7fb0ef4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0ef8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0efc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0f00:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0f04:	54000400	b.eq	0xfffff7fb0f84  // b.none
   0x0000fffff7fb0f08:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0f0c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0f10:	36d801d1	tbz	w17, #27, 0xfffff7fb0f48
   0x0000fffff7fb0f14:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0f18:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0f1c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0f20:	54000321	b.ne	0xfffff7fb0f84  // b.any
   0x0000fffff7fb0f24:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0f28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0f2c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0f30:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0f34:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0f38:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0f3c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0f40:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0f44:	54000209	b.ls	0xfffff7fb0f84  // b.plast
   0x0000fffff7fb0f48:	36d8008d	tbz	w13, #27, 0xfffff7fb0f58
   0x0000fffff7fb0f4c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0f50:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0f54:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0f58:	36d80091	tbz	w17, #27, 0xfffff7fb0f68
   0x0000fffff7fb0f5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0f60:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0f64:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0f68:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb0f6c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb0f70:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0f74:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0f78:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb0f7c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb0f80:	1400000e	b	0xfffff7fb0fb8
   0x0000fffff7fb0f84:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0f88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0f8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0f90:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0f94:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb0f98:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0f9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0fa0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb0fa4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0fa8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0fac:	d63f0200	blr	x16
   0x0000fffff7fb0fb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0fb4:	54007c80	b.eq	0xfffff7fb1f44  // b.none
   0x0000fffff7fb0fb8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0fbc:	37d806a9	tbnz	w9, #27, 0xfffff7fb1090
   0x0000fffff7fb0fc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0fc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0fc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0fcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0fd0:	540001c1	b.ne	0xfffff7fb1008  // b.any
   0x0000fffff7fb0fd4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb0fd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0fdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0fe0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0fe4:	54000121	b.ne	0xfffff7fb1008  // b.any
   0x0000fffff7fb0fe8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb0fec:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb0ff0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0ff4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0ff8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0ffc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb1000:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1004:	14000030	b	0xfffff7fb10c4
   0x0000fffff7fb1008:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb100c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1014:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1018:	54000120	b.eq	0xfffff7fb103c  // b.none
   0x0000fffff7fb101c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1020:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1024:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1028:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb102c:	54000321	b.ne	0xfffff7fb1090  // b.any
   0x0000fffff7fb1030:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1034:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1038:	14000002	b	0xfffff7fb1040
   0x0000fffff7fb103c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb1040:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1044:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb104c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1050:	54000120	b.eq	0xfffff7fb1074  // b.none
   0x0000fffff7fb1054:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1058:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb105c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1060:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1064:	54000161	b.ne	0xfffff7fb1090  // b.any
   0x0000fffff7fb1068:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb106c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1070:	14000002	b	0xfffff7fb1078
   0x0000fffff7fb1074:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb1078:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb107c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb1080:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1084:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1088:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb108c:	17ffffde	b	0xfffff7fb1004
   0x0000fffff7fb1090:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1094:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1098:	aa1303e1	mov	x1, x19
   0x0000fffff7fb109c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb10a0:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb10a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb10a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb10ac:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb10b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb10b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb10b8:	d63f0200	blr	x16
   0x0000fffff7fb10bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb10c0:	54007460	b.eq	0xfffff7fb1f4c  // b.none
   0x0000fffff7fb10c4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb10c8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb10cc:	540004a0	b.eq	0xfffff7fb1160  // b.none
   0x0000fffff7fb10d0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb10d4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb10d8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb10dc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb10e0:	54000400	b.eq	0xfffff7fb1160  // b.none
   0x0000fffff7fb10e4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb10e8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb10ec:	36d801d1	tbz	w17, #27, 0xfffff7fb1124
   0x0000fffff7fb10f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb10f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb10f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb10fc:	54000321	b.ne	0xfffff7fb1160  // b.any
   0x0000fffff7fb1100:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1104:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1108:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb110c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1110:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1114:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1118:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb111c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1120:	54000209	b.ls	0xfffff7fb1160  // b.plast
   0x0000fffff7fb1124:	36d8008d	tbz	w13, #27, 0xfffff7fb1134
   0x0000fffff7fb1128:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb112c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1130:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1134:	36d80091	tbz	w17, #27, 0xfffff7fb1144
   0x0000fffff7fb1138:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb113c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1140:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1144:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb1148:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb114c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb1150:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb1154:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb1158:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb115c:	1400000e	b	0xfffff7fb1194
   0x0000fffff7fb1160:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1168:	aa1303e1	mov	x1, x19
   0x0000fffff7fb116c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1170:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb1174:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1178:	aa1603e5	mov	x5, x22
   0x0000fffff7fb117c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb1180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1188:	d63f0200	blr	x16
   0x0000fffff7fb118c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1190:	54006e20	b.eq	0xfffff7fb1f54  // b.none
   0x0000fffff7fb1194:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1198:	37d806a9	tbnz	w9, #27, 0xfffff7fb126c
   0x0000fffff7fb119c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb11a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb11a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb11a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb11ac:	540001c1	b.ne	0xfffff7fb11e4  // b.any
   0x0000fffff7fb11b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb11b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb11b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb11bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb11c0:	54000121	b.ne	0xfffff7fb11e4  // b.any
   0x0000fffff7fb11c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb11c8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb11cc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb11d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb11d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb11d8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb11dc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb11e0:	14000030	b	0xfffff7fb12a0
   0x0000fffff7fb11e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb11e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb11ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb11f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb11f4:	54000120	b.eq	0xfffff7fb1218  // b.none
   0x0000fffff7fb11f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb11fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1200:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1204:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1208:	54000321	b.ne	0xfffff7fb126c  // b.any
   0x0000fffff7fb120c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1210:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1214:	14000002	b	0xfffff7fb121c
   0x0000fffff7fb1218:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb121c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1220:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1224:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1228:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb122c:	54000120	b.eq	0xfffff7fb1250  // b.none
   0x0000fffff7fb1230:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1234:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1238:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb123c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1240:	54000161	b.ne	0xfffff7fb126c  // b.any
   0x0000fffff7fb1244:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb1248:	9e620121	scvtf	d1, x9
   0x0000fffff7fb124c:	14000002	b	0xfffff7fb1254
   0x0000fffff7fb1250:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb1254:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1258:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb125c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1260:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1264:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1268:	17ffffde	b	0xfffff7fb11e0
   0x0000fffff7fb126c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1270:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1274:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1278:	aa1503e2	mov	x2, x21
   0x0000fffff7fb127c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb1280:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1284:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1288:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb128c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1290:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1294:	d63f0200	blr	x16
   0x0000fffff7fb1298:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb129c:	54006600	b.eq	0xfffff7fb1f5c  // b.none
   0x0000fffff7fb12a0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb12a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb12a8:	540004a0	b.eq	0xfffff7fb133c  // b.none
   0x0000fffff7fb12ac:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb12b0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb12b4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb12b8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb12bc:	54000400	b.eq	0xfffff7fb133c  // b.none
   0x0000fffff7fb12c0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb12c4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb12c8:	36d801d1	tbz	w17, #27, 0xfffff7fb1300
   0x0000fffff7fb12cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb12d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb12d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb12d8:	54000321	b.ne	0xfffff7fb133c  // b.any
   0x0000fffff7fb12dc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb12e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb12e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb12e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb12ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb12f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb12f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb12f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb12fc:	54000209	b.ls	0xfffff7fb133c  // b.plast
   0x0000fffff7fb1300:	36d8008d	tbz	w13, #27, 0xfffff7fb1310
   0x0000fffff7fb1304:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1308:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb130c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1310:	36d80091	tbz	w17, #27, 0xfffff7fb1320
   0x0000fffff7fb1314:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1318:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb131c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1320:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb1324:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb1328:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb132c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb1330:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb1334:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb1338:	1400000e	b	0xfffff7fb1370
   0x0000fffff7fb133c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1340:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1344:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1348:	aa1503e2	mov	x2, x21
   0x0000fffff7fb134c:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb1350:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1354:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1358:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb135c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1360:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1364:	d63f0200	blr	x16
   0x0000fffff7fb1368:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb136c:	54005fc0	b.eq	0xfffff7fb1f64  // b.none
   0x0000fffff7fb1370:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1374:	37d806a9	tbnz	w9, #27, 0xfffff7fb1448
   0x0000fffff7fb1378:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb137c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1380:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1384:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1388:	540001c1	b.ne	0xfffff7fb13c0  // b.any
   0x0000fffff7fb138c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1390:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1398:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb139c:	54000121	b.ne	0xfffff7fb13c0  // b.any
   0x0000fffff7fb13a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb13a4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb13a8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb13ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb13b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb13b4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb13b8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb13bc:	14000030	b	0xfffff7fb147c
   0x0000fffff7fb13c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb13c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb13c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb13cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb13d0:	54000120	b.eq	0xfffff7fb13f4  // b.none
   0x0000fffff7fb13d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb13d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb13dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb13e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb13e4:	54000321	b.ne	0xfffff7fb1448  // b.any
   0x0000fffff7fb13e8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb13ec:	9e620120	scvtf	d0, x9
   0x0000fffff7fb13f0:	14000002	b	0xfffff7fb13f8
   0x0000fffff7fb13f4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb13f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb13fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1404:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1408:	54000120	b.eq	0xfffff7fb142c  // b.none
   0x0000fffff7fb140c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1410:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1418:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb141c:	54000161	b.ne	0xfffff7fb1448  // b.any
   0x0000fffff7fb1420:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb1424:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1428:	14000002	b	0xfffff7fb1430
   0x0000fffff7fb142c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb1430:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1434:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb1438:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb143c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1440:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1444:	17ffffde	b	0xfffff7fb13bc
   0x0000fffff7fb1448:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb144c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1450:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1454:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1458:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb145c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1460:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1464:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb1468:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb146c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1470:	d63f0200	blr	x16
   0x0000fffff7fb1474:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1478:	540057a0	b.eq	0xfffff7fb1f6c  // b.none
   0x0000fffff7fb147c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb1480:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1484:	540004a0	b.eq	0xfffff7fb1518  // b.none
   0x0000fffff7fb1488:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb148c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb1490:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb1494:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1498:	54000400	b.eq	0xfffff7fb1518  // b.none
   0x0000fffff7fb149c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb14a0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb14a4:	36d801d1	tbz	w17, #27, 0xfffff7fb14dc
   0x0000fffff7fb14a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb14ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb14b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb14b4:	54000321	b.ne	0xfffff7fb1518  // b.any
   0x0000fffff7fb14b8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb14bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb14c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb14c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb14c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb14cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb14d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb14d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb14d8:	54000209	b.ls	0xfffff7fb1518  // b.plast
   0x0000fffff7fb14dc:	36d8008d	tbz	w13, #27, 0xfffff7fb14ec
   0x0000fffff7fb14e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb14e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb14e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb14ec:	36d80091	tbz	w17, #27, 0xfffff7fb14fc
   0x0000fffff7fb14f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb14f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb14f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb14fc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb1500:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb1504:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb1508:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb150c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb1510:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb1514:	1400000e	b	0xfffff7fb154c
   0x0000fffff7fb1518:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb151c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1520:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1524:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1528:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb152c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1530:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1534:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb1538:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb153c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1540:	d63f0200	blr	x16
   0x0000fffff7fb1544:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1548:	54005160	b.eq	0xfffff7fb1f74  // b.none
   0x0000fffff7fb154c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1550:	37d806a9	tbnz	w9, #27, 0xfffff7fb1624
   0x0000fffff7fb1554:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1558:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb155c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1560:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1564:	540001c1	b.ne	0xfffff7fb159c  // b.any
   0x0000fffff7fb1568:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb156c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1574:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1578:	54000121	b.ne	0xfffff7fb159c  // b.any
   0x0000fffff7fb157c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1580:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb1584:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1588:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb158c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1590:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb1594:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1598:	14000030	b	0xfffff7fb1658
   0x0000fffff7fb159c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb15a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb15a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb15ac:	54000120	b.eq	0xfffff7fb15d0  // b.none
   0x0000fffff7fb15b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb15b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb15b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb15c0:	54000321	b.ne	0xfffff7fb1624  // b.any
   0x0000fffff7fb15c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb15c8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb15cc:	14000002	b	0xfffff7fb15d4
   0x0000fffff7fb15d0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb15d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb15d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb15dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb15e4:	54000120	b.eq	0xfffff7fb1608  // b.none
   0x0000fffff7fb15e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb15ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb15f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb15f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb15f8:	54000161	b.ne	0xfffff7fb1624  // b.any
   0x0000fffff7fb15fc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb1600:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1604:	14000002	b	0xfffff7fb160c
   0x0000fffff7fb1608:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb160c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1610:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb1614:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb161c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1620:	17ffffde	b	0xfffff7fb1598
   0x0000fffff7fb1624:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1628:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb162c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1630:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1634:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb1638:	aa1403e4	mov	x4, x20
   0x0000fffff7fb163c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1640:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb1644:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1648:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb164c:	d63f0200	blr	x16
   0x0000fffff7fb1650:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1654:	54004940	b.eq	0xfffff7fb1f7c  // b.none
   0x0000fffff7fb1658:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb165c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1660:	540004a0	b.eq	0xfffff7fb16f4  // b.none
   0x0000fffff7fb1664:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1668:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb166c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb1670:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1674:	54000400	b.eq	0xfffff7fb16f4  // b.none
   0x0000fffff7fb1678:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb167c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb1680:	36d801d1	tbz	w17, #27, 0xfffff7fb16b8
   0x0000fffff7fb1684:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1688:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb168c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1690:	54000321	b.ne	0xfffff7fb16f4  // b.any
   0x0000fffff7fb1694:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1698:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb169c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb16a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb16a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb16a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb16ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb16b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb16b4:	54000209	b.ls	0xfffff7fb16f4  // b.plast
   0x0000fffff7fb16b8:	36d8008d	tbz	w13, #27, 0xfffff7fb16c8
   0x0000fffff7fb16bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb16c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb16c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb16c8:	36d80091	tbz	w17, #27, 0xfffff7fb16d8
   0x0000fffff7fb16cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb16d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb16d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb16d8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb16dc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb16e0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb16e4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb16e8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb16ec:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb16f0:	1400000e	b	0xfffff7fb1728
   0x0000fffff7fb16f4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb16f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb16fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1700:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1704:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb1708:	aa1403e4	mov	x4, x20
   0x0000fffff7fb170c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1710:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb1714:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1718:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb171c:	d63f0200	blr	x16
   0x0000fffff7fb1720:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1724:	54004300	b.eq	0xfffff7fb1f84  // b.none
   0x0000fffff7fb1728:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb172c:	37d806a9	tbnz	w9, #27, 0xfffff7fb1800
   0x0000fffff7fb1730:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1734:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1738:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb173c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1740:	540001c1	b.ne	0xfffff7fb1778  // b.any
   0x0000fffff7fb1744:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb174c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1750:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1754:	54000121	b.ne	0xfffff7fb1778  // b.any
   0x0000fffff7fb1758:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb175c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb1760:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1764:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1768:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb176c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb1770:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1774:	14000030	b	0xfffff7fb1834
   0x0000fffff7fb1778:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb177c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1784:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1788:	54000120	b.eq	0xfffff7fb17ac  // b.none
   0x0000fffff7fb178c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1790:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1794:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1798:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb179c:	54000321	b.ne	0xfffff7fb1800  // b.any
   0x0000fffff7fb17a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb17a4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb17a8:	14000002	b	0xfffff7fb17b0
   0x0000fffff7fb17ac:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb17b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb17b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb17b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb17bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb17c0:	54000120	b.eq	0xfffff7fb17e4  // b.none
   0x0000fffff7fb17c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb17c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb17cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb17d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb17d4:	54000161	b.ne	0xfffff7fb1800  // b.any
   0x0000fffff7fb17d8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb17dc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb17e0:	14000002	b	0xfffff7fb17e8
   0x0000fffff7fb17e4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb17e8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb17ec:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb17f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb17f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb17f8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb17fc:	17ffffde	b	0xfffff7fb1774
   0x0000fffff7fb1800:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1804:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1808:	aa1303e1	mov	x1, x19
   0x0000fffff7fb180c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1810:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb1814:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1818:	aa1603e5	mov	x5, x22
   0x0000fffff7fb181c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb1820:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1824:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1828:	d63f0200	blr	x16
   0x0000fffff7fb182c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1830:	54003ae0	b.eq	0xfffff7fb1f8c  // b.none
   0x0000fffff7fb1834:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb1838:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb183c:	540004a0	b.eq	0xfffff7fb18d0  // b.none
   0x0000fffff7fb1840:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1844:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb1848:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb184c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1850:	54000400	b.eq	0xfffff7fb18d0  // b.none
   0x0000fffff7fb1854:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1858:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb185c:	36d801d1	tbz	w17, #27, 0xfffff7fb1894
   0x0000fffff7fb1860:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1864:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1868:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb186c:	54000321	b.ne	0xfffff7fb18d0  // b.any
   0x0000fffff7fb1870:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1874:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1878:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb187c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1880:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1884:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1888:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb188c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1890:	54000209	b.ls	0xfffff7fb18d0  // b.plast
   0x0000fffff7fb1894:	36d8008d	tbz	w13, #27, 0xfffff7fb18a4
   0x0000fffff7fb1898:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb189c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb18a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb18a4:	36d80091	tbz	w17, #27, 0xfffff7fb18b4
   0x0000fffff7fb18a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb18ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb18b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb18b4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb18b8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb18bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb18c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb18c4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb18c8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb18cc:	1400000e	b	0xfffff7fb1904
   0x0000fffff7fb18d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb18d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb18d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb18dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb18e0:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb18e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb18e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb18ec:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb18f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb18f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb18f8:	d63f0200	blr	x16
   0x0000fffff7fb18fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1900:	540034a0	b.eq	0xfffff7fb1f94  // b.none
   0x0000fffff7fb1904:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1908:	37d806a9	tbnz	w9, #27, 0xfffff7fb19dc
   0x0000fffff7fb190c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1910:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1918:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb191c:	540001c1	b.ne	0xfffff7fb1954  // b.any
   0x0000fffff7fb1920:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb192c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1930:	54000121	b.ne	0xfffff7fb1954  // b.any
   0x0000fffff7fb1934:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1938:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb193c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1940:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1948:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb194c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1950:	14000030	b	0xfffff7fb1a10
   0x0000fffff7fb1954:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1958:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb195c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1964:	54000120	b.eq	0xfffff7fb1988  // b.none
   0x0000fffff7fb1968:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb196c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1974:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1978:	54000321	b.ne	0xfffff7fb19dc  // b.any
   0x0000fffff7fb197c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1980:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1984:	14000002	b	0xfffff7fb198c
   0x0000fffff7fb1988:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb198c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1990:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1998:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb199c:	54000120	b.eq	0xfffff7fb19c0  // b.none
   0x0000fffff7fb19a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb19a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb19a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb19ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb19b0:	54000161	b.ne	0xfffff7fb19dc  // b.any
   0x0000fffff7fb19b4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb19b8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb19bc:	14000002	b	0xfffff7fb19c4
   0x0000fffff7fb19c0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb19c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb19c8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb19cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb19d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb19d4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb19d8:	17ffffde	b	0xfffff7fb1950
   0x0000fffff7fb19dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb19e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb19e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb19e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb19ec:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb19f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb19f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb19f8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb19fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1a00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1a04:	d63f0200	blr	x16
   0x0000fffff7fb1a08:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1a0c:	54002c80	b.eq	0xfffff7fb1f9c  // b.none
   0x0000fffff7fb1a10:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb1a14:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1a18:	540004a0	b.eq	0xfffff7fb1aac  // b.none
   0x0000fffff7fb1a1c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1a20:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb1a24:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb1a28:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1a2c:	54000400	b.eq	0xfffff7fb1aac  // b.none
   0x0000fffff7fb1a30:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1a34:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb1a38:	36d801d1	tbz	w17, #27, 0xfffff7fb1a70
   0x0000fffff7fb1a3c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1a40:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1a44:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1a48:	54000321	b.ne	0xfffff7fb1aac  // b.any
   0x0000fffff7fb1a4c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1a50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1a54:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1a58:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1a5c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1a60:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1a64:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1a68:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1a6c:	54000209	b.ls	0xfffff7fb1aac  // b.plast
   0x0000fffff7fb1a70:	36d8008d	tbz	w13, #27, 0xfffff7fb1a80
   0x0000fffff7fb1a74:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1a78:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1a7c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1a80:	36d80091	tbz	w17, #27, 0xfffff7fb1a90
   0x0000fffff7fb1a84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1a88:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1a8c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1a90:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb1a94:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb1a98:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb1a9c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb1aa0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb1aa4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb1aa8:	1400000e	b	0xfffff7fb1ae0
   0x0000fffff7fb1aac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1ab0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1ab4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1ab8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1abc:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb1ac0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1ac4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1ac8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb1acc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1ad0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1ad4:	d63f0200	blr	x16
   0x0000fffff7fb1ad8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1adc:	54002640	b.eq	0xfffff7fb1fa4  // b.none
   0x0000fffff7fb1ae0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1ae4:	37d806a9	tbnz	w9, #27, 0xfffff7fb1bb8
   0x0000fffff7fb1ae8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1aec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1af0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1af4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1af8:	540001c1	b.ne	0xfffff7fb1b30  // b.any
   0x0000fffff7fb1afc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1b00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1b04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1b08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1b0c:	54000121	b.ne	0xfffff7fb1b30  // b.any
   0x0000fffff7fb1b10:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1b14:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb1b18:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1b1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1b20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1b24:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb1b28:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1b2c:	14000030	b	0xfffff7fb1bec
   0x0000fffff7fb1b30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1b34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1b38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1b3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1b40:	54000120	b.eq	0xfffff7fb1b64  // b.none
   0x0000fffff7fb1b44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1b48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1b4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1b50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1b54:	54000321	b.ne	0xfffff7fb1bb8  // b.any
   0x0000fffff7fb1b58:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1b5c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1b60:	14000002	b	0xfffff7fb1b68
   0x0000fffff7fb1b64:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb1b68:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1b6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1b70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1b74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1b78:	54000120	b.eq	0xfffff7fb1b9c  // b.none
   0x0000fffff7fb1b7c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1b80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1b84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1b88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1b8c:	54000161	b.ne	0xfffff7fb1bb8  // b.any
   0x0000fffff7fb1b90:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb1b94:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1b98:	14000002	b	0xfffff7fb1ba0
   0x0000fffff7fb1b9c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb1ba0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1ba4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb1ba8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1bac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1bb0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1bb4:	17ffffde	b	0xfffff7fb1b2c
   0x0000fffff7fb1bb8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1bbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1bc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1bc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1bc8:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb1bcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1bd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1bd4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb1bd8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1bdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1be0:	d63f0200	blr	x16
   0x0000fffff7fb1be4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1be8:	54001e20	b.eq	0xfffff7fb1fac  // b.none
   0x0000fffff7fb1bec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb1bf0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb1bf4:	540004a0	b.eq	0xfffff7fb1c88  // b.none
   0x0000fffff7fb1bf8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb1bfc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb1c00:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb1c04:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb1c08:	54000400	b.eq	0xfffff7fb1c88  // b.none
   0x0000fffff7fb1c0c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb1c10:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb1c14:	36d801d1	tbz	w17, #27, 0xfffff7fb1c4c
   0x0000fffff7fb1c18:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb1c1c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb1c20:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb1c24:	54000321	b.ne	0xfffff7fb1c88  // b.any
   0x0000fffff7fb1c28:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb1c2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1c30:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb1c34:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb1c38:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb1c3c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb1c40:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb1c44:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb1c48:	54000209	b.ls	0xfffff7fb1c88  // b.plast
   0x0000fffff7fb1c4c:	36d8008d	tbz	w13, #27, 0xfffff7fb1c5c
   0x0000fffff7fb1c50:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb1c54:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb1c58:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb1c5c:	36d80091	tbz	w17, #27, 0xfffff7fb1c6c
   0x0000fffff7fb1c60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb1c64:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb1c68:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb1c6c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb1c70:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb1c74:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb1c78:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb1c7c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb1c80:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb1c84:	1400000e	b	0xfffff7fb1cbc
   0x0000fffff7fb1c88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb1c8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1c90:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1c94:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1c98:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb1c9c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1ca0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1ca4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb1ca8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1cac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1cb0:	d63f0200	blr	x16
   0x0000fffff7fb1cb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1cb8:	540017e0	b.eq	0xfffff7fb1fb4  // b.none
   0x0000fffff7fb1cbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1cc0:	37d806a9	tbnz	w9, #27, 0xfffff7fb1d94
   0x0000fffff7fb1cc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1cc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1ccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1cd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1cd4:	540001c1	b.ne	0xfffff7fb1d0c  // b.any
   0x0000fffff7fb1cd8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1cdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1ce4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1ce8:	54000121	b.ne	0xfffff7fb1d0c  // b.any
   0x0000fffff7fb1cec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1cf0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb1cf4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb1cf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1cfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1d00:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb1d04:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1d08:	14000030	b	0xfffff7fb1dc8
   0x0000fffff7fb1d0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1d10:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1d14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1d18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1d1c:	54000120	b.eq	0xfffff7fb1d40  // b.none
   0x0000fffff7fb1d20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb1d24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1d28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1d2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1d30:	54000321	b.ne	0xfffff7fb1d94  // b.any
   0x0000fffff7fb1d34:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb1d38:	9e620120	scvtf	d0, x9
   0x0000fffff7fb1d3c:	14000002	b	0xfffff7fb1d44
   0x0000fffff7fb1d40:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb1d44:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1d48:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1d4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1d50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1d54:	54000120	b.eq	0xfffff7fb1d78  // b.none
   0x0000fffff7fb1d58:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1d5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1d60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1d64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1d68:	54000161	b.ne	0xfffff7fb1d94  // b.any
   0x0000fffff7fb1d6c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb1d70:	9e620121	scvtf	d1, x9
   0x0000fffff7fb1d74:	14000002	b	0xfffff7fb1d7c
   0x0000fffff7fb1d78:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb1d7c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb1d80:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb1d84:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb1d88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1d8c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb1d90:	17ffffde	b	0xfffff7fb1d08
   0x0000fffff7fb1d94:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1d98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1d9c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1da0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1da4:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb1da8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1dac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1db0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb1db4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1db8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1dbc:	d63f0200	blr	x16
   0x0000fffff7fb1dc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1dc4:	54000fc0	b.eq	0xfffff7fb1fbc  // b.none
   0x0000fffff7fb1dc8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb1dcc:	37d80269	tbnz	w9, #27, 0xfffff7fb1e18
   0x0000fffff7fb1dd0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb1dd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1dd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1ddc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb1de0:	540001c1	b.ne	0xfffff7fb1e18  // b.any
   0x0000fffff7fb1de4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb1de8:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fb1dec:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fb1df0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7fb1df4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1df8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1dfc:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fb1e00:	aa0b03e9	mov	x9, x11
   0x0000fffff7fb1e04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1e08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1e0c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fb1e10:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fb1e14:	1400000e	b	0xfffff7fb1e4c
   0x0000fffff7fb1e18:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1e1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1e20:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1e24:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1e28:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fb1e2c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1e30:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1e34:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fb1e38:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb1e3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1e40:	d63f0200	blr	x16
   0x0000fffff7fb1e44:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb1e48:	54000be0	b.eq	0xfffff7fb1fc4  // b.none
   0x0000fffff7fb1e4c:	17fff8d2	b	0xfffff7fb0194
   0x0000fffff7fb1e50:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb1e54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb1e58:	aa1303e1	mov	x1, x19
   0x0000fffff7fb1e5c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb1e60:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fb1e64:	aa1403e4	mov	x4, x20
   0x0000fffff7fb1e68:	aa1603e5	mov	x5, x22
   0x0000fffff7fb1e6c:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fb1e70:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb1e74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb1e78:	d63f0200	blr	x16
   0x0000fffff7fb1e7c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb1e80:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb1e84:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb1e88:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb1e8c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb1e90:	d65f03c0	ret
   0x0000fffff7fb1e94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb1e98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb1e9c:	b900028a	str	w10, [x20]
   0x0000fffff7fb1ea0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb1ea4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb1ea8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb1eac:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb1eb0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb1eb4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb1eb8:	d65f03c0	ret
   0x0000fffff7fb1ebc:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb1ec0:	17fffff5	b	0xfffff7fb1e94
   0x0000fffff7fb1ec4:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb1ec8:	17fffff3	b	0xfffff7fb1e94
   0x0000fffff7fb1ecc:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb1ed0:	17fffff1	b	0xfffff7fb1e94
   0x0000fffff7fb1ed4:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb1ed8:	17ffffef	b	0xfffff7fb1e94
   0x0000fffff7fb1edc:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb1ee0:	17ffffed	b	0xfffff7fb1e94
   0x0000fffff7fb1ee4:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb1ee8:	17ffffeb	b	0xfffff7fb1e94
   0x0000fffff7fb1eec:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb1ef0:	17ffffe9	b	0xfffff7fb1e94
   0x0000fffff7fb1ef4:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb1ef8:	17ffffe7	b	0xfffff7fb1e94
   0x0000fffff7fb1efc:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb1f00:	17ffffe5	b	0xfffff7fb1e94
   0x0000fffff7fb1f04:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb1f08:	17ffffe3	b	0xfffff7fb1e94
   0x0000fffff7fb1f0c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb1f10:	17ffffe1	b	0xfffff7fb1e94
   0x0000fffff7fb1f14:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb1f18:	17ffffdf	b	0xfffff7fb1e94
   0x0000fffff7fb1f1c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb1f20:	17ffffdd	b	0xfffff7fb1e94
   0x0000fffff7fb1f24:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb1f28:	17ffffdb	b	0xfffff7fb1e94
   0x0000fffff7fb1f2c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb1f30:	17ffffd9	b	0xfffff7fb1e94
   0x0000fffff7fb1f34:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb1f38:	17ffffd7	b	0xfffff7fb1e94
   0x0000fffff7fb1f3c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb1f40:	17ffffd5	b	0xfffff7fb1e94
   0x0000fffff7fb1f44:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb1f48:	17ffffd3	b	0xfffff7fb1e94
   0x0000fffff7fb1f4c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb1f50:	17ffffd1	b	0xfffff7fb1e94
   0x0000fffff7fb1f54:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb1f58:	17ffffcf	b	0xfffff7fb1e94
   0x0000fffff7fb1f5c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb1f60:	17ffffcd	b	0xfffff7fb1e94
   0x0000fffff7fb1f64:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb1f68:	17ffffcb	b	0xfffff7fb1e94
   0x0000fffff7fb1f6c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb1f70:	17ffffc9	b	0xfffff7fb1e94
   0x0000fffff7fb1f74:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb1f78:	17ffffc7	b	0xfffff7fb1e94
   0x0000fffff7fb1f7c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb1f80:	17ffffc5	b	0xfffff7fb1e94
   0x0000fffff7fb1f84:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb1f88:	17ffffc3	b	0xfffff7fb1e94
   0x0000fffff7fb1f8c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb1f90:	17ffffc1	b	0xfffff7fb1e94
   0x0000fffff7fb1f94:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb1f98:	17ffffbf	b	0xfffff7fb1e94
   0x0000fffff7fb1f9c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb1fa0:	17ffffbd	b	0xfffff7fb1e94
   0x0000fffff7fb1fa4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb1fa8:	17ffffbb	b	0xfffff7fb1e94
   0x0000fffff7fb1fac:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb1fb0:	17ffffb9	b	0xfffff7fb1e94
   0x0000fffff7fb1fb4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb1fb8:	17ffffb7	b	0xfffff7fb1e94
   0x0000fffff7fb1fbc:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fb1fc0:	17ffffb5	b	0xfffff7fb1e94
   0x0000fffff7fb1fc4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fb1fc8:	17ffffb3	b	0xfffff7fb1e94
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
