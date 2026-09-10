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
   0x0000fffff7fa0058:	14000001	b	0xfffff7fa005c
   0x0000fffff7fa005c:	14000001	b	0xfffff7fa0060
   0x0000fffff7fa0060:	14000001	b	0xfffff7fa0064
   0x0000fffff7fa0064:	14000001	b	0xfffff7fa0068
   0x0000fffff7fa0068:	14000001	b	0xfffff7fa006c
   0x0000fffff7fa006c:	14000001	b	0xfffff7fa0070
   0x0000fffff7fa0070:	14000001	b	0xfffff7fa0074
   0x0000fffff7fa0074:	14000001	b	0xfffff7fa0078
   0x0000fffff7fa0078:	14000001	b	0xfffff7fa007c
   0x0000fffff7fa007c:	14000001	b	0xfffff7fa0080
   0x0000fffff7fa0080:	14000001	b	0xfffff7fa0084
   0x0000fffff7fa0084:	14000001	b	0xfffff7fa0088
   0x0000fffff7fa0088:	14000001	b	0xfffff7fa008c
   0x0000fffff7fa008c:	14000001	b	0xfffff7fa0090
   0x0000fffff7fa0090:	14000001	b	0xfffff7fa0094
   0x0000fffff7fa0094:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa0098:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa009c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa00a0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa00a4:	36d80211	tbz	w17, #27, 0xfffff7fa00e4
   0x0000fffff7fa00a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa00ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa00b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa00b4:	540001e1	b.ne	0xfffff7fa00f0  // b.any
   0x0000fffff7fa00b8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa00bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa00c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa00c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa00c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa00cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa00d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa00d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa00d8:	540000c9	b.ls	0xfffff7fa00f0  // b.plast
   0x0000fffff7fa00dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa00e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa00e4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa00e8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa00ec:	1400000e	b	0xfffff7fa0124
   0x0000fffff7fa00f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa00f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa00f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa00fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0100:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa0104:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0108:	aa1603e5	mov	x5, x22
   0x0000fffff7fa010c:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa0110:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0114:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0118:	d63f0200	blr	x16
   0x0000fffff7fa011c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0120:	5400ede0	b.eq	0xfffff7fa1edc  // b.none
   0x0000fffff7fa0124:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa0128:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa012c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa0130:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fa0134:	36d80211	tbz	w17, #27, 0xfffff7fa0174
   0x0000fffff7fa0138:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa013c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0140:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0144:	540001e1	b.ne	0xfffff7fa0180  // b.any
   0x0000fffff7fa0148:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa014c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0150:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0154:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0158:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa015c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0160:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0164:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0168:	540000c9	b.ls	0xfffff7fa0180  // b.plast
   0x0000fffff7fa016c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0170:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0174:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa0178:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa017c:	1400000e	b	0xfffff7fa01b4
   0x0000fffff7fa0180:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0184:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0188:	aa1303e1	mov	x1, x19
   0x0000fffff7fa018c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0190:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa0194:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0198:	aa1603e5	mov	x5, x22
   0x0000fffff7fa019c:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa01a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa01a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa01a8:	d63f0200	blr	x16
   0x0000fffff7fa01ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa01b0:	5400e9a0	b.eq	0xfffff7fa1ee4  // b.none
   0x0000fffff7fa01b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa01b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa01bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa01c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa01c4:	54000421	b.ne	0xfffff7fa0248  // b.any
   0x0000fffff7fa01c8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa01cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa01d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa01d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa01d8:	54000381	b.ne	0xfffff7fa0248  // b.any
   0x0000fffff7fa01dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa01e0:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fa01e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa01e8:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fa01ec:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fa01f0:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fa01f4:	91000580	add	x0, x12, #0x1
   0x0000fffff7fa01f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa01fc:	36d80211	tbz	w17, #27, 0xfffff7fa023c
   0x0000fffff7fa0200:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0204:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0208:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa020c:	540001e1	b.ne	0xfffff7fa0248  // b.any
   0x0000fffff7fa0210:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa0214:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0218:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa021c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0220:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0224:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0228:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa022c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0230:	540000c9	b.ls	0xfffff7fa0248  // b.plast
   0x0000fffff7fa0234:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0238:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa023c:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fa0240:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fa0244:	1400000e	b	0xfffff7fa027c
   0x0000fffff7fa0248:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa024c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0250:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0254:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0258:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa025c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0260:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0264:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fa0268:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa026c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0270:	d63f0200	blr	x16
   0x0000fffff7fa0274:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0278:	5400e3a0	b.eq	0xfffff7fa1eec  // b.none
   0x0000fffff7fa027c:	f100041f	cmp	x0, #0x1
   0x0000fffff7fa0280:	5400df80	b.eq	0xfffff7fa1e70  // b.none
   0x0000fffff7fa0284:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa0288:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa028c:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fa0290:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa0294:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa0298:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fa029c:	36d801d1	tbz	w17, #27, 0xfffff7fa02d4
   0x0000fffff7fa02a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa02a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa02a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa02ac:	54000281	b.ne	0xfffff7fa02fc  // b.any
   0x0000fffff7fa02b0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa02b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa02b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa02bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa02c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa02c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa02c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa02cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa02d0:	54000169	b.ls	0xfffff7fa02fc  // b.plast
   0x0000fffff7fa02d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa02d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa02dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa02e0:	36d80091	tbz	w17, #27, 0xfffff7fa02f0
   0x0000fffff7fa02e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa02e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa02ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa02f0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa02f4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa02f8:	1400000e	b	0xfffff7fa0330
   0x0000fffff7fa02fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0304:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0308:	aa1503e2	mov	x2, x21
   0x0000fffff7fa030c:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa0310:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0314:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0318:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fa031c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0324:	d63f0200	blr	x16
   0x0000fffff7fa0328:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa032c:	5400de40	b.eq	0xfffff7fa1ef4  // b.none
   0x0000fffff7fa0330:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa0334:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0338:	540003a0	b.eq	0xfffff7fa03ac  // b.none
   0x0000fffff7fa033c:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fa0340:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fa0344:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa0348:	36d801d1	tbz	w17, #27, 0xfffff7fa0380
   0x0000fffff7fa034c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0350:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0354:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0358:	540002a1	b.ne	0xfffff7fa03ac  // b.any
   0x0000fffff7fa035c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa0360:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0364:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0368:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa036c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0370:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0374:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0378:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa037c:	54000189	b.ls	0xfffff7fa03ac  // b.plast
   0x0000fffff7fa0380:	36d8008d	tbz	w13, #27, 0xfffff7fa0390
   0x0000fffff7fa0384:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0388:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa038c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0390:	36d80091	tbz	w17, #27, 0xfffff7fa03a0
   0x0000fffff7fa0394:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0398:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa039c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa03a0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa03a4:	b900016d	str	w13, [x11]
   0x0000fffff7fa03a8:	1400000e	b	0xfffff7fa03e0
   0x0000fffff7fa03ac:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa03b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa03b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa03b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa03bc:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa03c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa03c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa03c8:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fa03cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa03d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa03d4:	d63f0200	blr	x16
   0x0000fffff7fa03d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa03dc:	5400d900	b.eq	0xfffff7fa1efc  // b.none
   0x0000fffff7fa03e0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa03e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa03e8:	540004a0	b.eq	0xfffff7fa047c  // b.none
   0x0000fffff7fa03ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa03f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa03f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa03f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa03fc:	54000400	b.eq	0xfffff7fa047c  // b.none
   0x0000fffff7fa0400:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa0404:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa0408:	36d801d1	tbz	w17, #27, 0xfffff7fa0440
   0x0000fffff7fa040c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0410:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0414:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0418:	54000321	b.ne	0xfffff7fa047c  // b.any
   0x0000fffff7fa041c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa0420:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0424:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0428:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa042c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0430:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0434:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0438:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa043c:	54000209	b.ls	0xfffff7fa047c  // b.plast
   0x0000fffff7fa0440:	36d8008d	tbz	w13, #27, 0xfffff7fa0450
   0x0000fffff7fa0444:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0448:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa044c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0450:	36d80091	tbz	w17, #27, 0xfffff7fa0460
   0x0000fffff7fa0454:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0458:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa045c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0460:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa0464:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa0468:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa046c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa0470:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa0474:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa0478:	1400000e	b	0xfffff7fa04b0
   0x0000fffff7fa047c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0480:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0484:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0488:	aa1503e2	mov	x2, x21
   0x0000fffff7fa048c:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa0490:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0494:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0498:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa049c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa04a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa04a4:	d63f0200	blr	x16
   0x0000fffff7fa04a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa04ac:	5400d2c0	b.eq	0xfffff7fa1f04  // b.none
   0x0000fffff7fa04b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa04b4:	37d806a9	tbnz	w9, #27, 0xfffff7fa0588
   0x0000fffff7fa04b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa04bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa04c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa04c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa04c8:	540001c1	b.ne	0xfffff7fa0500  // b.any
   0x0000fffff7fa04cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa04d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa04d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa04d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa04dc:	54000121	b.ne	0xfffff7fa0500  // b.any
   0x0000fffff7fa04e0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa04e4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa04e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa04ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa04f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa04f4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa04f8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa04fc:	14000030	b	0xfffff7fa05bc
   0x0000fffff7fa0500:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0504:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0508:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa050c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0510:	54000120	b.eq	0xfffff7fa0534  // b.none
   0x0000fffff7fa0514:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0518:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa051c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0520:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0524:	54000321	b.ne	0xfffff7fa0588  // b.any
   0x0000fffff7fa0528:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa052c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa0530:	14000002	b	0xfffff7fa0538
   0x0000fffff7fa0534:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa0538:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa053c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0544:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0548:	54000120	b.eq	0xfffff7fa056c  // b.none
   0x0000fffff7fa054c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0550:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0558:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa055c:	54000161	b.ne	0xfffff7fa0588  // b.any
   0x0000fffff7fa0560:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa0564:	9e620121	scvtf	d1, x9
   0x0000fffff7fa0568:	14000002	b	0xfffff7fa0570
   0x0000fffff7fa056c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa0570:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa0574:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa0578:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa057c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0580:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa0584:	17ffffde	b	0xfffff7fa04fc
   0x0000fffff7fa0588:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa058c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0590:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0594:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0598:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa059c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa05a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa05a4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa05a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa05ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa05b0:	d63f0200	blr	x16
   0x0000fffff7fa05b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa05b8:	5400caa0	b.eq	0xfffff7fa1f0c  // b.none
   0x0000fffff7fa05bc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa05c0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa05c4:	540004a0	b.eq	0xfffff7fa0658  // b.none
   0x0000fffff7fa05c8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa05cc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa05d0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa05d4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa05d8:	54000400	b.eq	0xfffff7fa0658  // b.none
   0x0000fffff7fa05dc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa05e0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa05e4:	36d801d1	tbz	w17, #27, 0xfffff7fa061c
   0x0000fffff7fa05e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa05ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa05f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa05f4:	54000321	b.ne	0xfffff7fa0658  // b.any
   0x0000fffff7fa05f8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa05fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0600:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0604:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0608:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa060c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0610:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0614:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0618:	54000209	b.ls	0xfffff7fa0658  // b.plast
   0x0000fffff7fa061c:	36d8008d	tbz	w13, #27, 0xfffff7fa062c
   0x0000fffff7fa0620:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0624:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0628:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa062c:	36d80091	tbz	w17, #27, 0xfffff7fa063c
   0x0000fffff7fa0630:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0634:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0638:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa063c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa0640:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa0644:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa0648:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa064c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa0650:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa0654:	1400000e	b	0xfffff7fa068c
   0x0000fffff7fa0658:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa065c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0660:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0664:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0668:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa066c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0670:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0674:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa0678:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa067c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0680:	d63f0200	blr	x16
   0x0000fffff7fa0684:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0688:	5400c460	b.eq	0xfffff7fa1f14  // b.none
   0x0000fffff7fa068c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0690:	37d806a9	tbnz	w9, #27, 0xfffff7fa0764
   0x0000fffff7fa0694:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0698:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa069c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa06a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa06a4:	540001c1	b.ne	0xfffff7fa06dc  // b.any
   0x0000fffff7fa06a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa06ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa06b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa06b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa06b8:	54000121	b.ne	0xfffff7fa06dc  // b.any
   0x0000fffff7fa06bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa06c0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa06c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa06c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa06cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa06d0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa06d4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa06d8:	14000030	b	0xfffff7fa0798
   0x0000fffff7fa06dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa06e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa06e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa06e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa06ec:	54000120	b.eq	0xfffff7fa0710  // b.none
   0x0000fffff7fa06f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa06f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa06f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa06fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0700:	54000321	b.ne	0xfffff7fa0764  // b.any
   0x0000fffff7fa0704:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa0708:	9e620120	scvtf	d0, x9
   0x0000fffff7fa070c:	14000002	b	0xfffff7fa0714
   0x0000fffff7fa0710:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa0714:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0718:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa071c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0720:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0724:	54000120	b.eq	0xfffff7fa0748  // b.none
   0x0000fffff7fa0728:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa072c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0734:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0738:	54000161	b.ne	0xfffff7fa0764  // b.any
   0x0000fffff7fa073c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa0740:	9e620121	scvtf	d1, x9
   0x0000fffff7fa0744:	14000002	b	0xfffff7fa074c
   0x0000fffff7fa0748:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa074c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa0750:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa0754:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0758:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa075c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa0760:	17ffffde	b	0xfffff7fa06d8
   0x0000fffff7fa0764:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0768:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa076c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0770:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0774:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa0778:	aa1403e4	mov	x4, x20
   0x0000fffff7fa077c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0780:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa0784:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0788:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa078c:	d63f0200	blr	x16
   0x0000fffff7fa0790:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0794:	5400bc40	b.eq	0xfffff7fa1f1c  // b.none
   0x0000fffff7fa0798:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa079c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa07a0:	540004a0	b.eq	0xfffff7fa0834  // b.none
   0x0000fffff7fa07a4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa07a8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa07ac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa07b0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa07b4:	54000400	b.eq	0xfffff7fa0834  // b.none
   0x0000fffff7fa07b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa07bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa07c0:	36d801d1	tbz	w17, #27, 0xfffff7fa07f8
   0x0000fffff7fa07c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa07c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa07cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa07d0:	54000321	b.ne	0xfffff7fa0834  // b.any
   0x0000fffff7fa07d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa07d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa07dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa07e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa07e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa07e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa07ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa07f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa07f4:	54000209	b.ls	0xfffff7fa0834  // b.plast
   0x0000fffff7fa07f8:	36d8008d	tbz	w13, #27, 0xfffff7fa0808
   0x0000fffff7fa07fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0800:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0804:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0808:	36d80091	tbz	w17, #27, 0xfffff7fa0818
   0x0000fffff7fa080c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0810:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0814:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0818:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa081c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa0820:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa0824:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa0828:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa082c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa0830:	1400000e	b	0xfffff7fa0868
   0x0000fffff7fa0834:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0838:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa083c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0840:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0844:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa0848:	aa1403e4	mov	x4, x20
   0x0000fffff7fa084c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0850:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa0854:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0858:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa085c:	d63f0200	blr	x16
   0x0000fffff7fa0860:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0864:	5400b600	b.eq	0xfffff7fa1f24  // b.none
   0x0000fffff7fa0868:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa086c:	37d806a9	tbnz	w9, #27, 0xfffff7fa0940
   0x0000fffff7fa0870:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0874:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0878:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa087c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0880:	540001c1	b.ne	0xfffff7fa08b8  // b.any
   0x0000fffff7fa0884:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa088c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0890:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0894:	54000121	b.ne	0xfffff7fa08b8  // b.any
   0x0000fffff7fa0898:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa089c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa08a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa08a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa08a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa08ac:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa08b0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa08b4:	14000030	b	0xfffff7fa0974
   0x0000fffff7fa08b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa08bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa08c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa08c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa08c8:	54000120	b.eq	0xfffff7fa08ec  // b.none
   0x0000fffff7fa08cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa08d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa08d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa08d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa08dc:	54000321	b.ne	0xfffff7fa0940  // b.any
   0x0000fffff7fa08e0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa08e4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa08e8:	14000002	b	0xfffff7fa08f0
   0x0000fffff7fa08ec:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa08f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa08f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa08f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa08fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0900:	54000120	b.eq	0xfffff7fa0924  // b.none
   0x0000fffff7fa0904:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa090c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0914:	54000161	b.ne	0xfffff7fa0940  // b.any
   0x0000fffff7fa0918:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa091c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa0920:	14000002	b	0xfffff7fa0928
   0x0000fffff7fa0924:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa0928:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa092c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa0930:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0938:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa093c:	17ffffde	b	0xfffff7fa08b4
   0x0000fffff7fa0940:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0944:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0948:	aa1303e1	mov	x1, x19
   0x0000fffff7fa094c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0950:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa0954:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0958:	aa1603e5	mov	x5, x22
   0x0000fffff7fa095c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa0960:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0964:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0968:	d63f0200	blr	x16
   0x0000fffff7fa096c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0970:	5400ade0	b.eq	0xfffff7fa1f2c  // b.none
   0x0000fffff7fa0974:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa0978:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa097c:	540004a0	b.eq	0xfffff7fa0a10  // b.none
   0x0000fffff7fa0980:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa0984:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa0988:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa098c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa0990:	54000400	b.eq	0xfffff7fa0a10  // b.none
   0x0000fffff7fa0994:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa0998:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa099c:	36d801d1	tbz	w17, #27, 0xfffff7fa09d4
   0x0000fffff7fa09a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa09a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa09a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa09ac:	54000321	b.ne	0xfffff7fa0a10  // b.any
   0x0000fffff7fa09b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa09b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa09b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa09bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa09c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa09c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa09c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa09cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa09d0:	54000209	b.ls	0xfffff7fa0a10  // b.plast
   0x0000fffff7fa09d4:	36d8008d	tbz	w13, #27, 0xfffff7fa09e4
   0x0000fffff7fa09d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa09dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa09e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa09e4:	36d80091	tbz	w17, #27, 0xfffff7fa09f4
   0x0000fffff7fa09e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa09ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa09f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa09f4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa09f8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa09fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa0a00:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa0a04:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa0a08:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa0a0c:	1400000e	b	0xfffff7fa0a44
   0x0000fffff7fa0a10:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0a14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0a18:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0a1c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0a20:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa0a24:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0a28:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0a2c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa0a30:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0a34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0a38:	d63f0200	blr	x16
   0x0000fffff7fa0a3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0a40:	5400a7a0	b.eq	0xfffff7fa1f34  // b.none
   0x0000fffff7fa0a44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0a48:	37d806a9	tbnz	w9, #27, 0xfffff7fa0b1c
   0x0000fffff7fa0a4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0a50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0a54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0a58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0a5c:	540001c1	b.ne	0xfffff7fa0a94  // b.any
   0x0000fffff7fa0a60:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0a64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0a68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0a6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0a70:	54000121	b.ne	0xfffff7fa0a94  // b.any
   0x0000fffff7fa0a74:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa0a78:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa0a7c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa0a80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0a84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0a88:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa0a8c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa0a90:	14000030	b	0xfffff7fa0b50
   0x0000fffff7fa0a94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0a98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0a9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0aa0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0aa4:	54000120	b.eq	0xfffff7fa0ac8  // b.none
   0x0000fffff7fa0aa8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0aac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0ab0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0ab4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0ab8:	54000321	b.ne	0xfffff7fa0b1c  // b.any
   0x0000fffff7fa0abc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa0ac0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa0ac4:	14000002	b	0xfffff7fa0acc
   0x0000fffff7fa0ac8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa0acc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0ad0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0ad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0ad8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0adc:	54000120	b.eq	0xfffff7fa0b00  // b.none
   0x0000fffff7fa0ae0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0ae4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0ae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0aec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0af0:	54000161	b.ne	0xfffff7fa0b1c  // b.any
   0x0000fffff7fa0af4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa0af8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa0afc:	14000002	b	0xfffff7fa0b04
   0x0000fffff7fa0b00:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa0b04:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa0b08:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa0b0c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0b10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0b14:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa0b18:	17ffffde	b	0xfffff7fa0a90
   0x0000fffff7fa0b1c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0b20:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0b24:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0b28:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0b2c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa0b30:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0b34:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0b38:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa0b3c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0b40:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0b44:	d63f0200	blr	x16
   0x0000fffff7fa0b48:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0b4c:	54009f80	b.eq	0xfffff7fa1f3c  // b.none
   0x0000fffff7fa0b50:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa0b54:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0b58:	540004a0	b.eq	0xfffff7fa0bec  // b.none
   0x0000fffff7fa0b5c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa0b60:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa0b64:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa0b68:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa0b6c:	54000400	b.eq	0xfffff7fa0bec  // b.none
   0x0000fffff7fa0b70:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa0b74:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa0b78:	36d801d1	tbz	w17, #27, 0xfffff7fa0bb0
   0x0000fffff7fa0b7c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0b80:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0b84:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0b88:	54000321	b.ne	0xfffff7fa0bec  // b.any
   0x0000fffff7fa0b8c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa0b90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0b94:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0b98:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0b9c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0ba0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0ba4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0ba8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0bac:	54000209	b.ls	0xfffff7fa0bec  // b.plast
   0x0000fffff7fa0bb0:	36d8008d	tbz	w13, #27, 0xfffff7fa0bc0
   0x0000fffff7fa0bb4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0bb8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0bbc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0bc0:	36d80091	tbz	w17, #27, 0xfffff7fa0bd0
   0x0000fffff7fa0bc4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0bc8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0bcc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0bd0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa0bd4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa0bd8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa0bdc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa0be0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa0be4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa0be8:	1400000e	b	0xfffff7fa0c20
   0x0000fffff7fa0bec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0bf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0bf4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0bf8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0bfc:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa0c00:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0c04:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0c08:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa0c0c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0c10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0c14:	d63f0200	blr	x16
   0x0000fffff7fa0c18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0c1c:	54009940	b.eq	0xfffff7fa1f44  // b.none
   0x0000fffff7fa0c20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0c24:	37d806a9	tbnz	w9, #27, 0xfffff7fa0cf8
   0x0000fffff7fa0c28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0c2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0c30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0c34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0c38:	540001c1	b.ne	0xfffff7fa0c70  // b.any
   0x0000fffff7fa0c3c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0c40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0c44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0c48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0c4c:	54000121	b.ne	0xfffff7fa0c70  // b.any
   0x0000fffff7fa0c50:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa0c54:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa0c58:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa0c5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0c60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0c64:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa0c68:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa0c6c:	14000030	b	0xfffff7fa0d2c
   0x0000fffff7fa0c70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0c74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0c78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0c7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0c80:	54000120	b.eq	0xfffff7fa0ca4  // b.none
   0x0000fffff7fa0c84:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0c88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0c90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0c94:	54000321	b.ne	0xfffff7fa0cf8  // b.any
   0x0000fffff7fa0c98:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa0c9c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa0ca0:	14000002	b	0xfffff7fa0ca8
   0x0000fffff7fa0ca4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa0ca8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0cac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0cb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0cb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0cb8:	54000120	b.eq	0xfffff7fa0cdc  // b.none
   0x0000fffff7fa0cbc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0cc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0cc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0ccc:	54000161	b.ne	0xfffff7fa0cf8  // b.any
   0x0000fffff7fa0cd0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa0cd4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa0cd8:	14000002	b	0xfffff7fa0ce0
   0x0000fffff7fa0cdc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa0ce0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa0ce4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa0ce8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0cec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0cf0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa0cf4:	17ffffde	b	0xfffff7fa0c6c
   0x0000fffff7fa0cf8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0cfc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0d00:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0d04:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0d08:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa0d0c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0d10:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0d14:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa0d18:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0d1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0d20:	d63f0200	blr	x16
   0x0000fffff7fa0d24:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0d28:	54009120	b.eq	0xfffff7fa1f4c  // b.none
   0x0000fffff7fa0d2c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa0d30:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0d34:	540004a0	b.eq	0xfffff7fa0dc8  // b.none
   0x0000fffff7fa0d38:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa0d3c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa0d40:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa0d44:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa0d48:	54000400	b.eq	0xfffff7fa0dc8  // b.none
   0x0000fffff7fa0d4c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa0d50:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa0d54:	36d801d1	tbz	w17, #27, 0xfffff7fa0d8c
   0x0000fffff7fa0d58:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0d5c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0d60:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0d64:	54000321	b.ne	0xfffff7fa0dc8  // b.any
   0x0000fffff7fa0d68:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa0d6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0d70:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0d74:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0d78:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0d7c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0d80:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0d84:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0d88:	54000209	b.ls	0xfffff7fa0dc8  // b.plast
   0x0000fffff7fa0d8c:	36d8008d	tbz	w13, #27, 0xfffff7fa0d9c
   0x0000fffff7fa0d90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0d94:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0d98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0d9c:	36d80091	tbz	w17, #27, 0xfffff7fa0dac
   0x0000fffff7fa0da0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0da4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0da8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0dac:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa0db0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa0db4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa0db8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa0dbc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa0dc0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa0dc4:	1400000e	b	0xfffff7fa0dfc
   0x0000fffff7fa0dc8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0dcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0dd0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0dd4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0dd8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa0ddc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0de0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0de4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa0de8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0dec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0df0:	d63f0200	blr	x16
   0x0000fffff7fa0df4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0df8:	54008ae0	b.eq	0xfffff7fa1f54  // b.none
   0x0000fffff7fa0dfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0e00:	37d806a9	tbnz	w9, #27, 0xfffff7fa0ed4
   0x0000fffff7fa0e04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0e08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0e10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0e14:	540001c1	b.ne	0xfffff7fa0e4c  // b.any
   0x0000fffff7fa0e18:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0e1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0e20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0e24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0e28:	54000121	b.ne	0xfffff7fa0e4c  // b.any
   0x0000fffff7fa0e2c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa0e30:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa0e34:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa0e38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0e3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0e40:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa0e44:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa0e48:	14000030	b	0xfffff7fa0f08
   0x0000fffff7fa0e4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0e50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0e54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0e58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0e5c:	54000120	b.eq	0xfffff7fa0e80  // b.none
   0x0000fffff7fa0e60:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0e64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0e68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0e6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0e70:	54000321	b.ne	0xfffff7fa0ed4  // b.any
   0x0000fffff7fa0e74:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa0e78:	9e620120	scvtf	d0, x9
   0x0000fffff7fa0e7c:	14000002	b	0xfffff7fa0e84
   0x0000fffff7fa0e80:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa0e84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0e88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0e8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0e90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0e94:	54000120	b.eq	0xfffff7fa0eb8  // b.none
   0x0000fffff7fa0e98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0e9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0ea0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0ea4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0ea8:	54000161	b.ne	0xfffff7fa0ed4  // b.any
   0x0000fffff7fa0eac:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa0eb0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa0eb4:	14000002	b	0xfffff7fa0ebc
   0x0000fffff7fa0eb8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa0ebc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa0ec0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa0ec4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa0ec8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0ecc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa0ed0:	17ffffde	b	0xfffff7fa0e48
   0x0000fffff7fa0ed4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa0ed8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0edc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0ee0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0ee4:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa0ee8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0eec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0ef0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa0ef4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa0ef8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0efc:	d63f0200	blr	x16
   0x0000fffff7fa0f00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0f04:	540082c0	b.eq	0xfffff7fa1f5c  // b.none
   0x0000fffff7fa0f08:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa0f0c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa0f10:	540004a0	b.eq	0xfffff7fa0fa4  // b.none
   0x0000fffff7fa0f14:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa0f18:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa0f1c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa0f20:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa0f24:	54000400	b.eq	0xfffff7fa0fa4  // b.none
   0x0000fffff7fa0f28:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa0f2c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa0f30:	36d801d1	tbz	w17, #27, 0xfffff7fa0f68
   0x0000fffff7fa0f34:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa0f38:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa0f3c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa0f40:	54000321	b.ne	0xfffff7fa0fa4  // b.any
   0x0000fffff7fa0f44:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa0f48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0f4c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa0f50:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa0f54:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa0f58:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa0f5c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa0f60:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa0f64:	54000209	b.ls	0xfffff7fa0fa4  // b.plast
   0x0000fffff7fa0f68:	36d8008d	tbz	w13, #27, 0xfffff7fa0f78
   0x0000fffff7fa0f6c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa0f70:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa0f74:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa0f78:	36d80091	tbz	w17, #27, 0xfffff7fa0f88
   0x0000fffff7fa0f7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa0f80:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa0f84:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa0f88:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa0f8c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa0f90:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa0f94:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa0f98:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa0f9c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa0fa0:	1400000e	b	0xfffff7fa0fd8
   0x0000fffff7fa0fa4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa0fa8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa0fac:	aa1303e1	mov	x1, x19
   0x0000fffff7fa0fb0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa0fb4:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa0fb8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa0fbc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa0fc0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa0fc4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa0fc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa0fcc:	d63f0200	blr	x16
   0x0000fffff7fa0fd0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa0fd4:	54007c80	b.eq	0xfffff7fa1f64  // b.none
   0x0000fffff7fa0fd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0fdc:	37d806a9	tbnz	w9, #27, 0xfffff7fa10b0
   0x0000fffff7fa0fe0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa0fe4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0fe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa0fec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa0ff0:	540001c1	b.ne	0xfffff7fa1028  // b.any
   0x0000fffff7fa0ff4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa0ff8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa0ffc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1000:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1004:	54000121	b.ne	0xfffff7fa1028  // b.any
   0x0000fffff7fa1008:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa100c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa1010:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa1014:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1018:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa101c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa1020:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1024:	14000030	b	0xfffff7fa10e4
   0x0000fffff7fa1028:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa102c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1030:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1034:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1038:	54000120	b.eq	0xfffff7fa105c  // b.none
   0x0000fffff7fa103c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1040:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1044:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1048:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa104c:	54000321	b.ne	0xfffff7fa10b0  // b.any
   0x0000fffff7fa1050:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa1054:	9e620120	scvtf	d0, x9
   0x0000fffff7fa1058:	14000002	b	0xfffff7fa1060
   0x0000fffff7fa105c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa1060:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1064:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa106c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1070:	54000120	b.eq	0xfffff7fa1094  // b.none
   0x0000fffff7fa1074:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1078:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa107c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1080:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1084:	54000161	b.ne	0xfffff7fa10b0  // b.any
   0x0000fffff7fa1088:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa108c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa1090:	14000002	b	0xfffff7fa1098
   0x0000fffff7fa1094:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa1098:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa109c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa10a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa10a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa10a8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa10ac:	17ffffde	b	0xfffff7fa1024
   0x0000fffff7fa10b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa10b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa10b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa10bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa10c0:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa10c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa10c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa10cc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa10d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa10d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa10d8:	d63f0200	blr	x16
   0x0000fffff7fa10dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa10e0:	54007460	b.eq	0xfffff7fa1f6c  // b.none
   0x0000fffff7fa10e4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa10e8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa10ec:	540004a0	b.eq	0xfffff7fa1180  // b.none
   0x0000fffff7fa10f0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa10f4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa10f8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa10fc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa1100:	54000400	b.eq	0xfffff7fa1180  // b.none
   0x0000fffff7fa1104:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa1108:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa110c:	36d801d1	tbz	w17, #27, 0xfffff7fa1144
   0x0000fffff7fa1110:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1114:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1118:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa111c:	54000321	b.ne	0xfffff7fa1180  // b.any
   0x0000fffff7fa1120:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa1124:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1128:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa112c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa1130:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1134:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1138:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa113c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa1140:	54000209	b.ls	0xfffff7fa1180  // b.plast
   0x0000fffff7fa1144:	36d8008d	tbz	w13, #27, 0xfffff7fa1154
   0x0000fffff7fa1148:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa114c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa1150:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1154:	36d80091	tbz	w17, #27, 0xfffff7fa1164
   0x0000fffff7fa1158:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa115c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa1160:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1164:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa1168:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa116c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa1170:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa1174:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa1178:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa117c:	1400000e	b	0xfffff7fa11b4
   0x0000fffff7fa1180:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa1184:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1188:	aa1303e1	mov	x1, x19
   0x0000fffff7fa118c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1190:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa1194:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1198:	aa1603e5	mov	x5, x22
   0x0000fffff7fa119c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa11a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa11a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa11a8:	d63f0200	blr	x16
   0x0000fffff7fa11ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa11b0:	54006e20	b.eq	0xfffff7fa1f74  // b.none
   0x0000fffff7fa11b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa11b8:	37d806a9	tbnz	w9, #27, 0xfffff7fa128c
   0x0000fffff7fa11bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa11c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa11c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa11c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa11cc:	540001c1	b.ne	0xfffff7fa1204  // b.any
   0x0000fffff7fa11d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa11d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa11d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa11dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa11e0:	54000121	b.ne	0xfffff7fa1204  // b.any
   0x0000fffff7fa11e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa11e8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa11ec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa11f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa11f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa11f8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa11fc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1200:	14000030	b	0xfffff7fa12c0
   0x0000fffff7fa1204:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1208:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa120c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1210:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1214:	54000120	b.eq	0xfffff7fa1238  // b.none
   0x0000fffff7fa1218:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa121c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1220:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1224:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1228:	54000321	b.ne	0xfffff7fa128c  // b.any
   0x0000fffff7fa122c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa1230:	9e620120	scvtf	d0, x9
   0x0000fffff7fa1234:	14000002	b	0xfffff7fa123c
   0x0000fffff7fa1238:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa123c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1240:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1248:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa124c:	54000120	b.eq	0xfffff7fa1270  // b.none
   0x0000fffff7fa1250:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1254:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa125c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1260:	54000161	b.ne	0xfffff7fa128c  // b.any
   0x0000fffff7fa1264:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa1268:	9e620121	scvtf	d1, x9
   0x0000fffff7fa126c:	14000002	b	0xfffff7fa1274
   0x0000fffff7fa1270:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa1274:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa1278:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa127c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1280:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1284:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1288:	17ffffde	b	0xfffff7fa1200
   0x0000fffff7fa128c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1290:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1294:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1298:	aa1503e2	mov	x2, x21
   0x0000fffff7fa129c:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa12a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa12a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa12a8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa12ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa12b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa12b4:	d63f0200	blr	x16
   0x0000fffff7fa12b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa12bc:	54006600	b.eq	0xfffff7fa1f7c  // b.none
   0x0000fffff7fa12c0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa12c4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa12c8:	540004a0	b.eq	0xfffff7fa135c  // b.none
   0x0000fffff7fa12cc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa12d0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa12d4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa12d8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa12dc:	54000400	b.eq	0xfffff7fa135c  // b.none
   0x0000fffff7fa12e0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa12e4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa12e8:	36d801d1	tbz	w17, #27, 0xfffff7fa1320
   0x0000fffff7fa12ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa12f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa12f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa12f8:	54000321	b.ne	0xfffff7fa135c  // b.any
   0x0000fffff7fa12fc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa1300:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1304:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1308:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa130c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1310:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1314:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa1318:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa131c:	54000209	b.ls	0xfffff7fa135c  // b.plast
   0x0000fffff7fa1320:	36d8008d	tbz	w13, #27, 0xfffff7fa1330
   0x0000fffff7fa1324:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1328:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa132c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1330:	36d80091	tbz	w17, #27, 0xfffff7fa1340
   0x0000fffff7fa1334:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1338:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa133c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1340:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa1344:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa1348:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa134c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa1350:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa1354:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa1358:	1400000e	b	0xfffff7fa1390
   0x0000fffff7fa135c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa1360:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1364:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1368:	aa1503e2	mov	x2, x21
   0x0000fffff7fa136c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa1370:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1374:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1378:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa137c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1380:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1384:	d63f0200	blr	x16
   0x0000fffff7fa1388:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa138c:	54005fc0	b.eq	0xfffff7fa1f84  // b.none
   0x0000fffff7fa1390:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1394:	37d806a9	tbnz	w9, #27, 0xfffff7fa1468
   0x0000fffff7fa1398:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa139c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa13a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa13a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa13a8:	540001c1	b.ne	0xfffff7fa13e0  // b.any
   0x0000fffff7fa13ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa13b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa13b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa13b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa13bc:	54000121	b.ne	0xfffff7fa13e0  // b.any
   0x0000fffff7fa13c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa13c4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa13c8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa13cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa13d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa13d4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa13d8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa13dc:	14000030	b	0xfffff7fa149c
   0x0000fffff7fa13e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa13e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa13e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa13ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa13f0:	54000120	b.eq	0xfffff7fa1414  // b.none
   0x0000fffff7fa13f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa13f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa13fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1400:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1404:	54000321	b.ne	0xfffff7fa1468  // b.any
   0x0000fffff7fa1408:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa140c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa1410:	14000002	b	0xfffff7fa1418
   0x0000fffff7fa1414:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa1418:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa141c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1424:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1428:	54000120	b.eq	0xfffff7fa144c  // b.none
   0x0000fffff7fa142c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1430:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1434:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1438:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa143c:	54000161	b.ne	0xfffff7fa1468  // b.any
   0x0000fffff7fa1440:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa1444:	9e620121	scvtf	d1, x9
   0x0000fffff7fa1448:	14000002	b	0xfffff7fa1450
   0x0000fffff7fa144c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa1450:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa1454:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa1458:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa145c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1460:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1464:	17ffffde	b	0xfffff7fa13dc
   0x0000fffff7fa1468:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa146c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1470:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1474:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1478:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa147c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1480:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1484:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa1488:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa148c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1490:	d63f0200	blr	x16
   0x0000fffff7fa1494:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1498:	540057a0	b.eq	0xfffff7fa1f8c  // b.none
   0x0000fffff7fa149c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa14a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa14a4:	540004a0	b.eq	0xfffff7fa1538  // b.none
   0x0000fffff7fa14a8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa14ac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa14b0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa14b4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa14b8:	54000400	b.eq	0xfffff7fa1538  // b.none
   0x0000fffff7fa14bc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa14c0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa14c4:	36d801d1	tbz	w17, #27, 0xfffff7fa14fc
   0x0000fffff7fa14c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa14cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa14d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa14d4:	54000321	b.ne	0xfffff7fa1538  // b.any
   0x0000fffff7fa14d8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa14dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa14e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa14e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa14e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa14ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa14f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa14f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa14f8:	54000209	b.ls	0xfffff7fa1538  // b.plast
   0x0000fffff7fa14fc:	36d8008d	tbz	w13, #27, 0xfffff7fa150c
   0x0000fffff7fa1500:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1504:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa1508:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa150c:	36d80091	tbz	w17, #27, 0xfffff7fa151c
   0x0000fffff7fa1510:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1514:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa1518:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa151c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa1520:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa1524:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa1528:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa152c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa1530:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa1534:	1400000e	b	0xfffff7fa156c
   0x0000fffff7fa1538:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa153c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1540:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1544:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1548:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa154c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1550:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1554:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa1558:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa155c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1560:	d63f0200	blr	x16
   0x0000fffff7fa1564:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1568:	54005160	b.eq	0xfffff7fa1f94  // b.none
   0x0000fffff7fa156c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1570:	37d806a9	tbnz	w9, #27, 0xfffff7fa1644
   0x0000fffff7fa1574:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1578:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa157c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1580:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1584:	540001c1	b.ne	0xfffff7fa15bc  // b.any
   0x0000fffff7fa1588:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa158c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1594:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1598:	54000121	b.ne	0xfffff7fa15bc  // b.any
   0x0000fffff7fa159c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa15a0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa15a4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa15a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa15ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa15b0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa15b4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa15b8:	14000030	b	0xfffff7fa1678
   0x0000fffff7fa15bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa15c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa15c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa15c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa15cc:	54000120	b.eq	0xfffff7fa15f0  // b.none
   0x0000fffff7fa15d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa15d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa15d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa15dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa15e0:	54000321	b.ne	0xfffff7fa1644  // b.any
   0x0000fffff7fa15e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa15e8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa15ec:	14000002	b	0xfffff7fa15f4
   0x0000fffff7fa15f0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa15f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa15f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa15fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1600:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1604:	54000120	b.eq	0xfffff7fa1628  // b.none
   0x0000fffff7fa1608:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa160c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1614:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1618:	54000161	b.ne	0xfffff7fa1644  // b.any
   0x0000fffff7fa161c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa1620:	9e620121	scvtf	d1, x9
   0x0000fffff7fa1624:	14000002	b	0xfffff7fa162c
   0x0000fffff7fa1628:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa162c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa1630:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa1634:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa163c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1640:	17ffffde	b	0xfffff7fa15b8
   0x0000fffff7fa1644:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1648:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa164c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1650:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1654:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa1658:	aa1403e4	mov	x4, x20
   0x0000fffff7fa165c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1660:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa1664:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1668:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa166c:	d63f0200	blr	x16
   0x0000fffff7fa1670:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1674:	54004940	b.eq	0xfffff7fa1f9c  // b.none
   0x0000fffff7fa1678:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa167c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa1680:	540004a0	b.eq	0xfffff7fa1714  // b.none
   0x0000fffff7fa1684:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa1688:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa168c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa1690:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa1694:	54000400	b.eq	0xfffff7fa1714  // b.none
   0x0000fffff7fa1698:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa169c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa16a0:	36d801d1	tbz	w17, #27, 0xfffff7fa16d8
   0x0000fffff7fa16a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa16a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa16ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa16b0:	54000321	b.ne	0xfffff7fa1714  // b.any
   0x0000fffff7fa16b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa16b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa16bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa16c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa16c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa16c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa16cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa16d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa16d4:	54000209	b.ls	0xfffff7fa1714  // b.plast
   0x0000fffff7fa16d8:	36d8008d	tbz	w13, #27, 0xfffff7fa16e8
   0x0000fffff7fa16dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa16e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa16e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa16e8:	36d80091	tbz	w17, #27, 0xfffff7fa16f8
   0x0000fffff7fa16ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa16f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa16f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa16f8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa16fc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa1700:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa1704:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa1708:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa170c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa1710:	1400000e	b	0xfffff7fa1748
   0x0000fffff7fa1714:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa1718:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa171c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1720:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1724:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa1728:	aa1403e4	mov	x4, x20
   0x0000fffff7fa172c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1730:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa1734:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1738:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa173c:	d63f0200	blr	x16
   0x0000fffff7fa1740:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1744:	54004300	b.eq	0xfffff7fa1fa4  // b.none
   0x0000fffff7fa1748:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa174c:	37d806a9	tbnz	w9, #27, 0xfffff7fa1820
   0x0000fffff7fa1750:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1754:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1758:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa175c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1760:	540001c1	b.ne	0xfffff7fa1798  // b.any
   0x0000fffff7fa1764:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1768:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa176c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1770:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1774:	54000121	b.ne	0xfffff7fa1798  // b.any
   0x0000fffff7fa1778:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa177c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa1780:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa1784:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1788:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa178c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa1790:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1794:	14000030	b	0xfffff7fa1854
   0x0000fffff7fa1798:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa179c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa17a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa17a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa17a8:	54000120	b.eq	0xfffff7fa17cc  // b.none
   0x0000fffff7fa17ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa17b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa17b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa17b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa17bc:	54000321	b.ne	0xfffff7fa1820  // b.any
   0x0000fffff7fa17c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa17c4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa17c8:	14000002	b	0xfffff7fa17d0
   0x0000fffff7fa17cc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa17d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa17d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa17d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa17dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa17e0:	54000120	b.eq	0xfffff7fa1804  // b.none
   0x0000fffff7fa17e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa17e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa17ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa17f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa17f4:	54000161	b.ne	0xfffff7fa1820  // b.any
   0x0000fffff7fa17f8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa17fc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa1800:	14000002	b	0xfffff7fa1808
   0x0000fffff7fa1804:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa1808:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa180c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa1810:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1814:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1818:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa181c:	17ffffde	b	0xfffff7fa1794
   0x0000fffff7fa1820:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1824:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1828:	aa1303e1	mov	x1, x19
   0x0000fffff7fa182c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1830:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa1834:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1838:	aa1603e5	mov	x5, x22
   0x0000fffff7fa183c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa1840:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1844:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1848:	d63f0200	blr	x16
   0x0000fffff7fa184c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1850:	54003ae0	b.eq	0xfffff7fa1fac  // b.none
   0x0000fffff7fa1854:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa1858:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa185c:	540004a0	b.eq	0xfffff7fa18f0  // b.none
   0x0000fffff7fa1860:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa1864:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa1868:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa186c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa1870:	54000400	b.eq	0xfffff7fa18f0  // b.none
   0x0000fffff7fa1874:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa1878:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa187c:	36d801d1	tbz	w17, #27, 0xfffff7fa18b4
   0x0000fffff7fa1880:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1884:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1888:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa188c:	54000321	b.ne	0xfffff7fa18f0  // b.any
   0x0000fffff7fa1890:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa1894:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1898:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa189c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa18a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa18a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa18a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa18ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa18b0:	54000209	b.ls	0xfffff7fa18f0  // b.plast
   0x0000fffff7fa18b4:	36d8008d	tbz	w13, #27, 0xfffff7fa18c4
   0x0000fffff7fa18b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa18bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa18c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa18c4:	36d80091	tbz	w17, #27, 0xfffff7fa18d4
   0x0000fffff7fa18c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa18cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa18d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa18d4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa18d8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa18dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa18e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa18e4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa18e8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa18ec:	1400000e	b	0xfffff7fa1924
   0x0000fffff7fa18f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa18f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa18f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa18fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1900:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa1904:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1908:	aa1603e5	mov	x5, x22
   0x0000fffff7fa190c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa1910:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1914:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1918:	d63f0200	blr	x16
   0x0000fffff7fa191c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1920:	540034a0	b.eq	0xfffff7fa1fb4  // b.none
   0x0000fffff7fa1924:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1928:	37d806a9	tbnz	w9, #27, 0xfffff7fa19fc
   0x0000fffff7fa192c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1930:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1938:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa193c:	540001c1	b.ne	0xfffff7fa1974  // b.any
   0x0000fffff7fa1940:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa194c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1950:	54000121	b.ne	0xfffff7fa1974  // b.any
   0x0000fffff7fa1954:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa1958:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa195c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa1960:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1968:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa196c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1970:	14000030	b	0xfffff7fa1a30
   0x0000fffff7fa1974:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1978:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa197c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1980:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1984:	54000120	b.eq	0xfffff7fa19a8  // b.none
   0x0000fffff7fa1988:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa198c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1994:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1998:	54000321	b.ne	0xfffff7fa19fc  // b.any
   0x0000fffff7fa199c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa19a0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa19a4:	14000002	b	0xfffff7fa19ac
   0x0000fffff7fa19a8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa19ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa19b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa19b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa19b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa19bc:	54000120	b.eq	0xfffff7fa19e0  // b.none
   0x0000fffff7fa19c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa19c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa19c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa19cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa19d0:	54000161	b.ne	0xfffff7fa19fc  // b.any
   0x0000fffff7fa19d4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa19d8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa19dc:	14000002	b	0xfffff7fa19e4
   0x0000fffff7fa19e0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa19e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa19e8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa19ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa19f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa19f4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa19f8:	17ffffde	b	0xfffff7fa1970
   0x0000fffff7fa19fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1a00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1a04:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1a08:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1a0c:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa1a10:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1a14:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1a18:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa1a1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1a20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1a24:	d63f0200	blr	x16
   0x0000fffff7fa1a28:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1a2c:	54002c80	b.eq	0xfffff7fa1fbc  // b.none
   0x0000fffff7fa1a30:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa1a34:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa1a38:	540004a0	b.eq	0xfffff7fa1acc  // b.none
   0x0000fffff7fa1a3c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa1a40:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa1a44:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa1a48:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa1a4c:	54000400	b.eq	0xfffff7fa1acc  // b.none
   0x0000fffff7fa1a50:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa1a54:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa1a58:	36d801d1	tbz	w17, #27, 0xfffff7fa1a90
   0x0000fffff7fa1a5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1a60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1a64:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa1a68:	54000321	b.ne	0xfffff7fa1acc  // b.any
   0x0000fffff7fa1a6c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa1a70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1a74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1a78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa1a7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1a80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1a84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa1a88:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa1a8c:	54000209	b.ls	0xfffff7fa1acc  // b.plast
   0x0000fffff7fa1a90:	36d8008d	tbz	w13, #27, 0xfffff7fa1aa0
   0x0000fffff7fa1a94:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1a98:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa1a9c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1aa0:	36d80091	tbz	w17, #27, 0xfffff7fa1ab0
   0x0000fffff7fa1aa4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1aa8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa1aac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1ab0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa1ab4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa1ab8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa1abc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa1ac0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa1ac4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa1ac8:	1400000e	b	0xfffff7fa1b00
   0x0000fffff7fa1acc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa1ad0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1ad4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1ad8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1adc:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa1ae0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1ae4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1ae8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa1aec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1af0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1af4:	d63f0200	blr	x16
   0x0000fffff7fa1af8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1afc:	54002640	b.eq	0xfffff7fa1fc4  // b.none
   0x0000fffff7fa1b00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1b04:	37d806a9	tbnz	w9, #27, 0xfffff7fa1bd8
   0x0000fffff7fa1b08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1b0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1b10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1b14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1b18:	540001c1	b.ne	0xfffff7fa1b50  // b.any
   0x0000fffff7fa1b1c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1b20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1b24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1b28:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1b2c:	54000121	b.ne	0xfffff7fa1b50  // b.any
   0x0000fffff7fa1b30:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa1b34:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa1b38:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa1b3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1b40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1b44:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa1b48:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1b4c:	14000030	b	0xfffff7fa1c0c
   0x0000fffff7fa1b50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1b54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1b58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1b5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1b60:	54000120	b.eq	0xfffff7fa1b84  // b.none
   0x0000fffff7fa1b64:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1b68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1b6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1b70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1b74:	54000321	b.ne	0xfffff7fa1bd8  // b.any
   0x0000fffff7fa1b78:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa1b7c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa1b80:	14000002	b	0xfffff7fa1b88
   0x0000fffff7fa1b84:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa1b88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1b8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1b90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1b94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1b98:	54000120	b.eq	0xfffff7fa1bbc  // b.none
   0x0000fffff7fa1b9c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1ba0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1ba4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1ba8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1bac:	54000161	b.ne	0xfffff7fa1bd8  // b.any
   0x0000fffff7fa1bb0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa1bb4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa1bb8:	14000002	b	0xfffff7fa1bc0
   0x0000fffff7fa1bbc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa1bc0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa1bc4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa1bc8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1bcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1bd0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1bd4:	17ffffde	b	0xfffff7fa1b4c
   0x0000fffff7fa1bd8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1bdc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1be0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1be4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1be8:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa1bec:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1bf0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1bf4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa1bf8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1bfc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1c00:	d63f0200	blr	x16
   0x0000fffff7fa1c04:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1c08:	54001e20	b.eq	0xfffff7fa1fcc  // b.none
   0x0000fffff7fa1c0c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa1c10:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa1c14:	540004a0	b.eq	0xfffff7fa1ca8  // b.none
   0x0000fffff7fa1c18:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa1c1c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa1c20:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa1c24:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa1c28:	54000400	b.eq	0xfffff7fa1ca8  // b.none
   0x0000fffff7fa1c2c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa1c30:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa1c34:	36d801d1	tbz	w17, #27, 0xfffff7fa1c6c
   0x0000fffff7fa1c38:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa1c3c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa1c40:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa1c44:	54000321	b.ne	0xfffff7fa1ca8  // b.any
   0x0000fffff7fa1c48:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa1c4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1c50:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa1c54:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa1c58:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa1c5c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa1c60:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa1c64:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa1c68:	54000209	b.ls	0xfffff7fa1ca8  // b.plast
   0x0000fffff7fa1c6c:	36d8008d	tbz	w13, #27, 0xfffff7fa1c7c
   0x0000fffff7fa1c70:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa1c74:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa1c78:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa1c7c:	36d80091	tbz	w17, #27, 0xfffff7fa1c8c
   0x0000fffff7fa1c80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa1c84:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa1c88:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa1c8c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa1c90:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa1c94:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa1c98:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa1c9c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa1ca0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa1ca4:	1400000e	b	0xfffff7fa1cdc
   0x0000fffff7fa1ca8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa1cac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1cb0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1cb4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1cb8:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa1cbc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1cc0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1cc4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa1cc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1ccc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1cd0:	d63f0200	blr	x16
   0x0000fffff7fa1cd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1cd8:	540017e0	b.eq	0xfffff7fa1fd4  // b.none
   0x0000fffff7fa1cdc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1ce0:	37d806a9	tbnz	w9, #27, 0xfffff7fa1db4
   0x0000fffff7fa1ce4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1ce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1cec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1cf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1cf4:	540001c1	b.ne	0xfffff7fa1d2c  // b.any
   0x0000fffff7fa1cf8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1cfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1d04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1d08:	54000121	b.ne	0xfffff7fa1d2c  // b.any
   0x0000fffff7fa1d0c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa1d10:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa1d14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa1d18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1d1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1d20:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa1d24:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1d28:	14000030	b	0xfffff7fa1de8
   0x0000fffff7fa1d2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1d30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1d34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1d38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1d3c:	54000120	b.eq	0xfffff7fa1d60  // b.none
   0x0000fffff7fa1d40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa1d44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1d48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1d4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1d50:	54000321	b.ne	0xfffff7fa1db4  // b.any
   0x0000fffff7fa1d54:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa1d58:	9e620120	scvtf	d0, x9
   0x0000fffff7fa1d5c:	14000002	b	0xfffff7fa1d64
   0x0000fffff7fa1d60:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa1d64:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1d68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1d6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1d70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1d74:	54000120	b.eq	0xfffff7fa1d98  // b.none
   0x0000fffff7fa1d78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1d7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1d80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1d84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1d88:	54000161	b.ne	0xfffff7fa1db4  // b.any
   0x0000fffff7fa1d8c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa1d90:	9e620121	scvtf	d1, x9
   0x0000fffff7fa1d94:	14000002	b	0xfffff7fa1d9c
   0x0000fffff7fa1d98:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa1d9c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa1da0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa1da4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa1da8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1dac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa1db0:	17ffffde	b	0xfffff7fa1d28
   0x0000fffff7fa1db4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1db8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1dbc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1dc0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1dc4:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa1dc8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1dcc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1dd0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa1dd4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1dd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1ddc:	d63f0200	blr	x16
   0x0000fffff7fa1de0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1de4:	54000fc0	b.eq	0xfffff7fa1fdc  // b.none
   0x0000fffff7fa1de8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa1dec:	37d80269	tbnz	w9, #27, 0xfffff7fa1e38
   0x0000fffff7fa1df0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa1df4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1df8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1dfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa1e00:	540001c1	b.ne	0xfffff7fa1e38  // b.any
   0x0000fffff7fa1e04:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa1e08:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fa1e0c:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fa1e10:	f9003669	str	x9, [x19, #104]
   0x0000fffff7fa1e14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1e18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1e1c:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fa1e20:	aa0b03e9	mov	x9, x11
   0x0000fffff7fa1e24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1e28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1e2c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fa1e30:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fa1e34:	1400000e	b	0xfffff7fa1e6c
   0x0000fffff7fa1e38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1e3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1e40:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1e44:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1e48:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fa1e4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1e50:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1e54:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fa1e58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa1e5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1e60:	d63f0200	blr	x16
   0x0000fffff7fa1e64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa1e68:	54000be0	b.eq	0xfffff7fa1fe4  // b.none
   0x0000fffff7fa1e6c:	17fff8d2	b	0xfffff7fa01b4
   0x0000fffff7fa1e70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa1e74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa1e78:	aa1303e1	mov	x1, x19
   0x0000fffff7fa1e7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa1e80:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7fa1e84:	aa1403e4	mov	x4, x20
   0x0000fffff7fa1e88:	aa1603e5	mov	x5, x22
   0x0000fffff7fa1e8c:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fa1e90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa1e94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa1e98:	d63f0200	blr	x16
   0x0000fffff7fa1e9c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa1ea0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa1ea4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa1ea8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa1eac:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa1eb0:	d65f03c0	ret
   0x0000fffff7fa1eb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa1eb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa1ebc:	b900028a	str	w10, [x20]
   0x0000fffff7fa1ec0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa1ec4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa1ec8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa1ecc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa1ed0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa1ed4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa1ed8:	d65f03c0	ret
   0x0000fffff7fa1edc:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa1ee0:	17fffff5	b	0xfffff7fa1eb4
   0x0000fffff7fa1ee4:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa1ee8:	17fffff3	b	0xfffff7fa1eb4
   0x0000fffff7fa1eec:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa1ef0:	17fffff1	b	0xfffff7fa1eb4
   0x0000fffff7fa1ef4:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa1ef8:	17ffffef	b	0xfffff7fa1eb4
   0x0000fffff7fa1efc:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa1f00:	17ffffed	b	0xfffff7fa1eb4
   0x0000fffff7fa1f04:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa1f08:	17ffffeb	b	0xfffff7fa1eb4
   0x0000fffff7fa1f0c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa1f10:	17ffffe9	b	0xfffff7fa1eb4
   0x0000fffff7fa1f14:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa1f18:	17ffffe7	b	0xfffff7fa1eb4
   0x0000fffff7fa1f1c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa1f20:	17ffffe5	b	0xfffff7fa1eb4
   0x0000fffff7fa1f24:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa1f28:	17ffffe3	b	0xfffff7fa1eb4
   0x0000fffff7fa1f2c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa1f30:	17ffffe1	b	0xfffff7fa1eb4
   0x0000fffff7fa1f34:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa1f38:	17ffffdf	b	0xfffff7fa1eb4
   0x0000fffff7fa1f3c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa1f40:	17ffffdd	b	0xfffff7fa1eb4
   0x0000fffff7fa1f44:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa1f48:	17ffffdb	b	0xfffff7fa1eb4
   0x0000fffff7fa1f4c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa1f50:	17ffffd9	b	0xfffff7fa1eb4
   0x0000fffff7fa1f54:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa1f58:	17ffffd7	b	0xfffff7fa1eb4
   0x0000fffff7fa1f5c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa1f60:	17ffffd5	b	0xfffff7fa1eb4
   0x0000fffff7fa1f64:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa1f68:	17ffffd3	b	0xfffff7fa1eb4
   0x0000fffff7fa1f6c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa1f70:	17ffffd1	b	0xfffff7fa1eb4
   0x0000fffff7fa1f74:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa1f78:	17ffffcf	b	0xfffff7fa1eb4
   0x0000fffff7fa1f7c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa1f80:	17ffffcd	b	0xfffff7fa1eb4
   0x0000fffff7fa1f84:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa1f88:	17ffffcb	b	0xfffff7fa1eb4
   0x0000fffff7fa1f8c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa1f90:	17ffffc9	b	0xfffff7fa1eb4
   0x0000fffff7fa1f94:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa1f98:	17ffffc7	b	0xfffff7fa1eb4
   0x0000fffff7fa1f9c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa1fa0:	17ffffc5	b	0xfffff7fa1eb4
   0x0000fffff7fa1fa4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa1fa8:	17ffffc3	b	0xfffff7fa1eb4
   0x0000fffff7fa1fac:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa1fb0:	17ffffc1	b	0xfffff7fa1eb4
   0x0000fffff7fa1fb4:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa1fb8:	17ffffbf	b	0xfffff7fa1eb4
   0x0000fffff7fa1fbc:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa1fc0:	17ffffbd	b	0xfffff7fa1eb4
   0x0000fffff7fa1fc4:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa1fc8:	17ffffbb	b	0xfffff7fa1eb4
   0x0000fffff7fa1fcc:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa1fd0:	17ffffb9	b	0xfffff7fa1eb4
   0x0000fffff7fa1fd4:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa1fd8:	17ffffb7	b	0xfffff7fa1eb4
   0x0000fffff7fa1fdc:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fa1fe0:	17ffffb5	b	0xfffff7fa1eb4
   0x0000fffff7fa1fe4:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7fa1fe8:	17ffffb3	b	0xfffff7fa1eb4
   0x0000fffff7fa1fec:	00000000	udf	#0
   0x0000fffff7fa1ff0:	00000000	udf	#0
   0x0000fffff7fa1ff4:	00000000	udf	#0
   0x0000fffff7fa1ff8:	00000000	udf	#0
   0x0000fffff7fa1ffc:	00000000	udf	#0
End of assembler dump.
