Dump of assembler code from 0xfffff7fab000 to 0xfffff7fad000:
   0x0000fffff7fab000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fab004:	910003fd	mov	x29, sp
   0x0000fffff7fab008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fab00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fab010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fab014:	aa0003f3	mov	x19, x0
   0x0000fffff7fab018:	aa0103f4	mov	x20, x1
   0x0000fffff7fab01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fab020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fab024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fab028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fab02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fab030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fab034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fab038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fab03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fab040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab044:	d63f0200	blr	x16
   0x0000fffff7fab048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fab04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fab050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fab054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fab058:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fab05c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fab060:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fab064:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fab068:	36d80211	tbz	w17, #27, 0xfffff7fab0a8
   0x0000fffff7fab06c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab070:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab074:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab078:	540001e1	b.ne	0xfffff7fab0b4  // b.any
   0x0000fffff7fab07c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fab080:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab084:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab088:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab08c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab090:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab094:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab098:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab09c:	540000c9	b.ls	0xfffff7fab0b4  // b.plast
   0x0000fffff7fab0a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab0a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab0a8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fab0ac:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fab0b0:	1400000e	b	0xfffff7fab0e8
   0x0000fffff7fab0b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab0b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab0bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fab0c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fab0c4:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fab0c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fab0cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fab0d0:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fab0d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab0d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab0dc:	d63f0200	blr	x16
   0x0000fffff7fab0e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab0e4:	5400d1a0	b.eq	0xfffff7facb18  // b.none
   0x0000fffff7fab0e8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fab0ec:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fab0f0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fab0f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fab0f8:	36d80211	tbz	w17, #27, 0xfffff7fab138
   0x0000fffff7fab0fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab104:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab108:	540001e1	b.ne	0xfffff7fab144  // b.any
   0x0000fffff7fab10c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fab110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab11c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab128:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab12c:	540000c9	b.ls	0xfffff7fab144  // b.plast
   0x0000fffff7fab130:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab134:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab138:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fab13c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fab140:	1400000e	b	0xfffff7fab178
   0x0000fffff7fab144:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab14c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab150:	aa1503e2	mov	x2, x21
   0x0000fffff7fab154:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fab158:	aa1403e4	mov	x4, x20
   0x0000fffff7fab15c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab160:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fab164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab16c:	d63f0200	blr	x16
   0x0000fffff7fab170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab174:	5400cd60	b.eq	0xfffff7facb20  // b.none
   0x0000fffff7fab178:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab17c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab184:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab188:	54000421	b.ne	0xfffff7fab20c  // b.any
   0x0000fffff7fab18c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab198:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab19c:	54000381	b.ne	0xfffff7fab20c  // b.any
   0x0000fffff7fab1a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab1a4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fab1a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab1ac:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fab1b0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fab1b4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fab1b8:	91000580	add	x0, x12, #0x1
   0x0000fffff7fab1bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab1c0:	36d80211	tbz	w17, #27, 0xfffff7fab200
   0x0000fffff7fab1c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab1c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab1cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab1d0:	540001e1	b.ne	0xfffff7fab20c  // b.any
   0x0000fffff7fab1d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab1d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab1dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab1e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab1e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab1e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab1ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab1f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab1f4:	540000c9	b.ls	0xfffff7fab20c  // b.plast
   0x0000fffff7fab1f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab1fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab200:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fab204:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fab208:	1400000e	b	0xfffff7fab240
   0x0000fffff7fab20c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab210:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab214:	aa1303e1	mov	x1, x19
   0x0000fffff7fab218:	aa1503e2	mov	x2, x21
   0x0000fffff7fab21c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fab220:	aa1403e4	mov	x4, x20
   0x0000fffff7fab224:	aa1603e5	mov	x5, x22
   0x0000fffff7fab228:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fab22c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab230:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab234:	d63f0200	blr	x16
   0x0000fffff7fab238:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab23c:	5400c760	b.eq	0xfffff7facb28  // b.none
   0x0000fffff7fab240:	f100041f	cmp	x0, #0x1
   0x0000fffff7fab244:	5400c340	b.eq	0xfffff7facaac  // b.none
   0x0000fffff7fab248:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fab24c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fab250:	d299c60c	mov	x12, #0xce30                	// #52784
   0x0000fffff7fab254:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fab258:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fab25c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fab260:	36d801d1	tbz	w17, #27, 0xfffff7fab298
   0x0000fffff7fab264:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab268:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab26c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab270:	54000281	b.ne	0xfffff7fab2c0  // b.any
   0x0000fffff7fab274:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fab278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab27c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab280:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab284:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab288:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab28c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab290:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab294:	54000169	b.ls	0xfffff7fab2c0  // b.plast
   0x0000fffff7fab298:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab29c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab2a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab2a4:	36d80091	tbz	w17, #27, 0xfffff7fab2b4
   0x0000fffff7fab2a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab2ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab2b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab2b4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fab2b8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fab2bc:	1400000e	b	0xfffff7fab2f4
   0x0000fffff7fab2c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab2c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab2c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fab2cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fab2d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fab2d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fab2d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fab2dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fab2e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab2e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab2e8:	d63f0200	blr	x16
   0x0000fffff7fab2ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab2f0:	5400c200	b.eq	0xfffff7facb30  // b.none
   0x0000fffff7fab2f4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fab2f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab2fc:	540003a0	b.eq	0xfffff7fab370  // b.none
   0x0000fffff7fab300:	b940426d	ldr	w13, [x19, #64]
   0x0000fffff7fab304:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7fab308:	b9400171	ldr	w17, [x11]
   0x0000fffff7fab30c:	36d801d1	tbz	w17, #27, 0xfffff7fab344
   0x0000fffff7fab310:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab314:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab318:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab31c:	540002a1	b.ne	0xfffff7fab370  // b.any
   0x0000fffff7fab320:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fab324:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab328:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab32c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab330:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab334:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab338:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab33c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab340:	54000189	b.ls	0xfffff7fab370  // b.plast
   0x0000fffff7fab344:	36d8008d	tbz	w13, #27, 0xfffff7fab354
   0x0000fffff7fab348:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab34c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab350:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab354:	36d80091	tbz	w17, #27, 0xfffff7fab364
   0x0000fffff7fab358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab35c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab360:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab364:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fab368:	b900016d	str	w13, [x11]
   0x0000fffff7fab36c:	1400000e	b	0xfffff7fab3a4
   0x0000fffff7fab370:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab378:	aa1303e1	mov	x1, x19
   0x0000fffff7fab37c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab380:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fab384:	aa1403e4	mov	x4, x20
   0x0000fffff7fab388:	aa1603e5	mov	x5, x22
   0x0000fffff7fab38c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fab390:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab398:	d63f0200	blr	x16
   0x0000fffff7fab39c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab3a0:	5400bcc0	b.eq	0xfffff7facb38  // b.none
   0x0000fffff7fab3a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab3a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab3ac:	540004a0	b.eq	0xfffff7fab440  // b.none
   0x0000fffff7fab3b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab3b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab3b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab3bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab3c0:	54000400	b.eq	0xfffff7fab440  // b.none
   0x0000fffff7fab3c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab3c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab3cc:	36d801d1	tbz	w17, #27, 0xfffff7fab404
   0x0000fffff7fab3d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab3d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab3d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab3dc:	54000321	b.ne	0xfffff7fab440  // b.any
   0x0000fffff7fab3e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab3e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab3e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab3ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab3f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab3f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab3f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab3fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab400:	54000209	b.ls	0xfffff7fab440  // b.plast
   0x0000fffff7fab404:	36d8008d	tbz	w13, #27, 0xfffff7fab414
   0x0000fffff7fab408:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab40c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab410:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab414:	36d80091	tbz	w17, #27, 0xfffff7fab424
   0x0000fffff7fab418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab41c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab420:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab424:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fab428:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fab42c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab430:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab434:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fab438:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fab43c:	1400000e	b	0xfffff7fab474
   0x0000fffff7fab440:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab448:	aa1303e1	mov	x1, x19
   0x0000fffff7fab44c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab450:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fab454:	aa1403e4	mov	x4, x20
   0x0000fffff7fab458:	aa1603e5	mov	x5, x22
   0x0000fffff7fab45c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab460:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab468:	d63f0200	blr	x16
   0x0000fffff7fab46c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab470:	5400b680	b.eq	0xfffff7facb40  // b.none
   0x0000fffff7fab474:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab478:	37d806a9	tbnz	w9, #27, 0xfffff7fab54c
   0x0000fffff7fab47c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab488:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab48c:	540001c1	b.ne	0xfffff7fab4c4  // b.any
   0x0000fffff7fab490:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fab494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab49c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab4a0:	54000121	b.ne	0xfffff7fab4c4  // b.any
   0x0000fffff7fab4a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab4a8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fab4ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab4b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab4b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab4b8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fab4bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab4c0:	14000030	b	0xfffff7fab580
   0x0000fffff7fab4c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab4c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab4cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab4d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab4d4:	54000120	b.eq	0xfffff7fab4f8  // b.none
   0x0000fffff7fab4d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab4dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab4e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab4e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab4e8:	54000321	b.ne	0xfffff7fab54c  // b.any
   0x0000fffff7fab4ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab4f0:	9e620120	scvtf	d0, x9
   0x0000fffff7fab4f4:	14000002	b	0xfffff7fab4fc
   0x0000fffff7fab4f8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fab4fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fab500:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab508:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab50c:	54000120	b.eq	0xfffff7fab530  // b.none
   0x0000fffff7fab510:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fab514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab51c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab520:	54000161	b.ne	0xfffff7fab54c  // b.any
   0x0000fffff7fab524:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fab528:	9e620121	scvtf	d1, x9
   0x0000fffff7fab52c:	14000002	b	0xfffff7fab534
   0x0000fffff7fab530:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fab534:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab538:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fab53c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab544:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab548:	17ffffde	b	0xfffff7fab4c0
   0x0000fffff7fab54c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab554:	aa1303e1	mov	x1, x19
   0x0000fffff7fab558:	aa1503e2	mov	x2, x21
   0x0000fffff7fab55c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fab560:	aa1403e4	mov	x4, x20
   0x0000fffff7fab564:	aa1603e5	mov	x5, x22
   0x0000fffff7fab568:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab56c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab574:	d63f0200	blr	x16
   0x0000fffff7fab578:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab57c:	5400ae60	b.eq	0xfffff7facb48  // b.none
   0x0000fffff7fab580:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab584:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab588:	540004a0	b.eq	0xfffff7fab61c  // b.none
   0x0000fffff7fab58c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab590:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab594:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab598:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab59c:	54000400	b.eq	0xfffff7fab61c  // b.none
   0x0000fffff7fab5a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab5a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab5a8:	36d801d1	tbz	w17, #27, 0xfffff7fab5e0
   0x0000fffff7fab5ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab5b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab5b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab5b8:	54000321	b.ne	0xfffff7fab61c  // b.any
   0x0000fffff7fab5bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab5c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab5c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab5c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab5cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab5d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab5d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab5d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab5dc:	54000209	b.ls	0xfffff7fab61c  // b.plast
   0x0000fffff7fab5e0:	36d8008d	tbz	w13, #27, 0xfffff7fab5f0
   0x0000fffff7fab5e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab5e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab5ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab5f0:	36d80091	tbz	w17, #27, 0xfffff7fab600
   0x0000fffff7fab5f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab5f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab5fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab600:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fab604:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fab608:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab60c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab610:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fab614:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fab618:	1400000e	b	0xfffff7fab650
   0x0000fffff7fab61c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab620:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab624:	aa1303e1	mov	x1, x19
   0x0000fffff7fab628:	aa1503e2	mov	x2, x21
   0x0000fffff7fab62c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fab630:	aa1403e4	mov	x4, x20
   0x0000fffff7fab634:	aa1603e5	mov	x5, x22
   0x0000fffff7fab638:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab63c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab640:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab644:	d63f0200	blr	x16
   0x0000fffff7fab648:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab64c:	5400a820	b.eq	0xfffff7facb50  // b.none
   0x0000fffff7fab650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab654:	37d806a9	tbnz	w9, #27, 0xfffff7fab728
   0x0000fffff7fab658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab65c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab668:	540001c1	b.ne	0xfffff7fab6a0  // b.any
   0x0000fffff7fab66c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fab670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab67c:	54000121	b.ne	0xfffff7fab6a0  // b.any
   0x0000fffff7fab680:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab684:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fab688:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab68c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab694:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fab698:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab69c:	14000030	b	0xfffff7fab75c
   0x0000fffff7fab6a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab6a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab6a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab6b0:	54000120	b.eq	0xfffff7fab6d4  // b.none
   0x0000fffff7fab6b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab6b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab6bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab6c4:	54000321	b.ne	0xfffff7fab728  // b.any
   0x0000fffff7fab6c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab6cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fab6d0:	14000002	b	0xfffff7fab6d8
   0x0000fffff7fab6d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fab6d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fab6dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab6e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab6e8:	54000120	b.eq	0xfffff7fab70c  // b.none
   0x0000fffff7fab6ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fab6f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab6f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab6fc:	54000161	b.ne	0xfffff7fab728  // b.any
   0x0000fffff7fab700:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fab704:	9e620121	scvtf	d1, x9
   0x0000fffff7fab708:	14000002	b	0xfffff7fab710
   0x0000fffff7fab70c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fab710:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab714:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fab718:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab71c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab724:	17ffffde	b	0xfffff7fab69c
   0x0000fffff7fab728:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab72c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab730:	aa1303e1	mov	x1, x19
   0x0000fffff7fab734:	aa1503e2	mov	x2, x21
   0x0000fffff7fab738:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fab73c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab740:	aa1603e5	mov	x5, x22
   0x0000fffff7fab744:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab748:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab74c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab750:	d63f0200	blr	x16
   0x0000fffff7fab754:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab758:	5400a000	b.eq	0xfffff7facb58  // b.none
   0x0000fffff7fab75c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab760:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab764:	540004a0	b.eq	0xfffff7fab7f8  // b.none
   0x0000fffff7fab768:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab76c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab770:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab774:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab778:	54000400	b.eq	0xfffff7fab7f8  // b.none
   0x0000fffff7fab77c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab780:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab784:	36d801d1	tbz	w17, #27, 0xfffff7fab7bc
   0x0000fffff7fab788:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab78c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab790:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab794:	54000321	b.ne	0xfffff7fab7f8  // b.any
   0x0000fffff7fab798:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab79c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab7a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab7a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab7a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab7ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab7b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab7b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab7b8:	54000209	b.ls	0xfffff7fab7f8  // b.plast
   0x0000fffff7fab7bc:	36d8008d	tbz	w13, #27, 0xfffff7fab7cc
   0x0000fffff7fab7c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab7c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab7c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab7cc:	36d80091	tbz	w17, #27, 0xfffff7fab7dc
   0x0000fffff7fab7d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab7d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab7d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab7dc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fab7e0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fab7e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab7e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab7ec:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fab7f0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fab7f4:	1400000e	b	0xfffff7fab82c
   0x0000fffff7fab7f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab7fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab800:	aa1303e1	mov	x1, x19
   0x0000fffff7fab804:	aa1503e2	mov	x2, x21
   0x0000fffff7fab808:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fab80c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab810:	aa1603e5	mov	x5, x22
   0x0000fffff7fab814:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab81c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab820:	d63f0200	blr	x16
   0x0000fffff7fab824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab828:	540099c0	b.eq	0xfffff7facb60  // b.none
   0x0000fffff7fab82c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab830:	37d806a9	tbnz	w9, #27, 0xfffff7fab904
   0x0000fffff7fab834:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab83c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab840:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab844:	540001c1	b.ne	0xfffff7fab87c  // b.any
   0x0000fffff7fab848:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fab84c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab854:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab858:	54000121	b.ne	0xfffff7fab87c  // b.any
   0x0000fffff7fab85c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab860:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fab864:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab86c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab870:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fab874:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab878:	14000030	b	0xfffff7fab938
   0x0000fffff7fab87c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab880:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab888:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab88c:	54000120	b.eq	0xfffff7fab8b0  // b.none
   0x0000fffff7fab890:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab89c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab8a0:	54000321	b.ne	0xfffff7fab904  // b.any
   0x0000fffff7fab8a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab8a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fab8ac:	14000002	b	0xfffff7fab8b4
   0x0000fffff7fab8b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fab8b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fab8b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab8bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab8c4:	54000120	b.eq	0xfffff7fab8e8  // b.none
   0x0000fffff7fab8c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fab8cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab8d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab8d8:	54000161	b.ne	0xfffff7fab904  // b.any
   0x0000fffff7fab8dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fab8e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fab8e4:	14000002	b	0xfffff7fab8ec
   0x0000fffff7fab8e8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fab8ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab8f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fab8f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab900:	17ffffde	b	0xfffff7fab878
   0x0000fffff7fab904:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab90c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab910:	aa1503e2	mov	x2, x21
   0x0000fffff7fab914:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fab918:	aa1403e4	mov	x4, x20
   0x0000fffff7fab91c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab920:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab924:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab92c:	d63f0200	blr	x16
   0x0000fffff7fab930:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab934:	540091a0	b.eq	0xfffff7facb68  // b.none
   0x0000fffff7fab938:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab93c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab940:	540004a0	b.eq	0xfffff7fab9d4  // b.none
   0x0000fffff7fab944:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab948:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab94c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab950:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab954:	54000400	b.eq	0xfffff7fab9d4  // b.none
   0x0000fffff7fab958:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab95c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab960:	36d801d1	tbz	w17, #27, 0xfffff7fab998
   0x0000fffff7fab964:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab968:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab96c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab970:	54000321	b.ne	0xfffff7fab9d4  // b.any
   0x0000fffff7fab974:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab978:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab97c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab980:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab984:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab988:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab98c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab990:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab994:	54000209	b.ls	0xfffff7fab9d4  // b.plast
   0x0000fffff7fab998:	36d8008d	tbz	w13, #27, 0xfffff7fab9a8
   0x0000fffff7fab99c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab9a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab9a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab9a8:	36d80091	tbz	w17, #27, 0xfffff7fab9b8
   0x0000fffff7fab9ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab9b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab9b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab9b8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fab9bc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fab9c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab9c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab9c8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fab9cc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fab9d0:	1400000e	b	0xfffff7faba08
   0x0000fffff7fab9d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab9d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab9dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fab9e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fab9e4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fab9e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fab9ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fab9f0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab9f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab9f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab9fc:	d63f0200	blr	x16
   0x0000fffff7faba00:	f100001f	cmp	x0, #0x0
   0x0000fffff7faba04:	54008b60	b.eq	0xfffff7facb70  // b.none
   0x0000fffff7faba08:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faba0c:	37d806a9	tbnz	w9, #27, 0xfffff7fabae0
   0x0000fffff7faba10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faba14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faba18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faba1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faba20:	540001c1	b.ne	0xfffff7faba58  // b.any
   0x0000fffff7faba24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faba28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faba2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faba30:	eb0a013f	cmp	x9, x10
   0x0000fffff7faba34:	54000121	b.ne	0xfffff7faba58  // b.any
   0x0000fffff7faba38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faba3c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7faba40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faba44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faba48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faba4c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faba50:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faba54:	14000030	b	0xfffff7fabb14
   0x0000fffff7faba58:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faba5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faba60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faba64:	eb0a013f	cmp	x9, x10
   0x0000fffff7faba68:	54000120	b.eq	0xfffff7faba8c  // b.none
   0x0000fffff7faba6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faba70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faba74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faba78:	eb0a013f	cmp	x9, x10
   0x0000fffff7faba7c:	54000321	b.ne	0xfffff7fabae0  // b.any
   0x0000fffff7faba80:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faba84:	9e620120	scvtf	d0, x9
   0x0000fffff7faba88:	14000002	b	0xfffff7faba90
   0x0000fffff7faba8c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faba90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7faba94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faba98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faba9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabaa0:	54000120	b.eq	0xfffff7fabac4  // b.none
   0x0000fffff7fabaa4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fabaa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabaac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabab4:	54000161	b.ne	0xfffff7fabae0  // b.any
   0x0000fffff7fabab8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fababc:	9e620121	scvtf	d1, x9
   0x0000fffff7fabac0:	14000002	b	0xfffff7fabac8
   0x0000fffff7fabac4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fabac8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fabacc:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fabad0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabad8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fabadc:	17ffffde	b	0xfffff7faba54
   0x0000fffff7fabae0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabae4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabae8:	aa1303e1	mov	x1, x19
   0x0000fffff7fabaec:	aa1503e2	mov	x2, x21
   0x0000fffff7fabaf0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fabaf4:	aa1403e4	mov	x4, x20
   0x0000fffff7fabaf8:	aa1603e5	mov	x5, x22
   0x0000fffff7fabafc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fabb00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabb04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabb08:	d63f0200	blr	x16
   0x0000fffff7fabb0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabb10:	54008340	b.eq	0xfffff7facb78  // b.none
   0x0000fffff7fabb14:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fabb18:	f100017f	cmp	x11, #0x0
   0x0000fffff7fabb1c:	540004a0	b.eq	0xfffff7fabbb0  // b.none
   0x0000fffff7fabb20:	b940016d	ldr	w13, [x11]
   0x0000fffff7fabb24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fabb28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fabb2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fabb30:	54000400	b.eq	0xfffff7fabbb0  // b.none
   0x0000fffff7fabb34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fabb38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fabb3c:	36d801d1	tbz	w17, #27, 0xfffff7fabb74
   0x0000fffff7fabb40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fabb44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fabb48:	f100013f	cmp	x9, #0x0
   0x0000fffff7fabb4c:	54000321	b.ne	0xfffff7fabbb0  // b.any
   0x0000fffff7fabb50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fabb54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabb58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fabb5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fabb60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fabb64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fabb68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fabb6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fabb70:	54000209	b.ls	0xfffff7fabbb0  // b.plast
   0x0000fffff7fabb74:	36d8008d	tbz	w13, #27, 0xfffff7fabb84
   0x0000fffff7fabb78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fabb7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fabb80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fabb84:	36d80091	tbz	w17, #27, 0xfffff7fabb94
   0x0000fffff7fabb88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabb8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fabb90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fabb94:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fabb98:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fabb9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fabba0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fabba4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fabba8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fabbac:	1400000e	b	0xfffff7fabbe4
   0x0000fffff7fabbb0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fabbb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabbb8:	aa1303e1	mov	x1, x19
   0x0000fffff7fabbbc:	aa1503e2	mov	x2, x21
   0x0000fffff7fabbc0:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fabbc4:	aa1403e4	mov	x4, x20
   0x0000fffff7fabbc8:	aa1603e5	mov	x5, x22
   0x0000fffff7fabbcc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fabbd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabbd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabbd8:	d63f0200	blr	x16
   0x0000fffff7fabbdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabbe0:	54007d00	b.eq	0xfffff7facb80  // b.none
   0x0000fffff7fabbe4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabbe8:	37d806a9	tbnz	w9, #27, 0xfffff7fabcbc
   0x0000fffff7fabbec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabbf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabbf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabbf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabbfc:	540001c1	b.ne	0xfffff7fabc34  // b.any
   0x0000fffff7fabc00:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fabc04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabc08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabc0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabc10:	54000121	b.ne	0xfffff7fabc34  // b.any
   0x0000fffff7fabc14:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fabc18:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fabc1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fabc20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabc24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabc28:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fabc2c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fabc30:	14000030	b	0xfffff7fabcf0
   0x0000fffff7fabc34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabc38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabc3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabc40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabc44:	54000120	b.eq	0xfffff7fabc68  // b.none
   0x0000fffff7fabc48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabc4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabc50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabc54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabc58:	54000321	b.ne	0xfffff7fabcbc  // b.any
   0x0000fffff7fabc5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fabc60:	9e620120	scvtf	d0, x9
   0x0000fffff7fabc64:	14000002	b	0xfffff7fabc6c
   0x0000fffff7fabc68:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fabc6c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fabc70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabc74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabc78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabc7c:	54000120	b.eq	0xfffff7fabca0  // b.none
   0x0000fffff7fabc80:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fabc84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabc88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabc8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabc90:	54000161	b.ne	0xfffff7fabcbc  // b.any
   0x0000fffff7fabc94:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fabc98:	9e620121	scvtf	d1, x9
   0x0000fffff7fabc9c:	14000002	b	0xfffff7fabca4
   0x0000fffff7fabca0:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fabca4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fabca8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fabcac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabcb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabcb4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fabcb8:	17ffffde	b	0xfffff7fabc30
   0x0000fffff7fabcbc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabcc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabcc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fabcc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fabccc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fabcd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fabcd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fabcd8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fabcdc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabce4:	d63f0200	blr	x16
   0x0000fffff7fabce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabcec:	540074e0	b.eq	0xfffff7facb88  // b.none
   0x0000fffff7fabcf0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fabcf4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fabcf8:	540004a0	b.eq	0xfffff7fabd8c  // b.none
   0x0000fffff7fabcfc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fabd00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fabd04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fabd08:	eb0901bf	cmp	x13, x9
   0x0000fffff7fabd0c:	54000400	b.eq	0xfffff7fabd8c  // b.none
   0x0000fffff7fabd10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fabd14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fabd18:	36d801d1	tbz	w17, #27, 0xfffff7fabd50
   0x0000fffff7fabd1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fabd20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fabd24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fabd28:	54000321	b.ne	0xfffff7fabd8c  // b.any
   0x0000fffff7fabd2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fabd30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabd34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fabd38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fabd3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fabd40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fabd44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fabd48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fabd4c:	54000209	b.ls	0xfffff7fabd8c  // b.plast
   0x0000fffff7fabd50:	36d8008d	tbz	w13, #27, 0xfffff7fabd60
   0x0000fffff7fabd54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fabd58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fabd5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fabd60:	36d80091	tbz	w17, #27, 0xfffff7fabd70
   0x0000fffff7fabd64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabd68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fabd6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fabd70:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fabd74:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fabd78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fabd7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fabd80:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fabd84:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fabd88:	1400000e	b	0xfffff7fabdc0
   0x0000fffff7fabd8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fabd90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabd94:	aa1303e1	mov	x1, x19
   0x0000fffff7fabd98:	aa1503e2	mov	x2, x21
   0x0000fffff7fabd9c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fabda0:	aa1403e4	mov	x4, x20
   0x0000fffff7fabda4:	aa1603e5	mov	x5, x22
   0x0000fffff7fabda8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fabdac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabdb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabdb4:	d63f0200	blr	x16
   0x0000fffff7fabdb8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabdbc:	54006ea0	b.eq	0xfffff7facb90  // b.none
   0x0000fffff7fabdc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabdc4:	37d806a9	tbnz	w9, #27, 0xfffff7fabe98
   0x0000fffff7fabdc8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabdcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabdd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabdd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabdd8:	540001c1	b.ne	0xfffff7fabe10  // b.any
   0x0000fffff7fabddc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fabde0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabde4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabde8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabdec:	54000121	b.ne	0xfffff7fabe10  // b.any
   0x0000fffff7fabdf0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fabdf4:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fabdf8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fabdfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabe00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabe04:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fabe08:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fabe0c:	14000030	b	0xfffff7fabecc
   0x0000fffff7fabe10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabe14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabe18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabe1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabe20:	54000120	b.eq	0xfffff7fabe44  // b.none
   0x0000fffff7fabe24:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabe28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabe2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabe30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabe34:	54000321	b.ne	0xfffff7fabe98  // b.any
   0x0000fffff7fabe38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fabe3c:	9e620120	scvtf	d0, x9
   0x0000fffff7fabe40:	14000002	b	0xfffff7fabe48
   0x0000fffff7fabe44:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fabe48:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fabe4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabe50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabe54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabe58:	54000120	b.eq	0xfffff7fabe7c  // b.none
   0x0000fffff7fabe5c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fabe60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabe64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabe68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabe6c:	54000161	b.ne	0xfffff7fabe98  // b.any
   0x0000fffff7fabe70:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fabe74:	9e620121	scvtf	d1, x9
   0x0000fffff7fabe78:	14000002	b	0xfffff7fabe80
   0x0000fffff7fabe7c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fabe80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fabe84:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fabe88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabe8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabe90:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fabe94:	17ffffde	b	0xfffff7fabe0c
   0x0000fffff7fabe98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabe9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabea0:	aa1303e1	mov	x1, x19
   0x0000fffff7fabea4:	aa1503e2	mov	x2, x21
   0x0000fffff7fabea8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fabeac:	aa1403e4	mov	x4, x20
   0x0000fffff7fabeb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fabeb4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fabeb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabebc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabec0:	d63f0200	blr	x16
   0x0000fffff7fabec4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabec8:	54006680	b.eq	0xfffff7facb98  // b.none
   0x0000fffff7fabecc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fabed0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fabed4:	540004a0	b.eq	0xfffff7fabf68  // b.none
   0x0000fffff7fabed8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fabedc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fabee0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fabee4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fabee8:	54000400	b.eq	0xfffff7fabf68  // b.none
   0x0000fffff7fabeec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fabef0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fabef4:	36d801d1	tbz	w17, #27, 0xfffff7fabf2c
   0x0000fffff7fabef8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fabefc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fabf00:	f100013f	cmp	x9, #0x0
   0x0000fffff7fabf04:	54000321	b.ne	0xfffff7fabf68  // b.any
   0x0000fffff7fabf08:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fabf0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabf10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fabf14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fabf18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fabf1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fabf20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fabf24:	f100055f	cmp	x10, #0x1
   0x0000fffff7fabf28:	54000209	b.ls	0xfffff7fabf68  // b.plast
   0x0000fffff7fabf2c:	36d8008d	tbz	w13, #27, 0xfffff7fabf3c
   0x0000fffff7fabf30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fabf34:	91000529	add	x9, x9, #0x1
   0x0000fffff7fabf38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fabf3c:	36d80091	tbz	w17, #27, 0xfffff7fabf4c
   0x0000fffff7fabf40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabf44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fabf48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fabf4c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fabf50:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fabf54:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fabf58:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fabf5c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fabf60:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fabf64:	1400000e	b	0xfffff7fabf9c
   0x0000fffff7fabf68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fabf6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabf70:	aa1303e1	mov	x1, x19
   0x0000fffff7fabf74:	aa1503e2	mov	x2, x21
   0x0000fffff7fabf78:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fabf7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fabf80:	aa1603e5	mov	x5, x22
   0x0000fffff7fabf84:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fabf88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabf8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabf90:	d63f0200	blr	x16
   0x0000fffff7fabf94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabf98:	54006040	b.eq	0xfffff7facba0  // b.none
   0x0000fffff7fabf9c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabfa0:	37d806a9	tbnz	w9, #27, 0xfffff7fac074
   0x0000fffff7fabfa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabfa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabfac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabfb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabfb4:	540001c1	b.ne	0xfffff7fabfec  // b.any
   0x0000fffff7fabfb8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fabfbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabfc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabfc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabfc8:	54000121	b.ne	0xfffff7fabfec  // b.any
   0x0000fffff7fabfcc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fabfd0:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fabfd4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fabfd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabfdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabfe0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fabfe4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fabfe8:	14000030	b	0xfffff7fac0a8
   0x0000fffff7fabfec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabff0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabff8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabffc:	54000120	b.eq	0xfffff7fac020  // b.none
   0x0000fffff7fac000:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac004:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac00c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac010:	54000321	b.ne	0xfffff7fac074  // b.any
   0x0000fffff7fac014:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac018:	9e620120	scvtf	d0, x9
   0x0000fffff7fac01c:	14000002	b	0xfffff7fac024
   0x0000fffff7fac020:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fac024:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac028:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac02c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac030:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac034:	54000120	b.eq	0xfffff7fac058  // b.none
   0x0000fffff7fac038:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac03c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac044:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac048:	54000161	b.ne	0xfffff7fac074  // b.any
   0x0000fffff7fac04c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fac050:	9e620121	scvtf	d1, x9
   0x0000fffff7fac054:	14000002	b	0xfffff7fac05c
   0x0000fffff7fac058:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fac05c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac060:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fac064:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac06c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac070:	17ffffde	b	0xfffff7fabfe8
   0x0000fffff7fac074:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac078:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac07c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac080:	aa1503e2	mov	x2, x21
   0x0000fffff7fac084:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fac088:	aa1403e4	mov	x4, x20
   0x0000fffff7fac08c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac090:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac094:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac098:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac09c:	d63f0200	blr	x16
   0x0000fffff7fac0a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac0a4:	54005820	b.eq	0xfffff7facba8  // b.none
   0x0000fffff7fac0a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac0ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac0b0:	540004a0	b.eq	0xfffff7fac144  // b.none
   0x0000fffff7fac0b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac0b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac0bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac0c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac0c4:	54000400	b.eq	0xfffff7fac144  // b.none
   0x0000fffff7fac0c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac0cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac0d0:	36d801d1	tbz	w17, #27, 0xfffff7fac108
   0x0000fffff7fac0d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac0d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac0dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac0e0:	54000321	b.ne	0xfffff7fac144  // b.any
   0x0000fffff7fac0e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac0e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac0ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac0f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac0f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac0f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac0fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac100:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac104:	54000209	b.ls	0xfffff7fac144  // b.plast
   0x0000fffff7fac108:	36d8008d	tbz	w13, #27, 0xfffff7fac118
   0x0000fffff7fac10c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac110:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac114:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac118:	36d80091	tbz	w17, #27, 0xfffff7fac128
   0x0000fffff7fac11c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac120:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac124:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac128:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fac12c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fac130:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac134:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac138:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fac13c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fac140:	1400000e	b	0xfffff7fac178
   0x0000fffff7fac144:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac14c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac150:	aa1503e2	mov	x2, x21
   0x0000fffff7fac154:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fac158:	aa1403e4	mov	x4, x20
   0x0000fffff7fac15c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac160:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac16c:	d63f0200	blr	x16
   0x0000fffff7fac170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac174:	540051e0	b.eq	0xfffff7facbb0  // b.none
   0x0000fffff7fac178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac17c:	37d806a9	tbnz	w9, #27, 0xfffff7fac250
   0x0000fffff7fac180:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac18c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac190:	540001c1	b.ne	0xfffff7fac1c8  // b.any
   0x0000fffff7fac194:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1a4:	54000121	b.ne	0xfffff7fac1c8  // b.any
   0x0000fffff7fac1a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac1ac:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fac1b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac1b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac1b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1bc:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fac1c0:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac1c4:	14000030	b	0xfffff7fac284
   0x0000fffff7fac1c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac1cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac1d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1d8:	54000120	b.eq	0xfffff7fac1fc  // b.none
   0x0000fffff7fac1dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac1e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac1e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1ec:	54000321	b.ne	0xfffff7fac250  // b.any
   0x0000fffff7fac1f0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac1f4:	9e620120	scvtf	d0, x9
   0x0000fffff7fac1f8:	14000002	b	0xfffff7fac200
   0x0000fffff7fac1fc:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fac200:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac210:	54000120	b.eq	0xfffff7fac234  // b.none
   0x0000fffff7fac214:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac21c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac220:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac224:	54000161	b.ne	0xfffff7fac250  // b.any
   0x0000fffff7fac228:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fac22c:	9e620121	scvtf	d1, x9
   0x0000fffff7fac230:	14000002	b	0xfffff7fac238
   0x0000fffff7fac234:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fac238:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac23c:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fac240:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac248:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac24c:	17ffffde	b	0xfffff7fac1c4
   0x0000fffff7fac250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac258:	aa1303e1	mov	x1, x19
   0x0000fffff7fac25c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac260:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fac264:	aa1403e4	mov	x4, x20
   0x0000fffff7fac268:	aa1603e5	mov	x5, x22
   0x0000fffff7fac26c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac270:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac278:	d63f0200	blr	x16
   0x0000fffff7fac27c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac280:	540049c0	b.eq	0xfffff7facbb8  // b.none
   0x0000fffff7fac284:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac288:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac28c:	540004a0	b.eq	0xfffff7fac320  // b.none
   0x0000fffff7fac290:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac294:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac298:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac29c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac2a0:	54000400	b.eq	0xfffff7fac320  // b.none
   0x0000fffff7fac2a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac2a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac2ac:	36d801d1	tbz	w17, #27, 0xfffff7fac2e4
   0x0000fffff7fac2b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac2b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac2b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac2bc:	54000321	b.ne	0xfffff7fac320  // b.any
   0x0000fffff7fac2c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac2c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac2c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac2cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac2d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac2d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac2d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac2dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac2e0:	54000209	b.ls	0xfffff7fac320  // b.plast
   0x0000fffff7fac2e4:	36d8008d	tbz	w13, #27, 0xfffff7fac2f4
   0x0000fffff7fac2e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac2ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac2f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac2f4:	36d80091	tbz	w17, #27, 0xfffff7fac304
   0x0000fffff7fac2f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac2fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac300:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac304:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fac308:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fac30c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac310:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac314:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fac318:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fac31c:	1400000e	b	0xfffff7fac354
   0x0000fffff7fac320:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac324:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac328:	aa1303e1	mov	x1, x19
   0x0000fffff7fac32c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac330:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fac334:	aa1403e4	mov	x4, x20
   0x0000fffff7fac338:	aa1603e5	mov	x5, x22
   0x0000fffff7fac33c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac340:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac344:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac348:	d63f0200	blr	x16
   0x0000fffff7fac34c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac350:	54004380	b.eq	0xfffff7facbc0  // b.none
   0x0000fffff7fac354:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac358:	37d806a9	tbnz	w9, #27, 0xfffff7fac42c
   0x0000fffff7fac35c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac360:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac368:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac36c:	540001c1	b.ne	0xfffff7fac3a4  // b.any
   0x0000fffff7fac370:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac374:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac37c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac380:	54000121	b.ne	0xfffff7fac3a4  // b.any
   0x0000fffff7fac384:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac388:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fac38c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac390:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac398:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fac39c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac3a0:	14000030	b	0xfffff7fac460
   0x0000fffff7fac3a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac3a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac3ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac3b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac3b4:	54000120	b.eq	0xfffff7fac3d8  // b.none
   0x0000fffff7fac3b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac3bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac3c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac3c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac3c8:	54000321	b.ne	0xfffff7fac42c  // b.any
   0x0000fffff7fac3cc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac3d0:	9e620120	scvtf	d0, x9
   0x0000fffff7fac3d4:	14000002	b	0xfffff7fac3dc
   0x0000fffff7fac3d8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fac3dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac3e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac3e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac3e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac3ec:	54000120	b.eq	0xfffff7fac410  // b.none
   0x0000fffff7fac3f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac3f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac3f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac3fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac400:	54000161	b.ne	0xfffff7fac42c  // b.any
   0x0000fffff7fac404:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fac408:	9e620121	scvtf	d1, x9
   0x0000fffff7fac40c:	14000002	b	0xfffff7fac414
   0x0000fffff7fac410:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fac414:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac418:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fac41c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac424:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac428:	17ffffde	b	0xfffff7fac3a0
   0x0000fffff7fac42c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac434:	aa1303e1	mov	x1, x19
   0x0000fffff7fac438:	aa1503e2	mov	x2, x21
   0x0000fffff7fac43c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fac440:	aa1403e4	mov	x4, x20
   0x0000fffff7fac444:	aa1603e5	mov	x5, x22
   0x0000fffff7fac448:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac44c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac454:	d63f0200	blr	x16
   0x0000fffff7fac458:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac45c:	54003b60	b.eq	0xfffff7facbc8  // b.none
   0x0000fffff7fac460:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac464:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac468:	540004a0	b.eq	0xfffff7fac4fc  // b.none
   0x0000fffff7fac46c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac470:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac474:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac478:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac47c:	54000400	b.eq	0xfffff7fac4fc  // b.none
   0x0000fffff7fac480:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac484:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac488:	36d801d1	tbz	w17, #27, 0xfffff7fac4c0
   0x0000fffff7fac48c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac490:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac494:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac498:	54000321	b.ne	0xfffff7fac4fc  // b.any
   0x0000fffff7fac49c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac4a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac4a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac4a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac4ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac4b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac4b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac4b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac4bc:	54000209	b.ls	0xfffff7fac4fc  // b.plast
   0x0000fffff7fac4c0:	36d8008d	tbz	w13, #27, 0xfffff7fac4d0
   0x0000fffff7fac4c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac4c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac4cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac4d0:	36d80091	tbz	w17, #27, 0xfffff7fac4e0
   0x0000fffff7fac4d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac4d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac4dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac4e0:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fac4e4:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fac4e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac4ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac4f0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fac4f4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fac4f8:	1400000e	b	0xfffff7fac530
   0x0000fffff7fac4fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac504:	aa1303e1	mov	x1, x19
   0x0000fffff7fac508:	aa1503e2	mov	x2, x21
   0x0000fffff7fac50c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fac510:	aa1403e4	mov	x4, x20
   0x0000fffff7fac514:	aa1603e5	mov	x5, x22
   0x0000fffff7fac518:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac51c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac524:	d63f0200	blr	x16
   0x0000fffff7fac528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac52c:	54003520	b.eq	0xfffff7facbd0  // b.none
   0x0000fffff7fac530:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac534:	37d806a9	tbnz	w9, #27, 0xfffff7fac608
   0x0000fffff7fac538:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac53c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac544:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac548:	540001c1	b.ne	0xfffff7fac580  // b.any
   0x0000fffff7fac54c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac550:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac554:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac558:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac55c:	54000121	b.ne	0xfffff7fac580  // b.any
   0x0000fffff7fac560:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac564:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fac568:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac56c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac574:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fac578:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac57c:	14000030	b	0xfffff7fac63c
   0x0000fffff7fac580:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac584:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac58c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac590:	54000120	b.eq	0xfffff7fac5b4  // b.none
   0x0000fffff7fac594:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac598:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac59c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac5a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac5a4:	54000321	b.ne	0xfffff7fac608  // b.any
   0x0000fffff7fac5a8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac5ac:	9e620120	scvtf	d0, x9
   0x0000fffff7fac5b0:	14000002	b	0xfffff7fac5b8
   0x0000fffff7fac5b4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fac5b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac5bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac5c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac5c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac5c8:	54000120	b.eq	0xfffff7fac5ec  // b.none
   0x0000fffff7fac5cc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac5d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac5d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac5d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac5dc:	54000161	b.ne	0xfffff7fac608  // b.any
   0x0000fffff7fac5e0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fac5e4:	9e620121	scvtf	d1, x9
   0x0000fffff7fac5e8:	14000002	b	0xfffff7fac5f0
   0x0000fffff7fac5ec:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fac5f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac5f4:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fac5f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac5fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac600:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac604:	17ffffde	b	0xfffff7fac57c
   0x0000fffff7fac608:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac60c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac610:	aa1303e1	mov	x1, x19
   0x0000fffff7fac614:	aa1503e2	mov	x2, x21
   0x0000fffff7fac618:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fac61c:	aa1403e4	mov	x4, x20
   0x0000fffff7fac620:	aa1603e5	mov	x5, x22
   0x0000fffff7fac624:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac628:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac62c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac630:	d63f0200	blr	x16
   0x0000fffff7fac634:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac638:	54002d00	b.eq	0xfffff7facbd8  // b.none
   0x0000fffff7fac63c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac640:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac644:	540004a0	b.eq	0xfffff7fac6d8  // b.none
   0x0000fffff7fac648:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac64c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac650:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac654:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac658:	54000400	b.eq	0xfffff7fac6d8  // b.none
   0x0000fffff7fac65c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac660:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac664:	36d801d1	tbz	w17, #27, 0xfffff7fac69c
   0x0000fffff7fac668:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac66c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac670:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac674:	54000321	b.ne	0xfffff7fac6d8  // b.any
   0x0000fffff7fac678:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac67c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac680:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac684:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac688:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac68c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac690:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac694:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac698:	54000209	b.ls	0xfffff7fac6d8  // b.plast
   0x0000fffff7fac69c:	36d8008d	tbz	w13, #27, 0xfffff7fac6ac
   0x0000fffff7fac6a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac6a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac6a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac6ac:	36d80091	tbz	w17, #27, 0xfffff7fac6bc
   0x0000fffff7fac6b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac6b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac6b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac6bc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fac6c0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fac6c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac6c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac6cc:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fac6d0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fac6d4:	1400000e	b	0xfffff7fac70c
   0x0000fffff7fac6d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac6dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac6e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fac6e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fac6e8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fac6ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fac6f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac6f4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac6f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac6fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac700:	d63f0200	blr	x16
   0x0000fffff7fac704:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac708:	540026c0	b.eq	0xfffff7facbe0  // b.none
   0x0000fffff7fac70c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac710:	37d806a9	tbnz	w9, #27, 0xfffff7fac7e4
   0x0000fffff7fac714:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac718:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac71c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac720:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac724:	540001c1	b.ne	0xfffff7fac75c  // b.any
   0x0000fffff7fac728:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac72c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac730:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac734:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac738:	54000121	b.ne	0xfffff7fac75c  // b.any
   0x0000fffff7fac73c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac740:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fac744:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac74c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac750:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fac754:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac758:	14000030	b	0xfffff7fac818
   0x0000fffff7fac75c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac760:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac764:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac768:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac76c:	54000120	b.eq	0xfffff7fac790  // b.none
   0x0000fffff7fac770:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac774:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac778:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac77c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac780:	54000321	b.ne	0xfffff7fac7e4  // b.any
   0x0000fffff7fac784:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac788:	9e620120	scvtf	d0, x9
   0x0000fffff7fac78c:	14000002	b	0xfffff7fac794
   0x0000fffff7fac790:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fac794:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac798:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac79c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac7a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac7a4:	54000120	b.eq	0xfffff7fac7c8  // b.none
   0x0000fffff7fac7a8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac7ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac7b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac7b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac7b8:	54000161	b.ne	0xfffff7fac7e4  // b.any
   0x0000fffff7fac7bc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fac7c0:	9e620121	scvtf	d1, x9
   0x0000fffff7fac7c4:	14000002	b	0xfffff7fac7cc
   0x0000fffff7fac7c8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fac7cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac7d0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fac7d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac7d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac7dc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac7e0:	17ffffde	b	0xfffff7fac758
   0x0000fffff7fac7e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac7e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac7ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fac7f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fac7f4:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fac7f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fac7fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fac800:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac804:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac808:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac80c:	d63f0200	blr	x16
   0x0000fffff7fac810:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac814:	54001ea0	b.eq	0xfffff7facbe8  // b.none
   0x0000fffff7fac818:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac81c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac820:	540004a0	b.eq	0xfffff7fac8b4  // b.none
   0x0000fffff7fac824:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac828:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac82c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac830:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac834:	54000400	b.eq	0xfffff7fac8b4  // b.none
   0x0000fffff7fac838:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac83c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac840:	36d801d1	tbz	w17, #27, 0xfffff7fac878
   0x0000fffff7fac844:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac848:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac84c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac850:	54000321	b.ne	0xfffff7fac8b4  // b.any
   0x0000fffff7fac854:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac858:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac85c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac860:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac864:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac868:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac86c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac870:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac874:	54000209	b.ls	0xfffff7fac8b4  // b.plast
   0x0000fffff7fac878:	36d8008d	tbz	w13, #27, 0xfffff7fac888
   0x0000fffff7fac87c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac880:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac884:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac888:	36d80091	tbz	w17, #27, 0xfffff7fac898
   0x0000fffff7fac88c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac890:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac894:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac898:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fac89c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fac8a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac8a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac8a8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fac8ac:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fac8b0:	1400000e	b	0xfffff7fac8e8
   0x0000fffff7fac8b4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac8b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac8bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fac8c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fac8c4:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fac8c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fac8cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fac8d0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac8d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac8d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac8dc:	d63f0200	blr	x16
   0x0000fffff7fac8e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac8e4:	54001860	b.eq	0xfffff7facbf0  // b.none
   0x0000fffff7fac8e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac8ec:	37d806a9	tbnz	w9, #27, 0xfffff7fac9c0
   0x0000fffff7fac8f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac8f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac900:	540001c1	b.ne	0xfffff7fac938  // b.any
   0x0000fffff7fac904:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac90c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac914:	54000121	b.ne	0xfffff7fac938  // b.any
   0x0000fffff7fac918:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac91c:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fac920:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac92c:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fac930:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac934:	14000030	b	0xfffff7fac9f4
   0x0000fffff7fac938:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac93c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac944:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac948:	54000120	b.eq	0xfffff7fac96c  // b.none
   0x0000fffff7fac94c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac95c:	54000321	b.ne	0xfffff7fac9c0  // b.any
   0x0000fffff7fac960:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac964:	9e620120	scvtf	d0, x9
   0x0000fffff7fac968:	14000002	b	0xfffff7fac970
   0x0000fffff7fac96c:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fac970:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac974:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac97c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac980:	54000120	b.eq	0xfffff7fac9a4  // b.none
   0x0000fffff7fac984:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac98c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac994:	54000161	b.ne	0xfffff7fac9c0  // b.any
   0x0000fffff7fac998:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fac99c:	9e620121	scvtf	d1, x9
   0x0000fffff7fac9a0:	14000002	b	0xfffff7fac9a8
   0x0000fffff7fac9a4:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fac9a8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac9ac:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fac9b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac9b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac9b8:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fac9bc:	17ffffde	b	0xfffff7fac934
   0x0000fffff7fac9c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac9c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac9c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fac9cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fac9d0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fac9d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fac9d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fac9dc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac9e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac9e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac9e8:	d63f0200	blr	x16
   0x0000fffff7fac9ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac9f0:	54001040	b.eq	0xfffff7facbf8  // b.none
   0x0000fffff7fac9f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac9f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac9fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faca00:	eb0a013f	cmp	x9, x10
   0x0000fffff7faca04:	54000381	b.ne	0xfffff7faca74  // b.any
   0x0000fffff7faca08:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7faca0c:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7faca10:	8b0a018b	add	x11, x12, x10
   0x0000fffff7faca14:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7faca18:	36d80211	tbz	w17, #27, 0xfffff7faca58
   0x0000fffff7faca1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faca20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faca24:	f100013f	cmp	x9, #0x0
   0x0000fffff7faca28:	54000261	b.ne	0xfffff7faca74  // b.any
   0x0000fffff7faca2c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7faca30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faca34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faca38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faca3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faca40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faca44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faca48:	f100055f	cmp	x10, #0x1
   0x0000fffff7faca4c:	54000149	b.ls	0xfffff7faca74  // b.plast
   0x0000fffff7faca50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faca54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faca58:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7faca5c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7faca60:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7faca64:	b900526d	str	w13, [x19, #80]
   0x0000fffff7faca68:	f900266b	str	x11, [x19, #72]
   0x0000fffff7faca6c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faca70:	1400000e	b	0xfffff7facaa8
   0x0000fffff7faca74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faca78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faca7c:	aa1303e1	mov	x1, x19
   0x0000fffff7faca80:	aa1503e2	mov	x2, x21
   0x0000fffff7faca84:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7faca88:	aa1403e4	mov	x4, x20
   0x0000fffff7faca8c:	aa1603e5	mov	x5, x22
   0x0000fffff7faca90:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7faca94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faca98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faca9c:	d63f0200	blr	x16
   0x0000fffff7facaa0:	f100001f	cmp	x0, #0x0
   0x0000fffff7facaa4:	54000ae0	b.eq	0xfffff7facc00  // b.none
   0x0000fffff7facaa8:	17fff9b4	b	0xfffff7fab178
   0x0000fffff7facaac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facab0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facab4:	aa1303e1	mov	x1, x19
   0x0000fffff7facab8:	aa1503e2	mov	x2, x21
   0x0000fffff7facabc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7facac0:	aa1403e4	mov	x4, x20
   0x0000fffff7facac4:	aa1603e5	mov	x5, x22
   0x0000fffff7facac8:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7facacc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7facad0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facad4:	d63f0200	blr	x16
   0x0000fffff7facad8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7facadc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7facae0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7facae4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7facae8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7facaec:	d65f03c0	ret
   0x0000fffff7facaf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facaf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facaf8:	b900028a	str	w10, [x20]
   0x0000fffff7facafc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7facb00:	910143ff	add	sp, sp, #0x50
   0x0000fffff7facb04:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7facb08:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7facb0c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7facb10:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7facb14:	d65f03c0	ret
   0x0000fffff7facb18:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7facb1c:	17fffff5	b	0xfffff7facaf0
   0x0000fffff7facb20:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7facb24:	17fffff3	b	0xfffff7facaf0
   0x0000fffff7facb28:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7facb2c:	17fffff1	b	0xfffff7facaf0
   0x0000fffff7facb30:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7facb34:	17ffffef	b	0xfffff7facaf0
   0x0000fffff7facb38:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7facb3c:	17ffffed	b	0xfffff7facaf0
   0x0000fffff7facb40:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7facb44:	17ffffeb	b	0xfffff7facaf0
   0x0000fffff7facb48:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7facb4c:	17ffffe9	b	0xfffff7facaf0
   0x0000fffff7facb50:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7facb54:	17ffffe7	b	0xfffff7facaf0
   0x0000fffff7facb58:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7facb5c:	17ffffe5	b	0xfffff7facaf0
   0x0000fffff7facb60:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7facb64:	17ffffe3	b	0xfffff7facaf0
   0x0000fffff7facb68:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7facb6c:	17ffffe1	b	0xfffff7facaf0
   0x0000fffff7facb70:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7facb74:	17ffffdf	b	0xfffff7facaf0
   0x0000fffff7facb78:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7facb7c:	17ffffdd	b	0xfffff7facaf0
   0x0000fffff7facb80:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7facb84:	17ffffdb	b	0xfffff7facaf0
   0x0000fffff7facb88:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7facb8c:	17ffffd9	b	0xfffff7facaf0
   0x0000fffff7facb90:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7facb94:	17ffffd7	b	0xfffff7facaf0
   0x0000fffff7facb98:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7facb9c:	17ffffd5	b	0xfffff7facaf0
   0x0000fffff7facba0:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7facba4:	17ffffd3	b	0xfffff7facaf0
   0x0000fffff7facba8:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7facbac:	17ffffd1	b	0xfffff7facaf0
   0x0000fffff7facbb0:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7facbb4:	17ffffcf	b	0xfffff7facaf0
   0x0000fffff7facbb8:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7facbbc:	17ffffcd	b	0xfffff7facaf0
   0x0000fffff7facbc0:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7facbc4:	17ffffcb	b	0xfffff7facaf0
   0x0000fffff7facbc8:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7facbcc:	17ffffc9	b	0xfffff7facaf0
   0x0000fffff7facbd0:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7facbd4:	17ffffc7	b	0xfffff7facaf0
   0x0000fffff7facbd8:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7facbdc:	17ffffc5	b	0xfffff7facaf0
   0x0000fffff7facbe0:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7facbe4:	17ffffc3	b	0xfffff7facaf0
   0x0000fffff7facbe8:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7facbec:	17ffffc1	b	0xfffff7facaf0
   0x0000fffff7facbf0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7facbf4:	17ffffbf	b	0xfffff7facaf0
   0x0000fffff7facbf8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7facbfc:	17ffffbd	b	0xfffff7facaf0
   0x0000fffff7facc00:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7facc04:	17ffffbb	b	0xfffff7facaf0
   0x0000fffff7facc08:	00000000	udf	#0
   0x0000fffff7facc0c:	00000000	udf	#0
   0x0000fffff7facc10:	00000000	udf	#0
   0x0000fffff7facc14:	00000000	udf	#0
   0x0000fffff7facc18:	00000000	udf	#0
   0x0000fffff7facc1c:	00000000	udf	#0
   0x0000fffff7facc20:	00000000	udf	#0
   0x0000fffff7facc24:	00000000	udf	#0
   0x0000fffff7facc28:	00000000	udf	#0
   0x0000fffff7facc2c:	00000000	udf	#0
   0x0000fffff7facc30:	00000000	udf	#0
   0x0000fffff7facc34:	00000000	udf	#0
   0x0000fffff7facc38:	00000000	udf	#0
   0x0000fffff7facc3c:	00000000	udf	#0
   0x0000fffff7facc40:	00000000	udf	#0
   0x0000fffff7facc44:	00000000	udf	#0
   0x0000fffff7facc48:	00000000	udf	#0
   0x0000fffff7facc4c:	00000000	udf	#0
   0x0000fffff7facc50:	00000000	udf	#0
   0x0000fffff7facc54:	00000000	udf	#0
   0x0000fffff7facc58:	00000000	udf	#0
   0x0000fffff7facc5c:	00000000	udf	#0
   0x0000fffff7facc60:	00000000	udf	#0
   0x0000fffff7facc64:	00000000	udf	#0
   0x0000fffff7facc68:	00000000	udf	#0
   0x0000fffff7facc6c:	00000000	udf	#0
   0x0000fffff7facc70:	00000000	udf	#0
   0x0000fffff7facc74:	00000000	udf	#0
   0x0000fffff7facc78:	00000000	udf	#0
   0x0000fffff7facc7c:	00000000	udf	#0
   0x0000fffff7facc80:	00000000	udf	#0
   0x0000fffff7facc84:	00000000	udf	#0
   0x0000fffff7facc88:	00000000	udf	#0
   0x0000fffff7facc8c:	00000000	udf	#0
   0x0000fffff7facc90:	00000000	udf	#0
   0x0000fffff7facc94:	00000000	udf	#0
   0x0000fffff7facc98:	00000000	udf	#0
   0x0000fffff7facc9c:	00000000	udf	#0
   0x0000fffff7facca0:	00000000	udf	#0
   0x0000fffff7facca4:	00000000	udf	#0
   0x0000fffff7facca8:	00000000	udf	#0
   0x0000fffff7faccac:	00000000	udf	#0
   0x0000fffff7faccb0:	00000000	udf	#0
   0x0000fffff7faccb4:	00000000	udf	#0
   0x0000fffff7faccb8:	00000000	udf	#0
   0x0000fffff7faccbc:	00000000	udf	#0
   0x0000fffff7faccc0:	00000000	udf	#0
   0x0000fffff7faccc4:	00000000	udf	#0
   0x0000fffff7faccc8:	00000000	udf	#0
   0x0000fffff7facccc:	00000000	udf	#0
   0x0000fffff7faccd0:	00000000	udf	#0
   0x0000fffff7faccd4:	00000000	udf	#0
   0x0000fffff7faccd8:	00000000	udf	#0
   0x0000fffff7faccdc:	00000000	udf	#0
   0x0000fffff7facce0:	00000000	udf	#0
   0x0000fffff7facce4:	00000000	udf	#0
   0x0000fffff7facce8:	00000000	udf	#0
   0x0000fffff7faccec:	00000000	udf	#0
   0x0000fffff7faccf0:	00000000	udf	#0
   0x0000fffff7faccf4:	00000000	udf	#0
   0x0000fffff7faccf8:	00000000	udf	#0
   0x0000fffff7faccfc:	00000000	udf	#0
   0x0000fffff7facd00:	00000000	udf	#0
   0x0000fffff7facd04:	00000000	udf	#0
   0x0000fffff7facd08:	00000000	udf	#0
   0x0000fffff7facd0c:	00000000	udf	#0
   0x0000fffff7facd10:	00000000	udf	#0
   0x0000fffff7facd14:	00000000	udf	#0
   0x0000fffff7facd18:	00000000	udf	#0
   0x0000fffff7facd1c:	00000000	udf	#0
   0x0000fffff7facd20:	00000000	udf	#0
   0x0000fffff7facd24:	00000000	udf	#0
   0x0000fffff7facd28:	00000000	udf	#0
   0x0000fffff7facd2c:	00000000	udf	#0
   0x0000fffff7facd30:	00000000	udf	#0
   0x0000fffff7facd34:	00000000	udf	#0
   0x0000fffff7facd38:	00000000	udf	#0
   0x0000fffff7facd3c:	00000000	udf	#0
   0x0000fffff7facd40:	00000000	udf	#0
   0x0000fffff7facd44:	00000000	udf	#0
   0x0000fffff7facd48:	00000000	udf	#0
   0x0000fffff7facd4c:	00000000	udf	#0
   0x0000fffff7facd50:	00000000	udf	#0
   0x0000fffff7facd54:	00000000	udf	#0
   0x0000fffff7facd58:	00000000	udf	#0
   0x0000fffff7facd5c:	00000000	udf	#0
   0x0000fffff7facd60:	00000000	udf	#0
   0x0000fffff7facd64:	00000000	udf	#0
   0x0000fffff7facd68:	00000000	udf	#0
   0x0000fffff7facd6c:	00000000	udf	#0
   0x0000fffff7facd70:	00000000	udf	#0
   0x0000fffff7facd74:	00000000	udf	#0
   0x0000fffff7facd78:	00000000	udf	#0
   0x0000fffff7facd7c:	00000000	udf	#0
   0x0000fffff7facd80:	00000000	udf	#0
   0x0000fffff7facd84:	00000000	udf	#0
   0x0000fffff7facd88:	00000000	udf	#0
   0x0000fffff7facd8c:	00000000	udf	#0
   0x0000fffff7facd90:	00000000	udf	#0
   0x0000fffff7facd94:	00000000	udf	#0
   0x0000fffff7facd98:	00000000	udf	#0
   0x0000fffff7facd9c:	00000000	udf	#0
   0x0000fffff7facda0:	00000000	udf	#0
   0x0000fffff7facda4:	00000000	udf	#0
   0x0000fffff7facda8:	00000000	udf	#0
   0x0000fffff7facdac:	00000000	udf	#0
   0x0000fffff7facdb0:	00000000	udf	#0
   0x0000fffff7facdb4:	00000000	udf	#0
   0x0000fffff7facdb8:	00000000	udf	#0
   0x0000fffff7facdbc:	00000000	udf	#0
   0x0000fffff7facdc0:	00000000	udf	#0
   0x0000fffff7facdc4:	00000000	udf	#0
   0x0000fffff7facdc8:	00000000	udf	#0
   0x0000fffff7facdcc:	00000000	udf	#0
   0x0000fffff7facdd0:	00000000	udf	#0
   0x0000fffff7facdd4:	00000000	udf	#0
   0x0000fffff7facdd8:	00000000	udf	#0
   0x0000fffff7facddc:	00000000	udf	#0
   0x0000fffff7facde0:	00000000	udf	#0
   0x0000fffff7facde4:	00000000	udf	#0
   0x0000fffff7facde8:	00000000	udf	#0
   0x0000fffff7facdec:	00000000	udf	#0
   0x0000fffff7facdf0:	00000000	udf	#0
   0x0000fffff7facdf4:	00000000	udf	#0
   0x0000fffff7facdf8:	00000000	udf	#0
   0x0000fffff7facdfc:	00000000	udf	#0
   0x0000fffff7face00:	00000000	udf	#0
   0x0000fffff7face04:	00000000	udf	#0
   0x0000fffff7face08:	00000000	udf	#0
   0x0000fffff7face0c:	00000000	udf	#0
   0x0000fffff7face10:	00000000	udf	#0
   0x0000fffff7face14:	00000000	udf	#0
   0x0000fffff7face18:	00000000	udf	#0
   0x0000fffff7face1c:	00000000	udf	#0
   0x0000fffff7face20:	00000000	udf	#0
   0x0000fffff7face24:	00000000	udf	#0
   0x0000fffff7face28:	00000000	udf	#0
   0x0000fffff7face2c:	00000000	udf	#0
   0x0000fffff7face30:	00000000	udf	#0
   0x0000fffff7face34:	00000000	udf	#0
   0x0000fffff7face38:	00000000	udf	#0
   0x0000fffff7face3c:	00000000	udf	#0
   0x0000fffff7face40:	00000000	udf	#0
   0x0000fffff7face44:	00000000	udf	#0
   0x0000fffff7face48:	00000000	udf	#0
   0x0000fffff7face4c:	00000000	udf	#0
   0x0000fffff7face50:	00000000	udf	#0
   0x0000fffff7face54:	00000000	udf	#0
   0x0000fffff7face58:	00000000	udf	#0
   0x0000fffff7face5c:	00000000	udf	#0
   0x0000fffff7face60:	00000000	udf	#0
   0x0000fffff7face64:	00000000	udf	#0
   0x0000fffff7face68:	00000000	udf	#0
   0x0000fffff7face6c:	00000000	udf	#0
   0x0000fffff7face70:	00000000	udf	#0
   0x0000fffff7face74:	00000000	udf	#0
   0x0000fffff7face78:	00000000	udf	#0
   0x0000fffff7face7c:	00000000	udf	#0
   0x0000fffff7face80:	00000000	udf	#0
   0x0000fffff7face84:	00000000	udf	#0
   0x0000fffff7face88:	00000000	udf	#0
   0x0000fffff7face8c:	00000000	udf	#0
   0x0000fffff7face90:	00000000	udf	#0
   0x0000fffff7face94:	00000000	udf	#0
   0x0000fffff7face98:	00000000	udf	#0
   0x0000fffff7face9c:	00000000	udf	#0
   0x0000fffff7facea0:	00000000	udf	#0
   0x0000fffff7facea4:	00000000	udf	#0
   0x0000fffff7facea8:	00000000	udf	#0
   0x0000fffff7faceac:	00000000	udf	#0
   0x0000fffff7faceb0:	00000000	udf	#0
   0x0000fffff7faceb4:	00000000	udf	#0
   0x0000fffff7faceb8:	00000000	udf	#0
   0x0000fffff7facebc:	00000000	udf	#0
   0x0000fffff7facec0:	00000000	udf	#0
   0x0000fffff7facec4:	00000000	udf	#0
   0x0000fffff7facec8:	00000000	udf	#0
   0x0000fffff7facecc:	00000000	udf	#0
   0x0000fffff7faced0:	00000000	udf	#0
   0x0000fffff7faced4:	00000000	udf	#0
   0x0000fffff7faced8:	00000000	udf	#0
   0x0000fffff7facedc:	00000000	udf	#0
   0x0000fffff7facee0:	00000000	udf	#0
   0x0000fffff7facee4:	00000000	udf	#0
   0x0000fffff7facee8:	00000000	udf	#0
   0x0000fffff7faceec:	00000000	udf	#0
   0x0000fffff7facef0:	00000000	udf	#0
   0x0000fffff7facef4:	00000000	udf	#0
   0x0000fffff7facef8:	00000000	udf	#0
   0x0000fffff7facefc:	00000000	udf	#0
   0x0000fffff7facf00:	00000000	udf	#0
   0x0000fffff7facf04:	00000000	udf	#0
   0x0000fffff7facf08:	00000000	udf	#0
   0x0000fffff7facf0c:	00000000	udf	#0
   0x0000fffff7facf10:	00000000	udf	#0
   0x0000fffff7facf14:	00000000	udf	#0
   0x0000fffff7facf18:	00000000	udf	#0
   0x0000fffff7facf1c:	00000000	udf	#0
   0x0000fffff7facf20:	00000000	udf	#0
   0x0000fffff7facf24:	00000000	udf	#0
   0x0000fffff7facf28:	00000000	udf	#0
   0x0000fffff7facf2c:	00000000	udf	#0
   0x0000fffff7facf30:	00000000	udf	#0
   0x0000fffff7facf34:	00000000	udf	#0
   0x0000fffff7facf38:	00000000	udf	#0
   0x0000fffff7facf3c:	00000000	udf	#0
   0x0000fffff7facf40:	00000000	udf	#0
   0x0000fffff7facf44:	00000000	udf	#0
   0x0000fffff7facf48:	00000000	udf	#0
   0x0000fffff7facf4c:	00000000	udf	#0
   0x0000fffff7facf50:	00000000	udf	#0
   0x0000fffff7facf54:	00000000	udf	#0
   0x0000fffff7facf58:	00000000	udf	#0
   0x0000fffff7facf5c:	00000000	udf	#0
   0x0000fffff7facf60:	00000000	udf	#0
   0x0000fffff7facf64:	00000000	udf	#0
   0x0000fffff7facf68:	00000000	udf	#0
   0x0000fffff7facf6c:	00000000	udf	#0
   0x0000fffff7facf70:	00000000	udf	#0
   0x0000fffff7facf74:	00000000	udf	#0
   0x0000fffff7facf78:	00000000	udf	#0
   0x0000fffff7facf7c:	00000000	udf	#0
   0x0000fffff7facf80:	00000000	udf	#0
   0x0000fffff7facf84:	00000000	udf	#0
   0x0000fffff7facf88:	00000000	udf	#0
   0x0000fffff7facf8c:	00000000	udf	#0
   0x0000fffff7facf90:	00000000	udf	#0
   0x0000fffff7facf94:	00000000	udf	#0
   0x0000fffff7facf98:	00000000	udf	#0
   0x0000fffff7facf9c:	00000000	udf	#0
   0x0000fffff7facfa0:	00000000	udf	#0
   0x0000fffff7facfa4:	00000000	udf	#0
   0x0000fffff7facfa8:	00000000	udf	#0
   0x0000fffff7facfac:	00000000	udf	#0
   0x0000fffff7facfb0:	00000000	udf	#0
   0x0000fffff7facfb4:	00000000	udf	#0
   0x0000fffff7facfb8:	00000000	udf	#0
   0x0000fffff7facfbc:	00000000	udf	#0
   0x0000fffff7facfc0:	00000000	udf	#0
   0x0000fffff7facfc4:	00000000	udf	#0
   0x0000fffff7facfc8:	00000000	udf	#0
   0x0000fffff7facfcc:	00000000	udf	#0
   0x0000fffff7facfd0:	00000000	udf	#0
   0x0000fffff7facfd4:	00000000	udf	#0
   0x0000fffff7facfd8:	00000000	udf	#0
   0x0000fffff7facfdc:	00000000	udf	#0
   0x0000fffff7facfe0:	00000000	udf	#0
   0x0000fffff7facfe4:	00000000	udf	#0
   0x0000fffff7facfe8:	00000000	udf	#0
   0x0000fffff7facfec:	00000000	udf	#0
   0x0000fffff7facff0:	00000000	udf	#0
   0x0000fffff7facff4:	00000000	udf	#0
   0x0000fffff7facff8:	00000000	udf	#0
   0x0000fffff7facffc:	00000000	udf	#0
End of assembler dump.
