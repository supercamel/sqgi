Dump of assembler code from 0xfffff7f98000 to 0xfffff7f9a000:
   0x0000fffff7f98000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f98004:	910003fd	mov	x29, sp
   0x0000fffff7f98008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9800c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f98010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f98014:	aa0003f3	mov	x19, x0
   0x0000fffff7f98018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9801c:	aa0203f5	mov	x21, x2
   0x0000fffff7f98020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f98024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f98028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9802c:	f90003e9	str	x9, [sp]
   0x0000fffff7f98030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f98034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f98038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9803c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f98040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98044:	d63f0200	blr	x16
   0x0000fffff7f98048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9804c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f98050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f98054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f98058:	14000001	b	0xfffff7f9805c
   0x0000fffff7f9805c:	14000001	b	0xfffff7f98060
   0x0000fffff7f98060:	14000001	b	0xfffff7f98064
   0x0000fffff7f98064:	14000001	b	0xfffff7f98068
   0x0000fffff7f98068:	14000001	b	0xfffff7f9806c
   0x0000fffff7f9806c:	14000001	b	0xfffff7f98070
   0x0000fffff7f98070:	14000001	b	0xfffff7f98074
   0x0000fffff7f98074:	14000001	b	0xfffff7f98078
   0x0000fffff7f98078:	14000001	b	0xfffff7f9807c
   0x0000fffff7f9807c:	14000001	b	0xfffff7f98080
   0x0000fffff7f98080:	14000001	b	0xfffff7f98084
   0x0000fffff7f98084:	14000001	b	0xfffff7f98088
   0x0000fffff7f98088:	14000001	b	0xfffff7f9808c
   0x0000fffff7f9808c:	14000001	b	0xfffff7f98090
   0x0000fffff7f98090:	14000001	b	0xfffff7f98094
   0x0000fffff7f98094:	14000001	b	0xfffff7f98098
   0x0000fffff7f98098:	14000001	b	0xfffff7f9809c
   0x0000fffff7f9809c:	14000001	b	0xfffff7f980a0
   0x0000fffff7f980a0:	14000001	b	0xfffff7f980a4
   0x0000fffff7f980a4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f980a8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f980ac:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f980b0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f980b4:	36d80211	tbz	w17, #27, 0xfffff7f980f4
   0x0000fffff7f980b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f980bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f980c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f980c4:	540001e1	b.ne	0xfffff7f98100  // b.any
   0x0000fffff7f980c8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f980cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f980d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f980d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f980d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f980dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f980e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f980e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f980e8:	540000c9	b.ls	0xfffff7f98100  // b.plast
   0x0000fffff7f980ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f980f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f980f4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f980f8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f980fc:	1400000e	b	0xfffff7f98134
   0x0000fffff7f98100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98108:	aa1303e1	mov	x1, x19
   0x0000fffff7f9810c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98110:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f98114:	aa1403e4	mov	x4, x20
   0x0000fffff7f98118:	aa1603e5	mov	x5, x22
   0x0000fffff7f9811c:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f98120:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98128:	d63f0200	blr	x16
   0x0000fffff7f9812c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98130:	5400ede0	b.eq	0xfffff7f99eec  // b.none
   0x0000fffff7f98134:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f98138:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f9813c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f98140:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f98144:	36d80211	tbz	w17, #27, 0xfffff7f98184
   0x0000fffff7f98148:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9814c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f98150:	f100013f	cmp	x9, #0x0
   0x0000fffff7f98154:	540001e1	b.ne	0xfffff7f98190  // b.any
   0x0000fffff7f98158:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f9815c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98160:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f98164:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f98168:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9816c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f98170:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f98174:	f100055f	cmp	x10, #0x1
   0x0000fffff7f98178:	540000c9	b.ls	0xfffff7f98190  // b.plast
   0x0000fffff7f9817c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f98180:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f98184:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f98188:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f9818c:	1400000e	b	0xfffff7f981c4
   0x0000fffff7f98190:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98194:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98198:	aa1303e1	mov	x1, x19
   0x0000fffff7f9819c:	aa1503e2	mov	x2, x21
   0x0000fffff7f981a0:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f981a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f981a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f981ac:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f981b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f981b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f981b8:	d63f0200	blr	x16
   0x0000fffff7f981bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f981c0:	5400e9a0	b.eq	0xfffff7f99ef4  // b.none
   0x0000fffff7f981c4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f981c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f981cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f981d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f981d4:	54000421	b.ne	0xfffff7f98258  // b.any
   0x0000fffff7f981d8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f981dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f981e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f981e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f981e8:	54000381	b.ne	0xfffff7f98258  // b.any
   0x0000fffff7f981ec:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f981f0:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f981f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f981f8:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7f981fc:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7f98200:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7f98204:	91000580	add	x0, x12, #0x1
   0x0000fffff7f98208:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9820c:	36d80211	tbz	w17, #27, 0xfffff7f9824c
   0x0000fffff7f98210:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f98214:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f98218:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9821c:	540001e1	b.ne	0xfffff7f98258  // b.any
   0x0000fffff7f98220:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f98224:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98228:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9822c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f98230:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f98234:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f98238:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9823c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f98240:	540000c9	b.ls	0xfffff7f98258  // b.plast
   0x0000fffff7f98244:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f98248:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9824c:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7f98250:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7f98254:	1400000e	b	0xfffff7f9828c
   0x0000fffff7f98258:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9825c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98260:	aa1303e1	mov	x1, x19
   0x0000fffff7f98264:	aa1503e2	mov	x2, x21
   0x0000fffff7f98268:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f9826c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98270:	aa1603e5	mov	x5, x22
   0x0000fffff7f98274:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7f98278:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9827c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98280:	d63f0200	blr	x16
   0x0000fffff7f98284:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98288:	5400e3a0	b.eq	0xfffff7f99efc  // b.none
   0x0000fffff7f9828c:	f100041f	cmp	x0, #0x1
   0x0000fffff7f98290:	5400df80	b.eq	0xfffff7f99e80  // b.none
   0x0000fffff7f98294:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f98298:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9829c:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f982a0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f982a4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f982a8:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f982ac:	36d801d1	tbz	w17, #27, 0xfffff7f982e4
   0x0000fffff7f982b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f982b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f982b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f982bc:	54000281	b.ne	0xfffff7f9830c  // b.any
   0x0000fffff7f982c0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f982c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f982c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f982cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f982d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f982d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f982d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f982dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f982e0:	54000169	b.ls	0xfffff7f9830c  // b.plast
   0x0000fffff7f982e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f982e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f982ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f982f0:	36d80091	tbz	w17, #27, 0xfffff7f98300
   0x0000fffff7f982f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f982f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f982fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f98300:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f98304:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f98308:	1400000e	b	0xfffff7f98340
   0x0000fffff7f9830c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98310:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98314:	aa1303e1	mov	x1, x19
   0x0000fffff7f98318:	aa1503e2	mov	x2, x21
   0x0000fffff7f9831c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f98320:	aa1403e4	mov	x4, x20
   0x0000fffff7f98324:	aa1603e5	mov	x5, x22
   0x0000fffff7f98328:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f9832c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98330:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98334:	d63f0200	blr	x16
   0x0000fffff7f98338:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9833c:	5400de40	b.eq	0xfffff7f99f04  // b.none
   0x0000fffff7f98340:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f98344:	f100017f	cmp	x11, #0x0
   0x0000fffff7f98348:	540003a0	b.eq	0xfffff7f983bc  // b.none
   0x0000fffff7f9834c:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f98350:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f98354:	b9400171	ldr	w17, [x11]
   0x0000fffff7f98358:	36d801d1	tbz	w17, #27, 0xfffff7f98390
   0x0000fffff7f9835c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f98360:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f98364:	f100013f	cmp	x9, #0x0
   0x0000fffff7f98368:	540002a1	b.ne	0xfffff7f983bc  // b.any
   0x0000fffff7f9836c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f98370:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98374:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f98378:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9837c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f98380:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f98384:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f98388:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9838c:	54000189	b.ls	0xfffff7f983bc  // b.plast
   0x0000fffff7f98390:	36d8008d	tbz	w13, #27, 0xfffff7f983a0
   0x0000fffff7f98394:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f98398:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9839c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f983a0:	36d80091	tbz	w17, #27, 0xfffff7f983b0
   0x0000fffff7f983a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f983a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f983ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f983b0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f983b4:	b900016d	str	w13, [x11]
   0x0000fffff7f983b8:	1400000e	b	0xfffff7f983f0
   0x0000fffff7f983bc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f983c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f983c4:	aa1303e1	mov	x1, x19
   0x0000fffff7f983c8:	aa1503e2	mov	x2, x21
   0x0000fffff7f983cc:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f983d0:	aa1403e4	mov	x4, x20
   0x0000fffff7f983d4:	aa1603e5	mov	x5, x22
   0x0000fffff7f983d8:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7f983dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f983e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f983e4:	d63f0200	blr	x16
   0x0000fffff7f983e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f983ec:	5400d900	b.eq	0xfffff7f99f0c  // b.none
   0x0000fffff7f983f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f983f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f983f8:	540004a0	b.eq	0xfffff7f9848c  // b.none
   0x0000fffff7f983fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f98400:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f98404:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f98408:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9840c:	54000400	b.eq	0xfffff7f9848c  // b.none
   0x0000fffff7f98410:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f98414:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f98418:	36d801d1	tbz	w17, #27, 0xfffff7f98450
   0x0000fffff7f9841c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f98420:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f98424:	f100013f	cmp	x9, #0x0
   0x0000fffff7f98428:	54000321	b.ne	0xfffff7f9848c  // b.any
   0x0000fffff7f9842c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f98430:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98434:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f98438:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9843c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f98440:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f98444:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f98448:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9844c:	54000209	b.ls	0xfffff7f9848c  // b.plast
   0x0000fffff7f98450:	36d8008d	tbz	w13, #27, 0xfffff7f98460
   0x0000fffff7f98454:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f98458:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9845c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f98460:	36d80091	tbz	w17, #27, 0xfffff7f98470
   0x0000fffff7f98464:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98468:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9846c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f98470:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f98474:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f98478:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9847c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f98480:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f98484:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f98488:	1400000e	b	0xfffff7f984c0
   0x0000fffff7f9848c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98490:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98494:	aa1303e1	mov	x1, x19
   0x0000fffff7f98498:	aa1503e2	mov	x2, x21
   0x0000fffff7f9849c:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f984a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f984a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f984a8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f984ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f984b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f984b4:	d63f0200	blr	x16
   0x0000fffff7f984b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f984bc:	5400d2c0	b.eq	0xfffff7f99f14  // b.none
   0x0000fffff7f984c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f984c4:	37d806a9	tbnz	w9, #27, 0xfffff7f98598
   0x0000fffff7f984c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f984cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f984d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f984d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f984d8:	540001c1	b.ne	0xfffff7f98510  // b.any
   0x0000fffff7f984dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f984e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f984e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f984e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f984ec:	54000121	b.ne	0xfffff7f98510  // b.any
   0x0000fffff7f984f0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f984f4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f984f8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f984fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98500:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98504:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f98508:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9850c:	14000030	b	0xfffff7f985cc
   0x0000fffff7f98510:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98514:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9851c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98520:	54000120	b.eq	0xfffff7f98544  // b.none
   0x0000fffff7f98524:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98528:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9852c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98530:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98534:	54000321	b.ne	0xfffff7f98598  // b.any
   0x0000fffff7f98538:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9853c:	9e620120	scvtf	d0, x9
   0x0000fffff7f98540:	14000002	b	0xfffff7f98548
   0x0000fffff7f98544:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f98548:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9854c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98550:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98554:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98558:	54000120	b.eq	0xfffff7f9857c  // b.none
   0x0000fffff7f9855c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98560:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98568:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9856c:	54000161	b.ne	0xfffff7f98598  // b.any
   0x0000fffff7f98570:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f98574:	9e620121	scvtf	d1, x9
   0x0000fffff7f98578:	14000002	b	0xfffff7f98580
   0x0000fffff7f9857c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f98580:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f98584:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f98588:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9858c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98590:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f98594:	17ffffde	b	0xfffff7f9850c
   0x0000fffff7f98598:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9859c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f985a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f985a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f985a8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f985ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f985b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f985b4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f985b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f985bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f985c0:	d63f0200	blr	x16
   0x0000fffff7f985c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f985c8:	5400caa0	b.eq	0xfffff7f99f1c  // b.none
   0x0000fffff7f985cc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f985d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f985d4:	540004a0	b.eq	0xfffff7f98668  // b.none
   0x0000fffff7f985d8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f985dc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f985e0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f985e4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f985e8:	54000400	b.eq	0xfffff7f98668  // b.none
   0x0000fffff7f985ec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f985f0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f985f4:	36d801d1	tbz	w17, #27, 0xfffff7f9862c
   0x0000fffff7f985f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f985fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f98600:	f100013f	cmp	x9, #0x0
   0x0000fffff7f98604:	54000321	b.ne	0xfffff7f98668  // b.any
   0x0000fffff7f98608:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9860c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98610:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f98614:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f98618:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9861c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f98620:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f98624:	f100055f	cmp	x10, #0x1
   0x0000fffff7f98628:	54000209	b.ls	0xfffff7f98668  // b.plast
   0x0000fffff7f9862c:	36d8008d	tbz	w13, #27, 0xfffff7f9863c
   0x0000fffff7f98630:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f98634:	91000529	add	x9, x9, #0x1
   0x0000fffff7f98638:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9863c:	36d80091	tbz	w17, #27, 0xfffff7f9864c
   0x0000fffff7f98640:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98644:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f98648:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9864c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f98650:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f98654:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f98658:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9865c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f98660:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f98664:	1400000e	b	0xfffff7f9869c
   0x0000fffff7f98668:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9866c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98670:	aa1303e1	mov	x1, x19
   0x0000fffff7f98674:	aa1503e2	mov	x2, x21
   0x0000fffff7f98678:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f9867c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98680:	aa1603e5	mov	x5, x22
   0x0000fffff7f98684:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f98688:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9868c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98690:	d63f0200	blr	x16
   0x0000fffff7f98694:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98698:	5400c460	b.eq	0xfffff7f99f24  // b.none
   0x0000fffff7f9869c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f986a0:	37d806a9	tbnz	w9, #27, 0xfffff7f98774
   0x0000fffff7f986a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f986a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f986ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f986b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f986b4:	540001c1	b.ne	0xfffff7f986ec  // b.any
   0x0000fffff7f986b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f986bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f986c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f986c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f986c8:	54000121	b.ne	0xfffff7f986ec  // b.any
   0x0000fffff7f986cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f986d0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f986d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f986d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f986dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f986e0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f986e4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f986e8:	14000030	b	0xfffff7f987a8
   0x0000fffff7f986ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f986f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f986f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f986f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f986fc:	54000120	b.eq	0xfffff7f98720  // b.none
   0x0000fffff7f98700:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98704:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98708:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9870c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98710:	54000321	b.ne	0xfffff7f98774  // b.any
   0x0000fffff7f98714:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f98718:	9e620120	scvtf	d0, x9
   0x0000fffff7f9871c:	14000002	b	0xfffff7f98724
   0x0000fffff7f98720:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f98724:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98728:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9872c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98730:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98734:	54000120	b.eq	0xfffff7f98758  // b.none
   0x0000fffff7f98738:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9873c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98740:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98744:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98748:	54000161	b.ne	0xfffff7f98774  // b.any
   0x0000fffff7f9874c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f98750:	9e620121	scvtf	d1, x9
   0x0000fffff7f98754:	14000002	b	0xfffff7f9875c
   0x0000fffff7f98758:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9875c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f98760:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f98764:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98768:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9876c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f98770:	17ffffde	b	0xfffff7f986e8
   0x0000fffff7f98774:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98778:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9877c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98780:	aa1503e2	mov	x2, x21
   0x0000fffff7f98784:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f98788:	aa1403e4	mov	x4, x20
   0x0000fffff7f9878c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98790:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f98794:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98798:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9879c:	d63f0200	blr	x16
   0x0000fffff7f987a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f987a4:	5400bc40	b.eq	0xfffff7f99f2c  // b.none
   0x0000fffff7f987a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f987ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7f987b0:	540004a0	b.eq	0xfffff7f98844  // b.none
   0x0000fffff7f987b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f987b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f987bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f987c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f987c4:	54000400	b.eq	0xfffff7f98844  // b.none
   0x0000fffff7f987c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f987cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f987d0:	36d801d1	tbz	w17, #27, 0xfffff7f98808
   0x0000fffff7f987d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f987d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f987dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f987e0:	54000321	b.ne	0xfffff7f98844  // b.any
   0x0000fffff7f987e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f987e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f987ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f987f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f987f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f987f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f987fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f98800:	f100055f	cmp	x10, #0x1
   0x0000fffff7f98804:	54000209	b.ls	0xfffff7f98844  // b.plast
   0x0000fffff7f98808:	36d8008d	tbz	w13, #27, 0xfffff7f98818
   0x0000fffff7f9880c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f98810:	91000529	add	x9, x9, #0x1
   0x0000fffff7f98814:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f98818:	36d80091	tbz	w17, #27, 0xfffff7f98828
   0x0000fffff7f9881c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98820:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f98824:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f98828:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9882c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f98830:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f98834:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f98838:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9883c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f98840:	1400000e	b	0xfffff7f98878
   0x0000fffff7f98844:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98848:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9884c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98850:	aa1503e2	mov	x2, x21
   0x0000fffff7f98854:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f98858:	aa1403e4	mov	x4, x20
   0x0000fffff7f9885c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98860:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f98864:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98868:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9886c:	d63f0200	blr	x16
   0x0000fffff7f98870:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98874:	5400b600	b.eq	0xfffff7f99f34  // b.none
   0x0000fffff7f98878:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9887c:	37d806a9	tbnz	w9, #27, 0xfffff7f98950
   0x0000fffff7f98880:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98884:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98888:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9888c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98890:	540001c1	b.ne	0xfffff7f988c8  // b.any
   0x0000fffff7f98894:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9889c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f988a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f988a4:	54000121	b.ne	0xfffff7f988c8  // b.any
   0x0000fffff7f988a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f988ac:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f988b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f988b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f988b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f988bc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f988c0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f988c4:	14000030	b	0xfffff7f98984
   0x0000fffff7f988c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f988cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f988d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f988d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f988d8:	54000120	b.eq	0xfffff7f988fc  // b.none
   0x0000fffff7f988dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f988e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f988e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f988e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f988ec:	54000321	b.ne	0xfffff7f98950  // b.any
   0x0000fffff7f988f0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f988f4:	9e620120	scvtf	d0, x9
   0x0000fffff7f988f8:	14000002	b	0xfffff7f98900
   0x0000fffff7f988fc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f98900:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98904:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98908:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9890c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98910:	54000120	b.eq	0xfffff7f98934  // b.none
   0x0000fffff7f98914:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98918:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9891c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98920:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98924:	54000161	b.ne	0xfffff7f98950  // b.any
   0x0000fffff7f98928:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9892c:	9e620121	scvtf	d1, x9
   0x0000fffff7f98930:	14000002	b	0xfffff7f98938
   0x0000fffff7f98934:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f98938:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9893c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f98940:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98948:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9894c:	17ffffde	b	0xfffff7f988c4
   0x0000fffff7f98950:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98954:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98958:	aa1303e1	mov	x1, x19
   0x0000fffff7f9895c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98960:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f98964:	aa1403e4	mov	x4, x20
   0x0000fffff7f98968:	aa1603e5	mov	x5, x22
   0x0000fffff7f9896c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f98970:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98974:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98978:	d63f0200	blr	x16
   0x0000fffff7f9897c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98980:	5400ade0	b.eq	0xfffff7f99f3c  // b.none
   0x0000fffff7f98984:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f98988:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9898c:	540004a0	b.eq	0xfffff7f98a20  // b.none
   0x0000fffff7f98990:	b940016d	ldr	w13, [x11]
   0x0000fffff7f98994:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f98998:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9899c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f989a0:	54000400	b.eq	0xfffff7f98a20  // b.none
   0x0000fffff7f989a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f989a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f989ac:	36d801d1	tbz	w17, #27, 0xfffff7f989e4
   0x0000fffff7f989b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f989b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f989b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f989bc:	54000321	b.ne	0xfffff7f98a20  // b.any
   0x0000fffff7f989c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f989c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f989c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f989cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f989d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f989d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f989d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f989dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f989e0:	54000209	b.ls	0xfffff7f98a20  // b.plast
   0x0000fffff7f989e4:	36d8008d	tbz	w13, #27, 0xfffff7f989f4
   0x0000fffff7f989e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f989ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7f989f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f989f4:	36d80091	tbz	w17, #27, 0xfffff7f98a04
   0x0000fffff7f989f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f989fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f98a00:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f98a04:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f98a08:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f98a0c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f98a10:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f98a14:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f98a18:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f98a1c:	1400000e	b	0xfffff7f98a54
   0x0000fffff7f98a20:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98a24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98a28:	aa1303e1	mov	x1, x19
   0x0000fffff7f98a2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98a30:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f98a34:	aa1403e4	mov	x4, x20
   0x0000fffff7f98a38:	aa1603e5	mov	x5, x22
   0x0000fffff7f98a3c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f98a40:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98a44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98a48:	d63f0200	blr	x16
   0x0000fffff7f98a4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98a50:	5400a7a0	b.eq	0xfffff7f99f44  // b.none
   0x0000fffff7f98a54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98a58:	37d806a9	tbnz	w9, #27, 0xfffff7f98b2c
   0x0000fffff7f98a5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98a60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98a64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98a68:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98a6c:	540001c1	b.ne	0xfffff7f98aa4  // b.any
   0x0000fffff7f98a70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98a74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98a78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98a7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98a80:	54000121	b.ne	0xfffff7f98aa4  // b.any
   0x0000fffff7f98a84:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f98a88:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f98a8c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98a90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98a94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98a98:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f98a9c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f98aa0:	14000030	b	0xfffff7f98b60
   0x0000fffff7f98aa4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98aa8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98ab4:	54000120	b.eq	0xfffff7f98ad8  // b.none
   0x0000fffff7f98ab8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98ac8:	54000321	b.ne	0xfffff7f98b2c  // b.any
   0x0000fffff7f98acc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f98ad0:	9e620120	scvtf	d0, x9
   0x0000fffff7f98ad4:	14000002	b	0xfffff7f98adc
   0x0000fffff7f98ad8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f98adc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98ae0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98ae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ae8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98aec:	54000120	b.eq	0xfffff7f98b10  // b.none
   0x0000fffff7f98af0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98af4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98af8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98afc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98b00:	54000161	b.ne	0xfffff7f98b2c  // b.any
   0x0000fffff7f98b04:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f98b08:	9e620121	scvtf	d1, x9
   0x0000fffff7f98b0c:	14000002	b	0xfffff7f98b14
   0x0000fffff7f98b10:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f98b14:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f98b18:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f98b1c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98b20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98b24:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f98b28:	17ffffde	b	0xfffff7f98aa0
   0x0000fffff7f98b2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98b30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98b34:	aa1303e1	mov	x1, x19
   0x0000fffff7f98b38:	aa1503e2	mov	x2, x21
   0x0000fffff7f98b3c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f98b40:	aa1403e4	mov	x4, x20
   0x0000fffff7f98b44:	aa1603e5	mov	x5, x22
   0x0000fffff7f98b48:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f98b4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98b50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98b54:	d63f0200	blr	x16
   0x0000fffff7f98b58:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98b5c:	54009f80	b.eq	0xfffff7f99f4c  // b.none
   0x0000fffff7f98b60:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f98b64:	f100017f	cmp	x11, #0x0
   0x0000fffff7f98b68:	540004a0	b.eq	0xfffff7f98bfc  // b.none
   0x0000fffff7f98b6c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f98b70:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f98b74:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f98b78:	eb0901bf	cmp	x13, x9
   0x0000fffff7f98b7c:	54000400	b.eq	0xfffff7f98bfc  // b.none
   0x0000fffff7f98b80:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f98b84:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f98b88:	36d801d1	tbz	w17, #27, 0xfffff7f98bc0
   0x0000fffff7f98b8c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f98b90:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f98b94:	f100013f	cmp	x9, #0x0
   0x0000fffff7f98b98:	54000321	b.ne	0xfffff7f98bfc  // b.any
   0x0000fffff7f98b9c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f98ba0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98ba4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f98ba8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f98bac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f98bb0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f98bb4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f98bb8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f98bbc:	54000209	b.ls	0xfffff7f98bfc  // b.plast
   0x0000fffff7f98bc0:	36d8008d	tbz	w13, #27, 0xfffff7f98bd0
   0x0000fffff7f98bc4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f98bc8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f98bcc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f98bd0:	36d80091	tbz	w17, #27, 0xfffff7f98be0
   0x0000fffff7f98bd4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98bd8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f98bdc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f98be0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f98be4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f98be8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f98bec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f98bf0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f98bf4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f98bf8:	1400000e	b	0xfffff7f98c30
   0x0000fffff7f98bfc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98c00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98c04:	aa1303e1	mov	x1, x19
   0x0000fffff7f98c08:	aa1503e2	mov	x2, x21
   0x0000fffff7f98c0c:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f98c10:	aa1403e4	mov	x4, x20
   0x0000fffff7f98c14:	aa1603e5	mov	x5, x22
   0x0000fffff7f98c18:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f98c1c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98c20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98c24:	d63f0200	blr	x16
   0x0000fffff7f98c28:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98c2c:	54009940	b.eq	0xfffff7f99f54  // b.none
   0x0000fffff7f98c30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98c34:	37d806a9	tbnz	w9, #27, 0xfffff7f98d08
   0x0000fffff7f98c38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98c3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98c40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98c48:	540001c1	b.ne	0xfffff7f98c80  // b.any
   0x0000fffff7f98c4c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98c50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98c54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c58:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98c5c:	54000121	b.ne	0xfffff7f98c80  // b.any
   0x0000fffff7f98c60:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f98c64:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f98c68:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98c6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98c70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c74:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f98c78:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f98c7c:	14000030	b	0xfffff7f98d3c
   0x0000fffff7f98c80:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98c84:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98c90:	54000120	b.eq	0xfffff7f98cb4  // b.none
   0x0000fffff7f98c94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98c98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98c9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ca0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98ca4:	54000321	b.ne	0xfffff7f98d08  // b.any
   0x0000fffff7f98ca8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f98cac:	9e620120	scvtf	d0, x9
   0x0000fffff7f98cb0:	14000002	b	0xfffff7f98cb8
   0x0000fffff7f98cb4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f98cb8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98cbc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98cc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98cc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98cc8:	54000120	b.eq	0xfffff7f98cec  // b.none
   0x0000fffff7f98ccc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98cd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98cd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98cd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98cdc:	54000161	b.ne	0xfffff7f98d08  // b.any
   0x0000fffff7f98ce0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f98ce4:	9e620121	scvtf	d1, x9
   0x0000fffff7f98ce8:	14000002	b	0xfffff7f98cf0
   0x0000fffff7f98cec:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f98cf0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f98cf4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f98cf8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98cfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98d00:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f98d04:	17ffffde	b	0xfffff7f98c7c
   0x0000fffff7f98d08:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98d0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98d10:	aa1303e1	mov	x1, x19
   0x0000fffff7f98d14:	aa1503e2	mov	x2, x21
   0x0000fffff7f98d18:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f98d1c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98d20:	aa1603e5	mov	x5, x22
   0x0000fffff7f98d24:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f98d28:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98d2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98d30:	d63f0200	blr	x16
   0x0000fffff7f98d34:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98d38:	54009120	b.eq	0xfffff7f99f5c  // b.none
   0x0000fffff7f98d3c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f98d40:	f100017f	cmp	x11, #0x0
   0x0000fffff7f98d44:	540004a0	b.eq	0xfffff7f98dd8  // b.none
   0x0000fffff7f98d48:	b940016d	ldr	w13, [x11]
   0x0000fffff7f98d4c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f98d50:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f98d54:	eb0901bf	cmp	x13, x9
   0x0000fffff7f98d58:	54000400	b.eq	0xfffff7f98dd8  // b.none
   0x0000fffff7f98d5c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f98d60:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f98d64:	36d801d1	tbz	w17, #27, 0xfffff7f98d9c
   0x0000fffff7f98d68:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f98d6c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f98d70:	f100013f	cmp	x9, #0x0
   0x0000fffff7f98d74:	54000321	b.ne	0xfffff7f98dd8  // b.any
   0x0000fffff7f98d78:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f98d7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98d80:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f98d84:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f98d88:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f98d8c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f98d90:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f98d94:	f100055f	cmp	x10, #0x1
   0x0000fffff7f98d98:	54000209	b.ls	0xfffff7f98dd8  // b.plast
   0x0000fffff7f98d9c:	36d8008d	tbz	w13, #27, 0xfffff7f98dac
   0x0000fffff7f98da0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f98da4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f98da8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f98dac:	36d80091	tbz	w17, #27, 0xfffff7f98dbc
   0x0000fffff7f98db0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98db4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f98db8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f98dbc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f98dc0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f98dc4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f98dc8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f98dcc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f98dd0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f98dd4:	1400000e	b	0xfffff7f98e0c
   0x0000fffff7f98dd8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98ddc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98de0:	aa1303e1	mov	x1, x19
   0x0000fffff7f98de4:	aa1503e2	mov	x2, x21
   0x0000fffff7f98de8:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f98dec:	aa1403e4	mov	x4, x20
   0x0000fffff7f98df0:	aa1603e5	mov	x5, x22
   0x0000fffff7f98df4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f98df8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98dfc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98e00:	d63f0200	blr	x16
   0x0000fffff7f98e04:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98e08:	54008ae0	b.eq	0xfffff7f99f64  // b.none
   0x0000fffff7f98e0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98e10:	37d806a9	tbnz	w9, #27, 0xfffff7f98ee4
   0x0000fffff7f98e14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98e18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98e1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98e20:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98e24:	540001c1	b.ne	0xfffff7f98e5c  // b.any
   0x0000fffff7f98e28:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98e2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98e30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98e34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98e38:	54000121	b.ne	0xfffff7f98e5c  // b.any
   0x0000fffff7f98e3c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f98e40:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f98e44:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98e48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98e4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98e50:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f98e54:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f98e58:	14000030	b	0xfffff7f98f18
   0x0000fffff7f98e5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98e60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98e64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98e68:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98e6c:	54000120	b.eq	0xfffff7f98e90  // b.none
   0x0000fffff7f98e70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98e74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98e78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98e7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98e80:	54000321	b.ne	0xfffff7f98ee4  // b.any
   0x0000fffff7f98e84:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f98e88:	9e620120	scvtf	d0, x9
   0x0000fffff7f98e8c:	14000002	b	0xfffff7f98e94
   0x0000fffff7f98e90:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f98e94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98e98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98e9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ea0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98ea4:	54000120	b.eq	0xfffff7f98ec8  // b.none
   0x0000fffff7f98ea8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f98eac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98eb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98eb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98eb8:	54000161	b.ne	0xfffff7f98ee4  // b.any
   0x0000fffff7f98ebc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f98ec0:	9e620121	scvtf	d1, x9
   0x0000fffff7f98ec4:	14000002	b	0xfffff7f98ecc
   0x0000fffff7f98ec8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f98ecc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f98ed0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f98ed4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f98ed8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98edc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f98ee0:	17ffffde	b	0xfffff7f98e58
   0x0000fffff7f98ee4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98ee8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98eec:	aa1303e1	mov	x1, x19
   0x0000fffff7f98ef0:	aa1503e2	mov	x2, x21
   0x0000fffff7f98ef4:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f98ef8:	aa1403e4	mov	x4, x20
   0x0000fffff7f98efc:	aa1603e5	mov	x5, x22
   0x0000fffff7f98f00:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f98f04:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98f08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98f0c:	d63f0200	blr	x16
   0x0000fffff7f98f10:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98f14:	540082c0	b.eq	0xfffff7f99f6c  // b.none
   0x0000fffff7f98f18:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f98f1c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f98f20:	540004a0	b.eq	0xfffff7f98fb4  // b.none
   0x0000fffff7f98f24:	b940016d	ldr	w13, [x11]
   0x0000fffff7f98f28:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f98f2c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f98f30:	eb0901bf	cmp	x13, x9
   0x0000fffff7f98f34:	54000400	b.eq	0xfffff7f98fb4  // b.none
   0x0000fffff7f98f38:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f98f3c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f98f40:	36d801d1	tbz	w17, #27, 0xfffff7f98f78
   0x0000fffff7f98f44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f98f48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f98f4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f98f50:	54000321	b.ne	0xfffff7f98fb4  // b.any
   0x0000fffff7f98f54:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f98f58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98f5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f98f60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f98f64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f98f68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f98f6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f98f70:	f100055f	cmp	x10, #0x1
   0x0000fffff7f98f74:	54000209	b.ls	0xfffff7f98fb4  // b.plast
   0x0000fffff7f98f78:	36d8008d	tbz	w13, #27, 0xfffff7f98f88
   0x0000fffff7f98f7c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f98f80:	91000529	add	x9, x9, #0x1
   0x0000fffff7f98f84:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f98f88:	36d80091	tbz	w17, #27, 0xfffff7f98f98
   0x0000fffff7f98f8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f98f90:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f98f94:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f98f98:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f98f9c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f98fa0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f98fa4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f98fa8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f98fac:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f98fb0:	1400000e	b	0xfffff7f98fe8
   0x0000fffff7f98fb4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98fb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98fbc:	aa1303e1	mov	x1, x19
   0x0000fffff7f98fc0:	aa1503e2	mov	x2, x21
   0x0000fffff7f98fc4:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f98fc8:	aa1403e4	mov	x4, x20
   0x0000fffff7f98fcc:	aa1603e5	mov	x5, x22
   0x0000fffff7f98fd0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f98fd4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98fd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98fdc:	d63f0200	blr	x16
   0x0000fffff7f98fe0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98fe4:	54007c80	b.eq	0xfffff7f99f74  // b.none
   0x0000fffff7f98fe8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98fec:	37d806a9	tbnz	w9, #27, 0xfffff7f990c0
   0x0000fffff7f98ff0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f98ff4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98ff8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ffc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99000:	540001c1	b.ne	0xfffff7f99038  // b.any
   0x0000fffff7f99004:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99008:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9900c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99010:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99014:	54000121	b.ne	0xfffff7f99038  // b.any
   0x0000fffff7f99018:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9901c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f99020:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99024:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99028:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9902c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f99030:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99034:	14000030	b	0xfffff7f990f4
   0x0000fffff7f99038:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9903c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99044:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99048:	54000120	b.eq	0xfffff7f9906c  // b.none
   0x0000fffff7f9904c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99050:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99054:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99058:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9905c:	54000321	b.ne	0xfffff7f990c0  // b.any
   0x0000fffff7f99060:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f99064:	9e620120	scvtf	d0, x9
   0x0000fffff7f99068:	14000002	b	0xfffff7f99070
   0x0000fffff7f9906c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f99070:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99074:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9907c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99080:	54000120	b.eq	0xfffff7f990a4  // b.none
   0x0000fffff7f99084:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99088:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9908c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99090:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99094:	54000161	b.ne	0xfffff7f990c0  // b.any
   0x0000fffff7f99098:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9909c:	9e620121	scvtf	d1, x9
   0x0000fffff7f990a0:	14000002	b	0xfffff7f990a8
   0x0000fffff7f990a4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f990a8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f990ac:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f990b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f990b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f990b8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f990bc:	17ffffde	b	0xfffff7f99034
   0x0000fffff7f990c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f990c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f990c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f990cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f990d0:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f990d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f990d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f990dc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f990e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f990e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f990e8:	d63f0200	blr	x16
   0x0000fffff7f990ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f990f0:	54007460	b.eq	0xfffff7f99f7c  // b.none
   0x0000fffff7f990f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f990f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f990fc:	540004a0	b.eq	0xfffff7f99190  // b.none
   0x0000fffff7f99100:	b940016d	ldr	w13, [x11]
   0x0000fffff7f99104:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f99108:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9910c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f99110:	54000400	b.eq	0xfffff7f99190  // b.none
   0x0000fffff7f99114:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f99118:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9911c:	36d801d1	tbz	w17, #27, 0xfffff7f99154
   0x0000fffff7f99120:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f99124:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f99128:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9912c:	54000321	b.ne	0xfffff7f99190  // b.any
   0x0000fffff7f99130:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f99134:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f99138:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9913c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f99140:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f99144:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f99148:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9914c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f99150:	54000209	b.ls	0xfffff7f99190  // b.plast
   0x0000fffff7f99154:	36d8008d	tbz	w13, #27, 0xfffff7f99164
   0x0000fffff7f99158:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9915c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f99160:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f99164:	36d80091	tbz	w17, #27, 0xfffff7f99174
   0x0000fffff7f99168:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9916c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f99170:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f99174:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f99178:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9917c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f99180:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f99184:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f99188:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9918c:	1400000e	b	0xfffff7f991c4
   0x0000fffff7f99190:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99194:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99198:	aa1303e1	mov	x1, x19
   0x0000fffff7f9919c:	aa1503e2	mov	x2, x21
   0x0000fffff7f991a0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f991a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f991a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f991ac:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f991b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f991b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f991b8:	d63f0200	blr	x16
   0x0000fffff7f991bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f991c0:	54006e20	b.eq	0xfffff7f99f84  // b.none
   0x0000fffff7f991c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f991c8:	37d806a9	tbnz	w9, #27, 0xfffff7f9929c
   0x0000fffff7f991cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f991d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f991d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f991d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f991dc:	540001c1	b.ne	0xfffff7f99214  // b.any
   0x0000fffff7f991e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f991e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f991e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f991ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f991f0:	54000121	b.ne	0xfffff7f99214  // b.any
   0x0000fffff7f991f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f991f8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f991fc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99200:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99204:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99208:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9920c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99210:	14000030	b	0xfffff7f992d0
   0x0000fffff7f99214:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99218:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9921c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99220:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99224:	54000120	b.eq	0xfffff7f99248  // b.none
   0x0000fffff7f99228:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9922c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99230:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99234:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99238:	54000321	b.ne	0xfffff7f9929c  // b.any
   0x0000fffff7f9923c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f99240:	9e620120	scvtf	d0, x9
   0x0000fffff7f99244:	14000002	b	0xfffff7f9924c
   0x0000fffff7f99248:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9924c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99250:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99254:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99258:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9925c:	54000120	b.eq	0xfffff7f99280  // b.none
   0x0000fffff7f99260:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99264:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9926c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99270:	54000161	b.ne	0xfffff7f9929c  // b.any
   0x0000fffff7f99274:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f99278:	9e620121	scvtf	d1, x9
   0x0000fffff7f9927c:	14000002	b	0xfffff7f99284
   0x0000fffff7f99280:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f99284:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99288:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9928c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99290:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99294:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99298:	17ffffde	b	0xfffff7f99210
   0x0000fffff7f9929c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f992a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f992a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f992a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f992ac:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f992b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f992b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f992b8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f992bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f992c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f992c4:	d63f0200	blr	x16
   0x0000fffff7f992c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f992cc:	54006600	b.eq	0xfffff7f99f8c  // b.none
   0x0000fffff7f992d0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f992d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f992d8:	540004a0	b.eq	0xfffff7f9936c  // b.none
   0x0000fffff7f992dc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f992e0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f992e4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f992e8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f992ec:	54000400	b.eq	0xfffff7f9936c  // b.none
   0x0000fffff7f992f0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f992f4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f992f8:	36d801d1	tbz	w17, #27, 0xfffff7f99330
   0x0000fffff7f992fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f99300:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f99304:	f100013f	cmp	x9, #0x0
   0x0000fffff7f99308:	54000321	b.ne	0xfffff7f9936c  // b.any
   0x0000fffff7f9930c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f99310:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f99314:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f99318:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9931c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f99320:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f99324:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f99328:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9932c:	54000209	b.ls	0xfffff7f9936c  // b.plast
   0x0000fffff7f99330:	36d8008d	tbz	w13, #27, 0xfffff7f99340
   0x0000fffff7f99334:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f99338:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9933c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f99340:	36d80091	tbz	w17, #27, 0xfffff7f99350
   0x0000fffff7f99344:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f99348:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9934c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f99350:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f99354:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f99358:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9935c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f99360:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f99364:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f99368:	1400000e	b	0xfffff7f993a0
   0x0000fffff7f9936c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99370:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99374:	aa1303e1	mov	x1, x19
   0x0000fffff7f99378:	aa1503e2	mov	x2, x21
   0x0000fffff7f9937c:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f99380:	aa1403e4	mov	x4, x20
   0x0000fffff7f99384:	aa1603e5	mov	x5, x22
   0x0000fffff7f99388:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9938c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99390:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99394:	d63f0200	blr	x16
   0x0000fffff7f99398:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9939c:	54005fc0	b.eq	0xfffff7f99f94  // b.none
   0x0000fffff7f993a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f993a4:	37d806a9	tbnz	w9, #27, 0xfffff7f99478
   0x0000fffff7f993a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f993ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f993b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f993b8:	540001c1	b.ne	0xfffff7f993f0  // b.any
   0x0000fffff7f993bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f993c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f993c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f993cc:	54000121	b.ne	0xfffff7f993f0  // b.any
   0x0000fffff7f993d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f993d4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f993d8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f993dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f993e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993e4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f993e8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f993ec:	14000030	b	0xfffff7f994ac
   0x0000fffff7f993f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f993f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f993f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99400:	54000120	b.eq	0xfffff7f99424  // b.none
   0x0000fffff7f99404:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99408:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9940c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99410:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99414:	54000321	b.ne	0xfffff7f99478  // b.any
   0x0000fffff7f99418:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9941c:	9e620120	scvtf	d0, x9
   0x0000fffff7f99420:	14000002	b	0xfffff7f99428
   0x0000fffff7f99424:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f99428:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9942c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99430:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99434:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99438:	54000120	b.eq	0xfffff7f9945c  // b.none
   0x0000fffff7f9943c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99440:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99444:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99448:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9944c:	54000161	b.ne	0xfffff7f99478  // b.any
   0x0000fffff7f99450:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f99454:	9e620121	scvtf	d1, x9
   0x0000fffff7f99458:	14000002	b	0xfffff7f99460
   0x0000fffff7f9945c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f99460:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99464:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f99468:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9946c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99470:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99474:	17ffffde	b	0xfffff7f993ec
   0x0000fffff7f99478:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9947c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99480:	aa1303e1	mov	x1, x19
   0x0000fffff7f99484:	aa1503e2	mov	x2, x21
   0x0000fffff7f99488:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f9948c:	aa1403e4	mov	x4, x20
   0x0000fffff7f99490:	aa1603e5	mov	x5, x22
   0x0000fffff7f99494:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f99498:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9949c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f994a0:	d63f0200	blr	x16
   0x0000fffff7f994a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f994a8:	540057a0	b.eq	0xfffff7f99f9c  // b.none
   0x0000fffff7f994ac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f994b0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f994b4:	540004a0	b.eq	0xfffff7f99548  // b.none
   0x0000fffff7f994b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f994bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f994c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f994c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f994c8:	54000400	b.eq	0xfffff7f99548  // b.none
   0x0000fffff7f994cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f994d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f994d4:	36d801d1	tbz	w17, #27, 0xfffff7f9950c
   0x0000fffff7f994d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f994dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f994e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f994e4:	54000321	b.ne	0xfffff7f99548  // b.any
   0x0000fffff7f994e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f994ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f994f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f994f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f994f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f994fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f99500:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f99504:	f100055f	cmp	x10, #0x1
   0x0000fffff7f99508:	54000209	b.ls	0xfffff7f99548  // b.plast
   0x0000fffff7f9950c:	36d8008d	tbz	w13, #27, 0xfffff7f9951c
   0x0000fffff7f99510:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f99514:	91000529	add	x9, x9, #0x1
   0x0000fffff7f99518:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9951c:	36d80091	tbz	w17, #27, 0xfffff7f9952c
   0x0000fffff7f99520:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f99524:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f99528:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9952c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f99530:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f99534:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f99538:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9953c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f99540:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f99544:	1400000e	b	0xfffff7f9957c
   0x0000fffff7f99548:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9954c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99550:	aa1303e1	mov	x1, x19
   0x0000fffff7f99554:	aa1503e2	mov	x2, x21
   0x0000fffff7f99558:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f9955c:	aa1403e4	mov	x4, x20
   0x0000fffff7f99560:	aa1603e5	mov	x5, x22
   0x0000fffff7f99564:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f99568:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9956c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99570:	d63f0200	blr	x16
   0x0000fffff7f99574:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99578:	54005160	b.eq	0xfffff7f99fa4  // b.none
   0x0000fffff7f9957c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99580:	37d806a9	tbnz	w9, #27, 0xfffff7f99654
   0x0000fffff7f99584:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99588:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9958c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99590:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99594:	540001c1	b.ne	0xfffff7f995cc  // b.any
   0x0000fffff7f99598:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9959c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f995a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f995a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f995a8:	54000121	b.ne	0xfffff7f995cc  // b.any
   0x0000fffff7f995ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f995b0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f995b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f995b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f995bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f995c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f995c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f995c8:	14000030	b	0xfffff7f99688
   0x0000fffff7f995cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f995d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f995d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f995d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f995dc:	54000120	b.eq	0xfffff7f99600  // b.none
   0x0000fffff7f995e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f995e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f995e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f995ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f995f0:	54000321	b.ne	0xfffff7f99654  // b.any
   0x0000fffff7f995f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f995f8:	9e620120	scvtf	d0, x9
   0x0000fffff7f995fc:	14000002	b	0xfffff7f99604
   0x0000fffff7f99600:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f99604:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99608:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9960c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99610:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99614:	54000120	b.eq	0xfffff7f99638  // b.none
   0x0000fffff7f99618:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9961c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99624:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99628:	54000161	b.ne	0xfffff7f99654  // b.any
   0x0000fffff7f9962c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f99630:	9e620121	scvtf	d1, x9
   0x0000fffff7f99634:	14000002	b	0xfffff7f9963c
   0x0000fffff7f99638:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9963c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99640:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f99644:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9964c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99650:	17ffffde	b	0xfffff7f995c8
   0x0000fffff7f99654:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99658:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9965c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99660:	aa1503e2	mov	x2, x21
   0x0000fffff7f99664:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f99668:	aa1403e4	mov	x4, x20
   0x0000fffff7f9966c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99670:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f99674:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99678:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9967c:	d63f0200	blr	x16
   0x0000fffff7f99680:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99684:	54004940	b.eq	0xfffff7f99fac  // b.none
   0x0000fffff7f99688:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9968c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f99690:	540004a0	b.eq	0xfffff7f99724  // b.none
   0x0000fffff7f99694:	b940016d	ldr	w13, [x11]
   0x0000fffff7f99698:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9969c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f996a0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f996a4:	54000400	b.eq	0xfffff7f99724  // b.none
   0x0000fffff7f996a8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f996ac:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f996b0:	36d801d1	tbz	w17, #27, 0xfffff7f996e8
   0x0000fffff7f996b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f996b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f996bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f996c0:	54000321	b.ne	0xfffff7f99724  // b.any
   0x0000fffff7f996c4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f996c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f996cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f996d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f996d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f996d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f996dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f996e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f996e4:	54000209	b.ls	0xfffff7f99724  // b.plast
   0x0000fffff7f996e8:	36d8008d	tbz	w13, #27, 0xfffff7f996f8
   0x0000fffff7f996ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f996f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f996f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f996f8:	36d80091	tbz	w17, #27, 0xfffff7f99708
   0x0000fffff7f996fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f99700:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f99704:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f99708:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9970c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f99710:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f99714:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f99718:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9971c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f99720:	1400000e	b	0xfffff7f99758
   0x0000fffff7f99724:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99728:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9972c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99730:	aa1503e2	mov	x2, x21
   0x0000fffff7f99734:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f99738:	aa1403e4	mov	x4, x20
   0x0000fffff7f9973c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99740:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f99744:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99748:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9974c:	d63f0200	blr	x16
   0x0000fffff7f99750:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99754:	54004300	b.eq	0xfffff7f99fb4  // b.none
   0x0000fffff7f99758:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9975c:	37d806a9	tbnz	w9, #27, 0xfffff7f99830
   0x0000fffff7f99760:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99764:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99768:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9976c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99770:	540001c1	b.ne	0xfffff7f997a8  // b.any
   0x0000fffff7f99774:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9977c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99784:	54000121	b.ne	0xfffff7f997a8  // b.any
   0x0000fffff7f99788:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9978c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f99790:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99794:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99798:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9979c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f997a0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f997a4:	14000030	b	0xfffff7f99864
   0x0000fffff7f997a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f997ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f997b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f997b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f997b8:	54000120	b.eq	0xfffff7f997dc  // b.none
   0x0000fffff7f997bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f997c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f997c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f997c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f997cc:	54000321	b.ne	0xfffff7f99830  // b.any
   0x0000fffff7f997d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f997d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f997d8:	14000002	b	0xfffff7f997e0
   0x0000fffff7f997dc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f997e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f997e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f997e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f997ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f997f0:	54000120	b.eq	0xfffff7f99814  // b.none
   0x0000fffff7f997f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f997f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f997fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99800:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99804:	54000161	b.ne	0xfffff7f99830  // b.any
   0x0000fffff7f99808:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9980c:	9e620121	scvtf	d1, x9
   0x0000fffff7f99810:	14000002	b	0xfffff7f99818
   0x0000fffff7f99814:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f99818:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9981c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f99820:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99824:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99828:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9982c:	17ffffde	b	0xfffff7f997a4
   0x0000fffff7f99830:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99834:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99838:	aa1303e1	mov	x1, x19
   0x0000fffff7f9983c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99840:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f99844:	aa1403e4	mov	x4, x20
   0x0000fffff7f99848:	aa1603e5	mov	x5, x22
   0x0000fffff7f9984c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f99850:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99854:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99858:	d63f0200	blr	x16
   0x0000fffff7f9985c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99860:	54003ae0	b.eq	0xfffff7f99fbc  // b.none
   0x0000fffff7f99864:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f99868:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9986c:	540004a0	b.eq	0xfffff7f99900  // b.none
   0x0000fffff7f99870:	b940016d	ldr	w13, [x11]
   0x0000fffff7f99874:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f99878:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9987c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f99880:	54000400	b.eq	0xfffff7f99900  // b.none
   0x0000fffff7f99884:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f99888:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9988c:	36d801d1	tbz	w17, #27, 0xfffff7f998c4
   0x0000fffff7f99890:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f99894:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f99898:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9989c:	54000321	b.ne	0xfffff7f99900  // b.any
   0x0000fffff7f998a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f998a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f998a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f998ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f998b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f998b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f998b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f998bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f998c0:	54000209	b.ls	0xfffff7f99900  // b.plast
   0x0000fffff7f998c4:	36d8008d	tbz	w13, #27, 0xfffff7f998d4
   0x0000fffff7f998c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f998cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f998d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f998d4:	36d80091	tbz	w17, #27, 0xfffff7f998e4
   0x0000fffff7f998d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f998dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f998e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f998e4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f998e8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f998ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f998f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f998f4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f998f8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f998fc:	1400000e	b	0xfffff7f99934
   0x0000fffff7f99900:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99904:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99908:	aa1303e1	mov	x1, x19
   0x0000fffff7f9990c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99910:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f99914:	aa1403e4	mov	x4, x20
   0x0000fffff7f99918:	aa1603e5	mov	x5, x22
   0x0000fffff7f9991c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f99920:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99924:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99928:	d63f0200	blr	x16
   0x0000fffff7f9992c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99930:	540034a0	b.eq	0xfffff7f99fc4  // b.none
   0x0000fffff7f99934:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99938:	37d806a9	tbnz	w9, #27, 0xfffff7f99a0c
   0x0000fffff7f9993c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99940:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99948:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9994c:	540001c1	b.ne	0xfffff7f99984  // b.any
   0x0000fffff7f99950:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9995c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99960:	54000121	b.ne	0xfffff7f99984  // b.any
   0x0000fffff7f99964:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f99968:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9996c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99970:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99978:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9997c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99980:	14000030	b	0xfffff7f99a40
   0x0000fffff7f99984:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9998c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99990:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99994:	54000120	b.eq	0xfffff7f999b8  // b.none
   0x0000fffff7f99998:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9999c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f999a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f999a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f999a8:	54000321	b.ne	0xfffff7f99a0c  // b.any
   0x0000fffff7f999ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f999b0:	9e620120	scvtf	d0, x9
   0x0000fffff7f999b4:	14000002	b	0xfffff7f999bc
   0x0000fffff7f999b8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f999bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f999c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f999c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f999c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f999cc:	54000120	b.eq	0xfffff7f999f0  // b.none
   0x0000fffff7f999d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f999d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f999d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f999dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f999e0:	54000161	b.ne	0xfffff7f99a0c  // b.any
   0x0000fffff7f999e4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f999e8:	9e620121	scvtf	d1, x9
   0x0000fffff7f999ec:	14000002	b	0xfffff7f999f4
   0x0000fffff7f999f0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f999f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f999f8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f999fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99a00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99a04:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99a08:	17ffffde	b	0xfffff7f99980
   0x0000fffff7f99a0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99a10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99a14:	aa1303e1	mov	x1, x19
   0x0000fffff7f99a18:	aa1503e2	mov	x2, x21
   0x0000fffff7f99a1c:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f99a20:	aa1403e4	mov	x4, x20
   0x0000fffff7f99a24:	aa1603e5	mov	x5, x22
   0x0000fffff7f99a28:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f99a2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99a30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99a34:	d63f0200	blr	x16
   0x0000fffff7f99a38:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99a3c:	54002c80	b.eq	0xfffff7f99fcc  // b.none
   0x0000fffff7f99a40:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f99a44:	f100017f	cmp	x11, #0x0
   0x0000fffff7f99a48:	540004a0	b.eq	0xfffff7f99adc  // b.none
   0x0000fffff7f99a4c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f99a50:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f99a54:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f99a58:	eb0901bf	cmp	x13, x9
   0x0000fffff7f99a5c:	54000400	b.eq	0xfffff7f99adc  // b.none
   0x0000fffff7f99a60:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f99a64:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f99a68:	36d801d1	tbz	w17, #27, 0xfffff7f99aa0
   0x0000fffff7f99a6c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f99a70:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f99a74:	f100013f	cmp	x9, #0x0
   0x0000fffff7f99a78:	54000321	b.ne	0xfffff7f99adc  // b.any
   0x0000fffff7f99a7c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f99a80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f99a84:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f99a88:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f99a8c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f99a90:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f99a94:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f99a98:	f100055f	cmp	x10, #0x1
   0x0000fffff7f99a9c:	54000209	b.ls	0xfffff7f99adc  // b.plast
   0x0000fffff7f99aa0:	36d8008d	tbz	w13, #27, 0xfffff7f99ab0
   0x0000fffff7f99aa4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f99aa8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f99aac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f99ab0:	36d80091	tbz	w17, #27, 0xfffff7f99ac0
   0x0000fffff7f99ab4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f99ab8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f99abc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f99ac0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f99ac4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f99ac8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f99acc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f99ad0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f99ad4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f99ad8:	1400000e	b	0xfffff7f99b10
   0x0000fffff7f99adc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99ae0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99ae4:	aa1303e1	mov	x1, x19
   0x0000fffff7f99ae8:	aa1503e2	mov	x2, x21
   0x0000fffff7f99aec:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f99af0:	aa1403e4	mov	x4, x20
   0x0000fffff7f99af4:	aa1603e5	mov	x5, x22
   0x0000fffff7f99af8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f99afc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99b00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99b04:	d63f0200	blr	x16
   0x0000fffff7f99b08:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99b0c:	54002640	b.eq	0xfffff7f99fd4  // b.none
   0x0000fffff7f99b10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99b14:	37d806a9	tbnz	w9, #27, 0xfffff7f99be8
   0x0000fffff7f99b18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99b1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99b20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99b24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99b28:	540001c1	b.ne	0xfffff7f99b60  // b.any
   0x0000fffff7f99b2c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99b30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99b34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99b38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99b3c:	54000121	b.ne	0xfffff7f99b60  // b.any
   0x0000fffff7f99b40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f99b44:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f99b48:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99b4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99b50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99b54:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f99b58:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99b5c:	14000030	b	0xfffff7f99c1c
   0x0000fffff7f99b60:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99b64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99b68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99b6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99b70:	54000120	b.eq	0xfffff7f99b94  // b.none
   0x0000fffff7f99b74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99b78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99b7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99b80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99b84:	54000321	b.ne	0xfffff7f99be8  // b.any
   0x0000fffff7f99b88:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f99b8c:	9e620120	scvtf	d0, x9
   0x0000fffff7f99b90:	14000002	b	0xfffff7f99b98
   0x0000fffff7f99b94:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f99b98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99b9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99ba0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99ba4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99ba8:	54000120	b.eq	0xfffff7f99bcc  // b.none
   0x0000fffff7f99bac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99bb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99bb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99bb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99bbc:	54000161	b.ne	0xfffff7f99be8  // b.any
   0x0000fffff7f99bc0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f99bc4:	9e620121	scvtf	d1, x9
   0x0000fffff7f99bc8:	14000002	b	0xfffff7f99bd0
   0x0000fffff7f99bcc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f99bd0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99bd4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f99bd8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99bdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99be0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99be4:	17ffffde	b	0xfffff7f99b5c
   0x0000fffff7f99be8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99bec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99bf0:	aa1303e1	mov	x1, x19
   0x0000fffff7f99bf4:	aa1503e2	mov	x2, x21
   0x0000fffff7f99bf8:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f99bfc:	aa1403e4	mov	x4, x20
   0x0000fffff7f99c00:	aa1603e5	mov	x5, x22
   0x0000fffff7f99c04:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f99c08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99c0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99c10:	d63f0200	blr	x16
   0x0000fffff7f99c14:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99c18:	54001e20	b.eq	0xfffff7f99fdc  // b.none
   0x0000fffff7f99c1c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f99c20:	f100017f	cmp	x11, #0x0
   0x0000fffff7f99c24:	540004a0	b.eq	0xfffff7f99cb8  // b.none
   0x0000fffff7f99c28:	b940016d	ldr	w13, [x11]
   0x0000fffff7f99c2c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f99c30:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f99c34:	eb0901bf	cmp	x13, x9
   0x0000fffff7f99c38:	54000400	b.eq	0xfffff7f99cb8  // b.none
   0x0000fffff7f99c3c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f99c40:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f99c44:	36d801d1	tbz	w17, #27, 0xfffff7f99c7c
   0x0000fffff7f99c48:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f99c4c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f99c50:	f100013f	cmp	x9, #0x0
   0x0000fffff7f99c54:	54000321	b.ne	0xfffff7f99cb8  // b.any
   0x0000fffff7f99c58:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f99c5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f99c60:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f99c64:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f99c68:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f99c6c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f99c70:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f99c74:	f100055f	cmp	x10, #0x1
   0x0000fffff7f99c78:	54000209	b.ls	0xfffff7f99cb8  // b.plast
   0x0000fffff7f99c7c:	36d8008d	tbz	w13, #27, 0xfffff7f99c8c
   0x0000fffff7f99c80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f99c84:	91000529	add	x9, x9, #0x1
   0x0000fffff7f99c88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f99c8c:	36d80091	tbz	w17, #27, 0xfffff7f99c9c
   0x0000fffff7f99c90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f99c94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f99c98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f99c9c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f99ca0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f99ca4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f99ca8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f99cac:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f99cb0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f99cb4:	1400000e	b	0xfffff7f99cec
   0x0000fffff7f99cb8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f99cbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99cc0:	aa1303e1	mov	x1, x19
   0x0000fffff7f99cc4:	aa1503e2	mov	x2, x21
   0x0000fffff7f99cc8:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f99ccc:	aa1403e4	mov	x4, x20
   0x0000fffff7f99cd0:	aa1603e5	mov	x5, x22
   0x0000fffff7f99cd4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f99cd8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99cdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99ce0:	d63f0200	blr	x16
   0x0000fffff7f99ce4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99ce8:	540017e0	b.eq	0xfffff7f99fe4  // b.none
   0x0000fffff7f99cec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99cf0:	37d806a9	tbnz	w9, #27, 0xfffff7f99dc4
   0x0000fffff7f99cf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99cf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99cfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d04:	540001c1	b.ne	0xfffff7f99d3c  // b.any
   0x0000fffff7f99d08:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99d0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99d10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d14:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d18:	54000121	b.ne	0xfffff7f99d3c  // b.any
   0x0000fffff7f99d1c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f99d20:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f99d24:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99d28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99d2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d30:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f99d34:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99d38:	14000030	b	0xfffff7f99df8
   0x0000fffff7f99d3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99d40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99d44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d4c:	54000120	b.eq	0xfffff7f99d70  // b.none
   0x0000fffff7f99d50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f99d54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99d58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d60:	54000321	b.ne	0xfffff7f99dc4  // b.any
   0x0000fffff7f99d64:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f99d68:	9e620120	scvtf	d0, x9
   0x0000fffff7f99d6c:	14000002	b	0xfffff7f99d74
   0x0000fffff7f99d70:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f99d74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99d78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99d7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d84:	54000120	b.eq	0xfffff7f99da8  // b.none
   0x0000fffff7f99d88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99d8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99d90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99d94:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99d98:	54000161	b.ne	0xfffff7f99dc4  // b.any
   0x0000fffff7f99d9c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f99da0:	9e620121	scvtf	d1, x9
   0x0000fffff7f99da4:	14000002	b	0xfffff7f99dac
   0x0000fffff7f99da8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f99dac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f99db0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f99db4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f99db8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99dbc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f99dc0:	17ffffde	b	0xfffff7f99d38
   0x0000fffff7f99dc4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99dc8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99dcc:	aa1303e1	mov	x1, x19
   0x0000fffff7f99dd0:	aa1503e2	mov	x2, x21
   0x0000fffff7f99dd4:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f99dd8:	aa1403e4	mov	x4, x20
   0x0000fffff7f99ddc:	aa1603e5	mov	x5, x22
   0x0000fffff7f99de0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f99de4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99de8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99dec:	d63f0200	blr	x16
   0x0000fffff7f99df0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99df4:	54000fc0	b.eq	0xfffff7f99fec  // b.none
   0x0000fffff7f99df8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f99dfc:	37d80269	tbnz	w9, #27, 0xfffff7f99e48
   0x0000fffff7f99e00:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f99e04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99e08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99e0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99e10:	540001c1	b.ne	0xfffff7f99e48  // b.any
   0x0000fffff7f99e14:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f99e18:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f99e1c:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f99e20:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f99e24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99e28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99e2c:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f99e30:	aa0b03e9	mov	x9, x11
   0x0000fffff7f99e34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99e38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99e3c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f99e40:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f99e44:	1400000e	b	0xfffff7f99e7c
   0x0000fffff7f99e48:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99e4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99e50:	aa1303e1	mov	x1, x19
   0x0000fffff7f99e54:	aa1503e2	mov	x2, x21
   0x0000fffff7f99e58:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f99e5c:	aa1403e4	mov	x4, x20
   0x0000fffff7f99e60:	aa1603e5	mov	x5, x22
   0x0000fffff7f99e64:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7f99e68:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99e6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99e70:	d63f0200	blr	x16
   0x0000fffff7f99e74:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99e78:	54000be0	b.eq	0xfffff7f99ff4  // b.none
   0x0000fffff7f99e7c:	17fff8d2	b	0xfffff7f981c4
   0x0000fffff7f99e80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99e84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99e88:	aa1303e1	mov	x1, x19
   0x0000fffff7f99e8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99e90:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f99e94:	aa1403e4	mov	x4, x20
   0x0000fffff7f99e98:	aa1603e5	mov	x5, x22
   0x0000fffff7f99e9c:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7f99ea0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99ea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99ea8:	d63f0200	blr	x16
   0x0000fffff7f99eac:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f99eb0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f99eb4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f99eb8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f99ebc:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f99ec0:	d65f03c0	ret
   0x0000fffff7f99ec4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99ec8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99ecc:	b900028a	str	w10, [x20]
   0x0000fffff7f99ed0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f99ed4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f99ed8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f99edc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f99ee0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f99ee4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f99ee8:	d65f03c0	ret
   0x0000fffff7f99eec:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f99ef0:	17fffff5	b	0xfffff7f99ec4
   0x0000fffff7f99ef4:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f99ef8:	17fffff3	b	0xfffff7f99ec4
   0x0000fffff7f99efc:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f99f00:	17fffff1	b	0xfffff7f99ec4
   0x0000fffff7f99f04:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f99f08:	17ffffef	b	0xfffff7f99ec4
   0x0000fffff7f99f0c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f99f10:	17ffffed	b	0xfffff7f99ec4
   0x0000fffff7f99f14:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f99f18:	17ffffeb	b	0xfffff7f99ec4
   0x0000fffff7f99f1c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f99f20:	17ffffe9	b	0xfffff7f99ec4
   0x0000fffff7f99f24:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f99f28:	17ffffe7	b	0xfffff7f99ec4
   0x0000fffff7f99f2c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f99f30:	17ffffe5	b	0xfffff7f99ec4
   0x0000fffff7f99f34:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f99f38:	17ffffe3	b	0xfffff7f99ec4
   0x0000fffff7f99f3c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f99f40:	17ffffe1	b	0xfffff7f99ec4
   0x0000fffff7f99f44:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f99f48:	17ffffdf	b	0xfffff7f99ec4
   0x0000fffff7f99f4c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f99f50:	17ffffdd	b	0xfffff7f99ec4
   0x0000fffff7f99f54:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f99f58:	17ffffdb	b	0xfffff7f99ec4
   0x0000fffff7f99f5c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f99f60:	17ffffd9	b	0xfffff7f99ec4
   0x0000fffff7f99f64:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f99f68:	17ffffd7	b	0xfffff7f99ec4
   0x0000fffff7f99f6c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f99f70:	17ffffd5	b	0xfffff7f99ec4
   0x0000fffff7f99f74:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f99f78:	17ffffd3	b	0xfffff7f99ec4
   0x0000fffff7f99f7c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f99f80:	17ffffd1	b	0xfffff7f99ec4
   0x0000fffff7f99f84:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f99f88:	17ffffcf	b	0xfffff7f99ec4
   0x0000fffff7f99f8c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f99f90:	17ffffcd	b	0xfffff7f99ec4
   0x0000fffff7f99f94:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f99f98:	17ffffcb	b	0xfffff7f99ec4
   0x0000fffff7f99f9c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f99fa0:	17ffffc9	b	0xfffff7f99ec4
   0x0000fffff7f99fa4:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f99fa8:	17ffffc7	b	0xfffff7f99ec4
   0x0000fffff7f99fac:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f99fb0:	17ffffc5	b	0xfffff7f99ec4
   0x0000fffff7f99fb4:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f99fb8:	17ffffc3	b	0xfffff7f99ec4
   0x0000fffff7f99fbc:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f99fc0:	17ffffc1	b	0xfffff7f99ec4
   0x0000fffff7f99fc4:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f99fc8:	17ffffbf	b	0xfffff7f99ec4
   0x0000fffff7f99fcc:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f99fd0:	17ffffbd	b	0xfffff7f99ec4
   0x0000fffff7f99fd4:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f99fd8:	17ffffbb	b	0xfffff7f99ec4
   0x0000fffff7f99fdc:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f99fe0:	17ffffb9	b	0xfffff7f99ec4
   0x0000fffff7f99fe4:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f99fe8:	17ffffb7	b	0xfffff7f99ec4
   0x0000fffff7f99fec:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f99ff0:	17ffffb5	b	0xfffff7f99ec4
   0x0000fffff7f99ff4:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f99ff8:	17ffffb3	b	0xfffff7f99ec4
   0x0000fffff7f99ffc:	00000000	udf	#0
End of assembler dump.
