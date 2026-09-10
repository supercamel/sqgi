Dump of assembler code from 0xfffff7d7a000 to 0xfffff7d7c000:
   0x0000fffff7d7a000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7d7a004:	910003fd	mov	x29, sp
   0x0000fffff7d7a008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7d7a00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7d7a010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7d7a014:	aa0003f3	mov	x19, x0
   0x0000fffff7d7a018:	aa0103f4	mov	x20, x1
   0x0000fffff7d7a01c:	aa0203f5	mov	x21, x2
   0x0000fffff7d7a020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7d7a024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7d7a028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7d7a02c:	f90003e9	str	x9, [sp]
   0x0000fffff7d7a030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7d7a034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7d7a038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7d7a03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d7a040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a044:	d63f0200	blr	x16
   0x0000fffff7d7a048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7d7a04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7d7a050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7d7a054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7d7a058:	14000001	b	0xfffff7d7a05c
   0x0000fffff7d7a05c:	14000001	b	0xfffff7d7a060
   0x0000fffff7d7a060:	14000001	b	0xfffff7d7a064
   0x0000fffff7d7a064:	14000001	b	0xfffff7d7a068
   0x0000fffff7d7a068:	14000001	b	0xfffff7d7a06c
   0x0000fffff7d7a06c:	14000001	b	0xfffff7d7a070
   0x0000fffff7d7a070:	14000001	b	0xfffff7d7a074
   0x0000fffff7d7a074:	14000001	b	0xfffff7d7a078
   0x0000fffff7d7a078:	14000001	b	0xfffff7d7a07c
   0x0000fffff7d7a07c:	14000001	b	0xfffff7d7a080
   0x0000fffff7d7a080:	14000001	b	0xfffff7d7a084
   0x0000fffff7d7a084:	14000001	b	0xfffff7d7a088
   0x0000fffff7d7a088:	14000001	b	0xfffff7d7a08c
   0x0000fffff7d7a08c:	14000001	b	0xfffff7d7a090
   0x0000fffff7d7a090:	14000001	b	0xfffff7d7a094
   0x0000fffff7d7a094:	14000001	b	0xfffff7d7a098
   0x0000fffff7d7a098:	14000001	b	0xfffff7d7a09c
   0x0000fffff7d7a09c:	14000001	b	0xfffff7d7a0a0
   0x0000fffff7d7a0a0:	14000001	b	0xfffff7d7a0a4
   0x0000fffff7d7a0a4:	14000001	b	0xfffff7d7a0a8
   0x0000fffff7d7a0a8:	14000001	b	0xfffff7d7a0ac
   0x0000fffff7d7a0ac:	14000001	b	0xfffff7d7a0b0
   0x0000fffff7d7a0b0:	14000001	b	0xfffff7d7a0b4
   0x0000fffff7d7a0b4:	14000001	b	0xfffff7d7a0b8
   0x0000fffff7d7a0b8:	14000001	b	0xfffff7d7a0bc
   0x0000fffff7d7a0bc:	14000001	b	0xfffff7d7a0c0
   0x0000fffff7d7a0c0:	14000001	b	0xfffff7d7a0c4
   0x0000fffff7d7a0c4:	14000001	b	0xfffff7d7a0c8
   0x0000fffff7d7a0c8:	14000001	b	0xfffff7d7a0cc
   0x0000fffff7d7a0cc:	14000001	b	0xfffff7d7a0d0
   0x0000fffff7d7a0d0:	14000001	b	0xfffff7d7a0d4
   0x0000fffff7d7a0d4:	14000001	b	0xfffff7d7a0d8
   0x0000fffff7d7a0d8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7d7a0dc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7d7a0e0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7d7a0e4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7d7a0e8:	36d80211	tbz	w17, #27, 0xfffff7d7a128
   0x0000fffff7d7a0ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7a0f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7a0f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7a0f8:	540001e1	b.ne	0xfffff7d7a134  // b.any
   0x0000fffff7d7a0fc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7d7a100:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a104:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7a108:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7a10c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7a110:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7a114:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7a118:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7a11c:	540000c9	b.ls	0xfffff7d7a134  // b.plast
   0x0000fffff7d7a120:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7a124:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7a128:	f900266c	str	x12, [x19, #72]
   0x0000fffff7d7a12c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7d7a130:	1400000e	b	0xfffff7d7a168
   0x0000fffff7d7a134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7a138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a13c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a140:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a144:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7d7a148:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a14c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a150:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7d7a154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7a158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a15c:	d63f0200	blr	x16
   0x0000fffff7d7a160:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a164:	5400e940	b.eq	0xfffff7d7be8c  // b.none
   0x0000fffff7d7a168:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7d7a16c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7d7a170:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7d7a174:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7d7a178:	36d80211	tbz	w17, #27, 0xfffff7d7a1b8
   0x0000fffff7d7a17c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7a180:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7a184:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7a188:	540001e1	b.ne	0xfffff7d7a1c4  // b.any
   0x0000fffff7d7a18c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7d7a190:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a194:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7a198:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7a19c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7a1a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7a1a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7a1a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7a1ac:	540000c9	b.ls	0xfffff7d7a1c4  // b.plast
   0x0000fffff7d7a1b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7a1b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7a1b8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7d7a1bc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7d7a1c0:	1400000e	b	0xfffff7d7a1f8
   0x0000fffff7d7a1c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7a1c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a1cc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a1d0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a1d4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7d7a1d8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a1dc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a1e0:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7d7a1e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7a1e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a1ec:	d63f0200	blr	x16
   0x0000fffff7d7a1f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a1f4:	5400e500	b.eq	0xfffff7d7be94  // b.none
   0x0000fffff7d7a1f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7a1fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a200:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a204:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a208:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7d7a20c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a210:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a214:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7d7a218:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7a21c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a220:	d63f0200	blr	x16
   0x0000fffff7d7a224:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a228:	5400e3a0	b.eq	0xfffff7d7be9c  // b.none
   0x0000fffff7d7a22c:	f100041f	cmp	x0, #0x1
   0x0000fffff7d7a230:	5400df80	b.eq	0xfffff7d7be20  // b.none
   0x0000fffff7d7a234:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7d7a238:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7d7a23c:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7d7a240:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7d7a244:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7d7a248:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7d7a24c:	36d801d1	tbz	w17, #27, 0xfffff7d7a284
   0x0000fffff7d7a250:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7a254:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7a258:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7a25c:	54000281	b.ne	0xfffff7d7a2ac  // b.any
   0x0000fffff7d7a260:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7a264:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a268:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7a26c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7a270:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7a274:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7a278:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7a27c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7a280:	54000169	b.ls	0xfffff7d7a2ac  // b.plast
   0x0000fffff7d7a284:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7a288:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7a28c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7a290:	36d80091	tbz	w17, #27, 0xfffff7d7a2a0
   0x0000fffff7d7a294:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a298:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7a29c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7a2a0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7a2a4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7a2a8:	1400000e	b	0xfffff7d7a2e0
   0x0000fffff7d7a2ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7a2b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a2b4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a2b8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a2bc:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7d7a2c0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a2c4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a2c8:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7d7a2cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7a2d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a2d4:	d63f0200	blr	x16
   0x0000fffff7d7a2d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a2dc:	5400de40	b.eq	0xfffff7d7bea4  // b.none
   0x0000fffff7d7a2e0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7a2e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7a2e8:	540003a0	b.eq	0xfffff7d7a35c  // b.none
   0x0000fffff7d7a2ec:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7d7a2f0:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7d7a2f4:	b9400171	ldr	w17, [x11]
   0x0000fffff7d7a2f8:	36d801d1	tbz	w17, #27, 0xfffff7d7a330
   0x0000fffff7d7a2fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7a300:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7a304:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7a308:	540002a1	b.ne	0xfffff7d7a35c  // b.any
   0x0000fffff7d7a30c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7d7a310:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a314:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7a318:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7a31c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7a320:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7a324:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7a328:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7a32c:	54000189	b.ls	0xfffff7d7a35c  // b.plast
   0x0000fffff7d7a330:	36d8008d	tbz	w13, #27, 0xfffff7d7a340
   0x0000fffff7d7a334:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7a338:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7a33c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7a340:	36d80091	tbz	w17, #27, 0xfffff7d7a350
   0x0000fffff7d7a344:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a348:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7a34c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7a350:	f900056c	str	x12, [x11, #8]
   0x0000fffff7d7a354:	b900016d	str	w13, [x11]
   0x0000fffff7d7a358:	1400000e	b	0xfffff7d7a390
   0x0000fffff7d7a35c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7a360:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a364:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a368:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a36c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7d7a370:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a374:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a378:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7d7a37c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7a380:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a384:	d63f0200	blr	x16
   0x0000fffff7d7a388:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a38c:	5400d900	b.eq	0xfffff7d7beac  // b.none
   0x0000fffff7d7a390:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7a394:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7a398:	540004a0	b.eq	0xfffff7d7a42c  // b.none
   0x0000fffff7d7a39c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7a3a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7a3a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7a3a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7a3ac:	54000400	b.eq	0xfffff7d7a42c  // b.none
   0x0000fffff7d7a3b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7a3b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7a3b8:	36d801d1	tbz	w17, #27, 0xfffff7d7a3f0
   0x0000fffff7d7a3bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7a3c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7a3c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7a3c8:	54000321	b.ne	0xfffff7d7a42c  // b.any
   0x0000fffff7d7a3cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7a3d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a3d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7a3d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7a3dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7a3e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7a3e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7a3e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7a3ec:	54000209	b.ls	0xfffff7d7a42c  // b.plast
   0x0000fffff7d7a3f0:	36d8008d	tbz	w13, #27, 0xfffff7d7a400
   0x0000fffff7d7a3f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7a3f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7a3fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7a400:	36d80091	tbz	w17, #27, 0xfffff7d7a410
   0x0000fffff7d7a404:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a408:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7a40c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7a410:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7a414:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7a418:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7a41c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7a420:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7a424:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7a428:	1400000e	b	0xfffff7d7a460
   0x0000fffff7d7a42c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7a430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a434:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a438:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a43c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7d7a440:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a444:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a448:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7a44c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7a450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a454:	d63f0200	blr	x16
   0x0000fffff7d7a458:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a45c:	5400d2c0	b.eq	0xfffff7d7beb4  // b.none
   0x0000fffff7d7a460:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a464:	37d806a9	tbnz	w9, #27, 0xfffff7d7a538
   0x0000fffff7d7a468:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a46c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a470:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a474:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a478:	540001c1	b.ne	0xfffff7d7a4b0  // b.any
   0x0000fffff7d7a47c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7a480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a488:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a48c:	54000121	b.ne	0xfffff7d7a4b0  // b.any
   0x0000fffff7d7a490:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7a494:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7a498:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7a49c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a4a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a4a4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7a4a8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7a4ac:	14000030	b	0xfffff7d7a56c
   0x0000fffff7d7a4b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a4b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7a4b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a4bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a4c0:	54000120	b.eq	0xfffff7d7a4e4  // b.none
   0x0000fffff7d7a4c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a4c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a4cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a4d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a4d4:	54000321	b.ne	0xfffff7d7a538  // b.any
   0x0000fffff7d7a4d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7a4dc:	9e620120	scvtf	d0, x9
   0x0000fffff7d7a4e0:	14000002	b	0xfffff7d7a4e8
   0x0000fffff7d7a4e4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7a4e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7a4ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7a4f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a4f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a4f8:	54000120	b.eq	0xfffff7d7a51c  // b.none
   0x0000fffff7d7a4fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7a500:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a508:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a50c:	54000161	b.ne	0xfffff7d7a538  // b.any
   0x0000fffff7d7a510:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7a514:	9e620121	scvtf	d1, x9
   0x0000fffff7d7a518:	14000002	b	0xfffff7d7a520
   0x0000fffff7d7a51c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7a520:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7a524:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7a528:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7a52c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a530:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7a534:	17ffffde	b	0xfffff7d7a4ac
   0x0000fffff7d7a538:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7a53c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a540:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a544:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a548:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7d7a54c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a550:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a554:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7a558:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7a55c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a560:	d63f0200	blr	x16
   0x0000fffff7d7a564:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a568:	5400caa0	b.eq	0xfffff7d7bebc  // b.none
   0x0000fffff7d7a56c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7a570:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7a574:	540004a0	b.eq	0xfffff7d7a608  // b.none
   0x0000fffff7d7a578:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7a57c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7a580:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7a584:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7a588:	54000400	b.eq	0xfffff7d7a608  // b.none
   0x0000fffff7d7a58c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7a590:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7a594:	36d801d1	tbz	w17, #27, 0xfffff7d7a5cc
   0x0000fffff7d7a598:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7a59c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7a5a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7a5a4:	54000321	b.ne	0xfffff7d7a608  // b.any
   0x0000fffff7d7a5a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7a5ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a5b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7a5b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7a5b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7a5bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7a5c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7a5c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7a5c8:	54000209	b.ls	0xfffff7d7a608  // b.plast
   0x0000fffff7d7a5cc:	36d8008d	tbz	w13, #27, 0xfffff7d7a5dc
   0x0000fffff7d7a5d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7a5d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7a5d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7a5dc:	36d80091	tbz	w17, #27, 0xfffff7d7a5ec
   0x0000fffff7d7a5e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a5e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7a5e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7a5ec:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7a5f0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7a5f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7a5f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7a5fc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7a600:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7a604:	1400000e	b	0xfffff7d7a63c
   0x0000fffff7d7a608:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7a60c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a610:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a614:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a618:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7d7a61c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a620:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a624:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7a628:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7a62c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a630:	d63f0200	blr	x16
   0x0000fffff7d7a634:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a638:	5400c460	b.eq	0xfffff7d7bec4  // b.none
   0x0000fffff7d7a63c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a640:	37d806a9	tbnz	w9, #27, 0xfffff7d7a714
   0x0000fffff7d7a644:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a648:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a64c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a650:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a654:	540001c1	b.ne	0xfffff7d7a68c  // b.any
   0x0000fffff7d7a658:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7a65c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a664:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a668:	54000121	b.ne	0xfffff7d7a68c  // b.any
   0x0000fffff7d7a66c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7a670:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7a674:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7a678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a680:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7a684:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7a688:	14000030	b	0xfffff7d7a748
   0x0000fffff7d7a68c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a690:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7a694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a698:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a69c:	54000120	b.eq	0xfffff7d7a6c0  // b.none
   0x0000fffff7d7a6a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a6a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a6a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a6ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a6b0:	54000321	b.ne	0xfffff7d7a714  // b.any
   0x0000fffff7d7a6b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7a6b8:	9e620120	scvtf	d0, x9
   0x0000fffff7d7a6bc:	14000002	b	0xfffff7d7a6c4
   0x0000fffff7d7a6c0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7a6c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7a6c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7a6cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a6d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a6d4:	54000120	b.eq	0xfffff7d7a6f8  // b.none
   0x0000fffff7d7a6d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7a6dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a6e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a6e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a6e8:	54000161	b.ne	0xfffff7d7a714  // b.any
   0x0000fffff7d7a6ec:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7a6f0:	9e620121	scvtf	d1, x9
   0x0000fffff7d7a6f4:	14000002	b	0xfffff7d7a6fc
   0x0000fffff7d7a6f8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7a6fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7a700:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7a704:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7a708:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a70c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7a710:	17ffffde	b	0xfffff7d7a688
   0x0000fffff7d7a714:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7a718:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a71c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a720:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a724:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7d7a728:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a72c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a730:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7a734:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7a738:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a73c:	d63f0200	blr	x16
   0x0000fffff7d7a740:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a744:	5400bc40	b.eq	0xfffff7d7becc  // b.none
   0x0000fffff7d7a748:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7a74c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7a750:	540004a0	b.eq	0xfffff7d7a7e4  // b.none
   0x0000fffff7d7a754:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7a758:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7a75c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7a760:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7a764:	54000400	b.eq	0xfffff7d7a7e4  // b.none
   0x0000fffff7d7a768:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7a76c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7a770:	36d801d1	tbz	w17, #27, 0xfffff7d7a7a8
   0x0000fffff7d7a774:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7a778:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7a77c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7a780:	54000321	b.ne	0xfffff7d7a7e4  // b.any
   0x0000fffff7d7a784:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7a788:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a78c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7a790:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7a794:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7a798:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7a79c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7a7a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7a7a4:	54000209	b.ls	0xfffff7d7a7e4  // b.plast
   0x0000fffff7d7a7a8:	36d8008d	tbz	w13, #27, 0xfffff7d7a7b8
   0x0000fffff7d7a7ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7a7b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7a7b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7a7b8:	36d80091	tbz	w17, #27, 0xfffff7d7a7c8
   0x0000fffff7d7a7bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a7c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7a7c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7a7c8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7a7cc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7a7d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7a7d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7a7d8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7a7dc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7a7e0:	1400000e	b	0xfffff7d7a818
   0x0000fffff7d7a7e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7a7e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a7ec:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a7f0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a7f4:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7d7a7f8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a7fc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a800:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7a804:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7a808:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a80c:	d63f0200	blr	x16
   0x0000fffff7d7a810:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a814:	5400b600	b.eq	0xfffff7d7bed4  // b.none
   0x0000fffff7d7a818:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a81c:	37d806a9	tbnz	w9, #27, 0xfffff7d7a8f0
   0x0000fffff7d7a820:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a82c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a830:	540001c1	b.ne	0xfffff7d7a868  // b.any
   0x0000fffff7d7a834:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7a838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a83c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a840:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a844:	54000121	b.ne	0xfffff7d7a868  // b.any
   0x0000fffff7d7a848:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7a84c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7a850:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7a854:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a858:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a85c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7a860:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7a864:	14000030	b	0xfffff7d7a924
   0x0000fffff7d7a868:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a86c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7a870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a874:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a878:	54000120	b.eq	0xfffff7d7a89c  // b.none
   0x0000fffff7d7a87c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a888:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a88c:	54000321	b.ne	0xfffff7d7a8f0  // b.any
   0x0000fffff7d7a890:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7a894:	9e620120	scvtf	d0, x9
   0x0000fffff7d7a898:	14000002	b	0xfffff7d7a8a0
   0x0000fffff7d7a89c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7a8a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7a8a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7a8a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a8ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a8b0:	54000120	b.eq	0xfffff7d7a8d4  // b.none
   0x0000fffff7d7a8b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7a8b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7a8bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a8c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7a8c4:	54000161	b.ne	0xfffff7d7a8f0  // b.any
   0x0000fffff7d7a8c8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7a8cc:	9e620121	scvtf	d1, x9
   0x0000fffff7d7a8d0:	14000002	b	0xfffff7d7a8d8
   0x0000fffff7d7a8d4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7a8d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7a8dc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7a8e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7a8e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7a8e8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7a8ec:	17ffffde	b	0xfffff7d7a864
   0x0000fffff7d7a8f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7a8f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a8f8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a8fc:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a900:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7d7a904:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a908:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a90c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7a910:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7a914:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a918:	d63f0200	blr	x16
   0x0000fffff7d7a91c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a920:	5400ade0	b.eq	0xfffff7d7bedc  // b.none
   0x0000fffff7d7a924:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7a928:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7a92c:	540004a0	b.eq	0xfffff7d7a9c0  // b.none
   0x0000fffff7d7a930:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7a934:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7a938:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7a93c:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7a940:	54000400	b.eq	0xfffff7d7a9c0  // b.none
   0x0000fffff7d7a944:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7a948:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7a94c:	36d801d1	tbz	w17, #27, 0xfffff7d7a984
   0x0000fffff7d7a950:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7a954:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7a958:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7a95c:	54000321	b.ne	0xfffff7d7a9c0  // b.any
   0x0000fffff7d7a960:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7a964:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a968:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7a96c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7a970:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7a974:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7a978:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7a97c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7a980:	54000209	b.ls	0xfffff7d7a9c0  // b.plast
   0x0000fffff7d7a984:	36d8008d	tbz	w13, #27, 0xfffff7d7a994
   0x0000fffff7d7a988:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7a98c:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7a990:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7a994:	36d80091	tbz	w17, #27, 0xfffff7d7a9a4
   0x0000fffff7d7a998:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7a99c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7a9a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7a9a4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7a9a8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7a9ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7a9b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7a9b4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7a9b8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7a9bc:	1400000e	b	0xfffff7d7a9f4
   0x0000fffff7d7a9c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7a9c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7a9c8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7a9cc:	aa1503e2	mov	x2, x21
   0x0000fffff7d7a9d0:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7d7a9d4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7a9d8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7a9dc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7a9e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7a9e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7a9e8:	d63f0200	blr	x16
   0x0000fffff7d7a9ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7a9f0:	5400a7a0	b.eq	0xfffff7d7bee4  // b.none
   0x0000fffff7d7a9f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7a9f8:	37d806a9	tbnz	w9, #27, 0xfffff7d7aacc
   0x0000fffff7d7a9fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7aa00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7aa04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aa08:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7aa0c:	540001c1	b.ne	0xfffff7d7aa44  // b.any
   0x0000fffff7d7aa10:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7aa14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7aa18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aa1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7aa20:	54000121	b.ne	0xfffff7d7aa44  // b.any
   0x0000fffff7d7aa24:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7aa28:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7aa2c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7aa30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7aa34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aa38:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7aa3c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7aa40:	14000030	b	0xfffff7d7ab00
   0x0000fffff7d7aa44:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7aa48:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7aa4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aa50:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7aa54:	54000120	b.eq	0xfffff7d7aa78  // b.none
   0x0000fffff7d7aa58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7aa5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7aa60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aa64:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7aa68:	54000321	b.ne	0xfffff7d7aacc  // b.any
   0x0000fffff7d7aa6c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7aa70:	9e620120	scvtf	d0, x9
   0x0000fffff7d7aa74:	14000002	b	0xfffff7d7aa7c
   0x0000fffff7d7aa78:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7aa7c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7aa80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7aa84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aa88:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7aa8c:	54000120	b.eq	0xfffff7d7aab0  // b.none
   0x0000fffff7d7aa90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7aa94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7aa98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aa9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7aaa0:	54000161	b.ne	0xfffff7d7aacc  // b.any
   0x0000fffff7d7aaa4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7aaa8:	9e620121	scvtf	d1, x9
   0x0000fffff7d7aaac:	14000002	b	0xfffff7d7aab4
   0x0000fffff7d7aab0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7aab4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7aab8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7aabc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7aac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aac4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7aac8:	17ffffde	b	0xfffff7d7aa40
   0x0000fffff7d7aacc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7aad0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7aad4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7aad8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7aadc:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7d7aae0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7aae4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7aae8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7aaec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7aaf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7aaf4:	d63f0200	blr	x16
   0x0000fffff7d7aaf8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7aafc:	54009f80	b.eq	0xfffff7d7beec  // b.none
   0x0000fffff7d7ab00:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7ab04:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7ab08:	540004a0	b.eq	0xfffff7d7ab9c  // b.none
   0x0000fffff7d7ab0c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7ab10:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7ab14:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7ab18:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7ab1c:	54000400	b.eq	0xfffff7d7ab9c  // b.none
   0x0000fffff7d7ab20:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ab24:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7ab28:	36d801d1	tbz	w17, #27, 0xfffff7d7ab60
   0x0000fffff7d7ab2c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7ab30:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7ab34:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7ab38:	54000321	b.ne	0xfffff7d7ab9c  // b.any
   0x0000fffff7d7ab3c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7ab40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ab44:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7ab48:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7ab4c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ab50:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7ab54:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7ab58:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7ab5c:	54000209	b.ls	0xfffff7d7ab9c  // b.plast
   0x0000fffff7d7ab60:	36d8008d	tbz	w13, #27, 0xfffff7d7ab70
   0x0000fffff7d7ab64:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7ab68:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7ab6c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7ab70:	36d80091	tbz	w17, #27, 0xfffff7d7ab80
   0x0000fffff7d7ab74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ab78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ab7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ab80:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7ab84:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7ab88:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7ab8c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7ab90:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7ab94:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7ab98:	1400000e	b	0xfffff7d7abd0
   0x0000fffff7d7ab9c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7aba0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7aba4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7aba8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7abac:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7d7abb0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7abb4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7abb8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7abbc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7abc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7abc4:	d63f0200	blr	x16
   0x0000fffff7d7abc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7abcc:	54009940	b.eq	0xfffff7d7bef4  // b.none
   0x0000fffff7d7abd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7abd4:	37d806a9	tbnz	w9, #27, 0xfffff7d7aca8
   0x0000fffff7d7abd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7abdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7abe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7abe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7abe8:	540001c1	b.ne	0xfffff7d7ac20  // b.any
   0x0000fffff7d7abec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7abf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7abf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7abf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7abfc:	54000121	b.ne	0xfffff7d7ac20  // b.any
   0x0000fffff7d7ac00:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ac04:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7ac08:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7ac0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ac10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ac14:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7ac18:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7ac1c:	14000030	b	0xfffff7d7acdc
   0x0000fffff7d7ac20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ac24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ac28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ac2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ac30:	54000120	b.eq	0xfffff7d7ac54  // b.none
   0x0000fffff7d7ac34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ac38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ac3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ac40:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ac44:	54000321	b.ne	0xfffff7d7aca8  // b.any
   0x0000fffff7d7ac48:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ac4c:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ac50:	14000002	b	0xfffff7d7ac58
   0x0000fffff7d7ac54:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7ac58:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ac5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ac60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ac64:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ac68:	54000120	b.eq	0xfffff7d7ac8c  // b.none
   0x0000fffff7d7ac6c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ac70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ac74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ac78:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ac7c:	54000161	b.ne	0xfffff7d7aca8  // b.any
   0x0000fffff7d7ac80:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7ac84:	9e620121	scvtf	d1, x9
   0x0000fffff7d7ac88:	14000002	b	0xfffff7d7ac90
   0x0000fffff7d7ac8c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7ac90:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7ac94:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7ac98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ac9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aca0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7aca4:	17ffffde	b	0xfffff7d7ac1c
   0x0000fffff7d7aca8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7acac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7acb0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7acb4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7acb8:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7d7acbc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7acc0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7acc4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7acc8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7accc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7acd0:	d63f0200	blr	x16
   0x0000fffff7d7acd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7acd8:	54009120	b.eq	0xfffff7d7befc  // b.none
   0x0000fffff7d7acdc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7ace0:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7ace4:	540004a0	b.eq	0xfffff7d7ad78  // b.none
   0x0000fffff7d7ace8:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7acec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7acf0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7acf4:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7acf8:	54000400	b.eq	0xfffff7d7ad78  // b.none
   0x0000fffff7d7acfc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ad00:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7ad04:	36d801d1	tbz	w17, #27, 0xfffff7d7ad3c
   0x0000fffff7d7ad08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7ad0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7ad10:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7ad14:	54000321	b.ne	0xfffff7d7ad78  // b.any
   0x0000fffff7d7ad18:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7ad1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ad20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7ad24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7ad28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ad2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7ad30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7ad34:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7ad38:	54000209	b.ls	0xfffff7d7ad78  // b.plast
   0x0000fffff7d7ad3c:	36d8008d	tbz	w13, #27, 0xfffff7d7ad4c
   0x0000fffff7d7ad40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7ad44:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7ad48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7ad4c:	36d80091	tbz	w17, #27, 0xfffff7d7ad5c
   0x0000fffff7d7ad50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ad54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ad58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ad5c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7ad60:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7ad64:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7ad68:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7ad6c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7ad70:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7ad74:	1400000e	b	0xfffff7d7adac
   0x0000fffff7d7ad78:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7ad7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ad80:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ad84:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ad88:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7d7ad8c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ad90:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ad94:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7ad98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7ad9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7ada0:	d63f0200	blr	x16
   0x0000fffff7d7ada4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ada8:	54008ae0	b.eq	0xfffff7d7bf04  // b.none
   0x0000fffff7d7adac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7adb0:	37d806a9	tbnz	w9, #27, 0xfffff7d7ae84
   0x0000fffff7d7adb4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7adb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7adbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7adc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7adc4:	540001c1	b.ne	0xfffff7d7adfc  // b.any
   0x0000fffff7d7adc8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7adcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7add0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7add4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7add8:	54000121	b.ne	0xfffff7d7adfc  // b.any
   0x0000fffff7d7addc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ade0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7ade4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7ade8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7adec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7adf0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7adf4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7adf8:	14000030	b	0xfffff7d7aeb8
   0x0000fffff7d7adfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ae00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ae04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ae08:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ae0c:	54000120	b.eq	0xfffff7d7ae30  // b.none
   0x0000fffff7d7ae10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ae14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ae18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ae1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ae20:	54000321	b.ne	0xfffff7d7ae84  // b.any
   0x0000fffff7d7ae24:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ae28:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ae2c:	14000002	b	0xfffff7d7ae34
   0x0000fffff7d7ae30:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7ae34:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ae38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ae3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ae40:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ae44:	54000120	b.eq	0xfffff7d7ae68  // b.none
   0x0000fffff7d7ae48:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ae4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ae50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ae54:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ae58:	54000161	b.ne	0xfffff7d7ae84  // b.any
   0x0000fffff7d7ae5c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7ae60:	9e620121	scvtf	d1, x9
   0x0000fffff7d7ae64:	14000002	b	0xfffff7d7ae6c
   0x0000fffff7d7ae68:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7ae6c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7ae70:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7ae74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ae78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ae7c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7ae80:	17ffffde	b	0xfffff7d7adf8
   0x0000fffff7d7ae84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7ae88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ae8c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ae90:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ae94:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7d7ae98:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ae9c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7aea0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7aea4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7aea8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7aeac:	d63f0200	blr	x16
   0x0000fffff7d7aeb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7aeb4:	540082c0	b.eq	0xfffff7d7bf0c  // b.none
   0x0000fffff7d7aeb8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7aebc:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7aec0:	540004a0	b.eq	0xfffff7d7af54  // b.none
   0x0000fffff7d7aec4:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7aec8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7aecc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7aed0:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7aed4:	54000400	b.eq	0xfffff7d7af54  // b.none
   0x0000fffff7d7aed8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7aedc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7aee0:	36d801d1	tbz	w17, #27, 0xfffff7d7af18
   0x0000fffff7d7aee4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7aee8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7aeec:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7aef0:	54000321	b.ne	0xfffff7d7af54  // b.any
   0x0000fffff7d7aef4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7aef8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7aefc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7af00:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7af04:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7af08:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7af0c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7af10:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7af14:	54000209	b.ls	0xfffff7d7af54  // b.plast
   0x0000fffff7d7af18:	36d8008d	tbz	w13, #27, 0xfffff7d7af28
   0x0000fffff7d7af1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7af20:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7af24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7af28:	36d80091	tbz	w17, #27, 0xfffff7d7af38
   0x0000fffff7d7af2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7af30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7af34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7af38:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7af3c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7af40:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7af44:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7af48:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7af4c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7af50:	1400000e	b	0xfffff7d7af88
   0x0000fffff7d7af54:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7af58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7af5c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7af60:	aa1503e2	mov	x2, x21
   0x0000fffff7d7af64:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7d7af68:	aa1403e4	mov	x4, x20
   0x0000fffff7d7af6c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7af70:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7af74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7af78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7af7c:	d63f0200	blr	x16
   0x0000fffff7d7af80:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7af84:	54007c80	b.eq	0xfffff7d7bf14  // b.none
   0x0000fffff7d7af88:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7af8c:	37d806a9	tbnz	w9, #27, 0xfffff7d7b060
   0x0000fffff7d7af90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7af94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7af98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7af9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7afa0:	540001c1	b.ne	0xfffff7d7afd8  // b.any
   0x0000fffff7d7afa4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7afa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7afac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7afb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7afb4:	54000121	b.ne	0xfffff7d7afd8  // b.any
   0x0000fffff7d7afb8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7afbc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7afc0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7afc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7afc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7afcc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7afd0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7afd4:	14000030	b	0xfffff7d7b094
   0x0000fffff7d7afd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7afdc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7afe0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7afe4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7afe8:	54000120	b.eq	0xfffff7d7b00c  // b.none
   0x0000fffff7d7afec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7aff0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7aff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7aff8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7affc:	54000321	b.ne	0xfffff7d7b060  // b.any
   0x0000fffff7d7b000:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b004:	9e620120	scvtf	d0, x9
   0x0000fffff7d7b008:	14000002	b	0xfffff7d7b010
   0x0000fffff7d7b00c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7b010:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b014:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b018:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b01c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b020:	54000120	b.eq	0xfffff7d7b044  // b.none
   0x0000fffff7d7b024:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b028:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b02c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b030:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b034:	54000161	b.ne	0xfffff7d7b060  // b.any
   0x0000fffff7d7b038:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7b03c:	9e620121	scvtf	d1, x9
   0x0000fffff7d7b040:	14000002	b	0xfffff7d7b048
   0x0000fffff7d7b044:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7b048:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7b04c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7b050:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b054:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b058:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b05c:	17ffffde	b	0xfffff7d7afd4
   0x0000fffff7d7b060:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7b064:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b068:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b06c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b070:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7d7b074:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b078:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b07c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7b080:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7b084:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b088:	d63f0200	blr	x16
   0x0000fffff7d7b08c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b090:	54007460	b.eq	0xfffff7d7bf1c  // b.none
   0x0000fffff7d7b094:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7b098:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7b09c:	540004a0	b.eq	0xfffff7d7b130  // b.none
   0x0000fffff7d7b0a0:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7b0a4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7b0a8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7b0ac:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7b0b0:	54000400	b.eq	0xfffff7d7b130  // b.none
   0x0000fffff7d7b0b4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7b0b8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7b0bc:	36d801d1	tbz	w17, #27, 0xfffff7d7b0f4
   0x0000fffff7d7b0c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7b0c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7b0c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7b0cc:	54000321	b.ne	0xfffff7d7b130  // b.any
   0x0000fffff7d7b0d0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7b0d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b0d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7b0dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7b0e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7b0e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7b0e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7b0ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7b0f0:	54000209	b.ls	0xfffff7d7b130  // b.plast
   0x0000fffff7d7b0f4:	36d8008d	tbz	w13, #27, 0xfffff7d7b104
   0x0000fffff7d7b0f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7b0fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7b100:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7b104:	36d80091	tbz	w17, #27, 0xfffff7d7b114
   0x0000fffff7d7b108:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b10c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7b110:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7b114:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7b118:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7b11c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7b120:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7b124:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7b128:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7b12c:	1400000e	b	0xfffff7d7b164
   0x0000fffff7d7b130:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7b134:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b138:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b13c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b140:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7d7b144:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b148:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b14c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7b150:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7b154:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b158:	d63f0200	blr	x16
   0x0000fffff7d7b15c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b160:	54006e20	b.eq	0xfffff7d7bf24  // b.none
   0x0000fffff7d7b164:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b168:	37d806a9	tbnz	w9, #27, 0xfffff7d7b23c
   0x0000fffff7d7b16c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b170:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b174:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b178:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b17c:	540001c1	b.ne	0xfffff7d7b1b4  // b.any
   0x0000fffff7d7b180:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b18c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b190:	54000121	b.ne	0xfffff7d7b1b4  // b.any
   0x0000fffff7d7b194:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b198:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7b19c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7b1a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b1a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b1a8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7b1ac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b1b0:	14000030	b	0xfffff7d7b270
   0x0000fffff7d7b1b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b1b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b1bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b1c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b1c4:	54000120	b.eq	0xfffff7d7b1e8  // b.none
   0x0000fffff7d7b1c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b1cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b1d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b1d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b1d8:	54000321	b.ne	0xfffff7d7b23c  // b.any
   0x0000fffff7d7b1dc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b1e0:	9e620120	scvtf	d0, x9
   0x0000fffff7d7b1e4:	14000002	b	0xfffff7d7b1ec
   0x0000fffff7d7b1e8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7b1ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b1f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b1f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b1f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b1fc:	54000120	b.eq	0xfffff7d7b220  // b.none
   0x0000fffff7d7b200:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b210:	54000161	b.ne	0xfffff7d7b23c  // b.any
   0x0000fffff7d7b214:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7b218:	9e620121	scvtf	d1, x9
   0x0000fffff7d7b21c:	14000002	b	0xfffff7d7b224
   0x0000fffff7d7b220:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7b224:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7b228:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7b22c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b230:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b234:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b238:	17ffffde	b	0xfffff7d7b1b0
   0x0000fffff7d7b23c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7b240:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b244:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b248:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b24c:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7d7b250:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b254:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b258:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7b25c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7b260:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b264:	d63f0200	blr	x16
   0x0000fffff7d7b268:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b26c:	54006600	b.eq	0xfffff7d7bf2c  // b.none
   0x0000fffff7d7b270:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7b274:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7b278:	540004a0	b.eq	0xfffff7d7b30c  // b.none
   0x0000fffff7d7b27c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7b280:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7b284:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7b288:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7b28c:	54000400	b.eq	0xfffff7d7b30c  // b.none
   0x0000fffff7d7b290:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7b294:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7b298:	36d801d1	tbz	w17, #27, 0xfffff7d7b2d0
   0x0000fffff7d7b29c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7b2a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7b2a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7b2a8:	54000321	b.ne	0xfffff7d7b30c  // b.any
   0x0000fffff7d7b2ac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7b2b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b2b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7b2b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7b2bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7b2c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7b2c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7b2c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7b2cc:	54000209	b.ls	0xfffff7d7b30c  // b.plast
   0x0000fffff7d7b2d0:	36d8008d	tbz	w13, #27, 0xfffff7d7b2e0
   0x0000fffff7d7b2d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7b2d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7b2dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7b2e0:	36d80091	tbz	w17, #27, 0xfffff7d7b2f0
   0x0000fffff7d7b2e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b2e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7b2ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7b2f0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7b2f4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7b2f8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7b2fc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7b300:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7b304:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7b308:	1400000e	b	0xfffff7d7b340
   0x0000fffff7d7b30c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7b310:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b314:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b318:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b31c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7d7b320:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b324:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b328:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7b32c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7b330:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b334:	d63f0200	blr	x16
   0x0000fffff7d7b338:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b33c:	54005fc0	b.eq	0xfffff7d7bf34  // b.none
   0x0000fffff7d7b340:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b344:	37d806a9	tbnz	w9, #27, 0xfffff7d7b418
   0x0000fffff7d7b348:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b34c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b350:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b354:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b358:	540001c1	b.ne	0xfffff7d7b390  // b.any
   0x0000fffff7d7b35c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b360:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b368:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b36c:	54000121	b.ne	0xfffff7d7b390  // b.any
   0x0000fffff7d7b370:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b374:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7b378:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7b37c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b380:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b384:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7b388:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b38c:	14000030	b	0xfffff7d7b44c
   0x0000fffff7d7b390:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b394:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b39c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b3a0:	54000120	b.eq	0xfffff7d7b3c4  // b.none
   0x0000fffff7d7b3a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b3a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b3ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b3b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b3b4:	54000321	b.ne	0xfffff7d7b418  // b.any
   0x0000fffff7d7b3b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b3bc:	9e620120	scvtf	d0, x9
   0x0000fffff7d7b3c0:	14000002	b	0xfffff7d7b3c8
   0x0000fffff7d7b3c4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7b3c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b3cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b3d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b3d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b3d8:	54000120	b.eq	0xfffff7d7b3fc  // b.none
   0x0000fffff7d7b3dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b3e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b3e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b3e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b3ec:	54000161	b.ne	0xfffff7d7b418  // b.any
   0x0000fffff7d7b3f0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7b3f4:	9e620121	scvtf	d1, x9
   0x0000fffff7d7b3f8:	14000002	b	0xfffff7d7b400
   0x0000fffff7d7b3fc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7b400:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7b404:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7b408:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b40c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b410:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b414:	17ffffde	b	0xfffff7d7b38c
   0x0000fffff7d7b418:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7b41c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b420:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b424:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b428:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7d7b42c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b430:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b434:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7b438:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7b43c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b440:	d63f0200	blr	x16
   0x0000fffff7d7b444:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b448:	540057a0	b.eq	0xfffff7d7bf3c  // b.none
   0x0000fffff7d7b44c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7b450:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7b454:	540004a0	b.eq	0xfffff7d7b4e8  // b.none
   0x0000fffff7d7b458:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7b45c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7b460:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7b464:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7b468:	54000400	b.eq	0xfffff7d7b4e8  // b.none
   0x0000fffff7d7b46c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7b470:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7b474:	36d801d1	tbz	w17, #27, 0xfffff7d7b4ac
   0x0000fffff7d7b478:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7b47c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7b480:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7b484:	54000321	b.ne	0xfffff7d7b4e8  // b.any
   0x0000fffff7d7b488:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7b48c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b490:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7b494:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7b498:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7b49c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7b4a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7b4a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7b4a8:	54000209	b.ls	0xfffff7d7b4e8  // b.plast
   0x0000fffff7d7b4ac:	36d8008d	tbz	w13, #27, 0xfffff7d7b4bc
   0x0000fffff7d7b4b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7b4b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7b4b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7b4bc:	36d80091	tbz	w17, #27, 0xfffff7d7b4cc
   0x0000fffff7d7b4c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b4c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7b4c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7b4cc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7b4d0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7b4d4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7b4d8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7b4dc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7b4e0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7b4e4:	1400000e	b	0xfffff7d7b51c
   0x0000fffff7d7b4e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7b4ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b4f0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b4f4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b4f8:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7d7b4fc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b500:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b504:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7b508:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7b50c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b510:	d63f0200	blr	x16
   0x0000fffff7d7b514:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b518:	54005160	b.eq	0xfffff7d7bf44  // b.none
   0x0000fffff7d7b51c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b520:	37d806a9	tbnz	w9, #27, 0xfffff7d7b5f4
   0x0000fffff7d7b524:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b528:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b52c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b530:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b534:	540001c1	b.ne	0xfffff7d7b56c  // b.any
   0x0000fffff7d7b538:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b53c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b544:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b548:	54000121	b.ne	0xfffff7d7b56c  // b.any
   0x0000fffff7d7b54c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b550:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7b554:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7b558:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b55c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b560:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7b564:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b568:	14000030	b	0xfffff7d7b628
   0x0000fffff7d7b56c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b570:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b574:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b578:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b57c:	54000120	b.eq	0xfffff7d7b5a0  // b.none
   0x0000fffff7d7b580:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b584:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b58c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b590:	54000321	b.ne	0xfffff7d7b5f4  // b.any
   0x0000fffff7d7b594:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b598:	9e620120	scvtf	d0, x9
   0x0000fffff7d7b59c:	14000002	b	0xfffff7d7b5a4
   0x0000fffff7d7b5a0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7b5a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b5a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b5ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b5b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b5b4:	54000120	b.eq	0xfffff7d7b5d8  // b.none
   0x0000fffff7d7b5b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b5bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b5c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b5c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b5c8:	54000161	b.ne	0xfffff7d7b5f4  // b.any
   0x0000fffff7d7b5cc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7b5d0:	9e620121	scvtf	d1, x9
   0x0000fffff7d7b5d4:	14000002	b	0xfffff7d7b5dc
   0x0000fffff7d7b5d8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7b5dc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7b5e0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7b5e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b5e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b5ec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b5f0:	17ffffde	b	0xfffff7d7b568
   0x0000fffff7d7b5f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7b5f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b5fc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b600:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b604:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7d7b608:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b60c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b610:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7b614:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7b618:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b61c:	d63f0200	blr	x16
   0x0000fffff7d7b620:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b624:	54004940	b.eq	0xfffff7d7bf4c  // b.none
   0x0000fffff7d7b628:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7b62c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7b630:	540004a0	b.eq	0xfffff7d7b6c4  // b.none
   0x0000fffff7d7b634:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7b638:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7b63c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7b640:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7b644:	54000400	b.eq	0xfffff7d7b6c4  // b.none
   0x0000fffff7d7b648:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7b64c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7b650:	36d801d1	tbz	w17, #27, 0xfffff7d7b688
   0x0000fffff7d7b654:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7b658:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7b65c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7b660:	54000321	b.ne	0xfffff7d7b6c4  // b.any
   0x0000fffff7d7b664:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7b668:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b66c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7b670:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7b674:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7b678:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7b67c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7b680:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7b684:	54000209	b.ls	0xfffff7d7b6c4  // b.plast
   0x0000fffff7d7b688:	36d8008d	tbz	w13, #27, 0xfffff7d7b698
   0x0000fffff7d7b68c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7b690:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7b694:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7b698:	36d80091	tbz	w17, #27, 0xfffff7d7b6a8
   0x0000fffff7d7b69c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b6a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7b6a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7b6a8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7b6ac:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7b6b0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7b6b4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7b6b8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7b6bc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7b6c0:	1400000e	b	0xfffff7d7b6f8
   0x0000fffff7d7b6c4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7b6c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b6cc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b6d0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b6d4:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7d7b6d8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b6dc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b6e0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7b6e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7b6e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b6ec:	d63f0200	blr	x16
   0x0000fffff7d7b6f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b6f4:	54004300	b.eq	0xfffff7d7bf54  // b.none
   0x0000fffff7d7b6f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b6fc:	37d806a9	tbnz	w9, #27, 0xfffff7d7b7d0
   0x0000fffff7d7b700:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b704:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b708:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b70c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b710:	540001c1	b.ne	0xfffff7d7b748  // b.any
   0x0000fffff7d7b714:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b718:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b71c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b720:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b724:	54000121	b.ne	0xfffff7d7b748  // b.any
   0x0000fffff7d7b728:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b72c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7b730:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7b734:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b738:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b73c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7b740:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b744:	14000030	b	0xfffff7d7b804
   0x0000fffff7d7b748:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b74c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b750:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b754:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b758:	54000120	b.eq	0xfffff7d7b77c  // b.none
   0x0000fffff7d7b75c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b760:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b764:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b768:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b76c:	54000321	b.ne	0xfffff7d7b7d0  // b.any
   0x0000fffff7d7b770:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b774:	9e620120	scvtf	d0, x9
   0x0000fffff7d7b778:	14000002	b	0xfffff7d7b780
   0x0000fffff7d7b77c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7b780:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b784:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b788:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b78c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b790:	54000120	b.eq	0xfffff7d7b7b4  // b.none
   0x0000fffff7d7b794:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b798:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b79c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b7a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b7a4:	54000161	b.ne	0xfffff7d7b7d0  // b.any
   0x0000fffff7d7b7a8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7b7ac:	9e620121	scvtf	d1, x9
   0x0000fffff7d7b7b0:	14000002	b	0xfffff7d7b7b8
   0x0000fffff7d7b7b4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7b7b8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7b7bc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7b7c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b7c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b7c8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b7cc:	17ffffde	b	0xfffff7d7b744
   0x0000fffff7d7b7d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7b7d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b7d8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b7dc:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b7e0:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7d7b7e4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b7e8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b7ec:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7b7f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7b7f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b7f8:	d63f0200	blr	x16
   0x0000fffff7d7b7fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b800:	54003ae0	b.eq	0xfffff7d7bf5c  // b.none
   0x0000fffff7d7b804:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7b808:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7b80c:	540004a0	b.eq	0xfffff7d7b8a0  // b.none
   0x0000fffff7d7b810:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7b814:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7b818:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7b81c:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7b820:	54000400	b.eq	0xfffff7d7b8a0  // b.none
   0x0000fffff7d7b824:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7b828:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7b82c:	36d801d1	tbz	w17, #27, 0xfffff7d7b864
   0x0000fffff7d7b830:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7b834:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7b838:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7b83c:	54000321	b.ne	0xfffff7d7b8a0  // b.any
   0x0000fffff7d7b840:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7b844:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b848:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7b84c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7b850:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7b854:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7b858:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7b85c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7b860:	54000209	b.ls	0xfffff7d7b8a0  // b.plast
   0x0000fffff7d7b864:	36d8008d	tbz	w13, #27, 0xfffff7d7b874
   0x0000fffff7d7b868:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7b86c:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7b870:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7b874:	36d80091	tbz	w17, #27, 0xfffff7d7b884
   0x0000fffff7d7b878:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7b87c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7b880:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7b884:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7b888:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7b88c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7b890:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7b894:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7b898:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7b89c:	1400000e	b	0xfffff7d7b8d4
   0x0000fffff7d7b8a0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7b8a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b8a8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b8ac:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b8b0:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7d7b8b4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b8b8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b8bc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7b8c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7b8c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b8c8:	d63f0200	blr	x16
   0x0000fffff7d7b8cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b8d0:	540034a0	b.eq	0xfffff7d7bf64  // b.none
   0x0000fffff7d7b8d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b8d8:	37d806a9	tbnz	w9, #27, 0xfffff7d7b9ac
   0x0000fffff7d7b8dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b8e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b8e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b8e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b8ec:	540001c1	b.ne	0xfffff7d7b924  // b.any
   0x0000fffff7d7b8f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b8f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b8fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b900:	54000121	b.ne	0xfffff7d7b924  // b.any
   0x0000fffff7d7b904:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b908:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7b90c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7b910:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b918:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7b91c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b920:	14000030	b	0xfffff7d7b9e0
   0x0000fffff7d7b924:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b928:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b92c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b930:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b934:	54000120	b.eq	0xfffff7d7b958  // b.none
   0x0000fffff7d7b938:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7b93c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b944:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b948:	54000321	b.ne	0xfffff7d7b9ac  // b.any
   0x0000fffff7d7b94c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7b950:	9e620120	scvtf	d0, x9
   0x0000fffff7d7b954:	14000002	b	0xfffff7d7b95c
   0x0000fffff7d7b958:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7b95c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b960:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b968:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b96c:	54000120	b.eq	0xfffff7d7b990  // b.none
   0x0000fffff7d7b970:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7b974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7b978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b97c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7b980:	54000161	b.ne	0xfffff7d7b9ac  // b.any
   0x0000fffff7d7b984:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7b988:	9e620121	scvtf	d1, x9
   0x0000fffff7d7b98c:	14000002	b	0xfffff7d7b994
   0x0000fffff7d7b990:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7b994:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7b998:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7b99c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7b9a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7b9a4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7b9a8:	17ffffde	b	0xfffff7d7b920
   0x0000fffff7d7b9ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7b9b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7b9b4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7b9b8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7b9bc:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7d7b9c0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7b9c4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7b9c8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7b9cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7b9d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7b9d4:	d63f0200	blr	x16
   0x0000fffff7d7b9d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7b9dc:	54002c80	b.eq	0xfffff7d7bf6c  // b.none
   0x0000fffff7d7b9e0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7b9e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7b9e8:	540004a0	b.eq	0xfffff7d7ba7c  // b.none
   0x0000fffff7d7b9ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7b9f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7b9f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7b9f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7b9fc:	54000400	b.eq	0xfffff7d7ba7c  // b.none
   0x0000fffff7d7ba00:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ba04:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7ba08:	36d801d1	tbz	w17, #27, 0xfffff7d7ba40
   0x0000fffff7d7ba0c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7ba10:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7ba14:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7ba18:	54000321	b.ne	0xfffff7d7ba7c  // b.any
   0x0000fffff7d7ba1c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7ba20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ba24:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7ba28:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7ba2c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7ba30:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7ba34:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7ba38:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7ba3c:	54000209	b.ls	0xfffff7d7ba7c  // b.plast
   0x0000fffff7d7ba40:	36d8008d	tbz	w13, #27, 0xfffff7d7ba50
   0x0000fffff7d7ba44:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7ba48:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7ba4c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7ba50:	36d80091	tbz	w17, #27, 0xfffff7d7ba60
   0x0000fffff7d7ba54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7ba58:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7ba5c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7ba60:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7ba64:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7ba68:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7ba6c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7ba70:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7ba74:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7ba78:	1400000e	b	0xfffff7d7bab0
   0x0000fffff7d7ba7c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7ba80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ba84:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ba88:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ba8c:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7d7ba90:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ba94:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ba98:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7ba9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7baa0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7baa4:	d63f0200	blr	x16
   0x0000fffff7d7baa8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7baac:	54002640	b.eq	0xfffff7d7bf74  // b.none
   0x0000fffff7d7bab0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7bab4:	37d806a9	tbnz	w9, #27, 0xfffff7d7bb88
   0x0000fffff7d7bab8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7babc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bac8:	540001c1	b.ne	0xfffff7d7bb00  // b.any
   0x0000fffff7d7bacc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7bad0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bad8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7badc:	54000121	b.ne	0xfffff7d7bb00  // b.any
   0x0000fffff7d7bae0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7bae4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7bae8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7baec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7baf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7baf4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7baf8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7bafc:	14000030	b	0xfffff7d7bbbc
   0x0000fffff7d7bb00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7bb04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7bb08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bb0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bb10:	54000120	b.eq	0xfffff7d7bb34  // b.none
   0x0000fffff7d7bb14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7bb18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bb1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bb20:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bb24:	54000321	b.ne	0xfffff7d7bb88  // b.any
   0x0000fffff7d7bb28:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7bb2c:	9e620120	scvtf	d0, x9
   0x0000fffff7d7bb30:	14000002	b	0xfffff7d7bb38
   0x0000fffff7d7bb34:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7bb38:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7bb3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7bb40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bb44:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bb48:	54000120	b.eq	0xfffff7d7bb6c  // b.none
   0x0000fffff7d7bb4c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7bb50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bb54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bb58:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bb5c:	54000161	b.ne	0xfffff7d7bb88  // b.any
   0x0000fffff7d7bb60:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7bb64:	9e620121	scvtf	d1, x9
   0x0000fffff7d7bb68:	14000002	b	0xfffff7d7bb70
   0x0000fffff7d7bb6c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7bb70:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7bb74:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7bb78:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7bb7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bb80:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7bb84:	17ffffde	b	0xfffff7d7bafc
   0x0000fffff7d7bb88:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7bb8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7bb90:	aa1303e1	mov	x1, x19
   0x0000fffff7d7bb94:	aa1503e2	mov	x2, x21
   0x0000fffff7d7bb98:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7d7bb9c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7bba0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7bba4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7bba8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7bbac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7bbb0:	d63f0200	blr	x16
   0x0000fffff7d7bbb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7bbb8:	54001e20	b.eq	0xfffff7d7bf7c  // b.none
   0x0000fffff7d7bbbc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7bbc0:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7bbc4:	540004a0	b.eq	0xfffff7d7bc58  // b.none
   0x0000fffff7d7bbc8:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7bbcc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7bbd0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7bbd4:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7bbd8:	54000400	b.eq	0xfffff7d7bc58  // b.none
   0x0000fffff7d7bbdc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7bbe0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7bbe4:	36d801d1	tbz	w17, #27, 0xfffff7d7bc1c
   0x0000fffff7d7bbe8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7bbec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7bbf0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7bbf4:	54000321	b.ne	0xfffff7d7bc58  // b.any
   0x0000fffff7d7bbf8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7bbfc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7bc00:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7bc04:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7bc08:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7bc0c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7bc10:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7bc14:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7bc18:	54000209	b.ls	0xfffff7d7bc58  // b.plast
   0x0000fffff7d7bc1c:	36d8008d	tbz	w13, #27, 0xfffff7d7bc2c
   0x0000fffff7d7bc20:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7bc24:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7bc28:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7bc2c:	36d80091	tbz	w17, #27, 0xfffff7d7bc3c
   0x0000fffff7d7bc30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7bc34:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7bc38:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7bc3c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7bc40:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7bc44:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7bc48:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7bc4c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7bc50:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7bc54:	1400000e	b	0xfffff7d7bc8c
   0x0000fffff7d7bc58:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7bc5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7bc60:	aa1303e1	mov	x1, x19
   0x0000fffff7d7bc64:	aa1503e2	mov	x2, x21
   0x0000fffff7d7bc68:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7d7bc6c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7bc70:	aa1603e5	mov	x5, x22
   0x0000fffff7d7bc74:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7bc78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7bc7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7bc80:	d63f0200	blr	x16
   0x0000fffff7d7bc84:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7bc88:	540017e0	b.eq	0xfffff7d7bf84  // b.none
   0x0000fffff7d7bc8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7bc90:	37d806a9	tbnz	w9, #27, 0xfffff7d7bd64
   0x0000fffff7d7bc94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7bc98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bc9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bca0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bca4:	540001c1	b.ne	0xfffff7d7bcdc  // b.any
   0x0000fffff7d7bca8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7bcac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bcb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bcb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bcb8:	54000121	b.ne	0xfffff7d7bcdc  // b.any
   0x0000fffff7d7bcbc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7bcc0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7bcc4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7bcc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bcd0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7bcd4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7bcd8:	14000030	b	0xfffff7d7bd98
   0x0000fffff7d7bcdc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7bce0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7bce4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bce8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bcec:	54000120	b.eq	0xfffff7d7bd10  // b.none
   0x0000fffff7d7bcf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7bcf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bcf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bcfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bd00:	54000321	b.ne	0xfffff7d7bd64  // b.any
   0x0000fffff7d7bd04:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7bd08:	9e620120	scvtf	d0, x9
   0x0000fffff7d7bd0c:	14000002	b	0xfffff7d7bd14
   0x0000fffff7d7bd10:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7bd14:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7bd18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7bd1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bd20:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bd24:	54000120	b.eq	0xfffff7d7bd48  // b.none
   0x0000fffff7d7bd28:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7bd2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bd30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bd34:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bd38:	54000161	b.ne	0xfffff7d7bd64  // b.any
   0x0000fffff7d7bd3c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7bd40:	9e620121	scvtf	d1, x9
   0x0000fffff7d7bd44:	14000002	b	0xfffff7d7bd4c
   0x0000fffff7d7bd48:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7bd4c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7bd50:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7bd54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7bd58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bd5c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7bd60:	17ffffde	b	0xfffff7d7bcd8
   0x0000fffff7d7bd64:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7bd68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7bd6c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7bd70:	aa1503e2	mov	x2, x21
   0x0000fffff7d7bd74:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7d7bd78:	aa1403e4	mov	x4, x20
   0x0000fffff7d7bd7c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7bd80:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7bd84:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7bd88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7bd8c:	d63f0200	blr	x16
   0x0000fffff7d7bd90:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7bd94:	54000fc0	b.eq	0xfffff7d7bf8c  // b.none
   0x0000fffff7d7bd98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7bd9c:	37d80269	tbnz	w9, #27, 0xfffff7d7bde8
   0x0000fffff7d7bda0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7bda4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bda8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bdac:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7bdb0:	540001c1	b.ne	0xfffff7d7bde8  // b.any
   0x0000fffff7d7bdb4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7bdb8:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7d7bdbc:	8b0a012b	add	x11, x9, x10
   0x0000fffff7d7bdc0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7d7bdc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bdc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bdcc:	b900626a	str	w10, [x19, #96]
   0x0000fffff7d7bdd0:	aa0b03e9	mov	x9, x11
   0x0000fffff7d7bdd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7bdd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7bddc:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7bde0:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7bde4:	1400000e	b	0xfffff7d7be1c
   0x0000fffff7d7bde8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7bdec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7bdf0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7bdf4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7bdf8:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7d7bdfc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7be00:	aa1603e5	mov	x5, x22
   0x0000fffff7d7be04:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7d7be08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7be0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7be10:	d63f0200	blr	x16
   0x0000fffff7d7be14:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7be18:	54000be0	b.eq	0xfffff7d7bf94  // b.none
   0x0000fffff7d7be1c:	17fff8f7	b	0xfffff7d7a1f8
   0x0000fffff7d7be20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7be24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7be28:	aa1303e1	mov	x1, x19
   0x0000fffff7d7be2c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7be30:	d2800863	mov	x3, #0x43                  	// #67
   0x0000fffff7d7be34:	aa1403e4	mov	x4, x20
   0x0000fffff7d7be38:	aa1603e5	mov	x5, x22
   0x0000fffff7d7be3c:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7d7be40:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7be44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7be48:	d63f0200	blr	x16
   0x0000fffff7d7be4c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7d7be50:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7be54:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7be58:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7be5c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d7be60:	d65f03c0	ret
   0x0000fffff7d7be64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7be68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7be6c:	b900028a	str	w10, [x20]
   0x0000fffff7d7be70:	f9000689	str	x9, [x20, #8]
   0x0000fffff7d7be74:	910143ff	add	sp, sp, #0x50
   0x0000fffff7d7be78:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7be7c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7be80:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7be84:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7d7be88:	d65f03c0	ret
   0x0000fffff7d7be8c:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7d7be90:	17fffff5	b	0xfffff7d7be64
   0x0000fffff7d7be94:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7d7be98:	17fffff3	b	0xfffff7d7be64
   0x0000fffff7d7be9c:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7d7bea0:	17fffff1	b	0xfffff7d7be64
   0x0000fffff7d7bea4:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7d7bea8:	17ffffef	b	0xfffff7d7be64
   0x0000fffff7d7beac:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7d7beb0:	17ffffed	b	0xfffff7d7be64
   0x0000fffff7d7beb4:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7d7beb8:	17ffffeb	b	0xfffff7d7be64
   0x0000fffff7d7bebc:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7d7bec0:	17ffffe9	b	0xfffff7d7be64
   0x0000fffff7d7bec4:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7d7bec8:	17ffffe7	b	0xfffff7d7be64
   0x0000fffff7d7becc:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7d7bed0:	17ffffe5	b	0xfffff7d7be64
   0x0000fffff7d7bed4:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7d7bed8:	17ffffe3	b	0xfffff7d7be64
   0x0000fffff7d7bedc:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7d7bee0:	17ffffe1	b	0xfffff7d7be64
   0x0000fffff7d7bee4:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7d7bee8:	17ffffdf	b	0xfffff7d7be64
   0x0000fffff7d7beec:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7d7bef0:	17ffffdd	b	0xfffff7d7be64
   0x0000fffff7d7bef4:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7d7bef8:	17ffffdb	b	0xfffff7d7be64
   0x0000fffff7d7befc:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7d7bf00:	17ffffd9	b	0xfffff7d7be64
   0x0000fffff7d7bf04:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7d7bf08:	17ffffd7	b	0xfffff7d7be64
   0x0000fffff7d7bf0c:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7d7bf10:	17ffffd5	b	0xfffff7d7be64
   0x0000fffff7d7bf14:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7d7bf18:	17ffffd3	b	0xfffff7d7be64
   0x0000fffff7d7bf1c:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7d7bf20:	17ffffd1	b	0xfffff7d7be64
   0x0000fffff7d7bf24:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7d7bf28:	17ffffcf	b	0xfffff7d7be64
   0x0000fffff7d7bf2c:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7d7bf30:	17ffffcd	b	0xfffff7d7be64
   0x0000fffff7d7bf34:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7d7bf38:	17ffffcb	b	0xfffff7d7be64
   0x0000fffff7d7bf3c:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7d7bf40:	17ffffc9	b	0xfffff7d7be64
   0x0000fffff7d7bf44:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7d7bf48:	17ffffc7	b	0xfffff7d7be64
   0x0000fffff7d7bf4c:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7d7bf50:	17ffffc5	b	0xfffff7d7be64
   0x0000fffff7d7bf54:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7d7bf58:	17ffffc3	b	0xfffff7d7be64
   0x0000fffff7d7bf5c:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7d7bf60:	17ffffc1	b	0xfffff7d7be64
   0x0000fffff7d7bf64:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7d7bf68:	17ffffbf	b	0xfffff7d7be64
   0x0000fffff7d7bf6c:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7d7bf70:	17ffffbd	b	0xfffff7d7be64
   0x0000fffff7d7bf74:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7d7bf78:	17ffffbb	b	0xfffff7d7be64
   0x0000fffff7d7bf7c:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7d7bf80:	17ffffb9	b	0xfffff7d7be64
   0x0000fffff7d7bf84:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7d7bf88:	17ffffb7	b	0xfffff7d7be64
   0x0000fffff7d7bf8c:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7d7bf90:	17ffffb5	b	0xfffff7d7be64
   0x0000fffff7d7bf94:	d2800829	mov	x9, #0x41                  	// #65
   0x0000fffff7d7bf98:	17ffffb3	b	0xfffff7d7be64
   0x0000fffff7d7bf9c:	00000000	udf	#0
   0x0000fffff7d7bfa0:	00000000	udf	#0
   0x0000fffff7d7bfa4:	00000000	udf	#0
   0x0000fffff7d7bfa8:	00000000	udf	#0
   0x0000fffff7d7bfac:	00000000	udf	#0
   0x0000fffff7d7bfb0:	00000000	udf	#0
   0x0000fffff7d7bfb4:	00000000	udf	#0
   0x0000fffff7d7bfb8:	00000000	udf	#0
   0x0000fffff7d7bfbc:	00000000	udf	#0
   0x0000fffff7d7bfc0:	00000000	udf	#0
   0x0000fffff7d7bfc4:	00000000	udf	#0
   0x0000fffff7d7bfc8:	00000000	udf	#0
   0x0000fffff7d7bfcc:	00000000	udf	#0
   0x0000fffff7d7bfd0:	00000000	udf	#0
   0x0000fffff7d7bfd4:	00000000	udf	#0
   0x0000fffff7d7bfd8:	00000000	udf	#0
   0x0000fffff7d7bfdc:	00000000	udf	#0
   0x0000fffff7d7bfe0:	00000000	udf	#0
   0x0000fffff7d7bfe4:	00000000	udf	#0
   0x0000fffff7d7bfe8:	00000000	udf	#0
   0x0000fffff7d7bfec:	00000000	udf	#0
   0x0000fffff7d7bff0:	00000000	udf	#0
   0x0000fffff7d7bff4:	00000000	udf	#0
   0x0000fffff7d7bff8:	00000000	udf	#0
   0x0000fffff7d7bffc:	00000000	udf	#0
End of assembler dump.
