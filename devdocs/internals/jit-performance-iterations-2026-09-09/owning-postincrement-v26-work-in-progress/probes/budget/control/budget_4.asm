Dump of assembler code from 0xfffff7fba000 to 0xfffff7fbb000:
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
   0x0000fffff7fba058:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fba05c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fba060:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fba064:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fba068:	36d80211	tbz	w17, #27, 0xfffff7fba0a8
   0x0000fffff7fba06c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba070:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba074:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba078:	540001e1	b.ne	0xfffff7fba0b4  // b.any
   0x0000fffff7fba07c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fba080:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba084:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba088:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba08c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba090:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba094:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba098:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba09c:	540000c9	b.ls	0xfffff7fba0b4  // b.plast
   0x0000fffff7fba0a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba0a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba0a8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fba0ac:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fba0b0:	1400000e	b	0xfffff7fba0e8
   0x0000fffff7fba0b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba0b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba0bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fba0c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fba0c4:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fba0c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fba0cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fba0d0:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fba0d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba0d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba0dc:	d63f0200	blr	x16
   0x0000fffff7fba0e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba0e4:	54005920	b.eq	0xfffff7fbac08  // b.none
   0x0000fffff7fba0e8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fba0ec:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fba0f0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fba0f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fba0f8:	36d80211	tbz	w17, #27, 0xfffff7fba138
   0x0000fffff7fba0fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba104:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba108:	540001e1	b.ne	0xfffff7fba144  // b.any
   0x0000fffff7fba10c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fba110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba11c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba128:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba12c:	540000c9	b.ls	0xfffff7fba144  // b.plast
   0x0000fffff7fba130:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba134:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba138:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fba13c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fba140:	1400000e	b	0xfffff7fba178
   0x0000fffff7fba144:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba14c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba150:	aa1503e2	mov	x2, x21
   0x0000fffff7fba154:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fba158:	aa1403e4	mov	x4, x20
   0x0000fffff7fba15c:	aa1603e5	mov	x5, x22
   0x0000fffff7fba160:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fba164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba16c:	d63f0200	blr	x16
   0x0000fffff7fba170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba174:	540054e0	b.eq	0xfffff7fbac10  // b.none
   0x0000fffff7fba178:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fba17c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba184:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba188:	54000421	b.ne	0xfffff7fba20c  // b.any
   0x0000fffff7fba18c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fba190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba198:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba19c:	54000381	b.ne	0xfffff7fba20c  // b.any
   0x0000fffff7fba1a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fba1a4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fba1a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba1ac:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fba1b0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fba1b4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fba1b8:	91000580	add	x0, x12, #0x1
   0x0000fffff7fba1bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba1c0:	36d80211	tbz	w17, #27, 0xfffff7fba200
   0x0000fffff7fba1c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba1c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba1cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba1d0:	540001e1	b.ne	0xfffff7fba20c  // b.any
   0x0000fffff7fba1d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba1d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba1dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba1e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba1e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba1e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba1ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba1f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba1f4:	540000c9	b.ls	0xfffff7fba20c  // b.plast
   0x0000fffff7fba1f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba1fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba200:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fba204:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fba208:	1400000e	b	0xfffff7fba240
   0x0000fffff7fba20c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba210:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba214:	aa1303e1	mov	x1, x19
   0x0000fffff7fba218:	aa1503e2	mov	x2, x21
   0x0000fffff7fba21c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fba220:	aa1403e4	mov	x4, x20
   0x0000fffff7fba224:	aa1603e5	mov	x5, x22
   0x0000fffff7fba228:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fba22c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba230:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba234:	d63f0200	blr	x16
   0x0000fffff7fba238:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba23c:	54004ee0	b.eq	0xfffff7fbac18  // b.none
   0x0000fffff7fba240:	f100041f	cmp	x0, #0x1
   0x0000fffff7fba244:	54004ac0	b.eq	0xfffff7fbab9c  // b.none
   0x0000fffff7fba248:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fba24c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fba250:	d299c60c	mov	x12, #0xce30                	// #52784
   0x0000fffff7fba254:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fba258:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fba25c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fba260:	36d801d1	tbz	w17, #27, 0xfffff7fba298
   0x0000fffff7fba264:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba268:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba26c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba270:	54000281	b.ne	0xfffff7fba2c0  // b.any
   0x0000fffff7fba274:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fba278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba27c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba280:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba284:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba288:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba28c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba290:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba294:	54000169	b.ls	0xfffff7fba2c0  // b.plast
   0x0000fffff7fba298:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba29c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba2a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba2a4:	36d80091	tbz	w17, #27, 0xfffff7fba2b4
   0x0000fffff7fba2a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba2ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba2b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba2b4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fba2b8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fba2bc:	1400000e	b	0xfffff7fba2f4
   0x0000fffff7fba2c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba2c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba2c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fba2cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fba2d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fba2d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fba2d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fba2dc:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fba2e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba2e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba2e8:	d63f0200	blr	x16
   0x0000fffff7fba2ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba2f0:	54004980	b.eq	0xfffff7fbac20  // b.none
   0x0000fffff7fba2f4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fba2f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba2fc:	540003a0	b.eq	0xfffff7fba370  // b.none
   0x0000fffff7fba300:	b940426d	ldr	w13, [x19, #64]
   0x0000fffff7fba304:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7fba308:	b9400171	ldr	w17, [x11]
   0x0000fffff7fba30c:	36d801d1	tbz	w17, #27, 0xfffff7fba344
   0x0000fffff7fba310:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba314:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba318:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba31c:	540002a1	b.ne	0xfffff7fba370  // b.any
   0x0000fffff7fba320:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fba324:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba328:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba32c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba330:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba334:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba338:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba33c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba340:	54000189	b.ls	0xfffff7fba370  // b.plast
   0x0000fffff7fba344:	36d8008d	tbz	w13, #27, 0xfffff7fba354
   0x0000fffff7fba348:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba34c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba350:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba354:	36d80091	tbz	w17, #27, 0xfffff7fba364
   0x0000fffff7fba358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba35c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba360:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba364:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fba368:	b900016d	str	w13, [x11]
   0x0000fffff7fba36c:	1400000e	b	0xfffff7fba3a4
   0x0000fffff7fba370:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fba374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba378:	aa1303e1	mov	x1, x19
   0x0000fffff7fba37c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba380:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fba384:	aa1403e4	mov	x4, x20
   0x0000fffff7fba388:	aa1603e5	mov	x5, x22
   0x0000fffff7fba38c:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fba390:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba398:	d63f0200	blr	x16
   0x0000fffff7fba39c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba3a0:	54004440	b.eq	0xfffff7fbac28  // b.none
   0x0000fffff7fba3a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba3a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba3ac:	540004a0	b.eq	0xfffff7fba440  // b.none
   0x0000fffff7fba3b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba3b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba3b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba3bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba3c0:	54000400	b.eq	0xfffff7fba440  // b.none
   0x0000fffff7fba3c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba3c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba3cc:	36d801d1	tbz	w17, #27, 0xfffff7fba404
   0x0000fffff7fba3d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba3d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba3d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba3dc:	54000321	b.ne	0xfffff7fba440  // b.any
   0x0000fffff7fba3e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba3e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba3e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba3ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba3f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba3f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba3f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba3fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba400:	54000209	b.ls	0xfffff7fba440  // b.plast
   0x0000fffff7fba404:	36d8008d	tbz	w13, #27, 0xfffff7fba414
   0x0000fffff7fba408:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba40c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba410:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba414:	36d80091	tbz	w17, #27, 0xfffff7fba424
   0x0000fffff7fba418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba41c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba420:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba424:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fba428:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fba42c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba430:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba434:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fba438:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fba43c:	1400000e	b	0xfffff7fba474
   0x0000fffff7fba440:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba448:	aa1303e1	mov	x1, x19
   0x0000fffff7fba44c:	aa1503e2	mov	x2, x21
   0x0000fffff7fba450:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fba454:	aa1403e4	mov	x4, x20
   0x0000fffff7fba458:	aa1603e5	mov	x5, x22
   0x0000fffff7fba45c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fba460:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba468:	d63f0200	blr	x16
   0x0000fffff7fba46c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba470:	54003e00	b.eq	0xfffff7fbac30  // b.none
   0x0000fffff7fba474:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba478:	37d806a9	tbnz	w9, #27, 0xfffff7fba54c
   0x0000fffff7fba47c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba488:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba48c:	540001c1	b.ne	0xfffff7fba4c4  // b.any
   0x0000fffff7fba490:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba49c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba4a0:	54000121	b.ne	0xfffff7fba4c4  // b.any
   0x0000fffff7fba4a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba4a8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fba4ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba4b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba4b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba4b8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fba4bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba4c0:	14000030	b	0xfffff7fba580
   0x0000fffff7fba4c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba4c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba4cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba4d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba4d4:	54000120	b.eq	0xfffff7fba4f8  // b.none
   0x0000fffff7fba4d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba4dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba4e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba4e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba4e8:	54000321	b.ne	0xfffff7fba54c  // b.any
   0x0000fffff7fba4ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba4f0:	9e620120	scvtf	d0, x9
   0x0000fffff7fba4f4:	14000002	b	0xfffff7fba4fc
   0x0000fffff7fba4f8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fba4fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba500:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba508:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba50c:	54000120	b.eq	0xfffff7fba530  // b.none
   0x0000fffff7fba510:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba51c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba520:	54000161	b.ne	0xfffff7fba54c  // b.any
   0x0000fffff7fba524:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fba528:	9e620121	scvtf	d1, x9
   0x0000fffff7fba52c:	14000002	b	0xfffff7fba534
   0x0000fffff7fba530:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fba534:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba538:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fba53c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba544:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba548:	17ffffde	b	0xfffff7fba4c0
   0x0000fffff7fba54c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba554:	aa1303e1	mov	x1, x19
   0x0000fffff7fba558:	aa1503e2	mov	x2, x21
   0x0000fffff7fba55c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fba560:	aa1403e4	mov	x4, x20
   0x0000fffff7fba564:	aa1603e5	mov	x5, x22
   0x0000fffff7fba568:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fba56c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba574:	d63f0200	blr	x16
   0x0000fffff7fba578:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba57c:	540035e0	b.eq	0xfffff7fbac38  // b.none
   0x0000fffff7fba580:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba584:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba588:	540004a0	b.eq	0xfffff7fba61c  // b.none
   0x0000fffff7fba58c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba590:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba594:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba598:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba59c:	54000400	b.eq	0xfffff7fba61c  // b.none
   0x0000fffff7fba5a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba5a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba5a8:	36d801d1	tbz	w17, #27, 0xfffff7fba5e0
   0x0000fffff7fba5ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba5b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba5b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba5b8:	54000321	b.ne	0xfffff7fba61c  // b.any
   0x0000fffff7fba5bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba5c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba5c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba5c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba5cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba5d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba5d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba5d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba5dc:	54000209	b.ls	0xfffff7fba61c  // b.plast
   0x0000fffff7fba5e0:	36d8008d	tbz	w13, #27, 0xfffff7fba5f0
   0x0000fffff7fba5e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba5e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba5ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba5f0:	36d80091	tbz	w17, #27, 0xfffff7fba600
   0x0000fffff7fba5f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba5f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba5fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba600:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fba604:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fba608:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba60c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba610:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fba614:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fba618:	1400000e	b	0xfffff7fba650
   0x0000fffff7fba61c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba620:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba624:	aa1303e1	mov	x1, x19
   0x0000fffff7fba628:	aa1503e2	mov	x2, x21
   0x0000fffff7fba62c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fba630:	aa1403e4	mov	x4, x20
   0x0000fffff7fba634:	aa1603e5	mov	x5, x22
   0x0000fffff7fba638:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fba63c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba640:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba644:	d63f0200	blr	x16
   0x0000fffff7fba648:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba64c:	54002fa0	b.eq	0xfffff7fbac40  // b.none
   0x0000fffff7fba650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba654:	37d806a9	tbnz	w9, #27, 0xfffff7fba728
   0x0000fffff7fba658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba65c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba668:	540001c1	b.ne	0xfffff7fba6a0  // b.any
   0x0000fffff7fba66c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba67c:	54000121	b.ne	0xfffff7fba6a0  // b.any
   0x0000fffff7fba680:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba684:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fba688:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba68c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba694:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fba698:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba69c:	14000030	b	0xfffff7fba75c
   0x0000fffff7fba6a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba6a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba6a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba6ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba6b0:	54000120	b.eq	0xfffff7fba6d4  // b.none
   0x0000fffff7fba6b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba6b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba6bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba6c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba6c4:	54000321	b.ne	0xfffff7fba728  // b.any
   0x0000fffff7fba6c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba6cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fba6d0:	14000002	b	0xfffff7fba6d8
   0x0000fffff7fba6d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fba6d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba6dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba6e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba6e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba6e8:	54000120	b.eq	0xfffff7fba70c  // b.none
   0x0000fffff7fba6ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba6f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba6f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba6f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba6fc:	54000161	b.ne	0xfffff7fba728  // b.any
   0x0000fffff7fba700:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fba704:	9e620121	scvtf	d1, x9
   0x0000fffff7fba708:	14000002	b	0xfffff7fba710
   0x0000fffff7fba70c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fba710:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba714:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fba718:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba71c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba724:	17ffffde	b	0xfffff7fba69c
   0x0000fffff7fba728:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba72c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba730:	aa1303e1	mov	x1, x19
   0x0000fffff7fba734:	aa1503e2	mov	x2, x21
   0x0000fffff7fba738:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fba73c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba740:	aa1603e5	mov	x5, x22
   0x0000fffff7fba744:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fba748:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba74c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba750:	d63f0200	blr	x16
   0x0000fffff7fba754:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba758:	54002780	b.eq	0xfffff7fbac48  // b.none
   0x0000fffff7fba75c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba760:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba764:	540004a0	b.eq	0xfffff7fba7f8  // b.none
   0x0000fffff7fba768:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba76c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba770:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba774:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba778:	54000400	b.eq	0xfffff7fba7f8  // b.none
   0x0000fffff7fba77c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba780:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba784:	36d801d1	tbz	w17, #27, 0xfffff7fba7bc
   0x0000fffff7fba788:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba78c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba790:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba794:	54000321	b.ne	0xfffff7fba7f8  // b.any
   0x0000fffff7fba798:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba79c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba7a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba7a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba7a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba7ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba7b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba7b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba7b8:	54000209	b.ls	0xfffff7fba7f8  // b.plast
   0x0000fffff7fba7bc:	36d8008d	tbz	w13, #27, 0xfffff7fba7cc
   0x0000fffff7fba7c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba7c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba7c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba7cc:	36d80091	tbz	w17, #27, 0xfffff7fba7dc
   0x0000fffff7fba7d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba7d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba7d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba7dc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fba7e0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fba7e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba7e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba7ec:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fba7f0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fba7f4:	1400000e	b	0xfffff7fba82c
   0x0000fffff7fba7f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba7fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba800:	aa1303e1	mov	x1, x19
   0x0000fffff7fba804:	aa1503e2	mov	x2, x21
   0x0000fffff7fba808:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fba80c:	aa1403e4	mov	x4, x20
   0x0000fffff7fba810:	aa1603e5	mov	x5, x22
   0x0000fffff7fba814:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fba818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba81c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba820:	d63f0200	blr	x16
   0x0000fffff7fba824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba828:	54002140	b.eq	0xfffff7fbac50  // b.none
   0x0000fffff7fba82c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba830:	37d806a9	tbnz	w9, #27, 0xfffff7fba904
   0x0000fffff7fba834:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba83c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba840:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba844:	540001c1	b.ne	0xfffff7fba87c  // b.any
   0x0000fffff7fba848:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba84c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba854:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba858:	54000121	b.ne	0xfffff7fba87c  // b.any
   0x0000fffff7fba85c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba860:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fba864:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fba868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba86c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba870:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fba874:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba878:	14000030	b	0xfffff7fba938
   0x0000fffff7fba87c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba880:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba888:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba88c:	54000120	b.eq	0xfffff7fba8b0  // b.none
   0x0000fffff7fba890:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fba894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba89c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba8a0:	54000321	b.ne	0xfffff7fba904  // b.any
   0x0000fffff7fba8a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fba8a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fba8ac:	14000002	b	0xfffff7fba8b4
   0x0000fffff7fba8b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fba8b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba8b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba8bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba8c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba8c4:	54000120	b.eq	0xfffff7fba8e8  // b.none
   0x0000fffff7fba8c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fba8cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fba8d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba8d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fba8d8:	54000161	b.ne	0xfffff7fba904  // b.any
   0x0000fffff7fba8dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fba8e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fba8e4:	14000002	b	0xfffff7fba8ec
   0x0000fffff7fba8e8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fba8ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fba8f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fba8f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fba8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fba8fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fba900:	17ffffde	b	0xfffff7fba878
   0x0000fffff7fba904:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fba908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba90c:	aa1303e1	mov	x1, x19
   0x0000fffff7fba910:	aa1503e2	mov	x2, x21
   0x0000fffff7fba914:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fba918:	aa1403e4	mov	x4, x20
   0x0000fffff7fba91c:	aa1603e5	mov	x5, x22
   0x0000fffff7fba920:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fba924:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fba928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba92c:	d63f0200	blr	x16
   0x0000fffff7fba930:	f100001f	cmp	x0, #0x0
   0x0000fffff7fba934:	54001920	b.eq	0xfffff7fbac58  // b.none
   0x0000fffff7fba938:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fba93c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fba940:	540004a0	b.eq	0xfffff7fba9d4  // b.none
   0x0000fffff7fba944:	b940016d	ldr	w13, [x11]
   0x0000fffff7fba948:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fba94c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fba950:	eb0901bf	cmp	x13, x9
   0x0000fffff7fba954:	54000400	b.eq	0xfffff7fba9d4  // b.none
   0x0000fffff7fba958:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fba95c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fba960:	36d801d1	tbz	w17, #27, 0xfffff7fba998
   0x0000fffff7fba964:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fba968:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fba96c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fba970:	54000321	b.ne	0xfffff7fba9d4  // b.any
   0x0000fffff7fba974:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fba978:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba97c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fba980:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fba984:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fba988:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fba98c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fba990:	f100055f	cmp	x10, #0x1
   0x0000fffff7fba994:	54000209	b.ls	0xfffff7fba9d4  // b.plast
   0x0000fffff7fba998:	36d8008d	tbz	w13, #27, 0xfffff7fba9a8
   0x0000fffff7fba99c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fba9a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fba9a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fba9a8:	36d80091	tbz	w17, #27, 0xfffff7fba9b8
   0x0000fffff7fba9ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fba9b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fba9b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fba9b8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fba9bc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fba9c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fba9c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fba9c8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fba9cc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fba9d0:	1400000e	b	0xfffff7fbaa08
   0x0000fffff7fba9d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fba9d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fba9dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fba9e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fba9e4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fba9e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fba9ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fba9f0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fba9f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fba9f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fba9fc:	d63f0200	blr	x16
   0x0000fffff7fbaa00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbaa04:	540012e0	b.eq	0xfffff7fbac60  // b.none
   0x0000fffff7fbaa08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaa0c:	37d806a9	tbnz	w9, #27, 0xfffff7fbaae0
   0x0000fffff7fbaa10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaa14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaa18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaa20:	540001c1	b.ne	0xfffff7fbaa58  // b.any
   0x0000fffff7fbaa24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbaa28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaa2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaa34:	54000121	b.ne	0xfffff7fbaa58  // b.any
   0x0000fffff7fbaa38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbaa3c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fbaa40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbaa44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaa48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa4c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbaa50:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbaa54:	14000030	b	0xfffff7fbab14
   0x0000fffff7fbaa58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaa5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaa60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaa68:	54000120	b.eq	0xfffff7fbaa8c  // b.none
   0x0000fffff7fbaa6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbaa70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaa74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaa7c:	54000321	b.ne	0xfffff7fbaae0  // b.any
   0x0000fffff7fbaa80:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbaa84:	9e620120	scvtf	d0, x9
   0x0000fffff7fbaa88:	14000002	b	0xfffff7fbaa90
   0x0000fffff7fbaa8c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbaa90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbaa94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaa98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaa9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaaa0:	54000120	b.eq	0xfffff7fbaac4  // b.none
   0x0000fffff7fbaaa4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbaaa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbaaac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbaab4:	54000161	b.ne	0xfffff7fbaae0  // b.any
   0x0000fffff7fbaab8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fbaabc:	9e620121	scvtf	d1, x9
   0x0000fffff7fbaac0:	14000002	b	0xfffff7fbaac8
   0x0000fffff7fbaac4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fbaac8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbaacc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbaad0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbaad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbaad8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbaadc:	17ffffde	b	0xfffff7fbaa54
   0x0000fffff7fbaae0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbaae4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaae8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaaec:	aa1503e2	mov	x2, x21
   0x0000fffff7fbaaf0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fbaaf4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbaaf8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbaafc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fbab00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbab04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbab08:	d63f0200	blr	x16
   0x0000fffff7fbab0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbab10:	54000ac0	b.eq	0xfffff7fbac68  // b.none
   0x0000fffff7fbab14:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbab18:	37d80269	tbnz	w9, #27, 0xfffff7fbab64
   0x0000fffff7fbab1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbab20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbab24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbab28:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbab2c:	540001c1	b.ne	0xfffff7fbab64  // b.any
   0x0000fffff7fbab30:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbab34:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fbab38:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fbab3c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fbab40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbab44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbab48:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fbab4c:	aa0b03e9	mov	x9, x11
   0x0000fffff7fbab50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbab54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbab58:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbab5c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbab60:	1400000e	b	0xfffff7fbab98
   0x0000fffff7fbab64:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbab68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbab6c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbab70:	aa1503e2	mov	x2, x21
   0x0000fffff7fbab74:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fbab78:	aa1403e4	mov	x4, x20
   0x0000fffff7fbab7c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbab80:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fbab84:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbab88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbab8c:	d63f0200	blr	x16
   0x0000fffff7fbab90:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbab94:	540006e0	b.eq	0xfffff7fbac70  // b.none
   0x0000fffff7fbab98:	17fffd78	b	0xfffff7fba178
   0x0000fffff7fbab9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbaba0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbaba4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbaba8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbabac:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fbabb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbabb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbabb8:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fbabbc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbabc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbabc4:	d63f0200	blr	x16
   0x0000fffff7fbabc8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbabcc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbabd0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbabd4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbabd8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbabdc:	d65f03c0	ret
   0x0000fffff7fbabe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbabe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbabe8:	b900028a	str	w10, [x20]
   0x0000fffff7fbabec:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbabf0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbabf4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbabf8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbabfc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbac00:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbac04:	d65f03c0	ret
   0x0000fffff7fbac08:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fbac0c:	17fffff5	b	0xfffff7fbabe0
   0x0000fffff7fbac10:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fbac14:	17fffff3	b	0xfffff7fbabe0
   0x0000fffff7fbac18:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbac1c:	17fffff1	b	0xfffff7fbabe0
   0x0000fffff7fbac20:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fbac24:	17ffffef	b	0xfffff7fbabe0
   0x0000fffff7fbac28:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fbac2c:	17ffffed	b	0xfffff7fbabe0
   0x0000fffff7fbac30:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbac34:	17ffffeb	b	0xfffff7fbabe0
   0x0000fffff7fbac38:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbac3c:	17ffffe9	b	0xfffff7fbabe0
   0x0000fffff7fbac40:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbac44:	17ffffe7	b	0xfffff7fbabe0
   0x0000fffff7fbac48:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbac4c:	17ffffe5	b	0xfffff7fbabe0
   0x0000fffff7fbac50:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbac54:	17ffffe3	b	0xfffff7fbabe0
   0x0000fffff7fbac58:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbac5c:	17ffffe1	b	0xfffff7fbabe0
   0x0000fffff7fbac60:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbac64:	17ffffdf	b	0xfffff7fbabe0
   0x0000fffff7fbac68:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fbac6c:	17ffffdd	b	0xfffff7fbabe0
   0x0000fffff7fbac70:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fbac74:	17ffffdb	b	0xfffff7fbabe0
   0x0000fffff7fbac78:	00000000	udf	#0
   0x0000fffff7fbac7c:	00000000	udf	#0
   0x0000fffff7fbac80:	00000000	udf	#0
   0x0000fffff7fbac84:	00000000	udf	#0
   0x0000fffff7fbac88:	00000000	udf	#0
   0x0000fffff7fbac8c:	00000000	udf	#0
   0x0000fffff7fbac90:	00000000	udf	#0
   0x0000fffff7fbac94:	00000000	udf	#0
   0x0000fffff7fbac98:	00000000	udf	#0
   0x0000fffff7fbac9c:	00000000	udf	#0
   0x0000fffff7fbaca0:	00000000	udf	#0
   0x0000fffff7fbaca4:	00000000	udf	#0
   0x0000fffff7fbaca8:	00000000	udf	#0
   0x0000fffff7fbacac:	00000000	udf	#0
   0x0000fffff7fbacb0:	00000000	udf	#0
   0x0000fffff7fbacb4:	00000000	udf	#0
   0x0000fffff7fbacb8:	00000000	udf	#0
   0x0000fffff7fbacbc:	00000000	udf	#0
   0x0000fffff7fbacc0:	00000000	udf	#0
   0x0000fffff7fbacc4:	00000000	udf	#0
   0x0000fffff7fbacc8:	00000000	udf	#0
   0x0000fffff7fbaccc:	00000000	udf	#0
   0x0000fffff7fbacd0:	00000000	udf	#0
   0x0000fffff7fbacd4:	00000000	udf	#0
   0x0000fffff7fbacd8:	00000000	udf	#0
   0x0000fffff7fbacdc:	00000000	udf	#0
   0x0000fffff7fbace0:	00000000	udf	#0
   0x0000fffff7fbace4:	00000000	udf	#0
   0x0000fffff7fbace8:	00000000	udf	#0
   0x0000fffff7fbacec:	00000000	udf	#0
   0x0000fffff7fbacf0:	00000000	udf	#0
   0x0000fffff7fbacf4:	00000000	udf	#0
   0x0000fffff7fbacf8:	00000000	udf	#0
   0x0000fffff7fbacfc:	00000000	udf	#0
   0x0000fffff7fbad00:	00000000	udf	#0
   0x0000fffff7fbad04:	00000000	udf	#0
   0x0000fffff7fbad08:	00000000	udf	#0
   0x0000fffff7fbad0c:	00000000	udf	#0
   0x0000fffff7fbad10:	00000000	udf	#0
   0x0000fffff7fbad14:	00000000	udf	#0
   0x0000fffff7fbad18:	00000000	udf	#0
   0x0000fffff7fbad1c:	00000000	udf	#0
   0x0000fffff7fbad20:	00000000	udf	#0
   0x0000fffff7fbad24:	00000000	udf	#0
   0x0000fffff7fbad28:	00000000	udf	#0
   0x0000fffff7fbad2c:	00000000	udf	#0
   0x0000fffff7fbad30:	00000000	udf	#0
   0x0000fffff7fbad34:	00000000	udf	#0
   0x0000fffff7fbad38:	00000000	udf	#0
   0x0000fffff7fbad3c:	00000000	udf	#0
   0x0000fffff7fbad40:	00000000	udf	#0
   0x0000fffff7fbad44:	00000000	udf	#0
   0x0000fffff7fbad48:	00000000	udf	#0
   0x0000fffff7fbad4c:	00000000	udf	#0
   0x0000fffff7fbad50:	00000000	udf	#0
   0x0000fffff7fbad54:	00000000	udf	#0
   0x0000fffff7fbad58:	00000000	udf	#0
   0x0000fffff7fbad5c:	00000000	udf	#0
   0x0000fffff7fbad60:	00000000	udf	#0
   0x0000fffff7fbad64:	00000000	udf	#0
   0x0000fffff7fbad68:	00000000	udf	#0
   0x0000fffff7fbad6c:	00000000	udf	#0
   0x0000fffff7fbad70:	00000000	udf	#0
   0x0000fffff7fbad74:	00000000	udf	#0
   0x0000fffff7fbad78:	00000000	udf	#0
   0x0000fffff7fbad7c:	00000000	udf	#0
   0x0000fffff7fbad80:	00000000	udf	#0
   0x0000fffff7fbad84:	00000000	udf	#0
   0x0000fffff7fbad88:	00000000	udf	#0
   0x0000fffff7fbad8c:	00000000	udf	#0
   0x0000fffff7fbad90:	00000000	udf	#0
   0x0000fffff7fbad94:	00000000	udf	#0
   0x0000fffff7fbad98:	00000000	udf	#0
   0x0000fffff7fbad9c:	00000000	udf	#0
   0x0000fffff7fbada0:	00000000	udf	#0
   0x0000fffff7fbada4:	00000000	udf	#0
   0x0000fffff7fbada8:	00000000	udf	#0
   0x0000fffff7fbadac:	00000000	udf	#0
   0x0000fffff7fbadb0:	00000000	udf	#0
   0x0000fffff7fbadb4:	00000000	udf	#0
   0x0000fffff7fbadb8:	00000000	udf	#0
   0x0000fffff7fbadbc:	00000000	udf	#0
   0x0000fffff7fbadc0:	00000000	udf	#0
   0x0000fffff7fbadc4:	00000000	udf	#0
   0x0000fffff7fbadc8:	00000000	udf	#0
   0x0000fffff7fbadcc:	00000000	udf	#0
   0x0000fffff7fbadd0:	00000000	udf	#0
   0x0000fffff7fbadd4:	00000000	udf	#0
   0x0000fffff7fbadd8:	00000000	udf	#0
   0x0000fffff7fbaddc:	00000000	udf	#0
   0x0000fffff7fbade0:	00000000	udf	#0
   0x0000fffff7fbade4:	00000000	udf	#0
   0x0000fffff7fbade8:	00000000	udf	#0
   0x0000fffff7fbadec:	00000000	udf	#0
   0x0000fffff7fbadf0:	00000000	udf	#0
   0x0000fffff7fbadf4:	00000000	udf	#0
   0x0000fffff7fbadf8:	00000000	udf	#0
   0x0000fffff7fbadfc:	00000000	udf	#0
   0x0000fffff7fbae00:	00000000	udf	#0
   0x0000fffff7fbae04:	00000000	udf	#0
   0x0000fffff7fbae08:	00000000	udf	#0
   0x0000fffff7fbae0c:	00000000	udf	#0
   0x0000fffff7fbae10:	00000000	udf	#0
   0x0000fffff7fbae14:	00000000	udf	#0
   0x0000fffff7fbae18:	00000000	udf	#0
   0x0000fffff7fbae1c:	00000000	udf	#0
   0x0000fffff7fbae20:	00000000	udf	#0
   0x0000fffff7fbae24:	00000000	udf	#0
   0x0000fffff7fbae28:	00000000	udf	#0
   0x0000fffff7fbae2c:	00000000	udf	#0
   0x0000fffff7fbae30:	00000000	udf	#0
   0x0000fffff7fbae34:	00000000	udf	#0
   0x0000fffff7fbae38:	00000000	udf	#0
   0x0000fffff7fbae3c:	00000000	udf	#0
   0x0000fffff7fbae40:	00000000	udf	#0
   0x0000fffff7fbae44:	00000000	udf	#0
   0x0000fffff7fbae48:	00000000	udf	#0
   0x0000fffff7fbae4c:	00000000	udf	#0
   0x0000fffff7fbae50:	00000000	udf	#0
   0x0000fffff7fbae54:	00000000	udf	#0
   0x0000fffff7fbae58:	00000000	udf	#0
   0x0000fffff7fbae5c:	00000000	udf	#0
   0x0000fffff7fbae60:	00000000	udf	#0
   0x0000fffff7fbae64:	00000000	udf	#0
   0x0000fffff7fbae68:	00000000	udf	#0
   0x0000fffff7fbae6c:	00000000	udf	#0
   0x0000fffff7fbae70:	00000000	udf	#0
   0x0000fffff7fbae74:	00000000	udf	#0
   0x0000fffff7fbae78:	00000000	udf	#0
   0x0000fffff7fbae7c:	00000000	udf	#0
   0x0000fffff7fbae80:	00000000	udf	#0
   0x0000fffff7fbae84:	00000000	udf	#0
   0x0000fffff7fbae88:	00000000	udf	#0
   0x0000fffff7fbae8c:	00000000	udf	#0
   0x0000fffff7fbae90:	00000000	udf	#0
   0x0000fffff7fbae94:	00000000	udf	#0
   0x0000fffff7fbae98:	00000000	udf	#0
   0x0000fffff7fbae9c:	00000000	udf	#0
   0x0000fffff7fbaea0:	00000000	udf	#0
   0x0000fffff7fbaea4:	00000000	udf	#0
   0x0000fffff7fbaea8:	00000000	udf	#0
   0x0000fffff7fbaeac:	00000000	udf	#0
   0x0000fffff7fbaeb0:	00000000	udf	#0
   0x0000fffff7fbaeb4:	00000000	udf	#0
   0x0000fffff7fbaeb8:	00000000	udf	#0
   0x0000fffff7fbaebc:	00000000	udf	#0
   0x0000fffff7fbaec0:	00000000	udf	#0
   0x0000fffff7fbaec4:	00000000	udf	#0
   0x0000fffff7fbaec8:	00000000	udf	#0
   0x0000fffff7fbaecc:	00000000	udf	#0
   0x0000fffff7fbaed0:	00000000	udf	#0
   0x0000fffff7fbaed4:	00000000	udf	#0
   0x0000fffff7fbaed8:	00000000	udf	#0
   0x0000fffff7fbaedc:	00000000	udf	#0
   0x0000fffff7fbaee0:	00000000	udf	#0
   0x0000fffff7fbaee4:	00000000	udf	#0
   0x0000fffff7fbaee8:	00000000	udf	#0
   0x0000fffff7fbaeec:	00000000	udf	#0
   0x0000fffff7fbaef0:	00000000	udf	#0
   0x0000fffff7fbaef4:	00000000	udf	#0
   0x0000fffff7fbaef8:	00000000	udf	#0
   0x0000fffff7fbaefc:	00000000	udf	#0
   0x0000fffff7fbaf00:	00000000	udf	#0
   0x0000fffff7fbaf04:	00000000	udf	#0
   0x0000fffff7fbaf08:	00000000	udf	#0
   0x0000fffff7fbaf0c:	00000000	udf	#0
   0x0000fffff7fbaf10:	00000000	udf	#0
   0x0000fffff7fbaf14:	00000000	udf	#0
   0x0000fffff7fbaf18:	00000000	udf	#0
   0x0000fffff7fbaf1c:	00000000	udf	#0
   0x0000fffff7fbaf20:	00000000	udf	#0
   0x0000fffff7fbaf24:	00000000	udf	#0
   0x0000fffff7fbaf28:	00000000	udf	#0
   0x0000fffff7fbaf2c:	00000000	udf	#0
   0x0000fffff7fbaf30:	00000000	udf	#0
   0x0000fffff7fbaf34:	00000000	udf	#0
   0x0000fffff7fbaf38:	00000000	udf	#0
   0x0000fffff7fbaf3c:	00000000	udf	#0
   0x0000fffff7fbaf40:	00000000	udf	#0
   0x0000fffff7fbaf44:	00000000	udf	#0
   0x0000fffff7fbaf48:	00000000	udf	#0
   0x0000fffff7fbaf4c:	00000000	udf	#0
   0x0000fffff7fbaf50:	00000000	udf	#0
   0x0000fffff7fbaf54:	00000000	udf	#0
   0x0000fffff7fbaf58:	00000000	udf	#0
   0x0000fffff7fbaf5c:	00000000	udf	#0
   0x0000fffff7fbaf60:	00000000	udf	#0
   0x0000fffff7fbaf64:	00000000	udf	#0
   0x0000fffff7fbaf68:	00000000	udf	#0
   0x0000fffff7fbaf6c:	00000000	udf	#0
   0x0000fffff7fbaf70:	00000000	udf	#0
   0x0000fffff7fbaf74:	00000000	udf	#0
   0x0000fffff7fbaf78:	00000000	udf	#0
   0x0000fffff7fbaf7c:	00000000	udf	#0
   0x0000fffff7fbaf80:	00000000	udf	#0
   0x0000fffff7fbaf84:	00000000	udf	#0
   0x0000fffff7fbaf88:	00000000	udf	#0
   0x0000fffff7fbaf8c:	00000000	udf	#0
   0x0000fffff7fbaf90:	00000000	udf	#0
   0x0000fffff7fbaf94:	00000000	udf	#0
   0x0000fffff7fbaf98:	00000000	udf	#0
   0x0000fffff7fbaf9c:	00000000	udf	#0
   0x0000fffff7fbafa0:	00000000	udf	#0
   0x0000fffff7fbafa4:	00000000	udf	#0
   0x0000fffff7fbafa8:	00000000	udf	#0
   0x0000fffff7fbafac:	00000000	udf	#0
   0x0000fffff7fbafb0:	00000000	udf	#0
   0x0000fffff7fbafb4:	00000000	udf	#0
   0x0000fffff7fbafb8:	00000000	udf	#0
   0x0000fffff7fbafbc:	00000000	udf	#0
   0x0000fffff7fbafc0:	00000000	udf	#0
   0x0000fffff7fbafc4:	00000000	udf	#0
   0x0000fffff7fbafc8:	00000000	udf	#0
   0x0000fffff7fbafcc:	00000000	udf	#0
   0x0000fffff7fbafd0:	00000000	udf	#0
   0x0000fffff7fbafd4:	00000000	udf	#0
   0x0000fffff7fbafd8:	00000000	udf	#0
   0x0000fffff7fbafdc:	00000000	udf	#0
   0x0000fffff7fbafe0:	00000000	udf	#0
   0x0000fffff7fbafe4:	00000000	udf	#0
   0x0000fffff7fbafe8:	00000000	udf	#0
   0x0000fffff7fbafec:	00000000	udf	#0
   0x0000fffff7fbaff0:	00000000	udf	#0
   0x0000fffff7fbaff4:	00000000	udf	#0
   0x0000fffff7fbaff8:	00000000	udf	#0
   0x0000fffff7fbaffc:	00000000	udf	#0
End of assembler dump.
