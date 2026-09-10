Dump of assembler code from 0xfffff7faa000 to 0xfffff7fac000:
   0x0000fffff7faa000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7faa004:	910003fd	mov	x29, sp
   0x0000fffff7faa008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7faa00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7faa010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7faa014:	aa0003f3	mov	x19, x0
   0x0000fffff7faa018:	aa0103f4	mov	x20, x1
   0x0000fffff7faa01c:	aa0203f5	mov	x21, x2
   0x0000fffff7faa020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7faa024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7faa028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7faa02c:	f90003e9	str	x9, [sp]
   0x0000fffff7faa030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7faa034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7faa038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7faa03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7faa040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa044:	d63f0200	blr	x16
   0x0000fffff7faa048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7faa04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7faa050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7faa054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7faa058:	14000001	b	0xfffff7faa05c
   0x0000fffff7faa05c:	14000001	b	0xfffff7faa060
   0x0000fffff7faa060:	14000001	b	0xfffff7faa064
   0x0000fffff7faa064:	14000001	b	0xfffff7faa068
   0x0000fffff7faa068:	14000001	b	0xfffff7faa06c
   0x0000fffff7faa06c:	14000001	b	0xfffff7faa070
   0x0000fffff7faa070:	14000001	b	0xfffff7faa074
   0x0000fffff7faa074:	14000001	b	0xfffff7faa078
   0x0000fffff7faa078:	14000001	b	0xfffff7faa07c
   0x0000fffff7faa07c:	14000001	b	0xfffff7faa080
   0x0000fffff7faa080:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7faa084:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7faa088:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7faa08c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faa090:	36d80211	tbz	w17, #27, 0xfffff7faa0d0
   0x0000fffff7faa094:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa098:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa09c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa0a0:	540001e1	b.ne	0xfffff7faa0dc  // b.any
   0x0000fffff7faa0a4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faa0a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa0ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa0b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa0b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa0b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa0bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa0c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa0c4:	540000c9	b.ls	0xfffff7faa0dc  // b.plast
   0x0000fffff7faa0c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa0cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa0d0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faa0d4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faa0d8:	1400000e	b	0xfffff7faa110
   0x0000fffff7faa0dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa0e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa0e4:	aa1303e1	mov	x1, x19
   0x0000fffff7faa0e8:	aa1503e2	mov	x2, x21
   0x0000fffff7faa0ec:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7faa0f0:	aa1403e4	mov	x4, x20
   0x0000fffff7faa0f4:	aa1603e5	mov	x5, x22
   0x0000fffff7faa0f8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7faa0fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa100:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa104:	d63f0200	blr	x16
   0x0000fffff7faa108:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa10c:	5400ede0	b.eq	0xfffff7fabec8  // b.none
   0x0000fffff7faa110:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7faa114:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7faa118:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7faa11c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7faa120:	36d80211	tbz	w17, #27, 0xfffff7faa160
   0x0000fffff7faa124:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa128:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa12c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa130:	540001e1	b.ne	0xfffff7faa16c  // b.any
   0x0000fffff7faa134:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faa138:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa13c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa140:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa144:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa148:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa14c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa150:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa154:	540000c9	b.ls	0xfffff7faa16c  // b.plast
   0x0000fffff7faa158:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa15c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa160:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faa164:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faa168:	1400000e	b	0xfffff7faa1a0
   0x0000fffff7faa16c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa170:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa174:	aa1303e1	mov	x1, x19
   0x0000fffff7faa178:	aa1503e2	mov	x2, x21
   0x0000fffff7faa17c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7faa180:	aa1403e4	mov	x4, x20
   0x0000fffff7faa184:	aa1603e5	mov	x5, x22
   0x0000fffff7faa188:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7faa18c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa190:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa194:	d63f0200	blr	x16
   0x0000fffff7faa198:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa19c:	5400e9a0	b.eq	0xfffff7fabed0  // b.none
   0x0000fffff7faa1a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faa1a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa1a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1b0:	54000421	b.ne	0xfffff7faa234  // b.any
   0x0000fffff7faa1b4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa1b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa1bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1c4:	54000381	b.ne	0xfffff7faa234  // b.any
   0x0000fffff7faa1c8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faa1cc:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7faa1d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1d4:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7faa1d8:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7faa1dc:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7faa1e0:	91000580	add	x0, x12, #0x1
   0x0000fffff7faa1e4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa1e8:	36d80211	tbz	w17, #27, 0xfffff7faa228
   0x0000fffff7faa1ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa1f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa1f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa1f8:	540001e1	b.ne	0xfffff7faa234  // b.any
   0x0000fffff7faa1fc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa200:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa204:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa208:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa20c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa210:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa214:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa218:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa21c:	540000c9	b.ls	0xfffff7faa234  // b.plast
   0x0000fffff7faa220:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa224:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa228:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7faa22c:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7faa230:	1400000e	b	0xfffff7faa268
   0x0000fffff7faa234:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa238:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa23c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa240:	aa1503e2	mov	x2, x21
   0x0000fffff7faa244:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7faa248:	aa1403e4	mov	x4, x20
   0x0000fffff7faa24c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa250:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7faa254:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa258:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa25c:	d63f0200	blr	x16
   0x0000fffff7faa260:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa264:	5400e3a0	b.eq	0xfffff7fabed8  // b.none
   0x0000fffff7faa268:	f100041f	cmp	x0, #0x1
   0x0000fffff7faa26c:	5400df80	b.eq	0xfffff7fabe5c  // b.none
   0x0000fffff7faa270:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faa274:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faa278:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7faa27c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faa280:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faa284:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7faa288:	36d801d1	tbz	w17, #27, 0xfffff7faa2c0
   0x0000fffff7faa28c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa290:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa294:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa298:	54000281	b.ne	0xfffff7faa2e8  // b.any
   0x0000fffff7faa29c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faa2a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa2a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa2a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa2ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa2b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa2b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa2b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa2bc:	54000169	b.ls	0xfffff7faa2e8  // b.plast
   0x0000fffff7faa2c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa2c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa2c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa2cc:	36d80091	tbz	w17, #27, 0xfffff7faa2dc
   0x0000fffff7faa2d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa2d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa2d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa2dc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faa2e0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faa2e4:	1400000e	b	0xfffff7faa31c
   0x0000fffff7faa2e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa2ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa2f0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa2f4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa2f8:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7faa2fc:	aa1403e4	mov	x4, x20
   0x0000fffff7faa300:	aa1603e5	mov	x5, x22
   0x0000fffff7faa304:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faa308:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa30c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa310:	d63f0200	blr	x16
   0x0000fffff7faa314:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa318:	5400de40	b.eq	0xfffff7fabee0  // b.none
   0x0000fffff7faa31c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faa320:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa324:	540003a0	b.eq	0xfffff7faa398  // b.none
   0x0000fffff7faa328:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7faa32c:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7faa330:	b9400171	ldr	w17, [x11]
   0x0000fffff7faa334:	36d801d1	tbz	w17, #27, 0xfffff7faa36c
   0x0000fffff7faa338:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa33c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa340:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa344:	540002a1	b.ne	0xfffff7faa398  // b.any
   0x0000fffff7faa348:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faa34c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa350:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa354:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa358:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa35c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa360:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa364:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa368:	54000189	b.ls	0xfffff7faa398  // b.plast
   0x0000fffff7faa36c:	36d8008d	tbz	w13, #27, 0xfffff7faa37c
   0x0000fffff7faa370:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa374:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa378:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa37c:	36d80091	tbz	w17, #27, 0xfffff7faa38c
   0x0000fffff7faa380:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa384:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa388:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa38c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faa390:	b900016d	str	w13, [x11]
   0x0000fffff7faa394:	1400000e	b	0xfffff7faa3cc
   0x0000fffff7faa398:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa39c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa3a0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa3a4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa3a8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7faa3ac:	aa1403e4	mov	x4, x20
   0x0000fffff7faa3b0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa3b4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faa3b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa3bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa3c0:	d63f0200	blr	x16
   0x0000fffff7faa3c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa3c8:	5400d900	b.eq	0xfffff7fabee8  // b.none
   0x0000fffff7faa3cc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa3d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa3d4:	540004a0	b.eq	0xfffff7faa468  // b.none
   0x0000fffff7faa3d8:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa3dc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa3e0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa3e4:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa3e8:	54000400	b.eq	0xfffff7faa468  // b.none
   0x0000fffff7faa3ec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa3f0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa3f4:	36d801d1	tbz	w17, #27, 0xfffff7faa42c
   0x0000fffff7faa3f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa3fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa400:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa404:	54000321	b.ne	0xfffff7faa468  // b.any
   0x0000fffff7faa408:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa40c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa410:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa414:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa418:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa41c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa420:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa424:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa428:	54000209	b.ls	0xfffff7faa468  // b.plast
   0x0000fffff7faa42c:	36d8008d	tbz	w13, #27, 0xfffff7faa43c
   0x0000fffff7faa430:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa434:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa438:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa43c:	36d80091	tbz	w17, #27, 0xfffff7faa44c
   0x0000fffff7faa440:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa444:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa448:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa44c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faa450:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faa454:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa458:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa45c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faa460:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faa464:	1400000e	b	0xfffff7faa49c
   0x0000fffff7faa468:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa46c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa470:	aa1303e1	mov	x1, x19
   0x0000fffff7faa474:	aa1503e2	mov	x2, x21
   0x0000fffff7faa478:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7faa47c:	aa1403e4	mov	x4, x20
   0x0000fffff7faa480:	aa1603e5	mov	x5, x22
   0x0000fffff7faa484:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa488:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa48c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa490:	d63f0200	blr	x16
   0x0000fffff7faa494:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa498:	5400d2c0	b.eq	0xfffff7fabef0  // b.none
   0x0000fffff7faa49c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa4a0:	37d806a9	tbnz	w9, #27, 0xfffff7faa574
   0x0000fffff7faa4a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa4a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa4ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa4b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa4b4:	540001c1	b.ne	0xfffff7faa4ec  // b.any
   0x0000fffff7faa4b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faa4bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa4c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa4c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa4c8:	54000121	b.ne	0xfffff7faa4ec  // b.any
   0x0000fffff7faa4cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faa4d0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faa4d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa4d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa4dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa4e0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faa4e4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faa4e8:	14000030	b	0xfffff7faa5a8
   0x0000fffff7faa4ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa4f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa4f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa4f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa4fc:	54000120	b.eq	0xfffff7faa520  // b.none
   0x0000fffff7faa500:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa504:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa508:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa50c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa510:	54000321	b.ne	0xfffff7faa574  // b.any
   0x0000fffff7faa514:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faa518:	9e620120	scvtf	d0, x9
   0x0000fffff7faa51c:	14000002	b	0xfffff7faa524
   0x0000fffff7faa520:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faa524:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faa528:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa52c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa530:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa534:	54000120	b.eq	0xfffff7faa558  // b.none
   0x0000fffff7faa538:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faa53c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa544:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa548:	54000161	b.ne	0xfffff7faa574  // b.any
   0x0000fffff7faa54c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faa550:	9e620121	scvtf	d1, x9
   0x0000fffff7faa554:	14000002	b	0xfffff7faa55c
   0x0000fffff7faa558:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faa55c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa560:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faa564:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa568:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa56c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faa570:	17ffffde	b	0xfffff7faa4e8
   0x0000fffff7faa574:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa578:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa57c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa580:	aa1503e2	mov	x2, x21
   0x0000fffff7faa584:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7faa588:	aa1403e4	mov	x4, x20
   0x0000fffff7faa58c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa590:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faa594:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa59c:	d63f0200	blr	x16
   0x0000fffff7faa5a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa5a4:	5400caa0	b.eq	0xfffff7fabef8  // b.none
   0x0000fffff7faa5a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa5ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa5b0:	540004a0	b.eq	0xfffff7faa644  // b.none
   0x0000fffff7faa5b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa5b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa5bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa5c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa5c4:	54000400	b.eq	0xfffff7faa644  // b.none
   0x0000fffff7faa5c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa5cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa5d0:	36d801d1	tbz	w17, #27, 0xfffff7faa608
   0x0000fffff7faa5d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa5d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa5dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa5e0:	54000321	b.ne	0xfffff7faa644  // b.any
   0x0000fffff7faa5e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa5e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa5ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa5f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa5f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa5f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa5fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa600:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa604:	54000209	b.ls	0xfffff7faa644  // b.plast
   0x0000fffff7faa608:	36d8008d	tbz	w13, #27, 0xfffff7faa618
   0x0000fffff7faa60c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa610:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa614:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa618:	36d80091	tbz	w17, #27, 0xfffff7faa628
   0x0000fffff7faa61c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa620:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa624:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa628:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faa62c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faa630:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa634:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa638:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faa63c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faa640:	1400000e	b	0xfffff7faa678
   0x0000fffff7faa644:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa648:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa64c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa650:	aa1503e2	mov	x2, x21
   0x0000fffff7faa654:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7faa658:	aa1403e4	mov	x4, x20
   0x0000fffff7faa65c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa660:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa664:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa668:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa66c:	d63f0200	blr	x16
   0x0000fffff7faa670:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa674:	5400c460	b.eq	0xfffff7fabf00  // b.none
   0x0000fffff7faa678:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa67c:	37d806a9	tbnz	w9, #27, 0xfffff7faa750
   0x0000fffff7faa680:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa684:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa68c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa690:	540001c1	b.ne	0xfffff7faa6c8  // b.any
   0x0000fffff7faa694:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faa698:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa69c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa6a4:	54000121	b.ne	0xfffff7faa6c8  // b.any
   0x0000fffff7faa6a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faa6ac:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faa6b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa6b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa6b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6bc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faa6c0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faa6c4:	14000030	b	0xfffff7faa784
   0x0000fffff7faa6c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa6cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa6d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa6d8:	54000120	b.eq	0xfffff7faa6fc  // b.none
   0x0000fffff7faa6dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa6e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa6e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa6ec:	54000321	b.ne	0xfffff7faa750  // b.any
   0x0000fffff7faa6f0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faa6f4:	9e620120	scvtf	d0, x9
   0x0000fffff7faa6f8:	14000002	b	0xfffff7faa700
   0x0000fffff7faa6fc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faa700:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faa704:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa708:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa70c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa710:	54000120	b.eq	0xfffff7faa734  // b.none
   0x0000fffff7faa714:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faa718:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa71c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa720:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa724:	54000161	b.ne	0xfffff7faa750  // b.any
   0x0000fffff7faa728:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faa72c:	9e620121	scvtf	d1, x9
   0x0000fffff7faa730:	14000002	b	0xfffff7faa738
   0x0000fffff7faa734:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faa738:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa73c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faa740:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa744:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa748:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faa74c:	17ffffde	b	0xfffff7faa6c4
   0x0000fffff7faa750:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa754:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa758:	aa1303e1	mov	x1, x19
   0x0000fffff7faa75c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa760:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7faa764:	aa1403e4	mov	x4, x20
   0x0000fffff7faa768:	aa1603e5	mov	x5, x22
   0x0000fffff7faa76c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faa770:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa774:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa778:	d63f0200	blr	x16
   0x0000fffff7faa77c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa780:	5400bc40	b.eq	0xfffff7fabf08  // b.none
   0x0000fffff7faa784:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa788:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa78c:	540004a0	b.eq	0xfffff7faa820  // b.none
   0x0000fffff7faa790:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa794:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa798:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa79c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa7a0:	54000400	b.eq	0xfffff7faa820  // b.none
   0x0000fffff7faa7a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa7a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa7ac:	36d801d1	tbz	w17, #27, 0xfffff7faa7e4
   0x0000fffff7faa7b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa7b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa7b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa7bc:	54000321	b.ne	0xfffff7faa820  // b.any
   0x0000fffff7faa7c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa7c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa7c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa7cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa7d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa7d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa7d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa7dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa7e0:	54000209	b.ls	0xfffff7faa820  // b.plast
   0x0000fffff7faa7e4:	36d8008d	tbz	w13, #27, 0xfffff7faa7f4
   0x0000fffff7faa7e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa7ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa7f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa7f4:	36d80091	tbz	w17, #27, 0xfffff7faa804
   0x0000fffff7faa7f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa7fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa800:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa804:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faa808:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faa80c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa810:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa814:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faa818:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faa81c:	1400000e	b	0xfffff7faa854
   0x0000fffff7faa820:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa824:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa828:	aa1303e1	mov	x1, x19
   0x0000fffff7faa82c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa830:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7faa834:	aa1403e4	mov	x4, x20
   0x0000fffff7faa838:	aa1603e5	mov	x5, x22
   0x0000fffff7faa83c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa840:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa844:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa848:	d63f0200	blr	x16
   0x0000fffff7faa84c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa850:	5400b600	b.eq	0xfffff7fabf10  // b.none
   0x0000fffff7faa854:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa858:	37d806a9	tbnz	w9, #27, 0xfffff7faa92c
   0x0000fffff7faa85c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa860:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa864:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa868:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa86c:	540001c1	b.ne	0xfffff7faa8a4  // b.any
   0x0000fffff7faa870:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faa874:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa878:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa87c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa880:	54000121	b.ne	0xfffff7faa8a4  // b.any
   0x0000fffff7faa884:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faa888:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faa88c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa890:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa898:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faa89c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faa8a0:	14000030	b	0xfffff7faa960
   0x0000fffff7faa8a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa8a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa8ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa8b4:	54000120	b.eq	0xfffff7faa8d8  // b.none
   0x0000fffff7faa8b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa8bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa8c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa8c8:	54000321	b.ne	0xfffff7faa92c  // b.any
   0x0000fffff7faa8cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faa8d0:	9e620120	scvtf	d0, x9
   0x0000fffff7faa8d4:	14000002	b	0xfffff7faa8dc
   0x0000fffff7faa8d8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faa8dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faa8e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa8e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa8ec:	54000120	b.eq	0xfffff7faa910  // b.none
   0x0000fffff7faa8f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faa8f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa900:	54000161	b.ne	0xfffff7faa92c  // b.any
   0x0000fffff7faa904:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faa908:	9e620121	scvtf	d1, x9
   0x0000fffff7faa90c:	14000002	b	0xfffff7faa914
   0x0000fffff7faa910:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faa914:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa918:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faa91c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa924:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faa928:	17ffffde	b	0xfffff7faa8a0
   0x0000fffff7faa92c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa930:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa934:	aa1303e1	mov	x1, x19
   0x0000fffff7faa938:	aa1503e2	mov	x2, x21
   0x0000fffff7faa93c:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7faa940:	aa1403e4	mov	x4, x20
   0x0000fffff7faa944:	aa1603e5	mov	x5, x22
   0x0000fffff7faa948:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faa94c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa950:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa954:	d63f0200	blr	x16
   0x0000fffff7faa958:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa95c:	5400ade0	b.eq	0xfffff7fabf18  // b.none
   0x0000fffff7faa960:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa964:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa968:	540004a0	b.eq	0xfffff7faa9fc  // b.none
   0x0000fffff7faa96c:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa970:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa974:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa978:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa97c:	54000400	b.eq	0xfffff7faa9fc  // b.none
   0x0000fffff7faa980:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa984:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa988:	36d801d1	tbz	w17, #27, 0xfffff7faa9c0
   0x0000fffff7faa98c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa990:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa994:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa998:	54000321	b.ne	0xfffff7faa9fc  // b.any
   0x0000fffff7faa99c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa9a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa9a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa9a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa9ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa9b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa9b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa9b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa9bc:	54000209	b.ls	0xfffff7faa9fc  // b.plast
   0x0000fffff7faa9c0:	36d8008d	tbz	w13, #27, 0xfffff7faa9d0
   0x0000fffff7faa9c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa9c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa9cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa9d0:	36d80091	tbz	w17, #27, 0xfffff7faa9e0
   0x0000fffff7faa9d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa9d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa9dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa9e0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faa9e4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faa9e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa9ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa9f0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faa9f4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faa9f8:	1400000e	b	0xfffff7faaa30
   0x0000fffff7faa9fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faaa00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaa04:	aa1303e1	mov	x1, x19
   0x0000fffff7faaa08:	aa1503e2	mov	x2, x21
   0x0000fffff7faaa0c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7faaa10:	aa1403e4	mov	x4, x20
   0x0000fffff7faaa14:	aa1603e5	mov	x5, x22
   0x0000fffff7faaa18:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faaa1c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faaa20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaa24:	d63f0200	blr	x16
   0x0000fffff7faaa28:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaa2c:	5400a7a0	b.eq	0xfffff7fabf20  // b.none
   0x0000fffff7faaa30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faaa34:	37d806a9	tbnz	w9, #27, 0xfffff7faab08
   0x0000fffff7faaa38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faaa3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaa40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaa44:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaa48:	540001c1	b.ne	0xfffff7faaa80  // b.any
   0x0000fffff7faaa4c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faaa50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaa54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaa58:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaa5c:	54000121	b.ne	0xfffff7faaa80  // b.any
   0x0000fffff7faaa60:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faaa64:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faaa68:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faaa6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaa70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaa74:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faaa78:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faaa7c:	14000030	b	0xfffff7faab3c
   0x0000fffff7faaa80:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faaa84:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faaa88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaa8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaa90:	54000120	b.eq	0xfffff7faaab4  // b.none
   0x0000fffff7faaa94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faaa98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaa9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaaa0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaaa4:	54000321	b.ne	0xfffff7faab08  // b.any
   0x0000fffff7faaaa8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faaaac:	9e620120	scvtf	d0, x9
   0x0000fffff7faaab0:	14000002	b	0xfffff7faaab8
   0x0000fffff7faaab4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faaab8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faaabc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faaac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaac8:	54000120	b.eq	0xfffff7faaaec  // b.none
   0x0000fffff7faaacc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faaad0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaad8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaadc:	54000161	b.ne	0xfffff7faab08  // b.any
   0x0000fffff7faaae0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faaae4:	9e620121	scvtf	d1, x9
   0x0000fffff7faaae8:	14000002	b	0xfffff7faaaf0
   0x0000fffff7faaaec:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faaaf0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faaaf4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faaaf8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faaafc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab00:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faab04:	17ffffde	b	0xfffff7faaa7c
   0x0000fffff7faab08:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faab0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faab10:	aa1303e1	mov	x1, x19
   0x0000fffff7faab14:	aa1503e2	mov	x2, x21
   0x0000fffff7faab18:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7faab1c:	aa1403e4	mov	x4, x20
   0x0000fffff7faab20:	aa1603e5	mov	x5, x22
   0x0000fffff7faab24:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faab28:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faab2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faab30:	d63f0200	blr	x16
   0x0000fffff7faab34:	f100001f	cmp	x0, #0x0
   0x0000fffff7faab38:	54009f80	b.eq	0xfffff7fabf28  // b.none
   0x0000fffff7faab3c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faab40:	f100017f	cmp	x11, #0x0
   0x0000fffff7faab44:	540004a0	b.eq	0xfffff7faabd8  // b.none
   0x0000fffff7faab48:	b940016d	ldr	w13, [x11]
   0x0000fffff7faab4c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faab50:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faab54:	eb0901bf	cmp	x13, x9
   0x0000fffff7faab58:	54000400	b.eq	0xfffff7faabd8  // b.none
   0x0000fffff7faab5c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faab60:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faab64:	36d801d1	tbz	w17, #27, 0xfffff7faab9c
   0x0000fffff7faab68:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faab6c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faab70:	f100013f	cmp	x9, #0x0
   0x0000fffff7faab74:	54000321	b.ne	0xfffff7faabd8  // b.any
   0x0000fffff7faab78:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faab7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faab80:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faab84:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faab88:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faab8c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faab90:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faab94:	f100055f	cmp	x10, #0x1
   0x0000fffff7faab98:	54000209	b.ls	0xfffff7faabd8  // b.plast
   0x0000fffff7faab9c:	36d8008d	tbz	w13, #27, 0xfffff7faabac
   0x0000fffff7faaba0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faaba4:	91000529	add	x9, x9, #0x1
   0x0000fffff7faaba8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faabac:	36d80091	tbz	w17, #27, 0xfffff7faabbc
   0x0000fffff7faabb0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faabb4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faabb8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faabbc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faabc0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faabc4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faabc8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faabcc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faabd0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faabd4:	1400000e	b	0xfffff7faac0c
   0x0000fffff7faabd8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faabdc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faabe0:	aa1303e1	mov	x1, x19
   0x0000fffff7faabe4:	aa1503e2	mov	x2, x21
   0x0000fffff7faabe8:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7faabec:	aa1403e4	mov	x4, x20
   0x0000fffff7faabf0:	aa1603e5	mov	x5, x22
   0x0000fffff7faabf4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faabf8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faabfc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faac00:	d63f0200	blr	x16
   0x0000fffff7faac04:	f100001f	cmp	x0, #0x0
   0x0000fffff7faac08:	54009940	b.eq	0xfffff7fabf30  // b.none
   0x0000fffff7faac0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faac10:	37d806a9	tbnz	w9, #27, 0xfffff7faace4
   0x0000fffff7faac14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faac18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac20:	eb0a013f	cmp	x9, x10
   0x0000fffff7faac24:	540001c1	b.ne	0xfffff7faac5c  // b.any
   0x0000fffff7faac28:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faac2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac34:	eb0a013f	cmp	x9, x10
   0x0000fffff7faac38:	54000121	b.ne	0xfffff7faac5c  // b.any
   0x0000fffff7faac3c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faac40:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faac44:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faac48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac50:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faac54:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faac58:	14000030	b	0xfffff7faad18
   0x0000fffff7faac5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faac60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faac64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac68:	eb0a013f	cmp	x9, x10
   0x0000fffff7faac6c:	54000120	b.eq	0xfffff7faac90  // b.none
   0x0000fffff7faac70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faac74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faac80:	54000321	b.ne	0xfffff7faace4  // b.any
   0x0000fffff7faac84:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faac88:	9e620120	scvtf	d0, x9
   0x0000fffff7faac8c:	14000002	b	0xfffff7faac94
   0x0000fffff7faac90:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faac94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faac98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faac9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaca0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaca4:	54000120	b.eq	0xfffff7faacc8  // b.none
   0x0000fffff7faaca8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faacac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faacb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faacb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faacb8:	54000161	b.ne	0xfffff7faace4  // b.any
   0x0000fffff7faacbc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faacc0:	9e620121	scvtf	d1, x9
   0x0000fffff7faacc4:	14000002	b	0xfffff7faaccc
   0x0000fffff7faacc8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faaccc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faacd0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faacd4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faacd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faacdc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faace0:	17ffffde	b	0xfffff7faac58
   0x0000fffff7faace4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faace8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faacec:	aa1303e1	mov	x1, x19
   0x0000fffff7faacf0:	aa1503e2	mov	x2, x21
   0x0000fffff7faacf4:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7faacf8:	aa1403e4	mov	x4, x20
   0x0000fffff7faacfc:	aa1603e5	mov	x5, x22
   0x0000fffff7faad00:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faad04:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faad08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faad0c:	d63f0200	blr	x16
   0x0000fffff7faad10:	f100001f	cmp	x0, #0x0
   0x0000fffff7faad14:	54009120	b.eq	0xfffff7fabf38  // b.none
   0x0000fffff7faad18:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faad1c:	f100017f	cmp	x11, #0x0
   0x0000fffff7faad20:	540004a0	b.eq	0xfffff7faadb4  // b.none
   0x0000fffff7faad24:	b940016d	ldr	w13, [x11]
   0x0000fffff7faad28:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faad2c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faad30:	eb0901bf	cmp	x13, x9
   0x0000fffff7faad34:	54000400	b.eq	0xfffff7faadb4  // b.none
   0x0000fffff7faad38:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faad3c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faad40:	36d801d1	tbz	w17, #27, 0xfffff7faad78
   0x0000fffff7faad44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faad48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faad4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faad50:	54000321	b.ne	0xfffff7faadb4  // b.any
   0x0000fffff7faad54:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faad58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faad5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faad60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faad64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faad68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faad6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faad70:	f100055f	cmp	x10, #0x1
   0x0000fffff7faad74:	54000209	b.ls	0xfffff7faadb4  // b.plast
   0x0000fffff7faad78:	36d8008d	tbz	w13, #27, 0xfffff7faad88
   0x0000fffff7faad7c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faad80:	91000529	add	x9, x9, #0x1
   0x0000fffff7faad84:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faad88:	36d80091	tbz	w17, #27, 0xfffff7faad98
   0x0000fffff7faad8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faad90:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faad94:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faad98:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faad9c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faada0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faada4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faada8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faadac:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faadb0:	1400000e	b	0xfffff7faade8
   0x0000fffff7faadb4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faadb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faadbc:	aa1303e1	mov	x1, x19
   0x0000fffff7faadc0:	aa1503e2	mov	x2, x21
   0x0000fffff7faadc4:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7faadc8:	aa1403e4	mov	x4, x20
   0x0000fffff7faadcc:	aa1603e5	mov	x5, x22
   0x0000fffff7faadd0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faadd4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faadd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaddc:	d63f0200	blr	x16
   0x0000fffff7faade0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faade4:	54008ae0	b.eq	0xfffff7fabf40  // b.none
   0x0000fffff7faade8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faadec:	37d806a9	tbnz	w9, #27, 0xfffff7faaec0
   0x0000fffff7faadf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faadf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faadf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faadfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faae00:	540001c1	b.ne	0xfffff7faae38  // b.any
   0x0000fffff7faae04:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faae08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faae0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faae10:	eb0a013f	cmp	x9, x10
   0x0000fffff7faae14:	54000121	b.ne	0xfffff7faae38  // b.any
   0x0000fffff7faae18:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faae1c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faae20:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faae24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faae28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faae2c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faae30:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faae34:	14000030	b	0xfffff7faaef4
   0x0000fffff7faae38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faae3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faae40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faae44:	eb0a013f	cmp	x9, x10
   0x0000fffff7faae48:	54000120	b.eq	0xfffff7faae6c  // b.none
   0x0000fffff7faae4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faae50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faae54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faae58:	eb0a013f	cmp	x9, x10
   0x0000fffff7faae5c:	54000321	b.ne	0xfffff7faaec0  // b.any
   0x0000fffff7faae60:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faae64:	9e620120	scvtf	d0, x9
   0x0000fffff7faae68:	14000002	b	0xfffff7faae70
   0x0000fffff7faae6c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faae70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faae74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faae78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faae7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faae80:	54000120	b.eq	0xfffff7faaea4  // b.none
   0x0000fffff7faae84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faae88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faae8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faae90:	eb0a013f	cmp	x9, x10
   0x0000fffff7faae94:	54000161	b.ne	0xfffff7faaec0  // b.any
   0x0000fffff7faae98:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faae9c:	9e620121	scvtf	d1, x9
   0x0000fffff7faaea0:	14000002	b	0xfffff7faaea8
   0x0000fffff7faaea4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faaea8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faaeac:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faaeb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faaeb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaeb8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faaebc:	17ffffde	b	0xfffff7faae34
   0x0000fffff7faaec0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faaec4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaec8:	aa1303e1	mov	x1, x19
   0x0000fffff7faaecc:	aa1503e2	mov	x2, x21
   0x0000fffff7faaed0:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7faaed4:	aa1403e4	mov	x4, x20
   0x0000fffff7faaed8:	aa1603e5	mov	x5, x22
   0x0000fffff7faaedc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faaee0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faaee4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaee8:	d63f0200	blr	x16
   0x0000fffff7faaeec:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaef0:	540082c0	b.eq	0xfffff7fabf48  // b.none
   0x0000fffff7faaef4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faaef8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faaefc:	540004a0	b.eq	0xfffff7faaf90  // b.none
   0x0000fffff7faaf00:	b940016d	ldr	w13, [x11]
   0x0000fffff7faaf04:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faaf08:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faaf0c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faaf10:	54000400	b.eq	0xfffff7faaf90  // b.none
   0x0000fffff7faaf14:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faaf18:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faaf1c:	36d801d1	tbz	w17, #27, 0xfffff7faaf54
   0x0000fffff7faaf20:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faaf24:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faaf28:	f100013f	cmp	x9, #0x0
   0x0000fffff7faaf2c:	54000321	b.ne	0xfffff7faaf90  // b.any
   0x0000fffff7faaf30:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faaf34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaf38:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faaf3c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faaf40:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faaf44:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faaf48:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faaf4c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faaf50:	54000209	b.ls	0xfffff7faaf90  // b.plast
   0x0000fffff7faaf54:	36d8008d	tbz	w13, #27, 0xfffff7faaf64
   0x0000fffff7faaf58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faaf5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faaf60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faaf64:	36d80091	tbz	w17, #27, 0xfffff7faaf74
   0x0000fffff7faaf68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaf6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faaf70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faaf74:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faaf78:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faaf7c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faaf80:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faaf84:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faaf88:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faaf8c:	1400000e	b	0xfffff7faafc4
   0x0000fffff7faaf90:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faaf94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaf98:	aa1303e1	mov	x1, x19
   0x0000fffff7faaf9c:	aa1503e2	mov	x2, x21
   0x0000fffff7faafa0:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7faafa4:	aa1403e4	mov	x4, x20
   0x0000fffff7faafa8:	aa1603e5	mov	x5, x22
   0x0000fffff7faafac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faafb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faafb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faafb8:	d63f0200	blr	x16
   0x0000fffff7faafbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7faafc0:	54007c80	b.eq	0xfffff7fabf50  // b.none
   0x0000fffff7faafc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faafc8:	37d806a9	tbnz	w9, #27, 0xfffff7fab09c
   0x0000fffff7faafcc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faafd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faafd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faafd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faafdc:	540001c1	b.ne	0xfffff7fab014  // b.any
   0x0000fffff7faafe0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faafe4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faafe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faafec:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaff0:	54000121	b.ne	0xfffff7fab014  // b.any
   0x0000fffff7faaff4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faaff8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faaffc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab000:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab008:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fab00c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab010:	14000030	b	0xfffff7fab0d0
   0x0000fffff7fab014:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab018:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab01c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab020:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab024:	54000120	b.eq	0xfffff7fab048  // b.none
   0x0000fffff7fab028:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab02c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab030:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab034:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab038:	54000321	b.ne	0xfffff7fab09c  // b.any
   0x0000fffff7fab03c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab040:	9e620120	scvtf	d0, x9
   0x0000fffff7fab044:	14000002	b	0xfffff7fab04c
   0x0000fffff7fab048:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fab04c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab050:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab054:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab058:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab05c:	54000120	b.eq	0xfffff7fab080  // b.none
   0x0000fffff7fab060:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab064:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab06c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab070:	54000161	b.ne	0xfffff7fab09c  // b.any
   0x0000fffff7fab074:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fab078:	9e620121	scvtf	d1, x9
   0x0000fffff7fab07c:	14000002	b	0xfffff7fab084
   0x0000fffff7fab080:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fab084:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab088:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fab08c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab090:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab094:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab098:	17ffffde	b	0xfffff7fab010
   0x0000fffff7fab09c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab0a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab0a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fab0a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fab0ac:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fab0b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fab0b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fab0b8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab0bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab0c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab0c4:	d63f0200	blr	x16
   0x0000fffff7fab0c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab0cc:	54007460	b.eq	0xfffff7fabf58  // b.none
   0x0000fffff7fab0d0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab0d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab0d8:	540004a0	b.eq	0xfffff7fab16c  // b.none
   0x0000fffff7fab0dc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab0e0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab0e4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab0e8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab0ec:	54000400	b.eq	0xfffff7fab16c  // b.none
   0x0000fffff7fab0f0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab0f4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab0f8:	36d801d1	tbz	w17, #27, 0xfffff7fab130
   0x0000fffff7fab0fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab104:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab108:	54000321	b.ne	0xfffff7fab16c  // b.any
   0x0000fffff7fab10c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab11c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab128:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab12c:	54000209	b.ls	0xfffff7fab16c  // b.plast
   0x0000fffff7fab130:	36d8008d	tbz	w13, #27, 0xfffff7fab140
   0x0000fffff7fab134:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab138:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab13c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab140:	36d80091	tbz	w17, #27, 0xfffff7fab150
   0x0000fffff7fab144:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab148:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab14c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab150:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fab154:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fab158:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab15c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab160:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fab164:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fab168:	1400000e	b	0xfffff7fab1a0
   0x0000fffff7fab16c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab170:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab174:	aa1303e1	mov	x1, x19
   0x0000fffff7fab178:	aa1503e2	mov	x2, x21
   0x0000fffff7fab17c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fab180:	aa1403e4	mov	x4, x20
   0x0000fffff7fab184:	aa1603e5	mov	x5, x22
   0x0000fffff7fab188:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab18c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab190:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab194:	d63f0200	blr	x16
   0x0000fffff7fab198:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab19c:	54006e20	b.eq	0xfffff7fabf60  // b.none
   0x0000fffff7fab1a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab1a4:	37d806a9	tbnz	w9, #27, 0xfffff7fab278
   0x0000fffff7fab1a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab1ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab1b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab1b8:	540001c1	b.ne	0xfffff7fab1f0  // b.any
   0x0000fffff7fab1bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab1c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab1c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab1cc:	54000121	b.ne	0xfffff7fab1f0  // b.any
   0x0000fffff7fab1d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab1d4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fab1d8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab1dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab1e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1e4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fab1e8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab1ec:	14000030	b	0xfffff7fab2ac
   0x0000fffff7fab1f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab1f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab1f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab200:	54000120	b.eq	0xfffff7fab224  // b.none
   0x0000fffff7fab204:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab208:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab20c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab210:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab214:	54000321	b.ne	0xfffff7fab278  // b.any
   0x0000fffff7fab218:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab21c:	9e620120	scvtf	d0, x9
   0x0000fffff7fab220:	14000002	b	0xfffff7fab228
   0x0000fffff7fab224:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fab228:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab22c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab230:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab234:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab238:	54000120	b.eq	0xfffff7fab25c  // b.none
   0x0000fffff7fab23c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab240:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab248:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab24c:	54000161	b.ne	0xfffff7fab278  // b.any
   0x0000fffff7fab250:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fab254:	9e620121	scvtf	d1, x9
   0x0000fffff7fab258:	14000002	b	0xfffff7fab260
   0x0000fffff7fab25c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fab260:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab264:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fab268:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab26c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab270:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab274:	17ffffde	b	0xfffff7fab1ec
   0x0000fffff7fab278:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab27c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab280:	aa1303e1	mov	x1, x19
   0x0000fffff7fab284:	aa1503e2	mov	x2, x21
   0x0000fffff7fab288:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fab28c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab290:	aa1603e5	mov	x5, x22
   0x0000fffff7fab294:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab298:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab29c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab2a0:	d63f0200	blr	x16
   0x0000fffff7fab2a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab2a8:	54006600	b.eq	0xfffff7fabf68  // b.none
   0x0000fffff7fab2ac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab2b0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab2b4:	540004a0	b.eq	0xfffff7fab348  // b.none
   0x0000fffff7fab2b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab2bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab2c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab2c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab2c8:	54000400	b.eq	0xfffff7fab348  // b.none
   0x0000fffff7fab2cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab2d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab2d4:	36d801d1	tbz	w17, #27, 0xfffff7fab30c
   0x0000fffff7fab2d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab2dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab2e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab2e4:	54000321	b.ne	0xfffff7fab348  // b.any
   0x0000fffff7fab2e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab2ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab2f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab2f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab2f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab2fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab300:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab304:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab308:	54000209	b.ls	0xfffff7fab348  // b.plast
   0x0000fffff7fab30c:	36d8008d	tbz	w13, #27, 0xfffff7fab31c
   0x0000fffff7fab310:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab314:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab318:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab31c:	36d80091	tbz	w17, #27, 0xfffff7fab32c
   0x0000fffff7fab320:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab324:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab328:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab32c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fab330:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fab334:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab338:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab33c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fab340:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fab344:	1400000e	b	0xfffff7fab37c
   0x0000fffff7fab348:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab34c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab350:	aa1303e1	mov	x1, x19
   0x0000fffff7fab354:	aa1503e2	mov	x2, x21
   0x0000fffff7fab358:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fab35c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab360:	aa1603e5	mov	x5, x22
   0x0000fffff7fab364:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab368:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab36c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab370:	d63f0200	blr	x16
   0x0000fffff7fab374:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab378:	54005fc0	b.eq	0xfffff7fabf70  // b.none
   0x0000fffff7fab37c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab380:	37d806a9	tbnz	w9, #27, 0xfffff7fab454
   0x0000fffff7fab384:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab388:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab38c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab390:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab394:	540001c1	b.ne	0xfffff7fab3cc  // b.any
   0x0000fffff7fab398:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab39c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab3a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab3a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab3a8:	54000121	b.ne	0xfffff7fab3cc  // b.any
   0x0000fffff7fab3ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab3b0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fab3b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab3b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab3bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab3c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fab3c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab3c8:	14000030	b	0xfffff7fab488
   0x0000fffff7fab3cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab3d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab3d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab3d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab3dc:	54000120	b.eq	0xfffff7fab400  // b.none
   0x0000fffff7fab3e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab3e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab3e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab3ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab3f0:	54000321	b.ne	0xfffff7fab454  // b.any
   0x0000fffff7fab3f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab3f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fab3fc:	14000002	b	0xfffff7fab404
   0x0000fffff7fab400:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fab404:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab408:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab40c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab410:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab414:	54000120	b.eq	0xfffff7fab438  // b.none
   0x0000fffff7fab418:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab41c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab424:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab428:	54000161	b.ne	0xfffff7fab454  // b.any
   0x0000fffff7fab42c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fab430:	9e620121	scvtf	d1, x9
   0x0000fffff7fab434:	14000002	b	0xfffff7fab43c
   0x0000fffff7fab438:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fab43c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab440:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fab444:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab448:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab44c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab450:	17ffffde	b	0xfffff7fab3c8
   0x0000fffff7fab454:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab45c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab460:	aa1503e2	mov	x2, x21
   0x0000fffff7fab464:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fab468:	aa1403e4	mov	x4, x20
   0x0000fffff7fab46c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab470:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab474:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab47c:	d63f0200	blr	x16
   0x0000fffff7fab480:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab484:	540057a0	b.eq	0xfffff7fabf78  // b.none
   0x0000fffff7fab488:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab48c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab490:	540004a0	b.eq	0xfffff7fab524  // b.none
   0x0000fffff7fab494:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab498:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab49c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab4a0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab4a4:	54000400	b.eq	0xfffff7fab524  // b.none
   0x0000fffff7fab4a8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab4ac:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab4b0:	36d801d1	tbz	w17, #27, 0xfffff7fab4e8
   0x0000fffff7fab4b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab4b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab4bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab4c0:	54000321	b.ne	0xfffff7fab524  // b.any
   0x0000fffff7fab4c4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab4c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab4cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab4d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab4d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab4d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab4dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab4e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab4e4:	54000209	b.ls	0xfffff7fab524  // b.plast
   0x0000fffff7fab4e8:	36d8008d	tbz	w13, #27, 0xfffff7fab4f8
   0x0000fffff7fab4ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab4f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab4f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab4f8:	36d80091	tbz	w17, #27, 0xfffff7fab508
   0x0000fffff7fab4fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab500:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab504:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab508:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fab50c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fab510:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab514:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab518:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fab51c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fab520:	1400000e	b	0xfffff7fab558
   0x0000fffff7fab524:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab528:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab52c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab530:	aa1503e2	mov	x2, x21
   0x0000fffff7fab534:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fab538:	aa1403e4	mov	x4, x20
   0x0000fffff7fab53c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab540:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab544:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab548:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab54c:	d63f0200	blr	x16
   0x0000fffff7fab550:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab554:	54005160	b.eq	0xfffff7fabf80  // b.none
   0x0000fffff7fab558:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab55c:	37d806a9	tbnz	w9, #27, 0xfffff7fab630
   0x0000fffff7fab560:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab564:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab568:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab56c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab570:	540001c1	b.ne	0xfffff7fab5a8  // b.any
   0x0000fffff7fab574:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab578:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab57c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab580:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab584:	54000121	b.ne	0xfffff7fab5a8  // b.any
   0x0000fffff7fab588:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab58c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fab590:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab594:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab598:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab59c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fab5a0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab5a4:	14000030	b	0xfffff7fab664
   0x0000fffff7fab5a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab5ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab5b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab5b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab5b8:	54000120	b.eq	0xfffff7fab5dc  // b.none
   0x0000fffff7fab5bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab5c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab5c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab5c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab5cc:	54000321	b.ne	0xfffff7fab630  // b.any
   0x0000fffff7fab5d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab5d4:	9e620120	scvtf	d0, x9
   0x0000fffff7fab5d8:	14000002	b	0xfffff7fab5e0
   0x0000fffff7fab5dc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fab5e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab5e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab5e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab5ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab5f0:	54000120	b.eq	0xfffff7fab614  // b.none
   0x0000fffff7fab5f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab5f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab5fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab600:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab604:	54000161	b.ne	0xfffff7fab630  // b.any
   0x0000fffff7fab608:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fab60c:	9e620121	scvtf	d1, x9
   0x0000fffff7fab610:	14000002	b	0xfffff7fab618
   0x0000fffff7fab614:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fab618:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab61c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fab620:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab628:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab62c:	17ffffde	b	0xfffff7fab5a4
   0x0000fffff7fab630:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab634:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab638:	aa1303e1	mov	x1, x19
   0x0000fffff7fab63c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab640:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fab644:	aa1403e4	mov	x4, x20
   0x0000fffff7fab648:	aa1603e5	mov	x5, x22
   0x0000fffff7fab64c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab650:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab654:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab658:	d63f0200	blr	x16
   0x0000fffff7fab65c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab660:	54004940	b.eq	0xfffff7fabf88  // b.none
   0x0000fffff7fab664:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab668:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab66c:	540004a0	b.eq	0xfffff7fab700  // b.none
   0x0000fffff7fab670:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab674:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab678:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab67c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab680:	54000400	b.eq	0xfffff7fab700  // b.none
   0x0000fffff7fab684:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab688:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab68c:	36d801d1	tbz	w17, #27, 0xfffff7fab6c4
   0x0000fffff7fab690:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab694:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab698:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab69c:	54000321	b.ne	0xfffff7fab700  // b.any
   0x0000fffff7fab6a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab6a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab6a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab6ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab6b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab6b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab6b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab6bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab6c0:	54000209	b.ls	0xfffff7fab700  // b.plast
   0x0000fffff7fab6c4:	36d8008d	tbz	w13, #27, 0xfffff7fab6d4
   0x0000fffff7fab6c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab6cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab6d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab6d4:	36d80091	tbz	w17, #27, 0xfffff7fab6e4
   0x0000fffff7fab6d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab6dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab6e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab6e4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fab6e8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fab6ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab6f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab6f4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fab6f8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fab6fc:	1400000e	b	0xfffff7fab734
   0x0000fffff7fab700:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab708:	aa1303e1	mov	x1, x19
   0x0000fffff7fab70c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab710:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fab714:	aa1403e4	mov	x4, x20
   0x0000fffff7fab718:	aa1603e5	mov	x5, x22
   0x0000fffff7fab71c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab720:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab728:	d63f0200	blr	x16
   0x0000fffff7fab72c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab730:	54004300	b.eq	0xfffff7fabf90  // b.none
   0x0000fffff7fab734:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab738:	37d806a9	tbnz	w9, #27, 0xfffff7fab80c
   0x0000fffff7fab73c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab740:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab744:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab748:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab74c:	540001c1	b.ne	0xfffff7fab784  // b.any
   0x0000fffff7fab750:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab754:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab758:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab75c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab760:	54000121	b.ne	0xfffff7fab784  // b.any
   0x0000fffff7fab764:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab768:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fab76c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab770:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab774:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab778:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fab77c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab780:	14000030	b	0xfffff7fab840
   0x0000fffff7fab784:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab788:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab78c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab790:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab794:	54000120	b.eq	0xfffff7fab7b8  // b.none
   0x0000fffff7fab798:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab79c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab7a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab7a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab7a8:	54000321	b.ne	0xfffff7fab80c  // b.any
   0x0000fffff7fab7ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab7b0:	9e620120	scvtf	d0, x9
   0x0000fffff7fab7b4:	14000002	b	0xfffff7fab7bc
   0x0000fffff7fab7b8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fab7bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab7c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab7c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab7c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab7cc:	54000120	b.eq	0xfffff7fab7f0  // b.none
   0x0000fffff7fab7d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab7d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab7d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab7dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab7e0:	54000161	b.ne	0xfffff7fab80c  // b.any
   0x0000fffff7fab7e4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fab7e8:	9e620121	scvtf	d1, x9
   0x0000fffff7fab7ec:	14000002	b	0xfffff7fab7f4
   0x0000fffff7fab7f0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fab7f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab7f8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fab7fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab800:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab804:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab808:	17ffffde	b	0xfffff7fab780
   0x0000fffff7fab80c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab810:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab814:	aa1303e1	mov	x1, x19
   0x0000fffff7fab818:	aa1503e2	mov	x2, x21
   0x0000fffff7fab81c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fab820:	aa1403e4	mov	x4, x20
   0x0000fffff7fab824:	aa1603e5	mov	x5, x22
   0x0000fffff7fab828:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab82c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab830:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab834:	d63f0200	blr	x16
   0x0000fffff7fab838:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab83c:	54003ae0	b.eq	0xfffff7fabf98  // b.none
   0x0000fffff7fab840:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab844:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab848:	540004a0	b.eq	0xfffff7fab8dc  // b.none
   0x0000fffff7fab84c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab850:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab854:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab858:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab85c:	54000400	b.eq	0xfffff7fab8dc  // b.none
   0x0000fffff7fab860:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab864:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab868:	36d801d1	tbz	w17, #27, 0xfffff7fab8a0
   0x0000fffff7fab86c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab870:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab874:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab878:	54000321	b.ne	0xfffff7fab8dc  // b.any
   0x0000fffff7fab87c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab880:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab884:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab888:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab88c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab890:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab894:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab898:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab89c:	54000209	b.ls	0xfffff7fab8dc  // b.plast
   0x0000fffff7fab8a0:	36d8008d	tbz	w13, #27, 0xfffff7fab8b0
   0x0000fffff7fab8a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab8a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab8ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab8b0:	36d80091	tbz	w17, #27, 0xfffff7fab8c0
   0x0000fffff7fab8b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab8b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab8bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab8c0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fab8c4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fab8c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab8cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab8d0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fab8d4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fab8d8:	1400000e	b	0xfffff7fab910
   0x0000fffff7fab8dc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab8e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab8e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fab8e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fab8ec:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fab8f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fab8f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fab8f8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab8fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab900:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab904:	d63f0200	blr	x16
   0x0000fffff7fab908:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab90c:	540034a0	b.eq	0xfffff7fabfa0  // b.none
   0x0000fffff7fab910:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab914:	37d806a9	tbnz	w9, #27, 0xfffff7fab9e8
   0x0000fffff7fab918:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab91c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab928:	540001c1	b.ne	0xfffff7fab960  // b.any
   0x0000fffff7fab92c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab930:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab938:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab93c:	54000121	b.ne	0xfffff7fab960  // b.any
   0x0000fffff7fab940:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab944:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fab948:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab94c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab954:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fab958:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab95c:	14000030	b	0xfffff7faba1c
   0x0000fffff7fab960:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab964:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab96c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab970:	54000120	b.eq	0xfffff7fab994  // b.none
   0x0000fffff7fab974:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab97c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab980:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab984:	54000321	b.ne	0xfffff7fab9e8  // b.any
   0x0000fffff7fab988:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab98c:	9e620120	scvtf	d0, x9
   0x0000fffff7fab990:	14000002	b	0xfffff7fab998
   0x0000fffff7fab994:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fab998:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab99c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab9a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab9a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab9a8:	54000120	b.eq	0xfffff7fab9cc  // b.none
   0x0000fffff7fab9ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fab9b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab9b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab9b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab9bc:	54000161	b.ne	0xfffff7fab9e8  // b.any
   0x0000fffff7fab9c0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fab9c4:	9e620121	scvtf	d1, x9
   0x0000fffff7fab9c8:	14000002	b	0xfffff7fab9d0
   0x0000fffff7fab9cc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fab9d0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab9d4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fab9d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab9dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab9e0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fab9e4:	17ffffde	b	0xfffff7fab95c
   0x0000fffff7fab9e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab9ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab9f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fab9f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fab9f8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fab9fc:	aa1403e4	mov	x4, x20
   0x0000fffff7faba00:	aa1603e5	mov	x5, x22
   0x0000fffff7faba04:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faba08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faba0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faba10:	d63f0200	blr	x16
   0x0000fffff7faba14:	f100001f	cmp	x0, #0x0
   0x0000fffff7faba18:	54002c80	b.eq	0xfffff7fabfa8  // b.none
   0x0000fffff7faba1c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faba20:	f100017f	cmp	x11, #0x0
   0x0000fffff7faba24:	540004a0	b.eq	0xfffff7fabab8  // b.none
   0x0000fffff7faba28:	b940016d	ldr	w13, [x11]
   0x0000fffff7faba2c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faba30:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faba34:	eb0901bf	cmp	x13, x9
   0x0000fffff7faba38:	54000400	b.eq	0xfffff7fabab8  // b.none
   0x0000fffff7faba3c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faba40:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faba44:	36d801d1	tbz	w17, #27, 0xfffff7faba7c
   0x0000fffff7faba48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faba4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faba50:	f100013f	cmp	x9, #0x0
   0x0000fffff7faba54:	54000321	b.ne	0xfffff7fabab8  // b.any
   0x0000fffff7faba58:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faba5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faba60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faba64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faba68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faba6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faba70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faba74:	f100055f	cmp	x10, #0x1
   0x0000fffff7faba78:	54000209	b.ls	0xfffff7fabab8  // b.plast
   0x0000fffff7faba7c:	36d8008d	tbz	w13, #27, 0xfffff7faba8c
   0x0000fffff7faba80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faba84:	91000529	add	x9, x9, #0x1
   0x0000fffff7faba88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faba8c:	36d80091	tbz	w17, #27, 0xfffff7faba9c
   0x0000fffff7faba90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faba94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faba98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faba9c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fabaa0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fabaa4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fabaa8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fabaac:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fabab0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fabab4:	1400000e	b	0xfffff7fabaec
   0x0000fffff7fabab8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fababc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabac0:	aa1303e1	mov	x1, x19
   0x0000fffff7fabac4:	aa1503e2	mov	x2, x21
   0x0000fffff7fabac8:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fabacc:	aa1403e4	mov	x4, x20
   0x0000fffff7fabad0:	aa1603e5	mov	x5, x22
   0x0000fffff7fabad4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fabad8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabadc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabae0:	d63f0200	blr	x16
   0x0000fffff7fabae4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabae8:	54002640	b.eq	0xfffff7fabfb0  // b.none
   0x0000fffff7fabaec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fabaf0:	37d806a9	tbnz	w9, #27, 0xfffff7fabbc4
   0x0000fffff7fabaf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fabaf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabafc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb04:	540001c1	b.ne	0xfffff7fabb3c  // b.any
   0x0000fffff7fabb08:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fabb0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabb10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb18:	54000121	b.ne	0xfffff7fabb3c  // b.any
   0x0000fffff7fabb1c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fabb20:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fabb24:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fabb28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabb2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb30:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fabb34:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fabb38:	14000030	b	0xfffff7fabbf8
   0x0000fffff7fabb3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fabb40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabb44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb4c:	54000120	b.eq	0xfffff7fabb70  // b.none
   0x0000fffff7fabb50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fabb54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabb58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb60:	54000321	b.ne	0xfffff7fabbc4  // b.any
   0x0000fffff7fabb64:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fabb68:	9e620120	scvtf	d0, x9
   0x0000fffff7fabb6c:	14000002	b	0xfffff7fabb74
   0x0000fffff7fabb70:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fabb74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fabb78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabb7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb84:	54000120	b.eq	0xfffff7fabba8  // b.none
   0x0000fffff7fabb88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fabb8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabb90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb98:	54000161	b.ne	0xfffff7fabbc4  // b.any
   0x0000fffff7fabb9c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fabba0:	9e620121	scvtf	d1, x9
   0x0000fffff7fabba4:	14000002	b	0xfffff7fabbac
   0x0000fffff7fabba8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fabbac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fabbb0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fabbb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabbb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabbbc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fabbc0:	17ffffde	b	0xfffff7fabb38
   0x0000fffff7fabbc4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabbc8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabbcc:	aa1303e1	mov	x1, x19
   0x0000fffff7fabbd0:	aa1503e2	mov	x2, x21
   0x0000fffff7fabbd4:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fabbd8:	aa1403e4	mov	x4, x20
   0x0000fffff7fabbdc:	aa1603e5	mov	x5, x22
   0x0000fffff7fabbe0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fabbe4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabbe8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabbec:	d63f0200	blr	x16
   0x0000fffff7fabbf0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabbf4:	54001e20	b.eq	0xfffff7fabfb8  // b.none
   0x0000fffff7fabbf8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fabbfc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fabc00:	540004a0	b.eq	0xfffff7fabc94  // b.none
   0x0000fffff7fabc04:	b940016d	ldr	w13, [x11]
   0x0000fffff7fabc08:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fabc0c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fabc10:	eb0901bf	cmp	x13, x9
   0x0000fffff7fabc14:	54000400	b.eq	0xfffff7fabc94  // b.none
   0x0000fffff7fabc18:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fabc1c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fabc20:	36d801d1	tbz	w17, #27, 0xfffff7fabc58
   0x0000fffff7fabc24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fabc28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fabc2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fabc30:	54000321	b.ne	0xfffff7fabc94  // b.any
   0x0000fffff7fabc34:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fabc38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabc3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fabc40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fabc44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fabc48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fabc4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fabc50:	f100055f	cmp	x10, #0x1
   0x0000fffff7fabc54:	54000209	b.ls	0xfffff7fabc94  // b.plast
   0x0000fffff7fabc58:	36d8008d	tbz	w13, #27, 0xfffff7fabc68
   0x0000fffff7fabc5c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fabc60:	91000529	add	x9, x9, #0x1
   0x0000fffff7fabc64:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fabc68:	36d80091	tbz	w17, #27, 0xfffff7fabc78
   0x0000fffff7fabc6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabc70:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fabc74:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fabc78:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fabc7c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fabc80:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fabc84:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fabc88:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fabc8c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fabc90:	1400000e	b	0xfffff7fabcc8
   0x0000fffff7fabc94:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fabc98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabc9c:	aa1303e1	mov	x1, x19
   0x0000fffff7fabca0:	aa1503e2	mov	x2, x21
   0x0000fffff7fabca4:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fabca8:	aa1403e4	mov	x4, x20
   0x0000fffff7fabcac:	aa1603e5	mov	x5, x22
   0x0000fffff7fabcb0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fabcb4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabcb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabcbc:	d63f0200	blr	x16
   0x0000fffff7fabcc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabcc4:	540017e0	b.eq	0xfffff7fabfc0  // b.none
   0x0000fffff7fabcc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fabccc:	37d806a9	tbnz	w9, #27, 0xfffff7fabda0
   0x0000fffff7fabcd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fabcd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabcd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabcdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabce0:	540001c1	b.ne	0xfffff7fabd18  // b.any
   0x0000fffff7fabce4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fabce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabcec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabcf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabcf4:	54000121	b.ne	0xfffff7fabd18  // b.any
   0x0000fffff7fabcf8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fabcfc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fabd00:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fabd04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabd08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd0c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fabd10:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fabd14:	14000030	b	0xfffff7fabdd4
   0x0000fffff7fabd18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fabd1c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabd20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd28:	54000120	b.eq	0xfffff7fabd4c  // b.none
   0x0000fffff7fabd2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fabd30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabd34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd3c:	54000321	b.ne	0xfffff7fabda0  // b.any
   0x0000fffff7fabd40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fabd44:	9e620120	scvtf	d0, x9
   0x0000fffff7fabd48:	14000002	b	0xfffff7fabd50
   0x0000fffff7fabd4c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fabd50:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fabd54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabd58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd60:	54000120	b.eq	0xfffff7fabd84  // b.none
   0x0000fffff7fabd64:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fabd68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabd6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd74:	54000161	b.ne	0xfffff7fabda0  // b.any
   0x0000fffff7fabd78:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fabd7c:	9e620121	scvtf	d1, x9
   0x0000fffff7fabd80:	14000002	b	0xfffff7fabd88
   0x0000fffff7fabd84:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fabd88:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fabd8c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fabd90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabd94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd98:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fabd9c:	17ffffde	b	0xfffff7fabd14
   0x0000fffff7fabda0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabda4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabda8:	aa1303e1	mov	x1, x19
   0x0000fffff7fabdac:	aa1503e2	mov	x2, x21
   0x0000fffff7fabdb0:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fabdb4:	aa1403e4	mov	x4, x20
   0x0000fffff7fabdb8:	aa1603e5	mov	x5, x22
   0x0000fffff7fabdbc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fabdc0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabdc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabdc8:	d63f0200	blr	x16
   0x0000fffff7fabdcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabdd0:	54000fc0	b.eq	0xfffff7fabfc8  // b.none
   0x0000fffff7fabdd4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fabdd8:	37d80269	tbnz	w9, #27, 0xfffff7fabe24
   0x0000fffff7fabddc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fabde0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabde4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabde8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabdec:	540001c1	b.ne	0xfffff7fabe24  // b.any
   0x0000fffff7fabdf0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fabdf4:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fabdf8:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fabdfc:	f9003669	str	x9, [x19, #104]
   0x0000fffff7fabe00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabe04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabe08:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fabe0c:	aa0b03e9	mov	x9, x11
   0x0000fffff7fabe10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabe14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabe18:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fabe1c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fabe20:	1400000e	b	0xfffff7fabe58
   0x0000fffff7fabe24:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabe28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabe2c:	aa1303e1	mov	x1, x19
   0x0000fffff7fabe30:	aa1503e2	mov	x2, x21
   0x0000fffff7fabe34:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fabe38:	aa1403e4	mov	x4, x20
   0x0000fffff7fabe3c:	aa1603e5	mov	x5, x22
   0x0000fffff7fabe40:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fabe44:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabe48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabe4c:	d63f0200	blr	x16
   0x0000fffff7fabe50:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabe54:	54000be0	b.eq	0xfffff7fabfd0  // b.none
   0x0000fffff7fabe58:	17fff8d2	b	0xfffff7faa1a0
   0x0000fffff7fabe5c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabe60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabe64:	aa1303e1	mov	x1, x19
   0x0000fffff7fabe68:	aa1503e2	mov	x2, x21
   0x0000fffff7fabe6c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fabe70:	aa1403e4	mov	x4, x20
   0x0000fffff7fabe74:	aa1603e5	mov	x5, x22
   0x0000fffff7fabe78:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fabe7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabe80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabe84:	d63f0200	blr	x16
   0x0000fffff7fabe88:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fabe8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fabe90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fabe94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fabe98:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fabe9c:	d65f03c0	ret
   0x0000fffff7fabea0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabea4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabea8:	b900028a	str	w10, [x20]
   0x0000fffff7fabeac:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fabeb0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fabeb4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fabeb8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fabebc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fabec0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fabec4:	d65f03c0	ret
   0x0000fffff7fabec8:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fabecc:	17fffff5	b	0xfffff7fabea0
   0x0000fffff7fabed0:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fabed4:	17fffff3	b	0xfffff7fabea0
   0x0000fffff7fabed8:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fabedc:	17fffff1	b	0xfffff7fabea0
   0x0000fffff7fabee0:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fabee4:	17ffffef	b	0xfffff7fabea0
   0x0000fffff7fabee8:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fabeec:	17ffffed	b	0xfffff7fabea0
   0x0000fffff7fabef0:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fabef4:	17ffffeb	b	0xfffff7fabea0
   0x0000fffff7fabef8:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fabefc:	17ffffe9	b	0xfffff7fabea0
   0x0000fffff7fabf00:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fabf04:	17ffffe7	b	0xfffff7fabea0
   0x0000fffff7fabf08:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fabf0c:	17ffffe5	b	0xfffff7fabea0
   0x0000fffff7fabf10:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fabf14:	17ffffe3	b	0xfffff7fabea0
   0x0000fffff7fabf18:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fabf1c:	17ffffe1	b	0xfffff7fabea0
   0x0000fffff7fabf20:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fabf24:	17ffffdf	b	0xfffff7fabea0
   0x0000fffff7fabf28:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fabf2c:	17ffffdd	b	0xfffff7fabea0
   0x0000fffff7fabf30:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fabf34:	17ffffdb	b	0xfffff7fabea0
   0x0000fffff7fabf38:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fabf3c:	17ffffd9	b	0xfffff7fabea0
   0x0000fffff7fabf40:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fabf44:	17ffffd7	b	0xfffff7fabea0
   0x0000fffff7fabf48:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fabf4c:	17ffffd5	b	0xfffff7fabea0
   0x0000fffff7fabf50:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fabf54:	17ffffd3	b	0xfffff7fabea0
   0x0000fffff7fabf58:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fabf5c:	17ffffd1	b	0xfffff7fabea0
   0x0000fffff7fabf60:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fabf64:	17ffffcf	b	0xfffff7fabea0
   0x0000fffff7fabf68:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fabf6c:	17ffffcd	b	0xfffff7fabea0
   0x0000fffff7fabf70:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fabf74:	17ffffcb	b	0xfffff7fabea0
   0x0000fffff7fabf78:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fabf7c:	17ffffc9	b	0xfffff7fabea0
   0x0000fffff7fabf80:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fabf84:	17ffffc7	b	0xfffff7fabea0
   0x0000fffff7fabf88:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fabf8c:	17ffffc5	b	0xfffff7fabea0
   0x0000fffff7fabf90:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fabf94:	17ffffc3	b	0xfffff7fabea0
   0x0000fffff7fabf98:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fabf9c:	17ffffc1	b	0xfffff7fabea0
   0x0000fffff7fabfa0:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fabfa4:	17ffffbf	b	0xfffff7fabea0
   0x0000fffff7fabfa8:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fabfac:	17ffffbd	b	0xfffff7fabea0
   0x0000fffff7fabfb0:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fabfb4:	17ffffbb	b	0xfffff7fabea0
   0x0000fffff7fabfb8:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fabfbc:	17ffffb9	b	0xfffff7fabea0
   0x0000fffff7fabfc0:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fabfc4:	17ffffb7	b	0xfffff7fabea0
   0x0000fffff7fabfc8:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fabfcc:	17ffffb5	b	0xfffff7fabea0
   0x0000fffff7fabfd0:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fabfd4:	17ffffb3	b	0xfffff7fabea0
   0x0000fffff7fabfd8:	00000000	udf	#0
   0x0000fffff7fabfdc:	00000000	udf	#0
   0x0000fffff7fabfe0:	00000000	udf	#0
   0x0000fffff7fabfe4:	00000000	udf	#0
   0x0000fffff7fabfe8:	00000000	udf	#0
   0x0000fffff7fabfec:	00000000	udf	#0
   0x0000fffff7fabff0:	00000000	udf	#0
   0x0000fffff7fabff4:	00000000	udf	#0
   0x0000fffff7fabff8:	00000000	udf	#0
   0x0000fffff7fabffc:	00000000	udf	#0
End of assembler dump.
