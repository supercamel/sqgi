Dump of assembler code from 0xfffff7fbc000 to 0xfffff7fbe000:
   0x0000fffff7fbc000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fbc004:	910003fd	mov	x29, sp
   0x0000fffff7fbc008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fbc00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fbc010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fbc014:	aa0003f3	mov	x19, x0
   0x0000fffff7fbc018:	aa0103f4	mov	x20, x1
   0x0000fffff7fbc01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fbc020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fbc024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fbc028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fbc02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fbc030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fbc034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fbc038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fbc03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fbc040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc044:	d63f0200	blr	x16
   0x0000fffff7fbc048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fbc04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fbc050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fbc054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fbc058:	14000001	b	0xfffff7fbc05c
   0x0000fffff7fbc05c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbc060:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbc064:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fbc068:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fbc06c:	36d80211	tbz	w17, #27, 0xfffff7fbc0ac
   0x0000fffff7fbc070:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc074:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc078:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc07c:	540001e1	b.ne	0xfffff7fbc0b8  // b.any
   0x0000fffff7fbc080:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fbc084:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc088:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc08c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc090:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc094:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc098:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc09c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc0a0:	540000c9	b.ls	0xfffff7fbc0b8  // b.plast
   0x0000fffff7fbc0a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc0a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc0ac:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fbc0b0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fbc0b4:	1400000e	b	0xfffff7fbc0ec
   0x0000fffff7fbc0b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc0bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc0c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc0c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc0c8:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fbc0cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc0d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc0d4:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fbc0d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc0dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc0e0:	d63f0200	blr	x16
   0x0000fffff7fbc0e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc0e8:	5400ef60	b.eq	0xfffff7fbded4  // b.none
   0x0000fffff7fbc0ec:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbc0f0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbc0f4:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fbc0f8:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fbc0fc:	36d80211	tbz	w17, #27, 0xfffff7fbc13c
   0x0000fffff7fbc100:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc104:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc108:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc10c:	540001e1	b.ne	0xfffff7fbc148  // b.any
   0x0000fffff7fbc110:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fbc114:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc118:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc11c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc120:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc124:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc128:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc12c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc130:	540000c9	b.ls	0xfffff7fbc148  // b.plast
   0x0000fffff7fbc134:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc138:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc13c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fbc140:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fbc144:	1400000e	b	0xfffff7fbc17c
   0x0000fffff7fbc148:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc14c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc150:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc154:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc158:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fbc15c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc160:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc164:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fbc168:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc16c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc170:	d63f0200	blr	x16
   0x0000fffff7fbc174:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc178:	5400eb20	b.eq	0xfffff7fbdedc  // b.none
   0x0000fffff7fbc17c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbc180:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc184:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc188:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc18c:	54000421	b.ne	0xfffff7fbc210  // b.any
   0x0000fffff7fbc190:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fbc194:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc198:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc19c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc1a0:	54000381	b.ne	0xfffff7fbc210  // b.any
   0x0000fffff7fbc1a4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fbc1a8:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fbc1ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc1b0:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fbc1b4:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fbc1b8:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fbc1bc:	91000580	add	x0, x12, #0x1
   0x0000fffff7fbc1c0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbc1c4:	36d80211	tbz	w17, #27, 0xfffff7fbc204
   0x0000fffff7fbc1c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc1cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc1d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc1d4:	540001e1	b.ne	0xfffff7fbc210  // b.any
   0x0000fffff7fbc1d8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbc1dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc1e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc1e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc1e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc1ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc1f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc1f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc1f8:	540000c9	b.ls	0xfffff7fbc210  // b.plast
   0x0000fffff7fbc1fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc200:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc204:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fbc208:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fbc20c:	1400000e	b	0xfffff7fbc244
   0x0000fffff7fbc210:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc214:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc218:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc21c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc220:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fbc224:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc228:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc22c:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fbc230:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc234:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc238:	d63f0200	blr	x16
   0x0000fffff7fbc23c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc240:	5400e520	b.eq	0xfffff7fbdee4  // b.none
   0x0000fffff7fbc244:	f100041f	cmp	x0, #0x1
   0x0000fffff7fbc248:	5400e100	b.eq	0xfffff7fbde68  // b.none
   0x0000fffff7fbc24c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fbc250:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fbc254:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fbc258:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fbc25c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fbc260:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fbc264:	36d801d1	tbz	w17, #27, 0xfffff7fbc29c
   0x0000fffff7fbc268:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc26c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc270:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc274:	54000281	b.ne	0xfffff7fbc2c4  // b.any
   0x0000fffff7fbc278:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbc27c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc280:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc284:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc288:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc28c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc290:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc294:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc298:	54000169	b.ls	0xfffff7fbc2c4  // b.plast
   0x0000fffff7fbc29c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc2a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc2a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc2a8:	36d80091	tbz	w17, #27, 0xfffff7fbc2b8
   0x0000fffff7fbc2ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc2b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc2b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc2b8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbc2bc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbc2c0:	1400000e	b	0xfffff7fbc2f8
   0x0000fffff7fbc2c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc2c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc2cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc2d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc2d4:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fbc2d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc2dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc2e0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fbc2e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc2e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc2ec:	d63f0200	blr	x16
   0x0000fffff7fbc2f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc2f4:	5400dfc0	b.eq	0xfffff7fbdeec  // b.none
   0x0000fffff7fbc2f8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fbc2fc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc300:	540003a0	b.eq	0xfffff7fbc374  // b.none
   0x0000fffff7fbc304:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fbc308:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fbc30c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fbc310:	36d801d1	tbz	w17, #27, 0xfffff7fbc348
   0x0000fffff7fbc314:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc318:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc31c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc320:	540002a1	b.ne	0xfffff7fbc374  // b.any
   0x0000fffff7fbc324:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fbc328:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc32c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc330:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc334:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc338:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc33c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc340:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc344:	54000189	b.ls	0xfffff7fbc374  // b.plast
   0x0000fffff7fbc348:	36d8008d	tbz	w13, #27, 0xfffff7fbc358
   0x0000fffff7fbc34c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc350:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc354:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc358:	36d80091	tbz	w17, #27, 0xfffff7fbc368
   0x0000fffff7fbc35c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc360:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc364:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc368:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fbc36c:	b900016d	str	w13, [x11]
   0x0000fffff7fbc370:	1400000e	b	0xfffff7fbc3a8
   0x0000fffff7fbc374:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fbc378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc37c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc380:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc384:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fbc388:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc38c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc390:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fbc394:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc39c:	d63f0200	blr	x16
   0x0000fffff7fbc3a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc3a4:	5400da80	b.eq	0xfffff7fbdef4  // b.none
   0x0000fffff7fbc3a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbc3ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc3b0:	540004a0	b.eq	0xfffff7fbc444  // b.none
   0x0000fffff7fbc3b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbc3b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbc3bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbc3c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbc3c4:	54000400	b.eq	0xfffff7fbc444  // b.none
   0x0000fffff7fbc3c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbc3cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbc3d0:	36d801d1	tbz	w17, #27, 0xfffff7fbc408
   0x0000fffff7fbc3d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc3d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc3dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc3e0:	54000321	b.ne	0xfffff7fbc444  // b.any
   0x0000fffff7fbc3e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbc3e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc3ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc3f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc3f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc3f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc3fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc400:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc404:	54000209	b.ls	0xfffff7fbc444  // b.plast
   0x0000fffff7fbc408:	36d8008d	tbz	w13, #27, 0xfffff7fbc418
   0x0000fffff7fbc40c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc410:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc414:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc418:	36d80091	tbz	w17, #27, 0xfffff7fbc428
   0x0000fffff7fbc41c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc420:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc424:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc428:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbc42c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbc430:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbc434:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbc438:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbc43c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbc440:	1400000e	b	0xfffff7fbc478
   0x0000fffff7fbc444:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbc448:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc44c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc450:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc454:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fbc458:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc45c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc460:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbc464:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc468:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc46c:	d63f0200	blr	x16
   0x0000fffff7fbc470:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc474:	5400d440	b.eq	0xfffff7fbdefc  // b.none
   0x0000fffff7fbc478:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc47c:	37d806a9	tbnz	w9, #27, 0xfffff7fbc550
   0x0000fffff7fbc480:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc484:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc488:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc48c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc490:	540001c1	b.ne	0xfffff7fbc4c8  // b.any
   0x0000fffff7fbc494:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbc498:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc49c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc4a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc4a4:	54000121	b.ne	0xfffff7fbc4c8  // b.any
   0x0000fffff7fbc4a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc4ac:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbc4b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbc4b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc4b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc4bc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbc4c0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbc4c4:	14000030	b	0xfffff7fbc584
   0x0000fffff7fbc4c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc4cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc4d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc4d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc4d8:	54000120	b.eq	0xfffff7fbc4fc  // b.none
   0x0000fffff7fbc4dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc4e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc4e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc4e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc4ec:	54000321	b.ne	0xfffff7fbc550  // b.any
   0x0000fffff7fbc4f0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc4f4:	9e620120	scvtf	d0, x9
   0x0000fffff7fbc4f8:	14000002	b	0xfffff7fbc500
   0x0000fffff7fbc4fc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbc500:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbc504:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc508:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc50c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc510:	54000120	b.eq	0xfffff7fbc534  // b.none
   0x0000fffff7fbc514:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbc518:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc51c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc520:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc524:	54000161	b.ne	0xfffff7fbc550  // b.any
   0x0000fffff7fbc528:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbc52c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbc530:	14000002	b	0xfffff7fbc538
   0x0000fffff7fbc534:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbc538:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbc53c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbc540:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc544:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc548:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbc54c:	17ffffde	b	0xfffff7fbc4c4
   0x0000fffff7fbc550:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc554:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc558:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc55c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc560:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fbc564:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc568:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc56c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbc570:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc574:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc578:	d63f0200	blr	x16
   0x0000fffff7fbc57c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc580:	5400cc20	b.eq	0xfffff7fbdf04  // b.none
   0x0000fffff7fbc584:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbc588:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc58c:	540004a0	b.eq	0xfffff7fbc620  // b.none
   0x0000fffff7fbc590:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbc594:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbc598:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbc59c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbc5a0:	54000400	b.eq	0xfffff7fbc620  // b.none
   0x0000fffff7fbc5a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbc5a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbc5ac:	36d801d1	tbz	w17, #27, 0xfffff7fbc5e4
   0x0000fffff7fbc5b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc5b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc5b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc5bc:	54000321	b.ne	0xfffff7fbc620  // b.any
   0x0000fffff7fbc5c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbc5c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc5c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc5cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc5d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc5d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc5d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc5dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc5e0:	54000209	b.ls	0xfffff7fbc620  // b.plast
   0x0000fffff7fbc5e4:	36d8008d	tbz	w13, #27, 0xfffff7fbc5f4
   0x0000fffff7fbc5e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc5ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc5f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc5f4:	36d80091	tbz	w17, #27, 0xfffff7fbc604
   0x0000fffff7fbc5f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc5fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc600:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc604:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbc608:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbc60c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbc610:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbc614:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbc618:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbc61c:	1400000e	b	0xfffff7fbc654
   0x0000fffff7fbc620:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbc624:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc628:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc62c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc630:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fbc634:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc638:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc63c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbc640:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc644:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc648:	d63f0200	blr	x16
   0x0000fffff7fbc64c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc650:	5400c5e0	b.eq	0xfffff7fbdf0c  // b.none
   0x0000fffff7fbc654:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc658:	37d806a9	tbnz	w9, #27, 0xfffff7fbc72c
   0x0000fffff7fbc65c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc660:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc668:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc66c:	540001c1	b.ne	0xfffff7fbc6a4  // b.any
   0x0000fffff7fbc670:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbc674:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc678:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc67c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc680:	54000121	b.ne	0xfffff7fbc6a4  // b.any
   0x0000fffff7fbc684:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc688:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbc68c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbc690:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc698:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbc69c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbc6a0:	14000030	b	0xfffff7fbc760
   0x0000fffff7fbc6a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc6a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc6ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc6b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc6b4:	54000120	b.eq	0xfffff7fbc6d8  // b.none
   0x0000fffff7fbc6b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc6bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc6c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc6c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc6c8:	54000321	b.ne	0xfffff7fbc72c  // b.any
   0x0000fffff7fbc6cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc6d0:	9e620120	scvtf	d0, x9
   0x0000fffff7fbc6d4:	14000002	b	0xfffff7fbc6dc
   0x0000fffff7fbc6d8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbc6dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbc6e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc6e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc6e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc6ec:	54000120	b.eq	0xfffff7fbc710  // b.none
   0x0000fffff7fbc6f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbc6f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc6f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc6fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc700:	54000161	b.ne	0xfffff7fbc72c  // b.any
   0x0000fffff7fbc704:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbc708:	9e620121	scvtf	d1, x9
   0x0000fffff7fbc70c:	14000002	b	0xfffff7fbc714
   0x0000fffff7fbc710:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbc714:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbc718:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbc71c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc724:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbc728:	17ffffde	b	0xfffff7fbc6a0
   0x0000fffff7fbc72c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc730:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc734:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc738:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc73c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fbc740:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc744:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc748:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbc74c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc750:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc754:	d63f0200	blr	x16
   0x0000fffff7fbc758:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc75c:	5400bdc0	b.eq	0xfffff7fbdf14  // b.none
   0x0000fffff7fbc760:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbc764:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc768:	540004a0	b.eq	0xfffff7fbc7fc  // b.none
   0x0000fffff7fbc76c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbc770:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbc774:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbc778:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbc77c:	54000400	b.eq	0xfffff7fbc7fc  // b.none
   0x0000fffff7fbc780:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbc784:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbc788:	36d801d1	tbz	w17, #27, 0xfffff7fbc7c0
   0x0000fffff7fbc78c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc790:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc794:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc798:	54000321	b.ne	0xfffff7fbc7fc  // b.any
   0x0000fffff7fbc79c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbc7a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc7a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc7a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc7ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc7b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc7b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc7b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc7bc:	54000209	b.ls	0xfffff7fbc7fc  // b.plast
   0x0000fffff7fbc7c0:	36d8008d	tbz	w13, #27, 0xfffff7fbc7d0
   0x0000fffff7fbc7c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc7c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc7cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc7d0:	36d80091	tbz	w17, #27, 0xfffff7fbc7e0
   0x0000fffff7fbc7d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc7d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc7dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc7e0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbc7e4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbc7e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbc7ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbc7f0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbc7f4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbc7f8:	1400000e	b	0xfffff7fbc830
   0x0000fffff7fbc7fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbc800:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc804:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc808:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc80c:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fbc810:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc814:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc818:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbc81c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc820:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc824:	d63f0200	blr	x16
   0x0000fffff7fbc828:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc82c:	5400b780	b.eq	0xfffff7fbdf1c  // b.none
   0x0000fffff7fbc830:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc834:	37d806a9	tbnz	w9, #27, 0xfffff7fbc908
   0x0000fffff7fbc838:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc83c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc840:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc844:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc848:	540001c1	b.ne	0xfffff7fbc880  // b.any
   0x0000fffff7fbc84c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbc850:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc858:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc85c:	54000121	b.ne	0xfffff7fbc880  // b.any
   0x0000fffff7fbc860:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc864:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbc868:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbc86c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc874:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbc878:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbc87c:	14000030	b	0xfffff7fbc93c
   0x0000fffff7fbc880:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc884:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc888:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc88c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc890:	54000120	b.eq	0xfffff7fbc8b4  // b.none
   0x0000fffff7fbc894:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbc898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc89c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc8a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc8a4:	54000321	b.ne	0xfffff7fbc908  // b.any
   0x0000fffff7fbc8a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbc8ac:	9e620120	scvtf	d0, x9
   0x0000fffff7fbc8b0:	14000002	b	0xfffff7fbc8b8
   0x0000fffff7fbc8b4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbc8b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbc8bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc8c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc8c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc8c8:	54000120	b.eq	0xfffff7fbc8ec  // b.none
   0x0000fffff7fbc8cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbc8d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbc8d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc8d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbc8dc:	54000161	b.ne	0xfffff7fbc908  // b.any
   0x0000fffff7fbc8e0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbc8e4:	9e620121	scvtf	d1, x9
   0x0000fffff7fbc8e8:	14000002	b	0xfffff7fbc8f0
   0x0000fffff7fbc8ec:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbc8f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbc8f4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbc8f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbc8fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbc900:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbc904:	17ffffde	b	0xfffff7fbc87c
   0x0000fffff7fbc908:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbc90c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc910:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc914:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc918:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fbc91c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc920:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc924:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbc928:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbc92c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbc930:	d63f0200	blr	x16
   0x0000fffff7fbc934:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbc938:	5400af60	b.eq	0xfffff7fbdf24  // b.none
   0x0000fffff7fbc93c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbc940:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbc944:	540004a0	b.eq	0xfffff7fbc9d8  // b.none
   0x0000fffff7fbc948:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbc94c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbc950:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbc954:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbc958:	54000400	b.eq	0xfffff7fbc9d8  // b.none
   0x0000fffff7fbc95c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbc960:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbc964:	36d801d1	tbz	w17, #27, 0xfffff7fbc99c
   0x0000fffff7fbc968:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbc96c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbc970:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbc974:	54000321	b.ne	0xfffff7fbc9d8  // b.any
   0x0000fffff7fbc978:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbc97c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc980:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbc984:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbc988:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbc98c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbc990:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbc994:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbc998:	54000209	b.ls	0xfffff7fbc9d8  // b.plast
   0x0000fffff7fbc99c:	36d8008d	tbz	w13, #27, 0xfffff7fbc9ac
   0x0000fffff7fbc9a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbc9a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbc9a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbc9ac:	36d80091	tbz	w17, #27, 0xfffff7fbc9bc
   0x0000fffff7fbc9b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbc9b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbc9b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbc9bc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbc9c0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbc9c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbc9c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbc9cc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbc9d0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbc9d4:	1400000e	b	0xfffff7fbca0c
   0x0000fffff7fbc9d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbc9dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbc9e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbc9e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbc9e8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fbc9ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fbc9f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbc9f4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbc9f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbc9fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbca00:	d63f0200	blr	x16
   0x0000fffff7fbca04:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbca08:	5400a920	b.eq	0xfffff7fbdf2c  // b.none
   0x0000fffff7fbca0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbca10:	37d806a9	tbnz	w9, #27, 0xfffff7fbcae4
   0x0000fffff7fbca14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbca18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbca1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbca20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbca24:	540001c1	b.ne	0xfffff7fbca5c  // b.any
   0x0000fffff7fbca28:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbca2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbca30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbca34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbca38:	54000121	b.ne	0xfffff7fbca5c  // b.any
   0x0000fffff7fbca3c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbca40:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbca44:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbca48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbca4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbca50:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbca54:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbca58:	14000030	b	0xfffff7fbcb18
   0x0000fffff7fbca5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbca60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbca64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbca68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbca6c:	54000120	b.eq	0xfffff7fbca90  // b.none
   0x0000fffff7fbca70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbca74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbca78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbca7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbca80:	54000321	b.ne	0xfffff7fbcae4  // b.any
   0x0000fffff7fbca84:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbca88:	9e620120	scvtf	d0, x9
   0x0000fffff7fbca8c:	14000002	b	0xfffff7fbca94
   0x0000fffff7fbca90:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbca94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbca98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbca9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcaa0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcaa4:	54000120	b.eq	0xfffff7fbcac8  // b.none
   0x0000fffff7fbcaa8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbcaac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcab0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcab4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcab8:	54000161	b.ne	0xfffff7fbcae4  // b.any
   0x0000fffff7fbcabc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbcac0:	9e620121	scvtf	d1, x9
   0x0000fffff7fbcac4:	14000002	b	0xfffff7fbcacc
   0x0000fffff7fbcac8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbcacc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbcad0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbcad4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcad8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcadc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbcae0:	17ffffde	b	0xfffff7fbca58
   0x0000fffff7fbcae4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbcae8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcaec:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcaf0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcaf4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fbcaf8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcafc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcb00:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbcb04:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbcb08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcb0c:	d63f0200	blr	x16
   0x0000fffff7fbcb10:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcb14:	5400a100	b.eq	0xfffff7fbdf34  // b.none
   0x0000fffff7fbcb18:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbcb1c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbcb20:	540004a0	b.eq	0xfffff7fbcbb4  // b.none
   0x0000fffff7fbcb24:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbcb28:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbcb2c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbcb30:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbcb34:	54000400	b.eq	0xfffff7fbcbb4  // b.none
   0x0000fffff7fbcb38:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbcb3c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbcb40:	36d801d1	tbz	w17, #27, 0xfffff7fbcb78
   0x0000fffff7fbcb44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbcb48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbcb4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbcb50:	54000321	b.ne	0xfffff7fbcbb4  // b.any
   0x0000fffff7fbcb54:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbcb58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcb5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcb60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcb64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcb68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcb6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcb70:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcb74:	54000209	b.ls	0xfffff7fbcbb4  // b.plast
   0x0000fffff7fbcb78:	36d8008d	tbz	w13, #27, 0xfffff7fbcb88
   0x0000fffff7fbcb7c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcb80:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcb84:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcb88:	36d80091	tbz	w17, #27, 0xfffff7fbcb98
   0x0000fffff7fbcb8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcb90:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcb94:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcb98:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbcb9c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbcba0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbcba4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbcba8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbcbac:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbcbb0:	1400000e	b	0xfffff7fbcbe8
   0x0000fffff7fbcbb4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbcbb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcbbc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcbc0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcbc4:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fbcbc8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcbcc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcbd0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbcbd4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbcbd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcbdc:	d63f0200	blr	x16
   0x0000fffff7fbcbe0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcbe4:	54009ac0	b.eq	0xfffff7fbdf3c  // b.none
   0x0000fffff7fbcbe8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcbec:	37d806a9	tbnz	w9, #27, 0xfffff7fbccc0
   0x0000fffff7fbcbf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcbf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcbf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcbfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc00:	540001c1	b.ne	0xfffff7fbcc38  // b.any
   0x0000fffff7fbcc04:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbcc08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc14:	54000121	b.ne	0xfffff7fbcc38  // b.any
   0x0000fffff7fbcc18:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbcc1c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbcc20:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbcc24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc2c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbcc30:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbcc34:	14000030	b	0xfffff7fbccf4
   0x0000fffff7fbcc38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcc3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcc40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc48:	54000120	b.eq	0xfffff7fbcc6c  // b.none
   0x0000fffff7fbcc4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcc50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc5c:	54000321	b.ne	0xfffff7fbccc0  // b.any
   0x0000fffff7fbcc60:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbcc64:	9e620120	scvtf	d0, x9
   0x0000fffff7fbcc68:	14000002	b	0xfffff7fbcc70
   0x0000fffff7fbcc6c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbcc70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbcc74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcc78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc80:	54000120	b.eq	0xfffff7fbcca4  // b.none
   0x0000fffff7fbcc84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbcc88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcc8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcc90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcc94:	54000161	b.ne	0xfffff7fbccc0  // b.any
   0x0000fffff7fbcc98:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbcc9c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbcca0:	14000002	b	0xfffff7fbcca8
   0x0000fffff7fbcca4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbcca8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbccac:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbccb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbccb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbccb8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbccbc:	17ffffde	b	0xfffff7fbcc34
   0x0000fffff7fbccc0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbccc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbccc8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcccc:	aa1503e2	mov	x2, x21
   0x0000fffff7fbccd0:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fbccd4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbccd8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbccdc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbcce0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbcce4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcce8:	d63f0200	blr	x16
   0x0000fffff7fbccec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbccf0:	540092a0	b.eq	0xfffff7fbdf44  // b.none
   0x0000fffff7fbccf4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbccf8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbccfc:	540004a0	b.eq	0xfffff7fbcd90  // b.none
   0x0000fffff7fbcd00:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbcd04:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbcd08:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbcd0c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbcd10:	54000400	b.eq	0xfffff7fbcd90  // b.none
   0x0000fffff7fbcd14:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbcd18:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbcd1c:	36d801d1	tbz	w17, #27, 0xfffff7fbcd54
   0x0000fffff7fbcd20:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbcd24:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbcd28:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbcd2c:	54000321	b.ne	0xfffff7fbcd90  // b.any
   0x0000fffff7fbcd30:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbcd34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcd38:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcd3c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcd40:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcd44:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcd48:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcd4c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcd50:	54000209	b.ls	0xfffff7fbcd90  // b.plast
   0x0000fffff7fbcd54:	36d8008d	tbz	w13, #27, 0xfffff7fbcd64
   0x0000fffff7fbcd58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcd5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcd60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcd64:	36d80091	tbz	w17, #27, 0xfffff7fbcd74
   0x0000fffff7fbcd68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcd6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcd70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcd74:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbcd78:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbcd7c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbcd80:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbcd84:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbcd88:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbcd8c:	1400000e	b	0xfffff7fbcdc4
   0x0000fffff7fbcd90:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbcd94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcd98:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcd9c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcda0:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fbcda4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcda8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcdac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbcdb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbcdb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcdb8:	d63f0200	blr	x16
   0x0000fffff7fbcdbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcdc0:	54008c60	b.eq	0xfffff7fbdf4c  // b.none
   0x0000fffff7fbcdc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcdc8:	37d806a9	tbnz	w9, #27, 0xfffff7fbce9c
   0x0000fffff7fbcdcc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcdd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcdd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcdd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcddc:	540001c1	b.ne	0xfffff7fbce14  // b.any
   0x0000fffff7fbcde0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbcde4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcde8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcdec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcdf0:	54000121	b.ne	0xfffff7fbce14  // b.any
   0x0000fffff7fbcdf4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbcdf8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbcdfc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbce00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbce04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbce08:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbce0c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbce10:	14000030	b	0xfffff7fbced0
   0x0000fffff7fbce14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbce18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbce1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbce20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbce24:	54000120	b.eq	0xfffff7fbce48  // b.none
   0x0000fffff7fbce28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbce2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbce30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbce34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbce38:	54000321	b.ne	0xfffff7fbce9c  // b.any
   0x0000fffff7fbce3c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbce40:	9e620120	scvtf	d0, x9
   0x0000fffff7fbce44:	14000002	b	0xfffff7fbce4c
   0x0000fffff7fbce48:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbce4c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbce50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbce54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbce58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbce5c:	54000120	b.eq	0xfffff7fbce80  // b.none
   0x0000fffff7fbce60:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbce64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbce68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbce6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbce70:	54000161	b.ne	0xfffff7fbce9c  // b.any
   0x0000fffff7fbce74:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbce78:	9e620121	scvtf	d1, x9
   0x0000fffff7fbce7c:	14000002	b	0xfffff7fbce84
   0x0000fffff7fbce80:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbce84:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbce88:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbce8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbce90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbce94:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbce98:	17ffffde	b	0xfffff7fbce10
   0x0000fffff7fbce9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbcea0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcea4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcea8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbceac:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fbceb0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbceb4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbceb8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbcebc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbcec0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcec4:	d63f0200	blr	x16
   0x0000fffff7fbcec8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcecc:	54008440	b.eq	0xfffff7fbdf54  // b.none
   0x0000fffff7fbced0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbced4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbced8:	540004a0	b.eq	0xfffff7fbcf6c  // b.none
   0x0000fffff7fbcedc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbcee0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbcee4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbcee8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbceec:	54000400	b.eq	0xfffff7fbcf6c  // b.none
   0x0000fffff7fbcef0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbcef4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbcef8:	36d801d1	tbz	w17, #27, 0xfffff7fbcf30
   0x0000fffff7fbcefc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbcf00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbcf04:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbcf08:	54000321	b.ne	0xfffff7fbcf6c  // b.any
   0x0000fffff7fbcf0c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbcf10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcf14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbcf18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbcf1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbcf20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbcf24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbcf28:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbcf2c:	54000209	b.ls	0xfffff7fbcf6c  // b.plast
   0x0000fffff7fbcf30:	36d8008d	tbz	w13, #27, 0xfffff7fbcf40
   0x0000fffff7fbcf34:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbcf38:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbcf3c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbcf40:	36d80091	tbz	w17, #27, 0xfffff7fbcf50
   0x0000fffff7fbcf44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbcf48:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbcf4c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbcf50:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbcf54:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbcf58:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbcf5c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbcf60:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbcf64:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbcf68:	1400000e	b	0xfffff7fbcfa0
   0x0000fffff7fbcf6c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbcf70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbcf74:	aa1303e1	mov	x1, x19
   0x0000fffff7fbcf78:	aa1503e2	mov	x2, x21
   0x0000fffff7fbcf7c:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fbcf80:	aa1403e4	mov	x4, x20
   0x0000fffff7fbcf84:	aa1603e5	mov	x5, x22
   0x0000fffff7fbcf88:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbcf8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbcf90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbcf94:	d63f0200	blr	x16
   0x0000fffff7fbcf98:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbcf9c:	54007e00	b.eq	0xfffff7fbdf5c  // b.none
   0x0000fffff7fbcfa0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcfa4:	37d806a9	tbnz	w9, #27, 0xfffff7fbd078
   0x0000fffff7fbcfa8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcfac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcfb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcfb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcfb8:	540001c1	b.ne	0xfffff7fbcff0  // b.any
   0x0000fffff7fbcfbc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbcfc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcfc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcfc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbcfcc:	54000121	b.ne	0xfffff7fbcff0  // b.any
   0x0000fffff7fbcfd0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbcfd4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbcfd8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbcfdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbcfe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcfe4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbcfe8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbcfec:	14000030	b	0xfffff7fbd0ac
   0x0000fffff7fbcff0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbcff4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbcff8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbcffc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd000:	54000120	b.eq	0xfffff7fbd024  // b.none
   0x0000fffff7fbd004:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd008:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd00c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd010:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd014:	54000321	b.ne	0xfffff7fbd078  // b.any
   0x0000fffff7fbd018:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd01c:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd020:	14000002	b	0xfffff7fbd028
   0x0000fffff7fbd024:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbd028:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd02c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd030:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd034:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd038:	54000120	b.eq	0xfffff7fbd05c  // b.none
   0x0000fffff7fbd03c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd040:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd044:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd048:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd04c:	54000161	b.ne	0xfffff7fbd078  // b.any
   0x0000fffff7fbd050:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbd054:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd058:	14000002	b	0xfffff7fbd060
   0x0000fffff7fbd05c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbd060:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd064:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbd068:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd06c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd070:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd074:	17ffffde	b	0xfffff7fbcfec
   0x0000fffff7fbd078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd07c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd080:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd084:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd088:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fbd08c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd090:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd094:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbd098:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd09c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd0a0:	d63f0200	blr	x16
   0x0000fffff7fbd0a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd0a8:	540075e0	b.eq	0xfffff7fbdf64  // b.none
   0x0000fffff7fbd0ac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd0b0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd0b4:	540004a0	b.eq	0xfffff7fbd148  // b.none
   0x0000fffff7fbd0b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd0bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd0c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd0c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd0c8:	54000400	b.eq	0xfffff7fbd148  // b.none
   0x0000fffff7fbd0cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd0d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd0d4:	36d801d1	tbz	w17, #27, 0xfffff7fbd10c
   0x0000fffff7fbd0d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd0dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd0e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd0e4:	54000321	b.ne	0xfffff7fbd148  // b.any
   0x0000fffff7fbd0e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd0ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd0f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd0f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd0f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd0fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd100:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd104:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd108:	54000209	b.ls	0xfffff7fbd148  // b.plast
   0x0000fffff7fbd10c:	36d8008d	tbz	w13, #27, 0xfffff7fbd11c
   0x0000fffff7fbd110:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd114:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd118:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd11c:	36d80091	tbz	w17, #27, 0xfffff7fbd12c
   0x0000fffff7fbd120:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd124:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd128:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd12c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbd130:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbd134:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd138:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd13c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbd140:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbd144:	1400000e	b	0xfffff7fbd17c
   0x0000fffff7fbd148:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd14c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd150:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd154:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd158:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fbd15c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd160:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd164:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbd168:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd16c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd170:	d63f0200	blr	x16
   0x0000fffff7fbd174:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd178:	54006fa0	b.eq	0xfffff7fbdf6c  // b.none
   0x0000fffff7fbd17c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd180:	37d806a9	tbnz	w9, #27, 0xfffff7fbd254
   0x0000fffff7fbd184:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd188:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd18c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd190:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd194:	540001c1	b.ne	0xfffff7fbd1cc  // b.any
   0x0000fffff7fbd198:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd19c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd1a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd1a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd1a8:	54000121	b.ne	0xfffff7fbd1cc  // b.any
   0x0000fffff7fbd1ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd1b0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbd1b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd1b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd1bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd1c0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbd1c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd1c8:	14000030	b	0xfffff7fbd288
   0x0000fffff7fbd1cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd1d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd1d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd1d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd1dc:	54000120	b.eq	0xfffff7fbd200  // b.none
   0x0000fffff7fbd1e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd1e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd1e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd1ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd1f0:	54000321	b.ne	0xfffff7fbd254  // b.any
   0x0000fffff7fbd1f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd1f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd1fc:	14000002	b	0xfffff7fbd204
   0x0000fffff7fbd200:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbd204:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd208:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd20c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd210:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd214:	54000120	b.eq	0xfffff7fbd238  // b.none
   0x0000fffff7fbd218:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd21c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd220:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd224:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd228:	54000161	b.ne	0xfffff7fbd254  // b.any
   0x0000fffff7fbd22c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbd230:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd234:	14000002	b	0xfffff7fbd23c
   0x0000fffff7fbd238:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbd23c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd240:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbd244:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd248:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd24c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd250:	17ffffde	b	0xfffff7fbd1c8
   0x0000fffff7fbd254:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd258:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd25c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd260:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd264:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fbd268:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd26c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd270:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbd274:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd278:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd27c:	d63f0200	blr	x16
   0x0000fffff7fbd280:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd284:	54006780	b.eq	0xfffff7fbdf74  // b.none
   0x0000fffff7fbd288:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd28c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd290:	540004a0	b.eq	0xfffff7fbd324  // b.none
   0x0000fffff7fbd294:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd298:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd29c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd2a0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd2a4:	54000400	b.eq	0xfffff7fbd324  // b.none
   0x0000fffff7fbd2a8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd2ac:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd2b0:	36d801d1	tbz	w17, #27, 0xfffff7fbd2e8
   0x0000fffff7fbd2b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd2b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd2bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd2c0:	54000321	b.ne	0xfffff7fbd324  // b.any
   0x0000fffff7fbd2c4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd2c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd2cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd2d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd2d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd2d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd2dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd2e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd2e4:	54000209	b.ls	0xfffff7fbd324  // b.plast
   0x0000fffff7fbd2e8:	36d8008d	tbz	w13, #27, 0xfffff7fbd2f8
   0x0000fffff7fbd2ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd2f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd2f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd2f8:	36d80091	tbz	w17, #27, 0xfffff7fbd308
   0x0000fffff7fbd2fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd300:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd304:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd308:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbd30c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbd310:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd314:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd318:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbd31c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbd320:	1400000e	b	0xfffff7fbd358
   0x0000fffff7fbd324:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd328:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd32c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd330:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd334:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fbd338:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd33c:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd340:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbd344:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd348:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd34c:	d63f0200	blr	x16
   0x0000fffff7fbd350:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd354:	54006140	b.eq	0xfffff7fbdf7c  // b.none
   0x0000fffff7fbd358:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd35c:	37d806a9	tbnz	w9, #27, 0xfffff7fbd430
   0x0000fffff7fbd360:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd364:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd36c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd370:	540001c1	b.ne	0xfffff7fbd3a8  // b.any
   0x0000fffff7fbd374:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd378:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd37c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd380:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd384:	54000121	b.ne	0xfffff7fbd3a8  // b.any
   0x0000fffff7fbd388:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd38c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbd390:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd39c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbd3a0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd3a4:	14000030	b	0xfffff7fbd464
   0x0000fffff7fbd3a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd3ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd3b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd3b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd3b8:	54000120	b.eq	0xfffff7fbd3dc  // b.none
   0x0000fffff7fbd3bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd3c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd3c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd3c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd3cc:	54000321	b.ne	0xfffff7fbd430  // b.any
   0x0000fffff7fbd3d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd3d4:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd3d8:	14000002	b	0xfffff7fbd3e0
   0x0000fffff7fbd3dc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbd3e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd3e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd3e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd3ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd3f0:	54000120	b.eq	0xfffff7fbd414  // b.none
   0x0000fffff7fbd3f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd3f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd3fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd400:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd404:	54000161	b.ne	0xfffff7fbd430  // b.any
   0x0000fffff7fbd408:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbd40c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd410:	14000002	b	0xfffff7fbd418
   0x0000fffff7fbd414:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbd418:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd41c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbd420:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd424:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd428:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd42c:	17ffffde	b	0xfffff7fbd3a4
   0x0000fffff7fbd430:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd434:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd438:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd43c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd440:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fbd444:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd448:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd44c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbd450:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd454:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd458:	d63f0200	blr	x16
   0x0000fffff7fbd45c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd460:	54005920	b.eq	0xfffff7fbdf84  // b.none
   0x0000fffff7fbd464:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd468:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd46c:	540004a0	b.eq	0xfffff7fbd500  // b.none
   0x0000fffff7fbd470:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd474:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd478:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd47c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd480:	54000400	b.eq	0xfffff7fbd500  // b.none
   0x0000fffff7fbd484:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd488:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd48c:	36d801d1	tbz	w17, #27, 0xfffff7fbd4c4
   0x0000fffff7fbd490:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd494:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd498:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd49c:	54000321	b.ne	0xfffff7fbd500  // b.any
   0x0000fffff7fbd4a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd4a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd4a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd4ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd4b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd4b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd4b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd4bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd4c0:	54000209	b.ls	0xfffff7fbd500  // b.plast
   0x0000fffff7fbd4c4:	36d8008d	tbz	w13, #27, 0xfffff7fbd4d4
   0x0000fffff7fbd4c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd4cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd4d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd4d4:	36d80091	tbz	w17, #27, 0xfffff7fbd4e4
   0x0000fffff7fbd4d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd4dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd4e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd4e4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbd4e8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbd4ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd4f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd4f4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbd4f8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbd4fc:	1400000e	b	0xfffff7fbd534
   0x0000fffff7fbd500:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd504:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd508:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd50c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd510:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fbd514:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd518:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd51c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbd520:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd524:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd528:	d63f0200	blr	x16
   0x0000fffff7fbd52c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd530:	540052e0	b.eq	0xfffff7fbdf8c  // b.none
   0x0000fffff7fbd534:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd538:	37d806a9	tbnz	w9, #27, 0xfffff7fbd60c
   0x0000fffff7fbd53c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd540:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd544:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd548:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd54c:	540001c1	b.ne	0xfffff7fbd584  // b.any
   0x0000fffff7fbd550:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd554:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd55c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd560:	54000121	b.ne	0xfffff7fbd584  // b.any
   0x0000fffff7fbd564:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd568:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbd56c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd570:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd574:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd578:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbd57c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd580:	14000030	b	0xfffff7fbd640
   0x0000fffff7fbd584:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd588:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd58c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd590:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd594:	54000120	b.eq	0xfffff7fbd5b8  // b.none
   0x0000fffff7fbd598:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd59c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd5a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd5a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd5a8:	54000321	b.ne	0xfffff7fbd60c  // b.any
   0x0000fffff7fbd5ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd5b0:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd5b4:	14000002	b	0xfffff7fbd5bc
   0x0000fffff7fbd5b8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbd5bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd5c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd5c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd5c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd5cc:	54000120	b.eq	0xfffff7fbd5f0  // b.none
   0x0000fffff7fbd5d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd5d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd5d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd5dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd5e0:	54000161	b.ne	0xfffff7fbd60c  // b.any
   0x0000fffff7fbd5e4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbd5e8:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd5ec:	14000002	b	0xfffff7fbd5f4
   0x0000fffff7fbd5f0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbd5f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd5f8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbd5fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd604:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd608:	17ffffde	b	0xfffff7fbd580
   0x0000fffff7fbd60c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd610:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd614:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd618:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd61c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fbd620:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd624:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd628:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbd62c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd630:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd634:	d63f0200	blr	x16
   0x0000fffff7fbd638:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd63c:	54004ac0	b.eq	0xfffff7fbdf94  // b.none
   0x0000fffff7fbd640:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd644:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd648:	540004a0	b.eq	0xfffff7fbd6dc  // b.none
   0x0000fffff7fbd64c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd650:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd654:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd658:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd65c:	54000400	b.eq	0xfffff7fbd6dc  // b.none
   0x0000fffff7fbd660:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd664:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd668:	36d801d1	tbz	w17, #27, 0xfffff7fbd6a0
   0x0000fffff7fbd66c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd670:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd674:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd678:	54000321	b.ne	0xfffff7fbd6dc  // b.any
   0x0000fffff7fbd67c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd680:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd684:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd688:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd68c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd690:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd694:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd698:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd69c:	54000209	b.ls	0xfffff7fbd6dc  // b.plast
   0x0000fffff7fbd6a0:	36d8008d	tbz	w13, #27, 0xfffff7fbd6b0
   0x0000fffff7fbd6a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd6a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd6ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd6b0:	36d80091	tbz	w17, #27, 0xfffff7fbd6c0
   0x0000fffff7fbd6b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd6b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd6bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd6c0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbd6c4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbd6c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd6cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd6d0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbd6d4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbd6d8:	1400000e	b	0xfffff7fbd710
   0x0000fffff7fbd6dc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd6e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd6e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd6e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd6ec:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fbd6f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd6f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd6f8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbd6fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd700:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd704:	d63f0200	blr	x16
   0x0000fffff7fbd708:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd70c:	54004480	b.eq	0xfffff7fbdf9c  // b.none
   0x0000fffff7fbd710:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd714:	37d806a9	tbnz	w9, #27, 0xfffff7fbd7e8
   0x0000fffff7fbd718:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd71c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd724:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd728:	540001c1	b.ne	0xfffff7fbd760  // b.any
   0x0000fffff7fbd72c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd730:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd738:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd73c:	54000121	b.ne	0xfffff7fbd760  // b.any
   0x0000fffff7fbd740:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd744:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbd748:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd74c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd750:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd754:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbd758:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd75c:	14000030	b	0xfffff7fbd81c
   0x0000fffff7fbd760:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd764:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd768:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd76c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd770:	54000120	b.eq	0xfffff7fbd794  // b.none
   0x0000fffff7fbd774:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd77c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd780:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd784:	54000321	b.ne	0xfffff7fbd7e8  // b.any
   0x0000fffff7fbd788:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd78c:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd790:	14000002	b	0xfffff7fbd798
   0x0000fffff7fbd794:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbd798:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd79c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd7a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd7a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd7a8:	54000120	b.eq	0xfffff7fbd7cc  // b.none
   0x0000fffff7fbd7ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd7b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd7b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd7b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd7bc:	54000161	b.ne	0xfffff7fbd7e8  // b.any
   0x0000fffff7fbd7c0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbd7c4:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd7c8:	14000002	b	0xfffff7fbd7d0
   0x0000fffff7fbd7cc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbd7d0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd7d4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbd7d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd7dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd7e0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd7e4:	17ffffde	b	0xfffff7fbd75c
   0x0000fffff7fbd7e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd7ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd7f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd7f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd7f8:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fbd7fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd800:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd804:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbd808:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd80c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd810:	d63f0200	blr	x16
   0x0000fffff7fbd814:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd818:	54003c60	b.eq	0xfffff7fbdfa4  // b.none
   0x0000fffff7fbd81c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd820:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbd824:	540004a0	b.eq	0xfffff7fbd8b8  // b.none
   0x0000fffff7fbd828:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbd82c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbd830:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbd834:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbd838:	54000400	b.eq	0xfffff7fbd8b8  // b.none
   0x0000fffff7fbd83c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbd840:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbd844:	36d801d1	tbz	w17, #27, 0xfffff7fbd87c
   0x0000fffff7fbd848:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbd84c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbd850:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbd854:	54000321	b.ne	0xfffff7fbd8b8  // b.any
   0x0000fffff7fbd858:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbd85c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd860:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbd864:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbd868:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbd86c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbd870:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbd874:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbd878:	54000209	b.ls	0xfffff7fbd8b8  // b.plast
   0x0000fffff7fbd87c:	36d8008d	tbz	w13, #27, 0xfffff7fbd88c
   0x0000fffff7fbd880:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbd884:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbd888:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbd88c:	36d80091	tbz	w17, #27, 0xfffff7fbd89c
   0x0000fffff7fbd890:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbd894:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbd898:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbd89c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbd8a0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbd8a4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbd8a8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbd8ac:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbd8b0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbd8b4:	1400000e	b	0xfffff7fbd8ec
   0x0000fffff7fbd8b8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbd8bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd8c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd8c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd8c8:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fbd8cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd8d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd8d4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbd8d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbd8dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd8e0:	d63f0200	blr	x16
   0x0000fffff7fbd8e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd8e8:	54003620	b.eq	0xfffff7fbdfac  // b.none
   0x0000fffff7fbd8ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd8f0:	37d806a9	tbnz	w9, #27, 0xfffff7fbd9c4
   0x0000fffff7fbd8f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd8f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd8fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd900:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd904:	540001c1	b.ne	0xfffff7fbd93c  // b.any
   0x0000fffff7fbd908:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd90c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd914:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd918:	54000121	b.ne	0xfffff7fbd93c  // b.any
   0x0000fffff7fbd91c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd920:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbd924:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbd928:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd92c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd930:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbd934:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd938:	14000030	b	0xfffff7fbd9f8
   0x0000fffff7fbd93c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd940:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd948:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd94c:	54000120	b.eq	0xfffff7fbd970  // b.none
   0x0000fffff7fbd950:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbd954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd95c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd960:	54000321	b.ne	0xfffff7fbd9c4  // b.any
   0x0000fffff7fbd964:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbd968:	9e620120	scvtf	d0, x9
   0x0000fffff7fbd96c:	14000002	b	0xfffff7fbd974
   0x0000fffff7fbd970:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbd974:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd978:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd97c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd980:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd984:	54000120	b.eq	0xfffff7fbd9a8  // b.none
   0x0000fffff7fbd988:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbd98c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbd990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd994:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbd998:	54000161	b.ne	0xfffff7fbd9c4  // b.any
   0x0000fffff7fbd99c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbd9a0:	9e620121	scvtf	d1, x9
   0x0000fffff7fbd9a4:	14000002	b	0xfffff7fbd9ac
   0x0000fffff7fbd9a8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbd9ac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbd9b0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbd9b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbd9b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbd9bc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbd9c0:	17ffffde	b	0xfffff7fbd938
   0x0000fffff7fbd9c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbd9c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbd9cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fbd9d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbd9d4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fbd9d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbd9dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fbd9e0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbd9e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbd9e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbd9ec:	d63f0200	blr	x16
   0x0000fffff7fbd9f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbd9f4:	54002e00	b.eq	0xfffff7fbdfb4  // b.none
   0x0000fffff7fbd9f8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbd9fc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbda00:	540004a0	b.eq	0xfffff7fbda94  // b.none
   0x0000fffff7fbda04:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbda08:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbda0c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbda10:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbda14:	54000400	b.eq	0xfffff7fbda94  // b.none
   0x0000fffff7fbda18:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbda1c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbda20:	36d801d1	tbz	w17, #27, 0xfffff7fbda58
   0x0000fffff7fbda24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbda28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbda2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbda30:	54000321	b.ne	0xfffff7fbda94  // b.any
   0x0000fffff7fbda34:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbda38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbda3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbda40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbda44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbda48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbda4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbda50:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbda54:	54000209	b.ls	0xfffff7fbda94  // b.plast
   0x0000fffff7fbda58:	36d8008d	tbz	w13, #27, 0xfffff7fbda68
   0x0000fffff7fbda5c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbda60:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbda64:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbda68:	36d80091	tbz	w17, #27, 0xfffff7fbda78
   0x0000fffff7fbda6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbda70:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbda74:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbda78:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbda7c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbda80:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbda84:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbda88:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbda8c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbda90:	1400000e	b	0xfffff7fbdac8
   0x0000fffff7fbda94:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbda98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbda9c:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdaa0:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdaa4:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fbdaa8:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdaac:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdab0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbdab4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbdab8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdabc:	d63f0200	blr	x16
   0x0000fffff7fbdac0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbdac4:	540027c0	b.eq	0xfffff7fbdfbc  // b.none
   0x0000fffff7fbdac8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdacc:	37d806a9	tbnz	w9, #27, 0xfffff7fbdba0
   0x0000fffff7fbdad0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdad4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdad8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdadc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdae0:	540001c1	b.ne	0xfffff7fbdb18  // b.any
   0x0000fffff7fbdae4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbdae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdaec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdaf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdaf4:	54000121	b.ne	0xfffff7fbdb18  // b.any
   0x0000fffff7fbdaf8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbdafc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbdb00:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbdb04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdb08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdb0c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbdb10:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbdb14:	14000030	b	0xfffff7fbdbd4
   0x0000fffff7fbdb18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdb1c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbdb20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdb24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdb28:	54000120	b.eq	0xfffff7fbdb4c  // b.none
   0x0000fffff7fbdb2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdb30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdb34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdb38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdb3c:	54000321	b.ne	0xfffff7fbdba0  // b.any
   0x0000fffff7fbdb40:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbdb44:	9e620120	scvtf	d0, x9
   0x0000fffff7fbdb48:	14000002	b	0xfffff7fbdb50
   0x0000fffff7fbdb4c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbdb50:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbdb54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbdb58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdb5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdb60:	54000120	b.eq	0xfffff7fbdb84  // b.none
   0x0000fffff7fbdb64:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbdb68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdb6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdb70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdb74:	54000161	b.ne	0xfffff7fbdba0  // b.any
   0x0000fffff7fbdb78:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbdb7c:	9e620121	scvtf	d1, x9
   0x0000fffff7fbdb80:	14000002	b	0xfffff7fbdb88
   0x0000fffff7fbdb84:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbdb88:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbdb8c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbdb90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbdb94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdb98:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbdb9c:	17ffffde	b	0xfffff7fbdb14
   0x0000fffff7fbdba0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbdba4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdba8:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdbac:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdbb0:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fbdbb4:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdbb8:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdbbc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbdbc0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbdbc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdbc8:	d63f0200	blr	x16
   0x0000fffff7fbdbcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbdbd0:	54001fa0	b.eq	0xfffff7fbdfc4  // b.none
   0x0000fffff7fbdbd4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fbdbd8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fbdbdc:	540004a0	b.eq	0xfffff7fbdc70  // b.none
   0x0000fffff7fbdbe0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fbdbe4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fbdbe8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fbdbec:	eb0901bf	cmp	x13, x9
   0x0000fffff7fbdbf0:	54000400	b.eq	0xfffff7fbdc70  // b.none
   0x0000fffff7fbdbf4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fbdbf8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fbdbfc:	36d801d1	tbz	w17, #27, 0xfffff7fbdc34
   0x0000fffff7fbdc00:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbdc04:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbdc08:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbdc0c:	54000321	b.ne	0xfffff7fbdc70  // b.any
   0x0000fffff7fbdc10:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fbdc14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdc18:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbdc1c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbdc20:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbdc24:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbdc28:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbdc2c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbdc30:	54000209	b.ls	0xfffff7fbdc70  // b.plast
   0x0000fffff7fbdc34:	36d8008d	tbz	w13, #27, 0xfffff7fbdc44
   0x0000fffff7fbdc38:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fbdc3c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fbdc40:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fbdc44:	36d80091	tbz	w17, #27, 0xfffff7fbdc54
   0x0000fffff7fbdc48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbdc4c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbdc50:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbdc54:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fbdc58:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbdc5c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fbdc60:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fbdc64:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbdc68:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbdc6c:	1400000e	b	0xfffff7fbdca4
   0x0000fffff7fbdc70:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fbdc74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdc78:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdc7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdc80:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fbdc84:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdc88:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdc8c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fbdc90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbdc94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdc98:	d63f0200	blr	x16
   0x0000fffff7fbdc9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbdca0:	54001960	b.eq	0xfffff7fbdfcc  // b.none
   0x0000fffff7fbdca4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdca8:	37d806a9	tbnz	w9, #27, 0xfffff7fbdd7c
   0x0000fffff7fbdcac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdcb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdcb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdcb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdcbc:	540001c1	b.ne	0xfffff7fbdcf4  // b.any
   0x0000fffff7fbdcc0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbdcc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdcc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdccc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdcd0:	54000121	b.ne	0xfffff7fbdcf4  // b.any
   0x0000fffff7fbdcd4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbdcd8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fbdcdc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fbdce0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdce4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdce8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fbdcec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbdcf0:	14000030	b	0xfffff7fbddb0
   0x0000fffff7fbdcf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdcf8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbdcfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdd00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdd04:	54000120	b.eq	0xfffff7fbdd28  // b.none
   0x0000fffff7fbdd08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fbdd0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdd10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdd14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdd18:	54000321	b.ne	0xfffff7fbdd7c  // b.any
   0x0000fffff7fbdd1c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fbdd20:	9e620120	scvtf	d0, x9
   0x0000fffff7fbdd24:	14000002	b	0xfffff7fbdd2c
   0x0000fffff7fbdd28:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fbdd2c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbdd30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbdd34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdd38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdd3c:	54000120	b.eq	0xfffff7fbdd60  // b.none
   0x0000fffff7fbdd40:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fbdd44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdd48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdd4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbdd50:	54000161	b.ne	0xfffff7fbdd7c  // b.any
   0x0000fffff7fbdd54:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fbdd58:	9e620121	scvtf	d1, x9
   0x0000fffff7fbdd5c:	14000002	b	0xfffff7fbdd64
   0x0000fffff7fbdd60:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fbdd64:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fbdd68:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fbdd6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fbdd70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdd74:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fbdd78:	17ffffde	b	0xfffff7fbdcf0
   0x0000fffff7fbdd7c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbdd80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbdd84:	aa1303e1	mov	x1, x19
   0x0000fffff7fbdd88:	aa1503e2	mov	x2, x21
   0x0000fffff7fbdd8c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fbdd90:	aa1403e4	mov	x4, x20
   0x0000fffff7fbdd94:	aa1603e5	mov	x5, x22
   0x0000fffff7fbdd98:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fbdd9c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbdda0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbdda4:	d63f0200	blr	x16
   0x0000fffff7fbdda8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbddac:	54001140	b.eq	0xfffff7fbdfd4  // b.none
   0x0000fffff7fbddb0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fbddb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbddb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbddbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fbddc0:	54000381	b.ne	0xfffff7fbde30  // b.any
   0x0000fffff7fbddc4:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fbddc8:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fbddcc:	8b0a018b	add	x11, x12, x10
   0x0000fffff7fbddd0:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fbddd4:	36d80211	tbz	w17, #27, 0xfffff7fbde14
   0x0000fffff7fbddd8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fbdddc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fbdde0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fbdde4:	54000261	b.ne	0xfffff7fbde30  // b.any
   0x0000fffff7fbdde8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fbddec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fbddf0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fbddf4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fbddf8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fbddfc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fbde00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fbde04:	f100055f	cmp	x10, #0x1
   0x0000fffff7fbde08:	54000149	b.ls	0xfffff7fbde30  // b.plast
   0x0000fffff7fbde0c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fbde10:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fbde14:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fbde18:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fbde1c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fbde20:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fbde24:	f9002e6b	str	x11, [x19, #88]
   0x0000fffff7fbde28:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fbde2c:	1400000e	b	0xfffff7fbde64
   0x0000fffff7fbde30:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbde34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbde38:	aa1303e1	mov	x1, x19
   0x0000fffff7fbde3c:	aa1503e2	mov	x2, x21
   0x0000fffff7fbde40:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fbde44:	aa1403e4	mov	x4, x20
   0x0000fffff7fbde48:	aa1603e5	mov	x5, x22
   0x0000fffff7fbde4c:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fbde50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fbde54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbde58:	d63f0200	blr	x16
   0x0000fffff7fbde5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fbde60:	54000be0	b.eq	0xfffff7fbdfdc  // b.none
   0x0000fffff7fbde64:	17fff8c6	b	0xfffff7fbc17c
   0x0000fffff7fbde68:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fbde6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fbde70:	aa1303e1	mov	x1, x19
   0x0000fffff7fbde74:	aa1503e2	mov	x2, x21
   0x0000fffff7fbde78:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fbde7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fbde80:	aa1603e5	mov	x5, x22
   0x0000fffff7fbde84:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fbde88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fbde8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fbde90:	d63f0200	blr	x16
   0x0000fffff7fbde94:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbde98:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbde9c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbdea0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbdea4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fbdea8:	d65f03c0	ret
   0x0000fffff7fbdeac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fbdeb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fbdeb4:	b900028a	str	w10, [x20]
   0x0000fffff7fbdeb8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fbdebc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fbdec0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fbdec4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fbdec8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fbdecc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fbded0:	d65f03c0	ret
   0x0000fffff7fbded4:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fbded8:	17fffff5	b	0xfffff7fbdeac
   0x0000fffff7fbdedc:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fbdee0:	17fffff3	b	0xfffff7fbdeac
   0x0000fffff7fbdee4:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fbdee8:	17fffff1	b	0xfffff7fbdeac
   0x0000fffff7fbdeec:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fbdef0:	17ffffef	b	0xfffff7fbdeac
   0x0000fffff7fbdef4:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fbdef8:	17ffffed	b	0xfffff7fbdeac
   0x0000fffff7fbdefc:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fbdf00:	17ffffeb	b	0xfffff7fbdeac
   0x0000fffff7fbdf04:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fbdf08:	17ffffe9	b	0xfffff7fbdeac
   0x0000fffff7fbdf0c:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fbdf10:	17ffffe7	b	0xfffff7fbdeac
   0x0000fffff7fbdf14:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fbdf18:	17ffffe5	b	0xfffff7fbdeac
   0x0000fffff7fbdf1c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fbdf20:	17ffffe3	b	0xfffff7fbdeac
   0x0000fffff7fbdf24:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fbdf28:	17ffffe1	b	0xfffff7fbdeac
   0x0000fffff7fbdf2c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fbdf30:	17ffffdf	b	0xfffff7fbdeac
   0x0000fffff7fbdf34:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fbdf38:	17ffffdd	b	0xfffff7fbdeac
   0x0000fffff7fbdf3c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fbdf40:	17ffffdb	b	0xfffff7fbdeac
   0x0000fffff7fbdf44:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fbdf48:	17ffffd9	b	0xfffff7fbdeac
   0x0000fffff7fbdf4c:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fbdf50:	17ffffd7	b	0xfffff7fbdeac
   0x0000fffff7fbdf54:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fbdf58:	17ffffd5	b	0xfffff7fbdeac
   0x0000fffff7fbdf5c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fbdf60:	17ffffd3	b	0xfffff7fbdeac
   0x0000fffff7fbdf64:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fbdf68:	17ffffd1	b	0xfffff7fbdeac
   0x0000fffff7fbdf6c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fbdf70:	17ffffcf	b	0xfffff7fbdeac
   0x0000fffff7fbdf74:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fbdf78:	17ffffcd	b	0xfffff7fbdeac
   0x0000fffff7fbdf7c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fbdf80:	17ffffcb	b	0xfffff7fbdeac
   0x0000fffff7fbdf84:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fbdf88:	17ffffc9	b	0xfffff7fbdeac
   0x0000fffff7fbdf8c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fbdf90:	17ffffc7	b	0xfffff7fbdeac
   0x0000fffff7fbdf94:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fbdf98:	17ffffc5	b	0xfffff7fbdeac
   0x0000fffff7fbdf9c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fbdfa0:	17ffffc3	b	0xfffff7fbdeac
   0x0000fffff7fbdfa4:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fbdfa8:	17ffffc1	b	0xfffff7fbdeac
   0x0000fffff7fbdfac:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fbdfb0:	17ffffbf	b	0xfffff7fbdeac
   0x0000fffff7fbdfb4:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fbdfb8:	17ffffbd	b	0xfffff7fbdeac
   0x0000fffff7fbdfbc:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fbdfc0:	17ffffbb	b	0xfffff7fbdeac
   0x0000fffff7fbdfc4:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fbdfc8:	17ffffb9	b	0xfffff7fbdeac
   0x0000fffff7fbdfcc:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fbdfd0:	17ffffb7	b	0xfffff7fbdeac
   0x0000fffff7fbdfd4:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fbdfd8:	17ffffb5	b	0xfffff7fbdeac
   0x0000fffff7fbdfdc:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fbdfe0:	17ffffb3	b	0xfffff7fbdeac
   0x0000fffff7fbdfe4:	00000000	udf	#0
   0x0000fffff7fbdfe8:	00000000	udf	#0
   0x0000fffff7fbdfec:	00000000	udf	#0
   0x0000fffff7fbdff0:	00000000	udf	#0
   0x0000fffff7fbdff4:	00000000	udf	#0
   0x0000fffff7fbdff8:	00000000	udf	#0
   0x0000fffff7fbdffc:	00000000	udf	#0
End of assembler dump.
