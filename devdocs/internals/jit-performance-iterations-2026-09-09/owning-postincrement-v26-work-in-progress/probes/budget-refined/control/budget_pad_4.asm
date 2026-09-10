Dump of assembler code from 0xfffff7fb6000 to 0xfffff7fb8000:
   0x0000fffff7fb6000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fb6004:	910003fd	mov	x29, sp
   0x0000fffff7fb6008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fb600c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fb6010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fb6014:	aa0003f3	mov	x19, x0
   0x0000fffff7fb6018:	aa0103f4	mov	x20, x1
   0x0000fffff7fb601c:	aa0203f5	mov	x21, x2
   0x0000fffff7fb6020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fb6024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fb6028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fb602c:	f90003e9	str	x9, [sp]
   0x0000fffff7fb6030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fb6034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fb6038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fb603c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fb6040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6044:	d63f0200	blr	x16
   0x0000fffff7fb6048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fb604c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fb6050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fb6054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fb6058:	14000001	b	0xfffff7fb605c
   0x0000fffff7fb605c:	14000001	b	0xfffff7fb6060
   0x0000fffff7fb6060:	14000001	b	0xfffff7fb6064
   0x0000fffff7fb6064:	14000001	b	0xfffff7fb6068
   0x0000fffff7fb6068:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb606c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb6070:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb6074:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb6078:	36d80211	tbz	w17, #27, 0xfffff7fb60b8
   0x0000fffff7fb607c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6080:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6084:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6088:	540001e1	b.ne	0xfffff7fb60c4  // b.any
   0x0000fffff7fb608c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb6090:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6094:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6098:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb609c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb60a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb60a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb60a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb60ac:	540000c9	b.ls	0xfffff7fb60c4  // b.plast
   0x0000fffff7fb60b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb60b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb60b8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb60bc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb60c0:	1400000e	b	0xfffff7fb60f8
   0x0000fffff7fb60c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb60c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb60cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb60d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb60d4:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fb60d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb60dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb60e0:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fb60e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb60e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb60ec:	d63f0200	blr	x16
   0x0000fffff7fb60f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb60f4:	5400ede0	b.eq	0xfffff7fb7eb0  // b.none
   0x0000fffff7fb60f8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb60fc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb6100:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb6104:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fb6108:	36d80211	tbz	w17, #27, 0xfffff7fb6148
   0x0000fffff7fb610c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6110:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6114:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6118:	540001e1	b.ne	0xfffff7fb6154  // b.any
   0x0000fffff7fb611c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb6120:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6124:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6128:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb612c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6130:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6134:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6138:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb613c:	540000c9	b.ls	0xfffff7fb6154  // b.plast
   0x0000fffff7fb6140:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6144:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6148:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb614c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb6150:	1400000e	b	0xfffff7fb6188
   0x0000fffff7fb6154:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6158:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb615c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6160:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6164:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fb6168:	aa1403e4	mov	x4, x20
   0x0000fffff7fb616c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6170:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fb6174:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6178:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb617c:	d63f0200	blr	x16
   0x0000fffff7fb6180:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6184:	5400e9a0	b.eq	0xfffff7fb7eb8  // b.none
   0x0000fffff7fb6188:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb618c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6190:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6194:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6198:	54000421	b.ne	0xfffff7fb621c  // b.any
   0x0000fffff7fb619c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb61a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb61a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb61a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb61ac:	54000381	b.ne	0xfffff7fb621c  // b.any
   0x0000fffff7fb61b0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb61b4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fb61b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb61bc:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fb61c0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fb61c4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fb61c8:	91000580	add	x0, x12, #0x1
   0x0000fffff7fb61cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb61d0:	36d80211	tbz	w17, #27, 0xfffff7fb6210
   0x0000fffff7fb61d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb61d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb61dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb61e0:	540001e1	b.ne	0xfffff7fb621c  // b.any
   0x0000fffff7fb61e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb61e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb61ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb61f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb61f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb61f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb61fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6200:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6204:	540000c9	b.ls	0xfffff7fb621c  // b.plast
   0x0000fffff7fb6208:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb620c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6210:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fb6214:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fb6218:	1400000e	b	0xfffff7fb6250
   0x0000fffff7fb621c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6220:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6224:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6228:	aa1503e2	mov	x2, x21
   0x0000fffff7fb622c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb6230:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6234:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6238:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fb623c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6240:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6244:	d63f0200	blr	x16
   0x0000fffff7fb6248:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb624c:	5400e3a0	b.eq	0xfffff7fb7ec0  // b.none
   0x0000fffff7fb6250:	f100041f	cmp	x0, #0x1
   0x0000fffff7fb6254:	5400df80	b.eq	0xfffff7fb7e44  // b.none
   0x0000fffff7fb6258:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb625c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb6260:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fb6264:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb6268:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb626c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fb6270:	36d801d1	tbz	w17, #27, 0xfffff7fb62a8
   0x0000fffff7fb6274:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6278:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb627c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6280:	54000281	b.ne	0xfffff7fb62d0  // b.any
   0x0000fffff7fb6284:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb6288:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb628c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6290:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6294:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6298:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb629c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb62a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb62a4:	54000169	b.ls	0xfffff7fb62d0  // b.plast
   0x0000fffff7fb62a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb62ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb62b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb62b4:	36d80091	tbz	w17, #27, 0xfffff7fb62c4
   0x0000fffff7fb62b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb62bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb62c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb62c4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb62c8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb62cc:	1400000e	b	0xfffff7fb6304
   0x0000fffff7fb62d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb62d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb62d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb62dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb62e0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb62e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb62e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb62ec:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fb62f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb62f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb62f8:	d63f0200	blr	x16
   0x0000fffff7fb62fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6300:	5400de40	b.eq	0xfffff7fb7ec8  // b.none
   0x0000fffff7fb6304:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb6308:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb630c:	540003a0	b.eq	0xfffff7fb6380  // b.none
   0x0000fffff7fb6310:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fb6314:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fb6318:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb631c:	36d801d1	tbz	w17, #27, 0xfffff7fb6354
   0x0000fffff7fb6320:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6324:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6328:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb632c:	540002a1	b.ne	0xfffff7fb6380  // b.any
   0x0000fffff7fb6330:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb6334:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6338:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb633c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6340:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6344:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6348:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb634c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6350:	54000189	b.ls	0xfffff7fb6380  // b.plast
   0x0000fffff7fb6354:	36d8008d	tbz	w13, #27, 0xfffff7fb6364
   0x0000fffff7fb6358:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb635c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6360:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6364:	36d80091	tbz	w17, #27, 0xfffff7fb6374
   0x0000fffff7fb6368:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb636c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6370:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6374:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb6378:	b900016d	str	w13, [x11]
   0x0000fffff7fb637c:	1400000e	b	0xfffff7fb63b4
   0x0000fffff7fb6380:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb6384:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6388:	aa1303e1	mov	x1, x19
   0x0000fffff7fb638c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6390:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb6394:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6398:	aa1603e5	mov	x5, x22
   0x0000fffff7fb639c:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fb63a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb63a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb63a8:	d63f0200	blr	x16
   0x0000fffff7fb63ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb63b0:	5400d900	b.eq	0xfffff7fb7ed0  // b.none
   0x0000fffff7fb63b4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb63b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb63bc:	540004a0	b.eq	0xfffff7fb6450  // b.none
   0x0000fffff7fb63c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb63c4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb63c8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb63cc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb63d0:	54000400	b.eq	0xfffff7fb6450  // b.none
   0x0000fffff7fb63d4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb63d8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb63dc:	36d801d1	tbz	w17, #27, 0xfffff7fb6414
   0x0000fffff7fb63e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb63e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb63e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb63ec:	54000321	b.ne	0xfffff7fb6450  // b.any
   0x0000fffff7fb63f0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb63f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb63f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb63fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6400:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6404:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6408:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb640c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6410:	54000209	b.ls	0xfffff7fb6450  // b.plast
   0x0000fffff7fb6414:	36d8008d	tbz	w13, #27, 0xfffff7fb6424
   0x0000fffff7fb6418:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb641c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6420:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6424:	36d80091	tbz	w17, #27, 0xfffff7fb6434
   0x0000fffff7fb6428:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb642c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6430:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6434:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb6438:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb643c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb6440:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb6444:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb6448:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb644c:	1400000e	b	0xfffff7fb6484
   0x0000fffff7fb6450:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb6454:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6458:	aa1303e1	mov	x1, x19
   0x0000fffff7fb645c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6460:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb6464:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6468:	aa1603e5	mov	x5, x22
   0x0000fffff7fb646c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb6470:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6474:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6478:	d63f0200	blr	x16
   0x0000fffff7fb647c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6480:	5400d2c0	b.eq	0xfffff7fb7ed8  // b.none
   0x0000fffff7fb6484:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6488:	37d806a9	tbnz	w9, #27, 0xfffff7fb655c
   0x0000fffff7fb648c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6490:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6494:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6498:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb649c:	540001c1	b.ne	0xfffff7fb64d4  // b.any
   0x0000fffff7fb64a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb64a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb64a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb64ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb64b0:	54000121	b.ne	0xfffff7fb64d4  // b.any
   0x0000fffff7fb64b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb64b8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb64bc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb64c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb64c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb64c8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb64cc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb64d0:	14000030	b	0xfffff7fb6590
   0x0000fffff7fb64d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb64d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb64dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb64e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb64e4:	54000120	b.eq	0xfffff7fb6508  // b.none
   0x0000fffff7fb64e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb64ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb64f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb64f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb64f8:	54000321	b.ne	0xfffff7fb655c  // b.any
   0x0000fffff7fb64fc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6500:	9e620120	scvtf	d0, x9
   0x0000fffff7fb6504:	14000002	b	0xfffff7fb650c
   0x0000fffff7fb6508:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb650c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6510:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6514:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6518:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb651c:	54000120	b.eq	0xfffff7fb6540  // b.none
   0x0000fffff7fb6520:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6524:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb652c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6530:	54000161	b.ne	0xfffff7fb655c  // b.any
   0x0000fffff7fb6534:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb6538:	9e620121	scvtf	d1, x9
   0x0000fffff7fb653c:	14000002	b	0xfffff7fb6544
   0x0000fffff7fb6540:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb6544:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb6548:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb654c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6550:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6554:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6558:	17ffffde	b	0xfffff7fb64d0
   0x0000fffff7fb655c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6560:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6564:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6568:	aa1503e2	mov	x2, x21
   0x0000fffff7fb656c:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb6570:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6574:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6578:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb657c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6580:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6584:	d63f0200	blr	x16
   0x0000fffff7fb6588:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb658c:	5400caa0	b.eq	0xfffff7fb7ee0  // b.none
   0x0000fffff7fb6590:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb6594:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6598:	540004a0	b.eq	0xfffff7fb662c  // b.none
   0x0000fffff7fb659c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb65a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb65a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb65a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb65ac:	54000400	b.eq	0xfffff7fb662c  // b.none
   0x0000fffff7fb65b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb65b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb65b8:	36d801d1	tbz	w17, #27, 0xfffff7fb65f0
   0x0000fffff7fb65bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb65c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb65c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb65c8:	54000321	b.ne	0xfffff7fb662c  // b.any
   0x0000fffff7fb65cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb65d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb65d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb65d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb65dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb65e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb65e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb65e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb65ec:	54000209	b.ls	0xfffff7fb662c  // b.plast
   0x0000fffff7fb65f0:	36d8008d	tbz	w13, #27, 0xfffff7fb6600
   0x0000fffff7fb65f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb65f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb65fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6600:	36d80091	tbz	w17, #27, 0xfffff7fb6610
   0x0000fffff7fb6604:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6608:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb660c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6610:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb6614:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb6618:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb661c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb6620:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb6624:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb6628:	1400000e	b	0xfffff7fb6660
   0x0000fffff7fb662c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb6630:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6634:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6638:	aa1503e2	mov	x2, x21
   0x0000fffff7fb663c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb6640:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6644:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6648:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb664c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6650:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6654:	d63f0200	blr	x16
   0x0000fffff7fb6658:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb665c:	5400c460	b.eq	0xfffff7fb7ee8  // b.none
   0x0000fffff7fb6660:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6664:	37d806a9	tbnz	w9, #27, 0xfffff7fb6738
   0x0000fffff7fb6668:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb666c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6670:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6674:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6678:	540001c1	b.ne	0xfffff7fb66b0  // b.any
   0x0000fffff7fb667c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6680:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6688:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb668c:	54000121	b.ne	0xfffff7fb66b0  // b.any
   0x0000fffff7fb6690:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6694:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb6698:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb669c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb66a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb66a4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb66a8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb66ac:	14000030	b	0xfffff7fb676c
   0x0000fffff7fb66b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb66b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb66b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb66bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb66c0:	54000120	b.eq	0xfffff7fb66e4  // b.none
   0x0000fffff7fb66c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb66c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb66cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb66d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb66d4:	54000321	b.ne	0xfffff7fb6738  // b.any
   0x0000fffff7fb66d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb66dc:	9e620120	scvtf	d0, x9
   0x0000fffff7fb66e0:	14000002	b	0xfffff7fb66e8
   0x0000fffff7fb66e4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb66e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb66ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb66f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb66f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb66f8:	54000120	b.eq	0xfffff7fb671c  // b.none
   0x0000fffff7fb66fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6700:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6704:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6708:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb670c:	54000161	b.ne	0xfffff7fb6738  // b.any
   0x0000fffff7fb6710:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb6714:	9e620121	scvtf	d1, x9
   0x0000fffff7fb6718:	14000002	b	0xfffff7fb6720
   0x0000fffff7fb671c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb6720:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb6724:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb6728:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb672c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6730:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6734:	17ffffde	b	0xfffff7fb66ac
   0x0000fffff7fb6738:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb673c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6740:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6744:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6748:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb674c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6750:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6754:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb6758:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb675c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6760:	d63f0200	blr	x16
   0x0000fffff7fb6764:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6768:	5400bc40	b.eq	0xfffff7fb7ef0  // b.none
   0x0000fffff7fb676c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb6770:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6774:	540004a0	b.eq	0xfffff7fb6808  // b.none
   0x0000fffff7fb6778:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb677c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb6780:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb6784:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb6788:	54000400	b.eq	0xfffff7fb6808  // b.none
   0x0000fffff7fb678c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb6790:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb6794:	36d801d1	tbz	w17, #27, 0xfffff7fb67cc
   0x0000fffff7fb6798:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb679c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb67a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb67a4:	54000321	b.ne	0xfffff7fb6808  // b.any
   0x0000fffff7fb67a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb67ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb67b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb67b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb67b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb67bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb67c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb67c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb67c8:	54000209	b.ls	0xfffff7fb6808  // b.plast
   0x0000fffff7fb67cc:	36d8008d	tbz	w13, #27, 0xfffff7fb67dc
   0x0000fffff7fb67d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb67d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb67d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb67dc:	36d80091	tbz	w17, #27, 0xfffff7fb67ec
   0x0000fffff7fb67e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb67e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb67e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb67ec:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb67f0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb67f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb67f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb67fc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb6800:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb6804:	1400000e	b	0xfffff7fb683c
   0x0000fffff7fb6808:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb680c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6810:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6814:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6818:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb681c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6820:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6824:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb6828:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb682c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6830:	d63f0200	blr	x16
   0x0000fffff7fb6834:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6838:	5400b600	b.eq	0xfffff7fb7ef8  // b.none
   0x0000fffff7fb683c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6840:	37d806a9	tbnz	w9, #27, 0xfffff7fb6914
   0x0000fffff7fb6844:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6848:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb684c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6850:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6854:	540001c1	b.ne	0xfffff7fb688c  // b.any
   0x0000fffff7fb6858:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb685c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6860:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6864:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6868:	54000121	b.ne	0xfffff7fb688c  // b.any
   0x0000fffff7fb686c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6870:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb6874:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb6878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb687c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6880:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb6884:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6888:	14000030	b	0xfffff7fb6948
   0x0000fffff7fb688c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6890:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6898:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb689c:	54000120	b.eq	0xfffff7fb68c0  // b.none
   0x0000fffff7fb68a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb68a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb68a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb68ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb68b0:	54000321	b.ne	0xfffff7fb6914  // b.any
   0x0000fffff7fb68b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb68b8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb68bc:	14000002	b	0xfffff7fb68c4
   0x0000fffff7fb68c0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb68c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb68c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb68cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb68d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb68d4:	54000120	b.eq	0xfffff7fb68f8  // b.none
   0x0000fffff7fb68d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb68dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb68e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb68e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb68e8:	54000161	b.ne	0xfffff7fb6914  // b.any
   0x0000fffff7fb68ec:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb68f0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb68f4:	14000002	b	0xfffff7fb68fc
   0x0000fffff7fb68f8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb68fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb6900:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb6904:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6908:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb690c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6910:	17ffffde	b	0xfffff7fb6888
   0x0000fffff7fb6914:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6918:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb691c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6920:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6924:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb6928:	aa1403e4	mov	x4, x20
   0x0000fffff7fb692c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6930:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb6934:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb693c:	d63f0200	blr	x16
   0x0000fffff7fb6940:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6944:	5400ade0	b.eq	0xfffff7fb7f00  // b.none
   0x0000fffff7fb6948:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb694c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6950:	540004a0	b.eq	0xfffff7fb69e4  // b.none
   0x0000fffff7fb6954:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb6958:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb695c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb6960:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb6964:	54000400	b.eq	0xfffff7fb69e4  // b.none
   0x0000fffff7fb6968:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb696c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb6970:	36d801d1	tbz	w17, #27, 0xfffff7fb69a8
   0x0000fffff7fb6974:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6978:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb697c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6980:	54000321	b.ne	0xfffff7fb69e4  // b.any
   0x0000fffff7fb6984:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb6988:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb698c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6990:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6994:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6998:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb699c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb69a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb69a4:	54000209	b.ls	0xfffff7fb69e4  // b.plast
   0x0000fffff7fb69a8:	36d8008d	tbz	w13, #27, 0xfffff7fb69b8
   0x0000fffff7fb69ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb69b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb69b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb69b8:	36d80091	tbz	w17, #27, 0xfffff7fb69c8
   0x0000fffff7fb69bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb69c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb69c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb69c8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb69cc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb69d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb69d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb69d8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb69dc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb69e0:	1400000e	b	0xfffff7fb6a18
   0x0000fffff7fb69e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb69e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb69ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fb69f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb69f4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb69f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb69fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6a00:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb6a04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6a08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6a0c:	d63f0200	blr	x16
   0x0000fffff7fb6a10:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6a14:	5400a7a0	b.eq	0xfffff7fb7f08  // b.none
   0x0000fffff7fb6a18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6a1c:	37d806a9	tbnz	w9, #27, 0xfffff7fb6af0
   0x0000fffff7fb6a20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6a24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6a28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6a2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6a30:	540001c1	b.ne	0xfffff7fb6a68  // b.any
   0x0000fffff7fb6a34:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6a38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6a3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6a40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6a44:	54000121	b.ne	0xfffff7fb6a68  // b.any
   0x0000fffff7fb6a48:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6a4c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb6a50:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb6a54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6a58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6a5c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb6a60:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6a64:	14000030	b	0xfffff7fb6b24
   0x0000fffff7fb6a68:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6a6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6a70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6a74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6a78:	54000120	b.eq	0xfffff7fb6a9c  // b.none
   0x0000fffff7fb6a7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6a80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6a84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6a88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6a8c:	54000321	b.ne	0xfffff7fb6af0  // b.any
   0x0000fffff7fb6a90:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6a94:	9e620120	scvtf	d0, x9
   0x0000fffff7fb6a98:	14000002	b	0xfffff7fb6aa0
   0x0000fffff7fb6a9c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb6aa0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6aa4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6aa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6aac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6ab0:	54000120	b.eq	0xfffff7fb6ad4  // b.none
   0x0000fffff7fb6ab4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6ab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6abc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6ac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6ac4:	54000161	b.ne	0xfffff7fb6af0  // b.any
   0x0000fffff7fb6ac8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb6acc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb6ad0:	14000002	b	0xfffff7fb6ad8
   0x0000fffff7fb6ad4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb6ad8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb6adc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb6ae0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6ae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6ae8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6aec:	17ffffde	b	0xfffff7fb6a64
   0x0000fffff7fb6af0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6af4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6af8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6afc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6b00:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb6b04:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6b08:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6b0c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb6b10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6b14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6b18:	d63f0200	blr	x16
   0x0000fffff7fb6b1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6b20:	54009f80	b.eq	0xfffff7fb7f10  // b.none
   0x0000fffff7fb6b24:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb6b28:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6b2c:	540004a0	b.eq	0xfffff7fb6bc0  // b.none
   0x0000fffff7fb6b30:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb6b34:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb6b38:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb6b3c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb6b40:	54000400	b.eq	0xfffff7fb6bc0  // b.none
   0x0000fffff7fb6b44:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb6b48:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb6b4c:	36d801d1	tbz	w17, #27, 0xfffff7fb6b84
   0x0000fffff7fb6b50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6b54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6b58:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6b5c:	54000321	b.ne	0xfffff7fb6bc0  // b.any
   0x0000fffff7fb6b60:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb6b64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6b68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6b6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6b70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6b74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6b78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6b7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6b80:	54000209	b.ls	0xfffff7fb6bc0  // b.plast
   0x0000fffff7fb6b84:	36d8008d	tbz	w13, #27, 0xfffff7fb6b94
   0x0000fffff7fb6b88:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6b8c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6b90:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6b94:	36d80091	tbz	w17, #27, 0xfffff7fb6ba4
   0x0000fffff7fb6b98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6b9c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6ba0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6ba4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb6ba8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb6bac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb6bb0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb6bb4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb6bb8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb6bbc:	1400000e	b	0xfffff7fb6bf4
   0x0000fffff7fb6bc0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb6bc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6bc8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6bcc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6bd0:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb6bd4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6bd8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6bdc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb6be0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6be4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6be8:	d63f0200	blr	x16
   0x0000fffff7fb6bec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6bf0:	54009940	b.eq	0xfffff7fb7f18  // b.none
   0x0000fffff7fb6bf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6bf8:	37d806a9	tbnz	w9, #27, 0xfffff7fb6ccc
   0x0000fffff7fb6bfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6c00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6c04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6c0c:	540001c1	b.ne	0xfffff7fb6c44  // b.any
   0x0000fffff7fb6c10:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6c14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6c18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6c20:	54000121	b.ne	0xfffff7fb6c44  // b.any
   0x0000fffff7fb6c24:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6c28:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb6c2c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb6c30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6c34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c38:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb6c3c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6c40:	14000030	b	0xfffff7fb6d00
   0x0000fffff7fb6c44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6c48:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6c4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6c54:	54000120	b.eq	0xfffff7fb6c78  // b.none
   0x0000fffff7fb6c58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6c5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6c60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6c68:	54000321	b.ne	0xfffff7fb6ccc  // b.any
   0x0000fffff7fb6c6c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6c70:	9e620120	scvtf	d0, x9
   0x0000fffff7fb6c74:	14000002	b	0xfffff7fb6c7c
   0x0000fffff7fb6c78:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb6c7c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6c80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6c84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6c8c:	54000120	b.eq	0xfffff7fb6cb0  // b.none
   0x0000fffff7fb6c90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6c94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6c98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6ca0:	54000161	b.ne	0xfffff7fb6ccc  // b.any
   0x0000fffff7fb6ca4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb6ca8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb6cac:	14000002	b	0xfffff7fb6cb4
   0x0000fffff7fb6cb0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb6cb4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb6cb8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb6cbc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6cc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6cc4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6cc8:	17ffffde	b	0xfffff7fb6c40
   0x0000fffff7fb6ccc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6cd0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6cd4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6cd8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6cdc:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb6ce0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6ce4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6ce8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb6cec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6cf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6cf4:	d63f0200	blr	x16
   0x0000fffff7fb6cf8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6cfc:	54009120	b.eq	0xfffff7fb7f20  // b.none
   0x0000fffff7fb6d00:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb6d04:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6d08:	540004a0	b.eq	0xfffff7fb6d9c  // b.none
   0x0000fffff7fb6d0c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb6d10:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb6d14:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb6d18:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb6d1c:	54000400	b.eq	0xfffff7fb6d9c  // b.none
   0x0000fffff7fb6d20:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb6d24:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb6d28:	36d801d1	tbz	w17, #27, 0xfffff7fb6d60
   0x0000fffff7fb6d2c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6d30:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6d34:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6d38:	54000321	b.ne	0xfffff7fb6d9c  // b.any
   0x0000fffff7fb6d3c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb6d40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6d44:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6d48:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6d4c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6d50:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6d54:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6d58:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6d5c:	54000209	b.ls	0xfffff7fb6d9c  // b.plast
   0x0000fffff7fb6d60:	36d8008d	tbz	w13, #27, 0xfffff7fb6d70
   0x0000fffff7fb6d64:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6d68:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6d6c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6d70:	36d80091	tbz	w17, #27, 0xfffff7fb6d80
   0x0000fffff7fb6d74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6d78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6d7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6d80:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb6d84:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb6d88:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb6d8c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb6d90:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb6d94:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb6d98:	1400000e	b	0xfffff7fb6dd0
   0x0000fffff7fb6d9c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb6da0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6da4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6da8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6dac:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb6db0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6db4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6db8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb6dbc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6dc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6dc4:	d63f0200	blr	x16
   0x0000fffff7fb6dc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6dcc:	54008ae0	b.eq	0xfffff7fb7f28  // b.none
   0x0000fffff7fb6dd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6dd4:	37d806a9	tbnz	w9, #27, 0xfffff7fb6ea8
   0x0000fffff7fb6dd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6ddc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6de0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6de4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6de8:	540001c1	b.ne	0xfffff7fb6e20  // b.any
   0x0000fffff7fb6dec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6df0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6df4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6df8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6dfc:	54000121	b.ne	0xfffff7fb6e20  // b.any
   0x0000fffff7fb6e00:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6e04:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb6e08:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb6e0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6e10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6e14:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb6e18:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6e1c:	14000030	b	0xfffff7fb6edc
   0x0000fffff7fb6e20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6e24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6e28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6e2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6e30:	54000120	b.eq	0xfffff7fb6e54  // b.none
   0x0000fffff7fb6e34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6e38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6e3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6e40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6e44:	54000321	b.ne	0xfffff7fb6ea8  // b.any
   0x0000fffff7fb6e48:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6e4c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb6e50:	14000002	b	0xfffff7fb6e58
   0x0000fffff7fb6e54:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb6e58:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6e5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6e60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6e64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6e68:	54000120	b.eq	0xfffff7fb6e8c  // b.none
   0x0000fffff7fb6e6c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6e70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6e74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6e78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6e7c:	54000161	b.ne	0xfffff7fb6ea8  // b.any
   0x0000fffff7fb6e80:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb6e84:	9e620121	scvtf	d1, x9
   0x0000fffff7fb6e88:	14000002	b	0xfffff7fb6e90
   0x0000fffff7fb6e8c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb6e90:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb6e94:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb6e98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6e9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6ea0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6ea4:	17ffffde	b	0xfffff7fb6e1c
   0x0000fffff7fb6ea8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6eac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6eb0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6eb4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6eb8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb6ebc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6ec0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6ec4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb6ec8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6ecc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6ed0:	d63f0200	blr	x16
   0x0000fffff7fb6ed4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6ed8:	540082c0	b.eq	0xfffff7fb7f30  // b.none
   0x0000fffff7fb6edc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb6ee0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6ee4:	540004a0	b.eq	0xfffff7fb6f78  // b.none
   0x0000fffff7fb6ee8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb6eec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb6ef0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb6ef4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb6ef8:	54000400	b.eq	0xfffff7fb6f78  // b.none
   0x0000fffff7fb6efc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb6f00:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb6f04:	36d801d1	tbz	w17, #27, 0xfffff7fb6f3c
   0x0000fffff7fb6f08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6f0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6f10:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6f14:	54000321	b.ne	0xfffff7fb6f78  // b.any
   0x0000fffff7fb6f18:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb6f1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6f20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6f24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6f28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6f2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6f30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6f34:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6f38:	54000209	b.ls	0xfffff7fb6f78  // b.plast
   0x0000fffff7fb6f3c:	36d8008d	tbz	w13, #27, 0xfffff7fb6f4c
   0x0000fffff7fb6f40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6f44:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6f48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6f4c:	36d80091	tbz	w17, #27, 0xfffff7fb6f5c
   0x0000fffff7fb6f50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6f54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6f58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6f5c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb6f60:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb6f64:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb6f68:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb6f6c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb6f70:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb6f74:	1400000e	b	0xfffff7fb6fac
   0x0000fffff7fb6f78:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb6f7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6f80:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6f84:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6f88:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb6f8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6f90:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6f94:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb6f98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6f9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6fa0:	d63f0200	blr	x16
   0x0000fffff7fb6fa4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6fa8:	54007c80	b.eq	0xfffff7fb7f38  // b.none
   0x0000fffff7fb6fac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6fb0:	37d806a9	tbnz	w9, #27, 0xfffff7fb7084
   0x0000fffff7fb6fb4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6fb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6fbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6fc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6fc4:	540001c1	b.ne	0xfffff7fb6ffc  // b.any
   0x0000fffff7fb6fc8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb6fcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6fd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6fd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6fd8:	54000121	b.ne	0xfffff7fb6ffc  // b.any
   0x0000fffff7fb6fdc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6fe0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb6fe4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb6fe8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6fec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6ff0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb6ff4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb6ff8:	14000030	b	0xfffff7fb70b8
   0x0000fffff7fb6ffc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7000:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7008:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb700c:	54000120	b.eq	0xfffff7fb7030  // b.none
   0x0000fffff7fb7010:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7014:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7018:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb701c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7020:	54000321	b.ne	0xfffff7fb7084  // b.any
   0x0000fffff7fb7024:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7028:	9e620120	scvtf	d0, x9
   0x0000fffff7fb702c:	14000002	b	0xfffff7fb7034
   0x0000fffff7fb7030:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb7034:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7038:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb703c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7040:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7044:	54000120	b.eq	0xfffff7fb7068  // b.none
   0x0000fffff7fb7048:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb704c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7050:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7054:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7058:	54000161	b.ne	0xfffff7fb7084  // b.any
   0x0000fffff7fb705c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb7060:	9e620121	scvtf	d1, x9
   0x0000fffff7fb7064:	14000002	b	0xfffff7fb706c
   0x0000fffff7fb7068:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb706c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb7070:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb7074:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb707c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb7080:	17ffffde	b	0xfffff7fb6ff8
   0x0000fffff7fb7084:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7088:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb708c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7090:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7094:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb7098:	aa1403e4	mov	x4, x20
   0x0000fffff7fb709c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb70a0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb70a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb70a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb70ac:	d63f0200	blr	x16
   0x0000fffff7fb70b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb70b4:	54007460	b.eq	0xfffff7fb7f40  // b.none
   0x0000fffff7fb70b8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb70bc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb70c0:	540004a0	b.eq	0xfffff7fb7154  // b.none
   0x0000fffff7fb70c4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb70c8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb70cc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb70d0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb70d4:	54000400	b.eq	0xfffff7fb7154  // b.none
   0x0000fffff7fb70d8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb70dc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb70e0:	36d801d1	tbz	w17, #27, 0xfffff7fb7118
   0x0000fffff7fb70e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb70e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb70ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb70f0:	54000321	b.ne	0xfffff7fb7154  // b.any
   0x0000fffff7fb70f4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb70f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb70fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb7100:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7104:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7108:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb710c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb7110:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7114:	54000209	b.ls	0xfffff7fb7154  // b.plast
   0x0000fffff7fb7118:	36d8008d	tbz	w13, #27, 0xfffff7fb7128
   0x0000fffff7fb711c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb7120:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7124:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7128:	36d80091	tbz	w17, #27, 0xfffff7fb7138
   0x0000fffff7fb712c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7130:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7134:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb7138:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb713c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb7140:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb7144:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb7148:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb714c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb7150:	1400000e	b	0xfffff7fb7188
   0x0000fffff7fb7154:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb7158:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb715c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7160:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7164:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb7168:	aa1403e4	mov	x4, x20
   0x0000fffff7fb716c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7170:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb7174:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb7178:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb717c:	d63f0200	blr	x16
   0x0000fffff7fb7180:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7184:	54006e20	b.eq	0xfffff7fb7f48  // b.none
   0x0000fffff7fb7188:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb718c:	37d806a9	tbnz	w9, #27, 0xfffff7fb7260
   0x0000fffff7fb7190:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7194:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7198:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb719c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb71a0:	540001c1	b.ne	0xfffff7fb71d8  // b.any
   0x0000fffff7fb71a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb71a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb71ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb71b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb71b4:	54000121	b.ne	0xfffff7fb71d8  // b.any
   0x0000fffff7fb71b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb71bc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb71c0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb71c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb71c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb71cc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb71d0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb71d4:	14000030	b	0xfffff7fb7294
   0x0000fffff7fb71d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb71dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb71e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb71e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb71e8:	54000120	b.eq	0xfffff7fb720c  // b.none
   0x0000fffff7fb71ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb71f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb71f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb71f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb71fc:	54000321	b.ne	0xfffff7fb7260  // b.any
   0x0000fffff7fb7200:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7204:	9e620120	scvtf	d0, x9
   0x0000fffff7fb7208:	14000002	b	0xfffff7fb7210
   0x0000fffff7fb720c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb7210:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7214:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7218:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb721c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7220:	54000120	b.eq	0xfffff7fb7244  // b.none
   0x0000fffff7fb7224:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7228:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb722c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7230:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7234:	54000161	b.ne	0xfffff7fb7260  // b.any
   0x0000fffff7fb7238:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb723c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb7240:	14000002	b	0xfffff7fb7248
   0x0000fffff7fb7244:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb7248:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb724c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb7250:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7254:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7258:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb725c:	17ffffde	b	0xfffff7fb71d4
   0x0000fffff7fb7260:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7264:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7268:	aa1303e1	mov	x1, x19
   0x0000fffff7fb726c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7270:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb7274:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7278:	aa1603e5	mov	x5, x22
   0x0000fffff7fb727c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb7280:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7284:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7288:	d63f0200	blr	x16
   0x0000fffff7fb728c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7290:	54006600	b.eq	0xfffff7fb7f50  // b.none
   0x0000fffff7fb7294:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb7298:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb729c:	540004a0	b.eq	0xfffff7fb7330  // b.none
   0x0000fffff7fb72a0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb72a4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb72a8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb72ac:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb72b0:	54000400	b.eq	0xfffff7fb7330  // b.none
   0x0000fffff7fb72b4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb72b8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb72bc:	36d801d1	tbz	w17, #27, 0xfffff7fb72f4
   0x0000fffff7fb72c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb72c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb72c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb72cc:	54000321	b.ne	0xfffff7fb7330  // b.any
   0x0000fffff7fb72d0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb72d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb72d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb72dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb72e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb72e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb72e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb72ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb72f0:	54000209	b.ls	0xfffff7fb7330  // b.plast
   0x0000fffff7fb72f4:	36d8008d	tbz	w13, #27, 0xfffff7fb7304
   0x0000fffff7fb72f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb72fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7300:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7304:	36d80091	tbz	w17, #27, 0xfffff7fb7314
   0x0000fffff7fb7308:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb730c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7310:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb7314:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb7318:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb731c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb7320:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb7324:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb7328:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb732c:	1400000e	b	0xfffff7fb7364
   0x0000fffff7fb7330:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb7334:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7338:	aa1303e1	mov	x1, x19
   0x0000fffff7fb733c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7340:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb7344:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7348:	aa1603e5	mov	x5, x22
   0x0000fffff7fb734c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb7350:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb7354:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7358:	d63f0200	blr	x16
   0x0000fffff7fb735c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7360:	54005fc0	b.eq	0xfffff7fb7f58  // b.none
   0x0000fffff7fb7364:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7368:	37d806a9	tbnz	w9, #27, 0xfffff7fb743c
   0x0000fffff7fb736c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7370:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7374:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7378:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb737c:	540001c1	b.ne	0xfffff7fb73b4  // b.any
   0x0000fffff7fb7380:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7384:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7388:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb738c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7390:	54000121	b.ne	0xfffff7fb73b4  // b.any
   0x0000fffff7fb7394:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7398:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb739c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb73a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb73a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb73a8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb73ac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb73b0:	14000030	b	0xfffff7fb7470
   0x0000fffff7fb73b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb73b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb73bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb73c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb73c4:	54000120	b.eq	0xfffff7fb73e8  // b.none
   0x0000fffff7fb73c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb73cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb73d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb73d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb73d8:	54000321	b.ne	0xfffff7fb743c  // b.any
   0x0000fffff7fb73dc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb73e0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb73e4:	14000002	b	0xfffff7fb73ec
   0x0000fffff7fb73e8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb73ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb73f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb73f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb73f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb73fc:	54000120	b.eq	0xfffff7fb7420  // b.none
   0x0000fffff7fb7400:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7404:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7408:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb740c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7410:	54000161	b.ne	0xfffff7fb743c  // b.any
   0x0000fffff7fb7414:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb7418:	9e620121	scvtf	d1, x9
   0x0000fffff7fb741c:	14000002	b	0xfffff7fb7424
   0x0000fffff7fb7420:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb7424:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb7428:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb742c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7430:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7434:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb7438:	17ffffde	b	0xfffff7fb73b0
   0x0000fffff7fb743c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7440:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7444:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7448:	aa1503e2	mov	x2, x21
   0x0000fffff7fb744c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb7450:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7454:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7458:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb745c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7460:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7464:	d63f0200	blr	x16
   0x0000fffff7fb7468:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb746c:	540057a0	b.eq	0xfffff7fb7f60  // b.none
   0x0000fffff7fb7470:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb7474:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb7478:	540004a0	b.eq	0xfffff7fb750c  // b.none
   0x0000fffff7fb747c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb7480:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb7484:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb7488:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb748c:	54000400	b.eq	0xfffff7fb750c  // b.none
   0x0000fffff7fb7490:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb7494:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb7498:	36d801d1	tbz	w17, #27, 0xfffff7fb74d0
   0x0000fffff7fb749c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb74a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb74a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb74a8:	54000321	b.ne	0xfffff7fb750c  // b.any
   0x0000fffff7fb74ac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb74b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb74b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb74b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb74bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb74c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb74c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb74c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb74cc:	54000209	b.ls	0xfffff7fb750c  // b.plast
   0x0000fffff7fb74d0:	36d8008d	tbz	w13, #27, 0xfffff7fb74e0
   0x0000fffff7fb74d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb74d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb74dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb74e0:	36d80091	tbz	w17, #27, 0xfffff7fb74f0
   0x0000fffff7fb74e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb74e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb74ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb74f0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb74f4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb74f8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb74fc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb7500:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb7504:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb7508:	1400000e	b	0xfffff7fb7540
   0x0000fffff7fb750c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb7510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7514:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7518:	aa1503e2	mov	x2, x21
   0x0000fffff7fb751c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb7520:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7524:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7528:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb752c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb7530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7534:	d63f0200	blr	x16
   0x0000fffff7fb7538:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb753c:	54005160	b.eq	0xfffff7fb7f68  // b.none
   0x0000fffff7fb7540:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7544:	37d806a9	tbnz	w9, #27, 0xfffff7fb7618
   0x0000fffff7fb7548:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb754c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7550:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7554:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7558:	540001c1	b.ne	0xfffff7fb7590  // b.any
   0x0000fffff7fb755c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7560:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7568:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb756c:	54000121	b.ne	0xfffff7fb7590  // b.any
   0x0000fffff7fb7570:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7574:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb7578:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb757c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7580:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7584:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb7588:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb758c:	14000030	b	0xfffff7fb764c
   0x0000fffff7fb7590:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7594:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7598:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb759c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb75a0:	54000120	b.eq	0xfffff7fb75c4  // b.none
   0x0000fffff7fb75a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb75a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb75ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb75b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb75b4:	54000321	b.ne	0xfffff7fb7618  // b.any
   0x0000fffff7fb75b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb75bc:	9e620120	scvtf	d0, x9
   0x0000fffff7fb75c0:	14000002	b	0xfffff7fb75c8
   0x0000fffff7fb75c4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb75c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb75cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb75d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb75d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb75d8:	54000120	b.eq	0xfffff7fb75fc  // b.none
   0x0000fffff7fb75dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb75e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb75e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb75e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb75ec:	54000161	b.ne	0xfffff7fb7618  // b.any
   0x0000fffff7fb75f0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb75f4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb75f8:	14000002	b	0xfffff7fb7600
   0x0000fffff7fb75fc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb7600:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb7604:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb7608:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb760c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7610:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb7614:	17ffffde	b	0xfffff7fb758c
   0x0000fffff7fb7618:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb761c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7620:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7624:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7628:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb762c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7630:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7634:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb7638:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb763c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7640:	d63f0200	blr	x16
   0x0000fffff7fb7644:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7648:	54004940	b.eq	0xfffff7fb7f70  // b.none
   0x0000fffff7fb764c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb7650:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb7654:	540004a0	b.eq	0xfffff7fb76e8  // b.none
   0x0000fffff7fb7658:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb765c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb7660:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb7664:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb7668:	54000400	b.eq	0xfffff7fb76e8  // b.none
   0x0000fffff7fb766c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb7670:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb7674:	36d801d1	tbz	w17, #27, 0xfffff7fb76ac
   0x0000fffff7fb7678:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb767c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7680:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb7684:	54000321	b.ne	0xfffff7fb76e8  // b.any
   0x0000fffff7fb7688:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb768c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7690:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb7694:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7698:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb769c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb76a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb76a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb76a8:	54000209	b.ls	0xfffff7fb76e8  // b.plast
   0x0000fffff7fb76ac:	36d8008d	tbz	w13, #27, 0xfffff7fb76bc
   0x0000fffff7fb76b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb76b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb76b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb76bc:	36d80091	tbz	w17, #27, 0xfffff7fb76cc
   0x0000fffff7fb76c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb76c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb76c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb76cc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb76d0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb76d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb76d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb76dc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb76e0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb76e4:	1400000e	b	0xfffff7fb771c
   0x0000fffff7fb76e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb76ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb76f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb76f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb76f8:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb76fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7700:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7704:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb7708:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb770c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7710:	d63f0200	blr	x16
   0x0000fffff7fb7714:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7718:	54004300	b.eq	0xfffff7fb7f78  // b.none
   0x0000fffff7fb771c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7720:	37d806a9	tbnz	w9, #27, 0xfffff7fb77f4
   0x0000fffff7fb7724:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7728:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb772c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7730:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7734:	540001c1	b.ne	0xfffff7fb776c  // b.any
   0x0000fffff7fb7738:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb773c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7740:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7744:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7748:	54000121	b.ne	0xfffff7fb776c  // b.any
   0x0000fffff7fb774c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7750:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb7754:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb7758:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb775c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7760:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb7764:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb7768:	14000030	b	0xfffff7fb7828
   0x0000fffff7fb776c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7770:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7774:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7778:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb777c:	54000120	b.eq	0xfffff7fb77a0  // b.none
   0x0000fffff7fb7780:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7784:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7788:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb778c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7790:	54000321	b.ne	0xfffff7fb77f4  // b.any
   0x0000fffff7fb7794:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7798:	9e620120	scvtf	d0, x9
   0x0000fffff7fb779c:	14000002	b	0xfffff7fb77a4
   0x0000fffff7fb77a0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb77a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb77a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb77ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb77b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb77b4:	54000120	b.eq	0xfffff7fb77d8  // b.none
   0x0000fffff7fb77b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb77bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb77c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb77c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb77c8:	54000161	b.ne	0xfffff7fb77f4  // b.any
   0x0000fffff7fb77cc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb77d0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb77d4:	14000002	b	0xfffff7fb77dc
   0x0000fffff7fb77d8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb77dc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb77e0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb77e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb77e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb77ec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb77f0:	17ffffde	b	0xfffff7fb7768
   0x0000fffff7fb77f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb77f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb77fc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7800:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7804:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb7808:	aa1403e4	mov	x4, x20
   0x0000fffff7fb780c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7810:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb7814:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7818:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb781c:	d63f0200	blr	x16
   0x0000fffff7fb7820:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7824:	54003ae0	b.eq	0xfffff7fb7f80  // b.none
   0x0000fffff7fb7828:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb782c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb7830:	540004a0	b.eq	0xfffff7fb78c4  // b.none
   0x0000fffff7fb7834:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb7838:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb783c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb7840:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb7844:	54000400	b.eq	0xfffff7fb78c4  // b.none
   0x0000fffff7fb7848:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb784c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb7850:	36d801d1	tbz	w17, #27, 0xfffff7fb7888
   0x0000fffff7fb7854:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb7858:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb785c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb7860:	54000321	b.ne	0xfffff7fb78c4  // b.any
   0x0000fffff7fb7864:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb7868:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb786c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb7870:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7874:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7878:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb787c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb7880:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7884:	54000209	b.ls	0xfffff7fb78c4  // b.plast
   0x0000fffff7fb7888:	36d8008d	tbz	w13, #27, 0xfffff7fb7898
   0x0000fffff7fb788c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb7890:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7894:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7898:	36d80091	tbz	w17, #27, 0xfffff7fb78a8
   0x0000fffff7fb789c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb78a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb78a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb78a8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb78ac:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb78b0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb78b4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb78b8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb78bc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb78c0:	1400000e	b	0xfffff7fb78f8
   0x0000fffff7fb78c4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb78c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb78cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb78d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb78d4:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb78d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb78dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb78e0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb78e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb78e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb78ec:	d63f0200	blr	x16
   0x0000fffff7fb78f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb78f4:	540034a0	b.eq	0xfffff7fb7f88  // b.none
   0x0000fffff7fb78f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb78fc:	37d806a9	tbnz	w9, #27, 0xfffff7fb79d0
   0x0000fffff7fb7900:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7904:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7908:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb790c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7910:	540001c1	b.ne	0xfffff7fb7948  // b.any
   0x0000fffff7fb7914:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7918:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb791c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7920:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7924:	54000121	b.ne	0xfffff7fb7948  // b.any
   0x0000fffff7fb7928:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb792c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb7930:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb7934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb793c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb7940:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb7944:	14000030	b	0xfffff7fb7a04
   0x0000fffff7fb7948:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb794c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7954:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7958:	54000120	b.eq	0xfffff7fb797c  // b.none
   0x0000fffff7fb795c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7960:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7968:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb796c:	54000321	b.ne	0xfffff7fb79d0  // b.any
   0x0000fffff7fb7970:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7974:	9e620120	scvtf	d0, x9
   0x0000fffff7fb7978:	14000002	b	0xfffff7fb7980
   0x0000fffff7fb797c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb7980:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7984:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb798c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7990:	54000120	b.eq	0xfffff7fb79b4  // b.none
   0x0000fffff7fb7994:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7998:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb799c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb79a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb79a4:	54000161	b.ne	0xfffff7fb79d0  // b.any
   0x0000fffff7fb79a8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb79ac:	9e620121	scvtf	d1, x9
   0x0000fffff7fb79b0:	14000002	b	0xfffff7fb79b8
   0x0000fffff7fb79b4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb79b8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb79bc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb79c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb79c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb79c8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb79cc:	17ffffde	b	0xfffff7fb7944
   0x0000fffff7fb79d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb79d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb79d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb79dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb79e0:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb79e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb79e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb79ec:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb79f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb79f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb79f8:	d63f0200	blr	x16
   0x0000fffff7fb79fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7a00:	54002c80	b.eq	0xfffff7fb7f90  // b.none
   0x0000fffff7fb7a04:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb7a08:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb7a0c:	540004a0	b.eq	0xfffff7fb7aa0  // b.none
   0x0000fffff7fb7a10:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb7a14:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb7a18:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb7a1c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb7a20:	54000400	b.eq	0xfffff7fb7aa0  // b.none
   0x0000fffff7fb7a24:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb7a28:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb7a2c:	36d801d1	tbz	w17, #27, 0xfffff7fb7a64
   0x0000fffff7fb7a30:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb7a34:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7a38:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb7a3c:	54000321	b.ne	0xfffff7fb7aa0  // b.any
   0x0000fffff7fb7a40:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb7a44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7a48:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb7a4c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7a50:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7a54:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb7a58:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb7a5c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7a60:	54000209	b.ls	0xfffff7fb7aa0  // b.plast
   0x0000fffff7fb7a64:	36d8008d	tbz	w13, #27, 0xfffff7fb7a74
   0x0000fffff7fb7a68:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb7a6c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7a70:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7a74:	36d80091	tbz	w17, #27, 0xfffff7fb7a84
   0x0000fffff7fb7a78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7a7c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7a80:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb7a84:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb7a88:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb7a8c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb7a90:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb7a94:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb7a98:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb7a9c:	1400000e	b	0xfffff7fb7ad4
   0x0000fffff7fb7aa0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb7aa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7aa8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7aac:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7ab0:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb7ab4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7ab8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7abc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb7ac0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb7ac4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7ac8:	d63f0200	blr	x16
   0x0000fffff7fb7acc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7ad0:	54002640	b.eq	0xfffff7fb7f98  // b.none
   0x0000fffff7fb7ad4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7ad8:	37d806a9	tbnz	w9, #27, 0xfffff7fb7bac
   0x0000fffff7fb7adc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7ae0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7ae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7ae8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7aec:	540001c1	b.ne	0xfffff7fb7b24  // b.any
   0x0000fffff7fb7af0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7af4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7af8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7afc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7b00:	54000121	b.ne	0xfffff7fb7b24  // b.any
   0x0000fffff7fb7b04:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7b08:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb7b0c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb7b10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7b14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7b18:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb7b1c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb7b20:	14000030	b	0xfffff7fb7be0
   0x0000fffff7fb7b24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7b28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7b2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7b30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7b34:	54000120	b.eq	0xfffff7fb7b58  // b.none
   0x0000fffff7fb7b38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7b3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7b40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7b44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7b48:	54000321	b.ne	0xfffff7fb7bac  // b.any
   0x0000fffff7fb7b4c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7b50:	9e620120	scvtf	d0, x9
   0x0000fffff7fb7b54:	14000002	b	0xfffff7fb7b5c
   0x0000fffff7fb7b58:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb7b5c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7b60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7b64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7b68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7b6c:	54000120	b.eq	0xfffff7fb7b90  // b.none
   0x0000fffff7fb7b70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7b74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7b78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7b7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7b80:	54000161	b.ne	0xfffff7fb7bac  // b.any
   0x0000fffff7fb7b84:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb7b88:	9e620121	scvtf	d1, x9
   0x0000fffff7fb7b8c:	14000002	b	0xfffff7fb7b94
   0x0000fffff7fb7b90:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb7b94:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb7b98:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb7b9c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7ba0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7ba4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb7ba8:	17ffffde	b	0xfffff7fb7b20
   0x0000fffff7fb7bac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7bb0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7bb4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7bb8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7bbc:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb7bc0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7bc4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7bc8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb7bcc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7bd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7bd4:	d63f0200	blr	x16
   0x0000fffff7fb7bd8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7bdc:	54001e20	b.eq	0xfffff7fb7fa0  // b.none
   0x0000fffff7fb7be0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb7be4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb7be8:	540004a0	b.eq	0xfffff7fb7c7c  // b.none
   0x0000fffff7fb7bec:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb7bf0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb7bf4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb7bf8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb7bfc:	54000400	b.eq	0xfffff7fb7c7c  // b.none
   0x0000fffff7fb7c00:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb7c04:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb7c08:	36d801d1	tbz	w17, #27, 0xfffff7fb7c40
   0x0000fffff7fb7c0c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb7c10:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7c14:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb7c18:	54000321	b.ne	0xfffff7fb7c7c  // b.any
   0x0000fffff7fb7c1c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb7c20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7c24:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb7c28:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7c2c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7c30:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb7c34:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb7c38:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7c3c:	54000209	b.ls	0xfffff7fb7c7c  // b.plast
   0x0000fffff7fb7c40:	36d8008d	tbz	w13, #27, 0xfffff7fb7c50
   0x0000fffff7fb7c44:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb7c48:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7c4c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7c50:	36d80091	tbz	w17, #27, 0xfffff7fb7c60
   0x0000fffff7fb7c54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7c58:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7c5c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb7c60:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb7c64:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb7c68:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb7c6c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb7c70:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb7c74:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb7c78:	1400000e	b	0xfffff7fb7cb0
   0x0000fffff7fb7c7c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb7c80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7c84:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7c88:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7c8c:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb7c90:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7c94:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7c98:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fb7c9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb7ca0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7ca4:	d63f0200	blr	x16
   0x0000fffff7fb7ca8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7cac:	540017e0	b.eq	0xfffff7fb7fa8  // b.none
   0x0000fffff7fb7cb0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7cb4:	37d806a9	tbnz	w9, #27, 0xfffff7fb7d88
   0x0000fffff7fb7cb8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7cbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7cc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7cc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7cc8:	540001c1	b.ne	0xfffff7fb7d00  // b.any
   0x0000fffff7fb7ccc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7cd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7cd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7cd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7cdc:	54000121	b.ne	0xfffff7fb7d00  // b.any
   0x0000fffff7fb7ce0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7ce4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb7ce8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb7cec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7cf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7cf4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb7cf8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb7cfc:	14000030	b	0xfffff7fb7dbc
   0x0000fffff7fb7d00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7d04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7d08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7d0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7d10:	54000120	b.eq	0xfffff7fb7d34  // b.none
   0x0000fffff7fb7d14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7d18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7d1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7d20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7d24:	54000321	b.ne	0xfffff7fb7d88  // b.any
   0x0000fffff7fb7d28:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7d2c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb7d30:	14000002	b	0xfffff7fb7d38
   0x0000fffff7fb7d34:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb7d38:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7d3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7d40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7d44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7d48:	54000120	b.eq	0xfffff7fb7d6c  // b.none
   0x0000fffff7fb7d4c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7d50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7d54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7d58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7d5c:	54000161	b.ne	0xfffff7fb7d88  // b.any
   0x0000fffff7fb7d60:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb7d64:	9e620121	scvtf	d1, x9
   0x0000fffff7fb7d68:	14000002	b	0xfffff7fb7d70
   0x0000fffff7fb7d6c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb7d70:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb7d74:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb7d78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7d7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7d80:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb7d84:	17ffffde	b	0xfffff7fb7cfc
   0x0000fffff7fb7d88:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7d8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7d90:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7d94:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7d98:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb7d9c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7da0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7da4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fb7da8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7dac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7db0:	d63f0200	blr	x16
   0x0000fffff7fb7db4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7db8:	54000fc0	b.eq	0xfffff7fb7fb0  // b.none
   0x0000fffff7fb7dbc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb7dc0:	37d80269	tbnz	w9, #27, 0xfffff7fb7e0c
   0x0000fffff7fb7dc4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb7dc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7dcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7dd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7dd4:	540001c1	b.ne	0xfffff7fb7e0c  // b.any
   0x0000fffff7fb7dd8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb7ddc:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fb7de0:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fb7de4:	f9003669	str	x9, [x19, #104]
   0x0000fffff7fb7de8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7dec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7df0:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fb7df4:	aa0b03e9	mov	x9, x11
   0x0000fffff7fb7df8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7dfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7e00:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fb7e04:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fb7e08:	1400000e	b	0xfffff7fb7e40
   0x0000fffff7fb7e0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7e10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7e14:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7e18:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7e1c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb7e20:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7e24:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7e28:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fb7e2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7e30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7e34:	d63f0200	blr	x16
   0x0000fffff7fb7e38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7e3c:	54000be0	b.eq	0xfffff7fb7fb8  // b.none
   0x0000fffff7fb7e40:	17fff8d2	b	0xfffff7fb6188
   0x0000fffff7fb7e44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7e48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7e4c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7e50:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7e54:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb7e58:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7e5c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7e60:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fb7e64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb7e68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7e6c:	d63f0200	blr	x16
   0x0000fffff7fb7e70:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb7e74:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb7e78:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb7e7c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb7e80:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb7e84:	d65f03c0	ret
   0x0000fffff7fb7e88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7e8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7e90:	b900028a	str	w10, [x20]
   0x0000fffff7fb7e94:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb7e98:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb7e9c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb7ea0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb7ea4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb7ea8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb7eac:	d65f03c0	ret
   0x0000fffff7fb7eb0:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb7eb4:	17fffff5	b	0xfffff7fb7e88
   0x0000fffff7fb7eb8:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb7ebc:	17fffff3	b	0xfffff7fb7e88
   0x0000fffff7fb7ec0:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb7ec4:	17fffff1	b	0xfffff7fb7e88
   0x0000fffff7fb7ec8:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb7ecc:	17ffffef	b	0xfffff7fb7e88
   0x0000fffff7fb7ed0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb7ed4:	17ffffed	b	0xfffff7fb7e88
   0x0000fffff7fb7ed8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb7edc:	17ffffeb	b	0xfffff7fb7e88
   0x0000fffff7fb7ee0:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb7ee4:	17ffffe9	b	0xfffff7fb7e88
   0x0000fffff7fb7ee8:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb7eec:	17ffffe7	b	0xfffff7fb7e88
   0x0000fffff7fb7ef0:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb7ef4:	17ffffe5	b	0xfffff7fb7e88
   0x0000fffff7fb7ef8:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb7efc:	17ffffe3	b	0xfffff7fb7e88
   0x0000fffff7fb7f00:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb7f04:	17ffffe1	b	0xfffff7fb7e88
   0x0000fffff7fb7f08:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb7f0c:	17ffffdf	b	0xfffff7fb7e88
   0x0000fffff7fb7f10:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb7f14:	17ffffdd	b	0xfffff7fb7e88
   0x0000fffff7fb7f18:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb7f1c:	17ffffdb	b	0xfffff7fb7e88
   0x0000fffff7fb7f20:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb7f24:	17ffffd9	b	0xfffff7fb7e88
   0x0000fffff7fb7f28:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb7f2c:	17ffffd7	b	0xfffff7fb7e88
   0x0000fffff7fb7f30:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb7f34:	17ffffd5	b	0xfffff7fb7e88
   0x0000fffff7fb7f38:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb7f3c:	17ffffd3	b	0xfffff7fb7e88
   0x0000fffff7fb7f40:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb7f44:	17ffffd1	b	0xfffff7fb7e88
   0x0000fffff7fb7f48:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb7f4c:	17ffffcf	b	0xfffff7fb7e88
   0x0000fffff7fb7f50:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb7f54:	17ffffcd	b	0xfffff7fb7e88
   0x0000fffff7fb7f58:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb7f5c:	17ffffcb	b	0xfffff7fb7e88
   0x0000fffff7fb7f60:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb7f64:	17ffffc9	b	0xfffff7fb7e88
   0x0000fffff7fb7f68:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb7f6c:	17ffffc7	b	0xfffff7fb7e88
   0x0000fffff7fb7f70:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb7f74:	17ffffc5	b	0xfffff7fb7e88
   0x0000fffff7fb7f78:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb7f7c:	17ffffc3	b	0xfffff7fb7e88
   0x0000fffff7fb7f80:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb7f84:	17ffffc1	b	0xfffff7fb7e88
   0x0000fffff7fb7f88:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb7f8c:	17ffffbf	b	0xfffff7fb7e88
   0x0000fffff7fb7f90:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb7f94:	17ffffbd	b	0xfffff7fb7e88
   0x0000fffff7fb7f98:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb7f9c:	17ffffbb	b	0xfffff7fb7e88
   0x0000fffff7fb7fa0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb7fa4:	17ffffb9	b	0xfffff7fb7e88
   0x0000fffff7fb7fa8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb7fac:	17ffffb7	b	0xfffff7fb7e88
   0x0000fffff7fb7fb0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb7fb4:	17ffffb5	b	0xfffff7fb7e88
   0x0000fffff7fb7fb8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb7fbc:	17ffffb3	b	0xfffff7fb7e88
   0x0000fffff7fb7fc0:	00000000	udf	#0
   0x0000fffff7fb7fc4:	00000000	udf	#0
   0x0000fffff7fb7fc8:	00000000	udf	#0
   0x0000fffff7fb7fcc:	00000000	udf	#0
   0x0000fffff7fb7fd0:	00000000	udf	#0
   0x0000fffff7fb7fd4:	00000000	udf	#0
   0x0000fffff7fb7fd8:	00000000	udf	#0
   0x0000fffff7fb7fdc:	00000000	udf	#0
   0x0000fffff7fb7fe0:	00000000	udf	#0
   0x0000fffff7fb7fe4:	00000000	udf	#0
   0x0000fffff7fb7fe8:	00000000	udf	#0
   0x0000fffff7fb7fec:	00000000	udf	#0
   0x0000fffff7fb7ff0:	00000000	udf	#0
   0x0000fffff7fb7ff4:	00000000	udf	#0
   0x0000fffff7fb7ff8:	00000000	udf	#0
   0x0000fffff7fb7ffc:	00000000	udf	#0
End of assembler dump.
