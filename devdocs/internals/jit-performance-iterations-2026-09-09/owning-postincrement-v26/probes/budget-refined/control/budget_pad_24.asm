Dump of assembler code from 0xfffff7f8e000 to 0xfffff7f90000:
   0x0000fffff7f8e000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f8e004:	910003fd	mov	x29, sp
   0x0000fffff7f8e008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8e00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f8e010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f8e014:	aa0003f3	mov	x19, x0
   0x0000fffff7f8e018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8e01c:	aa0203f5	mov	x21, x2
   0x0000fffff7f8e020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f8e024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f8e028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8e02c:	f90003e9	str	x9, [sp]
   0x0000fffff7f8e030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f8e034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f8e038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8e03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f8e040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e044:	d63f0200	blr	x16
   0x0000fffff7f8e048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8e04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f8e050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f8e054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f8e058:	14000001	b	0xfffff7f8e05c
   0x0000fffff7f8e05c:	14000001	b	0xfffff7f8e060
   0x0000fffff7f8e060:	14000001	b	0xfffff7f8e064
   0x0000fffff7f8e064:	14000001	b	0xfffff7f8e068
   0x0000fffff7f8e068:	14000001	b	0xfffff7f8e06c
   0x0000fffff7f8e06c:	14000001	b	0xfffff7f8e070
   0x0000fffff7f8e070:	14000001	b	0xfffff7f8e074
   0x0000fffff7f8e074:	14000001	b	0xfffff7f8e078
   0x0000fffff7f8e078:	14000001	b	0xfffff7f8e07c
   0x0000fffff7f8e07c:	14000001	b	0xfffff7f8e080
   0x0000fffff7f8e080:	14000001	b	0xfffff7f8e084
   0x0000fffff7f8e084:	14000001	b	0xfffff7f8e088
   0x0000fffff7f8e088:	14000001	b	0xfffff7f8e08c
   0x0000fffff7f8e08c:	14000001	b	0xfffff7f8e090
   0x0000fffff7f8e090:	14000001	b	0xfffff7f8e094
   0x0000fffff7f8e094:	14000001	b	0xfffff7f8e098
   0x0000fffff7f8e098:	14000001	b	0xfffff7f8e09c
   0x0000fffff7f8e09c:	14000001	b	0xfffff7f8e0a0
   0x0000fffff7f8e0a0:	14000001	b	0xfffff7f8e0a4
   0x0000fffff7f8e0a4:	14000001	b	0xfffff7f8e0a8
   0x0000fffff7f8e0a8:	14000001	b	0xfffff7f8e0ac
   0x0000fffff7f8e0ac:	14000001	b	0xfffff7f8e0b0
   0x0000fffff7f8e0b0:	14000001	b	0xfffff7f8e0b4
   0x0000fffff7f8e0b4:	14000001	b	0xfffff7f8e0b8
   0x0000fffff7f8e0b8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8e0bc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8e0c0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f8e0c4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f8e0c8:	36d80211	tbz	w17, #27, 0xfffff7f8e108
   0x0000fffff7f8e0cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8e0d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8e0d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8e0d8:	540001e1	b.ne	0xfffff7f8e114  // b.any
   0x0000fffff7f8e0dc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f8e0e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e0e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8e0e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8e0ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8e0f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8e0f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8e0f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8e0fc:	540000c9	b.ls	0xfffff7f8e114  // b.plast
   0x0000fffff7f8e100:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8e104:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8e108:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f8e10c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f8e110:	1400000e	b	0xfffff7f8e148
   0x0000fffff7f8e114:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8e118:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e11c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e120:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e124:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f8e128:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e12c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e130:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f8e134:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8e138:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e13c:	d63f0200	blr	x16
   0x0000fffff7f8e140:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e144:	5400e940	b.eq	0xfffff7f8fe6c  // b.none
   0x0000fffff7f8e148:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8e14c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8e150:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f8e154:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f8e158:	36d80211	tbz	w17, #27, 0xfffff7f8e198
   0x0000fffff7f8e15c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8e160:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8e164:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8e168:	540001e1	b.ne	0xfffff7f8e1a4  // b.any
   0x0000fffff7f8e16c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f8e170:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e174:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8e178:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8e17c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8e180:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8e184:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8e188:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8e18c:	540000c9	b.ls	0xfffff7f8e1a4  // b.plast
   0x0000fffff7f8e190:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8e194:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8e198:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f8e19c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f8e1a0:	1400000e	b	0xfffff7f8e1d8
   0x0000fffff7f8e1a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8e1a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e1ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e1b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e1b4:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f8e1b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e1bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e1c0:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f8e1c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8e1c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e1cc:	d63f0200	blr	x16
   0x0000fffff7f8e1d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e1d4:	5400e500	b.eq	0xfffff7f8fe74  // b.none
   0x0000fffff7f8e1d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8e1dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e1e0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e1e4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e1e8:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f8e1ec:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e1f0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e1f4:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7f8e1f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8e1fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e200:	d63f0200	blr	x16
   0x0000fffff7f8e204:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e208:	5400e3a0	b.eq	0xfffff7f8fe7c  // b.none
   0x0000fffff7f8e20c:	f100041f	cmp	x0, #0x1
   0x0000fffff7f8e210:	5400df80	b.eq	0xfffff7f8fe00  // b.none
   0x0000fffff7f8e214:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8e218:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f8e21c:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f8e220:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f8e224:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8e228:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f8e22c:	36d801d1	tbz	w17, #27, 0xfffff7f8e264
   0x0000fffff7f8e230:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8e234:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8e238:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8e23c:	54000281	b.ne	0xfffff7f8e28c  // b.any
   0x0000fffff7f8e240:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8e244:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e248:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8e24c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8e250:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8e254:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8e258:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8e25c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8e260:	54000169	b.ls	0xfffff7f8e28c  // b.plast
   0x0000fffff7f8e264:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8e268:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8e26c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8e270:	36d80091	tbz	w17, #27, 0xfffff7f8e280
   0x0000fffff7f8e274:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e278:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8e27c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8e280:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8e284:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8e288:	1400000e	b	0xfffff7f8e2c0
   0x0000fffff7f8e28c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8e290:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e294:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e298:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e29c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f8e2a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e2a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e2a8:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f8e2ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8e2b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e2b4:	d63f0200	blr	x16
   0x0000fffff7f8e2b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e2bc:	5400de40	b.eq	0xfffff7f8fe84  // b.none
   0x0000fffff7f8e2c0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f8e2c4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8e2c8:	540003a0	b.eq	0xfffff7f8e33c  // b.none
   0x0000fffff7f8e2cc:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f8e2d0:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f8e2d4:	b9400171	ldr	w17, [x11]
   0x0000fffff7f8e2d8:	36d801d1	tbz	w17, #27, 0xfffff7f8e310
   0x0000fffff7f8e2dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8e2e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8e2e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8e2e8:	540002a1	b.ne	0xfffff7f8e33c  // b.any
   0x0000fffff7f8e2ec:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f8e2f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e2f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8e2f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8e2fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8e300:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8e304:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8e308:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8e30c:	54000189	b.ls	0xfffff7f8e33c  // b.plast
   0x0000fffff7f8e310:	36d8008d	tbz	w13, #27, 0xfffff7f8e320
   0x0000fffff7f8e314:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8e318:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8e31c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8e320:	36d80091	tbz	w17, #27, 0xfffff7f8e330
   0x0000fffff7f8e324:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e328:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8e32c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8e330:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f8e334:	b900016d	str	w13, [x11]
   0x0000fffff7f8e338:	1400000e	b	0xfffff7f8e370
   0x0000fffff7f8e33c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8e340:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e344:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e348:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e34c:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f8e350:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e354:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e358:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7f8e35c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8e360:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e364:	d63f0200	blr	x16
   0x0000fffff7f8e368:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e36c:	5400d900	b.eq	0xfffff7f8fe8c  // b.none
   0x0000fffff7f8e370:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8e374:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8e378:	540004a0	b.eq	0xfffff7f8e40c  // b.none
   0x0000fffff7f8e37c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8e380:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8e384:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8e388:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8e38c:	54000400	b.eq	0xfffff7f8e40c  // b.none
   0x0000fffff7f8e390:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8e394:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8e398:	36d801d1	tbz	w17, #27, 0xfffff7f8e3d0
   0x0000fffff7f8e39c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8e3a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8e3a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8e3a8:	54000321	b.ne	0xfffff7f8e40c  // b.any
   0x0000fffff7f8e3ac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8e3b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e3b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8e3b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8e3bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8e3c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8e3c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8e3c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8e3cc:	54000209	b.ls	0xfffff7f8e40c  // b.plast
   0x0000fffff7f8e3d0:	36d8008d	tbz	w13, #27, 0xfffff7f8e3e0
   0x0000fffff7f8e3d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8e3d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8e3dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8e3e0:	36d80091	tbz	w17, #27, 0xfffff7f8e3f0
   0x0000fffff7f8e3e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e3e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8e3ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8e3f0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8e3f4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8e3f8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8e3fc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8e400:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8e404:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8e408:	1400000e	b	0xfffff7f8e440
   0x0000fffff7f8e40c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8e410:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e414:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e418:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e41c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f8e420:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e424:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e428:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8e42c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8e430:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e434:	d63f0200	blr	x16
   0x0000fffff7f8e438:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e43c:	5400d2c0	b.eq	0xfffff7f8fe94  // b.none
   0x0000fffff7f8e440:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e444:	37d806a9	tbnz	w9, #27, 0xfffff7f8e518
   0x0000fffff7f8e448:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e44c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e450:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e454:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e458:	540001c1	b.ne	0xfffff7f8e490  // b.any
   0x0000fffff7f8e45c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e460:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e464:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e468:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e46c:	54000121	b.ne	0xfffff7f8e490  // b.any
   0x0000fffff7f8e470:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8e474:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8e478:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8e47c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e480:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e484:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8e488:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8e48c:	14000030	b	0xfffff7f8e54c
   0x0000fffff7f8e490:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e494:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8e498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e49c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e4a0:	54000120	b.eq	0xfffff7f8e4c4  // b.none
   0x0000fffff7f8e4a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e4a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e4ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e4b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e4b4:	54000321	b.ne	0xfffff7f8e518  // b.any
   0x0000fffff7f8e4b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8e4bc:	9e620120	scvtf	d0, x9
   0x0000fffff7f8e4c0:	14000002	b	0xfffff7f8e4c8
   0x0000fffff7f8e4c4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8e4c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e4cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8e4d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e4d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e4d8:	54000120	b.eq	0xfffff7f8e4fc  // b.none
   0x0000fffff7f8e4dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e4e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e4e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e4e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e4ec:	54000161	b.ne	0xfffff7f8e518  // b.any
   0x0000fffff7f8e4f0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8e4f4:	9e620121	scvtf	d1, x9
   0x0000fffff7f8e4f8:	14000002	b	0xfffff7f8e500
   0x0000fffff7f8e4fc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8e500:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8e504:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8e508:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8e50c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e510:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8e514:	17ffffde	b	0xfffff7f8e48c
   0x0000fffff7f8e518:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8e51c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e520:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e524:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e528:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f8e52c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e530:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e534:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8e538:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8e53c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e540:	d63f0200	blr	x16
   0x0000fffff7f8e544:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e548:	5400caa0	b.eq	0xfffff7f8fe9c  // b.none
   0x0000fffff7f8e54c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8e550:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8e554:	540004a0	b.eq	0xfffff7f8e5e8  // b.none
   0x0000fffff7f8e558:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8e55c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8e560:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8e564:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8e568:	54000400	b.eq	0xfffff7f8e5e8  // b.none
   0x0000fffff7f8e56c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8e570:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8e574:	36d801d1	tbz	w17, #27, 0xfffff7f8e5ac
   0x0000fffff7f8e578:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8e57c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8e580:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8e584:	54000321	b.ne	0xfffff7f8e5e8  // b.any
   0x0000fffff7f8e588:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8e58c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e590:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8e594:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8e598:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8e59c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8e5a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8e5a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8e5a8:	54000209	b.ls	0xfffff7f8e5e8  // b.plast
   0x0000fffff7f8e5ac:	36d8008d	tbz	w13, #27, 0xfffff7f8e5bc
   0x0000fffff7f8e5b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8e5b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8e5b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8e5bc:	36d80091	tbz	w17, #27, 0xfffff7f8e5cc
   0x0000fffff7f8e5c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e5c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8e5c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8e5cc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8e5d0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8e5d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8e5d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8e5dc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8e5e0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8e5e4:	1400000e	b	0xfffff7f8e61c
   0x0000fffff7f8e5e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8e5ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e5f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e5f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e5f8:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f8e5fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e600:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e604:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8e608:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8e60c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e610:	d63f0200	blr	x16
   0x0000fffff7f8e614:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e618:	5400c460	b.eq	0xfffff7f8fea4  // b.none
   0x0000fffff7f8e61c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e620:	37d806a9	tbnz	w9, #27, 0xfffff7f8e6f4
   0x0000fffff7f8e624:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e62c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e630:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e634:	540001c1	b.ne	0xfffff7f8e66c  // b.any
   0x0000fffff7f8e638:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e648:	54000121	b.ne	0xfffff7f8e66c  // b.any
   0x0000fffff7f8e64c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8e650:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8e654:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8e658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e65c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e660:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8e664:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8e668:	14000030	b	0xfffff7f8e728
   0x0000fffff7f8e66c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e670:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8e674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e678:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e67c:	54000120	b.eq	0xfffff7f8e6a0  // b.none
   0x0000fffff7f8e680:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e684:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e68c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e690:	54000321	b.ne	0xfffff7f8e6f4  // b.any
   0x0000fffff7f8e694:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8e698:	9e620120	scvtf	d0, x9
   0x0000fffff7f8e69c:	14000002	b	0xfffff7f8e6a4
   0x0000fffff7f8e6a0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8e6a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e6a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8e6ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e6b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e6b4:	54000120	b.eq	0xfffff7f8e6d8  // b.none
   0x0000fffff7f8e6b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e6bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e6c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e6c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e6c8:	54000161	b.ne	0xfffff7f8e6f4  // b.any
   0x0000fffff7f8e6cc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8e6d0:	9e620121	scvtf	d1, x9
   0x0000fffff7f8e6d4:	14000002	b	0xfffff7f8e6dc
   0x0000fffff7f8e6d8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8e6dc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8e6e0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8e6e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8e6e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e6ec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8e6f0:	17ffffde	b	0xfffff7f8e668
   0x0000fffff7f8e6f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8e6f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e6fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e700:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e704:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f8e708:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e70c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e710:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8e714:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8e718:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e71c:	d63f0200	blr	x16
   0x0000fffff7f8e720:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e724:	5400bc40	b.eq	0xfffff7f8feac  // b.none
   0x0000fffff7f8e728:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8e72c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8e730:	540004a0	b.eq	0xfffff7f8e7c4  // b.none
   0x0000fffff7f8e734:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8e738:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8e73c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8e740:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8e744:	54000400	b.eq	0xfffff7f8e7c4  // b.none
   0x0000fffff7f8e748:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8e74c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8e750:	36d801d1	tbz	w17, #27, 0xfffff7f8e788
   0x0000fffff7f8e754:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8e758:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8e75c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8e760:	54000321	b.ne	0xfffff7f8e7c4  // b.any
   0x0000fffff7f8e764:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8e768:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e76c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8e770:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8e774:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8e778:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8e77c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8e780:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8e784:	54000209	b.ls	0xfffff7f8e7c4  // b.plast
   0x0000fffff7f8e788:	36d8008d	tbz	w13, #27, 0xfffff7f8e798
   0x0000fffff7f8e78c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8e790:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8e794:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8e798:	36d80091	tbz	w17, #27, 0xfffff7f8e7a8
   0x0000fffff7f8e79c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e7a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8e7a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8e7a8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8e7ac:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8e7b0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8e7b4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8e7b8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8e7bc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8e7c0:	1400000e	b	0xfffff7f8e7f8
   0x0000fffff7f8e7c4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8e7c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e7cc:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e7d0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e7d4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f8e7d8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e7dc:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e7e0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8e7e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8e7e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e7ec:	d63f0200	blr	x16
   0x0000fffff7f8e7f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e7f4:	5400b600	b.eq	0xfffff7f8feb4  // b.none
   0x0000fffff7f8e7f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e7fc:	37d806a9	tbnz	w9, #27, 0xfffff7f8e8d0
   0x0000fffff7f8e800:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e804:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e808:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e80c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e810:	540001c1	b.ne	0xfffff7f8e848  // b.any
   0x0000fffff7f8e814:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e818:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e81c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e820:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e824:	54000121	b.ne	0xfffff7f8e848  // b.any
   0x0000fffff7f8e828:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8e82c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8e830:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8e834:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e838:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e83c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8e840:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8e844:	14000030	b	0xfffff7f8e904
   0x0000fffff7f8e848:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e84c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8e850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e854:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e858:	54000120	b.eq	0xfffff7f8e87c  // b.none
   0x0000fffff7f8e85c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e860:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e864:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e868:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e86c:	54000321	b.ne	0xfffff7f8e8d0  // b.any
   0x0000fffff7f8e870:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8e874:	9e620120	scvtf	d0, x9
   0x0000fffff7f8e878:	14000002	b	0xfffff7f8e880
   0x0000fffff7f8e87c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8e880:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e884:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8e888:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e88c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e890:	54000120	b.eq	0xfffff7f8e8b4  // b.none
   0x0000fffff7f8e894:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e89c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e8a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e8a4:	54000161	b.ne	0xfffff7f8e8d0  // b.any
   0x0000fffff7f8e8a8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8e8ac:	9e620121	scvtf	d1, x9
   0x0000fffff7f8e8b0:	14000002	b	0xfffff7f8e8b8
   0x0000fffff7f8e8b4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8e8b8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8e8bc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8e8c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8e8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e8c8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8e8cc:	17ffffde	b	0xfffff7f8e844
   0x0000fffff7f8e8d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8e8d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e8d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e8dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e8e0:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f8e8e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e8e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e8ec:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8e8f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8e8f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e8f8:	d63f0200	blr	x16
   0x0000fffff7f8e8fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e900:	5400ade0	b.eq	0xfffff7f8febc  // b.none
   0x0000fffff7f8e904:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8e908:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8e90c:	540004a0	b.eq	0xfffff7f8e9a0  // b.none
   0x0000fffff7f8e910:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8e914:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8e918:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8e91c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8e920:	54000400	b.eq	0xfffff7f8e9a0  // b.none
   0x0000fffff7f8e924:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8e928:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8e92c:	36d801d1	tbz	w17, #27, 0xfffff7f8e964
   0x0000fffff7f8e930:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8e934:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8e938:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8e93c:	54000321	b.ne	0xfffff7f8e9a0  // b.any
   0x0000fffff7f8e940:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8e944:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e948:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8e94c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8e950:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8e954:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8e958:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8e95c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8e960:	54000209	b.ls	0xfffff7f8e9a0  // b.plast
   0x0000fffff7f8e964:	36d8008d	tbz	w13, #27, 0xfffff7f8e974
   0x0000fffff7f8e968:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8e96c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8e970:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8e974:	36d80091	tbz	w17, #27, 0xfffff7f8e984
   0x0000fffff7f8e978:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8e97c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8e980:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8e984:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8e988:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8e98c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8e990:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8e994:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8e998:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8e99c:	1400000e	b	0xfffff7f8e9d4
   0x0000fffff7f8e9a0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8e9a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8e9a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f8e9ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f8e9b0:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f8e9b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f8e9b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f8e9bc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8e9c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8e9c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8e9c8:	d63f0200	blr	x16
   0x0000fffff7f8e9cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8e9d0:	5400a7a0	b.eq	0xfffff7f8fec4  // b.none
   0x0000fffff7f8e9d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e9d8:	37d806a9	tbnz	w9, #27, 0xfffff7f8eaac
   0x0000fffff7f8e9dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8e9e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e9e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e9e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8e9ec:	540001c1	b.ne	0xfffff7f8ea24  // b.any
   0x0000fffff7f8e9f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8e9f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8e9f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8e9fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ea00:	54000121	b.ne	0xfffff7f8ea24  // b.any
   0x0000fffff7f8ea04:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ea08:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8ea0c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8ea10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ea14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ea18:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8ea1c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ea20:	14000030	b	0xfffff7f8eae0
   0x0000fffff7f8ea24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ea28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ea2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ea30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ea34:	54000120	b.eq	0xfffff7f8ea58  // b.none
   0x0000fffff7f8ea38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ea3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ea40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ea44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ea48:	54000321	b.ne	0xfffff7f8eaac  // b.any
   0x0000fffff7f8ea4c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ea50:	9e620120	scvtf	d0, x9
   0x0000fffff7f8ea54:	14000002	b	0xfffff7f8ea5c
   0x0000fffff7f8ea58:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8ea5c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ea60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ea64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ea68:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ea6c:	54000120	b.eq	0xfffff7f8ea90  // b.none
   0x0000fffff7f8ea70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ea74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ea78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ea7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ea80:	54000161	b.ne	0xfffff7f8eaac  // b.any
   0x0000fffff7f8ea84:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8ea88:	9e620121	scvtf	d1, x9
   0x0000fffff7f8ea8c:	14000002	b	0xfffff7f8ea94
   0x0000fffff7f8ea90:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8ea94:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8ea98:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8ea9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8eaa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8eaa4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8eaa8:	17ffffde	b	0xfffff7f8ea20
   0x0000fffff7f8eaac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8eab0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8eab4:	aa1303e1	mov	x1, x19
   0x0000fffff7f8eab8:	aa1503e2	mov	x2, x21
   0x0000fffff7f8eabc:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f8eac0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8eac4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8eac8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8eacc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8ead0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ead4:	d63f0200	blr	x16
   0x0000fffff7f8ead8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8eadc:	54009f80	b.eq	0xfffff7f8fecc  // b.none
   0x0000fffff7f8eae0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8eae4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8eae8:	540004a0	b.eq	0xfffff7f8eb7c  // b.none
   0x0000fffff7f8eaec:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8eaf0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8eaf4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8eaf8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8eafc:	54000400	b.eq	0xfffff7f8eb7c  // b.none
   0x0000fffff7f8eb00:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8eb04:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8eb08:	36d801d1	tbz	w17, #27, 0xfffff7f8eb40
   0x0000fffff7f8eb0c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8eb10:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8eb14:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8eb18:	54000321	b.ne	0xfffff7f8eb7c  // b.any
   0x0000fffff7f8eb1c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8eb20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8eb24:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8eb28:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8eb2c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8eb30:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8eb34:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8eb38:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8eb3c:	54000209	b.ls	0xfffff7f8eb7c  // b.plast
   0x0000fffff7f8eb40:	36d8008d	tbz	w13, #27, 0xfffff7f8eb50
   0x0000fffff7f8eb44:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8eb48:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8eb4c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8eb50:	36d80091	tbz	w17, #27, 0xfffff7f8eb60
   0x0000fffff7f8eb54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8eb58:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8eb5c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8eb60:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8eb64:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8eb68:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8eb6c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8eb70:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8eb74:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8eb78:	1400000e	b	0xfffff7f8ebb0
   0x0000fffff7f8eb7c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8eb80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8eb84:	aa1303e1	mov	x1, x19
   0x0000fffff7f8eb88:	aa1503e2	mov	x2, x21
   0x0000fffff7f8eb8c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f8eb90:	aa1403e4	mov	x4, x20
   0x0000fffff7f8eb94:	aa1603e5	mov	x5, x22
   0x0000fffff7f8eb98:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8eb9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8eba0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8eba4:	d63f0200	blr	x16
   0x0000fffff7f8eba8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ebac:	54009940	b.eq	0xfffff7f8fed4  // b.none
   0x0000fffff7f8ebb0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ebb4:	37d806a9	tbnz	w9, #27, 0xfffff7f8ec88
   0x0000fffff7f8ebb8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ebbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ebc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ebc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ebc8:	540001c1	b.ne	0xfffff7f8ec00  // b.any
   0x0000fffff7f8ebcc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ebd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ebd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ebd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ebdc:	54000121	b.ne	0xfffff7f8ec00  // b.any
   0x0000fffff7f8ebe0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ebe4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8ebe8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8ebec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ebf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ebf4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8ebf8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ebfc:	14000030	b	0xfffff7f8ecbc
   0x0000fffff7f8ec00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ec04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ec08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ec0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ec10:	54000120	b.eq	0xfffff7f8ec34  // b.none
   0x0000fffff7f8ec14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ec18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ec1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ec20:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ec24:	54000321	b.ne	0xfffff7f8ec88  // b.any
   0x0000fffff7f8ec28:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ec2c:	9e620120	scvtf	d0, x9
   0x0000fffff7f8ec30:	14000002	b	0xfffff7f8ec38
   0x0000fffff7f8ec34:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8ec38:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ec3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ec40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ec44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ec48:	54000120	b.eq	0xfffff7f8ec6c  // b.none
   0x0000fffff7f8ec4c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ec50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ec54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ec58:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ec5c:	54000161	b.ne	0xfffff7f8ec88  // b.any
   0x0000fffff7f8ec60:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8ec64:	9e620121	scvtf	d1, x9
   0x0000fffff7f8ec68:	14000002	b	0xfffff7f8ec70
   0x0000fffff7f8ec6c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8ec70:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8ec74:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8ec78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ec7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ec80:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ec84:	17ffffde	b	0xfffff7f8ebfc
   0x0000fffff7f8ec88:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8ec8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ec90:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ec94:	aa1503e2	mov	x2, x21
   0x0000fffff7f8ec98:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f8ec9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8eca0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8eca4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8eca8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8ecac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ecb0:	d63f0200	blr	x16
   0x0000fffff7f8ecb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ecb8:	54009120	b.eq	0xfffff7f8fedc  // b.none
   0x0000fffff7f8ecbc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8ecc0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8ecc4:	540004a0	b.eq	0xfffff7f8ed58  // b.none
   0x0000fffff7f8ecc8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8eccc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8ecd0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8ecd4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8ecd8:	54000400	b.eq	0xfffff7f8ed58  // b.none
   0x0000fffff7f8ecdc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8ece0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8ece4:	36d801d1	tbz	w17, #27, 0xfffff7f8ed1c
   0x0000fffff7f8ece8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8ecec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8ecf0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8ecf4:	54000321	b.ne	0xfffff7f8ed58  // b.any
   0x0000fffff7f8ecf8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8ecfc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ed00:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8ed04:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8ed08:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8ed0c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8ed10:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8ed14:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8ed18:	54000209	b.ls	0xfffff7f8ed58  // b.plast
   0x0000fffff7f8ed1c:	36d8008d	tbz	w13, #27, 0xfffff7f8ed2c
   0x0000fffff7f8ed20:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8ed24:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8ed28:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8ed2c:	36d80091	tbz	w17, #27, 0xfffff7f8ed3c
   0x0000fffff7f8ed30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ed34:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8ed38:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8ed3c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8ed40:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8ed44:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8ed48:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8ed4c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8ed50:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8ed54:	1400000e	b	0xfffff7f8ed8c
   0x0000fffff7f8ed58:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8ed5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ed60:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ed64:	aa1503e2	mov	x2, x21
   0x0000fffff7f8ed68:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f8ed6c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8ed70:	aa1603e5	mov	x5, x22
   0x0000fffff7f8ed74:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8ed78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8ed7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ed80:	d63f0200	blr	x16
   0x0000fffff7f8ed84:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ed88:	54008ae0	b.eq	0xfffff7f8fee4  // b.none
   0x0000fffff7f8ed8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ed90:	37d806a9	tbnz	w9, #27, 0xfffff7f8ee64
   0x0000fffff7f8ed94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ed98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ed9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8eda0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8eda4:	540001c1	b.ne	0xfffff7f8eddc  // b.any
   0x0000fffff7f8eda8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8edac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8edb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8edb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8edb8:	54000121	b.ne	0xfffff7f8eddc  // b.any
   0x0000fffff7f8edbc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8edc0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8edc4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8edc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8edcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8edd0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8edd4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8edd8:	14000030	b	0xfffff7f8ee98
   0x0000fffff7f8eddc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ede0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ede4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ede8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8edec:	54000120	b.eq	0xfffff7f8ee10  // b.none
   0x0000fffff7f8edf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8edf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8edf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8edfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ee00:	54000321	b.ne	0xfffff7f8ee64  // b.any
   0x0000fffff7f8ee04:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ee08:	9e620120	scvtf	d0, x9
   0x0000fffff7f8ee0c:	14000002	b	0xfffff7f8ee14
   0x0000fffff7f8ee10:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8ee14:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ee18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ee1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ee20:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ee24:	54000120	b.eq	0xfffff7f8ee48  // b.none
   0x0000fffff7f8ee28:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ee2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ee30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ee34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ee38:	54000161	b.ne	0xfffff7f8ee64  // b.any
   0x0000fffff7f8ee3c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8ee40:	9e620121	scvtf	d1, x9
   0x0000fffff7f8ee44:	14000002	b	0xfffff7f8ee4c
   0x0000fffff7f8ee48:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8ee4c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8ee50:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8ee54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ee58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ee5c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ee60:	17ffffde	b	0xfffff7f8edd8
   0x0000fffff7f8ee64:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8ee68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ee6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ee70:	aa1503e2	mov	x2, x21
   0x0000fffff7f8ee74:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f8ee78:	aa1403e4	mov	x4, x20
   0x0000fffff7f8ee7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8ee80:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8ee84:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8ee88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ee8c:	d63f0200	blr	x16
   0x0000fffff7f8ee90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ee94:	540082c0	b.eq	0xfffff7f8feec  // b.none
   0x0000fffff7f8ee98:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8ee9c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8eea0:	540004a0	b.eq	0xfffff7f8ef34  // b.none
   0x0000fffff7f8eea4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8eea8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8eeac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8eeb0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8eeb4:	54000400	b.eq	0xfffff7f8ef34  // b.none
   0x0000fffff7f8eeb8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8eebc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8eec0:	36d801d1	tbz	w17, #27, 0xfffff7f8eef8
   0x0000fffff7f8eec4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8eec8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8eecc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8eed0:	54000321	b.ne	0xfffff7f8ef34  // b.any
   0x0000fffff7f8eed4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8eed8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8eedc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8eee0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8eee4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8eee8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8eeec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8eef0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8eef4:	54000209	b.ls	0xfffff7f8ef34  // b.plast
   0x0000fffff7f8eef8:	36d8008d	tbz	w13, #27, 0xfffff7f8ef08
   0x0000fffff7f8eefc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8ef00:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8ef04:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8ef08:	36d80091	tbz	w17, #27, 0xfffff7f8ef18
   0x0000fffff7f8ef0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ef10:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8ef14:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8ef18:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8ef1c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8ef20:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8ef24:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8ef28:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8ef2c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8ef30:	1400000e	b	0xfffff7f8ef68
   0x0000fffff7f8ef34:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8ef38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ef3c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ef40:	aa1503e2	mov	x2, x21
   0x0000fffff7f8ef44:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f8ef48:	aa1403e4	mov	x4, x20
   0x0000fffff7f8ef4c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8ef50:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8ef54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8ef58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ef5c:	d63f0200	blr	x16
   0x0000fffff7f8ef60:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ef64:	54007c80	b.eq	0xfffff7f8fef4  // b.none
   0x0000fffff7f8ef68:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ef6c:	37d806a9	tbnz	w9, #27, 0xfffff7f8f040
   0x0000fffff7f8ef70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ef74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ef78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ef7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ef80:	540001c1	b.ne	0xfffff7f8efb8  // b.any
   0x0000fffff7f8ef84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ef88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ef8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ef90:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ef94:	54000121	b.ne	0xfffff7f8efb8  // b.any
   0x0000fffff7f8ef98:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ef9c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8efa0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8efa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8efa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8efac:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8efb0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8efb4:	14000030	b	0xfffff7f8f074
   0x0000fffff7f8efb8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8efbc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8efc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8efc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8efc8:	54000120	b.eq	0xfffff7f8efec  // b.none
   0x0000fffff7f8efcc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8efd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8efd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8efd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8efdc:	54000321	b.ne	0xfffff7f8f040  // b.any
   0x0000fffff7f8efe0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8efe4:	9e620120	scvtf	d0, x9
   0x0000fffff7f8efe8:	14000002	b	0xfffff7f8eff0
   0x0000fffff7f8efec:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8eff0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8eff4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8eff8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8effc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f000:	54000120	b.eq	0xfffff7f8f024  // b.none
   0x0000fffff7f8f004:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f008:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f00c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f010:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f014:	54000161	b.ne	0xfffff7f8f040  // b.any
   0x0000fffff7f8f018:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8f01c:	9e620121	scvtf	d1, x9
   0x0000fffff7f8f020:	14000002	b	0xfffff7f8f028
   0x0000fffff7f8f024:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8f028:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8f02c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8f030:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f034:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f038:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f03c:	17ffffde	b	0xfffff7f8efb4
   0x0000fffff7f8f040:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8f044:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f048:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f04c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f050:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f8f054:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f058:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f05c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8f060:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8f064:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f068:	d63f0200	blr	x16
   0x0000fffff7f8f06c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f070:	54007460	b.eq	0xfffff7f8fefc  // b.none
   0x0000fffff7f8f074:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8f078:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8f07c:	540004a0	b.eq	0xfffff7f8f110  // b.none
   0x0000fffff7f8f080:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8f084:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8f088:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8f08c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8f090:	54000400	b.eq	0xfffff7f8f110  // b.none
   0x0000fffff7f8f094:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8f098:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8f09c:	36d801d1	tbz	w17, #27, 0xfffff7f8f0d4
   0x0000fffff7f8f0a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8f0a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8f0a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8f0ac:	54000321	b.ne	0xfffff7f8f110  // b.any
   0x0000fffff7f8f0b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8f0b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f0b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8f0bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8f0c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8f0c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8f0c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8f0cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8f0d0:	54000209	b.ls	0xfffff7f8f110  // b.plast
   0x0000fffff7f8f0d4:	36d8008d	tbz	w13, #27, 0xfffff7f8f0e4
   0x0000fffff7f8f0d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8f0dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8f0e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8f0e4:	36d80091	tbz	w17, #27, 0xfffff7f8f0f4
   0x0000fffff7f8f0e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f0ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8f0f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8f0f4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8f0f8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8f0fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8f100:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8f104:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8f108:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8f10c:	1400000e	b	0xfffff7f8f144
   0x0000fffff7f8f110:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8f114:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f118:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f11c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f120:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f8f124:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f128:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f12c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8f130:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8f134:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f138:	d63f0200	blr	x16
   0x0000fffff7f8f13c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f140:	54006e20	b.eq	0xfffff7f8ff04  // b.none
   0x0000fffff7f8f144:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f148:	37d806a9	tbnz	w9, #27, 0xfffff7f8f21c
   0x0000fffff7f8f14c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f150:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f154:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f158:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f15c:	540001c1	b.ne	0xfffff7f8f194  // b.any
   0x0000fffff7f8f160:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f164:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f168:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f16c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f170:	54000121	b.ne	0xfffff7f8f194  // b.any
   0x0000fffff7f8f174:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f178:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8f17c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8f180:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f184:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f188:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8f18c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f190:	14000030	b	0xfffff7f8f250
   0x0000fffff7f8f194:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f198:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f1a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f1a4:	54000120	b.eq	0xfffff7f8f1c8  // b.none
   0x0000fffff7f8f1a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f1ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f1b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f1b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f1b8:	54000321	b.ne	0xfffff7f8f21c  // b.any
   0x0000fffff7f8f1bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f1c0:	9e620120	scvtf	d0, x9
   0x0000fffff7f8f1c4:	14000002	b	0xfffff7f8f1cc
   0x0000fffff7f8f1c8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8f1cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f1d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f1d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f1d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f1dc:	54000120	b.eq	0xfffff7f8f200  // b.none
   0x0000fffff7f8f1e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f1e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f1e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f1ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f1f0:	54000161	b.ne	0xfffff7f8f21c  // b.any
   0x0000fffff7f8f1f4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8f1f8:	9e620121	scvtf	d1, x9
   0x0000fffff7f8f1fc:	14000002	b	0xfffff7f8f204
   0x0000fffff7f8f200:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8f204:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8f208:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8f20c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f210:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f214:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f218:	17ffffde	b	0xfffff7f8f190
   0x0000fffff7f8f21c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8f220:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f224:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f228:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f22c:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f8f230:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f234:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f238:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8f23c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8f240:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f244:	d63f0200	blr	x16
   0x0000fffff7f8f248:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f24c:	54006600	b.eq	0xfffff7f8ff0c  // b.none
   0x0000fffff7f8f250:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8f254:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8f258:	540004a0	b.eq	0xfffff7f8f2ec  // b.none
   0x0000fffff7f8f25c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8f260:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8f264:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8f268:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8f26c:	54000400	b.eq	0xfffff7f8f2ec  // b.none
   0x0000fffff7f8f270:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8f274:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8f278:	36d801d1	tbz	w17, #27, 0xfffff7f8f2b0
   0x0000fffff7f8f27c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8f280:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8f284:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8f288:	54000321	b.ne	0xfffff7f8f2ec  // b.any
   0x0000fffff7f8f28c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8f290:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f294:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8f298:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8f29c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8f2a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8f2a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8f2a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8f2ac:	54000209	b.ls	0xfffff7f8f2ec  // b.plast
   0x0000fffff7f8f2b0:	36d8008d	tbz	w13, #27, 0xfffff7f8f2c0
   0x0000fffff7f8f2b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8f2b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8f2bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8f2c0:	36d80091	tbz	w17, #27, 0xfffff7f8f2d0
   0x0000fffff7f8f2c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f2c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8f2cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8f2d0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8f2d4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8f2d8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8f2dc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8f2e0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8f2e4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8f2e8:	1400000e	b	0xfffff7f8f320
   0x0000fffff7f8f2ec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8f2f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f2f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f2f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f2fc:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f8f300:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f304:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f308:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8f30c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8f310:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f314:	d63f0200	blr	x16
   0x0000fffff7f8f318:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f31c:	54005fc0	b.eq	0xfffff7f8ff14  // b.none
   0x0000fffff7f8f320:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f324:	37d806a9	tbnz	w9, #27, 0xfffff7f8f3f8
   0x0000fffff7f8f328:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f32c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f334:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f338:	540001c1	b.ne	0xfffff7f8f370  // b.any
   0x0000fffff7f8f33c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f340:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f344:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f348:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f34c:	54000121	b.ne	0xfffff7f8f370  // b.any
   0x0000fffff7f8f350:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f354:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8f358:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8f35c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f364:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8f368:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f36c:	14000030	b	0xfffff7f8f42c
   0x0000fffff7f8f370:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f374:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f37c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f380:	54000120	b.eq	0xfffff7f8f3a4  // b.none
   0x0000fffff7f8f384:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f388:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f38c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f390:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f394:	54000321	b.ne	0xfffff7f8f3f8  // b.any
   0x0000fffff7f8f398:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f39c:	9e620120	scvtf	d0, x9
   0x0000fffff7f8f3a0:	14000002	b	0xfffff7f8f3a8
   0x0000fffff7f8f3a4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8f3a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f3ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f3b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f3b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f3b8:	54000120	b.eq	0xfffff7f8f3dc  // b.none
   0x0000fffff7f8f3bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f3c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f3c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f3c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f3cc:	54000161	b.ne	0xfffff7f8f3f8  // b.any
   0x0000fffff7f8f3d0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8f3d4:	9e620121	scvtf	d1, x9
   0x0000fffff7f8f3d8:	14000002	b	0xfffff7f8f3e0
   0x0000fffff7f8f3dc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8f3e0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8f3e4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8f3e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f3ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f3f0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f3f4:	17ffffde	b	0xfffff7f8f36c
   0x0000fffff7f8f3f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8f3fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f400:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f404:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f408:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f8f40c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f410:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f414:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8f418:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8f41c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f420:	d63f0200	blr	x16
   0x0000fffff7f8f424:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f428:	540057a0	b.eq	0xfffff7f8ff1c  // b.none
   0x0000fffff7f8f42c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8f430:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8f434:	540004a0	b.eq	0xfffff7f8f4c8  // b.none
   0x0000fffff7f8f438:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8f43c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8f440:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8f444:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8f448:	54000400	b.eq	0xfffff7f8f4c8  // b.none
   0x0000fffff7f8f44c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8f450:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8f454:	36d801d1	tbz	w17, #27, 0xfffff7f8f48c
   0x0000fffff7f8f458:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8f45c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8f460:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8f464:	54000321	b.ne	0xfffff7f8f4c8  // b.any
   0x0000fffff7f8f468:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8f46c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f470:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8f474:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8f478:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8f47c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8f480:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8f484:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8f488:	54000209	b.ls	0xfffff7f8f4c8  // b.plast
   0x0000fffff7f8f48c:	36d8008d	tbz	w13, #27, 0xfffff7f8f49c
   0x0000fffff7f8f490:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8f494:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8f498:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8f49c:	36d80091	tbz	w17, #27, 0xfffff7f8f4ac
   0x0000fffff7f8f4a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f4a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8f4a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8f4ac:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8f4b0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8f4b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8f4b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8f4bc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8f4c0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8f4c4:	1400000e	b	0xfffff7f8f4fc
   0x0000fffff7f8f4c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8f4cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f4d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f4d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f4d8:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f8f4dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f4e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f4e4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8f4e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8f4ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f4f0:	d63f0200	blr	x16
   0x0000fffff7f8f4f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f4f8:	54005160	b.eq	0xfffff7f8ff24  // b.none
   0x0000fffff7f8f4fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f500:	37d806a9	tbnz	w9, #27, 0xfffff7f8f5d4
   0x0000fffff7f8f504:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f508:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f50c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f510:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f514:	540001c1	b.ne	0xfffff7f8f54c  // b.any
   0x0000fffff7f8f518:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f51c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f524:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f528:	54000121	b.ne	0xfffff7f8f54c  // b.any
   0x0000fffff7f8f52c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f530:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8f534:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8f538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f53c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f540:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8f544:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f548:	14000030	b	0xfffff7f8f608
   0x0000fffff7f8f54c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f550:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f558:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f55c:	54000120	b.eq	0xfffff7f8f580  // b.none
   0x0000fffff7f8f560:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f564:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f568:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f56c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f570:	54000321	b.ne	0xfffff7f8f5d4  // b.any
   0x0000fffff7f8f574:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f578:	9e620120	scvtf	d0, x9
   0x0000fffff7f8f57c:	14000002	b	0xfffff7f8f584
   0x0000fffff7f8f580:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8f584:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f588:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f58c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f590:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f594:	54000120	b.eq	0xfffff7f8f5b8  // b.none
   0x0000fffff7f8f598:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f59c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f5a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f5a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f5a8:	54000161	b.ne	0xfffff7f8f5d4  // b.any
   0x0000fffff7f8f5ac:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8f5b0:	9e620121	scvtf	d1, x9
   0x0000fffff7f8f5b4:	14000002	b	0xfffff7f8f5bc
   0x0000fffff7f8f5b8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8f5bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8f5c0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8f5c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f5c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f5cc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f5d0:	17ffffde	b	0xfffff7f8f548
   0x0000fffff7f8f5d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8f5d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f5dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f5e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f5e4:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f8f5e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f5ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f5f0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8f5f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8f5f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f5fc:	d63f0200	blr	x16
   0x0000fffff7f8f600:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f604:	54004940	b.eq	0xfffff7f8ff2c  // b.none
   0x0000fffff7f8f608:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8f60c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8f610:	540004a0	b.eq	0xfffff7f8f6a4  // b.none
   0x0000fffff7f8f614:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8f618:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8f61c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8f620:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8f624:	54000400	b.eq	0xfffff7f8f6a4  // b.none
   0x0000fffff7f8f628:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8f62c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8f630:	36d801d1	tbz	w17, #27, 0xfffff7f8f668
   0x0000fffff7f8f634:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8f638:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8f63c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8f640:	54000321	b.ne	0xfffff7f8f6a4  // b.any
   0x0000fffff7f8f644:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8f648:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f64c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8f650:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8f654:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8f658:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8f65c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8f660:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8f664:	54000209	b.ls	0xfffff7f8f6a4  // b.plast
   0x0000fffff7f8f668:	36d8008d	tbz	w13, #27, 0xfffff7f8f678
   0x0000fffff7f8f66c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8f670:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8f674:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8f678:	36d80091	tbz	w17, #27, 0xfffff7f8f688
   0x0000fffff7f8f67c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f680:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8f684:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8f688:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8f68c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8f690:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8f694:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8f698:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8f69c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8f6a0:	1400000e	b	0xfffff7f8f6d8
   0x0000fffff7f8f6a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8f6a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f6ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f6b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f6b4:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f8f6b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f6bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f6c0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8f6c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8f6c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f6cc:	d63f0200	blr	x16
   0x0000fffff7f8f6d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f6d4:	54004300	b.eq	0xfffff7f8ff34  // b.none
   0x0000fffff7f8f6d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f6dc:	37d806a9	tbnz	w9, #27, 0xfffff7f8f7b0
   0x0000fffff7f8f6e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f6e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f6e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f6ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f6f0:	540001c1	b.ne	0xfffff7f8f728  // b.any
   0x0000fffff7f8f6f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f6f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f6fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f700:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f704:	54000121	b.ne	0xfffff7f8f728  // b.any
   0x0000fffff7f8f708:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f70c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8f710:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8f714:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f71c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8f720:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f724:	14000030	b	0xfffff7f8f7e4
   0x0000fffff7f8f728:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f72c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f734:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f738:	54000120	b.eq	0xfffff7f8f75c  // b.none
   0x0000fffff7f8f73c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f740:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f744:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f748:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f74c:	54000321	b.ne	0xfffff7f8f7b0  // b.any
   0x0000fffff7f8f750:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f754:	9e620120	scvtf	d0, x9
   0x0000fffff7f8f758:	14000002	b	0xfffff7f8f760
   0x0000fffff7f8f75c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8f760:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f764:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f768:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f76c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f770:	54000120	b.eq	0xfffff7f8f794  // b.none
   0x0000fffff7f8f774:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f77c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f784:	54000161	b.ne	0xfffff7f8f7b0  // b.any
   0x0000fffff7f8f788:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8f78c:	9e620121	scvtf	d1, x9
   0x0000fffff7f8f790:	14000002	b	0xfffff7f8f798
   0x0000fffff7f8f794:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8f798:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8f79c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8f7a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f7a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f7a8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f7ac:	17ffffde	b	0xfffff7f8f724
   0x0000fffff7f8f7b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8f7b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f7b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f7bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f7c0:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f8f7c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f7c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f7cc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8f7d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8f7d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f7d8:	d63f0200	blr	x16
   0x0000fffff7f8f7dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f7e0:	54003ae0	b.eq	0xfffff7f8ff3c  // b.none
   0x0000fffff7f8f7e4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8f7e8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8f7ec:	540004a0	b.eq	0xfffff7f8f880  // b.none
   0x0000fffff7f8f7f0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8f7f4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8f7f8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8f7fc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8f800:	54000400	b.eq	0xfffff7f8f880  // b.none
   0x0000fffff7f8f804:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8f808:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8f80c:	36d801d1	tbz	w17, #27, 0xfffff7f8f844
   0x0000fffff7f8f810:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8f814:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8f818:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8f81c:	54000321	b.ne	0xfffff7f8f880  // b.any
   0x0000fffff7f8f820:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8f824:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f828:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8f82c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8f830:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8f834:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8f838:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8f83c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8f840:	54000209	b.ls	0xfffff7f8f880  // b.plast
   0x0000fffff7f8f844:	36d8008d	tbz	w13, #27, 0xfffff7f8f854
   0x0000fffff7f8f848:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8f84c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8f850:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8f854:	36d80091	tbz	w17, #27, 0xfffff7f8f864
   0x0000fffff7f8f858:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8f85c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8f860:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8f864:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8f868:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8f86c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8f870:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8f874:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8f878:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8f87c:	1400000e	b	0xfffff7f8f8b4
   0x0000fffff7f8f880:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8f884:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f888:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f88c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f890:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f8f894:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f898:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f89c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8f8a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8f8a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f8a8:	d63f0200	blr	x16
   0x0000fffff7f8f8ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f8b0:	540034a0	b.eq	0xfffff7f8ff44  // b.none
   0x0000fffff7f8f8b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f8b8:	37d806a9	tbnz	w9, #27, 0xfffff7f8f98c
   0x0000fffff7f8f8bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f8c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f8c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f8cc:	540001c1	b.ne	0xfffff7f8f904  // b.any
   0x0000fffff7f8f8d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f8d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f8d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f8dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f8e0:	54000121	b.ne	0xfffff7f8f904  // b.any
   0x0000fffff7f8f8e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f8e8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8f8ec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8f8f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f8f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f8f8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8f8fc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f900:	14000030	b	0xfffff7f8f9c0
   0x0000fffff7f8f904:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f908:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f90c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f910:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f914:	54000120	b.eq	0xfffff7f8f938  // b.none
   0x0000fffff7f8f918:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8f91c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f924:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f928:	54000321	b.ne	0xfffff7f8f98c  // b.any
   0x0000fffff7f8f92c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8f930:	9e620120	scvtf	d0, x9
   0x0000fffff7f8f934:	14000002	b	0xfffff7f8f93c
   0x0000fffff7f8f938:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8f93c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f940:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f948:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f94c:	54000120	b.eq	0xfffff7f8f970  // b.none
   0x0000fffff7f8f950:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8f954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8f958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f95c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8f960:	54000161	b.ne	0xfffff7f8f98c  // b.any
   0x0000fffff7f8f964:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8f968:	9e620121	scvtf	d1, x9
   0x0000fffff7f8f96c:	14000002	b	0xfffff7f8f974
   0x0000fffff7f8f970:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8f974:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8f978:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8f97c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8f980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8f984:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8f988:	17ffffde	b	0xfffff7f8f900
   0x0000fffff7f8f98c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8f990:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8f994:	aa1303e1	mov	x1, x19
   0x0000fffff7f8f998:	aa1503e2	mov	x2, x21
   0x0000fffff7f8f99c:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f8f9a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8f9a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8f9a8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8f9ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8f9b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8f9b4:	d63f0200	blr	x16
   0x0000fffff7f8f9b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8f9bc:	54002c80	b.eq	0xfffff7f8ff4c  // b.none
   0x0000fffff7f8f9c0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8f9c4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8f9c8:	540004a0	b.eq	0xfffff7f8fa5c  // b.none
   0x0000fffff7f8f9cc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8f9d0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8f9d4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8f9d8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8f9dc:	54000400	b.eq	0xfffff7f8fa5c  // b.none
   0x0000fffff7f8f9e0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8f9e4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8f9e8:	36d801d1	tbz	w17, #27, 0xfffff7f8fa20
   0x0000fffff7f8f9ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8f9f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8f9f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8f9f8:	54000321	b.ne	0xfffff7f8fa5c  // b.any
   0x0000fffff7f8f9fc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8fa00:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8fa04:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8fa08:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8fa0c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8fa10:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8fa14:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8fa18:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8fa1c:	54000209	b.ls	0xfffff7f8fa5c  // b.plast
   0x0000fffff7f8fa20:	36d8008d	tbz	w13, #27, 0xfffff7f8fa30
   0x0000fffff7f8fa24:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8fa28:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8fa2c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8fa30:	36d80091	tbz	w17, #27, 0xfffff7f8fa40
   0x0000fffff7f8fa34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8fa38:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8fa3c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8fa40:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8fa44:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8fa48:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8fa4c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8fa50:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8fa54:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8fa58:	1400000e	b	0xfffff7f8fa90
   0x0000fffff7f8fa5c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8fa60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8fa64:	aa1303e1	mov	x1, x19
   0x0000fffff7f8fa68:	aa1503e2	mov	x2, x21
   0x0000fffff7f8fa6c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f8fa70:	aa1403e4	mov	x4, x20
   0x0000fffff7f8fa74:	aa1603e5	mov	x5, x22
   0x0000fffff7f8fa78:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8fa7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8fa80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8fa84:	d63f0200	blr	x16
   0x0000fffff7f8fa88:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8fa8c:	54002640	b.eq	0xfffff7f8ff54  // b.none
   0x0000fffff7f8fa90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8fa94:	37d806a9	tbnz	w9, #27, 0xfffff7f8fb68
   0x0000fffff7f8fa98:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8fa9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8faa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8faa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8faa8:	540001c1	b.ne	0xfffff7f8fae0  // b.any
   0x0000fffff7f8faac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8fab0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fab8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fabc:	54000121	b.ne	0xfffff7f8fae0  // b.any
   0x0000fffff7f8fac0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8fac4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8fac8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8facc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fad4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8fad8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8fadc:	14000030	b	0xfffff7f8fb9c
   0x0000fffff7f8fae0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8fae4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8fae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8faec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8faf0:	54000120	b.eq	0xfffff7f8fb14  // b.none
   0x0000fffff7f8faf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8faf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fafc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fb00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fb04:	54000321	b.ne	0xfffff7f8fb68  // b.any
   0x0000fffff7f8fb08:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8fb0c:	9e620120	scvtf	d0, x9
   0x0000fffff7f8fb10:	14000002	b	0xfffff7f8fb18
   0x0000fffff7f8fb14:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8fb18:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8fb1c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8fb20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fb24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fb28:	54000120	b.eq	0xfffff7f8fb4c  // b.none
   0x0000fffff7f8fb2c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8fb30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fb34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fb38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fb3c:	54000161	b.ne	0xfffff7f8fb68  // b.any
   0x0000fffff7f8fb40:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8fb44:	9e620121	scvtf	d1, x9
   0x0000fffff7f8fb48:	14000002	b	0xfffff7f8fb50
   0x0000fffff7f8fb4c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8fb50:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8fb54:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8fb58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8fb5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fb60:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8fb64:	17ffffde	b	0xfffff7f8fadc
   0x0000fffff7f8fb68:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8fb6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8fb70:	aa1303e1	mov	x1, x19
   0x0000fffff7f8fb74:	aa1503e2	mov	x2, x21
   0x0000fffff7f8fb78:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f8fb7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8fb80:	aa1603e5	mov	x5, x22
   0x0000fffff7f8fb84:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8fb88:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8fb8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8fb90:	d63f0200	blr	x16
   0x0000fffff7f8fb94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8fb98:	54001e20	b.eq	0xfffff7f8ff5c  // b.none
   0x0000fffff7f8fb9c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8fba0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8fba4:	540004a0	b.eq	0xfffff7f8fc38  // b.none
   0x0000fffff7f8fba8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8fbac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8fbb0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8fbb4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8fbb8:	54000400	b.eq	0xfffff7f8fc38  // b.none
   0x0000fffff7f8fbbc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8fbc0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8fbc4:	36d801d1	tbz	w17, #27, 0xfffff7f8fbfc
   0x0000fffff7f8fbc8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8fbcc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8fbd0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8fbd4:	54000321	b.ne	0xfffff7f8fc38  // b.any
   0x0000fffff7f8fbd8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8fbdc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8fbe0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8fbe4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8fbe8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8fbec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8fbf0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8fbf4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8fbf8:	54000209	b.ls	0xfffff7f8fc38  // b.plast
   0x0000fffff7f8fbfc:	36d8008d	tbz	w13, #27, 0xfffff7f8fc0c
   0x0000fffff7f8fc00:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8fc04:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8fc08:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8fc0c:	36d80091	tbz	w17, #27, 0xfffff7f8fc1c
   0x0000fffff7f8fc10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8fc14:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8fc18:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8fc1c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8fc20:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8fc24:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8fc28:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8fc2c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8fc30:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8fc34:	1400000e	b	0xfffff7f8fc6c
   0x0000fffff7f8fc38:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8fc3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8fc40:	aa1303e1	mov	x1, x19
   0x0000fffff7f8fc44:	aa1503e2	mov	x2, x21
   0x0000fffff7f8fc48:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f8fc4c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8fc50:	aa1603e5	mov	x5, x22
   0x0000fffff7f8fc54:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8fc58:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8fc5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8fc60:	d63f0200	blr	x16
   0x0000fffff7f8fc64:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8fc68:	540017e0	b.eq	0xfffff7f8ff64  // b.none
   0x0000fffff7f8fc6c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8fc70:	37d806a9	tbnz	w9, #27, 0xfffff7f8fd44
   0x0000fffff7f8fc74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8fc78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fc7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fc80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fc84:	540001c1	b.ne	0xfffff7f8fcbc  // b.any
   0x0000fffff7f8fc88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8fc8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fc90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fc94:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fc98:	54000121	b.ne	0xfffff7f8fcbc  // b.any
   0x0000fffff7f8fc9c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8fca0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8fca4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8fca8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fcac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fcb0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8fcb4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8fcb8:	14000030	b	0xfffff7f8fd78
   0x0000fffff7f8fcbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8fcc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8fcc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fcc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fccc:	54000120	b.eq	0xfffff7f8fcf0  // b.none
   0x0000fffff7f8fcd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8fcd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fcd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fcdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fce0:	54000321	b.ne	0xfffff7f8fd44  // b.any
   0x0000fffff7f8fce4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8fce8:	9e620120	scvtf	d0, x9
   0x0000fffff7f8fcec:	14000002	b	0xfffff7f8fcf4
   0x0000fffff7f8fcf0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8fcf4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8fcf8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8fcfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fd00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fd04:	54000120	b.eq	0xfffff7f8fd28  // b.none
   0x0000fffff7f8fd08:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8fd0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fd10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fd14:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fd18:	54000161	b.ne	0xfffff7f8fd44  // b.any
   0x0000fffff7f8fd1c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8fd20:	9e620121	scvtf	d1, x9
   0x0000fffff7f8fd24:	14000002	b	0xfffff7f8fd2c
   0x0000fffff7f8fd28:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8fd2c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8fd30:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8fd34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8fd38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fd3c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8fd40:	17ffffde	b	0xfffff7f8fcb8
   0x0000fffff7f8fd44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8fd48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8fd4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8fd50:	aa1503e2	mov	x2, x21
   0x0000fffff7f8fd54:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f8fd58:	aa1403e4	mov	x4, x20
   0x0000fffff7f8fd5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8fd60:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8fd64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8fd68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8fd6c:	d63f0200	blr	x16
   0x0000fffff7f8fd70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8fd74:	54000fc0	b.eq	0xfffff7f8ff6c  // b.none
   0x0000fffff7f8fd78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8fd7c:	37d80269	tbnz	w9, #27, 0xfffff7f8fdc8
   0x0000fffff7f8fd80:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8fd84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fd88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fd8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8fd90:	540001c1	b.ne	0xfffff7f8fdc8  // b.any
   0x0000fffff7f8fd94:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f8fd98:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f8fd9c:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f8fda0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f8fda4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fda8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fdac:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f8fdb0:	aa0b03e9	mov	x9, x11
   0x0000fffff7f8fdb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fdb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fdbc:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f8fdc0:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f8fdc4:	1400000e	b	0xfffff7f8fdfc
   0x0000fffff7f8fdc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8fdcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8fdd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8fdd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8fdd8:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f8fddc:	aa1403e4	mov	x4, x20
   0x0000fffff7f8fde0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8fde4:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7f8fde8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8fdec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8fdf0:	d63f0200	blr	x16
   0x0000fffff7f8fdf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8fdf8:	54000be0	b.eq	0xfffff7f8ff74  // b.none
   0x0000fffff7f8fdfc:	17fff8f7	b	0xfffff7f8e1d8
   0x0000fffff7f8fe00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8fe04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8fe08:	aa1303e1	mov	x1, x19
   0x0000fffff7f8fe0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8fe10:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f8fe14:	aa1403e4	mov	x4, x20
   0x0000fffff7f8fe18:	aa1603e5	mov	x5, x22
   0x0000fffff7f8fe1c:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7f8fe20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8fe24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8fe28:	d63f0200	blr	x16
   0x0000fffff7f8fe2c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f8fe30:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8fe34:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8fe38:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8fe3c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f8fe40:	d65f03c0	ret
   0x0000fffff7f8fe44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8fe48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8fe4c:	b900028a	str	w10, [x20]
   0x0000fffff7f8fe50:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8fe54:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f8fe58:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8fe5c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8fe60:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8fe64:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8fe68:	d65f03c0	ret
   0x0000fffff7f8fe6c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f8fe70:	17fffff5	b	0xfffff7f8fe44
   0x0000fffff7f8fe74:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f8fe78:	17fffff3	b	0xfffff7f8fe44
   0x0000fffff7f8fe7c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f8fe80:	17fffff1	b	0xfffff7f8fe44
   0x0000fffff7f8fe84:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f8fe88:	17ffffef	b	0xfffff7f8fe44
   0x0000fffff7f8fe8c:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f8fe90:	17ffffed	b	0xfffff7f8fe44
   0x0000fffff7f8fe94:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f8fe98:	17ffffeb	b	0xfffff7f8fe44
   0x0000fffff7f8fe9c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f8fea0:	17ffffe9	b	0xfffff7f8fe44
   0x0000fffff7f8fea4:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f8fea8:	17ffffe7	b	0xfffff7f8fe44
   0x0000fffff7f8feac:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f8feb0:	17ffffe5	b	0xfffff7f8fe44
   0x0000fffff7f8feb4:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f8feb8:	17ffffe3	b	0xfffff7f8fe44
   0x0000fffff7f8febc:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f8fec0:	17ffffe1	b	0xfffff7f8fe44
   0x0000fffff7f8fec4:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f8fec8:	17ffffdf	b	0xfffff7f8fe44
   0x0000fffff7f8fecc:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f8fed0:	17ffffdd	b	0xfffff7f8fe44
   0x0000fffff7f8fed4:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f8fed8:	17ffffdb	b	0xfffff7f8fe44
   0x0000fffff7f8fedc:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f8fee0:	17ffffd9	b	0xfffff7f8fe44
   0x0000fffff7f8fee4:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f8fee8:	17ffffd7	b	0xfffff7f8fe44
   0x0000fffff7f8feec:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f8fef0:	17ffffd5	b	0xfffff7f8fe44
   0x0000fffff7f8fef4:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f8fef8:	17ffffd3	b	0xfffff7f8fe44
   0x0000fffff7f8fefc:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f8ff00:	17ffffd1	b	0xfffff7f8fe44
   0x0000fffff7f8ff04:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f8ff08:	17ffffcf	b	0xfffff7f8fe44
   0x0000fffff7f8ff0c:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f8ff10:	17ffffcd	b	0xfffff7f8fe44
   0x0000fffff7f8ff14:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f8ff18:	17ffffcb	b	0xfffff7f8fe44
   0x0000fffff7f8ff1c:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f8ff20:	17ffffc9	b	0xfffff7f8fe44
   0x0000fffff7f8ff24:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f8ff28:	17ffffc7	b	0xfffff7f8fe44
   0x0000fffff7f8ff2c:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f8ff30:	17ffffc5	b	0xfffff7f8fe44
   0x0000fffff7f8ff34:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f8ff38:	17ffffc3	b	0xfffff7f8fe44
   0x0000fffff7f8ff3c:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f8ff40:	17ffffc1	b	0xfffff7f8fe44
   0x0000fffff7f8ff44:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f8ff48:	17ffffbf	b	0xfffff7f8fe44
   0x0000fffff7f8ff4c:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f8ff50:	17ffffbd	b	0xfffff7f8fe44
   0x0000fffff7f8ff54:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f8ff58:	17ffffbb	b	0xfffff7f8fe44
   0x0000fffff7f8ff5c:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f8ff60:	17ffffb9	b	0xfffff7f8fe44
   0x0000fffff7f8ff64:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f8ff68:	17ffffb7	b	0xfffff7f8fe44
   0x0000fffff7f8ff6c:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f8ff70:	17ffffb5	b	0xfffff7f8fe44
   0x0000fffff7f8ff74:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f8ff78:	17ffffb3	b	0xfffff7f8fe44
   0x0000fffff7f8ff7c:	00000000	udf	#0
   0x0000fffff7f8ff80:	00000000	udf	#0
   0x0000fffff7f8ff84:	00000000	udf	#0
   0x0000fffff7f8ff88:	00000000	udf	#0
   0x0000fffff7f8ff8c:	00000000	udf	#0
   0x0000fffff7f8ff90:	00000000	udf	#0
   0x0000fffff7f8ff94:	00000000	udf	#0
   0x0000fffff7f8ff98:	00000000	udf	#0
   0x0000fffff7f8ff9c:	00000000	udf	#0
   0x0000fffff7f8ffa0:	00000000	udf	#0
   0x0000fffff7f8ffa4:	00000000	udf	#0
   0x0000fffff7f8ffa8:	00000000	udf	#0
   0x0000fffff7f8ffac:	00000000	udf	#0
   0x0000fffff7f8ffb0:	00000000	udf	#0
   0x0000fffff7f8ffb4:	00000000	udf	#0
   0x0000fffff7f8ffb8:	00000000	udf	#0
   0x0000fffff7f8ffbc:	00000000	udf	#0
   0x0000fffff7f8ffc0:	00000000	udf	#0
   0x0000fffff7f8ffc4:	00000000	udf	#0
   0x0000fffff7f8ffc8:	00000000	udf	#0
   0x0000fffff7f8ffcc:	00000000	udf	#0
   0x0000fffff7f8ffd0:	00000000	udf	#0
   0x0000fffff7f8ffd4:	00000000	udf	#0
   0x0000fffff7f8ffd8:	00000000	udf	#0
   0x0000fffff7f8ffdc:	00000000	udf	#0
   0x0000fffff7f8ffe0:	00000000	udf	#0
   0x0000fffff7f8ffe4:	00000000	udf	#0
   0x0000fffff7f8ffe8:	00000000	udf	#0
   0x0000fffff7f8ffec:	00000000	udf	#0
   0x0000fffff7f8fff0:	00000000	udf	#0
   0x0000fffff7f8fff4:	00000000	udf	#0
   0x0000fffff7f8fff8:	00000000	udf	#0
   0x0000fffff7f8fffc:	00000000	udf	#0
End of assembler dump.
