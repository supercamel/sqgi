Dump of assembler code from 0xfffff7f9e000 to 0xfffff7fa0000:
   0x0000fffff7f9e000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f9e004:	910003fd	mov	x29, sp
   0x0000fffff7f9e008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9e00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f9e010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f9e014:	aa0003f3	mov	x19, x0
   0x0000fffff7f9e018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9e01c:	aa0203f5	mov	x21, x2
   0x0000fffff7f9e020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f9e024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f9e028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9e02c:	f90003e9	str	x9, [sp]
   0x0000fffff7f9e030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f9e034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f9e038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9e03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f9e040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e044:	d63f0200	blr	x16
   0x0000fffff7f9e048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9e04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f9e050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f9e054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f9e058:	14000001	b	0xfffff7f9e05c
   0x0000fffff7f9e05c:	14000001	b	0xfffff7f9e060
   0x0000fffff7f9e060:	14000001	b	0xfffff7f9e064
   0x0000fffff7f9e064:	14000001	b	0xfffff7f9e068
   0x0000fffff7f9e068:	14000001	b	0xfffff7f9e06c
   0x0000fffff7f9e06c:	14000001	b	0xfffff7f9e070
   0x0000fffff7f9e070:	14000001	b	0xfffff7f9e074
   0x0000fffff7f9e074:	14000001	b	0xfffff7f9e078
   0x0000fffff7f9e078:	14000001	b	0xfffff7f9e07c
   0x0000fffff7f9e07c:	14000001	b	0xfffff7f9e080
   0x0000fffff7f9e080:	14000001	b	0xfffff7f9e084
   0x0000fffff7f9e084:	14000001	b	0xfffff7f9e088
   0x0000fffff7f9e088:	14000001	b	0xfffff7f9e08c
   0x0000fffff7f9e08c:	14000001	b	0xfffff7f9e090
   0x0000fffff7f9e090:	14000001	b	0xfffff7f9e094
   0x0000fffff7f9e094:	14000001	b	0xfffff7f9e098
   0x0000fffff7f9e098:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f9e09c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f9e0a0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f9e0a4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9e0a8:	36d80211	tbz	w17, #27, 0xfffff7f9e0e8
   0x0000fffff7f9e0ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e0b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e0b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e0b8:	540001e1	b.ne	0xfffff7f9e0f4  // b.any
   0x0000fffff7f9e0bc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9e0c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e0c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e0c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e0cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e0d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e0d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e0d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e0dc:	540000c9	b.ls	0xfffff7f9e0f4  // b.plast
   0x0000fffff7f9e0e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e0e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e0e8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9e0ec:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9e0f0:	1400000e	b	0xfffff7f9e128
   0x0000fffff7f9e0f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e0f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e0fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e100:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e104:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f9e108:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e10c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e110:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f9e114:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e118:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e11c:	d63f0200	blr	x16
   0x0000fffff7f9e120:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e124:	5400ede0	b.eq	0xfffff7f9fee0  // b.none
   0x0000fffff7f9e128:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f9e12c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f9e130:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f9e134:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f9e138:	36d80211	tbz	w17, #27, 0xfffff7f9e178
   0x0000fffff7f9e13c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e140:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e144:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e148:	540001e1	b.ne	0xfffff7f9e184  // b.any
   0x0000fffff7f9e14c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f9e150:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e154:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e158:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e15c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e160:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e164:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e168:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e16c:	540000c9	b.ls	0xfffff7f9e184  // b.plast
   0x0000fffff7f9e170:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e174:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e178:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f9e17c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f9e180:	1400000e	b	0xfffff7f9e1b8
   0x0000fffff7f9e184:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e188:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e18c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e190:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e194:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f9e198:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e19c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e1a0:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f9e1a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e1a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e1ac:	d63f0200	blr	x16
   0x0000fffff7f9e1b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e1b4:	5400e9a0	b.eq	0xfffff7f9fee8  // b.none
   0x0000fffff7f9e1b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9e1bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e1c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e1c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e1c8:	54000421	b.ne	0xfffff7f9e24c  // b.any
   0x0000fffff7f9e1cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9e1d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e1d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e1d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e1dc:	54000381	b.ne	0xfffff7f9e24c  // b.any
   0x0000fffff7f9e1e0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9e1e4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f9e1e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e1ec:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7f9e1f0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7f9e1f4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7f9e1f8:	91000580	add	x0, x12, #0x1
   0x0000fffff7f9e1fc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9e200:	36d80211	tbz	w17, #27, 0xfffff7f9e240
   0x0000fffff7f9e204:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e208:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e20c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e210:	540001e1	b.ne	0xfffff7f9e24c  // b.any
   0x0000fffff7f9e214:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9e218:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e21c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e220:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e224:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e228:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e22c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e230:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e234:	540000c9	b.ls	0xfffff7f9e24c  // b.plast
   0x0000fffff7f9e238:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e23c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e240:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7f9e244:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7f9e248:	1400000e	b	0xfffff7f9e280
   0x0000fffff7f9e24c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e250:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e254:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e258:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e25c:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f9e260:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e264:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e268:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7f9e26c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e270:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e274:	d63f0200	blr	x16
   0x0000fffff7f9e278:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e27c:	5400e3a0	b.eq	0xfffff7f9fef0  // b.none
   0x0000fffff7f9e280:	f100041f	cmp	x0, #0x1
   0x0000fffff7f9e284:	5400df80	b.eq	0xfffff7f9fe74  // b.none
   0x0000fffff7f9e288:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9e28c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9e290:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f9e294:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9e298:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9e29c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f9e2a0:	36d801d1	tbz	w17, #27, 0xfffff7f9e2d8
   0x0000fffff7f9e2a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e2a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e2ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e2b0:	54000281	b.ne	0xfffff7f9e300  // b.any
   0x0000fffff7f9e2b4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9e2b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e2bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e2c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e2c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e2c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e2cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e2d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e2d4:	54000169	b.ls	0xfffff7f9e300  // b.plast
   0x0000fffff7f9e2d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e2dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e2e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e2e4:	36d80091	tbz	w17, #27, 0xfffff7f9e2f4
   0x0000fffff7f9e2e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e2ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e2f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e2f4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9e2f8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9e2fc:	1400000e	b	0xfffff7f9e334
   0x0000fffff7f9e300:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e304:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e308:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e30c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e310:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f9e314:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e318:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e31c:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f9e320:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e324:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e328:	d63f0200	blr	x16
   0x0000fffff7f9e32c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e330:	5400de40	b.eq	0xfffff7f9fef8  // b.none
   0x0000fffff7f9e334:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9e338:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9e33c:	540003a0	b.eq	0xfffff7f9e3b0  // b.none
   0x0000fffff7f9e340:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f9e344:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f9e348:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9e34c:	36d801d1	tbz	w17, #27, 0xfffff7f9e384
   0x0000fffff7f9e350:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e354:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e358:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e35c:	540002a1	b.ne	0xfffff7f9e3b0  // b.any
   0x0000fffff7f9e360:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9e364:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e368:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e36c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e370:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e374:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e378:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e37c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e380:	54000189	b.ls	0xfffff7f9e3b0  // b.plast
   0x0000fffff7f9e384:	36d8008d	tbz	w13, #27, 0xfffff7f9e394
   0x0000fffff7f9e388:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e38c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e390:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e394:	36d80091	tbz	w17, #27, 0xfffff7f9e3a4
   0x0000fffff7f9e398:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e39c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e3a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e3a4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9e3a8:	b900016d	str	w13, [x11]
   0x0000fffff7f9e3ac:	1400000e	b	0xfffff7f9e3e4
   0x0000fffff7f9e3b0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e3b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e3b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e3bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e3c0:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f9e3c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e3c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e3cc:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7f9e3d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e3d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e3d8:	d63f0200	blr	x16
   0x0000fffff7f9e3dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e3e0:	5400d900	b.eq	0xfffff7f9ff00  // b.none
   0x0000fffff7f9e3e4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9e3e8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9e3ec:	540004a0	b.eq	0xfffff7f9e480  // b.none
   0x0000fffff7f9e3f0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9e3f4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9e3f8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9e3fc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9e400:	54000400	b.eq	0xfffff7f9e480  // b.none
   0x0000fffff7f9e404:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9e408:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9e40c:	36d801d1	tbz	w17, #27, 0xfffff7f9e444
   0x0000fffff7f9e410:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e414:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e418:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e41c:	54000321	b.ne	0xfffff7f9e480  // b.any
   0x0000fffff7f9e420:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9e424:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e428:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e42c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e430:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e434:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e438:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e43c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e440:	54000209	b.ls	0xfffff7f9e480  // b.plast
   0x0000fffff7f9e444:	36d8008d	tbz	w13, #27, 0xfffff7f9e454
   0x0000fffff7f9e448:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e44c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e450:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e454:	36d80091	tbz	w17, #27, 0xfffff7f9e464
   0x0000fffff7f9e458:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e45c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e460:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e464:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9e468:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9e46c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9e470:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9e474:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9e478:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9e47c:	1400000e	b	0xfffff7f9e4b4
   0x0000fffff7f9e480:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e484:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e488:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e48c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e490:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f9e494:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e498:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e49c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9e4a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e4a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e4a8:	d63f0200	blr	x16
   0x0000fffff7f9e4ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e4b0:	5400d2c0	b.eq	0xfffff7f9ff08  // b.none
   0x0000fffff7f9e4b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e4b8:	37d806a9	tbnz	w9, #27, 0xfffff7f9e58c
   0x0000fffff7f9e4bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e4c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e4c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e4c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e4cc:	540001c1	b.ne	0xfffff7f9e504  // b.any
   0x0000fffff7f9e4d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9e4d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e4d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e4dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e4e0:	54000121	b.ne	0xfffff7f9e504  // b.any
   0x0000fffff7f9e4e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9e4e8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9e4ec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e4f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e4f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e4f8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9e4fc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9e500:	14000030	b	0xfffff7f9e5c0
   0x0000fffff7f9e504:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e508:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e50c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e510:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e514:	54000120	b.eq	0xfffff7f9e538  // b.none
   0x0000fffff7f9e518:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e51c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e524:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e528:	54000321	b.ne	0xfffff7f9e58c  // b.any
   0x0000fffff7f9e52c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9e530:	9e620120	scvtf	d0, x9
   0x0000fffff7f9e534:	14000002	b	0xfffff7f9e53c
   0x0000fffff7f9e538:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9e53c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9e540:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e544:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e548:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e54c:	54000120	b.eq	0xfffff7f9e570  // b.none
   0x0000fffff7f9e550:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9e554:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e55c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e560:	54000161	b.ne	0xfffff7f9e58c  // b.any
   0x0000fffff7f9e564:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9e568:	9e620121	scvtf	d1, x9
   0x0000fffff7f9e56c:	14000002	b	0xfffff7f9e574
   0x0000fffff7f9e570:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9e574:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9e578:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9e57c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e580:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e584:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9e588:	17ffffde	b	0xfffff7f9e500
   0x0000fffff7f9e58c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e590:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e594:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e598:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e59c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f9e5a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e5a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e5a8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9e5ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e5b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e5b4:	d63f0200	blr	x16
   0x0000fffff7f9e5b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e5bc:	5400caa0	b.eq	0xfffff7f9ff10  // b.none
   0x0000fffff7f9e5c0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9e5c4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9e5c8:	540004a0	b.eq	0xfffff7f9e65c  // b.none
   0x0000fffff7f9e5cc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9e5d0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9e5d4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9e5d8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9e5dc:	54000400	b.eq	0xfffff7f9e65c  // b.none
   0x0000fffff7f9e5e0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9e5e4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9e5e8:	36d801d1	tbz	w17, #27, 0xfffff7f9e620
   0x0000fffff7f9e5ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e5f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e5f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e5f8:	54000321	b.ne	0xfffff7f9e65c  // b.any
   0x0000fffff7f9e5fc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9e600:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e604:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e608:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e60c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e610:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e614:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e618:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e61c:	54000209	b.ls	0xfffff7f9e65c  // b.plast
   0x0000fffff7f9e620:	36d8008d	tbz	w13, #27, 0xfffff7f9e630
   0x0000fffff7f9e624:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e628:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e62c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e630:	36d80091	tbz	w17, #27, 0xfffff7f9e640
   0x0000fffff7f9e634:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e638:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e63c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e640:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9e644:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9e648:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9e64c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9e650:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9e654:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9e658:	1400000e	b	0xfffff7f9e690
   0x0000fffff7f9e65c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e660:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e664:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e668:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e66c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f9e670:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e674:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e678:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9e67c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e680:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e684:	d63f0200	blr	x16
   0x0000fffff7f9e688:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e68c:	5400c460	b.eq	0xfffff7f9ff18  // b.none
   0x0000fffff7f9e690:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e694:	37d806a9	tbnz	w9, #27, 0xfffff7f9e768
   0x0000fffff7f9e698:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e69c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e6a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e6a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e6a8:	540001c1	b.ne	0xfffff7f9e6e0  // b.any
   0x0000fffff7f9e6ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9e6b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e6b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e6b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e6bc:	54000121	b.ne	0xfffff7f9e6e0  // b.any
   0x0000fffff7f9e6c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9e6c4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9e6c8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e6cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e6d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e6d4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9e6d8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9e6dc:	14000030	b	0xfffff7f9e79c
   0x0000fffff7f9e6e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e6e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e6e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e6ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e6f0:	54000120	b.eq	0xfffff7f9e714  // b.none
   0x0000fffff7f9e6f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e6f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e6fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e700:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e704:	54000321	b.ne	0xfffff7f9e768  // b.any
   0x0000fffff7f9e708:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9e70c:	9e620120	scvtf	d0, x9
   0x0000fffff7f9e710:	14000002	b	0xfffff7f9e718
   0x0000fffff7f9e714:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9e718:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9e71c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e724:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e728:	54000120	b.eq	0xfffff7f9e74c  // b.none
   0x0000fffff7f9e72c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9e730:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e738:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e73c:	54000161	b.ne	0xfffff7f9e768  // b.any
   0x0000fffff7f9e740:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9e744:	9e620121	scvtf	d1, x9
   0x0000fffff7f9e748:	14000002	b	0xfffff7f9e750
   0x0000fffff7f9e74c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9e750:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9e754:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9e758:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e75c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e760:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9e764:	17ffffde	b	0xfffff7f9e6dc
   0x0000fffff7f9e768:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e76c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e770:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e774:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e778:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9e77c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e780:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e784:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9e788:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e78c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e790:	d63f0200	blr	x16
   0x0000fffff7f9e794:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e798:	5400bc40	b.eq	0xfffff7f9ff20  // b.none
   0x0000fffff7f9e79c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9e7a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9e7a4:	540004a0	b.eq	0xfffff7f9e838  // b.none
   0x0000fffff7f9e7a8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9e7ac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9e7b0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9e7b4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9e7b8:	54000400	b.eq	0xfffff7f9e838  // b.none
   0x0000fffff7f9e7bc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9e7c0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9e7c4:	36d801d1	tbz	w17, #27, 0xfffff7f9e7fc
   0x0000fffff7f9e7c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e7cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e7d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e7d4:	54000321	b.ne	0xfffff7f9e838  // b.any
   0x0000fffff7f9e7d8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9e7dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e7e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e7e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e7e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e7ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e7f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e7f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e7f8:	54000209	b.ls	0xfffff7f9e838  // b.plast
   0x0000fffff7f9e7fc:	36d8008d	tbz	w13, #27, 0xfffff7f9e80c
   0x0000fffff7f9e800:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e804:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e808:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e80c:	36d80091	tbz	w17, #27, 0xfffff7f9e81c
   0x0000fffff7f9e810:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e814:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e818:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e81c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9e820:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9e824:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9e828:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9e82c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9e830:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9e834:	1400000e	b	0xfffff7f9e86c
   0x0000fffff7f9e838:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e83c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e840:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e844:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e848:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f9e84c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e850:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e854:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9e858:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e85c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e860:	d63f0200	blr	x16
   0x0000fffff7f9e864:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e868:	5400b600	b.eq	0xfffff7f9ff28  // b.none
   0x0000fffff7f9e86c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e870:	37d806a9	tbnz	w9, #27, 0xfffff7f9e944
   0x0000fffff7f9e874:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e87c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e880:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e884:	540001c1	b.ne	0xfffff7f9e8bc  // b.any
   0x0000fffff7f9e888:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9e88c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e890:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e894:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e898:	54000121	b.ne	0xfffff7f9e8bc  // b.any
   0x0000fffff7f9e89c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9e8a0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9e8a4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e8a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e8ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e8b0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9e8b4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9e8b8:	14000030	b	0xfffff7f9e978
   0x0000fffff7f9e8bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e8c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e8c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e8cc:	54000120	b.eq	0xfffff7f9e8f0  // b.none
   0x0000fffff7f9e8d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e8d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e8d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e8dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e8e0:	54000321	b.ne	0xfffff7f9e944  // b.any
   0x0000fffff7f9e8e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9e8e8:	9e620120	scvtf	d0, x9
   0x0000fffff7f9e8ec:	14000002	b	0xfffff7f9e8f4
   0x0000fffff7f9e8f0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9e8f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9e8f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e8fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e900:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e904:	54000120	b.eq	0xfffff7f9e928  // b.none
   0x0000fffff7f9e908:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9e90c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e914:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e918:	54000161	b.ne	0xfffff7f9e944  // b.any
   0x0000fffff7f9e91c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9e920:	9e620121	scvtf	d1, x9
   0x0000fffff7f9e924:	14000002	b	0xfffff7f9e92c
   0x0000fffff7f9e928:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9e92c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9e930:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9e934:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e93c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9e940:	17ffffde	b	0xfffff7f9e8b8
   0x0000fffff7f9e944:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e948:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e94c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e950:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e954:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f9e958:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e95c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e960:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9e964:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e968:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e96c:	d63f0200	blr	x16
   0x0000fffff7f9e970:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e974:	5400ade0	b.eq	0xfffff7f9ff30  // b.none
   0x0000fffff7f9e978:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9e97c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9e980:	540004a0	b.eq	0xfffff7f9ea14  // b.none
   0x0000fffff7f9e984:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9e988:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9e98c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9e990:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9e994:	54000400	b.eq	0xfffff7f9ea14  // b.none
   0x0000fffff7f9e998:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9e99c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9e9a0:	36d801d1	tbz	w17, #27, 0xfffff7f9e9d8
   0x0000fffff7f9e9a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e9a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e9ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e9b0:	54000321	b.ne	0xfffff7f9ea14  // b.any
   0x0000fffff7f9e9b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9e9b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e9bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e9c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e9c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e9c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e9cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e9d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e9d4:	54000209	b.ls	0xfffff7f9ea14  // b.plast
   0x0000fffff7f9e9d8:	36d8008d	tbz	w13, #27, 0xfffff7f9e9e8
   0x0000fffff7f9e9dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e9e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e9e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e9e8:	36d80091	tbz	w17, #27, 0xfffff7f9e9f8
   0x0000fffff7f9e9ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e9f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e9f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e9f8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9e9fc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9ea00:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9ea04:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9ea08:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9ea0c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9ea10:	1400000e	b	0xfffff7f9ea48
   0x0000fffff7f9ea14:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ea18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ea1c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ea20:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ea24:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f9ea28:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ea2c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ea30:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9ea34:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ea38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ea3c:	d63f0200	blr	x16
   0x0000fffff7f9ea40:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ea44:	5400a7a0	b.eq	0xfffff7f9ff38  // b.none
   0x0000fffff7f9ea48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ea4c:	37d806a9	tbnz	w9, #27, 0xfffff7f9eb20
   0x0000fffff7f9ea50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ea54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ea58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ea5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ea60:	540001c1	b.ne	0xfffff7f9ea98  // b.any
   0x0000fffff7f9ea64:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ea68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ea6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ea70:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ea74:	54000121	b.ne	0xfffff7f9ea98  // b.any
   0x0000fffff7f9ea78:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ea7c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9ea80:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ea84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ea88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ea8c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9ea90:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ea94:	14000030	b	0xfffff7f9eb54
   0x0000fffff7f9ea98:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ea9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9eaa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eaa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9eaa8:	54000120	b.eq	0xfffff7f9eacc  // b.none
   0x0000fffff7f9eaac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9eab0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9eab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eab8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9eabc:	54000321	b.ne	0xfffff7f9eb20  // b.any
   0x0000fffff7f9eac0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9eac4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9eac8:	14000002	b	0xfffff7f9ead0
   0x0000fffff7f9eacc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9ead0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ead4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ead8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eadc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9eae0:	54000120	b.eq	0xfffff7f9eb04  // b.none
   0x0000fffff7f9eae4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9eae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9eaec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eaf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9eaf4:	54000161	b.ne	0xfffff7f9eb20  // b.any
   0x0000fffff7f9eaf8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9eafc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9eb00:	14000002	b	0xfffff7f9eb08
   0x0000fffff7f9eb04:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9eb08:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9eb0c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9eb10:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9eb14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eb18:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9eb1c:	17ffffde	b	0xfffff7f9ea94
   0x0000fffff7f9eb20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9eb24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eb28:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eb2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eb30:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9eb34:	aa1403e4	mov	x4, x20
   0x0000fffff7f9eb38:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eb3c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9eb40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9eb44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9eb48:	d63f0200	blr	x16
   0x0000fffff7f9eb4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eb50:	54009f80	b.eq	0xfffff7f9ff40  // b.none
   0x0000fffff7f9eb54:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9eb58:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9eb5c:	540004a0	b.eq	0xfffff7f9ebf0  // b.none
   0x0000fffff7f9eb60:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9eb64:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9eb68:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9eb6c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9eb70:	54000400	b.eq	0xfffff7f9ebf0  // b.none
   0x0000fffff7f9eb74:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9eb78:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9eb7c:	36d801d1	tbz	w17, #27, 0xfffff7f9ebb4
   0x0000fffff7f9eb80:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9eb84:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9eb88:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9eb8c:	54000321	b.ne	0xfffff7f9ebf0  // b.any
   0x0000fffff7f9eb90:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9eb94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9eb98:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9eb9c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9eba0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9eba4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9eba8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9ebac:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9ebb0:	54000209	b.ls	0xfffff7f9ebf0  // b.plast
   0x0000fffff7f9ebb4:	36d8008d	tbz	w13, #27, 0xfffff7f9ebc4
   0x0000fffff7f9ebb8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9ebbc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9ebc0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9ebc4:	36d80091	tbz	w17, #27, 0xfffff7f9ebd4
   0x0000fffff7f9ebc8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ebcc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9ebd0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9ebd4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9ebd8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9ebdc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9ebe0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9ebe4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9ebe8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9ebec:	1400000e	b	0xfffff7f9ec24
   0x0000fffff7f9ebf0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ebf4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ebf8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ebfc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ec00:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f9ec04:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ec08:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ec0c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9ec10:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ec14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ec18:	d63f0200	blr	x16
   0x0000fffff7f9ec1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ec20:	54009940	b.eq	0xfffff7f9ff48  // b.none
   0x0000fffff7f9ec24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ec28:	37d806a9	tbnz	w9, #27, 0xfffff7f9ecfc
   0x0000fffff7f9ec2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ec30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ec34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ec38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ec3c:	540001c1	b.ne	0xfffff7f9ec74  // b.any
   0x0000fffff7f9ec40:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ec44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ec48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ec4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ec50:	54000121	b.ne	0xfffff7f9ec74  // b.any
   0x0000fffff7f9ec54:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ec58:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9ec5c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ec60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ec64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ec68:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9ec6c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ec70:	14000030	b	0xfffff7f9ed30
   0x0000fffff7f9ec74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ec78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ec7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ec80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ec84:	54000120	b.eq	0xfffff7f9eca8  // b.none
   0x0000fffff7f9ec88:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ec8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ec90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ec94:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ec98:	54000321	b.ne	0xfffff7f9ecfc  // b.any
   0x0000fffff7f9ec9c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9eca0:	9e620120	scvtf	d0, x9
   0x0000fffff7f9eca4:	14000002	b	0xfffff7f9ecac
   0x0000fffff7f9eca8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9ecac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ecb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ecb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ecb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ecbc:	54000120	b.eq	0xfffff7f9ece0  // b.none
   0x0000fffff7f9ecc0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ecc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ecc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eccc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ecd0:	54000161	b.ne	0xfffff7f9ecfc  // b.any
   0x0000fffff7f9ecd4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9ecd8:	9e620121	scvtf	d1, x9
   0x0000fffff7f9ecdc:	14000002	b	0xfffff7f9ece4
   0x0000fffff7f9ece0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9ece4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9ece8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9ecec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ecf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ecf4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ecf8:	17ffffde	b	0xfffff7f9ec70
   0x0000fffff7f9ecfc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ed00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ed04:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ed08:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ed0c:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f9ed10:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ed14:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ed18:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9ed1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ed20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ed24:	d63f0200	blr	x16
   0x0000fffff7f9ed28:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ed2c:	54009120	b.eq	0xfffff7f9ff50  // b.none
   0x0000fffff7f9ed30:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9ed34:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9ed38:	540004a0	b.eq	0xfffff7f9edcc  // b.none
   0x0000fffff7f9ed3c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9ed40:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9ed44:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9ed48:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9ed4c:	54000400	b.eq	0xfffff7f9edcc  // b.none
   0x0000fffff7f9ed50:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9ed54:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9ed58:	36d801d1	tbz	w17, #27, 0xfffff7f9ed90
   0x0000fffff7f9ed5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9ed60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9ed64:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9ed68:	54000321	b.ne	0xfffff7f9edcc  // b.any
   0x0000fffff7f9ed6c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9ed70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ed74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9ed78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9ed7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9ed80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9ed84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9ed88:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9ed8c:	54000209	b.ls	0xfffff7f9edcc  // b.plast
   0x0000fffff7f9ed90:	36d8008d	tbz	w13, #27, 0xfffff7f9eda0
   0x0000fffff7f9ed94:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9ed98:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9ed9c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9eda0:	36d80091	tbz	w17, #27, 0xfffff7f9edb0
   0x0000fffff7f9eda4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9eda8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9edac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9edb0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9edb4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9edb8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9edbc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9edc0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9edc4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9edc8:	1400000e	b	0xfffff7f9ee00
   0x0000fffff7f9edcc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9edd0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9edd4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9edd8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eddc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f9ede0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ede4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ede8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9edec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9edf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9edf4:	d63f0200	blr	x16
   0x0000fffff7f9edf8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9edfc:	54008ae0	b.eq	0xfffff7f9ff58  // b.none
   0x0000fffff7f9ee00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ee04:	37d806a9	tbnz	w9, #27, 0xfffff7f9eed8
   0x0000fffff7f9ee08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ee0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ee10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ee14:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ee18:	540001c1	b.ne	0xfffff7f9ee50  // b.any
   0x0000fffff7f9ee1c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ee20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ee24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ee28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ee2c:	54000121	b.ne	0xfffff7f9ee50  // b.any
   0x0000fffff7f9ee30:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ee34:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9ee38:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ee3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ee40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ee44:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9ee48:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ee4c:	14000030	b	0xfffff7f9ef0c
   0x0000fffff7f9ee50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ee54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ee58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ee5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ee60:	54000120	b.eq	0xfffff7f9ee84  // b.none
   0x0000fffff7f9ee64:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ee68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ee6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ee70:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ee74:	54000321	b.ne	0xfffff7f9eed8  // b.any
   0x0000fffff7f9ee78:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ee7c:	9e620120	scvtf	d0, x9
   0x0000fffff7f9ee80:	14000002	b	0xfffff7f9ee88
   0x0000fffff7f9ee84:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9ee88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ee8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ee90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ee94:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ee98:	54000120	b.eq	0xfffff7f9eebc  // b.none
   0x0000fffff7f9ee9c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9eea0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9eea4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eea8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9eeac:	54000161	b.ne	0xfffff7f9eed8  // b.any
   0x0000fffff7f9eeb0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9eeb4:	9e620121	scvtf	d1, x9
   0x0000fffff7f9eeb8:	14000002	b	0xfffff7f9eec0
   0x0000fffff7f9eebc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9eec0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9eec4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9eec8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9eecc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eed0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9eed4:	17ffffde	b	0xfffff7f9ee4c
   0x0000fffff7f9eed8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9eedc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eee0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eee4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eee8:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9eeec:	aa1403e4	mov	x4, x20
   0x0000fffff7f9eef0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eef4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9eef8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9eefc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ef00:	d63f0200	blr	x16
   0x0000fffff7f9ef04:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ef08:	540082c0	b.eq	0xfffff7f9ff60  // b.none
   0x0000fffff7f9ef0c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9ef10:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9ef14:	540004a0	b.eq	0xfffff7f9efa8  // b.none
   0x0000fffff7f9ef18:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9ef1c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9ef20:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9ef24:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9ef28:	54000400	b.eq	0xfffff7f9efa8  // b.none
   0x0000fffff7f9ef2c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9ef30:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9ef34:	36d801d1	tbz	w17, #27, 0xfffff7f9ef6c
   0x0000fffff7f9ef38:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9ef3c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9ef40:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9ef44:	54000321	b.ne	0xfffff7f9efa8  // b.any
   0x0000fffff7f9ef48:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9ef4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ef50:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9ef54:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9ef58:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9ef5c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9ef60:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9ef64:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9ef68:	54000209	b.ls	0xfffff7f9efa8  // b.plast
   0x0000fffff7f9ef6c:	36d8008d	tbz	w13, #27, 0xfffff7f9ef7c
   0x0000fffff7f9ef70:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9ef74:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9ef78:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9ef7c:	36d80091	tbz	w17, #27, 0xfffff7f9ef8c
   0x0000fffff7f9ef80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ef84:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9ef88:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9ef8c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9ef90:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9ef94:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9ef98:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9ef9c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9efa0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9efa4:	1400000e	b	0xfffff7f9efdc
   0x0000fffff7f9efa8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9efac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9efb0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9efb4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9efb8:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f9efbc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9efc0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9efc4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9efc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9efcc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9efd0:	d63f0200	blr	x16
   0x0000fffff7f9efd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9efd8:	54007c80	b.eq	0xfffff7f9ff68  // b.none
   0x0000fffff7f9efdc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9efe0:	37d806a9	tbnz	w9, #27, 0xfffff7f9f0b4
   0x0000fffff7f9efe4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9efe8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9efec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eff0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9eff4:	540001c1	b.ne	0xfffff7f9f02c  // b.any
   0x0000fffff7f9eff8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9effc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f004:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f008:	54000121	b.ne	0xfffff7f9f02c  // b.any
   0x0000fffff7f9f00c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f010:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9f014:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f018:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f01c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f020:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9f024:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f028:	14000030	b	0xfffff7f9f0e8
   0x0000fffff7f9f02c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f030:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f034:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f038:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f03c:	54000120	b.eq	0xfffff7f9f060  // b.none
   0x0000fffff7f9f040:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f044:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f04c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f050:	54000321	b.ne	0xfffff7f9f0b4  // b.any
   0x0000fffff7f9f054:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f058:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f05c:	14000002	b	0xfffff7f9f064
   0x0000fffff7f9f060:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9f064:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f068:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f06c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f070:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f074:	54000120	b.eq	0xfffff7f9f098  // b.none
   0x0000fffff7f9f078:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f07c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f080:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f084:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f088:	54000161	b.ne	0xfffff7f9f0b4  // b.any
   0x0000fffff7f9f08c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9f090:	9e620121	scvtf	d1, x9
   0x0000fffff7f9f094:	14000002	b	0xfffff7f9f09c
   0x0000fffff7f9f098:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9f09c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9f0a0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9f0a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f0a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f0ac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f0b0:	17ffffde	b	0xfffff7f9f028
   0x0000fffff7f9f0b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f0b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f0bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f0c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f0c4:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f9f0c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f0cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f0d0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9f0d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f0d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f0dc:	d63f0200	blr	x16
   0x0000fffff7f9f0e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f0e4:	54007460	b.eq	0xfffff7f9ff70  // b.none
   0x0000fffff7f9f0e8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9f0ec:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f0f0:	540004a0	b.eq	0xfffff7f9f184  // b.none
   0x0000fffff7f9f0f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9f0f8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9f0fc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9f100:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9f104:	54000400	b.eq	0xfffff7f9f184  // b.none
   0x0000fffff7f9f108:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9f10c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9f110:	36d801d1	tbz	w17, #27, 0xfffff7f9f148
   0x0000fffff7f9f114:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f118:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f11c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f120:	54000321	b.ne	0xfffff7f9f184  // b.any
   0x0000fffff7f9f124:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9f128:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f12c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f130:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f134:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f138:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f13c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f140:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f144:	54000209	b.ls	0xfffff7f9f184  // b.plast
   0x0000fffff7f9f148:	36d8008d	tbz	w13, #27, 0xfffff7f9f158
   0x0000fffff7f9f14c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f150:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f154:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f158:	36d80091	tbz	w17, #27, 0xfffff7f9f168
   0x0000fffff7f9f15c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f160:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f164:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f168:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9f16c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9f170:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9f174:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9f178:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9f17c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9f180:	1400000e	b	0xfffff7f9f1b8
   0x0000fffff7f9f184:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f188:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f18c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f190:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f194:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f9f198:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f19c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f1a0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9f1a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f1a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f1ac:	d63f0200	blr	x16
   0x0000fffff7f9f1b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f1b4:	54006e20	b.eq	0xfffff7f9ff78  // b.none
   0x0000fffff7f9f1b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f1bc:	37d806a9	tbnz	w9, #27, 0xfffff7f9f290
   0x0000fffff7f9f1c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f1c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f1c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f1cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f1d0:	540001c1	b.ne	0xfffff7f9f208  // b.any
   0x0000fffff7f9f1d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f1d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f1dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f1e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f1e4:	54000121	b.ne	0xfffff7f9f208  // b.any
   0x0000fffff7f9f1e8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f1ec:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9f1f0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f1f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f1f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f1fc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9f200:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f204:	14000030	b	0xfffff7f9f2c4
   0x0000fffff7f9f208:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f20c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f210:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f214:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f218:	54000120	b.eq	0xfffff7f9f23c  // b.none
   0x0000fffff7f9f21c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f220:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f224:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f228:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f22c:	54000321	b.ne	0xfffff7f9f290  // b.any
   0x0000fffff7f9f230:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f234:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f238:	14000002	b	0xfffff7f9f240
   0x0000fffff7f9f23c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9f240:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f244:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f248:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f24c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f250:	54000120	b.eq	0xfffff7f9f274  // b.none
   0x0000fffff7f9f254:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f258:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f25c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f260:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f264:	54000161	b.ne	0xfffff7f9f290  // b.any
   0x0000fffff7f9f268:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9f26c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9f270:	14000002	b	0xfffff7f9f278
   0x0000fffff7f9f274:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9f278:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9f27c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9f280:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f284:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f288:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f28c:	17ffffde	b	0xfffff7f9f204
   0x0000fffff7f9f290:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f294:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f298:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f29c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f2a0:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f9f2a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f2a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f2ac:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9f2b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f2b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f2b8:	d63f0200	blr	x16
   0x0000fffff7f9f2bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f2c0:	54006600	b.eq	0xfffff7f9ff80  // b.none
   0x0000fffff7f9f2c4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9f2c8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f2cc:	540004a0	b.eq	0xfffff7f9f360  // b.none
   0x0000fffff7f9f2d0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9f2d4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9f2d8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9f2dc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9f2e0:	54000400	b.eq	0xfffff7f9f360  // b.none
   0x0000fffff7f9f2e4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9f2e8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9f2ec:	36d801d1	tbz	w17, #27, 0xfffff7f9f324
   0x0000fffff7f9f2f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f2f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f2f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f2fc:	54000321	b.ne	0xfffff7f9f360  // b.any
   0x0000fffff7f9f300:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9f304:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f308:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f30c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f310:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f314:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f318:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f31c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f320:	54000209	b.ls	0xfffff7f9f360  // b.plast
   0x0000fffff7f9f324:	36d8008d	tbz	w13, #27, 0xfffff7f9f334
   0x0000fffff7f9f328:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f32c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f330:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f334:	36d80091	tbz	w17, #27, 0xfffff7f9f344
   0x0000fffff7f9f338:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f33c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f340:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f344:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9f348:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9f34c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9f350:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9f354:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9f358:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9f35c:	1400000e	b	0xfffff7f9f394
   0x0000fffff7f9f360:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f364:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f368:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f36c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f370:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f9f374:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f378:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f37c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9f380:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f384:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f388:	d63f0200	blr	x16
   0x0000fffff7f9f38c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f390:	54005fc0	b.eq	0xfffff7f9ff88  // b.none
   0x0000fffff7f9f394:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f398:	37d806a9	tbnz	w9, #27, 0xfffff7f9f46c
   0x0000fffff7f9f39c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f3a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f3a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f3a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f3ac:	540001c1	b.ne	0xfffff7f9f3e4  // b.any
   0x0000fffff7f9f3b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f3b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f3b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f3bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f3c0:	54000121	b.ne	0xfffff7f9f3e4  // b.any
   0x0000fffff7f9f3c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f3c8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9f3cc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f3d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f3d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f3d8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9f3dc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f3e0:	14000030	b	0xfffff7f9f4a0
   0x0000fffff7f9f3e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f3e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f3ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f3f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f3f4:	54000120	b.eq	0xfffff7f9f418  // b.none
   0x0000fffff7f9f3f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f3fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f404:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f408:	54000321	b.ne	0xfffff7f9f46c  // b.any
   0x0000fffff7f9f40c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f410:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f414:	14000002	b	0xfffff7f9f41c
   0x0000fffff7f9f418:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9f41c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f420:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f424:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f428:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f42c:	54000120	b.eq	0xfffff7f9f450  // b.none
   0x0000fffff7f9f430:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f434:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f438:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f43c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f440:	54000161	b.ne	0xfffff7f9f46c  // b.any
   0x0000fffff7f9f444:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9f448:	9e620121	scvtf	d1, x9
   0x0000fffff7f9f44c:	14000002	b	0xfffff7f9f454
   0x0000fffff7f9f450:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9f454:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9f458:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9f45c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f464:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f468:	17ffffde	b	0xfffff7f9f3e0
   0x0000fffff7f9f46c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f470:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f474:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f478:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f47c:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f9f480:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f484:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f488:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9f48c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f490:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f494:	d63f0200	blr	x16
   0x0000fffff7f9f498:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f49c:	540057a0	b.eq	0xfffff7f9ff90  // b.none
   0x0000fffff7f9f4a0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9f4a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f4a8:	540004a0	b.eq	0xfffff7f9f53c  // b.none
   0x0000fffff7f9f4ac:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9f4b0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9f4b4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9f4b8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9f4bc:	54000400	b.eq	0xfffff7f9f53c  // b.none
   0x0000fffff7f9f4c0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9f4c4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9f4c8:	36d801d1	tbz	w17, #27, 0xfffff7f9f500
   0x0000fffff7f9f4cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f4d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f4d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f4d8:	54000321	b.ne	0xfffff7f9f53c  // b.any
   0x0000fffff7f9f4dc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9f4e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f4e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f4e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f4ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f4f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f4f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f4f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f4fc:	54000209	b.ls	0xfffff7f9f53c  // b.plast
   0x0000fffff7f9f500:	36d8008d	tbz	w13, #27, 0xfffff7f9f510
   0x0000fffff7f9f504:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f508:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f50c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f510:	36d80091	tbz	w17, #27, 0xfffff7f9f520
   0x0000fffff7f9f514:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f518:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f51c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f520:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9f524:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9f528:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9f52c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9f530:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9f534:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9f538:	1400000e	b	0xfffff7f9f570
   0x0000fffff7f9f53c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f540:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f544:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f548:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f54c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f9f550:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f554:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f558:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9f55c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f560:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f564:	d63f0200	blr	x16
   0x0000fffff7f9f568:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f56c:	54005160	b.eq	0xfffff7f9ff98  // b.none
   0x0000fffff7f9f570:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f574:	37d806a9	tbnz	w9, #27, 0xfffff7f9f648
   0x0000fffff7f9f578:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f57c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f580:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f584:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f588:	540001c1	b.ne	0xfffff7f9f5c0  // b.any
   0x0000fffff7f9f58c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f590:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f594:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f598:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f59c:	54000121	b.ne	0xfffff7f9f5c0  // b.any
   0x0000fffff7f9f5a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f5a4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9f5a8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f5ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f5b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f5b4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9f5b8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f5bc:	14000030	b	0xfffff7f9f67c
   0x0000fffff7f9f5c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f5c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f5c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f5cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f5d0:	54000120	b.eq	0xfffff7f9f5f4  // b.none
   0x0000fffff7f9f5d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f5d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f5dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f5e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f5e4:	54000321	b.ne	0xfffff7f9f648  // b.any
   0x0000fffff7f9f5e8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f5ec:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f5f0:	14000002	b	0xfffff7f9f5f8
   0x0000fffff7f9f5f4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9f5f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f5fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f604:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f608:	54000120	b.eq	0xfffff7f9f62c  // b.none
   0x0000fffff7f9f60c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f610:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f618:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f61c:	54000161	b.ne	0xfffff7f9f648  // b.any
   0x0000fffff7f9f620:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9f624:	9e620121	scvtf	d1, x9
   0x0000fffff7f9f628:	14000002	b	0xfffff7f9f630
   0x0000fffff7f9f62c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9f630:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9f634:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9f638:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f63c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f640:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f644:	17ffffde	b	0xfffff7f9f5bc
   0x0000fffff7f9f648:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f64c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f650:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f654:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f658:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f9f65c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f660:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f664:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9f668:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f66c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f670:	d63f0200	blr	x16
   0x0000fffff7f9f674:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f678:	54004940	b.eq	0xfffff7f9ffa0  // b.none
   0x0000fffff7f9f67c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9f680:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f684:	540004a0	b.eq	0xfffff7f9f718  // b.none
   0x0000fffff7f9f688:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9f68c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9f690:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9f694:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9f698:	54000400	b.eq	0xfffff7f9f718  // b.none
   0x0000fffff7f9f69c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9f6a0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9f6a4:	36d801d1	tbz	w17, #27, 0xfffff7f9f6dc
   0x0000fffff7f9f6a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f6ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f6b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f6b4:	54000321	b.ne	0xfffff7f9f718  // b.any
   0x0000fffff7f9f6b8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9f6bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f6c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f6c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f6c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f6cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f6d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f6d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f6d8:	54000209	b.ls	0xfffff7f9f718  // b.plast
   0x0000fffff7f9f6dc:	36d8008d	tbz	w13, #27, 0xfffff7f9f6ec
   0x0000fffff7f9f6e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f6e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f6e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f6ec:	36d80091	tbz	w17, #27, 0xfffff7f9f6fc
   0x0000fffff7f9f6f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f6f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f6f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f6fc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9f700:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9f704:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9f708:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9f70c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9f710:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9f714:	1400000e	b	0xfffff7f9f74c
   0x0000fffff7f9f718:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f71c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f720:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f724:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f728:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f9f72c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f730:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f734:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9f738:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f73c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f740:	d63f0200	blr	x16
   0x0000fffff7f9f744:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f748:	54004300	b.eq	0xfffff7f9ffa8  // b.none
   0x0000fffff7f9f74c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f750:	37d806a9	tbnz	w9, #27, 0xfffff7f9f824
   0x0000fffff7f9f754:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f758:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f75c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f760:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f764:	540001c1	b.ne	0xfffff7f9f79c  // b.any
   0x0000fffff7f9f768:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f76c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f770:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f774:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f778:	54000121	b.ne	0xfffff7f9f79c  // b.any
   0x0000fffff7f9f77c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f780:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9f784:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f788:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f78c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f790:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9f794:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f798:	14000030	b	0xfffff7f9f858
   0x0000fffff7f9f79c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f7a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f7a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f7a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f7ac:	54000120	b.eq	0xfffff7f9f7d0  // b.none
   0x0000fffff7f9f7b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f7b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f7b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f7bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f7c0:	54000321	b.ne	0xfffff7f9f824  // b.any
   0x0000fffff7f9f7c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f7c8:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f7cc:	14000002	b	0xfffff7f9f7d4
   0x0000fffff7f9f7d0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9f7d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f7d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f7dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f7e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f7e4:	54000120	b.eq	0xfffff7f9f808  // b.none
   0x0000fffff7f9f7e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f7ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f7f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f7f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f7f8:	54000161	b.ne	0xfffff7f9f824  // b.any
   0x0000fffff7f9f7fc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9f800:	9e620121	scvtf	d1, x9
   0x0000fffff7f9f804:	14000002	b	0xfffff7f9f80c
   0x0000fffff7f9f808:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9f80c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9f810:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9f814:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f818:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f81c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f820:	17ffffde	b	0xfffff7f9f798
   0x0000fffff7f9f824:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f828:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f82c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f830:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f834:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f9f838:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f83c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f840:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9f844:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f848:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f84c:	d63f0200	blr	x16
   0x0000fffff7f9f850:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f854:	54003ae0	b.eq	0xfffff7f9ffb0  // b.none
   0x0000fffff7f9f858:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9f85c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f860:	540004a0	b.eq	0xfffff7f9f8f4  // b.none
   0x0000fffff7f9f864:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9f868:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9f86c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9f870:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9f874:	54000400	b.eq	0xfffff7f9f8f4  // b.none
   0x0000fffff7f9f878:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9f87c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9f880:	36d801d1	tbz	w17, #27, 0xfffff7f9f8b8
   0x0000fffff7f9f884:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f888:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f88c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f890:	54000321	b.ne	0xfffff7f9f8f4  // b.any
   0x0000fffff7f9f894:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9f898:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f89c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f8a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f8a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f8a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f8ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f8b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f8b4:	54000209	b.ls	0xfffff7f9f8f4  // b.plast
   0x0000fffff7f9f8b8:	36d8008d	tbz	w13, #27, 0xfffff7f9f8c8
   0x0000fffff7f9f8bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f8c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f8c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f8c8:	36d80091	tbz	w17, #27, 0xfffff7f9f8d8
   0x0000fffff7f9f8cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f8d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f8d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f8d8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9f8dc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9f8e0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9f8e4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9f8e8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9f8ec:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9f8f0:	1400000e	b	0xfffff7f9f928
   0x0000fffff7f9f8f4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f8f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f8fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f900:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f904:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f9f908:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f90c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f910:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9f914:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f918:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f91c:	d63f0200	blr	x16
   0x0000fffff7f9f920:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f924:	540034a0	b.eq	0xfffff7f9ffb8  // b.none
   0x0000fffff7f9f928:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f92c:	37d806a9	tbnz	w9, #27, 0xfffff7f9fa00
   0x0000fffff7f9f930:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f93c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f940:	540001c1	b.ne	0xfffff7f9f978  // b.any
   0x0000fffff7f9f944:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f94c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f950:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f954:	54000121	b.ne	0xfffff7f9f978  // b.any
   0x0000fffff7f9f958:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f95c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9f960:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f96c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9f970:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f974:	14000030	b	0xfffff7f9fa34
   0x0000fffff7f9f978:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f97c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f984:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f988:	54000120	b.eq	0xfffff7f9f9ac  // b.none
   0x0000fffff7f9f98c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f990:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f998:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f99c:	54000321	b.ne	0xfffff7f9fa00  // b.any
   0x0000fffff7f9f9a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f9a4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f9a8:	14000002	b	0xfffff7f9f9b0
   0x0000fffff7f9f9ac:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9f9b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f9b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f9b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f9bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f9c0:	54000120	b.eq	0xfffff7f9f9e4  // b.none
   0x0000fffff7f9f9c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9f9c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f9cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f9d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f9d4:	54000161	b.ne	0xfffff7f9fa00  // b.any
   0x0000fffff7f9f9d8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9f9dc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9f9e0:	14000002	b	0xfffff7f9f9e8
   0x0000fffff7f9f9e4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9f9e8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9f9ec:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9f9f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f9f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f9f8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9f9fc:	17ffffde	b	0xfffff7f9f974
   0x0000fffff7f9fa00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9fa04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fa08:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fa0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fa10:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f9fa14:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fa18:	aa1603e5	mov	x5, x22
   0x0000fffff7f9fa1c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9fa20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9fa24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fa28:	d63f0200	blr	x16
   0x0000fffff7f9fa2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9fa30:	54002c80	b.eq	0xfffff7f9ffc0  // b.none
   0x0000fffff7f9fa34:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9fa38:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9fa3c:	540004a0	b.eq	0xfffff7f9fad0  // b.none
   0x0000fffff7f9fa40:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9fa44:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9fa48:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9fa4c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9fa50:	54000400	b.eq	0xfffff7f9fad0  // b.none
   0x0000fffff7f9fa54:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9fa58:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9fa5c:	36d801d1	tbz	w17, #27, 0xfffff7f9fa94
   0x0000fffff7f9fa60:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9fa64:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9fa68:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9fa6c:	54000321	b.ne	0xfffff7f9fad0  // b.any
   0x0000fffff7f9fa70:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9fa74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9fa78:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9fa7c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9fa80:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9fa84:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9fa88:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9fa8c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9fa90:	54000209	b.ls	0xfffff7f9fad0  // b.plast
   0x0000fffff7f9fa94:	36d8008d	tbz	w13, #27, 0xfffff7f9faa4
   0x0000fffff7f9fa98:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9fa9c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9faa0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9faa4:	36d80091	tbz	w17, #27, 0xfffff7f9fab4
   0x0000fffff7f9faa8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9faac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9fab0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9fab4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9fab8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9fabc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9fac0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9fac4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9fac8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9facc:	1400000e	b	0xfffff7f9fb04
   0x0000fffff7f9fad0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9fad4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fad8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fadc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fae0:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f9fae4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fae8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9faec:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9faf0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9faf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9faf8:	d63f0200	blr	x16
   0x0000fffff7f9fafc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9fb00:	54002640	b.eq	0xfffff7f9ffc8  // b.none
   0x0000fffff7f9fb04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9fb08:	37d806a9	tbnz	w9, #27, 0xfffff7f9fbdc
   0x0000fffff7f9fb0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9fb10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fb14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fb18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fb1c:	540001c1	b.ne	0xfffff7f9fb54  // b.any
   0x0000fffff7f9fb20:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9fb24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fb28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fb2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fb30:	54000121	b.ne	0xfffff7f9fb54  // b.any
   0x0000fffff7f9fb34:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9fb38:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9fb3c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9fb40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fb44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fb48:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9fb4c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9fb50:	14000030	b	0xfffff7f9fc10
   0x0000fffff7f9fb54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9fb58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9fb5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fb60:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fb64:	54000120	b.eq	0xfffff7f9fb88  // b.none
   0x0000fffff7f9fb68:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9fb6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fb70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fb74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fb78:	54000321	b.ne	0xfffff7f9fbdc  // b.any
   0x0000fffff7f9fb7c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9fb80:	9e620120	scvtf	d0, x9
   0x0000fffff7f9fb84:	14000002	b	0xfffff7f9fb8c
   0x0000fffff7f9fb88:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9fb8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9fb90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9fb94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fb98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fb9c:	54000120	b.eq	0xfffff7f9fbc0  // b.none
   0x0000fffff7f9fba0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9fba4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fba8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fbac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fbb0:	54000161	b.ne	0xfffff7f9fbdc  // b.any
   0x0000fffff7f9fbb4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9fbb8:	9e620121	scvtf	d1, x9
   0x0000fffff7f9fbbc:	14000002	b	0xfffff7f9fbc4
   0x0000fffff7f9fbc0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9fbc4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9fbc8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9fbcc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9fbd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fbd4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9fbd8:	17ffffde	b	0xfffff7f9fb50
   0x0000fffff7f9fbdc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9fbe0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fbe4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fbe8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fbec:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f9fbf0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fbf4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9fbf8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9fbfc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9fc00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fc04:	d63f0200	blr	x16
   0x0000fffff7f9fc08:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9fc0c:	54001e20	b.eq	0xfffff7f9ffd0  // b.none
   0x0000fffff7f9fc10:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9fc14:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9fc18:	540004a0	b.eq	0xfffff7f9fcac  // b.none
   0x0000fffff7f9fc1c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9fc20:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9fc24:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9fc28:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9fc2c:	54000400	b.eq	0xfffff7f9fcac  // b.none
   0x0000fffff7f9fc30:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9fc34:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9fc38:	36d801d1	tbz	w17, #27, 0xfffff7f9fc70
   0x0000fffff7f9fc3c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9fc40:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9fc44:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9fc48:	54000321	b.ne	0xfffff7f9fcac  // b.any
   0x0000fffff7f9fc4c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9fc50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9fc54:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9fc58:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9fc5c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9fc60:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9fc64:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9fc68:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9fc6c:	54000209	b.ls	0xfffff7f9fcac  // b.plast
   0x0000fffff7f9fc70:	36d8008d	tbz	w13, #27, 0xfffff7f9fc80
   0x0000fffff7f9fc74:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9fc78:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9fc7c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9fc80:	36d80091	tbz	w17, #27, 0xfffff7f9fc90
   0x0000fffff7f9fc84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9fc88:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9fc8c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9fc90:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9fc94:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9fc98:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9fc9c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9fca0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9fca4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9fca8:	1400000e	b	0xfffff7f9fce0
   0x0000fffff7f9fcac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9fcb0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fcb4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fcb8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fcbc:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f9fcc0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fcc4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9fcc8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9fccc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9fcd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fcd4:	d63f0200	blr	x16
   0x0000fffff7f9fcd8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9fcdc:	540017e0	b.eq	0xfffff7f9ffd8  // b.none
   0x0000fffff7f9fce0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9fce4:	37d806a9	tbnz	w9, #27, 0xfffff7f9fdb8
   0x0000fffff7f9fce8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9fcec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fcf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fcf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fcf8:	540001c1	b.ne	0xfffff7f9fd30  // b.any
   0x0000fffff7f9fcfc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9fd00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fd04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fd08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fd0c:	54000121	b.ne	0xfffff7f9fd30  // b.any
   0x0000fffff7f9fd10:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9fd14:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9fd18:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9fd1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fd20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fd24:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9fd28:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9fd2c:	14000030	b	0xfffff7f9fdec
   0x0000fffff7f9fd30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9fd34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9fd38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fd3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fd40:	54000120	b.eq	0xfffff7f9fd64  // b.none
   0x0000fffff7f9fd44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9fd48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fd4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fd50:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fd54:	54000321	b.ne	0xfffff7f9fdb8  // b.any
   0x0000fffff7f9fd58:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9fd5c:	9e620120	scvtf	d0, x9
   0x0000fffff7f9fd60:	14000002	b	0xfffff7f9fd68
   0x0000fffff7f9fd64:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9fd68:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9fd6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9fd70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fd74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fd78:	54000120	b.eq	0xfffff7f9fd9c  // b.none
   0x0000fffff7f9fd7c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9fd80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fd84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fd88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fd8c:	54000161	b.ne	0xfffff7f9fdb8  // b.any
   0x0000fffff7f9fd90:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9fd94:	9e620121	scvtf	d1, x9
   0x0000fffff7f9fd98:	14000002	b	0xfffff7f9fda0
   0x0000fffff7f9fd9c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9fda0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9fda4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9fda8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9fdac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fdb0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9fdb4:	17ffffde	b	0xfffff7f9fd2c
   0x0000fffff7f9fdb8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9fdbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fdc0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fdc4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fdc8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f9fdcc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fdd0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9fdd4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9fdd8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9fddc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fde0:	d63f0200	blr	x16
   0x0000fffff7f9fde4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9fde8:	54000fc0	b.eq	0xfffff7f9ffe0  // b.none
   0x0000fffff7f9fdec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9fdf0:	37d80269	tbnz	w9, #27, 0xfffff7f9fe3c
   0x0000fffff7f9fdf4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9fdf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fdfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fe00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fe04:	540001c1	b.ne	0xfffff7f9fe3c  // b.any
   0x0000fffff7f9fe08:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9fe0c:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f9fe10:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f9fe14:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f9fe18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fe1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fe20:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f9fe24:	aa0b03e9	mov	x9, x11
   0x0000fffff7f9fe28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fe2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fe30:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f9fe34:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f9fe38:	1400000e	b	0xfffff7f9fe70
   0x0000fffff7f9fe3c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9fe40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fe44:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fe48:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fe4c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f9fe50:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fe54:	aa1603e5	mov	x5, x22
   0x0000fffff7f9fe58:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7f9fe5c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9fe60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fe64:	d63f0200	blr	x16
   0x0000fffff7f9fe68:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9fe6c:	54000be0	b.eq	0xfffff7f9ffe8  // b.none
   0x0000fffff7f9fe70:	17fff8d2	b	0xfffff7f9e1b8
   0x0000fffff7f9fe74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9fe78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fe7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fe80:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fe84:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f9fe88:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fe8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9fe90:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7f9fe94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9fe98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fe9c:	d63f0200	blr	x16
   0x0000fffff7f9fea0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9fea4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9fea8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9feac:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9feb0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f9feb4:	d65f03c0	ret
   0x0000fffff7f9feb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9febc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fec0:	b900028a	str	w10, [x20]
   0x0000fffff7f9fec4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9fec8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9fecc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9fed0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9fed4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9fed8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f9fedc:	d65f03c0	ret
   0x0000fffff7f9fee0:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f9fee4:	17fffff5	b	0xfffff7f9feb8
   0x0000fffff7f9fee8:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f9feec:	17fffff3	b	0xfffff7f9feb8
   0x0000fffff7f9fef0:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f9fef4:	17fffff1	b	0xfffff7f9feb8
   0x0000fffff7f9fef8:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f9fefc:	17ffffef	b	0xfffff7f9feb8
   0x0000fffff7f9ff00:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f9ff04:	17ffffed	b	0xfffff7f9feb8
   0x0000fffff7f9ff08:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f9ff0c:	17ffffeb	b	0xfffff7f9feb8
   0x0000fffff7f9ff10:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f9ff14:	17ffffe9	b	0xfffff7f9feb8
   0x0000fffff7f9ff18:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f9ff1c:	17ffffe7	b	0xfffff7f9feb8
   0x0000fffff7f9ff20:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f9ff24:	17ffffe5	b	0xfffff7f9feb8
   0x0000fffff7f9ff28:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f9ff2c:	17ffffe3	b	0xfffff7f9feb8
   0x0000fffff7f9ff30:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f9ff34:	17ffffe1	b	0xfffff7f9feb8
   0x0000fffff7f9ff38:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f9ff3c:	17ffffdf	b	0xfffff7f9feb8
   0x0000fffff7f9ff40:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f9ff44:	17ffffdd	b	0xfffff7f9feb8
   0x0000fffff7f9ff48:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f9ff4c:	17ffffdb	b	0xfffff7f9feb8
   0x0000fffff7f9ff50:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f9ff54:	17ffffd9	b	0xfffff7f9feb8
   0x0000fffff7f9ff58:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f9ff5c:	17ffffd7	b	0xfffff7f9feb8
   0x0000fffff7f9ff60:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f9ff64:	17ffffd5	b	0xfffff7f9feb8
   0x0000fffff7f9ff68:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f9ff6c:	17ffffd3	b	0xfffff7f9feb8
   0x0000fffff7f9ff70:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f9ff74:	17ffffd1	b	0xfffff7f9feb8
   0x0000fffff7f9ff78:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f9ff7c:	17ffffcf	b	0xfffff7f9feb8
   0x0000fffff7f9ff80:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f9ff84:	17ffffcd	b	0xfffff7f9feb8
   0x0000fffff7f9ff88:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f9ff8c:	17ffffcb	b	0xfffff7f9feb8
   0x0000fffff7f9ff90:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f9ff94:	17ffffc9	b	0xfffff7f9feb8
   0x0000fffff7f9ff98:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f9ff9c:	17ffffc7	b	0xfffff7f9feb8
   0x0000fffff7f9ffa0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f9ffa4:	17ffffc5	b	0xfffff7f9feb8
   0x0000fffff7f9ffa8:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f9ffac:	17ffffc3	b	0xfffff7f9feb8
   0x0000fffff7f9ffb0:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f9ffb4:	17ffffc1	b	0xfffff7f9feb8
   0x0000fffff7f9ffb8:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f9ffbc:	17ffffbf	b	0xfffff7f9feb8
   0x0000fffff7f9ffc0:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f9ffc4:	17ffffbd	b	0xfffff7f9feb8
   0x0000fffff7f9ffc8:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f9ffcc:	17ffffbb	b	0xfffff7f9feb8
   0x0000fffff7f9ffd0:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f9ffd4:	17ffffb9	b	0xfffff7f9feb8
   0x0000fffff7f9ffd8:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f9ffdc:	17ffffb7	b	0xfffff7f9feb8
   0x0000fffff7f9ffe0:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f9ffe4:	17ffffb5	b	0xfffff7f9feb8
   0x0000fffff7f9ffe8:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f9ffec:	17ffffb3	b	0xfffff7f9feb8
   0x0000fffff7f9fff0:	00000000	udf	#0
   0x0000fffff7f9fff4:	00000000	udf	#0
   0x0000fffff7f9fff8:	00000000	udf	#0
   0x0000fffff7f9fffc:	00000000	udf	#0
End of assembler dump.
