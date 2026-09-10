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
   0x0000fffff7f9e058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9e05c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9e060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7f9e064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9e068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9e06c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7f9e070:	36d801d1	tbz	w17, #27, 0xfffff7f9e0a8
   0x0000fffff7f9e074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e080:	54000281	b.ne	0xfffff7f9e0d0  // b.any
   0x0000fffff7f9e084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7f9e088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e0a4:	54000169	b.ls	0xfffff7f9e0d0  // b.plast
   0x0000fffff7f9e0a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e0ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e0b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e0b4:	36d80091	tbz	w17, #27, 0xfffff7f9e0c4
   0x0000fffff7f9e0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e0bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e0c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e0c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7f9e0c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7f9e0cc:	1400000e	b	0xfffff7f9e104
   0x0000fffff7f9e0d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e0d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e0d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e0dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e0e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9e0e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e0e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e0ec:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f9e0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e0f8:	d63f0200	blr	x16
   0x0000fffff7f9e0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e100:	5400d940	b.eq	0xfffff7f9fc28  // b.none
   0x0000fffff7f9e104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f9e108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f9e10c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7f9e110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7f9e114:	36d80211	tbz	w17, #27, 0xfffff7f9e154
   0x0000fffff7f9e118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e120:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e124:	540001e1	b.ne	0xfffff7f9e160  // b.any
   0x0000fffff7f9e128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7f9e12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e144:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e148:	540000c9	b.ls	0xfffff7f9e160  // b.plast
   0x0000fffff7f9e14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7f9e158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7f9e15c:	1400000e	b	0xfffff7f9e194
   0x0000fffff7f9e160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e168:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e16c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f9e174:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e178:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e17c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7f9e180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e188:	d63f0200	blr	x16
   0x0000fffff7f9e18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e190:	5400d500	b.eq	0xfffff7f9fc30  // b.none
   0x0000fffff7f9e194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e19c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e1a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e1a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f9e1a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e1ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e1b0:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f9e1b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e1b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e1bc:	d63f0200	blr	x16
   0x0000fffff7f9e1c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e1c4:	5400d3a0	b.eq	0xfffff7f9fc38  // b.none
   0x0000fffff7f9e1c8:	14000001	b	0xfffff7f9e1cc
   0x0000fffff7f9e1cc:	14000001	b	0xfffff7f9e1d0
   0x0000fffff7f9e1d0:	14000001	b	0xfffff7f9e1d4
   0x0000fffff7f9e1d4:	14000001	b	0xfffff7f9e1d8
   0x0000fffff7f9e1d8:	14000001	b	0xfffff7f9e1dc
   0x0000fffff7f9e1dc:	14000001	b	0xfffff7f9e1e0
   0x0000fffff7f9e1e0:	14000001	b	0xfffff7f9e1e4
   0x0000fffff7f9e1e4:	14000001	b	0xfffff7f9e1e8
   0x0000fffff7f9e1e8:	14000001	b	0xfffff7f9e1ec
   0x0000fffff7f9e1ec:	14000001	b	0xfffff7f9e1f0
   0x0000fffff7f9e1f0:	14000001	b	0xfffff7f9e1f4
   0x0000fffff7f9e1f4:	14000001	b	0xfffff7f9e1f8
   0x0000fffff7f9e1f8:	14000001	b	0xfffff7f9e1fc
   0x0000fffff7f9e1fc:	14000001	b	0xfffff7f9e200
   0x0000fffff7f9e200:	14000001	b	0xfffff7f9e204
   0x0000fffff7f9e204:	14000001	b	0xfffff7f9e208
   0x0000fffff7f9e208:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f9e20c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f9e210:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f9e214:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7f9e218:	36d80211	tbz	w17, #27, 0xfffff7f9e258
   0x0000fffff7f9e21c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e220:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e224:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e228:	540001e1	b.ne	0xfffff7f9e264  // b.any
   0x0000fffff7f9e22c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7f9e230:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e234:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e238:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e23c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e240:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e244:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e248:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e24c:	540000c9	b.ls	0xfffff7f9e264  // b.plast
   0x0000fffff7f9e250:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e254:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e258:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7f9e25c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7f9e260:	1400000e	b	0xfffff7f9e298
   0x0000fffff7f9e264:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e268:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e26c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e270:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e274:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f9e278:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e27c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e280:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7f9e284:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e288:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e28c:	d63f0200	blr	x16
   0x0000fffff7f9e290:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e294:	5400cd60	b.eq	0xfffff7f9fc40  // b.none
   0x0000fffff7f9e298:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e29c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e2a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e2a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e2a8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f9e2ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e2b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e2b4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f9e2b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e2bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e2c0:	d63f0200	blr	x16
   0x0000fffff7f9e2c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e2c8:	5400cc00	b.eq	0xfffff7f9fc48  // b.none
   0x0000fffff7f9e2cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e2d0:	37d806a9	tbnz	w9, #27, 0xfffff7f9e3a4
   0x0000fffff7f9e2d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e2d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e2dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e2e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e2e4:	540001c1	b.ne	0xfffff7f9e31c  // b.any
   0x0000fffff7f9e2e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e2ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e2f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e2f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e2f8:	54000121	b.ne	0xfffff7f9e31c  // b.any
   0x0000fffff7f9e2fc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9e300:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f9e304:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e308:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e30c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e310:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9e314:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9e318:	14000030	b	0xfffff7f9e3d8
   0x0000fffff7f9e31c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e320:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e324:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e328:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e32c:	54000120	b.eq	0xfffff7f9e350  // b.none
   0x0000fffff7f9e330:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e334:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e338:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e33c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e340:	54000321	b.ne	0xfffff7f9e3a4  // b.any
   0x0000fffff7f9e344:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9e348:	9e620120	scvtf	d0, x9
   0x0000fffff7f9e34c:	14000002	b	0xfffff7f9e354
   0x0000fffff7f9e350:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9e354:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e358:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e35c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e360:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e364:	54000120	b.eq	0xfffff7f9e388  // b.none
   0x0000fffff7f9e368:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e36c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e374:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e378:	54000161	b.ne	0xfffff7f9e3a4  // b.any
   0x0000fffff7f9e37c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9e380:	9e620121	scvtf	d1, x9
   0x0000fffff7f9e384:	14000002	b	0xfffff7f9e38c
   0x0000fffff7f9e388:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7f9e38c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9e390:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9e394:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e39c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9e3a0:	17ffffde	b	0xfffff7f9e318
   0x0000fffff7f9e3a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e3a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e3ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e3b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e3b4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f9e3b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e3bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e3c0:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f9e3c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e3c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e3cc:	d63f0200	blr	x16
   0x0000fffff7f9e3d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e3d4:	5400c3e0	b.eq	0xfffff7f9fc50  // b.none
   0x0000fffff7f9e3d8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9e3dc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9e3e0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7f9e3e4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9e3e8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9e3ec:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9e3f0:	36d801d1	tbz	w17, #27, 0xfffff7f9e428
   0x0000fffff7f9e3f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e3f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e3fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e400:	54000281	b.ne	0xfffff7f9e450  // b.any
   0x0000fffff7f9e404:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9e408:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e40c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e410:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e414:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e418:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e41c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e420:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e424:	54000169	b.ls	0xfffff7f9e450  // b.plast
   0x0000fffff7f9e428:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e42c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e430:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e434:	36d80091	tbz	w17, #27, 0xfffff7f9e444
   0x0000fffff7f9e438:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e43c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e440:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e444:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9e448:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9e44c:	1400000e	b	0xfffff7f9e484
   0x0000fffff7f9e450:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e454:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e458:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e45c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e460:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f9e464:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e468:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e46c:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f9e470:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e474:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e478:	d63f0200	blr	x16
   0x0000fffff7f9e47c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e480:	5400bec0	b.eq	0xfffff7f9fc58  // b.none
   0x0000fffff7f9e484:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9e488:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9e48c:	540003a0	b.eq	0xfffff7f9e500  // b.none
   0x0000fffff7f9e490:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f9e494:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f9e498:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9e49c:	36d801d1	tbz	w17, #27, 0xfffff7f9e4d4
   0x0000fffff7f9e4a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e4a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e4a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e4ac:	540002a1	b.ne	0xfffff7f9e500  // b.any
   0x0000fffff7f9e4b0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9e4b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e4b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e4bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e4c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e4c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e4c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e4cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e4d0:	54000189	b.ls	0xfffff7f9e500  // b.plast
   0x0000fffff7f9e4d4:	36d8008d	tbz	w13, #27, 0xfffff7f9e4e4
   0x0000fffff7f9e4d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e4dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e4e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e4e4:	36d80091	tbz	w17, #27, 0xfffff7f9e4f4
   0x0000fffff7f9e4e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e4ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e4f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e4f4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9e4f8:	b900016d	str	w13, [x11]
   0x0000fffff7f9e4fc:	1400000e	b	0xfffff7f9e534
   0x0000fffff7f9e500:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e504:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e508:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e50c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e510:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f9e514:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e518:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e51c:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f9e520:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e524:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e528:	d63f0200	blr	x16
   0x0000fffff7f9e52c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e530:	5400b980	b.eq	0xfffff7f9fc60  // b.none
   0x0000fffff7f9e534:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9e538:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9e53c:	540004a0	b.eq	0xfffff7f9e5d0  // b.none
   0x0000fffff7f9e540:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9e544:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9e548:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9e54c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9e550:	54000400	b.eq	0xfffff7f9e5d0  // b.none
   0x0000fffff7f9e554:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9e558:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9e55c:	36d801d1	tbz	w17, #27, 0xfffff7f9e594
   0x0000fffff7f9e560:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e564:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e568:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e56c:	54000321	b.ne	0xfffff7f9e5d0  // b.any
   0x0000fffff7f9e570:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9e574:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e578:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e57c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e580:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e584:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e588:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e58c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e590:	54000209	b.ls	0xfffff7f9e5d0  // b.plast
   0x0000fffff7f9e594:	36d8008d	tbz	w13, #27, 0xfffff7f9e5a4
   0x0000fffff7f9e598:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e59c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e5a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e5a4:	36d80091	tbz	w17, #27, 0xfffff7f9e5b4
   0x0000fffff7f9e5a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e5ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e5b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e5b4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f9e5b8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9e5bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9e5c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9e5c4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9e5c8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9e5cc:	1400000e	b	0xfffff7f9e604
   0x0000fffff7f9e5d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e5d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e5d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e5dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e5e0:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9e5e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e5e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e5ec:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f9e5f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e5f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e5f8:	d63f0200	blr	x16
   0x0000fffff7f9e5fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e600:	5400b340	b.eq	0xfffff7f9fc68  // b.none
   0x0000fffff7f9e604:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e608:	37d806a9	tbnz	w9, #27, 0xfffff7f9e6dc
   0x0000fffff7f9e60c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e610:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e618:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e61c:	540001c1	b.ne	0xfffff7f9e654  // b.any
   0x0000fffff7f9e620:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e624:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e62c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e630:	54000121	b.ne	0xfffff7f9e654  // b.any
   0x0000fffff7f9e634:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9e638:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f9e63c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e640:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e648:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9e64c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9e650:	14000030	b	0xfffff7f9e710
   0x0000fffff7f9e654:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e658:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e65c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e660:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e664:	54000120	b.eq	0xfffff7f9e688  // b.none
   0x0000fffff7f9e668:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e66c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e670:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e674:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e678:	54000321	b.ne	0xfffff7f9e6dc  // b.any
   0x0000fffff7f9e67c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9e680:	9e620120	scvtf	d0, x9
   0x0000fffff7f9e684:	14000002	b	0xfffff7f9e68c
   0x0000fffff7f9e688:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9e68c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e690:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e698:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e69c:	54000120	b.eq	0xfffff7f9e6c0  // b.none
   0x0000fffff7f9e6a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e6a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e6a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e6ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e6b0:	54000161	b.ne	0xfffff7f9e6dc  // b.any
   0x0000fffff7f9e6b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9e6b8:	9e620121	scvtf	d1, x9
   0x0000fffff7f9e6bc:	14000002	b	0xfffff7f9e6c4
   0x0000fffff7f9e6c0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7f9e6c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9e6c8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9e6cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e6d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e6d4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9e6d8:	17ffffde	b	0xfffff7f9e650
   0x0000fffff7f9e6dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e6e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e6e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e6e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e6ec:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f9e6f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e6f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e6f8:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f9e6fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e700:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e704:	d63f0200	blr	x16
   0x0000fffff7f9e708:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e70c:	5400ab20	b.eq	0xfffff7f9fc70  // b.none
   0x0000fffff7f9e710:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9e714:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9e718:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7f9e71c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9e720:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9e724:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9e728:	36d801d1	tbz	w17, #27, 0xfffff7f9e760
   0x0000fffff7f9e72c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e730:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e734:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e738:	54000281	b.ne	0xfffff7f9e788  // b.any
   0x0000fffff7f9e73c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9e740:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e744:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e748:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e74c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e750:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e754:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e758:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e75c:	54000169	b.ls	0xfffff7f9e788  // b.plast
   0x0000fffff7f9e760:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e764:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e768:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e76c:	36d80091	tbz	w17, #27, 0xfffff7f9e77c
   0x0000fffff7f9e770:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e774:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e778:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e77c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9e780:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9e784:	1400000e	b	0xfffff7f9e7bc
   0x0000fffff7f9e788:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9e78c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e790:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e794:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e798:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f9e79c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e7a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e7a4:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f9e7a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e7ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e7b0:	d63f0200	blr	x16
   0x0000fffff7f9e7b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e7b8:	5400a600	b.eq	0xfffff7f9fc78  // b.none
   0x0000fffff7f9e7bc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9e7c0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9e7c4:	540003a0	b.eq	0xfffff7f9e838  // b.none
   0x0000fffff7f9e7c8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f9e7cc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f9e7d0:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9e7d4:	36d801d1	tbz	w17, #27, 0xfffff7f9e80c
   0x0000fffff7f9e7d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e7dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e7e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e7e4:	540002a1	b.ne	0xfffff7f9e838  // b.any
   0x0000fffff7f9e7e8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9e7ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e7f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e7f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e7f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e7fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e800:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e804:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e808:	54000189	b.ls	0xfffff7f9e838  // b.plast
   0x0000fffff7f9e80c:	36d8008d	tbz	w13, #27, 0xfffff7f9e81c
   0x0000fffff7f9e810:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e814:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e818:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e81c:	36d80091	tbz	w17, #27, 0xfffff7f9e82c
   0x0000fffff7f9e820:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e824:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e828:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e82c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9e830:	b900016d	str	w13, [x11]
   0x0000fffff7f9e834:	1400000e	b	0xfffff7f9e86c
   0x0000fffff7f9e838:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9e83c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e840:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e844:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e848:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f9e84c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e850:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e854:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f9e858:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9e85c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e860:	d63f0200	blr	x16
   0x0000fffff7f9e864:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e868:	5400a0c0	b.eq	0xfffff7f9fc80  // b.none
   0x0000fffff7f9e86c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9e870:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9e874:	540004a0	b.eq	0xfffff7f9e908  // b.none
   0x0000fffff7f9e878:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9e87c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9e880:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9e884:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9e888:	54000400	b.eq	0xfffff7f9e908  // b.none
   0x0000fffff7f9e88c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9e890:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9e894:	36d801d1	tbz	w17, #27, 0xfffff7f9e8cc
   0x0000fffff7f9e898:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9e89c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9e8a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9e8a4:	54000321	b.ne	0xfffff7f9e908  // b.any
   0x0000fffff7f9e8a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9e8ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e8b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9e8b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9e8b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9e8bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9e8c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9e8c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9e8c8:	54000209	b.ls	0xfffff7f9e908  // b.plast
   0x0000fffff7f9e8cc:	36d8008d	tbz	w13, #27, 0xfffff7f9e8dc
   0x0000fffff7f9e8d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9e8d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9e8d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9e8dc:	36d80091	tbz	w17, #27, 0xfffff7f9e8ec
   0x0000fffff7f9e8e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9e8e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9e8e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9e8ec:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f9e8f0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9e8f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9e8f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9e8fc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9e900:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9e904:	1400000e	b	0xfffff7f9e93c
   0x0000fffff7f9e908:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9e90c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9e910:	aa1303e1	mov	x1, x19
   0x0000fffff7f9e914:	aa1503e2	mov	x2, x21
   0x0000fffff7f9e918:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9e91c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9e920:	aa1603e5	mov	x5, x22
   0x0000fffff7f9e924:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f9e928:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9e92c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9e930:	d63f0200	blr	x16
   0x0000fffff7f9e934:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9e938:	54009a80	b.eq	0xfffff7f9fc88  // b.none
   0x0000fffff7f9e93c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e940:	37d806a9	tbnz	w9, #27, 0xfffff7f9ea14
   0x0000fffff7f9e944:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e94c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e950:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e954:	540001c1	b.ne	0xfffff7f9e98c  // b.any
   0x0000fffff7f9e958:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e95c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e964:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e968:	54000121	b.ne	0xfffff7f9e98c  // b.any
   0x0000fffff7f9e96c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9e970:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f9e974:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9e978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e97c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e980:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9e984:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9e988:	14000030	b	0xfffff7f9ea48
   0x0000fffff7f9e98c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e990:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e998:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e99c:	54000120	b.eq	0xfffff7f9e9c0  // b.none
   0x0000fffff7f9e9a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9e9a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e9a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e9ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e9b0:	54000321	b.ne	0xfffff7f9ea14  // b.any
   0x0000fffff7f9e9b4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9e9b8:	9e620120	scvtf	d0, x9
   0x0000fffff7f9e9bc:	14000002	b	0xfffff7f9e9c4
   0x0000fffff7f9e9c0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9e9c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e9c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9e9cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e9d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e9d4:	54000120	b.eq	0xfffff7f9e9f8  // b.none
   0x0000fffff7f9e9d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9e9dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9e9e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9e9e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9e9e8:	54000161	b.ne	0xfffff7f9ea14  // b.any
   0x0000fffff7f9e9ec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9e9f0:	9e620121	scvtf	d1, x9
   0x0000fffff7f9e9f4:	14000002	b	0xfffff7f9e9fc
   0x0000fffff7f9e9f8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7f9e9fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9ea00:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9ea04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ea08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ea0c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9ea10:	17ffffde	b	0xfffff7f9e988
   0x0000fffff7f9ea14:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ea18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ea1c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ea20:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ea24:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f9ea28:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ea2c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ea30:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f9ea34:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ea38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ea3c:	d63f0200	blr	x16
   0x0000fffff7f9ea40:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ea44:	54009260	b.eq	0xfffff7f9fc90  // b.none
   0x0000fffff7f9ea48:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9ea4c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9ea50:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7f9ea54:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9ea58:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9ea5c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9ea60:	36d801d1	tbz	w17, #27, 0xfffff7f9ea98
   0x0000fffff7f9ea64:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9ea68:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9ea6c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9ea70:	54000281	b.ne	0xfffff7f9eac0  // b.any
   0x0000fffff7f9ea74:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9ea78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ea7c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9ea80:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9ea84:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9ea88:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9ea8c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9ea90:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9ea94:	54000169	b.ls	0xfffff7f9eac0  // b.plast
   0x0000fffff7f9ea98:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9ea9c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9eaa0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9eaa4:	36d80091	tbz	w17, #27, 0xfffff7f9eab4
   0x0000fffff7f9eaa8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9eaac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9eab0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9eab4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9eab8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9eabc:	1400000e	b	0xfffff7f9eaf4
   0x0000fffff7f9eac0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9eac4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eac8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eacc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ead0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f9ead4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ead8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eadc:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f9eae0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9eae4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9eae8:	d63f0200	blr	x16
   0x0000fffff7f9eaec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eaf0:	54008d40	b.eq	0xfffff7f9fc98  // b.none
   0x0000fffff7f9eaf4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9eaf8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9eafc:	540003a0	b.eq	0xfffff7f9eb70  // b.none
   0x0000fffff7f9eb00:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f9eb04:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f9eb08:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9eb0c:	36d801d1	tbz	w17, #27, 0xfffff7f9eb44
   0x0000fffff7f9eb10:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9eb14:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9eb18:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9eb1c:	540002a1	b.ne	0xfffff7f9eb70  // b.any
   0x0000fffff7f9eb20:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9eb24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9eb28:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9eb2c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9eb30:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9eb34:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9eb38:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9eb3c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9eb40:	54000189	b.ls	0xfffff7f9eb70  // b.plast
   0x0000fffff7f9eb44:	36d8008d	tbz	w13, #27, 0xfffff7f9eb54
   0x0000fffff7f9eb48:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9eb4c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9eb50:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9eb54:	36d80091	tbz	w17, #27, 0xfffff7f9eb64
   0x0000fffff7f9eb58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9eb5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9eb60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9eb64:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9eb68:	b900016d	str	w13, [x11]
   0x0000fffff7f9eb6c:	1400000e	b	0xfffff7f9eba4
   0x0000fffff7f9eb70:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9eb74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eb78:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eb7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eb80:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f9eb84:	aa1403e4	mov	x4, x20
   0x0000fffff7f9eb88:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eb8c:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f9eb90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9eb94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9eb98:	d63f0200	blr	x16
   0x0000fffff7f9eb9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eba0:	54008800	b.eq	0xfffff7f9fca0  // b.none
   0x0000fffff7f9eba4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9eba8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9ebac:	540004a0	b.eq	0xfffff7f9ec40  // b.none
   0x0000fffff7f9ebb0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9ebb4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9ebb8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9ebbc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9ebc0:	54000400	b.eq	0xfffff7f9ec40  // b.none
   0x0000fffff7f9ebc4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9ebc8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9ebcc:	36d801d1	tbz	w17, #27, 0xfffff7f9ec04
   0x0000fffff7f9ebd0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9ebd4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9ebd8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9ebdc:	54000321	b.ne	0xfffff7f9ec40  // b.any
   0x0000fffff7f9ebe0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9ebe4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ebe8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9ebec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9ebf0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9ebf4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9ebf8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9ebfc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9ec00:	54000209	b.ls	0xfffff7f9ec40  // b.plast
   0x0000fffff7f9ec04:	36d8008d	tbz	w13, #27, 0xfffff7f9ec14
   0x0000fffff7f9ec08:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9ec0c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9ec10:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9ec14:	36d80091	tbz	w17, #27, 0xfffff7f9ec24
   0x0000fffff7f9ec18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ec1c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9ec20:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9ec24:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f9ec28:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9ec2c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9ec30:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9ec34:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9ec38:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9ec3c:	1400000e	b	0xfffff7f9ec74
   0x0000fffff7f9ec40:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ec44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ec48:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ec4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ec50:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9ec54:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ec58:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ec5c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f9ec60:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ec64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ec68:	d63f0200	blr	x16
   0x0000fffff7f9ec6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ec70:	540081c0	b.eq	0xfffff7f9fca8  // b.none
   0x0000fffff7f9ec74:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ec78:	37d806a9	tbnz	w9, #27, 0xfffff7f9ed4c
   0x0000fffff7f9ec7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ec80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ec84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ec88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ec8c:	540001c1	b.ne	0xfffff7f9ecc4  // b.any
   0x0000fffff7f9ec90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ec94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ec98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ec9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9eca0:	54000121	b.ne	0xfffff7f9ecc4  // b.any
   0x0000fffff7f9eca4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9eca8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f9ecac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ecb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ecb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ecb8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9ecbc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9ecc0:	14000030	b	0xfffff7f9ed80
   0x0000fffff7f9ecc4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ecc8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9eccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ecd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ecd4:	54000120	b.eq	0xfffff7f9ecf8  // b.none
   0x0000fffff7f9ecd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9ecdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ece0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ece4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ece8:	54000321	b.ne	0xfffff7f9ed4c  // b.any
   0x0000fffff7f9ecec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9ecf0:	9e620120	scvtf	d0, x9
   0x0000fffff7f9ecf4:	14000002	b	0xfffff7f9ecfc
   0x0000fffff7f9ecf8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9ecfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ed00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ed04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ed08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ed0c:	54000120	b.eq	0xfffff7f9ed30  // b.none
   0x0000fffff7f9ed10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ed14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ed18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ed1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ed20:	54000161	b.ne	0xfffff7f9ed4c  // b.any
   0x0000fffff7f9ed24:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ed28:	9e620121	scvtf	d1, x9
   0x0000fffff7f9ed2c:	14000002	b	0xfffff7f9ed34
   0x0000fffff7f9ed30:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7f9ed34:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9ed38:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9ed3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ed40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ed44:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9ed48:	17ffffde	b	0xfffff7f9ecc0
   0x0000fffff7f9ed4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ed50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ed54:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ed58:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ed5c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f9ed60:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ed64:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ed68:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f9ed6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ed70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ed74:	d63f0200	blr	x16
   0x0000fffff7f9ed78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ed7c:	540079a0	b.eq	0xfffff7f9fcb0  // b.none
   0x0000fffff7f9ed80:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9ed84:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9ed88:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7f9ed8c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9ed90:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9ed94:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9ed98:	36d801d1	tbz	w17, #27, 0xfffff7f9edd0
   0x0000fffff7f9ed9c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9eda0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9eda4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9eda8:	54000281	b.ne	0xfffff7f9edf8  // b.any
   0x0000fffff7f9edac:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9edb0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9edb4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9edb8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9edbc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9edc0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9edc4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9edc8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9edcc:	54000169	b.ls	0xfffff7f9edf8  // b.plast
   0x0000fffff7f9edd0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9edd4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9edd8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9eddc:	36d80091	tbz	w17, #27, 0xfffff7f9edec
   0x0000fffff7f9ede0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ede4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9ede8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9edec:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9edf0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9edf4:	1400000e	b	0xfffff7f9ee2c
   0x0000fffff7f9edf8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9edfc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ee00:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ee04:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ee08:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f9ee0c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ee10:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ee14:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f9ee18:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ee1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ee20:	d63f0200	blr	x16
   0x0000fffff7f9ee24:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ee28:	54007480	b.eq	0xfffff7f9fcb8  // b.none
   0x0000fffff7f9ee2c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9ee30:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9ee34:	540003a0	b.eq	0xfffff7f9eea8  // b.none
   0x0000fffff7f9ee38:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f9ee3c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f9ee40:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9ee44:	36d801d1	tbz	w17, #27, 0xfffff7f9ee7c
   0x0000fffff7f9ee48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9ee4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9ee50:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9ee54:	540002a1	b.ne	0xfffff7f9eea8  // b.any
   0x0000fffff7f9ee58:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9ee5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ee60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9ee64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9ee68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9ee6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9ee70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9ee74:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9ee78:	54000189	b.ls	0xfffff7f9eea8  // b.plast
   0x0000fffff7f9ee7c:	36d8008d	tbz	w13, #27, 0xfffff7f9ee8c
   0x0000fffff7f9ee80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9ee84:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9ee88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9ee8c:	36d80091	tbz	w17, #27, 0xfffff7f9ee9c
   0x0000fffff7f9ee90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ee94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9ee98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9ee9c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9eea0:	b900016d	str	w13, [x11]
   0x0000fffff7f9eea4:	1400000e	b	0xfffff7f9eedc
   0x0000fffff7f9eea8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9eeac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9eeb0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9eeb4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9eeb8:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f9eebc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9eec0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9eec4:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f9eec8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9eecc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9eed0:	d63f0200	blr	x16
   0x0000fffff7f9eed4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9eed8:	54006f40	b.eq	0xfffff7f9fcc0  // b.none
   0x0000fffff7f9eedc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9eee0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9eee4:	540004a0	b.eq	0xfffff7f9ef78  // b.none
   0x0000fffff7f9eee8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9eeec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9eef0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9eef4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9eef8:	54000400	b.eq	0xfffff7f9ef78  // b.none
   0x0000fffff7f9eefc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9ef00:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9ef04:	36d801d1	tbz	w17, #27, 0xfffff7f9ef3c
   0x0000fffff7f9ef08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9ef0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9ef10:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9ef14:	54000321	b.ne	0xfffff7f9ef78  // b.any
   0x0000fffff7f9ef18:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9ef1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ef20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9ef24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9ef28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9ef2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9ef30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9ef34:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9ef38:	54000209	b.ls	0xfffff7f9ef78  // b.plast
   0x0000fffff7f9ef3c:	36d8008d	tbz	w13, #27, 0xfffff7f9ef4c
   0x0000fffff7f9ef40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9ef44:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9ef48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9ef4c:	36d80091	tbz	w17, #27, 0xfffff7f9ef5c
   0x0000fffff7f9ef50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ef54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9ef58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9ef5c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f9ef60:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9ef64:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9ef68:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9ef6c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9ef70:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9ef74:	1400000e	b	0xfffff7f9efac
   0x0000fffff7f9ef78:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ef7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ef80:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ef84:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ef88:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f9ef8c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ef90:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ef94:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f9ef98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ef9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9efa0:	d63f0200	blr	x16
   0x0000fffff7f9efa4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9efa8:	54006900	b.eq	0xfffff7f9fcc8  // b.none
   0x0000fffff7f9efac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9efb0:	37d806a9	tbnz	w9, #27, 0xfffff7f9f084
   0x0000fffff7f9efb4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9efb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9efbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9efc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9efc4:	540001c1	b.ne	0xfffff7f9effc  // b.any
   0x0000fffff7f9efc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9efcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9efd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9efd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9efd8:	54000121	b.ne	0xfffff7f9effc  // b.any
   0x0000fffff7f9efdc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9efe0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f9efe4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9efe8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9efec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9eff0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9eff4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9eff8:	14000030	b	0xfffff7f9f0b8
   0x0000fffff7f9effc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f000:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f008:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f00c:	54000120	b.eq	0xfffff7f9f030  // b.none
   0x0000fffff7f9f010:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f014:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f018:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f01c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f020:	54000321	b.ne	0xfffff7f9f084  // b.any
   0x0000fffff7f9f024:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9f028:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f02c:	14000002	b	0xfffff7f9f034
   0x0000fffff7f9f030:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9f034:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f038:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f03c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f040:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f044:	54000120	b.eq	0xfffff7f9f068  // b.none
   0x0000fffff7f9f048:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f04c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f050:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f054:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f058:	54000161	b.ne	0xfffff7f9f084  // b.any
   0x0000fffff7f9f05c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f060:	9e620121	scvtf	d1, x9
   0x0000fffff7f9f064:	14000002	b	0xfffff7f9f06c
   0x0000fffff7f9f068:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7f9f06c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9f070:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9f074:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f07c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9f080:	17ffffde	b	0xfffff7f9eff8
   0x0000fffff7f9f084:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f088:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f08c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f090:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f094:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f9f098:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f09c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f0a0:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f9f0a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f0a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f0ac:	d63f0200	blr	x16
   0x0000fffff7f9f0b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f0b4:	540060e0	b.eq	0xfffff7f9fcd0  // b.none
   0x0000fffff7f9f0b8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9f0bc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9f0c0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7f9f0c4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9f0c8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9f0cc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9f0d0:	36d801d1	tbz	w17, #27, 0xfffff7f9f108
   0x0000fffff7f9f0d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f0d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f0dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f0e0:	54000281	b.ne	0xfffff7f9f130  // b.any
   0x0000fffff7f9f0e4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9f0e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f0ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f0f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f0f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f0f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f0fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f100:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f104:	54000169	b.ls	0xfffff7f9f130  // b.plast
   0x0000fffff7f9f108:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f10c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f110:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f114:	36d80091	tbz	w17, #27, 0xfffff7f9f124
   0x0000fffff7f9f118:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f11c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f120:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f124:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9f128:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9f12c:	1400000e	b	0xfffff7f9f164
   0x0000fffff7f9f130:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f134:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f138:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f13c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f140:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f9f144:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f148:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f14c:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f9f150:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f154:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f158:	d63f0200	blr	x16
   0x0000fffff7f9f15c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f160:	54005bc0	b.eq	0xfffff7f9fcd8  // b.none
   0x0000fffff7f9f164:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9f168:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f16c:	540003a0	b.eq	0xfffff7f9f1e0  // b.none
   0x0000fffff7f9f170:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f9f174:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f9f178:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9f17c:	36d801d1	tbz	w17, #27, 0xfffff7f9f1b4
   0x0000fffff7f9f180:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f184:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f188:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f18c:	540002a1	b.ne	0xfffff7f9f1e0  // b.any
   0x0000fffff7f9f190:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9f194:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f198:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f19c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f1a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f1a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f1a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f1ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f1b0:	54000189	b.ls	0xfffff7f9f1e0  // b.plast
   0x0000fffff7f9f1b4:	36d8008d	tbz	w13, #27, 0xfffff7f9f1c4
   0x0000fffff7f9f1b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f1bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f1c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f1c4:	36d80091	tbz	w17, #27, 0xfffff7f9f1d4
   0x0000fffff7f9f1c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f1cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f1d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f1d4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9f1d8:	b900016d	str	w13, [x11]
   0x0000fffff7f9f1dc:	1400000e	b	0xfffff7f9f214
   0x0000fffff7f9f1e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9f1e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f1e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f1ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f1f0:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f9f1f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f1f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f1fc:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f9f200:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f208:	d63f0200	blr	x16
   0x0000fffff7f9f20c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f210:	54005680	b.eq	0xfffff7f9fce0  // b.none
   0x0000fffff7f9f214:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9f218:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f21c:	540004a0	b.eq	0xfffff7f9f2b0  // b.none
   0x0000fffff7f9f220:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9f224:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9f228:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9f22c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9f230:	54000400	b.eq	0xfffff7f9f2b0  // b.none
   0x0000fffff7f9f234:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9f238:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9f23c:	36d801d1	tbz	w17, #27, 0xfffff7f9f274
   0x0000fffff7f9f240:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f244:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f248:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f24c:	54000321	b.ne	0xfffff7f9f2b0  // b.any
   0x0000fffff7f9f250:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9f254:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f258:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f25c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f260:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f264:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f268:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f26c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f270:	54000209	b.ls	0xfffff7f9f2b0  // b.plast
   0x0000fffff7f9f274:	36d8008d	tbz	w13, #27, 0xfffff7f9f284
   0x0000fffff7f9f278:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f27c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f280:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f284:	36d80091	tbz	w17, #27, 0xfffff7f9f294
   0x0000fffff7f9f288:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f28c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f290:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f294:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f9f298:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9f29c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9f2a0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9f2a4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9f2a8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9f2ac:	1400000e	b	0xfffff7f9f2e4
   0x0000fffff7f9f2b0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f2b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f2b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f2bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f2c0:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f9f2c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f2c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f2cc:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f9f2d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f2d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f2d8:	d63f0200	blr	x16
   0x0000fffff7f9f2dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f2e0:	54005040	b.eq	0xfffff7f9fce8  // b.none
   0x0000fffff7f9f2e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f2e8:	37d806a9	tbnz	w9, #27, 0xfffff7f9f3bc
   0x0000fffff7f9f2ec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f2f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f2f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f2f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f2fc:	540001c1	b.ne	0xfffff7f9f334  // b.any
   0x0000fffff7f9f300:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f304:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f308:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f30c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f310:	54000121	b.ne	0xfffff7f9f334  // b.any
   0x0000fffff7f9f314:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9f318:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f9f31c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f320:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f324:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f328:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9f32c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9f330:	14000030	b	0xfffff7f9f3f0
   0x0000fffff7f9f334:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f338:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f33c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f340:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f344:	54000120	b.eq	0xfffff7f9f368  // b.none
   0x0000fffff7f9f348:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f34c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f350:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f354:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f358:	54000321	b.ne	0xfffff7f9f3bc  // b.any
   0x0000fffff7f9f35c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9f360:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f364:	14000002	b	0xfffff7f9f36c
   0x0000fffff7f9f368:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9f36c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f370:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f374:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f378:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f37c:	54000120	b.eq	0xfffff7f9f3a0  // b.none
   0x0000fffff7f9f380:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f384:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f388:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f38c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f390:	54000161	b.ne	0xfffff7f9f3bc  // b.any
   0x0000fffff7f9f394:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f398:	9e620121	scvtf	d1, x9
   0x0000fffff7f9f39c:	14000002	b	0xfffff7f9f3a4
   0x0000fffff7f9f3a0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7f9f3a4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9f3a8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9f3ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f3b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f3b4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9f3b8:	17ffffde	b	0xfffff7f9f330
   0x0000fffff7f9f3bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f3c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f3c4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f3c8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f3cc:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f9f3d0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f3d4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f3d8:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f9f3dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f3e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f3e4:	d63f0200	blr	x16
   0x0000fffff7f9f3e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f3ec:	54004820	b.eq	0xfffff7f9fcf0  // b.none
   0x0000fffff7f9f3f0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9f3f4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9f3f8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7f9f3fc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9f400:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9f404:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9f408:	36d801d1	tbz	w17, #27, 0xfffff7f9f440
   0x0000fffff7f9f40c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f410:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f414:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f418:	54000281	b.ne	0xfffff7f9f468  // b.any
   0x0000fffff7f9f41c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9f420:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f424:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f428:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f42c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f430:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f434:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f438:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f43c:	54000169	b.ls	0xfffff7f9f468  // b.plast
   0x0000fffff7f9f440:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f444:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f448:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f44c:	36d80091	tbz	w17, #27, 0xfffff7f9f45c
   0x0000fffff7f9f450:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f454:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f458:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f45c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9f460:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9f464:	1400000e	b	0xfffff7f9f49c
   0x0000fffff7f9f468:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f46c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f470:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f474:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f478:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f9f47c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f480:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f484:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f9f488:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f48c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f490:	d63f0200	blr	x16
   0x0000fffff7f9f494:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f498:	54004300	b.eq	0xfffff7f9fcf8  // b.none
   0x0000fffff7f9f49c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9f4a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f4a4:	540003a0	b.eq	0xfffff7f9f518  // b.none
   0x0000fffff7f9f4a8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f9f4ac:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f9f4b0:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9f4b4:	36d801d1	tbz	w17, #27, 0xfffff7f9f4ec
   0x0000fffff7f9f4b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f4bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f4c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f4c4:	540002a1	b.ne	0xfffff7f9f518  // b.any
   0x0000fffff7f9f4c8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9f4cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f4d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f4d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f4d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f4dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f4e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f4e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f4e8:	54000189	b.ls	0xfffff7f9f518  // b.plast
   0x0000fffff7f9f4ec:	36d8008d	tbz	w13, #27, 0xfffff7f9f4fc
   0x0000fffff7f9f4f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f4f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f4f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f4fc:	36d80091	tbz	w17, #27, 0xfffff7f9f50c
   0x0000fffff7f9f500:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f504:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f508:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f50c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9f510:	b900016d	str	w13, [x11]
   0x0000fffff7f9f514:	1400000e	b	0xfffff7f9f54c
   0x0000fffff7f9f518:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9f51c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f520:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f524:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f528:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f9f52c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f530:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f534:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f9f538:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f53c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f540:	d63f0200	blr	x16
   0x0000fffff7f9f544:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f548:	54003dc0	b.eq	0xfffff7f9fd00  // b.none
   0x0000fffff7f9f54c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9f550:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f554:	540004a0	b.eq	0xfffff7f9f5e8  // b.none
   0x0000fffff7f9f558:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9f55c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9f560:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9f564:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9f568:	54000400	b.eq	0xfffff7f9f5e8  // b.none
   0x0000fffff7f9f56c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9f570:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9f574:	36d801d1	tbz	w17, #27, 0xfffff7f9f5ac
   0x0000fffff7f9f578:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f57c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f580:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f584:	54000321	b.ne	0xfffff7f9f5e8  // b.any
   0x0000fffff7f9f588:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9f58c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f590:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f594:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f598:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f59c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f5a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f5a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f5a8:	54000209	b.ls	0xfffff7f9f5e8  // b.plast
   0x0000fffff7f9f5ac:	36d8008d	tbz	w13, #27, 0xfffff7f9f5bc
   0x0000fffff7f9f5b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f5b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f5b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f5bc:	36d80091	tbz	w17, #27, 0xfffff7f9f5cc
   0x0000fffff7f9f5c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f5c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f5c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f5cc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f9f5d0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9f5d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9f5d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9f5dc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9f5e0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9f5e4:	1400000e	b	0xfffff7f9f61c
   0x0000fffff7f9f5e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f5ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f5f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f5f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f5f8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f9f5fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f600:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f604:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f9f608:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f60c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f610:	d63f0200	blr	x16
   0x0000fffff7f9f614:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f618:	54003780	b.eq	0xfffff7f9fd08  // b.none
   0x0000fffff7f9f61c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f620:	37d806a9	tbnz	w9, #27, 0xfffff7f9f6f4
   0x0000fffff7f9f624:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f62c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f630:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f634:	540001c1	b.ne	0xfffff7f9f66c  // b.any
   0x0000fffff7f9f638:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f648:	54000121	b.ne	0xfffff7f9f66c  // b.any
   0x0000fffff7f9f64c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9f650:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f9f654:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f65c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f660:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9f664:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9f668:	14000030	b	0xfffff7f9f728
   0x0000fffff7f9f66c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f670:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f678:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f67c:	54000120	b.eq	0xfffff7f9f6a0  // b.none
   0x0000fffff7f9f680:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f684:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f68c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f690:	54000321	b.ne	0xfffff7f9f6f4  // b.any
   0x0000fffff7f9f694:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9f698:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f69c:	14000002	b	0xfffff7f9f6a4
   0x0000fffff7f9f6a0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9f6a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f6a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f6ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f6b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f6b4:	54000120	b.eq	0xfffff7f9f6d8  // b.none
   0x0000fffff7f9f6b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f6bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f6c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f6c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f6c8:	54000161	b.ne	0xfffff7f9f6f4  // b.any
   0x0000fffff7f9f6cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9f6d0:	9e620121	scvtf	d1, x9
   0x0000fffff7f9f6d4:	14000002	b	0xfffff7f9f6dc
   0x0000fffff7f9f6d8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7f9f6dc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9f6e0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9f6e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f6e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f6ec:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9f6f0:	17ffffde	b	0xfffff7f9f668
   0x0000fffff7f9f6f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f6f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f6fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f700:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f704:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f9f708:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f70c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f710:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f9f714:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f718:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f71c:	d63f0200	blr	x16
   0x0000fffff7f9f720:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f724:	54002f60	b.eq	0xfffff7f9fd10  // b.none
   0x0000fffff7f9f728:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9f72c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9f730:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7f9f734:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9f738:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9f73c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9f740:	36d801d1	tbz	w17, #27, 0xfffff7f9f778
   0x0000fffff7f9f744:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f748:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f74c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f750:	54000281	b.ne	0xfffff7f9f7a0  // b.any
   0x0000fffff7f9f754:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9f758:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f75c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f760:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f764:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f768:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f76c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f770:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f774:	54000169	b.ls	0xfffff7f9f7a0  // b.plast
   0x0000fffff7f9f778:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f77c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f780:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f784:	36d80091	tbz	w17, #27, 0xfffff7f9f794
   0x0000fffff7f9f788:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f78c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f790:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f794:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9f798:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9f79c:	1400000e	b	0xfffff7f9f7d4
   0x0000fffff7f9f7a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9f7a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f7a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f7ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f7b0:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f9f7b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f7b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f7bc:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f9f7c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f7c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f7c8:	d63f0200	blr	x16
   0x0000fffff7f9f7cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f7d0:	54002a40	b.eq	0xfffff7f9fd18  // b.none
   0x0000fffff7f9f7d4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9f7d8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f7dc:	540003a0	b.eq	0xfffff7f9f850  // b.none
   0x0000fffff7f9f7e0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f9f7e4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f9f7e8:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9f7ec:	36d801d1	tbz	w17, #27, 0xfffff7f9f824
   0x0000fffff7f9f7f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f7f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f7f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f7fc:	540002a1	b.ne	0xfffff7f9f850  // b.any
   0x0000fffff7f9f800:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9f804:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f808:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f80c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f810:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f814:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f818:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f81c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f820:	54000189	b.ls	0xfffff7f9f850  // b.plast
   0x0000fffff7f9f824:	36d8008d	tbz	w13, #27, 0xfffff7f9f834
   0x0000fffff7f9f828:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f82c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f830:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f834:	36d80091	tbz	w17, #27, 0xfffff7f9f844
   0x0000fffff7f9f838:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f83c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f840:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f844:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9f848:	b900016d	str	w13, [x11]
   0x0000fffff7f9f84c:	1400000e	b	0xfffff7f9f884
   0x0000fffff7f9f850:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9f854:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f858:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f85c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f860:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f9f864:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f868:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f86c:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f9f870:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9f874:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f878:	d63f0200	blr	x16
   0x0000fffff7f9f87c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f880:	54002500	b.eq	0xfffff7f9fd20  // b.none
   0x0000fffff7f9f884:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9f888:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9f88c:	540004a0	b.eq	0xfffff7f9f920  // b.none
   0x0000fffff7f9f890:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9f894:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9f898:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9f89c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9f8a0:	54000400	b.eq	0xfffff7f9f920  // b.none
   0x0000fffff7f9f8a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9f8a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9f8ac:	36d801d1	tbz	w17, #27, 0xfffff7f9f8e4
   0x0000fffff7f9f8b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9f8b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9f8b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9f8bc:	54000321	b.ne	0xfffff7f9f920  // b.any
   0x0000fffff7f9f8c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9f8c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f8c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9f8cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9f8d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9f8d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9f8d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9f8dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9f8e0:	54000209	b.ls	0xfffff7f9f920  // b.plast
   0x0000fffff7f9f8e4:	36d8008d	tbz	w13, #27, 0xfffff7f9f8f4
   0x0000fffff7f9f8e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9f8ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9f8f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9f8f4:	36d80091	tbz	w17, #27, 0xfffff7f9f904
   0x0000fffff7f9f8f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9f8fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9f900:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9f904:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f9f908:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9f90c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9f910:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9f914:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9f918:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9f91c:	1400000e	b	0xfffff7f9f954
   0x0000fffff7f9f920:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9f924:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9f928:	aa1303e1	mov	x1, x19
   0x0000fffff7f9f92c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9f930:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f9f934:	aa1403e4	mov	x4, x20
   0x0000fffff7f9f938:	aa1603e5	mov	x5, x22
   0x0000fffff7f9f93c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f9f940:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9f944:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9f948:	d63f0200	blr	x16
   0x0000fffff7f9f94c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9f950:	54001ec0	b.eq	0xfffff7f9fd28  // b.none
   0x0000fffff7f9f954:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f958:	37d806a9	tbnz	w9, #27, 0xfffff7f9fa2c
   0x0000fffff7f9f95c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f960:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f968:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f96c:	540001c1	b.ne	0xfffff7f9f9a4  // b.any
   0x0000fffff7f9f970:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f97c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f980:	54000121	b.ne	0xfffff7f9f9a4  // b.any
   0x0000fffff7f9f984:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9f988:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f9f98c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9f990:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f998:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f9f99c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9f9a0:	14000030	b	0xfffff7f9fa60
   0x0000fffff7f9f9a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f9a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f9ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f9b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f9b4:	54000120	b.eq	0xfffff7f9f9d8  // b.none
   0x0000fffff7f9f9b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9f9bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f9c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f9c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f9c8:	54000321	b.ne	0xfffff7f9fa2c  // b.any
   0x0000fffff7f9f9cc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f9f9d0:	9e620120	scvtf	d0, x9
   0x0000fffff7f9f9d4:	14000002	b	0xfffff7f9f9dc
   0x0000fffff7f9f9d8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f9f9dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f9e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9f9e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f9e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9f9ec:	54000120	b.eq	0xfffff7f9fa10  // b.none
   0x0000fffff7f9f9f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9f9f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9f9f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9f9fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9fa00:	54000161	b.ne	0xfffff7f9fa2c  // b.any
   0x0000fffff7f9fa04:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9fa08:	9e620121	scvtf	d1, x9
   0x0000fffff7f9fa0c:	14000002	b	0xfffff7f9fa14
   0x0000fffff7f9fa10:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7f9fa14:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9fa18:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7f9fa1c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9fa20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fa24:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f9fa28:	17ffffde	b	0xfffff7f9f9a0
   0x0000fffff7f9fa2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9fa30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fa34:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fa38:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fa3c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f9fa40:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fa44:	aa1603e5	mov	x5, x22
   0x0000fffff7f9fa48:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f9fa4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9fa50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fa54:	d63f0200	blr	x16
   0x0000fffff7f9fa58:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9fa5c:	540016a0	b.eq	0xfffff7f9fd30  // b.none
   0x0000fffff7f9fa60:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9fa64:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9fa68:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7f9fa6c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9fa70:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9fa74:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9fa78:	36d801d1	tbz	w17, #27, 0xfffff7f9fab0
   0x0000fffff7f9fa7c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9fa80:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9fa84:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9fa88:	54000281	b.ne	0xfffff7f9fad8  // b.any
   0x0000fffff7f9fa8c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9fa90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9fa94:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9fa98:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9fa9c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9faa0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9faa4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9faa8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9faac:	54000169	b.ls	0xfffff7f9fad8  // b.plast
   0x0000fffff7f9fab0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9fab4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9fab8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9fabc:	36d80091	tbz	w17, #27, 0xfffff7f9facc
   0x0000fffff7f9fac0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9fac4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9fac8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9facc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9fad0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9fad4:	1400000e	b	0xfffff7f9fb0c
   0x0000fffff7f9fad8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9fadc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fae0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fae4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fae8:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f9faec:	aa1403e4	mov	x4, x20
   0x0000fffff7f9faf0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9faf4:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f9faf8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9fafc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fb00:	d63f0200	blr	x16
   0x0000fffff7f9fb04:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9fb08:	54001180	b.eq	0xfffff7f9fd38  // b.none
   0x0000fffff7f9fb0c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9fb10:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9fb14:	540003a0	b.eq	0xfffff7f9fb88  // b.none
   0x0000fffff7f9fb18:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f9fb1c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f9fb20:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9fb24:	36d801d1	tbz	w17, #27, 0xfffff7f9fb5c
   0x0000fffff7f9fb28:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9fb2c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9fb30:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9fb34:	540002a1	b.ne	0xfffff7f9fb88  // b.any
   0x0000fffff7f9fb38:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9fb3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9fb40:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9fb44:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9fb48:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9fb4c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9fb50:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9fb54:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9fb58:	54000189	b.ls	0xfffff7f9fb88  // b.plast
   0x0000fffff7f9fb5c:	36d8008d	tbz	w13, #27, 0xfffff7f9fb6c
   0x0000fffff7f9fb60:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9fb64:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9fb68:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9fb6c:	36d80091	tbz	w17, #27, 0xfffff7f9fb7c
   0x0000fffff7f9fb70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9fb74:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9fb78:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9fb7c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9fb80:	b900016d	str	w13, [x11]
   0x0000fffff7f9fb84:	1400000e	b	0xfffff7f9fbbc
   0x0000fffff7f9fb88:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9fb8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fb90:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fb94:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fb98:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f9fb9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9fba4:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f9fba8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9fbac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fbb0:	d63f0200	blr	x16
   0x0000fffff7f9fbb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9fbb8:	54000c40	b.eq	0xfffff7f9fd40  // b.none
   0x0000fffff7f9fbbc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9fbc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9fbc4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9fbc8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9fbcc:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f9fbd0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9fbd4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9fbd8:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7f9fbdc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9fbe0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9fbe4:	d63f0200	blr	x16
   0x0000fffff7f9fbe8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9fbec:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9fbf0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9fbf4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9fbf8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f9fbfc:	d65f03c0	ret
   0x0000fffff7f9fc00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9fc04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9fc08:	b900028a	str	w10, [x20]
   0x0000fffff7f9fc0c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9fc10:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9fc14:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9fc18:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9fc1c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9fc20:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f9fc24:	d65f03c0	ret
   0x0000fffff7f9fc28:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f9fc2c:	17fffff5	b	0xfffff7f9fc00
   0x0000fffff7f9fc30:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f9fc34:	17fffff3	b	0xfffff7f9fc00
   0x0000fffff7f9fc38:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f9fc3c:	17fffff1	b	0xfffff7f9fc00
   0x0000fffff7f9fc40:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f9fc44:	17ffffef	b	0xfffff7f9fc00
   0x0000fffff7f9fc48:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f9fc4c:	17ffffed	b	0xfffff7f9fc00
   0x0000fffff7f9fc50:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f9fc54:	17ffffeb	b	0xfffff7f9fc00
   0x0000fffff7f9fc58:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f9fc5c:	17ffffe9	b	0xfffff7f9fc00
   0x0000fffff7f9fc60:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f9fc64:	17ffffe7	b	0xfffff7f9fc00
   0x0000fffff7f9fc68:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f9fc6c:	17ffffe5	b	0xfffff7f9fc00
   0x0000fffff7f9fc70:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f9fc74:	17ffffe3	b	0xfffff7f9fc00
   0x0000fffff7f9fc78:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f9fc7c:	17ffffe1	b	0xfffff7f9fc00
   0x0000fffff7f9fc80:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f9fc84:	17ffffdf	b	0xfffff7f9fc00
   0x0000fffff7f9fc88:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f9fc8c:	17ffffdd	b	0xfffff7f9fc00
   0x0000fffff7f9fc90:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f9fc94:	17ffffdb	b	0xfffff7f9fc00
   0x0000fffff7f9fc98:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f9fc9c:	17ffffd9	b	0xfffff7f9fc00
   0x0000fffff7f9fca0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f9fca4:	17ffffd7	b	0xfffff7f9fc00
   0x0000fffff7f9fca8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f9fcac:	17ffffd5	b	0xfffff7f9fc00
   0x0000fffff7f9fcb0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f9fcb4:	17ffffd3	b	0xfffff7f9fc00
   0x0000fffff7f9fcb8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f9fcbc:	17ffffd1	b	0xfffff7f9fc00
   0x0000fffff7f9fcc0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f9fcc4:	17ffffcf	b	0xfffff7f9fc00
   0x0000fffff7f9fcc8:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f9fccc:	17ffffcd	b	0xfffff7f9fc00
   0x0000fffff7f9fcd0:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f9fcd4:	17ffffcb	b	0xfffff7f9fc00
   0x0000fffff7f9fcd8:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f9fcdc:	17ffffc9	b	0xfffff7f9fc00
   0x0000fffff7f9fce0:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f9fce4:	17ffffc7	b	0xfffff7f9fc00
   0x0000fffff7f9fce8:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f9fcec:	17ffffc5	b	0xfffff7f9fc00
   0x0000fffff7f9fcf0:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f9fcf4:	17ffffc3	b	0xfffff7f9fc00
   0x0000fffff7f9fcf8:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f9fcfc:	17ffffc1	b	0xfffff7f9fc00
   0x0000fffff7f9fd00:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f9fd04:	17ffffbf	b	0xfffff7f9fc00
   0x0000fffff7f9fd08:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f9fd0c:	17ffffbd	b	0xfffff7f9fc00
   0x0000fffff7f9fd10:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f9fd14:	17ffffbb	b	0xfffff7f9fc00
   0x0000fffff7f9fd18:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f9fd1c:	17ffffb9	b	0xfffff7f9fc00
   0x0000fffff7f9fd20:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f9fd24:	17ffffb7	b	0xfffff7f9fc00
   0x0000fffff7f9fd28:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f9fd2c:	17ffffb5	b	0xfffff7f9fc00
   0x0000fffff7f9fd30:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f9fd34:	17ffffb3	b	0xfffff7f9fc00
   0x0000fffff7f9fd38:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f9fd3c:	17ffffb1	b	0xfffff7f9fc00
   0x0000fffff7f9fd40:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f9fd44:	17ffffaf	b	0xfffff7f9fc00
   0x0000fffff7f9fd48:	00000000	udf	#0
   0x0000fffff7f9fd4c:	00000000	udf	#0
   0x0000fffff7f9fd50:	00000000	udf	#0
   0x0000fffff7f9fd54:	00000000	udf	#0
   0x0000fffff7f9fd58:	00000000	udf	#0
   0x0000fffff7f9fd5c:	00000000	udf	#0
   0x0000fffff7f9fd60:	00000000	udf	#0
   0x0000fffff7f9fd64:	00000000	udf	#0
   0x0000fffff7f9fd68:	00000000	udf	#0
   0x0000fffff7f9fd6c:	00000000	udf	#0
   0x0000fffff7f9fd70:	00000000	udf	#0
   0x0000fffff7f9fd74:	00000000	udf	#0
   0x0000fffff7f9fd78:	00000000	udf	#0
   0x0000fffff7f9fd7c:	00000000	udf	#0
   0x0000fffff7f9fd80:	00000000	udf	#0
   0x0000fffff7f9fd84:	00000000	udf	#0
   0x0000fffff7f9fd88:	00000000	udf	#0
   0x0000fffff7f9fd8c:	00000000	udf	#0
   0x0000fffff7f9fd90:	00000000	udf	#0
   0x0000fffff7f9fd94:	00000000	udf	#0
   0x0000fffff7f9fd98:	00000000	udf	#0
   0x0000fffff7f9fd9c:	00000000	udf	#0
   0x0000fffff7f9fda0:	00000000	udf	#0
   0x0000fffff7f9fda4:	00000000	udf	#0
   0x0000fffff7f9fda8:	00000000	udf	#0
   0x0000fffff7f9fdac:	00000000	udf	#0
   0x0000fffff7f9fdb0:	00000000	udf	#0
   0x0000fffff7f9fdb4:	00000000	udf	#0
   0x0000fffff7f9fdb8:	00000000	udf	#0
   0x0000fffff7f9fdbc:	00000000	udf	#0
   0x0000fffff7f9fdc0:	00000000	udf	#0
   0x0000fffff7f9fdc4:	00000000	udf	#0
   0x0000fffff7f9fdc8:	00000000	udf	#0
   0x0000fffff7f9fdcc:	00000000	udf	#0
   0x0000fffff7f9fdd0:	00000000	udf	#0
   0x0000fffff7f9fdd4:	00000000	udf	#0
   0x0000fffff7f9fdd8:	00000000	udf	#0
   0x0000fffff7f9fddc:	00000000	udf	#0
   0x0000fffff7f9fde0:	00000000	udf	#0
   0x0000fffff7f9fde4:	00000000	udf	#0
   0x0000fffff7f9fde8:	00000000	udf	#0
   0x0000fffff7f9fdec:	00000000	udf	#0
   0x0000fffff7f9fdf0:	00000000	udf	#0
   0x0000fffff7f9fdf4:	00000000	udf	#0
   0x0000fffff7f9fdf8:	00000000	udf	#0
   0x0000fffff7f9fdfc:	00000000	udf	#0
   0x0000fffff7f9fe00:	00000000	udf	#0
   0x0000fffff7f9fe04:	00000000	udf	#0
   0x0000fffff7f9fe08:	00000000	udf	#0
   0x0000fffff7f9fe0c:	00000000	udf	#0
   0x0000fffff7f9fe10:	00000000	udf	#0
   0x0000fffff7f9fe14:	00000000	udf	#0
   0x0000fffff7f9fe18:	00000000	udf	#0
   0x0000fffff7f9fe1c:	00000000	udf	#0
   0x0000fffff7f9fe20:	00000000	udf	#0
   0x0000fffff7f9fe24:	00000000	udf	#0
   0x0000fffff7f9fe28:	00000000	udf	#0
   0x0000fffff7f9fe2c:	00000000	udf	#0
   0x0000fffff7f9fe30:	00000000	udf	#0
   0x0000fffff7f9fe34:	00000000	udf	#0
   0x0000fffff7f9fe38:	00000000	udf	#0
   0x0000fffff7f9fe3c:	00000000	udf	#0
   0x0000fffff7f9fe40:	00000000	udf	#0
   0x0000fffff7f9fe44:	00000000	udf	#0
   0x0000fffff7f9fe48:	00000000	udf	#0
   0x0000fffff7f9fe4c:	00000000	udf	#0
   0x0000fffff7f9fe50:	00000000	udf	#0
   0x0000fffff7f9fe54:	00000000	udf	#0
   0x0000fffff7f9fe58:	00000000	udf	#0
   0x0000fffff7f9fe5c:	00000000	udf	#0
   0x0000fffff7f9fe60:	00000000	udf	#0
   0x0000fffff7f9fe64:	00000000	udf	#0
   0x0000fffff7f9fe68:	00000000	udf	#0
   0x0000fffff7f9fe6c:	00000000	udf	#0
   0x0000fffff7f9fe70:	00000000	udf	#0
   0x0000fffff7f9fe74:	00000000	udf	#0
   0x0000fffff7f9fe78:	00000000	udf	#0
   0x0000fffff7f9fe7c:	00000000	udf	#0
   0x0000fffff7f9fe80:	00000000	udf	#0
   0x0000fffff7f9fe84:	00000000	udf	#0
   0x0000fffff7f9fe88:	00000000	udf	#0
   0x0000fffff7f9fe8c:	00000000	udf	#0
   0x0000fffff7f9fe90:	00000000	udf	#0
   0x0000fffff7f9fe94:	00000000	udf	#0
   0x0000fffff7f9fe98:	00000000	udf	#0
   0x0000fffff7f9fe9c:	00000000	udf	#0
   0x0000fffff7f9fea0:	00000000	udf	#0
   0x0000fffff7f9fea4:	00000000	udf	#0
   0x0000fffff7f9fea8:	00000000	udf	#0
   0x0000fffff7f9feac:	00000000	udf	#0
   0x0000fffff7f9feb0:	00000000	udf	#0
   0x0000fffff7f9feb4:	00000000	udf	#0
   0x0000fffff7f9feb8:	00000000	udf	#0
   0x0000fffff7f9febc:	00000000	udf	#0
   0x0000fffff7f9fec0:	00000000	udf	#0
   0x0000fffff7f9fec4:	00000000	udf	#0
   0x0000fffff7f9fec8:	00000000	udf	#0
   0x0000fffff7f9fecc:	00000000	udf	#0
   0x0000fffff7f9fed0:	00000000	udf	#0
   0x0000fffff7f9fed4:	00000000	udf	#0
   0x0000fffff7f9fed8:	00000000	udf	#0
   0x0000fffff7f9fedc:	00000000	udf	#0
   0x0000fffff7f9fee0:	00000000	udf	#0
   0x0000fffff7f9fee4:	00000000	udf	#0
   0x0000fffff7f9fee8:	00000000	udf	#0
   0x0000fffff7f9feec:	00000000	udf	#0
   0x0000fffff7f9fef0:	00000000	udf	#0
   0x0000fffff7f9fef4:	00000000	udf	#0
   0x0000fffff7f9fef8:	00000000	udf	#0
   0x0000fffff7f9fefc:	00000000	udf	#0
   0x0000fffff7f9ff00:	00000000	udf	#0
   0x0000fffff7f9ff04:	00000000	udf	#0
   0x0000fffff7f9ff08:	00000000	udf	#0
   0x0000fffff7f9ff0c:	00000000	udf	#0
   0x0000fffff7f9ff10:	00000000	udf	#0
   0x0000fffff7f9ff14:	00000000	udf	#0
   0x0000fffff7f9ff18:	00000000	udf	#0
   0x0000fffff7f9ff1c:	00000000	udf	#0
   0x0000fffff7f9ff20:	00000000	udf	#0
   0x0000fffff7f9ff24:	00000000	udf	#0
   0x0000fffff7f9ff28:	00000000	udf	#0
   0x0000fffff7f9ff2c:	00000000	udf	#0
   0x0000fffff7f9ff30:	00000000	udf	#0
   0x0000fffff7f9ff34:	00000000	udf	#0
   0x0000fffff7f9ff38:	00000000	udf	#0
   0x0000fffff7f9ff3c:	00000000	udf	#0
   0x0000fffff7f9ff40:	00000000	udf	#0
   0x0000fffff7f9ff44:	00000000	udf	#0
   0x0000fffff7f9ff48:	00000000	udf	#0
   0x0000fffff7f9ff4c:	00000000	udf	#0
   0x0000fffff7f9ff50:	00000000	udf	#0
   0x0000fffff7f9ff54:	00000000	udf	#0
   0x0000fffff7f9ff58:	00000000	udf	#0
   0x0000fffff7f9ff5c:	00000000	udf	#0
   0x0000fffff7f9ff60:	00000000	udf	#0
   0x0000fffff7f9ff64:	00000000	udf	#0
   0x0000fffff7f9ff68:	00000000	udf	#0
   0x0000fffff7f9ff6c:	00000000	udf	#0
   0x0000fffff7f9ff70:	00000000	udf	#0
   0x0000fffff7f9ff74:	00000000	udf	#0
   0x0000fffff7f9ff78:	00000000	udf	#0
   0x0000fffff7f9ff7c:	00000000	udf	#0
   0x0000fffff7f9ff80:	00000000	udf	#0
   0x0000fffff7f9ff84:	00000000	udf	#0
   0x0000fffff7f9ff88:	00000000	udf	#0
   0x0000fffff7f9ff8c:	00000000	udf	#0
   0x0000fffff7f9ff90:	00000000	udf	#0
   0x0000fffff7f9ff94:	00000000	udf	#0
   0x0000fffff7f9ff98:	00000000	udf	#0
   0x0000fffff7f9ff9c:	00000000	udf	#0
   0x0000fffff7f9ffa0:	00000000	udf	#0
   0x0000fffff7f9ffa4:	00000000	udf	#0
   0x0000fffff7f9ffa8:	00000000	udf	#0
   0x0000fffff7f9ffac:	00000000	udf	#0
   0x0000fffff7f9ffb0:	00000000	udf	#0
   0x0000fffff7f9ffb4:	00000000	udf	#0
   0x0000fffff7f9ffb8:	00000000	udf	#0
   0x0000fffff7f9ffbc:	00000000	udf	#0
   0x0000fffff7f9ffc0:	00000000	udf	#0
   0x0000fffff7f9ffc4:	00000000	udf	#0
   0x0000fffff7f9ffc8:	00000000	udf	#0
   0x0000fffff7f9ffcc:	00000000	udf	#0
   0x0000fffff7f9ffd0:	00000000	udf	#0
   0x0000fffff7f9ffd4:	00000000	udf	#0
   0x0000fffff7f9ffd8:	00000000	udf	#0
   0x0000fffff7f9ffdc:	00000000	udf	#0
   0x0000fffff7f9ffe0:	00000000	udf	#0
   0x0000fffff7f9ffe4:	00000000	udf	#0
   0x0000fffff7f9ffe8:	00000000	udf	#0
   0x0000fffff7f9ffec:	00000000	udf	#0
   0x0000fffff7f9fff0:	00000000	udf	#0
   0x0000fffff7f9fff4:	00000000	udf	#0
   0x0000fffff7f9fff8:	00000000	udf	#0
   0x0000fffff7f9fffc:	00000000	udf	#0
End of assembler dump.
