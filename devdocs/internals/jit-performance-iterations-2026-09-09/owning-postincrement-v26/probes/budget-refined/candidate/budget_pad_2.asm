Dump of assembler code from 0xfffff7fba000 to 0xfffff7fbc000:
   0x0000fffff7fba000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fba004:	910003fd	mov	x29, sp
   0x0000fffff7fba008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fba00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fba010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fba014:	aa0003f3	mov	x19, x0
   0x0000fffff7fba018:	aa0103f4	mov	x20, x1
   0x0000fffff7fba01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fba020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fba024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fba028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fba02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fba030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fba034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fba038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fba03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fba040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba044:	d63f0200	blr	x16
   0x0000fffff7fba048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fba04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fba050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fba054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fba058:	14000001	b	0xfffff7fba05c
   0x0000fffff7fba05c:	14000001	b	0xfffff7fba060
   0x0000fffff7fba060:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fba064:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fba068:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fba06c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fba070:	36d80211	tbz	w17, #27, 0xfffff7fba0b0
   0x0000fffff7fba074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba080:	540001e1	b.ne	0xfffff7fba0bc  // b.any
   0x0000fffff7fba084:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba0a4:	540000c9	b.ls	0xfffff7fba0bc  // b.plast
   0x0000fffff7fba0a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba0ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba0b0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fba0b4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fba0b8:	1400000e	b	0xfffff7fba0f0
   0x0000fffff7fba0bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba0c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba0c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fba0c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fba0cc:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fba0d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fba0d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fba0d8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fba0dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba0e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba0e4:	d63f0200	blr	x16
   0x0000fffff7fba0e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba0ec:	5400ef60	b.eq	0xfffff7fbbed8  // b.none
   0x0000fffff7fba0f0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fba0f4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fba0f8:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fba0fc:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fba100:	36d80211	tbz	w17, #27, 0xfffff7fba140
   0x0000fffff7fba104:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba108:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba10c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba110:	540001e1	b.ne	0xfffff7fba14c  // b.any
   0x0000fffff7fba114:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fba118:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba11c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba120:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba124:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba128:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba12c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba130:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba134:	540000c9	b.ls	0xfffff7fba14c  // b.plast
   0x0000fffff7fba138:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba13c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba140:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fba144:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fba148:	1400000e	b	0xfffff7fba180
   0x0000fffff7fba14c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba150:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba154:	aa1303e1	mov	x1, x19
   0x0000fffff7fba158:	aa1503e2	mov	x2, x21
   0x0000fffff7fba15c:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fba160:	aa1403e4	mov	x4, x20
   0x0000fffff7fba164:	aa1603e5	mov	x5, x22
   0x0000fffff7fba168:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fba16c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba170:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba174:	d63f0200	blr	x16
   0x0000fffff7fba178:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba17c:	5400eb20	b.eq	0xfffff7fbbee0  // b.none
   0x0000fffff7fba180:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba18c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba190:	54000421	b.ne	0xfffff7fba214  // b.any
   0x0000fffff7fba194:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba1a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba1a4:	54000381	b.ne	0xfffff7fba214  // b.any
   0x0000fffff7fba1a8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fba1ac:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fba1b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba1b4:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fba1b8:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fba1bc:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fba1c0:	91000580	add	x0, x12, #0x1
   0x0000fffff7fba1c4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba1c8:	36d80211	tbz	w17, #27, 0xfffff7fba208
   0x0000fffff7fba1cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba1d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba1d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba1d8:	540001e1	b.ne	0xfffff7fba214  // b.any
   0x0000fffff7fba1dc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba1e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba1e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba1e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba1ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba1f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba1f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba1f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba1fc:	540000c9	b.ls	0xfffff7fba214  // b.plast
   0x0000fffff7fba200:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba204:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba208:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fba20c:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fba210:	1400000e	b	0xfffff7fba248
   0x0000fffff7fba214:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba218:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba21c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba220:	aa1503e2	mov	x2, x21
   0x0000fffff7fba224:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fba228:	aa1403e4	mov	x4, x20
   0x0000fffff7fba22c:	aa1603e5	mov	x5, x22
   0x0000fffff7fba230:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fba234:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba238:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba23c:	d63f0200	blr	x16
   0x0000fffff7fba240:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba244:	5400e520	b.eq	0xfffff7fbbee8  // b.none
   0x0000fffff7fba248:	f100041f	cmp	x0, #0x1
   0x0000fffff7fba24c:	5400e100	b.eq	0xfffff7fbbe6c  // b.none
   0x0000fffff7fba250:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fba254:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fba258:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fba25c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fba260:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fba264:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fba268:	36d801d1	tbz	w17, #27, 0xfffff7fba2a0
   0x0000fffff7fba26c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba270:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba274:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba278:	54000281	b.ne	0xfffff7fba2c8  // b.any
   0x0000fffff7fba27c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fba280:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba284:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba288:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba28c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba290:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba294:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba298:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba29c:	54000169	b.ls	0xfffff7fba2c8  // b.plast
   0x0000fffff7fba2a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba2a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba2a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba2ac:	36d80091	tbz	w17, #27, 0xfffff7fba2bc
   0x0000fffff7fba2b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba2b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba2b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba2bc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fba2c0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fba2c4:	1400000e	b	0xfffff7fba2fc
   0x0000fffff7fba2c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba2cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba2d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fba2d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fba2d8:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fba2dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fba2e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fba2e4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fba2e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba2ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba2f0:	d63f0200	blr	x16
   0x0000fffff7fba2f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba2f8:	5400dfc0	b.eq	0xfffff7fbbef0  // b.none
   0x0000fffff7fba2fc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fba300:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba304:	540003a0	b.eq	0xfffff7fba378  // b.none
   0x0000fffff7fba308:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fba30c:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fba310:	b9400171	ldr	w17, [x11]
   0x0000fffff7fba314:	36d801d1	tbz	w17, #27, 0xfffff7fba34c
   0x0000fffff7fba318:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba31c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba320:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba324:	540002a1	b.ne	0xfffff7fba378  // b.any
   0x0000fffff7fba328:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fba32c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba330:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba334:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba338:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba33c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba340:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba344:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba348:	54000189	b.ls	0xfffff7fba378  // b.plast
   0x0000fffff7fba34c:	36d8008d	tbz	w13, #27, 0xfffff7fba35c
   0x0000fffff7fba350:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba354:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba358:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba35c:	36d80091	tbz	w17, #27, 0xfffff7fba36c
   0x0000fffff7fba360:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba364:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba368:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba36c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fba370:	b900016d	str	w13, [x11]
   0x0000fffff7fba374:	1400000e	b	0xfffff7fba3ac
   0x0000fffff7fba378:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fba37c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba380:	aa1303e1	mov	x1, x19
   0x0000fffff7fba384:	aa1503e2	mov	x2, x21
   0x0000fffff7fba388:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fba38c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba390:	aa1603e5	mov	x5, x22
   0x0000fffff7fba394:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fba398:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba39c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba3a0:	d63f0200	blr	x16
   0x0000fffff7fba3a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba3a8:	5400da80	b.eq	0xfffff7fbbef8  // b.none
   0x0000fffff7fba3ac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba3b0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba3b4:	540004a0	b.eq	0xfffff7fba448  // b.none
   0x0000fffff7fba3b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba3bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba3c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba3c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba3c8:	54000400	b.eq	0xfffff7fba448  // b.none
   0x0000fffff7fba3cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba3d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba3d4:	36d801d1	tbz	w17, #27, 0xfffff7fba40c
   0x0000fffff7fba3d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba3dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba3e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba3e4:	54000321	b.ne	0xfffff7fba448  // b.any
   0x0000fffff7fba3e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba3ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba3f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba3f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba3f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba3fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba400:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba404:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba408:	54000209	b.ls	0xfffff7fba448  // b.plast
   0x0000fffff7fba40c:	36d8008d	tbz	w13, #27, 0xfffff7fba41c
   0x0000fffff7fba410:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba414:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba418:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba41c:	36d80091	tbz	w17, #27, 0xfffff7fba42c
   0x0000fffff7fba420:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba424:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba428:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba42c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fba430:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fba434:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba438:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba43c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fba440:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fba444:	1400000e	b	0xfffff7fba47c
   0x0000fffff7fba448:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba44c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba450:	aa1303e1	mov	x1, x19
   0x0000fffff7fba454:	aa1503e2	mov	x2, x21
   0x0000fffff7fba458:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fba45c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba460:	aa1603e5	mov	x5, x22
   0x0000fffff7fba464:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba468:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba46c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba470:	d63f0200	blr	x16
   0x0000fffff7fba474:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba478:	5400d440	b.eq	0xfffff7fbbf00  // b.none
   0x0000fffff7fba47c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba480:	37d806a9	tbnz	w9, #27, 0xfffff7fba554
   0x0000fffff7fba484:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba488:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba48c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba490:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba494:	540001c1	b.ne	0xfffff7fba4cc  // b.any
   0x0000fffff7fba498:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fba49c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba4a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba4a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba4a8:	54000121	b.ne	0xfffff7fba4cc  // b.any
   0x0000fffff7fba4ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba4b0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fba4b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba4b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba4bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba4c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fba4c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fba4c8:	14000030	b	0xfffff7fba588
   0x0000fffff7fba4cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba4d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba4d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba4d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba4dc:	54000120	b.eq	0xfffff7fba500  // b.none
   0x0000fffff7fba4e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba4e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba4e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba4ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba4f0:	54000321	b.ne	0xfffff7fba554  // b.any
   0x0000fffff7fba4f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba4f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fba4fc:	14000002	b	0xfffff7fba504
   0x0000fffff7fba500:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fba504:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fba508:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba50c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba510:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba514:	54000120	b.eq	0xfffff7fba538  // b.none
   0x0000fffff7fba518:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fba51c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba524:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba528:	54000161	b.ne	0xfffff7fba554  // b.any
   0x0000fffff7fba52c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fba530:	9e620121	scvtf	d1, x9
   0x0000fffff7fba534:	14000002	b	0xfffff7fba53c
   0x0000fffff7fba538:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fba53c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba540:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fba544:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba548:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba54c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fba550:	17ffffde	b	0xfffff7fba4c8
   0x0000fffff7fba554:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba558:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba55c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba560:	aa1503e2	mov	x2, x21
   0x0000fffff7fba564:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fba568:	aa1403e4	mov	x4, x20
   0x0000fffff7fba56c:	aa1603e5	mov	x5, x22
   0x0000fffff7fba570:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fba574:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba578:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba57c:	d63f0200	blr	x16
   0x0000fffff7fba580:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba584:	5400cc20	b.eq	0xfffff7fbbf08  // b.none
   0x0000fffff7fba588:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba58c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba590:	540004a0	b.eq	0xfffff7fba624  // b.none
   0x0000fffff7fba594:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba598:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba59c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba5a0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba5a4:	54000400	b.eq	0xfffff7fba624  // b.none
   0x0000fffff7fba5a8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba5ac:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba5b0:	36d801d1	tbz	w17, #27, 0xfffff7fba5e8
   0x0000fffff7fba5b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba5b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba5bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba5c0:	54000321	b.ne	0xfffff7fba624  // b.any
   0x0000fffff7fba5c4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba5c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba5cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba5d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba5d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba5d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba5dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba5e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba5e4:	54000209	b.ls	0xfffff7fba624  // b.plast
   0x0000fffff7fba5e8:	36d8008d	tbz	w13, #27, 0xfffff7fba5f8
   0x0000fffff7fba5ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba5f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba5f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba5f8:	36d80091	tbz	w17, #27, 0xfffff7fba608
   0x0000fffff7fba5fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba600:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba604:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba608:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fba60c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fba610:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba614:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba618:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fba61c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fba620:	1400000e	b	0xfffff7fba658
   0x0000fffff7fba624:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba628:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba62c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba630:	aa1503e2	mov	x2, x21
   0x0000fffff7fba634:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fba638:	aa1403e4	mov	x4, x20
   0x0000fffff7fba63c:	aa1603e5	mov	x5, x22
   0x0000fffff7fba640:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba644:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba648:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba64c:	d63f0200	blr	x16
   0x0000fffff7fba650:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba654:	5400c5e0	b.eq	0xfffff7fbbf10  // b.none
   0x0000fffff7fba658:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba65c:	37d806a9	tbnz	w9, #27, 0xfffff7fba730
   0x0000fffff7fba660:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba664:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba66c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba670:	540001c1	b.ne	0xfffff7fba6a8  // b.any
   0x0000fffff7fba674:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fba678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba680:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba684:	54000121	b.ne	0xfffff7fba6a8  // b.any
   0x0000fffff7fba688:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba68c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fba690:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba69c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fba6a0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fba6a4:	14000030	b	0xfffff7fba764
   0x0000fffff7fba6a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba6ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba6b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba6b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba6b8:	54000120	b.eq	0xfffff7fba6dc  // b.none
   0x0000fffff7fba6bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba6c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba6c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba6c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba6cc:	54000321	b.ne	0xfffff7fba730  // b.any
   0x0000fffff7fba6d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba6d4:	9e620120	scvtf	d0, x9
   0x0000fffff7fba6d8:	14000002	b	0xfffff7fba6e0
   0x0000fffff7fba6dc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fba6e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fba6e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba6e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba6ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba6f0:	54000120	b.eq	0xfffff7fba714  // b.none
   0x0000fffff7fba6f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fba6f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba6fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba700:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba704:	54000161	b.ne	0xfffff7fba730  // b.any
   0x0000fffff7fba708:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fba70c:	9e620121	scvtf	d1, x9
   0x0000fffff7fba710:	14000002	b	0xfffff7fba718
   0x0000fffff7fba714:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fba718:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba71c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fba720:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba724:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba728:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fba72c:	17ffffde	b	0xfffff7fba6a4
   0x0000fffff7fba730:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba734:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba738:	aa1303e1	mov	x1, x19
   0x0000fffff7fba73c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba740:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fba744:	aa1403e4	mov	x4, x20
   0x0000fffff7fba748:	aa1603e5	mov	x5, x22
   0x0000fffff7fba74c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fba750:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba754:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba758:	d63f0200	blr	x16
   0x0000fffff7fba75c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba760:	5400bdc0	b.eq	0xfffff7fbbf18  // b.none
   0x0000fffff7fba764:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba768:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba76c:	540004a0	b.eq	0xfffff7fba800  // b.none
   0x0000fffff7fba770:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba774:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba778:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba77c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba780:	54000400	b.eq	0xfffff7fba800  // b.none
   0x0000fffff7fba784:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba788:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba78c:	36d801d1	tbz	w17, #27, 0xfffff7fba7c4
   0x0000fffff7fba790:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba794:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba798:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba79c:	54000321	b.ne	0xfffff7fba800  // b.any
   0x0000fffff7fba7a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba7a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba7a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba7ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba7b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba7b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba7b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba7bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba7c0:	54000209	b.ls	0xfffff7fba800  // b.plast
   0x0000fffff7fba7c4:	36d8008d	tbz	w13, #27, 0xfffff7fba7d4
   0x0000fffff7fba7c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba7cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba7d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba7d4:	36d80091	tbz	w17, #27, 0xfffff7fba7e4
   0x0000fffff7fba7d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba7dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba7e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba7e4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fba7e8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fba7ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba7f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba7f4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fba7f8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fba7fc:	1400000e	b	0xfffff7fba834
   0x0000fffff7fba800:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba804:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba808:	aa1303e1	mov	x1, x19
   0x0000fffff7fba80c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba810:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fba814:	aa1403e4	mov	x4, x20
   0x0000fffff7fba818:	aa1603e5	mov	x5, x22
   0x0000fffff7fba81c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba820:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba824:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba828:	d63f0200	blr	x16
   0x0000fffff7fba82c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba830:	5400b780	b.eq	0xfffff7fbbf20  // b.none
   0x0000fffff7fba834:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba838:	37d806a9	tbnz	w9, #27, 0xfffff7fba90c
   0x0000fffff7fba83c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba840:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba844:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba848:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba84c:	540001c1	b.ne	0xfffff7fba884  // b.any
   0x0000fffff7fba850:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fba854:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba858:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba85c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba860:	54000121	b.ne	0xfffff7fba884  // b.any
   0x0000fffff7fba864:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba868:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fba86c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba870:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba874:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba878:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fba87c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fba880:	14000030	b	0xfffff7fba940
   0x0000fffff7fba884:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba888:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba88c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba890:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba894:	54000120	b.eq	0xfffff7fba8b8  // b.none
   0x0000fffff7fba898:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba89c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba8a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba8a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba8a8:	54000321	b.ne	0xfffff7fba90c  // b.any
   0x0000fffff7fba8ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba8b0:	9e620120	scvtf	d0, x9
   0x0000fffff7fba8b4:	14000002	b	0xfffff7fba8bc
   0x0000fffff7fba8b8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fba8bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fba8c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba8c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba8c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba8cc:	54000120	b.eq	0xfffff7fba8f0  // b.none
   0x0000fffff7fba8d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fba8d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba8d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba8dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba8e0:	54000161	b.ne	0xfffff7fba90c  // b.any
   0x0000fffff7fba8e4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fba8e8:	9e620121	scvtf	d1, x9
   0x0000fffff7fba8ec:	14000002	b	0xfffff7fba8f4
   0x0000fffff7fba8f0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fba8f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba8f8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fba8fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba900:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba904:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fba908:	17ffffde	b	0xfffff7fba880
   0x0000fffff7fba90c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba910:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba914:	aa1303e1	mov	x1, x19
   0x0000fffff7fba918:	aa1503e2	mov	x2, x21
   0x0000fffff7fba91c:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fba920:	aa1403e4	mov	x4, x20
   0x0000fffff7fba924:	aa1603e5	mov	x5, x22
   0x0000fffff7fba928:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fba92c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba930:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba934:	d63f0200	blr	x16
   0x0000fffff7fba938:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba93c:	5400af60	b.eq	0xfffff7fbbf28  // b.none
   0x0000fffff7fba940:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba944:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba948:	540004a0	b.eq	0xfffff7fba9dc  // b.none
   0x0000fffff7fba94c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba950:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba954:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba958:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba95c:	54000400	b.eq	0xfffff7fba9dc  // b.none
   0x0000fffff7fba960:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba964:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba968:	36d801d1	tbz	w17, #27, 0xfffff7fba9a0
   0x0000fffff7fba96c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba970:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba974:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba978:	54000321	b.ne	0xfffff7fba9dc  // b.any
   0x0000fffff7fba97c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba980:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba984:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba988:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba98c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba990:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba994:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba998:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba99c:	54000209	b.ls	0xfffff7fba9dc  // b.plast
   0x0000fffff7fba9a0:	36d8008d	tbz	w13, #27, 0xfffff7fba9b0
   0x0000fffff7fba9a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba9a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba9ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba9b0:	36d80091	tbz	w17, #27, 0xfffff7fba9c0
   0x0000fffff7fba9b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba9b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba9bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba9c0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fba9c4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fba9c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba9cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba9d0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fba9d4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fba9d8:	1400000e	b	0xfffff7fbaa10
   0x0000fffff7fba9dc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba9e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba9e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fba9e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fba9ec:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fba9f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fba9f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fba9f8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fba9fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbaa00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaa04:	d63f0200	blr	x16
   0x0000fffff7fbaa08:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaa0c:	5400a920	b.eq	0xfffff7fbbf30  // b.none
   0x0000fffff7fbaa10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbaa14:	37d806a9	tbnz	w9, #27, 0xfffff7fbaae8
   0x0000fffff7fbaa18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbaa1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaa20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaa28:	540001c1	b.ne	0xfffff7fbaa60  // b.any
   0x0000fffff7fbaa2c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbaa30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaa34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaa3c:	54000121	b.ne	0xfffff7fbaa60  // b.any
   0x0000fffff7fbaa40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbaa44:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbaa48:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbaa4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaa50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa54:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbaa58:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbaa5c:	14000030	b	0xfffff7fbab1c
   0x0000fffff7fbaa60:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbaa64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaa68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaa70:	54000120	b.eq	0xfffff7fbaa94  // b.none
   0x0000fffff7fbaa74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbaa78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaa7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaa84:	54000321	b.ne	0xfffff7fbaae8  // b.any
   0x0000fffff7fbaa88:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbaa8c:	9e620120	scvtf	d0, x9
   0x0000fffff7fbaa90:	14000002	b	0xfffff7fbaa98
   0x0000fffff7fbaa94:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbaa98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbaa9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaaa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaaa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaaa8:	54000120	b.eq	0xfffff7fbaacc  // b.none
   0x0000fffff7fbaaac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbaab0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaab8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaabc:	54000161	b.ne	0xfffff7fbaae8  // b.any
   0x0000fffff7fbaac0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbaac4:	9e620121	scvtf	d1, x9
   0x0000fffff7fbaac8:	14000002	b	0xfffff7fbaad0
   0x0000fffff7fbaacc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbaad0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbaad4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbaad8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaadc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaae0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbaae4:	17ffffde	b	0xfffff7fbaa5c
   0x0000fffff7fbaae8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbaaec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaaf0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaaf4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaaf8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fbaafc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbab00:	aa1603e5	mov	x5, x22
   0x0000fffff7fbab04:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbab08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbab0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbab10:	d63f0200	blr	x16
   0x0000fffff7fbab14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbab18:	5400a100	b.eq	0xfffff7fbbf38  // b.none
   0x0000fffff7fbab1c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbab20:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbab24:	540004a0	b.eq	0xfffff7fbabb8  // b.none
   0x0000fffff7fbab28:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbab2c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbab30:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbab34:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbab38:	54000400	b.eq	0xfffff7fbabb8  // b.none
   0x0000fffff7fbab3c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbab40:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbab44:	36d801d1	tbz	w17, #27, 0xfffff7fbab7c
   0x0000fffff7fbab48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbab4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbab50:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbab54:	54000321	b.ne	0xfffff7fbabb8  // b.any
   0x0000fffff7fbab58:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbab5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbab60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbab64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbab68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbab6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbab70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbab74:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbab78:	54000209	b.ls	0xfffff7fbabb8  // b.plast
   0x0000fffff7fbab7c:	36d8008d	tbz	w13, #27, 0xfffff7fbab8c
   0x0000fffff7fbab80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbab84:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbab88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbab8c:	36d80091	tbz	w17, #27, 0xfffff7fbab9c
   0x0000fffff7fbab90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbab94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbab98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbab9c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbaba0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbaba4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbaba8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbabac:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbabb0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbabb4:	1400000e	b	0xfffff7fbabec
   0x0000fffff7fbabb8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbabbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbabc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbabc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbabc8:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fbabcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbabd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbabd4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbabd8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbabdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbabe0:	d63f0200	blr	x16
   0x0000fffff7fbabe4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbabe8:	54009ac0	b.eq	0xfffff7fbbf40  // b.none
   0x0000fffff7fbabec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbabf0:	37d806a9	tbnz	w9, #27, 0xfffff7fbacc4
   0x0000fffff7fbabf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbabf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbabfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac04:	540001c1	b.ne	0xfffff7fbac3c  // b.any
   0x0000fffff7fbac08:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbac0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac18:	54000121	b.ne	0xfffff7fbac3c  // b.any
   0x0000fffff7fbac1c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbac20:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbac24:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbac28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac30:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbac34:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbac38:	14000030	b	0xfffff7fbacf8
   0x0000fffff7fbac3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbac40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbac44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac4c:	54000120	b.eq	0xfffff7fbac70  // b.none
   0x0000fffff7fbac50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbac54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac60:	54000321	b.ne	0xfffff7fbacc4  // b.any
   0x0000fffff7fbac64:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbac68:	9e620120	scvtf	d0, x9
   0x0000fffff7fbac6c:	14000002	b	0xfffff7fbac74
   0x0000fffff7fbac70:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbac74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbac78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbac7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac84:	54000120	b.eq	0xfffff7fbaca8  // b.none
   0x0000fffff7fbac88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbac8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbac90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbac94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbac98:	54000161	b.ne	0xfffff7fbacc4  // b.any
   0x0000fffff7fbac9c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbaca0:	9e620121	scvtf	d1, x9
   0x0000fffff7fbaca4:	14000002	b	0xfffff7fbacac
   0x0000fffff7fbaca8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbacac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbacb0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbacb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbacb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbacbc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbacc0:	17ffffde	b	0xfffff7fbac38
   0x0000fffff7fbacc4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbacc8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaccc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbacd0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbacd4:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fbacd8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbacdc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbace0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbace4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbace8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbacec:	d63f0200	blr	x16
   0x0000fffff7fbacf0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbacf4:	540092a0	b.eq	0xfffff7fbbf48  // b.none
   0x0000fffff7fbacf8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbacfc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbad00:	540004a0	b.eq	0xfffff7fbad94  // b.none
   0x0000fffff7fbad04:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbad08:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbad0c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbad10:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbad14:	54000400	b.eq	0xfffff7fbad94  // b.none
   0x0000fffff7fbad18:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbad1c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbad20:	36d801d1	tbz	w17, #27, 0xfffff7fbad58
   0x0000fffff7fbad24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbad28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbad2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbad30:	54000321	b.ne	0xfffff7fbad94  // b.any
   0x0000fffff7fbad34:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbad38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbad3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbad40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbad44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbad48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbad4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbad50:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbad54:	54000209	b.ls	0xfffff7fbad94  // b.plast
   0x0000fffff7fbad58:	36d8008d	tbz	w13, #27, 0xfffff7fbad68
   0x0000fffff7fbad5c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbad60:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbad64:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbad68:	36d80091	tbz	w17, #27, 0xfffff7fbad78
   0x0000fffff7fbad6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbad70:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbad74:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbad78:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbad7c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbad80:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbad84:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbad88:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbad8c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbad90:	1400000e	b	0xfffff7fbadc8
   0x0000fffff7fbad94:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbad98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbad9c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbada0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbada4:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fbada8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbadac:	aa1603e5	mov	x5, x22
   0x0000fffff7fbadb0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbadb4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbadb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbadbc:	d63f0200	blr	x16
   0x0000fffff7fbadc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbadc4:	54008c60	b.eq	0xfffff7fbbf50  // b.none
   0x0000fffff7fbadc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbadcc:	37d806a9	tbnz	w9, #27, 0xfffff7fbaea0
   0x0000fffff7fbadd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbadd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbadd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaddc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbade0:	540001c1	b.ne	0xfffff7fbae18  // b.any
   0x0000fffff7fbade4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbade8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbadec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbadf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbadf4:	54000121	b.ne	0xfffff7fbae18  // b.any
   0x0000fffff7fbadf8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbadfc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbae00:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbae04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbae08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbae0c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbae10:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbae14:	14000030	b	0xfffff7fbaed4
   0x0000fffff7fbae18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbae1c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbae20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbae24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbae28:	54000120	b.eq	0xfffff7fbae4c  // b.none
   0x0000fffff7fbae2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbae30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbae34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbae38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbae3c:	54000321	b.ne	0xfffff7fbaea0  // b.any
   0x0000fffff7fbae40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbae44:	9e620120	scvtf	d0, x9
   0x0000fffff7fbae48:	14000002	b	0xfffff7fbae50
   0x0000fffff7fbae4c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbae50:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbae54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbae58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbae5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbae60:	54000120	b.eq	0xfffff7fbae84  // b.none
   0x0000fffff7fbae64:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbae68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbae6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbae70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbae74:	54000161	b.ne	0xfffff7fbaea0  // b.any
   0x0000fffff7fbae78:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbae7c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbae80:	14000002	b	0xfffff7fbae88
   0x0000fffff7fbae84:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbae88:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbae8c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbae90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbae94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbae98:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbae9c:	17ffffde	b	0xfffff7fbae14
   0x0000fffff7fbaea0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbaea4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaea8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaeac:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaeb0:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fbaeb4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbaeb8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaebc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbaec0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbaec4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaec8:	d63f0200	blr	x16
   0x0000fffff7fbaecc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaed0:	54008440	b.eq	0xfffff7fbbf58  // b.none
   0x0000fffff7fbaed4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbaed8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbaedc:	540004a0	b.eq	0xfffff7fbaf70  // b.none
   0x0000fffff7fbaee0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbaee4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbaee8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbaeec:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbaef0:	54000400	b.eq	0xfffff7fbaf70  // b.none
   0x0000fffff7fbaef4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbaef8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbaefc:	36d801d1	tbz	w17, #27, 0xfffff7fbaf34
   0x0000fffff7fbaf00:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbaf04:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbaf08:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbaf0c:	54000321	b.ne	0xfffff7fbaf70  // b.any
   0x0000fffff7fbaf10:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbaf14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaf18:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbaf1c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbaf20:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbaf24:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbaf28:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbaf2c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbaf30:	54000209	b.ls	0xfffff7fbaf70  // b.plast
   0x0000fffff7fbaf34:	36d8008d	tbz	w13, #27, 0xfffff7fbaf44
   0x0000fffff7fbaf38:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbaf3c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbaf40:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbaf44:	36d80091	tbz	w17, #27, 0xfffff7fbaf54
   0x0000fffff7fbaf48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbaf4c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbaf50:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbaf54:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbaf58:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbaf5c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbaf60:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbaf64:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbaf68:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbaf6c:	1400000e	b	0xfffff7fbafa4
   0x0000fffff7fbaf70:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbaf74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaf78:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaf7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaf80:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fbaf84:	aa1403e4	mov	x4, x20
   0x0000fffff7fbaf88:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaf8c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbaf90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbaf94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbaf98:	d63f0200	blr	x16
   0x0000fffff7fbaf9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbafa0:	54007e00	b.eq	0xfffff7fbbf60  // b.none
   0x0000fffff7fbafa4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbafa8:	37d806a9	tbnz	w9, #27, 0xfffff7fbb07c
   0x0000fffff7fbafac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbafb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbafb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbafb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbafbc:	540001c1	b.ne	0xfffff7fbaff4  // b.any
   0x0000fffff7fbafc0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbafc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbafc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbafcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbafd0:	54000121	b.ne	0xfffff7fbaff4  // b.any
   0x0000fffff7fbafd4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbafd8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbafdc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbafe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbafe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbafe8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbafec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbaff0:	14000030	b	0xfffff7fbb0b0
   0x0000fffff7fbaff4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbaff8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaffc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb000:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb004:	54000120	b.eq	0xfffff7fbb028  // b.none
   0x0000fffff7fbb008:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb00c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb014:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb018:	54000321	b.ne	0xfffff7fbb07c  // b.any
   0x0000fffff7fbb01c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb020:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb024:	14000002	b	0xfffff7fbb02c
   0x0000fffff7fbb028:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbb02c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb030:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb034:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb038:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb03c:	54000120	b.eq	0xfffff7fbb060  // b.none
   0x0000fffff7fbb040:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb044:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb04c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb050:	54000161	b.ne	0xfffff7fbb07c  // b.any
   0x0000fffff7fbb054:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbb058:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb05c:	14000002	b	0xfffff7fbb064
   0x0000fffff7fbb060:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbb064:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb068:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbb06c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb070:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb074:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb078:	17ffffde	b	0xfffff7fbaff0
   0x0000fffff7fbb07c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb080:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb084:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb088:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb08c:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fbb090:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb094:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb098:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbb09c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb0a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb0a4:	d63f0200	blr	x16
   0x0000fffff7fbb0a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb0ac:	540075e0	b.eq	0xfffff7fbbf68  // b.none
   0x0000fffff7fbb0b0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb0b4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb0b8:	540004a0	b.eq	0xfffff7fbb14c  // b.none
   0x0000fffff7fbb0bc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb0c0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb0c4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb0c8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb0cc:	54000400	b.eq	0xfffff7fbb14c  // b.none
   0x0000fffff7fbb0d0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb0d4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb0d8:	36d801d1	tbz	w17, #27, 0xfffff7fbb110
   0x0000fffff7fbb0dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb0e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb0e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb0e8:	54000321	b.ne	0xfffff7fbb14c  // b.any
   0x0000fffff7fbb0ec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb0f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb0f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb0f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb0fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb100:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb104:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb108:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb10c:	54000209	b.ls	0xfffff7fbb14c  // b.plast
   0x0000fffff7fbb110:	36d8008d	tbz	w13, #27, 0xfffff7fbb120
   0x0000fffff7fbb114:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb118:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb11c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb120:	36d80091	tbz	w17, #27, 0xfffff7fbb130
   0x0000fffff7fbb124:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb128:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb12c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb130:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbb134:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbb138:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb13c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb140:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbb144:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbb148:	1400000e	b	0xfffff7fbb180
   0x0000fffff7fbb14c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb150:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb154:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb158:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb15c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fbb160:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb164:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb168:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbb16c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb170:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb174:	d63f0200	blr	x16
   0x0000fffff7fbb178:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb17c:	54006fa0	b.eq	0xfffff7fbbf70  // b.none
   0x0000fffff7fbb180:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb184:	37d806a9	tbnz	w9, #27, 0xfffff7fbb258
   0x0000fffff7fbb188:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb18c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb190:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb194:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb198:	540001c1	b.ne	0xfffff7fbb1d0  // b.any
   0x0000fffff7fbb19c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb1a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb1a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb1a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb1ac:	54000121	b.ne	0xfffff7fbb1d0  // b.any
   0x0000fffff7fbb1b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb1b4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbb1b8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb1bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb1c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb1c4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbb1c8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb1cc:	14000030	b	0xfffff7fbb28c
   0x0000fffff7fbb1d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb1d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb1d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb1dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb1e0:	54000120	b.eq	0xfffff7fbb204  // b.none
   0x0000fffff7fbb1e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb1e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb1ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb1f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb1f4:	54000321	b.ne	0xfffff7fbb258  // b.any
   0x0000fffff7fbb1f8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb1fc:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb200:	14000002	b	0xfffff7fbb208
   0x0000fffff7fbb204:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbb208:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb20c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb210:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb214:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb218:	54000120	b.eq	0xfffff7fbb23c  // b.none
   0x0000fffff7fbb21c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb220:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb224:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb228:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb22c:	54000161	b.ne	0xfffff7fbb258  // b.any
   0x0000fffff7fbb230:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbb234:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb238:	14000002	b	0xfffff7fbb240
   0x0000fffff7fbb23c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbb240:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb244:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbb248:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb24c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb250:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb254:	17ffffde	b	0xfffff7fbb1cc
   0x0000fffff7fbb258:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb25c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb260:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb264:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb268:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fbb26c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb270:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb274:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbb278:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb27c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb280:	d63f0200	blr	x16
   0x0000fffff7fbb284:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb288:	54006780	b.eq	0xfffff7fbbf78  // b.none
   0x0000fffff7fbb28c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb290:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb294:	540004a0	b.eq	0xfffff7fbb328  // b.none
   0x0000fffff7fbb298:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb29c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb2a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb2a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb2a8:	54000400	b.eq	0xfffff7fbb328  // b.none
   0x0000fffff7fbb2ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb2b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb2b4:	36d801d1	tbz	w17, #27, 0xfffff7fbb2ec
   0x0000fffff7fbb2b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb2bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb2c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb2c4:	54000321	b.ne	0xfffff7fbb328  // b.any
   0x0000fffff7fbb2c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb2cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb2d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb2d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb2d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb2dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb2e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb2e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb2e8:	54000209	b.ls	0xfffff7fbb328  // b.plast
   0x0000fffff7fbb2ec:	36d8008d	tbz	w13, #27, 0xfffff7fbb2fc
   0x0000fffff7fbb2f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb2f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb2f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb2fc:	36d80091	tbz	w17, #27, 0xfffff7fbb30c
   0x0000fffff7fbb300:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb304:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb308:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb30c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbb310:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbb314:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb318:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb31c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbb320:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbb324:	1400000e	b	0xfffff7fbb35c
   0x0000fffff7fbb328:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb32c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb330:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb334:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb338:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fbb33c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb340:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb344:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbb348:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb34c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb350:	d63f0200	blr	x16
   0x0000fffff7fbb354:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb358:	54006140	b.eq	0xfffff7fbbf80  // b.none
   0x0000fffff7fbb35c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb360:	37d806a9	tbnz	w9, #27, 0xfffff7fbb434
   0x0000fffff7fbb364:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb368:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb36c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb370:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb374:	540001c1	b.ne	0xfffff7fbb3ac  // b.any
   0x0000fffff7fbb378:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb37c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb380:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb384:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb388:	54000121	b.ne	0xfffff7fbb3ac  // b.any
   0x0000fffff7fbb38c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb390:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbb394:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb398:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb39c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb3a0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbb3a4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb3a8:	14000030	b	0xfffff7fbb468
   0x0000fffff7fbb3ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb3b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb3b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb3b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb3bc:	54000120	b.eq	0xfffff7fbb3e0  // b.none
   0x0000fffff7fbb3c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb3c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb3c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb3cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb3d0:	54000321	b.ne	0xfffff7fbb434  // b.any
   0x0000fffff7fbb3d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb3d8:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb3dc:	14000002	b	0xfffff7fbb3e4
   0x0000fffff7fbb3e0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbb3e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb3e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb3ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb3f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb3f4:	54000120	b.eq	0xfffff7fbb418  // b.none
   0x0000fffff7fbb3f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb3fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb404:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb408:	54000161	b.ne	0xfffff7fbb434  // b.any
   0x0000fffff7fbb40c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbb410:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb414:	14000002	b	0xfffff7fbb41c
   0x0000fffff7fbb418:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbb41c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb420:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbb424:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb42c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb430:	17ffffde	b	0xfffff7fbb3a8
   0x0000fffff7fbb434:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb438:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb43c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb440:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb444:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fbb448:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb44c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb450:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbb454:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb458:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb45c:	d63f0200	blr	x16
   0x0000fffff7fbb460:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb464:	54005920	b.eq	0xfffff7fbbf88  // b.none
   0x0000fffff7fbb468:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb46c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb470:	540004a0	b.eq	0xfffff7fbb504  // b.none
   0x0000fffff7fbb474:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb478:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb47c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb480:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb484:	54000400	b.eq	0xfffff7fbb504  // b.none
   0x0000fffff7fbb488:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb48c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb490:	36d801d1	tbz	w17, #27, 0xfffff7fbb4c8
   0x0000fffff7fbb494:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb498:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb49c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb4a0:	54000321	b.ne	0xfffff7fbb504  // b.any
   0x0000fffff7fbb4a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb4a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb4ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb4b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb4b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb4b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb4bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb4c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb4c4:	54000209	b.ls	0xfffff7fbb504  // b.plast
   0x0000fffff7fbb4c8:	36d8008d	tbz	w13, #27, 0xfffff7fbb4d8
   0x0000fffff7fbb4cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb4d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb4d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb4d8:	36d80091	tbz	w17, #27, 0xfffff7fbb4e8
   0x0000fffff7fbb4dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb4e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb4e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb4e8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbb4ec:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbb4f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb4f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb4f8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbb4fc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbb500:	1400000e	b	0xfffff7fbb538
   0x0000fffff7fbb504:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb508:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb50c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb510:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb514:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fbb518:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb51c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb520:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbb524:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb528:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb52c:	d63f0200	blr	x16
   0x0000fffff7fbb530:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb534:	540052e0	b.eq	0xfffff7fbbf90  // b.none
   0x0000fffff7fbb538:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb53c:	37d806a9	tbnz	w9, #27, 0xfffff7fbb610
   0x0000fffff7fbb540:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb544:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb548:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb54c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb550:	540001c1	b.ne	0xfffff7fbb588  // b.any
   0x0000fffff7fbb554:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb558:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb55c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb560:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb564:	54000121	b.ne	0xfffff7fbb588  // b.any
   0x0000fffff7fbb568:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb56c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbb570:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb574:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb578:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb57c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbb580:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb584:	14000030	b	0xfffff7fbb644
   0x0000fffff7fbb588:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb58c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb594:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb598:	54000120	b.eq	0xfffff7fbb5bc  // b.none
   0x0000fffff7fbb59c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb5a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb5a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5ac:	54000321	b.ne	0xfffff7fbb610  // b.any
   0x0000fffff7fbb5b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb5b4:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb5b8:	14000002	b	0xfffff7fbb5c0
   0x0000fffff7fbb5bc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbb5c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb5c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb5c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5d0:	54000120	b.eq	0xfffff7fbb5f4  // b.none
   0x0000fffff7fbb5d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb5d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb5dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb5e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb5e4:	54000161	b.ne	0xfffff7fbb610  // b.any
   0x0000fffff7fbb5e8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbb5ec:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb5f0:	14000002	b	0xfffff7fbb5f8
   0x0000fffff7fbb5f4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbb5f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb5fc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbb600:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb608:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb60c:	17ffffde	b	0xfffff7fbb584
   0x0000fffff7fbb610:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb614:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb618:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb61c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb620:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fbb624:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb628:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb62c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbb630:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb634:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb638:	d63f0200	blr	x16
   0x0000fffff7fbb63c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb640:	54004ac0	b.eq	0xfffff7fbbf98  // b.none
   0x0000fffff7fbb644:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb648:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb64c:	540004a0	b.eq	0xfffff7fbb6e0  // b.none
   0x0000fffff7fbb650:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb654:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb658:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb65c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb660:	54000400	b.eq	0xfffff7fbb6e0  // b.none
   0x0000fffff7fbb664:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb668:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb66c:	36d801d1	tbz	w17, #27, 0xfffff7fbb6a4
   0x0000fffff7fbb670:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb674:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb678:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb67c:	54000321	b.ne	0xfffff7fbb6e0  // b.any
   0x0000fffff7fbb680:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb684:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb688:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb68c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb690:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb694:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb698:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb69c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb6a0:	54000209	b.ls	0xfffff7fbb6e0  // b.plast
   0x0000fffff7fbb6a4:	36d8008d	tbz	w13, #27, 0xfffff7fbb6b4
   0x0000fffff7fbb6a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb6ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb6b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb6b4:	36d80091	tbz	w17, #27, 0xfffff7fbb6c4
   0x0000fffff7fbb6b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb6bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb6c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb6c4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbb6c8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbb6cc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb6d0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb6d4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbb6d8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbb6dc:	1400000e	b	0xfffff7fbb714
   0x0000fffff7fbb6e0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb6e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb6e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb6ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb6f0:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fbb6f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb6f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb6fc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbb700:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb704:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb708:	d63f0200	blr	x16
   0x0000fffff7fbb70c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb710:	54004480	b.eq	0xfffff7fbbfa0  // b.none
   0x0000fffff7fbb714:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb718:	37d806a9	tbnz	w9, #27, 0xfffff7fbb7ec
   0x0000fffff7fbb71c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb720:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb724:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb728:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb72c:	540001c1	b.ne	0xfffff7fbb764  // b.any
   0x0000fffff7fbb730:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb734:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb738:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb73c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb740:	54000121	b.ne	0xfffff7fbb764  // b.any
   0x0000fffff7fbb744:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb748:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbb74c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb750:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb754:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb758:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbb75c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb760:	14000030	b	0xfffff7fbb820
   0x0000fffff7fbb764:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb768:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb76c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb770:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb774:	54000120	b.eq	0xfffff7fbb798  // b.none
   0x0000fffff7fbb778:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb77c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb784:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb788:	54000321	b.ne	0xfffff7fbb7ec  // b.any
   0x0000fffff7fbb78c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb790:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb794:	14000002	b	0xfffff7fbb79c
   0x0000fffff7fbb798:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbb79c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb7a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb7a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb7a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb7ac:	54000120	b.eq	0xfffff7fbb7d0  // b.none
   0x0000fffff7fbb7b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb7b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb7b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb7bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb7c0:	54000161	b.ne	0xfffff7fbb7ec  // b.any
   0x0000fffff7fbb7c4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbb7c8:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb7cc:	14000002	b	0xfffff7fbb7d4
   0x0000fffff7fbb7d0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbb7d4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb7d8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbb7dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb7e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb7e4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb7e8:	17ffffde	b	0xfffff7fbb760
   0x0000fffff7fbb7ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb7f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb7f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb7f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb7fc:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fbb800:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb804:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb808:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbb80c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb810:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb814:	d63f0200	blr	x16
   0x0000fffff7fbb818:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb81c:	54003c60	b.eq	0xfffff7fbbfa8  // b.none
   0x0000fffff7fbb820:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb824:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb828:	540004a0	b.eq	0xfffff7fbb8bc  // b.none
   0x0000fffff7fbb82c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb830:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb834:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb838:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb83c:	54000400	b.eq	0xfffff7fbb8bc  // b.none
   0x0000fffff7fbb840:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb844:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb848:	36d801d1	tbz	w17, #27, 0xfffff7fbb880
   0x0000fffff7fbb84c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb850:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb854:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb858:	54000321	b.ne	0xfffff7fbb8bc  // b.any
   0x0000fffff7fbb85c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb860:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb864:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb868:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb86c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb870:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb874:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb878:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb87c:	54000209	b.ls	0xfffff7fbb8bc  // b.plast
   0x0000fffff7fbb880:	36d8008d	tbz	w13, #27, 0xfffff7fbb890
   0x0000fffff7fbb884:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb888:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb88c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb890:	36d80091	tbz	w17, #27, 0xfffff7fbb8a0
   0x0000fffff7fbb894:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb898:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb89c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb8a0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbb8a4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbb8a8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb8ac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb8b0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbb8b4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbb8b8:	1400000e	b	0xfffff7fbb8f0
   0x0000fffff7fbb8bc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb8c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb8c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb8c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb8cc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fbb8d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb8d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb8d8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbb8dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb8e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb8e4:	d63f0200	blr	x16
   0x0000fffff7fbb8e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb8ec:	54003620	b.eq	0xfffff7fbbfb0  // b.none
   0x0000fffff7fbb8f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb8f4:	37d806a9	tbnz	w9, #27, 0xfffff7fbb9c8
   0x0000fffff7fbb8f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb8fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb900:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb904:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb908:	540001c1	b.ne	0xfffff7fbb940  // b.any
   0x0000fffff7fbb90c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb910:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb918:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb91c:	54000121	b.ne	0xfffff7fbb940  // b.any
   0x0000fffff7fbb920:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb924:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbb928:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb92c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb934:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbb938:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb93c:	14000030	b	0xfffff7fbb9fc
   0x0000fffff7fbb940:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb944:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb94c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb950:	54000120	b.eq	0xfffff7fbb974  // b.none
   0x0000fffff7fbb954:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb95c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb964:	54000321	b.ne	0xfffff7fbb9c8  // b.any
   0x0000fffff7fbb968:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb96c:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb970:	14000002	b	0xfffff7fbb978
   0x0000fffff7fbb974:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbb978:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb97c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb984:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb988:	54000120	b.eq	0xfffff7fbb9ac  // b.none
   0x0000fffff7fbb98c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbb990:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb998:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb99c:	54000161	b.ne	0xfffff7fbb9c8  // b.any
   0x0000fffff7fbb9a0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbb9a4:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb9a8:	14000002	b	0xfffff7fbb9b0
   0x0000fffff7fbb9ac:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbb9b0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb9b4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbb9b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb9bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb9c0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb9c4:	17ffffde	b	0xfffff7fbb93c
   0x0000fffff7fbb9c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb9cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb9d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb9d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb9d8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fbb9dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb9e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb9e4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbb9e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb9ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb9f0:	d63f0200	blr	x16
   0x0000fffff7fbb9f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb9f8:	54002e00	b.eq	0xfffff7fbbfb8  // b.none
   0x0000fffff7fbb9fc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbba00:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbba04:	540004a0	b.eq	0xfffff7fbba98  // b.none
   0x0000fffff7fbba08:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbba0c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbba10:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbba14:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbba18:	54000400	b.eq	0xfffff7fbba98  // b.none
   0x0000fffff7fbba1c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbba20:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbba24:	36d801d1	tbz	w17, #27, 0xfffff7fbba5c
   0x0000fffff7fbba28:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbba2c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbba30:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbba34:	54000321	b.ne	0xfffff7fbba98  // b.any
   0x0000fffff7fbba38:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbba3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbba40:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbba44:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbba48:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbba4c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbba50:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbba54:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbba58:	54000209	b.ls	0xfffff7fbba98  // b.plast
   0x0000fffff7fbba5c:	36d8008d	tbz	w13, #27, 0xfffff7fbba6c
   0x0000fffff7fbba60:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbba64:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbba68:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbba6c:	36d80091	tbz	w17, #27, 0xfffff7fbba7c
   0x0000fffff7fbba70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbba74:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbba78:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbba7c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbba80:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbba84:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbba88:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbba8c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbba90:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbba94:	1400000e	b	0xfffff7fbbacc
   0x0000fffff7fbba98:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbba9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbaa0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbaa4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbaa8:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fbbaac:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbab0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbab4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbbab8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbbabc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbac0:	d63f0200	blr	x16
   0x0000fffff7fbbac4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbac8:	540027c0	b.eq	0xfffff7fbbfc0  // b.none
   0x0000fffff7fbbacc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbad0:	37d806a9	tbnz	w9, #27, 0xfffff7fbbba4
   0x0000fffff7fbbad4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbad8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbadc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbae0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbae4:	540001c1	b.ne	0xfffff7fbbb1c  // b.any
   0x0000fffff7fbbae8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbbaec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbaf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbaf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbaf8:	54000121	b.ne	0xfffff7fbbb1c  // b.any
   0x0000fffff7fbbafc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbbb00:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbbb04:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbbb08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbb0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbb10:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbbb14:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbbb18:	14000030	b	0xfffff7fbbbd8
   0x0000fffff7fbbb1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbb20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbb24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbb28:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbb2c:	54000120	b.eq	0xfffff7fbbb50  // b.none
   0x0000fffff7fbbb30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbb34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbb38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbb3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbb40:	54000321	b.ne	0xfffff7fbbba4  // b.any
   0x0000fffff7fbbb44:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbbb48:	9e620120	scvtf	d0, x9
   0x0000fffff7fbbb4c:	14000002	b	0xfffff7fbbb54
   0x0000fffff7fbbb50:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbbb54:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbbb58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbb5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbb60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbb64:	54000120	b.eq	0xfffff7fbbb88  // b.none
   0x0000fffff7fbbb68:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbbb6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbb70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbb74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbb78:	54000161	b.ne	0xfffff7fbbba4  // b.any
   0x0000fffff7fbbb7c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbbb80:	9e620121	scvtf	d1, x9
   0x0000fffff7fbbb84:	14000002	b	0xfffff7fbbb8c
   0x0000fffff7fbbb88:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbbb8c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbbb90:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbbb94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbb98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbb9c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbbba0:	17ffffde	b	0xfffff7fbbb18
   0x0000fffff7fbbba4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbba8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbbac:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbbb0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbbb4:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fbbbb8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbbbc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbbc0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbbbc4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbbc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbbcc:	d63f0200	blr	x16
   0x0000fffff7fbbbd0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbbd4:	54001fa0	b.eq	0xfffff7fbbfc8  // b.none
   0x0000fffff7fbbbd8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbbbdc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbbbe0:	540004a0	b.eq	0xfffff7fbbc74  // b.none
   0x0000fffff7fbbbe4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbbbe8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbbbec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbbbf0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbbbf4:	54000400	b.eq	0xfffff7fbbc74  // b.none
   0x0000fffff7fbbbf8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbbbfc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbbc00:	36d801d1	tbz	w17, #27, 0xfffff7fbbc38
   0x0000fffff7fbbc04:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbc08:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbc0c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbc10:	54000321	b.ne	0xfffff7fbbc74  // b.any
   0x0000fffff7fbbc14:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbbc18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbc1c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbc20:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbc24:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbc28:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbc2c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbc30:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbc34:	54000209	b.ls	0xfffff7fbbc74  // b.plast
   0x0000fffff7fbbc38:	36d8008d	tbz	w13, #27, 0xfffff7fbbc48
   0x0000fffff7fbbc3c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbbc40:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbbc44:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbbc48:	36d80091	tbz	w17, #27, 0xfffff7fbbc58
   0x0000fffff7fbbc4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbc50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbc54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbc58:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbbc5c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbbc60:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbbc64:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbbc68:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbbc6c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbbc70:	1400000e	b	0xfffff7fbbca8
   0x0000fffff7fbbc74:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbbc78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbc7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbc80:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbc84:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fbbc88:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbc8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbc90:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbbc94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbbc98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbc9c:	d63f0200	blr	x16
   0x0000fffff7fbbca0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbca4:	54001960	b.eq	0xfffff7fbbfd0  // b.none
   0x0000fffff7fbbca8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbcac:	37d806a9	tbnz	w9, #27, 0xfffff7fbbd80
   0x0000fffff7fbbcb0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbcb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbcb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbcbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbcc0:	540001c1	b.ne	0xfffff7fbbcf8  // b.any
   0x0000fffff7fbbcc4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbbcc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbcd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbcd4:	54000121	b.ne	0xfffff7fbbcf8  // b.any
   0x0000fffff7fbbcd8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbbcdc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbbce0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbbce4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbce8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbcec:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbbcf0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbbcf4:	14000030	b	0xfffff7fbbdb4
   0x0000fffff7fbbcf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbcfc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbd00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbd04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbd08:	54000120	b.eq	0xfffff7fbbd2c  // b.none
   0x0000fffff7fbbd0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbbd10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbd14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbd18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbd1c:	54000321	b.ne	0xfffff7fbbd80  // b.any
   0x0000fffff7fbbd20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbbd24:	9e620120	scvtf	d0, x9
   0x0000fffff7fbbd28:	14000002	b	0xfffff7fbbd30
   0x0000fffff7fbbd2c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbbd30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbbd34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbd38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbd3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbd40:	54000120	b.eq	0xfffff7fbbd64  // b.none
   0x0000fffff7fbbd44:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbbd48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbd4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbd50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbd54:	54000161	b.ne	0xfffff7fbbd80  // b.any
   0x0000fffff7fbbd58:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbbd5c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbbd60:	14000002	b	0xfffff7fbbd68
   0x0000fffff7fbbd64:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbbd68:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbbd6c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbbd70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbbd74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbd78:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbbd7c:	17ffffde	b	0xfffff7fbbcf4
   0x0000fffff7fbbd80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbd84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbd88:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbd8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbd90:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fbbd94:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbd98:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbd9c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbbda0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbda4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbda8:	d63f0200	blr	x16
   0x0000fffff7fbbdac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbdb0:	54001140	b.eq	0xfffff7fbbfd8  // b.none
   0x0000fffff7fbbdb4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbbdb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbdbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbdc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbbdc4:	54000381	b.ne	0xfffff7fbbe34  // b.any
   0x0000fffff7fbbdc8:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fbbdcc:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fbbdd0:	8b0a018b	add	x11, x12, x10
   0x0000fffff7fbbdd4:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fbbdd8:	36d80211	tbz	w17, #27, 0xfffff7fbbe18
   0x0000fffff7fbbddc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbbde0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbbde4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbbde8:	54000261	b.ne	0xfffff7fbbe34  // b.any
   0x0000fffff7fbbdec:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbbdf0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbbdf4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbbdf8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbbdfc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbbe00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbbe04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbbe08:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbbe0c:	54000149	b.ls	0xfffff7fbbe34  // b.plast
   0x0000fffff7fbbe10:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbbe14:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbbe18:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbbe1c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbbe20:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbbe24:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbbe28:	f9002e6b	str	x11, [x19, #88]
   0x0000fffff7fbbe2c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fbbe30:	1400000e	b	0xfffff7fbbe68
   0x0000fffff7fbbe34:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbe38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbe3c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbe40:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbe44:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fbbe48:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbe4c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbe50:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fbbe54:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbbe58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbe5c:	d63f0200	blr	x16
   0x0000fffff7fbbe60:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbbe64:	54000be0	b.eq	0xfffff7fbbfe0  // b.none
   0x0000fffff7fbbe68:	17fff8c6	b	0xfffff7fba180
   0x0000fffff7fbbe6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbbe70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbbe74:	aa1303e1	mov	x1, x19
   0x0000fffff7fbbe78:	aa1503e2	mov	x2, x21
   0x0000fffff7fbbe7c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fbbe80:	aa1403e4	mov	x4, x20
   0x0000fffff7fbbe84:	aa1603e5	mov	x5, x22
   0x0000fffff7fbbe88:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fbbe8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbbe90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbbe94:	d63f0200	blr	x16
   0x0000fffff7fbbe98:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbbe9c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbbea0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbbea4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbbea8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbbeac:	d65f03c0	ret
   0x0000fffff7fbbeb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbbeb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbbeb8:	b900028a	str	w10, [x20]
   0x0000fffff7fbbebc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbbec0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbbec4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbbec8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbbecc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbbed0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbbed4:	d65f03c0	ret
   0x0000fffff7fbbed8:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbbedc:	17fffff5	b	0xfffff7fbbeb0
   0x0000fffff7fbbee0:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fbbee4:	17fffff3	b	0xfffff7fbbeb0
   0x0000fffff7fbbee8:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fbbeec:	17fffff1	b	0xfffff7fbbeb0
   0x0000fffff7fbbef0:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbbef4:	17ffffef	b	0xfffff7fbbeb0
   0x0000fffff7fbbef8:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbbefc:	17ffffed	b	0xfffff7fbbeb0
   0x0000fffff7fbbf00:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbbf04:	17ffffeb	b	0xfffff7fbbeb0
   0x0000fffff7fbbf08:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbbf0c:	17ffffe9	b	0xfffff7fbbeb0
   0x0000fffff7fbbf10:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbbf14:	17ffffe7	b	0xfffff7fbbeb0
   0x0000fffff7fbbf18:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbbf1c:	17ffffe5	b	0xfffff7fbbeb0
   0x0000fffff7fbbf20:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbbf24:	17ffffe3	b	0xfffff7fbbeb0
   0x0000fffff7fbbf28:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fbbf2c:	17ffffe1	b	0xfffff7fbbeb0
   0x0000fffff7fbbf30:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fbbf34:	17ffffdf	b	0xfffff7fbbeb0
   0x0000fffff7fbbf38:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fbbf3c:	17ffffdd	b	0xfffff7fbbeb0
   0x0000fffff7fbbf40:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fbbf44:	17ffffdb	b	0xfffff7fbbeb0
   0x0000fffff7fbbf48:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fbbf4c:	17ffffd9	b	0xfffff7fbbeb0
   0x0000fffff7fbbf50:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fbbf54:	17ffffd7	b	0xfffff7fbbeb0
   0x0000fffff7fbbf58:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fbbf5c:	17ffffd5	b	0xfffff7fbbeb0
   0x0000fffff7fbbf60:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fbbf64:	17ffffd3	b	0xfffff7fbbeb0
   0x0000fffff7fbbf68:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fbbf6c:	17ffffd1	b	0xfffff7fbbeb0
   0x0000fffff7fbbf70:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fbbf74:	17ffffcf	b	0xfffff7fbbeb0
   0x0000fffff7fbbf78:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fbbf7c:	17ffffcd	b	0xfffff7fbbeb0
   0x0000fffff7fbbf80:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fbbf84:	17ffffcb	b	0xfffff7fbbeb0
   0x0000fffff7fbbf88:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fbbf8c:	17ffffc9	b	0xfffff7fbbeb0
   0x0000fffff7fbbf90:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fbbf94:	17ffffc7	b	0xfffff7fbbeb0
   0x0000fffff7fbbf98:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fbbf9c:	17ffffc5	b	0xfffff7fbbeb0
   0x0000fffff7fbbfa0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fbbfa4:	17ffffc3	b	0xfffff7fbbeb0
   0x0000fffff7fbbfa8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fbbfac:	17ffffc1	b	0xfffff7fbbeb0
   0x0000fffff7fbbfb0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fbbfb4:	17ffffbf	b	0xfffff7fbbeb0
   0x0000fffff7fbbfb8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fbbfbc:	17ffffbd	b	0xfffff7fbbeb0
   0x0000fffff7fbbfc0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fbbfc4:	17ffffbb	b	0xfffff7fbbeb0
   0x0000fffff7fbbfc8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fbbfcc:	17ffffb9	b	0xfffff7fbbeb0
   0x0000fffff7fbbfd0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fbbfd4:	17ffffb7	b	0xfffff7fbbeb0
   0x0000fffff7fbbfd8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fbbfdc:	17ffffb5	b	0xfffff7fbbeb0
   0x0000fffff7fbbfe0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fbbfe4:	17ffffb3	b	0xfffff7fbbeb0
   0x0000fffff7fbbfe8:	00000000	udf	#0
   0x0000fffff7fbbfec:	00000000	udf	#0
   0x0000fffff7fbbff0:	00000000	udf	#0
   0x0000fffff7fbbff4:	00000000	udf	#0
   0x0000fffff7fbbff8:	00000000	udf	#0
   0x0000fffff7fbbffc:	00000000	udf	#0
End of assembler dump.
