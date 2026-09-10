Dump of assembler code from 0xfffff7f8a000 to 0xfffff7f8c000:
   0x0000fffff7f8a000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f8a004:	910003fd	mov	x29, sp
   0x0000fffff7f8a008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8a00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f8a010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f8a014:	aa0003f3	mov	x19, x0
   0x0000fffff7f8a018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8a01c:	aa0203f5	mov	x21, x2
   0x0000fffff7f8a020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f8a024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f8a028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8a02c:	f90003e9	str	x9, [sp]
   0x0000fffff7f8a030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f8a034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f8a038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8a03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f8a040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a044:	d63f0200	blr	x16
   0x0000fffff7f8a048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8a04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f8a050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f8a054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f8a058:	14000001	b	0xfffff7f8a05c
   0x0000fffff7f8a05c:	14000001	b	0xfffff7f8a060
   0x0000fffff7f8a060:	14000001	b	0xfffff7f8a064
   0x0000fffff7f8a064:	14000001	b	0xfffff7f8a068
   0x0000fffff7f8a068:	14000001	b	0xfffff7f8a06c
   0x0000fffff7f8a06c:	14000001	b	0xfffff7f8a070
   0x0000fffff7f8a070:	14000001	b	0xfffff7f8a074
   0x0000fffff7f8a074:	14000001	b	0xfffff7f8a078
   0x0000fffff7f8a078:	14000001	b	0xfffff7f8a07c
   0x0000fffff7f8a07c:	14000001	b	0xfffff7f8a080
   0x0000fffff7f8a080:	14000001	b	0xfffff7f8a084
   0x0000fffff7f8a084:	14000001	b	0xfffff7f8a088
   0x0000fffff7f8a088:	14000001	b	0xfffff7f8a08c
   0x0000fffff7f8a08c:	14000001	b	0xfffff7f8a090
   0x0000fffff7f8a090:	14000001	b	0xfffff7f8a094
   0x0000fffff7f8a094:	14000001	b	0xfffff7f8a098
   0x0000fffff7f8a098:	14000001	b	0xfffff7f8a09c
   0x0000fffff7f8a09c:	14000001	b	0xfffff7f8a0a0
   0x0000fffff7f8a0a0:	14000001	b	0xfffff7f8a0a4
   0x0000fffff7f8a0a4:	14000001	b	0xfffff7f8a0a8
   0x0000fffff7f8a0a8:	14000001	b	0xfffff7f8a0ac
   0x0000fffff7f8a0ac:	14000001	b	0xfffff7f8a0b0
   0x0000fffff7f8a0b0:	14000001	b	0xfffff7f8a0b4
   0x0000fffff7f8a0b4:	14000001	b	0xfffff7f8a0b8
   0x0000fffff7f8a0b8:	14000001	b	0xfffff7f8a0bc
   0x0000fffff7f8a0bc:	14000001	b	0xfffff7f8a0c0
   0x0000fffff7f8a0c0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8a0c4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8a0c8:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f8a0cc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f8a0d0:	36d80211	tbz	w17, #27, 0xfffff7f8a110
   0x0000fffff7f8a0d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8a0d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8a0dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8a0e0:	540001e1	b.ne	0xfffff7f8a11c  // b.any
   0x0000fffff7f8a0e4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f8a0e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a0ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8a0f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8a0f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8a0f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8a0fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8a100:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8a104:	540000c9	b.ls	0xfffff7f8a11c  // b.plast
   0x0000fffff7f8a108:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8a10c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8a110:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f8a114:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f8a118:	1400000e	b	0xfffff7f8a150
   0x0000fffff7f8a11c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8a120:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a124:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a128:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a12c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f8a130:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a134:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a138:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f8a13c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8a140:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a144:	d63f0200	blr	x16
   0x0000fffff7f8a148:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a14c:	5400eac0	b.eq	0xfffff7f8bea4  // b.none
   0x0000fffff7f8a150:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8a154:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8a158:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f8a15c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f8a160:	36d80211	tbz	w17, #27, 0xfffff7f8a1a0
   0x0000fffff7f8a164:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8a168:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8a16c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8a170:	540001e1	b.ne	0xfffff7f8a1ac  // b.any
   0x0000fffff7f8a174:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f8a178:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a17c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8a180:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8a184:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8a188:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8a18c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8a190:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8a194:	540000c9	b.ls	0xfffff7f8a1ac  // b.plast
   0x0000fffff7f8a198:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8a19c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8a1a0:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f8a1a4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f8a1a8:	1400000e	b	0xfffff7f8a1e0
   0x0000fffff7f8a1ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8a1b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a1b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a1b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a1bc:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f8a1c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a1c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a1c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f8a1cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8a1d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a1d4:	d63f0200	blr	x16
   0x0000fffff7f8a1d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a1dc:	5400e680	b.eq	0xfffff7f8beac  // b.none
   0x0000fffff7f8a1e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8a1e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a1e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a1ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a1f0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f8a1f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a1f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a1fc:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7f8a200:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8a204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a208:	d63f0200	blr	x16
   0x0000fffff7f8a20c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a210:	5400e520	b.eq	0xfffff7f8beb4  // b.none
   0x0000fffff7f8a214:	f100041f	cmp	x0, #0x1
   0x0000fffff7f8a218:	5400e100	b.eq	0xfffff7f8be38  // b.none
   0x0000fffff7f8a21c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8a220:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f8a224:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f8a228:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f8a22c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8a230:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f8a234:	36d801d1	tbz	w17, #27, 0xfffff7f8a26c
   0x0000fffff7f8a238:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8a23c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8a240:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8a244:	54000281	b.ne	0xfffff7f8a294  // b.any
   0x0000fffff7f8a248:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8a24c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a250:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8a254:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8a258:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8a25c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8a260:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8a264:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8a268:	54000169	b.ls	0xfffff7f8a294  // b.plast
   0x0000fffff7f8a26c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8a270:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8a274:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8a278:	36d80091	tbz	w17, #27, 0xfffff7f8a288
   0x0000fffff7f8a27c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a280:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8a284:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8a288:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8a28c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8a290:	1400000e	b	0xfffff7f8a2c8
   0x0000fffff7f8a294:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8a298:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a29c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a2a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a2a4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f8a2a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a2ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a2b0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f8a2b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8a2b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a2bc:	d63f0200	blr	x16
   0x0000fffff7f8a2c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a2c4:	5400dfc0	b.eq	0xfffff7f8bebc  // b.none
   0x0000fffff7f8a2c8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f8a2cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8a2d0:	540003a0	b.eq	0xfffff7f8a344  // b.none
   0x0000fffff7f8a2d4:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f8a2d8:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f8a2dc:	b9400171	ldr	w17, [x11]
   0x0000fffff7f8a2e0:	36d801d1	tbz	w17, #27, 0xfffff7f8a318
   0x0000fffff7f8a2e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8a2e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8a2ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8a2f0:	540002a1	b.ne	0xfffff7f8a344  // b.any
   0x0000fffff7f8a2f4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f8a2f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a2fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8a300:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8a304:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8a308:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8a30c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8a310:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8a314:	54000189	b.ls	0xfffff7f8a344  // b.plast
   0x0000fffff7f8a318:	36d8008d	tbz	w13, #27, 0xfffff7f8a328
   0x0000fffff7f8a31c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8a320:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8a324:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8a328:	36d80091	tbz	w17, #27, 0xfffff7f8a338
   0x0000fffff7f8a32c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a330:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8a334:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8a338:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f8a33c:	b900016d	str	w13, [x11]
   0x0000fffff7f8a340:	1400000e	b	0xfffff7f8a378
   0x0000fffff7f8a344:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8a348:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a34c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a350:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a354:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f8a358:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a35c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a360:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f8a364:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8a368:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a36c:	d63f0200	blr	x16
   0x0000fffff7f8a370:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a374:	5400da80	b.eq	0xfffff7f8bec4  // b.none
   0x0000fffff7f8a378:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8a37c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8a380:	540004a0	b.eq	0xfffff7f8a414  // b.none
   0x0000fffff7f8a384:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8a388:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8a38c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8a390:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8a394:	54000400	b.eq	0xfffff7f8a414  // b.none
   0x0000fffff7f8a398:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8a39c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8a3a0:	36d801d1	tbz	w17, #27, 0xfffff7f8a3d8
   0x0000fffff7f8a3a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8a3a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8a3ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8a3b0:	54000321	b.ne	0xfffff7f8a414  // b.any
   0x0000fffff7f8a3b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8a3b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a3bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8a3c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8a3c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8a3c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8a3cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8a3d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8a3d4:	54000209	b.ls	0xfffff7f8a414  // b.plast
   0x0000fffff7f8a3d8:	36d8008d	tbz	w13, #27, 0xfffff7f8a3e8
   0x0000fffff7f8a3dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8a3e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8a3e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8a3e8:	36d80091	tbz	w17, #27, 0xfffff7f8a3f8
   0x0000fffff7f8a3ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a3f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8a3f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8a3f8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8a3fc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8a400:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8a404:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8a408:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8a40c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8a410:	1400000e	b	0xfffff7f8a448
   0x0000fffff7f8a414:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8a418:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a41c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a420:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a424:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f8a428:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a42c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a430:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8a434:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8a438:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a43c:	d63f0200	blr	x16
   0x0000fffff7f8a440:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a444:	5400d440	b.eq	0xfffff7f8becc  // b.none
   0x0000fffff7f8a448:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a44c:	37d806a9	tbnz	w9, #27, 0xfffff7f8a520
   0x0000fffff7f8a450:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a454:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a458:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a45c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a460:	540001c1	b.ne	0xfffff7f8a498  // b.any
   0x0000fffff7f8a464:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a468:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a46c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a470:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a474:	54000121	b.ne	0xfffff7f8a498  // b.any
   0x0000fffff7f8a478:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8a47c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8a480:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8a484:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a488:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a48c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8a490:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8a494:	14000030	b	0xfffff7f8a554
   0x0000fffff7f8a498:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a49c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8a4a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a4a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a4a8:	54000120	b.eq	0xfffff7f8a4cc  // b.none
   0x0000fffff7f8a4ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a4b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a4b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a4b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a4bc:	54000321	b.ne	0xfffff7f8a520  // b.any
   0x0000fffff7f8a4c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8a4c4:	9e620120	scvtf	d0, x9
   0x0000fffff7f8a4c8:	14000002	b	0xfffff7f8a4d0
   0x0000fffff7f8a4cc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8a4d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a4d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8a4d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a4dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a4e0:	54000120	b.eq	0xfffff7f8a504  // b.none
   0x0000fffff7f8a4e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a4e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a4ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a4f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a4f4:	54000161	b.ne	0xfffff7f8a520  // b.any
   0x0000fffff7f8a4f8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8a4fc:	9e620121	scvtf	d1, x9
   0x0000fffff7f8a500:	14000002	b	0xfffff7f8a508
   0x0000fffff7f8a504:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8a508:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8a50c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8a510:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8a514:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a518:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8a51c:	17ffffde	b	0xfffff7f8a494
   0x0000fffff7f8a520:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8a524:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a528:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a52c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a530:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f8a534:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a538:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a53c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8a540:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8a544:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a548:	d63f0200	blr	x16
   0x0000fffff7f8a54c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a550:	5400cc20	b.eq	0xfffff7f8bed4  // b.none
   0x0000fffff7f8a554:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8a558:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8a55c:	540004a0	b.eq	0xfffff7f8a5f0  // b.none
   0x0000fffff7f8a560:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8a564:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8a568:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8a56c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8a570:	54000400	b.eq	0xfffff7f8a5f0  // b.none
   0x0000fffff7f8a574:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8a578:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8a57c:	36d801d1	tbz	w17, #27, 0xfffff7f8a5b4
   0x0000fffff7f8a580:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8a584:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8a588:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8a58c:	54000321	b.ne	0xfffff7f8a5f0  // b.any
   0x0000fffff7f8a590:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8a594:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a598:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8a59c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8a5a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8a5a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8a5a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8a5ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8a5b0:	54000209	b.ls	0xfffff7f8a5f0  // b.plast
   0x0000fffff7f8a5b4:	36d8008d	tbz	w13, #27, 0xfffff7f8a5c4
   0x0000fffff7f8a5b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8a5bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8a5c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8a5c4:	36d80091	tbz	w17, #27, 0xfffff7f8a5d4
   0x0000fffff7f8a5c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a5cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8a5d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8a5d4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8a5d8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8a5dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8a5e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8a5e4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8a5e8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8a5ec:	1400000e	b	0xfffff7f8a624
   0x0000fffff7f8a5f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8a5f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a5f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a5fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a600:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f8a604:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a608:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a60c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8a610:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8a614:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a618:	d63f0200	blr	x16
   0x0000fffff7f8a61c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a620:	5400c5e0	b.eq	0xfffff7f8bedc  // b.none
   0x0000fffff7f8a624:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a628:	37d806a9	tbnz	w9, #27, 0xfffff7f8a6fc
   0x0000fffff7f8a62c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a638:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a63c:	540001c1	b.ne	0xfffff7f8a674  // b.any
   0x0000fffff7f8a640:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a64c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a650:	54000121	b.ne	0xfffff7f8a674  // b.any
   0x0000fffff7f8a654:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8a658:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8a65c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8a660:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a668:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8a66c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8a670:	14000030	b	0xfffff7f8a730
   0x0000fffff7f8a674:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8a67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a680:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a684:	54000120	b.eq	0xfffff7f8a6a8  // b.none
   0x0000fffff7f8a688:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a68c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a694:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a698:	54000321	b.ne	0xfffff7f8a6fc  // b.any
   0x0000fffff7f8a69c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8a6a0:	9e620120	scvtf	d0, x9
   0x0000fffff7f8a6a4:	14000002	b	0xfffff7f8a6ac
   0x0000fffff7f8a6a8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8a6ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a6b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8a6b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a6b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a6bc:	54000120	b.eq	0xfffff7f8a6e0  // b.none
   0x0000fffff7f8a6c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a6c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a6c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a6cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a6d0:	54000161	b.ne	0xfffff7f8a6fc  // b.any
   0x0000fffff7f8a6d4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8a6d8:	9e620121	scvtf	d1, x9
   0x0000fffff7f8a6dc:	14000002	b	0xfffff7f8a6e4
   0x0000fffff7f8a6e0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8a6e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8a6e8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8a6ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8a6f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a6f4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8a6f8:	17ffffde	b	0xfffff7f8a670
   0x0000fffff7f8a6fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8a700:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a704:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a708:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a70c:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f8a710:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a714:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a718:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8a71c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8a720:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a724:	d63f0200	blr	x16
   0x0000fffff7f8a728:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a72c:	5400bdc0	b.eq	0xfffff7f8bee4  // b.none
   0x0000fffff7f8a730:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8a734:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8a738:	540004a0	b.eq	0xfffff7f8a7cc  // b.none
   0x0000fffff7f8a73c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8a740:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8a744:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8a748:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8a74c:	54000400	b.eq	0xfffff7f8a7cc  // b.none
   0x0000fffff7f8a750:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8a754:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8a758:	36d801d1	tbz	w17, #27, 0xfffff7f8a790
   0x0000fffff7f8a75c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8a760:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8a764:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8a768:	54000321	b.ne	0xfffff7f8a7cc  // b.any
   0x0000fffff7f8a76c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8a770:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a774:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8a778:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8a77c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8a780:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8a784:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8a788:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8a78c:	54000209	b.ls	0xfffff7f8a7cc  // b.plast
   0x0000fffff7f8a790:	36d8008d	tbz	w13, #27, 0xfffff7f8a7a0
   0x0000fffff7f8a794:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8a798:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8a79c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8a7a0:	36d80091	tbz	w17, #27, 0xfffff7f8a7b0
   0x0000fffff7f8a7a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a7a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8a7ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8a7b0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8a7b4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8a7b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8a7bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8a7c0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8a7c4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8a7c8:	1400000e	b	0xfffff7f8a800
   0x0000fffff7f8a7cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8a7d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a7d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a7d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a7dc:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f8a7e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a7e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a7e8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8a7ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8a7f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a7f4:	d63f0200	blr	x16
   0x0000fffff7f8a7f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a7fc:	5400b780	b.eq	0xfffff7f8beec  // b.none
   0x0000fffff7f8a800:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a804:	37d806a9	tbnz	w9, #27, 0xfffff7f8a8d8
   0x0000fffff7f8a808:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a80c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a810:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a814:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a818:	540001c1	b.ne	0xfffff7f8a850  // b.any
   0x0000fffff7f8a81c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a820:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a824:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a828:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a82c:	54000121	b.ne	0xfffff7f8a850  // b.any
   0x0000fffff7f8a830:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8a834:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8a838:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8a83c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a840:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a844:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8a848:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8a84c:	14000030	b	0xfffff7f8a90c
   0x0000fffff7f8a850:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a854:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8a858:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a85c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a860:	54000120	b.eq	0xfffff7f8a884  // b.none
   0x0000fffff7f8a864:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a86c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a870:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a874:	54000321	b.ne	0xfffff7f8a8d8  // b.any
   0x0000fffff7f8a878:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8a87c:	9e620120	scvtf	d0, x9
   0x0000fffff7f8a880:	14000002	b	0xfffff7f8a888
   0x0000fffff7f8a884:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8a888:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a88c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8a890:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a894:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a898:	54000120	b.eq	0xfffff7f8a8bc  // b.none
   0x0000fffff7f8a89c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a8a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a8a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a8a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a8ac:	54000161	b.ne	0xfffff7f8a8d8  // b.any
   0x0000fffff7f8a8b0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8a8b4:	9e620121	scvtf	d1, x9
   0x0000fffff7f8a8b8:	14000002	b	0xfffff7f8a8c0
   0x0000fffff7f8a8bc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8a8c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8a8c4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8a8c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8a8cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a8d0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8a8d4:	17ffffde	b	0xfffff7f8a84c
   0x0000fffff7f8a8d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8a8dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a8e0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a8e4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a8e8:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f8a8ec:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a8f0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a8f4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8a8f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8a8fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a900:	d63f0200	blr	x16
   0x0000fffff7f8a904:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a908:	5400af60	b.eq	0xfffff7f8bef4  // b.none
   0x0000fffff7f8a90c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8a910:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8a914:	540004a0	b.eq	0xfffff7f8a9a8  // b.none
   0x0000fffff7f8a918:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8a91c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8a920:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8a924:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8a928:	54000400	b.eq	0xfffff7f8a9a8  // b.none
   0x0000fffff7f8a92c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8a930:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8a934:	36d801d1	tbz	w17, #27, 0xfffff7f8a96c
   0x0000fffff7f8a938:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8a93c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8a940:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8a944:	54000321	b.ne	0xfffff7f8a9a8  // b.any
   0x0000fffff7f8a948:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8a94c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a950:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8a954:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8a958:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8a95c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8a960:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8a964:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8a968:	54000209	b.ls	0xfffff7f8a9a8  // b.plast
   0x0000fffff7f8a96c:	36d8008d	tbz	w13, #27, 0xfffff7f8a97c
   0x0000fffff7f8a970:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8a974:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8a978:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8a97c:	36d80091	tbz	w17, #27, 0xfffff7f8a98c
   0x0000fffff7f8a980:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8a984:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8a988:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8a98c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8a990:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8a994:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8a998:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8a99c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8a9a0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8a9a4:	1400000e	b	0xfffff7f8a9dc
   0x0000fffff7f8a9a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8a9ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8a9b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8a9b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8a9b8:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f8a9bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f8a9c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8a9c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8a9c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8a9cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8a9d0:	d63f0200	blr	x16
   0x0000fffff7f8a9d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8a9d8:	5400a920	b.eq	0xfffff7f8befc  // b.none
   0x0000fffff7f8a9dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a9e0:	37d806a9	tbnz	w9, #27, 0xfffff7f8aab4
   0x0000fffff7f8a9e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8a9e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8a9ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8a9f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8a9f4:	540001c1	b.ne	0xfffff7f8aa2c  // b.any
   0x0000fffff7f8a9f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8a9fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8aa00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8aa04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8aa08:	54000121	b.ne	0xfffff7f8aa2c  // b.any
   0x0000fffff7f8aa0c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8aa10:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8aa14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8aa18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8aa1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8aa20:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8aa24:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8aa28:	14000030	b	0xfffff7f8aae8
   0x0000fffff7f8aa2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8aa30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8aa34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8aa38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8aa3c:	54000120	b.eq	0xfffff7f8aa60  // b.none
   0x0000fffff7f8aa40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8aa44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8aa48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8aa4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8aa50:	54000321	b.ne	0xfffff7f8aab4  // b.any
   0x0000fffff7f8aa54:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8aa58:	9e620120	scvtf	d0, x9
   0x0000fffff7f8aa5c:	14000002	b	0xfffff7f8aa64
   0x0000fffff7f8aa60:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8aa64:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8aa68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8aa6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8aa70:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8aa74:	54000120	b.eq	0xfffff7f8aa98  // b.none
   0x0000fffff7f8aa78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8aa7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8aa80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8aa84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8aa88:	54000161	b.ne	0xfffff7f8aab4  // b.any
   0x0000fffff7f8aa8c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8aa90:	9e620121	scvtf	d1, x9
   0x0000fffff7f8aa94:	14000002	b	0xfffff7f8aa9c
   0x0000fffff7f8aa98:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8aa9c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8aaa0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8aaa4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8aaa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8aaac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8aab0:	17ffffde	b	0xfffff7f8aa28
   0x0000fffff7f8aab4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8aab8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8aabc:	aa1303e1	mov	x1, x19
   0x0000fffff7f8aac0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8aac4:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f8aac8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8aacc:	aa1603e5	mov	x5, x22
   0x0000fffff7f8aad0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8aad4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8aad8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8aadc:	d63f0200	blr	x16
   0x0000fffff7f8aae0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8aae4:	5400a100	b.eq	0xfffff7f8bf04  // b.none
   0x0000fffff7f8aae8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8aaec:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8aaf0:	540004a0	b.eq	0xfffff7f8ab84  // b.none
   0x0000fffff7f8aaf4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8aaf8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8aafc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8ab00:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8ab04:	54000400	b.eq	0xfffff7f8ab84  // b.none
   0x0000fffff7f8ab08:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8ab0c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8ab10:	36d801d1	tbz	w17, #27, 0xfffff7f8ab48
   0x0000fffff7f8ab14:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8ab18:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8ab1c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8ab20:	54000321	b.ne	0xfffff7f8ab84  // b.any
   0x0000fffff7f8ab24:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8ab28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ab2c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8ab30:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8ab34:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8ab38:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8ab3c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8ab40:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8ab44:	54000209	b.ls	0xfffff7f8ab84  // b.plast
   0x0000fffff7f8ab48:	36d8008d	tbz	w13, #27, 0xfffff7f8ab58
   0x0000fffff7f8ab4c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8ab50:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8ab54:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8ab58:	36d80091	tbz	w17, #27, 0xfffff7f8ab68
   0x0000fffff7f8ab5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ab60:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8ab64:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8ab68:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8ab6c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8ab70:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8ab74:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8ab78:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8ab7c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8ab80:	1400000e	b	0xfffff7f8abb8
   0x0000fffff7f8ab84:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8ab88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ab8c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ab90:	aa1503e2	mov	x2, x21
   0x0000fffff7f8ab94:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f8ab98:	aa1403e4	mov	x4, x20
   0x0000fffff7f8ab9c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8aba0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8aba4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8aba8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8abac:	d63f0200	blr	x16
   0x0000fffff7f8abb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8abb4:	54009ac0	b.eq	0xfffff7f8bf0c  // b.none
   0x0000fffff7f8abb8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8abbc:	37d806a9	tbnz	w9, #27, 0xfffff7f8ac90
   0x0000fffff7f8abc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8abc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8abc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8abcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8abd0:	540001c1	b.ne	0xfffff7f8ac08  // b.any
   0x0000fffff7f8abd4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8abd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8abdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8abe0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8abe4:	54000121	b.ne	0xfffff7f8ac08  // b.any
   0x0000fffff7f8abe8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8abec:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8abf0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8abf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8abf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8abfc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8ac00:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ac04:	14000030	b	0xfffff7f8acc4
   0x0000fffff7f8ac08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ac0c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ac10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ac14:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ac18:	54000120	b.eq	0xfffff7f8ac3c  // b.none
   0x0000fffff7f8ac1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ac20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ac24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ac28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ac2c:	54000321	b.ne	0xfffff7f8ac90  // b.any
   0x0000fffff7f8ac30:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ac34:	9e620120	scvtf	d0, x9
   0x0000fffff7f8ac38:	14000002	b	0xfffff7f8ac40
   0x0000fffff7f8ac3c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8ac40:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ac44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ac48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ac4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ac50:	54000120	b.eq	0xfffff7f8ac74  // b.none
   0x0000fffff7f8ac54:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ac58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ac5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ac60:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ac64:	54000161	b.ne	0xfffff7f8ac90  // b.any
   0x0000fffff7f8ac68:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8ac6c:	9e620121	scvtf	d1, x9
   0x0000fffff7f8ac70:	14000002	b	0xfffff7f8ac78
   0x0000fffff7f8ac74:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8ac78:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8ac7c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8ac80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ac84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ac88:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ac8c:	17ffffde	b	0xfffff7f8ac04
   0x0000fffff7f8ac90:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8ac94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ac98:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ac9c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8aca0:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f8aca4:	aa1403e4	mov	x4, x20
   0x0000fffff7f8aca8:	aa1603e5	mov	x5, x22
   0x0000fffff7f8acac:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8acb0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8acb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8acb8:	d63f0200	blr	x16
   0x0000fffff7f8acbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8acc0:	540092a0	b.eq	0xfffff7f8bf14  // b.none
   0x0000fffff7f8acc4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8acc8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8accc:	540004a0	b.eq	0xfffff7f8ad60  // b.none
   0x0000fffff7f8acd0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8acd4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8acd8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8acdc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8ace0:	54000400	b.eq	0xfffff7f8ad60  // b.none
   0x0000fffff7f8ace4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8ace8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8acec:	36d801d1	tbz	w17, #27, 0xfffff7f8ad24
   0x0000fffff7f8acf0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8acf4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8acf8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8acfc:	54000321	b.ne	0xfffff7f8ad60  // b.any
   0x0000fffff7f8ad00:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8ad04:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ad08:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8ad0c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8ad10:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8ad14:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8ad18:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8ad1c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8ad20:	54000209	b.ls	0xfffff7f8ad60  // b.plast
   0x0000fffff7f8ad24:	36d8008d	tbz	w13, #27, 0xfffff7f8ad34
   0x0000fffff7f8ad28:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8ad2c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8ad30:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8ad34:	36d80091	tbz	w17, #27, 0xfffff7f8ad44
   0x0000fffff7f8ad38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ad3c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8ad40:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8ad44:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8ad48:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8ad4c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8ad50:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8ad54:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8ad58:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8ad5c:	1400000e	b	0xfffff7f8ad94
   0x0000fffff7f8ad60:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8ad64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ad68:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ad6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8ad70:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f8ad74:	aa1403e4	mov	x4, x20
   0x0000fffff7f8ad78:	aa1603e5	mov	x5, x22
   0x0000fffff7f8ad7c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8ad80:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8ad84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ad88:	d63f0200	blr	x16
   0x0000fffff7f8ad8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ad90:	54008c60	b.eq	0xfffff7f8bf1c  // b.none
   0x0000fffff7f8ad94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ad98:	37d806a9	tbnz	w9, #27, 0xfffff7f8ae6c
   0x0000fffff7f8ad9c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ada0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ada4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ada8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8adac:	540001c1	b.ne	0xfffff7f8ade4  // b.any
   0x0000fffff7f8adb0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8adb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8adb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8adbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8adc0:	54000121	b.ne	0xfffff7f8ade4  // b.any
   0x0000fffff7f8adc4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8adc8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8adcc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8add0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8add4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8add8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8addc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ade0:	14000030	b	0xfffff7f8aea0
   0x0000fffff7f8ade4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ade8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8adec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8adf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8adf4:	54000120	b.eq	0xfffff7f8ae18  // b.none
   0x0000fffff7f8adf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8adfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ae00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ae04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ae08:	54000321	b.ne	0xfffff7f8ae6c  // b.any
   0x0000fffff7f8ae0c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ae10:	9e620120	scvtf	d0, x9
   0x0000fffff7f8ae14:	14000002	b	0xfffff7f8ae1c
   0x0000fffff7f8ae18:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8ae1c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ae20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ae24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ae28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ae2c:	54000120	b.eq	0xfffff7f8ae50  // b.none
   0x0000fffff7f8ae30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ae34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ae38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ae3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ae40:	54000161	b.ne	0xfffff7f8ae6c  // b.any
   0x0000fffff7f8ae44:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8ae48:	9e620121	scvtf	d1, x9
   0x0000fffff7f8ae4c:	14000002	b	0xfffff7f8ae54
   0x0000fffff7f8ae50:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8ae54:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8ae58:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8ae5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ae60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ae64:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ae68:	17ffffde	b	0xfffff7f8ade0
   0x0000fffff7f8ae6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8ae70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ae74:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ae78:	aa1503e2	mov	x2, x21
   0x0000fffff7f8ae7c:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f8ae80:	aa1403e4	mov	x4, x20
   0x0000fffff7f8ae84:	aa1603e5	mov	x5, x22
   0x0000fffff7f8ae88:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8ae8c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8ae90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ae94:	d63f0200	blr	x16
   0x0000fffff7f8ae98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ae9c:	54008440	b.eq	0xfffff7f8bf24  // b.none
   0x0000fffff7f8aea0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8aea4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8aea8:	540004a0	b.eq	0xfffff7f8af3c  // b.none
   0x0000fffff7f8aeac:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8aeb0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8aeb4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8aeb8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8aebc:	54000400	b.eq	0xfffff7f8af3c  // b.none
   0x0000fffff7f8aec0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8aec4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8aec8:	36d801d1	tbz	w17, #27, 0xfffff7f8af00
   0x0000fffff7f8aecc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8aed0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8aed4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8aed8:	54000321	b.ne	0xfffff7f8af3c  // b.any
   0x0000fffff7f8aedc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8aee0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8aee4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8aee8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8aeec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8aef0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8aef4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8aef8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8aefc:	54000209	b.ls	0xfffff7f8af3c  // b.plast
   0x0000fffff7f8af00:	36d8008d	tbz	w13, #27, 0xfffff7f8af10
   0x0000fffff7f8af04:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8af08:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8af0c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8af10:	36d80091	tbz	w17, #27, 0xfffff7f8af20
   0x0000fffff7f8af14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8af18:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8af1c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8af20:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8af24:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8af28:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8af2c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8af30:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8af34:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8af38:	1400000e	b	0xfffff7f8af70
   0x0000fffff7f8af3c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8af40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8af44:	aa1303e1	mov	x1, x19
   0x0000fffff7f8af48:	aa1503e2	mov	x2, x21
   0x0000fffff7f8af4c:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f8af50:	aa1403e4	mov	x4, x20
   0x0000fffff7f8af54:	aa1603e5	mov	x5, x22
   0x0000fffff7f8af58:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8af5c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8af60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8af64:	d63f0200	blr	x16
   0x0000fffff7f8af68:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8af6c:	54007e00	b.eq	0xfffff7f8bf2c  // b.none
   0x0000fffff7f8af70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8af74:	37d806a9	tbnz	w9, #27, 0xfffff7f8b048
   0x0000fffff7f8af78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8af7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8af80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8af84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8af88:	540001c1	b.ne	0xfffff7f8afc0  // b.any
   0x0000fffff7f8af8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8af90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8af94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8af98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8af9c:	54000121	b.ne	0xfffff7f8afc0  // b.any
   0x0000fffff7f8afa0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8afa4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8afa8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8afac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8afb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8afb4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8afb8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8afbc:	14000030	b	0xfffff7f8b07c
   0x0000fffff7f8afc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8afc4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8afc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8afcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8afd0:	54000120	b.eq	0xfffff7f8aff4  // b.none
   0x0000fffff7f8afd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8afd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8afdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8afe0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8afe4:	54000321	b.ne	0xfffff7f8b048  // b.any
   0x0000fffff7f8afe8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8afec:	9e620120	scvtf	d0, x9
   0x0000fffff7f8aff0:	14000002	b	0xfffff7f8aff8
   0x0000fffff7f8aff4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8aff8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8affc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b004:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b008:	54000120	b.eq	0xfffff7f8b02c  // b.none
   0x0000fffff7f8b00c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b010:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b014:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b018:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b01c:	54000161	b.ne	0xfffff7f8b048  // b.any
   0x0000fffff7f8b020:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8b024:	9e620121	scvtf	d1, x9
   0x0000fffff7f8b028:	14000002	b	0xfffff7f8b030
   0x0000fffff7f8b02c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8b030:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8b034:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8b038:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b03c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b040:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b044:	17ffffde	b	0xfffff7f8afbc
   0x0000fffff7f8b048:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8b04c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b050:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b054:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b058:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f8b05c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b060:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b064:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8b068:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8b06c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b070:	d63f0200	blr	x16
   0x0000fffff7f8b074:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b078:	540075e0	b.eq	0xfffff7f8bf34  // b.none
   0x0000fffff7f8b07c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8b080:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8b084:	540004a0	b.eq	0xfffff7f8b118  // b.none
   0x0000fffff7f8b088:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8b08c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8b090:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8b094:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8b098:	54000400	b.eq	0xfffff7f8b118  // b.none
   0x0000fffff7f8b09c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8b0a0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8b0a4:	36d801d1	tbz	w17, #27, 0xfffff7f8b0dc
   0x0000fffff7f8b0a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8b0ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8b0b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8b0b4:	54000321	b.ne	0xfffff7f8b118  // b.any
   0x0000fffff7f8b0b8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8b0bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b0c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8b0c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8b0c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8b0cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8b0d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8b0d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8b0d8:	54000209	b.ls	0xfffff7f8b118  // b.plast
   0x0000fffff7f8b0dc:	36d8008d	tbz	w13, #27, 0xfffff7f8b0ec
   0x0000fffff7f8b0e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8b0e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8b0e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8b0ec:	36d80091	tbz	w17, #27, 0xfffff7f8b0fc
   0x0000fffff7f8b0f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b0f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8b0f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8b0fc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8b100:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8b104:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8b108:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8b10c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8b110:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8b114:	1400000e	b	0xfffff7f8b14c
   0x0000fffff7f8b118:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8b11c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b120:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b124:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b128:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f8b12c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b130:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b134:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8b138:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8b13c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b140:	d63f0200	blr	x16
   0x0000fffff7f8b144:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b148:	54006fa0	b.eq	0xfffff7f8bf3c  // b.none
   0x0000fffff7f8b14c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b150:	37d806a9	tbnz	w9, #27, 0xfffff7f8b224
   0x0000fffff7f8b154:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b158:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b15c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b160:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b164:	540001c1	b.ne	0xfffff7f8b19c  // b.any
   0x0000fffff7f8b168:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b16c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b170:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b174:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b178:	54000121	b.ne	0xfffff7f8b19c  // b.any
   0x0000fffff7f8b17c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b180:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8b184:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8b188:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b18c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b190:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8b194:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b198:	14000030	b	0xfffff7f8b258
   0x0000fffff7f8b19c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b1a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b1a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b1a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b1ac:	54000120	b.eq	0xfffff7f8b1d0  // b.none
   0x0000fffff7f8b1b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b1b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b1b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b1bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b1c0:	54000321	b.ne	0xfffff7f8b224  // b.any
   0x0000fffff7f8b1c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b1c8:	9e620120	scvtf	d0, x9
   0x0000fffff7f8b1cc:	14000002	b	0xfffff7f8b1d4
   0x0000fffff7f8b1d0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8b1d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b1d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b1dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b1e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b1e4:	54000120	b.eq	0xfffff7f8b208  // b.none
   0x0000fffff7f8b1e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b1ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b1f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b1f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b1f8:	54000161	b.ne	0xfffff7f8b224  // b.any
   0x0000fffff7f8b1fc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8b200:	9e620121	scvtf	d1, x9
   0x0000fffff7f8b204:	14000002	b	0xfffff7f8b20c
   0x0000fffff7f8b208:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8b20c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8b210:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8b214:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b218:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b21c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b220:	17ffffde	b	0xfffff7f8b198
   0x0000fffff7f8b224:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8b228:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b22c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b230:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b234:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f8b238:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b23c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b240:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8b244:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8b248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b24c:	d63f0200	blr	x16
   0x0000fffff7f8b250:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b254:	54006780	b.eq	0xfffff7f8bf44  // b.none
   0x0000fffff7f8b258:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8b25c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8b260:	540004a0	b.eq	0xfffff7f8b2f4  // b.none
   0x0000fffff7f8b264:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8b268:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8b26c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8b270:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8b274:	54000400	b.eq	0xfffff7f8b2f4  // b.none
   0x0000fffff7f8b278:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8b27c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8b280:	36d801d1	tbz	w17, #27, 0xfffff7f8b2b8
   0x0000fffff7f8b284:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8b288:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8b28c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8b290:	54000321	b.ne	0xfffff7f8b2f4  // b.any
   0x0000fffff7f8b294:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8b298:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b29c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8b2a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8b2a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8b2a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8b2ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8b2b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8b2b4:	54000209	b.ls	0xfffff7f8b2f4  // b.plast
   0x0000fffff7f8b2b8:	36d8008d	tbz	w13, #27, 0xfffff7f8b2c8
   0x0000fffff7f8b2bc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8b2c0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8b2c4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8b2c8:	36d80091	tbz	w17, #27, 0xfffff7f8b2d8
   0x0000fffff7f8b2cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b2d0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8b2d4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8b2d8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8b2dc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8b2e0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8b2e4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8b2e8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8b2ec:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8b2f0:	1400000e	b	0xfffff7f8b328
   0x0000fffff7f8b2f4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8b2f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b2fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b300:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b304:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f8b308:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b30c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b310:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8b314:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8b318:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b31c:	d63f0200	blr	x16
   0x0000fffff7f8b320:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b324:	54006140	b.eq	0xfffff7f8bf4c  // b.none
   0x0000fffff7f8b328:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b32c:	37d806a9	tbnz	w9, #27, 0xfffff7f8b400
   0x0000fffff7f8b330:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b334:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b338:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b33c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b340:	540001c1	b.ne	0xfffff7f8b378  // b.any
   0x0000fffff7f8b344:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b348:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b34c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b350:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b354:	54000121	b.ne	0xfffff7f8b378  // b.any
   0x0000fffff7f8b358:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b35c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8b360:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8b364:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b36c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8b370:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b374:	14000030	b	0xfffff7f8b434
   0x0000fffff7f8b378:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b37c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b380:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b384:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b388:	54000120	b.eq	0xfffff7f8b3ac  // b.none
   0x0000fffff7f8b38c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b390:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b398:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b39c:	54000321	b.ne	0xfffff7f8b400  // b.any
   0x0000fffff7f8b3a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b3a4:	9e620120	scvtf	d0, x9
   0x0000fffff7f8b3a8:	14000002	b	0xfffff7f8b3b0
   0x0000fffff7f8b3ac:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8b3b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b3b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b3b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b3bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b3c0:	54000120	b.eq	0xfffff7f8b3e4  // b.none
   0x0000fffff7f8b3c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b3c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b3cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b3d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b3d4:	54000161	b.ne	0xfffff7f8b400  // b.any
   0x0000fffff7f8b3d8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8b3dc:	9e620121	scvtf	d1, x9
   0x0000fffff7f8b3e0:	14000002	b	0xfffff7f8b3e8
   0x0000fffff7f8b3e4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8b3e8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8b3ec:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8b3f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b3f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b3f8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b3fc:	17ffffde	b	0xfffff7f8b374
   0x0000fffff7f8b400:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8b404:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b408:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b40c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b410:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f8b414:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b418:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b41c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8b420:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8b424:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b428:	d63f0200	blr	x16
   0x0000fffff7f8b42c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b430:	54005920	b.eq	0xfffff7f8bf54  // b.none
   0x0000fffff7f8b434:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8b438:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8b43c:	540004a0	b.eq	0xfffff7f8b4d0  // b.none
   0x0000fffff7f8b440:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8b444:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8b448:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8b44c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8b450:	54000400	b.eq	0xfffff7f8b4d0  // b.none
   0x0000fffff7f8b454:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8b458:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8b45c:	36d801d1	tbz	w17, #27, 0xfffff7f8b494
   0x0000fffff7f8b460:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8b464:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8b468:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8b46c:	54000321	b.ne	0xfffff7f8b4d0  // b.any
   0x0000fffff7f8b470:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8b474:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b478:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8b47c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8b480:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8b484:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8b488:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8b48c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8b490:	54000209	b.ls	0xfffff7f8b4d0  // b.plast
   0x0000fffff7f8b494:	36d8008d	tbz	w13, #27, 0xfffff7f8b4a4
   0x0000fffff7f8b498:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8b49c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8b4a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8b4a4:	36d80091	tbz	w17, #27, 0xfffff7f8b4b4
   0x0000fffff7f8b4a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b4ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8b4b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8b4b4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8b4b8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8b4bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8b4c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8b4c4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8b4c8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8b4cc:	1400000e	b	0xfffff7f8b504
   0x0000fffff7f8b4d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8b4d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b4d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b4dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b4e0:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f8b4e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b4e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b4ec:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8b4f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8b4f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b4f8:	d63f0200	blr	x16
   0x0000fffff7f8b4fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b500:	540052e0	b.eq	0xfffff7f8bf5c  // b.none
   0x0000fffff7f8b504:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b508:	37d806a9	tbnz	w9, #27, 0xfffff7f8b5dc
   0x0000fffff7f8b50c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b510:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b514:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b518:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b51c:	540001c1	b.ne	0xfffff7f8b554  // b.any
   0x0000fffff7f8b520:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b524:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b52c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b530:	54000121	b.ne	0xfffff7f8b554  // b.any
   0x0000fffff7f8b534:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b538:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8b53c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8b540:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b544:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b548:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8b54c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b550:	14000030	b	0xfffff7f8b610
   0x0000fffff7f8b554:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b558:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b55c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b560:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b564:	54000120	b.eq	0xfffff7f8b588  // b.none
   0x0000fffff7f8b568:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b56c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b574:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b578:	54000321	b.ne	0xfffff7f8b5dc  // b.any
   0x0000fffff7f8b57c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b580:	9e620120	scvtf	d0, x9
   0x0000fffff7f8b584:	14000002	b	0xfffff7f8b58c
   0x0000fffff7f8b588:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8b58c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b590:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b594:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b598:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b59c:	54000120	b.eq	0xfffff7f8b5c0  // b.none
   0x0000fffff7f8b5a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b5a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b5a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b5ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b5b0:	54000161	b.ne	0xfffff7f8b5dc  // b.any
   0x0000fffff7f8b5b4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8b5b8:	9e620121	scvtf	d1, x9
   0x0000fffff7f8b5bc:	14000002	b	0xfffff7f8b5c4
   0x0000fffff7f8b5c0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8b5c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8b5c8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8b5cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b5d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b5d4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b5d8:	17ffffde	b	0xfffff7f8b550
   0x0000fffff7f8b5dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8b5e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b5e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b5e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b5ec:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f8b5f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b5f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b5f8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8b5fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8b600:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b604:	d63f0200	blr	x16
   0x0000fffff7f8b608:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b60c:	54004ac0	b.eq	0xfffff7f8bf64  // b.none
   0x0000fffff7f8b610:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8b614:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8b618:	540004a0	b.eq	0xfffff7f8b6ac  // b.none
   0x0000fffff7f8b61c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8b620:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8b624:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8b628:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8b62c:	54000400	b.eq	0xfffff7f8b6ac  // b.none
   0x0000fffff7f8b630:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8b634:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8b638:	36d801d1	tbz	w17, #27, 0xfffff7f8b670
   0x0000fffff7f8b63c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8b640:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8b644:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8b648:	54000321	b.ne	0xfffff7f8b6ac  // b.any
   0x0000fffff7f8b64c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8b650:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b654:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8b658:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8b65c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8b660:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8b664:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8b668:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8b66c:	54000209	b.ls	0xfffff7f8b6ac  // b.plast
   0x0000fffff7f8b670:	36d8008d	tbz	w13, #27, 0xfffff7f8b680
   0x0000fffff7f8b674:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8b678:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8b67c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8b680:	36d80091	tbz	w17, #27, 0xfffff7f8b690
   0x0000fffff7f8b684:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b688:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8b68c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8b690:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8b694:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8b698:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8b69c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8b6a0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8b6a4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8b6a8:	1400000e	b	0xfffff7f8b6e0
   0x0000fffff7f8b6ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8b6b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b6b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b6b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b6bc:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f8b6c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b6c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b6c8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8b6cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8b6d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b6d4:	d63f0200	blr	x16
   0x0000fffff7f8b6d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b6dc:	54004480	b.eq	0xfffff7f8bf6c  // b.none
   0x0000fffff7f8b6e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b6e4:	37d806a9	tbnz	w9, #27, 0xfffff7f8b7b8
   0x0000fffff7f8b6e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b6ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b6f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b6f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b6f8:	540001c1	b.ne	0xfffff7f8b730  // b.any
   0x0000fffff7f8b6fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b700:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b704:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b708:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b70c:	54000121	b.ne	0xfffff7f8b730  // b.any
   0x0000fffff7f8b710:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b714:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8b718:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8b71c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b724:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8b728:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b72c:	14000030	b	0xfffff7f8b7ec
   0x0000fffff7f8b730:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b734:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b738:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b73c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b740:	54000120	b.eq	0xfffff7f8b764  // b.none
   0x0000fffff7f8b744:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b74c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b750:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b754:	54000321	b.ne	0xfffff7f8b7b8  // b.any
   0x0000fffff7f8b758:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b75c:	9e620120	scvtf	d0, x9
   0x0000fffff7f8b760:	14000002	b	0xfffff7f8b768
   0x0000fffff7f8b764:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8b768:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b76c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b770:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b774:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b778:	54000120	b.eq	0xfffff7f8b79c  // b.none
   0x0000fffff7f8b77c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b780:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b784:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b788:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b78c:	54000161	b.ne	0xfffff7f8b7b8  // b.any
   0x0000fffff7f8b790:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8b794:	9e620121	scvtf	d1, x9
   0x0000fffff7f8b798:	14000002	b	0xfffff7f8b7a0
   0x0000fffff7f8b79c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8b7a0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8b7a4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8b7a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b7ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b7b0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b7b4:	17ffffde	b	0xfffff7f8b72c
   0x0000fffff7f8b7b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8b7bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b7c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b7c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b7c8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f8b7cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b7d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b7d4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8b7d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8b7dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b7e0:	d63f0200	blr	x16
   0x0000fffff7f8b7e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b7e8:	54003c60	b.eq	0xfffff7f8bf74  // b.none
   0x0000fffff7f8b7ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8b7f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8b7f4:	540004a0	b.eq	0xfffff7f8b888  // b.none
   0x0000fffff7f8b7f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8b7fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8b800:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8b804:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8b808:	54000400	b.eq	0xfffff7f8b888  // b.none
   0x0000fffff7f8b80c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8b810:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8b814:	36d801d1	tbz	w17, #27, 0xfffff7f8b84c
   0x0000fffff7f8b818:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8b81c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8b820:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8b824:	54000321	b.ne	0xfffff7f8b888  // b.any
   0x0000fffff7f8b828:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8b82c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b830:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8b834:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8b838:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8b83c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8b840:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8b844:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8b848:	54000209	b.ls	0xfffff7f8b888  // b.plast
   0x0000fffff7f8b84c:	36d8008d	tbz	w13, #27, 0xfffff7f8b85c
   0x0000fffff7f8b850:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8b854:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8b858:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8b85c:	36d80091	tbz	w17, #27, 0xfffff7f8b86c
   0x0000fffff7f8b860:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8b864:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8b868:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8b86c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8b870:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8b874:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8b878:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8b87c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8b880:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8b884:	1400000e	b	0xfffff7f8b8bc
   0x0000fffff7f8b888:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8b88c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b890:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b894:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b898:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f8b89c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b8a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b8a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8b8a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8b8ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b8b0:	d63f0200	blr	x16
   0x0000fffff7f8b8b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b8b8:	54003620	b.eq	0xfffff7f8bf7c  // b.none
   0x0000fffff7f8b8bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b8c0:	37d806a9	tbnz	w9, #27, 0xfffff7f8b994
   0x0000fffff7f8b8c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b8c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b8cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b8d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b8d4:	540001c1	b.ne	0xfffff7f8b90c  // b.any
   0x0000fffff7f8b8d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b8dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b8e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b8e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b8e8:	54000121	b.ne	0xfffff7f8b90c  // b.any
   0x0000fffff7f8b8ec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b8f0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8b8f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8b8f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b8fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b900:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8b904:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b908:	14000030	b	0xfffff7f8b9c8
   0x0000fffff7f8b90c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b910:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b918:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b91c:	54000120	b.eq	0xfffff7f8b940  // b.none
   0x0000fffff7f8b920:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8b924:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b92c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b930:	54000321	b.ne	0xfffff7f8b994  // b.any
   0x0000fffff7f8b934:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8b938:	9e620120	scvtf	d0, x9
   0x0000fffff7f8b93c:	14000002	b	0xfffff7f8b944
   0x0000fffff7f8b940:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8b944:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b948:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b94c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b950:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b954:	54000120	b.eq	0xfffff7f8b978  // b.none
   0x0000fffff7f8b958:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8b95c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8b960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b964:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8b968:	54000161	b.ne	0xfffff7f8b994  // b.any
   0x0000fffff7f8b96c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8b970:	9e620121	scvtf	d1, x9
   0x0000fffff7f8b974:	14000002	b	0xfffff7f8b97c
   0x0000fffff7f8b978:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8b97c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8b980:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8b984:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8b988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8b98c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8b990:	17ffffde	b	0xfffff7f8b908
   0x0000fffff7f8b994:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8b998:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8b99c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8b9a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8b9a4:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f8b9a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8b9ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f8b9b0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8b9b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8b9b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8b9bc:	d63f0200	blr	x16
   0x0000fffff7f8b9c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8b9c4:	54002e00	b.eq	0xfffff7f8bf84  // b.none
   0x0000fffff7f8b9c8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8b9cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8b9d0:	540004a0	b.eq	0xfffff7f8ba64  // b.none
   0x0000fffff7f8b9d4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8b9d8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8b9dc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8b9e0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8b9e4:	54000400	b.eq	0xfffff7f8ba64  // b.none
   0x0000fffff7f8b9e8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8b9ec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8b9f0:	36d801d1	tbz	w17, #27, 0xfffff7f8ba28
   0x0000fffff7f8b9f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8b9f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8b9fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8ba00:	54000321	b.ne	0xfffff7f8ba64  // b.any
   0x0000fffff7f8ba04:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8ba08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ba0c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8ba10:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8ba14:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8ba18:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8ba1c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8ba20:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8ba24:	54000209	b.ls	0xfffff7f8ba64  // b.plast
   0x0000fffff7f8ba28:	36d8008d	tbz	w13, #27, 0xfffff7f8ba38
   0x0000fffff7f8ba2c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8ba30:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8ba34:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8ba38:	36d80091	tbz	w17, #27, 0xfffff7f8ba48
   0x0000fffff7f8ba3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ba40:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8ba44:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8ba48:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8ba4c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8ba50:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8ba54:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8ba58:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8ba5c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8ba60:	1400000e	b	0xfffff7f8ba98
   0x0000fffff7f8ba64:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8ba68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ba6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ba70:	aa1503e2	mov	x2, x21
   0x0000fffff7f8ba74:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f8ba78:	aa1403e4	mov	x4, x20
   0x0000fffff7f8ba7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8ba80:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8ba84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8ba88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ba8c:	d63f0200	blr	x16
   0x0000fffff7f8ba90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ba94:	540027c0	b.eq	0xfffff7f8bf8c  // b.none
   0x0000fffff7f8ba98:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ba9c:	37d806a9	tbnz	w9, #27, 0xfffff7f8bb70
   0x0000fffff7f8baa0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8baa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8baa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8baac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bab0:	540001c1	b.ne	0xfffff7f8bae8  // b.any
   0x0000fffff7f8bab4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8bab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8babc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bac4:	54000121	b.ne	0xfffff7f8bae8  // b.any
   0x0000fffff7f8bac8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8bacc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8bad0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8bad4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8bad8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8badc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8bae0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8bae4:	14000030	b	0xfffff7f8bba4
   0x0000fffff7f8bae8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8baec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8baf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8baf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8baf8:	54000120	b.eq	0xfffff7f8bb1c  // b.none
   0x0000fffff7f8bafc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8bb00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8bb04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bb08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bb0c:	54000321	b.ne	0xfffff7f8bb70  // b.any
   0x0000fffff7f8bb10:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8bb14:	9e620120	scvtf	d0, x9
   0x0000fffff7f8bb18:	14000002	b	0xfffff7f8bb20
   0x0000fffff7f8bb1c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8bb20:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8bb24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8bb28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bb2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bb30:	54000120	b.eq	0xfffff7f8bb54  // b.none
   0x0000fffff7f8bb34:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8bb38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8bb3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bb40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bb44:	54000161	b.ne	0xfffff7f8bb70  // b.any
   0x0000fffff7f8bb48:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8bb4c:	9e620121	scvtf	d1, x9
   0x0000fffff7f8bb50:	14000002	b	0xfffff7f8bb58
   0x0000fffff7f8bb54:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8bb58:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8bb5c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8bb60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8bb64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bb68:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8bb6c:	17ffffde	b	0xfffff7f8bae4
   0x0000fffff7f8bb70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8bb74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8bb78:	aa1303e1	mov	x1, x19
   0x0000fffff7f8bb7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8bb80:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f8bb84:	aa1403e4	mov	x4, x20
   0x0000fffff7f8bb88:	aa1603e5	mov	x5, x22
   0x0000fffff7f8bb8c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8bb90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8bb94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8bb98:	d63f0200	blr	x16
   0x0000fffff7f8bb9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8bba0:	54001fa0	b.eq	0xfffff7f8bf94  // b.none
   0x0000fffff7f8bba4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8bba8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8bbac:	540004a0	b.eq	0xfffff7f8bc40  // b.none
   0x0000fffff7f8bbb0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8bbb4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8bbb8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8bbbc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8bbc0:	54000400	b.eq	0xfffff7f8bc40  // b.none
   0x0000fffff7f8bbc4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8bbc8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8bbcc:	36d801d1	tbz	w17, #27, 0xfffff7f8bc04
   0x0000fffff7f8bbd0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8bbd4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8bbd8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8bbdc:	54000321	b.ne	0xfffff7f8bc40  // b.any
   0x0000fffff7f8bbe0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8bbe4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8bbe8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8bbec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8bbf0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8bbf4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8bbf8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8bbfc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8bc00:	54000209	b.ls	0xfffff7f8bc40  // b.plast
   0x0000fffff7f8bc04:	36d8008d	tbz	w13, #27, 0xfffff7f8bc14
   0x0000fffff7f8bc08:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8bc0c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8bc10:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8bc14:	36d80091	tbz	w17, #27, 0xfffff7f8bc24
   0x0000fffff7f8bc18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8bc1c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8bc20:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8bc24:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8bc28:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8bc2c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8bc30:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8bc34:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8bc38:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8bc3c:	1400000e	b	0xfffff7f8bc74
   0x0000fffff7f8bc40:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8bc44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8bc48:	aa1303e1	mov	x1, x19
   0x0000fffff7f8bc4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8bc50:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f8bc54:	aa1403e4	mov	x4, x20
   0x0000fffff7f8bc58:	aa1603e5	mov	x5, x22
   0x0000fffff7f8bc5c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8bc60:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8bc64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8bc68:	d63f0200	blr	x16
   0x0000fffff7f8bc6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8bc70:	54001960	b.eq	0xfffff7f8bf9c  // b.none
   0x0000fffff7f8bc74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8bc78:	37d806a9	tbnz	w9, #27, 0xfffff7f8bd4c
   0x0000fffff7f8bc7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8bc80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8bc84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bc88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bc8c:	540001c1	b.ne	0xfffff7f8bcc4  // b.any
   0x0000fffff7f8bc90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8bc94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8bc98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bc9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bca0:	54000121	b.ne	0xfffff7f8bcc4  // b.any
   0x0000fffff7f8bca4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8bca8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8bcac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8bcb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8bcb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bcb8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8bcbc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8bcc0:	14000030	b	0xfffff7f8bd80
   0x0000fffff7f8bcc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8bcc8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8bccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bcd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bcd4:	54000120	b.eq	0xfffff7f8bcf8  // b.none
   0x0000fffff7f8bcd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8bcdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8bce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bce4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bce8:	54000321	b.ne	0xfffff7f8bd4c  // b.any
   0x0000fffff7f8bcec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8bcf0:	9e620120	scvtf	d0, x9
   0x0000fffff7f8bcf4:	14000002	b	0xfffff7f8bcfc
   0x0000fffff7f8bcf8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8bcfc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8bd00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8bd04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bd08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bd0c:	54000120	b.eq	0xfffff7f8bd30  // b.none
   0x0000fffff7f8bd10:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8bd14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8bd18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bd1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bd20:	54000161	b.ne	0xfffff7f8bd4c  // b.any
   0x0000fffff7f8bd24:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8bd28:	9e620121	scvtf	d1, x9
   0x0000fffff7f8bd2c:	14000002	b	0xfffff7f8bd34
   0x0000fffff7f8bd30:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8bd34:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8bd38:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8bd3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8bd40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bd44:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8bd48:	17ffffde	b	0xfffff7f8bcc0
   0x0000fffff7f8bd4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8bd50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8bd54:	aa1303e1	mov	x1, x19
   0x0000fffff7f8bd58:	aa1503e2	mov	x2, x21
   0x0000fffff7f8bd5c:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f8bd60:	aa1403e4	mov	x4, x20
   0x0000fffff7f8bd64:	aa1603e5	mov	x5, x22
   0x0000fffff7f8bd68:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8bd6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8bd70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8bd74:	d63f0200	blr	x16
   0x0000fffff7f8bd78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8bd7c:	54001140	b.eq	0xfffff7f8bfa4  // b.none
   0x0000fffff7f8bd80:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8bd84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8bd88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8bd8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8bd90:	54000381	b.ne	0xfffff7f8be00  // b.any
   0x0000fffff7f8bd94:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f8bd98:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f8bd9c:	8b0a018b	add	x11, x12, x10
   0x0000fffff7f8bda0:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f8bda4:	36d80211	tbz	w17, #27, 0xfffff7f8bde4
   0x0000fffff7f8bda8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8bdac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8bdb0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8bdb4:	54000261	b.ne	0xfffff7f8be00  // b.any
   0x0000fffff7f8bdb8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8bdbc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8bdc0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8bdc4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8bdc8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8bdcc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8bdd0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8bdd4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8bdd8:	54000149	b.ls	0xfffff7f8be00  // b.plast
   0x0000fffff7f8bddc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8bde0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8bde4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8bde8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8bdec:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8bdf0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8bdf4:	f9002e6b	str	x11, [x19, #88]
   0x0000fffff7f8bdf8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f8bdfc:	1400000e	b	0xfffff7f8be34
   0x0000fffff7f8be00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8be04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8be08:	aa1303e1	mov	x1, x19
   0x0000fffff7f8be0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8be10:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f8be14:	aa1403e4	mov	x4, x20
   0x0000fffff7f8be18:	aa1603e5	mov	x5, x22
   0x0000fffff7f8be1c:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f8be20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8be24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8be28:	d63f0200	blr	x16
   0x0000fffff7f8be2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8be30:	54000be0	b.eq	0xfffff7f8bfac  // b.none
   0x0000fffff7f8be34:	17fff8eb	b	0xfffff7f8a1e0
   0x0000fffff7f8be38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8be3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8be40:	aa1303e1	mov	x1, x19
   0x0000fffff7f8be44:	aa1503e2	mov	x2, x21
   0x0000fffff7f8be48:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f8be4c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8be50:	aa1603e5	mov	x5, x22
   0x0000fffff7f8be54:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f8be58:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8be5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8be60:	d63f0200	blr	x16
   0x0000fffff7f8be64:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f8be68:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8be6c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8be70:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8be74:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f8be78:	d65f03c0	ret
   0x0000fffff7f8be7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8be80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8be84:	b900028a	str	w10, [x20]
   0x0000fffff7f8be88:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8be8c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f8be90:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8be94:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8be98:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8be9c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8bea0:	d65f03c0	ret
   0x0000fffff7f8bea4:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f8bea8:	17fffff5	b	0xfffff7f8be7c
   0x0000fffff7f8beac:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f8beb0:	17fffff3	b	0xfffff7f8be7c
   0x0000fffff7f8beb4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f8beb8:	17fffff1	b	0xfffff7f8be7c
   0x0000fffff7f8bebc:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f8bec0:	17ffffef	b	0xfffff7f8be7c
   0x0000fffff7f8bec4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f8bec8:	17ffffed	b	0xfffff7f8be7c
   0x0000fffff7f8becc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f8bed0:	17ffffeb	b	0xfffff7f8be7c
   0x0000fffff7f8bed4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f8bed8:	17ffffe9	b	0xfffff7f8be7c
   0x0000fffff7f8bedc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f8bee0:	17ffffe7	b	0xfffff7f8be7c
   0x0000fffff7f8bee4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f8bee8:	17ffffe5	b	0xfffff7f8be7c
   0x0000fffff7f8beec:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f8bef0:	17ffffe3	b	0xfffff7f8be7c
   0x0000fffff7f8bef4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f8bef8:	17ffffe1	b	0xfffff7f8be7c
   0x0000fffff7f8befc:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f8bf00:	17ffffdf	b	0xfffff7f8be7c
   0x0000fffff7f8bf04:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f8bf08:	17ffffdd	b	0xfffff7f8be7c
   0x0000fffff7f8bf0c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f8bf10:	17ffffdb	b	0xfffff7f8be7c
   0x0000fffff7f8bf14:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f8bf18:	17ffffd9	b	0xfffff7f8be7c
   0x0000fffff7f8bf1c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f8bf20:	17ffffd7	b	0xfffff7f8be7c
   0x0000fffff7f8bf24:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f8bf28:	17ffffd5	b	0xfffff7f8be7c
   0x0000fffff7f8bf2c:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f8bf30:	17ffffd3	b	0xfffff7f8be7c
   0x0000fffff7f8bf34:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f8bf38:	17ffffd1	b	0xfffff7f8be7c
   0x0000fffff7f8bf3c:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f8bf40:	17ffffcf	b	0xfffff7f8be7c
   0x0000fffff7f8bf44:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f8bf48:	17ffffcd	b	0xfffff7f8be7c
   0x0000fffff7f8bf4c:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f8bf50:	17ffffcb	b	0xfffff7f8be7c
   0x0000fffff7f8bf54:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f8bf58:	17ffffc9	b	0xfffff7f8be7c
   0x0000fffff7f8bf5c:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f8bf60:	17ffffc7	b	0xfffff7f8be7c
   0x0000fffff7f8bf64:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f8bf68:	17ffffc5	b	0xfffff7f8be7c
   0x0000fffff7f8bf6c:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f8bf70:	17ffffc3	b	0xfffff7f8be7c
   0x0000fffff7f8bf74:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f8bf78:	17ffffc1	b	0xfffff7f8be7c
   0x0000fffff7f8bf7c:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f8bf80:	17ffffbf	b	0xfffff7f8be7c
   0x0000fffff7f8bf84:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f8bf88:	17ffffbd	b	0xfffff7f8be7c
   0x0000fffff7f8bf8c:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f8bf90:	17ffffbb	b	0xfffff7f8be7c
   0x0000fffff7f8bf94:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f8bf98:	17ffffb9	b	0xfffff7f8be7c
   0x0000fffff7f8bf9c:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f8bfa0:	17ffffb7	b	0xfffff7f8be7c
   0x0000fffff7f8bfa4:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f8bfa8:	17ffffb5	b	0xfffff7f8be7c
   0x0000fffff7f8bfac:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f8bfb0:	17ffffb3	b	0xfffff7f8be7c
   0x0000fffff7f8bfb4:	00000000	udf	#0
   0x0000fffff7f8bfb8:	00000000	udf	#0
   0x0000fffff7f8bfbc:	00000000	udf	#0
   0x0000fffff7f8bfc0:	00000000	udf	#0
   0x0000fffff7f8bfc4:	00000000	udf	#0
   0x0000fffff7f8bfc8:	00000000	udf	#0
   0x0000fffff7f8bfcc:	00000000	udf	#0
   0x0000fffff7f8bfd0:	00000000	udf	#0
   0x0000fffff7f8bfd4:	00000000	udf	#0
   0x0000fffff7f8bfd8:	00000000	udf	#0
   0x0000fffff7f8bfdc:	00000000	udf	#0
   0x0000fffff7f8bfe0:	00000000	udf	#0
   0x0000fffff7f8bfe4:	00000000	udf	#0
   0x0000fffff7f8bfe8:	00000000	udf	#0
   0x0000fffff7f8bfec:	00000000	udf	#0
   0x0000fffff7f8bff0:	00000000	udf	#0
   0x0000fffff7f8bff4:	00000000	udf	#0
   0x0000fffff7f8bff8:	00000000	udf	#0
   0x0000fffff7f8bffc:	00000000	udf	#0
End of assembler dump.
