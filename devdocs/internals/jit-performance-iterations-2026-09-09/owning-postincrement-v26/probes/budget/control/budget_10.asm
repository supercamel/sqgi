Dump of assembler code from 0xfffff7faf000 to 0xfffff7fb1000:
   0x0000fffff7faf000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7faf004:	910003fd	mov	x29, sp
   0x0000fffff7faf008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7faf00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7faf010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7faf014:	aa0003f3	mov	x19, x0
   0x0000fffff7faf018:	aa0103f4	mov	x20, x1
   0x0000fffff7faf01c:	aa0203f5	mov	x21, x2
   0x0000fffff7faf020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7faf024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7faf028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7faf02c:	f90003e9	str	x9, [sp]
   0x0000fffff7faf030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7faf034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7faf038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7faf03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7faf040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf044:	d63f0200	blr	x16
   0x0000fffff7faf048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7faf04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7faf050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7faf054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7faf058:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7faf05c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7faf060:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7faf064:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faf068:	36d80211	tbz	w17, #27, 0xfffff7faf0a8
   0x0000fffff7faf06c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf070:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf074:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf078:	540001e1	b.ne	0xfffff7faf0b4  // b.any
   0x0000fffff7faf07c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf080:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf084:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf088:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf08c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf090:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf094:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf098:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf09c:	540000c9	b.ls	0xfffff7faf0b4  // b.plast
   0x0000fffff7faf0a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf0a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf0a8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf0ac:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf0b0:	1400000e	b	0xfffff7faf0e8
   0x0000fffff7faf0b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf0b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf0bc:	aa1303e1	mov	x1, x19
   0x0000fffff7faf0c0:	aa1503e2	mov	x2, x21
   0x0000fffff7faf0c4:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7faf0c8:	aa1403e4	mov	x4, x20
   0x0000fffff7faf0cc:	aa1603e5	mov	x5, x22
   0x0000fffff7faf0d0:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7faf0d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf0d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf0dc:	d63f0200	blr	x16
   0x0000fffff7faf0e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf0e4:	5400b260	b.eq	0xfffff7fb0730  // b.none
   0x0000fffff7faf0e8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7faf0ec:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7faf0f0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7faf0f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faf0f8:	36d80211	tbz	w17, #27, 0xfffff7faf138
   0x0000fffff7faf0fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf104:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf108:	540001e1	b.ne	0xfffff7faf144  // b.any
   0x0000fffff7faf10c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faf110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf11c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf128:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf12c:	540000c9	b.ls	0xfffff7faf144  // b.plast
   0x0000fffff7faf130:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf134:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf138:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faf13c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faf140:	1400000e	b	0xfffff7faf178
   0x0000fffff7faf144:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf14c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf150:	aa1503e2	mov	x2, x21
   0x0000fffff7faf154:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7faf158:	aa1403e4	mov	x4, x20
   0x0000fffff7faf15c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf160:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7faf164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf16c:	d63f0200	blr	x16
   0x0000fffff7faf170:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf174:	5400ae20	b.eq	0xfffff7fb0738  // b.none
   0x0000fffff7faf178:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf17c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf184:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf188:	54000421	b.ne	0xfffff7faf20c  // b.any
   0x0000fffff7faf18c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf198:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf19c:	54000381	b.ne	0xfffff7faf20c  // b.any
   0x0000fffff7faf1a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf1a4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7faf1a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf1ac:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7faf1b0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7faf1b4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7faf1b8:	91000580	add	x0, x12, #0x1
   0x0000fffff7faf1bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf1c0:	36d80211	tbz	w17, #27, 0xfffff7faf200
   0x0000fffff7faf1c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf1c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf1cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf1d0:	540001e1	b.ne	0xfffff7faf20c  // b.any
   0x0000fffff7faf1d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf1d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf1dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf1e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf1e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf1e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf1ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf1f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf1f4:	540000c9	b.ls	0xfffff7faf20c  // b.plast
   0x0000fffff7faf1f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf1fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf200:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7faf204:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7faf208:	1400000e	b	0xfffff7faf240
   0x0000fffff7faf20c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf210:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf214:	aa1303e1	mov	x1, x19
   0x0000fffff7faf218:	aa1503e2	mov	x2, x21
   0x0000fffff7faf21c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7faf220:	aa1403e4	mov	x4, x20
   0x0000fffff7faf224:	aa1603e5	mov	x5, x22
   0x0000fffff7faf228:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7faf22c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf230:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf234:	d63f0200	blr	x16
   0x0000fffff7faf238:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf23c:	5400a820	b.eq	0xfffff7fb0740  // b.none
   0x0000fffff7faf240:	f100041f	cmp	x0, #0x1
   0x0000fffff7faf244:	5400a400	b.eq	0xfffff7fb06c4  // b.none
   0x0000fffff7faf248:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf24c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf250:	d299c60c	mov	x12, #0xce30                	// #52784
   0x0000fffff7faf254:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf258:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf25c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7faf260:	36d801d1	tbz	w17, #27, 0xfffff7faf298
   0x0000fffff7faf264:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf268:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf26c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf270:	54000281	b.ne	0xfffff7faf2c0  // b.any
   0x0000fffff7faf274:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faf278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf27c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf280:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf284:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf288:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf28c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf290:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf294:	54000169	b.ls	0xfffff7faf2c0  // b.plast
   0x0000fffff7faf298:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf29c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf2a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf2a4:	36d80091	tbz	w17, #27, 0xfffff7faf2b4
   0x0000fffff7faf2a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf2ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf2b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf2b4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faf2b8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faf2bc:	1400000e	b	0xfffff7faf2f4
   0x0000fffff7faf2c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf2c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf2c8:	aa1303e1	mov	x1, x19
   0x0000fffff7faf2cc:	aa1503e2	mov	x2, x21
   0x0000fffff7faf2d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7faf2d4:	aa1403e4	mov	x4, x20
   0x0000fffff7faf2d8:	aa1603e5	mov	x5, x22
   0x0000fffff7faf2dc:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7faf2e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf2e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf2e8:	d63f0200	blr	x16
   0x0000fffff7faf2ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf2f0:	5400a2c0	b.eq	0xfffff7fb0748  // b.none
   0x0000fffff7faf2f4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faf2f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf2fc:	540003a0	b.eq	0xfffff7faf370  // b.none
   0x0000fffff7faf300:	b940426d	ldr	w13, [x19, #64]
   0x0000fffff7faf304:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7faf308:	b9400171	ldr	w17, [x11]
   0x0000fffff7faf30c:	36d801d1	tbz	w17, #27, 0xfffff7faf344
   0x0000fffff7faf310:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf314:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf318:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf31c:	540002a1	b.ne	0xfffff7faf370  // b.any
   0x0000fffff7faf320:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faf324:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf328:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf32c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf330:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf334:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf338:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf33c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf340:	54000189	b.ls	0xfffff7faf370  // b.plast
   0x0000fffff7faf344:	36d8008d	tbz	w13, #27, 0xfffff7faf354
   0x0000fffff7faf348:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf34c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf350:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf354:	36d80091	tbz	w17, #27, 0xfffff7faf364
   0x0000fffff7faf358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf35c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf360:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf364:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faf368:	b900016d	str	w13, [x11]
   0x0000fffff7faf36c:	1400000e	b	0xfffff7faf3a4
   0x0000fffff7faf370:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf378:	aa1303e1	mov	x1, x19
   0x0000fffff7faf37c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf380:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7faf384:	aa1403e4	mov	x4, x20
   0x0000fffff7faf388:	aa1603e5	mov	x5, x22
   0x0000fffff7faf38c:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7faf390:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf398:	d63f0200	blr	x16
   0x0000fffff7faf39c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf3a0:	54009d80	b.eq	0xfffff7fb0750  // b.none
   0x0000fffff7faf3a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf3a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf3ac:	540004a0	b.eq	0xfffff7faf440  // b.none
   0x0000fffff7faf3b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf3b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf3b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf3bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf3c0:	54000400	b.eq	0xfffff7faf440  // b.none
   0x0000fffff7faf3c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf3c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf3cc:	36d801d1	tbz	w17, #27, 0xfffff7faf404
   0x0000fffff7faf3d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf3d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf3d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf3dc:	54000321	b.ne	0xfffff7faf440  // b.any
   0x0000fffff7faf3e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf3e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf3e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf3ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf3f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf3f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf3f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf3fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf400:	54000209	b.ls	0xfffff7faf440  // b.plast
   0x0000fffff7faf404:	36d8008d	tbz	w13, #27, 0xfffff7faf414
   0x0000fffff7faf408:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf40c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf410:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf414:	36d80091	tbz	w17, #27, 0xfffff7faf424
   0x0000fffff7faf418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf41c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf420:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf424:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faf428:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faf42c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf430:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf434:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faf438:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faf43c:	1400000e	b	0xfffff7faf474
   0x0000fffff7faf440:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf448:	aa1303e1	mov	x1, x19
   0x0000fffff7faf44c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf450:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7faf454:	aa1403e4	mov	x4, x20
   0x0000fffff7faf458:	aa1603e5	mov	x5, x22
   0x0000fffff7faf45c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faf460:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf468:	d63f0200	blr	x16
   0x0000fffff7faf46c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf470:	54009740	b.eq	0xfffff7fb0758  // b.none
   0x0000fffff7faf474:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf478:	37d806a9	tbnz	w9, #27, 0xfffff7faf54c
   0x0000fffff7faf47c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf488:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf48c:	540001c1	b.ne	0xfffff7faf4c4  // b.any
   0x0000fffff7faf490:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faf494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf49c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf4a0:	54000121	b.ne	0xfffff7faf4c4  // b.any
   0x0000fffff7faf4a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf4a8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faf4ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf4b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf4b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf4b8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faf4bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf4c0:	14000030	b	0xfffff7faf580
   0x0000fffff7faf4c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf4c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf4cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf4d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf4d4:	54000120	b.eq	0xfffff7faf4f8  // b.none
   0x0000fffff7faf4d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf4dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf4e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf4e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf4e8:	54000321	b.ne	0xfffff7faf54c  // b.any
   0x0000fffff7faf4ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf4f0:	9e620120	scvtf	d0, x9
   0x0000fffff7faf4f4:	14000002	b	0xfffff7faf4fc
   0x0000fffff7faf4f8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faf4fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faf500:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf508:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf50c:	54000120	b.eq	0xfffff7faf530  // b.none
   0x0000fffff7faf510:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faf514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf51c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf520:	54000161	b.ne	0xfffff7faf54c  // b.any
   0x0000fffff7faf524:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faf528:	9e620121	scvtf	d1, x9
   0x0000fffff7faf52c:	14000002	b	0xfffff7faf534
   0x0000fffff7faf530:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faf534:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf538:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faf53c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf544:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf548:	17ffffde	b	0xfffff7faf4c0
   0x0000fffff7faf54c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf554:	aa1303e1	mov	x1, x19
   0x0000fffff7faf558:	aa1503e2	mov	x2, x21
   0x0000fffff7faf55c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7faf560:	aa1403e4	mov	x4, x20
   0x0000fffff7faf564:	aa1603e5	mov	x5, x22
   0x0000fffff7faf568:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faf56c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf574:	d63f0200	blr	x16
   0x0000fffff7faf578:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf57c:	54008f20	b.eq	0xfffff7fb0760  // b.none
   0x0000fffff7faf580:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf584:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf588:	540004a0	b.eq	0xfffff7faf61c  // b.none
   0x0000fffff7faf58c:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf590:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf594:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf598:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf59c:	54000400	b.eq	0xfffff7faf61c  // b.none
   0x0000fffff7faf5a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf5a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf5a8:	36d801d1	tbz	w17, #27, 0xfffff7faf5e0
   0x0000fffff7faf5ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf5b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf5b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf5b8:	54000321	b.ne	0xfffff7faf61c  // b.any
   0x0000fffff7faf5bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf5c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf5c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf5c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf5cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf5d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf5d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf5d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf5dc:	54000209	b.ls	0xfffff7faf61c  // b.plast
   0x0000fffff7faf5e0:	36d8008d	tbz	w13, #27, 0xfffff7faf5f0
   0x0000fffff7faf5e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf5e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf5ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf5f0:	36d80091	tbz	w17, #27, 0xfffff7faf600
   0x0000fffff7faf5f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf5f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf5fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf600:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faf604:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faf608:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf60c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf610:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faf614:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faf618:	1400000e	b	0xfffff7faf650
   0x0000fffff7faf61c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf620:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf624:	aa1303e1	mov	x1, x19
   0x0000fffff7faf628:	aa1503e2	mov	x2, x21
   0x0000fffff7faf62c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7faf630:	aa1403e4	mov	x4, x20
   0x0000fffff7faf634:	aa1603e5	mov	x5, x22
   0x0000fffff7faf638:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faf63c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf640:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf644:	d63f0200	blr	x16
   0x0000fffff7faf648:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf64c:	540088e0	b.eq	0xfffff7fb0768  // b.none
   0x0000fffff7faf650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf654:	37d806a9	tbnz	w9, #27, 0xfffff7faf728
   0x0000fffff7faf658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf65c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf664:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf668:	540001c1	b.ne	0xfffff7faf6a0  // b.any
   0x0000fffff7faf66c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faf670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf678:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf67c:	54000121	b.ne	0xfffff7faf6a0  // b.any
   0x0000fffff7faf680:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf684:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faf688:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf68c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf694:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faf698:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf69c:	14000030	b	0xfffff7faf75c
   0x0000fffff7faf6a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf6a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf6a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf6ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf6b0:	54000120	b.eq	0xfffff7faf6d4  // b.none
   0x0000fffff7faf6b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf6b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf6bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf6c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf6c4:	54000321	b.ne	0xfffff7faf728  // b.any
   0x0000fffff7faf6c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf6cc:	9e620120	scvtf	d0, x9
   0x0000fffff7faf6d0:	14000002	b	0xfffff7faf6d8
   0x0000fffff7faf6d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faf6d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faf6dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf6e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf6e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf6e8:	54000120	b.eq	0xfffff7faf70c  // b.none
   0x0000fffff7faf6ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faf6f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf6f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf6f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf6fc:	54000161	b.ne	0xfffff7faf728  // b.any
   0x0000fffff7faf700:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faf704:	9e620121	scvtf	d1, x9
   0x0000fffff7faf708:	14000002	b	0xfffff7faf710
   0x0000fffff7faf70c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faf710:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf714:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faf718:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf71c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf724:	17ffffde	b	0xfffff7faf69c
   0x0000fffff7faf728:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf72c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf730:	aa1303e1	mov	x1, x19
   0x0000fffff7faf734:	aa1503e2	mov	x2, x21
   0x0000fffff7faf738:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7faf73c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf740:	aa1603e5	mov	x5, x22
   0x0000fffff7faf744:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faf748:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf74c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf750:	d63f0200	blr	x16
   0x0000fffff7faf754:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf758:	540080c0	b.eq	0xfffff7fb0770  // b.none
   0x0000fffff7faf75c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf760:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf764:	540004a0	b.eq	0xfffff7faf7f8  // b.none
   0x0000fffff7faf768:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf76c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf770:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf774:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf778:	54000400	b.eq	0xfffff7faf7f8  // b.none
   0x0000fffff7faf77c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf780:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf784:	36d801d1	tbz	w17, #27, 0xfffff7faf7bc
   0x0000fffff7faf788:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf78c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf790:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf794:	54000321	b.ne	0xfffff7faf7f8  // b.any
   0x0000fffff7faf798:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf79c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf7a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf7a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf7a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf7ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf7b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf7b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf7b8:	54000209	b.ls	0xfffff7faf7f8  // b.plast
   0x0000fffff7faf7bc:	36d8008d	tbz	w13, #27, 0xfffff7faf7cc
   0x0000fffff7faf7c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf7c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf7c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf7cc:	36d80091	tbz	w17, #27, 0xfffff7faf7dc
   0x0000fffff7faf7d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf7d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf7d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf7dc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faf7e0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faf7e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf7e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf7ec:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faf7f0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faf7f4:	1400000e	b	0xfffff7faf82c
   0x0000fffff7faf7f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf7fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf800:	aa1303e1	mov	x1, x19
   0x0000fffff7faf804:	aa1503e2	mov	x2, x21
   0x0000fffff7faf808:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7faf80c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf810:	aa1603e5	mov	x5, x22
   0x0000fffff7faf814:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faf818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf81c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf820:	d63f0200	blr	x16
   0x0000fffff7faf824:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf828:	54007a80	b.eq	0xfffff7fb0778  // b.none
   0x0000fffff7faf82c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf830:	37d806a9	tbnz	w9, #27, 0xfffff7faf904
   0x0000fffff7faf834:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf83c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf840:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf844:	540001c1	b.ne	0xfffff7faf87c  // b.any
   0x0000fffff7faf848:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faf84c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf854:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf858:	54000121	b.ne	0xfffff7faf87c  // b.any
   0x0000fffff7faf85c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf860:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faf864:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf86c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf870:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faf874:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf878:	14000030	b	0xfffff7faf938
   0x0000fffff7faf87c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf880:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf888:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf88c:	54000120	b.eq	0xfffff7faf8b0  // b.none
   0x0000fffff7faf890:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf89c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf8a0:	54000321	b.ne	0xfffff7faf904  // b.any
   0x0000fffff7faf8a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf8a8:	9e620120	scvtf	d0, x9
   0x0000fffff7faf8ac:	14000002	b	0xfffff7faf8b4
   0x0000fffff7faf8b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faf8b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faf8b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf8bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf8c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf8c4:	54000120	b.eq	0xfffff7faf8e8  // b.none
   0x0000fffff7faf8c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faf8cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf8d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf8d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf8d8:	54000161	b.ne	0xfffff7faf904  // b.any
   0x0000fffff7faf8dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faf8e0:	9e620121	scvtf	d1, x9
   0x0000fffff7faf8e4:	14000002	b	0xfffff7faf8ec
   0x0000fffff7faf8e8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7faf8ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf8f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faf8f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf8fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faf900:	17ffffde	b	0xfffff7faf878
   0x0000fffff7faf904:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf90c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf910:	aa1503e2	mov	x2, x21
   0x0000fffff7faf914:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7faf918:	aa1403e4	mov	x4, x20
   0x0000fffff7faf91c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf920:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7faf924:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf92c:	d63f0200	blr	x16
   0x0000fffff7faf930:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf934:	54007260	b.eq	0xfffff7fb0780  // b.none
   0x0000fffff7faf938:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf93c:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf940:	540004a0	b.eq	0xfffff7faf9d4  // b.none
   0x0000fffff7faf944:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf948:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf94c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf950:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf954:	54000400	b.eq	0xfffff7faf9d4  // b.none
   0x0000fffff7faf958:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf95c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf960:	36d801d1	tbz	w17, #27, 0xfffff7faf998
   0x0000fffff7faf964:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf968:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf96c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf970:	54000321	b.ne	0xfffff7faf9d4  // b.any
   0x0000fffff7faf974:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf978:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf97c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf980:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf984:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf988:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf98c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf990:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf994:	54000209	b.ls	0xfffff7faf9d4  // b.plast
   0x0000fffff7faf998:	36d8008d	tbz	w13, #27, 0xfffff7faf9a8
   0x0000fffff7faf99c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf9a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf9a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf9a8:	36d80091	tbz	w17, #27, 0xfffff7faf9b8
   0x0000fffff7faf9ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf9b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf9b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf9b8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faf9bc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faf9c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf9c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf9c8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faf9cc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faf9d0:	1400000e	b	0xfffff7fafa08
   0x0000fffff7faf9d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf9d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf9dc:	aa1303e1	mov	x1, x19
   0x0000fffff7faf9e0:	aa1503e2	mov	x2, x21
   0x0000fffff7faf9e4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7faf9e8:	aa1403e4	mov	x4, x20
   0x0000fffff7faf9ec:	aa1603e5	mov	x5, x22
   0x0000fffff7faf9f0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faf9f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf9f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf9fc:	d63f0200	blr	x16
   0x0000fffff7fafa00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafa04:	54006c20	b.eq	0xfffff7fb0788  // b.none
   0x0000fffff7fafa08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafa0c:	37d806a9	tbnz	w9, #27, 0xfffff7fafae0
   0x0000fffff7fafa10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafa14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafa18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafa1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafa20:	540001c1	b.ne	0xfffff7fafa58  // b.any
   0x0000fffff7fafa24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafa28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafa2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafa30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafa34:	54000121	b.ne	0xfffff7fafa58  // b.any
   0x0000fffff7fafa38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fafa3c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fafa40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fafa44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafa48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafa4c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fafa50:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fafa54:	14000030	b	0xfffff7fafb14
   0x0000fffff7fafa58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafa5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafa60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafa64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafa68:	54000120	b.eq	0xfffff7fafa8c  // b.none
   0x0000fffff7fafa6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafa70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafa74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafa78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafa7c:	54000321	b.ne	0xfffff7fafae0  // b.any
   0x0000fffff7fafa80:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fafa84:	9e620120	scvtf	d0, x9
   0x0000fffff7fafa88:	14000002	b	0xfffff7fafa90
   0x0000fffff7fafa8c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fafa90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafa94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafa98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafa9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafaa0:	54000120	b.eq	0xfffff7fafac4  // b.none
   0x0000fffff7fafaa4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafaa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafaac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafab4:	54000161	b.ne	0xfffff7fafae0  // b.any
   0x0000fffff7fafab8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fafabc:	9e620121	scvtf	d1, x9
   0x0000fffff7fafac0:	14000002	b	0xfffff7fafac8
   0x0000fffff7fafac4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fafac8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fafacc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fafad0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafad8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fafadc:	17ffffde	b	0xfffff7fafa54
   0x0000fffff7fafae0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafae4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafae8:	aa1303e1	mov	x1, x19
   0x0000fffff7fafaec:	aa1503e2	mov	x2, x21
   0x0000fffff7fafaf0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fafaf4:	aa1403e4	mov	x4, x20
   0x0000fffff7fafaf8:	aa1603e5	mov	x5, x22
   0x0000fffff7fafafc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fafb00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafb04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafb08:	d63f0200	blr	x16
   0x0000fffff7fafb0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafb10:	54006400	b.eq	0xfffff7fb0790  // b.none
   0x0000fffff7fafb14:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fafb18:	f100017f	cmp	x11, #0x0
   0x0000fffff7fafb1c:	540004a0	b.eq	0xfffff7fafbb0  // b.none
   0x0000fffff7fafb20:	b940016d	ldr	w13, [x11]
   0x0000fffff7fafb24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fafb28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fafb2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fafb30:	54000400	b.eq	0xfffff7fafbb0  // b.none
   0x0000fffff7fafb34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fafb38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fafb3c:	36d801d1	tbz	w17, #27, 0xfffff7fafb74
   0x0000fffff7fafb40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafb44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafb48:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafb4c:	54000321	b.ne	0xfffff7fafbb0  // b.any
   0x0000fffff7fafb50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fafb54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafb58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafb5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafb60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafb64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafb68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafb6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafb70:	54000209	b.ls	0xfffff7fafbb0  // b.plast
   0x0000fffff7fafb74:	36d8008d	tbz	w13, #27, 0xfffff7fafb84
   0x0000fffff7fafb78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafb7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafb80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafb84:	36d80091	tbz	w17, #27, 0xfffff7fafb94
   0x0000fffff7fafb88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafb8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafb90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafb94:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fafb98:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fafb9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fafba0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fafba4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fafba8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fafbac:	1400000e	b	0xfffff7fafbe4
   0x0000fffff7fafbb0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fafbb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafbb8:	aa1303e1	mov	x1, x19
   0x0000fffff7fafbbc:	aa1503e2	mov	x2, x21
   0x0000fffff7fafbc0:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fafbc4:	aa1403e4	mov	x4, x20
   0x0000fffff7fafbc8:	aa1603e5	mov	x5, x22
   0x0000fffff7fafbcc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fafbd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafbd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafbd8:	d63f0200	blr	x16
   0x0000fffff7fafbdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafbe0:	54005dc0	b.eq	0xfffff7fb0798  // b.none
   0x0000fffff7fafbe4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafbe8:	37d806a9	tbnz	w9, #27, 0xfffff7fafcbc
   0x0000fffff7fafbec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafbf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafbf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafbf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafbfc:	540001c1	b.ne	0xfffff7fafc34  // b.any
   0x0000fffff7fafc00:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafc04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafc08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafc0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafc10:	54000121	b.ne	0xfffff7fafc34  // b.any
   0x0000fffff7fafc14:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fafc18:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fafc1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fafc20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafc24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafc28:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fafc2c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fafc30:	14000030	b	0xfffff7fafcf0
   0x0000fffff7fafc34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafc38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafc3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafc40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafc44:	54000120	b.eq	0xfffff7fafc68  // b.none
   0x0000fffff7fafc48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafc4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafc50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafc54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafc58:	54000321	b.ne	0xfffff7fafcbc  // b.any
   0x0000fffff7fafc5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fafc60:	9e620120	scvtf	d0, x9
   0x0000fffff7fafc64:	14000002	b	0xfffff7fafc6c
   0x0000fffff7fafc68:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fafc6c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafc70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafc74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafc78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafc7c:	54000120	b.eq	0xfffff7fafca0  // b.none
   0x0000fffff7fafc80:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafc84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafc88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafc8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafc90:	54000161	b.ne	0xfffff7fafcbc  // b.any
   0x0000fffff7fafc94:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fafc98:	9e620121	scvtf	d1, x9
   0x0000fffff7fafc9c:	14000002	b	0xfffff7fafca4
   0x0000fffff7fafca0:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fafca4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fafca8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fafcac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafcb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafcb4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fafcb8:	17ffffde	b	0xfffff7fafc30
   0x0000fffff7fafcbc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafcc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafcc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fafcc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fafccc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fafcd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fafcd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fafcd8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fafcdc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafce4:	d63f0200	blr	x16
   0x0000fffff7fafce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafcec:	540055a0	b.eq	0xfffff7fb07a0  // b.none
   0x0000fffff7fafcf0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fafcf4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fafcf8:	540004a0	b.eq	0xfffff7fafd8c  // b.none
   0x0000fffff7fafcfc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fafd00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fafd04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fafd08:	eb0901bf	cmp	x13, x9
   0x0000fffff7fafd0c:	54000400	b.eq	0xfffff7fafd8c  // b.none
   0x0000fffff7fafd10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fafd14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fafd18:	36d801d1	tbz	w17, #27, 0xfffff7fafd50
   0x0000fffff7fafd1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafd20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafd24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafd28:	54000321	b.ne	0xfffff7fafd8c  // b.any
   0x0000fffff7fafd2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fafd30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafd34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafd38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafd3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafd40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafd44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafd48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafd4c:	54000209	b.ls	0xfffff7fafd8c  // b.plast
   0x0000fffff7fafd50:	36d8008d	tbz	w13, #27, 0xfffff7fafd60
   0x0000fffff7fafd54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafd58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafd5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafd60:	36d80091	tbz	w17, #27, 0xfffff7fafd70
   0x0000fffff7fafd64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafd68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafd6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafd70:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fafd74:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fafd78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fafd7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fafd80:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fafd84:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fafd88:	1400000e	b	0xfffff7fafdc0
   0x0000fffff7fafd8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fafd90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafd94:	aa1303e1	mov	x1, x19
   0x0000fffff7fafd98:	aa1503e2	mov	x2, x21
   0x0000fffff7fafd9c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fafda0:	aa1403e4	mov	x4, x20
   0x0000fffff7fafda4:	aa1603e5	mov	x5, x22
   0x0000fffff7fafda8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fafdac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafdb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafdb4:	d63f0200	blr	x16
   0x0000fffff7fafdb8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafdbc:	54004f60	b.eq	0xfffff7fb07a8  // b.none
   0x0000fffff7fafdc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafdc4:	37d806a9	tbnz	w9, #27, 0xfffff7fafe98
   0x0000fffff7fafdc8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafdcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafdd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafdd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafdd8:	540001c1	b.ne	0xfffff7fafe10  // b.any
   0x0000fffff7fafddc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafde0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafde4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafde8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafdec:	54000121	b.ne	0xfffff7fafe10  // b.any
   0x0000fffff7fafdf0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fafdf4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fafdf8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fafdfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafe00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafe04:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fafe08:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fafe0c:	14000030	b	0xfffff7fafecc
   0x0000fffff7fafe10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafe14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafe18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafe1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafe20:	54000120	b.eq	0xfffff7fafe44  // b.none
   0x0000fffff7fafe24:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafe28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafe2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafe30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafe34:	54000321	b.ne	0xfffff7fafe98  // b.any
   0x0000fffff7fafe38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fafe3c:	9e620120	scvtf	d0, x9
   0x0000fffff7fafe40:	14000002	b	0xfffff7fafe48
   0x0000fffff7fafe44:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fafe48:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafe4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafe50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafe54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafe58:	54000120	b.eq	0xfffff7fafe7c  // b.none
   0x0000fffff7fafe5c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafe60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafe64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafe68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafe6c:	54000161	b.ne	0xfffff7fafe98  // b.any
   0x0000fffff7fafe70:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fafe74:	9e620121	scvtf	d1, x9
   0x0000fffff7fafe78:	14000002	b	0xfffff7fafe80
   0x0000fffff7fafe7c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fafe80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fafe84:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fafe88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafe8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafe90:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fafe94:	17ffffde	b	0xfffff7fafe0c
   0x0000fffff7fafe98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafe9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafea0:	aa1303e1	mov	x1, x19
   0x0000fffff7fafea4:	aa1503e2	mov	x2, x21
   0x0000fffff7fafea8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fafeac:	aa1403e4	mov	x4, x20
   0x0000fffff7fafeb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fafeb4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fafeb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafebc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafec0:	d63f0200	blr	x16
   0x0000fffff7fafec4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafec8:	54004740	b.eq	0xfffff7fb07b0  // b.none
   0x0000fffff7fafecc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fafed0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fafed4:	540004a0	b.eq	0xfffff7faff68  // b.none
   0x0000fffff7fafed8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fafedc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fafee0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fafee4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fafee8:	54000400	b.eq	0xfffff7faff68  // b.none
   0x0000fffff7fafeec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fafef0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fafef4:	36d801d1	tbz	w17, #27, 0xfffff7faff2c
   0x0000fffff7fafef8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafefc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faff00:	f100013f	cmp	x9, #0x0
   0x0000fffff7faff04:	54000321	b.ne	0xfffff7faff68  // b.any
   0x0000fffff7faff08:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faff0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faff10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faff14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faff18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faff1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faff20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faff24:	f100055f	cmp	x10, #0x1
   0x0000fffff7faff28:	54000209	b.ls	0xfffff7faff68  // b.plast
   0x0000fffff7faff2c:	36d8008d	tbz	w13, #27, 0xfffff7faff3c
   0x0000fffff7faff30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faff34:	91000529	add	x9, x9, #0x1
   0x0000fffff7faff38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faff3c:	36d80091	tbz	w17, #27, 0xfffff7faff4c
   0x0000fffff7faff40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faff44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faff48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faff4c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7faff50:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faff54:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faff58:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faff5c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faff60:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faff64:	1400000e	b	0xfffff7faff9c
   0x0000fffff7faff68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faff6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faff70:	aa1303e1	mov	x1, x19
   0x0000fffff7faff74:	aa1503e2	mov	x2, x21
   0x0000fffff7faff78:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7faff7c:	aa1403e4	mov	x4, x20
   0x0000fffff7faff80:	aa1603e5	mov	x5, x22
   0x0000fffff7faff84:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7faff88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faff8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faff90:	d63f0200	blr	x16
   0x0000fffff7faff94:	f100001f	cmp	x0, #0x0
   0x0000fffff7faff98:	54004100	b.eq	0xfffff7fb07b8  // b.none
   0x0000fffff7faff9c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faffa0:	37d806a9	tbnz	w9, #27, 0xfffff7fb0074
   0x0000fffff7faffa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faffa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faffac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faffb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faffb4:	540001c1	b.ne	0xfffff7faffec  // b.any
   0x0000fffff7faffb8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faffbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faffc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faffc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faffc8:	54000121	b.ne	0xfffff7faffec  // b.any
   0x0000fffff7faffcc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faffd0:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faffd4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faffd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faffdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faffe0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faffe4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faffe8:	14000030	b	0xfffff7fb00a8
   0x0000fffff7faffec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafff0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafff8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafffc:	54000120	b.eq	0xfffff7fb0020  // b.none
   0x0000fffff7fb0000:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0004:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb000c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0010:	54000321	b.ne	0xfffff7fb0074  // b.any
   0x0000fffff7fb0014:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0018:	9e620120	scvtf	d0, x9
   0x0000fffff7fb001c:	14000002	b	0xfffff7fb0024
   0x0000fffff7fb0020:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb0024:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb0028:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb002c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0030:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0034:	54000120	b.eq	0xfffff7fb0058  // b.none
   0x0000fffff7fb0038:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb003c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0044:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0048:	54000161	b.ne	0xfffff7fb0074  // b.any
   0x0000fffff7fb004c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb0050:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0054:	14000002	b	0xfffff7fb005c
   0x0000fffff7fb0058:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fb005c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0060:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb0064:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb006c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb0070:	17ffffde	b	0xfffff7faffe8
   0x0000fffff7fb0074:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0078:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb007c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0080:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0084:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb0088:	aa1403e4	mov	x4, x20
   0x0000fffff7fb008c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0090:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb0094:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0098:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb009c:	d63f0200	blr	x16
   0x0000fffff7fb00a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb00a4:	540038e0	b.eq	0xfffff7fb07c0  // b.none
   0x0000fffff7fb00a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb00ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb00b0:	540004a0	b.eq	0xfffff7fb0144  // b.none
   0x0000fffff7fb00b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb00b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb00bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb00c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb00c4:	54000400	b.eq	0xfffff7fb0144  // b.none
   0x0000fffff7fb00c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb00cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb00d0:	36d801d1	tbz	w17, #27, 0xfffff7fb0108
   0x0000fffff7fb00d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb00d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb00dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb00e0:	54000321	b.ne	0xfffff7fb0144  // b.any
   0x0000fffff7fb00e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb00e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb00ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb00f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb00f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb00f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb00fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0100:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0104:	54000209	b.ls	0xfffff7fb0144  // b.plast
   0x0000fffff7fb0108:	36d8008d	tbz	w13, #27, 0xfffff7fb0118
   0x0000fffff7fb010c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0110:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0114:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0118:	36d80091	tbz	w17, #27, 0xfffff7fb0128
   0x0000fffff7fb011c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0120:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0124:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0128:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fb012c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb0130:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0134:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0138:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb013c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb0140:	1400000e	b	0xfffff7fb0178
   0x0000fffff7fb0144:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb014c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0150:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0154:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb0158:	aa1403e4	mov	x4, x20
   0x0000fffff7fb015c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0160:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb0164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb016c:	d63f0200	blr	x16
   0x0000fffff7fb0170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0174:	540032a0	b.eq	0xfffff7fb07c8  // b.none
   0x0000fffff7fb0178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb017c:	37d806a9	tbnz	w9, #27, 0xfffff7fb0250
   0x0000fffff7fb0180:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb018c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0190:	540001c1	b.ne	0xfffff7fb01c8  // b.any
   0x0000fffff7fb0194:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb0198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb019c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb01a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb01a4:	54000121	b.ne	0xfffff7fb01c8  // b.any
   0x0000fffff7fb01a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb01ac:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fb01b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb01b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb01b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb01bc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb01c0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb01c4:	14000030	b	0xfffff7fb0284
   0x0000fffff7fb01c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb01cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb01d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb01d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb01d8:	54000120	b.eq	0xfffff7fb01fc  // b.none
   0x0000fffff7fb01dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb01e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb01e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb01e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb01ec:	54000321	b.ne	0xfffff7fb0250  // b.any
   0x0000fffff7fb01f0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb01f4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb01f8:	14000002	b	0xfffff7fb0200
   0x0000fffff7fb01fc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb0200:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb0204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb020c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0210:	54000120	b.eq	0xfffff7fb0234  // b.none
   0x0000fffff7fb0214:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb0218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb021c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0220:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0224:	54000161	b.ne	0xfffff7fb0250  // b.any
   0x0000fffff7fb0228:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb022c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0230:	14000002	b	0xfffff7fb0238
   0x0000fffff7fb0234:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fb0238:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb023c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb0240:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0248:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb024c:	17ffffde	b	0xfffff7fb01c4
   0x0000fffff7fb0250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0258:	aa1303e1	mov	x1, x19
   0x0000fffff7fb025c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0260:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb0264:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0268:	aa1603e5	mov	x5, x22
   0x0000fffff7fb026c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb0270:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0278:	d63f0200	blr	x16
   0x0000fffff7fb027c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0280:	54002a80	b.eq	0xfffff7fb07d0  // b.none
   0x0000fffff7fb0284:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0288:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb028c:	540004a0	b.eq	0xfffff7fb0320  // b.none
   0x0000fffff7fb0290:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0294:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0298:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb029c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb02a0:	54000400	b.eq	0xfffff7fb0320  // b.none
   0x0000fffff7fb02a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb02a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb02ac:	36d801d1	tbz	w17, #27, 0xfffff7fb02e4
   0x0000fffff7fb02b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb02b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb02b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb02bc:	54000321	b.ne	0xfffff7fb0320  // b.any
   0x0000fffff7fb02c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb02c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb02c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb02cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb02d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb02d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb02d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb02dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb02e0:	54000209	b.ls	0xfffff7fb0320  // b.plast
   0x0000fffff7fb02e4:	36d8008d	tbz	w13, #27, 0xfffff7fb02f4
   0x0000fffff7fb02e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb02ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb02f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb02f4:	36d80091	tbz	w17, #27, 0xfffff7fb0304
   0x0000fffff7fb02f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb02fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0300:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0304:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fb0308:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb030c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0310:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0314:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb0318:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb031c:	1400000e	b	0xfffff7fb0354
   0x0000fffff7fb0320:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0324:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0328:	aa1303e1	mov	x1, x19
   0x0000fffff7fb032c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0330:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb0334:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0338:	aa1603e5	mov	x5, x22
   0x0000fffff7fb033c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb0340:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0344:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0348:	d63f0200	blr	x16
   0x0000fffff7fb034c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0350:	54002440	b.eq	0xfffff7fb07d8  // b.none
   0x0000fffff7fb0354:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0358:	37d806a9	tbnz	w9, #27, 0xfffff7fb042c
   0x0000fffff7fb035c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0360:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0368:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb036c:	540001c1	b.ne	0xfffff7fb03a4  // b.any
   0x0000fffff7fb0370:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb0374:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb037c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0380:	54000121	b.ne	0xfffff7fb03a4  // b.any
   0x0000fffff7fb0384:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0388:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fb038c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0390:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0398:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb039c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb03a0:	14000030	b	0xfffff7fb0460
   0x0000fffff7fb03a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb03a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb03ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb03b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb03b4:	54000120	b.eq	0xfffff7fb03d8  // b.none
   0x0000fffff7fb03b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb03bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb03c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb03c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb03c8:	54000321	b.ne	0xfffff7fb042c  // b.any
   0x0000fffff7fb03cc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb03d0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb03d4:	14000002	b	0xfffff7fb03dc
   0x0000fffff7fb03d8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb03dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb03e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb03e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb03e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb03ec:	54000120	b.eq	0xfffff7fb0410  // b.none
   0x0000fffff7fb03f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb03f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb03f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb03fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0400:	54000161	b.ne	0xfffff7fb042c  // b.any
   0x0000fffff7fb0404:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb0408:	9e620121	scvtf	d1, x9
   0x0000fffff7fb040c:	14000002	b	0xfffff7fb0414
   0x0000fffff7fb0410:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fb0414:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0418:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb041c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0424:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb0428:	17ffffde	b	0xfffff7fb03a0
   0x0000fffff7fb042c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0434:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0438:	aa1503e2	mov	x2, x21
   0x0000fffff7fb043c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb0440:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0444:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0448:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb044c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0454:	d63f0200	blr	x16
   0x0000fffff7fb0458:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb045c:	54001c20	b.eq	0xfffff7fb07e0  // b.none
   0x0000fffff7fb0460:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0464:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb0468:	540004a0	b.eq	0xfffff7fb04fc  // b.none
   0x0000fffff7fb046c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0470:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0474:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb0478:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb047c:	54000400	b.eq	0xfffff7fb04fc  // b.none
   0x0000fffff7fb0480:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0484:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0488:	36d801d1	tbz	w17, #27, 0xfffff7fb04c0
   0x0000fffff7fb048c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0490:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0494:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0498:	54000321	b.ne	0xfffff7fb04fc  // b.any
   0x0000fffff7fb049c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb04a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb04a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb04a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb04ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb04b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb04b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb04b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb04bc:	54000209	b.ls	0xfffff7fb04fc  // b.plast
   0x0000fffff7fb04c0:	36d8008d	tbz	w13, #27, 0xfffff7fb04d0
   0x0000fffff7fb04c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb04c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb04cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb04d0:	36d80091	tbz	w17, #27, 0xfffff7fb04e0
   0x0000fffff7fb04d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb04d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb04dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb04e0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fb04e4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb04e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb04ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb04f0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb04f4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb04f8:	1400000e	b	0xfffff7fb0530
   0x0000fffff7fb04fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0504:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0508:	aa1503e2	mov	x2, x21
   0x0000fffff7fb050c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb0510:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0514:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0518:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb051c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0524:	d63f0200	blr	x16
   0x0000fffff7fb0528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb052c:	540015e0	b.eq	0xfffff7fb07e8  // b.none
   0x0000fffff7fb0530:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0534:	37d806a9	tbnz	w9, #27, 0xfffff7fb0608
   0x0000fffff7fb0538:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb053c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0544:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0548:	540001c1	b.ne	0xfffff7fb0580  // b.any
   0x0000fffff7fb054c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb0550:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0558:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb055c:	54000121	b.ne	0xfffff7fb0580  // b.any
   0x0000fffff7fb0560:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0564:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fb0568:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb056c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0574:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb0578:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb057c:	14000030	b	0xfffff7fb063c
   0x0000fffff7fb0580:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0584:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb058c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0590:	54000120	b.eq	0xfffff7fb05b4  // b.none
   0x0000fffff7fb0594:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0598:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb059c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05a4:	54000321	b.ne	0xfffff7fb0608  // b.any
   0x0000fffff7fb05a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb05ac:	9e620120	scvtf	d0, x9
   0x0000fffff7fb05b0:	14000002	b	0xfffff7fb05b8
   0x0000fffff7fb05b4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb05b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb05bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb05c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05c8:	54000120	b.eq	0xfffff7fb05ec  // b.none
   0x0000fffff7fb05cc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb05d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb05d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05dc:	54000161	b.ne	0xfffff7fb0608  // b.any
   0x0000fffff7fb05e0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb05e4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb05e8:	14000002	b	0xfffff7fb05f0
   0x0000fffff7fb05ec:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fb05f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb05f4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb05f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb05fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0600:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb0604:	17ffffde	b	0xfffff7fb057c
   0x0000fffff7fb0608:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb060c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0610:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0614:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0618:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb061c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0620:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0624:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb0628:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb062c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0630:	d63f0200	blr	x16
   0x0000fffff7fb0634:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0638:	54000dc0	b.eq	0xfffff7fb07f0  // b.none
   0x0000fffff7fb063c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb0640:	37d80269	tbnz	w9, #27, 0xfffff7fb068c
   0x0000fffff7fb0644:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb0648:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb064c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0650:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0654:	540001c1	b.ne	0xfffff7fb068c  // b.any
   0x0000fffff7fb0658:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb065c:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fb0660:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fb0664:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fb0668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb066c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0670:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fb0674:	aa0b03e9	mov	x9, x11
   0x0000fffff7fb0678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb067c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0680:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb0684:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb0688:	1400000e	b	0xfffff7fb06c0
   0x0000fffff7fb068c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0690:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0694:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0698:	aa1503e2	mov	x2, x21
   0x0000fffff7fb069c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb06a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb06a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb06a8:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fb06ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb06b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb06b4:	d63f0200	blr	x16
   0x0000fffff7fb06b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb06bc:	540009e0	b.eq	0xfffff7fb07f8  // b.none
   0x0000fffff7fb06c0:	17fffaae	b	0xfffff7faf178
   0x0000fffff7fb06c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb06c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb06cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb06d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb06d4:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb06d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb06dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb06e0:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fb06e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb06e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb06ec:	d63f0200	blr	x16
   0x0000fffff7fb06f0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb06f4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb06f8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb06fc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb0700:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb0704:	d65f03c0	ret
   0x0000fffff7fb0708:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb070c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0710:	b900028a	str	w10, [x20]
   0x0000fffff7fb0714:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb0718:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb071c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb0720:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb0724:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb0728:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb072c:	d65f03c0	ret
   0x0000fffff7fb0730:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb0734:	17fffff5	b	0xfffff7fb0708
   0x0000fffff7fb0738:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb073c:	17fffff3	b	0xfffff7fb0708
   0x0000fffff7fb0740:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb0744:	17fffff1	b	0xfffff7fb0708
   0x0000fffff7fb0748:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fb074c:	17ffffef	b	0xfffff7fb0708
   0x0000fffff7fb0750:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb0754:	17ffffed	b	0xfffff7fb0708
   0x0000fffff7fb0758:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb075c:	17ffffeb	b	0xfffff7fb0708
   0x0000fffff7fb0760:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb0764:	17ffffe9	b	0xfffff7fb0708
   0x0000fffff7fb0768:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb076c:	17ffffe7	b	0xfffff7fb0708
   0x0000fffff7fb0770:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb0774:	17ffffe5	b	0xfffff7fb0708
   0x0000fffff7fb0778:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb077c:	17ffffe3	b	0xfffff7fb0708
   0x0000fffff7fb0780:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb0784:	17ffffe1	b	0xfffff7fb0708
   0x0000fffff7fb0788:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb078c:	17ffffdf	b	0xfffff7fb0708
   0x0000fffff7fb0790:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb0794:	17ffffdd	b	0xfffff7fb0708
   0x0000fffff7fb0798:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb079c:	17ffffdb	b	0xfffff7fb0708
   0x0000fffff7fb07a0:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb07a4:	17ffffd9	b	0xfffff7fb0708
   0x0000fffff7fb07a8:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb07ac:	17ffffd7	b	0xfffff7fb0708
   0x0000fffff7fb07b0:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb07b4:	17ffffd5	b	0xfffff7fb0708
   0x0000fffff7fb07b8:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb07bc:	17ffffd3	b	0xfffff7fb0708
   0x0000fffff7fb07c0:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb07c4:	17ffffd1	b	0xfffff7fb0708
   0x0000fffff7fb07c8:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb07cc:	17ffffcf	b	0xfffff7fb0708
   0x0000fffff7fb07d0:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb07d4:	17ffffcd	b	0xfffff7fb0708
   0x0000fffff7fb07d8:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb07dc:	17ffffcb	b	0xfffff7fb0708
   0x0000fffff7fb07e0:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb07e4:	17ffffc9	b	0xfffff7fb0708
   0x0000fffff7fb07e8:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb07ec:	17ffffc7	b	0xfffff7fb0708
   0x0000fffff7fb07f0:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb07f4:	17ffffc5	b	0xfffff7fb0708
   0x0000fffff7fb07f8:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb07fc:	17ffffc3	b	0xfffff7fb0708
   0x0000fffff7fb0800:	00000000	udf	#0
   0x0000fffff7fb0804:	00000000	udf	#0
   0x0000fffff7fb0808:	00000000	udf	#0
   0x0000fffff7fb080c:	00000000	udf	#0
   0x0000fffff7fb0810:	00000000	udf	#0
   0x0000fffff7fb0814:	00000000	udf	#0
   0x0000fffff7fb0818:	00000000	udf	#0
   0x0000fffff7fb081c:	00000000	udf	#0
   0x0000fffff7fb0820:	00000000	udf	#0
   0x0000fffff7fb0824:	00000000	udf	#0
   0x0000fffff7fb0828:	00000000	udf	#0
   0x0000fffff7fb082c:	00000000	udf	#0
   0x0000fffff7fb0830:	00000000	udf	#0
   0x0000fffff7fb0834:	00000000	udf	#0
   0x0000fffff7fb0838:	00000000	udf	#0
   0x0000fffff7fb083c:	00000000	udf	#0
   0x0000fffff7fb0840:	00000000	udf	#0
   0x0000fffff7fb0844:	00000000	udf	#0
   0x0000fffff7fb0848:	00000000	udf	#0
   0x0000fffff7fb084c:	00000000	udf	#0
   0x0000fffff7fb0850:	00000000	udf	#0
   0x0000fffff7fb0854:	00000000	udf	#0
   0x0000fffff7fb0858:	00000000	udf	#0
   0x0000fffff7fb085c:	00000000	udf	#0
   0x0000fffff7fb0860:	00000000	udf	#0
   0x0000fffff7fb0864:	00000000	udf	#0
   0x0000fffff7fb0868:	00000000	udf	#0
   0x0000fffff7fb086c:	00000000	udf	#0
   0x0000fffff7fb0870:	00000000	udf	#0
   0x0000fffff7fb0874:	00000000	udf	#0
   0x0000fffff7fb0878:	00000000	udf	#0
   0x0000fffff7fb087c:	00000000	udf	#0
   0x0000fffff7fb0880:	00000000	udf	#0
   0x0000fffff7fb0884:	00000000	udf	#0
   0x0000fffff7fb0888:	00000000	udf	#0
   0x0000fffff7fb088c:	00000000	udf	#0
   0x0000fffff7fb0890:	00000000	udf	#0
   0x0000fffff7fb0894:	00000000	udf	#0
   0x0000fffff7fb0898:	00000000	udf	#0
   0x0000fffff7fb089c:	00000000	udf	#0
   0x0000fffff7fb08a0:	00000000	udf	#0
   0x0000fffff7fb08a4:	00000000	udf	#0
   0x0000fffff7fb08a8:	00000000	udf	#0
   0x0000fffff7fb08ac:	00000000	udf	#0
   0x0000fffff7fb08b0:	00000000	udf	#0
   0x0000fffff7fb08b4:	00000000	udf	#0
   0x0000fffff7fb08b8:	00000000	udf	#0
   0x0000fffff7fb08bc:	00000000	udf	#0
   0x0000fffff7fb08c0:	00000000	udf	#0
   0x0000fffff7fb08c4:	00000000	udf	#0
   0x0000fffff7fb08c8:	00000000	udf	#0
   0x0000fffff7fb08cc:	00000000	udf	#0
   0x0000fffff7fb08d0:	00000000	udf	#0
   0x0000fffff7fb08d4:	00000000	udf	#0
   0x0000fffff7fb08d8:	00000000	udf	#0
   0x0000fffff7fb08dc:	00000000	udf	#0
   0x0000fffff7fb08e0:	00000000	udf	#0
   0x0000fffff7fb08e4:	00000000	udf	#0
   0x0000fffff7fb08e8:	00000000	udf	#0
   0x0000fffff7fb08ec:	00000000	udf	#0
   0x0000fffff7fb08f0:	00000000	udf	#0
   0x0000fffff7fb08f4:	00000000	udf	#0
   0x0000fffff7fb08f8:	00000000	udf	#0
   0x0000fffff7fb08fc:	00000000	udf	#0
   0x0000fffff7fb0900:	00000000	udf	#0
   0x0000fffff7fb0904:	00000000	udf	#0
   0x0000fffff7fb0908:	00000000	udf	#0
   0x0000fffff7fb090c:	00000000	udf	#0
   0x0000fffff7fb0910:	00000000	udf	#0
   0x0000fffff7fb0914:	00000000	udf	#0
   0x0000fffff7fb0918:	00000000	udf	#0
   0x0000fffff7fb091c:	00000000	udf	#0
   0x0000fffff7fb0920:	00000000	udf	#0
   0x0000fffff7fb0924:	00000000	udf	#0
   0x0000fffff7fb0928:	00000000	udf	#0
   0x0000fffff7fb092c:	00000000	udf	#0
   0x0000fffff7fb0930:	00000000	udf	#0
   0x0000fffff7fb0934:	00000000	udf	#0
   0x0000fffff7fb0938:	00000000	udf	#0
   0x0000fffff7fb093c:	00000000	udf	#0
   0x0000fffff7fb0940:	00000000	udf	#0
   0x0000fffff7fb0944:	00000000	udf	#0
   0x0000fffff7fb0948:	00000000	udf	#0
   0x0000fffff7fb094c:	00000000	udf	#0
   0x0000fffff7fb0950:	00000000	udf	#0
   0x0000fffff7fb0954:	00000000	udf	#0
   0x0000fffff7fb0958:	00000000	udf	#0
   0x0000fffff7fb095c:	00000000	udf	#0
   0x0000fffff7fb0960:	00000000	udf	#0
   0x0000fffff7fb0964:	00000000	udf	#0
   0x0000fffff7fb0968:	00000000	udf	#0
   0x0000fffff7fb096c:	00000000	udf	#0
   0x0000fffff7fb0970:	00000000	udf	#0
   0x0000fffff7fb0974:	00000000	udf	#0
   0x0000fffff7fb0978:	00000000	udf	#0
   0x0000fffff7fb097c:	00000000	udf	#0
   0x0000fffff7fb0980:	00000000	udf	#0
   0x0000fffff7fb0984:	00000000	udf	#0
   0x0000fffff7fb0988:	00000000	udf	#0
   0x0000fffff7fb098c:	00000000	udf	#0
   0x0000fffff7fb0990:	00000000	udf	#0
   0x0000fffff7fb0994:	00000000	udf	#0
   0x0000fffff7fb0998:	00000000	udf	#0
   0x0000fffff7fb099c:	00000000	udf	#0
   0x0000fffff7fb09a0:	00000000	udf	#0
   0x0000fffff7fb09a4:	00000000	udf	#0
   0x0000fffff7fb09a8:	00000000	udf	#0
   0x0000fffff7fb09ac:	00000000	udf	#0
   0x0000fffff7fb09b0:	00000000	udf	#0
   0x0000fffff7fb09b4:	00000000	udf	#0
   0x0000fffff7fb09b8:	00000000	udf	#0
   0x0000fffff7fb09bc:	00000000	udf	#0
   0x0000fffff7fb09c0:	00000000	udf	#0
   0x0000fffff7fb09c4:	00000000	udf	#0
   0x0000fffff7fb09c8:	00000000	udf	#0
   0x0000fffff7fb09cc:	00000000	udf	#0
   0x0000fffff7fb09d0:	00000000	udf	#0
   0x0000fffff7fb09d4:	00000000	udf	#0
   0x0000fffff7fb09d8:	00000000	udf	#0
   0x0000fffff7fb09dc:	00000000	udf	#0
   0x0000fffff7fb09e0:	00000000	udf	#0
   0x0000fffff7fb09e4:	00000000	udf	#0
   0x0000fffff7fb09e8:	00000000	udf	#0
   0x0000fffff7fb09ec:	00000000	udf	#0
   0x0000fffff7fb09f0:	00000000	udf	#0
   0x0000fffff7fb09f4:	00000000	udf	#0
   0x0000fffff7fb09f8:	00000000	udf	#0
   0x0000fffff7fb09fc:	00000000	udf	#0
   0x0000fffff7fb0a00:	00000000	udf	#0
   0x0000fffff7fb0a04:	00000000	udf	#0
   0x0000fffff7fb0a08:	00000000	udf	#0
   0x0000fffff7fb0a0c:	00000000	udf	#0
   0x0000fffff7fb0a10:	00000000	udf	#0
   0x0000fffff7fb0a14:	00000000	udf	#0
   0x0000fffff7fb0a18:	00000000	udf	#0
   0x0000fffff7fb0a1c:	00000000	udf	#0
   0x0000fffff7fb0a20:	00000000	udf	#0
   0x0000fffff7fb0a24:	00000000	udf	#0
   0x0000fffff7fb0a28:	00000000	udf	#0
   0x0000fffff7fb0a2c:	00000000	udf	#0
   0x0000fffff7fb0a30:	00000000	udf	#0
   0x0000fffff7fb0a34:	00000000	udf	#0
   0x0000fffff7fb0a38:	00000000	udf	#0
   0x0000fffff7fb0a3c:	00000000	udf	#0
   0x0000fffff7fb0a40:	00000000	udf	#0
   0x0000fffff7fb0a44:	00000000	udf	#0
   0x0000fffff7fb0a48:	00000000	udf	#0
   0x0000fffff7fb0a4c:	00000000	udf	#0
   0x0000fffff7fb0a50:	00000000	udf	#0
   0x0000fffff7fb0a54:	00000000	udf	#0
   0x0000fffff7fb0a58:	00000000	udf	#0
   0x0000fffff7fb0a5c:	00000000	udf	#0
   0x0000fffff7fb0a60:	00000000	udf	#0
   0x0000fffff7fb0a64:	00000000	udf	#0
   0x0000fffff7fb0a68:	00000000	udf	#0
   0x0000fffff7fb0a6c:	00000000	udf	#0
   0x0000fffff7fb0a70:	00000000	udf	#0
   0x0000fffff7fb0a74:	00000000	udf	#0
   0x0000fffff7fb0a78:	00000000	udf	#0
   0x0000fffff7fb0a7c:	00000000	udf	#0
   0x0000fffff7fb0a80:	00000000	udf	#0
   0x0000fffff7fb0a84:	00000000	udf	#0
   0x0000fffff7fb0a88:	00000000	udf	#0
   0x0000fffff7fb0a8c:	00000000	udf	#0
   0x0000fffff7fb0a90:	00000000	udf	#0
   0x0000fffff7fb0a94:	00000000	udf	#0
   0x0000fffff7fb0a98:	00000000	udf	#0
   0x0000fffff7fb0a9c:	00000000	udf	#0
   0x0000fffff7fb0aa0:	00000000	udf	#0
   0x0000fffff7fb0aa4:	00000000	udf	#0
   0x0000fffff7fb0aa8:	00000000	udf	#0
   0x0000fffff7fb0aac:	00000000	udf	#0
   0x0000fffff7fb0ab0:	00000000	udf	#0
   0x0000fffff7fb0ab4:	00000000	udf	#0
   0x0000fffff7fb0ab8:	00000000	udf	#0
   0x0000fffff7fb0abc:	00000000	udf	#0
   0x0000fffff7fb0ac0:	00000000	udf	#0
   0x0000fffff7fb0ac4:	00000000	udf	#0
   0x0000fffff7fb0ac8:	00000000	udf	#0
   0x0000fffff7fb0acc:	00000000	udf	#0
   0x0000fffff7fb0ad0:	00000000	udf	#0
   0x0000fffff7fb0ad4:	00000000	udf	#0
   0x0000fffff7fb0ad8:	00000000	udf	#0
   0x0000fffff7fb0adc:	00000000	udf	#0
   0x0000fffff7fb0ae0:	00000000	udf	#0
   0x0000fffff7fb0ae4:	00000000	udf	#0
   0x0000fffff7fb0ae8:	00000000	udf	#0
   0x0000fffff7fb0aec:	00000000	udf	#0
   0x0000fffff7fb0af0:	00000000	udf	#0
   0x0000fffff7fb0af4:	00000000	udf	#0
   0x0000fffff7fb0af8:	00000000	udf	#0
   0x0000fffff7fb0afc:	00000000	udf	#0
   0x0000fffff7fb0b00:	00000000	udf	#0
   0x0000fffff7fb0b04:	00000000	udf	#0
   0x0000fffff7fb0b08:	00000000	udf	#0
   0x0000fffff7fb0b0c:	00000000	udf	#0
   0x0000fffff7fb0b10:	00000000	udf	#0
   0x0000fffff7fb0b14:	00000000	udf	#0
   0x0000fffff7fb0b18:	00000000	udf	#0
   0x0000fffff7fb0b1c:	00000000	udf	#0
   0x0000fffff7fb0b20:	00000000	udf	#0
   0x0000fffff7fb0b24:	00000000	udf	#0
   0x0000fffff7fb0b28:	00000000	udf	#0
   0x0000fffff7fb0b2c:	00000000	udf	#0
   0x0000fffff7fb0b30:	00000000	udf	#0
   0x0000fffff7fb0b34:	00000000	udf	#0
   0x0000fffff7fb0b38:	00000000	udf	#0
   0x0000fffff7fb0b3c:	00000000	udf	#0
   0x0000fffff7fb0b40:	00000000	udf	#0
   0x0000fffff7fb0b44:	00000000	udf	#0
   0x0000fffff7fb0b48:	00000000	udf	#0
   0x0000fffff7fb0b4c:	00000000	udf	#0
   0x0000fffff7fb0b50:	00000000	udf	#0
   0x0000fffff7fb0b54:	00000000	udf	#0
   0x0000fffff7fb0b58:	00000000	udf	#0
   0x0000fffff7fb0b5c:	00000000	udf	#0
   0x0000fffff7fb0b60:	00000000	udf	#0
   0x0000fffff7fb0b64:	00000000	udf	#0
   0x0000fffff7fb0b68:	00000000	udf	#0
   0x0000fffff7fb0b6c:	00000000	udf	#0
   0x0000fffff7fb0b70:	00000000	udf	#0
   0x0000fffff7fb0b74:	00000000	udf	#0
   0x0000fffff7fb0b78:	00000000	udf	#0
   0x0000fffff7fb0b7c:	00000000	udf	#0
   0x0000fffff7fb0b80:	00000000	udf	#0
   0x0000fffff7fb0b84:	00000000	udf	#0
   0x0000fffff7fb0b88:	00000000	udf	#0
   0x0000fffff7fb0b8c:	00000000	udf	#0
   0x0000fffff7fb0b90:	00000000	udf	#0
   0x0000fffff7fb0b94:	00000000	udf	#0
   0x0000fffff7fb0b98:	00000000	udf	#0
   0x0000fffff7fb0b9c:	00000000	udf	#0
   0x0000fffff7fb0ba0:	00000000	udf	#0
   0x0000fffff7fb0ba4:	00000000	udf	#0
   0x0000fffff7fb0ba8:	00000000	udf	#0
   0x0000fffff7fb0bac:	00000000	udf	#0
   0x0000fffff7fb0bb0:	00000000	udf	#0
   0x0000fffff7fb0bb4:	00000000	udf	#0
   0x0000fffff7fb0bb8:	00000000	udf	#0
   0x0000fffff7fb0bbc:	00000000	udf	#0
   0x0000fffff7fb0bc0:	00000000	udf	#0
   0x0000fffff7fb0bc4:	00000000	udf	#0
   0x0000fffff7fb0bc8:	00000000	udf	#0
   0x0000fffff7fb0bcc:	00000000	udf	#0
   0x0000fffff7fb0bd0:	00000000	udf	#0
   0x0000fffff7fb0bd4:	00000000	udf	#0
   0x0000fffff7fb0bd8:	00000000	udf	#0
   0x0000fffff7fb0bdc:	00000000	udf	#0
   0x0000fffff7fb0be0:	00000000	udf	#0
   0x0000fffff7fb0be4:	00000000	udf	#0
   0x0000fffff7fb0be8:	00000000	udf	#0
   0x0000fffff7fb0bec:	00000000	udf	#0
   0x0000fffff7fb0bf0:	00000000	udf	#0
   0x0000fffff7fb0bf4:	00000000	udf	#0
   0x0000fffff7fb0bf8:	00000000	udf	#0
   0x0000fffff7fb0bfc:	00000000	udf	#0
   0x0000fffff7fb0c00:	00000000	udf	#0
   0x0000fffff7fb0c04:	00000000	udf	#0
   0x0000fffff7fb0c08:	00000000	udf	#0
   0x0000fffff7fb0c0c:	00000000	udf	#0
   0x0000fffff7fb0c10:	00000000	udf	#0
   0x0000fffff7fb0c14:	00000000	udf	#0
   0x0000fffff7fb0c18:	00000000	udf	#0
   0x0000fffff7fb0c1c:	00000000	udf	#0
   0x0000fffff7fb0c20:	00000000	udf	#0
   0x0000fffff7fb0c24:	00000000	udf	#0
   0x0000fffff7fb0c28:	00000000	udf	#0
   0x0000fffff7fb0c2c:	00000000	udf	#0
   0x0000fffff7fb0c30:	00000000	udf	#0
   0x0000fffff7fb0c34:	00000000	udf	#0
   0x0000fffff7fb0c38:	00000000	udf	#0
   0x0000fffff7fb0c3c:	00000000	udf	#0
   0x0000fffff7fb0c40:	00000000	udf	#0
   0x0000fffff7fb0c44:	00000000	udf	#0
   0x0000fffff7fb0c48:	00000000	udf	#0
   0x0000fffff7fb0c4c:	00000000	udf	#0
   0x0000fffff7fb0c50:	00000000	udf	#0
   0x0000fffff7fb0c54:	00000000	udf	#0
   0x0000fffff7fb0c58:	00000000	udf	#0
   0x0000fffff7fb0c5c:	00000000	udf	#0
   0x0000fffff7fb0c60:	00000000	udf	#0
   0x0000fffff7fb0c64:	00000000	udf	#0
   0x0000fffff7fb0c68:	00000000	udf	#0
   0x0000fffff7fb0c6c:	00000000	udf	#0
   0x0000fffff7fb0c70:	00000000	udf	#0
   0x0000fffff7fb0c74:	00000000	udf	#0
   0x0000fffff7fb0c78:	00000000	udf	#0
   0x0000fffff7fb0c7c:	00000000	udf	#0
   0x0000fffff7fb0c80:	00000000	udf	#0
   0x0000fffff7fb0c84:	00000000	udf	#0
   0x0000fffff7fb0c88:	00000000	udf	#0
   0x0000fffff7fb0c8c:	00000000	udf	#0
   0x0000fffff7fb0c90:	00000000	udf	#0
   0x0000fffff7fb0c94:	00000000	udf	#0
   0x0000fffff7fb0c98:	00000000	udf	#0
   0x0000fffff7fb0c9c:	00000000	udf	#0
   0x0000fffff7fb0ca0:	00000000	udf	#0
   0x0000fffff7fb0ca4:	00000000	udf	#0
   0x0000fffff7fb0ca8:	00000000	udf	#0
   0x0000fffff7fb0cac:	00000000	udf	#0
   0x0000fffff7fb0cb0:	00000000	udf	#0
   0x0000fffff7fb0cb4:	00000000	udf	#0
   0x0000fffff7fb0cb8:	00000000	udf	#0
   0x0000fffff7fb0cbc:	00000000	udf	#0
   0x0000fffff7fb0cc0:	00000000	udf	#0
   0x0000fffff7fb0cc4:	00000000	udf	#0
   0x0000fffff7fb0cc8:	00000000	udf	#0
   0x0000fffff7fb0ccc:	00000000	udf	#0
   0x0000fffff7fb0cd0:	00000000	udf	#0
   0x0000fffff7fb0cd4:	00000000	udf	#0
   0x0000fffff7fb0cd8:	00000000	udf	#0
   0x0000fffff7fb0cdc:	00000000	udf	#0
   0x0000fffff7fb0ce0:	00000000	udf	#0
   0x0000fffff7fb0ce4:	00000000	udf	#0
   0x0000fffff7fb0ce8:	00000000	udf	#0
   0x0000fffff7fb0cec:	00000000	udf	#0
   0x0000fffff7fb0cf0:	00000000	udf	#0
   0x0000fffff7fb0cf4:	00000000	udf	#0
   0x0000fffff7fb0cf8:	00000000	udf	#0
   0x0000fffff7fb0cfc:	00000000	udf	#0
   0x0000fffff7fb0d00:	00000000	udf	#0
   0x0000fffff7fb0d04:	00000000	udf	#0
   0x0000fffff7fb0d08:	00000000	udf	#0
   0x0000fffff7fb0d0c:	00000000	udf	#0
   0x0000fffff7fb0d10:	00000000	udf	#0
   0x0000fffff7fb0d14:	00000000	udf	#0
   0x0000fffff7fb0d18:	00000000	udf	#0
   0x0000fffff7fb0d1c:	00000000	udf	#0
   0x0000fffff7fb0d20:	00000000	udf	#0
   0x0000fffff7fb0d24:	00000000	udf	#0
   0x0000fffff7fb0d28:	00000000	udf	#0
   0x0000fffff7fb0d2c:	00000000	udf	#0
   0x0000fffff7fb0d30:	00000000	udf	#0
   0x0000fffff7fb0d34:	00000000	udf	#0
   0x0000fffff7fb0d38:	00000000	udf	#0
   0x0000fffff7fb0d3c:	00000000	udf	#0
   0x0000fffff7fb0d40:	00000000	udf	#0
   0x0000fffff7fb0d44:	00000000	udf	#0
   0x0000fffff7fb0d48:	00000000	udf	#0
   0x0000fffff7fb0d4c:	00000000	udf	#0
   0x0000fffff7fb0d50:	00000000	udf	#0
   0x0000fffff7fb0d54:	00000000	udf	#0
   0x0000fffff7fb0d58:	00000000	udf	#0
   0x0000fffff7fb0d5c:	00000000	udf	#0
   0x0000fffff7fb0d60:	00000000	udf	#0
   0x0000fffff7fb0d64:	00000000	udf	#0
   0x0000fffff7fb0d68:	00000000	udf	#0
   0x0000fffff7fb0d6c:	00000000	udf	#0
   0x0000fffff7fb0d70:	00000000	udf	#0
   0x0000fffff7fb0d74:	00000000	udf	#0
   0x0000fffff7fb0d78:	00000000	udf	#0
   0x0000fffff7fb0d7c:	00000000	udf	#0
   0x0000fffff7fb0d80:	00000000	udf	#0
   0x0000fffff7fb0d84:	00000000	udf	#0
   0x0000fffff7fb0d88:	00000000	udf	#0
   0x0000fffff7fb0d8c:	00000000	udf	#0
   0x0000fffff7fb0d90:	00000000	udf	#0
   0x0000fffff7fb0d94:	00000000	udf	#0
   0x0000fffff7fb0d98:	00000000	udf	#0
   0x0000fffff7fb0d9c:	00000000	udf	#0
   0x0000fffff7fb0da0:	00000000	udf	#0
   0x0000fffff7fb0da4:	00000000	udf	#0
   0x0000fffff7fb0da8:	00000000	udf	#0
   0x0000fffff7fb0dac:	00000000	udf	#0
   0x0000fffff7fb0db0:	00000000	udf	#0
   0x0000fffff7fb0db4:	00000000	udf	#0
   0x0000fffff7fb0db8:	00000000	udf	#0
   0x0000fffff7fb0dbc:	00000000	udf	#0
   0x0000fffff7fb0dc0:	00000000	udf	#0
   0x0000fffff7fb0dc4:	00000000	udf	#0
   0x0000fffff7fb0dc8:	00000000	udf	#0
   0x0000fffff7fb0dcc:	00000000	udf	#0
   0x0000fffff7fb0dd0:	00000000	udf	#0
   0x0000fffff7fb0dd4:	00000000	udf	#0
   0x0000fffff7fb0dd8:	00000000	udf	#0
   0x0000fffff7fb0ddc:	00000000	udf	#0
   0x0000fffff7fb0de0:	00000000	udf	#0
   0x0000fffff7fb0de4:	00000000	udf	#0
   0x0000fffff7fb0de8:	00000000	udf	#0
   0x0000fffff7fb0dec:	00000000	udf	#0
   0x0000fffff7fb0df0:	00000000	udf	#0
   0x0000fffff7fb0df4:	00000000	udf	#0
   0x0000fffff7fb0df8:	00000000	udf	#0
   0x0000fffff7fb0dfc:	00000000	udf	#0
   0x0000fffff7fb0e00:	00000000	udf	#0
   0x0000fffff7fb0e04:	00000000	udf	#0
   0x0000fffff7fb0e08:	00000000	udf	#0
   0x0000fffff7fb0e0c:	00000000	udf	#0
   0x0000fffff7fb0e10:	00000000	udf	#0
   0x0000fffff7fb0e14:	00000000	udf	#0
   0x0000fffff7fb0e18:	00000000	udf	#0
   0x0000fffff7fb0e1c:	00000000	udf	#0
   0x0000fffff7fb0e20:	00000000	udf	#0
   0x0000fffff7fb0e24:	00000000	udf	#0
   0x0000fffff7fb0e28:	00000000	udf	#0
   0x0000fffff7fb0e2c:	00000000	udf	#0
   0x0000fffff7fb0e30:	00000000	udf	#0
   0x0000fffff7fb0e34:	00000000	udf	#0
   0x0000fffff7fb0e38:	00000000	udf	#0
   0x0000fffff7fb0e3c:	00000000	udf	#0
   0x0000fffff7fb0e40:	00000000	udf	#0
   0x0000fffff7fb0e44:	00000000	udf	#0
   0x0000fffff7fb0e48:	00000000	udf	#0
   0x0000fffff7fb0e4c:	00000000	udf	#0
   0x0000fffff7fb0e50:	00000000	udf	#0
   0x0000fffff7fb0e54:	00000000	udf	#0
   0x0000fffff7fb0e58:	00000000	udf	#0
   0x0000fffff7fb0e5c:	00000000	udf	#0
   0x0000fffff7fb0e60:	00000000	udf	#0
   0x0000fffff7fb0e64:	00000000	udf	#0
   0x0000fffff7fb0e68:	00000000	udf	#0
   0x0000fffff7fb0e6c:	00000000	udf	#0
   0x0000fffff7fb0e70:	00000000	udf	#0
   0x0000fffff7fb0e74:	00000000	udf	#0
   0x0000fffff7fb0e78:	00000000	udf	#0
   0x0000fffff7fb0e7c:	00000000	udf	#0
   0x0000fffff7fb0e80:	00000000	udf	#0
   0x0000fffff7fb0e84:	00000000	udf	#0
   0x0000fffff7fb0e88:	00000000	udf	#0
   0x0000fffff7fb0e8c:	00000000	udf	#0
   0x0000fffff7fb0e90:	00000000	udf	#0
   0x0000fffff7fb0e94:	00000000	udf	#0
   0x0000fffff7fb0e98:	00000000	udf	#0
   0x0000fffff7fb0e9c:	00000000	udf	#0
   0x0000fffff7fb0ea0:	00000000	udf	#0
   0x0000fffff7fb0ea4:	00000000	udf	#0
   0x0000fffff7fb0ea8:	00000000	udf	#0
   0x0000fffff7fb0eac:	00000000	udf	#0
   0x0000fffff7fb0eb0:	00000000	udf	#0
   0x0000fffff7fb0eb4:	00000000	udf	#0
   0x0000fffff7fb0eb8:	00000000	udf	#0
   0x0000fffff7fb0ebc:	00000000	udf	#0
   0x0000fffff7fb0ec0:	00000000	udf	#0
   0x0000fffff7fb0ec4:	00000000	udf	#0
   0x0000fffff7fb0ec8:	00000000	udf	#0
   0x0000fffff7fb0ecc:	00000000	udf	#0
   0x0000fffff7fb0ed0:	00000000	udf	#0
   0x0000fffff7fb0ed4:	00000000	udf	#0
   0x0000fffff7fb0ed8:	00000000	udf	#0
   0x0000fffff7fb0edc:	00000000	udf	#0
   0x0000fffff7fb0ee0:	00000000	udf	#0
   0x0000fffff7fb0ee4:	00000000	udf	#0
   0x0000fffff7fb0ee8:	00000000	udf	#0
   0x0000fffff7fb0eec:	00000000	udf	#0
   0x0000fffff7fb0ef0:	00000000	udf	#0
   0x0000fffff7fb0ef4:	00000000	udf	#0
   0x0000fffff7fb0ef8:	00000000	udf	#0
   0x0000fffff7fb0efc:	00000000	udf	#0
   0x0000fffff7fb0f00:	00000000	udf	#0
   0x0000fffff7fb0f04:	00000000	udf	#0
   0x0000fffff7fb0f08:	00000000	udf	#0
   0x0000fffff7fb0f0c:	00000000	udf	#0
   0x0000fffff7fb0f10:	00000000	udf	#0
   0x0000fffff7fb0f14:	00000000	udf	#0
   0x0000fffff7fb0f18:	00000000	udf	#0
   0x0000fffff7fb0f1c:	00000000	udf	#0
   0x0000fffff7fb0f20:	00000000	udf	#0
   0x0000fffff7fb0f24:	00000000	udf	#0
   0x0000fffff7fb0f28:	00000000	udf	#0
   0x0000fffff7fb0f2c:	00000000	udf	#0
   0x0000fffff7fb0f30:	00000000	udf	#0
   0x0000fffff7fb0f34:	00000000	udf	#0
   0x0000fffff7fb0f38:	00000000	udf	#0
   0x0000fffff7fb0f3c:	00000000	udf	#0
   0x0000fffff7fb0f40:	00000000	udf	#0
   0x0000fffff7fb0f44:	00000000	udf	#0
   0x0000fffff7fb0f48:	00000000	udf	#0
   0x0000fffff7fb0f4c:	00000000	udf	#0
   0x0000fffff7fb0f50:	00000000	udf	#0
   0x0000fffff7fb0f54:	00000000	udf	#0
   0x0000fffff7fb0f58:	00000000	udf	#0
   0x0000fffff7fb0f5c:	00000000	udf	#0
   0x0000fffff7fb0f60:	00000000	udf	#0
   0x0000fffff7fb0f64:	00000000	udf	#0
   0x0000fffff7fb0f68:	00000000	udf	#0
   0x0000fffff7fb0f6c:	00000000	udf	#0
   0x0000fffff7fb0f70:	00000000	udf	#0
   0x0000fffff7fb0f74:	00000000	udf	#0
   0x0000fffff7fb0f78:	00000000	udf	#0
   0x0000fffff7fb0f7c:	00000000	udf	#0
   0x0000fffff7fb0f80:	00000000	udf	#0
   0x0000fffff7fb0f84:	00000000	udf	#0
   0x0000fffff7fb0f88:	00000000	udf	#0
   0x0000fffff7fb0f8c:	00000000	udf	#0
   0x0000fffff7fb0f90:	00000000	udf	#0
   0x0000fffff7fb0f94:	00000000	udf	#0
   0x0000fffff7fb0f98:	00000000	udf	#0
   0x0000fffff7fb0f9c:	00000000	udf	#0
   0x0000fffff7fb0fa0:	00000000	udf	#0
   0x0000fffff7fb0fa4:	00000000	udf	#0
   0x0000fffff7fb0fa8:	00000000	udf	#0
   0x0000fffff7fb0fac:	00000000	udf	#0
   0x0000fffff7fb0fb0:	00000000	udf	#0
   0x0000fffff7fb0fb4:	00000000	udf	#0
   0x0000fffff7fb0fb8:	00000000	udf	#0
   0x0000fffff7fb0fbc:	00000000	udf	#0
   0x0000fffff7fb0fc0:	00000000	udf	#0
   0x0000fffff7fb0fc4:	00000000	udf	#0
   0x0000fffff7fb0fc8:	00000000	udf	#0
   0x0000fffff7fb0fcc:	00000000	udf	#0
   0x0000fffff7fb0fd0:	00000000	udf	#0
   0x0000fffff7fb0fd4:	00000000	udf	#0
   0x0000fffff7fb0fd8:	00000000	udf	#0
   0x0000fffff7fb0fdc:	00000000	udf	#0
   0x0000fffff7fb0fe0:	00000000	udf	#0
   0x0000fffff7fb0fe4:	00000000	udf	#0
   0x0000fffff7fb0fe8:	00000000	udf	#0
   0x0000fffff7fb0fec:	00000000	udf	#0
   0x0000fffff7fb0ff0:	00000000	udf	#0
   0x0000fffff7fb0ff4:	00000000	udf	#0
   0x0000fffff7fb0ff8:	00000000	udf	#0
   0x0000fffff7fb0ffc:	00000000	udf	#0
End of assembler dump.
