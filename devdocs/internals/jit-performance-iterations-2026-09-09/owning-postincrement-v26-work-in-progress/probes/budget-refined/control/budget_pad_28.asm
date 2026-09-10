Dump of assembler code from 0xfffff7f86000 to 0xfffff7f88000:
   0x0000fffff7f86000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f86004:	910003fd	mov	x29, sp
   0x0000fffff7f86008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8600c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f86010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f86014:	aa0003f3	mov	x19, x0
   0x0000fffff7f86018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8601c:	aa0203f5	mov	x21, x2
   0x0000fffff7f86020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f86024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f86028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8602c:	f90003e9	str	x9, [sp]
   0x0000fffff7f86030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f86034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f86038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8603c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f86040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86044:	d63f0200	blr	x16
   0x0000fffff7f86048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8604c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f86050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f86054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f86058:	14000001	b	0xfffff7f8605c
   0x0000fffff7f8605c:	14000001	b	0xfffff7f86060
   0x0000fffff7f86060:	14000001	b	0xfffff7f86064
   0x0000fffff7f86064:	14000001	b	0xfffff7f86068
   0x0000fffff7f86068:	14000001	b	0xfffff7f8606c
   0x0000fffff7f8606c:	14000001	b	0xfffff7f86070
   0x0000fffff7f86070:	14000001	b	0xfffff7f86074
   0x0000fffff7f86074:	14000001	b	0xfffff7f86078
   0x0000fffff7f86078:	14000001	b	0xfffff7f8607c
   0x0000fffff7f8607c:	14000001	b	0xfffff7f86080
   0x0000fffff7f86080:	14000001	b	0xfffff7f86084
   0x0000fffff7f86084:	14000001	b	0xfffff7f86088
   0x0000fffff7f86088:	14000001	b	0xfffff7f8608c
   0x0000fffff7f8608c:	14000001	b	0xfffff7f86090
   0x0000fffff7f86090:	14000001	b	0xfffff7f86094
   0x0000fffff7f86094:	14000001	b	0xfffff7f86098
   0x0000fffff7f86098:	14000001	b	0xfffff7f8609c
   0x0000fffff7f8609c:	14000001	b	0xfffff7f860a0
   0x0000fffff7f860a0:	14000001	b	0xfffff7f860a4
   0x0000fffff7f860a4:	14000001	b	0xfffff7f860a8
   0x0000fffff7f860a8:	14000001	b	0xfffff7f860ac
   0x0000fffff7f860ac:	14000001	b	0xfffff7f860b0
   0x0000fffff7f860b0:	14000001	b	0xfffff7f860b4
   0x0000fffff7f860b4:	14000001	b	0xfffff7f860b8
   0x0000fffff7f860b8:	14000001	b	0xfffff7f860bc
   0x0000fffff7f860bc:	14000001	b	0xfffff7f860c0
   0x0000fffff7f860c0:	14000001	b	0xfffff7f860c4
   0x0000fffff7f860c4:	14000001	b	0xfffff7f860c8
   0x0000fffff7f860c8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f860cc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f860d0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f860d4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f860d8:	36d80211	tbz	w17, #27, 0xfffff7f86118
   0x0000fffff7f860dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f860e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f860e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f860e8:	540001e1	b.ne	0xfffff7f86124  // b.any
   0x0000fffff7f860ec:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f860f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f860f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f860f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f860fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f86100:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f86104:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f86108:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8610c:	540000c9	b.ls	0xfffff7f86124  // b.plast
   0x0000fffff7f86110:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f86114:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f86118:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f8611c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f86120:	1400000e	b	0xfffff7f86158
   0x0000fffff7f86124:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86128:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8612c:	aa1303e1	mov	x1, x19
   0x0000fffff7f86130:	aa1503e2	mov	x2, x21
   0x0000fffff7f86134:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f86138:	aa1403e4	mov	x4, x20
   0x0000fffff7f8613c:	aa1603e5	mov	x5, x22
   0x0000fffff7f86140:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f86144:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86148:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8614c:	d63f0200	blr	x16
   0x0000fffff7f86150:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86154:	5400e940	b.eq	0xfffff7f87e7c  // b.none
   0x0000fffff7f86158:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8615c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f86160:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f86164:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f86168:	36d80211	tbz	w17, #27, 0xfffff7f861a8
   0x0000fffff7f8616c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f86170:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f86174:	f100013f	cmp	x9, #0x0
   0x0000fffff7f86178:	540001e1	b.ne	0xfffff7f861b4  // b.any
   0x0000fffff7f8617c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f86180:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86184:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f86188:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8618c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f86190:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f86194:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f86198:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8619c:	540000c9	b.ls	0xfffff7f861b4  // b.plast
   0x0000fffff7f861a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f861a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f861a8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f861ac:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f861b0:	1400000e	b	0xfffff7f861e8
   0x0000fffff7f861b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f861b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f861bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f861c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f861c4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f861c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f861cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f861d0:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f861d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f861d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f861dc:	d63f0200	blr	x16
   0x0000fffff7f861e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f861e4:	5400e500	b.eq	0xfffff7f87e84  // b.none
   0x0000fffff7f861e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f861ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f861f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f861f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f861f8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f861fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f86200:	aa1603e5	mov	x5, x22
   0x0000fffff7f86204:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7f86208:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8620c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86210:	d63f0200	blr	x16
   0x0000fffff7f86214:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86218:	5400e3a0	b.eq	0xfffff7f87e8c  // b.none
   0x0000fffff7f8621c:	f100041f	cmp	x0, #0x1
   0x0000fffff7f86220:	5400df80	b.eq	0xfffff7f87e10  // b.none
   0x0000fffff7f86224:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f86228:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f8622c:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f86230:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f86234:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f86238:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f8623c:	36d801d1	tbz	w17, #27, 0xfffff7f86274
   0x0000fffff7f86240:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f86244:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f86248:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8624c:	54000281	b.ne	0xfffff7f8629c  // b.any
   0x0000fffff7f86250:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f86254:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86258:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8625c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f86260:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f86264:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f86268:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8626c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f86270:	54000169	b.ls	0xfffff7f8629c  // b.plast
   0x0000fffff7f86274:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f86278:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8627c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f86280:	36d80091	tbz	w17, #27, 0xfffff7f86290
   0x0000fffff7f86284:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86288:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8628c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f86290:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f86294:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f86298:	1400000e	b	0xfffff7f862d0
   0x0000fffff7f8629c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f862a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f862a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f862a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f862ac:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f862b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f862b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f862b8:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f862bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f862c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f862c4:	d63f0200	blr	x16
   0x0000fffff7f862c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f862cc:	5400de40	b.eq	0xfffff7f87e94  // b.none
   0x0000fffff7f862d0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f862d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f862d8:	540003a0	b.eq	0xfffff7f8634c  // b.none
   0x0000fffff7f862dc:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f862e0:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f862e4:	b9400171	ldr	w17, [x11]
   0x0000fffff7f862e8:	36d801d1	tbz	w17, #27, 0xfffff7f86320
   0x0000fffff7f862ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f862f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f862f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f862f8:	540002a1	b.ne	0xfffff7f8634c  // b.any
   0x0000fffff7f862fc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f86300:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86304:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f86308:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8630c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f86310:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f86314:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f86318:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8631c:	54000189	b.ls	0xfffff7f8634c  // b.plast
   0x0000fffff7f86320:	36d8008d	tbz	w13, #27, 0xfffff7f86330
   0x0000fffff7f86324:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f86328:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8632c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f86330:	36d80091	tbz	w17, #27, 0xfffff7f86340
   0x0000fffff7f86334:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86338:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8633c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f86340:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f86344:	b900016d	str	w13, [x11]
   0x0000fffff7f86348:	1400000e	b	0xfffff7f86380
   0x0000fffff7f8634c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f86350:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86354:	aa1303e1	mov	x1, x19
   0x0000fffff7f86358:	aa1503e2	mov	x2, x21
   0x0000fffff7f8635c:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f86360:	aa1403e4	mov	x4, x20
   0x0000fffff7f86364:	aa1603e5	mov	x5, x22
   0x0000fffff7f86368:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7f8636c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86370:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86374:	d63f0200	blr	x16
   0x0000fffff7f86378:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8637c:	5400d900	b.eq	0xfffff7f87e9c  // b.none
   0x0000fffff7f86380:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f86384:	f100017f	cmp	x11, #0x0
   0x0000fffff7f86388:	540004a0	b.eq	0xfffff7f8641c  // b.none
   0x0000fffff7f8638c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f86390:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f86394:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f86398:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8639c:	54000400	b.eq	0xfffff7f8641c  // b.none
   0x0000fffff7f863a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f863a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f863a8:	36d801d1	tbz	w17, #27, 0xfffff7f863e0
   0x0000fffff7f863ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f863b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f863b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f863b8:	54000321	b.ne	0xfffff7f8641c  // b.any
   0x0000fffff7f863bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f863c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f863c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f863c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f863cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f863d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f863d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f863d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f863dc:	54000209	b.ls	0xfffff7f8641c  // b.plast
   0x0000fffff7f863e0:	36d8008d	tbz	w13, #27, 0xfffff7f863f0
   0x0000fffff7f863e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f863e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f863ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f863f0:	36d80091	tbz	w17, #27, 0xfffff7f86400
   0x0000fffff7f863f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f863f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f863fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f86400:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f86404:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f86408:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8640c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f86410:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f86414:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f86418:	1400000e	b	0xfffff7f86450
   0x0000fffff7f8641c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86420:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86424:	aa1303e1	mov	x1, x19
   0x0000fffff7f86428:	aa1503e2	mov	x2, x21
   0x0000fffff7f8642c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f86430:	aa1403e4	mov	x4, x20
   0x0000fffff7f86434:	aa1603e5	mov	x5, x22
   0x0000fffff7f86438:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8643c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86440:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86444:	d63f0200	blr	x16
   0x0000fffff7f86448:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8644c:	5400d2c0	b.eq	0xfffff7f87ea4  // b.none
   0x0000fffff7f86450:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86454:	37d806a9	tbnz	w9, #27, 0xfffff7f86528
   0x0000fffff7f86458:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8645c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86464:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86468:	540001c1	b.ne	0xfffff7f864a0  // b.any
   0x0000fffff7f8646c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86470:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86474:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86478:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8647c:	54000121	b.ne	0xfffff7f864a0  // b.any
   0x0000fffff7f86480:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86484:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f86488:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8648c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86490:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86494:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f86498:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8649c:	14000030	b	0xfffff7f8655c
   0x0000fffff7f864a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f864a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f864a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f864ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f864b0:	54000120	b.eq	0xfffff7f864d4  // b.none
   0x0000fffff7f864b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f864b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f864bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f864c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f864c4:	54000321	b.ne	0xfffff7f86528  // b.any
   0x0000fffff7f864c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f864cc:	9e620120	scvtf	d0, x9
   0x0000fffff7f864d0:	14000002	b	0xfffff7f864d8
   0x0000fffff7f864d4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f864d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f864dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f864e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f864e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f864e8:	54000120	b.eq	0xfffff7f8650c  // b.none
   0x0000fffff7f864ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f864f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f864f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f864f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f864fc:	54000161	b.ne	0xfffff7f86528  // b.any
   0x0000fffff7f86500:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f86504:	9e620121	scvtf	d1, x9
   0x0000fffff7f86508:	14000002	b	0xfffff7f86510
   0x0000fffff7f8650c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f86510:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f86514:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f86518:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8651c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86520:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86524:	17ffffde	b	0xfffff7f8649c
   0x0000fffff7f86528:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8652c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86530:	aa1303e1	mov	x1, x19
   0x0000fffff7f86534:	aa1503e2	mov	x2, x21
   0x0000fffff7f86538:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f8653c:	aa1403e4	mov	x4, x20
   0x0000fffff7f86540:	aa1603e5	mov	x5, x22
   0x0000fffff7f86544:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f86548:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8654c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86550:	d63f0200	blr	x16
   0x0000fffff7f86554:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86558:	5400caa0	b.eq	0xfffff7f87eac  // b.none
   0x0000fffff7f8655c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f86560:	f100017f	cmp	x11, #0x0
   0x0000fffff7f86564:	540004a0	b.eq	0xfffff7f865f8  // b.none
   0x0000fffff7f86568:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8656c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f86570:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f86574:	eb0901bf	cmp	x13, x9
   0x0000fffff7f86578:	54000400	b.eq	0xfffff7f865f8  // b.none
   0x0000fffff7f8657c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f86580:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f86584:	36d801d1	tbz	w17, #27, 0xfffff7f865bc
   0x0000fffff7f86588:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8658c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f86590:	f100013f	cmp	x9, #0x0
   0x0000fffff7f86594:	54000321	b.ne	0xfffff7f865f8  // b.any
   0x0000fffff7f86598:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8659c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f865a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f865a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f865a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f865ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f865b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f865b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f865b8:	54000209	b.ls	0xfffff7f865f8  // b.plast
   0x0000fffff7f865bc:	36d8008d	tbz	w13, #27, 0xfffff7f865cc
   0x0000fffff7f865c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f865c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f865c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f865cc:	36d80091	tbz	w17, #27, 0xfffff7f865dc
   0x0000fffff7f865d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f865d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f865d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f865dc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f865e0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f865e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f865e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f865ec:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f865f0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f865f4:	1400000e	b	0xfffff7f8662c
   0x0000fffff7f865f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f865fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86600:	aa1303e1	mov	x1, x19
   0x0000fffff7f86604:	aa1503e2	mov	x2, x21
   0x0000fffff7f86608:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f8660c:	aa1403e4	mov	x4, x20
   0x0000fffff7f86610:	aa1603e5	mov	x5, x22
   0x0000fffff7f86614:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f86618:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8661c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86620:	d63f0200	blr	x16
   0x0000fffff7f86624:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86628:	5400c460	b.eq	0xfffff7f87eb4  // b.none
   0x0000fffff7f8662c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86630:	37d806a9	tbnz	w9, #27, 0xfffff7f86704
   0x0000fffff7f86634:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8663c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86640:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86644:	540001c1	b.ne	0xfffff7f8667c  // b.any
   0x0000fffff7f86648:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8664c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86650:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86654:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86658:	54000121	b.ne	0xfffff7f8667c  // b.any
   0x0000fffff7f8665c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86660:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f86664:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f86668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8666c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86670:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f86674:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86678:	14000030	b	0xfffff7f86738
   0x0000fffff7f8667c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86680:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86688:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8668c:	54000120	b.eq	0xfffff7f866b0  // b.none
   0x0000fffff7f86690:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8669c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f866a0:	54000321	b.ne	0xfffff7f86704  // b.any
   0x0000fffff7f866a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f866a8:	9e620120	scvtf	d0, x9
   0x0000fffff7f866ac:	14000002	b	0xfffff7f866b4
   0x0000fffff7f866b0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f866b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f866b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f866bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f866c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f866c4:	54000120	b.eq	0xfffff7f866e8  // b.none
   0x0000fffff7f866c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f866cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f866d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f866d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f866d8:	54000161	b.ne	0xfffff7f86704  // b.any
   0x0000fffff7f866dc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f866e0:	9e620121	scvtf	d1, x9
   0x0000fffff7f866e4:	14000002	b	0xfffff7f866ec
   0x0000fffff7f866e8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f866ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f866f0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f866f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f866f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f866fc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86700:	17ffffde	b	0xfffff7f86678
   0x0000fffff7f86704:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86708:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8670c:	aa1303e1	mov	x1, x19
   0x0000fffff7f86710:	aa1503e2	mov	x2, x21
   0x0000fffff7f86714:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f86718:	aa1403e4	mov	x4, x20
   0x0000fffff7f8671c:	aa1603e5	mov	x5, x22
   0x0000fffff7f86720:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f86724:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f86728:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8672c:	d63f0200	blr	x16
   0x0000fffff7f86730:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86734:	5400bc40	b.eq	0xfffff7f87ebc  // b.none
   0x0000fffff7f86738:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8673c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f86740:	540004a0	b.eq	0xfffff7f867d4  // b.none
   0x0000fffff7f86744:	b940016d	ldr	w13, [x11]
   0x0000fffff7f86748:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8674c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f86750:	eb0901bf	cmp	x13, x9
   0x0000fffff7f86754:	54000400	b.eq	0xfffff7f867d4  // b.none
   0x0000fffff7f86758:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8675c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f86760:	36d801d1	tbz	w17, #27, 0xfffff7f86798
   0x0000fffff7f86764:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f86768:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8676c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f86770:	54000321	b.ne	0xfffff7f867d4  // b.any
   0x0000fffff7f86774:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f86778:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8677c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f86780:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f86784:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f86788:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8678c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f86790:	f100055f	cmp	x10, #0x1
   0x0000fffff7f86794:	54000209	b.ls	0xfffff7f867d4  // b.plast
   0x0000fffff7f86798:	36d8008d	tbz	w13, #27, 0xfffff7f867a8
   0x0000fffff7f8679c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f867a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f867a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f867a8:	36d80091	tbz	w17, #27, 0xfffff7f867b8
   0x0000fffff7f867ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f867b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f867b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f867b8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f867bc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f867c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f867c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f867c8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f867cc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f867d0:	1400000e	b	0xfffff7f86808
   0x0000fffff7f867d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f867d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f867dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f867e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f867e4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f867e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f867ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f867f0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f867f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f867f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f867fc:	d63f0200	blr	x16
   0x0000fffff7f86800:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86804:	5400b600	b.eq	0xfffff7f87ec4  // b.none
   0x0000fffff7f86808:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8680c:	37d806a9	tbnz	w9, #27, 0xfffff7f868e0
   0x0000fffff7f86810:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86814:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86818:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8681c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86820:	540001c1	b.ne	0xfffff7f86858  // b.any
   0x0000fffff7f86824:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86828:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8682c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86830:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86834:	54000121	b.ne	0xfffff7f86858  // b.any
   0x0000fffff7f86838:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8683c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f86840:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f86844:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86848:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8684c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f86850:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86854:	14000030	b	0xfffff7f86914
   0x0000fffff7f86858:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8685c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86860:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86864:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86868:	54000120	b.eq	0xfffff7f8688c  // b.none
   0x0000fffff7f8686c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86870:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86874:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86878:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8687c:	54000321	b.ne	0xfffff7f868e0  // b.any
   0x0000fffff7f86880:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86884:	9e620120	scvtf	d0, x9
   0x0000fffff7f86888:	14000002	b	0xfffff7f86890
   0x0000fffff7f8688c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f86890:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86894:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8689c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f868a0:	54000120	b.eq	0xfffff7f868c4  // b.none
   0x0000fffff7f868a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f868a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f868ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f868b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f868b4:	54000161	b.ne	0xfffff7f868e0  // b.any
   0x0000fffff7f868b8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f868bc:	9e620121	scvtf	d1, x9
   0x0000fffff7f868c0:	14000002	b	0xfffff7f868c8
   0x0000fffff7f868c4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f868c8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f868cc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f868d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f868d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f868d8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f868dc:	17ffffde	b	0xfffff7f86854
   0x0000fffff7f868e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f868e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f868e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f868ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f868f0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f868f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f868f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f868fc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f86900:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f86904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86908:	d63f0200	blr	x16
   0x0000fffff7f8690c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86910:	5400ade0	b.eq	0xfffff7f87ecc  // b.none
   0x0000fffff7f86914:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f86918:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8691c:	540004a0	b.eq	0xfffff7f869b0  // b.none
   0x0000fffff7f86920:	b940016d	ldr	w13, [x11]
   0x0000fffff7f86924:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f86928:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8692c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f86930:	54000400	b.eq	0xfffff7f869b0  // b.none
   0x0000fffff7f86934:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f86938:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8693c:	36d801d1	tbz	w17, #27, 0xfffff7f86974
   0x0000fffff7f86940:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f86944:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f86948:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8694c:	54000321	b.ne	0xfffff7f869b0  // b.any
   0x0000fffff7f86950:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f86954:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86958:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8695c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f86960:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f86964:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f86968:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8696c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f86970:	54000209	b.ls	0xfffff7f869b0  // b.plast
   0x0000fffff7f86974:	36d8008d	tbz	w13, #27, 0xfffff7f86984
   0x0000fffff7f86978:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8697c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f86980:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f86984:	36d80091	tbz	w17, #27, 0xfffff7f86994
   0x0000fffff7f86988:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8698c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f86990:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f86994:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f86998:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8699c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f869a0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f869a4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f869a8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f869ac:	1400000e	b	0xfffff7f869e4
   0x0000fffff7f869b0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f869b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f869b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f869bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f869c0:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f869c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f869c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f869cc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f869d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f869d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f869d8:	d63f0200	blr	x16
   0x0000fffff7f869dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f869e0:	5400a7a0	b.eq	0xfffff7f87ed4  // b.none
   0x0000fffff7f869e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f869e8:	37d806a9	tbnz	w9, #27, 0xfffff7f86abc
   0x0000fffff7f869ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f869f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f869f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f869f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f869fc:	540001c1	b.ne	0xfffff7f86a34  // b.any
   0x0000fffff7f86a00:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86a04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86a08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86a0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86a10:	54000121	b.ne	0xfffff7f86a34  // b.any
   0x0000fffff7f86a14:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86a18:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f86a1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f86a20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86a24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86a28:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f86a2c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86a30:	14000030	b	0xfffff7f86af0
   0x0000fffff7f86a34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86a38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86a3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86a40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86a44:	54000120	b.eq	0xfffff7f86a68  // b.none
   0x0000fffff7f86a48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86a4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86a50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86a54:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86a58:	54000321	b.ne	0xfffff7f86abc  // b.any
   0x0000fffff7f86a5c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86a60:	9e620120	scvtf	d0, x9
   0x0000fffff7f86a64:	14000002	b	0xfffff7f86a6c
   0x0000fffff7f86a68:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f86a6c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86a70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86a7c:	54000120	b.eq	0xfffff7f86aa0  // b.none
   0x0000fffff7f86a80:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86a84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86a88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86a8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86a90:	54000161	b.ne	0xfffff7f86abc  // b.any
   0x0000fffff7f86a94:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f86a98:	9e620121	scvtf	d1, x9
   0x0000fffff7f86a9c:	14000002	b	0xfffff7f86aa4
   0x0000fffff7f86aa0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f86aa4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f86aa8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f86aac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86ab0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86ab4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86ab8:	17ffffde	b	0xfffff7f86a30
   0x0000fffff7f86abc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86ac0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86ac4:	aa1303e1	mov	x1, x19
   0x0000fffff7f86ac8:	aa1503e2	mov	x2, x21
   0x0000fffff7f86acc:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f86ad0:	aa1403e4	mov	x4, x20
   0x0000fffff7f86ad4:	aa1603e5	mov	x5, x22
   0x0000fffff7f86ad8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f86adc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f86ae0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86ae4:	d63f0200	blr	x16
   0x0000fffff7f86ae8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86aec:	54009f80	b.eq	0xfffff7f87edc  // b.none
   0x0000fffff7f86af0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f86af4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f86af8:	540004a0	b.eq	0xfffff7f86b8c  // b.none
   0x0000fffff7f86afc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f86b00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f86b04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f86b08:	eb0901bf	cmp	x13, x9
   0x0000fffff7f86b0c:	54000400	b.eq	0xfffff7f86b8c  // b.none
   0x0000fffff7f86b10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f86b14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f86b18:	36d801d1	tbz	w17, #27, 0xfffff7f86b50
   0x0000fffff7f86b1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f86b20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f86b24:	f100013f	cmp	x9, #0x0
   0x0000fffff7f86b28:	54000321	b.ne	0xfffff7f86b8c  // b.any
   0x0000fffff7f86b2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f86b30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86b34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f86b38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f86b3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f86b40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f86b44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f86b48:	f100055f	cmp	x10, #0x1
   0x0000fffff7f86b4c:	54000209	b.ls	0xfffff7f86b8c  // b.plast
   0x0000fffff7f86b50:	36d8008d	tbz	w13, #27, 0xfffff7f86b60
   0x0000fffff7f86b54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f86b58:	91000529	add	x9, x9, #0x1
   0x0000fffff7f86b5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f86b60:	36d80091	tbz	w17, #27, 0xfffff7f86b70
   0x0000fffff7f86b64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86b68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f86b6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f86b70:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f86b74:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f86b78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f86b7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f86b80:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f86b84:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f86b88:	1400000e	b	0xfffff7f86bc0
   0x0000fffff7f86b8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86b90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86b94:	aa1303e1	mov	x1, x19
   0x0000fffff7f86b98:	aa1503e2	mov	x2, x21
   0x0000fffff7f86b9c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f86ba0:	aa1403e4	mov	x4, x20
   0x0000fffff7f86ba4:	aa1603e5	mov	x5, x22
   0x0000fffff7f86ba8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f86bac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86bb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86bb4:	d63f0200	blr	x16
   0x0000fffff7f86bb8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86bbc:	54009940	b.eq	0xfffff7f87ee4  // b.none
   0x0000fffff7f86bc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86bc4:	37d806a9	tbnz	w9, #27, 0xfffff7f86c98
   0x0000fffff7f86bc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86bcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86bd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86bd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86bd8:	540001c1	b.ne	0xfffff7f86c10  // b.any
   0x0000fffff7f86bdc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86be0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86be4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86be8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86bec:	54000121	b.ne	0xfffff7f86c10  // b.any
   0x0000fffff7f86bf0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86bf4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f86bf8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f86bfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86c00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86c04:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f86c08:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86c0c:	14000030	b	0xfffff7f86ccc
   0x0000fffff7f86c10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86c14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86c18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86c1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86c20:	54000120	b.eq	0xfffff7f86c44  // b.none
   0x0000fffff7f86c24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86c28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86c2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86c30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86c34:	54000321	b.ne	0xfffff7f86c98  // b.any
   0x0000fffff7f86c38:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86c3c:	9e620120	scvtf	d0, x9
   0x0000fffff7f86c40:	14000002	b	0xfffff7f86c48
   0x0000fffff7f86c44:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f86c48:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86c4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86c50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86c54:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86c58:	54000120	b.eq	0xfffff7f86c7c  // b.none
   0x0000fffff7f86c5c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86c60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86c64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86c68:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86c6c:	54000161	b.ne	0xfffff7f86c98  // b.any
   0x0000fffff7f86c70:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f86c74:	9e620121	scvtf	d1, x9
   0x0000fffff7f86c78:	14000002	b	0xfffff7f86c80
   0x0000fffff7f86c7c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f86c80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f86c84:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f86c88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86c90:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86c94:	17ffffde	b	0xfffff7f86c0c
   0x0000fffff7f86c98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86c9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86ca0:	aa1303e1	mov	x1, x19
   0x0000fffff7f86ca4:	aa1503e2	mov	x2, x21
   0x0000fffff7f86ca8:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f86cac:	aa1403e4	mov	x4, x20
   0x0000fffff7f86cb0:	aa1603e5	mov	x5, x22
   0x0000fffff7f86cb4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f86cb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f86cbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86cc0:	d63f0200	blr	x16
   0x0000fffff7f86cc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86cc8:	54009120	b.eq	0xfffff7f87eec  // b.none
   0x0000fffff7f86ccc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f86cd0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f86cd4:	540004a0	b.eq	0xfffff7f86d68  // b.none
   0x0000fffff7f86cd8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f86cdc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f86ce0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f86ce4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f86ce8:	54000400	b.eq	0xfffff7f86d68  // b.none
   0x0000fffff7f86cec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f86cf0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f86cf4:	36d801d1	tbz	w17, #27, 0xfffff7f86d2c
   0x0000fffff7f86cf8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f86cfc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f86d00:	f100013f	cmp	x9, #0x0
   0x0000fffff7f86d04:	54000321	b.ne	0xfffff7f86d68  // b.any
   0x0000fffff7f86d08:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f86d0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86d10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f86d14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f86d18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f86d1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f86d20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f86d24:	f100055f	cmp	x10, #0x1
   0x0000fffff7f86d28:	54000209	b.ls	0xfffff7f86d68  // b.plast
   0x0000fffff7f86d2c:	36d8008d	tbz	w13, #27, 0xfffff7f86d3c
   0x0000fffff7f86d30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f86d34:	91000529	add	x9, x9, #0x1
   0x0000fffff7f86d38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f86d3c:	36d80091	tbz	w17, #27, 0xfffff7f86d4c
   0x0000fffff7f86d40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86d44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f86d48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f86d4c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f86d50:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f86d54:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f86d58:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f86d5c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f86d60:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f86d64:	1400000e	b	0xfffff7f86d9c
   0x0000fffff7f86d68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86d6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86d70:	aa1303e1	mov	x1, x19
   0x0000fffff7f86d74:	aa1503e2	mov	x2, x21
   0x0000fffff7f86d78:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f86d7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f86d80:	aa1603e5	mov	x5, x22
   0x0000fffff7f86d84:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f86d88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86d8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86d90:	d63f0200	blr	x16
   0x0000fffff7f86d94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86d98:	54008ae0	b.eq	0xfffff7f87ef4  // b.none
   0x0000fffff7f86d9c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86da0:	37d806a9	tbnz	w9, #27, 0xfffff7f86e74
   0x0000fffff7f86da4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86da8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86dac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86db0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86db4:	540001c1	b.ne	0xfffff7f86dec  // b.any
   0x0000fffff7f86db8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86dbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86dc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86dc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86dc8:	54000121	b.ne	0xfffff7f86dec  // b.any
   0x0000fffff7f86dcc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86dd0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f86dd4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f86dd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86ddc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86de0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f86de4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86de8:	14000030	b	0xfffff7f86ea8
   0x0000fffff7f86dec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86df0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86df4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86df8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86dfc:	54000120	b.eq	0xfffff7f86e20  // b.none
   0x0000fffff7f86e00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86e04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86e08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86e0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86e10:	54000321	b.ne	0xfffff7f86e74  // b.any
   0x0000fffff7f86e14:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86e18:	9e620120	scvtf	d0, x9
   0x0000fffff7f86e1c:	14000002	b	0xfffff7f86e24
   0x0000fffff7f86e20:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f86e24:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86e28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86e2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86e30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86e34:	54000120	b.eq	0xfffff7f86e58  // b.none
   0x0000fffff7f86e38:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86e3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86e40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86e44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86e48:	54000161	b.ne	0xfffff7f86e74  // b.any
   0x0000fffff7f86e4c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f86e50:	9e620121	scvtf	d1, x9
   0x0000fffff7f86e54:	14000002	b	0xfffff7f86e5c
   0x0000fffff7f86e58:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f86e5c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f86e60:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f86e64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86e68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86e6c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86e70:	17ffffde	b	0xfffff7f86de8
   0x0000fffff7f86e74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f86e78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86e7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f86e80:	aa1503e2	mov	x2, x21
   0x0000fffff7f86e84:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f86e88:	aa1403e4	mov	x4, x20
   0x0000fffff7f86e8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f86e90:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f86e94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f86e98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86e9c:	d63f0200	blr	x16
   0x0000fffff7f86ea0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86ea4:	540082c0	b.eq	0xfffff7f87efc  // b.none
   0x0000fffff7f86ea8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f86eac:	f100017f	cmp	x11, #0x0
   0x0000fffff7f86eb0:	540004a0	b.eq	0xfffff7f86f44  // b.none
   0x0000fffff7f86eb4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f86eb8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f86ebc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f86ec0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f86ec4:	54000400	b.eq	0xfffff7f86f44  // b.none
   0x0000fffff7f86ec8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f86ecc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f86ed0:	36d801d1	tbz	w17, #27, 0xfffff7f86f08
   0x0000fffff7f86ed4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f86ed8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f86edc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f86ee0:	54000321	b.ne	0xfffff7f86f44  // b.any
   0x0000fffff7f86ee4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f86ee8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86eec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f86ef0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f86ef4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f86ef8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f86efc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f86f00:	f100055f	cmp	x10, #0x1
   0x0000fffff7f86f04:	54000209	b.ls	0xfffff7f86f44  // b.plast
   0x0000fffff7f86f08:	36d8008d	tbz	w13, #27, 0xfffff7f86f18
   0x0000fffff7f86f0c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f86f10:	91000529	add	x9, x9, #0x1
   0x0000fffff7f86f14:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f86f18:	36d80091	tbz	w17, #27, 0xfffff7f86f28
   0x0000fffff7f86f1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f86f20:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f86f24:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f86f28:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f86f2c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f86f30:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f86f34:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f86f38:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f86f3c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f86f40:	1400000e	b	0xfffff7f86f78
   0x0000fffff7f86f44:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f86f48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f86f4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f86f50:	aa1503e2	mov	x2, x21
   0x0000fffff7f86f54:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f86f58:	aa1403e4	mov	x4, x20
   0x0000fffff7f86f5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f86f60:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f86f64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f86f68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f86f6c:	d63f0200	blr	x16
   0x0000fffff7f86f70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f86f74:	54007c80	b.eq	0xfffff7f87f04  // b.none
   0x0000fffff7f86f78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86f7c:	37d806a9	tbnz	w9, #27, 0xfffff7f87050
   0x0000fffff7f86f80:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86f84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86f88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86f8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86f90:	540001c1	b.ne	0xfffff7f86fc8  // b.any
   0x0000fffff7f86f94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f86f98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86f9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86fa0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86fa4:	54000121	b.ne	0xfffff7f86fc8  // b.any
   0x0000fffff7f86fa8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86fac:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f86fb0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f86fb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86fb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86fbc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f86fc0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f86fc4:	14000030	b	0xfffff7f87084
   0x0000fffff7f86fc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86fcc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f86fd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86fd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86fd8:	54000120	b.eq	0xfffff7f86ffc  // b.none
   0x0000fffff7f86fdc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f86fe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f86fe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f86fe8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f86fec:	54000321	b.ne	0xfffff7f87050  // b.any
   0x0000fffff7f86ff0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f86ff4:	9e620120	scvtf	d0, x9
   0x0000fffff7f86ff8:	14000002	b	0xfffff7f87000
   0x0000fffff7f86ffc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f87000:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87004:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8700c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87010:	54000120	b.eq	0xfffff7f87034  // b.none
   0x0000fffff7f87014:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87018:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8701c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87020:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87024:	54000161	b.ne	0xfffff7f87050  // b.any
   0x0000fffff7f87028:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8702c:	9e620121	scvtf	d1, x9
   0x0000fffff7f87030:	14000002	b	0xfffff7f87038
   0x0000fffff7f87034:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f87038:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8703c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f87040:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87044:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87048:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8704c:	17ffffde	b	0xfffff7f86fc4
   0x0000fffff7f87050:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f87054:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87058:	aa1303e1	mov	x1, x19
   0x0000fffff7f8705c:	aa1503e2	mov	x2, x21
   0x0000fffff7f87060:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f87064:	aa1403e4	mov	x4, x20
   0x0000fffff7f87068:	aa1603e5	mov	x5, x22
   0x0000fffff7f8706c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f87070:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f87074:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87078:	d63f0200	blr	x16
   0x0000fffff7f8707c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87080:	54007460	b.eq	0xfffff7f87f0c  // b.none
   0x0000fffff7f87084:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f87088:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8708c:	540004a0	b.eq	0xfffff7f87120  // b.none
   0x0000fffff7f87090:	b940016d	ldr	w13, [x11]
   0x0000fffff7f87094:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f87098:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8709c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f870a0:	54000400	b.eq	0xfffff7f87120  // b.none
   0x0000fffff7f870a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f870a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f870ac:	36d801d1	tbz	w17, #27, 0xfffff7f870e4
   0x0000fffff7f870b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f870b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f870b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f870bc:	54000321	b.ne	0xfffff7f87120  // b.any
   0x0000fffff7f870c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f870c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f870c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f870cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f870d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f870d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f870d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f870dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f870e0:	54000209	b.ls	0xfffff7f87120  // b.plast
   0x0000fffff7f870e4:	36d8008d	tbz	w13, #27, 0xfffff7f870f4
   0x0000fffff7f870e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f870ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7f870f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f870f4:	36d80091	tbz	w17, #27, 0xfffff7f87104
   0x0000fffff7f870f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f870fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f87100:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f87104:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f87108:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8710c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f87110:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f87114:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f87118:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8711c:	1400000e	b	0xfffff7f87154
   0x0000fffff7f87120:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f87124:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87128:	aa1303e1	mov	x1, x19
   0x0000fffff7f8712c:	aa1503e2	mov	x2, x21
   0x0000fffff7f87130:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f87134:	aa1403e4	mov	x4, x20
   0x0000fffff7f87138:	aa1603e5	mov	x5, x22
   0x0000fffff7f8713c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f87140:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f87144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87148:	d63f0200	blr	x16
   0x0000fffff7f8714c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87150:	54006e20	b.eq	0xfffff7f87f14  // b.none
   0x0000fffff7f87154:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87158:	37d806a9	tbnz	w9, #27, 0xfffff7f8722c
   0x0000fffff7f8715c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87160:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87164:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87168:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8716c:	540001c1	b.ne	0xfffff7f871a4  // b.any
   0x0000fffff7f87170:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87174:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87178:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8717c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87180:	54000121	b.ne	0xfffff7f871a4  // b.any
   0x0000fffff7f87184:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87188:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8718c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f87190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87198:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8719c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f871a0:	14000030	b	0xfffff7f87260
   0x0000fffff7f871a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f871a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f871ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f871b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f871b4:	54000120	b.eq	0xfffff7f871d8  // b.none
   0x0000fffff7f871b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f871bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f871c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f871c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f871c8:	54000321	b.ne	0xfffff7f8722c  // b.any
   0x0000fffff7f871cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f871d0:	9e620120	scvtf	d0, x9
   0x0000fffff7f871d4:	14000002	b	0xfffff7f871dc
   0x0000fffff7f871d8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f871dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f871e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f871e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f871e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f871ec:	54000120	b.eq	0xfffff7f87210  // b.none
   0x0000fffff7f871f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f871f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f871f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f871fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87200:	54000161	b.ne	0xfffff7f8722c  // b.any
   0x0000fffff7f87204:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f87208:	9e620121	scvtf	d1, x9
   0x0000fffff7f8720c:	14000002	b	0xfffff7f87214
   0x0000fffff7f87210:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f87214:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f87218:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8721c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87220:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87224:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87228:	17ffffde	b	0xfffff7f871a0
   0x0000fffff7f8722c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f87230:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87234:	aa1303e1	mov	x1, x19
   0x0000fffff7f87238:	aa1503e2	mov	x2, x21
   0x0000fffff7f8723c:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f87240:	aa1403e4	mov	x4, x20
   0x0000fffff7f87244:	aa1603e5	mov	x5, x22
   0x0000fffff7f87248:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8724c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f87250:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87254:	d63f0200	blr	x16
   0x0000fffff7f87258:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8725c:	54006600	b.eq	0xfffff7f87f1c  // b.none
   0x0000fffff7f87260:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f87264:	f100017f	cmp	x11, #0x0
   0x0000fffff7f87268:	540004a0	b.eq	0xfffff7f872fc  // b.none
   0x0000fffff7f8726c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f87270:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f87274:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f87278:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8727c:	54000400	b.eq	0xfffff7f872fc  // b.none
   0x0000fffff7f87280:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f87284:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f87288:	36d801d1	tbz	w17, #27, 0xfffff7f872c0
   0x0000fffff7f8728c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f87290:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f87294:	f100013f	cmp	x9, #0x0
   0x0000fffff7f87298:	54000321	b.ne	0xfffff7f872fc  // b.any
   0x0000fffff7f8729c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f872a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f872a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f872a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f872ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f872b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f872b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f872b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f872bc:	54000209	b.ls	0xfffff7f872fc  // b.plast
   0x0000fffff7f872c0:	36d8008d	tbz	w13, #27, 0xfffff7f872d0
   0x0000fffff7f872c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f872c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f872cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f872d0:	36d80091	tbz	w17, #27, 0xfffff7f872e0
   0x0000fffff7f872d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f872d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f872dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f872e0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f872e4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f872e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f872ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f872f0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f872f4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f872f8:	1400000e	b	0xfffff7f87330
   0x0000fffff7f872fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f87300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87304:	aa1303e1	mov	x1, x19
   0x0000fffff7f87308:	aa1503e2	mov	x2, x21
   0x0000fffff7f8730c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f87310:	aa1403e4	mov	x4, x20
   0x0000fffff7f87314:	aa1603e5	mov	x5, x22
   0x0000fffff7f87318:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8731c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f87320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87324:	d63f0200	blr	x16
   0x0000fffff7f87328:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8732c:	54005fc0	b.eq	0xfffff7f87f24  // b.none
   0x0000fffff7f87330:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87334:	37d806a9	tbnz	w9, #27, 0xfffff7f87408
   0x0000fffff7f87338:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8733c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87344:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87348:	540001c1	b.ne	0xfffff7f87380  // b.any
   0x0000fffff7f8734c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87350:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87354:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87358:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8735c:	54000121	b.ne	0xfffff7f87380  // b.any
   0x0000fffff7f87360:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87364:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f87368:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8736c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87374:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f87378:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8737c:	14000030	b	0xfffff7f8743c
   0x0000fffff7f87380:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87384:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87388:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8738c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87390:	54000120	b.eq	0xfffff7f873b4  // b.none
   0x0000fffff7f87394:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87398:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8739c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f873a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f873a4:	54000321	b.ne	0xfffff7f87408  // b.any
   0x0000fffff7f873a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f873ac:	9e620120	scvtf	d0, x9
   0x0000fffff7f873b0:	14000002	b	0xfffff7f873b8
   0x0000fffff7f873b4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f873b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f873bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f873c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f873c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f873c8:	54000120	b.eq	0xfffff7f873ec  // b.none
   0x0000fffff7f873cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f873d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f873d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f873d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f873dc:	54000161	b.ne	0xfffff7f87408  // b.any
   0x0000fffff7f873e0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f873e4:	9e620121	scvtf	d1, x9
   0x0000fffff7f873e8:	14000002	b	0xfffff7f873f0
   0x0000fffff7f873ec:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f873f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f873f4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f873f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f873fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87400:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87404:	17ffffde	b	0xfffff7f8737c
   0x0000fffff7f87408:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8740c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87410:	aa1303e1	mov	x1, x19
   0x0000fffff7f87414:	aa1503e2	mov	x2, x21
   0x0000fffff7f87418:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f8741c:	aa1403e4	mov	x4, x20
   0x0000fffff7f87420:	aa1603e5	mov	x5, x22
   0x0000fffff7f87424:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f87428:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8742c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87430:	d63f0200	blr	x16
   0x0000fffff7f87434:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87438:	540057a0	b.eq	0xfffff7f87f2c  // b.none
   0x0000fffff7f8743c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f87440:	f100017f	cmp	x11, #0x0
   0x0000fffff7f87444:	540004a0	b.eq	0xfffff7f874d8  // b.none
   0x0000fffff7f87448:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8744c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f87450:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f87454:	eb0901bf	cmp	x13, x9
   0x0000fffff7f87458:	54000400	b.eq	0xfffff7f874d8  // b.none
   0x0000fffff7f8745c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f87460:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f87464:	36d801d1	tbz	w17, #27, 0xfffff7f8749c
   0x0000fffff7f87468:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8746c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f87470:	f100013f	cmp	x9, #0x0
   0x0000fffff7f87474:	54000321	b.ne	0xfffff7f874d8  // b.any
   0x0000fffff7f87478:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8747c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f87480:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f87484:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f87488:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8748c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f87490:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f87494:	f100055f	cmp	x10, #0x1
   0x0000fffff7f87498:	54000209	b.ls	0xfffff7f874d8  // b.plast
   0x0000fffff7f8749c:	36d8008d	tbz	w13, #27, 0xfffff7f874ac
   0x0000fffff7f874a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f874a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f874a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f874ac:	36d80091	tbz	w17, #27, 0xfffff7f874bc
   0x0000fffff7f874b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f874b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f874b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f874bc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f874c0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f874c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f874c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f874cc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f874d0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f874d4:	1400000e	b	0xfffff7f8750c
   0x0000fffff7f874d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f874dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f874e0:	aa1303e1	mov	x1, x19
   0x0000fffff7f874e4:	aa1503e2	mov	x2, x21
   0x0000fffff7f874e8:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f874ec:	aa1403e4	mov	x4, x20
   0x0000fffff7f874f0:	aa1603e5	mov	x5, x22
   0x0000fffff7f874f4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f874f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f874fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87500:	d63f0200	blr	x16
   0x0000fffff7f87504:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87508:	54005160	b.eq	0xfffff7f87f34  // b.none
   0x0000fffff7f8750c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87510:	37d806a9	tbnz	w9, #27, 0xfffff7f875e4
   0x0000fffff7f87514:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87518:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8751c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87520:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87524:	540001c1	b.ne	0xfffff7f8755c  // b.any
   0x0000fffff7f87528:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8752c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87530:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87534:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87538:	54000121	b.ne	0xfffff7f8755c  // b.any
   0x0000fffff7f8753c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87540:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f87544:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f87548:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8754c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87550:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f87554:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87558:	14000030	b	0xfffff7f87618
   0x0000fffff7f8755c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87560:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87568:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8756c:	54000120	b.eq	0xfffff7f87590  // b.none
   0x0000fffff7f87570:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87574:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87578:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8757c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87580:	54000321	b.ne	0xfffff7f875e4  // b.any
   0x0000fffff7f87584:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87588:	9e620120	scvtf	d0, x9
   0x0000fffff7f8758c:	14000002	b	0xfffff7f87594
   0x0000fffff7f87590:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f87594:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87598:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8759c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f875a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f875a4:	54000120	b.eq	0xfffff7f875c8  // b.none
   0x0000fffff7f875a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f875ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f875b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f875b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f875b8:	54000161	b.ne	0xfffff7f875e4  // b.any
   0x0000fffff7f875bc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f875c0:	9e620121	scvtf	d1, x9
   0x0000fffff7f875c4:	14000002	b	0xfffff7f875cc
   0x0000fffff7f875c8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f875cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f875d0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f875d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f875d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f875dc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f875e0:	17ffffde	b	0xfffff7f87558
   0x0000fffff7f875e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f875e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f875ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f875f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f875f4:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f875f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f875fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f87600:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f87604:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f87608:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8760c:	d63f0200	blr	x16
   0x0000fffff7f87610:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87614:	54004940	b.eq	0xfffff7f87f3c  // b.none
   0x0000fffff7f87618:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8761c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f87620:	540004a0	b.eq	0xfffff7f876b4  // b.none
   0x0000fffff7f87624:	b940016d	ldr	w13, [x11]
   0x0000fffff7f87628:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8762c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f87630:	eb0901bf	cmp	x13, x9
   0x0000fffff7f87634:	54000400	b.eq	0xfffff7f876b4  // b.none
   0x0000fffff7f87638:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8763c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f87640:	36d801d1	tbz	w17, #27, 0xfffff7f87678
   0x0000fffff7f87644:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f87648:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8764c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f87650:	54000321	b.ne	0xfffff7f876b4  // b.any
   0x0000fffff7f87654:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f87658:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8765c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f87660:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f87664:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f87668:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8766c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f87670:	f100055f	cmp	x10, #0x1
   0x0000fffff7f87674:	54000209	b.ls	0xfffff7f876b4  // b.plast
   0x0000fffff7f87678:	36d8008d	tbz	w13, #27, 0xfffff7f87688
   0x0000fffff7f8767c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f87680:	91000529	add	x9, x9, #0x1
   0x0000fffff7f87684:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f87688:	36d80091	tbz	w17, #27, 0xfffff7f87698
   0x0000fffff7f8768c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f87690:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f87694:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f87698:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8769c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f876a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f876a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f876a8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f876ac:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f876b0:	1400000e	b	0xfffff7f876e8
   0x0000fffff7f876b4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f876b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f876bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f876c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f876c4:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f876c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f876cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f876d0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f876d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f876d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f876dc:	d63f0200	blr	x16
   0x0000fffff7f876e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f876e4:	54004300	b.eq	0xfffff7f87f44  // b.none
   0x0000fffff7f876e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f876ec:	37d806a9	tbnz	w9, #27, 0xfffff7f877c0
   0x0000fffff7f876f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f876f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f876f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f876fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87700:	540001c1	b.ne	0xfffff7f87738  // b.any
   0x0000fffff7f87704:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87708:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8770c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87710:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87714:	54000121	b.ne	0xfffff7f87738  // b.any
   0x0000fffff7f87718:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8771c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f87720:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f87724:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87728:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8772c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f87730:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87734:	14000030	b	0xfffff7f877f4
   0x0000fffff7f87738:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8773c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87740:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87744:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87748:	54000120	b.eq	0xfffff7f8776c  // b.none
   0x0000fffff7f8774c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87750:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87754:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87758:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8775c:	54000321	b.ne	0xfffff7f877c0  // b.any
   0x0000fffff7f87760:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87764:	9e620120	scvtf	d0, x9
   0x0000fffff7f87768:	14000002	b	0xfffff7f87770
   0x0000fffff7f8776c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f87770:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87774:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87778:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8777c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87780:	54000120	b.eq	0xfffff7f877a4  // b.none
   0x0000fffff7f87784:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87788:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8778c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87790:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87794:	54000161	b.ne	0xfffff7f877c0  // b.any
   0x0000fffff7f87798:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8779c:	9e620121	scvtf	d1, x9
   0x0000fffff7f877a0:	14000002	b	0xfffff7f877a8
   0x0000fffff7f877a4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f877a8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f877ac:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f877b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f877b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f877b8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f877bc:	17ffffde	b	0xfffff7f87734
   0x0000fffff7f877c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f877c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f877c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f877cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f877d0:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f877d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f877d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f877dc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f877e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f877e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f877e8:	d63f0200	blr	x16
   0x0000fffff7f877ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f877f0:	54003ae0	b.eq	0xfffff7f87f4c  // b.none
   0x0000fffff7f877f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f877f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f877fc:	540004a0	b.eq	0xfffff7f87890  // b.none
   0x0000fffff7f87800:	b940016d	ldr	w13, [x11]
   0x0000fffff7f87804:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f87808:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8780c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f87810:	54000400	b.eq	0xfffff7f87890  // b.none
   0x0000fffff7f87814:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f87818:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8781c:	36d801d1	tbz	w17, #27, 0xfffff7f87854
   0x0000fffff7f87820:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f87824:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f87828:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8782c:	54000321	b.ne	0xfffff7f87890  // b.any
   0x0000fffff7f87830:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f87834:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f87838:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8783c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f87840:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f87844:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f87848:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8784c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f87850:	54000209	b.ls	0xfffff7f87890  // b.plast
   0x0000fffff7f87854:	36d8008d	tbz	w13, #27, 0xfffff7f87864
   0x0000fffff7f87858:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8785c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f87860:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f87864:	36d80091	tbz	w17, #27, 0xfffff7f87874
   0x0000fffff7f87868:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8786c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f87870:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f87874:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f87878:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8787c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f87880:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f87884:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f87888:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8788c:	1400000e	b	0xfffff7f878c4
   0x0000fffff7f87890:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f87894:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87898:	aa1303e1	mov	x1, x19
   0x0000fffff7f8789c:	aa1503e2	mov	x2, x21
   0x0000fffff7f878a0:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f878a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f878a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f878ac:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f878b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f878b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f878b8:	d63f0200	blr	x16
   0x0000fffff7f878bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f878c0:	540034a0	b.eq	0xfffff7f87f54  // b.none
   0x0000fffff7f878c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f878c8:	37d806a9	tbnz	w9, #27, 0xfffff7f8799c
   0x0000fffff7f878cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f878d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f878d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f878d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f878dc:	540001c1	b.ne	0xfffff7f87914  // b.any
   0x0000fffff7f878e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f878e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f878e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f878ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f878f0:	54000121	b.ne	0xfffff7f87914  // b.any
   0x0000fffff7f878f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f878f8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f878fc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f87900:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87904:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87908:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8790c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87910:	14000030	b	0xfffff7f879d0
   0x0000fffff7f87914:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87918:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8791c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87920:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87924:	54000120	b.eq	0xfffff7f87948  // b.none
   0x0000fffff7f87928:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8792c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87934:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87938:	54000321	b.ne	0xfffff7f8799c  // b.any
   0x0000fffff7f8793c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87940:	9e620120	scvtf	d0, x9
   0x0000fffff7f87944:	14000002	b	0xfffff7f8794c
   0x0000fffff7f87948:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8794c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87950:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87958:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8795c:	54000120	b.eq	0xfffff7f87980  // b.none
   0x0000fffff7f87960:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8796c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87970:	54000161	b.ne	0xfffff7f8799c  // b.any
   0x0000fffff7f87974:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f87978:	9e620121	scvtf	d1, x9
   0x0000fffff7f8797c:	14000002	b	0xfffff7f87984
   0x0000fffff7f87980:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f87984:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f87988:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8798c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87994:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87998:	17ffffde	b	0xfffff7f87910
   0x0000fffff7f8799c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f879a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f879a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f879a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f879ac:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f879b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f879b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f879b8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f879bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f879c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f879c4:	d63f0200	blr	x16
   0x0000fffff7f879c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f879cc:	54002c80	b.eq	0xfffff7f87f5c  // b.none
   0x0000fffff7f879d0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f879d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f879d8:	540004a0	b.eq	0xfffff7f87a6c  // b.none
   0x0000fffff7f879dc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f879e0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f879e4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f879e8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f879ec:	54000400	b.eq	0xfffff7f87a6c  // b.none
   0x0000fffff7f879f0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f879f4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f879f8:	36d801d1	tbz	w17, #27, 0xfffff7f87a30
   0x0000fffff7f879fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f87a00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f87a04:	f100013f	cmp	x9, #0x0
   0x0000fffff7f87a08:	54000321	b.ne	0xfffff7f87a6c  // b.any
   0x0000fffff7f87a0c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f87a10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f87a14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f87a18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f87a1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f87a20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f87a24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f87a28:	f100055f	cmp	x10, #0x1
   0x0000fffff7f87a2c:	54000209	b.ls	0xfffff7f87a6c  // b.plast
   0x0000fffff7f87a30:	36d8008d	tbz	w13, #27, 0xfffff7f87a40
   0x0000fffff7f87a34:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f87a38:	91000529	add	x9, x9, #0x1
   0x0000fffff7f87a3c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f87a40:	36d80091	tbz	w17, #27, 0xfffff7f87a50
   0x0000fffff7f87a44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f87a48:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f87a4c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f87a50:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f87a54:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f87a58:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f87a5c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f87a60:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f87a64:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f87a68:	1400000e	b	0xfffff7f87aa0
   0x0000fffff7f87a6c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f87a70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87a74:	aa1303e1	mov	x1, x19
   0x0000fffff7f87a78:	aa1503e2	mov	x2, x21
   0x0000fffff7f87a7c:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f87a80:	aa1403e4	mov	x4, x20
   0x0000fffff7f87a84:	aa1603e5	mov	x5, x22
   0x0000fffff7f87a88:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f87a8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f87a90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87a94:	d63f0200	blr	x16
   0x0000fffff7f87a98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87a9c:	54002640	b.eq	0xfffff7f87f64  // b.none
   0x0000fffff7f87aa0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87aa4:	37d806a9	tbnz	w9, #27, 0xfffff7f87b78
   0x0000fffff7f87aa8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87aac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87ab0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87ab4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87ab8:	540001c1	b.ne	0xfffff7f87af0  // b.any
   0x0000fffff7f87abc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87ac0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87ac4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87ac8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87acc:	54000121	b.ne	0xfffff7f87af0  // b.any
   0x0000fffff7f87ad0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87ad4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f87ad8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f87adc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87ae0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87ae4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f87ae8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87aec:	14000030	b	0xfffff7f87bac
   0x0000fffff7f87af0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87af4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87af8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87afc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87b00:	54000120	b.eq	0xfffff7f87b24  // b.none
   0x0000fffff7f87b04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87b08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87b0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87b10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87b14:	54000321	b.ne	0xfffff7f87b78  // b.any
   0x0000fffff7f87b18:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87b1c:	9e620120	scvtf	d0, x9
   0x0000fffff7f87b20:	14000002	b	0xfffff7f87b28
   0x0000fffff7f87b24:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f87b28:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87b2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87b30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87b34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87b38:	54000120	b.eq	0xfffff7f87b5c  // b.none
   0x0000fffff7f87b3c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87b40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87b44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87b48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87b4c:	54000161	b.ne	0xfffff7f87b78  // b.any
   0x0000fffff7f87b50:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f87b54:	9e620121	scvtf	d1, x9
   0x0000fffff7f87b58:	14000002	b	0xfffff7f87b60
   0x0000fffff7f87b5c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f87b60:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f87b64:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f87b68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87b6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87b70:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87b74:	17ffffde	b	0xfffff7f87aec
   0x0000fffff7f87b78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f87b7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87b80:	aa1303e1	mov	x1, x19
   0x0000fffff7f87b84:	aa1503e2	mov	x2, x21
   0x0000fffff7f87b88:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f87b8c:	aa1403e4	mov	x4, x20
   0x0000fffff7f87b90:	aa1603e5	mov	x5, x22
   0x0000fffff7f87b94:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f87b98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f87b9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87ba0:	d63f0200	blr	x16
   0x0000fffff7f87ba4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87ba8:	54001e20	b.eq	0xfffff7f87f6c  // b.none
   0x0000fffff7f87bac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f87bb0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f87bb4:	540004a0	b.eq	0xfffff7f87c48  // b.none
   0x0000fffff7f87bb8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f87bbc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f87bc0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f87bc4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f87bc8:	54000400	b.eq	0xfffff7f87c48  // b.none
   0x0000fffff7f87bcc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f87bd0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f87bd4:	36d801d1	tbz	w17, #27, 0xfffff7f87c0c
   0x0000fffff7f87bd8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f87bdc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f87be0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f87be4:	54000321	b.ne	0xfffff7f87c48  // b.any
   0x0000fffff7f87be8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f87bec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f87bf0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f87bf4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f87bf8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f87bfc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f87c00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f87c04:	f100055f	cmp	x10, #0x1
   0x0000fffff7f87c08:	54000209	b.ls	0xfffff7f87c48  // b.plast
   0x0000fffff7f87c0c:	36d8008d	tbz	w13, #27, 0xfffff7f87c1c
   0x0000fffff7f87c10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f87c14:	91000529	add	x9, x9, #0x1
   0x0000fffff7f87c18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f87c1c:	36d80091	tbz	w17, #27, 0xfffff7f87c2c
   0x0000fffff7f87c20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f87c24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f87c28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f87c2c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f87c30:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f87c34:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f87c38:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f87c3c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f87c40:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f87c44:	1400000e	b	0xfffff7f87c7c
   0x0000fffff7f87c48:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f87c4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87c50:	aa1303e1	mov	x1, x19
   0x0000fffff7f87c54:	aa1503e2	mov	x2, x21
   0x0000fffff7f87c58:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f87c5c:	aa1403e4	mov	x4, x20
   0x0000fffff7f87c60:	aa1603e5	mov	x5, x22
   0x0000fffff7f87c64:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f87c68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f87c6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87c70:	d63f0200	blr	x16
   0x0000fffff7f87c74:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87c78:	540017e0	b.eq	0xfffff7f87f74  // b.none
   0x0000fffff7f87c7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87c80:	37d806a9	tbnz	w9, #27, 0xfffff7f87d54
   0x0000fffff7f87c84:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87c88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87c90:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87c94:	540001c1	b.ne	0xfffff7f87ccc  // b.any
   0x0000fffff7f87c98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87c9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87ca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87ca4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87ca8:	54000121	b.ne	0xfffff7f87ccc  // b.any
   0x0000fffff7f87cac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87cb0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f87cb4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f87cb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87cbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87cc0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f87cc4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87cc8:	14000030	b	0xfffff7f87d88
   0x0000fffff7f87ccc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87cd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87cd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87cd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87cdc:	54000120	b.eq	0xfffff7f87d00  // b.none
   0x0000fffff7f87ce0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f87ce4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87ce8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87cec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87cf0:	54000321	b.ne	0xfffff7f87d54  // b.any
   0x0000fffff7f87cf4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f87cf8:	9e620120	scvtf	d0, x9
   0x0000fffff7f87cfc:	14000002	b	0xfffff7f87d04
   0x0000fffff7f87d00:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f87d04:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87d08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87d0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87d10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87d14:	54000120	b.eq	0xfffff7f87d38  // b.none
   0x0000fffff7f87d18:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87d1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87d20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87d24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87d28:	54000161	b.ne	0xfffff7f87d54  // b.any
   0x0000fffff7f87d2c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f87d30:	9e620121	scvtf	d1, x9
   0x0000fffff7f87d34:	14000002	b	0xfffff7f87d3c
   0x0000fffff7f87d38:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f87d3c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f87d40:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f87d44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f87d48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87d4c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f87d50:	17ffffde	b	0xfffff7f87cc8
   0x0000fffff7f87d54:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f87d58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87d5c:	aa1303e1	mov	x1, x19
   0x0000fffff7f87d60:	aa1503e2	mov	x2, x21
   0x0000fffff7f87d64:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f87d68:	aa1403e4	mov	x4, x20
   0x0000fffff7f87d6c:	aa1603e5	mov	x5, x22
   0x0000fffff7f87d70:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f87d74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f87d78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87d7c:	d63f0200	blr	x16
   0x0000fffff7f87d80:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87d84:	54000fc0	b.eq	0xfffff7f87f7c  // b.none
   0x0000fffff7f87d88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f87d8c:	37d80269	tbnz	w9, #27, 0xfffff7f87dd8
   0x0000fffff7f87d90:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f87d94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87d98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87d9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f87da0:	540001c1	b.ne	0xfffff7f87dd8  // b.any
   0x0000fffff7f87da4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f87da8:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f87dac:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f87db0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f87db4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87db8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87dbc:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f87dc0:	aa0b03e9	mov	x9, x11
   0x0000fffff7f87dc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87dc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87dcc:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f87dd0:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f87dd4:	1400000e	b	0xfffff7f87e0c
   0x0000fffff7f87dd8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f87ddc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87de0:	aa1303e1	mov	x1, x19
   0x0000fffff7f87de4:	aa1503e2	mov	x2, x21
   0x0000fffff7f87de8:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f87dec:	aa1403e4	mov	x4, x20
   0x0000fffff7f87df0:	aa1603e5	mov	x5, x22
   0x0000fffff7f87df4:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7f87df8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f87dfc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87e00:	d63f0200	blr	x16
   0x0000fffff7f87e04:	f100001f	cmp	x0, #0x0
   0x0000fffff7f87e08:	54000be0	b.eq	0xfffff7f87f84  // b.none
   0x0000fffff7f87e0c:	17fff8f7	b	0xfffff7f861e8
   0x0000fffff7f87e10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f87e14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f87e18:	aa1303e1	mov	x1, x19
   0x0000fffff7f87e1c:	aa1503e2	mov	x2, x21
   0x0000fffff7f87e20:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7f87e24:	aa1403e4	mov	x4, x20
   0x0000fffff7f87e28:	aa1603e5	mov	x5, x22
   0x0000fffff7f87e2c:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7f87e30:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f87e34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f87e38:	d63f0200	blr	x16
   0x0000fffff7f87e3c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f87e40:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f87e44:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f87e48:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f87e4c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f87e50:	d65f03c0	ret
   0x0000fffff7f87e54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f87e58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f87e5c:	b900028a	str	w10, [x20]
   0x0000fffff7f87e60:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f87e64:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f87e68:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f87e6c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f87e70:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f87e74:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f87e78:	d65f03c0	ret
   0x0000fffff7f87e7c:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f87e80:	17fffff5	b	0xfffff7f87e54
   0x0000fffff7f87e84:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f87e88:	17fffff3	b	0xfffff7f87e54
   0x0000fffff7f87e8c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f87e90:	17fffff1	b	0xfffff7f87e54
   0x0000fffff7f87e94:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f87e98:	17ffffef	b	0xfffff7f87e54
   0x0000fffff7f87e9c:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f87ea0:	17ffffed	b	0xfffff7f87e54
   0x0000fffff7f87ea4:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f87ea8:	17ffffeb	b	0xfffff7f87e54
   0x0000fffff7f87eac:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f87eb0:	17ffffe9	b	0xfffff7f87e54
   0x0000fffff7f87eb4:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f87eb8:	17ffffe7	b	0xfffff7f87e54
   0x0000fffff7f87ebc:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f87ec0:	17ffffe5	b	0xfffff7f87e54
   0x0000fffff7f87ec4:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f87ec8:	17ffffe3	b	0xfffff7f87e54
   0x0000fffff7f87ecc:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f87ed0:	17ffffe1	b	0xfffff7f87e54
   0x0000fffff7f87ed4:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f87ed8:	17ffffdf	b	0xfffff7f87e54
   0x0000fffff7f87edc:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f87ee0:	17ffffdd	b	0xfffff7f87e54
   0x0000fffff7f87ee4:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f87ee8:	17ffffdb	b	0xfffff7f87e54
   0x0000fffff7f87eec:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f87ef0:	17ffffd9	b	0xfffff7f87e54
   0x0000fffff7f87ef4:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f87ef8:	17ffffd7	b	0xfffff7f87e54
   0x0000fffff7f87efc:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f87f00:	17ffffd5	b	0xfffff7f87e54
   0x0000fffff7f87f04:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f87f08:	17ffffd3	b	0xfffff7f87e54
   0x0000fffff7f87f0c:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f87f10:	17ffffd1	b	0xfffff7f87e54
   0x0000fffff7f87f14:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f87f18:	17ffffcf	b	0xfffff7f87e54
   0x0000fffff7f87f1c:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f87f20:	17ffffcd	b	0xfffff7f87e54
   0x0000fffff7f87f24:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f87f28:	17ffffcb	b	0xfffff7f87e54
   0x0000fffff7f87f2c:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f87f30:	17ffffc9	b	0xfffff7f87e54
   0x0000fffff7f87f34:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f87f38:	17ffffc7	b	0xfffff7f87e54
   0x0000fffff7f87f3c:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f87f40:	17ffffc5	b	0xfffff7f87e54
   0x0000fffff7f87f44:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f87f48:	17ffffc3	b	0xfffff7f87e54
   0x0000fffff7f87f4c:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f87f50:	17ffffc1	b	0xfffff7f87e54
   0x0000fffff7f87f54:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f87f58:	17ffffbf	b	0xfffff7f87e54
   0x0000fffff7f87f5c:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f87f60:	17ffffbd	b	0xfffff7f87e54
   0x0000fffff7f87f64:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f87f68:	17ffffbb	b	0xfffff7f87e54
   0x0000fffff7f87f6c:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f87f70:	17ffffb9	b	0xfffff7f87e54
   0x0000fffff7f87f74:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f87f78:	17ffffb7	b	0xfffff7f87e54
   0x0000fffff7f87f7c:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f87f80:	17ffffb5	b	0xfffff7f87e54
   0x0000fffff7f87f84:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7f87f88:	17ffffb3	b	0xfffff7f87e54
   0x0000fffff7f87f8c:	00000000	udf	#0
   0x0000fffff7f87f90:	00000000	udf	#0
   0x0000fffff7f87f94:	00000000	udf	#0
   0x0000fffff7f87f98:	00000000	udf	#0
   0x0000fffff7f87f9c:	00000000	udf	#0
   0x0000fffff7f87fa0:	00000000	udf	#0
   0x0000fffff7f87fa4:	00000000	udf	#0
   0x0000fffff7f87fa8:	00000000	udf	#0
   0x0000fffff7f87fac:	00000000	udf	#0
   0x0000fffff7f87fb0:	00000000	udf	#0
   0x0000fffff7f87fb4:	00000000	udf	#0
   0x0000fffff7f87fb8:	00000000	udf	#0
   0x0000fffff7f87fbc:	00000000	udf	#0
   0x0000fffff7f87fc0:	00000000	udf	#0
   0x0000fffff7f87fc4:	00000000	udf	#0
   0x0000fffff7f87fc8:	00000000	udf	#0
   0x0000fffff7f87fcc:	00000000	udf	#0
   0x0000fffff7f87fd0:	00000000	udf	#0
   0x0000fffff7f87fd4:	00000000	udf	#0
   0x0000fffff7f87fd8:	00000000	udf	#0
   0x0000fffff7f87fdc:	00000000	udf	#0
   0x0000fffff7f87fe0:	00000000	udf	#0
   0x0000fffff7f87fe4:	00000000	udf	#0
   0x0000fffff7f87fe8:	00000000	udf	#0
   0x0000fffff7f87fec:	00000000	udf	#0
   0x0000fffff7f87ff0:	00000000	udf	#0
   0x0000fffff7f87ff4:	00000000	udf	#0
   0x0000fffff7f87ff8:	00000000	udf	#0
   0x0000fffff7f87ffc:	00000000	udf	#0
End of assembler dump.
