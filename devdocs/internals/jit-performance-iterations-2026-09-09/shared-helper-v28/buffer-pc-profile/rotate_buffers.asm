Dump of assembler code from 0xfffff7d7e000 to 0xfffff7d7fcf0:
   0x0000fffff7d7e000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7d7e004:	910003fd	mov	x29, sp
   0x0000fffff7d7e008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7d7e00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7d7e010:	d104c3ff	sub	sp, sp, #0x130
   0x0000fffff7d7e014:	aa0003f3	mov	x19, x0
   0x0000fffff7d7e018:	aa0103f4	mov	x20, x1
   0x0000fffff7d7e01c:	aa0203f5	mov	x21, x2
   0x0000fffff7d7e020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7d7e024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7d7e028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7d7e02c:	f90003e9	str	x9, [sp]
   0x0000fffff7d7e030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7d7e034:	d2800121	mov	x1, #0x9                   	// #9
   0x0000fffff7d7e038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7d7e03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d7e040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e044:	d63f0200	blr	x16
   0x0000fffff7d7e048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7d7e04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7d7e050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7d7e054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7d7e058:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7e05c:	37d800e9	tbnz	w9, #27, 0xfffff7d7e078
   0x0000fffff7d7e060:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7e064:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e06c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7e070:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7e074:	14000009	b	0xfffff7d7e098
   0x0000fffff7d7e078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e07c:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7d7e080:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7d7e084:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e088:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e08c:	9400070f	bl	0xfffff7d7fcc8
   0x0000fffff7d7e090:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e094:	5400d520	b.eq	0xfffff7d7fb38  // b.none
   0x0000fffff7d7e098:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e09c:	37d800e9	tbnz	w9, #27, 0xfffff7d7e0b8
   0x0000fffff7d7e0a0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7e0a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e0a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e0ac:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7e0b0:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7e0b4:	14000009	b	0xfffff7d7e0d8
   0x0000fffff7d7e0b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e0bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7d7e0c0:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7d7e0c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e0c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e0cc:	940006ff	bl	0xfffff7d7fcc8
   0x0000fffff7d7e0d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e0d4:	5400d360	b.eq	0xfffff7d7fb40  // b.none
   0x0000fffff7d7e0d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e0dc:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7d7e0e0:	d2922a90	mov	x16, #0x9154                	// #37204
   0x0000fffff7d7e0e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e0e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e0ec:	940006f7	bl	0xfffff7d7fcc8
   0x0000fffff7d7e0f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e0f4:	5400d2a0	b.eq	0xfffff7d7fb48  // b.none
   0x0000fffff7d7e0f8:	f100041f	cmp	x0, #0x1
   0x0000fffff7d7e0fc:	5400a0a0	b.eq	0xfffff7d7f510  // b.none
   0x0000fffff7d7e100:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7e104:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e108:	540004a0	b.eq	0xfffff7d7e19c  // b.none
   0x0000fffff7d7e10c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e110:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e114:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e118:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e11c:	54000400	b.eq	0xfffff7d7e19c  // b.none
   0x0000fffff7d7e120:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e124:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e128:	36d801d1	tbz	w17, #27, 0xfffff7d7e160
   0x0000fffff7d7e12c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e130:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e134:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e138:	54000321	b.ne	0xfffff7d7e19c  // b.any
   0x0000fffff7d7e13c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e140:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e144:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e148:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e14c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e150:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e154:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e158:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e15c:	54000209	b.ls	0xfffff7d7e19c  // b.plast
   0x0000fffff7d7e160:	36d8008d	tbz	w13, #27, 0xfffff7d7e170
   0x0000fffff7d7e164:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e168:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e16c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e170:	36d80091	tbz	w17, #27, 0xfffff7d7e180
   0x0000fffff7d7e174:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e178:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e17c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e180:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7e184:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7e188:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e18c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e190:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7e194:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7e198:	14000009	b	0xfffff7d7e1bc
   0x0000fffff7d7e19c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7e1a0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7d7e1a4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7d7e1a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e1ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e1b0:	940006c6	bl	0xfffff7d7fcc8
   0x0000fffff7d7e1b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e1b8:	5400ccc0	b.eq	0xfffff7d7fb50  // b.none
   0x0000fffff7d7e1bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e1c0:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7d7e1c4:	d286a610	mov	x16, #0x3530                	// #13616
   0x0000fffff7d7e1c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e1cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e1d0:	940006be	bl	0xfffff7d7fcc8
   0x0000fffff7d7e1d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e1d8:	5400cc00	b.eq	0xfffff7d7fb58  // b.none
   0x0000fffff7d7e1dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7e1e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e1e4:	540004a0	b.eq	0xfffff7d7e278  // b.none
   0x0000fffff7d7e1e8:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e1ec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e1f0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e1f4:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e1f8:	54000400	b.eq	0xfffff7d7e278  // b.none
   0x0000fffff7d7e1fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e200:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e204:	36d801d1	tbz	w17, #27, 0xfffff7d7e23c
   0x0000fffff7d7e208:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e20c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e210:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e214:	54000321	b.ne	0xfffff7d7e278  // b.any
   0x0000fffff7d7e218:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e21c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e220:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e224:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e228:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e22c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e230:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e234:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e238:	54000209	b.ls	0xfffff7d7e278  // b.plast
   0x0000fffff7d7e23c:	36d8008d	tbz	w13, #27, 0xfffff7d7e24c
   0x0000fffff7d7e240:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e244:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e248:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e24c:	36d80091	tbz	w17, #27, 0xfffff7d7e25c
   0x0000fffff7d7e250:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e254:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e258:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e25c:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7d7e260:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7d7e264:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e268:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e26c:	f900466c	str	x12, [x19, #136]
   0x0000fffff7d7e270:	b900826d	str	w13, [x19, #128]
   0x0000fffff7d7e274:	14000009	b	0xfffff7d7e298
   0x0000fffff7d7e278:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7e27c:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7d7e280:	d2923c10	mov	x16, #0x91e0                	// #37344
   0x0000fffff7d7e284:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e288:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e28c:	9400068f	bl	0xfffff7d7fcc8
   0x0000fffff7d7e290:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e294:	5400c660	b.eq	0xfffff7d7fb60  // b.none
   0x0000fffff7d7e298:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7e29c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7d7e2a0:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7d7e2a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e2a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e2ac:	94000687	bl	0xfffff7d7fcc8
   0x0000fffff7d7e2b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e2b4:	5400c5a0	b.eq	0xfffff7d7fb68  // b.none
   0x0000fffff7d7e2b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e2bc:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7d7e2c0:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7d7e2c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e2c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e2cc:	9400067f	bl	0xfffff7d7fcc8
   0x0000fffff7d7e2d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e2d4:	5400c4e0	b.eq	0xfffff7d7fb70  // b.none
   0x0000fffff7d7e2d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7e2dc:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7d7e2e0:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7d7e2e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e2e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e2ec:	94000677	bl	0xfffff7d7fcc8
   0x0000fffff7d7e2f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e2f4:	5400c420	b.eq	0xfffff7d7fb78  // b.none
   0x0000fffff7d7e2f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e2fc:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7d7e300:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7d7e304:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e308:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e30c:	9400066f	bl	0xfffff7d7fcc8
   0x0000fffff7d7e310:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e314:	5400c360	b.eq	0xfffff7d7fb80  // b.none
   0x0000fffff7d7e318:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7e31c:	37d800e9	tbnz	w9, #27, 0xfffff7d7e338
   0x0000fffff7d7e320:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7d7e324:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e32c:	f9004669	str	x9, [x19, #136]
   0x0000fffff7d7e330:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7e334:	14000009	b	0xfffff7d7e358
   0x0000fffff7d7e338:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e33c:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7d7e340:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7d7e344:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e348:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e34c:	9400065f	bl	0xfffff7d7fcc8
   0x0000fffff7d7e350:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e354:	5400c1a0	b.eq	0xfffff7d7fb88  // b.none
   0x0000fffff7d7e358:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7e35c:	37d80389	tbnz	w9, #27, 0xfffff7d7e3cc
   0x0000fffff7d7e360:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e364:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e36c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e370:	540002e1	b.ne	0xfffff7d7e3cc  // b.any
   0x0000fffff7d7e374:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7e378:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e37c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e380:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e384:	54000241	b.ne	0xfffff7d7e3cc  // b.any
   0x0000fffff7d7e388:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7e38c:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7d7e390:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7e394:	540001c0	b.eq	0xfffff7d7e3cc  // b.none
   0x0000fffff7d7e398:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7e39c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7e3a0:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7e3a4:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7e3a8:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7e3ac:	54000100	b.eq	0xfffff7d7e3cc  // b.none
   0x0000fffff7d7e3b0:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7e3b4:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7e3b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e3bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e3c0:	f9004669	str	x9, [x19, #136]
   0x0000fffff7d7e3c4:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7e3c8:	14000009	b	0xfffff7d7e3ec
   0x0000fffff7d7e3cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e3d0:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7d7e3d4:	d293a610	mov	x16, #0x9d30                	// #40240
   0x0000fffff7d7e3d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e3dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e3e0:	9400063a	bl	0xfffff7d7fcc8
   0x0000fffff7d7e3e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e3e8:	5400bd40	b.eq	0xfffff7d7fb90  // b.none
   0x0000fffff7d7e3ec:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e3f0:	37d800e9	tbnz	w9, #27, 0xfffff7d7e40c
   0x0000fffff7d7e3f4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7e3f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e3fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e400:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7e404:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7e408:	14000009	b	0xfffff7d7e42c
   0x0000fffff7d7e40c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e410:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7d7e414:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7d7e418:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e41c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e420:	9400062a	bl	0xfffff7d7fcc8
   0x0000fffff7d7e424:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e428:	5400bb80	b.eq	0xfffff7d7fb98  // b.none
   0x0000fffff7d7e42c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e430:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7d7e434:	d2954c90	mov	x16, #0xaa64                	// #43620
   0x0000fffff7d7e438:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e43c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e440:	94000622	bl	0xfffff7d7fcc8
   0x0000fffff7d7e444:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e448:	5400bac0	b.eq	0xfffff7d7fba0  // b.none
   0x0000fffff7d7e44c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e450:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7d7e454:	d2838810	mov	x16, #0x1c40                	// #7232
   0x0000fffff7d7e458:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e45c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e460:	9400061a	bl	0xfffff7d7fcc8
   0x0000fffff7d7e464:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e468:	5400ba00	b.eq	0xfffff7d7fba8  // b.none
   0x0000fffff7d7e46c:	f100041f	cmp	x0, #0x1
   0x0000fffff7d7e470:	54000140	b.eq	0xfffff7d7e498  // b.none
   0x0000fffff7d7e474:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e478:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7d7e47c:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7d7e480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e488:	94000610	bl	0xfffff7d7fcc8
   0x0000fffff7d7e48c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e490:	5400b900	b.eq	0xfffff7d7fbb0  // b.none
   0x0000fffff7d7e494:	14000009	b	0xfffff7d7e4b8
   0x0000fffff7d7e498:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e49c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7d7e4a0:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7d7e4a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e4a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e4ac:	94000607	bl	0xfffff7d7fcc8
   0x0000fffff7d7e4b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e4b4:	5400b820	b.eq	0xfffff7d7fbb8  // b.none
   0x0000fffff7d7e4b8:	910143e6	add	x6, sp, #0x50
   0x0000fffff7d7e4bc:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7d7e4c0:	d28be610	mov	x16, #0x5f30                	// #24368
   0x0000fffff7d7e4c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e4c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e4cc:	940005ff	bl	0xfffff7d7fcc8
   0x0000fffff7d7e4d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e4d4:	5400b760	b.eq	0xfffff7d7fbc0  // b.none
   0x0000fffff7d7e4d8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7e4dc:	37d80389	tbnz	w9, #27, 0xfffff7d7e54c
   0x0000fffff7d7e4e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e4e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e4e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e4ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e4f0:	540002e1	b.ne	0xfffff7d7e54c  // b.any
   0x0000fffff7d7e4f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7d7e4f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e4fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e500:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e504:	54000241	b.ne	0xfffff7d7e54c  // b.any
   0x0000fffff7d7e508:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7e50c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7d7e510:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7e514:	540001c0	b.eq	0xfffff7d7e54c  // b.none
   0x0000fffff7d7e518:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7e51c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7e520:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7e524:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7e528:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7e52c:	54000100	b.eq	0xfffff7d7e54c  // b.none
   0x0000fffff7d7e530:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7e534:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7e538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e53c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e540:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7d7e544:	b900726a	str	w10, [x19, #112]
   0x0000fffff7d7e548:	14000009	b	0xfffff7d7e56c
   0x0000fffff7d7e54c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e550:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7d7e554:	d293a610	mov	x16, #0x9d30                	// #40240
   0x0000fffff7d7e558:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e55c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e560:	940005da	bl	0xfffff7d7fcc8
   0x0000fffff7d7e564:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e568:	5400b300	b.eq	0xfffff7d7fbc8  // b.none
   0x0000fffff7d7e56c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7e570:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e574:	540004a0	b.eq	0xfffff7d7e608  // b.none
   0x0000fffff7d7e578:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e57c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e580:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e584:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e588:	54000400	b.eq	0xfffff7d7e608  // b.none
   0x0000fffff7d7e58c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e590:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e594:	36d801d1	tbz	w17, #27, 0xfffff7d7e5cc
   0x0000fffff7d7e598:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e59c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e5a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e5a4:	54000321	b.ne	0xfffff7d7e608  // b.any
   0x0000fffff7d7e5a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e5ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e5b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e5b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e5b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e5bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e5c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e5c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e5c8:	54000209	b.ls	0xfffff7d7e608  // b.plast
   0x0000fffff7d7e5cc:	36d8008d	tbz	w13, #27, 0xfffff7d7e5dc
   0x0000fffff7d7e5d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e5d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e5d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e5dc:	36d80091	tbz	w17, #27, 0xfffff7d7e5ec
   0x0000fffff7d7e5e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e5e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e5e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e5ec:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7d7e5f0:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7d7e5f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e5f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e5fc:	f900466c	str	x12, [x19, #136]
   0x0000fffff7d7e600:	b900826d	str	w13, [x19, #128]
   0x0000fffff7d7e604:	14000009	b	0xfffff7d7e628
   0x0000fffff7d7e608:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7e60c:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7d7e610:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7d7e614:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e618:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e61c:	940005ab	bl	0xfffff7d7fcc8
   0x0000fffff7d7e620:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e624:	5400ad60	b.eq	0xfffff7d7fbd0  // b.none
   0x0000fffff7d7e628:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7e62c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e630:	540004a0	b.eq	0xfffff7d7e6c4  // b.none
   0x0000fffff7d7e634:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e638:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e63c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e640:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e644:	54000400	b.eq	0xfffff7d7e6c4  // b.none
   0x0000fffff7d7e648:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e64c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e650:	36d801d1	tbz	w17, #27, 0xfffff7d7e688
   0x0000fffff7d7e654:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e658:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e65c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e660:	54000321	b.ne	0xfffff7d7e6c4  // b.any
   0x0000fffff7d7e664:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e668:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e66c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e670:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e674:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e678:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e67c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e680:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e684:	54000209	b.ls	0xfffff7d7e6c4  // b.plast
   0x0000fffff7d7e688:	36d8008d	tbz	w13, #27, 0xfffff7d7e698
   0x0000fffff7d7e68c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e690:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e694:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e698:	36d80091	tbz	w17, #27, 0xfffff7d7e6a8
   0x0000fffff7d7e69c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e6a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e6a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e6a8:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7d7e6ac:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7d7e6b0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e6b4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e6b8:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7d7e6bc:	b900926d	str	w13, [x19, #144]
   0x0000fffff7d7e6c0:	14000009	b	0xfffff7d7e6e4
   0x0000fffff7d7e6c4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7e6c8:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7d7e6cc:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7d7e6d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e6d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e6d8:	9400057c	bl	0xfffff7d7fcc8
   0x0000fffff7d7e6dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e6e0:	5400a7c0	b.eq	0xfffff7d7fbd8  // b.none
   0x0000fffff7d7e6e4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e6e8:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7e6ec:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7e6f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e6f4:	540001c1	b.ne	0xfffff7d7e72c  // b.any
   0x0000fffff7d7e6f8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7e6fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e704:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e708:	54000801	b.ne	0xfffff7d7e808  // b.any
   0x0000fffff7d7e70c:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7d7e710:	f9404e6b	ldr	x11, [x19, #152]
   0x0000fffff7d7e714:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7e718:	eb09015f	cmp	x10, x9
   0x0000fffff7d7e71c:	54000762	b.cs	0xfffff7d7e808  // b.hs, b.nlast
   0x0000fffff7d7e720:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7e724:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7e728:	14000014	b	0xfffff7d7e778
   0x0000fffff7d7e72c:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7d7e730:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e734:	540006a0	b.eq	0xfffff7d7e808  // b.none
   0x0000fffff7d7e738:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e73c:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7d7e740:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e744:	54000621	b.ne	0xfffff7d7e808  // b.any
   0x0000fffff7d7e748:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7e74c:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7d7e750:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e754:	540005a1	b.ne	0xfffff7d7e808  // b.any
   0x0000fffff7d7e758:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7e75c:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7d7e760:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e764:	54000521	b.ne	0xfffff7d7e808  // b.any
   0x0000fffff7d7e768:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7d7e76c:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7d7e770:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e774:	540004a1	b.ne	0xfffff7d7e808  // b.any
   0x0000fffff7d7e778:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e77c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e780:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e784:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e788:	54000400	b.eq	0xfffff7d7e808  // b.none
   0x0000fffff7d7e78c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e790:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e794:	36d801d1	tbz	w17, #27, 0xfffff7d7e7cc
   0x0000fffff7d7e798:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e79c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e7a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e7a4:	54000321	b.ne	0xfffff7d7e808  // b.any
   0x0000fffff7d7e7a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e7ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e7b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e7b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e7b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e7bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e7c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e7c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e7c8:	54000209	b.ls	0xfffff7d7e808  // b.plast
   0x0000fffff7d7e7cc:	36d8008d	tbz	w13, #27, 0xfffff7d7e7dc
   0x0000fffff7d7e7d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e7d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e7d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e7dc:	36d80091	tbz	w17, #27, 0xfffff7d7e7ec
   0x0000fffff7d7e7e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e7e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e7e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e7ec:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7d7e7f0:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7d7e7f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e7f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e7fc:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7d7e800:	b900926d	str	w13, [x19, #144]
   0x0000fffff7d7e804:	14000009	b	0xfffff7d7e828
   0x0000fffff7d7e808:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7d7e80c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7d7e810:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7d7e814:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e818:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e81c:	9400052b	bl	0xfffff7d7fcc8
   0x0000fffff7d7e820:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e824:	54009de0	b.eq	0xfffff7d7fbe0  // b.none
   0x0000fffff7d7e828:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e82c:	37d806a9	tbnz	w9, #27, 0xfffff7d7e900
   0x0000fffff7d7e830:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e834:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e838:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e83c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e840:	540001c1	b.ne	0xfffff7d7e878  // b.any
   0x0000fffff7d7e844:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e848:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e84c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e850:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e854:	54000121	b.ne	0xfffff7d7e878  // b.any
   0x0000fffff7d7e858:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7e85c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7d7e860:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7e864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e86c:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7e870:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7e874:	1400002b	b	0xfffff7d7e920
   0x0000fffff7d7e878:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e87c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e884:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e888:	54000120	b.eq	0xfffff7d7e8ac  // b.none
   0x0000fffff7d7e88c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e890:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e898:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e89c:	54000321	b.ne	0xfffff7d7e900  // b.any
   0x0000fffff7d7e8a0:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7e8a4:	9e620120	scvtf	d0, x9
   0x0000fffff7d7e8a8:	14000002	b	0xfffff7d7e8b0
   0x0000fffff7d7e8ac:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7d7e8b0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e8b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e8b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e8bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e8c0:	54000120	b.eq	0xfffff7d7e8e4  // b.none
   0x0000fffff7d7e8c4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e8c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e8cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e8d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e8d4:	54000161	b.ne	0xfffff7d7e900  // b.any
   0x0000fffff7d7e8d8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7e8dc:	9e620121	scvtf	d1, x9
   0x0000fffff7d7e8e0:	14000002	b	0xfffff7d7e8e8
   0x0000fffff7d7e8e4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7d7e8e8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7e8ec:	fd004e60	str	d0, [x19, #152]
   0x0000fffff7d7e8f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e8f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e8f8:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7e8fc:	17ffffde	b	0xfffff7d7e874
   0x0000fffff7d7e900:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e904:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7d7e908:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7d7e90c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e910:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e914:	940004ed	bl	0xfffff7d7fcc8
   0x0000fffff7d7e918:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e91c:	54009660	b.eq	0xfffff7d7fbe8  // b.none
   0x0000fffff7d7e920:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7d7e924:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e928:	540004a0	b.eq	0xfffff7d7e9bc  // b.none
   0x0000fffff7d7e92c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e930:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7e934:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7e938:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7e93c:	54000400	b.eq	0xfffff7d7e9bc  // b.none
   0x0000fffff7d7e940:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e944:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e948:	36d801d1	tbz	w17, #27, 0xfffff7d7e980
   0x0000fffff7d7e94c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e950:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e954:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e958:	54000321	b.ne	0xfffff7d7e9bc  // b.any
   0x0000fffff7d7e95c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e960:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e964:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e968:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e96c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e970:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e974:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e978:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e97c:	54000209	b.ls	0xfffff7d7e9bc  // b.plast
   0x0000fffff7d7e980:	36d8008d	tbz	w13, #27, 0xfffff7d7e990
   0x0000fffff7d7e984:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7e988:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7e98c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7e990:	36d80091	tbz	w17, #27, 0xfffff7d7e9a0
   0x0000fffff7d7e994:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e998:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e99c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e9a0:	b940a26e	ldr	w14, [x19, #160]
   0x0000fffff7d7e9a4:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7d7e9a8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e9ac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e9b0:	f900566c	str	x12, [x19, #168]
   0x0000fffff7d7e9b4:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7d7e9b8:	14000009	b	0xfffff7d7e9dc
   0x0000fffff7d7e9bc:	910243e6	add	x6, sp, #0x90
   0x0000fffff7d7e9c0:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7d7e9c4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7d7e9c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e9cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e9d0:	940004be	bl	0xfffff7d7fcc8
   0x0000fffff7d7e9d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e9d8:	540090c0	b.eq	0xfffff7d7fbf0  // b.none
   0x0000fffff7d7e9dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e9e0:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7d7e9e4:	d28b0210	mov	x16, #0x5810                	// #22544
   0x0000fffff7d7e9e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e9ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e9f0:	940004b6	bl	0xfffff7d7fcc8
   0x0000fffff7d7e9f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e9f8:	54009000	b.eq	0xfffff7d7fbf8  // b.none
   0x0000fffff7d7e9fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7ea00:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7d7ea04:	d297ec10	mov	x16, #0xbf60                	// #48992
   0x0000fffff7d7ea08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7ea0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ea10:	940004ae	bl	0xfffff7d7fcc8
   0x0000fffff7d7ea14:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ea18:	54008f40	b.eq	0xfffff7d7fc00  // b.none
   0x0000fffff7d7ea1c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7ea20:	37d806a9	tbnz	w9, #27, 0xfffff7d7eaf4
   0x0000fffff7d7ea24:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7ea28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ea2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea30:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea34:	540001c1	b.ne	0xfffff7d7ea6c  // b.any
   0x0000fffff7d7ea38:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7ea3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ea40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea44:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea48:	54000121	b.ne	0xfffff7d7ea6c  // b.any
   0x0000fffff7d7ea4c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7ea50:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7d7ea54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7ea58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ea5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea60:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7ea64:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7ea68:	1400002b	b	0xfffff7d7eb14
   0x0000fffff7d7ea6c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7ea70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ea74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea78:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea7c:	54000120	b.eq	0xfffff7d7eaa0  // b.none
   0x0000fffff7d7ea80:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7ea84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ea88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ea8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ea90:	54000321	b.ne	0xfffff7d7eaf4  // b.any
   0x0000fffff7d7ea94:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7ea98:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ea9c:	14000002	b	0xfffff7d7eaa4
   0x0000fffff7d7eaa0:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7d7eaa4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7eaa8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7eaac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eab4:	54000120	b.eq	0xfffff7d7ead8  // b.none
   0x0000fffff7d7eab8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7eabc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7eac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eac8:	54000161	b.ne	0xfffff7d7eaf4  // b.any
   0x0000fffff7d7eacc:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7d7ead0:	9e620121	scvtf	d1, x9
   0x0000fffff7d7ead4:	14000002	b	0xfffff7d7eadc
   0x0000fffff7d7ead8:	fd405661	ldr	d1, [x19, #168]
   0x0000fffff7d7eadc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7eae0:	fd004e60	str	d0, [x19, #152]
   0x0000fffff7d7eae4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7eae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eaec:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7eaf0:	17ffffde	b	0xfffff7d7ea68
   0x0000fffff7d7eaf4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7eaf8:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7d7eafc:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7d7eb00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7eb04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7eb08:	94000470	bl	0xfffff7d7fcc8
   0x0000fffff7d7eb0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eb10:	540087c0	b.eq	0xfffff7d7fc08  // b.none
   0x0000fffff7d7eb14:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7eb18:	37d800e9	tbnz	w9, #27, 0xfffff7d7eb34
   0x0000fffff7d7eb1c:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7d7eb20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7eb24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eb28:	f9005669	str	x9, [x19, #168]
   0x0000fffff7d7eb2c:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7eb30:	14000009	b	0xfffff7d7eb54
   0x0000fffff7d7eb34:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7eb38:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7d7eb3c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7d7eb40:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7eb44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7eb48:	94000460	bl	0xfffff7d7fcc8
   0x0000fffff7d7eb4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eb50:	54008600	b.eq	0xfffff7d7fc10  // b.none
   0x0000fffff7d7eb54:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7eb58:	37d80389	tbnz	w9, #27, 0xfffff7d7ebc8
   0x0000fffff7d7eb5c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7eb60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7eb64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eb68:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eb6c:	540002e1	b.ne	0xfffff7d7ebc8  // b.any
   0x0000fffff7d7eb70:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7eb74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7eb78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eb7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eb80:	54000241	b.ne	0xfffff7d7ebc8  // b.any
   0x0000fffff7d7eb84:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7eb88:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7d7eb8c:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7eb90:	540001c0	b.eq	0xfffff7d7ebc8  // b.none
   0x0000fffff7d7eb94:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7eb98:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7eb9c:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7eba0:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7eba4:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7eba8:	54000100	b.eq	0xfffff7d7ebc8  // b.none
   0x0000fffff7d7ebac:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7ebb0:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7ebb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ebb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ebbc:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7ebc0:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7ebc4:	14000009	b	0xfffff7d7ebe8
   0x0000fffff7d7ebc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7ebcc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7d7ebd0:	d293a610	mov	x16, #0x9d30                	// #40240
   0x0000fffff7d7ebd4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7ebd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ebdc:	9400043b	bl	0xfffff7d7fcc8
   0x0000fffff7d7ebe0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ebe4:	540081a0	b.eq	0xfffff7d7fc18  // b.none
   0x0000fffff7d7ebe8:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7d7ebec:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7d7ebf0:	d28be610	mov	x16, #0x5f30                	// #24368
   0x0000fffff7d7ebf4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ebf8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ebfc:	94000433	bl	0xfffff7d7fcc8
   0x0000fffff7d7ec00:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ec04:	540080e0	b.eq	0xfffff7d7fc20  // b.none
   0x0000fffff7d7ec08:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7ec0c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7ec10:	540004a0	b.eq	0xfffff7d7eca4  // b.none
   0x0000fffff7d7ec14:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7ec18:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7ec1c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7ec20:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7ec24:	54000400	b.eq	0xfffff7d7eca4  // b.none
   0x0000fffff7d7ec28:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ec2c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7ec30:	36d801d1	tbz	w17, #27, 0xfffff7d7ec68
   0x0000fffff7d7ec34:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7ec38:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7ec3c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7ec40:	54000321	b.ne	0xfffff7d7eca4  // b.any
   0x0000fffff7d7ec44:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7ec48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ec4c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7ec50:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7ec54:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ec58:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7ec5c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7ec60:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7ec64:	54000209	b.ls	0xfffff7d7eca4  // b.plast
   0x0000fffff7d7ec68:	36d8008d	tbz	w13, #27, 0xfffff7d7ec78
   0x0000fffff7d7ec6c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7ec70:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7ec74:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7ec78:	36d80091	tbz	w17, #27, 0xfffff7d7ec88
   0x0000fffff7d7ec7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ec80:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ec84:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ec88:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7d7ec8c:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7d7ec90:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7ec94:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7ec98:	f900466c	str	x12, [x19, #136]
   0x0000fffff7d7ec9c:	b900826d	str	w13, [x19, #128]
   0x0000fffff7d7eca0:	14000009	b	0xfffff7d7ecc4
   0x0000fffff7d7eca4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7eca8:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7d7ecac:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7d7ecb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ecb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ecb8:	94000404	bl	0xfffff7d7fcc8
   0x0000fffff7d7ecbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ecc0:	54007b40	b.eq	0xfffff7d7fc28  // b.none
   0x0000fffff7d7ecc4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7ecc8:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7eccc:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7ecd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ecd4:	540001c1	b.ne	0xfffff7d7ed0c  // b.any
   0x0000fffff7d7ecd8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7ecdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ece0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ece4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ece8:	54000801	b.ne	0xfffff7d7ede8  // b.any
   0x0000fffff7d7ecec:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7d7ecf0:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7d7ecf4:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7ecf8:	eb09015f	cmp	x10, x9
   0x0000fffff7d7ecfc:	54000762	b.cs	0xfffff7d7ede8  // b.hs, b.nlast
   0x0000fffff7d7ed00:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7ed04:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7ed08:	14000014	b	0xfffff7d7ed58
   0x0000fffff7d7ed0c:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7d7ed10:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7ed14:	540006a0	b.eq	0xfffff7d7ede8  // b.none
   0x0000fffff7d7ed18:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7ed1c:	b940b3ea	ldr	w10, [sp, #176]
   0x0000fffff7d7ed20:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ed24:	54000621	b.ne	0xfffff7d7ede8  // b.any
   0x0000fffff7d7ed28:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7ed2c:	f9405fea	ldr	x10, [sp, #184]
   0x0000fffff7d7ed30:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ed34:	540005a1	b.ne	0xfffff7d7ede8  // b.any
   0x0000fffff7d7ed38:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7ed3c:	b940b7ea	ldr	w10, [sp, #180]
   0x0000fffff7d7ed40:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ed44:	54000521	b.ne	0xfffff7d7ede8  // b.any
   0x0000fffff7d7ed48:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7d7ed4c:	f94063ea	ldr	x10, [sp, #192]
   0x0000fffff7d7ed50:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ed54:	540004a1	b.ne	0xfffff7d7ede8  // b.any
   0x0000fffff7d7ed58:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7ed5c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7ed60:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7ed64:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7ed68:	54000400	b.eq	0xfffff7d7ede8  // b.none
   0x0000fffff7d7ed6c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ed70:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7ed74:	36d801d1	tbz	w17, #27, 0xfffff7d7edac
   0x0000fffff7d7ed78:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7ed7c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7ed80:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7ed84:	54000321	b.ne	0xfffff7d7ede8  // b.any
   0x0000fffff7d7ed88:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7ed8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ed90:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7ed94:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7ed98:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ed9c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7eda0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7eda4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7eda8:	54000209	b.ls	0xfffff7d7ede8  // b.plast
   0x0000fffff7d7edac:	36d8008d	tbz	w13, #27, 0xfffff7d7edbc
   0x0000fffff7d7edb0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7edb4:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7edb8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7edbc:	36d80091	tbz	w17, #27, 0xfffff7d7edcc
   0x0000fffff7d7edc0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7edc4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7edc8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7edcc:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7d7edd0:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7d7edd4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7edd8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7eddc:	f900466c	str	x12, [x19, #136]
   0x0000fffff7d7ede0:	b900826d	str	w13, [x19, #128]
   0x0000fffff7d7ede4:	14000009	b	0xfffff7d7ee08
   0x0000fffff7d7ede8:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7d7edec:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7d7edf0:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7d7edf4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7edf8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7edfc:	940003b3	bl	0xfffff7d7fcc8
   0x0000fffff7d7ee00:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ee04:	54007160	b.eq	0xfffff7d7fc30  // b.none
   0x0000fffff7d7ee08:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7ee0c:	37d806a9	tbnz	w9, #27, 0xfffff7d7eee0
   0x0000fffff7d7ee10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ee14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ee18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee20:	540001c1	b.ne	0xfffff7d7ee58  // b.any
   0x0000fffff7d7ee24:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7ee28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ee2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee30:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee34:	54000121	b.ne	0xfffff7d7ee58  // b.any
   0x0000fffff7d7ee38:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ee3c:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7d7ee40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7ee44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ee48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee4c:	f9004669	str	x9, [x19, #136]
   0x0000fffff7d7ee50:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7ee54:	1400002b	b	0xfffff7d7ef00
   0x0000fffff7d7ee58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ee5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ee60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee64:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee68:	54000120	b.eq	0xfffff7d7ee8c  // b.none
   0x0000fffff7d7ee6c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ee70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ee74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee78:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee7c:	54000321	b.ne	0xfffff7d7eee0  // b.any
   0x0000fffff7d7ee80:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ee84:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ee88:	14000002	b	0xfffff7d7ee90
   0x0000fffff7d7ee8c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7ee90:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7ee94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ee98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eea0:	54000120	b.eq	0xfffff7d7eec4  // b.none
   0x0000fffff7d7eea4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7eea8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7eeac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eeb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eeb4:	54000161	b.ne	0xfffff7d7eee0  // b.any
   0x0000fffff7d7eeb8:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7eebc:	9e620121	scvtf	d1, x9
   0x0000fffff7d7eec0:	14000002	b	0xfffff7d7eec8
   0x0000fffff7d7eec4:	fd404661	ldr	d1, [x19, #136]
   0x0000fffff7d7eec8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7eecc:	fd004660	str	d0, [x19, #136]
   0x0000fffff7d7eed0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7eed4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eed8:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7eedc:	17ffffde	b	0xfffff7d7ee54
   0x0000fffff7d7eee0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7eee4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7d7eee8:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7d7eeec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7eef0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7eef4:	94000375	bl	0xfffff7d7fcc8
   0x0000fffff7d7eef8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eefc:	540069e0	b.eq	0xfffff7d7fc38  // b.none
   0x0000fffff7d7ef00:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7ef04:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7ef08:	540004a0	b.eq	0xfffff7d7ef9c  // b.none
   0x0000fffff7d7ef0c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7ef10:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7ef14:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7ef18:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7ef1c:	54000400	b.eq	0xfffff7d7ef9c  // b.none
   0x0000fffff7d7ef20:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ef24:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7ef28:	36d801d1	tbz	w17, #27, 0xfffff7d7ef60
   0x0000fffff7d7ef2c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7ef30:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7ef34:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7ef38:	54000321	b.ne	0xfffff7d7ef9c  // b.any
   0x0000fffff7d7ef3c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7ef40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ef44:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7ef48:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7ef4c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ef50:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7ef54:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7ef58:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7ef5c:	54000209	b.ls	0xfffff7d7ef9c  // b.plast
   0x0000fffff7d7ef60:	36d8008d	tbz	w13, #27, 0xfffff7d7ef70
   0x0000fffff7d7ef64:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7ef68:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7ef6c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7ef70:	36d80091	tbz	w17, #27, 0xfffff7d7ef80
   0x0000fffff7d7ef74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ef78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ef7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ef80:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7d7ef84:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7d7ef88:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7ef8c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7ef90:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7d7ef94:	b900926d	str	w13, [x19, #144]
   0x0000fffff7d7ef98:	14000009	b	0xfffff7d7efbc
   0x0000fffff7d7ef9c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7efa0:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7d7efa4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7d7efa8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7efac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7efb0:	94000346	bl	0xfffff7d7fcc8
   0x0000fffff7d7efb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7efb8:	54006440	b.eq	0xfffff7d7fc40  // b.none
   0x0000fffff7d7efbc:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7efc0:	37d800e9	tbnz	w9, #27, 0xfffff7d7efdc
   0x0000fffff7d7efc4:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7d7efc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7efcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7efd0:	f9005669	str	x9, [x19, #168]
   0x0000fffff7d7efd4:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7efd8:	14000009	b	0xfffff7d7effc
   0x0000fffff7d7efdc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7efe0:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7d7efe4:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7d7efe8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7efec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7eff0:	94000336	bl	0xfffff7d7fcc8
   0x0000fffff7d7eff4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eff8:	54006280	b.eq	0xfffff7d7fc48  // b.none
   0x0000fffff7d7effc:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f000:	37d806a9	tbnz	w9, #27, 0xfffff7d7f0d4
   0x0000fffff7d7f004:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7f008:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f00c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f010:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f014:	540001c1	b.ne	0xfffff7d7f04c  // b.any
   0x0000fffff7d7f018:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f01c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f020:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f024:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f028:	54000121	b.ne	0xfffff7d7f04c  // b.any
   0x0000fffff7d7f02c:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7d7f030:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7d7f034:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f038:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f03c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f040:	f9005669	str	x9, [x19, #168]
   0x0000fffff7d7f044:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7f048:	1400002b	b	0xfffff7d7f0f4
   0x0000fffff7d7f04c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7f050:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f054:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f058:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f05c:	54000120	b.eq	0xfffff7d7f080  // b.none
   0x0000fffff7d7f060:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7f064:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f06c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f070:	54000321	b.ne	0xfffff7d7f0d4  // b.any
   0x0000fffff7d7f074:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7d7f078:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f07c:	14000002	b	0xfffff7d7f084
   0x0000fffff7d7f080:	fd403e60	ldr	d0, [x19, #120]
   0x0000fffff7d7f084:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f088:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f08c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f090:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f094:	54000120	b.eq	0xfffff7d7f0b8  // b.none
   0x0000fffff7d7f098:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f09c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f0a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f0a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f0a8:	54000161	b.ne	0xfffff7d7f0d4  // b.any
   0x0000fffff7d7f0ac:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7d7f0b0:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f0b4:	14000002	b	0xfffff7d7f0bc
   0x0000fffff7d7f0b8:	fd405661	ldr	d1, [x19, #168]
   0x0000fffff7d7f0bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f0c0:	fd005660	str	d0, [x19, #168]
   0x0000fffff7d7f0c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f0c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f0cc:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7f0d0:	17ffffde	b	0xfffff7d7f048
   0x0000fffff7d7f0d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f0d8:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7d7f0dc:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7d7f0e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f0e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f0e8:	940002f8	bl	0xfffff7d7fcc8
   0x0000fffff7d7f0ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f0f0:	54005b00	b.eq	0xfffff7d7fc50  // b.none
   0x0000fffff7d7f0f4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f0f8:	37d80389	tbnz	w9, #27, 0xfffff7d7f168
   0x0000fffff7d7f0fc:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f100:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f104:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f108:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f10c:	540002e1	b.ne	0xfffff7d7f168  // b.any
   0x0000fffff7d7f110:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7d7f114:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f118:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f11c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f120:	54000241	b.ne	0xfffff7d7f168  // b.any
   0x0000fffff7d7f124:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7d7f128:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7d7f12c:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7f130:	540001c0	b.eq	0xfffff7d7f168  // b.none
   0x0000fffff7d7f134:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7f138:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7f13c:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7f140:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7f144:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7f148:	54000100	b.eq	0xfffff7d7f168  // b.none
   0x0000fffff7d7f14c:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7f150:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7f154:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f158:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f15c:	f9005669	str	x9, [x19, #168]
   0x0000fffff7d7f160:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7f164:	14000009	b	0xfffff7d7f188
   0x0000fffff7d7f168:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f16c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7d7f170:	d293a610	mov	x16, #0x9d30                	// #40240
   0x0000fffff7d7f174:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f178:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f17c:	940002d3	bl	0xfffff7d7fcc8
   0x0000fffff7d7f180:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f184:	540056a0	b.eq	0xfffff7d7fc58  // b.none
   0x0000fffff7d7f188:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f18c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7f190:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7f194:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f198:	540001c1	b.ne	0xfffff7d7f1d0  // b.any
   0x0000fffff7d7f19c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f1a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f1a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f1a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f1ac:	54000801	b.ne	0xfffff7d7f2ac  // b.any
   0x0000fffff7d7f1b0:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7d7f1b4:	f9404e6b	ldr	x11, [x19, #152]
   0x0000fffff7d7f1b8:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7f1bc:	eb09015f	cmp	x10, x9
   0x0000fffff7d7f1c0:	54000762	b.cs	0xfffff7d7f2ac  // b.hs, b.nlast
   0x0000fffff7d7f1c4:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7f1c8:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7f1cc:	14000014	b	0xfffff7d7f21c
   0x0000fffff7d7f1d0:	f94077eb	ldr	x11, [sp, #232]
   0x0000fffff7d7f1d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f1d8:	540006a0	b.eq	0xfffff7d7f2ac  // b.none
   0x0000fffff7d7f1dc:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f1e0:	b940d3ea	ldr	w10, [sp, #208]
   0x0000fffff7d7f1e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f1e8:	54000621	b.ne	0xfffff7d7f2ac  // b.any
   0x0000fffff7d7f1ec:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7f1f0:	f9406fea	ldr	x10, [sp, #216]
   0x0000fffff7d7f1f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f1f8:	540005a1	b.ne	0xfffff7d7f2ac  // b.any
   0x0000fffff7d7f1fc:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f200:	b940d7ea	ldr	w10, [sp, #212]
   0x0000fffff7d7f204:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f208:	54000521	b.ne	0xfffff7d7f2ac  // b.any
   0x0000fffff7d7f20c:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7d7f210:	f94073ea	ldr	x10, [sp, #224]
   0x0000fffff7d7f214:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f218:	540004a1	b.ne	0xfffff7d7f2ac  // b.any
   0x0000fffff7d7f21c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f220:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f224:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f228:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f22c:	54000400	b.eq	0xfffff7d7f2ac  // b.none
   0x0000fffff7d7f230:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f234:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f238:	36d801d1	tbz	w17, #27, 0xfffff7d7f270
   0x0000fffff7d7f23c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f240:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f244:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f248:	54000321	b.ne	0xfffff7d7f2ac  // b.any
   0x0000fffff7d7f24c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f250:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f254:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f258:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f25c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f260:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f264:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f268:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f26c:	54000209	b.ls	0xfffff7d7f2ac  // b.plast
   0x0000fffff7d7f270:	36d8008d	tbz	w13, #27, 0xfffff7d7f280
   0x0000fffff7d7f274:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f278:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f27c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f280:	36d80091	tbz	w17, #27, 0xfffff7d7f290
   0x0000fffff7d7f284:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f288:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f28c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f290:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7d7f294:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7d7f298:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f29c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f2a0:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7d7f2a4:	b900926d	str	w13, [x19, #144]
   0x0000fffff7d7f2a8:	14000009	b	0xfffff7d7f2cc
   0x0000fffff7d7f2ac:	910343e6	add	x6, sp, #0xd0
   0x0000fffff7d7f2b0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7d7f2b4:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7d7f2b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f2bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f2c0:	94000282	bl	0xfffff7d7fcc8
   0x0000fffff7d7f2c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f2c8:	54004cc0	b.eq	0xfffff7d7fc60  // b.none
   0x0000fffff7d7f2cc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f2d0:	37d806a9	tbnz	w9, #27, 0xfffff7d7f3a4
   0x0000fffff7d7f2d4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f2d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f2dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f2e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f2e4:	540001c1	b.ne	0xfffff7d7f31c  // b.any
   0x0000fffff7d7f2e8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f2ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f2f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f2f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f2f8:	54000121	b.ne	0xfffff7d7f31c  // b.any
   0x0000fffff7d7f2fc:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7f300:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7d7f304:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f308:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f30c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f310:	f9004669	str	x9, [x19, #136]
   0x0000fffff7d7f314:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7f318:	1400002b	b	0xfffff7d7f3c4
   0x0000fffff7d7f31c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f320:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f324:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f328:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f32c:	54000120	b.eq	0xfffff7d7f350  // b.none
   0x0000fffff7d7f330:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f334:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f338:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f33c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f340:	54000321	b.ne	0xfffff7d7f3a4  // b.any
   0x0000fffff7d7f344:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7f348:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f34c:	14000002	b	0xfffff7d7f354
   0x0000fffff7d7f350:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7d7f354:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f358:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f35c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f360:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f364:	54000120	b.eq	0xfffff7d7f388  // b.none
   0x0000fffff7d7f368:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f36c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f374:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f378:	54000161	b.ne	0xfffff7d7f3a4  // b.any
   0x0000fffff7d7f37c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7f380:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f384:	14000002	b	0xfffff7d7f38c
   0x0000fffff7d7f388:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7d7f38c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f390:	fd004660	str	d0, [x19, #136]
   0x0000fffff7d7f394:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f39c:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7f3a0:	17ffffde	b	0xfffff7d7f318
   0x0000fffff7d7f3a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f3a8:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7d7f3ac:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7d7f3b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f3b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f3b8:	94000244	bl	0xfffff7d7fcc8
   0x0000fffff7d7f3bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f3c0:	54004540	b.eq	0xfffff7d7fc68  // b.none
   0x0000fffff7d7f3c4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f3c8:	37d80109	tbnz	w9, #27, 0xfffff7d7f3e8
   0x0000fffff7d7f3cc:	d2884869	mov	x9, #0x4243                	// #16963
   0x0000fffff7d7f3d0:	f2a001e9	movk	x9, #0xf, lsl #16
   0x0000fffff7d7f3d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f3d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f3dc:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7f3e0:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7f3e4:	14000009	b	0xfffff7d7f408
   0x0000fffff7d7f3e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f3ec:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7d7f3f0:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7d7f3f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f3f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f3fc:	94000233	bl	0xfffff7d7fcc8
   0x0000fffff7d7f400:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f404:	54004360	b.eq	0xfffff7d7fc70  // b.none
   0x0000fffff7d7f408:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f40c:	37d80389	tbnz	w9, #27, 0xfffff7d7f47c
   0x0000fffff7d7f410:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f414:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f418:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f41c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f420:	540002e1	b.ne	0xfffff7d7f47c  // b.any
   0x0000fffff7d7f424:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f428:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f42c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f430:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f434:	54000241	b.ne	0xfffff7d7f47c  // b.any
   0x0000fffff7d7f438:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7f43c:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7d7f440:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7f444:	540001c0	b.eq	0xfffff7d7f47c  // b.none
   0x0000fffff7d7f448:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7f44c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7f450:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7f454:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7f458:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7f45c:	54000100	b.eq	0xfffff7d7f47c  // b.none
   0x0000fffff7d7f460:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7f464:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7f468:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f46c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f470:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7f474:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f478:	14000009	b	0xfffff7d7f49c
   0x0000fffff7d7f47c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f480:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7d7f484:	d293a610	mov	x16, #0x9d30                	// #40240
   0x0000fffff7d7f488:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f48c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f490:	9400020e	bl	0xfffff7d7fcc8
   0x0000fffff7d7f494:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f498:	54003f00	b.eq	0xfffff7d7fc78  // b.none
   0x0000fffff7d7f49c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f4a0:	37d80269	tbnz	w9, #27, 0xfffff7d7f4ec
   0x0000fffff7d7f4a4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f4a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f4ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f4b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f4b4:	540001c1	b.ne	0xfffff7d7f4ec  // b.any
   0x0000fffff7d7f4b8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7f4bc:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7d7f4c0:	8b0a012b	add	x11, x9, x10
   0x0000fffff7d7f4c4:	f9003669	str	x9, [x19, #104]
   0x0000fffff7d7f4c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f4cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f4d0:	b900626a	str	w10, [x19, #96]
   0x0000fffff7d7f4d4:	aa0b03e9	mov	x9, x11
   0x0000fffff7d7f4d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f4dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f4e0:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7f4e4:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7f4e8:	14000009	b	0xfffff7d7f50c
   0x0000fffff7d7f4ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f4f0:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7d7f4f4:	d292fa10	mov	x16, #0x97d0                	// #38864
   0x0000fffff7d7f4f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f4fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f500:	940001f2	bl	0xfffff7d7fcc8
   0x0000fffff7d7f504:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f508:	54003bc0	b.eq	0xfffff7d7fc80  // b.none
   0x0000fffff7d7f50c:	17fffaf3	b	0xfffff7d7e0d8
   0x0000fffff7d7f510:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7f514:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f518:	540004a0	b.eq	0xfffff7d7f5ac  // b.none
   0x0000fffff7d7f51c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f520:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f524:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f528:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f52c:	54000400	b.eq	0xfffff7d7f5ac  // b.none
   0x0000fffff7d7f530:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f534:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f538:	36d801d1	tbz	w17, #27, 0xfffff7d7f570
   0x0000fffff7d7f53c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f540:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f544:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f548:	54000321	b.ne	0xfffff7d7f5ac  // b.any
   0x0000fffff7d7f54c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f550:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f554:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f558:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f55c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f560:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f564:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f568:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f56c:	54000209	b.ls	0xfffff7d7f5ac  // b.plast
   0x0000fffff7d7f570:	36d8008d	tbz	w13, #27, 0xfffff7d7f580
   0x0000fffff7d7f574:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f578:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f57c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f580:	36d80091	tbz	w17, #27, 0xfffff7d7f590
   0x0000fffff7d7f584:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f588:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f58c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f590:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7d7f594:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7d7f598:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f59c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f5a0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7d7f5a4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7d7f5a8:	14000009	b	0xfffff7d7f5cc
   0x0000fffff7d7f5ac:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7f5b0:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7d7f5b4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7d7f5b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f5bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f5c0:	940001c2	bl	0xfffff7d7fcc8
   0x0000fffff7d7f5c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f5c8:	54003600	b.eq	0xfffff7d7fc88  // b.none
   0x0000fffff7d7f5cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f5d0:	37d800e9	tbnz	w9, #27, 0xfffff7d7f5ec
   0x0000fffff7d7f5d4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7f5d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f5dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f5e0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7d7f5e4:	b900626a	str	w10, [x19, #96]
   0x0000fffff7d7f5e8:	14000009	b	0xfffff7d7f60c
   0x0000fffff7d7f5ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f5f0:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7d7f5f4:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7d7f5f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f5fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f600:	940001b2	bl	0xfffff7d7fcc8
   0x0000fffff7d7f604:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f608:	54003440	b.eq	0xfffff7d7fc90  // b.none
   0x0000fffff7d7f60c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f610:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7f614:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7f618:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f61c:	54000621	b.ne	0xfffff7d7f6e0  // b.any
   0x0000fffff7d7f620:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f624:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f62c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f630:	54000581	b.ne	0xfffff7d7f6e0  // b.any
   0x0000fffff7d7f634:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7f638:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7d7f63c:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7f640:	eb09015f	cmp	x10, x9
   0x0000fffff7d7f644:	540004e2	b.cs	0xfffff7d7f6e0  // b.hs, b.nlast
   0x0000fffff7d7f648:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7f64c:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7f650:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f654:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f658:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f65c:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f660:	54000400	b.eq	0xfffff7d7f6e0  // b.none
   0x0000fffff7d7f664:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f668:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f66c:	36d801d1	tbz	w17, #27, 0xfffff7d7f6a4
   0x0000fffff7d7f670:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f674:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f678:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f67c:	54000321	b.ne	0xfffff7d7f6e0  // b.any
   0x0000fffff7d7f680:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f684:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f688:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f68c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f690:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f694:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f698:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f69c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f6a0:	54000209	b.ls	0xfffff7d7f6e0  // b.plast
   0x0000fffff7d7f6a4:	36d8008d	tbz	w13, #27, 0xfffff7d7f6b4
   0x0000fffff7d7f6a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f6ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f6b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f6b4:	36d80091	tbz	w17, #27, 0xfffff7d7f6c4
   0x0000fffff7d7f6b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f6bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f6c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f6c4:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7d7f6c8:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7d7f6cc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f6d0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f6d4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7d7f6d8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7d7f6dc:	14000009	b	0xfffff7d7f700
   0x0000fffff7d7f6e0:	9103c3e6	add	x6, sp, #0xf0
   0x0000fffff7d7f6e4:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7d7f6e8:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7d7f6ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f6f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f6f4:	94000175	bl	0xfffff7d7fcc8
   0x0000fffff7d7f6f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f6fc:	54002ce0	b.eq	0xfffff7d7fc98  // b.none
   0x0000fffff7d7f700:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f704:	37d806a9	tbnz	w9, #27, 0xfffff7d7f7d8
   0x0000fffff7d7f708:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f70c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f710:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f714:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f718:	540001c1	b.ne	0xfffff7d7f750  // b.any
   0x0000fffff7d7f71c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f720:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f724:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f728:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f72c:	54000121	b.ne	0xfffff7d7f750  // b.any
   0x0000fffff7d7f730:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f734:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7d7f738:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f73c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f740:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f744:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7f748:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7f74c:	1400002b	b	0xfffff7d7f7f8
   0x0000fffff7d7f750:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f754:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f758:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f75c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f760:	54000120	b.eq	0xfffff7d7f784  // b.none
   0x0000fffff7d7f764:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f768:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f76c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f770:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f774:	54000321	b.ne	0xfffff7d7f7d8  // b.any
   0x0000fffff7d7f778:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f77c:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f780:	14000002	b	0xfffff7d7f788
   0x0000fffff7d7f784:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7f788:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f78c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f790:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f794:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f798:	54000120	b.eq	0xfffff7d7f7bc  // b.none
   0x0000fffff7d7f79c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f7a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f7a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f7a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f7ac:	54000161	b.ne	0xfffff7d7f7d8  // b.any
   0x0000fffff7d7f7b0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7f7b4:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f7b8:	14000002	b	0xfffff7d7f7c0
   0x0000fffff7d7f7bc:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7d7f7c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f7c4:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7d7f7c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f7cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f7d0:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7f7d4:	17ffffde	b	0xfffff7d7f74c
   0x0000fffff7d7f7d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f7dc:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7d7f7e0:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7d7f7e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f7e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f7ec:	94000137	bl	0xfffff7d7fcc8
   0x0000fffff7d7f7f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f7f4:	54002560	b.eq	0xfffff7d7fca0  // b.none
   0x0000fffff7d7f7f8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7f7fc:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f800:	540004a0	b.eq	0xfffff7d7f894  // b.none
   0x0000fffff7d7f804:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f808:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f80c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f810:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f814:	54000400	b.eq	0xfffff7d7f894  // b.none
   0x0000fffff7d7f818:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f81c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f820:	36d801d1	tbz	w17, #27, 0xfffff7d7f858
   0x0000fffff7d7f824:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f828:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f82c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f830:	54000321	b.ne	0xfffff7d7f894  // b.any
   0x0000fffff7d7f834:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f838:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f83c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f840:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f844:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f848:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f84c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f850:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f854:	54000209	b.ls	0xfffff7d7f894  // b.plast
   0x0000fffff7d7f858:	36d8008d	tbz	w13, #27, 0xfffff7d7f868
   0x0000fffff7d7f85c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f860:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f864:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f868:	36d80091	tbz	w17, #27, 0xfffff7d7f878
   0x0000fffff7d7f86c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f870:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f874:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f878:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7f87c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7f880:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f884:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f888:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7f88c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7f890:	14000009	b	0xfffff7d7f8b4
   0x0000fffff7d7f894:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7f898:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7d7f89c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7d7f8a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f8a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f8a8:	94000108	bl	0xfffff7d7fcc8
   0x0000fffff7d7f8ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f8b0:	54001fc0	b.eq	0xfffff7d7fca8  // b.none
   0x0000fffff7d7f8b4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7f8b8:	37d800e9	tbnz	w9, #27, 0xfffff7d7f8d4
   0x0000fffff7d7f8bc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7f8c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f8c8:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7d7f8cc:	b900726a	str	w10, [x19, #112]
   0x0000fffff7d7f8d0:	14000009	b	0xfffff7d7f8f4
   0x0000fffff7d7f8d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f8d8:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7d7f8dc:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7d7f8e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f8e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f8e8:	940000f8	bl	0xfffff7d7fcc8
   0x0000fffff7d7f8ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f8f0:	54001e00	b.eq	0xfffff7d7fcb0  // b.none
   0x0000fffff7d7f8f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f8f8:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7f8fc:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7f900:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f904:	54000621	b.ne	0xfffff7d7f9c8  // b.any
   0x0000fffff7d7f908:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7f90c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f914:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f918:	54000581	b.ne	0xfffff7d7f9c8  // b.any
   0x0000fffff7d7f91c:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7d7f920:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7d7f924:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7f928:	eb09015f	cmp	x10, x9
   0x0000fffff7d7f92c:	540004e2	b.cs	0xfffff7d7f9c8  // b.hs, b.nlast
   0x0000fffff7d7f930:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7f934:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7f938:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f93c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7f940:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7f944:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7f948:	54000400	b.eq	0xfffff7d7f9c8  // b.none
   0x0000fffff7d7f94c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f950:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f954:	36d801d1	tbz	w17, #27, 0xfffff7d7f98c
   0x0000fffff7d7f958:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f95c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f960:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f964:	54000321	b.ne	0xfffff7d7f9c8  // b.any
   0x0000fffff7d7f968:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f96c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f970:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f974:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f978:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f97c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f980:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f984:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f988:	54000209	b.ls	0xfffff7d7f9c8  // b.plast
   0x0000fffff7d7f98c:	36d8008d	tbz	w13, #27, 0xfffff7d7f99c
   0x0000fffff7d7f990:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7f994:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7f998:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7f99c:	36d80091	tbz	w17, #27, 0xfffff7d7f9ac
   0x0000fffff7d7f9a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f9a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f9a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f9ac:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7f9b0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7f9b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f9b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f9bc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7f9c0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7f9c4:	14000009	b	0xfffff7d7f9e8
   0x0000fffff7d7f9c8:	910443e6	add	x6, sp, #0x110
   0x0000fffff7d7f9cc:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7d7f9d0:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7d7f9d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f9d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f9dc:	940000bb	bl	0xfffff7d7fcc8
   0x0000fffff7d7f9e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f9e4:	540016a0	b.eq	0xfffff7d7fcb8  // b.none
   0x0000fffff7d7f9e8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f9ec:	37d806a9	tbnz	w9, #27, 0xfffff7d7fac0
   0x0000fffff7d7f9f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f9f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f9f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f9fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fa00:	540001c1	b.ne	0xfffff7d7fa38  // b.any
   0x0000fffff7d7fa04:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fa08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fa0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fa10:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fa14:	54000121	b.ne	0xfffff7d7fa38  // b.any
   0x0000fffff7d7fa18:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7fa1c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7fa20:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7fa24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fa28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fa2c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7fa30:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7fa34:	1400002b	b	0xfffff7d7fae0
   0x0000fffff7d7fa38:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7fa3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fa40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fa44:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fa48:	54000120	b.eq	0xfffff7d7fa6c  // b.none
   0x0000fffff7d7fa4c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7fa50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fa54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fa58:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fa5c:	54000321	b.ne	0xfffff7d7fac0  // b.any
   0x0000fffff7d7fa60:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7fa64:	9e620120	scvtf	d0, x9
   0x0000fffff7d7fa68:	14000002	b	0xfffff7d7fa70
   0x0000fffff7d7fa6c:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7d7fa70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fa74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fa78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fa7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fa80:	54000120	b.eq	0xfffff7d7faa4  // b.none
   0x0000fffff7d7fa84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fa88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fa8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fa90:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fa94:	54000161	b.ne	0xfffff7d7fac0  // b.any
   0x0000fffff7d7fa98:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7fa9c:	9e620121	scvtf	d1, x9
   0x0000fffff7d7faa0:	14000002	b	0xfffff7d7faa8
   0x0000fffff7d7faa4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7faa8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7faac:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7d7fab0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fab8:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7fabc:	17ffffde	b	0xfffff7d7fa34
   0x0000fffff7d7fac0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7fac4:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7d7fac8:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7d7facc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7fad0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fad4:	9400007d	bl	0xfffff7d7fcc8
   0x0000fffff7d7fad8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7fadc:	54000f20	b.eq	0xfffff7d7fcc0  // b.none
   0x0000fffff7d7fae0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7fae4:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7d7fae8:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7d7faec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7faf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7faf4:	94000075	bl	0xfffff7d7fcc8
   0x0000fffff7d7faf8:	9104c3ff	add	sp, sp, #0x130
   0x0000fffff7d7fafc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7fb00:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7fb04:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7fb08:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d7fb0c:	d65f03c0	ret
   0x0000fffff7d7fb10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fb14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fb18:	b900028a	str	w10, [x20]
   0x0000fffff7d7fb1c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7d7fb20:	9104c3ff	add	sp, sp, #0x130
   0x0000fffff7d7fb24:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7fb28:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7fb2c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7fb30:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7d7fb34:	d65f03c0	ret
   0x0000fffff7d7fb38:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7fb3c:	17fffff5	b	0xfffff7d7fb10
   0x0000fffff7d7fb40:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7d7fb44:	17fffff3	b	0xfffff7d7fb10
   0x0000fffff7d7fb48:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7d7fb4c:	17fffff1	b	0xfffff7d7fb10
   0x0000fffff7d7fb50:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7d7fb54:	17ffffef	b	0xfffff7d7fb10
   0x0000fffff7d7fb58:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7d7fb5c:	17ffffed	b	0xfffff7d7fb10
   0x0000fffff7d7fb60:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7d7fb64:	17ffffeb	b	0xfffff7d7fb10
   0x0000fffff7d7fb68:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7d7fb6c:	17ffffe9	b	0xfffff7d7fb10
   0x0000fffff7d7fb70:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7d7fb74:	17ffffe7	b	0xfffff7d7fb10
   0x0000fffff7d7fb78:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7d7fb7c:	17ffffe5	b	0xfffff7d7fb10
   0x0000fffff7d7fb80:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7d7fb84:	17ffffe3	b	0xfffff7d7fb10
   0x0000fffff7d7fb88:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7d7fb8c:	17ffffe1	b	0xfffff7d7fb10
   0x0000fffff7d7fb90:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7d7fb94:	17ffffdf	b	0xfffff7d7fb10
   0x0000fffff7d7fb98:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7d7fb9c:	17ffffdd	b	0xfffff7d7fb10
   0x0000fffff7d7fba0:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7d7fba4:	17ffffdb	b	0xfffff7d7fb10
   0x0000fffff7d7fba8:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7d7fbac:	17ffffd9	b	0xfffff7d7fb10
   0x0000fffff7d7fbb0:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7d7fbb4:	17ffffd7	b	0xfffff7d7fb10
   0x0000fffff7d7fbb8:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7d7fbbc:	17ffffd5	b	0xfffff7d7fb10
   0x0000fffff7d7fbc0:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7d7fbc4:	17ffffd3	b	0xfffff7d7fb10
   0x0000fffff7d7fbc8:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7d7fbcc:	17ffffd1	b	0xfffff7d7fb10
   0x0000fffff7d7fbd0:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7d7fbd4:	17ffffcf	b	0xfffff7d7fb10
   0x0000fffff7d7fbd8:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7d7fbdc:	17ffffcd	b	0xfffff7d7fb10
   0x0000fffff7d7fbe0:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7d7fbe4:	17ffffcb	b	0xfffff7d7fb10
   0x0000fffff7d7fbe8:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7d7fbec:	17ffffc9	b	0xfffff7d7fb10
   0x0000fffff7d7fbf0:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7d7fbf4:	17ffffc7	b	0xfffff7d7fb10
   0x0000fffff7d7fbf8:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7d7fbfc:	17ffffc5	b	0xfffff7d7fb10
   0x0000fffff7d7fc00:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7d7fc04:	17ffffc3	b	0xfffff7d7fb10
   0x0000fffff7d7fc08:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7d7fc0c:	17ffffc1	b	0xfffff7d7fb10
   0x0000fffff7d7fc10:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7d7fc14:	17ffffbf	b	0xfffff7d7fb10
   0x0000fffff7d7fc18:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7d7fc1c:	17ffffbd	b	0xfffff7d7fb10
   0x0000fffff7d7fc20:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7d7fc24:	17ffffbb	b	0xfffff7d7fb10
   0x0000fffff7d7fc28:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7d7fc2c:	17ffffb9	b	0xfffff7d7fb10
   0x0000fffff7d7fc30:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7d7fc34:	17ffffb7	b	0xfffff7d7fb10
   0x0000fffff7d7fc38:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7d7fc3c:	17ffffb5	b	0xfffff7d7fb10
   0x0000fffff7d7fc40:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7d7fc44:	17ffffb3	b	0xfffff7d7fb10
   0x0000fffff7d7fc48:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7d7fc4c:	17ffffb1	b	0xfffff7d7fb10
   0x0000fffff7d7fc50:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7d7fc54:	17ffffaf	b	0xfffff7d7fb10
   0x0000fffff7d7fc58:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7d7fc5c:	17ffffad	b	0xfffff7d7fb10
   0x0000fffff7d7fc60:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7d7fc64:	17ffffab	b	0xfffff7d7fb10
   0x0000fffff7d7fc68:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7d7fc6c:	17ffffa9	b	0xfffff7d7fb10
   0x0000fffff7d7fc70:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7d7fc74:	17ffffa7	b	0xfffff7d7fb10
   0x0000fffff7d7fc78:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7d7fc7c:	17ffffa5	b	0xfffff7d7fb10
   0x0000fffff7d7fc80:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7d7fc84:	17ffffa3	b	0xfffff7d7fb10
   0x0000fffff7d7fc88:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7d7fc8c:	17ffffa1	b	0xfffff7d7fb10
   0x0000fffff7d7fc90:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7d7fc94:	17ffff9f	b	0xfffff7d7fb10
   0x0000fffff7d7fc98:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7d7fc9c:	17ffff9d	b	0xfffff7d7fb10
   0x0000fffff7d7fca0:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7d7fca4:	17ffff9b	b	0xfffff7d7fb10
   0x0000fffff7d7fca8:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7d7fcac:	17ffff99	b	0xfffff7d7fb10
   0x0000fffff7d7fcb0:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7d7fcb4:	17ffff97	b	0xfffff7d7fb10
   0x0000fffff7d7fcb8:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7d7fcbc:	17ffff95	b	0xfffff7d7fb10
   0x0000fffff7d7fcc0:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7d7fcc4:	17ffff93	b	0xfffff7d7fb10
   0x0000fffff7d7fcc8:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7d7fccc:	910003fd	mov	x29, sp
   0x0000fffff7d7fcd0:	f9400be0	ldr	x0, [sp, #16]
   0x0000fffff7d7fcd4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fcd8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fcdc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fce0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fce4:	d63f0200	blr	x16
   0x0000fffff7d7fce8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7fcec:	d65f03c0	ret
End of assembler dump.
