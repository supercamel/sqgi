Dump of assembler code from 0xfffff7fa6000 to 0xfffff7fa8000:
   0x0000fffff7fa6000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa6004:	910003fd	mov	x29, sp
   0x0000fffff7fa6008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa600c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa6010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa6014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa6018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa601c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa6020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa6024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa6028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa602c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa6030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa6034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa6038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fa603c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa6040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6044:	d63f0200	blr	x16
   0x0000fffff7fa6048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa604c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa6050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa6054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa6058:	14000001	b	0xfffff7fa605c
   0x0000fffff7fa605c:	14000001	b	0xfffff7fa6060
   0x0000fffff7fa6060:	14000001	b	0xfffff7fa6064
   0x0000fffff7fa6064:	14000001	b	0xfffff7fa6068
   0x0000fffff7fa6068:	14000001	b	0xfffff7fa606c
   0x0000fffff7fa606c:	14000001	b	0xfffff7fa6070
   0x0000fffff7fa6070:	14000001	b	0xfffff7fa6074
   0x0000fffff7fa6074:	14000001	b	0xfffff7fa6078
   0x0000fffff7fa6078:	14000001	b	0xfffff7fa607c
   0x0000fffff7fa607c:	14000001	b	0xfffff7fa6080
   0x0000fffff7fa6080:	14000001	b	0xfffff7fa6084
   0x0000fffff7fa6084:	14000001	b	0xfffff7fa6088
   0x0000fffff7fa6088:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa608c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa6090:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa6094:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa6098:	36d80211	tbz	w17, #27, 0xfffff7fa60d8
   0x0000fffff7fa609c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa60a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa60a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa60a8:	540001e1	b.ne	0xfffff7fa60e4  // b.any
   0x0000fffff7fa60ac:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa60b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa60b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa60b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa60bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa60c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa60c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa60c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa60cc:	540000c9	b.ls	0xfffff7fa60e4  // b.plast
   0x0000fffff7fa60d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa60d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa60d8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa60dc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa60e0:	1400000e	b	0xfffff7fa6118
   0x0000fffff7fa60e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa60e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa60ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fa60f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa60f4:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa60f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa60fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6100:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa6104:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6108:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa610c:	d63f0200	blr	x16
   0x0000fffff7fa6110:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6114:	5400ede0	b.eq	0xfffff7fa7ed0  // b.none
   0x0000fffff7fa6118:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa611c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa6120:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa6124:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fa6128:	36d80211	tbz	w17, #27, 0xfffff7fa6168
   0x0000fffff7fa612c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6130:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6134:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6138:	540001e1	b.ne	0xfffff7fa6174  // b.any
   0x0000fffff7fa613c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa6140:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6144:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6148:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa614c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6150:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6154:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6158:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa615c:	540000c9	b.ls	0xfffff7fa6174  // b.plast
   0x0000fffff7fa6160:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6164:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6168:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa616c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa6170:	1400000e	b	0xfffff7fa61a8
   0x0000fffff7fa6174:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6178:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa617c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6180:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6184:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa6188:	aa1403e4	mov	x4, x20
   0x0000fffff7fa618c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6190:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa6194:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6198:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa619c:	d63f0200	blr	x16
   0x0000fffff7fa61a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa61a4:	5400e9a0	b.eq	0xfffff7fa7ed8  // b.none
   0x0000fffff7fa61a8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa61ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa61b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa61b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa61b8:	54000421	b.ne	0xfffff7fa623c  // b.any
   0x0000fffff7fa61bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa61c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa61c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa61c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa61cc:	54000381	b.ne	0xfffff7fa623c  // b.any
   0x0000fffff7fa61d0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa61d4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fa61d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa61dc:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fa61e0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fa61e4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fa61e8:	91000580	add	x0, x12, #0x1
   0x0000fffff7fa61ec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa61f0:	36d80211	tbz	w17, #27, 0xfffff7fa6230
   0x0000fffff7fa61f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa61f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa61fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6200:	540001e1	b.ne	0xfffff7fa623c  // b.any
   0x0000fffff7fa6204:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6208:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa620c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6210:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6214:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6218:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa621c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6220:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6224:	540000c9	b.ls	0xfffff7fa623c  // b.plast
   0x0000fffff7fa6228:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa622c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6230:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fa6234:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fa6238:	1400000e	b	0xfffff7fa6270
   0x0000fffff7fa623c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6240:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6244:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6248:	aa1503e2	mov	x2, x21
   0x0000fffff7fa624c:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa6250:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6254:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6258:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fa625c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6260:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6264:	d63f0200	blr	x16
   0x0000fffff7fa6268:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa626c:	5400e3a0	b.eq	0xfffff7fa7ee0  // b.none
   0x0000fffff7fa6270:	f100041f	cmp	x0, #0x1
   0x0000fffff7fa6274:	5400df80	b.eq	0xfffff7fa7e64  // b.none
   0x0000fffff7fa6278:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa627c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa6280:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fa6284:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa6288:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa628c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fa6290:	36d801d1	tbz	w17, #27, 0xfffff7fa62c8
   0x0000fffff7fa6294:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6298:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa629c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa62a0:	54000281	b.ne	0xfffff7fa62f0  // b.any
   0x0000fffff7fa62a4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa62a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa62ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa62b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa62b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa62b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa62bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa62c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa62c4:	54000169	b.ls	0xfffff7fa62f0  // b.plast
   0x0000fffff7fa62c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa62cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa62d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa62d4:	36d80091	tbz	w17, #27, 0xfffff7fa62e4
   0x0000fffff7fa62d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa62dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa62e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa62e4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa62e8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa62ec:	1400000e	b	0xfffff7fa6324
   0x0000fffff7fa62f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa62f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa62f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa62fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6300:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa6304:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6308:	aa1603e5	mov	x5, x22
   0x0000fffff7fa630c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa6310:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6314:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6318:	d63f0200	blr	x16
   0x0000fffff7fa631c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6320:	5400de40	b.eq	0xfffff7fa7ee8  // b.none
   0x0000fffff7fa6324:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa6328:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa632c:	540003a0	b.eq	0xfffff7fa63a0  // b.none
   0x0000fffff7fa6330:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fa6334:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fa6338:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa633c:	36d801d1	tbz	w17, #27, 0xfffff7fa6374
   0x0000fffff7fa6340:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6344:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6348:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa634c:	540002a1	b.ne	0xfffff7fa63a0  // b.any
   0x0000fffff7fa6350:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa6354:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6358:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa635c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6360:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6364:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6368:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa636c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6370:	54000189	b.ls	0xfffff7fa63a0  // b.plast
   0x0000fffff7fa6374:	36d8008d	tbz	w13, #27, 0xfffff7fa6384
   0x0000fffff7fa6378:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa637c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6380:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6384:	36d80091	tbz	w17, #27, 0xfffff7fa6394
   0x0000fffff7fa6388:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa638c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6390:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6394:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa6398:	b900016d	str	w13, [x11]
   0x0000fffff7fa639c:	1400000e	b	0xfffff7fa63d4
   0x0000fffff7fa63a0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa63a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa63a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa63ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa63b0:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa63b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa63b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa63bc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa63c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa63c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa63c8:	d63f0200	blr	x16
   0x0000fffff7fa63cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa63d0:	5400d900	b.eq	0xfffff7fa7ef0  // b.none
   0x0000fffff7fa63d4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa63d8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa63dc:	540004a0	b.eq	0xfffff7fa6470  // b.none
   0x0000fffff7fa63e0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa63e4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa63e8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa63ec:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa63f0:	54000400	b.eq	0xfffff7fa6470  // b.none
   0x0000fffff7fa63f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa63f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa63fc:	36d801d1	tbz	w17, #27, 0xfffff7fa6434
   0x0000fffff7fa6400:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6404:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6408:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa640c:	54000321	b.ne	0xfffff7fa6470  // b.any
   0x0000fffff7fa6410:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6414:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6418:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa641c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6420:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6424:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6428:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa642c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6430:	54000209	b.ls	0xfffff7fa6470  // b.plast
   0x0000fffff7fa6434:	36d8008d	tbz	w13, #27, 0xfffff7fa6444
   0x0000fffff7fa6438:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa643c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6440:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6444:	36d80091	tbz	w17, #27, 0xfffff7fa6454
   0x0000fffff7fa6448:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa644c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6450:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6454:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa6458:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa645c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6460:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6464:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa6468:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa646c:	1400000e	b	0xfffff7fa64a4
   0x0000fffff7fa6470:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6474:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6478:	aa1303e1	mov	x1, x19
   0x0000fffff7fa647c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6480:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa6484:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6488:	aa1603e5	mov	x5, x22
   0x0000fffff7fa648c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa6490:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6494:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6498:	d63f0200	blr	x16
   0x0000fffff7fa649c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa64a0:	5400d2c0	b.eq	0xfffff7fa7ef8  // b.none
   0x0000fffff7fa64a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa64a8:	37d806a9	tbnz	w9, #27, 0xfffff7fa657c
   0x0000fffff7fa64ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa64b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa64b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa64b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa64bc:	540001c1	b.ne	0xfffff7fa64f4  // b.any
   0x0000fffff7fa64c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa64c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa64c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa64cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa64d0:	54000121	b.ne	0xfffff7fa64f4  // b.any
   0x0000fffff7fa64d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa64d8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa64dc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa64e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa64e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa64e8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa64ec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa64f0:	14000030	b	0xfffff7fa65b0
   0x0000fffff7fa64f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa64f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa64fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6500:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6504:	54000120	b.eq	0xfffff7fa6528  // b.none
   0x0000fffff7fa6508:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa650c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6510:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6514:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6518:	54000321	b.ne	0xfffff7fa657c  // b.any
   0x0000fffff7fa651c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6520:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6524:	14000002	b	0xfffff7fa652c
   0x0000fffff7fa6528:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa652c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6530:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6534:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6538:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa653c:	54000120	b.eq	0xfffff7fa6560  // b.none
   0x0000fffff7fa6540:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6544:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6548:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa654c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6550:	54000161	b.ne	0xfffff7fa657c  // b.any
   0x0000fffff7fa6554:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa6558:	9e620121	scvtf	d1, x9
   0x0000fffff7fa655c:	14000002	b	0xfffff7fa6564
   0x0000fffff7fa6560:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa6564:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6568:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa656c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6574:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6578:	17ffffde	b	0xfffff7fa64f0
   0x0000fffff7fa657c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6580:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6584:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6588:	aa1503e2	mov	x2, x21
   0x0000fffff7fa658c:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa6590:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6594:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6598:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa659c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa65a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa65a4:	d63f0200	blr	x16
   0x0000fffff7fa65a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa65ac:	5400caa0	b.eq	0xfffff7fa7f00  // b.none
   0x0000fffff7fa65b0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa65b4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa65b8:	540004a0	b.eq	0xfffff7fa664c  // b.none
   0x0000fffff7fa65bc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa65c0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa65c4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa65c8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa65cc:	54000400	b.eq	0xfffff7fa664c  // b.none
   0x0000fffff7fa65d0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa65d4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa65d8:	36d801d1	tbz	w17, #27, 0xfffff7fa6610
   0x0000fffff7fa65dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa65e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa65e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa65e8:	54000321	b.ne	0xfffff7fa664c  // b.any
   0x0000fffff7fa65ec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa65f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa65f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa65f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa65fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6600:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6604:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6608:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa660c:	54000209	b.ls	0xfffff7fa664c  // b.plast
   0x0000fffff7fa6610:	36d8008d	tbz	w13, #27, 0xfffff7fa6620
   0x0000fffff7fa6614:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6618:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa661c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6620:	36d80091	tbz	w17, #27, 0xfffff7fa6630
   0x0000fffff7fa6624:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6628:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa662c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6630:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa6634:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa6638:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa663c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6640:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa6644:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa6648:	1400000e	b	0xfffff7fa6680
   0x0000fffff7fa664c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6650:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6654:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6658:	aa1503e2	mov	x2, x21
   0x0000fffff7fa665c:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa6660:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6664:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6668:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa666c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6670:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6674:	d63f0200	blr	x16
   0x0000fffff7fa6678:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa667c:	5400c460	b.eq	0xfffff7fa7f08  // b.none
   0x0000fffff7fa6680:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6684:	37d806a9	tbnz	w9, #27, 0xfffff7fa6758
   0x0000fffff7fa6688:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa668c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6698:	540001c1	b.ne	0xfffff7fa66d0  // b.any
   0x0000fffff7fa669c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa66a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa66a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa66a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa66ac:	54000121	b.ne	0xfffff7fa66d0  // b.any
   0x0000fffff7fa66b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa66b4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa66b8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa66bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa66c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa66c4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa66c8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa66cc:	14000030	b	0xfffff7fa678c
   0x0000fffff7fa66d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa66d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa66d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa66dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa66e0:	54000120	b.eq	0xfffff7fa6704  // b.none
   0x0000fffff7fa66e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa66e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa66ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa66f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa66f4:	54000321	b.ne	0xfffff7fa6758  // b.any
   0x0000fffff7fa66f8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa66fc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6700:	14000002	b	0xfffff7fa6708
   0x0000fffff7fa6704:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa6708:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa670c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6710:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6714:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6718:	54000120	b.eq	0xfffff7fa673c  // b.none
   0x0000fffff7fa671c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6720:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6724:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6728:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa672c:	54000161	b.ne	0xfffff7fa6758  // b.any
   0x0000fffff7fa6730:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa6734:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6738:	14000002	b	0xfffff7fa6740
   0x0000fffff7fa673c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa6740:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6744:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa6748:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa674c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6750:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6754:	17ffffde	b	0xfffff7fa66cc
   0x0000fffff7fa6758:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa675c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6760:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6764:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6768:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa676c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6770:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6774:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6778:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa677c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6780:	d63f0200	blr	x16
   0x0000fffff7fa6784:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6788:	5400bc40	b.eq	0xfffff7fa7f10  // b.none
   0x0000fffff7fa678c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6790:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6794:	540004a0	b.eq	0xfffff7fa6828  // b.none
   0x0000fffff7fa6798:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa679c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa67a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa67a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa67a8:	54000400	b.eq	0xfffff7fa6828  // b.none
   0x0000fffff7fa67ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa67b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa67b4:	36d801d1	tbz	w17, #27, 0xfffff7fa67ec
   0x0000fffff7fa67b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa67bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa67c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa67c4:	54000321	b.ne	0xfffff7fa6828  // b.any
   0x0000fffff7fa67c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa67cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa67d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa67d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa67d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa67dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa67e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa67e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa67e8:	54000209	b.ls	0xfffff7fa6828  // b.plast
   0x0000fffff7fa67ec:	36d8008d	tbz	w13, #27, 0xfffff7fa67fc
   0x0000fffff7fa67f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa67f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa67f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa67fc:	36d80091	tbz	w17, #27, 0xfffff7fa680c
   0x0000fffff7fa6800:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6804:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6808:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa680c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa6810:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa6814:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6818:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa681c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa6820:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa6824:	1400000e	b	0xfffff7fa685c
   0x0000fffff7fa6828:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa682c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6830:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6834:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6838:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa683c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6840:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6844:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa6848:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa684c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6850:	d63f0200	blr	x16
   0x0000fffff7fa6854:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6858:	5400b600	b.eq	0xfffff7fa7f18  // b.none
   0x0000fffff7fa685c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6860:	37d806a9	tbnz	w9, #27, 0xfffff7fa6934
   0x0000fffff7fa6864:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa686c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6870:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6874:	540001c1	b.ne	0xfffff7fa68ac  // b.any
   0x0000fffff7fa6878:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa687c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6884:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6888:	54000121	b.ne	0xfffff7fa68ac  // b.any
   0x0000fffff7fa688c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6890:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa6894:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa689c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa68a0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa68a4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa68a8:	14000030	b	0xfffff7fa6968
   0x0000fffff7fa68ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa68b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa68b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa68b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa68bc:	54000120	b.eq	0xfffff7fa68e0  // b.none
   0x0000fffff7fa68c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa68c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa68c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa68cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa68d0:	54000321	b.ne	0xfffff7fa6934  // b.any
   0x0000fffff7fa68d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa68d8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa68dc:	14000002	b	0xfffff7fa68e4
   0x0000fffff7fa68e0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa68e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa68e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa68ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa68f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa68f4:	54000120	b.eq	0xfffff7fa6918  // b.none
   0x0000fffff7fa68f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa68fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6900:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6904:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6908:	54000161	b.ne	0xfffff7fa6934  // b.any
   0x0000fffff7fa690c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa6910:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6914:	14000002	b	0xfffff7fa691c
   0x0000fffff7fa6918:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa691c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6920:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa6924:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa692c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6930:	17ffffde	b	0xfffff7fa68a8
   0x0000fffff7fa6934:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6938:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa693c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6940:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6944:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa6948:	aa1403e4	mov	x4, x20
   0x0000fffff7fa694c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6950:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6954:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6958:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa695c:	d63f0200	blr	x16
   0x0000fffff7fa6960:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6964:	5400ade0	b.eq	0xfffff7fa7f20  // b.none
   0x0000fffff7fa6968:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa696c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6970:	540004a0	b.eq	0xfffff7fa6a04  // b.none
   0x0000fffff7fa6974:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6978:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa697c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6980:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6984:	54000400	b.eq	0xfffff7fa6a04  // b.none
   0x0000fffff7fa6988:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa698c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6990:	36d801d1	tbz	w17, #27, 0xfffff7fa69c8
   0x0000fffff7fa6994:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6998:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa699c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa69a0:	54000321	b.ne	0xfffff7fa6a04  // b.any
   0x0000fffff7fa69a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa69a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa69ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa69b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa69b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa69b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa69bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa69c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa69c4:	54000209	b.ls	0xfffff7fa6a04  // b.plast
   0x0000fffff7fa69c8:	36d8008d	tbz	w13, #27, 0xfffff7fa69d8
   0x0000fffff7fa69cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa69d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa69d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa69d8:	36d80091	tbz	w17, #27, 0xfffff7fa69e8
   0x0000fffff7fa69dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa69e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa69e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa69e8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa69ec:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa69f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa69f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa69f8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa69fc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa6a00:	1400000e	b	0xfffff7fa6a38
   0x0000fffff7fa6a04:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6a08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6a0c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6a10:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6a14:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa6a18:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6a1c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6a20:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa6a24:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6a28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6a2c:	d63f0200	blr	x16
   0x0000fffff7fa6a30:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6a34:	5400a7a0	b.eq	0xfffff7fa7f28  // b.none
   0x0000fffff7fa6a38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6a3c:	37d806a9	tbnz	w9, #27, 0xfffff7fa6b10
   0x0000fffff7fa6a40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6a44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6a48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6a4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6a50:	540001c1	b.ne	0xfffff7fa6a88  // b.any
   0x0000fffff7fa6a54:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6a58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6a5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6a60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6a64:	54000121	b.ne	0xfffff7fa6a88  // b.any
   0x0000fffff7fa6a68:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6a6c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa6a70:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6a74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6a78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6a7c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa6a80:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6a84:	14000030	b	0xfffff7fa6b44
   0x0000fffff7fa6a88:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6a8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6a90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6a94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6a98:	54000120	b.eq	0xfffff7fa6abc  // b.none
   0x0000fffff7fa6a9c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6aa0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6aa4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6aa8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6aac:	54000321	b.ne	0xfffff7fa6b10  // b.any
   0x0000fffff7fa6ab0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6ab4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6ab8:	14000002	b	0xfffff7fa6ac0
   0x0000fffff7fa6abc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa6ac0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6ac4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6ac8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6acc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6ad0:	54000120	b.eq	0xfffff7fa6af4  // b.none
   0x0000fffff7fa6ad4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6ad8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6adc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ae0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6ae4:	54000161	b.ne	0xfffff7fa6b10  // b.any
   0x0000fffff7fa6ae8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa6aec:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6af0:	14000002	b	0xfffff7fa6af8
   0x0000fffff7fa6af4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa6af8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6afc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa6b00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6b04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6b08:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6b0c:	17ffffde	b	0xfffff7fa6a84
   0x0000fffff7fa6b10:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6b14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6b18:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6b1c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6b20:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa6b24:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6b28:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6b2c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6b30:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6b34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6b38:	d63f0200	blr	x16
   0x0000fffff7fa6b3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6b40:	54009f80	b.eq	0xfffff7fa7f30  // b.none
   0x0000fffff7fa6b44:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6b48:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6b4c:	540004a0	b.eq	0xfffff7fa6be0  // b.none
   0x0000fffff7fa6b50:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6b54:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6b58:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6b5c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6b60:	54000400	b.eq	0xfffff7fa6be0  // b.none
   0x0000fffff7fa6b64:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6b68:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6b6c:	36d801d1	tbz	w17, #27, 0xfffff7fa6ba4
   0x0000fffff7fa6b70:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6b74:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6b78:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6b7c:	54000321	b.ne	0xfffff7fa6be0  // b.any
   0x0000fffff7fa6b80:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6b84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6b88:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6b8c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6b90:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6b94:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6b98:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6b9c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6ba0:	54000209	b.ls	0xfffff7fa6be0  // b.plast
   0x0000fffff7fa6ba4:	36d8008d	tbz	w13, #27, 0xfffff7fa6bb4
   0x0000fffff7fa6ba8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6bac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6bb0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6bb4:	36d80091	tbz	w17, #27, 0xfffff7fa6bc4
   0x0000fffff7fa6bb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6bbc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6bc0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6bc4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa6bc8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa6bcc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6bd0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6bd4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa6bd8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa6bdc:	1400000e	b	0xfffff7fa6c14
   0x0000fffff7fa6be0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6be4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6be8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6bec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6bf0:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa6bf4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6bf8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6bfc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa6c00:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6c04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6c08:	d63f0200	blr	x16
   0x0000fffff7fa6c0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6c10:	54009940	b.eq	0xfffff7fa7f38  // b.none
   0x0000fffff7fa6c14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6c18:	37d806a9	tbnz	w9, #27, 0xfffff7fa6cec
   0x0000fffff7fa6c1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6c20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6c24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6c28:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6c2c:	540001c1	b.ne	0xfffff7fa6c64  // b.any
   0x0000fffff7fa6c30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6c34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6c38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6c3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6c40:	54000121	b.ne	0xfffff7fa6c64  // b.any
   0x0000fffff7fa6c44:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6c48:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa6c4c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6c50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6c54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6c58:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa6c5c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6c60:	14000030	b	0xfffff7fa6d20
   0x0000fffff7fa6c64:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6c68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6c6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6c70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6c74:	54000120	b.eq	0xfffff7fa6c98  // b.none
   0x0000fffff7fa6c78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6c7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6c80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6c84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6c88:	54000321	b.ne	0xfffff7fa6cec  // b.any
   0x0000fffff7fa6c8c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6c90:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6c94:	14000002	b	0xfffff7fa6c9c
   0x0000fffff7fa6c98:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa6c9c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6ca0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6ca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ca8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6cac:	54000120	b.eq	0xfffff7fa6cd0  // b.none
   0x0000fffff7fa6cb0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6cb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6cb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6cbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6cc0:	54000161	b.ne	0xfffff7fa6cec  // b.any
   0x0000fffff7fa6cc4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa6cc8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6ccc:	14000002	b	0xfffff7fa6cd4
   0x0000fffff7fa6cd0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa6cd4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6cd8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa6cdc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ce4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6ce8:	17ffffde	b	0xfffff7fa6c60
   0x0000fffff7fa6cec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6cf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6cf4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6cf8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6cfc:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa6d00:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6d04:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6d08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6d0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6d10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6d14:	d63f0200	blr	x16
   0x0000fffff7fa6d18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6d1c:	54009120	b.eq	0xfffff7fa7f40  // b.none
   0x0000fffff7fa6d20:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6d24:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6d28:	540004a0	b.eq	0xfffff7fa6dbc  // b.none
   0x0000fffff7fa6d2c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6d30:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6d34:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6d38:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6d3c:	54000400	b.eq	0xfffff7fa6dbc  // b.none
   0x0000fffff7fa6d40:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6d44:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6d48:	36d801d1	tbz	w17, #27, 0xfffff7fa6d80
   0x0000fffff7fa6d4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6d50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6d54:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6d58:	54000321	b.ne	0xfffff7fa6dbc  // b.any
   0x0000fffff7fa6d5c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6d60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6d64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6d68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6d6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6d70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6d74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6d78:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6d7c:	54000209	b.ls	0xfffff7fa6dbc  // b.plast
   0x0000fffff7fa6d80:	36d8008d	tbz	w13, #27, 0xfffff7fa6d90
   0x0000fffff7fa6d84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6d88:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6d8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6d90:	36d80091	tbz	w17, #27, 0xfffff7fa6da0
   0x0000fffff7fa6d94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6d98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6d9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6da0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa6da4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa6da8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6dac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6db0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa6db4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa6db8:	1400000e	b	0xfffff7fa6df0
   0x0000fffff7fa6dbc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6dc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6dc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6dc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6dcc:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa6dd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6dd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6dd8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa6ddc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6de0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6de4:	d63f0200	blr	x16
   0x0000fffff7fa6de8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6dec:	54008ae0	b.eq	0xfffff7fa7f48  // b.none
   0x0000fffff7fa6df0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6df4:	37d806a9	tbnz	w9, #27, 0xfffff7fa6ec8
   0x0000fffff7fa6df8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6dfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6e00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6e04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6e08:	540001c1	b.ne	0xfffff7fa6e40  // b.any
   0x0000fffff7fa6e0c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6e10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6e14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6e18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6e1c:	54000121	b.ne	0xfffff7fa6e40  // b.any
   0x0000fffff7fa6e20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6e24:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa6e28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6e2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6e30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6e34:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa6e38:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6e3c:	14000030	b	0xfffff7fa6efc
   0x0000fffff7fa6e40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6e44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6e48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6e4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6e50:	54000120	b.eq	0xfffff7fa6e74  // b.none
   0x0000fffff7fa6e54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6e58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6e5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6e60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6e64:	54000321	b.ne	0xfffff7fa6ec8  // b.any
   0x0000fffff7fa6e68:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6e6c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6e70:	14000002	b	0xfffff7fa6e78
   0x0000fffff7fa6e74:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa6e78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6e7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6e80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6e84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6e88:	54000120	b.eq	0xfffff7fa6eac  // b.none
   0x0000fffff7fa6e8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6e90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6e94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6e98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6e9c:	54000161	b.ne	0xfffff7fa6ec8  // b.any
   0x0000fffff7fa6ea0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa6ea4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6ea8:	14000002	b	0xfffff7fa6eb0
   0x0000fffff7fa6eac:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa6eb0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6eb4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa6eb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6ebc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ec0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa6ec4:	17ffffde	b	0xfffff7fa6e3c
   0x0000fffff7fa6ec8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6ecc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6ed0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6ed4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6ed8:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa6edc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6ee0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6ee4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa6ee8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6eec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6ef0:	d63f0200	blr	x16
   0x0000fffff7fa6ef4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6ef8:	540082c0	b.eq	0xfffff7fa7f50  // b.none
   0x0000fffff7fa6efc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6f00:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6f04:	540004a0	b.eq	0xfffff7fa6f98  // b.none
   0x0000fffff7fa6f08:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6f0c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6f10:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6f14:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6f18:	54000400	b.eq	0xfffff7fa6f98  // b.none
   0x0000fffff7fa6f1c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6f20:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6f24:	36d801d1	tbz	w17, #27, 0xfffff7fa6f5c
   0x0000fffff7fa6f28:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6f2c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6f30:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6f34:	54000321	b.ne	0xfffff7fa6f98  // b.any
   0x0000fffff7fa6f38:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6f3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6f40:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6f44:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6f48:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6f4c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6f50:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6f54:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6f58:	54000209	b.ls	0xfffff7fa6f98  // b.plast
   0x0000fffff7fa6f5c:	36d8008d	tbz	w13, #27, 0xfffff7fa6f6c
   0x0000fffff7fa6f60:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6f64:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6f68:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6f6c:	36d80091	tbz	w17, #27, 0xfffff7fa6f7c
   0x0000fffff7fa6f70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6f74:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6f78:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6f7c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa6f80:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa6f84:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6f88:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6f8c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa6f90:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa6f94:	1400000e	b	0xfffff7fa6fcc
   0x0000fffff7fa6f98:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6f9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6fa0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6fa4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6fa8:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa6fac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6fb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6fb4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa6fb8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6fbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6fc0:	d63f0200	blr	x16
   0x0000fffff7fa6fc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6fc8:	54007c80	b.eq	0xfffff7fa7f58  // b.none
   0x0000fffff7fa6fcc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6fd0:	37d806a9	tbnz	w9, #27, 0xfffff7fa70a4
   0x0000fffff7fa6fd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6fd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6fdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6fe0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6fe4:	540001c1	b.ne	0xfffff7fa701c  // b.any
   0x0000fffff7fa6fe8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa6fec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6ff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ff4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6ff8:	54000121	b.ne	0xfffff7fa701c  // b.any
   0x0000fffff7fa6ffc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7000:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa7004:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7008:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa700c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7010:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa7014:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7018:	14000030	b	0xfffff7fa70d8
   0x0000fffff7fa701c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7020:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7024:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7028:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa702c:	54000120	b.eq	0xfffff7fa7050  // b.none
   0x0000fffff7fa7030:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7034:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7038:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa703c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7040:	54000321	b.ne	0xfffff7fa70a4  // b.any
   0x0000fffff7fa7044:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7048:	9e620120	scvtf	d0, x9
   0x0000fffff7fa704c:	14000002	b	0xfffff7fa7054
   0x0000fffff7fa7050:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa7054:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7058:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa705c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7060:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7064:	54000120	b.eq	0xfffff7fa7088  // b.none
   0x0000fffff7fa7068:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa706c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7070:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7074:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7078:	54000161	b.ne	0xfffff7fa70a4  // b.any
   0x0000fffff7fa707c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa7080:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7084:	14000002	b	0xfffff7fa708c
   0x0000fffff7fa7088:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa708c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7090:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa7094:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7098:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa709c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa70a0:	17ffffde	b	0xfffff7fa7018
   0x0000fffff7fa70a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa70a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa70ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fa70b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa70b4:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa70b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa70bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa70c0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa70c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa70c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa70cc:	d63f0200	blr	x16
   0x0000fffff7fa70d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa70d4:	54007460	b.eq	0xfffff7fa7f60  // b.none
   0x0000fffff7fa70d8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa70dc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa70e0:	540004a0	b.eq	0xfffff7fa7174  // b.none
   0x0000fffff7fa70e4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa70e8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa70ec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa70f0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa70f4:	54000400	b.eq	0xfffff7fa7174  // b.none
   0x0000fffff7fa70f8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa70fc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7100:	36d801d1	tbz	w17, #27, 0xfffff7fa7138
   0x0000fffff7fa7104:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7108:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa710c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7110:	54000321	b.ne	0xfffff7fa7174  // b.any
   0x0000fffff7fa7114:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7118:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa711c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7120:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7124:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7128:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa712c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7130:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7134:	54000209	b.ls	0xfffff7fa7174  // b.plast
   0x0000fffff7fa7138:	36d8008d	tbz	w13, #27, 0xfffff7fa7148
   0x0000fffff7fa713c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa7140:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7144:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7148:	36d80091	tbz	w17, #27, 0xfffff7fa7158
   0x0000fffff7fa714c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7150:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7154:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7158:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa715c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa7160:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7164:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7168:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa716c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa7170:	1400000e	b	0xfffff7fa71a8
   0x0000fffff7fa7174:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7178:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa717c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7180:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7184:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa7188:	aa1403e4	mov	x4, x20
   0x0000fffff7fa718c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7190:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7194:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7198:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa719c:	d63f0200	blr	x16
   0x0000fffff7fa71a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa71a4:	54006e20	b.eq	0xfffff7fa7f68  // b.none
   0x0000fffff7fa71a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa71ac:	37d806a9	tbnz	w9, #27, 0xfffff7fa7280
   0x0000fffff7fa71b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa71b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa71b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa71bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa71c0:	540001c1	b.ne	0xfffff7fa71f8  // b.any
   0x0000fffff7fa71c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa71c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa71cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa71d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa71d4:	54000121	b.ne	0xfffff7fa71f8  // b.any
   0x0000fffff7fa71d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa71dc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa71e0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa71e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa71e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa71ec:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa71f0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa71f4:	14000030	b	0xfffff7fa72b4
   0x0000fffff7fa71f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa71fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7200:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7204:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7208:	54000120	b.eq	0xfffff7fa722c  // b.none
   0x0000fffff7fa720c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7210:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7214:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7218:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa721c:	54000321	b.ne	0xfffff7fa7280  // b.any
   0x0000fffff7fa7220:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7224:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7228:	14000002	b	0xfffff7fa7230
   0x0000fffff7fa722c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa7230:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7234:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7238:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa723c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7240:	54000120	b.eq	0xfffff7fa7264  // b.none
   0x0000fffff7fa7244:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7248:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa724c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7250:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7254:	54000161	b.ne	0xfffff7fa7280  // b.any
   0x0000fffff7fa7258:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa725c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7260:	14000002	b	0xfffff7fa7268
   0x0000fffff7fa7264:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa7268:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa726c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa7270:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7274:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7278:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa727c:	17ffffde	b	0xfffff7fa71f4
   0x0000fffff7fa7280:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7284:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7288:	aa1303e1	mov	x1, x19
   0x0000fffff7fa728c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7290:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa7294:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7298:	aa1603e5	mov	x5, x22
   0x0000fffff7fa729c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa72a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa72a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa72a8:	d63f0200	blr	x16
   0x0000fffff7fa72ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa72b0:	54006600	b.eq	0xfffff7fa7f70  // b.none
   0x0000fffff7fa72b4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa72b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa72bc:	540004a0	b.eq	0xfffff7fa7350  // b.none
   0x0000fffff7fa72c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa72c4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa72c8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa72cc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa72d0:	54000400	b.eq	0xfffff7fa7350  // b.none
   0x0000fffff7fa72d4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa72d8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa72dc:	36d801d1	tbz	w17, #27, 0xfffff7fa7314
   0x0000fffff7fa72e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa72e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa72e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa72ec:	54000321	b.ne	0xfffff7fa7350  // b.any
   0x0000fffff7fa72f0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa72f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa72f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa72fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7300:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7304:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7308:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa730c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7310:	54000209	b.ls	0xfffff7fa7350  // b.plast
   0x0000fffff7fa7314:	36d8008d	tbz	w13, #27, 0xfffff7fa7324
   0x0000fffff7fa7318:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa731c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7320:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7324:	36d80091	tbz	w17, #27, 0xfffff7fa7334
   0x0000fffff7fa7328:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa732c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7330:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7334:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa7338:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa733c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7340:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7344:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa7348:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa734c:	1400000e	b	0xfffff7fa7384
   0x0000fffff7fa7350:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7354:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7358:	aa1303e1	mov	x1, x19
   0x0000fffff7fa735c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7360:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa7364:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7368:	aa1603e5	mov	x5, x22
   0x0000fffff7fa736c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7370:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7374:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7378:	d63f0200	blr	x16
   0x0000fffff7fa737c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7380:	54005fc0	b.eq	0xfffff7fa7f78  // b.none
   0x0000fffff7fa7384:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7388:	37d806a9	tbnz	w9, #27, 0xfffff7fa745c
   0x0000fffff7fa738c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7390:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7398:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa739c:	540001c1	b.ne	0xfffff7fa73d4  // b.any
   0x0000fffff7fa73a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa73a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa73a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa73ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa73b0:	54000121	b.ne	0xfffff7fa73d4  // b.any
   0x0000fffff7fa73b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa73b8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa73bc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa73c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa73c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa73c8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa73cc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa73d0:	14000030	b	0xfffff7fa7490
   0x0000fffff7fa73d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa73d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa73dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa73e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa73e4:	54000120	b.eq	0xfffff7fa7408  // b.none
   0x0000fffff7fa73e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa73ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa73f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa73f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa73f8:	54000321	b.ne	0xfffff7fa745c  // b.any
   0x0000fffff7fa73fc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7400:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7404:	14000002	b	0xfffff7fa740c
   0x0000fffff7fa7408:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa740c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7410:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7418:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa741c:	54000120	b.eq	0xfffff7fa7440  // b.none
   0x0000fffff7fa7420:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7424:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa742c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7430:	54000161	b.ne	0xfffff7fa745c  // b.any
   0x0000fffff7fa7434:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa7438:	9e620121	scvtf	d1, x9
   0x0000fffff7fa743c:	14000002	b	0xfffff7fa7444
   0x0000fffff7fa7440:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa7444:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7448:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa744c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7450:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7454:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7458:	17ffffde	b	0xfffff7fa73d0
   0x0000fffff7fa745c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7460:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7464:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7468:	aa1503e2	mov	x2, x21
   0x0000fffff7fa746c:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa7470:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7474:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7478:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa747c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7480:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7484:	d63f0200	blr	x16
   0x0000fffff7fa7488:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa748c:	540057a0	b.eq	0xfffff7fa7f80  // b.none
   0x0000fffff7fa7490:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7494:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7498:	540004a0	b.eq	0xfffff7fa752c  // b.none
   0x0000fffff7fa749c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa74a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa74a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa74a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa74ac:	54000400	b.eq	0xfffff7fa752c  // b.none
   0x0000fffff7fa74b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa74b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa74b8:	36d801d1	tbz	w17, #27, 0xfffff7fa74f0
   0x0000fffff7fa74bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa74c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa74c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa74c8:	54000321	b.ne	0xfffff7fa752c  // b.any
   0x0000fffff7fa74cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa74d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa74d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa74d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa74dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa74e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa74e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa74e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa74ec:	54000209	b.ls	0xfffff7fa752c  // b.plast
   0x0000fffff7fa74f0:	36d8008d	tbz	w13, #27, 0xfffff7fa7500
   0x0000fffff7fa74f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa74f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa74fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7500:	36d80091	tbz	w17, #27, 0xfffff7fa7510
   0x0000fffff7fa7504:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7508:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa750c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7510:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa7514:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa7518:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa751c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7520:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa7524:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa7528:	1400000e	b	0xfffff7fa7560
   0x0000fffff7fa752c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7530:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7534:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7538:	aa1503e2	mov	x2, x21
   0x0000fffff7fa753c:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa7540:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7544:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7548:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa754c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7550:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7554:	d63f0200	blr	x16
   0x0000fffff7fa7558:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa755c:	54005160	b.eq	0xfffff7fa7f88  // b.none
   0x0000fffff7fa7560:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7564:	37d806a9	tbnz	w9, #27, 0xfffff7fa7638
   0x0000fffff7fa7568:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa756c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7574:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7578:	540001c1	b.ne	0xfffff7fa75b0  // b.any
   0x0000fffff7fa757c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7580:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7584:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7588:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa758c:	54000121	b.ne	0xfffff7fa75b0  // b.any
   0x0000fffff7fa7590:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7594:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa7598:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa759c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa75a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa75a4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa75a8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa75ac:	14000030	b	0xfffff7fa766c
   0x0000fffff7fa75b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa75b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa75b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa75bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa75c0:	54000120	b.eq	0xfffff7fa75e4  // b.none
   0x0000fffff7fa75c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa75c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa75cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa75d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa75d4:	54000321	b.ne	0xfffff7fa7638  // b.any
   0x0000fffff7fa75d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa75dc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa75e0:	14000002	b	0xfffff7fa75e8
   0x0000fffff7fa75e4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa75e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa75ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa75f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa75f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa75f8:	54000120	b.eq	0xfffff7fa761c  // b.none
   0x0000fffff7fa75fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7608:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa760c:	54000161	b.ne	0xfffff7fa7638  // b.any
   0x0000fffff7fa7610:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa7614:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7618:	14000002	b	0xfffff7fa7620
   0x0000fffff7fa761c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa7620:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7624:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa7628:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa762c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7630:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7634:	17ffffde	b	0xfffff7fa75ac
   0x0000fffff7fa7638:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa763c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7640:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7644:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7648:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa764c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7650:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7654:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7658:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa765c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7660:	d63f0200	blr	x16
   0x0000fffff7fa7664:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7668:	54004940	b.eq	0xfffff7fa7f90  // b.none
   0x0000fffff7fa766c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7670:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7674:	540004a0	b.eq	0xfffff7fa7708  // b.none
   0x0000fffff7fa7678:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa767c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7680:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7684:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7688:	54000400	b.eq	0xfffff7fa7708  // b.none
   0x0000fffff7fa768c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7690:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7694:	36d801d1	tbz	w17, #27, 0xfffff7fa76cc
   0x0000fffff7fa7698:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa769c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa76a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa76a4:	54000321	b.ne	0xfffff7fa7708  // b.any
   0x0000fffff7fa76a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa76ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa76b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa76b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa76b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa76bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa76c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa76c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa76c8:	54000209	b.ls	0xfffff7fa7708  // b.plast
   0x0000fffff7fa76cc:	36d8008d	tbz	w13, #27, 0xfffff7fa76dc
   0x0000fffff7fa76d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa76d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa76d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa76dc:	36d80091	tbz	w17, #27, 0xfffff7fa76ec
   0x0000fffff7fa76e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa76e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa76e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa76ec:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa76f0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa76f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa76f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa76fc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa7700:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa7704:	1400000e	b	0xfffff7fa773c
   0x0000fffff7fa7708:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa770c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7710:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7714:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7718:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa771c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7720:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7724:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7728:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa772c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7730:	d63f0200	blr	x16
   0x0000fffff7fa7734:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7738:	54004300	b.eq	0xfffff7fa7f98  // b.none
   0x0000fffff7fa773c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7740:	37d806a9	tbnz	w9, #27, 0xfffff7fa7814
   0x0000fffff7fa7744:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa774c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7750:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7754:	540001c1	b.ne	0xfffff7fa778c  // b.any
   0x0000fffff7fa7758:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa775c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7764:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7768:	54000121	b.ne	0xfffff7fa778c  // b.any
   0x0000fffff7fa776c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7770:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa7774:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa777c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7780:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa7784:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7788:	14000030	b	0xfffff7fa7848
   0x0000fffff7fa778c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7790:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7794:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7798:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa779c:	54000120	b.eq	0xfffff7fa77c0  // b.none
   0x0000fffff7fa77a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa77a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa77a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa77ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa77b0:	54000321	b.ne	0xfffff7fa7814  // b.any
   0x0000fffff7fa77b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa77b8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa77bc:	14000002	b	0xfffff7fa77c4
   0x0000fffff7fa77c0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa77c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa77c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa77cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa77d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa77d4:	54000120	b.eq	0xfffff7fa77f8  // b.none
   0x0000fffff7fa77d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa77dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa77e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa77e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa77e8:	54000161	b.ne	0xfffff7fa7814  // b.any
   0x0000fffff7fa77ec:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa77f0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa77f4:	14000002	b	0xfffff7fa77fc
   0x0000fffff7fa77f8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa77fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7800:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa7804:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7808:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa780c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7810:	17ffffde	b	0xfffff7fa7788
   0x0000fffff7fa7814:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7818:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa781c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7820:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7824:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa7828:	aa1403e4	mov	x4, x20
   0x0000fffff7fa782c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7830:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7834:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7838:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa783c:	d63f0200	blr	x16
   0x0000fffff7fa7840:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7844:	54003ae0	b.eq	0xfffff7fa7fa0  // b.none
   0x0000fffff7fa7848:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa784c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7850:	540004a0	b.eq	0xfffff7fa78e4  // b.none
   0x0000fffff7fa7854:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7858:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa785c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7860:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7864:	54000400	b.eq	0xfffff7fa78e4  // b.none
   0x0000fffff7fa7868:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa786c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7870:	36d801d1	tbz	w17, #27, 0xfffff7fa78a8
   0x0000fffff7fa7874:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7878:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa787c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7880:	54000321	b.ne	0xfffff7fa78e4  // b.any
   0x0000fffff7fa7884:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7888:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa788c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7890:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7894:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7898:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa789c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa78a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa78a4:	54000209	b.ls	0xfffff7fa78e4  // b.plast
   0x0000fffff7fa78a8:	36d8008d	tbz	w13, #27, 0xfffff7fa78b8
   0x0000fffff7fa78ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa78b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa78b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa78b8:	36d80091	tbz	w17, #27, 0xfffff7fa78c8
   0x0000fffff7fa78bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa78c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa78c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa78c8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa78cc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa78d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa78d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa78d8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa78dc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa78e0:	1400000e	b	0xfffff7fa7918
   0x0000fffff7fa78e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa78e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa78ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fa78f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa78f4:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa78f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa78fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7900:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7904:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7908:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa790c:	d63f0200	blr	x16
   0x0000fffff7fa7910:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7914:	540034a0	b.eq	0xfffff7fa7fa8  // b.none
   0x0000fffff7fa7918:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa791c:	37d806a9	tbnz	w9, #27, 0xfffff7fa79f0
   0x0000fffff7fa7920:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa792c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7930:	540001c1	b.ne	0xfffff7fa7968  // b.any
   0x0000fffff7fa7934:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa793c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7940:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7944:	54000121	b.ne	0xfffff7fa7968  // b.any
   0x0000fffff7fa7948:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa794c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa7950:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa795c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa7960:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7964:	14000030	b	0xfffff7fa7a24
   0x0000fffff7fa7968:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa796c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7974:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7978:	54000120	b.eq	0xfffff7fa799c  // b.none
   0x0000fffff7fa797c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7980:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7988:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa798c:	54000321	b.ne	0xfffff7fa79f0  // b.any
   0x0000fffff7fa7990:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7994:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7998:	14000002	b	0xfffff7fa79a0
   0x0000fffff7fa799c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa79a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa79a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa79a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa79ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa79b0:	54000120	b.eq	0xfffff7fa79d4  // b.none
   0x0000fffff7fa79b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa79b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa79bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa79c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa79c4:	54000161	b.ne	0xfffff7fa79f0  // b.any
   0x0000fffff7fa79c8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa79cc:	9e620121	scvtf	d1, x9
   0x0000fffff7fa79d0:	14000002	b	0xfffff7fa79d8
   0x0000fffff7fa79d4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa79d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa79dc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa79e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa79e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa79e8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa79ec:	17ffffde	b	0xfffff7fa7964
   0x0000fffff7fa79f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa79f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa79f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa79fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7a00:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa7a04:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7a08:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7a0c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7a10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7a14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7a18:	d63f0200	blr	x16
   0x0000fffff7fa7a1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7a20:	54002c80	b.eq	0xfffff7fa7fb0  // b.none
   0x0000fffff7fa7a24:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7a28:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7a2c:	540004a0	b.eq	0xfffff7fa7ac0  // b.none
   0x0000fffff7fa7a30:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7a34:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7a38:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7a3c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7a40:	54000400	b.eq	0xfffff7fa7ac0  // b.none
   0x0000fffff7fa7a44:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7a48:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7a4c:	36d801d1	tbz	w17, #27, 0xfffff7fa7a84
   0x0000fffff7fa7a50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7a54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7a58:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7a5c:	54000321	b.ne	0xfffff7fa7ac0  // b.any
   0x0000fffff7fa7a60:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7a64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7a68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7a6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7a70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7a74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7a78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7a7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7a80:	54000209	b.ls	0xfffff7fa7ac0  // b.plast
   0x0000fffff7fa7a84:	36d8008d	tbz	w13, #27, 0xfffff7fa7a94
   0x0000fffff7fa7a88:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa7a8c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7a90:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7a94:	36d80091	tbz	w17, #27, 0xfffff7fa7aa4
   0x0000fffff7fa7a98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7a9c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7aa0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7aa4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa7aa8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa7aac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7ab0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7ab4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa7ab8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa7abc:	1400000e	b	0xfffff7fa7af4
   0x0000fffff7fa7ac0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7ac4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7ac8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7acc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7ad0:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa7ad4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7ad8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7adc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7ae0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7ae4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7ae8:	d63f0200	blr	x16
   0x0000fffff7fa7aec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7af0:	54002640	b.eq	0xfffff7fa7fb8  // b.none
   0x0000fffff7fa7af4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7af8:	37d806a9	tbnz	w9, #27, 0xfffff7fa7bcc
   0x0000fffff7fa7afc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7b00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7b04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7b08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7b0c:	540001c1	b.ne	0xfffff7fa7b44  // b.any
   0x0000fffff7fa7b10:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7b14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7b18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7b1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7b20:	54000121	b.ne	0xfffff7fa7b44  // b.any
   0x0000fffff7fa7b24:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7b28:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa7b2c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7b30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7b34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7b38:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa7b3c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7b40:	14000030	b	0xfffff7fa7c00
   0x0000fffff7fa7b44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7b48:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7b4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7b50:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7b54:	54000120	b.eq	0xfffff7fa7b78  // b.none
   0x0000fffff7fa7b58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7b5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7b60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7b64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7b68:	54000321	b.ne	0xfffff7fa7bcc  // b.any
   0x0000fffff7fa7b6c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7b70:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7b74:	14000002	b	0xfffff7fa7b7c
   0x0000fffff7fa7b78:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa7b7c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7b80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7b84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7b88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7b8c:	54000120	b.eq	0xfffff7fa7bb0  // b.none
   0x0000fffff7fa7b90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7b94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7b98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7b9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ba0:	54000161	b.ne	0xfffff7fa7bcc  // b.any
   0x0000fffff7fa7ba4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa7ba8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7bac:	14000002	b	0xfffff7fa7bb4
   0x0000fffff7fa7bb0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa7bb4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7bb8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa7bbc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7bc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7bc4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7bc8:	17ffffde	b	0xfffff7fa7b40
   0x0000fffff7fa7bcc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7bd0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7bd4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7bd8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7bdc:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa7be0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7be4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7be8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7bec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7bf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7bf4:	d63f0200	blr	x16
   0x0000fffff7fa7bf8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7bfc:	54001e20	b.eq	0xfffff7fa7fc0  // b.none
   0x0000fffff7fa7c00:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7c04:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7c08:	540004a0	b.eq	0xfffff7fa7c9c  // b.none
   0x0000fffff7fa7c0c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7c10:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7c14:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7c18:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7c1c:	54000400	b.eq	0xfffff7fa7c9c  // b.none
   0x0000fffff7fa7c20:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7c24:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7c28:	36d801d1	tbz	w17, #27, 0xfffff7fa7c60
   0x0000fffff7fa7c2c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7c30:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7c34:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7c38:	54000321	b.ne	0xfffff7fa7c9c  // b.any
   0x0000fffff7fa7c3c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7c40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7c44:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7c48:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7c4c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7c50:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7c54:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7c58:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7c5c:	54000209	b.ls	0xfffff7fa7c9c  // b.plast
   0x0000fffff7fa7c60:	36d8008d	tbz	w13, #27, 0xfffff7fa7c70
   0x0000fffff7fa7c64:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa7c68:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7c6c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7c70:	36d80091	tbz	w17, #27, 0xfffff7fa7c80
   0x0000fffff7fa7c74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7c78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7c7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7c80:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa7c84:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa7c88:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7c8c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7c90:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa7c94:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa7c98:	1400000e	b	0xfffff7fa7cd0
   0x0000fffff7fa7c9c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7ca0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7ca4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7ca8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7cac:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa7cb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7cb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7cb8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa7cbc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7cc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7cc4:	d63f0200	blr	x16
   0x0000fffff7fa7cc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7ccc:	540017e0	b.eq	0xfffff7fa7fc8  // b.none
   0x0000fffff7fa7cd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7cd4:	37d806a9	tbnz	w9, #27, 0xfffff7fa7da8
   0x0000fffff7fa7cd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7cdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7ce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7ce4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7ce8:	540001c1	b.ne	0xfffff7fa7d20  // b.any
   0x0000fffff7fa7cec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7cf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7cf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7cf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7cfc:	54000121	b.ne	0xfffff7fa7d20  // b.any
   0x0000fffff7fa7d00:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7d04:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa7d08:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7d0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7d10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7d14:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa7d18:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7d1c:	14000030	b	0xfffff7fa7ddc
   0x0000fffff7fa7d20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7d24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7d28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7d2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7d30:	54000120	b.eq	0xfffff7fa7d54  // b.none
   0x0000fffff7fa7d34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7d38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7d3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7d40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7d44:	54000321	b.ne	0xfffff7fa7da8  // b.any
   0x0000fffff7fa7d48:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7d4c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7d50:	14000002	b	0xfffff7fa7d58
   0x0000fffff7fa7d54:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa7d58:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7d5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7d60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7d64:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7d68:	54000120	b.eq	0xfffff7fa7d8c  // b.none
   0x0000fffff7fa7d6c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7d70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7d74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7d78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7d7c:	54000161	b.ne	0xfffff7fa7da8  // b.any
   0x0000fffff7fa7d80:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa7d84:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7d88:	14000002	b	0xfffff7fa7d90
   0x0000fffff7fa7d8c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa7d90:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7d94:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa7d98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7d9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7da0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa7da4:	17ffffde	b	0xfffff7fa7d1c
   0x0000fffff7fa7da8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7dac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7db0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7db4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7db8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa7dbc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7dc0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7dc4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa7dc8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7dcc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7dd0:	d63f0200	blr	x16
   0x0000fffff7fa7dd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7dd8:	54000fc0	b.eq	0xfffff7fa7fd0  // b.none
   0x0000fffff7fa7ddc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa7de0:	37d80269	tbnz	w9, #27, 0xfffff7fa7e2c
   0x0000fffff7fa7de4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa7de8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7dec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7df0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7df4:	540001c1	b.ne	0xfffff7fa7e2c  // b.any
   0x0000fffff7fa7df8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa7dfc:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fa7e00:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fa7e04:	f9003669	str	x9, [x19, #104]
   0x0000fffff7fa7e08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e10:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fa7e14:	aa0b03e9	mov	x9, x11
   0x0000fffff7fa7e18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7e1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7e20:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fa7e24:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fa7e28:	1400000e	b	0xfffff7fa7e60
   0x0000fffff7fa7e2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7e30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7e34:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7e38:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7e3c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa7e40:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7e44:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7e48:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fa7e4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7e50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7e54:	d63f0200	blr	x16
   0x0000fffff7fa7e58:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7e5c:	54000be0	b.eq	0xfffff7fa7fd8  // b.none
   0x0000fffff7fa7e60:	17fff8d2	b	0xfffff7fa61a8
   0x0000fffff7fa7e64:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7e68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7e6c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7e70:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7e74:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa7e78:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7e7c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7e80:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fa7e84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7e88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7e8c:	d63f0200	blr	x16
   0x0000fffff7fa7e90:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa7e94:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa7e98:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa7e9c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa7ea0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa7ea4:	d65f03c0	ret
   0x0000fffff7fa7ea8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7eac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7eb0:	b900028a	str	w10, [x20]
   0x0000fffff7fa7eb4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa7eb8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa7ebc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa7ec0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa7ec4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa7ec8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa7ecc:	d65f03c0	ret
   0x0000fffff7fa7ed0:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fa7ed4:	17fffff5	b	0xfffff7fa7ea8
   0x0000fffff7fa7ed8:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fa7edc:	17fffff3	b	0xfffff7fa7ea8
   0x0000fffff7fa7ee0:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa7ee4:	17fffff1	b	0xfffff7fa7ea8
   0x0000fffff7fa7ee8:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa7eec:	17ffffef	b	0xfffff7fa7ea8
   0x0000fffff7fa7ef0:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa7ef4:	17ffffed	b	0xfffff7fa7ea8
   0x0000fffff7fa7ef8:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa7efc:	17ffffeb	b	0xfffff7fa7ea8
   0x0000fffff7fa7f00:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa7f04:	17ffffe9	b	0xfffff7fa7ea8
   0x0000fffff7fa7f08:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa7f0c:	17ffffe7	b	0xfffff7fa7ea8
   0x0000fffff7fa7f10:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa7f14:	17ffffe5	b	0xfffff7fa7ea8
   0x0000fffff7fa7f18:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa7f1c:	17ffffe3	b	0xfffff7fa7ea8
   0x0000fffff7fa7f20:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa7f24:	17ffffe1	b	0xfffff7fa7ea8
   0x0000fffff7fa7f28:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa7f2c:	17ffffdf	b	0xfffff7fa7ea8
   0x0000fffff7fa7f30:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa7f34:	17ffffdd	b	0xfffff7fa7ea8
   0x0000fffff7fa7f38:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa7f3c:	17ffffdb	b	0xfffff7fa7ea8
   0x0000fffff7fa7f40:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa7f44:	17ffffd9	b	0xfffff7fa7ea8
   0x0000fffff7fa7f48:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa7f4c:	17ffffd7	b	0xfffff7fa7ea8
   0x0000fffff7fa7f50:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa7f54:	17ffffd5	b	0xfffff7fa7ea8
   0x0000fffff7fa7f58:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa7f5c:	17ffffd3	b	0xfffff7fa7ea8
   0x0000fffff7fa7f60:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa7f64:	17ffffd1	b	0xfffff7fa7ea8
   0x0000fffff7fa7f68:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa7f6c:	17ffffcf	b	0xfffff7fa7ea8
   0x0000fffff7fa7f70:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa7f74:	17ffffcd	b	0xfffff7fa7ea8
   0x0000fffff7fa7f78:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa7f7c:	17ffffcb	b	0xfffff7fa7ea8
   0x0000fffff7fa7f80:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa7f84:	17ffffc9	b	0xfffff7fa7ea8
   0x0000fffff7fa7f88:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa7f8c:	17ffffc7	b	0xfffff7fa7ea8
   0x0000fffff7fa7f90:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa7f94:	17ffffc5	b	0xfffff7fa7ea8
   0x0000fffff7fa7f98:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa7f9c:	17ffffc3	b	0xfffff7fa7ea8
   0x0000fffff7fa7fa0:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa7fa4:	17ffffc1	b	0xfffff7fa7ea8
   0x0000fffff7fa7fa8:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa7fac:	17ffffbf	b	0xfffff7fa7ea8
   0x0000fffff7fa7fb0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa7fb4:	17ffffbd	b	0xfffff7fa7ea8
   0x0000fffff7fa7fb8:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa7fbc:	17ffffbb	b	0xfffff7fa7ea8
   0x0000fffff7fa7fc0:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa7fc4:	17ffffb9	b	0xfffff7fa7ea8
   0x0000fffff7fa7fc8:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa7fcc:	17ffffb7	b	0xfffff7fa7ea8
   0x0000fffff7fa7fd0:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa7fd4:	17ffffb5	b	0xfffff7fa7ea8
   0x0000fffff7fa7fd8:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa7fdc:	17ffffb3	b	0xfffff7fa7ea8
   0x0000fffff7fa7fe0:	00000000	udf	#0
   0x0000fffff7fa7fe4:	00000000	udf	#0
   0x0000fffff7fa7fe8:	00000000	udf	#0
   0x0000fffff7fa7fec:	00000000	udf	#0
   0x0000fffff7fa7ff0:	00000000	udf	#0
   0x0000fffff7fa7ff4:	00000000	udf	#0
   0x0000fffff7fa7ff8:	00000000	udf	#0
   0x0000fffff7fa7ffc:	00000000	udf	#0
End of assembler dump.
