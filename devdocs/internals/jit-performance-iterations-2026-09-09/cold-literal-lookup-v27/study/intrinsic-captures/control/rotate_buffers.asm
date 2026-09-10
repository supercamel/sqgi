Dump of assembler code from 0xfffff7d7e000 to 0xfffff7d80000:
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
   0x0000fffff7d7e074:	1400000e	b	0xfffff7d7e0ac
   0x0000fffff7d7e078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e07c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e080:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e084:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e088:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7d7e08c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e090:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e094:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7e098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e09c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e0a0:	d63f0200	blr	x16
   0x0000fffff7d7e0a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e0a8:	5400e4a0	b.eq	0xfffff7d7fd3c  // b.none
   0x0000fffff7d7e0ac:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e0b0:	37d800e9	tbnz	w9, #27, 0xfffff7d7e0cc
   0x0000fffff7d7e0b4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7e0b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e0bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e0c0:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7e0c4:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7e0c8:	1400000e	b	0xfffff7d7e100
   0x0000fffff7d7e0cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e0d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e0d4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e0d8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e0dc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7d7e0e0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e0e4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e0e8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7e0ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e0f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e0f4:	d63f0200	blr	x16
   0x0000fffff7d7e0f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e0fc:	5400e240	b.eq	0xfffff7d7fd44  // b.none
   0x0000fffff7d7e100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e108:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e10c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e110:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7d7e114:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e118:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e11c:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7d7e120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e128:	d63f0200	blr	x16
   0x0000fffff7d7e12c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e130:	5400e0e0	b.eq	0xfffff7d7fd4c  // b.none
   0x0000fffff7d7e134:	f100041f	cmp	x0, #0x1
   0x0000fffff7d7e138:	5400adc0	b.eq	0xfffff7d7f6f0  // b.none
   0x0000fffff7d7e13c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7e140:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e144:	54000380	b.eq	0xfffff7d7e1b4  // b.none
   0x0000fffff7d7e148:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e14c:	37d8034d	tbnz	w13, #27, 0xfffff7d7e1b4
   0x0000fffff7d7e150:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e154:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e158:	36d80211	tbz	w17, #27, 0xfffff7d7e198
   0x0000fffff7d7e15c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e160:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e164:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e168:	54000261	b.ne	0xfffff7d7e1b4  // b.any
   0x0000fffff7d7e16c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e170:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e174:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e178:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e17c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e180:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e184:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e188:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e18c:	54000149	b.ls	0xfffff7d7e1b4  // b.plast
   0x0000fffff7d7e190:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e194:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e198:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7e19c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7e1a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e1a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e1a8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7e1ac:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7e1b0:	1400000e	b	0xfffff7d7e1e8
   0x0000fffff7d7e1b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7e1b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e1bc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e1c0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e1c4:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7d7e1c8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e1cc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e1d0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7e1d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e1d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e1dc:	d63f0200	blr	x16
   0x0000fffff7d7e1e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e1e4:	5400db80	b.eq	0xfffff7d7fd54  // b.none
   0x0000fffff7d7e1e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e1ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e1f0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e1f4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e1f8:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7d7e1fc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e200:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e204:	d286b610	mov	x16, #0x35b0                	// #13744
   0x0000fffff7d7e208:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e20c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e210:	d63f0200	blr	x16
   0x0000fffff7d7e214:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e218:	5400da20	b.eq	0xfffff7d7fd5c  // b.none
   0x0000fffff7d7e21c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7e220:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e224:	54000380	b.eq	0xfffff7d7e294  // b.none
   0x0000fffff7d7e228:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e22c:	37d8034d	tbnz	w13, #27, 0xfffff7d7e294
   0x0000fffff7d7e230:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e234:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e238:	36d80211	tbz	w17, #27, 0xfffff7d7e278
   0x0000fffff7d7e23c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e240:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e244:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e248:	54000261	b.ne	0xfffff7d7e294  // b.any
   0x0000fffff7d7e24c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e250:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e254:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e258:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e25c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e260:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e264:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e268:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e26c:	54000149	b.ls	0xfffff7d7e294  // b.plast
   0x0000fffff7d7e270:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e274:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e278:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7d7e27c:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7d7e280:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e284:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e288:	f900466c	str	x12, [x19, #136]
   0x0000fffff7d7e28c:	b900826d	str	w13, [x19, #128]
   0x0000fffff7d7e290:	1400000e	b	0xfffff7d7e2c8
   0x0000fffff7d7e294:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7e298:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e29c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e2a0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e2a4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7d7e2a8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e2ac:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e2b0:	d293ec10	mov	x16, #0x9f60                	// #40800
   0x0000fffff7d7e2b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e2b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e2bc:	d63f0200	blr	x16
   0x0000fffff7d7e2c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e2c4:	5400d500	b.eq	0xfffff7d7fd64  // b.none
   0x0000fffff7d7e2c8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7e2cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e2d0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e2d4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e2d8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7d7e2dc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e2e0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e2e4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7d7e2e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e2ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e2f0:	d63f0200	blr	x16
   0x0000fffff7d7e2f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e2f8:	5400d3a0	b.eq	0xfffff7d7fd6c  // b.none
   0x0000fffff7d7e2fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e304:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e308:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e30c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7d7e310:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e314:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e318:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7d7e31c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e324:	d63f0200	blr	x16
   0x0000fffff7d7e328:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e32c:	5400d240	b.eq	0xfffff7d7fd74  // b.none
   0x0000fffff7d7e330:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7e334:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e338:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e33c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e340:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7d7e344:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e348:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e34c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7d7e350:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e354:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e358:	d63f0200	blr	x16
   0x0000fffff7d7e35c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e360:	5400d0e0	b.eq	0xfffff7d7fd7c  // b.none
   0x0000fffff7d7e364:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e368:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e36c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e370:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e374:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7d7e378:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e37c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e380:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7d7e384:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e388:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e38c:	d63f0200	blr	x16
   0x0000fffff7d7e390:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e394:	5400cf80	b.eq	0xfffff7d7fd84  // b.none
   0x0000fffff7d7e398:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7e39c:	37d800e9	tbnz	w9, #27, 0xfffff7d7e3b8
   0x0000fffff7d7e3a0:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7d7e3a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e3a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e3ac:	f9004669	str	x9, [x19, #136]
   0x0000fffff7d7e3b0:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7e3b4:	1400000e	b	0xfffff7d7e3ec
   0x0000fffff7d7e3b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e3bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e3c0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e3c4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e3c8:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7d7e3cc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e3d0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e3d4:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7e3d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e3dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e3e0:	d63f0200	blr	x16
   0x0000fffff7d7e3e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e3e8:	5400cd20	b.eq	0xfffff7d7fd8c  // b.none
   0x0000fffff7d7e3ec:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7e3f0:	37d80389	tbnz	w9, #27, 0xfffff7d7e460
   0x0000fffff7d7e3f4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e3f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e3fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e400:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e404:	540002e1	b.ne	0xfffff7d7e460  // b.any
   0x0000fffff7d7e408:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7e40c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e410:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e414:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e418:	54000241	b.ne	0xfffff7d7e460  // b.any
   0x0000fffff7d7e41c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7e420:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7d7e424:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7e428:	540001c0	b.eq	0xfffff7d7e460  // b.none
   0x0000fffff7d7e42c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7e430:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7e434:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7e438:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7e43c:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7e440:	54000100	b.eq	0xfffff7d7e460  // b.none
   0x0000fffff7d7e444:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7e448:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7e44c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e450:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e454:	f9004669	str	x9, [x19, #136]
   0x0000fffff7d7e458:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7e45c:	1400000e	b	0xfffff7d7e494
   0x0000fffff7d7e460:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e468:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e46c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e470:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7d7e474:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e478:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e47c:	d2921410	mov	x16, #0x90a0                	// #37024
   0x0000fffff7d7e480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e488:	d63f0200	blr	x16
   0x0000fffff7d7e48c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e490:	5400c820	b.eq	0xfffff7d7fd94  // b.none
   0x0000fffff7d7e494:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e498:	37d800e9	tbnz	w9, #27, 0xfffff7d7e4b4
   0x0000fffff7d7e49c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7e4a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e4a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e4a8:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7e4ac:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7e4b0:	1400000e	b	0xfffff7d7e4e8
   0x0000fffff7d7e4b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e4b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e4bc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e4c0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e4c4:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7d7e4c8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e4cc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e4d0:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7e4d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e4d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e4dc:	d63f0200	blr	x16
   0x0000fffff7d7e4e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e4e4:	5400c5c0	b.eq	0xfffff7d7fd9c  // b.none
   0x0000fffff7d7e4e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e4ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e4f0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e4f4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e4f8:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7d7e4fc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e500:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e504:	d293ba90	mov	x16, #0x9dd4                	// #40404
   0x0000fffff7d7e508:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e50c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e510:	d63f0200	blr	x16
   0x0000fffff7d7e514:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e518:	5400c460	b.eq	0xfffff7d7fda4  // b.none
   0x0000fffff7d7e51c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e520:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e524:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e528:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e52c:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7d7e530:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e534:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e538:	d2839810	mov	x16, #0x1cc0                	// #7360
   0x0000fffff7d7e53c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e540:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e544:	d63f0200	blr	x16
   0x0000fffff7d7e548:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e54c:	5400c300	b.eq	0xfffff7d7fdac  // b.none
   0x0000fffff7d7e550:	f100041f	cmp	x0, #0x1
   0x0000fffff7d7e554:	540001e0	b.eq	0xfffff7d7e590  // b.none
   0x0000fffff7d7e558:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e55c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e560:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e564:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e568:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7d7e56c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e570:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e574:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7d7e578:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e57c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e580:	d63f0200	blr	x16
   0x0000fffff7d7e584:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e588:	5400c160	b.eq	0xfffff7d7fdb4  // b.none
   0x0000fffff7d7e58c:	1400000e	b	0xfffff7d7e5c4
   0x0000fffff7d7e590:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e594:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e598:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e59c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e5a0:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7d7e5a4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e5a8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e5ac:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7d7e5b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e5b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e5b8:	d63f0200	blr	x16
   0x0000fffff7d7e5bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e5c0:	5400bfe0	b.eq	0xfffff7d7fdbc  // b.none
   0x0000fffff7d7e5c4:	910143e6	add	x6, sp, #0x50
   0x0000fffff7d7e5c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e5cc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e5d0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e5d4:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7d7e5d8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e5dc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e5e0:	d28bf610	mov	x16, #0x5fb0                	// #24496
   0x0000fffff7d7e5e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e5e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e5ec:	d63f0200	blr	x16
   0x0000fffff7d7e5f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e5f4:	5400be80	b.eq	0xfffff7d7fdc4  // b.none
   0x0000fffff7d7e5f8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7e5fc:	37d80389	tbnz	w9, #27, 0xfffff7d7e66c
   0x0000fffff7d7e600:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e604:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e60c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e610:	540002e1	b.ne	0xfffff7d7e66c  // b.any
   0x0000fffff7d7e614:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7d7e618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e61c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e620:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e624:	54000241	b.ne	0xfffff7d7e66c  // b.any
   0x0000fffff7d7e628:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7e62c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7d7e630:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7e634:	540001c0	b.eq	0xfffff7d7e66c  // b.none
   0x0000fffff7d7e638:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7e63c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7e640:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7e644:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7e648:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7e64c:	54000100	b.eq	0xfffff7d7e66c  // b.none
   0x0000fffff7d7e650:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7e654:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7e658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e65c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e660:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7d7e664:	b900726a	str	w10, [x19, #112]
   0x0000fffff7d7e668:	1400000e	b	0xfffff7d7e6a0
   0x0000fffff7d7e66c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7e670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e674:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e678:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e67c:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7d7e680:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e684:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e688:	d2921410	mov	x16, #0x90a0                	// #37024
   0x0000fffff7d7e68c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7e690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e694:	d63f0200	blr	x16
   0x0000fffff7d7e698:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e69c:	5400b980	b.eq	0xfffff7d7fdcc  // b.none
   0x0000fffff7d7e6a0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7e6a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e6a8:	54000380	b.eq	0xfffff7d7e718  // b.none
   0x0000fffff7d7e6ac:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e6b0:	37d8034d	tbnz	w13, #27, 0xfffff7d7e718
   0x0000fffff7d7e6b4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e6b8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e6bc:	36d80211	tbz	w17, #27, 0xfffff7d7e6fc
   0x0000fffff7d7e6c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e6c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e6c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e6cc:	54000261	b.ne	0xfffff7d7e718  // b.any
   0x0000fffff7d7e6d0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e6d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e6d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e6dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e6e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e6e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e6e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e6ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e6f0:	54000149	b.ls	0xfffff7d7e718  // b.plast
   0x0000fffff7d7e6f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e6f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e6fc:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7d7e700:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7d7e704:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e708:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e70c:	f900466c	str	x12, [x19, #136]
   0x0000fffff7d7e710:	b900826d	str	w13, [x19, #128]
   0x0000fffff7d7e714:	1400000e	b	0xfffff7d7e74c
   0x0000fffff7d7e718:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7e71c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e720:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e724:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e728:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7d7e72c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e730:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e734:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7e738:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e73c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e740:	d63f0200	blr	x16
   0x0000fffff7d7e744:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e748:	5400b460	b.eq	0xfffff7d7fdd4  // b.none
   0x0000fffff7d7e74c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7e750:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e754:	54000380	b.eq	0xfffff7d7e7c4  // b.none
   0x0000fffff7d7e758:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e75c:	37d8034d	tbnz	w13, #27, 0xfffff7d7e7c4
   0x0000fffff7d7e760:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e764:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e768:	36d80211	tbz	w17, #27, 0xfffff7d7e7a8
   0x0000fffff7d7e76c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e770:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e774:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e778:	54000261	b.ne	0xfffff7d7e7c4  // b.any
   0x0000fffff7d7e77c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e780:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e784:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e788:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e78c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e790:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e794:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e798:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e79c:	54000149	b.ls	0xfffff7d7e7c4  // b.plast
   0x0000fffff7d7e7a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e7a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e7a8:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7d7e7ac:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7d7e7b0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e7b4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e7b8:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7d7e7bc:	b900926d	str	w13, [x19, #144]
   0x0000fffff7d7e7c0:	1400000e	b	0xfffff7d7e7f8
   0x0000fffff7d7e7c4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7e7c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e7cc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e7d0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e7d4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7d7e7d8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e7dc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e7e0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7e7e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e7e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e7ec:	d63f0200	blr	x16
   0x0000fffff7d7e7f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e7f4:	5400af40	b.eq	0xfffff7d7fddc  // b.none
   0x0000fffff7d7e7f8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e7fc:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7e800:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7e804:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e808:	540001c1	b.ne	0xfffff7d7e840  // b.any
   0x0000fffff7d7e80c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7e810:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e814:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e818:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e81c:	540006e1	b.ne	0xfffff7d7e8f8  // b.any
   0x0000fffff7d7e820:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7d7e824:	f9404e6b	ldr	x11, [x19, #152]
   0x0000fffff7d7e828:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7e82c:	eb09015f	cmp	x10, x9
   0x0000fffff7d7e830:	54000642	b.cs	0xfffff7d7e8f8  // b.hs, b.nlast
   0x0000fffff7d7e834:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7e838:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7e83c:	14000014	b	0xfffff7d7e88c
   0x0000fffff7d7e840:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7d7e844:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7e848:	54000580	b.eq	0xfffff7d7e8f8  // b.none
   0x0000fffff7d7e84c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e850:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7d7e854:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e858:	54000501	b.ne	0xfffff7d7e8f8  // b.any
   0x0000fffff7d7e85c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7e860:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7d7e864:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e868:	54000481	b.ne	0xfffff7d7e8f8  // b.any
   0x0000fffff7d7e86c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7e870:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7d7e874:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e878:	54000401	b.ne	0xfffff7d7e8f8  // b.any
   0x0000fffff7d7e87c:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7d7e880:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7d7e884:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e888:	54000381	b.ne	0xfffff7d7e8f8  // b.any
   0x0000fffff7d7e88c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7e890:	37d8034d	tbnz	w13, #27, 0xfffff7d7e8f8
   0x0000fffff7d7e894:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7e898:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7e89c:	36d80211	tbz	w17, #27, 0xfffff7d7e8dc
   0x0000fffff7d7e8a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7e8a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7e8a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7e8ac:	54000261	b.ne	0xfffff7d7e8f8  // b.any
   0x0000fffff7d7e8b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7e8b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7e8b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7e8bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7e8c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7e8c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7e8c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7e8cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7e8d0:	54000149	b.ls	0xfffff7d7e8f8  // b.plast
   0x0000fffff7d7e8d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7e8d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7e8dc:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7d7e8e0:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7d7e8e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7e8e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7e8ec:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7d7e8f0:	b900926d	str	w13, [x19, #144]
   0x0000fffff7d7e8f4:	1400000e	b	0xfffff7d7e92c
   0x0000fffff7d7e8f8:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7d7e8fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7e900:	aa1303e1	mov	x1, x19
   0x0000fffff7d7e904:	aa1503e2	mov	x2, x21
   0x0000fffff7d7e908:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7d7e90c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7e910:	aa1603e5	mov	x5, x22
   0x0000fffff7d7e914:	d289e210	mov	x16, #0x4f10                	// #20240
   0x0000fffff7d7e918:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7e91c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7e920:	d63f0200	blr	x16
   0x0000fffff7d7e924:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7e928:	5400a5e0	b.eq	0xfffff7d7fde4  // b.none
   0x0000fffff7d7e92c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e930:	37d806a9	tbnz	w9, #27, 0xfffff7d7ea04
   0x0000fffff7d7e934:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e93c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e940:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e944:	540001c1	b.ne	0xfffff7d7e97c  // b.any
   0x0000fffff7d7e948:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e94c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e954:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e958:	54000121	b.ne	0xfffff7d7e97c  // b.any
   0x0000fffff7d7e95c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7e960:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7d7e964:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7e968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e96c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e970:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7e974:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7e978:	14000030	b	0xfffff7d7ea38
   0x0000fffff7d7e97c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e980:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e988:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e98c:	54000120	b.eq	0xfffff7d7e9b0  // b.none
   0x0000fffff7d7e990:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7e994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e99c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e9a0:	54000321	b.ne	0xfffff7d7ea04  // b.any
   0x0000fffff7d7e9a4:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7e9a8:	9e620120	scvtf	d0, x9
   0x0000fffff7d7e9ac:	14000002	b	0xfffff7d7e9b4
   0x0000fffff7d7e9b0:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7d7e9b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e9b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e9bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e9c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e9c4:	54000120	b.eq	0xfffff7d7e9e8  // b.none
   0x0000fffff7d7e9c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7e9cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7e9d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e9d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7e9d8:	54000161	b.ne	0xfffff7d7ea04  // b.any
   0x0000fffff7d7e9dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7e9e0:	9e620121	scvtf	d1, x9
   0x0000fffff7d7e9e4:	14000002	b	0xfffff7d7e9ec
   0x0000fffff7d7e9e8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7d7e9ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7e9f0:	fd004e60	str	d0, [x19, #152]
   0x0000fffff7d7e9f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7e9f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7e9fc:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7ea00:	17ffffde	b	0xfffff7d7e978
   0x0000fffff7d7ea04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7ea08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ea0c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ea10:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ea14:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7d7ea18:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ea1c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ea20:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7ea24:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7ea28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ea2c:	d63f0200	blr	x16
   0x0000fffff7d7ea30:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ea34:	54009dc0	b.eq	0xfffff7d7fdec  // b.none
   0x0000fffff7d7ea38:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7d7ea3c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7ea40:	54000380	b.eq	0xfffff7d7eab0  // b.none
   0x0000fffff7d7ea44:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7ea48:	37d8034d	tbnz	w13, #27, 0xfffff7d7eab0
   0x0000fffff7d7ea4c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ea50:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7ea54:	36d80211	tbz	w17, #27, 0xfffff7d7ea94
   0x0000fffff7d7ea58:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7ea5c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7ea60:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7ea64:	54000261	b.ne	0xfffff7d7eab0  // b.any
   0x0000fffff7d7ea68:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7ea6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ea70:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7ea74:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7ea78:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ea7c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7ea80:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7ea84:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7ea88:	54000149	b.ls	0xfffff7d7eab0  // b.plast
   0x0000fffff7d7ea8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ea90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ea94:	b940a26e	ldr	w14, [x19, #160]
   0x0000fffff7d7ea98:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7d7ea9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7eaa0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7eaa4:	f900566c	str	x12, [x19, #168]
   0x0000fffff7d7eaa8:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7d7eaac:	1400000e	b	0xfffff7d7eae4
   0x0000fffff7d7eab0:	910243e6	add	x6, sp, #0x90
   0x0000fffff7d7eab4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7eab8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7eabc:	aa1503e2	mov	x2, x21
   0x0000fffff7d7eac0:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7d7eac4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7eac8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7eacc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7ead0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ead4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ead8:	d63f0200	blr	x16
   0x0000fffff7d7eadc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eae0:	540098a0	b.eq	0xfffff7d7fdf4  // b.none
   0x0000fffff7d7eae4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7eae8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7eaec:	aa1303e1	mov	x1, x19
   0x0000fffff7d7eaf0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7eaf4:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7d7eaf8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7eafc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7eb00:	d28b1210	mov	x16, #0x5890                	// #22672
   0x0000fffff7d7eb04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7eb08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7eb0c:	d63f0200	blr	x16
   0x0000fffff7d7eb10:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eb14:	54009740	b.eq	0xfffff7d7fdfc  // b.none
   0x0000fffff7d7eb18:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7eb1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7eb20:	aa1303e1	mov	x1, x19
   0x0000fffff7d7eb24:	aa1503e2	mov	x2, x21
   0x0000fffff7d7eb28:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7d7eb2c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7eb30:	aa1603e5	mov	x5, x22
   0x0000fffff7d7eb34:	d2965a10	mov	x16, #0xb2d0                	// #45776
   0x0000fffff7d7eb38:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7eb3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7eb40:	d63f0200	blr	x16
   0x0000fffff7d7eb44:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eb48:	540095e0	b.eq	0xfffff7d7fe04  // b.none
   0x0000fffff7d7eb4c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7eb50:	37d806a9	tbnz	w9, #27, 0xfffff7d7ec24
   0x0000fffff7d7eb54:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7eb58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7eb5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eb60:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eb64:	540001c1	b.ne	0xfffff7d7eb9c  // b.any
   0x0000fffff7d7eb68:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7eb6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7eb70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eb74:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eb78:	54000121	b.ne	0xfffff7d7eb9c  // b.any
   0x0000fffff7d7eb7c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7eb80:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7d7eb84:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7eb88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7eb8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eb90:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7eb94:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7eb98:	14000030	b	0xfffff7d7ec58
   0x0000fffff7d7eb9c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7eba0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7eba4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7eba8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ebac:	54000120	b.eq	0xfffff7d7ebd0  // b.none
   0x0000fffff7d7ebb0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7ebb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ebb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ebbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ebc0:	54000321	b.ne	0xfffff7d7ec24  // b.any
   0x0000fffff7d7ebc4:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7ebc8:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ebcc:	14000002	b	0xfffff7d7ebd4
   0x0000fffff7d7ebd0:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7d7ebd4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7ebd8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ebdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ebe0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ebe4:	54000120	b.eq	0xfffff7d7ec08  // b.none
   0x0000fffff7d7ebe8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7ebec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ebf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ebf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ebf8:	54000161	b.ne	0xfffff7d7ec24  // b.any
   0x0000fffff7d7ebfc:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7d7ec00:	9e620121	scvtf	d1, x9
   0x0000fffff7d7ec04:	14000002	b	0xfffff7d7ec0c
   0x0000fffff7d7ec08:	fd405661	ldr	d1, [x19, #168]
   0x0000fffff7d7ec0c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7ec10:	fd004e60	str	d0, [x19, #152]
   0x0000fffff7d7ec14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ec18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ec1c:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7ec20:	17ffffde	b	0xfffff7d7eb98
   0x0000fffff7d7ec24:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7ec28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ec2c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ec30:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ec34:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7d7ec38:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ec3c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ec40:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7ec44:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7ec48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ec4c:	d63f0200	blr	x16
   0x0000fffff7d7ec50:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ec54:	54008dc0	b.eq	0xfffff7d7fe0c  // b.none
   0x0000fffff7d7ec58:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7ec5c:	37d800e9	tbnz	w9, #27, 0xfffff7d7ec78
   0x0000fffff7d7ec60:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7d7ec64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ec68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ec6c:	f9005669	str	x9, [x19, #168]
   0x0000fffff7d7ec70:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7ec74:	1400000e	b	0xfffff7d7ecac
   0x0000fffff7d7ec78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7ec7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ec80:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ec84:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ec88:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7d7ec8c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ec90:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ec94:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7ec98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ec9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7eca0:	d63f0200	blr	x16
   0x0000fffff7d7eca4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7eca8:	54008b60	b.eq	0xfffff7d7fe14  // b.none
   0x0000fffff7d7ecac:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7ecb0:	37d80389	tbnz	w9, #27, 0xfffff7d7ed20
   0x0000fffff7d7ecb4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7ecb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ecbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ecc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ecc4:	540002e1	b.ne	0xfffff7d7ed20  // b.any
   0x0000fffff7d7ecc8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7eccc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ecd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ecd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ecd8:	54000241	b.ne	0xfffff7d7ed20  // b.any
   0x0000fffff7d7ecdc:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7ece0:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7d7ece4:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7ece8:	540001c0	b.eq	0xfffff7d7ed20  // b.none
   0x0000fffff7d7ecec:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7ecf0:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7ecf4:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7ecf8:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7ecfc:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7ed00:	54000100	b.eq	0xfffff7d7ed20  // b.none
   0x0000fffff7d7ed04:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7ed08:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7ed0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ed10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ed14:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7ed18:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7ed1c:	1400000e	b	0xfffff7d7ed54
   0x0000fffff7d7ed20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7ed24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ed28:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ed2c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ed30:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7d7ed34:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ed38:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ed3c:	d2921410	mov	x16, #0x90a0                	// #37024
   0x0000fffff7d7ed40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7ed44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ed48:	d63f0200	blr	x16
   0x0000fffff7d7ed4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ed50:	54008660	b.eq	0xfffff7d7fe1c  // b.none
   0x0000fffff7d7ed54:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7d7ed58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ed5c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ed60:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ed64:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7d7ed68:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ed6c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ed70:	d28bf610	mov	x16, #0x5fb0                	// #24496
   0x0000fffff7d7ed74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ed78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ed7c:	d63f0200	blr	x16
   0x0000fffff7d7ed80:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ed84:	54008500	b.eq	0xfffff7d7fe24  // b.none
   0x0000fffff7d7ed88:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7ed8c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7ed90:	54000380	b.eq	0xfffff7d7ee00  // b.none
   0x0000fffff7d7ed94:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7ed98:	37d8034d	tbnz	w13, #27, 0xfffff7d7ee00
   0x0000fffff7d7ed9c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7eda0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7eda4:	36d80211	tbz	w17, #27, 0xfffff7d7ede4
   0x0000fffff7d7eda8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7edac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7edb0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7edb4:	54000261	b.ne	0xfffff7d7ee00  // b.any
   0x0000fffff7d7edb8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7edbc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7edc0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7edc4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7edc8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7edcc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7edd0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7edd4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7edd8:	54000149	b.ls	0xfffff7d7ee00  // b.plast
   0x0000fffff7d7eddc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ede0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ede4:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7d7ede8:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7d7edec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7edf0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7edf4:	f900466c	str	x12, [x19, #136]
   0x0000fffff7d7edf8:	b900826d	str	w13, [x19, #128]
   0x0000fffff7d7edfc:	1400000e	b	0xfffff7d7ee34
   0x0000fffff7d7ee00:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7ee04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ee08:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ee0c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ee10:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7d7ee14:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ee18:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ee1c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7ee20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ee24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ee28:	d63f0200	blr	x16
   0x0000fffff7d7ee2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ee30:	54007fe0	b.eq	0xfffff7d7fe2c  // b.none
   0x0000fffff7d7ee34:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7ee38:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7ee3c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7ee40:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee44:	540001c1	b.ne	0xfffff7d7ee7c  // b.any
   0x0000fffff7d7ee48:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7ee4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ee50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ee54:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee58:	540006e1	b.ne	0xfffff7d7ef34  // b.any
   0x0000fffff7d7ee5c:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7d7ee60:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7d7ee64:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7ee68:	eb09015f	cmp	x10, x9
   0x0000fffff7d7ee6c:	54000642	b.cs	0xfffff7d7ef34  // b.hs, b.nlast
   0x0000fffff7d7ee70:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7ee74:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7ee78:	14000014	b	0xfffff7d7eec8
   0x0000fffff7d7ee7c:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7d7ee80:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7ee84:	54000580	b.eq	0xfffff7d7ef34  // b.none
   0x0000fffff7d7ee88:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7ee8c:	b940b3ea	ldr	w10, [sp, #176]
   0x0000fffff7d7ee90:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ee94:	54000501	b.ne	0xfffff7d7ef34  // b.any
   0x0000fffff7d7ee98:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7ee9c:	f9405fea	ldr	x10, [sp, #184]
   0x0000fffff7d7eea0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eea4:	54000481	b.ne	0xfffff7d7ef34  // b.any
   0x0000fffff7d7eea8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7eeac:	b940b7ea	ldr	w10, [sp, #180]
   0x0000fffff7d7eeb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eeb4:	54000401	b.ne	0xfffff7d7ef34  // b.any
   0x0000fffff7d7eeb8:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7d7eebc:	f94063ea	ldr	x10, [sp, #192]
   0x0000fffff7d7eec0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7eec4:	54000381	b.ne	0xfffff7d7ef34  // b.any
   0x0000fffff7d7eec8:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7eecc:	37d8034d	tbnz	w13, #27, 0xfffff7d7ef34
   0x0000fffff7d7eed0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7eed4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7eed8:	36d80211	tbz	w17, #27, 0xfffff7d7ef18
   0x0000fffff7d7eedc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7eee0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7eee4:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7eee8:	54000261	b.ne	0xfffff7d7ef34  // b.any
   0x0000fffff7d7eeec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7eef0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7eef4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7eef8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7eefc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ef00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7ef04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7ef08:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7ef0c:	54000149	b.ls	0xfffff7d7ef34  // b.plast
   0x0000fffff7d7ef10:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ef14:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ef18:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7d7ef1c:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7d7ef20:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7ef24:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7ef28:	f900466c	str	x12, [x19, #136]
   0x0000fffff7d7ef2c:	b900826d	str	w13, [x19, #128]
   0x0000fffff7d7ef30:	1400000e	b	0xfffff7d7ef68
   0x0000fffff7d7ef34:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7d7ef38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ef3c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ef40:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ef44:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7d7ef48:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ef4c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ef50:	d289e210	mov	x16, #0x4f10                	// #20240
   0x0000fffff7d7ef54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ef58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ef5c:	d63f0200	blr	x16
   0x0000fffff7d7ef60:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ef64:	54007680	b.eq	0xfffff7d7fe34  // b.none
   0x0000fffff7d7ef68:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7ef6c:	37d806a9	tbnz	w9, #27, 0xfffff7d7f040
   0x0000fffff7d7ef70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ef74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ef78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ef7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ef80:	540001c1	b.ne	0xfffff7d7efb8  // b.any
   0x0000fffff7d7ef84:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7ef88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ef8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ef90:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ef94:	54000121	b.ne	0xfffff7d7efb8  // b.any
   0x0000fffff7d7ef98:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ef9c:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7d7efa0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7efa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7efa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7efac:	f9004669	str	x9, [x19, #136]
   0x0000fffff7d7efb0:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7efb4:	14000030	b	0xfffff7d7f074
   0x0000fffff7d7efb8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7efbc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7efc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7efc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7efc8:	54000120	b.eq	0xfffff7d7efec  // b.none
   0x0000fffff7d7efcc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7efd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7efd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7efd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7efdc:	54000321	b.ne	0xfffff7d7f040  // b.any
   0x0000fffff7d7efe0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7efe4:	9e620120	scvtf	d0, x9
   0x0000fffff7d7efe8:	14000002	b	0xfffff7d7eff0
   0x0000fffff7d7efec:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7eff0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7eff4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7eff8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7effc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f000:	54000120	b.eq	0xfffff7d7f024  // b.none
   0x0000fffff7d7f004:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f008:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f00c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f010:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f014:	54000161	b.ne	0xfffff7d7f040  // b.any
   0x0000fffff7d7f018:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7f01c:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f020:	14000002	b	0xfffff7d7f028
   0x0000fffff7d7f024:	fd404661	ldr	d1, [x19, #136]
   0x0000fffff7d7f028:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f02c:	fd004660	str	d0, [x19, #136]
   0x0000fffff7d7f030:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f034:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f038:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7f03c:	17ffffde	b	0xfffff7d7efb4
   0x0000fffff7d7f040:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f044:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f048:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f04c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f050:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7d7f054:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f058:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f05c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f060:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f064:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f068:	d63f0200	blr	x16
   0x0000fffff7d7f06c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f070:	54006e60	b.eq	0xfffff7d7fe3c  // b.none
   0x0000fffff7d7f074:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7f078:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f07c:	54000380	b.eq	0xfffff7d7f0ec  // b.none
   0x0000fffff7d7f080:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f084:	37d8034d	tbnz	w13, #27, 0xfffff7d7f0ec
   0x0000fffff7d7f088:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f08c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f090:	36d80211	tbz	w17, #27, 0xfffff7d7f0d0
   0x0000fffff7d7f094:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f098:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f09c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f0a0:	54000261	b.ne	0xfffff7d7f0ec  // b.any
   0x0000fffff7d7f0a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f0a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f0ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f0b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f0b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f0b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f0bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f0c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f0c4:	54000149	b.ls	0xfffff7d7f0ec  // b.plast
   0x0000fffff7d7f0c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f0cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f0d0:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7d7f0d4:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7d7f0d8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f0dc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f0e0:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7d7f0e4:	b900926d	str	w13, [x19, #144]
   0x0000fffff7d7f0e8:	1400000e	b	0xfffff7d7f120
   0x0000fffff7d7f0ec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7f0f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f0f4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f0f8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f0fc:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7d7f100:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f104:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f108:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7f10c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f110:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f114:	d63f0200	blr	x16
   0x0000fffff7d7f118:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f11c:	54006940	b.eq	0xfffff7d7fe44  // b.none
   0x0000fffff7d7f120:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f124:	37d800e9	tbnz	w9, #27, 0xfffff7d7f140
   0x0000fffff7d7f128:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7d7f12c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f130:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f134:	f9005669	str	x9, [x19, #168]
   0x0000fffff7d7f138:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7f13c:	1400000e	b	0xfffff7d7f174
   0x0000fffff7d7f140:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f144:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f148:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f14c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f150:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7d7f154:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f158:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f15c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7f160:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f164:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f168:	d63f0200	blr	x16
   0x0000fffff7d7f16c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f170:	540066e0	b.eq	0xfffff7d7fe4c  // b.none
   0x0000fffff7d7f174:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f178:	37d806a9	tbnz	w9, #27, 0xfffff7d7f24c
   0x0000fffff7d7f17c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7f180:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f184:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f188:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f18c:	540001c1	b.ne	0xfffff7d7f1c4  // b.any
   0x0000fffff7d7f190:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f194:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f198:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f19c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f1a0:	54000121	b.ne	0xfffff7d7f1c4  // b.any
   0x0000fffff7d7f1a4:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7d7f1a8:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7d7f1ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f1b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f1b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f1b8:	f9005669	str	x9, [x19, #168]
   0x0000fffff7d7f1bc:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7f1c0:	14000030	b	0xfffff7d7f280
   0x0000fffff7d7f1c4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7f1c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f1cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f1d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f1d4:	54000120	b.eq	0xfffff7d7f1f8  // b.none
   0x0000fffff7d7f1d8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7f1dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f1e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f1e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f1e8:	54000321	b.ne	0xfffff7d7f24c  // b.any
   0x0000fffff7d7f1ec:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7d7f1f0:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f1f4:	14000002	b	0xfffff7d7f1fc
   0x0000fffff7d7f1f8:	fd403e60	ldr	d0, [x19, #120]
   0x0000fffff7d7f1fc:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f200:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f204:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f208:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f20c:	54000120	b.eq	0xfffff7d7f230  // b.none
   0x0000fffff7d7f210:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f214:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f218:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f21c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f220:	54000161	b.ne	0xfffff7d7f24c  // b.any
   0x0000fffff7d7f224:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7d7f228:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f22c:	14000002	b	0xfffff7d7f234
   0x0000fffff7d7f230:	fd405661	ldr	d1, [x19, #168]
   0x0000fffff7d7f234:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f238:	fd005660	str	d0, [x19, #168]
   0x0000fffff7d7f23c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f244:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7f248:	17ffffde	b	0xfffff7d7f1c0
   0x0000fffff7d7f24c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f250:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f254:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f258:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f25c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7d7f260:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f264:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f268:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f26c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f270:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f274:	d63f0200	blr	x16
   0x0000fffff7d7f278:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f27c:	54005ec0	b.eq	0xfffff7d7fe54  // b.none
   0x0000fffff7d7f280:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f284:	37d80389	tbnz	w9, #27, 0xfffff7d7f2f4
   0x0000fffff7d7f288:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f28c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f290:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f294:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f298:	540002e1	b.ne	0xfffff7d7f2f4  // b.any
   0x0000fffff7d7f29c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7d7f2a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f2a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f2a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f2ac:	54000241	b.ne	0xfffff7d7f2f4  // b.any
   0x0000fffff7d7f2b0:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7d7f2b4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7d7f2b8:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7f2bc:	540001c0	b.eq	0xfffff7d7f2f4  // b.none
   0x0000fffff7d7f2c0:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7f2c4:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7f2c8:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7f2cc:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7f2d0:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7f2d4:	54000100	b.eq	0xfffff7d7f2f4  // b.none
   0x0000fffff7d7f2d8:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7f2dc:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7f2e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f2e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f2e8:	f9005669	str	x9, [x19, #168]
   0x0000fffff7d7f2ec:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7d7f2f0:	1400000e	b	0xfffff7d7f328
   0x0000fffff7d7f2f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f2f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f2fc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f300:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f304:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7d7f308:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f30c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f310:	d2921410	mov	x16, #0x90a0                	// #37024
   0x0000fffff7d7f314:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f318:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f31c:	d63f0200	blr	x16
   0x0000fffff7d7f320:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f324:	540059c0	b.eq	0xfffff7d7fe5c  // b.none
   0x0000fffff7d7f328:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f32c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7f330:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7f334:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f338:	540001c1	b.ne	0xfffff7d7f370  // b.any
   0x0000fffff7d7f33c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f340:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f344:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f348:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f34c:	540006e1	b.ne	0xfffff7d7f428  // b.any
   0x0000fffff7d7f350:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7d7f354:	f9404e6b	ldr	x11, [x19, #152]
   0x0000fffff7d7f358:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7f35c:	eb09015f	cmp	x10, x9
   0x0000fffff7d7f360:	54000642	b.cs	0xfffff7d7f428  // b.hs, b.nlast
   0x0000fffff7d7f364:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7f368:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7f36c:	14000014	b	0xfffff7d7f3bc
   0x0000fffff7d7f370:	f94077eb	ldr	x11, [sp, #232]
   0x0000fffff7d7f374:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f378:	54000580	b.eq	0xfffff7d7f428  // b.none
   0x0000fffff7d7f37c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f380:	b940d3ea	ldr	w10, [sp, #208]
   0x0000fffff7d7f384:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f388:	54000501	b.ne	0xfffff7d7f428  // b.any
   0x0000fffff7d7f38c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7f390:	f9406fea	ldr	x10, [sp, #216]
   0x0000fffff7d7f394:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f398:	54000481	b.ne	0xfffff7d7f428  // b.any
   0x0000fffff7d7f39c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7d7f3a0:	b940d7ea	ldr	w10, [sp, #212]
   0x0000fffff7d7f3a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f3a8:	54000401	b.ne	0xfffff7d7f428  // b.any
   0x0000fffff7d7f3ac:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7d7f3b0:	f94073ea	ldr	x10, [sp, #224]
   0x0000fffff7d7f3b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f3b8:	54000381	b.ne	0xfffff7d7f428  // b.any
   0x0000fffff7d7f3bc:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f3c0:	37d8034d	tbnz	w13, #27, 0xfffff7d7f428
   0x0000fffff7d7f3c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f3c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f3cc:	36d80211	tbz	w17, #27, 0xfffff7d7f40c
   0x0000fffff7d7f3d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f3d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f3d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f3dc:	54000261	b.ne	0xfffff7d7f428  // b.any
   0x0000fffff7d7f3e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f3e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f3e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f3ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f3f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f3f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f3f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f3fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f400:	54000149	b.ls	0xfffff7d7f428  // b.plast
   0x0000fffff7d7f404:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f408:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f40c:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7d7f410:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7d7f414:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f418:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f41c:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7d7f420:	b900926d	str	w13, [x19, #144]
   0x0000fffff7d7f424:	1400000e	b	0xfffff7d7f45c
   0x0000fffff7d7f428:	910343e6	add	x6, sp, #0xd0
   0x0000fffff7d7f42c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f430:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f434:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f438:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7d7f43c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f440:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f444:	d289e210	mov	x16, #0x4f10                	// #20240
   0x0000fffff7d7f448:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f44c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f450:	d63f0200	blr	x16
   0x0000fffff7d7f454:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f458:	54005060	b.eq	0xfffff7d7fe64  // b.none
   0x0000fffff7d7f45c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f460:	37d806a9	tbnz	w9, #27, 0xfffff7d7f534
   0x0000fffff7d7f464:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f468:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f46c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f470:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f474:	540001c1	b.ne	0xfffff7d7f4ac  // b.any
   0x0000fffff7d7f478:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f47c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f480:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f484:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f488:	54000121	b.ne	0xfffff7d7f4ac  // b.any
   0x0000fffff7d7f48c:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7f490:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7d7f494:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f498:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f49c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f4a0:	f9004669	str	x9, [x19, #136]
   0x0000fffff7d7f4a4:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7f4a8:	14000030	b	0xfffff7d7f568
   0x0000fffff7d7f4ac:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f4b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f4b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f4b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f4bc:	54000120	b.eq	0xfffff7d7f4e0  // b.none
   0x0000fffff7d7f4c0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f4c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f4c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f4cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f4d0:	54000321	b.ne	0xfffff7d7f534  // b.any
   0x0000fffff7d7f4d4:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7f4d8:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f4dc:	14000002	b	0xfffff7d7f4e4
   0x0000fffff7d7f4e0:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7d7f4e4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f4e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f4ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f4f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f4f4:	54000120	b.eq	0xfffff7d7f518  // b.none
   0x0000fffff7d7f4f8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f4fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f500:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f504:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f508:	54000161	b.ne	0xfffff7d7f534  // b.any
   0x0000fffff7d7f50c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7d7f510:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f514:	14000002	b	0xfffff7d7f51c
   0x0000fffff7d7f518:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7d7f51c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f520:	fd004660	str	d0, [x19, #136]
   0x0000fffff7d7f524:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f52c:	b900826a	str	w10, [x19, #128]
   0x0000fffff7d7f530:	17ffffde	b	0xfffff7d7f4a8
   0x0000fffff7d7f534:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f538:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f53c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f540:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f544:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7d7f548:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f54c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f550:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f554:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f558:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f55c:	d63f0200	blr	x16
   0x0000fffff7d7f560:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f564:	54004840	b.eq	0xfffff7d7fe6c  // b.none
   0x0000fffff7d7f568:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f56c:	37d80109	tbnz	w9, #27, 0xfffff7d7f58c
   0x0000fffff7d7f570:	d2884869	mov	x9, #0x4243                	// #16963
   0x0000fffff7d7f574:	f2a001e9	movk	x9, #0xf, lsl #16
   0x0000fffff7d7f578:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f57c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f580:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7d7f584:	b900926a	str	w10, [x19, #144]
   0x0000fffff7d7f588:	1400000e	b	0xfffff7d7f5c0
   0x0000fffff7d7f58c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f590:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f594:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f598:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f59c:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7d7f5a0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f5a4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f5a8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7f5ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f5b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f5b4:	d63f0200	blr	x16
   0x0000fffff7d7f5b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f5bc:	540045c0	b.eq	0xfffff7d7fe74  // b.none
   0x0000fffff7d7f5c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f5c4:	37d80389	tbnz	w9, #27, 0xfffff7d7f634
   0x0000fffff7d7f5c8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d7f5cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f5d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f5d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f5d8:	540002e1	b.ne	0xfffff7d7f634  // b.any
   0x0000fffff7d7f5dc:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d7f5e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f5e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f5e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f5ec:	54000241	b.ne	0xfffff7d7f634  // b.any
   0x0000fffff7d7f5f0:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7d7f5f4:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7d7f5f8:	f100015f	cmp	x10, #0x0
   0x0000fffff7d7f5fc:	540001c0	b.eq	0xfffff7d7f634  // b.none
   0x0000fffff7d7f600:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7d7f604:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7d7f608:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7d7f60c:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7d7f610:	eb0b015f	cmp	x10, x11
   0x0000fffff7d7f614:	54000100	b.eq	0xfffff7d7f634  // b.none
   0x0000fffff7d7f618:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d7f61c:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d7f620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f628:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7f62c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7f630:	1400000e	b	0xfffff7d7f668
   0x0000fffff7d7f634:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f638:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f63c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f640:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f644:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7d7f648:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f64c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f650:	d2921410	mov	x16, #0x90a0                	// #37024
   0x0000fffff7d7f654:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f658:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f65c:	d63f0200	blr	x16
   0x0000fffff7d7f660:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f664:	540040c0	b.eq	0xfffff7d7fe7c  // b.none
   0x0000fffff7d7f668:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f66c:	37d80269	tbnz	w9, #27, 0xfffff7d7f6b8
   0x0000fffff7d7f670:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f674:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f678:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f67c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f680:	540001c1	b.ne	0xfffff7d7f6b8  // b.any
   0x0000fffff7d7f684:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7f688:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7d7f68c:	8b0a012b	add	x11, x9, x10
   0x0000fffff7d7f690:	f9003669	str	x9, [x19, #104]
   0x0000fffff7d7f694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f69c:	b900626a	str	w10, [x19, #96]
   0x0000fffff7d7f6a0:	aa0b03e9	mov	x9, x11
   0x0000fffff7d7f6a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f6a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f6ac:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7f6b0:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7f6b4:	1400000e	b	0xfffff7d7f6ec
   0x0000fffff7d7f6b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f6bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f6c0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f6c4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f6c8:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7d7f6cc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f6d0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f6d4:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7d7f6d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f6dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f6e0:	d63f0200	blr	x16
   0x0000fffff7d7f6e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f6e8:	54003ce0	b.eq	0xfffff7d7fe84  // b.none
   0x0000fffff7d7f6ec:	17fffa85	b	0xfffff7d7e100
   0x0000fffff7d7f6f0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7f6f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f6f8:	54000380	b.eq	0xfffff7d7f768  // b.none
   0x0000fffff7d7f6fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f700:	37d8034d	tbnz	w13, #27, 0xfffff7d7f768
   0x0000fffff7d7f704:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f708:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f70c:	36d80211	tbz	w17, #27, 0xfffff7d7f74c
   0x0000fffff7d7f710:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f714:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f718:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f71c:	54000261	b.ne	0xfffff7d7f768  // b.any
   0x0000fffff7d7f720:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f724:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f728:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f72c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f730:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f734:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f738:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f73c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f740:	54000149	b.ls	0xfffff7d7f768  // b.plast
   0x0000fffff7d7f744:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f748:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f74c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7d7f750:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7d7f754:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f758:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f75c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7d7f760:	b900526d	str	w13, [x19, #80]
   0x0000fffff7d7f764:	1400000e	b	0xfffff7d7f79c
   0x0000fffff7d7f768:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7f76c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f770:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f774:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f778:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7d7f77c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f780:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f784:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7f788:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f78c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f790:	d63f0200	blr	x16
   0x0000fffff7d7f794:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f798:	540037a0	b.eq	0xfffff7d7fe8c  // b.none
   0x0000fffff7d7f79c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f7a0:	37d800e9	tbnz	w9, #27, 0xfffff7d7f7bc
   0x0000fffff7d7f7a4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7f7a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f7ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f7b0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7d7f7b4:	b900626a	str	w10, [x19, #96]
   0x0000fffff7d7f7b8:	1400000e	b	0xfffff7d7f7f0
   0x0000fffff7d7f7bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f7c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f7c4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f7c8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f7cc:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7d7f7d0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f7d4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f7d8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7f7dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f7e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f7e4:	d63f0200	blr	x16
   0x0000fffff7d7f7e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f7ec:	54003540	b.eq	0xfffff7d7fe94  // b.none
   0x0000fffff7d7f7f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f7f4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7f7f8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7f7fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f800:	54000501	b.ne	0xfffff7d7f8a0  // b.any
   0x0000fffff7d7f804:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7f808:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f80c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f810:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f814:	54000461	b.ne	0xfffff7d7f8a0  // b.any
   0x0000fffff7d7f818:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7f81c:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7d7f820:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7f824:	eb09015f	cmp	x10, x9
   0x0000fffff7d7f828:	540003c2	b.cs	0xfffff7d7f8a0  // b.hs, b.nlast
   0x0000fffff7d7f82c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7f830:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7f834:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f838:	37d8034d	tbnz	w13, #27, 0xfffff7d7f8a0
   0x0000fffff7d7f83c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f840:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f844:	36d80211	tbz	w17, #27, 0xfffff7d7f884
   0x0000fffff7d7f848:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7f84c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7f850:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7f854:	54000261	b.ne	0xfffff7d7f8a0  // b.any
   0x0000fffff7d7f858:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7f85c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7f860:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7f864:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7f868:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7f86c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7f870:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7f874:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7f878:	54000149	b.ls	0xfffff7d7f8a0  // b.plast
   0x0000fffff7d7f87c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7f880:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7f884:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7d7f888:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7d7f88c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7f890:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7f894:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7d7f898:	b900526d	str	w13, [x19, #80]
   0x0000fffff7d7f89c:	1400000e	b	0xfffff7d7f8d4
   0x0000fffff7d7f8a0:	9103c3e6	add	x6, sp, #0xf0
   0x0000fffff7d7f8a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f8a8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f8ac:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f8b0:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7d7f8b4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f8b8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f8bc:	d289e210	mov	x16, #0x4f10                	// #20240
   0x0000fffff7d7f8c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7f8c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f8c8:	d63f0200	blr	x16
   0x0000fffff7d7f8cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f8d0:	54002e60	b.eq	0xfffff7d7fe9c  // b.none
   0x0000fffff7d7f8d4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f8d8:	37d806a9	tbnz	w9, #27, 0xfffff7d7f9ac
   0x0000fffff7d7f8dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f8e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f8e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f8e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f8ec:	540001c1	b.ne	0xfffff7d7f924  // b.any
   0x0000fffff7d7f8f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f8f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f8fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f900:	54000121	b.ne	0xfffff7d7f924  // b.any
   0x0000fffff7d7f904:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f908:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7d7f90c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7f910:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f918:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7f91c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7f920:	14000030	b	0xfffff7d7f9e0
   0x0000fffff7d7f924:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f928:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f92c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f930:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f934:	54000120	b.eq	0xfffff7d7f958  // b.none
   0x0000fffff7d7f938:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7f93c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f944:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f948:	54000321	b.ne	0xfffff7d7f9ac  // b.any
   0x0000fffff7d7f94c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7f950:	9e620120	scvtf	d0, x9
   0x0000fffff7d7f954:	14000002	b	0xfffff7d7f95c
   0x0000fffff7d7f958:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7f95c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f960:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f968:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f96c:	54000120	b.eq	0xfffff7d7f990  // b.none
   0x0000fffff7d7f970:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7f974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7f978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f97c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7f980:	54000161	b.ne	0xfffff7d7f9ac  // b.any
   0x0000fffff7d7f984:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7f988:	9e620121	scvtf	d1, x9
   0x0000fffff7d7f98c:	14000002	b	0xfffff7d7f994
   0x0000fffff7d7f990:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7d7f994:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7f998:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7d7f99c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7f9a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7f9a4:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7f9a8:	17ffffde	b	0xfffff7d7f920
   0x0000fffff7d7f9ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7f9b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7f9b4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7f9b8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7f9bc:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7d7f9c0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7f9c4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7f9c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7f9cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7f9d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7f9d4:	d63f0200	blr	x16
   0x0000fffff7d7f9d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7f9dc:	54002640	b.eq	0xfffff7d7fea4  // b.none
   0x0000fffff7d7f9e0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7f9e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7f9e8:	54000380	b.eq	0xfffff7d7fa58  // b.none
   0x0000fffff7d7f9ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7f9f0:	37d8034d	tbnz	w13, #27, 0xfffff7d7fa58
   0x0000fffff7d7f9f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7f9f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7f9fc:	36d80211	tbz	w17, #27, 0xfffff7d7fa3c
   0x0000fffff7d7fa00:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7fa04:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7fa08:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7fa0c:	54000261	b.ne	0xfffff7d7fa58  // b.any
   0x0000fffff7d7fa10:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7fa14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7fa18:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7fa1c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7fa20:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7fa24:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7fa28:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7fa2c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7fa30:	54000149	b.ls	0xfffff7d7fa58  // b.plast
   0x0000fffff7d7fa34:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7fa38:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7fa3c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7fa40:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7fa44:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7fa48:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7fa4c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7fa50:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7fa54:	1400000e	b	0xfffff7d7fa8c
   0x0000fffff7d7fa58:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7fa5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fa60:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fa64:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fa68:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7d7fa6c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fa70:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fa74:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7d7fa78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7fa7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fa80:	d63f0200	blr	x16
   0x0000fffff7d7fa84:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7fa88:	54002120	b.eq	0xfffff7d7feac  // b.none
   0x0000fffff7d7fa8c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7fa90:	37d800e9	tbnz	w9, #27, 0xfffff7d7faac
   0x0000fffff7d7fa94:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7fa98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fa9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7faa0:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7d7faa4:	b900726a	str	w10, [x19, #112]
   0x0000fffff7d7faa8:	1400000e	b	0xfffff7d7fae0
   0x0000fffff7d7faac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7fab0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fab4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fab8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fabc:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7d7fac0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fac4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fac8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7d7facc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7fad0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fad4:	d63f0200	blr	x16
   0x0000fffff7d7fad8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7fadc:	54001ec0	b.eq	0xfffff7d7feb4  // b.none
   0x0000fffff7d7fae0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fae4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7d7fae8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7d7faec:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7faf0:	54000501	b.ne	0xfffff7d7fb90  // b.any
   0x0000fffff7d7faf4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d7faf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fafc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fb00:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fb04:	54000461	b.ne	0xfffff7d7fb90  // b.any
   0x0000fffff7d7fb08:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7d7fb0c:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7d7fb10:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7d7fb14:	eb09015f	cmp	x10, x9
   0x0000fffff7d7fb18:	540003c2	b.cs	0xfffff7d7fb90  // b.hs, b.nlast
   0x0000fffff7d7fb1c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7d7fb20:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7d7fb24:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7fb28:	37d8034d	tbnz	w13, #27, 0xfffff7d7fb90
   0x0000fffff7d7fb2c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7fb30:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7fb34:	36d80211	tbz	w17, #27, 0xfffff7d7fb74
   0x0000fffff7d7fb38:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7fb3c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7fb40:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7fb44:	54000261	b.ne	0xfffff7d7fb90  // b.any
   0x0000fffff7d7fb48:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7fb4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7fb50:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7fb54:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7fb58:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7fb5c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7fb60:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7fb64:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7fb68:	54000149	b.ls	0xfffff7d7fb90  // b.plast
   0x0000fffff7d7fb6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7fb70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7fb74:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7fb78:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7fb7c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7fb80:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7fb84:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7fb88:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7fb8c:	1400000e	b	0xfffff7d7fbc4
   0x0000fffff7d7fb90:	910443e6	add	x6, sp, #0x110
   0x0000fffff7d7fb94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fb98:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fb9c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fba0:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7d7fba4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fba8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fbac:	d289e210	mov	x16, #0x4f10                	// #20240
   0x0000fffff7d7fbb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7fbb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fbb8:	d63f0200	blr	x16
   0x0000fffff7d7fbbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7fbc0:	540017e0	b.eq	0xfffff7d7febc  // b.none
   0x0000fffff7d7fbc4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7fbc8:	37d806a9	tbnz	w9, #27, 0xfffff7d7fc9c
   0x0000fffff7d7fbcc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7fbd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fbd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fbd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fbdc:	540001c1	b.ne	0xfffff7d7fc14  // b.any
   0x0000fffff7d7fbe0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fbe4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fbe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fbec:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fbf0:	54000121	b.ne	0xfffff7d7fc14  // b.any
   0x0000fffff7d7fbf4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7fbf8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7fbfc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7fc00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fc04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fc08:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7fc0c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7fc10:	14000030	b	0xfffff7d7fcd0
   0x0000fffff7d7fc14:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7fc18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fc1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fc20:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fc24:	54000120	b.eq	0xfffff7d7fc48  // b.none
   0x0000fffff7d7fc28:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7fc2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fc30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fc34:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fc38:	54000321	b.ne	0xfffff7d7fc9c  // b.any
   0x0000fffff7d7fc3c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7fc40:	9e620120	scvtf	d0, x9
   0x0000fffff7d7fc44:	14000002	b	0xfffff7d7fc4c
   0x0000fffff7d7fc48:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7d7fc4c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fc50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fc54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fc58:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fc5c:	54000120	b.eq	0xfffff7d7fc80  // b.none
   0x0000fffff7d7fc60:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7fc64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fc68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fc6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7fc70:	54000161	b.ne	0xfffff7d7fc9c  // b.any
   0x0000fffff7d7fc74:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7fc78:	9e620121	scvtf	d1, x9
   0x0000fffff7d7fc7c:	14000002	b	0xfffff7d7fc84
   0x0000fffff7d7fc80:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7fc84:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7fc88:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7d7fc8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7fc90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fc94:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7fc98:	17ffffde	b	0xfffff7d7fc10
   0x0000fffff7d7fc9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7fca0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fca4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fca8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fcac:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7d7fcb0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fcb4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fcb8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7d7fcbc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7fcc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fcc4:	d63f0200	blr	x16
   0x0000fffff7d7fcc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7fccc:	54000fc0	b.eq	0xfffff7d7fec4  // b.none
   0x0000fffff7d7fcd0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7fcd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7fcd8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7fcdc:	aa1503e2	mov	x2, x21
   0x0000fffff7d7fce0:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7d7fce4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7fce8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7fcec:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7d7fcf0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7fcf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7fcf8:	d63f0200	blr	x16
   0x0000fffff7d7fcfc:	9104c3ff	add	sp, sp, #0x130
   0x0000fffff7d7fd00:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7fd04:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7fd08:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7fd0c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d7fd10:	d65f03c0	ret
   0x0000fffff7d7fd14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7fd18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7fd1c:	b900028a	str	w10, [x20]
   0x0000fffff7d7fd20:	f9000689	str	x9, [x20, #8]
   0x0000fffff7d7fd24:	9104c3ff	add	sp, sp, #0x130
   0x0000fffff7d7fd28:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7fd2c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7fd30:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7fd34:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7d7fd38:	d65f03c0	ret
   0x0000fffff7d7fd3c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d7fd40:	17fffff5	b	0xfffff7d7fd14
   0x0000fffff7d7fd44:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7d7fd48:	17fffff3	b	0xfffff7d7fd14
   0x0000fffff7d7fd4c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7d7fd50:	17fffff1	b	0xfffff7d7fd14
   0x0000fffff7d7fd54:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7d7fd58:	17ffffef	b	0xfffff7d7fd14
   0x0000fffff7d7fd5c:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7d7fd60:	17ffffed	b	0xfffff7d7fd14
   0x0000fffff7d7fd64:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7d7fd68:	17ffffeb	b	0xfffff7d7fd14
   0x0000fffff7d7fd6c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7d7fd70:	17ffffe9	b	0xfffff7d7fd14
   0x0000fffff7d7fd74:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7d7fd78:	17ffffe7	b	0xfffff7d7fd14
   0x0000fffff7d7fd7c:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7d7fd80:	17ffffe5	b	0xfffff7d7fd14
   0x0000fffff7d7fd84:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7d7fd88:	17ffffe3	b	0xfffff7d7fd14
   0x0000fffff7d7fd8c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7d7fd90:	17ffffe1	b	0xfffff7d7fd14
   0x0000fffff7d7fd94:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7d7fd98:	17ffffdf	b	0xfffff7d7fd14
   0x0000fffff7d7fd9c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7d7fda0:	17ffffdd	b	0xfffff7d7fd14
   0x0000fffff7d7fda4:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7d7fda8:	17ffffdb	b	0xfffff7d7fd14
   0x0000fffff7d7fdac:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7d7fdb0:	17ffffd9	b	0xfffff7d7fd14
   0x0000fffff7d7fdb4:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7d7fdb8:	17ffffd7	b	0xfffff7d7fd14
   0x0000fffff7d7fdbc:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7d7fdc0:	17ffffd5	b	0xfffff7d7fd14
   0x0000fffff7d7fdc4:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7d7fdc8:	17ffffd3	b	0xfffff7d7fd14
   0x0000fffff7d7fdcc:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7d7fdd0:	17ffffd1	b	0xfffff7d7fd14
   0x0000fffff7d7fdd4:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7d7fdd8:	17ffffcf	b	0xfffff7d7fd14
   0x0000fffff7d7fddc:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7d7fde0:	17ffffcd	b	0xfffff7d7fd14
   0x0000fffff7d7fde4:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7d7fde8:	17ffffcb	b	0xfffff7d7fd14
   0x0000fffff7d7fdec:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7d7fdf0:	17ffffc9	b	0xfffff7d7fd14
   0x0000fffff7d7fdf4:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7d7fdf8:	17ffffc7	b	0xfffff7d7fd14
   0x0000fffff7d7fdfc:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7d7fe00:	17ffffc5	b	0xfffff7d7fd14
   0x0000fffff7d7fe04:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7d7fe08:	17ffffc3	b	0xfffff7d7fd14
   0x0000fffff7d7fe0c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7d7fe10:	17ffffc1	b	0xfffff7d7fd14
   0x0000fffff7d7fe14:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7d7fe18:	17ffffbf	b	0xfffff7d7fd14
   0x0000fffff7d7fe1c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7d7fe20:	17ffffbd	b	0xfffff7d7fd14
   0x0000fffff7d7fe24:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7d7fe28:	17ffffbb	b	0xfffff7d7fd14
   0x0000fffff7d7fe2c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7d7fe30:	17ffffb9	b	0xfffff7d7fd14
   0x0000fffff7d7fe34:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7d7fe38:	17ffffb7	b	0xfffff7d7fd14
   0x0000fffff7d7fe3c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7d7fe40:	17ffffb5	b	0xfffff7d7fd14
   0x0000fffff7d7fe44:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7d7fe48:	17ffffb3	b	0xfffff7d7fd14
   0x0000fffff7d7fe4c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7d7fe50:	17ffffb1	b	0xfffff7d7fd14
   0x0000fffff7d7fe54:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7d7fe58:	17ffffaf	b	0xfffff7d7fd14
   0x0000fffff7d7fe5c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7d7fe60:	17ffffad	b	0xfffff7d7fd14
   0x0000fffff7d7fe64:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7d7fe68:	17ffffab	b	0xfffff7d7fd14
   0x0000fffff7d7fe6c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7d7fe70:	17ffffa9	b	0xfffff7d7fd14
   0x0000fffff7d7fe74:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7d7fe78:	17ffffa7	b	0xfffff7d7fd14
   0x0000fffff7d7fe7c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7d7fe80:	17ffffa5	b	0xfffff7d7fd14
   0x0000fffff7d7fe84:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7d7fe88:	17ffffa3	b	0xfffff7d7fd14
   0x0000fffff7d7fe8c:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7d7fe90:	17ffffa1	b	0xfffff7d7fd14
   0x0000fffff7d7fe94:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7d7fe98:	17ffff9f	b	0xfffff7d7fd14
   0x0000fffff7d7fe9c:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7d7fea0:	17ffff9d	b	0xfffff7d7fd14
   0x0000fffff7d7fea4:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7d7fea8:	17ffff9b	b	0xfffff7d7fd14
   0x0000fffff7d7feac:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7d7feb0:	17ffff99	b	0xfffff7d7fd14
   0x0000fffff7d7feb4:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7d7feb8:	17ffff97	b	0xfffff7d7fd14
   0x0000fffff7d7febc:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7d7fec0:	17ffff95	b	0xfffff7d7fd14
   0x0000fffff7d7fec4:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7d7fec8:	17ffff93	b	0xfffff7d7fd14
   0x0000fffff7d7fecc:	00000000	udf	#0
   0x0000fffff7d7fed0:	00000000	udf	#0
   0x0000fffff7d7fed4:	00000000	udf	#0
   0x0000fffff7d7fed8:	00000000	udf	#0
   0x0000fffff7d7fedc:	00000000	udf	#0
   0x0000fffff7d7fee0:	00000000	udf	#0
   0x0000fffff7d7fee4:	00000000	udf	#0
   0x0000fffff7d7fee8:	00000000	udf	#0
   0x0000fffff7d7feec:	00000000	udf	#0
   0x0000fffff7d7fef0:	00000000	udf	#0
   0x0000fffff7d7fef4:	00000000	udf	#0
   0x0000fffff7d7fef8:	00000000	udf	#0
   0x0000fffff7d7fefc:	00000000	udf	#0
   0x0000fffff7d7ff00:	00000000	udf	#0
   0x0000fffff7d7ff04:	00000000	udf	#0
   0x0000fffff7d7ff08:	00000000	udf	#0
   0x0000fffff7d7ff0c:	00000000	udf	#0
   0x0000fffff7d7ff10:	00000000	udf	#0
   0x0000fffff7d7ff14:	00000000	udf	#0
   0x0000fffff7d7ff18:	00000000	udf	#0
   0x0000fffff7d7ff1c:	00000000	udf	#0
   0x0000fffff7d7ff20:	00000000	udf	#0
   0x0000fffff7d7ff24:	00000000	udf	#0
   0x0000fffff7d7ff28:	00000000	udf	#0
   0x0000fffff7d7ff2c:	00000000	udf	#0
   0x0000fffff7d7ff30:	00000000	udf	#0
   0x0000fffff7d7ff34:	00000000	udf	#0
   0x0000fffff7d7ff38:	00000000	udf	#0
   0x0000fffff7d7ff3c:	00000000	udf	#0
   0x0000fffff7d7ff40:	00000000	udf	#0
   0x0000fffff7d7ff44:	00000000	udf	#0
   0x0000fffff7d7ff48:	00000000	udf	#0
   0x0000fffff7d7ff4c:	00000000	udf	#0
   0x0000fffff7d7ff50:	00000000	udf	#0
   0x0000fffff7d7ff54:	00000000	udf	#0
   0x0000fffff7d7ff58:	00000000	udf	#0
   0x0000fffff7d7ff5c:	00000000	udf	#0
   0x0000fffff7d7ff60:	00000000	udf	#0
   0x0000fffff7d7ff64:	00000000	udf	#0
   0x0000fffff7d7ff68:	00000000	udf	#0
   0x0000fffff7d7ff6c:	00000000	udf	#0
   0x0000fffff7d7ff70:	00000000	udf	#0
   0x0000fffff7d7ff74:	00000000	udf	#0
   0x0000fffff7d7ff78:	00000000	udf	#0
   0x0000fffff7d7ff7c:	00000000	udf	#0
   0x0000fffff7d7ff80:	00000000	udf	#0
   0x0000fffff7d7ff84:	00000000	udf	#0
   0x0000fffff7d7ff88:	00000000	udf	#0
   0x0000fffff7d7ff8c:	00000000	udf	#0
   0x0000fffff7d7ff90:	00000000	udf	#0
   0x0000fffff7d7ff94:	00000000	udf	#0
   0x0000fffff7d7ff98:	00000000	udf	#0
   0x0000fffff7d7ff9c:	00000000	udf	#0
   0x0000fffff7d7ffa0:	00000000	udf	#0
   0x0000fffff7d7ffa4:	00000000	udf	#0
   0x0000fffff7d7ffa8:	00000000	udf	#0
   0x0000fffff7d7ffac:	00000000	udf	#0
   0x0000fffff7d7ffb0:	00000000	udf	#0
   0x0000fffff7d7ffb4:	00000000	udf	#0
   0x0000fffff7d7ffb8:	00000000	udf	#0
   0x0000fffff7d7ffbc:	00000000	udf	#0
   0x0000fffff7d7ffc0:	00000000	udf	#0
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
