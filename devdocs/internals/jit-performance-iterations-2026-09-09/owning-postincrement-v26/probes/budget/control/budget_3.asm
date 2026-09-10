Dump of assembler code from 0xfffff7fbb000 to 0xfffff7fbc000:
   0x0000fffff7fbb000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fbb004:	910003fd	mov	x29, sp
   0x0000fffff7fbb008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fbb00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fbb010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fbb014:	aa0003f3	mov	x19, x0
   0x0000fffff7fbb018:	aa0103f4	mov	x20, x1
   0x0000fffff7fbb01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fbb020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fbb024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fbb028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fbb02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fbb030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fbb034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fbb038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fbb03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fbb040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb044:	d63f0200	blr	x16
   0x0000fffff7fbb048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fbb04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fbb050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fbb054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fbb058:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbb05c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbb060:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fbb064:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fbb068:	36d80211	tbz	w17, #27, 0xfffff7fbb0a8
   0x0000fffff7fbb06c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb070:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb074:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb078:	540001e1	b.ne	0xfffff7fbb0b4  // b.any
   0x0000fffff7fbb07c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fbb080:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb084:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb088:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb08c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb090:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb094:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb098:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb09c:	540000c9	b.ls	0xfffff7fbb0b4  // b.plast
   0x0000fffff7fbb0a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb0a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb0a8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fbb0ac:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fbb0b0:	1400000e	b	0xfffff7fbb0e8
   0x0000fffff7fbb0b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb0b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb0bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb0c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb0c4:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fbb0c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb0cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb0d0:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fbb0d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb0d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb0dc:	d63f0200	blr	x16
   0x0000fffff7fbb0e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb0e4:	54004a40	b.eq	0xfffff7fbba2c  // b.none
   0x0000fffff7fbb0e8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbb0ec:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbb0f0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fbb0f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbb0f8:	36d80211	tbz	w17, #27, 0xfffff7fbb138
   0x0000fffff7fbb0fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb104:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb108:	540001e1	b.ne	0xfffff7fbb144  // b.any
   0x0000fffff7fbb10c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbb110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb11c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb128:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb12c:	540000c9	b.ls	0xfffff7fbb144  // b.plast
   0x0000fffff7fbb130:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb134:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb138:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbb13c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbb140:	1400000e	b	0xfffff7fbb178
   0x0000fffff7fbb144:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb14c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb150:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb154:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fbb158:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb15c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb160:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fbb164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb16c:	d63f0200	blr	x16
   0x0000fffff7fbb170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb174:	54004600	b.eq	0xfffff7fbba34  // b.none
   0x0000fffff7fbb178:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb17c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb184:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb188:	54000421	b.ne	0xfffff7fbb20c  // b.any
   0x0000fffff7fbb18c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbb190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb198:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb19c:	54000381	b.ne	0xfffff7fbb20c  // b.any
   0x0000fffff7fbb1a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb1a4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fbb1a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb1ac:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fbb1b0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fbb1b4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fbb1b8:	91000580	add	x0, x12, #0x1
   0x0000fffff7fbb1bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb1c0:	36d80211	tbz	w17, #27, 0xfffff7fbb200
   0x0000fffff7fbb1c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb1c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb1cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb1d0:	540001e1	b.ne	0xfffff7fbb20c  // b.any
   0x0000fffff7fbb1d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb1d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb1dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb1e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb1e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb1e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb1ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb1f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb1f4:	540000c9	b.ls	0xfffff7fbb20c  // b.plast
   0x0000fffff7fbb1f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb1fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb200:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fbb204:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fbb208:	1400000e	b	0xfffff7fbb240
   0x0000fffff7fbb20c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb210:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb214:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb218:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb21c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fbb220:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb224:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb228:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fbb22c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb230:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb234:	d63f0200	blr	x16
   0x0000fffff7fbb238:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb23c:	54004000	b.eq	0xfffff7fbba3c  // b.none
   0x0000fffff7fbb240:	f100041f	cmp	x0, #0x1
   0x0000fffff7fbb244:	54003be0	b.eq	0xfffff7fbb9c0  // b.none
   0x0000fffff7fbb248:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbb24c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbb250:	d299c60c	mov	x12, #0xce30                	// #52784
   0x0000fffff7fbb254:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbb258:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbb25c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fbb260:	36d801d1	tbz	w17, #27, 0xfffff7fbb298
   0x0000fffff7fbb264:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb268:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb26c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb270:	54000281	b.ne	0xfffff7fbb2c0  // b.any
   0x0000fffff7fbb274:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fbb278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb27c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb280:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb284:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb288:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb28c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb290:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb294:	54000169	b.ls	0xfffff7fbb2c0  // b.plast
   0x0000fffff7fbb298:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb29c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb2a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb2a4:	36d80091	tbz	w17, #27, 0xfffff7fbb2b4
   0x0000fffff7fbb2a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb2ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb2b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb2b4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fbb2b8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fbb2bc:	1400000e	b	0xfffff7fbb2f4
   0x0000fffff7fbb2c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb2c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb2c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb2cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb2d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fbb2d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb2d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb2dc:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fbb2e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb2e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb2e8:	d63f0200	blr	x16
   0x0000fffff7fbb2ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb2f0:	54003aa0	b.eq	0xfffff7fbba44  // b.none
   0x0000fffff7fbb2f4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbb2f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb2fc:	540003a0	b.eq	0xfffff7fbb370  // b.none
   0x0000fffff7fbb300:	b940426d	ldr	w13, [x19, #64]
   0x0000fffff7fbb304:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7fbb308:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbb30c:	36d801d1	tbz	w17, #27, 0xfffff7fbb344
   0x0000fffff7fbb310:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb314:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb318:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb31c:	540002a1	b.ne	0xfffff7fbb370  // b.any
   0x0000fffff7fbb320:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbb324:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb328:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb32c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb330:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb334:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb338:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb33c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb340:	54000189	b.ls	0xfffff7fbb370  // b.plast
   0x0000fffff7fbb344:	36d8008d	tbz	w13, #27, 0xfffff7fbb354
   0x0000fffff7fbb348:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb34c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb350:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb354:	36d80091	tbz	w17, #27, 0xfffff7fbb364
   0x0000fffff7fbb358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb35c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb360:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb364:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbb368:	b900016d	str	w13, [x11]
   0x0000fffff7fbb36c:	1400000e	b	0xfffff7fbb3a4
   0x0000fffff7fbb370:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbb374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb378:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb37c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb380:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fbb384:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb388:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb38c:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fbb390:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb398:	d63f0200	blr	x16
   0x0000fffff7fbb39c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb3a0:	54003560	b.eq	0xfffff7fbba4c  // b.none
   0x0000fffff7fbb3a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb3a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb3ac:	540004a0	b.eq	0xfffff7fbb440  // b.none
   0x0000fffff7fbb3b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb3b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb3b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb3bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb3c0:	54000400	b.eq	0xfffff7fbb440  // b.none
   0x0000fffff7fbb3c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb3c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb3cc:	36d801d1	tbz	w17, #27, 0xfffff7fbb404
   0x0000fffff7fbb3d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb3d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb3d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb3dc:	54000321	b.ne	0xfffff7fbb440  // b.any
   0x0000fffff7fbb3e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb3e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb3e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb3ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb3f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb3f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb3f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb3fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb400:	54000209	b.ls	0xfffff7fbb440  // b.plast
   0x0000fffff7fbb404:	36d8008d	tbz	w13, #27, 0xfffff7fbb414
   0x0000fffff7fbb408:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb40c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb410:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb414:	36d80091	tbz	w17, #27, 0xfffff7fbb424
   0x0000fffff7fbb418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb41c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb420:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb424:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fbb428:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fbb42c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb430:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb434:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fbb438:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fbb43c:	1400000e	b	0xfffff7fbb474
   0x0000fffff7fbb440:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb448:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb44c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb450:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fbb454:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb458:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb45c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fbb460:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb468:	d63f0200	blr	x16
   0x0000fffff7fbb46c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb470:	54002f20	b.eq	0xfffff7fbba54  // b.none
   0x0000fffff7fbb474:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb478:	37d806a9	tbnz	w9, #27, 0xfffff7fbb54c
   0x0000fffff7fbb47c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb488:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb48c:	540001c1	b.ne	0xfffff7fbb4c4  // b.any
   0x0000fffff7fbb490:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb49c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb4a0:	54000121	b.ne	0xfffff7fbb4c4  // b.any
   0x0000fffff7fbb4a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb4a8:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fbb4ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb4b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb4b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb4b8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbb4bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb4c0:	14000030	b	0xfffff7fbb580
   0x0000fffff7fbb4c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb4c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb4cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb4d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb4d4:	54000120	b.eq	0xfffff7fbb4f8  // b.none
   0x0000fffff7fbb4d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb4dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb4e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb4e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb4e8:	54000321	b.ne	0xfffff7fbb54c  // b.any
   0x0000fffff7fbb4ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb4f0:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb4f4:	14000002	b	0xfffff7fbb4fc
   0x0000fffff7fbb4f8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbb4fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb500:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb508:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb50c:	54000120	b.eq	0xfffff7fbb530  // b.none
   0x0000fffff7fbb510:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb51c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb520:	54000161	b.ne	0xfffff7fbb54c  // b.any
   0x0000fffff7fbb524:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fbb528:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb52c:	14000002	b	0xfffff7fbb534
   0x0000fffff7fbb530:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fbb534:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb538:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb53c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb544:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb548:	17ffffde	b	0xfffff7fbb4c0
   0x0000fffff7fbb54c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb554:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb558:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb55c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fbb560:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb564:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb568:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fbb56c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb574:	d63f0200	blr	x16
   0x0000fffff7fbb578:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb57c:	54002700	b.eq	0xfffff7fbba5c  // b.none
   0x0000fffff7fbb580:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb584:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb588:	540004a0	b.eq	0xfffff7fbb61c  // b.none
   0x0000fffff7fbb58c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb590:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb594:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb598:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb59c:	54000400	b.eq	0xfffff7fbb61c  // b.none
   0x0000fffff7fbb5a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb5a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb5a8:	36d801d1	tbz	w17, #27, 0xfffff7fbb5e0
   0x0000fffff7fbb5ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb5b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb5b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb5b8:	54000321	b.ne	0xfffff7fbb61c  // b.any
   0x0000fffff7fbb5bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb5c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb5c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb5c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb5cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb5d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb5d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb5d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb5dc:	54000209	b.ls	0xfffff7fbb61c  // b.plast
   0x0000fffff7fbb5e0:	36d8008d	tbz	w13, #27, 0xfffff7fbb5f0
   0x0000fffff7fbb5e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb5e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb5ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb5f0:	36d80091	tbz	w17, #27, 0xfffff7fbb600
   0x0000fffff7fbb5f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb5f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb5fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb600:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fbb604:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fbb608:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb60c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb610:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fbb614:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fbb618:	1400000e	b	0xfffff7fbb650
   0x0000fffff7fbb61c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb620:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb624:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb628:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb62c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fbb630:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb634:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb638:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fbb63c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb640:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb644:	d63f0200	blr	x16
   0x0000fffff7fbb648:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb64c:	540020c0	b.eq	0xfffff7fbba64  // b.none
   0x0000fffff7fbb650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb654:	37d806a9	tbnz	w9, #27, 0xfffff7fbb728
   0x0000fffff7fbb658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb65c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb668:	540001c1	b.ne	0xfffff7fbb6a0  // b.any
   0x0000fffff7fbb66c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb670:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb678:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb67c:	54000121	b.ne	0xfffff7fbb6a0  // b.any
   0x0000fffff7fbb680:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb684:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fbb688:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb68c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb694:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbb698:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb69c:	14000030	b	0xfffff7fbb75c
   0x0000fffff7fbb6a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb6a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb6a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb6ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb6b0:	54000120	b.eq	0xfffff7fbb6d4  // b.none
   0x0000fffff7fbb6b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb6b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb6bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb6c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb6c4:	54000321	b.ne	0xfffff7fbb728  // b.any
   0x0000fffff7fbb6c8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb6cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb6d0:	14000002	b	0xfffff7fbb6d8
   0x0000fffff7fbb6d4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbb6d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb6dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb6e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb6e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb6e8:	54000120	b.eq	0xfffff7fbb70c  // b.none
   0x0000fffff7fbb6ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb6f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb6f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb6f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb6fc:	54000161	b.ne	0xfffff7fbb728  // b.any
   0x0000fffff7fbb700:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fbb704:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb708:	14000002	b	0xfffff7fbb710
   0x0000fffff7fbb70c:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fbb710:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb714:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb718:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb71c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb720:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb724:	17ffffde	b	0xfffff7fbb69c
   0x0000fffff7fbb728:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb72c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb730:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb734:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb738:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fbb73c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb740:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb744:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fbb748:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb74c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb750:	d63f0200	blr	x16
   0x0000fffff7fbb754:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb758:	540018a0	b.eq	0xfffff7fbba6c  // b.none
   0x0000fffff7fbb75c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbb760:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbb764:	540004a0	b.eq	0xfffff7fbb7f8  // b.none
   0x0000fffff7fbb768:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbb76c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbb770:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbb774:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbb778:	54000400	b.eq	0xfffff7fbb7f8  // b.none
   0x0000fffff7fbb77c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbb780:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbb784:	36d801d1	tbz	w17, #27, 0xfffff7fbb7bc
   0x0000fffff7fbb788:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbb78c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbb790:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbb794:	54000321	b.ne	0xfffff7fbb7f8  // b.any
   0x0000fffff7fbb798:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbb79c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb7a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbb7a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbb7a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbb7ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbb7b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbb7b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbb7b8:	54000209	b.ls	0xfffff7fbb7f8  // b.plast
   0x0000fffff7fbb7bc:	36d8008d	tbz	w13, #27, 0xfffff7fbb7cc
   0x0000fffff7fbb7c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbb7c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbb7c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbb7cc:	36d80091	tbz	w17, #27, 0xfffff7fbb7dc
   0x0000fffff7fbb7d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbb7d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbb7d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbb7dc:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7fbb7e0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fbb7e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbb7e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbb7ec:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fbb7f0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fbb7f4:	1400000e	b	0xfffff7fbb82c
   0x0000fffff7fbb7f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbb7fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb800:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb804:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb808:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fbb80c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb810:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb814:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fbb818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb81c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb820:	d63f0200	blr	x16
   0x0000fffff7fbb824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb828:	54001260	b.eq	0xfffff7fbba74  // b.none
   0x0000fffff7fbb82c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb830:	37d806a9	tbnz	w9, #27, 0xfffff7fbb904
   0x0000fffff7fbb834:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb83c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb840:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb844:	540001c1	b.ne	0xfffff7fbb87c  // b.any
   0x0000fffff7fbb848:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb84c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb854:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb858:	54000121	b.ne	0xfffff7fbb87c  // b.any
   0x0000fffff7fbb85c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb860:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7fbb864:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbb868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb86c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb870:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fbb874:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb878:	14000030	b	0xfffff7fbb938
   0x0000fffff7fbb87c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb880:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb888:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb88c:	54000120	b.eq	0xfffff7fbb8b0  // b.none
   0x0000fffff7fbb890:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fbb894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb89c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb8a0:	54000321	b.ne	0xfffff7fbb904  // b.any
   0x0000fffff7fbb8a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fbb8a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fbb8ac:	14000002	b	0xfffff7fbb8b4
   0x0000fffff7fbb8b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fbb8b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb8b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb8bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb8c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb8c4:	54000120	b.eq	0xfffff7fbb8e8  // b.none
   0x0000fffff7fbb8c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb8cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb8d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb8d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb8d8:	54000161	b.ne	0xfffff7fbb904  // b.any
   0x0000fffff7fbb8dc:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fbb8e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fbb8e4:	14000002	b	0xfffff7fbb8ec
   0x0000fffff7fbb8e8:	fd402e61	ldr	d1, [x19, #88]
   0x0000fffff7fbb8ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbb8f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fbb8f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbb8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb8fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fbb900:	17ffffde	b	0xfffff7fbb878
   0x0000fffff7fbb904:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb908:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb90c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb910:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb914:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fbb918:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb91c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb920:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fbb924:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb928:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb92c:	d63f0200	blr	x16
   0x0000fffff7fbb930:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb934:	54000a40	b.eq	0xfffff7fbba7c  // b.none
   0x0000fffff7fbb938:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbb93c:	37d80269	tbnz	w9, #27, 0xfffff7fbb988
   0x0000fffff7fbb940:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbb944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb94c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbb950:	540001c1	b.ne	0xfffff7fbb988  // b.any
   0x0000fffff7fbb954:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbb958:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fbb95c:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fbb960:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fbb964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb96c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fbb970:	aa0b03e9	mov	x9, x11
   0x0000fffff7fbb974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbb978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbb97c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbb980:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbb984:	1400000e	b	0xfffff7fbb9bc
   0x0000fffff7fbb988:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb98c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb990:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb994:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb998:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fbb99c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb9a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb9a4:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fbb9a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbb9ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb9b0:	d63f0200	blr	x16
   0x0000fffff7fbb9b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbb9b8:	54000660	b.eq	0xfffff7fbba84  // b.none
   0x0000fffff7fbb9bc:	17fffdef	b	0xfffff7fbb178
   0x0000fffff7fbb9c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbb9c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbb9c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbb9cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbb9d0:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fbb9d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbb9d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbb9dc:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fbb9e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbb9e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbb9e8:	d63f0200	blr	x16
   0x0000fffff7fbb9ec:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbb9f0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbb9f4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbb9f8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbb9fc:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbba00:	d65f03c0	ret
   0x0000fffff7fbba04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbba08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbba0c:	b900028a	str	w10, [x20]
   0x0000fffff7fbba10:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbba14:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbba18:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbba1c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbba20:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbba24:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbba28:	d65f03c0	ret
   0x0000fffff7fbba2c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fbba30:	17fffff5	b	0xfffff7fbba04
   0x0000fffff7fbba34:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fbba38:	17fffff3	b	0xfffff7fbba04
   0x0000fffff7fbba3c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbba40:	17fffff1	b	0xfffff7fbba04
   0x0000fffff7fbba44:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fbba48:	17ffffef	b	0xfffff7fbba04
   0x0000fffff7fbba4c:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fbba50:	17ffffed	b	0xfffff7fbba04
   0x0000fffff7fbba54:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbba58:	17ffffeb	b	0xfffff7fbba04
   0x0000fffff7fbba5c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbba60:	17ffffe9	b	0xfffff7fbba04
   0x0000fffff7fbba64:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbba68:	17ffffe7	b	0xfffff7fbba04
   0x0000fffff7fbba6c:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbba70:	17ffffe5	b	0xfffff7fbba04
   0x0000fffff7fbba74:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbba78:	17ffffe3	b	0xfffff7fbba04
   0x0000fffff7fbba7c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbba80:	17ffffe1	b	0xfffff7fbba04
   0x0000fffff7fbba84:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbba88:	17ffffdf	b	0xfffff7fbba04
   0x0000fffff7fbba8c:	00000000	udf	#0
   0x0000fffff7fbba90:	00000000	udf	#0
   0x0000fffff7fbba94:	00000000	udf	#0
   0x0000fffff7fbba98:	00000000	udf	#0
   0x0000fffff7fbba9c:	00000000	udf	#0
   0x0000fffff7fbbaa0:	00000000	udf	#0
   0x0000fffff7fbbaa4:	00000000	udf	#0
   0x0000fffff7fbbaa8:	00000000	udf	#0
   0x0000fffff7fbbaac:	00000000	udf	#0
   0x0000fffff7fbbab0:	00000000	udf	#0
   0x0000fffff7fbbab4:	00000000	udf	#0
   0x0000fffff7fbbab8:	00000000	udf	#0
   0x0000fffff7fbbabc:	00000000	udf	#0
   0x0000fffff7fbbac0:	00000000	udf	#0
   0x0000fffff7fbbac4:	00000000	udf	#0
   0x0000fffff7fbbac8:	00000000	udf	#0
   0x0000fffff7fbbacc:	00000000	udf	#0
   0x0000fffff7fbbad0:	00000000	udf	#0
   0x0000fffff7fbbad4:	00000000	udf	#0
   0x0000fffff7fbbad8:	00000000	udf	#0
   0x0000fffff7fbbadc:	00000000	udf	#0
   0x0000fffff7fbbae0:	00000000	udf	#0
   0x0000fffff7fbbae4:	00000000	udf	#0
   0x0000fffff7fbbae8:	00000000	udf	#0
   0x0000fffff7fbbaec:	00000000	udf	#0
   0x0000fffff7fbbaf0:	00000000	udf	#0
   0x0000fffff7fbbaf4:	00000000	udf	#0
   0x0000fffff7fbbaf8:	00000000	udf	#0
   0x0000fffff7fbbafc:	00000000	udf	#0
   0x0000fffff7fbbb00:	00000000	udf	#0
   0x0000fffff7fbbb04:	00000000	udf	#0
   0x0000fffff7fbbb08:	00000000	udf	#0
   0x0000fffff7fbbb0c:	00000000	udf	#0
   0x0000fffff7fbbb10:	00000000	udf	#0
   0x0000fffff7fbbb14:	00000000	udf	#0
   0x0000fffff7fbbb18:	00000000	udf	#0
   0x0000fffff7fbbb1c:	00000000	udf	#0
   0x0000fffff7fbbb20:	00000000	udf	#0
   0x0000fffff7fbbb24:	00000000	udf	#0
   0x0000fffff7fbbb28:	00000000	udf	#0
   0x0000fffff7fbbb2c:	00000000	udf	#0
   0x0000fffff7fbbb30:	00000000	udf	#0
   0x0000fffff7fbbb34:	00000000	udf	#0
   0x0000fffff7fbbb38:	00000000	udf	#0
   0x0000fffff7fbbb3c:	00000000	udf	#0
   0x0000fffff7fbbb40:	00000000	udf	#0
   0x0000fffff7fbbb44:	00000000	udf	#0
   0x0000fffff7fbbb48:	00000000	udf	#0
   0x0000fffff7fbbb4c:	00000000	udf	#0
   0x0000fffff7fbbb50:	00000000	udf	#0
   0x0000fffff7fbbb54:	00000000	udf	#0
   0x0000fffff7fbbb58:	00000000	udf	#0
   0x0000fffff7fbbb5c:	00000000	udf	#0
   0x0000fffff7fbbb60:	00000000	udf	#0
   0x0000fffff7fbbb64:	00000000	udf	#0
   0x0000fffff7fbbb68:	00000000	udf	#0
   0x0000fffff7fbbb6c:	00000000	udf	#0
   0x0000fffff7fbbb70:	00000000	udf	#0
   0x0000fffff7fbbb74:	00000000	udf	#0
   0x0000fffff7fbbb78:	00000000	udf	#0
   0x0000fffff7fbbb7c:	00000000	udf	#0
   0x0000fffff7fbbb80:	00000000	udf	#0
   0x0000fffff7fbbb84:	00000000	udf	#0
   0x0000fffff7fbbb88:	00000000	udf	#0
   0x0000fffff7fbbb8c:	00000000	udf	#0
   0x0000fffff7fbbb90:	00000000	udf	#0
   0x0000fffff7fbbb94:	00000000	udf	#0
   0x0000fffff7fbbb98:	00000000	udf	#0
   0x0000fffff7fbbb9c:	00000000	udf	#0
   0x0000fffff7fbbba0:	00000000	udf	#0
   0x0000fffff7fbbba4:	00000000	udf	#0
   0x0000fffff7fbbba8:	00000000	udf	#0
   0x0000fffff7fbbbac:	00000000	udf	#0
   0x0000fffff7fbbbb0:	00000000	udf	#0
   0x0000fffff7fbbbb4:	00000000	udf	#0
   0x0000fffff7fbbbb8:	00000000	udf	#0
   0x0000fffff7fbbbbc:	00000000	udf	#0
   0x0000fffff7fbbbc0:	00000000	udf	#0
   0x0000fffff7fbbbc4:	00000000	udf	#0
   0x0000fffff7fbbbc8:	00000000	udf	#0
   0x0000fffff7fbbbcc:	00000000	udf	#0
   0x0000fffff7fbbbd0:	00000000	udf	#0
   0x0000fffff7fbbbd4:	00000000	udf	#0
   0x0000fffff7fbbbd8:	00000000	udf	#0
   0x0000fffff7fbbbdc:	00000000	udf	#0
   0x0000fffff7fbbbe0:	00000000	udf	#0
   0x0000fffff7fbbbe4:	00000000	udf	#0
   0x0000fffff7fbbbe8:	00000000	udf	#0
   0x0000fffff7fbbbec:	00000000	udf	#0
   0x0000fffff7fbbbf0:	00000000	udf	#0
   0x0000fffff7fbbbf4:	00000000	udf	#0
   0x0000fffff7fbbbf8:	00000000	udf	#0
   0x0000fffff7fbbbfc:	00000000	udf	#0
   0x0000fffff7fbbc00:	00000000	udf	#0
   0x0000fffff7fbbc04:	00000000	udf	#0
   0x0000fffff7fbbc08:	00000000	udf	#0
   0x0000fffff7fbbc0c:	00000000	udf	#0
   0x0000fffff7fbbc10:	00000000	udf	#0
   0x0000fffff7fbbc14:	00000000	udf	#0
   0x0000fffff7fbbc18:	00000000	udf	#0
   0x0000fffff7fbbc1c:	00000000	udf	#0
   0x0000fffff7fbbc20:	00000000	udf	#0
   0x0000fffff7fbbc24:	00000000	udf	#0
   0x0000fffff7fbbc28:	00000000	udf	#0
   0x0000fffff7fbbc2c:	00000000	udf	#0
   0x0000fffff7fbbc30:	00000000	udf	#0
   0x0000fffff7fbbc34:	00000000	udf	#0
   0x0000fffff7fbbc38:	00000000	udf	#0
   0x0000fffff7fbbc3c:	00000000	udf	#0
   0x0000fffff7fbbc40:	00000000	udf	#0
   0x0000fffff7fbbc44:	00000000	udf	#0
   0x0000fffff7fbbc48:	00000000	udf	#0
   0x0000fffff7fbbc4c:	00000000	udf	#0
   0x0000fffff7fbbc50:	00000000	udf	#0
   0x0000fffff7fbbc54:	00000000	udf	#0
   0x0000fffff7fbbc58:	00000000	udf	#0
   0x0000fffff7fbbc5c:	00000000	udf	#0
   0x0000fffff7fbbc60:	00000000	udf	#0
   0x0000fffff7fbbc64:	00000000	udf	#0
   0x0000fffff7fbbc68:	00000000	udf	#0
   0x0000fffff7fbbc6c:	00000000	udf	#0
   0x0000fffff7fbbc70:	00000000	udf	#0
   0x0000fffff7fbbc74:	00000000	udf	#0
   0x0000fffff7fbbc78:	00000000	udf	#0
   0x0000fffff7fbbc7c:	00000000	udf	#0
   0x0000fffff7fbbc80:	00000000	udf	#0
   0x0000fffff7fbbc84:	00000000	udf	#0
   0x0000fffff7fbbc88:	00000000	udf	#0
   0x0000fffff7fbbc8c:	00000000	udf	#0
   0x0000fffff7fbbc90:	00000000	udf	#0
   0x0000fffff7fbbc94:	00000000	udf	#0
   0x0000fffff7fbbc98:	00000000	udf	#0
   0x0000fffff7fbbc9c:	00000000	udf	#0
   0x0000fffff7fbbca0:	00000000	udf	#0
   0x0000fffff7fbbca4:	00000000	udf	#0
   0x0000fffff7fbbca8:	00000000	udf	#0
   0x0000fffff7fbbcac:	00000000	udf	#0
   0x0000fffff7fbbcb0:	00000000	udf	#0
   0x0000fffff7fbbcb4:	00000000	udf	#0
   0x0000fffff7fbbcb8:	00000000	udf	#0
   0x0000fffff7fbbcbc:	00000000	udf	#0
   0x0000fffff7fbbcc0:	00000000	udf	#0
   0x0000fffff7fbbcc4:	00000000	udf	#0
   0x0000fffff7fbbcc8:	00000000	udf	#0
   0x0000fffff7fbbccc:	00000000	udf	#0
   0x0000fffff7fbbcd0:	00000000	udf	#0
   0x0000fffff7fbbcd4:	00000000	udf	#0
   0x0000fffff7fbbcd8:	00000000	udf	#0
   0x0000fffff7fbbcdc:	00000000	udf	#0
   0x0000fffff7fbbce0:	00000000	udf	#0
   0x0000fffff7fbbce4:	00000000	udf	#0
   0x0000fffff7fbbce8:	00000000	udf	#0
   0x0000fffff7fbbcec:	00000000	udf	#0
   0x0000fffff7fbbcf0:	00000000	udf	#0
   0x0000fffff7fbbcf4:	00000000	udf	#0
   0x0000fffff7fbbcf8:	00000000	udf	#0
   0x0000fffff7fbbcfc:	00000000	udf	#0
   0x0000fffff7fbbd00:	00000000	udf	#0
   0x0000fffff7fbbd04:	00000000	udf	#0
   0x0000fffff7fbbd08:	00000000	udf	#0
   0x0000fffff7fbbd0c:	00000000	udf	#0
   0x0000fffff7fbbd10:	00000000	udf	#0
   0x0000fffff7fbbd14:	00000000	udf	#0
   0x0000fffff7fbbd18:	00000000	udf	#0
   0x0000fffff7fbbd1c:	00000000	udf	#0
   0x0000fffff7fbbd20:	00000000	udf	#0
   0x0000fffff7fbbd24:	00000000	udf	#0
   0x0000fffff7fbbd28:	00000000	udf	#0
   0x0000fffff7fbbd2c:	00000000	udf	#0
   0x0000fffff7fbbd30:	00000000	udf	#0
   0x0000fffff7fbbd34:	00000000	udf	#0
   0x0000fffff7fbbd38:	00000000	udf	#0
   0x0000fffff7fbbd3c:	00000000	udf	#0
   0x0000fffff7fbbd40:	00000000	udf	#0
   0x0000fffff7fbbd44:	00000000	udf	#0
   0x0000fffff7fbbd48:	00000000	udf	#0
   0x0000fffff7fbbd4c:	00000000	udf	#0
   0x0000fffff7fbbd50:	00000000	udf	#0
   0x0000fffff7fbbd54:	00000000	udf	#0
   0x0000fffff7fbbd58:	00000000	udf	#0
   0x0000fffff7fbbd5c:	00000000	udf	#0
   0x0000fffff7fbbd60:	00000000	udf	#0
   0x0000fffff7fbbd64:	00000000	udf	#0
   0x0000fffff7fbbd68:	00000000	udf	#0
   0x0000fffff7fbbd6c:	00000000	udf	#0
   0x0000fffff7fbbd70:	00000000	udf	#0
   0x0000fffff7fbbd74:	00000000	udf	#0
   0x0000fffff7fbbd78:	00000000	udf	#0
   0x0000fffff7fbbd7c:	00000000	udf	#0
   0x0000fffff7fbbd80:	00000000	udf	#0
   0x0000fffff7fbbd84:	00000000	udf	#0
   0x0000fffff7fbbd88:	00000000	udf	#0
   0x0000fffff7fbbd8c:	00000000	udf	#0
   0x0000fffff7fbbd90:	00000000	udf	#0
   0x0000fffff7fbbd94:	00000000	udf	#0
   0x0000fffff7fbbd98:	00000000	udf	#0
   0x0000fffff7fbbd9c:	00000000	udf	#0
   0x0000fffff7fbbda0:	00000000	udf	#0
   0x0000fffff7fbbda4:	00000000	udf	#0
   0x0000fffff7fbbda8:	00000000	udf	#0
   0x0000fffff7fbbdac:	00000000	udf	#0
   0x0000fffff7fbbdb0:	00000000	udf	#0
   0x0000fffff7fbbdb4:	00000000	udf	#0
   0x0000fffff7fbbdb8:	00000000	udf	#0
   0x0000fffff7fbbdbc:	00000000	udf	#0
   0x0000fffff7fbbdc0:	00000000	udf	#0
   0x0000fffff7fbbdc4:	00000000	udf	#0
   0x0000fffff7fbbdc8:	00000000	udf	#0
   0x0000fffff7fbbdcc:	00000000	udf	#0
   0x0000fffff7fbbdd0:	00000000	udf	#0
   0x0000fffff7fbbdd4:	00000000	udf	#0
   0x0000fffff7fbbdd8:	00000000	udf	#0
   0x0000fffff7fbbddc:	00000000	udf	#0
   0x0000fffff7fbbde0:	00000000	udf	#0
   0x0000fffff7fbbde4:	00000000	udf	#0
   0x0000fffff7fbbde8:	00000000	udf	#0
   0x0000fffff7fbbdec:	00000000	udf	#0
   0x0000fffff7fbbdf0:	00000000	udf	#0
   0x0000fffff7fbbdf4:	00000000	udf	#0
   0x0000fffff7fbbdf8:	00000000	udf	#0
   0x0000fffff7fbbdfc:	00000000	udf	#0
   0x0000fffff7fbbe00:	00000000	udf	#0
   0x0000fffff7fbbe04:	00000000	udf	#0
   0x0000fffff7fbbe08:	00000000	udf	#0
   0x0000fffff7fbbe0c:	00000000	udf	#0
   0x0000fffff7fbbe10:	00000000	udf	#0
   0x0000fffff7fbbe14:	00000000	udf	#0
   0x0000fffff7fbbe18:	00000000	udf	#0
   0x0000fffff7fbbe1c:	00000000	udf	#0
   0x0000fffff7fbbe20:	00000000	udf	#0
   0x0000fffff7fbbe24:	00000000	udf	#0
   0x0000fffff7fbbe28:	00000000	udf	#0
   0x0000fffff7fbbe2c:	00000000	udf	#0
   0x0000fffff7fbbe30:	00000000	udf	#0
   0x0000fffff7fbbe34:	00000000	udf	#0
   0x0000fffff7fbbe38:	00000000	udf	#0
   0x0000fffff7fbbe3c:	00000000	udf	#0
   0x0000fffff7fbbe40:	00000000	udf	#0
   0x0000fffff7fbbe44:	00000000	udf	#0
   0x0000fffff7fbbe48:	00000000	udf	#0
   0x0000fffff7fbbe4c:	00000000	udf	#0
   0x0000fffff7fbbe50:	00000000	udf	#0
   0x0000fffff7fbbe54:	00000000	udf	#0
   0x0000fffff7fbbe58:	00000000	udf	#0
   0x0000fffff7fbbe5c:	00000000	udf	#0
   0x0000fffff7fbbe60:	00000000	udf	#0
   0x0000fffff7fbbe64:	00000000	udf	#0
   0x0000fffff7fbbe68:	00000000	udf	#0
   0x0000fffff7fbbe6c:	00000000	udf	#0
   0x0000fffff7fbbe70:	00000000	udf	#0
   0x0000fffff7fbbe74:	00000000	udf	#0
   0x0000fffff7fbbe78:	00000000	udf	#0
   0x0000fffff7fbbe7c:	00000000	udf	#0
   0x0000fffff7fbbe80:	00000000	udf	#0
   0x0000fffff7fbbe84:	00000000	udf	#0
   0x0000fffff7fbbe88:	00000000	udf	#0
   0x0000fffff7fbbe8c:	00000000	udf	#0
   0x0000fffff7fbbe90:	00000000	udf	#0
   0x0000fffff7fbbe94:	00000000	udf	#0
   0x0000fffff7fbbe98:	00000000	udf	#0
   0x0000fffff7fbbe9c:	00000000	udf	#0
   0x0000fffff7fbbea0:	00000000	udf	#0
   0x0000fffff7fbbea4:	00000000	udf	#0
   0x0000fffff7fbbea8:	00000000	udf	#0
   0x0000fffff7fbbeac:	00000000	udf	#0
   0x0000fffff7fbbeb0:	00000000	udf	#0
   0x0000fffff7fbbeb4:	00000000	udf	#0
   0x0000fffff7fbbeb8:	00000000	udf	#0
   0x0000fffff7fbbebc:	00000000	udf	#0
   0x0000fffff7fbbec0:	00000000	udf	#0
   0x0000fffff7fbbec4:	00000000	udf	#0
   0x0000fffff7fbbec8:	00000000	udf	#0
   0x0000fffff7fbbecc:	00000000	udf	#0
   0x0000fffff7fbbed0:	00000000	udf	#0
   0x0000fffff7fbbed4:	00000000	udf	#0
   0x0000fffff7fbbed8:	00000000	udf	#0
   0x0000fffff7fbbedc:	00000000	udf	#0
   0x0000fffff7fbbee0:	00000000	udf	#0
   0x0000fffff7fbbee4:	00000000	udf	#0
   0x0000fffff7fbbee8:	00000000	udf	#0
   0x0000fffff7fbbeec:	00000000	udf	#0
   0x0000fffff7fbbef0:	00000000	udf	#0
   0x0000fffff7fbbef4:	00000000	udf	#0
   0x0000fffff7fbbef8:	00000000	udf	#0
   0x0000fffff7fbbefc:	00000000	udf	#0
   0x0000fffff7fbbf00:	00000000	udf	#0
   0x0000fffff7fbbf04:	00000000	udf	#0
   0x0000fffff7fbbf08:	00000000	udf	#0
   0x0000fffff7fbbf0c:	00000000	udf	#0
   0x0000fffff7fbbf10:	00000000	udf	#0
   0x0000fffff7fbbf14:	00000000	udf	#0
   0x0000fffff7fbbf18:	00000000	udf	#0
   0x0000fffff7fbbf1c:	00000000	udf	#0
   0x0000fffff7fbbf20:	00000000	udf	#0
   0x0000fffff7fbbf24:	00000000	udf	#0
   0x0000fffff7fbbf28:	00000000	udf	#0
   0x0000fffff7fbbf2c:	00000000	udf	#0
   0x0000fffff7fbbf30:	00000000	udf	#0
   0x0000fffff7fbbf34:	00000000	udf	#0
   0x0000fffff7fbbf38:	00000000	udf	#0
   0x0000fffff7fbbf3c:	00000000	udf	#0
   0x0000fffff7fbbf40:	00000000	udf	#0
   0x0000fffff7fbbf44:	00000000	udf	#0
   0x0000fffff7fbbf48:	00000000	udf	#0
   0x0000fffff7fbbf4c:	00000000	udf	#0
   0x0000fffff7fbbf50:	00000000	udf	#0
   0x0000fffff7fbbf54:	00000000	udf	#0
   0x0000fffff7fbbf58:	00000000	udf	#0
   0x0000fffff7fbbf5c:	00000000	udf	#0
   0x0000fffff7fbbf60:	00000000	udf	#0
   0x0000fffff7fbbf64:	00000000	udf	#0
   0x0000fffff7fbbf68:	00000000	udf	#0
   0x0000fffff7fbbf6c:	00000000	udf	#0
   0x0000fffff7fbbf70:	00000000	udf	#0
   0x0000fffff7fbbf74:	00000000	udf	#0
   0x0000fffff7fbbf78:	00000000	udf	#0
   0x0000fffff7fbbf7c:	00000000	udf	#0
   0x0000fffff7fbbf80:	00000000	udf	#0
   0x0000fffff7fbbf84:	00000000	udf	#0
   0x0000fffff7fbbf88:	00000000	udf	#0
   0x0000fffff7fbbf8c:	00000000	udf	#0
   0x0000fffff7fbbf90:	00000000	udf	#0
   0x0000fffff7fbbf94:	00000000	udf	#0
   0x0000fffff7fbbf98:	00000000	udf	#0
   0x0000fffff7fbbf9c:	00000000	udf	#0
   0x0000fffff7fbbfa0:	00000000	udf	#0
   0x0000fffff7fbbfa4:	00000000	udf	#0
   0x0000fffff7fbbfa8:	00000000	udf	#0
   0x0000fffff7fbbfac:	00000000	udf	#0
   0x0000fffff7fbbfb0:	00000000	udf	#0
   0x0000fffff7fbbfb4:	00000000	udf	#0
   0x0000fffff7fbbfb8:	00000000	udf	#0
   0x0000fffff7fbbfbc:	00000000	udf	#0
   0x0000fffff7fbbfc0:	00000000	udf	#0
   0x0000fffff7fbbfc4:	00000000	udf	#0
   0x0000fffff7fbbfc8:	00000000	udf	#0
   0x0000fffff7fbbfcc:	00000000	udf	#0
   0x0000fffff7fbbfd0:	00000000	udf	#0
   0x0000fffff7fbbfd4:	00000000	udf	#0
   0x0000fffff7fbbfd8:	00000000	udf	#0
   0x0000fffff7fbbfdc:	00000000	udf	#0
   0x0000fffff7fbbfe0:	00000000	udf	#0
   0x0000fffff7fbbfe4:	00000000	udf	#0
   0x0000fffff7fbbfe8:	00000000	udf	#0
   0x0000fffff7fbbfec:	00000000	udf	#0
   0x0000fffff7fbbff0:	00000000	udf	#0
   0x0000fffff7fbbff4:	00000000	udf	#0
   0x0000fffff7fbbff8:	00000000	udf	#0
   0x0000fffff7fbbffc:	00000000	udf	#0
End of assembler dump.
