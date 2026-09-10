Dump of assembler code from 0xfffff7fae000 to 0xfffff7fb0000:
   0x0000fffff7fae000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fae004:	910003fd	mov	x29, sp
   0x0000fffff7fae008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fae00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fae010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fae014:	aa0003f3	mov	x19, x0
   0x0000fffff7fae018:	aa0103f4	mov	x20, x1
   0x0000fffff7fae01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fae020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fae024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fae028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fae02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fae030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fae034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fae038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fae03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fae040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae044:	d63f0200	blr	x16
   0x0000fffff7fae048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fae04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fae050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fae054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fae058:	14000001	b	0xfffff7fae05c
   0x0000fffff7fae05c:	14000001	b	0xfffff7fae060
   0x0000fffff7fae060:	14000001	b	0xfffff7fae064
   0x0000fffff7fae064:	14000001	b	0xfffff7fae068
   0x0000fffff7fae068:	14000001	b	0xfffff7fae06c
   0x0000fffff7fae06c:	14000001	b	0xfffff7fae070
   0x0000fffff7fae070:	14000001	b	0xfffff7fae074
   0x0000fffff7fae074:	14000001	b	0xfffff7fae078
   0x0000fffff7fae078:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fae07c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fae080:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fae084:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fae088:	36d80211	tbz	w17, #27, 0xfffff7fae0c8
   0x0000fffff7fae08c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae090:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae094:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae098:	540001e1	b.ne	0xfffff7fae0d4  // b.any
   0x0000fffff7fae09c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fae0a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae0a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae0a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae0ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae0b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae0b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae0b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae0bc:	540000c9	b.ls	0xfffff7fae0d4  // b.plast
   0x0000fffff7fae0c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae0c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae0c8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fae0cc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fae0d0:	1400000e	b	0xfffff7fae108
   0x0000fffff7fae0d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae0d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae0dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fae0e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fae0e4:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fae0e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fae0ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fae0f0:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fae0f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae0f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae0fc:	d63f0200	blr	x16
   0x0000fffff7fae100:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae104:	5400ef60	b.eq	0xfffff7fafef0  // b.none
   0x0000fffff7fae108:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fae10c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fae110:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fae114:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fae118:	36d80211	tbz	w17, #27, 0xfffff7fae158
   0x0000fffff7fae11c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae120:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae124:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae128:	540001e1	b.ne	0xfffff7fae164  // b.any
   0x0000fffff7fae12c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fae130:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae134:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae138:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae13c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae140:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae144:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae148:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae14c:	540000c9	b.ls	0xfffff7fae164  // b.plast
   0x0000fffff7fae150:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae154:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae158:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fae15c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fae160:	1400000e	b	0xfffff7fae198
   0x0000fffff7fae164:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae168:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae16c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae170:	aa1503e2	mov	x2, x21
   0x0000fffff7fae174:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fae178:	aa1403e4	mov	x4, x20
   0x0000fffff7fae17c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae180:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fae184:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae188:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae18c:	d63f0200	blr	x16
   0x0000fffff7fae190:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae194:	5400eb20	b.eq	0xfffff7fafef8  // b.none
   0x0000fffff7fae198:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fae19c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae1a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae1a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae1a8:	54000421	b.ne	0xfffff7fae22c  // b.any
   0x0000fffff7fae1ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fae1b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae1b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae1b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae1bc:	54000381	b.ne	0xfffff7fae22c  // b.any
   0x0000fffff7fae1c0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fae1c4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fae1c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae1cc:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fae1d0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fae1d4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fae1d8:	91000580	add	x0, x12, #0x1
   0x0000fffff7fae1dc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae1e0:	36d80211	tbz	w17, #27, 0xfffff7fae220
   0x0000fffff7fae1e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae1e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae1ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae1f0:	540001e1	b.ne	0xfffff7fae22c  // b.any
   0x0000fffff7fae1f4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae1f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae1fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae200:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae204:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae208:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae20c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae210:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae214:	540000c9	b.ls	0xfffff7fae22c  // b.plast
   0x0000fffff7fae218:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae21c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae220:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fae224:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fae228:	1400000e	b	0xfffff7fae260
   0x0000fffff7fae22c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae230:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae234:	aa1303e1	mov	x1, x19
   0x0000fffff7fae238:	aa1503e2	mov	x2, x21
   0x0000fffff7fae23c:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fae240:	aa1403e4	mov	x4, x20
   0x0000fffff7fae244:	aa1603e5	mov	x5, x22
   0x0000fffff7fae248:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fae24c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae250:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae254:	d63f0200	blr	x16
   0x0000fffff7fae258:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae25c:	5400e520	b.eq	0xfffff7faff00  // b.none
   0x0000fffff7fae260:	f100041f	cmp	x0, #0x1
   0x0000fffff7fae264:	5400e100	b.eq	0xfffff7fafe84  // b.none
   0x0000fffff7fae268:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fae26c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fae270:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fae274:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fae278:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fae27c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fae280:	36d801d1	tbz	w17, #27, 0xfffff7fae2b8
   0x0000fffff7fae284:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae288:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae28c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae290:	54000281	b.ne	0xfffff7fae2e0  // b.any
   0x0000fffff7fae294:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fae298:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae29c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae2a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae2a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae2a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae2ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae2b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae2b4:	54000169	b.ls	0xfffff7fae2e0  // b.plast
   0x0000fffff7fae2b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae2bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae2c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae2c4:	36d80091	tbz	w17, #27, 0xfffff7fae2d4
   0x0000fffff7fae2c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae2cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae2d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae2d4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fae2d8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fae2dc:	1400000e	b	0xfffff7fae314
   0x0000fffff7fae2e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae2e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae2e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fae2ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fae2f0:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fae2f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fae2f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fae2fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fae300:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae304:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae308:	d63f0200	blr	x16
   0x0000fffff7fae30c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae310:	5400dfc0	b.eq	0xfffff7faff08  // b.none
   0x0000fffff7fae314:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fae318:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae31c:	540003a0	b.eq	0xfffff7fae390  // b.none
   0x0000fffff7fae320:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fae324:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fae328:	b9400171	ldr	w17, [x11]
   0x0000fffff7fae32c:	36d801d1	tbz	w17, #27, 0xfffff7fae364
   0x0000fffff7fae330:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae334:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae338:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae33c:	540002a1	b.ne	0xfffff7fae390  // b.any
   0x0000fffff7fae340:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fae344:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae348:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae34c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae350:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae354:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae358:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae35c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae360:	54000189	b.ls	0xfffff7fae390  // b.plast
   0x0000fffff7fae364:	36d8008d	tbz	w13, #27, 0xfffff7fae374
   0x0000fffff7fae368:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae36c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae370:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae374:	36d80091	tbz	w17, #27, 0xfffff7fae384
   0x0000fffff7fae378:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae37c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae380:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae384:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fae388:	b900016d	str	w13, [x11]
   0x0000fffff7fae38c:	1400000e	b	0xfffff7fae3c4
   0x0000fffff7fae390:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fae394:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae398:	aa1303e1	mov	x1, x19
   0x0000fffff7fae39c:	aa1503e2	mov	x2, x21
   0x0000fffff7fae3a0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fae3a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fae3a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fae3ac:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fae3b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae3b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae3b8:	d63f0200	blr	x16
   0x0000fffff7fae3bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae3c0:	5400da80	b.eq	0xfffff7faff10  // b.none
   0x0000fffff7fae3c4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae3c8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae3cc:	540004a0	b.eq	0xfffff7fae460  // b.none
   0x0000fffff7fae3d0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae3d4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae3d8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae3dc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae3e0:	54000400	b.eq	0xfffff7fae460  // b.none
   0x0000fffff7fae3e4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae3e8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae3ec:	36d801d1	tbz	w17, #27, 0xfffff7fae424
   0x0000fffff7fae3f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae3f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae3f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae3fc:	54000321	b.ne	0xfffff7fae460  // b.any
   0x0000fffff7fae400:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae404:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae408:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae40c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae410:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae414:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae418:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae41c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae420:	54000209	b.ls	0xfffff7fae460  // b.plast
   0x0000fffff7fae424:	36d8008d	tbz	w13, #27, 0xfffff7fae434
   0x0000fffff7fae428:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae42c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae430:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae434:	36d80091	tbz	w17, #27, 0xfffff7fae444
   0x0000fffff7fae438:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae43c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae440:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae444:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fae448:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fae44c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae450:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae454:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fae458:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fae45c:	1400000e	b	0xfffff7fae494
   0x0000fffff7fae460:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae468:	aa1303e1	mov	x1, x19
   0x0000fffff7fae46c:	aa1503e2	mov	x2, x21
   0x0000fffff7fae470:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fae474:	aa1403e4	mov	x4, x20
   0x0000fffff7fae478:	aa1603e5	mov	x5, x22
   0x0000fffff7fae47c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fae480:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae488:	d63f0200	blr	x16
   0x0000fffff7fae48c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae490:	5400d440	b.eq	0xfffff7faff18  // b.none
   0x0000fffff7fae494:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae498:	37d806a9	tbnz	w9, #27, 0xfffff7fae56c
   0x0000fffff7fae49c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae4a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae4a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae4a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae4ac:	540001c1	b.ne	0xfffff7fae4e4  // b.any
   0x0000fffff7fae4b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fae4b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae4b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae4bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae4c0:	54000121	b.ne	0xfffff7fae4e4  // b.any
   0x0000fffff7fae4c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fae4c8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fae4cc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae4d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae4d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae4d8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fae4dc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fae4e0:	14000030	b	0xfffff7fae5a0
   0x0000fffff7fae4e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae4e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae4ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae4f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae4f4:	54000120	b.eq	0xfffff7fae518  // b.none
   0x0000fffff7fae4f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae4fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae500:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae504:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae508:	54000321	b.ne	0xfffff7fae56c  // b.any
   0x0000fffff7fae50c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fae510:	9e620120	scvtf	d0, x9
   0x0000fffff7fae514:	14000002	b	0xfffff7fae51c
   0x0000fffff7fae518:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fae51c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fae520:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae524:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae528:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae52c:	54000120	b.eq	0xfffff7fae550  // b.none
   0x0000fffff7fae530:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fae534:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae538:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae53c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae540:	54000161	b.ne	0xfffff7fae56c  // b.any
   0x0000fffff7fae544:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fae548:	9e620121	scvtf	d1, x9
   0x0000fffff7fae54c:	14000002	b	0xfffff7fae554
   0x0000fffff7fae550:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fae554:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae558:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fae55c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae560:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae564:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fae568:	17ffffde	b	0xfffff7fae4e0
   0x0000fffff7fae56c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae570:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae574:	aa1303e1	mov	x1, x19
   0x0000fffff7fae578:	aa1503e2	mov	x2, x21
   0x0000fffff7fae57c:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fae580:	aa1403e4	mov	x4, x20
   0x0000fffff7fae584:	aa1603e5	mov	x5, x22
   0x0000fffff7fae588:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fae58c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae590:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae594:	d63f0200	blr	x16
   0x0000fffff7fae598:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae59c:	5400cc20	b.eq	0xfffff7faff20  // b.none
   0x0000fffff7fae5a0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae5a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae5a8:	540004a0	b.eq	0xfffff7fae63c  // b.none
   0x0000fffff7fae5ac:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae5b0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae5b4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae5b8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae5bc:	54000400	b.eq	0xfffff7fae63c  // b.none
   0x0000fffff7fae5c0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae5c4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae5c8:	36d801d1	tbz	w17, #27, 0xfffff7fae600
   0x0000fffff7fae5cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae5d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae5d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae5d8:	54000321	b.ne	0xfffff7fae63c  // b.any
   0x0000fffff7fae5dc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae5e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae5e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae5e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae5ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae5f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae5f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae5f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae5fc:	54000209	b.ls	0xfffff7fae63c  // b.plast
   0x0000fffff7fae600:	36d8008d	tbz	w13, #27, 0xfffff7fae610
   0x0000fffff7fae604:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae608:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae60c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae610:	36d80091	tbz	w17, #27, 0xfffff7fae620
   0x0000fffff7fae614:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae618:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae61c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae620:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fae624:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fae628:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae62c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae630:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fae634:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fae638:	1400000e	b	0xfffff7fae670
   0x0000fffff7fae63c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae640:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae644:	aa1303e1	mov	x1, x19
   0x0000fffff7fae648:	aa1503e2	mov	x2, x21
   0x0000fffff7fae64c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fae650:	aa1403e4	mov	x4, x20
   0x0000fffff7fae654:	aa1603e5	mov	x5, x22
   0x0000fffff7fae658:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fae65c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae660:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae664:	d63f0200	blr	x16
   0x0000fffff7fae668:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae66c:	5400c5e0	b.eq	0xfffff7faff28  // b.none
   0x0000fffff7fae670:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae674:	37d806a9	tbnz	w9, #27, 0xfffff7fae748
   0x0000fffff7fae678:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae67c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae688:	540001c1	b.ne	0xfffff7fae6c0  // b.any
   0x0000fffff7fae68c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fae690:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae698:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae69c:	54000121	b.ne	0xfffff7fae6c0  // b.any
   0x0000fffff7fae6a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fae6a4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fae6a8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae6ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae6b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae6b4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fae6b8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fae6bc:	14000030	b	0xfffff7fae77c
   0x0000fffff7fae6c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae6c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae6c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae6cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae6d0:	54000120	b.eq	0xfffff7fae6f4  // b.none
   0x0000fffff7fae6d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae6d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae6dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae6e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae6e4:	54000321	b.ne	0xfffff7fae748  // b.any
   0x0000fffff7fae6e8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fae6ec:	9e620120	scvtf	d0, x9
   0x0000fffff7fae6f0:	14000002	b	0xfffff7fae6f8
   0x0000fffff7fae6f4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fae6f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fae6fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae704:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae708:	54000120	b.eq	0xfffff7fae72c  // b.none
   0x0000fffff7fae70c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fae710:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae714:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae718:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae71c:	54000161	b.ne	0xfffff7fae748  // b.any
   0x0000fffff7fae720:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fae724:	9e620121	scvtf	d1, x9
   0x0000fffff7fae728:	14000002	b	0xfffff7fae730
   0x0000fffff7fae72c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fae730:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae734:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fae738:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae73c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae740:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fae744:	17ffffde	b	0xfffff7fae6bc
   0x0000fffff7fae748:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae74c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae750:	aa1303e1	mov	x1, x19
   0x0000fffff7fae754:	aa1503e2	mov	x2, x21
   0x0000fffff7fae758:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fae75c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae760:	aa1603e5	mov	x5, x22
   0x0000fffff7fae764:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fae768:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae76c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae770:	d63f0200	blr	x16
   0x0000fffff7fae774:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae778:	5400bdc0	b.eq	0xfffff7faff30  // b.none
   0x0000fffff7fae77c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae780:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae784:	540004a0	b.eq	0xfffff7fae818  // b.none
   0x0000fffff7fae788:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae78c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae790:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae794:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae798:	54000400	b.eq	0xfffff7fae818  // b.none
   0x0000fffff7fae79c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae7a0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae7a4:	36d801d1	tbz	w17, #27, 0xfffff7fae7dc
   0x0000fffff7fae7a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae7ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae7b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae7b4:	54000321	b.ne	0xfffff7fae818  // b.any
   0x0000fffff7fae7b8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae7bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae7c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae7c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae7c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae7cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae7d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae7d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae7d8:	54000209	b.ls	0xfffff7fae818  // b.plast
   0x0000fffff7fae7dc:	36d8008d	tbz	w13, #27, 0xfffff7fae7ec
   0x0000fffff7fae7e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae7e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae7e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae7ec:	36d80091	tbz	w17, #27, 0xfffff7fae7fc
   0x0000fffff7fae7f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae7f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae7f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae7fc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fae800:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fae804:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae808:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae80c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fae810:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fae814:	1400000e	b	0xfffff7fae84c
   0x0000fffff7fae818:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae81c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae820:	aa1303e1	mov	x1, x19
   0x0000fffff7fae824:	aa1503e2	mov	x2, x21
   0x0000fffff7fae828:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fae82c:	aa1403e4	mov	x4, x20
   0x0000fffff7fae830:	aa1603e5	mov	x5, x22
   0x0000fffff7fae834:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fae838:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fae83c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae840:	d63f0200	blr	x16
   0x0000fffff7fae844:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae848:	5400b780	b.eq	0xfffff7faff38  // b.none
   0x0000fffff7fae84c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae850:	37d806a9	tbnz	w9, #27, 0xfffff7fae924
   0x0000fffff7fae854:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae858:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae85c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae860:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae864:	540001c1	b.ne	0xfffff7fae89c  // b.any
   0x0000fffff7fae868:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fae86c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae874:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae878:	54000121	b.ne	0xfffff7fae89c  // b.any
   0x0000fffff7fae87c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fae880:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fae884:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fae888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae88c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae890:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fae894:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fae898:	14000030	b	0xfffff7fae958
   0x0000fffff7fae89c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae8a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae8a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae8a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae8ac:	54000120	b.eq	0xfffff7fae8d0  // b.none
   0x0000fffff7fae8b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fae8b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae8b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae8bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae8c0:	54000321	b.ne	0xfffff7fae924  // b.any
   0x0000fffff7fae8c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fae8c8:	9e620120	scvtf	d0, x9
   0x0000fffff7fae8cc:	14000002	b	0xfffff7fae8d4
   0x0000fffff7fae8d0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fae8d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fae8d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae8dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae8e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae8e4:	54000120	b.eq	0xfffff7fae908  // b.none
   0x0000fffff7fae8e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fae8ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fae8f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae8f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fae8f8:	54000161	b.ne	0xfffff7fae924  // b.any
   0x0000fffff7fae8fc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fae900:	9e620121	scvtf	d1, x9
   0x0000fffff7fae904:	14000002	b	0xfffff7fae90c
   0x0000fffff7fae908:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fae90c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fae910:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fae914:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fae918:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fae91c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fae920:	17ffffde	b	0xfffff7fae898
   0x0000fffff7fae924:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fae928:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae92c:	aa1303e1	mov	x1, x19
   0x0000fffff7fae930:	aa1503e2	mov	x2, x21
   0x0000fffff7fae934:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fae938:	aa1403e4	mov	x4, x20
   0x0000fffff7fae93c:	aa1603e5	mov	x5, x22
   0x0000fffff7fae940:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fae944:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fae948:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fae94c:	d63f0200	blr	x16
   0x0000fffff7fae950:	f100001f	cmp	x0, #0x0
   0x0000fffff7fae954:	5400af60	b.eq	0xfffff7faff40  // b.none
   0x0000fffff7fae958:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fae95c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fae960:	540004a0	b.eq	0xfffff7fae9f4  // b.none
   0x0000fffff7fae964:	b940016d	ldr	w13, [x11]
   0x0000fffff7fae968:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fae96c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fae970:	eb0901bf	cmp	x13, x9
   0x0000fffff7fae974:	54000400	b.eq	0xfffff7fae9f4  // b.none
   0x0000fffff7fae978:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fae97c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fae980:	36d801d1	tbz	w17, #27, 0xfffff7fae9b8
   0x0000fffff7fae984:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fae988:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fae98c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fae990:	54000321	b.ne	0xfffff7fae9f4  // b.any
   0x0000fffff7fae994:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fae998:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae99c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fae9a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fae9a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fae9a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fae9ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fae9b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fae9b4:	54000209	b.ls	0xfffff7fae9f4  // b.plast
   0x0000fffff7fae9b8:	36d8008d	tbz	w13, #27, 0xfffff7fae9c8
   0x0000fffff7fae9bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fae9c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fae9c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fae9c8:	36d80091	tbz	w17, #27, 0xfffff7fae9d8
   0x0000fffff7fae9cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fae9d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fae9d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fae9d8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fae9dc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fae9e0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fae9e4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fae9e8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fae9ec:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fae9f0:	1400000e	b	0xfffff7faea28
   0x0000fffff7fae9f4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fae9f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fae9fc:	aa1303e1	mov	x1, x19
   0x0000fffff7faea00:	aa1503e2	mov	x2, x21
   0x0000fffff7faea04:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7faea08:	aa1403e4	mov	x4, x20
   0x0000fffff7faea0c:	aa1603e5	mov	x5, x22
   0x0000fffff7faea10:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faea14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faea18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faea1c:	d63f0200	blr	x16
   0x0000fffff7faea20:	f100001f	cmp	x0, #0x0
   0x0000fffff7faea24:	5400a920	b.eq	0xfffff7faff48  // b.none
   0x0000fffff7faea28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faea2c:	37d806a9	tbnz	w9, #27, 0xfffff7faeb00
   0x0000fffff7faea30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faea34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faea38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faea3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faea40:	540001c1	b.ne	0xfffff7faea78  // b.any
   0x0000fffff7faea44:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faea48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faea4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faea50:	eb0a013f	cmp	x9, x10
   0x0000fffff7faea54:	54000121	b.ne	0xfffff7faea78  // b.any
   0x0000fffff7faea58:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faea5c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faea60:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faea64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faea68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faea6c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faea70:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faea74:	14000030	b	0xfffff7faeb34
   0x0000fffff7faea78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faea7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faea80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faea84:	eb0a013f	cmp	x9, x10
   0x0000fffff7faea88:	54000120	b.eq	0xfffff7faeaac  // b.none
   0x0000fffff7faea8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faea90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faea94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faea98:	eb0a013f	cmp	x9, x10
   0x0000fffff7faea9c:	54000321	b.ne	0xfffff7faeb00  // b.any
   0x0000fffff7faeaa0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faeaa4:	9e620120	scvtf	d0, x9
   0x0000fffff7faeaa8:	14000002	b	0xfffff7faeab0
   0x0000fffff7faeaac:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faeab0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faeab4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faeab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeabc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faeac0:	54000120	b.eq	0xfffff7faeae4  // b.none
   0x0000fffff7faeac4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faeac8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeacc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faead0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faead4:	54000161	b.ne	0xfffff7faeb00  // b.any
   0x0000fffff7faead8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faeadc:	9e620121	scvtf	d1, x9
   0x0000fffff7faeae0:	14000002	b	0xfffff7faeae8
   0x0000fffff7faeae4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faeae8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faeaec:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faeaf0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faeaf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeaf8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faeafc:	17ffffde	b	0xfffff7faea74
   0x0000fffff7faeb00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faeb04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faeb08:	aa1303e1	mov	x1, x19
   0x0000fffff7faeb0c:	aa1503e2	mov	x2, x21
   0x0000fffff7faeb10:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7faeb14:	aa1403e4	mov	x4, x20
   0x0000fffff7faeb18:	aa1603e5	mov	x5, x22
   0x0000fffff7faeb1c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faeb20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faeb24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faeb28:	d63f0200	blr	x16
   0x0000fffff7faeb2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faeb30:	5400a100	b.eq	0xfffff7faff50  // b.none
   0x0000fffff7faeb34:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faeb38:	f100017f	cmp	x11, #0x0
   0x0000fffff7faeb3c:	540004a0	b.eq	0xfffff7faebd0  // b.none
   0x0000fffff7faeb40:	b940016d	ldr	w13, [x11]
   0x0000fffff7faeb44:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faeb48:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faeb4c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faeb50:	54000400	b.eq	0xfffff7faebd0  // b.none
   0x0000fffff7faeb54:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faeb58:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faeb5c:	36d801d1	tbz	w17, #27, 0xfffff7faeb94
   0x0000fffff7faeb60:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faeb64:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faeb68:	f100013f	cmp	x9, #0x0
   0x0000fffff7faeb6c:	54000321	b.ne	0xfffff7faebd0  // b.any
   0x0000fffff7faeb70:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faeb74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faeb78:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faeb7c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faeb80:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faeb84:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faeb88:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faeb8c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faeb90:	54000209	b.ls	0xfffff7faebd0  // b.plast
   0x0000fffff7faeb94:	36d8008d	tbz	w13, #27, 0xfffff7faeba4
   0x0000fffff7faeb98:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faeb9c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faeba0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faeba4:	36d80091	tbz	w17, #27, 0xfffff7faebb4
   0x0000fffff7faeba8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faebac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faebb0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faebb4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faebb8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faebbc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faebc0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faebc4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faebc8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faebcc:	1400000e	b	0xfffff7faec04
   0x0000fffff7faebd0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faebd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faebd8:	aa1303e1	mov	x1, x19
   0x0000fffff7faebdc:	aa1503e2	mov	x2, x21
   0x0000fffff7faebe0:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7faebe4:	aa1403e4	mov	x4, x20
   0x0000fffff7faebe8:	aa1603e5	mov	x5, x22
   0x0000fffff7faebec:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faebf0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faebf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faebf8:	d63f0200	blr	x16
   0x0000fffff7faebfc:	f100001f	cmp	x0, #0x0
   0x0000fffff7faec00:	54009ac0	b.eq	0xfffff7faff58  // b.none
   0x0000fffff7faec04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faec08:	37d806a9	tbnz	w9, #27, 0xfffff7faecdc
   0x0000fffff7faec0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faec10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faec14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faec18:	eb0a013f	cmp	x9, x10
   0x0000fffff7faec1c:	540001c1	b.ne	0xfffff7faec54  // b.any
   0x0000fffff7faec20:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faec24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faec28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faec2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faec30:	54000121	b.ne	0xfffff7faec54  // b.any
   0x0000fffff7faec34:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faec38:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faec3c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faec40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faec44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faec48:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faec4c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faec50:	14000030	b	0xfffff7faed10
   0x0000fffff7faec54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faec58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faec5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faec60:	eb0a013f	cmp	x9, x10
   0x0000fffff7faec64:	54000120	b.eq	0xfffff7faec88  // b.none
   0x0000fffff7faec68:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faec6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faec70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faec74:	eb0a013f	cmp	x9, x10
   0x0000fffff7faec78:	54000321	b.ne	0xfffff7faecdc  // b.any
   0x0000fffff7faec7c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faec80:	9e620120	scvtf	d0, x9
   0x0000fffff7faec84:	14000002	b	0xfffff7faec8c
   0x0000fffff7faec88:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faec8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faec90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faec94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faec98:	eb0a013f	cmp	x9, x10
   0x0000fffff7faec9c:	54000120	b.eq	0xfffff7faecc0  // b.none
   0x0000fffff7faeca0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faeca4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeca8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faecac:	eb0a013f	cmp	x9, x10
   0x0000fffff7faecb0:	54000161	b.ne	0xfffff7faecdc  // b.any
   0x0000fffff7faecb4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faecb8:	9e620121	scvtf	d1, x9
   0x0000fffff7faecbc:	14000002	b	0xfffff7faecc4
   0x0000fffff7faecc0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faecc4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faecc8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faeccc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faecd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faecd4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faecd8:	17ffffde	b	0xfffff7faec50
   0x0000fffff7faecdc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faece0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faece4:	aa1303e1	mov	x1, x19
   0x0000fffff7faece8:	aa1503e2	mov	x2, x21
   0x0000fffff7faecec:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7faecf0:	aa1403e4	mov	x4, x20
   0x0000fffff7faecf4:	aa1603e5	mov	x5, x22
   0x0000fffff7faecf8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faecfc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faed00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faed04:	d63f0200	blr	x16
   0x0000fffff7faed08:	f100001f	cmp	x0, #0x0
   0x0000fffff7faed0c:	540092a0	b.eq	0xfffff7faff60  // b.none
   0x0000fffff7faed10:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faed14:	f100017f	cmp	x11, #0x0
   0x0000fffff7faed18:	540004a0	b.eq	0xfffff7faedac  // b.none
   0x0000fffff7faed1c:	b940016d	ldr	w13, [x11]
   0x0000fffff7faed20:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faed24:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faed28:	eb0901bf	cmp	x13, x9
   0x0000fffff7faed2c:	54000400	b.eq	0xfffff7faedac  // b.none
   0x0000fffff7faed30:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faed34:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faed38:	36d801d1	tbz	w17, #27, 0xfffff7faed70
   0x0000fffff7faed3c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faed40:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faed44:	f100013f	cmp	x9, #0x0
   0x0000fffff7faed48:	54000321	b.ne	0xfffff7faedac  // b.any
   0x0000fffff7faed4c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faed50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faed54:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faed58:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faed5c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faed60:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faed64:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faed68:	f100055f	cmp	x10, #0x1
   0x0000fffff7faed6c:	54000209	b.ls	0xfffff7faedac  // b.plast
   0x0000fffff7faed70:	36d8008d	tbz	w13, #27, 0xfffff7faed80
   0x0000fffff7faed74:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faed78:	91000529	add	x9, x9, #0x1
   0x0000fffff7faed7c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faed80:	36d80091	tbz	w17, #27, 0xfffff7faed90
   0x0000fffff7faed84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faed88:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faed8c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faed90:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faed94:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faed98:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faed9c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faeda0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faeda4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faeda8:	1400000e	b	0xfffff7faede0
   0x0000fffff7faedac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faedb0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faedb4:	aa1303e1	mov	x1, x19
   0x0000fffff7faedb8:	aa1503e2	mov	x2, x21
   0x0000fffff7faedbc:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7faedc0:	aa1403e4	mov	x4, x20
   0x0000fffff7faedc4:	aa1603e5	mov	x5, x22
   0x0000fffff7faedc8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faedcc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faedd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faedd4:	d63f0200	blr	x16
   0x0000fffff7faedd8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faeddc:	54008c60	b.eq	0xfffff7faff68  // b.none
   0x0000fffff7faede0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faede4:	37d806a9	tbnz	w9, #27, 0xfffff7faeeb8
   0x0000fffff7faede8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faedec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faedf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faedf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faedf8:	540001c1	b.ne	0xfffff7faee30  // b.any
   0x0000fffff7faedfc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faee00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faee04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faee08:	eb0a013f	cmp	x9, x10
   0x0000fffff7faee0c:	54000121	b.ne	0xfffff7faee30  // b.any
   0x0000fffff7faee10:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faee14:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faee18:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faee1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faee20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faee24:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faee28:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faee2c:	14000030	b	0xfffff7faeeec
   0x0000fffff7faee30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faee34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faee38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faee3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faee40:	54000120	b.eq	0xfffff7faee64  // b.none
   0x0000fffff7faee44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faee48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faee4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faee50:	eb0a013f	cmp	x9, x10
   0x0000fffff7faee54:	54000321	b.ne	0xfffff7faeeb8  // b.any
   0x0000fffff7faee58:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faee5c:	9e620120	scvtf	d0, x9
   0x0000fffff7faee60:	14000002	b	0xfffff7faee68
   0x0000fffff7faee64:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faee68:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faee6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faee70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faee74:	eb0a013f	cmp	x9, x10
   0x0000fffff7faee78:	54000120	b.eq	0xfffff7faee9c  // b.none
   0x0000fffff7faee7c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faee80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faee84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faee88:	eb0a013f	cmp	x9, x10
   0x0000fffff7faee8c:	54000161	b.ne	0xfffff7faeeb8  // b.any
   0x0000fffff7faee90:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faee94:	9e620121	scvtf	d1, x9
   0x0000fffff7faee98:	14000002	b	0xfffff7faeea0
   0x0000fffff7faee9c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faeea0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faeea4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faeea8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faeeac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faeeb0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faeeb4:	17ffffde	b	0xfffff7faee2c
   0x0000fffff7faeeb8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faeebc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faeec0:	aa1303e1	mov	x1, x19
   0x0000fffff7faeec4:	aa1503e2	mov	x2, x21
   0x0000fffff7faeec8:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7faeecc:	aa1403e4	mov	x4, x20
   0x0000fffff7faeed0:	aa1603e5	mov	x5, x22
   0x0000fffff7faeed4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faeed8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faeedc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faeee0:	d63f0200	blr	x16
   0x0000fffff7faeee4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faeee8:	54008440	b.eq	0xfffff7faff70  // b.none
   0x0000fffff7faeeec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faeef0:	f100017f	cmp	x11, #0x0
   0x0000fffff7faeef4:	540004a0	b.eq	0xfffff7faef88  // b.none
   0x0000fffff7faeef8:	b940016d	ldr	w13, [x11]
   0x0000fffff7faeefc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faef00:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faef04:	eb0901bf	cmp	x13, x9
   0x0000fffff7faef08:	54000400	b.eq	0xfffff7faef88  // b.none
   0x0000fffff7faef0c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faef10:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faef14:	36d801d1	tbz	w17, #27, 0xfffff7faef4c
   0x0000fffff7faef18:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faef1c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faef20:	f100013f	cmp	x9, #0x0
   0x0000fffff7faef24:	54000321	b.ne	0xfffff7faef88  // b.any
   0x0000fffff7faef28:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faef2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faef30:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faef34:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faef38:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faef3c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faef40:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faef44:	f100055f	cmp	x10, #0x1
   0x0000fffff7faef48:	54000209	b.ls	0xfffff7faef88  // b.plast
   0x0000fffff7faef4c:	36d8008d	tbz	w13, #27, 0xfffff7faef5c
   0x0000fffff7faef50:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faef54:	91000529	add	x9, x9, #0x1
   0x0000fffff7faef58:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faef5c:	36d80091	tbz	w17, #27, 0xfffff7faef6c
   0x0000fffff7faef60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faef64:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faef68:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faef6c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faef70:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faef74:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faef78:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faef7c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faef80:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faef84:	1400000e	b	0xfffff7faefbc
   0x0000fffff7faef88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faef8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faef90:	aa1303e1	mov	x1, x19
   0x0000fffff7faef94:	aa1503e2	mov	x2, x21
   0x0000fffff7faef98:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7faef9c:	aa1403e4	mov	x4, x20
   0x0000fffff7faefa0:	aa1603e5	mov	x5, x22
   0x0000fffff7faefa4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faefa8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faefac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faefb0:	d63f0200	blr	x16
   0x0000fffff7faefb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faefb8:	54007e00	b.eq	0xfffff7faff78  // b.none
   0x0000fffff7faefbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faefc0:	37d806a9	tbnz	w9, #27, 0xfffff7faf094
   0x0000fffff7faefc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faefc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faefcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faefd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faefd4:	540001c1	b.ne	0xfffff7faf00c  // b.any
   0x0000fffff7faefd8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faefdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faefe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faefe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faefe8:	54000121	b.ne	0xfffff7faf00c  // b.any
   0x0000fffff7faefec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faeff0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faeff4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faeff8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faeffc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf000:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faf004:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf008:	14000030	b	0xfffff7faf0c8
   0x0000fffff7faf00c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf010:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf014:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf018:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf01c:	54000120	b.eq	0xfffff7faf040  // b.none
   0x0000fffff7faf020:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf024:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf028:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf02c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf030:	54000321	b.ne	0xfffff7faf094  // b.any
   0x0000fffff7faf034:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf038:	9e620120	scvtf	d0, x9
   0x0000fffff7faf03c:	14000002	b	0xfffff7faf044
   0x0000fffff7faf040:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faf044:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf048:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf04c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf050:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf054:	54000120	b.eq	0xfffff7faf078  // b.none
   0x0000fffff7faf058:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf05c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf060:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf064:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf068:	54000161	b.ne	0xfffff7faf094  // b.any
   0x0000fffff7faf06c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faf070:	9e620121	scvtf	d1, x9
   0x0000fffff7faf074:	14000002	b	0xfffff7faf07c
   0x0000fffff7faf078:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faf07c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf080:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faf084:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf088:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf08c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf090:	17ffffde	b	0xfffff7faf008
   0x0000fffff7faf094:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf098:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf09c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf0a0:	aa1503e2	mov	x2, x21
   0x0000fffff7faf0a4:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7faf0a8:	aa1403e4	mov	x4, x20
   0x0000fffff7faf0ac:	aa1603e5	mov	x5, x22
   0x0000fffff7faf0b0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faf0b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf0b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf0bc:	d63f0200	blr	x16
   0x0000fffff7faf0c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf0c4:	540075e0	b.eq	0xfffff7faff80  // b.none
   0x0000fffff7faf0c8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf0cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf0d0:	540004a0	b.eq	0xfffff7faf164  // b.none
   0x0000fffff7faf0d4:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf0d8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf0dc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf0e0:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf0e4:	54000400	b.eq	0xfffff7faf164  // b.none
   0x0000fffff7faf0e8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf0ec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf0f0:	36d801d1	tbz	w17, #27, 0xfffff7faf128
   0x0000fffff7faf0f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf0f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf0fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf100:	54000321	b.ne	0xfffff7faf164  // b.any
   0x0000fffff7faf104:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf108:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf10c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf110:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf114:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf118:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf11c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf120:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf124:	54000209	b.ls	0xfffff7faf164  // b.plast
   0x0000fffff7faf128:	36d8008d	tbz	w13, #27, 0xfffff7faf138
   0x0000fffff7faf12c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf130:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf134:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf138:	36d80091	tbz	w17, #27, 0xfffff7faf148
   0x0000fffff7faf13c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf140:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf144:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf148:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faf14c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faf150:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf154:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf158:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faf15c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faf160:	1400000e	b	0xfffff7faf198
   0x0000fffff7faf164:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf168:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf16c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf170:	aa1503e2	mov	x2, x21
   0x0000fffff7faf174:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7faf178:	aa1403e4	mov	x4, x20
   0x0000fffff7faf17c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf180:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faf184:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf188:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf18c:	d63f0200	blr	x16
   0x0000fffff7faf190:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf194:	54006fa0	b.eq	0xfffff7faff88  // b.none
   0x0000fffff7faf198:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf19c:	37d806a9	tbnz	w9, #27, 0xfffff7faf270
   0x0000fffff7faf1a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf1a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf1a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf1ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf1b0:	540001c1	b.ne	0xfffff7faf1e8  // b.any
   0x0000fffff7faf1b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf1b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf1bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf1c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf1c4:	54000121	b.ne	0xfffff7faf1e8  // b.any
   0x0000fffff7faf1c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf1cc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faf1d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf1d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf1d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf1dc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faf1e0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf1e4:	14000030	b	0xfffff7faf2a4
   0x0000fffff7faf1e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf1ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf1f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf1f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf1f8:	54000120	b.eq	0xfffff7faf21c  // b.none
   0x0000fffff7faf1fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf200:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf204:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf208:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf20c:	54000321	b.ne	0xfffff7faf270  // b.any
   0x0000fffff7faf210:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf214:	9e620120	scvtf	d0, x9
   0x0000fffff7faf218:	14000002	b	0xfffff7faf220
   0x0000fffff7faf21c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faf220:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf224:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf228:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf22c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf230:	54000120	b.eq	0xfffff7faf254  // b.none
   0x0000fffff7faf234:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf238:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf23c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf240:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf244:	54000161	b.ne	0xfffff7faf270  // b.any
   0x0000fffff7faf248:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faf24c:	9e620121	scvtf	d1, x9
   0x0000fffff7faf250:	14000002	b	0xfffff7faf258
   0x0000fffff7faf254:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faf258:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf25c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faf260:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf264:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf268:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf26c:	17ffffde	b	0xfffff7faf1e4
   0x0000fffff7faf270:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf274:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf278:	aa1303e1	mov	x1, x19
   0x0000fffff7faf27c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf280:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7faf284:	aa1403e4	mov	x4, x20
   0x0000fffff7faf288:	aa1603e5	mov	x5, x22
   0x0000fffff7faf28c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faf290:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf294:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf298:	d63f0200	blr	x16
   0x0000fffff7faf29c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf2a0:	54006780	b.eq	0xfffff7faff90  // b.none
   0x0000fffff7faf2a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf2a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf2ac:	540004a0	b.eq	0xfffff7faf340  // b.none
   0x0000fffff7faf2b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf2b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf2b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf2bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf2c0:	54000400	b.eq	0xfffff7faf340  // b.none
   0x0000fffff7faf2c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf2c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf2cc:	36d801d1	tbz	w17, #27, 0xfffff7faf304
   0x0000fffff7faf2d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf2d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf2d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf2dc:	54000321	b.ne	0xfffff7faf340  // b.any
   0x0000fffff7faf2e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf2e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf2e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf2ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf2f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf2f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf2f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf2fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf300:	54000209	b.ls	0xfffff7faf340  // b.plast
   0x0000fffff7faf304:	36d8008d	tbz	w13, #27, 0xfffff7faf314
   0x0000fffff7faf308:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf30c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf310:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf314:	36d80091	tbz	w17, #27, 0xfffff7faf324
   0x0000fffff7faf318:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf31c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf320:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf324:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faf328:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faf32c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf330:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf334:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faf338:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faf33c:	1400000e	b	0xfffff7faf374
   0x0000fffff7faf340:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf344:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf348:	aa1303e1	mov	x1, x19
   0x0000fffff7faf34c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf350:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7faf354:	aa1403e4	mov	x4, x20
   0x0000fffff7faf358:	aa1603e5	mov	x5, x22
   0x0000fffff7faf35c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faf360:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf364:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf368:	d63f0200	blr	x16
   0x0000fffff7faf36c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf370:	54006140	b.eq	0xfffff7faff98  // b.none
   0x0000fffff7faf374:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf378:	37d806a9	tbnz	w9, #27, 0xfffff7faf44c
   0x0000fffff7faf37c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf380:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf388:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf38c:	540001c1	b.ne	0xfffff7faf3c4  // b.any
   0x0000fffff7faf390:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf39c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf3a0:	54000121	b.ne	0xfffff7faf3c4  // b.any
   0x0000fffff7faf3a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf3a8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faf3ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf3b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf3b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf3b8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faf3bc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf3c0:	14000030	b	0xfffff7faf480
   0x0000fffff7faf3c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf3c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf3cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf3d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf3d4:	54000120	b.eq	0xfffff7faf3f8  // b.none
   0x0000fffff7faf3d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf3dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf3e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf3e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf3e8:	54000321	b.ne	0xfffff7faf44c  // b.any
   0x0000fffff7faf3ec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf3f0:	9e620120	scvtf	d0, x9
   0x0000fffff7faf3f4:	14000002	b	0xfffff7faf3fc
   0x0000fffff7faf3f8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faf3fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf400:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf404:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf408:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf40c:	54000120	b.eq	0xfffff7faf430  // b.none
   0x0000fffff7faf410:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf414:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf418:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf41c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf420:	54000161	b.ne	0xfffff7faf44c  // b.any
   0x0000fffff7faf424:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faf428:	9e620121	scvtf	d1, x9
   0x0000fffff7faf42c:	14000002	b	0xfffff7faf434
   0x0000fffff7faf430:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faf434:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf438:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faf43c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf440:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf444:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf448:	17ffffde	b	0xfffff7faf3c0
   0x0000fffff7faf44c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf450:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf454:	aa1303e1	mov	x1, x19
   0x0000fffff7faf458:	aa1503e2	mov	x2, x21
   0x0000fffff7faf45c:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7faf460:	aa1403e4	mov	x4, x20
   0x0000fffff7faf464:	aa1603e5	mov	x5, x22
   0x0000fffff7faf468:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faf46c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf470:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf474:	d63f0200	blr	x16
   0x0000fffff7faf478:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf47c:	54005920	b.eq	0xfffff7faffa0  // b.none
   0x0000fffff7faf480:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf484:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf488:	540004a0	b.eq	0xfffff7faf51c  // b.none
   0x0000fffff7faf48c:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf490:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf494:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf498:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf49c:	54000400	b.eq	0xfffff7faf51c  // b.none
   0x0000fffff7faf4a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf4a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf4a8:	36d801d1	tbz	w17, #27, 0xfffff7faf4e0
   0x0000fffff7faf4ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf4b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf4b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf4b8:	54000321	b.ne	0xfffff7faf51c  // b.any
   0x0000fffff7faf4bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf4c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf4c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf4c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf4cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf4d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf4d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf4d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf4dc:	54000209	b.ls	0xfffff7faf51c  // b.plast
   0x0000fffff7faf4e0:	36d8008d	tbz	w13, #27, 0xfffff7faf4f0
   0x0000fffff7faf4e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf4e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf4ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf4f0:	36d80091	tbz	w17, #27, 0xfffff7faf500
   0x0000fffff7faf4f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf4f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf4fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf500:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faf504:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faf508:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf50c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf510:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faf514:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faf518:	1400000e	b	0xfffff7faf550
   0x0000fffff7faf51c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf520:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf524:	aa1303e1	mov	x1, x19
   0x0000fffff7faf528:	aa1503e2	mov	x2, x21
   0x0000fffff7faf52c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7faf530:	aa1403e4	mov	x4, x20
   0x0000fffff7faf534:	aa1603e5	mov	x5, x22
   0x0000fffff7faf538:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faf53c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf540:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf544:	d63f0200	blr	x16
   0x0000fffff7faf548:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf54c:	540052e0	b.eq	0xfffff7faffa8  // b.none
   0x0000fffff7faf550:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf554:	37d806a9	tbnz	w9, #27, 0xfffff7faf628
   0x0000fffff7faf558:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf55c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf560:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf564:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf568:	540001c1	b.ne	0xfffff7faf5a0  // b.any
   0x0000fffff7faf56c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf570:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf574:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf578:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf57c:	54000121	b.ne	0xfffff7faf5a0  // b.any
   0x0000fffff7faf580:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf584:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faf588:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf58c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf594:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faf598:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf59c:	14000030	b	0xfffff7faf65c
   0x0000fffff7faf5a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf5a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf5a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5b0:	54000120	b.eq	0xfffff7faf5d4  // b.none
   0x0000fffff7faf5b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf5b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf5bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5c4:	54000321	b.ne	0xfffff7faf628  // b.any
   0x0000fffff7faf5c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf5cc:	9e620120	scvtf	d0, x9
   0x0000fffff7faf5d0:	14000002	b	0xfffff7faf5d8
   0x0000fffff7faf5d4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faf5d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf5dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf5e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5e8:	54000120	b.eq	0xfffff7faf60c  // b.none
   0x0000fffff7faf5ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf5f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf5f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5fc:	54000161	b.ne	0xfffff7faf628  // b.any
   0x0000fffff7faf600:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faf604:	9e620121	scvtf	d1, x9
   0x0000fffff7faf608:	14000002	b	0xfffff7faf610
   0x0000fffff7faf60c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faf610:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf614:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faf618:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf61c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf620:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf624:	17ffffde	b	0xfffff7faf59c
   0x0000fffff7faf628:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf62c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf630:	aa1303e1	mov	x1, x19
   0x0000fffff7faf634:	aa1503e2	mov	x2, x21
   0x0000fffff7faf638:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7faf63c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf640:	aa1603e5	mov	x5, x22
   0x0000fffff7faf644:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faf648:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf64c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf650:	d63f0200	blr	x16
   0x0000fffff7faf654:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf658:	54004ac0	b.eq	0xfffff7faffb0  // b.none
   0x0000fffff7faf65c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf660:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf664:	540004a0	b.eq	0xfffff7faf6f8  // b.none
   0x0000fffff7faf668:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf66c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf670:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf674:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf678:	54000400	b.eq	0xfffff7faf6f8  // b.none
   0x0000fffff7faf67c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf680:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf684:	36d801d1	tbz	w17, #27, 0xfffff7faf6bc
   0x0000fffff7faf688:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf68c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf690:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf694:	54000321	b.ne	0xfffff7faf6f8  // b.any
   0x0000fffff7faf698:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf69c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf6a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf6a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf6a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf6ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf6b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf6b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf6b8:	54000209	b.ls	0xfffff7faf6f8  // b.plast
   0x0000fffff7faf6bc:	36d8008d	tbz	w13, #27, 0xfffff7faf6cc
   0x0000fffff7faf6c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf6c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf6c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf6cc:	36d80091	tbz	w17, #27, 0xfffff7faf6dc
   0x0000fffff7faf6d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf6d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf6d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf6dc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faf6e0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faf6e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf6e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf6ec:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faf6f0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faf6f4:	1400000e	b	0xfffff7faf72c
   0x0000fffff7faf6f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf6fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf700:	aa1303e1	mov	x1, x19
   0x0000fffff7faf704:	aa1503e2	mov	x2, x21
   0x0000fffff7faf708:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7faf70c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf710:	aa1603e5	mov	x5, x22
   0x0000fffff7faf714:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faf718:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf71c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf720:	d63f0200	blr	x16
   0x0000fffff7faf724:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf728:	54004480	b.eq	0xfffff7faffb8  // b.none
   0x0000fffff7faf72c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf730:	37d806a9	tbnz	w9, #27, 0xfffff7faf804
   0x0000fffff7faf734:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf73c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf740:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf744:	540001c1	b.ne	0xfffff7faf77c  // b.any
   0x0000fffff7faf748:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf74c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf750:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf754:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf758:	54000121	b.ne	0xfffff7faf77c  // b.any
   0x0000fffff7faf75c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf760:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faf764:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf768:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf76c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf770:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faf774:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf778:	14000030	b	0xfffff7faf838
   0x0000fffff7faf77c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf780:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf784:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf788:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf78c:	54000120	b.eq	0xfffff7faf7b0  // b.none
   0x0000fffff7faf790:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf794:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf798:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf79c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf7a0:	54000321	b.ne	0xfffff7faf804  // b.any
   0x0000fffff7faf7a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf7a8:	9e620120	scvtf	d0, x9
   0x0000fffff7faf7ac:	14000002	b	0xfffff7faf7b4
   0x0000fffff7faf7b0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faf7b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf7b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf7bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf7c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf7c4:	54000120	b.eq	0xfffff7faf7e8  // b.none
   0x0000fffff7faf7c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf7cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf7d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf7d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf7d8:	54000161	b.ne	0xfffff7faf804  // b.any
   0x0000fffff7faf7dc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faf7e0:	9e620121	scvtf	d1, x9
   0x0000fffff7faf7e4:	14000002	b	0xfffff7faf7ec
   0x0000fffff7faf7e8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faf7ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf7f0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faf7f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf7f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf7fc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf800:	17ffffde	b	0xfffff7faf778
   0x0000fffff7faf804:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf808:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf80c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf810:	aa1503e2	mov	x2, x21
   0x0000fffff7faf814:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7faf818:	aa1403e4	mov	x4, x20
   0x0000fffff7faf81c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf820:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faf824:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf828:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf82c:	d63f0200	blr	x16
   0x0000fffff7faf830:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf834:	54003c60	b.eq	0xfffff7faffc0  // b.none
   0x0000fffff7faf838:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf83c:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf840:	540004a0	b.eq	0xfffff7faf8d4  // b.none
   0x0000fffff7faf844:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf848:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf84c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf850:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf854:	54000400	b.eq	0xfffff7faf8d4  // b.none
   0x0000fffff7faf858:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf85c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf860:	36d801d1	tbz	w17, #27, 0xfffff7faf898
   0x0000fffff7faf864:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf868:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf86c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf870:	54000321	b.ne	0xfffff7faf8d4  // b.any
   0x0000fffff7faf874:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf878:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf87c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf880:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf884:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf888:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf88c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf890:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf894:	54000209	b.ls	0xfffff7faf8d4  // b.plast
   0x0000fffff7faf898:	36d8008d	tbz	w13, #27, 0xfffff7faf8a8
   0x0000fffff7faf89c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf8a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf8a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf8a8:	36d80091	tbz	w17, #27, 0xfffff7faf8b8
   0x0000fffff7faf8ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf8b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf8b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf8b8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7faf8bc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7faf8c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf8c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf8c8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7faf8cc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7faf8d0:	1400000e	b	0xfffff7faf908
   0x0000fffff7faf8d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf8d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf8dc:	aa1303e1	mov	x1, x19
   0x0000fffff7faf8e0:	aa1503e2	mov	x2, x21
   0x0000fffff7faf8e4:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7faf8e8:	aa1403e4	mov	x4, x20
   0x0000fffff7faf8ec:	aa1603e5	mov	x5, x22
   0x0000fffff7faf8f0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faf8f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf8f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf8fc:	d63f0200	blr	x16
   0x0000fffff7faf900:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf904:	54003620	b.eq	0xfffff7faffc8  // b.none
   0x0000fffff7faf908:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf90c:	37d806a9	tbnz	w9, #27, 0xfffff7faf9e0
   0x0000fffff7faf910:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf914:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf918:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf91c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf920:	540001c1	b.ne	0xfffff7faf958  // b.any
   0x0000fffff7faf924:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf928:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf92c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf930:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf934:	54000121	b.ne	0xfffff7faf958  // b.any
   0x0000fffff7faf938:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf93c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7faf940:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf94c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7faf950:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf954:	14000030	b	0xfffff7fafa14
   0x0000fffff7faf958:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf95c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf964:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf968:	54000120	b.eq	0xfffff7faf98c  // b.none
   0x0000fffff7faf96c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faf970:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf978:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf97c:	54000321	b.ne	0xfffff7faf9e0  // b.any
   0x0000fffff7faf980:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faf984:	9e620120	scvtf	d0, x9
   0x0000fffff7faf988:	14000002	b	0xfffff7faf990
   0x0000fffff7faf98c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7faf990:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf994:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf99c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf9a0:	54000120	b.eq	0xfffff7faf9c4  // b.none
   0x0000fffff7faf9a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7faf9a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf9ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf9b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf9b4:	54000161	b.ne	0xfffff7faf9e0  // b.any
   0x0000fffff7faf9b8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7faf9bc:	9e620121	scvtf	d1, x9
   0x0000fffff7faf9c0:	14000002	b	0xfffff7faf9c8
   0x0000fffff7faf9c4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7faf9c8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf9cc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7faf9d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf9d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf9d8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7faf9dc:	17ffffde	b	0xfffff7faf954
   0x0000fffff7faf9e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf9e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf9e8:	aa1303e1	mov	x1, x19
   0x0000fffff7faf9ec:	aa1503e2	mov	x2, x21
   0x0000fffff7faf9f0:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7faf9f4:	aa1403e4	mov	x4, x20
   0x0000fffff7faf9f8:	aa1603e5	mov	x5, x22
   0x0000fffff7faf9fc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fafa00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafa04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafa08:	d63f0200	blr	x16
   0x0000fffff7fafa0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafa10:	54002e00	b.eq	0xfffff7faffd0  // b.none
   0x0000fffff7fafa14:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fafa18:	f100017f	cmp	x11, #0x0
   0x0000fffff7fafa1c:	540004a0	b.eq	0xfffff7fafab0  // b.none
   0x0000fffff7fafa20:	b940016d	ldr	w13, [x11]
   0x0000fffff7fafa24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fafa28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fafa2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fafa30:	54000400	b.eq	0xfffff7fafab0  // b.none
   0x0000fffff7fafa34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fafa38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fafa3c:	36d801d1	tbz	w17, #27, 0xfffff7fafa74
   0x0000fffff7fafa40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafa44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafa48:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafa4c:	54000321	b.ne	0xfffff7fafab0  // b.any
   0x0000fffff7fafa50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fafa54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafa58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafa5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafa60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafa64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafa68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafa6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafa70:	54000209	b.ls	0xfffff7fafab0  // b.plast
   0x0000fffff7fafa74:	36d8008d	tbz	w13, #27, 0xfffff7fafa84
   0x0000fffff7fafa78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafa7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafa80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafa84:	36d80091	tbz	w17, #27, 0xfffff7fafa94
   0x0000fffff7fafa88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafa8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafa90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafa94:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fafa98:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fafa9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fafaa0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fafaa4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fafaa8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fafaac:	1400000e	b	0xfffff7fafae4
   0x0000fffff7fafab0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fafab4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafab8:	aa1303e1	mov	x1, x19
   0x0000fffff7fafabc:	aa1503e2	mov	x2, x21
   0x0000fffff7fafac0:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fafac4:	aa1403e4	mov	x4, x20
   0x0000fffff7fafac8:	aa1603e5	mov	x5, x22
   0x0000fffff7fafacc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fafad0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafad4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafad8:	d63f0200	blr	x16
   0x0000fffff7fafadc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafae0:	540027c0	b.eq	0xfffff7faffd8  // b.none
   0x0000fffff7fafae4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fafae8:	37d806a9	tbnz	w9, #27, 0xfffff7fafbbc
   0x0000fffff7fafaec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fafaf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafaf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafaf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafafc:	540001c1	b.ne	0xfffff7fafb34  // b.any
   0x0000fffff7fafb00:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fafb04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb10:	54000121	b.ne	0xfffff7fafb34  // b.any
   0x0000fffff7fafb14:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fafb18:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fafb1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fafb20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb28:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fafb2c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fafb30:	14000030	b	0xfffff7fafbf0
   0x0000fffff7fafb34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fafb38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafb3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb44:	54000120	b.eq	0xfffff7fafb68  // b.none
   0x0000fffff7fafb48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fafb4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb58:	54000321	b.ne	0xfffff7fafbbc  // b.any
   0x0000fffff7fafb5c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fafb60:	9e620120	scvtf	d0, x9
   0x0000fffff7fafb64:	14000002	b	0xfffff7fafb6c
   0x0000fffff7fafb68:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fafb6c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fafb70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafb74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb7c:	54000120	b.eq	0xfffff7fafba0  // b.none
   0x0000fffff7fafb80:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fafb84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb90:	54000161	b.ne	0xfffff7fafbbc  // b.any
   0x0000fffff7fafb94:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fafb98:	9e620121	scvtf	d1, x9
   0x0000fffff7fafb9c:	14000002	b	0xfffff7fafba4
   0x0000fffff7fafba0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fafba4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fafba8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fafbac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafbb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafbb4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fafbb8:	17ffffde	b	0xfffff7fafb30
   0x0000fffff7fafbbc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafbc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafbc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fafbc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fafbcc:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fafbd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fafbd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fafbd8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fafbdc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafbe0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafbe4:	d63f0200	blr	x16
   0x0000fffff7fafbe8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafbec:	54001fa0	b.eq	0xfffff7faffe0  // b.none
   0x0000fffff7fafbf0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fafbf4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fafbf8:	540004a0	b.eq	0xfffff7fafc8c  // b.none
   0x0000fffff7fafbfc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fafc00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fafc04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fafc08:	eb0901bf	cmp	x13, x9
   0x0000fffff7fafc0c:	54000400	b.eq	0xfffff7fafc8c  // b.none
   0x0000fffff7fafc10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fafc14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fafc18:	36d801d1	tbz	w17, #27, 0xfffff7fafc50
   0x0000fffff7fafc1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafc20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafc24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafc28:	54000321	b.ne	0xfffff7fafc8c  // b.any
   0x0000fffff7fafc2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fafc30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafc34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafc38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafc3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafc40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafc44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafc48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafc4c:	54000209	b.ls	0xfffff7fafc8c  // b.plast
   0x0000fffff7fafc50:	36d8008d	tbz	w13, #27, 0xfffff7fafc60
   0x0000fffff7fafc54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafc58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafc5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafc60:	36d80091	tbz	w17, #27, 0xfffff7fafc70
   0x0000fffff7fafc64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafc68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafc6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafc70:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fafc74:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fafc78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fafc7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fafc80:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fafc84:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fafc88:	1400000e	b	0xfffff7fafcc0
   0x0000fffff7fafc8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fafc90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafc94:	aa1303e1	mov	x1, x19
   0x0000fffff7fafc98:	aa1503e2	mov	x2, x21
   0x0000fffff7fafc9c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fafca0:	aa1403e4	mov	x4, x20
   0x0000fffff7fafca4:	aa1603e5	mov	x5, x22
   0x0000fffff7fafca8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fafcac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafcb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafcb4:	d63f0200	blr	x16
   0x0000fffff7fafcb8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafcbc:	54001960	b.eq	0xfffff7faffe8  // b.none
   0x0000fffff7fafcc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fafcc4:	37d806a9	tbnz	w9, #27, 0xfffff7fafd98
   0x0000fffff7fafcc8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fafccc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafcd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafcd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafcd8:	540001c1	b.ne	0xfffff7fafd10  // b.any
   0x0000fffff7fafcdc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fafce0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafce4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafce8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafcec:	54000121	b.ne	0xfffff7fafd10  // b.any
   0x0000fffff7fafcf0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fafcf4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fafcf8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fafcfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafd00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafd04:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fafd08:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fafd0c:	14000030	b	0xfffff7fafdcc
   0x0000fffff7fafd10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fafd14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafd18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafd1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafd20:	54000120	b.eq	0xfffff7fafd44  // b.none
   0x0000fffff7fafd24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fafd28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafd2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafd30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafd34:	54000321	b.ne	0xfffff7fafd98  // b.any
   0x0000fffff7fafd38:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fafd3c:	9e620120	scvtf	d0, x9
   0x0000fffff7fafd40:	14000002	b	0xfffff7fafd48
   0x0000fffff7fafd44:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fafd48:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fafd4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafd50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafd54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafd58:	54000120	b.eq	0xfffff7fafd7c  // b.none
   0x0000fffff7fafd5c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fafd60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafd64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafd68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafd6c:	54000161	b.ne	0xfffff7fafd98  // b.any
   0x0000fffff7fafd70:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fafd74:	9e620121	scvtf	d1, x9
   0x0000fffff7fafd78:	14000002	b	0xfffff7fafd80
   0x0000fffff7fafd7c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fafd80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fafd84:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fafd88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafd8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafd90:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fafd94:	17ffffde	b	0xfffff7fafd0c
   0x0000fffff7fafd98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafd9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafda0:	aa1303e1	mov	x1, x19
   0x0000fffff7fafda4:	aa1503e2	mov	x2, x21
   0x0000fffff7fafda8:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fafdac:	aa1403e4	mov	x4, x20
   0x0000fffff7fafdb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fafdb4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fafdb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafdbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafdc0:	d63f0200	blr	x16
   0x0000fffff7fafdc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafdc8:	54001140	b.eq	0xfffff7fafff0  // b.none
   0x0000fffff7fafdcc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fafdd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafdd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafdd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafddc:	54000381	b.ne	0xfffff7fafe4c  // b.any
   0x0000fffff7fafde0:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fafde4:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fafde8:	8b0a018b	add	x11, x12, x10
   0x0000fffff7fafdec:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fafdf0:	36d80211	tbz	w17, #27, 0xfffff7fafe30
   0x0000fffff7fafdf4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafdf8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafdfc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafe00:	54000261	b.ne	0xfffff7fafe4c  // b.any
   0x0000fffff7fafe04:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fafe08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafe0c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafe10:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafe14:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafe18:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafe1c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafe20:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafe24:	54000149	b.ls	0xfffff7fafe4c  // b.plast
   0x0000fffff7fafe28:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafe2c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafe30:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fafe34:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fafe38:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fafe3c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fafe40:	f9002e6b	str	x11, [x19, #88]
   0x0000fffff7fafe44:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fafe48:	1400000e	b	0xfffff7fafe80
   0x0000fffff7fafe4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafe50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafe54:	aa1303e1	mov	x1, x19
   0x0000fffff7fafe58:	aa1503e2	mov	x2, x21
   0x0000fffff7fafe5c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fafe60:	aa1403e4	mov	x4, x20
   0x0000fffff7fafe64:	aa1603e5	mov	x5, x22
   0x0000fffff7fafe68:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fafe6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafe70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafe74:	d63f0200	blr	x16
   0x0000fffff7fafe78:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafe7c:	54000be0	b.eq	0xfffff7fafff8  // b.none
   0x0000fffff7fafe80:	17fff8c6	b	0xfffff7fae198
   0x0000fffff7fafe84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafe88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafe8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fafe90:	aa1503e2	mov	x2, x21
   0x0000fffff7fafe94:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fafe98:	aa1403e4	mov	x4, x20
   0x0000fffff7fafe9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fafea0:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fafea4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafea8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafeac:	d63f0200	blr	x16
   0x0000fffff7fafeb0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fafeb4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fafeb8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fafebc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fafec0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fafec4:	d65f03c0	ret
   0x0000fffff7fafec8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafecc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafed0:	b900028a	str	w10, [x20]
   0x0000fffff7fafed4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fafed8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fafedc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fafee0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fafee4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fafee8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fafeec:	d65f03c0	ret
   0x0000fffff7fafef0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fafef4:	17fffff5	b	0xfffff7fafec8
   0x0000fffff7fafef8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fafefc:	17fffff3	b	0xfffff7fafec8
   0x0000fffff7faff00:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7faff04:	17fffff1	b	0xfffff7fafec8
   0x0000fffff7faff08:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7faff0c:	17ffffef	b	0xfffff7fafec8
   0x0000fffff7faff10:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7faff14:	17ffffed	b	0xfffff7fafec8
   0x0000fffff7faff18:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7faff1c:	17ffffeb	b	0xfffff7fafec8
   0x0000fffff7faff20:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7faff24:	17ffffe9	b	0xfffff7fafec8
   0x0000fffff7faff28:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7faff2c:	17ffffe7	b	0xfffff7fafec8
   0x0000fffff7faff30:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7faff34:	17ffffe5	b	0xfffff7fafec8
   0x0000fffff7faff38:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7faff3c:	17ffffe3	b	0xfffff7fafec8
   0x0000fffff7faff40:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7faff44:	17ffffe1	b	0xfffff7fafec8
   0x0000fffff7faff48:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7faff4c:	17ffffdf	b	0xfffff7fafec8
   0x0000fffff7faff50:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7faff54:	17ffffdd	b	0xfffff7fafec8
   0x0000fffff7faff58:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7faff5c:	17ffffdb	b	0xfffff7fafec8
   0x0000fffff7faff60:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7faff64:	17ffffd9	b	0xfffff7fafec8
   0x0000fffff7faff68:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7faff6c:	17ffffd7	b	0xfffff7fafec8
   0x0000fffff7faff70:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7faff74:	17ffffd5	b	0xfffff7fafec8
   0x0000fffff7faff78:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7faff7c:	17ffffd3	b	0xfffff7fafec8
   0x0000fffff7faff80:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7faff84:	17ffffd1	b	0xfffff7fafec8
   0x0000fffff7faff88:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7faff8c:	17ffffcf	b	0xfffff7fafec8
   0x0000fffff7faff90:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7faff94:	17ffffcd	b	0xfffff7fafec8
   0x0000fffff7faff98:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7faff9c:	17ffffcb	b	0xfffff7fafec8
   0x0000fffff7faffa0:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7faffa4:	17ffffc9	b	0xfffff7fafec8
   0x0000fffff7faffa8:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7faffac:	17ffffc7	b	0xfffff7fafec8
   0x0000fffff7faffb0:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7faffb4:	17ffffc5	b	0xfffff7fafec8
   0x0000fffff7faffb8:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7faffbc:	17ffffc3	b	0xfffff7fafec8
   0x0000fffff7faffc0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7faffc4:	17ffffc1	b	0xfffff7fafec8
   0x0000fffff7faffc8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7faffcc:	17ffffbf	b	0xfffff7fafec8
   0x0000fffff7faffd0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7faffd4:	17ffffbd	b	0xfffff7fafec8
   0x0000fffff7faffd8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7faffdc:	17ffffbb	b	0xfffff7fafec8
   0x0000fffff7faffe0:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7faffe4:	17ffffb9	b	0xfffff7fafec8
   0x0000fffff7faffe8:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7faffec:	17ffffb7	b	0xfffff7fafec8
   0x0000fffff7fafff0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fafff4:	17ffffb5	b	0xfffff7fafec8
   0x0000fffff7fafff8:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fafffc:	17ffffb3	b	0xfffff7fafec8
End of assembler dump.
