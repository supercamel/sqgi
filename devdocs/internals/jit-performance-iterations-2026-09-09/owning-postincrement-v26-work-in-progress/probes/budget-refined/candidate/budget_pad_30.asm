Dump of assembler code from 0xfffff7d7e000 to 0xfffff7d80000:
   0x0000fffff7d7e000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7d7e004:	910003fd	mov	x29, sp
   0x0000fffff7d7e008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7d7e00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7d7e010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7d7e014:	aa0003f3	mov	x19, x0
   0x0000fffff7d7e018:	aa0103f4	mov	x20, x1
   0x0000fffff7d7e01c:	aa0203f5	mov	x21, x2
   0x0000fffff7d7e020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7d7e024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7d7e028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7d7e02c:	f90003e9	str	x9, [sp]
   0x0000fffff7d7e030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7d7e034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7d7e038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7d7e03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d7e040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e044:	d63f0200	blr	x16
   0x0000fffff7d7e048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7d7e04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7d7e050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7d7e054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7d7e058:	14000001	b	0xfffff7d7e05c
   0x0000fffff7d7e05c:	14000001	b	0xfffff7d7e060
   0x0000fffff7d7e060:	14000001	b	0xfffff7d7e064
   0x0000fffff7d7e064:	14000001	b	0xfffff7d7e068
   0x0000fffff7d7e068:	14000001	b	0xfffff7d7e06c
   0x0000fffff7d7e06c:	14000001	b	0xfffff7d7e070
   0x0000fffff7d7e070:	14000001	b	0xfffff7d7e074
   0x0000fffff7d7e074:	14000001	b	0xfffff7d7e078
   0x0000fffff7d7e078:	14000001	b	0xfffff7d7e07c
   0x0000fffff7d7e07c:	14000001	b	0xfffff7d7e080
   0x0000fffff7d7e080:	14000001	b	0xfffff7d7e084
   0x0000fffff7d7e084:	14000001	b	0xfffff7d7e088
   0x0000fffff7d7e088:	14000001	b	0xfffff7d7e08c
   0x0000fffff7d7e08c:	14000001	b	0xfffff7d7e090
   0x0000fffff7d7e090:	14000001	b	0xfffff7d7e094
   0x0000fffff7d7e094:	14000001	b	0xfffff7d7e098
   0x0000fffff7d7e098:	14000001	b	0xfffff7d7e09c
   0x0000fffff7d7e09c:	14000001	b	0xfffff7d7e0a0
   0x0000fffff7d7e0a0:	14000001	b	0xfffff7d7e0a4
   0x0000fffff7d7e0a4:	14000001	b	0xfffff7d7e0a8
   0x0000fffff7d7e0a8:	14000001	b	0xfffff7d7e0ac
   0x0000fffff7d7e0ac:	14000001	b	0xfffff7d7e0b0
   0x0000fffff7d7e0b0:	14000001	b	0xfffff7d7e0b4
   0x0000fffff7d7e0b4:	14000001	b	0xfffff7d7e0b8
   0x0000fffff7d7e0b8:	14000001	b	0xfffff7d7e0bc
   0x0000fffff7d7e0bc:	14000001	b	0xfffff7d7e0c0
   0x0000fffff7d7e0c0:	14000001	b	0xfffff7d7e0c4
   0x0000fffff7d7e0c4:	14000001	b	0xfffff7d7e0c8
   0x0000fffff7d7e0c8:	14000001	b	0xfffff7d7e0cc
   0x0000fffff7d7e0cc:	14000001	b	0xfffff7d7e0d0
   0x0000fffff7d7e0d0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7d7e0d4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7d7e0d8:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7d7e0dc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7d7e0e0:	36d80211	tbz	w17, #27, 0xfffff7d7e120
   0x0000fffff7d7e0e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e0e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e0ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e0f0:	540001e1	b.ne	0xfffff7d7e12c  // b.any
   0x0000fffff7d7e0f4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7d7e0f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e0fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e100:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e104:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e108:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e10c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e110:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e114:	540000c9	b.ls	0xfffff7d7e12c  // b.plast
   0x0000fffff7d7e118:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e11c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e120:	f900266c	str	x12, [x19, #72]
   0x0000fffff7d7e124:	b900426d	str	w13, [x19, #64]
   0x0000fffff7d7e128:	1400000e	b	0xfffff7d7e160
   0x0000fffff7d7e12c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e130:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e134:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e138:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e13c:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7d7e140:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e144:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e148:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7e14c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e150:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e154:	d63f0200	blr	x16
   0x0000fffff7d7e158:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e15c:	5400eac0	b.eq	0xfffff7d7feb4  // b.none
   0x0000fffff7d7e160:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7d7e164:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7d7e168:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7d7e16c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7d7e170:	36d80211	tbz	w17, #27, 0xfffff7d7e1b0
   0x0000fffff7d7e174:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e178:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e17c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e180:	540001e1	b.ne	0xfffff7d7e1bc  // b.any
   0x0000fffff7d7e184:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7d7e188:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e18c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e190:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e194:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e198:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e19c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e1a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e1a4:	540000c9	b.ls	0xfffff7d7e1bc  // b.plast
   0x0000fffff7d7e1a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e1ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e1b0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7d7e1b4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7d7e1b8:	1400000e	b	0xfffff7d7e1f0
   0x0000fffff7d7e1bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e1c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e1c4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e1c8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e1cc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7d7e1d0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e1d4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e1d8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7e1dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e1e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e1e4:	d63f0200	blr	x16
   0x0000fffff7d7e1e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e1ec:	5400e680	b.eq	0xfffff7d7febc  // b.none
   0x0000fffff7d7e1f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e1f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e1f8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e1fc:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e200:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7d7e204:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e208:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e20c:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7d7e210:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e214:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e218:	d63f0200	blr	x16
   0x0000fffff7d7e21c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e220:	5400e520	b.eq	0xfffff7d7fec4  // b.none
   0x0000fffff7d7e224:	f100041f	cmp	x0, #0x1
   0x0000fffff7d7e228:	5400e100	b.eq	0xfffff7d7fe48  // b.none
   0x0000fffff7d7e22c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7d7e230:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7d7e234:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7d7e238:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7d7e23c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7d7e240:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7d7e244:	36d801d1	tbz	w17, #27, 0xfffff7d7e27c
   0x0000fffff7d7e248:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e24c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e250:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e254:	54000281	b.ne	0xfffff7d7e2a4  // b.any
   0x0000fffff7d7e258:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7e25c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e260:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e264:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e268:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e26c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e270:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e274:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e278:	54000169	b.ls	0xfffff7d7e2a4  // b.plast
   0x0000fffff7d7e27c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e280:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e284:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e288:	36d80091	tbz	w17, #27, 0xfffff7d7e298
   0x0000fffff7d7e28c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e290:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e294:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e298:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7e29c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7e2a0:	1400000e	b	0xfffff7d7e2d8
   0x0000fffff7d7e2a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e2a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e2ac:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e2b0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e2b4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7d7e2b8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e2bc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e2c0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7d7e2c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e2c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e2cc:	d63f0200	blr	x16
   0x0000fffff7d7e2d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e2d4:	5400dfc0	b.eq	0xfffff7d7fecc  // b.none
   0x0000fffff7d7e2d8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7e2dc:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e2e0:	540003a0	b.eq	0xfffff7d7e354  // b.none
   0x0000fffff7d7e2e4:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7d7e2e8:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7d7e2ec:	b9400171	ldr	w17, [x11]
   0x0000fffff7d7e2f0:	36d801d1	tbz	w17, #27, 0xfffff7d7e328
   0x0000fffff7d7e2f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e2f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e2fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e300:	540002a1	b.ne	0xfffff7d7e354  // b.any
   0x0000fffff7d7e304:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7d7e308:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e30c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e310:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e314:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e318:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e31c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e320:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e324:	54000189	b.ls	0xfffff7d7e354  // b.plast
   0x0000fffff7d7e328:	36d8008d	tbz	w13, #27, 0xfffff7d7e338
   0x0000fffff7d7e32c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e330:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e334:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e338:	36d80091	tbz	w17, #27, 0xfffff7d7e348
   0x0000fffff7d7e33c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e340:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e344:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e348:	f900056c	str	x12, [x11, #8]
   0x0000fffff7d7e34c:	b900016d	str	w13, [x11]
   0x0000fffff7d7e350:	1400000e	b	0xfffff7d7e388
   0x0000fffff7d7e354:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7e358:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e35c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e360:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e364:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7d7e368:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e36c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e370:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7d7e374:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e378:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e37c:	d63f0200	blr	x16
   0x0000fffff7d7e380:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e384:	5400da80	b.eq	0xfffff7d7fed4  // b.none
   0x0000fffff7d7e388:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7e38c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e390:	540004a0	b.eq	0xfffff7d7e424  // b.none
   0x0000fffff7d7e394:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e398:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e39c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e3a0:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e3a4:	54000400	b.eq	0xfffff7d7e424  // b.none
   0x0000fffff7d7e3a8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e3ac:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e3b0:	36d801d1	tbz	w17, #27, 0xfffff7d7e3e8
   0x0000fffff7d7e3b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e3b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e3bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e3c0:	54000321	b.ne	0xfffff7d7e424  // b.any
   0x0000fffff7d7e3c4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e3c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e3cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e3d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e3d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e3d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e3dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e3e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e3e4:	54000209	b.ls	0xfffff7d7e424  // b.plast
   0x0000fffff7d7e3e8:	36d8008d	tbz	w13, #27, 0xfffff7d7e3f8
   0x0000fffff7d7e3ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e3f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e3f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e3f8:	36d80091	tbz	w17, #27, 0xfffff7d7e408
   0x0000fffff7d7e3fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e400:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e404:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e408:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7e40c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7e410:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e414:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e418:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7e41c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7e420:	1400000e	b	0xfffff7d7e458
   0x0000fffff7d7e424:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7e428:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e42c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e430:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e434:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7d7e438:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e43c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e440:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7e444:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e448:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e44c:	d63f0200	blr	x16
   0x0000fffff7d7e450:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e454:	5400d440	b.eq	0xfffff7d7fedc  // b.none
   0x0000fffff7d7e458:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e45c:	37d806a9	tbnz	w9, #27, 0xfffff7d7e530
   0x0000fffff7d7e460:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e464:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e468:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e46c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e470:	540001c1	b.ne	0xfffff7d7e4a8  // b.any
   0x0000fffff7d7e474:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7e478:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e47c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e480:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e484:	54000121	b.ne	0xfffff7d7e4a8  // b.any
   0x0000fffff7d7e488:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7e48c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7e490:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7e494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e49c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7e4a0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7e4a4:	14000030	b	0xfffff7d7e564
   0x0000fffff7d7e4a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e4ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e4b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e4b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e4b8:	54000120	b.eq	0xfffff7d7e4dc  // b.none
   0x0000fffff7d7e4bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e4c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e4c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e4c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e4cc:	54000321	b.ne	0xfffff7d7e530  // b.any
   0x0000fffff7d7e4d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7e4d4:	9e620120	scvtf	d0, x9
   0x0000fffff7d7e4d8:	14000002	b	0xfffff7d7e4e0
   0x0000fffff7d7e4dc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7e4e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7e4e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e4e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e4ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e4f0:	54000120	b.eq	0xfffff7d7e514  // b.none
   0x0000fffff7d7e4f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7e4f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e4fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e500:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e504:	54000161	b.ne	0xfffff7d7e530  // b.any
   0x0000fffff7d7e508:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7e50c:	9e620121	scvtf	d1, x9
   0x0000fffff7d7e510:	14000002	b	0xfffff7d7e518
   0x0000fffff7d7e514:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7e518:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7e51c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7e520:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e524:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e528:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7e52c:	17ffffde	b	0xfffff7d7e4a4
   0x0000fffff7d7e530:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e534:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e538:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e53c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e540:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7d7e544:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e548:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e54c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7e550:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e554:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e558:	d63f0200	blr	x16
   0x0000fffff7d7e55c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e560:	5400cc20	b.eq	0xfffff7d7fee4  // b.none
   0x0000fffff7d7e564:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7e568:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e56c:	540004a0	b.eq	0xfffff7d7e600  // b.none
   0x0000fffff7d7e570:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e574:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e578:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e57c:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e580:	54000400	b.eq	0xfffff7d7e600  // b.none
   0x0000fffff7d7e584:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e588:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e58c:	36d801d1	tbz	w17, #27, 0xfffff7d7e5c4
   0x0000fffff7d7e590:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e594:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e598:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e59c:	54000321	b.ne	0xfffff7d7e600  // b.any
   0x0000fffff7d7e5a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e5a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e5a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e5ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e5b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e5b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e5b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e5bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e5c0:	54000209	b.ls	0xfffff7d7e600  // b.plast
   0x0000fffff7d7e5c4:	36d8008d	tbz	w13, #27, 0xfffff7d7e5d4
   0x0000fffff7d7e5c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e5cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e5d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e5d4:	36d80091	tbz	w17, #27, 0xfffff7d7e5e4
   0x0000fffff7d7e5d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e5dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e5e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e5e4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7e5e8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7e5ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e5f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e5f4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7e5f8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7e5fc:	1400000e	b	0xfffff7d7e634
   0x0000fffff7d7e600:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7e604:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e608:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e60c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e610:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7d7e614:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e618:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e61c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7e620:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e624:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e628:	d63f0200	blr	x16
   0x0000fffff7d7e62c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e630:	5400c5e0	b.eq	0xfffff7d7feec  // b.none
   0x0000fffff7d7e634:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e638:	37d806a9	tbnz	w9, #27, 0xfffff7d7e70c
   0x0000fffff7d7e63c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e640:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e648:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e64c:	540001c1	b.ne	0xfffff7d7e684  // b.any
   0x0000fffff7d7e650:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7e654:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e65c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e660:	54000121	b.ne	0xfffff7d7e684  // b.any
   0x0000fffff7d7e664:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7e668:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7e66c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7e670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e678:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7e67c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7e680:	14000030	b	0xfffff7d7e740
   0x0000fffff7d7e684:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e688:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e68c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e690:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e694:	54000120	b.eq	0xfffff7d7e6b8  // b.none
   0x0000fffff7d7e698:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e69c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e6a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e6a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e6a8:	54000321	b.ne	0xfffff7d7e70c  // b.any
   0x0000fffff7d7e6ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7e6b0:	9e620120	scvtf	d0, x9
   0x0000fffff7d7e6b4:	14000002	b	0xfffff7d7e6bc
   0x0000fffff7d7e6b8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7e6bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7e6c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e6c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e6c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e6cc:	54000120	b.eq	0xfffff7d7e6f0  // b.none
   0x0000fffff7d7e6d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7e6d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e6d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e6dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e6e0:	54000161	b.ne	0xfffff7d7e70c  // b.any
   0x0000fffff7d7e6e4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7e6e8:	9e620121	scvtf	d1, x9
   0x0000fffff7d7e6ec:	14000002	b	0xfffff7d7e6f4
   0x0000fffff7d7e6f0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7e6f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7e6f8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7e6fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e704:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7e708:	17ffffde	b	0xfffff7d7e680
   0x0000fffff7d7e70c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e710:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e714:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e718:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e71c:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7d7e720:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e724:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e728:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7e72c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e730:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e734:	d63f0200	blr	x16
   0x0000fffff7d7e738:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e73c:	5400bdc0	b.eq	0xfffff7d7fef4  // b.none
   0x0000fffff7d7e740:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7e744:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e748:	540004a0	b.eq	0xfffff7d7e7dc  // b.none
   0x0000fffff7d7e74c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e750:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e754:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e758:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e75c:	54000400	b.eq	0xfffff7d7e7dc  // b.none
   0x0000fffff7d7e760:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e764:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e768:	36d801d1	tbz	w17, #27, 0xfffff7d7e7a0
   0x0000fffff7d7e76c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e770:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e774:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e778:	54000321	b.ne	0xfffff7d7e7dc  // b.any
   0x0000fffff7d7e77c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e780:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e784:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e788:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e78c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e790:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e794:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e798:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e79c:	54000209	b.ls	0xfffff7d7e7dc  // b.plast
   0x0000fffff7d7e7a0:	36d8008d	tbz	w13, #27, 0xfffff7d7e7b0
   0x0000fffff7d7e7a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e7a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e7ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e7b0:	36d80091	tbz	w17, #27, 0xfffff7d7e7c0
   0x0000fffff7d7e7b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e7b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e7bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e7c0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7e7c4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7e7c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e7cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e7d0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7e7d4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7e7d8:	1400000e	b	0xfffff7d7e810
   0x0000fffff7d7e7dc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7e7e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e7e4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e7e8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e7ec:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7d7e7f0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e7f4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e7f8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7e7fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e800:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e804:	d63f0200	blr	x16
   0x0000fffff7d7e808:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e80c:	5400b780	b.eq	0xfffff7d7fefc  // b.none
   0x0000fffff7d7e810:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e814:	37d806a9	tbnz	w9, #27, 0xfffff7d7e8e8
   0x0000fffff7d7e818:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e81c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e820:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e824:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e828:	540001c1	b.ne	0xfffff7d7e860  // b.any
   0x0000fffff7d7e82c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7e830:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e834:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e838:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e83c:	54000121	b.ne	0xfffff7d7e860  // b.any
   0x0000fffff7d7e840:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7e844:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7e848:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7e84c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e854:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7e858:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7e85c:	14000030	b	0xfffff7d7e91c
   0x0000fffff7d7e860:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e864:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e86c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e870:	54000120	b.eq	0xfffff7d7e894  // b.none
   0x0000fffff7d7e874:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e87c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e880:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e884:	54000321	b.ne	0xfffff7d7e8e8  // b.any
   0x0000fffff7d7e888:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7e88c:	9e620120	scvtf	d0, x9
   0x0000fffff7d7e890:	14000002	b	0xfffff7d7e898
   0x0000fffff7d7e894:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7e898:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7e89c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e8a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e8a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e8a8:	54000120	b.eq	0xfffff7d7e8cc  // b.none
   0x0000fffff7d7e8ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7e8b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e8b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e8b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e8bc:	54000161	b.ne	0xfffff7d7e8e8  // b.any
   0x0000fffff7d7e8c0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7e8c4:	9e620121	scvtf	d1, x9
   0x0000fffff7d7e8c8:	14000002	b	0xfffff7d7e8d0
   0x0000fffff7d7e8cc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7e8d0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7e8d4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7e8d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e8dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e8e0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7e8e4:	17ffffde	b	0xfffff7d7e85c
   0x0000fffff7d7e8e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e8ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e8f0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e8f4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e8f8:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7d7e8fc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e900:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e904:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7e908:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e90c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e910:	d63f0200	blr	x16
   0x0000fffff7d7e914:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e918:	5400af60	b.eq	0xfffff7d7ff04  // b.none
   0x0000fffff7d7e91c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7e920:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e924:	540004a0	b.eq	0xfffff7d7e9b8  // b.none
   0x0000fffff7d7e928:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e92c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e930:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e934:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e938:	54000400	b.eq	0xfffff7d7e9b8  // b.none
   0x0000fffff7d7e93c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e940:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e944:	36d801d1	tbz	w17, #27, 0xfffff7d7e97c
   0x0000fffff7d7e948:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e94c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e950:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e954:	54000321	b.ne	0xfffff7d7e9b8  // b.any
   0x0000fffff7d7e958:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e95c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e960:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e964:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e968:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e96c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e970:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e974:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e978:	54000209	b.ls	0xfffff7d7e9b8  // b.plast
   0x0000fffff7d7e97c:	36d8008d	tbz	w13, #27, 0xfffff7d7e98c
   0x0000fffff7d7e980:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e984:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e988:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e98c:	36d80091	tbz	w17, #27, 0xfffff7d7e99c
   0x0000fffff7d7e990:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e994:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e998:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e99c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7e9a0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7e9a4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e9a8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e9ac:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7e9b0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7e9b4:	1400000e	b	0xfffff7d7e9ec
   0x0000fffff7d7e9b8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7e9bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e9c0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e9c4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e9c8:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7d7e9cc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e9d0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e9d4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7e9d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e9dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e9e0:	d63f0200	blr	x16
   0x0000fffff7d7e9e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e9e8:	5400a920	b.eq	0xfffff7d7ff0c  // b.none
   0x0000fffff7d7e9ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e9f0:	37d806a9	tbnz	w9, #27, 0xfffff7d7eac4
   0x0000fffff7d7e9f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e9f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e9fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea00:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea04:	540001c1	b.ne	0xfffff7d7ea3c  // b.any
   0x0000fffff7d7ea08:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ea0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ea10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea14:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea18:	54000121	b.ne	0xfffff7d7ea3c  // b.any
   0x0000fffff7d7ea1c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ea20:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7ea24:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7ea28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ea2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea30:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7ea34:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7ea38:	14000030	b	0xfffff7d7eaf8
   0x0000fffff7d7ea3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ea40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ea44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea48:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea4c:	54000120	b.eq	0xfffff7d7ea70  // b.none
   0x0000fffff7d7ea50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ea54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ea58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea60:	54000321	b.ne	0xfffff7d7eac4  // b.any
   0x0000fffff7d7ea64:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ea68:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ea6c:	14000002	b	0xfffff7d7ea74
   0x0000fffff7d7ea70:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7ea74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ea78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ea7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea80:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea84:	54000120	b.eq	0xfffff7d7eaa8  // b.none
   0x0000fffff7d7ea88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ea8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ea90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea94:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea98:	54000161	b.ne	0xfffff7d7eac4  // b.any
   0x0000fffff7d7ea9c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7eaa0:	9e620121	scvtf	d1, x9
   0x0000fffff7d7eaa4:	14000002	b	0xfffff7d7eaac
   0x0000fffff7d7eaa8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7eaac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7eab0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7eab4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7eab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eabc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7eac0:	17ffffde	b	0xfffff7d7ea38
   0x0000fffff7d7eac4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7eac8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7eacc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ead0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ead4:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7d7ead8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7eadc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7eae0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7eae4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7eae8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7eaec:	d63f0200	blr	x16
   0x0000fffff7d7eaf0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eaf4:	5400a100	b.eq	0xfffff7d7ff14  // b.none
   0x0000fffff7d7eaf8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7eafc:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7eb00:	540004a0	b.eq	0xfffff7d7eb94  // b.none
   0x0000fffff7d7eb04:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7eb08:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7eb0c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7eb10:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7eb14:	54000400	b.eq	0xfffff7d7eb94  // b.none
   0x0000fffff7d7eb18:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7eb1c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7eb20:	36d801d1	tbz	w17, #27, 0xfffff7d7eb58
   0x0000fffff7d7eb24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7eb28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7eb2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7eb30:	54000321	b.ne	0xfffff7d7eb94  // b.any
   0x0000fffff7d7eb34:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7eb38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7eb3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7eb40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7eb44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7eb48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7eb4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7eb50:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7eb54:	54000209	b.ls	0xfffff7d7eb94  // b.plast
   0x0000fffff7d7eb58:	36d8008d	tbz	w13, #27, 0xfffff7d7eb68
   0x0000fffff7d7eb5c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7eb60:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7eb64:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7eb68:	36d80091	tbz	w17, #27, 0xfffff7d7eb78
   0x0000fffff7d7eb6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7eb70:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7eb74:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7eb78:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7eb7c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7eb80:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7eb84:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7eb88:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7eb8c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7eb90:	1400000e	b	0xfffff7d7ebc8
   0x0000fffff7d7eb94:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7eb98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7eb9c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7eba0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7eba4:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7d7eba8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ebac:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ebb0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7ebb4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ebb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ebbc:	d63f0200	blr	x16
   0x0000fffff7d7ebc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ebc4:	54009ac0	b.eq	0xfffff7d7ff1c  // b.none
   0x0000fffff7d7ebc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ebcc:	37d806a9	tbnz	w9, #27, 0xfffff7d7eca0
   0x0000fffff7d7ebd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ebd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ebd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ebdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ebe0:	540001c1	b.ne	0xfffff7d7ec18  // b.any
   0x0000fffff7d7ebe4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ebe8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ebec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ebf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ebf4:	54000121	b.ne	0xfffff7d7ec18  // b.any
   0x0000fffff7d7ebf8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ebfc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7ec00:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7ec04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ec08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ec0c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7ec10:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7ec14:	14000030	b	0xfffff7d7ecd4
   0x0000fffff7d7ec18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ec1c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ec20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ec24:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ec28:	54000120	b.eq	0xfffff7d7ec4c  // b.none
   0x0000fffff7d7ec2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ec30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ec34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ec38:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ec3c:	54000321	b.ne	0xfffff7d7eca0  // b.any
   0x0000fffff7d7ec40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ec44:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ec48:	14000002	b	0xfffff7d7ec50
   0x0000fffff7d7ec4c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7ec50:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ec54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ec58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ec5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ec60:	54000120	b.eq	0xfffff7d7ec84  // b.none
   0x0000fffff7d7ec64:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ec68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ec6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ec70:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ec74:	54000161	b.ne	0xfffff7d7eca0  // b.any
   0x0000fffff7d7ec78:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7ec7c:	9e620121	scvtf	d1, x9
   0x0000fffff7d7ec80:	14000002	b	0xfffff7d7ec88
   0x0000fffff7d7ec84:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7ec88:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7ec8c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7ec90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ec94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ec98:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7ec9c:	17ffffde	b	0xfffff7d7ec14
   0x0000fffff7d7eca0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7eca4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7eca8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ecac:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ecb0:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7d7ecb4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ecb8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ecbc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7ecc0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7ecc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ecc8:	d63f0200	blr	x16
   0x0000fffff7d7eccc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ecd0:	540092a0	b.eq	0xfffff7d7ff24  // b.none
   0x0000fffff7d7ecd4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7ecd8:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7ecdc:	540004a0	b.eq	0xfffff7d7ed70  // b.none
   0x0000fffff7d7ece0:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7ece4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7ece8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7ecec:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7ecf0:	54000400	b.eq	0xfffff7d7ed70  // b.none
   0x0000fffff7d7ecf4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ecf8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7ecfc:	36d801d1	tbz	w17, #27, 0xfffff7d7ed34
   0x0000fffff7d7ed00:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7ed04:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7ed08:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7ed0c:	54000321	b.ne	0xfffff7d7ed70  // b.any
   0x0000fffff7d7ed10:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7ed14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ed18:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7ed1c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7ed20:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ed24:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7ed28:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7ed2c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7ed30:	54000209	b.ls	0xfffff7d7ed70  // b.plast
   0x0000fffff7d7ed34:	36d8008d	tbz	w13, #27, 0xfffff7d7ed44
   0x0000fffff7d7ed38:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7ed3c:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7ed40:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7ed44:	36d80091	tbz	w17, #27, 0xfffff7d7ed54
   0x0000fffff7d7ed48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ed4c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ed50:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ed54:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7ed58:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7ed5c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7ed60:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7ed64:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7ed68:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7ed6c:	1400000e	b	0xfffff7d7eda4
   0x0000fffff7d7ed70:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7ed74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ed78:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ed7c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ed80:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7d7ed84:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ed88:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ed8c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7ed90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ed94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ed98:	d63f0200	blr	x16
   0x0000fffff7d7ed9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eda0:	54008c60	b.eq	0xfffff7d7ff2c  // b.none
   0x0000fffff7d7eda4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7eda8:	37d806a9	tbnz	w9, #27, 0xfffff7d7ee7c
   0x0000fffff7d7edac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7edb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7edb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7edb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7edbc:	540001c1	b.ne	0xfffff7d7edf4  // b.any
   0x0000fffff7d7edc0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7edc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7edc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7edcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7edd0:	54000121	b.ne	0xfffff7d7edf4  // b.any
   0x0000fffff7d7edd4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7edd8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7eddc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7ede0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ede4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ede8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7edec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7edf0:	14000030	b	0xfffff7d7eeb0
   0x0000fffff7d7edf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7edf8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7edfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee00:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee04:	54000120	b.eq	0xfffff7d7ee28  // b.none
   0x0000fffff7d7ee08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ee0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ee10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee14:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee18:	54000321	b.ne	0xfffff7d7ee7c  // b.any
   0x0000fffff7d7ee1c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ee20:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ee24:	14000002	b	0xfffff7d7ee2c
   0x0000fffff7d7ee28:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7ee2c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ee30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ee34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee38:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee3c:	54000120	b.eq	0xfffff7d7ee60  // b.none
   0x0000fffff7d7ee40:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ee44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ee48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee50:	54000161	b.ne	0xfffff7d7ee7c  // b.any
   0x0000fffff7d7ee54:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7ee58:	9e620121	scvtf	d1, x9
   0x0000fffff7d7ee5c:	14000002	b	0xfffff7d7ee64
   0x0000fffff7d7ee60:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7ee64:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7ee68:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7ee6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ee70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee74:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7ee78:	17ffffde	b	0xfffff7d7edf0
   0x0000fffff7d7ee7c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7ee80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ee84:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ee88:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ee8c:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7d7ee90:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ee94:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ee98:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7ee9c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7eea0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7eea4:	d63f0200	blr	x16
   0x0000fffff7d7eea8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eeac:	54008440	b.eq	0xfffff7d7ff34  // b.none
   0x0000fffff7d7eeb0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7eeb4:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7eeb8:	540004a0	b.eq	0xfffff7d7ef4c  // b.none
   0x0000fffff7d7eebc:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7eec0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7eec4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7eec8:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7eecc:	54000400	b.eq	0xfffff7d7ef4c  // b.none
   0x0000fffff7d7eed0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7eed4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7eed8:	36d801d1	tbz	w17, #27, 0xfffff7d7ef10
   0x0000fffff7d7eedc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7eee0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7eee4:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7eee8:	54000321	b.ne	0xfffff7d7ef4c  // b.any
   0x0000fffff7d7eeec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7eef0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7eef4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7eef8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7eefc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ef00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7ef04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7ef08:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7ef0c:	54000209	b.ls	0xfffff7d7ef4c  // b.plast
   0x0000fffff7d7ef10:	36d8008d	tbz	w13, #27, 0xfffff7d7ef20
   0x0000fffff7d7ef14:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7ef18:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7ef1c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7ef20:	36d80091	tbz	w17, #27, 0xfffff7d7ef30
   0x0000fffff7d7ef24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ef28:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ef2c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ef30:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7ef34:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7ef38:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7ef3c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7ef40:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7ef44:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7ef48:	1400000e	b	0xfffff7d7ef80
   0x0000fffff7d7ef4c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7ef50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ef54:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ef58:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ef5c:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7d7ef60:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ef64:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ef68:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7ef6c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ef70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ef74:	d63f0200	blr	x16
   0x0000fffff7d7ef78:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ef7c:	54007e00	b.eq	0xfffff7d7ff3c  // b.none
   0x0000fffff7d7ef80:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ef84:	37d806a9	tbnz	w9, #27, 0xfffff7d7f058
   0x0000fffff7d7ef88:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ef8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ef90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ef94:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ef98:	540001c1	b.ne	0xfffff7d7efd0  // b.any
   0x0000fffff7d7ef9c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7efa0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7efa4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7efa8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7efac:	54000121	b.ne	0xfffff7d7efd0  // b.any
   0x0000fffff7d7efb0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7efb4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7efb8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7efbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7efc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7efc4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7efc8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7efcc:	14000030	b	0xfffff7d7f08c
   0x0000fffff7d7efd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7efd4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7efd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7efdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7efe0:	54000120	b.eq	0xfffff7d7f004  // b.none
   0x0000fffff7d7efe4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7efe8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7efec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eff0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eff4:	54000321	b.ne	0xfffff7d7f058  // b.any
   0x0000fffff7d7eff8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7effc:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f000:	14000002	b	0xfffff7d7f008
   0x0000fffff7d7f004:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7f008:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f00c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f014:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f018:	54000120	b.eq	0xfffff7d7f03c  // b.none
   0x0000fffff7d7f01c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f020:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f024:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f028:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f02c:	54000161	b.ne	0xfffff7d7f058  // b.any
   0x0000fffff7d7f030:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7f034:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f038:	14000002	b	0xfffff7d7f040
   0x0000fffff7d7f03c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7f040:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f044:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7f048:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f04c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f050:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f054:	17ffffde	b	0xfffff7d7efcc
   0x0000fffff7d7f058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f05c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f060:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f064:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f068:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7d7f06c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f070:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f074:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f07c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f080:	d63f0200	blr	x16
   0x0000fffff7d7f084:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f088:	540075e0	b.eq	0xfffff7d7ff44  // b.none
   0x0000fffff7d7f08c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7f090:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f094:	540004a0	b.eq	0xfffff7d7f128  // b.none
   0x0000fffff7d7f098:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f09c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f0a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f0a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f0a8:	54000400	b.eq	0xfffff7d7f128  // b.none
   0x0000fffff7d7f0ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f0b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f0b4:	36d801d1	tbz	w17, #27, 0xfffff7d7f0ec
   0x0000fffff7d7f0b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f0bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f0c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f0c4:	54000321	b.ne	0xfffff7d7f128  // b.any
   0x0000fffff7d7f0c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f0cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f0d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f0d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f0d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f0dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f0e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f0e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f0e8:	54000209	b.ls	0xfffff7d7f128  // b.plast
   0x0000fffff7d7f0ec:	36d8008d	tbz	w13, #27, 0xfffff7d7f0fc
   0x0000fffff7d7f0f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f0f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f0f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f0fc:	36d80091	tbz	w17, #27, 0xfffff7d7f10c
   0x0000fffff7d7f100:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f104:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f108:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f10c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7f110:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7f114:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f118:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f11c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7f120:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7f124:	1400000e	b	0xfffff7d7f15c
   0x0000fffff7d7f128:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7f12c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f130:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f134:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f138:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7d7f13c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f140:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f144:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7f148:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f14c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f150:	d63f0200	blr	x16
   0x0000fffff7d7f154:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f158:	54006fa0	b.eq	0xfffff7d7ff4c  // b.none
   0x0000fffff7d7f15c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f160:	37d806a9	tbnz	w9, #27, 0xfffff7d7f234
   0x0000fffff7d7f164:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f168:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f16c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f170:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f174:	540001c1	b.ne	0xfffff7d7f1ac  // b.any
   0x0000fffff7d7f178:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f17c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f184:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f188:	54000121	b.ne	0xfffff7d7f1ac  // b.any
   0x0000fffff7d7f18c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f190:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7f194:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f1a0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7f1a4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f1a8:	14000030	b	0xfffff7d7f268
   0x0000fffff7d7f1ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f1b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f1b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f1b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f1bc:	54000120	b.eq	0xfffff7d7f1e0  // b.none
   0x0000fffff7d7f1c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f1c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f1c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f1cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f1d0:	54000321	b.ne	0xfffff7d7f234  // b.any
   0x0000fffff7d7f1d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f1d8:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f1dc:	14000002	b	0xfffff7d7f1e4
   0x0000fffff7d7f1e0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7f1e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f1e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f1ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f1f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f1f4:	54000120	b.eq	0xfffff7d7f218  // b.none
   0x0000fffff7d7f1f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f1fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f200:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f204:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f208:	54000161	b.ne	0xfffff7d7f234  // b.any
   0x0000fffff7d7f20c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7f210:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f214:	14000002	b	0xfffff7d7f21c
   0x0000fffff7d7f218:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7f21c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f220:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7f224:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f228:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f22c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f230:	17ffffde	b	0xfffff7d7f1a8
   0x0000fffff7d7f234:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f238:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f23c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f240:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f244:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7d7f248:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f24c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f250:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f254:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f258:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f25c:	d63f0200	blr	x16
   0x0000fffff7d7f260:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f264:	54006780	b.eq	0xfffff7d7ff54  // b.none
   0x0000fffff7d7f268:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7f26c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f270:	540004a0	b.eq	0xfffff7d7f304  // b.none
   0x0000fffff7d7f274:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f278:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f27c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f280:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f284:	54000400	b.eq	0xfffff7d7f304  // b.none
   0x0000fffff7d7f288:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f28c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f290:	36d801d1	tbz	w17, #27, 0xfffff7d7f2c8
   0x0000fffff7d7f294:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f298:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f29c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f2a0:	54000321	b.ne	0xfffff7d7f304  // b.any
   0x0000fffff7d7f2a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f2a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f2ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f2b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f2b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f2b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f2bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f2c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f2c4:	54000209	b.ls	0xfffff7d7f304  // b.plast
   0x0000fffff7d7f2c8:	36d8008d	tbz	w13, #27, 0xfffff7d7f2d8
   0x0000fffff7d7f2cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f2d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f2d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f2d8:	36d80091	tbz	w17, #27, 0xfffff7d7f2e8
   0x0000fffff7d7f2dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f2e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f2e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f2e8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7f2ec:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7f2f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f2f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f2f8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7f2fc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7f300:	1400000e	b	0xfffff7d7f338
   0x0000fffff7d7f304:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7f308:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f30c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f310:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f314:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7d7f318:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f31c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f320:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7f324:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f328:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f32c:	d63f0200	blr	x16
   0x0000fffff7d7f330:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f334:	54006140	b.eq	0xfffff7d7ff5c  // b.none
   0x0000fffff7d7f338:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f33c:	37d806a9	tbnz	w9, #27, 0xfffff7d7f410
   0x0000fffff7d7f340:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f344:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f348:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f34c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f350:	540001c1	b.ne	0xfffff7d7f388  // b.any
   0x0000fffff7d7f354:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f358:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f35c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f360:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f364:	54000121	b.ne	0xfffff7d7f388  // b.any
   0x0000fffff7d7f368:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f36c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7f370:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f374:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f37c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7f380:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f384:	14000030	b	0xfffff7d7f444
   0x0000fffff7d7f388:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f38c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f390:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f394:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f398:	54000120	b.eq	0xfffff7d7f3bc  // b.none
   0x0000fffff7d7f39c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f3a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f3a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f3a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f3ac:	54000321	b.ne	0xfffff7d7f410  // b.any
   0x0000fffff7d7f3b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f3b4:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f3b8:	14000002	b	0xfffff7d7f3c0
   0x0000fffff7d7f3bc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7f3c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f3c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f3c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f3cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f3d0:	54000120	b.eq	0xfffff7d7f3f4  // b.none
   0x0000fffff7d7f3d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f3d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f3dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f3e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f3e4:	54000161	b.ne	0xfffff7d7f410  // b.any
   0x0000fffff7d7f3e8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7f3ec:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f3f0:	14000002	b	0xfffff7d7f3f8
   0x0000fffff7d7f3f4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7f3f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f3fc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7f400:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f404:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f408:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f40c:	17ffffde	b	0xfffff7d7f384
   0x0000fffff7d7f410:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f414:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f418:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f41c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f420:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7d7f424:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f428:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f42c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f430:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f438:	d63f0200	blr	x16
   0x0000fffff7d7f43c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f440:	54005920	b.eq	0xfffff7d7ff64  // b.none
   0x0000fffff7d7f444:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7f448:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f44c:	540004a0	b.eq	0xfffff7d7f4e0  // b.none
   0x0000fffff7d7f450:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f454:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f458:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f45c:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f460:	54000400	b.eq	0xfffff7d7f4e0  // b.none
   0x0000fffff7d7f464:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f468:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f46c:	36d801d1	tbz	w17, #27, 0xfffff7d7f4a4
   0x0000fffff7d7f470:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f474:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f478:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f47c:	54000321	b.ne	0xfffff7d7f4e0  // b.any
   0x0000fffff7d7f480:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f484:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f488:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f48c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f490:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f494:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f498:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f49c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f4a0:	54000209	b.ls	0xfffff7d7f4e0  // b.plast
   0x0000fffff7d7f4a4:	36d8008d	tbz	w13, #27, 0xfffff7d7f4b4
   0x0000fffff7d7f4a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f4ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f4b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f4b4:	36d80091	tbz	w17, #27, 0xfffff7d7f4c4
   0x0000fffff7d7f4b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f4bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f4c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f4c4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7f4c8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7f4cc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f4d0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f4d4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7f4d8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7f4dc:	1400000e	b	0xfffff7d7f514
   0x0000fffff7d7f4e0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7f4e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f4e8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f4ec:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f4f0:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7d7f4f4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f4f8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f4fc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7f500:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f504:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f508:	d63f0200	blr	x16
   0x0000fffff7d7f50c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f510:	540052e0	b.eq	0xfffff7d7ff6c  // b.none
   0x0000fffff7d7f514:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f518:	37d806a9	tbnz	w9, #27, 0xfffff7d7f5ec
   0x0000fffff7d7f51c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f520:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f524:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f528:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f52c:	540001c1	b.ne	0xfffff7d7f564  // b.any
   0x0000fffff7d7f530:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f534:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f538:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f53c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f540:	54000121	b.ne	0xfffff7d7f564  // b.any
   0x0000fffff7d7f544:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f548:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7f54c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f550:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f558:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7f55c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f560:	14000030	b	0xfffff7d7f620
   0x0000fffff7d7f564:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f568:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f56c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f570:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f574:	54000120	b.eq	0xfffff7d7f598  // b.none
   0x0000fffff7d7f578:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f57c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f580:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f584:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f588:	54000321	b.ne	0xfffff7d7f5ec  // b.any
   0x0000fffff7d7f58c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f590:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f594:	14000002	b	0xfffff7d7f59c
   0x0000fffff7d7f598:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7f59c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f5a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f5a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f5a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f5ac:	54000120	b.eq	0xfffff7d7f5d0  // b.none
   0x0000fffff7d7f5b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f5b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f5b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f5bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f5c0:	54000161	b.ne	0xfffff7d7f5ec  // b.any
   0x0000fffff7d7f5c4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7f5c8:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f5cc:	14000002	b	0xfffff7d7f5d4
   0x0000fffff7d7f5d0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7f5d4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f5d8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7f5dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f5e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f5e4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f5e8:	17ffffde	b	0xfffff7d7f560
   0x0000fffff7d7f5ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f5f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f5f4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f5f8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f5fc:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7d7f600:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f604:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f608:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f60c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f610:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f614:	d63f0200	blr	x16
   0x0000fffff7d7f618:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f61c:	54004ac0	b.eq	0xfffff7d7ff74  // b.none
   0x0000fffff7d7f620:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7f624:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f628:	540004a0	b.eq	0xfffff7d7f6bc  // b.none
   0x0000fffff7d7f62c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f630:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f634:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f638:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f63c:	54000400	b.eq	0xfffff7d7f6bc  // b.none
   0x0000fffff7d7f640:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f644:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f648:	36d801d1	tbz	w17, #27, 0xfffff7d7f680
   0x0000fffff7d7f64c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f650:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f654:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f658:	54000321	b.ne	0xfffff7d7f6bc  // b.any
   0x0000fffff7d7f65c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f660:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f664:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f668:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f66c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f670:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f674:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f678:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f67c:	54000209	b.ls	0xfffff7d7f6bc  // b.plast
   0x0000fffff7d7f680:	36d8008d	tbz	w13, #27, 0xfffff7d7f690
   0x0000fffff7d7f684:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f688:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f68c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f690:	36d80091	tbz	w17, #27, 0xfffff7d7f6a0
   0x0000fffff7d7f694:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f698:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f69c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f6a0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7f6a4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7f6a8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f6ac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f6b0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7f6b4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7f6b8:	1400000e	b	0xfffff7d7f6f0
   0x0000fffff7d7f6bc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7f6c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f6c4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f6c8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f6cc:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7d7f6d0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f6d4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f6d8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7f6dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f6e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f6e4:	d63f0200	blr	x16
   0x0000fffff7d7f6e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f6ec:	54004480	b.eq	0xfffff7d7ff7c  // b.none
   0x0000fffff7d7f6f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f6f4:	37d806a9	tbnz	w9, #27, 0xfffff7d7f7c8
   0x0000fffff7d7f6f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f6fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f704:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f708:	540001c1	b.ne	0xfffff7d7f740  // b.any
   0x0000fffff7d7f70c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f710:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f714:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f718:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f71c:	54000121	b.ne	0xfffff7d7f740  // b.any
   0x0000fffff7d7f720:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f724:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7f728:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f72c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f734:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7f738:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f73c:	14000030	b	0xfffff7d7f7fc
   0x0000fffff7d7f740:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f744:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f74c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f750:	54000120	b.eq	0xfffff7d7f774  // b.none
   0x0000fffff7d7f754:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f758:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f75c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f760:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f764:	54000321	b.ne	0xfffff7d7f7c8  // b.any
   0x0000fffff7d7f768:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f76c:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f770:	14000002	b	0xfffff7d7f778
   0x0000fffff7d7f774:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7f778:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f77c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f784:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f788:	54000120	b.eq	0xfffff7d7f7ac  // b.none
   0x0000fffff7d7f78c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f790:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f794:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f798:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f79c:	54000161	b.ne	0xfffff7d7f7c8  // b.any
   0x0000fffff7d7f7a0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7f7a4:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f7a8:	14000002	b	0xfffff7d7f7b0
   0x0000fffff7d7f7ac:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7f7b0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f7b4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7f7b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f7bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f7c0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f7c4:	17ffffde	b	0xfffff7d7f73c
   0x0000fffff7d7f7c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f7cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f7d0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f7d4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f7d8:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7d7f7dc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f7e0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f7e4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f7e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f7ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f7f0:	d63f0200	blr	x16
   0x0000fffff7d7f7f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f7f8:	54003c60	b.eq	0xfffff7d7ff84  // b.none
   0x0000fffff7d7f7fc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7f800:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f804:	540004a0	b.eq	0xfffff7d7f898  // b.none
   0x0000fffff7d7f808:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f80c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f810:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f814:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f818:	54000400	b.eq	0xfffff7d7f898  // b.none
   0x0000fffff7d7f81c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f820:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f824:	36d801d1	tbz	w17, #27, 0xfffff7d7f85c
   0x0000fffff7d7f828:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f82c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f830:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f834:	54000321	b.ne	0xfffff7d7f898  // b.any
   0x0000fffff7d7f838:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f83c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f840:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f844:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f848:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f84c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f850:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f854:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f858:	54000209	b.ls	0xfffff7d7f898  // b.plast
   0x0000fffff7d7f85c:	36d8008d	tbz	w13, #27, 0xfffff7d7f86c
   0x0000fffff7d7f860:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f864:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f868:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f86c:	36d80091	tbz	w17, #27, 0xfffff7d7f87c
   0x0000fffff7d7f870:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f874:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f878:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f87c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7f880:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7f884:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f888:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f88c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7f890:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7f894:	1400000e	b	0xfffff7d7f8cc
   0x0000fffff7d7f898:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7f89c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f8a0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f8a4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f8a8:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7d7f8ac:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f8b0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f8b4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7f8b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f8bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f8c0:	d63f0200	blr	x16
   0x0000fffff7d7f8c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f8c8:	54003620	b.eq	0xfffff7d7ff8c  // b.none
   0x0000fffff7d7f8cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f8d0:	37d806a9	tbnz	w9, #27, 0xfffff7d7f9a4
   0x0000fffff7d7f8d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f8d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f8dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f8e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f8e4:	540001c1	b.ne	0xfffff7d7f91c  // b.any
   0x0000fffff7d7f8e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f8ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f8f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f8f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f8f8:	54000121	b.ne	0xfffff7d7f91c  // b.any
   0x0000fffff7d7f8fc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f900:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7f904:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f90c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f910:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7f914:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f918:	14000030	b	0xfffff7d7f9d8
   0x0000fffff7d7f91c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f920:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f928:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f92c:	54000120	b.eq	0xfffff7d7f950  // b.none
   0x0000fffff7d7f930:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f93c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f940:	54000321	b.ne	0xfffff7d7f9a4  // b.any
   0x0000fffff7d7f944:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f948:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f94c:	14000002	b	0xfffff7d7f954
   0x0000fffff7d7f950:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7f954:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f958:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f95c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f960:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f964:	54000120	b.eq	0xfffff7d7f988  // b.none
   0x0000fffff7d7f968:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f96c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f974:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f978:	54000161	b.ne	0xfffff7d7f9a4  // b.any
   0x0000fffff7d7f97c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7f980:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f984:	14000002	b	0xfffff7d7f98c
   0x0000fffff7d7f988:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7f98c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f990:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7f994:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f99c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f9a0:	17ffffde	b	0xfffff7d7f918
   0x0000fffff7d7f9a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f9a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f9ac:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f9b0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f9b4:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7d7f9b8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f9bc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f9c0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f9c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f9c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f9cc:	d63f0200	blr	x16
   0x0000fffff7d7f9d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f9d4:	54002e00	b.eq	0xfffff7d7ff94  // b.none
   0x0000fffff7d7f9d8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7f9dc:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f9e0:	540004a0	b.eq	0xfffff7d7fa74  // b.none
   0x0000fffff7d7f9e4:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f9e8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f9ec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f9f0:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f9f4:	54000400	b.eq	0xfffff7d7fa74  // b.none
   0x0000fffff7d7f9f8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f9fc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7fa00:	36d801d1	tbz	w17, #27, 0xfffff7d7fa38
   0x0000fffff7d7fa04:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7fa08:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7fa0c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7fa10:	54000321	b.ne	0xfffff7d7fa74  // b.any
   0x0000fffff7d7fa14:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7fa18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7fa1c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7fa20:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7fa24:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7fa28:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7fa2c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7fa30:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7fa34:	54000209	b.ls	0xfffff7d7fa74  // b.plast
   0x0000fffff7d7fa38:	36d8008d	tbz	w13, #27, 0xfffff7d7fa48
   0x0000fffff7d7fa3c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7fa40:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7fa44:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7fa48:	36d80091	tbz	w17, #27, 0xfffff7d7fa58
   0x0000fffff7d7fa4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7fa50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7fa54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7fa58:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7fa5c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7fa60:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7fa64:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7fa68:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7fa6c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7fa70:	1400000e	b	0xfffff7d7faa8
   0x0000fffff7d7fa74:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7fa78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fa7c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fa80:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fa84:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7d7fa88:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fa8c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fa90:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7fa94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7fa98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fa9c:	d63f0200	blr	x16
   0x0000fffff7d7faa0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7faa4:	540027c0	b.eq	0xfffff7d7ff9c  // b.none
   0x0000fffff7d7faa8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7faac:	37d806a9	tbnz	w9, #27, 0xfffff7d7fb80
   0x0000fffff7d7fab0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7fab4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fabc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fac0:	540001c1	b.ne	0xfffff7d7faf8  // b.any
   0x0000fffff7d7fac4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fac8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7facc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fad0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fad4:	54000121	b.ne	0xfffff7d7faf8  // b.any
   0x0000fffff7d7fad8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7fadc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7fae0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7fae4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7faec:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7faf0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7faf4:	14000030	b	0xfffff7d7fbb4
   0x0000fffff7d7faf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7fafc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fb00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fb04:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fb08:	54000120	b.eq	0xfffff7d7fb2c  // b.none
   0x0000fffff7d7fb0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7fb10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fb14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fb18:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fb1c:	54000321	b.ne	0xfffff7d7fb80  // b.any
   0x0000fffff7d7fb20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7fb24:	9e620120	scvtf	d0, x9
   0x0000fffff7d7fb28:	14000002	b	0xfffff7d7fb30
   0x0000fffff7d7fb2c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7fb30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fb34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fb38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fb3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fb40:	54000120	b.eq	0xfffff7d7fb64  // b.none
   0x0000fffff7d7fb44:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fb48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fb4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fb50:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fb54:	54000161	b.ne	0xfffff7d7fb80  // b.any
   0x0000fffff7d7fb58:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7fb5c:	9e620121	scvtf	d1, x9
   0x0000fffff7d7fb60:	14000002	b	0xfffff7d7fb68
   0x0000fffff7d7fb64:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7fb68:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7fb6c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7fb70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fb74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fb78:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7fb7c:	17ffffde	b	0xfffff7d7faf4
   0x0000fffff7d7fb80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7fb84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fb88:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fb8c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fb90:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7d7fb94:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fb98:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fb9c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7fba0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7fba4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fba8:	d63f0200	blr	x16
   0x0000fffff7d7fbac:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7fbb0:	54001fa0	b.eq	0xfffff7d7ffa4  // b.none
   0x0000fffff7d7fbb4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7fbb8:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7fbbc:	540004a0	b.eq	0xfffff7d7fc50  // b.none
   0x0000fffff7d7fbc0:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7fbc4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7fbc8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7fbcc:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7fbd0:	54000400	b.eq	0xfffff7d7fc50  // b.none
   0x0000fffff7d7fbd4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7fbd8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7fbdc:	36d801d1	tbz	w17, #27, 0xfffff7d7fc14
   0x0000fffff7d7fbe0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7fbe4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7fbe8:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7fbec:	54000321	b.ne	0xfffff7d7fc50  // b.any
   0x0000fffff7d7fbf0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7fbf4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7fbf8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7fbfc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7fc00:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7fc04:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7fc08:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7fc0c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7fc10:	54000209	b.ls	0xfffff7d7fc50  // b.plast
   0x0000fffff7d7fc14:	36d8008d	tbz	w13, #27, 0xfffff7d7fc24
   0x0000fffff7d7fc18:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7fc1c:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7fc20:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7fc24:	36d80091	tbz	w17, #27, 0xfffff7d7fc34
   0x0000fffff7d7fc28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7fc2c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7fc30:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7fc34:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7fc38:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7fc3c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7fc40:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7fc44:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7fc48:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7fc4c:	1400000e	b	0xfffff7d7fc84
   0x0000fffff7d7fc50:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7fc54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fc58:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fc5c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fc60:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7d7fc64:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fc68:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fc6c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7fc70:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7fc74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fc78:	d63f0200	blr	x16
   0x0000fffff7d7fc7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7fc80:	54001960	b.eq	0xfffff7d7ffac  // b.none
   0x0000fffff7d7fc84:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7fc88:	37d806a9	tbnz	w9, #27, 0xfffff7d7fd5c
   0x0000fffff7d7fc8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7fc90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fc94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fc98:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fc9c:	540001c1	b.ne	0xfffff7d7fcd4  // b.any
   0x0000fffff7d7fca0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fca4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fcac:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fcb0:	54000121	b.ne	0xfffff7d7fcd4  // b.any
   0x0000fffff7d7fcb4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7fcb8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7fcbc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7fcc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fcc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fcc8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7fccc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7fcd0:	14000030	b	0xfffff7d7fd90
   0x0000fffff7d7fcd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7fcd8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fcdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fce0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fce4:	54000120	b.eq	0xfffff7d7fd08  // b.none
   0x0000fffff7d7fce8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7fcec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fcf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fcf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fcf8:	54000321	b.ne	0xfffff7d7fd5c  // b.any
   0x0000fffff7d7fcfc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7fd00:	9e620120	scvtf	d0, x9
   0x0000fffff7d7fd04:	14000002	b	0xfffff7d7fd0c
   0x0000fffff7d7fd08:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7fd0c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fd10:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fd14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fd18:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fd1c:	54000120	b.eq	0xfffff7d7fd40  // b.none
   0x0000fffff7d7fd20:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fd24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fd28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fd2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fd30:	54000161	b.ne	0xfffff7d7fd5c  // b.any
   0x0000fffff7d7fd34:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7fd38:	9e620121	scvtf	d1, x9
   0x0000fffff7d7fd3c:	14000002	b	0xfffff7d7fd44
   0x0000fffff7d7fd40:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7fd44:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7fd48:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7fd4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fd50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fd54:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7fd58:	17ffffde	b	0xfffff7d7fcd0
   0x0000fffff7d7fd5c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7fd60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fd64:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fd68:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fd6c:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7d7fd70:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fd74:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fd78:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7fd7c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7fd80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fd84:	d63f0200	blr	x16
   0x0000fffff7d7fd88:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7fd8c:	54001140	b.eq	0xfffff7d7ffb4  // b.none
   0x0000fffff7d7fd90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7fd94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fd98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fd9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fda0:	54000381	b.ne	0xfffff7d7fe10  // b.any
   0x0000fffff7d7fda4:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7d7fda8:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7d7fdac:	8b0a018b	add	x11, x12, x10
   0x0000fffff7d7fdb0:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7d7fdb4:	36d80211	tbz	w17, #27, 0xfffff7d7fdf4
   0x0000fffff7d7fdb8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7fdbc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7fdc0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7fdc4:	54000261	b.ne	0xfffff7d7fe10  // b.any
   0x0000fffff7d7fdc8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7fdcc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7fdd0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7fdd4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7fdd8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7fddc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7fde0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7fde4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7fde8:	54000149	b.ls	0xfffff7d7fe10  // b.plast
   0x0000fffff7d7fdec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7fdf0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7fdf4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7d7fdf8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7d7fdfc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7fe00:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7fe04:	f9002e6b	str	x11, [x19, #88]
   0x0000fffff7d7fe08:	b900526d	str	w13, [x19, #80]
   0x0000fffff7d7fe0c:	1400000e	b	0xfffff7d7fe44
   0x0000fffff7d7fe10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7fe14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fe18:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fe1c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fe20:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7d7fe24:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fe28:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fe2c:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7d7fe30:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7fe34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fe38:	d63f0200	blr	x16
   0x0000fffff7d7fe3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7fe40:	54000be0	b.eq	0xfffff7d7ffbc  // b.none
   0x0000fffff7d7fe44:	17fff8eb	b	0xfffff7d7e1f0
   0x0000fffff7d7fe48:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7fe4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fe50:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fe54:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fe58:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7d7fe5c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fe60:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fe64:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7d7fe68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7fe6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fe70:	d63f0200	blr	x16
   0x0000fffff7d7fe74:	910143ff	add	sp, sp, #0x50
   0x0000fffff7d7fe78:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7fe7c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7fe80:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7fe84:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d7fe88:	d65f03c0	ret
   0x0000fffff7d7fe8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fe90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fe94:	b900028a	str	w10, [x20]
   0x0000fffff7d7fe98:	f9000689	str	x9, [x20, #8]
   0x0000fffff7d7fe9c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7d7fea0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7fea4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7fea8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7feac:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7d7feb0:	d65f03c0	ret
   0x0000fffff7d7feb4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7d7feb8:	17fffff5	b	0xfffff7d7fe8c
   0x0000fffff7d7febc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7d7fec0:	17fffff3	b	0xfffff7d7fe8c
   0x0000fffff7d7fec4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7d7fec8:	17fffff1	b	0xfffff7d7fe8c
   0x0000fffff7d7fecc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7d7fed0:	17ffffef	b	0xfffff7d7fe8c
   0x0000fffff7d7fed4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7d7fed8:	17ffffed	b	0xfffff7d7fe8c
   0x0000fffff7d7fedc:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7d7fee0:	17ffffeb	b	0xfffff7d7fe8c
   0x0000fffff7d7fee4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7d7fee8:	17ffffe9	b	0xfffff7d7fe8c
   0x0000fffff7d7feec:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7d7fef0:	17ffffe7	b	0xfffff7d7fe8c
   0x0000fffff7d7fef4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7d7fef8:	17ffffe5	b	0xfffff7d7fe8c
   0x0000fffff7d7fefc:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7d7ff00:	17ffffe3	b	0xfffff7d7fe8c
   0x0000fffff7d7ff04:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7d7ff08:	17ffffe1	b	0xfffff7d7fe8c
   0x0000fffff7d7ff0c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7d7ff10:	17ffffdf	b	0xfffff7d7fe8c
   0x0000fffff7d7ff14:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7d7ff18:	17ffffdd	b	0xfffff7d7fe8c
   0x0000fffff7d7ff1c:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7d7ff20:	17ffffdb	b	0xfffff7d7fe8c
   0x0000fffff7d7ff24:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7d7ff28:	17ffffd9	b	0xfffff7d7fe8c
   0x0000fffff7d7ff2c:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7d7ff30:	17ffffd7	b	0xfffff7d7fe8c
   0x0000fffff7d7ff34:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7d7ff38:	17ffffd5	b	0xfffff7d7fe8c
   0x0000fffff7d7ff3c:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7d7ff40:	17ffffd3	b	0xfffff7d7fe8c
   0x0000fffff7d7ff44:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7d7ff48:	17ffffd1	b	0xfffff7d7fe8c
   0x0000fffff7d7ff4c:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7d7ff50:	17ffffcf	b	0xfffff7d7fe8c
   0x0000fffff7d7ff54:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7d7ff58:	17ffffcd	b	0xfffff7d7fe8c
   0x0000fffff7d7ff5c:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7d7ff60:	17ffffcb	b	0xfffff7d7fe8c
   0x0000fffff7d7ff64:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7d7ff68:	17ffffc9	b	0xfffff7d7fe8c
   0x0000fffff7d7ff6c:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7d7ff70:	17ffffc7	b	0xfffff7d7fe8c
   0x0000fffff7d7ff74:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7d7ff78:	17ffffc5	b	0xfffff7d7fe8c
   0x0000fffff7d7ff7c:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7d7ff80:	17ffffc3	b	0xfffff7d7fe8c
   0x0000fffff7d7ff84:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7d7ff88:	17ffffc1	b	0xfffff7d7fe8c
   0x0000fffff7d7ff8c:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7d7ff90:	17ffffbf	b	0xfffff7d7fe8c
   0x0000fffff7d7ff94:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7d7ff98:	17ffffbd	b	0xfffff7d7fe8c
   0x0000fffff7d7ff9c:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7d7ffa0:	17ffffbb	b	0xfffff7d7fe8c
   0x0000fffff7d7ffa4:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7d7ffa8:	17ffffb9	b	0xfffff7d7fe8c
   0x0000fffff7d7ffac:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7d7ffb0:	17ffffb7	b	0xfffff7d7fe8c
   0x0000fffff7d7ffb4:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7d7ffb8:	17ffffb5	b	0xfffff7d7fe8c
   0x0000fffff7d7ffbc:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7d7ffc0:	17ffffb3	b	0xfffff7d7fe8c
   0x0000fffff7d7ffc4:	00000000	udf	#0
   0x0000fffff7d7ffc8:	00000000	udf	#0
   0x0000fffff7d7ffcc:	00000000	udf	#0
   0x0000fffff7d7ffd0:	00000000	udf	#0
   0x0000fffff7d7ffd4:	00000000	udf	#0
   0x0000fffff7d7ffd8:	00000000	udf	#0
   0x0000fffff7d7ffdc:	00000000	udf	#0
   0x0000fffff7d7ffe0:	00000000	udf	#0
   0x0000fffff7d7ffe4:	00000000	udf	#0
   0x0000fffff7d7ffe8:	00000000	udf	#0
   0x0000fffff7d7ffec:	00000000	udf	#0
   0x0000fffff7d7fff0:	00000000	udf	#0
   0x0000fffff7d7fff4:	00000000	udf	#0
   0x0000fffff7d7fff8:	00000000	udf	#0
   0x0000fffff7d7fffc:	00000000	udf	#0
End of assembler dump.
