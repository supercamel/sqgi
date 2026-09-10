Dump of assembler code from 0xfffff7f9a000 to 0xfffff7f9c000:
   0x0000fffff7f9a000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f9a004:	910003fd	mov	x29, sp
   0x0000fffff7f9a008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9a00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f9a010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f9a014:	aa0003f3	mov	x19, x0
   0x0000fffff7f9a018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9a01c:	aa0203f5	mov	x21, x2
   0x0000fffff7f9a020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f9a024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f9a028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9a02c:	f90003e9	str	x9, [sp]
   0x0000fffff7f9a030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f9a034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f9a038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9a03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f9a040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a044:	d63f0200	blr	x16
   0x0000fffff7f9a048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9a04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f9a050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f9a054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f9a058:	14000001	b	0xfffff7f9a05c
   0x0000fffff7f9a05c:	14000001	b	0xfffff7f9a060
   0x0000fffff7f9a060:	14000001	b	0xfffff7f9a064
   0x0000fffff7f9a064:	14000001	b	0xfffff7f9a068
   0x0000fffff7f9a068:	14000001	b	0xfffff7f9a06c
   0x0000fffff7f9a06c:	14000001	b	0xfffff7f9a070
   0x0000fffff7f9a070:	14000001	b	0xfffff7f9a074
   0x0000fffff7f9a074:	14000001	b	0xfffff7f9a078
   0x0000fffff7f9a078:	14000001	b	0xfffff7f9a07c
   0x0000fffff7f9a07c:	14000001	b	0xfffff7f9a080
   0x0000fffff7f9a080:	14000001	b	0xfffff7f9a084
   0x0000fffff7f9a084:	14000001	b	0xfffff7f9a088
   0x0000fffff7f9a088:	14000001	b	0xfffff7f9a08c
   0x0000fffff7f9a08c:	14000001	b	0xfffff7f9a090
   0x0000fffff7f9a090:	14000001	b	0xfffff7f9a094
   0x0000fffff7f9a094:	14000001	b	0xfffff7f9a098
   0x0000fffff7f9a098:	14000001	b	0xfffff7f9a09c
   0x0000fffff7f9a09c:	14000001	b	0xfffff7f9a0a0
   0x0000fffff7f9a0a0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f9a0a4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f9a0a8:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f9a0ac:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9a0b0:	36d80211	tbz	w17, #27, 0xfffff7f9a0f0
   0x0000fffff7f9a0b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9a0b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9a0bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9a0c0:	540001e1	b.ne	0xfffff7f9a0fc  // b.any
   0x0000fffff7f9a0c4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9a0c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a0cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9a0d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9a0d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9a0d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9a0dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9a0e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9a0e4:	540000c9	b.ls	0xfffff7f9a0fc  // b.plast
   0x0000fffff7f9a0e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9a0ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9a0f0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9a0f4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9a0f8:	1400000e	b	0xfffff7f9a130
   0x0000fffff7f9a0fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a100:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a104:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a108:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a10c:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f9a110:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a114:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a118:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f9a11c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a120:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a124:	d63f0200	blr	x16
   0x0000fffff7f9a128:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a12c:	5400ede0	b.eq	0xfffff7f9bee8  // b.none
   0x0000fffff7f9a130:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f9a134:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f9a138:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f9a13c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f9a140:	36d80211	tbz	w17, #27, 0xfffff7f9a180
   0x0000fffff7f9a144:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9a148:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9a14c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9a150:	540001e1	b.ne	0xfffff7f9a18c  // b.any
   0x0000fffff7f9a154:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f9a158:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a15c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9a160:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9a164:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9a168:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9a16c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9a170:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9a174:	540000c9	b.ls	0xfffff7f9a18c  // b.plast
   0x0000fffff7f9a178:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9a17c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9a180:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f9a184:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f9a188:	1400000e	b	0xfffff7f9a1c0
   0x0000fffff7f9a18c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a190:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a194:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a198:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a19c:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f9a1a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a1a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a1a8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f9a1ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a1b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a1b4:	d63f0200	blr	x16
   0x0000fffff7f9a1b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a1bc:	5400e9a0	b.eq	0xfffff7f9bef0  // b.none
   0x0000fffff7f9a1c0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9a1c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a1c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a1cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a1d0:	54000421	b.ne	0xfffff7f9a254  // b.any
   0x0000fffff7f9a1d4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9a1d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a1dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a1e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a1e4:	54000381	b.ne	0xfffff7f9a254  // b.any
   0x0000fffff7f9a1e8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9a1ec:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f9a1f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a1f4:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7f9a1f8:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7f9a1fc:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7f9a200:	91000580	add	x0, x12, #0x1
   0x0000fffff7f9a204:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9a208:	36d80211	tbz	w17, #27, 0xfffff7f9a248
   0x0000fffff7f9a20c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9a210:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9a214:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9a218:	540001e1	b.ne	0xfffff7f9a254  // b.any
   0x0000fffff7f9a21c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9a220:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a224:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9a228:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9a22c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9a230:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9a234:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9a238:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9a23c:	540000c9	b.ls	0xfffff7f9a254  // b.plast
   0x0000fffff7f9a240:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9a244:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9a248:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7f9a24c:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7f9a250:	1400000e	b	0xfffff7f9a288
   0x0000fffff7f9a254:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a258:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a25c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a260:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a264:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f9a268:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a26c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a270:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7f9a274:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a278:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a27c:	d63f0200	blr	x16
   0x0000fffff7f9a280:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a284:	5400e3a0	b.eq	0xfffff7f9bef8  // b.none
   0x0000fffff7f9a288:	f100041f	cmp	x0, #0x1
   0x0000fffff7f9a28c:	5400df80	b.eq	0xfffff7f9be7c  // b.none
   0x0000fffff7f9a290:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9a294:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9a298:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f9a29c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9a2a0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9a2a4:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f9a2a8:	36d801d1	tbz	w17, #27, 0xfffff7f9a2e0
   0x0000fffff7f9a2ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9a2b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9a2b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9a2b8:	54000281	b.ne	0xfffff7f9a308  // b.any
   0x0000fffff7f9a2bc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9a2c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a2c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9a2c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9a2cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9a2d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9a2d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9a2d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9a2dc:	54000169	b.ls	0xfffff7f9a308  // b.plast
   0x0000fffff7f9a2e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9a2e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9a2e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9a2ec:	36d80091	tbz	w17, #27, 0xfffff7f9a2fc
   0x0000fffff7f9a2f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a2f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9a2f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9a2fc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9a300:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9a304:	1400000e	b	0xfffff7f9a33c
   0x0000fffff7f9a308:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a30c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a310:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a314:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a318:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f9a31c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a320:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a324:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f9a328:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a32c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a330:	d63f0200	blr	x16
   0x0000fffff7f9a334:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a338:	5400de40	b.eq	0xfffff7f9bf00  // b.none
   0x0000fffff7f9a33c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9a340:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9a344:	540003a0	b.eq	0xfffff7f9a3b8  // b.none
   0x0000fffff7f9a348:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f9a34c:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f9a350:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9a354:	36d801d1	tbz	w17, #27, 0xfffff7f9a38c
   0x0000fffff7f9a358:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9a35c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9a360:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9a364:	540002a1	b.ne	0xfffff7f9a3b8  // b.any
   0x0000fffff7f9a368:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9a36c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a370:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9a374:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9a378:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9a37c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9a380:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9a384:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9a388:	54000189	b.ls	0xfffff7f9a3b8  // b.plast
   0x0000fffff7f9a38c:	36d8008d	tbz	w13, #27, 0xfffff7f9a39c
   0x0000fffff7f9a390:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9a394:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9a398:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9a39c:	36d80091	tbz	w17, #27, 0xfffff7f9a3ac
   0x0000fffff7f9a3a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a3a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9a3a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9a3ac:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9a3b0:	b900016d	str	w13, [x11]
   0x0000fffff7f9a3b4:	1400000e	b	0xfffff7f9a3ec
   0x0000fffff7f9a3b8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9a3bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a3c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a3c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a3c8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f9a3cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a3d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a3d4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f9a3d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a3dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a3e0:	d63f0200	blr	x16
   0x0000fffff7f9a3e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a3e8:	5400d900	b.eq	0xfffff7f9bf08  // b.none
   0x0000fffff7f9a3ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9a3f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9a3f4:	540004a0	b.eq	0xfffff7f9a488  // b.none
   0x0000fffff7f9a3f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9a3fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9a400:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9a404:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9a408:	54000400	b.eq	0xfffff7f9a488  // b.none
   0x0000fffff7f9a40c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9a410:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9a414:	36d801d1	tbz	w17, #27, 0xfffff7f9a44c
   0x0000fffff7f9a418:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9a41c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9a420:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9a424:	54000321	b.ne	0xfffff7f9a488  // b.any
   0x0000fffff7f9a428:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9a42c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a430:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9a434:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9a438:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9a43c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9a440:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9a444:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9a448:	54000209	b.ls	0xfffff7f9a488  // b.plast
   0x0000fffff7f9a44c:	36d8008d	tbz	w13, #27, 0xfffff7f9a45c
   0x0000fffff7f9a450:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9a454:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9a458:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9a45c:	36d80091	tbz	w17, #27, 0xfffff7f9a46c
   0x0000fffff7f9a460:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a464:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9a468:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9a46c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9a470:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9a474:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9a478:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9a47c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9a480:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9a484:	1400000e	b	0xfffff7f9a4bc
   0x0000fffff7f9a488:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a48c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a490:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a494:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a498:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f9a49c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a4a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a4a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a4a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a4ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a4b0:	d63f0200	blr	x16
   0x0000fffff7f9a4b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a4b8:	5400d2c0	b.eq	0xfffff7f9bf10  // b.none
   0x0000fffff7f9a4bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a4c0:	37d806a9	tbnz	w9, #27, 0xfffff7f9a594
   0x0000fffff7f9a4c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a4c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a4cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a4d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a4d4:	540001c1	b.ne	0xfffff7f9a50c  // b.any
   0x0000fffff7f9a4d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9a4dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a4e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a4e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a4e8:	54000121	b.ne	0xfffff7f9a50c  // b.any
   0x0000fffff7f9a4ec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9a4f0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9a4f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a4f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a4fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a500:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9a504:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9a508:	14000030	b	0xfffff7f9a5c8
   0x0000fffff7f9a50c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a510:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a514:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a518:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a51c:	54000120	b.eq	0xfffff7f9a540  // b.none
   0x0000fffff7f9a520:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a524:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a52c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a530:	54000321	b.ne	0xfffff7f9a594  // b.any
   0x0000fffff7f9a534:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9a538:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a53c:	14000002	b	0xfffff7f9a544
   0x0000fffff7f9a540:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9a544:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9a548:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a54c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a550:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a554:	54000120	b.eq	0xfffff7f9a578  // b.none
   0x0000fffff7f9a558:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9a55c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a560:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a564:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a568:	54000161	b.ne	0xfffff7f9a594  // b.any
   0x0000fffff7f9a56c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9a570:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a574:	14000002	b	0xfffff7f9a57c
   0x0000fffff7f9a578:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9a57c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a580:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9a584:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a58c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9a590:	17ffffde	b	0xfffff7f9a508
   0x0000fffff7f9a594:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a598:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a59c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a5a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a5a4:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9a5a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a5ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a5b0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a5b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a5b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a5bc:	d63f0200	blr	x16
   0x0000fffff7f9a5c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a5c4:	5400caa0	b.eq	0xfffff7f9bf18  // b.none
   0x0000fffff7f9a5c8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9a5cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9a5d0:	540004a0	b.eq	0xfffff7f9a664  // b.none
   0x0000fffff7f9a5d4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9a5d8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9a5dc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9a5e0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9a5e4:	54000400	b.eq	0xfffff7f9a664  // b.none
   0x0000fffff7f9a5e8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9a5ec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9a5f0:	36d801d1	tbz	w17, #27, 0xfffff7f9a628
   0x0000fffff7f9a5f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9a5f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9a5fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9a600:	54000321	b.ne	0xfffff7f9a664  // b.any
   0x0000fffff7f9a604:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9a608:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a60c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9a610:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9a614:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9a618:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9a61c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9a620:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9a624:	54000209	b.ls	0xfffff7f9a664  // b.plast
   0x0000fffff7f9a628:	36d8008d	tbz	w13, #27, 0xfffff7f9a638
   0x0000fffff7f9a62c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9a630:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9a634:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9a638:	36d80091	tbz	w17, #27, 0xfffff7f9a648
   0x0000fffff7f9a63c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a640:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9a644:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9a648:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9a64c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9a650:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9a654:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9a658:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9a65c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9a660:	1400000e	b	0xfffff7f9a698
   0x0000fffff7f9a664:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a668:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a66c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a670:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a674:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f9a678:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a67c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a680:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a684:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a688:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a68c:	d63f0200	blr	x16
   0x0000fffff7f9a690:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a694:	5400c460	b.eq	0xfffff7f9bf20  // b.none
   0x0000fffff7f9a698:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a69c:	37d806a9	tbnz	w9, #27, 0xfffff7f9a770
   0x0000fffff7f9a6a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a6a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a6a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a6ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a6b0:	540001c1	b.ne	0xfffff7f9a6e8  // b.any
   0x0000fffff7f9a6b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9a6b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a6bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a6c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a6c4:	54000121	b.ne	0xfffff7f9a6e8  // b.any
   0x0000fffff7f9a6c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9a6cc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9a6d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a6d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a6d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a6dc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9a6e0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9a6e4:	14000030	b	0xfffff7f9a7a4
   0x0000fffff7f9a6e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a6ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a6f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a6f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a6f8:	54000120	b.eq	0xfffff7f9a71c  // b.none
   0x0000fffff7f9a6fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a700:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a704:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a708:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a70c:	54000321	b.ne	0xfffff7f9a770  // b.any
   0x0000fffff7f9a710:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9a714:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a718:	14000002	b	0xfffff7f9a720
   0x0000fffff7f9a71c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9a720:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9a724:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a728:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a72c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a730:	54000120	b.eq	0xfffff7f9a754  // b.none
   0x0000fffff7f9a734:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9a738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a73c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a740:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a744:	54000161	b.ne	0xfffff7f9a770  // b.any
   0x0000fffff7f9a748:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9a74c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a750:	14000002	b	0xfffff7f9a758
   0x0000fffff7f9a754:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9a758:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a75c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9a760:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a764:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a768:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9a76c:	17ffffde	b	0xfffff7f9a6e4
   0x0000fffff7f9a770:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a774:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a778:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a77c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a780:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f9a784:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a788:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a78c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a790:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a794:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a798:	d63f0200	blr	x16
   0x0000fffff7f9a79c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a7a0:	5400bc40	b.eq	0xfffff7f9bf28  // b.none
   0x0000fffff7f9a7a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9a7a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9a7ac:	540004a0	b.eq	0xfffff7f9a840  // b.none
   0x0000fffff7f9a7b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9a7b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9a7b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9a7bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9a7c0:	54000400	b.eq	0xfffff7f9a840  // b.none
   0x0000fffff7f9a7c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9a7c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9a7cc:	36d801d1	tbz	w17, #27, 0xfffff7f9a804
   0x0000fffff7f9a7d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9a7d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9a7d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9a7dc:	54000321	b.ne	0xfffff7f9a840  // b.any
   0x0000fffff7f9a7e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9a7e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a7e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9a7ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9a7f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9a7f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9a7f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9a7fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9a800:	54000209	b.ls	0xfffff7f9a840  // b.plast
   0x0000fffff7f9a804:	36d8008d	tbz	w13, #27, 0xfffff7f9a814
   0x0000fffff7f9a808:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9a80c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9a810:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9a814:	36d80091	tbz	w17, #27, 0xfffff7f9a824
   0x0000fffff7f9a818:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a81c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9a820:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9a824:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9a828:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9a82c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9a830:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9a834:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9a838:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9a83c:	1400000e	b	0xfffff7f9a874
   0x0000fffff7f9a840:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9a844:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a848:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a84c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a850:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f9a854:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a858:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a85c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9a860:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9a864:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a868:	d63f0200	blr	x16
   0x0000fffff7f9a86c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a870:	5400b600	b.eq	0xfffff7f9bf30  // b.none
   0x0000fffff7f9a874:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a878:	37d806a9	tbnz	w9, #27, 0xfffff7f9a94c
   0x0000fffff7f9a87c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a888:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a88c:	540001c1	b.ne	0xfffff7f9a8c4  // b.any
   0x0000fffff7f9a890:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9a894:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a898:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a89c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a8a0:	54000121	b.ne	0xfffff7f9a8c4  // b.any
   0x0000fffff7f9a8a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9a8a8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9a8ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9a8b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a8b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a8b8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9a8bc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9a8c0:	14000030	b	0xfffff7f9a980
   0x0000fffff7f9a8c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a8c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a8cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a8d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a8d4:	54000120	b.eq	0xfffff7f9a8f8  // b.none
   0x0000fffff7f9a8d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9a8dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a8e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a8e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a8e8:	54000321	b.ne	0xfffff7f9a94c  // b.any
   0x0000fffff7f9a8ec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9a8f0:	9e620120	scvtf	d0, x9
   0x0000fffff7f9a8f4:	14000002	b	0xfffff7f9a8fc
   0x0000fffff7f9a8f8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9a8fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9a900:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a904:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a908:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a90c:	54000120	b.eq	0xfffff7f9a930  // b.none
   0x0000fffff7f9a910:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9a914:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9a918:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a91c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9a920:	54000161	b.ne	0xfffff7f9a94c  // b.any
   0x0000fffff7f9a924:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9a928:	9e620121	scvtf	d1, x9
   0x0000fffff7f9a92c:	14000002	b	0xfffff7f9a934
   0x0000fffff7f9a930:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9a934:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9a938:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9a93c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9a940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9a944:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9a948:	17ffffde	b	0xfffff7f9a8c0
   0x0000fffff7f9a94c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9a950:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9a954:	aa1303e1	mov	x1, x19
   0x0000fffff7f9a958:	aa1503e2	mov	x2, x21
   0x0000fffff7f9a95c:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9a960:	aa1403e4	mov	x4, x20
   0x0000fffff7f9a964:	aa1603e5	mov	x5, x22
   0x0000fffff7f9a968:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9a96c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9a970:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9a974:	d63f0200	blr	x16
   0x0000fffff7f9a978:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9a97c:	5400ade0	b.eq	0xfffff7f9bf38  // b.none
   0x0000fffff7f9a980:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9a984:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9a988:	540004a0	b.eq	0xfffff7f9aa1c  // b.none
   0x0000fffff7f9a98c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9a990:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9a994:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9a998:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9a99c:	54000400	b.eq	0xfffff7f9aa1c  // b.none
   0x0000fffff7f9a9a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9a9a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9a9a8:	36d801d1	tbz	w17, #27, 0xfffff7f9a9e0
   0x0000fffff7f9a9ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9a9b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9a9b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9a9b8:	54000321	b.ne	0xfffff7f9aa1c  // b.any
   0x0000fffff7f9a9bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9a9c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a9c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9a9c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9a9cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9a9d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9a9d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9a9d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9a9dc:	54000209	b.ls	0xfffff7f9aa1c  // b.plast
   0x0000fffff7f9a9e0:	36d8008d	tbz	w13, #27, 0xfffff7f9a9f0
   0x0000fffff7f9a9e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9a9e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9a9ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9a9f0:	36d80091	tbz	w17, #27, 0xfffff7f9aa00
   0x0000fffff7f9a9f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9a9f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9a9fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9aa00:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9aa04:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9aa08:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9aa0c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9aa10:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9aa14:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9aa18:	1400000e	b	0xfffff7f9aa50
   0x0000fffff7f9aa1c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9aa20:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9aa24:	aa1303e1	mov	x1, x19
   0x0000fffff7f9aa28:	aa1503e2	mov	x2, x21
   0x0000fffff7f9aa2c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f9aa30:	aa1403e4	mov	x4, x20
   0x0000fffff7f9aa34:	aa1603e5	mov	x5, x22
   0x0000fffff7f9aa38:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9aa3c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9aa40:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9aa44:	d63f0200	blr	x16
   0x0000fffff7f9aa48:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9aa4c:	5400a7a0	b.eq	0xfffff7f9bf40  // b.none
   0x0000fffff7f9aa50:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9aa54:	37d806a9	tbnz	w9, #27, 0xfffff7f9ab28
   0x0000fffff7f9aa58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9aa5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aa60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aa64:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aa68:	540001c1	b.ne	0xfffff7f9aaa0  // b.any
   0x0000fffff7f9aa6c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9aa70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aa74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aa78:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aa7c:	54000121	b.ne	0xfffff7f9aaa0  // b.any
   0x0000fffff7f9aa80:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9aa84:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9aa88:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9aa8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aa90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aa94:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9aa98:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9aa9c:	14000030	b	0xfffff7f9ab5c
   0x0000fffff7f9aaa0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9aaa4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9aaa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aaac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aab0:	54000120	b.eq	0xfffff7f9aad4  // b.none
   0x0000fffff7f9aab4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9aab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aabc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aac4:	54000321	b.ne	0xfffff7f9ab28  // b.any
   0x0000fffff7f9aac8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9aacc:	9e620120	scvtf	d0, x9
   0x0000fffff7f9aad0:	14000002	b	0xfffff7f9aad8
   0x0000fffff7f9aad4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9aad8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9aadc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9aae0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aae4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aae8:	54000120	b.eq	0xfffff7f9ab0c  // b.none
   0x0000fffff7f9aaec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9aaf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aaf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aaf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aafc:	54000161	b.ne	0xfffff7f9ab28  // b.any
   0x0000fffff7f9ab00:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9ab04:	9e620121	scvtf	d1, x9
   0x0000fffff7f9ab08:	14000002	b	0xfffff7f9ab10
   0x0000fffff7f9ab0c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9ab10:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9ab14:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9ab18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ab1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ab20:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ab24:	17ffffde	b	0xfffff7f9aa9c
   0x0000fffff7f9ab28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ab2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ab30:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ab34:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ab38:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f9ab3c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ab40:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ab44:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ab48:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ab4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ab50:	d63f0200	blr	x16
   0x0000fffff7f9ab54:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ab58:	54009f80	b.eq	0xfffff7f9bf48  // b.none
   0x0000fffff7f9ab5c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9ab60:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9ab64:	540004a0	b.eq	0xfffff7f9abf8  // b.none
   0x0000fffff7f9ab68:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9ab6c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9ab70:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9ab74:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9ab78:	54000400	b.eq	0xfffff7f9abf8  // b.none
   0x0000fffff7f9ab7c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9ab80:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9ab84:	36d801d1	tbz	w17, #27, 0xfffff7f9abbc
   0x0000fffff7f9ab88:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9ab8c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9ab90:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9ab94:	54000321	b.ne	0xfffff7f9abf8  // b.any
   0x0000fffff7f9ab98:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9ab9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9aba0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9aba4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9aba8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9abac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9abb0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9abb4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9abb8:	54000209	b.ls	0xfffff7f9abf8  // b.plast
   0x0000fffff7f9abbc:	36d8008d	tbz	w13, #27, 0xfffff7f9abcc
   0x0000fffff7f9abc0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9abc4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9abc8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9abcc:	36d80091	tbz	w17, #27, 0xfffff7f9abdc
   0x0000fffff7f9abd0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9abd4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9abd8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9abdc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9abe0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9abe4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9abe8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9abec:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9abf0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9abf4:	1400000e	b	0xfffff7f9ac2c
   0x0000fffff7f9abf8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9abfc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ac00:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ac04:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ac08:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f9ac0c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ac10:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ac14:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9ac18:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ac1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ac20:	d63f0200	blr	x16
   0x0000fffff7f9ac24:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ac28:	54009940	b.eq	0xfffff7f9bf50  // b.none
   0x0000fffff7f9ac2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ac30:	37d806a9	tbnz	w9, #27, 0xfffff7f9ad04
   0x0000fffff7f9ac34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ac38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ac3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ac40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ac44:	540001c1	b.ne	0xfffff7f9ac7c  // b.any
   0x0000fffff7f9ac48:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ac4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ac50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ac54:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ac58:	54000121	b.ne	0xfffff7f9ac7c  // b.any
   0x0000fffff7f9ac5c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ac60:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9ac64:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ac68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ac6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ac70:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9ac74:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ac78:	14000030	b	0xfffff7f9ad38
   0x0000fffff7f9ac7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ac80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ac84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ac88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ac8c:	54000120	b.eq	0xfffff7f9acb0  // b.none
   0x0000fffff7f9ac90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ac94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ac98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ac9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aca0:	54000321	b.ne	0xfffff7f9ad04  // b.any
   0x0000fffff7f9aca4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9aca8:	9e620120	scvtf	d0, x9
   0x0000fffff7f9acac:	14000002	b	0xfffff7f9acb4
   0x0000fffff7f9acb0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9acb4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9acb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9acbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9acc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9acc4:	54000120	b.eq	0xfffff7f9ace8  // b.none
   0x0000fffff7f9acc8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9accc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9acd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9acd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9acd8:	54000161	b.ne	0xfffff7f9ad04  // b.any
   0x0000fffff7f9acdc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9ace0:	9e620121	scvtf	d1, x9
   0x0000fffff7f9ace4:	14000002	b	0xfffff7f9acec
   0x0000fffff7f9ace8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9acec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9acf0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9acf4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9acf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9acfc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ad00:	17ffffde	b	0xfffff7f9ac78
   0x0000fffff7f9ad04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ad08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ad0c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ad10:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ad14:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9ad18:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ad1c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ad20:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ad24:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ad28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ad2c:	d63f0200	blr	x16
   0x0000fffff7f9ad30:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ad34:	54009120	b.eq	0xfffff7f9bf58  // b.none
   0x0000fffff7f9ad38:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9ad3c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9ad40:	540004a0	b.eq	0xfffff7f9add4  // b.none
   0x0000fffff7f9ad44:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9ad48:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9ad4c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9ad50:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9ad54:	54000400	b.eq	0xfffff7f9add4  // b.none
   0x0000fffff7f9ad58:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9ad5c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9ad60:	36d801d1	tbz	w17, #27, 0xfffff7f9ad98
   0x0000fffff7f9ad64:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9ad68:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9ad6c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9ad70:	54000321	b.ne	0xfffff7f9add4  // b.any
   0x0000fffff7f9ad74:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9ad78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ad7c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9ad80:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9ad84:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9ad88:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9ad8c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9ad90:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9ad94:	54000209	b.ls	0xfffff7f9add4  // b.plast
   0x0000fffff7f9ad98:	36d8008d	tbz	w13, #27, 0xfffff7f9ada8
   0x0000fffff7f9ad9c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9ada0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9ada4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9ada8:	36d80091	tbz	w17, #27, 0xfffff7f9adb8
   0x0000fffff7f9adac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9adb0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9adb4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9adb8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9adbc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9adc0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9adc4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9adc8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9adcc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9add0:	1400000e	b	0xfffff7f9ae08
   0x0000fffff7f9add4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9add8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9addc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ade0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ade4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f9ade8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9adec:	aa1603e5	mov	x5, x22
   0x0000fffff7f9adf0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9adf4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9adf8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9adfc:	d63f0200	blr	x16
   0x0000fffff7f9ae00:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ae04:	54008ae0	b.eq	0xfffff7f9bf60  // b.none
   0x0000fffff7f9ae08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ae0c:	37d806a9	tbnz	w9, #27, 0xfffff7f9aee0
   0x0000fffff7f9ae10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ae14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ae18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ae1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ae20:	540001c1	b.ne	0xfffff7f9ae58  // b.any
   0x0000fffff7f9ae24:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ae28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ae2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ae30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ae34:	54000121	b.ne	0xfffff7f9ae58  // b.any
   0x0000fffff7f9ae38:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ae3c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9ae40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ae44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ae48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ae4c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9ae50:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ae54:	14000030	b	0xfffff7f9af14
   0x0000fffff7f9ae58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ae5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ae60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ae64:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ae68:	54000120	b.eq	0xfffff7f9ae8c  // b.none
   0x0000fffff7f9ae6c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ae70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ae74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ae78:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ae7c:	54000321	b.ne	0xfffff7f9aee0  // b.any
   0x0000fffff7f9ae80:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ae84:	9e620120	scvtf	d0, x9
   0x0000fffff7f9ae88:	14000002	b	0xfffff7f9ae90
   0x0000fffff7f9ae8c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9ae90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ae94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ae98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ae9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aea0:	54000120	b.eq	0xfffff7f9aec4  // b.none
   0x0000fffff7f9aea4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9aea8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aeac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aeb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9aeb4:	54000161	b.ne	0xfffff7f9aee0  // b.any
   0x0000fffff7f9aeb8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9aebc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9aec0:	14000002	b	0xfffff7f9aec8
   0x0000fffff7f9aec4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9aec8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9aecc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9aed0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9aed4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aed8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9aedc:	17ffffde	b	0xfffff7f9ae54
   0x0000fffff7f9aee0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9aee4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9aee8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9aeec:	aa1503e2	mov	x2, x21
   0x0000fffff7f9aef0:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f9aef4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9aef8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9aefc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9af00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9af04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9af08:	d63f0200	blr	x16
   0x0000fffff7f9af0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9af10:	540082c0	b.eq	0xfffff7f9bf68  // b.none
   0x0000fffff7f9af14:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9af18:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9af1c:	540004a0	b.eq	0xfffff7f9afb0  // b.none
   0x0000fffff7f9af20:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9af24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9af28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9af2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9af30:	54000400	b.eq	0xfffff7f9afb0  // b.none
   0x0000fffff7f9af34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9af38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9af3c:	36d801d1	tbz	w17, #27, 0xfffff7f9af74
   0x0000fffff7f9af40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9af44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9af48:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9af4c:	54000321	b.ne	0xfffff7f9afb0  // b.any
   0x0000fffff7f9af50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9af54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9af58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9af5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9af60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9af64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9af68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9af6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9af70:	54000209	b.ls	0xfffff7f9afb0  // b.plast
   0x0000fffff7f9af74:	36d8008d	tbz	w13, #27, 0xfffff7f9af84
   0x0000fffff7f9af78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9af7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9af80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9af84:	36d80091	tbz	w17, #27, 0xfffff7f9af94
   0x0000fffff7f9af88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9af8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9af90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9af94:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9af98:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9af9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9afa0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9afa4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9afa8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9afac:	1400000e	b	0xfffff7f9afe4
   0x0000fffff7f9afb0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9afb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9afb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9afbc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9afc0:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f9afc4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9afc8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9afcc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9afd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9afd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9afd8:	d63f0200	blr	x16
   0x0000fffff7f9afdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9afe0:	54007c80	b.eq	0xfffff7f9bf70  // b.none
   0x0000fffff7f9afe4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9afe8:	37d806a9	tbnz	w9, #27, 0xfffff7f9b0bc
   0x0000fffff7f9afec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9aff0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9aff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9aff8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9affc:	540001c1	b.ne	0xfffff7f9b034  // b.any
   0x0000fffff7f9b000:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b004:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b00c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b010:	54000121	b.ne	0xfffff7f9b034  // b.any
   0x0000fffff7f9b014:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b018:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9b01c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b020:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b024:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b028:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9b02c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b030:	14000030	b	0xfffff7f9b0f0
   0x0000fffff7f9b034:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b038:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b03c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b040:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b044:	54000120	b.eq	0xfffff7f9b068  // b.none
   0x0000fffff7f9b048:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b04c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b050:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b054:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b058:	54000321	b.ne	0xfffff7f9b0bc  // b.any
   0x0000fffff7f9b05c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b060:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b064:	14000002	b	0xfffff7f9b06c
   0x0000fffff7f9b068:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9b06c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b070:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b078:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b07c:	54000120	b.eq	0xfffff7f9b0a0  // b.none
   0x0000fffff7f9b080:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b084:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b088:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b08c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b090:	54000161	b.ne	0xfffff7f9b0bc  // b.any
   0x0000fffff7f9b094:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9b098:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b09c:	14000002	b	0xfffff7f9b0a4
   0x0000fffff7f9b0a0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9b0a4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b0a8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9b0ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b0b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b0b4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b0b8:	17ffffde	b	0xfffff7f9b030
   0x0000fffff7f9b0bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b0c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b0c4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b0c8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b0cc:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f9b0d0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b0d4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b0d8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b0dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b0e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b0e4:	d63f0200	blr	x16
   0x0000fffff7f9b0e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b0ec:	54007460	b.eq	0xfffff7f9bf78  // b.none
   0x0000fffff7f9b0f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9b0f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9b0f8:	540004a0	b.eq	0xfffff7f9b18c  // b.none
   0x0000fffff7f9b0fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9b100:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9b104:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9b108:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9b10c:	54000400	b.eq	0xfffff7f9b18c  // b.none
   0x0000fffff7f9b110:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9b114:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9b118:	36d801d1	tbz	w17, #27, 0xfffff7f9b150
   0x0000fffff7f9b11c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9b120:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9b124:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9b128:	54000321	b.ne	0xfffff7f9b18c  // b.any
   0x0000fffff7f9b12c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9b130:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b134:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9b138:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9b13c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9b140:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9b144:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9b148:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9b14c:	54000209	b.ls	0xfffff7f9b18c  // b.plast
   0x0000fffff7f9b150:	36d8008d	tbz	w13, #27, 0xfffff7f9b160
   0x0000fffff7f9b154:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9b158:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9b15c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9b160:	36d80091	tbz	w17, #27, 0xfffff7f9b170
   0x0000fffff7f9b164:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b168:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9b16c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9b170:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9b174:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9b178:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9b17c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9b180:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9b184:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9b188:	1400000e	b	0xfffff7f9b1c0
   0x0000fffff7f9b18c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b190:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b194:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b198:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b19c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f9b1a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b1a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b1a8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b1ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b1b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b1b4:	d63f0200	blr	x16
   0x0000fffff7f9b1b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b1bc:	54006e20	b.eq	0xfffff7f9bf80  // b.none
   0x0000fffff7f9b1c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b1c4:	37d806a9	tbnz	w9, #27, 0xfffff7f9b298
   0x0000fffff7f9b1c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b1cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b1d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b1d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b1d8:	540001c1	b.ne	0xfffff7f9b210  // b.any
   0x0000fffff7f9b1dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b1e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b1e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b1e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b1ec:	54000121	b.ne	0xfffff7f9b210  // b.any
   0x0000fffff7f9b1f0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b1f4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9b1f8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b1fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b200:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b204:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9b208:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b20c:	14000030	b	0xfffff7f9b2cc
   0x0000fffff7f9b210:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b214:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b218:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b21c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b220:	54000120	b.eq	0xfffff7f9b244  // b.none
   0x0000fffff7f9b224:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b228:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b22c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b230:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b234:	54000321	b.ne	0xfffff7f9b298  // b.any
   0x0000fffff7f9b238:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b23c:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b240:	14000002	b	0xfffff7f9b248
   0x0000fffff7f9b244:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9b248:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b24c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b250:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b254:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b258:	54000120	b.eq	0xfffff7f9b27c  // b.none
   0x0000fffff7f9b25c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b260:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b264:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b268:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b26c:	54000161	b.ne	0xfffff7f9b298  // b.any
   0x0000fffff7f9b270:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9b274:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b278:	14000002	b	0xfffff7f9b280
   0x0000fffff7f9b27c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9b280:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b284:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9b288:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b28c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b290:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b294:	17ffffde	b	0xfffff7f9b20c
   0x0000fffff7f9b298:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b29c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b2a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b2a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b2a8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f9b2ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b2b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b2b4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b2b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b2bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b2c0:	d63f0200	blr	x16
   0x0000fffff7f9b2c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b2c8:	54006600	b.eq	0xfffff7f9bf88  // b.none
   0x0000fffff7f9b2cc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9b2d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9b2d4:	540004a0	b.eq	0xfffff7f9b368  // b.none
   0x0000fffff7f9b2d8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9b2dc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9b2e0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9b2e4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9b2e8:	54000400	b.eq	0xfffff7f9b368  // b.none
   0x0000fffff7f9b2ec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9b2f0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9b2f4:	36d801d1	tbz	w17, #27, 0xfffff7f9b32c
   0x0000fffff7f9b2f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9b2fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9b300:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9b304:	54000321	b.ne	0xfffff7f9b368  // b.any
   0x0000fffff7f9b308:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9b30c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b310:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9b314:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9b318:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9b31c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9b320:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9b324:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9b328:	54000209	b.ls	0xfffff7f9b368  // b.plast
   0x0000fffff7f9b32c:	36d8008d	tbz	w13, #27, 0xfffff7f9b33c
   0x0000fffff7f9b330:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9b334:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9b338:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9b33c:	36d80091	tbz	w17, #27, 0xfffff7f9b34c
   0x0000fffff7f9b340:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b344:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9b348:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9b34c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9b350:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9b354:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9b358:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9b35c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9b360:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9b364:	1400000e	b	0xfffff7f9b39c
   0x0000fffff7f9b368:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b36c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b370:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b374:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b378:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f9b37c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b380:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b384:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b388:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b38c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b390:	d63f0200	blr	x16
   0x0000fffff7f9b394:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b398:	54005fc0	b.eq	0xfffff7f9bf90  // b.none
   0x0000fffff7f9b39c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b3a0:	37d806a9	tbnz	w9, #27, 0xfffff7f9b474
   0x0000fffff7f9b3a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b3a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b3ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b3b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b3b4:	540001c1	b.ne	0xfffff7f9b3ec  // b.any
   0x0000fffff7f9b3b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b3bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b3c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b3c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b3c8:	54000121	b.ne	0xfffff7f9b3ec  // b.any
   0x0000fffff7f9b3cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b3d0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9b3d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b3d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b3dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b3e0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9b3e4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b3e8:	14000030	b	0xfffff7f9b4a8
   0x0000fffff7f9b3ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b3f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b3f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b3f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b3fc:	54000120	b.eq	0xfffff7f9b420  // b.none
   0x0000fffff7f9b400:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b404:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b408:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b40c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b410:	54000321	b.ne	0xfffff7f9b474  // b.any
   0x0000fffff7f9b414:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b418:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b41c:	14000002	b	0xfffff7f9b424
   0x0000fffff7f9b420:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9b424:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b428:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b42c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b430:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b434:	54000120	b.eq	0xfffff7f9b458  // b.none
   0x0000fffff7f9b438:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b43c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b440:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b444:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b448:	54000161	b.ne	0xfffff7f9b474  // b.any
   0x0000fffff7f9b44c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9b450:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b454:	14000002	b	0xfffff7f9b45c
   0x0000fffff7f9b458:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9b45c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b460:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9b464:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b468:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b46c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b470:	17ffffde	b	0xfffff7f9b3e8
   0x0000fffff7f9b474:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b478:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b47c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b480:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b484:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f9b488:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b48c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b490:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b494:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b498:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b49c:	d63f0200	blr	x16
   0x0000fffff7f9b4a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b4a4:	540057a0	b.eq	0xfffff7f9bf98  // b.none
   0x0000fffff7f9b4a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9b4ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9b4b0:	540004a0	b.eq	0xfffff7f9b544  // b.none
   0x0000fffff7f9b4b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9b4b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9b4bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9b4c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9b4c4:	54000400	b.eq	0xfffff7f9b544  // b.none
   0x0000fffff7f9b4c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9b4cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9b4d0:	36d801d1	tbz	w17, #27, 0xfffff7f9b508
   0x0000fffff7f9b4d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9b4d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9b4dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9b4e0:	54000321	b.ne	0xfffff7f9b544  // b.any
   0x0000fffff7f9b4e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9b4e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b4ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9b4f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9b4f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9b4f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9b4fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9b500:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9b504:	54000209	b.ls	0xfffff7f9b544  // b.plast
   0x0000fffff7f9b508:	36d8008d	tbz	w13, #27, 0xfffff7f9b518
   0x0000fffff7f9b50c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9b510:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9b514:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9b518:	36d80091	tbz	w17, #27, 0xfffff7f9b528
   0x0000fffff7f9b51c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b520:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9b524:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9b528:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9b52c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9b530:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9b534:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9b538:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9b53c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9b540:	1400000e	b	0xfffff7f9b578
   0x0000fffff7f9b544:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b548:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b54c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b550:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b554:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f9b558:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b55c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b560:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b564:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b568:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b56c:	d63f0200	blr	x16
   0x0000fffff7f9b570:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b574:	54005160	b.eq	0xfffff7f9bfa0  // b.none
   0x0000fffff7f9b578:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b57c:	37d806a9	tbnz	w9, #27, 0xfffff7f9b650
   0x0000fffff7f9b580:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b584:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b58c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b590:	540001c1	b.ne	0xfffff7f9b5c8  // b.any
   0x0000fffff7f9b594:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b598:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b59c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b5a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b5a4:	54000121	b.ne	0xfffff7f9b5c8  // b.any
   0x0000fffff7f9b5a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b5ac:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9b5b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b5b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b5b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b5bc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9b5c0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b5c4:	14000030	b	0xfffff7f9b684
   0x0000fffff7f9b5c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b5cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b5d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b5d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b5d8:	54000120	b.eq	0xfffff7f9b5fc  // b.none
   0x0000fffff7f9b5dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b5e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b5e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b5e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b5ec:	54000321	b.ne	0xfffff7f9b650  // b.any
   0x0000fffff7f9b5f0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b5f4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b5f8:	14000002	b	0xfffff7f9b600
   0x0000fffff7f9b5fc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9b600:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b604:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b60c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b610:	54000120	b.eq	0xfffff7f9b634  // b.none
   0x0000fffff7f9b614:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b61c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b620:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b624:	54000161	b.ne	0xfffff7f9b650  // b.any
   0x0000fffff7f9b628:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9b62c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b630:	14000002	b	0xfffff7f9b638
   0x0000fffff7f9b634:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9b638:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b63c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9b640:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b648:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b64c:	17ffffde	b	0xfffff7f9b5c4
   0x0000fffff7f9b650:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b654:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b658:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b65c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b660:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f9b664:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b668:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b66c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b670:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b674:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b678:	d63f0200	blr	x16
   0x0000fffff7f9b67c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b680:	54004940	b.eq	0xfffff7f9bfa8  // b.none
   0x0000fffff7f9b684:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9b688:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9b68c:	540004a0	b.eq	0xfffff7f9b720  // b.none
   0x0000fffff7f9b690:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9b694:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9b698:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9b69c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9b6a0:	54000400	b.eq	0xfffff7f9b720  // b.none
   0x0000fffff7f9b6a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9b6a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9b6ac:	36d801d1	tbz	w17, #27, 0xfffff7f9b6e4
   0x0000fffff7f9b6b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9b6b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9b6b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9b6bc:	54000321	b.ne	0xfffff7f9b720  // b.any
   0x0000fffff7f9b6c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9b6c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b6c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9b6cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9b6d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9b6d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9b6d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9b6dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9b6e0:	54000209	b.ls	0xfffff7f9b720  // b.plast
   0x0000fffff7f9b6e4:	36d8008d	tbz	w13, #27, 0xfffff7f9b6f4
   0x0000fffff7f9b6e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9b6ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9b6f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9b6f4:	36d80091	tbz	w17, #27, 0xfffff7f9b704
   0x0000fffff7f9b6f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b6fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9b700:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9b704:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9b708:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9b70c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9b710:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9b714:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9b718:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9b71c:	1400000e	b	0xfffff7f9b754
   0x0000fffff7f9b720:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b724:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b728:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b72c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b730:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f9b734:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b738:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b73c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b740:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b744:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b748:	d63f0200	blr	x16
   0x0000fffff7f9b74c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b750:	54004300	b.eq	0xfffff7f9bfb0  // b.none
   0x0000fffff7f9b754:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b758:	37d806a9	tbnz	w9, #27, 0xfffff7f9b82c
   0x0000fffff7f9b75c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b760:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b764:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b768:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b76c:	540001c1	b.ne	0xfffff7f9b7a4  // b.any
   0x0000fffff7f9b770:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b774:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b778:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b77c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b780:	54000121	b.ne	0xfffff7f9b7a4  // b.any
   0x0000fffff7f9b784:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b788:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9b78c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b790:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b794:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b798:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9b79c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b7a0:	14000030	b	0xfffff7f9b860
   0x0000fffff7f9b7a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b7a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b7ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b7b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b7b4:	54000120	b.eq	0xfffff7f9b7d8  // b.none
   0x0000fffff7f9b7b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b7bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b7c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b7c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b7c8:	54000321	b.ne	0xfffff7f9b82c  // b.any
   0x0000fffff7f9b7cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b7d0:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b7d4:	14000002	b	0xfffff7f9b7dc
   0x0000fffff7f9b7d8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9b7dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b7e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b7e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b7e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b7ec:	54000120	b.eq	0xfffff7f9b810  // b.none
   0x0000fffff7f9b7f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b7f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b7f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b7fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b800:	54000161	b.ne	0xfffff7f9b82c  // b.any
   0x0000fffff7f9b804:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9b808:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b80c:	14000002	b	0xfffff7f9b814
   0x0000fffff7f9b810:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9b814:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b818:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9b81c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b820:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b824:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b828:	17ffffde	b	0xfffff7f9b7a0
   0x0000fffff7f9b82c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9b830:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b834:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b838:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b83c:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f9b840:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b844:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b848:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9b84c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9b850:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b854:	d63f0200	blr	x16
   0x0000fffff7f9b858:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b85c:	54003ae0	b.eq	0xfffff7f9bfb8  // b.none
   0x0000fffff7f9b860:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9b864:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9b868:	540004a0	b.eq	0xfffff7f9b8fc  // b.none
   0x0000fffff7f9b86c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9b870:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9b874:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9b878:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9b87c:	54000400	b.eq	0xfffff7f9b8fc  // b.none
   0x0000fffff7f9b880:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9b884:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9b888:	36d801d1	tbz	w17, #27, 0xfffff7f9b8c0
   0x0000fffff7f9b88c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9b890:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9b894:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9b898:	54000321	b.ne	0xfffff7f9b8fc  // b.any
   0x0000fffff7f9b89c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9b8a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b8a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9b8a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9b8ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9b8b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9b8b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9b8b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9b8bc:	54000209	b.ls	0xfffff7f9b8fc  // b.plast
   0x0000fffff7f9b8c0:	36d8008d	tbz	w13, #27, 0xfffff7f9b8d0
   0x0000fffff7f9b8c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9b8c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9b8cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9b8d0:	36d80091	tbz	w17, #27, 0xfffff7f9b8e0
   0x0000fffff7f9b8d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9b8d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9b8dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9b8e0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9b8e4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9b8e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9b8ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9b8f0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9b8f4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9b8f8:	1400000e	b	0xfffff7f9b930
   0x0000fffff7f9b8fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9b900:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9b904:	aa1303e1	mov	x1, x19
   0x0000fffff7f9b908:	aa1503e2	mov	x2, x21
   0x0000fffff7f9b90c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f9b910:	aa1403e4	mov	x4, x20
   0x0000fffff7f9b914:	aa1603e5	mov	x5, x22
   0x0000fffff7f9b918:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9b91c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9b920:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9b924:	d63f0200	blr	x16
   0x0000fffff7f9b928:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9b92c:	540034a0	b.eq	0xfffff7f9bfc0  // b.none
   0x0000fffff7f9b930:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b934:	37d806a9	tbnz	w9, #27, 0xfffff7f9ba08
   0x0000fffff7f9b938:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b93c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b944:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b948:	540001c1	b.ne	0xfffff7f9b980  // b.any
   0x0000fffff7f9b94c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b958:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b95c:	54000121	b.ne	0xfffff7f9b980  // b.any
   0x0000fffff7f9b960:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b964:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9b968:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9b96c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b974:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9b978:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9b97c:	14000030	b	0xfffff7f9ba3c
   0x0000fffff7f9b980:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b984:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b988:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b98c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b990:	54000120	b.eq	0xfffff7f9b9b4  // b.none
   0x0000fffff7f9b994:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9b998:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b99c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b9a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b9a4:	54000321	b.ne	0xfffff7f9ba08  // b.any
   0x0000fffff7f9b9a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9b9ac:	9e620120	scvtf	d0, x9
   0x0000fffff7f9b9b0:	14000002	b	0xfffff7f9b9b8
   0x0000fffff7f9b9b4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9b9b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b9bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b9c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b9c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b9c8:	54000120	b.eq	0xfffff7f9b9ec  // b.none
   0x0000fffff7f9b9cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9b9d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9b9d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9b9d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9b9dc:	54000161	b.ne	0xfffff7f9ba08  // b.any
   0x0000fffff7f9b9e0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9b9e4:	9e620121	scvtf	d1, x9
   0x0000fffff7f9b9e8:	14000002	b	0xfffff7f9b9f0
   0x0000fffff7f9b9ec:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9b9f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9b9f4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9b9f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9b9fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ba00:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ba04:	17ffffde	b	0xfffff7f9b97c
   0x0000fffff7f9ba08:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ba0c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ba10:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ba14:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ba18:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f9ba1c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ba20:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ba24:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9ba28:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9ba2c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ba30:	d63f0200	blr	x16
   0x0000fffff7f9ba34:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ba38:	54002c80	b.eq	0xfffff7f9bfc8  // b.none
   0x0000fffff7f9ba3c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9ba40:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9ba44:	540004a0	b.eq	0xfffff7f9bad8  // b.none
   0x0000fffff7f9ba48:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9ba4c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9ba50:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9ba54:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9ba58:	54000400	b.eq	0xfffff7f9bad8  // b.none
   0x0000fffff7f9ba5c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9ba60:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9ba64:	36d801d1	tbz	w17, #27, 0xfffff7f9ba9c
   0x0000fffff7f9ba68:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9ba6c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9ba70:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9ba74:	54000321	b.ne	0xfffff7f9bad8  // b.any
   0x0000fffff7f9ba78:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9ba7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9ba80:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9ba84:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9ba88:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9ba8c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9ba90:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9ba94:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9ba98:	54000209	b.ls	0xfffff7f9bad8  // b.plast
   0x0000fffff7f9ba9c:	36d8008d	tbz	w13, #27, 0xfffff7f9baac
   0x0000fffff7f9baa0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9baa4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9baa8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9baac:	36d80091	tbz	w17, #27, 0xfffff7f9babc
   0x0000fffff7f9bab0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9bab4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9bab8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9babc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9bac0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9bac4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9bac8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9bacc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9bad0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9bad4:	1400000e	b	0xfffff7f9bb0c
   0x0000fffff7f9bad8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9badc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bae0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bae4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bae8:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f9baec:	aa1403e4	mov	x4, x20
   0x0000fffff7f9baf0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9baf4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9baf8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9bafc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bb00:	d63f0200	blr	x16
   0x0000fffff7f9bb04:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bb08:	54002640	b.eq	0xfffff7f9bfd0  // b.none
   0x0000fffff7f9bb0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9bb10:	37d806a9	tbnz	w9, #27, 0xfffff7f9bbe4
   0x0000fffff7f9bb14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9bb18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bb1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bb20:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bb24:	540001c1	b.ne	0xfffff7f9bb5c  // b.any
   0x0000fffff7f9bb28:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9bb2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bb30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bb34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bb38:	54000121	b.ne	0xfffff7f9bb5c  // b.any
   0x0000fffff7f9bb3c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9bb40:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9bb44:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9bb48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bb4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bb50:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9bb54:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9bb58:	14000030	b	0xfffff7f9bc18
   0x0000fffff7f9bb5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9bb60:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bb64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bb68:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bb6c:	54000120	b.eq	0xfffff7f9bb90  // b.none
   0x0000fffff7f9bb70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9bb74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bb78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bb7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bb80:	54000321	b.ne	0xfffff7f9bbe4  // b.any
   0x0000fffff7f9bb84:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9bb88:	9e620120	scvtf	d0, x9
   0x0000fffff7f9bb8c:	14000002	b	0xfffff7f9bb94
   0x0000fffff7f9bb90:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9bb94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9bb98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bb9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bba0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bba4:	54000120	b.eq	0xfffff7f9bbc8  // b.none
   0x0000fffff7f9bba8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9bbac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bbb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bbb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bbb8:	54000161	b.ne	0xfffff7f9bbe4  // b.any
   0x0000fffff7f9bbbc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9bbc0:	9e620121	scvtf	d1, x9
   0x0000fffff7f9bbc4:	14000002	b	0xfffff7f9bbcc
   0x0000fffff7f9bbc8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9bbcc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9bbd0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9bbd4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bbd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bbdc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9bbe0:	17ffffde	b	0xfffff7f9bb58
   0x0000fffff7f9bbe4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9bbe8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bbec:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bbf0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bbf4:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f9bbf8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9bbfc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9bc00:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9bc04:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9bc08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bc0c:	d63f0200	blr	x16
   0x0000fffff7f9bc10:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bc14:	54001e20	b.eq	0xfffff7f9bfd8  // b.none
   0x0000fffff7f9bc18:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9bc1c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9bc20:	540004a0	b.eq	0xfffff7f9bcb4  // b.none
   0x0000fffff7f9bc24:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9bc28:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9bc2c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9bc30:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9bc34:	54000400	b.eq	0xfffff7f9bcb4  // b.none
   0x0000fffff7f9bc38:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9bc3c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9bc40:	36d801d1	tbz	w17, #27, 0xfffff7f9bc78
   0x0000fffff7f9bc44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9bc48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9bc4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9bc50:	54000321	b.ne	0xfffff7f9bcb4  // b.any
   0x0000fffff7f9bc54:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9bc58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9bc5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9bc60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9bc64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9bc68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9bc6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9bc70:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9bc74:	54000209	b.ls	0xfffff7f9bcb4  // b.plast
   0x0000fffff7f9bc78:	36d8008d	tbz	w13, #27, 0xfffff7f9bc88
   0x0000fffff7f9bc7c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9bc80:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9bc84:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9bc88:	36d80091	tbz	w17, #27, 0xfffff7f9bc98
   0x0000fffff7f9bc8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9bc90:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9bc94:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9bc98:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9bc9c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9bca0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9bca4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9bca8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9bcac:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9bcb0:	1400000e	b	0xfffff7f9bce8
   0x0000fffff7f9bcb4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9bcb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bcbc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bcc0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bcc4:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f9bcc8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9bccc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9bcd0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f9bcd4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9bcd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bcdc:	d63f0200	blr	x16
   0x0000fffff7f9bce0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bce4:	540017e0	b.eq	0xfffff7f9bfe0  // b.none
   0x0000fffff7f9bce8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9bcec:	37d806a9	tbnz	w9, #27, 0xfffff7f9bdc0
   0x0000fffff7f9bcf0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9bcf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bcf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bcfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd00:	540001c1	b.ne	0xfffff7f9bd38  // b.any
   0x0000fffff7f9bd04:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9bd08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bd0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd14:	54000121	b.ne	0xfffff7f9bd38  // b.any
   0x0000fffff7f9bd18:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9bd1c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9bd20:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9bd24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bd28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd2c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9bd30:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9bd34:	14000030	b	0xfffff7f9bdf4
   0x0000fffff7f9bd38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9bd3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bd40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd48:	54000120	b.eq	0xfffff7f9bd6c  // b.none
   0x0000fffff7f9bd4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9bd50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bd54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd58:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd5c:	54000321	b.ne	0xfffff7f9bdc0  // b.any
   0x0000fffff7f9bd60:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9bd64:	9e620120	scvtf	d0, x9
   0x0000fffff7f9bd68:	14000002	b	0xfffff7f9bd70
   0x0000fffff7f9bd6c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9bd70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9bd74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bd78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd80:	54000120	b.eq	0xfffff7f9bda4  // b.none
   0x0000fffff7f9bd84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9bd88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bd8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bd90:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9bd94:	54000161	b.ne	0xfffff7f9bdc0  // b.any
   0x0000fffff7f9bd98:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9bd9c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9bda0:	14000002	b	0xfffff7f9bda8
   0x0000fffff7f9bda4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9bda8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9bdac:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9bdb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9bdb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bdb8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9bdbc:	17ffffde	b	0xfffff7f9bd34
   0x0000fffff7f9bdc0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9bdc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9bdc8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9bdcc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9bdd0:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f9bdd4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9bdd8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9bddc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9bde0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9bde4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bde8:	d63f0200	blr	x16
   0x0000fffff7f9bdec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9bdf0:	54000fc0	b.eq	0xfffff7f9bfe8  // b.none
   0x0000fffff7f9bdf4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9bdf8:	37d80269	tbnz	w9, #27, 0xfffff7f9be44
   0x0000fffff7f9bdfc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9be00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9be04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9be08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9be0c:	540001c1	b.ne	0xfffff7f9be44  // b.any
   0x0000fffff7f9be10:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9be14:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f9be18:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f9be1c:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f9be20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9be24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9be28:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f9be2c:	aa0b03e9	mov	x9, x11
   0x0000fffff7f9be30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9be34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9be38:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f9be3c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f9be40:	1400000e	b	0xfffff7f9be78
   0x0000fffff7f9be44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9be48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9be4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9be50:	aa1503e2	mov	x2, x21
   0x0000fffff7f9be54:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f9be58:	aa1403e4	mov	x4, x20
   0x0000fffff7f9be5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9be60:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f9be64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9be68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9be6c:	d63f0200	blr	x16
   0x0000fffff7f9be70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9be74:	54000be0	b.eq	0xfffff7f9bff0  // b.none
   0x0000fffff7f9be78:	17fff8d2	b	0xfffff7f9a1c0
   0x0000fffff7f9be7c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9be80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9be84:	aa1303e1	mov	x1, x19
   0x0000fffff7f9be88:	aa1503e2	mov	x2, x21
   0x0000fffff7f9be8c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f9be90:	aa1403e4	mov	x4, x20
   0x0000fffff7f9be94:	aa1603e5	mov	x5, x22
   0x0000fffff7f9be98:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f9be9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9bea0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9bea4:	d63f0200	blr	x16
   0x0000fffff7f9bea8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9beac:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9beb0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9beb4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9beb8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f9bebc:	d65f03c0	ret
   0x0000fffff7f9bec0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9bec4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9bec8:	b900028a	str	w10, [x20]
   0x0000fffff7f9becc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9bed0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9bed4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9bed8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9bedc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9bee0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f9bee4:	d65f03c0	ret
   0x0000fffff7f9bee8:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f9beec:	17fffff5	b	0xfffff7f9bec0
   0x0000fffff7f9bef0:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f9bef4:	17fffff3	b	0xfffff7f9bec0
   0x0000fffff7f9bef8:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f9befc:	17fffff1	b	0xfffff7f9bec0
   0x0000fffff7f9bf00:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f9bf04:	17ffffef	b	0xfffff7f9bec0
   0x0000fffff7f9bf08:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f9bf0c:	17ffffed	b	0xfffff7f9bec0
   0x0000fffff7f9bf10:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f9bf14:	17ffffeb	b	0xfffff7f9bec0
   0x0000fffff7f9bf18:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f9bf1c:	17ffffe9	b	0xfffff7f9bec0
   0x0000fffff7f9bf20:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f9bf24:	17ffffe7	b	0xfffff7f9bec0
   0x0000fffff7f9bf28:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f9bf2c:	17ffffe5	b	0xfffff7f9bec0
   0x0000fffff7f9bf30:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f9bf34:	17ffffe3	b	0xfffff7f9bec0
   0x0000fffff7f9bf38:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f9bf3c:	17ffffe1	b	0xfffff7f9bec0
   0x0000fffff7f9bf40:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f9bf44:	17ffffdf	b	0xfffff7f9bec0
   0x0000fffff7f9bf48:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f9bf4c:	17ffffdd	b	0xfffff7f9bec0
   0x0000fffff7f9bf50:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f9bf54:	17ffffdb	b	0xfffff7f9bec0
   0x0000fffff7f9bf58:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f9bf5c:	17ffffd9	b	0xfffff7f9bec0
   0x0000fffff7f9bf60:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f9bf64:	17ffffd7	b	0xfffff7f9bec0
   0x0000fffff7f9bf68:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f9bf6c:	17ffffd5	b	0xfffff7f9bec0
   0x0000fffff7f9bf70:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f9bf74:	17ffffd3	b	0xfffff7f9bec0
   0x0000fffff7f9bf78:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f9bf7c:	17ffffd1	b	0xfffff7f9bec0
   0x0000fffff7f9bf80:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f9bf84:	17ffffcf	b	0xfffff7f9bec0
   0x0000fffff7f9bf88:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f9bf8c:	17ffffcd	b	0xfffff7f9bec0
   0x0000fffff7f9bf90:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f9bf94:	17ffffcb	b	0xfffff7f9bec0
   0x0000fffff7f9bf98:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f9bf9c:	17ffffc9	b	0xfffff7f9bec0
   0x0000fffff7f9bfa0:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f9bfa4:	17ffffc7	b	0xfffff7f9bec0
   0x0000fffff7f9bfa8:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f9bfac:	17ffffc5	b	0xfffff7f9bec0
   0x0000fffff7f9bfb0:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f9bfb4:	17ffffc3	b	0xfffff7f9bec0
   0x0000fffff7f9bfb8:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f9bfbc:	17ffffc1	b	0xfffff7f9bec0
   0x0000fffff7f9bfc0:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f9bfc4:	17ffffbf	b	0xfffff7f9bec0
   0x0000fffff7f9bfc8:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f9bfcc:	17ffffbd	b	0xfffff7f9bec0
   0x0000fffff7f9bfd0:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f9bfd4:	17ffffbb	b	0xfffff7f9bec0
   0x0000fffff7f9bfd8:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f9bfdc:	17ffffb9	b	0xfffff7f9bec0
   0x0000fffff7f9bfe0:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f9bfe4:	17ffffb7	b	0xfffff7f9bec0
   0x0000fffff7f9bfe8:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f9bfec:	17ffffb5	b	0xfffff7f9bec0
   0x0000fffff7f9bff0:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f9bff4:	17ffffb3	b	0xfffff7f9bec0
   0x0000fffff7f9bff8:	00000000	udf	#0
   0x0000fffff7f9bffc:	00000000	udf	#0
End of assembler dump.
