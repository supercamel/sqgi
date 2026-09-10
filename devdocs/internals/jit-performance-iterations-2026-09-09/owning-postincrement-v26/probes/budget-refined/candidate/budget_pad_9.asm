Dump of assembler code from 0xfffff7fac000 to 0xfffff7fae000:
   0x0000fffff7fac000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fac004:	910003fd	mov	x29, sp
   0x0000fffff7fac008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fac00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fac010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fac014:	aa0003f3	mov	x19, x0
   0x0000fffff7fac018:	aa0103f4	mov	x20, x1
   0x0000fffff7fac01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fac020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fac024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fac028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fac02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fac030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fac034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fac038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fac03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fac040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac044:	d63f0200	blr	x16
   0x0000fffff7fac048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fac04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fac050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fac054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fac058:	14000001	b	0xfffff7fac05c
   0x0000fffff7fac05c:	14000001	b	0xfffff7fac060
   0x0000fffff7fac060:	14000001	b	0xfffff7fac064
   0x0000fffff7fac064:	14000001	b	0xfffff7fac068
   0x0000fffff7fac068:	14000001	b	0xfffff7fac06c
   0x0000fffff7fac06c:	14000001	b	0xfffff7fac070
   0x0000fffff7fac070:	14000001	b	0xfffff7fac074
   0x0000fffff7fac074:	14000001	b	0xfffff7fac078
   0x0000fffff7fac078:	14000001	b	0xfffff7fac07c
   0x0000fffff7fac07c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fac080:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fac084:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fac088:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fac08c:	36d80211	tbz	w17, #27, 0xfffff7fac0cc
   0x0000fffff7fac090:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac094:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac098:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac09c:	540001e1	b.ne	0xfffff7fac0d8  // b.any
   0x0000fffff7fac0a0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fac0a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac0a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac0ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac0b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac0b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac0b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac0bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac0c0:	540000c9	b.ls	0xfffff7fac0d8  // b.plast
   0x0000fffff7fac0c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac0c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac0cc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fac0d0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fac0d4:	1400000e	b	0xfffff7fac10c
   0x0000fffff7fac0d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac0dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac0e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fac0e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fac0e8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fac0ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fac0f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac0f4:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fac0f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac0fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac100:	d63f0200	blr	x16
   0x0000fffff7fac104:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac108:	5400ede0	b.eq	0xfffff7fadec4  // b.none
   0x0000fffff7fac10c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fac110:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fac114:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fac118:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fac11c:	36d80211	tbz	w17, #27, 0xfffff7fac15c
   0x0000fffff7fac120:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac124:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac128:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac12c:	540001e1	b.ne	0xfffff7fac168  // b.any
   0x0000fffff7fac130:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fac134:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac138:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac13c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac140:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac144:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac148:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac14c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac150:	540000c9	b.ls	0xfffff7fac168  // b.plast
   0x0000fffff7fac154:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac158:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac15c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fac160:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fac164:	1400000e	b	0xfffff7fac19c
   0x0000fffff7fac168:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac16c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac170:	aa1303e1	mov	x1, x19
   0x0000fffff7fac174:	aa1503e2	mov	x2, x21
   0x0000fffff7fac178:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fac17c:	aa1403e4	mov	x4, x20
   0x0000fffff7fac180:	aa1603e5	mov	x5, x22
   0x0000fffff7fac184:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fac188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac18c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac190:	d63f0200	blr	x16
   0x0000fffff7fac194:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac198:	5400e9a0	b.eq	0xfffff7fadecc  // b.none
   0x0000fffff7fac19c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fac1a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac1a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1ac:	54000421	b.ne	0xfffff7fac230  // b.any
   0x0000fffff7fac1b0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac1b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac1b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1c0:	54000381	b.ne	0xfffff7fac230  // b.any
   0x0000fffff7fac1c4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fac1c8:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fac1cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1d0:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fac1d4:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fac1d8:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fac1dc:	91000580	add	x0, x12, #0x1
   0x0000fffff7fac1e0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac1e4:	36d80211	tbz	w17, #27, 0xfffff7fac224
   0x0000fffff7fac1e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac1ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac1f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac1f4:	540001e1	b.ne	0xfffff7fac230  // b.any
   0x0000fffff7fac1f8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac1fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac200:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac204:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac208:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac20c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac210:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac214:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac218:	540000c9	b.ls	0xfffff7fac230  // b.plast
   0x0000fffff7fac21c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac220:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac224:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fac228:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fac22c:	1400000e	b	0xfffff7fac264
   0x0000fffff7fac230:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac234:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac238:	aa1303e1	mov	x1, x19
   0x0000fffff7fac23c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac240:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fac244:	aa1403e4	mov	x4, x20
   0x0000fffff7fac248:	aa1603e5	mov	x5, x22
   0x0000fffff7fac24c:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fac250:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac254:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac258:	d63f0200	blr	x16
   0x0000fffff7fac25c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac260:	5400e3a0	b.eq	0xfffff7faded4  // b.none
   0x0000fffff7fac264:	f100041f	cmp	x0, #0x1
   0x0000fffff7fac268:	5400df80	b.eq	0xfffff7fade58  // b.none
   0x0000fffff7fac26c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fac270:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fac274:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fac278:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fac27c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fac280:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fac284:	36d801d1	tbz	w17, #27, 0xfffff7fac2bc
   0x0000fffff7fac288:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac28c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac290:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac294:	54000281	b.ne	0xfffff7fac2e4  // b.any
   0x0000fffff7fac298:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fac29c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac2a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac2a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac2a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac2ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac2b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac2b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac2b8:	54000169	b.ls	0xfffff7fac2e4  // b.plast
   0x0000fffff7fac2bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac2c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac2c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac2c8:	36d80091	tbz	w17, #27, 0xfffff7fac2d8
   0x0000fffff7fac2cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac2d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac2d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac2d8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fac2dc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fac2e0:	1400000e	b	0xfffff7fac318
   0x0000fffff7fac2e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac2e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac2ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fac2f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fac2f4:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fac2f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fac2fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fac300:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fac304:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac308:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac30c:	d63f0200	blr	x16
   0x0000fffff7fac310:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac314:	5400de40	b.eq	0xfffff7fadedc  // b.none
   0x0000fffff7fac318:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fac31c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac320:	540003a0	b.eq	0xfffff7fac394  // b.none
   0x0000fffff7fac324:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fac328:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fac32c:	b9400171	ldr	w17, [x11]
   0x0000fffff7fac330:	36d801d1	tbz	w17, #27, 0xfffff7fac368
   0x0000fffff7fac334:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac338:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac33c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac340:	540002a1	b.ne	0xfffff7fac394  // b.any
   0x0000fffff7fac344:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fac348:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac34c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac350:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac354:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac358:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac35c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac360:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac364:	54000189	b.ls	0xfffff7fac394  // b.plast
   0x0000fffff7fac368:	36d8008d	tbz	w13, #27, 0xfffff7fac378
   0x0000fffff7fac36c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac370:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac374:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac378:	36d80091	tbz	w17, #27, 0xfffff7fac388
   0x0000fffff7fac37c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac380:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac384:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac388:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fac38c:	b900016d	str	w13, [x11]
   0x0000fffff7fac390:	1400000e	b	0xfffff7fac3c8
   0x0000fffff7fac394:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac398:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac39c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac3a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fac3a4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fac3a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fac3ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fac3b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fac3b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac3b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac3bc:	d63f0200	blr	x16
   0x0000fffff7fac3c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac3c4:	5400d900	b.eq	0xfffff7fadee4  // b.none
   0x0000fffff7fac3c8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac3cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac3d0:	540004a0	b.eq	0xfffff7fac464  // b.none
   0x0000fffff7fac3d4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac3d8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac3dc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac3e0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac3e4:	54000400	b.eq	0xfffff7fac464  // b.none
   0x0000fffff7fac3e8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac3ec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac3f0:	36d801d1	tbz	w17, #27, 0xfffff7fac428
   0x0000fffff7fac3f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac3f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac3fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac400:	54000321	b.ne	0xfffff7fac464  // b.any
   0x0000fffff7fac404:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac408:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac40c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac410:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac414:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac418:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac41c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac420:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac424:	54000209	b.ls	0xfffff7fac464  // b.plast
   0x0000fffff7fac428:	36d8008d	tbz	w13, #27, 0xfffff7fac438
   0x0000fffff7fac42c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac430:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac434:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac438:	36d80091	tbz	w17, #27, 0xfffff7fac448
   0x0000fffff7fac43c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac440:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac444:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac448:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fac44c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fac450:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac454:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac458:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fac45c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fac460:	1400000e	b	0xfffff7fac498
   0x0000fffff7fac464:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac468:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac46c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac470:	aa1503e2	mov	x2, x21
   0x0000fffff7fac474:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fac478:	aa1403e4	mov	x4, x20
   0x0000fffff7fac47c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac480:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac484:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac488:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac48c:	d63f0200	blr	x16
   0x0000fffff7fac490:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac494:	5400d2c0	b.eq	0xfffff7fadeec  // b.none
   0x0000fffff7fac498:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac49c:	37d806a9	tbnz	w9, #27, 0xfffff7fac570
   0x0000fffff7fac4a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac4a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac4a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac4ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac4b0:	540001c1	b.ne	0xfffff7fac4e8  // b.any
   0x0000fffff7fac4b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fac4b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac4bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac4c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac4c4:	54000121	b.ne	0xfffff7fac4e8  // b.any
   0x0000fffff7fac4c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fac4cc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fac4d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac4d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac4d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac4dc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fac4e0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fac4e4:	14000030	b	0xfffff7fac5a4
   0x0000fffff7fac4e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac4ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac4f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac4f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac4f8:	54000120	b.eq	0xfffff7fac51c  // b.none
   0x0000fffff7fac4fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac500:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac508:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac50c:	54000321	b.ne	0xfffff7fac570  // b.any
   0x0000fffff7fac510:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fac514:	9e620120	scvtf	d0, x9
   0x0000fffff7fac518:	14000002	b	0xfffff7fac520
   0x0000fffff7fac51c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fac520:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fac524:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac52c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac530:	54000120	b.eq	0xfffff7fac554  // b.none
   0x0000fffff7fac534:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fac538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac53c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac540:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac544:	54000161	b.ne	0xfffff7fac570  // b.any
   0x0000fffff7fac548:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fac54c:	9e620121	scvtf	d1, x9
   0x0000fffff7fac550:	14000002	b	0xfffff7fac558
   0x0000fffff7fac554:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fac558:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac55c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fac560:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac568:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fac56c:	17ffffde	b	0xfffff7fac4e4
   0x0000fffff7fac570:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac574:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac578:	aa1303e1	mov	x1, x19
   0x0000fffff7fac57c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac580:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fac584:	aa1403e4	mov	x4, x20
   0x0000fffff7fac588:	aa1603e5	mov	x5, x22
   0x0000fffff7fac58c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac590:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac594:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac598:	d63f0200	blr	x16
   0x0000fffff7fac59c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac5a0:	5400caa0	b.eq	0xfffff7fadef4  // b.none
   0x0000fffff7fac5a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac5a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac5ac:	540004a0	b.eq	0xfffff7fac640  // b.none
   0x0000fffff7fac5b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac5b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac5b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac5bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac5c0:	54000400	b.eq	0xfffff7fac640  // b.none
   0x0000fffff7fac5c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac5c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac5cc:	36d801d1	tbz	w17, #27, 0xfffff7fac604
   0x0000fffff7fac5d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac5d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac5d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac5dc:	54000321	b.ne	0xfffff7fac640  // b.any
   0x0000fffff7fac5e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac5e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac5e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac5ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac5f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac5f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac5f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac5fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac600:	54000209	b.ls	0xfffff7fac640  // b.plast
   0x0000fffff7fac604:	36d8008d	tbz	w13, #27, 0xfffff7fac614
   0x0000fffff7fac608:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac60c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac610:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac614:	36d80091	tbz	w17, #27, 0xfffff7fac624
   0x0000fffff7fac618:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac61c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac620:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac624:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fac628:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fac62c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac630:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac634:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fac638:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fac63c:	1400000e	b	0xfffff7fac674
   0x0000fffff7fac640:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac644:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac648:	aa1303e1	mov	x1, x19
   0x0000fffff7fac64c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac650:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fac654:	aa1403e4	mov	x4, x20
   0x0000fffff7fac658:	aa1603e5	mov	x5, x22
   0x0000fffff7fac65c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac660:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac664:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac668:	d63f0200	blr	x16
   0x0000fffff7fac66c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac670:	5400c460	b.eq	0xfffff7fadefc  // b.none
   0x0000fffff7fac674:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac678:	37d806a9	tbnz	w9, #27, 0xfffff7fac74c
   0x0000fffff7fac67c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac680:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac688:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac68c:	540001c1	b.ne	0xfffff7fac6c4  // b.any
   0x0000fffff7fac690:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fac694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac69c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac6a0:	54000121	b.ne	0xfffff7fac6c4  // b.any
   0x0000fffff7fac6a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fac6a8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fac6ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac6b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac6b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac6b8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fac6bc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fac6c0:	14000030	b	0xfffff7fac780
   0x0000fffff7fac6c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac6c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac6cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac6d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac6d4:	54000120	b.eq	0xfffff7fac6f8  // b.none
   0x0000fffff7fac6d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac6dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac6e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac6e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac6e8:	54000321	b.ne	0xfffff7fac74c  // b.any
   0x0000fffff7fac6ec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fac6f0:	9e620120	scvtf	d0, x9
   0x0000fffff7fac6f4:	14000002	b	0xfffff7fac6fc
   0x0000fffff7fac6f8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fac6fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fac700:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac704:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac708:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac70c:	54000120	b.eq	0xfffff7fac730  // b.none
   0x0000fffff7fac710:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fac714:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac71c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac720:	54000161	b.ne	0xfffff7fac74c  // b.any
   0x0000fffff7fac724:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fac728:	9e620121	scvtf	d1, x9
   0x0000fffff7fac72c:	14000002	b	0xfffff7fac734
   0x0000fffff7fac730:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fac734:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac738:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fac73c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac740:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac744:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fac748:	17ffffde	b	0xfffff7fac6c0
   0x0000fffff7fac74c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac750:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac754:	aa1303e1	mov	x1, x19
   0x0000fffff7fac758:	aa1503e2	mov	x2, x21
   0x0000fffff7fac75c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fac760:	aa1403e4	mov	x4, x20
   0x0000fffff7fac764:	aa1603e5	mov	x5, x22
   0x0000fffff7fac768:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac76c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac770:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac774:	d63f0200	blr	x16
   0x0000fffff7fac778:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac77c:	5400bc40	b.eq	0xfffff7fadf04  // b.none
   0x0000fffff7fac780:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac784:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac788:	540004a0	b.eq	0xfffff7fac81c  // b.none
   0x0000fffff7fac78c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac790:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac794:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac798:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac79c:	54000400	b.eq	0xfffff7fac81c  // b.none
   0x0000fffff7fac7a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac7a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac7a8:	36d801d1	tbz	w17, #27, 0xfffff7fac7e0
   0x0000fffff7fac7ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac7b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac7b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac7b8:	54000321	b.ne	0xfffff7fac81c  // b.any
   0x0000fffff7fac7bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac7c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac7c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac7c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac7cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac7d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac7d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac7d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac7dc:	54000209	b.ls	0xfffff7fac81c  // b.plast
   0x0000fffff7fac7e0:	36d8008d	tbz	w13, #27, 0xfffff7fac7f0
   0x0000fffff7fac7e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac7e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac7ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac7f0:	36d80091	tbz	w17, #27, 0xfffff7fac800
   0x0000fffff7fac7f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac7f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac7fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac800:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fac804:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fac808:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac80c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac810:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fac814:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fac818:	1400000e	b	0xfffff7fac850
   0x0000fffff7fac81c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac820:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac824:	aa1303e1	mov	x1, x19
   0x0000fffff7fac828:	aa1503e2	mov	x2, x21
   0x0000fffff7fac82c:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fac830:	aa1403e4	mov	x4, x20
   0x0000fffff7fac834:	aa1603e5	mov	x5, x22
   0x0000fffff7fac838:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fac83c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac840:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac844:	d63f0200	blr	x16
   0x0000fffff7fac848:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac84c:	5400b600	b.eq	0xfffff7fadf0c  // b.none
   0x0000fffff7fac850:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac854:	37d806a9	tbnz	w9, #27, 0xfffff7fac928
   0x0000fffff7fac858:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac85c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac860:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac864:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac868:	540001c1	b.ne	0xfffff7fac8a0  // b.any
   0x0000fffff7fac86c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fac870:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac874:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac878:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac87c:	54000121	b.ne	0xfffff7fac8a0  // b.any
   0x0000fffff7fac880:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fac884:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fac888:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac88c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac890:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac894:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fac898:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fac89c:	14000030	b	0xfffff7fac95c
   0x0000fffff7fac8a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac8a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac8a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8b0:	54000120	b.eq	0xfffff7fac8d4  // b.none
   0x0000fffff7fac8b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fac8b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac8bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8c4:	54000321	b.ne	0xfffff7fac928  // b.any
   0x0000fffff7fac8c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fac8cc:	9e620120	scvtf	d0, x9
   0x0000fffff7fac8d0:	14000002	b	0xfffff7fac8d8
   0x0000fffff7fac8d4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fac8d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fac8dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac8e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8e8:	54000120	b.eq	0xfffff7fac90c  // b.none
   0x0000fffff7fac8ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fac8f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac8f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8fc:	54000161	b.ne	0xfffff7fac928  // b.any
   0x0000fffff7fac900:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fac904:	9e620121	scvtf	d1, x9
   0x0000fffff7fac908:	14000002	b	0xfffff7fac910
   0x0000fffff7fac90c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fac910:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac914:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fac918:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac91c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac920:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fac924:	17ffffde	b	0xfffff7fac89c
   0x0000fffff7fac928:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac92c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac930:	aa1303e1	mov	x1, x19
   0x0000fffff7fac934:	aa1503e2	mov	x2, x21
   0x0000fffff7fac938:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fac93c:	aa1403e4	mov	x4, x20
   0x0000fffff7fac940:	aa1603e5	mov	x5, x22
   0x0000fffff7fac944:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fac948:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac94c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac950:	d63f0200	blr	x16
   0x0000fffff7fac954:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac958:	5400ade0	b.eq	0xfffff7fadf14  // b.none
   0x0000fffff7fac95c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac960:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac964:	540004a0	b.eq	0xfffff7fac9f8  // b.none
   0x0000fffff7fac968:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac96c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac970:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac974:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac978:	54000400	b.eq	0xfffff7fac9f8  // b.none
   0x0000fffff7fac97c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac980:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac984:	36d801d1	tbz	w17, #27, 0xfffff7fac9bc
   0x0000fffff7fac988:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac98c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac990:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac994:	54000321	b.ne	0xfffff7fac9f8  // b.any
   0x0000fffff7fac998:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac99c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac9a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac9a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac9a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac9ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac9b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac9b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac9b8:	54000209	b.ls	0xfffff7fac9f8  // b.plast
   0x0000fffff7fac9bc:	36d8008d	tbz	w13, #27, 0xfffff7fac9cc
   0x0000fffff7fac9c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac9c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac9c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac9cc:	36d80091	tbz	w17, #27, 0xfffff7fac9dc
   0x0000fffff7fac9d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac9d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac9d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac9dc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fac9e0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fac9e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac9e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac9ec:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fac9f0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fac9f4:	1400000e	b	0xfffff7faca2c
   0x0000fffff7fac9f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac9fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faca00:	aa1303e1	mov	x1, x19
   0x0000fffff7faca04:	aa1503e2	mov	x2, x21
   0x0000fffff7faca08:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7faca0c:	aa1403e4	mov	x4, x20
   0x0000fffff7faca10:	aa1603e5	mov	x5, x22
   0x0000fffff7faca14:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faca18:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faca1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faca20:	d63f0200	blr	x16
   0x0000fffff7faca24:	f100001f	cmp	x0, #0x0
   0x0000fffff7faca28:	5400a7a0	b.eq	0xfffff7fadf1c  // b.none
   0x0000fffff7faca2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faca30:	37d806a9	tbnz	w9, #27, 0xfffff7facb04
   0x0000fffff7faca34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faca38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faca3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faca40:	eb0a013f	cmp	x9, x10
   0x0000fffff7faca44:	540001c1	b.ne	0xfffff7faca7c  // b.any
   0x0000fffff7faca48:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faca4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faca50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faca54:	eb0a013f	cmp	x9, x10
   0x0000fffff7faca58:	54000121	b.ne	0xfffff7faca7c  // b.any
   0x0000fffff7faca5c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faca60:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faca64:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faca68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faca6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faca70:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faca74:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faca78:	14000030	b	0xfffff7facb38
   0x0000fffff7faca7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faca80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faca84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faca88:	eb0a013f	cmp	x9, x10
   0x0000fffff7faca8c:	54000120	b.eq	0xfffff7facab0  // b.none
   0x0000fffff7faca90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faca94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faca98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faca9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7facaa0:	54000321	b.ne	0xfffff7facb04  // b.any
   0x0000fffff7facaa4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7facaa8:	9e620120	scvtf	d0, x9
   0x0000fffff7facaac:	14000002	b	0xfffff7facab4
   0x0000fffff7facab0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7facab4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7facab8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facabc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7facac4:	54000120	b.eq	0xfffff7facae8  // b.none
   0x0000fffff7facac8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7facacc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7facad8:	54000161	b.ne	0xfffff7facb04  // b.any
   0x0000fffff7facadc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7facae0:	9e620121	scvtf	d1, x9
   0x0000fffff7facae4:	14000002	b	0xfffff7facaec
   0x0000fffff7facae8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7facaec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7facaf0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7facaf4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facaf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facafc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7facb00:	17ffffde	b	0xfffff7faca78
   0x0000fffff7facb04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facb08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facb0c:	aa1303e1	mov	x1, x19
   0x0000fffff7facb10:	aa1503e2	mov	x2, x21
   0x0000fffff7facb14:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7facb18:	aa1403e4	mov	x4, x20
   0x0000fffff7facb1c:	aa1603e5	mov	x5, x22
   0x0000fffff7facb20:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7facb24:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7facb28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facb2c:	d63f0200	blr	x16
   0x0000fffff7facb30:	f100001f	cmp	x0, #0x0
   0x0000fffff7facb34:	54009f80	b.eq	0xfffff7fadf24  // b.none
   0x0000fffff7facb38:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7facb3c:	f100017f	cmp	x11, #0x0
   0x0000fffff7facb40:	540004a0	b.eq	0xfffff7facbd4  // b.none
   0x0000fffff7facb44:	b940016d	ldr	w13, [x11]
   0x0000fffff7facb48:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7facb4c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7facb50:	eb0901bf	cmp	x13, x9
   0x0000fffff7facb54:	54000400	b.eq	0xfffff7facbd4  // b.none
   0x0000fffff7facb58:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7facb5c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7facb60:	36d801d1	tbz	w17, #27, 0xfffff7facb98
   0x0000fffff7facb64:	f94003e9	ldr	x9, [sp]
   0x0000fffff7facb68:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7facb6c:	f100013f	cmp	x9, #0x0
   0x0000fffff7facb70:	54000321	b.ne	0xfffff7facbd4  // b.any
   0x0000fffff7facb74:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7facb78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facb7c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7facb80:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7facb84:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7facb88:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7facb8c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7facb90:	f100055f	cmp	x10, #0x1
   0x0000fffff7facb94:	54000209	b.ls	0xfffff7facbd4  // b.plast
   0x0000fffff7facb98:	36d8008d	tbz	w13, #27, 0xfffff7facba8
   0x0000fffff7facb9c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7facba0:	91000529	add	x9, x9, #0x1
   0x0000fffff7facba4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7facba8:	36d80091	tbz	w17, #27, 0xfffff7facbb8
   0x0000fffff7facbac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facbb0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7facbb4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7facbb8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7facbbc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7facbc0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7facbc4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7facbc8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7facbcc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7facbd0:	1400000e	b	0xfffff7facc08
   0x0000fffff7facbd4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7facbd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facbdc:	aa1303e1	mov	x1, x19
   0x0000fffff7facbe0:	aa1503e2	mov	x2, x21
   0x0000fffff7facbe4:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7facbe8:	aa1403e4	mov	x4, x20
   0x0000fffff7facbec:	aa1603e5	mov	x5, x22
   0x0000fffff7facbf0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7facbf4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7facbf8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facbfc:	d63f0200	blr	x16
   0x0000fffff7facc00:	f100001f	cmp	x0, #0x0
   0x0000fffff7facc04:	54009940	b.eq	0xfffff7fadf2c  // b.none
   0x0000fffff7facc08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facc0c:	37d806a9	tbnz	w9, #27, 0xfffff7facce0
   0x0000fffff7facc10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facc14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facc18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facc1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7facc20:	540001c1	b.ne	0xfffff7facc58  // b.any
   0x0000fffff7facc24:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7facc28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facc2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facc30:	eb0a013f	cmp	x9, x10
   0x0000fffff7facc34:	54000121	b.ne	0xfffff7facc58  // b.any
   0x0000fffff7facc38:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7facc3c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7facc40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7facc44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facc48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facc4c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7facc50:	b900426a	str	w10, [x19, #64]
   0x0000fffff7facc54:	14000030	b	0xfffff7facd14
   0x0000fffff7facc58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facc5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facc60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facc64:	eb0a013f	cmp	x9, x10
   0x0000fffff7facc68:	54000120	b.eq	0xfffff7facc8c  // b.none
   0x0000fffff7facc6c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facc70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facc74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facc78:	eb0a013f	cmp	x9, x10
   0x0000fffff7facc7c:	54000321	b.ne	0xfffff7facce0  // b.any
   0x0000fffff7facc80:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7facc84:	9e620120	scvtf	d0, x9
   0x0000fffff7facc88:	14000002	b	0xfffff7facc90
   0x0000fffff7facc8c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7facc90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7facc94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7facc98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facc9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7facca0:	54000120	b.eq	0xfffff7faccc4  // b.none
   0x0000fffff7facca4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7facca8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faccac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faccb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faccb4:	54000161	b.ne	0xfffff7facce0  // b.any
   0x0000fffff7faccb8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faccbc:	9e620121	scvtf	d1, x9
   0x0000fffff7faccc0:	14000002	b	0xfffff7faccc8
   0x0000fffff7faccc4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faccc8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7facccc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faccd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faccd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faccd8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faccdc:	17ffffde	b	0xfffff7facc54
   0x0000fffff7facce0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facce4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facce8:	aa1303e1	mov	x1, x19
   0x0000fffff7faccec:	aa1503e2	mov	x2, x21
   0x0000fffff7faccf0:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7faccf4:	aa1403e4	mov	x4, x20
   0x0000fffff7faccf8:	aa1603e5	mov	x5, x22
   0x0000fffff7faccfc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7facd00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7facd04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facd08:	d63f0200	blr	x16
   0x0000fffff7facd0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7facd10:	54009120	b.eq	0xfffff7fadf34  // b.none
   0x0000fffff7facd14:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7facd18:	f100017f	cmp	x11, #0x0
   0x0000fffff7facd1c:	540004a0	b.eq	0xfffff7facdb0  // b.none
   0x0000fffff7facd20:	b940016d	ldr	w13, [x11]
   0x0000fffff7facd24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7facd28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7facd2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7facd30:	54000400	b.eq	0xfffff7facdb0  // b.none
   0x0000fffff7facd34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7facd38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7facd3c:	36d801d1	tbz	w17, #27, 0xfffff7facd74
   0x0000fffff7facd40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7facd44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7facd48:	f100013f	cmp	x9, #0x0
   0x0000fffff7facd4c:	54000321	b.ne	0xfffff7facdb0  // b.any
   0x0000fffff7facd50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7facd54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facd58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7facd5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7facd60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7facd64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7facd68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7facd6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7facd70:	54000209	b.ls	0xfffff7facdb0  // b.plast
   0x0000fffff7facd74:	36d8008d	tbz	w13, #27, 0xfffff7facd84
   0x0000fffff7facd78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7facd7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7facd80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7facd84:	36d80091	tbz	w17, #27, 0xfffff7facd94
   0x0000fffff7facd88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facd8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7facd90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7facd94:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7facd98:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7facd9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7facda0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7facda4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7facda8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7facdac:	1400000e	b	0xfffff7facde4
   0x0000fffff7facdb0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7facdb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facdb8:	aa1303e1	mov	x1, x19
   0x0000fffff7facdbc:	aa1503e2	mov	x2, x21
   0x0000fffff7facdc0:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7facdc4:	aa1403e4	mov	x4, x20
   0x0000fffff7facdc8:	aa1603e5	mov	x5, x22
   0x0000fffff7facdcc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7facdd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7facdd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facdd8:	d63f0200	blr	x16
   0x0000fffff7facddc:	f100001f	cmp	x0, #0x0
   0x0000fffff7facde0:	54008ae0	b.eq	0xfffff7fadf3c  // b.none
   0x0000fffff7facde4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facde8:	37d806a9	tbnz	w9, #27, 0xfffff7facebc
   0x0000fffff7facdec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facdf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facdf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facdf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7facdfc:	540001c1	b.ne	0xfffff7face34  // b.any
   0x0000fffff7face00:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7face04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7face08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7face0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7face10:	54000121	b.ne	0xfffff7face34  // b.any
   0x0000fffff7face14:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7face18:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7face1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7face20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7face24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7face28:	f9002669	str	x9, [x19, #72]
   0x0000fffff7face2c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7face30:	14000030	b	0xfffff7facef0
   0x0000fffff7face34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7face38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7face3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7face40:	eb0a013f	cmp	x9, x10
   0x0000fffff7face44:	54000120	b.eq	0xfffff7face68  // b.none
   0x0000fffff7face48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7face4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7face50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7face54:	eb0a013f	cmp	x9, x10
   0x0000fffff7face58:	54000321	b.ne	0xfffff7facebc  // b.any
   0x0000fffff7face5c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7face60:	9e620120	scvtf	d0, x9
   0x0000fffff7face64:	14000002	b	0xfffff7face6c
   0x0000fffff7face68:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7face6c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7face70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7face74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7face78:	eb0a013f	cmp	x9, x10
   0x0000fffff7face7c:	54000120	b.eq	0xfffff7facea0  // b.none
   0x0000fffff7face80:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7face84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7face88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7face8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7face90:	54000161	b.ne	0xfffff7facebc  // b.any
   0x0000fffff7face94:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7face98:	9e620121	scvtf	d1, x9
   0x0000fffff7face9c:	14000002	b	0xfffff7facea4
   0x0000fffff7facea0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7facea4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7facea8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faceac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faceb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faceb4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faceb8:	17ffffde	b	0xfffff7face30
   0x0000fffff7facebc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7facec0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facec4:	aa1303e1	mov	x1, x19
   0x0000fffff7facec8:	aa1503e2	mov	x2, x21
   0x0000fffff7facecc:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7faced0:	aa1403e4	mov	x4, x20
   0x0000fffff7faced4:	aa1603e5	mov	x5, x22
   0x0000fffff7faced8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7facedc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7facee0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facee4:	d63f0200	blr	x16
   0x0000fffff7facee8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faceec:	540082c0	b.eq	0xfffff7fadf44  // b.none
   0x0000fffff7facef0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7facef4:	f100017f	cmp	x11, #0x0
   0x0000fffff7facef8:	540004a0	b.eq	0xfffff7facf8c  // b.none
   0x0000fffff7facefc:	b940016d	ldr	w13, [x11]
   0x0000fffff7facf00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7facf04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7facf08:	eb0901bf	cmp	x13, x9
   0x0000fffff7facf0c:	54000400	b.eq	0xfffff7facf8c  // b.none
   0x0000fffff7facf10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7facf14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7facf18:	36d801d1	tbz	w17, #27, 0xfffff7facf50
   0x0000fffff7facf1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7facf20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7facf24:	f100013f	cmp	x9, #0x0
   0x0000fffff7facf28:	54000321	b.ne	0xfffff7facf8c  // b.any
   0x0000fffff7facf2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7facf30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facf34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7facf38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7facf3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7facf40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7facf44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7facf48:	f100055f	cmp	x10, #0x1
   0x0000fffff7facf4c:	54000209	b.ls	0xfffff7facf8c  // b.plast
   0x0000fffff7facf50:	36d8008d	tbz	w13, #27, 0xfffff7facf60
   0x0000fffff7facf54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7facf58:	91000529	add	x9, x9, #0x1
   0x0000fffff7facf5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7facf60:	36d80091	tbz	w17, #27, 0xfffff7facf70
   0x0000fffff7facf64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7facf68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7facf6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7facf70:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7facf74:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7facf78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7facf7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7facf80:	f900366c	str	x12, [x19, #104]
   0x0000fffff7facf84:	b900626d	str	w13, [x19, #96]
   0x0000fffff7facf88:	1400000e	b	0xfffff7facfc0
   0x0000fffff7facf8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7facf90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7facf94:	aa1303e1	mov	x1, x19
   0x0000fffff7facf98:	aa1503e2	mov	x2, x21
   0x0000fffff7facf9c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7facfa0:	aa1403e4	mov	x4, x20
   0x0000fffff7facfa4:	aa1603e5	mov	x5, x22
   0x0000fffff7facfa8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7facfac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7facfb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7facfb4:	d63f0200	blr	x16
   0x0000fffff7facfb8:	f100001f	cmp	x0, #0x0
   0x0000fffff7facfbc:	54007c80	b.eq	0xfffff7fadf4c  // b.none
   0x0000fffff7facfc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facfc4:	37d806a9	tbnz	w9, #27, 0xfffff7fad098
   0x0000fffff7facfc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7facfcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facfd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facfd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7facfd8:	540001c1	b.ne	0xfffff7fad010  // b.any
   0x0000fffff7facfdc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7facfe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7facfe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7facfe8:	eb0a013f	cmp	x9, x10
   0x0000fffff7facfec:	54000121	b.ne	0xfffff7fad010  // b.any
   0x0000fffff7facff0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7facff4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7facff8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7facffc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad004:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fad008:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad00c:	14000030	b	0xfffff7fad0cc
   0x0000fffff7fad010:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad014:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad018:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad01c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad020:	54000120	b.eq	0xfffff7fad044  // b.none
   0x0000fffff7fad024:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad028:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad02c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad030:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad034:	54000321	b.ne	0xfffff7fad098  // b.any
   0x0000fffff7fad038:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad03c:	9e620120	scvtf	d0, x9
   0x0000fffff7fad040:	14000002	b	0xfffff7fad048
   0x0000fffff7fad044:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fad048:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad04c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad050:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad054:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad058:	54000120	b.eq	0xfffff7fad07c  // b.none
   0x0000fffff7fad05c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad060:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad068:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad06c:	54000161	b.ne	0xfffff7fad098  // b.any
   0x0000fffff7fad070:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fad074:	9e620121	scvtf	d1, x9
   0x0000fffff7fad078:	14000002	b	0xfffff7fad080
   0x0000fffff7fad07c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fad080:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad084:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fad088:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad08c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad090:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad094:	17ffffde	b	0xfffff7fad00c
   0x0000fffff7fad098:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad09c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad0a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fad0a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fad0a8:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fad0ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fad0b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fad0b4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad0b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad0bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad0c0:	d63f0200	blr	x16
   0x0000fffff7fad0c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad0c8:	54007460	b.eq	0xfffff7fadf54  // b.none
   0x0000fffff7fad0cc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad0d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad0d4:	540004a0	b.eq	0xfffff7fad168  // b.none
   0x0000fffff7fad0d8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad0dc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad0e0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad0e4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad0e8:	54000400	b.eq	0xfffff7fad168  // b.none
   0x0000fffff7fad0ec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad0f0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad0f4:	36d801d1	tbz	w17, #27, 0xfffff7fad12c
   0x0000fffff7fad0f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad0fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad100:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad104:	54000321	b.ne	0xfffff7fad168  // b.any
   0x0000fffff7fad108:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad10c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad110:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad114:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad118:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad11c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad120:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad124:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad128:	54000209	b.ls	0xfffff7fad168  // b.plast
   0x0000fffff7fad12c:	36d8008d	tbz	w13, #27, 0xfffff7fad13c
   0x0000fffff7fad130:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad134:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad138:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad13c:	36d80091	tbz	w17, #27, 0xfffff7fad14c
   0x0000fffff7fad140:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad144:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad148:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad14c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fad150:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fad154:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad158:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad15c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fad160:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fad164:	1400000e	b	0xfffff7fad19c
   0x0000fffff7fad168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad16c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad170:	aa1303e1	mov	x1, x19
   0x0000fffff7fad174:	aa1503e2	mov	x2, x21
   0x0000fffff7fad178:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fad17c:	aa1403e4	mov	x4, x20
   0x0000fffff7fad180:	aa1603e5	mov	x5, x22
   0x0000fffff7fad184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fad188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad18c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad190:	d63f0200	blr	x16
   0x0000fffff7fad194:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad198:	54006e20	b.eq	0xfffff7fadf5c  // b.none
   0x0000fffff7fad19c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad1a0:	37d806a9	tbnz	w9, #27, 0xfffff7fad274
   0x0000fffff7fad1a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad1a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad1ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad1b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad1b4:	540001c1	b.ne	0xfffff7fad1ec  // b.any
   0x0000fffff7fad1b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad1bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad1c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad1c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad1c8:	54000121	b.ne	0xfffff7fad1ec  // b.any
   0x0000fffff7fad1cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad1d0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fad1d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad1d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad1dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad1e0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fad1e4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad1e8:	14000030	b	0xfffff7fad2a8
   0x0000fffff7fad1ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad1f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad1f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad1f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad1fc:	54000120	b.eq	0xfffff7fad220  // b.none
   0x0000fffff7fad200:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad210:	54000321	b.ne	0xfffff7fad274  // b.any
   0x0000fffff7fad214:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad218:	9e620120	scvtf	d0, x9
   0x0000fffff7fad21c:	14000002	b	0xfffff7fad224
   0x0000fffff7fad220:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fad224:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad22c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad230:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad234:	54000120	b.eq	0xfffff7fad258  // b.none
   0x0000fffff7fad238:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad23c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad244:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad248:	54000161	b.ne	0xfffff7fad274  // b.any
   0x0000fffff7fad24c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fad250:	9e620121	scvtf	d1, x9
   0x0000fffff7fad254:	14000002	b	0xfffff7fad25c
   0x0000fffff7fad258:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fad25c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad260:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fad264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad26c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad270:	17ffffde	b	0xfffff7fad1e8
   0x0000fffff7fad274:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad27c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad280:	aa1503e2	mov	x2, x21
   0x0000fffff7fad284:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fad288:	aa1403e4	mov	x4, x20
   0x0000fffff7fad28c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad290:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad294:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad29c:	d63f0200	blr	x16
   0x0000fffff7fad2a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad2a4:	54006600	b.eq	0xfffff7fadf64  // b.none
   0x0000fffff7fad2a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad2ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad2b0:	540004a0	b.eq	0xfffff7fad344  // b.none
   0x0000fffff7fad2b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad2b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad2bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad2c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad2c4:	54000400	b.eq	0xfffff7fad344  // b.none
   0x0000fffff7fad2c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad2cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad2d0:	36d801d1	tbz	w17, #27, 0xfffff7fad308
   0x0000fffff7fad2d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad2d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad2dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad2e0:	54000321	b.ne	0xfffff7fad344  // b.any
   0x0000fffff7fad2e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad2e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad2ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad2f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad2f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad2f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad2fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad300:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad304:	54000209	b.ls	0xfffff7fad344  // b.plast
   0x0000fffff7fad308:	36d8008d	tbz	w13, #27, 0xfffff7fad318
   0x0000fffff7fad30c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad310:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad314:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad318:	36d80091	tbz	w17, #27, 0xfffff7fad328
   0x0000fffff7fad31c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad320:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad324:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad328:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fad32c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fad330:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad334:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad338:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fad33c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fad340:	1400000e	b	0xfffff7fad378
   0x0000fffff7fad344:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad348:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad34c:	aa1303e1	mov	x1, x19
   0x0000fffff7fad350:	aa1503e2	mov	x2, x21
   0x0000fffff7fad354:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fad358:	aa1403e4	mov	x4, x20
   0x0000fffff7fad35c:	aa1603e5	mov	x5, x22
   0x0000fffff7fad360:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fad364:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad368:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad36c:	d63f0200	blr	x16
   0x0000fffff7fad370:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad374:	54005fc0	b.eq	0xfffff7fadf6c  // b.none
   0x0000fffff7fad378:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad37c:	37d806a9	tbnz	w9, #27, 0xfffff7fad450
   0x0000fffff7fad380:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad384:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad388:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad38c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad390:	540001c1	b.ne	0xfffff7fad3c8  // b.any
   0x0000fffff7fad394:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad398:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad39c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad3a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad3a4:	54000121	b.ne	0xfffff7fad3c8  // b.any
   0x0000fffff7fad3a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad3ac:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fad3b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad3b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad3b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad3bc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fad3c0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad3c4:	14000030	b	0xfffff7fad484
   0x0000fffff7fad3c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad3cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad3d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad3d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad3d8:	54000120	b.eq	0xfffff7fad3fc  // b.none
   0x0000fffff7fad3dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad3e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad3e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad3e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad3ec:	54000321	b.ne	0xfffff7fad450  // b.any
   0x0000fffff7fad3f0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad3f4:	9e620120	scvtf	d0, x9
   0x0000fffff7fad3f8:	14000002	b	0xfffff7fad400
   0x0000fffff7fad3fc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fad400:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad404:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad408:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad40c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad410:	54000120	b.eq	0xfffff7fad434  // b.none
   0x0000fffff7fad414:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad418:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad41c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad420:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad424:	54000161	b.ne	0xfffff7fad450  // b.any
   0x0000fffff7fad428:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fad42c:	9e620121	scvtf	d1, x9
   0x0000fffff7fad430:	14000002	b	0xfffff7fad438
   0x0000fffff7fad434:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fad438:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad43c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fad440:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad444:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad448:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad44c:	17ffffde	b	0xfffff7fad3c4
   0x0000fffff7fad450:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad454:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad458:	aa1303e1	mov	x1, x19
   0x0000fffff7fad45c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad460:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fad464:	aa1403e4	mov	x4, x20
   0x0000fffff7fad468:	aa1603e5	mov	x5, x22
   0x0000fffff7fad46c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad470:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad474:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad478:	d63f0200	blr	x16
   0x0000fffff7fad47c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad480:	540057a0	b.eq	0xfffff7fadf74  // b.none
   0x0000fffff7fad484:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad488:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad48c:	540004a0	b.eq	0xfffff7fad520  // b.none
   0x0000fffff7fad490:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad494:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad498:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad49c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad4a0:	54000400	b.eq	0xfffff7fad520  // b.none
   0x0000fffff7fad4a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad4a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad4ac:	36d801d1	tbz	w17, #27, 0xfffff7fad4e4
   0x0000fffff7fad4b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad4b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad4b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad4bc:	54000321	b.ne	0xfffff7fad520  // b.any
   0x0000fffff7fad4c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad4c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad4c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad4cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad4d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad4d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad4d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad4dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad4e0:	54000209	b.ls	0xfffff7fad520  // b.plast
   0x0000fffff7fad4e4:	36d8008d	tbz	w13, #27, 0xfffff7fad4f4
   0x0000fffff7fad4e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad4ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad4f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad4f4:	36d80091	tbz	w17, #27, 0xfffff7fad504
   0x0000fffff7fad4f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad4fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad500:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad504:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fad508:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fad50c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad510:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad514:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fad518:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fad51c:	1400000e	b	0xfffff7fad554
   0x0000fffff7fad520:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad524:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad528:	aa1303e1	mov	x1, x19
   0x0000fffff7fad52c:	aa1503e2	mov	x2, x21
   0x0000fffff7fad530:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fad534:	aa1403e4	mov	x4, x20
   0x0000fffff7fad538:	aa1603e5	mov	x5, x22
   0x0000fffff7fad53c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fad540:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad544:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad548:	d63f0200	blr	x16
   0x0000fffff7fad54c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad550:	54005160	b.eq	0xfffff7fadf7c  // b.none
   0x0000fffff7fad554:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad558:	37d806a9	tbnz	w9, #27, 0xfffff7fad62c
   0x0000fffff7fad55c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad560:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad564:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad568:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad56c:	540001c1	b.ne	0xfffff7fad5a4  // b.any
   0x0000fffff7fad570:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad574:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad578:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad57c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad580:	54000121	b.ne	0xfffff7fad5a4  // b.any
   0x0000fffff7fad584:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad588:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fad58c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad590:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad594:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad598:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fad59c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad5a0:	14000030	b	0xfffff7fad660
   0x0000fffff7fad5a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad5a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad5ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad5b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad5b4:	54000120	b.eq	0xfffff7fad5d8  // b.none
   0x0000fffff7fad5b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad5bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad5c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad5c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad5c8:	54000321	b.ne	0xfffff7fad62c  // b.any
   0x0000fffff7fad5cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad5d0:	9e620120	scvtf	d0, x9
   0x0000fffff7fad5d4:	14000002	b	0xfffff7fad5dc
   0x0000fffff7fad5d8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fad5dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad5e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad5e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad5e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad5ec:	54000120	b.eq	0xfffff7fad610  // b.none
   0x0000fffff7fad5f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad5f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad5f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad5fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad600:	54000161	b.ne	0xfffff7fad62c  // b.any
   0x0000fffff7fad604:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fad608:	9e620121	scvtf	d1, x9
   0x0000fffff7fad60c:	14000002	b	0xfffff7fad614
   0x0000fffff7fad610:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fad614:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad618:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fad61c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad624:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad628:	17ffffde	b	0xfffff7fad5a0
   0x0000fffff7fad62c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad630:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad634:	aa1303e1	mov	x1, x19
   0x0000fffff7fad638:	aa1503e2	mov	x2, x21
   0x0000fffff7fad63c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fad640:	aa1403e4	mov	x4, x20
   0x0000fffff7fad644:	aa1603e5	mov	x5, x22
   0x0000fffff7fad648:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad64c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad650:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad654:	d63f0200	blr	x16
   0x0000fffff7fad658:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad65c:	54004940	b.eq	0xfffff7fadf84  // b.none
   0x0000fffff7fad660:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad664:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad668:	540004a0	b.eq	0xfffff7fad6fc  // b.none
   0x0000fffff7fad66c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad670:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad674:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad678:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad67c:	54000400	b.eq	0xfffff7fad6fc  // b.none
   0x0000fffff7fad680:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad684:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad688:	36d801d1	tbz	w17, #27, 0xfffff7fad6c0
   0x0000fffff7fad68c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad690:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad694:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad698:	54000321	b.ne	0xfffff7fad6fc  // b.any
   0x0000fffff7fad69c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad6a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad6a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad6a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad6ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad6b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad6b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad6b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad6bc:	54000209	b.ls	0xfffff7fad6fc  // b.plast
   0x0000fffff7fad6c0:	36d8008d	tbz	w13, #27, 0xfffff7fad6d0
   0x0000fffff7fad6c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad6c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad6cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad6d0:	36d80091	tbz	w17, #27, 0xfffff7fad6e0
   0x0000fffff7fad6d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad6d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad6dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad6e0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fad6e4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fad6e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad6ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad6f0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fad6f4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fad6f8:	1400000e	b	0xfffff7fad730
   0x0000fffff7fad6fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad700:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad704:	aa1303e1	mov	x1, x19
   0x0000fffff7fad708:	aa1503e2	mov	x2, x21
   0x0000fffff7fad70c:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fad710:	aa1403e4	mov	x4, x20
   0x0000fffff7fad714:	aa1603e5	mov	x5, x22
   0x0000fffff7fad718:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fad71c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad720:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad724:	d63f0200	blr	x16
   0x0000fffff7fad728:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad72c:	54004300	b.eq	0xfffff7fadf8c  // b.none
   0x0000fffff7fad730:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad734:	37d806a9	tbnz	w9, #27, 0xfffff7fad808
   0x0000fffff7fad738:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad73c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad740:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad744:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad748:	540001c1	b.ne	0xfffff7fad780  // b.any
   0x0000fffff7fad74c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad750:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad754:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad758:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad75c:	54000121	b.ne	0xfffff7fad780  // b.any
   0x0000fffff7fad760:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad764:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fad768:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad76c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad770:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad774:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fad778:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad77c:	14000030	b	0xfffff7fad83c
   0x0000fffff7fad780:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad784:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad788:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad78c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad790:	54000120	b.eq	0xfffff7fad7b4  // b.none
   0x0000fffff7fad794:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad798:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad79c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad7a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad7a4:	54000321	b.ne	0xfffff7fad808  // b.any
   0x0000fffff7fad7a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad7ac:	9e620120	scvtf	d0, x9
   0x0000fffff7fad7b0:	14000002	b	0xfffff7fad7b8
   0x0000fffff7fad7b4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fad7b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad7bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad7c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad7c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad7c8:	54000120	b.eq	0xfffff7fad7ec  // b.none
   0x0000fffff7fad7cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad7d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad7d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad7d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad7dc:	54000161	b.ne	0xfffff7fad808  // b.any
   0x0000fffff7fad7e0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fad7e4:	9e620121	scvtf	d1, x9
   0x0000fffff7fad7e8:	14000002	b	0xfffff7fad7f0
   0x0000fffff7fad7ec:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fad7f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad7f4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fad7f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad7fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad800:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad804:	17ffffde	b	0xfffff7fad77c
   0x0000fffff7fad808:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad80c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad810:	aa1303e1	mov	x1, x19
   0x0000fffff7fad814:	aa1503e2	mov	x2, x21
   0x0000fffff7fad818:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fad81c:	aa1403e4	mov	x4, x20
   0x0000fffff7fad820:	aa1603e5	mov	x5, x22
   0x0000fffff7fad824:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fad828:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fad82c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad830:	d63f0200	blr	x16
   0x0000fffff7fad834:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad838:	54003ae0	b.eq	0xfffff7fadf94  // b.none
   0x0000fffff7fad83c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fad840:	f100017f	cmp	x11, #0x0
   0x0000fffff7fad844:	540004a0	b.eq	0xfffff7fad8d8  // b.none
   0x0000fffff7fad848:	b940016d	ldr	w13, [x11]
   0x0000fffff7fad84c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fad850:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fad854:	eb0901bf	cmp	x13, x9
   0x0000fffff7fad858:	54000400	b.eq	0xfffff7fad8d8  // b.none
   0x0000fffff7fad85c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fad860:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fad864:	36d801d1	tbz	w17, #27, 0xfffff7fad89c
   0x0000fffff7fad868:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fad86c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fad870:	f100013f	cmp	x9, #0x0
   0x0000fffff7fad874:	54000321	b.ne	0xfffff7fad8d8  // b.any
   0x0000fffff7fad878:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fad87c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad880:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fad884:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fad888:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fad88c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fad890:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fad894:	f100055f	cmp	x10, #0x1
   0x0000fffff7fad898:	54000209	b.ls	0xfffff7fad8d8  // b.plast
   0x0000fffff7fad89c:	36d8008d	tbz	w13, #27, 0xfffff7fad8ac
   0x0000fffff7fad8a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fad8a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fad8a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fad8ac:	36d80091	tbz	w17, #27, 0xfffff7fad8bc
   0x0000fffff7fad8b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fad8b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fad8b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fad8bc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fad8c0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fad8c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fad8c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fad8cc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fad8d0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fad8d4:	1400000e	b	0xfffff7fad90c
   0x0000fffff7fad8d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fad8dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad8e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fad8e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fad8e8:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fad8ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fad8f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fad8f4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fad8f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fad8fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fad900:	d63f0200	blr	x16
   0x0000fffff7fad904:	f100001f	cmp	x0, #0x0
   0x0000fffff7fad908:	540034a0	b.eq	0xfffff7fadf9c  // b.none
   0x0000fffff7fad90c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad910:	37d806a9	tbnz	w9, #27, 0xfffff7fad9e4
   0x0000fffff7fad914:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad918:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad91c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad920:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad924:	540001c1	b.ne	0xfffff7fad95c  // b.any
   0x0000fffff7fad928:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad92c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad934:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad938:	54000121	b.ne	0xfffff7fad95c  // b.any
   0x0000fffff7fad93c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad940:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fad944:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fad948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad94c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad950:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fad954:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad958:	14000030	b	0xfffff7fada18
   0x0000fffff7fad95c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad960:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad968:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad96c:	54000120	b.eq	0xfffff7fad990  // b.none
   0x0000fffff7fad970:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fad974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad97c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad980:	54000321	b.ne	0xfffff7fad9e4  // b.any
   0x0000fffff7fad984:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fad988:	9e620120	scvtf	d0, x9
   0x0000fffff7fad98c:	14000002	b	0xfffff7fad994
   0x0000fffff7fad990:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fad994:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad998:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad99c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad9a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad9a4:	54000120	b.eq	0xfffff7fad9c8  // b.none
   0x0000fffff7fad9a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fad9ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fad9b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad9b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fad9b8:	54000161	b.ne	0xfffff7fad9e4  // b.any
   0x0000fffff7fad9bc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fad9c0:	9e620121	scvtf	d1, x9
   0x0000fffff7fad9c4:	14000002	b	0xfffff7fad9cc
   0x0000fffff7fad9c8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fad9cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fad9d0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fad9d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fad9d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fad9dc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fad9e0:	17ffffde	b	0xfffff7fad958
   0x0000fffff7fad9e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fad9e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fad9ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fad9f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fad9f4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fad9f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fad9fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fada00:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fada04:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fada08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fada0c:	d63f0200	blr	x16
   0x0000fffff7fada10:	f100001f	cmp	x0, #0x0
   0x0000fffff7fada14:	54002c80	b.eq	0xfffff7fadfa4  // b.none
   0x0000fffff7fada18:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fada1c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fada20:	540004a0	b.eq	0xfffff7fadab4  // b.none
   0x0000fffff7fada24:	b940016d	ldr	w13, [x11]
   0x0000fffff7fada28:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fada2c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fada30:	eb0901bf	cmp	x13, x9
   0x0000fffff7fada34:	54000400	b.eq	0xfffff7fadab4  // b.none
   0x0000fffff7fada38:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fada3c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fada40:	36d801d1	tbz	w17, #27, 0xfffff7fada78
   0x0000fffff7fada44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fada48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fada4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fada50:	54000321	b.ne	0xfffff7fadab4  // b.any
   0x0000fffff7fada54:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fada58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fada5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fada60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fada64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fada68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fada6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fada70:	f100055f	cmp	x10, #0x1
   0x0000fffff7fada74:	54000209	b.ls	0xfffff7fadab4  // b.plast
   0x0000fffff7fada78:	36d8008d	tbz	w13, #27, 0xfffff7fada88
   0x0000fffff7fada7c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fada80:	91000529	add	x9, x9, #0x1
   0x0000fffff7fada84:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fada88:	36d80091	tbz	w17, #27, 0xfffff7fada98
   0x0000fffff7fada8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fada90:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fada94:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fada98:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fada9c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fadaa0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fadaa4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fadaa8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fadaac:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fadab0:	1400000e	b	0xfffff7fadae8
   0x0000fffff7fadab4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fadab8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadabc:	aa1303e1	mov	x1, x19
   0x0000fffff7fadac0:	aa1503e2	mov	x2, x21
   0x0000fffff7fadac4:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fadac8:	aa1403e4	mov	x4, x20
   0x0000fffff7fadacc:	aa1603e5	mov	x5, x22
   0x0000fffff7fadad0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fadad4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fadad8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadadc:	d63f0200	blr	x16
   0x0000fffff7fadae0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadae4:	54002640	b.eq	0xfffff7fadfac  // b.none
   0x0000fffff7fadae8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fadaec:	37d806a9	tbnz	w9, #27, 0xfffff7fadbc0
   0x0000fffff7fadaf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fadaf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadaf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadafc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb00:	540001c1	b.ne	0xfffff7fadb38  // b.any
   0x0000fffff7fadb04:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fadb08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadb0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb14:	54000121	b.ne	0xfffff7fadb38  // b.any
   0x0000fffff7fadb18:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fadb1c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fadb20:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fadb24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadb28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb2c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fadb30:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fadb34:	14000030	b	0xfffff7fadbf4
   0x0000fffff7fadb38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fadb3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fadb40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb48:	54000120	b.eq	0xfffff7fadb6c  // b.none
   0x0000fffff7fadb4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fadb50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadb54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb5c:	54000321	b.ne	0xfffff7fadbc0  // b.any
   0x0000fffff7fadb60:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fadb64:	9e620120	scvtf	d0, x9
   0x0000fffff7fadb68:	14000002	b	0xfffff7fadb70
   0x0000fffff7fadb6c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fadb70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fadb74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fadb78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb80:	54000120	b.eq	0xfffff7fadba4  // b.none
   0x0000fffff7fadb84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fadb88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadb8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadb90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadb94:	54000161	b.ne	0xfffff7fadbc0  // b.any
   0x0000fffff7fadb98:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fadb9c:	9e620121	scvtf	d1, x9
   0x0000fffff7fadba0:	14000002	b	0xfffff7fadba8
   0x0000fffff7fadba4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fadba8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fadbac:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fadbb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fadbb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadbb8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fadbbc:	17ffffde	b	0xfffff7fadb34
   0x0000fffff7fadbc0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fadbc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadbc8:	aa1303e1	mov	x1, x19
   0x0000fffff7fadbcc:	aa1503e2	mov	x2, x21
   0x0000fffff7fadbd0:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fadbd4:	aa1403e4	mov	x4, x20
   0x0000fffff7fadbd8:	aa1603e5	mov	x5, x22
   0x0000fffff7fadbdc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fadbe0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fadbe4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadbe8:	d63f0200	blr	x16
   0x0000fffff7fadbec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadbf0:	54001e20	b.eq	0xfffff7fadfb4  // b.none
   0x0000fffff7fadbf4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fadbf8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fadbfc:	540004a0	b.eq	0xfffff7fadc90  // b.none
   0x0000fffff7fadc00:	b940016d	ldr	w13, [x11]
   0x0000fffff7fadc04:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fadc08:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fadc0c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fadc10:	54000400	b.eq	0xfffff7fadc90  // b.none
   0x0000fffff7fadc14:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fadc18:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fadc1c:	36d801d1	tbz	w17, #27, 0xfffff7fadc54
   0x0000fffff7fadc20:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fadc24:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fadc28:	f100013f	cmp	x9, #0x0
   0x0000fffff7fadc2c:	54000321	b.ne	0xfffff7fadc90  // b.any
   0x0000fffff7fadc30:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fadc34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadc38:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fadc3c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fadc40:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fadc44:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fadc48:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fadc4c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fadc50:	54000209	b.ls	0xfffff7fadc90  // b.plast
   0x0000fffff7fadc54:	36d8008d	tbz	w13, #27, 0xfffff7fadc64
   0x0000fffff7fadc58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fadc5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fadc60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fadc64:	36d80091	tbz	w17, #27, 0xfffff7fadc74
   0x0000fffff7fadc68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fadc6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fadc70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fadc74:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fadc78:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fadc7c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fadc80:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fadc84:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fadc88:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fadc8c:	1400000e	b	0xfffff7fadcc4
   0x0000fffff7fadc90:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fadc94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadc98:	aa1303e1	mov	x1, x19
   0x0000fffff7fadc9c:	aa1503e2	mov	x2, x21
   0x0000fffff7fadca0:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fadca4:	aa1403e4	mov	x4, x20
   0x0000fffff7fadca8:	aa1603e5	mov	x5, x22
   0x0000fffff7fadcac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fadcb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fadcb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fadcb8:	d63f0200	blr	x16
   0x0000fffff7fadcbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fadcc0:	540017e0	b.eq	0xfffff7fadfbc  // b.none
   0x0000fffff7fadcc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fadcc8:	37d806a9	tbnz	w9, #27, 0xfffff7fadd9c
   0x0000fffff7fadccc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fadcd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadcd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadcd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadcdc:	540001c1	b.ne	0xfffff7fadd14  // b.any
   0x0000fffff7fadce0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fadce4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadce8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadcec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadcf0:	54000121	b.ne	0xfffff7fadd14  // b.any
   0x0000fffff7fadcf4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fadcf8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fadcfc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fadd00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadd04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadd08:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fadd0c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fadd10:	14000030	b	0xfffff7faddd0
   0x0000fffff7fadd14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fadd18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fadd1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadd20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadd24:	54000120	b.eq	0xfffff7fadd48  // b.none
   0x0000fffff7fadd28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fadd2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadd30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadd34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadd38:	54000321	b.ne	0xfffff7fadd9c  // b.any
   0x0000fffff7fadd3c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fadd40:	9e620120	scvtf	d0, x9
   0x0000fffff7fadd44:	14000002	b	0xfffff7fadd4c
   0x0000fffff7fadd48:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fadd4c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fadd50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fadd54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadd58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadd5c:	54000120	b.eq	0xfffff7fadd80  // b.none
   0x0000fffff7fadd60:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fadd64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadd68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadd6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadd70:	54000161	b.ne	0xfffff7fadd9c  // b.any
   0x0000fffff7fadd74:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fadd78:	9e620121	scvtf	d1, x9
   0x0000fffff7fadd7c:	14000002	b	0xfffff7fadd84
   0x0000fffff7fadd80:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fadd84:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fadd88:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fadd8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fadd90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadd94:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fadd98:	17ffffde	b	0xfffff7fadd10
   0x0000fffff7fadd9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fadda0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fadda4:	aa1303e1	mov	x1, x19
   0x0000fffff7fadda8:	aa1503e2	mov	x2, x21
   0x0000fffff7faddac:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7faddb0:	aa1403e4	mov	x4, x20
   0x0000fffff7faddb4:	aa1603e5	mov	x5, x22
   0x0000fffff7faddb8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faddbc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faddc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faddc4:	d63f0200	blr	x16
   0x0000fffff7faddc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faddcc:	54000fc0	b.eq	0xfffff7fadfc4  // b.none
   0x0000fffff7faddd0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faddd4:	37d80269	tbnz	w9, #27, 0xfffff7fade20
   0x0000fffff7faddd8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fadddc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadde0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadde4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fadde8:	540001c1	b.ne	0xfffff7fade20  // b.any
   0x0000fffff7faddec:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7faddf0:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7faddf4:	8b0a012b	add	x11, x9, x10
   0x0000fffff7faddf8:	f9003669	str	x9, [x19, #104]
   0x0000fffff7faddfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fade00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fade04:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fade08:	aa0b03e9	mov	x9, x11
   0x0000fffff7fade0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fade10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fade14:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fade18:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fade1c:	1400000e	b	0xfffff7fade54
   0x0000fffff7fade20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fade24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fade28:	aa1303e1	mov	x1, x19
   0x0000fffff7fade2c:	aa1503e2	mov	x2, x21
   0x0000fffff7fade30:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fade34:	aa1403e4	mov	x4, x20
   0x0000fffff7fade38:	aa1603e5	mov	x5, x22
   0x0000fffff7fade3c:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fade40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fade44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fade48:	d63f0200	blr	x16
   0x0000fffff7fade4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fade50:	54000be0	b.eq	0xfffff7fadfcc  // b.none
   0x0000fffff7fade54:	17fff8d2	b	0xfffff7fac19c
   0x0000fffff7fade58:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fade5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fade60:	aa1303e1	mov	x1, x19
   0x0000fffff7fade64:	aa1503e2	mov	x2, x21
   0x0000fffff7fade68:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fade6c:	aa1403e4	mov	x4, x20
   0x0000fffff7fade70:	aa1603e5	mov	x5, x22
   0x0000fffff7fade74:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fade78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fade7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fade80:	d63f0200	blr	x16
   0x0000fffff7fade84:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fade88:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fade8c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fade90:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fade94:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fade98:	d65f03c0	ret
   0x0000fffff7fade9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fadea0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fadea4:	b900028a	str	w10, [x20]
   0x0000fffff7fadea8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fadeac:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fadeb0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fadeb4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fadeb8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fadebc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fadec0:	d65f03c0	ret
   0x0000fffff7fadec4:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fadec8:	17fffff5	b	0xfffff7fade9c
   0x0000fffff7fadecc:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7faded0:	17fffff3	b	0xfffff7fade9c
   0x0000fffff7faded4:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7faded8:	17fffff1	b	0xfffff7fade9c
   0x0000fffff7fadedc:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fadee0:	17ffffef	b	0xfffff7fade9c
   0x0000fffff7fadee4:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fadee8:	17ffffed	b	0xfffff7fade9c
   0x0000fffff7fadeec:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fadef0:	17ffffeb	b	0xfffff7fade9c
   0x0000fffff7fadef4:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fadef8:	17ffffe9	b	0xfffff7fade9c
   0x0000fffff7fadefc:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fadf00:	17ffffe7	b	0xfffff7fade9c
   0x0000fffff7fadf04:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fadf08:	17ffffe5	b	0xfffff7fade9c
   0x0000fffff7fadf0c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fadf10:	17ffffe3	b	0xfffff7fade9c
   0x0000fffff7fadf14:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fadf18:	17ffffe1	b	0xfffff7fade9c
   0x0000fffff7fadf1c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fadf20:	17ffffdf	b	0xfffff7fade9c
   0x0000fffff7fadf24:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fadf28:	17ffffdd	b	0xfffff7fade9c
   0x0000fffff7fadf2c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fadf30:	17ffffdb	b	0xfffff7fade9c
   0x0000fffff7fadf34:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fadf38:	17ffffd9	b	0xfffff7fade9c
   0x0000fffff7fadf3c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fadf40:	17ffffd7	b	0xfffff7fade9c
   0x0000fffff7fadf44:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fadf48:	17ffffd5	b	0xfffff7fade9c
   0x0000fffff7fadf4c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fadf50:	17ffffd3	b	0xfffff7fade9c
   0x0000fffff7fadf54:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fadf58:	17ffffd1	b	0xfffff7fade9c
   0x0000fffff7fadf5c:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fadf60:	17ffffcf	b	0xfffff7fade9c
   0x0000fffff7fadf64:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fadf68:	17ffffcd	b	0xfffff7fade9c
   0x0000fffff7fadf6c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fadf70:	17ffffcb	b	0xfffff7fade9c
   0x0000fffff7fadf74:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fadf78:	17ffffc9	b	0xfffff7fade9c
   0x0000fffff7fadf7c:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fadf80:	17ffffc7	b	0xfffff7fade9c
   0x0000fffff7fadf84:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fadf88:	17ffffc5	b	0xfffff7fade9c
   0x0000fffff7fadf8c:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fadf90:	17ffffc3	b	0xfffff7fade9c
   0x0000fffff7fadf94:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fadf98:	17ffffc1	b	0xfffff7fade9c
   0x0000fffff7fadf9c:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fadfa0:	17ffffbf	b	0xfffff7fade9c
   0x0000fffff7fadfa4:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fadfa8:	17ffffbd	b	0xfffff7fade9c
   0x0000fffff7fadfac:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fadfb0:	17ffffbb	b	0xfffff7fade9c
   0x0000fffff7fadfb4:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fadfb8:	17ffffb9	b	0xfffff7fade9c
   0x0000fffff7fadfbc:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fadfc0:	17ffffb7	b	0xfffff7fade9c
   0x0000fffff7fadfc4:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fadfc8:	17ffffb5	b	0xfffff7fade9c
   0x0000fffff7fadfcc:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fadfd0:	17ffffb3	b	0xfffff7fade9c
   0x0000fffff7fadfd4:	00000000	udf	#0
   0x0000fffff7fadfd8:	00000000	udf	#0
   0x0000fffff7fadfdc:	00000000	udf	#0
   0x0000fffff7fadfe0:	00000000	udf	#0
   0x0000fffff7fadfe4:	00000000	udf	#0
   0x0000fffff7fadfe8:	00000000	udf	#0
   0x0000fffff7fadfec:	00000000	udf	#0
   0x0000fffff7fadff0:	00000000	udf	#0
   0x0000fffff7fadff4:	00000000	udf	#0
   0x0000fffff7fadff8:	00000000	udf	#0
   0x0000fffff7fadffc:	00000000	udf	#0
End of assembler dump.
