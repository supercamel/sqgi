Dump of assembler code from 0xfffff7f9c000 to 0xfffff7f9e000:
   0x0000fffff7f9c000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f9c004:	910003fd	mov	x29, sp
   0x0000fffff7f9c008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9c00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f9c010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f9c014:	aa0003f3	mov	x19, x0
   0x0000fffff7f9c018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9c01c:	aa0203f5	mov	x21, x2
   0x0000fffff7f9c020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f9c024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f9c028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9c02c:	f90003e9	str	x9, [sp]
   0x0000fffff7f9c030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f9c034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f9c038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9c03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f9c040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c044:	d63f0200	blr	x16
   0x0000fffff7f9c048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9c04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f9c050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f9c054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f9c058:	14000001	b	0xfffff7f9c05c
   0x0000fffff7f9c05c:	14000001	b	0xfffff7f9c060
   0x0000fffff7f9c060:	14000001	b	0xfffff7f9c064
   0x0000fffff7f9c064:	14000001	b	0xfffff7f9c068
   0x0000fffff7f9c068:	14000001	b	0xfffff7f9c06c
   0x0000fffff7f9c06c:	14000001	b	0xfffff7f9c070
   0x0000fffff7f9c070:	14000001	b	0xfffff7f9c074
   0x0000fffff7f9c074:	14000001	b	0xfffff7f9c078
   0x0000fffff7f9c078:	14000001	b	0xfffff7f9c07c
   0x0000fffff7f9c07c:	14000001	b	0xfffff7f9c080
   0x0000fffff7f9c080:	14000001	b	0xfffff7f9c084
   0x0000fffff7f9c084:	14000001	b	0xfffff7f9c088
   0x0000fffff7f9c088:	14000001	b	0xfffff7f9c08c
   0x0000fffff7f9c08c:	14000001	b	0xfffff7f9c090
   0x0000fffff7f9c090:	14000001	b	0xfffff7f9c094
   0x0000fffff7f9c094:	14000001	b	0xfffff7f9c098
   0x0000fffff7f9c098:	14000001	b	0xfffff7f9c09c
   0x0000fffff7f9c09c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f9c0a0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f9c0a4:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f9c0a8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f9c0ac:	36d80211	tbz	w17, #27, 0xfffff7f9c0ec
   0x0000fffff7f9c0b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9c0b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9c0b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9c0bc:	540001e1	b.ne	0xfffff7f9c0f8  // b.any
   0x0000fffff7f9c0c0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f9c0c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c0c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9c0cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9c0d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9c0d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9c0d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9c0dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9c0e0:	540000c9	b.ls	0xfffff7f9c0f8  // b.plast
   0x0000fffff7f9c0e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9c0e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9c0ec:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f9c0f0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f9c0f4:	1400000e	b	0xfffff7f9c12c
   0x0000fffff7f9c0f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c0fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c100:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c104:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c108:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f9c10c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c110:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c114:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f9c118:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c11c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c120:	d63f0200	blr	x16
   0x0000fffff7f9c124:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c128:	5400ede0	b.eq	0xfffff7f9dee4  // b.none
   0x0000fffff7f9c12c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f9c130:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f9c134:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f9c138:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f9c13c:	36d80211	tbz	w17, #27, 0xfffff7f9c17c
   0x0000fffff7f9c140:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9c144:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9c148:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9c14c:	540001e1	b.ne	0xfffff7f9c188  // b.any
   0x0000fffff7f9c150:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f9c154:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c158:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9c15c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9c160:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9c164:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9c168:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9c16c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9c170:	540000c9	b.ls	0xfffff7f9c188  // b.plast
   0x0000fffff7f9c174:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9c178:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9c17c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f9c180:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f9c184:	1400000e	b	0xfffff7f9c1bc
   0x0000fffff7f9c188:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c18c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c190:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c194:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c198:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f9c19c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c1a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c1a4:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f9c1a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c1ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c1b0:	d63f0200	blr	x16
   0x0000fffff7f9c1b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c1b8:	5400e9a0	b.eq	0xfffff7f9deec  // b.none
   0x0000fffff7f9c1bc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9c1c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c1c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c1c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c1cc:	54000421	b.ne	0xfffff7f9c250  // b.any
   0x0000fffff7f9c1d0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f9c1d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c1d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c1dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c1e0:	54000381	b.ne	0xfffff7f9c250  // b.any
   0x0000fffff7f9c1e4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9c1e8:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f9c1ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c1f0:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7f9c1f4:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7f9c1f8:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7f9c1fc:	91000580	add	x0, x12, #0x1
   0x0000fffff7f9c200:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9c204:	36d80211	tbz	w17, #27, 0xfffff7f9c244
   0x0000fffff7f9c208:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9c20c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9c210:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9c214:	540001e1	b.ne	0xfffff7f9c250  // b.any
   0x0000fffff7f9c218:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9c21c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c220:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9c224:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9c228:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9c22c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9c230:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9c234:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9c238:	540000c9	b.ls	0xfffff7f9c250  // b.plast
   0x0000fffff7f9c23c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9c240:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9c244:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7f9c248:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7f9c24c:	1400000e	b	0xfffff7f9c284
   0x0000fffff7f9c250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c258:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c25c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c260:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f9c264:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c268:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c26c:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7f9c270:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c278:	d63f0200	blr	x16
   0x0000fffff7f9c27c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c280:	5400e3a0	b.eq	0xfffff7f9def4  // b.none
   0x0000fffff7f9c284:	f100041f	cmp	x0, #0x1
   0x0000fffff7f9c288:	5400df80	b.eq	0xfffff7f9de78  // b.none
   0x0000fffff7f9c28c:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f9c290:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f9c294:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f9c298:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f9c29c:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f9c2a0:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f9c2a4:	36d801d1	tbz	w17, #27, 0xfffff7f9c2dc
   0x0000fffff7f9c2a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9c2ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9c2b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9c2b4:	54000281	b.ne	0xfffff7f9c304  // b.any
   0x0000fffff7f9c2b8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9c2bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c2c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9c2c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9c2c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9c2cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9c2d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9c2d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9c2d8:	54000169	b.ls	0xfffff7f9c304  // b.plast
   0x0000fffff7f9c2dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9c2e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9c2e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9c2e8:	36d80091	tbz	w17, #27, 0xfffff7f9c2f8
   0x0000fffff7f9c2ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c2f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9c2f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9c2f8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9c2fc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9c300:	1400000e	b	0xfffff7f9c338
   0x0000fffff7f9c304:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c308:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c30c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c310:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c314:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f9c318:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c31c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c320:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f9c324:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c328:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c32c:	d63f0200	blr	x16
   0x0000fffff7f9c330:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c334:	5400de40	b.eq	0xfffff7f9defc  // b.none
   0x0000fffff7f9c338:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f9c33c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9c340:	540003a0	b.eq	0xfffff7f9c3b4  // b.none
   0x0000fffff7f9c344:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f9c348:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f9c34c:	b9400171	ldr	w17, [x11]
   0x0000fffff7f9c350:	36d801d1	tbz	w17, #27, 0xfffff7f9c388
   0x0000fffff7f9c354:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9c358:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9c35c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9c360:	540002a1	b.ne	0xfffff7f9c3b4  // b.any
   0x0000fffff7f9c364:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f9c368:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c36c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9c370:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9c374:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9c378:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9c37c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9c380:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9c384:	54000189	b.ls	0xfffff7f9c3b4  // b.plast
   0x0000fffff7f9c388:	36d8008d	tbz	w13, #27, 0xfffff7f9c398
   0x0000fffff7f9c38c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9c390:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9c394:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9c398:	36d80091	tbz	w17, #27, 0xfffff7f9c3a8
   0x0000fffff7f9c39c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c3a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9c3a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9c3a8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f9c3ac:	b900016d	str	w13, [x11]
   0x0000fffff7f9c3b0:	1400000e	b	0xfffff7f9c3e8
   0x0000fffff7f9c3b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f9c3b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c3bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c3c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c3c4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f9c3c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c3cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c3d0:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7f9c3d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c3d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c3dc:	d63f0200	blr	x16
   0x0000fffff7f9c3e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c3e4:	5400d900	b.eq	0xfffff7f9df04  // b.none
   0x0000fffff7f9c3e8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9c3ec:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9c3f0:	540004a0	b.eq	0xfffff7f9c484  // b.none
   0x0000fffff7f9c3f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9c3f8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9c3fc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9c400:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9c404:	54000400	b.eq	0xfffff7f9c484  // b.none
   0x0000fffff7f9c408:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9c40c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9c410:	36d801d1	tbz	w17, #27, 0xfffff7f9c448
   0x0000fffff7f9c414:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9c418:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9c41c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9c420:	54000321	b.ne	0xfffff7f9c484  // b.any
   0x0000fffff7f9c424:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9c428:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c42c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9c430:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9c434:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9c438:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9c43c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9c440:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9c444:	54000209	b.ls	0xfffff7f9c484  // b.plast
   0x0000fffff7f9c448:	36d8008d	tbz	w13, #27, 0xfffff7f9c458
   0x0000fffff7f9c44c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9c450:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9c454:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9c458:	36d80091	tbz	w17, #27, 0xfffff7f9c468
   0x0000fffff7f9c45c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c460:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9c464:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9c468:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9c46c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9c470:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9c474:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9c478:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9c47c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9c480:	1400000e	b	0xfffff7f9c4b8
   0x0000fffff7f9c484:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c488:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c48c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c490:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c494:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f9c498:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c49c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c4a0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9c4a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c4a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c4ac:	d63f0200	blr	x16
   0x0000fffff7f9c4b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c4b4:	5400d2c0	b.eq	0xfffff7f9df0c  // b.none
   0x0000fffff7f9c4b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c4bc:	37d806a9	tbnz	w9, #27, 0xfffff7f9c590
   0x0000fffff7f9c4c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c4c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c4c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c4cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c4d0:	540001c1	b.ne	0xfffff7f9c508  // b.any
   0x0000fffff7f9c4d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9c4d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c4dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c4e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c4e4:	54000121	b.ne	0xfffff7f9c508  // b.any
   0x0000fffff7f9c4e8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9c4ec:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9c4f0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c4f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c4f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c4fc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9c500:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9c504:	14000030	b	0xfffff7f9c5c4
   0x0000fffff7f9c508:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c50c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c510:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c514:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c518:	54000120	b.eq	0xfffff7f9c53c  // b.none
   0x0000fffff7f9c51c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c520:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c524:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c528:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c52c:	54000321	b.ne	0xfffff7f9c590  // b.any
   0x0000fffff7f9c530:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9c534:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c538:	14000002	b	0xfffff7f9c540
   0x0000fffff7f9c53c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9c540:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9c544:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c548:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c54c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c550:	54000120	b.eq	0xfffff7f9c574  // b.none
   0x0000fffff7f9c554:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9c558:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c55c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c560:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c564:	54000161	b.ne	0xfffff7f9c590  // b.any
   0x0000fffff7f9c568:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9c56c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c570:	14000002	b	0xfffff7f9c578
   0x0000fffff7f9c574:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9c578:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c57c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9c580:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c584:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c588:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9c58c:	17ffffde	b	0xfffff7f9c504
   0x0000fffff7f9c590:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c594:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c598:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c59c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c5a0:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f9c5a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c5a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c5ac:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9c5b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c5b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c5b8:	d63f0200	blr	x16
   0x0000fffff7f9c5bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c5c0:	5400caa0	b.eq	0xfffff7f9df14  // b.none
   0x0000fffff7f9c5c4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9c5c8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9c5cc:	540004a0	b.eq	0xfffff7f9c660  // b.none
   0x0000fffff7f9c5d0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9c5d4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9c5d8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9c5dc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9c5e0:	54000400	b.eq	0xfffff7f9c660  // b.none
   0x0000fffff7f9c5e4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9c5e8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9c5ec:	36d801d1	tbz	w17, #27, 0xfffff7f9c624
   0x0000fffff7f9c5f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9c5f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9c5f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9c5fc:	54000321	b.ne	0xfffff7f9c660  // b.any
   0x0000fffff7f9c600:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9c604:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c608:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9c60c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9c610:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9c614:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9c618:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9c61c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9c620:	54000209	b.ls	0xfffff7f9c660  // b.plast
   0x0000fffff7f9c624:	36d8008d	tbz	w13, #27, 0xfffff7f9c634
   0x0000fffff7f9c628:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9c62c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9c630:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9c634:	36d80091	tbz	w17, #27, 0xfffff7f9c644
   0x0000fffff7f9c638:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c63c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9c640:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9c644:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9c648:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9c64c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9c650:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9c654:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9c658:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9c65c:	1400000e	b	0xfffff7f9c694
   0x0000fffff7f9c660:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c664:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c668:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c66c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c670:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9c674:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c678:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c67c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9c680:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c688:	d63f0200	blr	x16
   0x0000fffff7f9c68c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c690:	5400c460	b.eq	0xfffff7f9df1c  // b.none
   0x0000fffff7f9c694:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c698:	37d806a9	tbnz	w9, #27, 0xfffff7f9c76c
   0x0000fffff7f9c69c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c6a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c6a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c6a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c6ac:	540001c1	b.ne	0xfffff7f9c6e4  // b.any
   0x0000fffff7f9c6b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9c6b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c6b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c6bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c6c0:	54000121	b.ne	0xfffff7f9c6e4  // b.any
   0x0000fffff7f9c6c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9c6c8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9c6cc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c6d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c6d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c6d8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9c6dc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9c6e0:	14000030	b	0xfffff7f9c7a0
   0x0000fffff7f9c6e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c6e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c6ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c6f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c6f4:	54000120	b.eq	0xfffff7f9c718  // b.none
   0x0000fffff7f9c6f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c6fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c704:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c708:	54000321	b.ne	0xfffff7f9c76c  // b.any
   0x0000fffff7f9c70c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9c710:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c714:	14000002	b	0xfffff7f9c71c
   0x0000fffff7f9c718:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9c71c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9c720:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c724:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c728:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c72c:	54000120	b.eq	0xfffff7f9c750  // b.none
   0x0000fffff7f9c730:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9c734:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c738:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c73c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c740:	54000161	b.ne	0xfffff7f9c76c  // b.any
   0x0000fffff7f9c744:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9c748:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c74c:	14000002	b	0xfffff7f9c754
   0x0000fffff7f9c750:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9c754:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c758:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9c75c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c764:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9c768:	17ffffde	b	0xfffff7f9c6e0
   0x0000fffff7f9c76c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c770:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c774:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c778:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c77c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f9c780:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c784:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c788:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9c78c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c790:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c794:	d63f0200	blr	x16
   0x0000fffff7f9c798:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c79c:	5400bc40	b.eq	0xfffff7f9df24  // b.none
   0x0000fffff7f9c7a0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9c7a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9c7a8:	540004a0	b.eq	0xfffff7f9c83c  // b.none
   0x0000fffff7f9c7ac:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9c7b0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9c7b4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9c7b8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9c7bc:	54000400	b.eq	0xfffff7f9c83c  // b.none
   0x0000fffff7f9c7c0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9c7c4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9c7c8:	36d801d1	tbz	w17, #27, 0xfffff7f9c800
   0x0000fffff7f9c7cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9c7d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9c7d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9c7d8:	54000321	b.ne	0xfffff7f9c83c  // b.any
   0x0000fffff7f9c7dc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9c7e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c7e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9c7e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9c7ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9c7f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9c7f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9c7f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9c7fc:	54000209	b.ls	0xfffff7f9c83c  // b.plast
   0x0000fffff7f9c800:	36d8008d	tbz	w13, #27, 0xfffff7f9c810
   0x0000fffff7f9c804:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9c808:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9c80c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9c810:	36d80091	tbz	w17, #27, 0xfffff7f9c820
   0x0000fffff7f9c814:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c818:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9c81c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9c820:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9c824:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9c828:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9c82c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9c830:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9c834:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9c838:	1400000e	b	0xfffff7f9c870
   0x0000fffff7f9c83c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9c840:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c844:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c848:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c84c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f9c850:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c854:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c858:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9c85c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9c860:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c864:	d63f0200	blr	x16
   0x0000fffff7f9c868:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c86c:	5400b600	b.eq	0xfffff7f9df2c  // b.none
   0x0000fffff7f9c870:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c874:	37d806a9	tbnz	w9, #27, 0xfffff7f9c948
   0x0000fffff7f9c878:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c87c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c884:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c888:	540001c1	b.ne	0xfffff7f9c8c0  // b.any
   0x0000fffff7f9c88c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9c890:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c898:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c89c:	54000121	b.ne	0xfffff7f9c8c0  // b.any
   0x0000fffff7f9c8a0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9c8a4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9c8a8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9c8ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c8b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c8b4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9c8b8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9c8bc:	14000030	b	0xfffff7f9c97c
   0x0000fffff7f9c8c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c8c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c8c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c8cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c8d0:	54000120	b.eq	0xfffff7f9c8f4  // b.none
   0x0000fffff7f9c8d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9c8d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c8dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c8e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c8e4:	54000321	b.ne	0xfffff7f9c948  // b.any
   0x0000fffff7f9c8e8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9c8ec:	9e620120	scvtf	d0, x9
   0x0000fffff7f9c8f0:	14000002	b	0xfffff7f9c8f8
   0x0000fffff7f9c8f4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9c8f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9c8fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c900:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c904:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c908:	54000120	b.eq	0xfffff7f9c92c  // b.none
   0x0000fffff7f9c90c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9c910:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9c914:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c918:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9c91c:	54000161	b.ne	0xfffff7f9c948  // b.any
   0x0000fffff7f9c920:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9c924:	9e620121	scvtf	d1, x9
   0x0000fffff7f9c928:	14000002	b	0xfffff7f9c930
   0x0000fffff7f9c92c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9c930:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9c934:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9c938:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9c93c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9c940:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9c944:	17ffffde	b	0xfffff7f9c8bc
   0x0000fffff7f9c948:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9c94c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9c950:	aa1303e1	mov	x1, x19
   0x0000fffff7f9c954:	aa1503e2	mov	x2, x21
   0x0000fffff7f9c958:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f9c95c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9c960:	aa1603e5	mov	x5, x22
   0x0000fffff7f9c964:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9c968:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9c96c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9c970:	d63f0200	blr	x16
   0x0000fffff7f9c974:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9c978:	5400ade0	b.eq	0xfffff7f9df34  // b.none
   0x0000fffff7f9c97c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9c980:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9c984:	540004a0	b.eq	0xfffff7f9ca18  // b.none
   0x0000fffff7f9c988:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9c98c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9c990:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9c994:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9c998:	54000400	b.eq	0xfffff7f9ca18  // b.none
   0x0000fffff7f9c99c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9c9a0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9c9a4:	36d801d1	tbz	w17, #27, 0xfffff7f9c9dc
   0x0000fffff7f9c9a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9c9ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9c9b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9c9b4:	54000321	b.ne	0xfffff7f9ca18  // b.any
   0x0000fffff7f9c9b8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9c9bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c9c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9c9c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9c9c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9c9cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9c9d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9c9d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9c9d8:	54000209	b.ls	0xfffff7f9ca18  // b.plast
   0x0000fffff7f9c9dc:	36d8008d	tbz	w13, #27, 0xfffff7f9c9ec
   0x0000fffff7f9c9e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9c9e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9c9e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9c9ec:	36d80091	tbz	w17, #27, 0xfffff7f9c9fc
   0x0000fffff7f9c9f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9c9f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9c9f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9c9fc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9ca00:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9ca04:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9ca08:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9ca0c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9ca10:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9ca14:	1400000e	b	0xfffff7f9ca4c
   0x0000fffff7f9ca18:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9ca1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ca20:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ca24:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ca28:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9ca2c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ca30:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ca34:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9ca38:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9ca3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9ca40:	d63f0200	blr	x16
   0x0000fffff7f9ca44:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ca48:	5400a7a0	b.eq	0xfffff7f9df3c  // b.none
   0x0000fffff7f9ca4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ca50:	37d806a9	tbnz	w9, #27, 0xfffff7f9cb24
   0x0000fffff7f9ca54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ca58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ca5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ca60:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ca64:	540001c1	b.ne	0xfffff7f9ca9c  // b.any
   0x0000fffff7f9ca68:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ca6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ca70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ca74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ca78:	54000121	b.ne	0xfffff7f9ca9c  // b.any
   0x0000fffff7f9ca7c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ca80:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9ca84:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ca88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ca8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ca90:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9ca94:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ca98:	14000030	b	0xfffff7f9cb58
   0x0000fffff7f9ca9c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9caa0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9caa4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9caa8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9caac:	54000120	b.eq	0xfffff7f9cad0  // b.none
   0x0000fffff7f9cab0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9cab4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cabc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cac0:	54000321	b.ne	0xfffff7f9cb24  // b.any
   0x0000fffff7f9cac4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9cac8:	9e620120	scvtf	d0, x9
   0x0000fffff7f9cacc:	14000002	b	0xfffff7f9cad4
   0x0000fffff7f9cad0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9cad4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9cad8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9cadc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cae0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cae4:	54000120	b.eq	0xfffff7f9cb08  // b.none
   0x0000fffff7f9cae8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9caec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9caf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9caf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9caf8:	54000161	b.ne	0xfffff7f9cb24  // b.any
   0x0000fffff7f9cafc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9cb00:	9e620121	scvtf	d1, x9
   0x0000fffff7f9cb04:	14000002	b	0xfffff7f9cb0c
   0x0000fffff7f9cb08:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9cb0c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9cb10:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9cb14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9cb18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cb1c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9cb20:	17ffffde	b	0xfffff7f9ca98
   0x0000fffff7f9cb24:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cb28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cb2c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cb30:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cb34:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f9cb38:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cb3c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cb40:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9cb44:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cb48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cb4c:	d63f0200	blr	x16
   0x0000fffff7f9cb50:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cb54:	54009f80	b.eq	0xfffff7f9df44  // b.none
   0x0000fffff7f9cb58:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9cb5c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9cb60:	540004a0	b.eq	0xfffff7f9cbf4  // b.none
   0x0000fffff7f9cb64:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9cb68:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9cb6c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9cb70:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9cb74:	54000400	b.eq	0xfffff7f9cbf4  // b.none
   0x0000fffff7f9cb78:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9cb7c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9cb80:	36d801d1	tbz	w17, #27, 0xfffff7f9cbb8
   0x0000fffff7f9cb84:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9cb88:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9cb8c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9cb90:	54000321	b.ne	0xfffff7f9cbf4  // b.any
   0x0000fffff7f9cb94:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9cb98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9cb9c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9cba0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9cba4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9cba8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9cbac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9cbb0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9cbb4:	54000209	b.ls	0xfffff7f9cbf4  // b.plast
   0x0000fffff7f9cbb8:	36d8008d	tbz	w13, #27, 0xfffff7f9cbc8
   0x0000fffff7f9cbbc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9cbc0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9cbc4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9cbc8:	36d80091	tbz	w17, #27, 0xfffff7f9cbd8
   0x0000fffff7f9cbcc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9cbd0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9cbd4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9cbd8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9cbdc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9cbe0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9cbe4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9cbe8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9cbec:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9cbf0:	1400000e	b	0xfffff7f9cc28
   0x0000fffff7f9cbf4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9cbf8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cbfc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cc00:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cc04:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f9cc08:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cc0c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cc10:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9cc14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cc18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cc1c:	d63f0200	blr	x16
   0x0000fffff7f9cc20:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cc24:	54009940	b.eq	0xfffff7f9df4c  // b.none
   0x0000fffff7f9cc28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9cc2c:	37d806a9	tbnz	w9, #27, 0xfffff7f9cd00
   0x0000fffff7f9cc30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9cc34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cc38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cc3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cc40:	540001c1	b.ne	0xfffff7f9cc78  // b.any
   0x0000fffff7f9cc44:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9cc48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cc4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cc50:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cc54:	54000121	b.ne	0xfffff7f9cc78  // b.any
   0x0000fffff7f9cc58:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9cc5c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9cc60:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9cc64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cc68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cc6c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9cc70:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9cc74:	14000030	b	0xfffff7f9cd34
   0x0000fffff7f9cc78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9cc7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9cc80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cc84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cc88:	54000120	b.eq	0xfffff7f9ccac  // b.none
   0x0000fffff7f9cc8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9cc90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cc94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cc98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cc9c:	54000321	b.ne	0xfffff7f9cd00  // b.any
   0x0000fffff7f9cca0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9cca4:	9e620120	scvtf	d0, x9
   0x0000fffff7f9cca8:	14000002	b	0xfffff7f9ccb0
   0x0000fffff7f9ccac:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9ccb0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ccb4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ccb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ccbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ccc0:	54000120	b.eq	0xfffff7f9cce4  // b.none
   0x0000fffff7f9ccc4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ccc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cccc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ccd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ccd4:	54000161	b.ne	0xfffff7f9cd00  // b.any
   0x0000fffff7f9ccd8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9ccdc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9cce0:	14000002	b	0xfffff7f9cce8
   0x0000fffff7f9cce4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9cce8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9ccec:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9ccf0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ccf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ccf8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ccfc:	17ffffde	b	0xfffff7f9cc74
   0x0000fffff7f9cd00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cd04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cd08:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cd0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cd10:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f9cd14:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cd18:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cd1c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9cd20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cd24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cd28:	d63f0200	blr	x16
   0x0000fffff7f9cd2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cd30:	54009120	b.eq	0xfffff7f9df54  // b.none
   0x0000fffff7f9cd34:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9cd38:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9cd3c:	540004a0	b.eq	0xfffff7f9cdd0  // b.none
   0x0000fffff7f9cd40:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9cd44:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9cd48:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9cd4c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9cd50:	54000400	b.eq	0xfffff7f9cdd0  // b.none
   0x0000fffff7f9cd54:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9cd58:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9cd5c:	36d801d1	tbz	w17, #27, 0xfffff7f9cd94
   0x0000fffff7f9cd60:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9cd64:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9cd68:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9cd6c:	54000321	b.ne	0xfffff7f9cdd0  // b.any
   0x0000fffff7f9cd70:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9cd74:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9cd78:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9cd7c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9cd80:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9cd84:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9cd88:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9cd8c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9cd90:	54000209	b.ls	0xfffff7f9cdd0  // b.plast
   0x0000fffff7f9cd94:	36d8008d	tbz	w13, #27, 0xfffff7f9cda4
   0x0000fffff7f9cd98:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9cd9c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9cda0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9cda4:	36d80091	tbz	w17, #27, 0xfffff7f9cdb4
   0x0000fffff7f9cda8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9cdac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9cdb0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9cdb4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9cdb8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9cdbc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9cdc0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9cdc4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9cdc8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9cdcc:	1400000e	b	0xfffff7f9ce04
   0x0000fffff7f9cdd0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9cdd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cdd8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cddc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cde0:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9cde4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cde8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cdec:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9cdf0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cdf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cdf8:	d63f0200	blr	x16
   0x0000fffff7f9cdfc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ce00:	54008ae0	b.eq	0xfffff7f9df5c  // b.none
   0x0000fffff7f9ce04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ce08:	37d806a9	tbnz	w9, #27, 0xfffff7f9cedc
   0x0000fffff7f9ce0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ce10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ce14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ce18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ce1c:	540001c1	b.ne	0xfffff7f9ce54  // b.any
   0x0000fffff7f9ce20:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ce24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ce28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ce2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ce30:	54000121	b.ne	0xfffff7f9ce54  // b.any
   0x0000fffff7f9ce34:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ce38:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9ce3c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9ce40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ce44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ce48:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9ce4c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ce50:	14000030	b	0xfffff7f9cf10
   0x0000fffff7f9ce54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ce58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ce5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ce60:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ce64:	54000120	b.eq	0xfffff7f9ce88  // b.none
   0x0000fffff7f9ce68:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9ce6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9ce70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ce74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ce78:	54000321	b.ne	0xfffff7f9cedc  // b.any
   0x0000fffff7f9ce7c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9ce80:	9e620120	scvtf	d0, x9
   0x0000fffff7f9ce84:	14000002	b	0xfffff7f9ce8c
   0x0000fffff7f9ce88:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9ce8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ce90:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ce94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ce98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ce9c:	54000120	b.eq	0xfffff7f9cec0  // b.none
   0x0000fffff7f9cea0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9cea4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cea8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ceac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9ceb0:	54000161	b.ne	0xfffff7f9cedc  // b.any
   0x0000fffff7f9ceb4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9ceb8:	9e620121	scvtf	d1, x9
   0x0000fffff7f9cebc:	14000002	b	0xfffff7f9cec4
   0x0000fffff7f9cec0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9cec4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9cec8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9cecc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ced0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ced4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ced8:	17ffffde	b	0xfffff7f9ce50
   0x0000fffff7f9cedc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9cee0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cee4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cee8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ceec:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f9cef0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cef4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cef8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9cefc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9cf00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cf04:	d63f0200	blr	x16
   0x0000fffff7f9cf08:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cf0c:	540082c0	b.eq	0xfffff7f9df64  // b.none
   0x0000fffff7f9cf10:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9cf14:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9cf18:	540004a0	b.eq	0xfffff7f9cfac  // b.none
   0x0000fffff7f9cf1c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9cf20:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9cf24:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9cf28:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9cf2c:	54000400	b.eq	0xfffff7f9cfac  // b.none
   0x0000fffff7f9cf30:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9cf34:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9cf38:	36d801d1	tbz	w17, #27, 0xfffff7f9cf70
   0x0000fffff7f9cf3c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9cf40:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9cf44:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9cf48:	54000321	b.ne	0xfffff7f9cfac  // b.any
   0x0000fffff7f9cf4c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9cf50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9cf54:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9cf58:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9cf5c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9cf60:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9cf64:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9cf68:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9cf6c:	54000209	b.ls	0xfffff7f9cfac  // b.plast
   0x0000fffff7f9cf70:	36d8008d	tbz	w13, #27, 0xfffff7f9cf80
   0x0000fffff7f9cf74:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9cf78:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9cf7c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9cf80:	36d80091	tbz	w17, #27, 0xfffff7f9cf90
   0x0000fffff7f9cf84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9cf88:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9cf8c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9cf90:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9cf94:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9cf98:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9cf9c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9cfa0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9cfa4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9cfa8:	1400000e	b	0xfffff7f9cfe0
   0x0000fffff7f9cfac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9cfb0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9cfb4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9cfb8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9cfbc:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f9cfc0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9cfc4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9cfc8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9cfcc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9cfd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9cfd4:	d63f0200	blr	x16
   0x0000fffff7f9cfd8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9cfdc:	54007c80	b.eq	0xfffff7f9df6c  // b.none
   0x0000fffff7f9cfe0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9cfe4:	37d806a9	tbnz	w9, #27, 0xfffff7f9d0b8
   0x0000fffff7f9cfe8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9cfec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9cff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9cff4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9cff8:	540001c1	b.ne	0xfffff7f9d030  // b.any
   0x0000fffff7f9cffc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d000:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d004:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d008:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d00c:	54000121	b.ne	0xfffff7f9d030  // b.any
   0x0000fffff7f9d010:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d014:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9d018:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d01c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d020:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d024:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9d028:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d02c:	14000030	b	0xfffff7f9d0ec
   0x0000fffff7f9d030:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d034:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d038:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d03c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d040:	54000120	b.eq	0xfffff7f9d064  // b.none
   0x0000fffff7f9d044:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d04c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d050:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d054:	54000321	b.ne	0xfffff7f9d0b8  // b.any
   0x0000fffff7f9d058:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d05c:	9e620120	scvtf	d0, x9
   0x0000fffff7f9d060:	14000002	b	0xfffff7f9d068
   0x0000fffff7f9d064:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9d068:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d06c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d070:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d074:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d078:	54000120	b.eq	0xfffff7f9d09c  // b.none
   0x0000fffff7f9d07c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d080:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d084:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d088:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d08c:	54000161	b.ne	0xfffff7f9d0b8  // b.any
   0x0000fffff7f9d090:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9d094:	9e620121	scvtf	d1, x9
   0x0000fffff7f9d098:	14000002	b	0xfffff7f9d0a0
   0x0000fffff7f9d09c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9d0a0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9d0a4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9d0a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d0ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d0b0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d0b4:	17ffffde	b	0xfffff7f9d02c
   0x0000fffff7f9d0b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d0bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d0c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d0c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d0c8:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f9d0cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d0d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d0d4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9d0d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d0dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d0e0:	d63f0200	blr	x16
   0x0000fffff7f9d0e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d0e8:	54007460	b.eq	0xfffff7f9df74  // b.none
   0x0000fffff7f9d0ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9d0f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9d0f4:	540004a0	b.eq	0xfffff7f9d188  // b.none
   0x0000fffff7f9d0f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9d0fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9d100:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9d104:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9d108:	54000400	b.eq	0xfffff7f9d188  // b.none
   0x0000fffff7f9d10c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9d110:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9d114:	36d801d1	tbz	w17, #27, 0xfffff7f9d14c
   0x0000fffff7f9d118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9d11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9d120:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9d124:	54000321	b.ne	0xfffff7f9d188  // b.any
   0x0000fffff7f9d128:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9d12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9d134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9d138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9d13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9d140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9d144:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9d148:	54000209	b.ls	0xfffff7f9d188  // b.plast
   0x0000fffff7f9d14c:	36d8008d	tbz	w13, #27, 0xfffff7f9d15c
   0x0000fffff7f9d150:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9d154:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9d158:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9d15c:	36d80091	tbz	w17, #27, 0xfffff7f9d16c
   0x0000fffff7f9d160:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d164:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9d168:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9d16c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9d170:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9d174:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9d178:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9d17c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9d180:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9d184:	1400000e	b	0xfffff7f9d1bc
   0x0000fffff7f9d188:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d18c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d190:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d194:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d198:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f9d19c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d1a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d1a4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9d1a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d1ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d1b0:	d63f0200	blr	x16
   0x0000fffff7f9d1b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d1b8:	54006e20	b.eq	0xfffff7f9df7c  // b.none
   0x0000fffff7f9d1bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d1c0:	37d806a9	tbnz	w9, #27, 0xfffff7f9d294
   0x0000fffff7f9d1c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d1c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d1cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d1d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d1d4:	540001c1	b.ne	0xfffff7f9d20c  // b.any
   0x0000fffff7f9d1d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d1dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d1e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d1e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d1e8:	54000121	b.ne	0xfffff7f9d20c  // b.any
   0x0000fffff7f9d1ec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d1f0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9d1f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d1f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d1fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d200:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9d204:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d208:	14000030	b	0xfffff7f9d2c8
   0x0000fffff7f9d20c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d210:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d214:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d218:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d21c:	54000120	b.eq	0xfffff7f9d240  // b.none
   0x0000fffff7f9d220:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d224:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d228:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d22c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d230:	54000321	b.ne	0xfffff7f9d294  // b.any
   0x0000fffff7f9d234:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d238:	9e620120	scvtf	d0, x9
   0x0000fffff7f9d23c:	14000002	b	0xfffff7f9d244
   0x0000fffff7f9d240:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9d244:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d248:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d24c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d250:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d254:	54000120	b.eq	0xfffff7f9d278  // b.none
   0x0000fffff7f9d258:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d25c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d260:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d264:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d268:	54000161	b.ne	0xfffff7f9d294  // b.any
   0x0000fffff7f9d26c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9d270:	9e620121	scvtf	d1, x9
   0x0000fffff7f9d274:	14000002	b	0xfffff7f9d27c
   0x0000fffff7f9d278:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9d27c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9d280:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9d284:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d288:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d28c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d290:	17ffffde	b	0xfffff7f9d208
   0x0000fffff7f9d294:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d298:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d29c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d2a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d2a4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f9d2a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d2ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d2b0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9d2b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d2b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d2bc:	d63f0200	blr	x16
   0x0000fffff7f9d2c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d2c4:	54006600	b.eq	0xfffff7f9df84  // b.none
   0x0000fffff7f9d2c8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9d2cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9d2d0:	540004a0	b.eq	0xfffff7f9d364  // b.none
   0x0000fffff7f9d2d4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9d2d8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9d2dc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9d2e0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9d2e4:	54000400	b.eq	0xfffff7f9d364  // b.none
   0x0000fffff7f9d2e8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9d2ec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9d2f0:	36d801d1	tbz	w17, #27, 0xfffff7f9d328
   0x0000fffff7f9d2f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9d2f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9d2fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9d300:	54000321	b.ne	0xfffff7f9d364  // b.any
   0x0000fffff7f9d304:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9d308:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d30c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9d310:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9d314:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9d318:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9d31c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9d320:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9d324:	54000209	b.ls	0xfffff7f9d364  // b.plast
   0x0000fffff7f9d328:	36d8008d	tbz	w13, #27, 0xfffff7f9d338
   0x0000fffff7f9d32c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9d330:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9d334:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9d338:	36d80091	tbz	w17, #27, 0xfffff7f9d348
   0x0000fffff7f9d33c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d340:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9d344:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9d348:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9d34c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9d350:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9d354:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9d358:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9d35c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9d360:	1400000e	b	0xfffff7f9d398
   0x0000fffff7f9d364:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d368:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d36c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d370:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d374:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f9d378:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d37c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d380:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9d384:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d388:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d38c:	d63f0200	blr	x16
   0x0000fffff7f9d390:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d394:	54005fc0	b.eq	0xfffff7f9df8c  // b.none
   0x0000fffff7f9d398:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d39c:	37d806a9	tbnz	w9, #27, 0xfffff7f9d470
   0x0000fffff7f9d3a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d3a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d3a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d3ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d3b0:	540001c1	b.ne	0xfffff7f9d3e8  // b.any
   0x0000fffff7f9d3b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d3b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d3bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d3c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d3c4:	54000121	b.ne	0xfffff7f9d3e8  // b.any
   0x0000fffff7f9d3c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d3cc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9d3d0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d3d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d3d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d3dc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9d3e0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d3e4:	14000030	b	0xfffff7f9d4a4
   0x0000fffff7f9d3e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d3ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d3f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d3f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d3f8:	54000120	b.eq	0xfffff7f9d41c  // b.none
   0x0000fffff7f9d3fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d400:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d404:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d408:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d40c:	54000321	b.ne	0xfffff7f9d470  // b.any
   0x0000fffff7f9d410:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d414:	9e620120	scvtf	d0, x9
   0x0000fffff7f9d418:	14000002	b	0xfffff7f9d420
   0x0000fffff7f9d41c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9d420:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d424:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d42c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d430:	54000120	b.eq	0xfffff7f9d454  // b.none
   0x0000fffff7f9d434:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d438:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d43c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d440:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d444:	54000161	b.ne	0xfffff7f9d470  // b.any
   0x0000fffff7f9d448:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9d44c:	9e620121	scvtf	d1, x9
   0x0000fffff7f9d450:	14000002	b	0xfffff7f9d458
   0x0000fffff7f9d454:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9d458:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9d45c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9d460:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d464:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d468:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d46c:	17ffffde	b	0xfffff7f9d3e4
   0x0000fffff7f9d470:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d474:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d478:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d47c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d480:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f9d484:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d488:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d48c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9d490:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d494:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d498:	d63f0200	blr	x16
   0x0000fffff7f9d49c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d4a0:	540057a0	b.eq	0xfffff7f9df94  // b.none
   0x0000fffff7f9d4a4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9d4a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9d4ac:	540004a0	b.eq	0xfffff7f9d540  // b.none
   0x0000fffff7f9d4b0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9d4b4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9d4b8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9d4bc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9d4c0:	54000400	b.eq	0xfffff7f9d540  // b.none
   0x0000fffff7f9d4c4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9d4c8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9d4cc:	36d801d1	tbz	w17, #27, 0xfffff7f9d504
   0x0000fffff7f9d4d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9d4d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9d4d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9d4dc:	54000321	b.ne	0xfffff7f9d540  // b.any
   0x0000fffff7f9d4e0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9d4e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d4e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9d4ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9d4f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9d4f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9d4f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9d4fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9d500:	54000209	b.ls	0xfffff7f9d540  // b.plast
   0x0000fffff7f9d504:	36d8008d	tbz	w13, #27, 0xfffff7f9d514
   0x0000fffff7f9d508:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9d50c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9d510:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9d514:	36d80091	tbz	w17, #27, 0xfffff7f9d524
   0x0000fffff7f9d518:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d51c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9d520:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9d524:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9d528:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9d52c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9d530:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9d534:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9d538:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9d53c:	1400000e	b	0xfffff7f9d574
   0x0000fffff7f9d540:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d544:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d548:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d54c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d550:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f9d554:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d558:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d55c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9d560:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d564:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d568:	d63f0200	blr	x16
   0x0000fffff7f9d56c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d570:	54005160	b.eq	0xfffff7f9df9c  // b.none
   0x0000fffff7f9d574:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d578:	37d806a9	tbnz	w9, #27, 0xfffff7f9d64c
   0x0000fffff7f9d57c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d580:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d584:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d588:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d58c:	540001c1	b.ne	0xfffff7f9d5c4  // b.any
   0x0000fffff7f9d590:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d594:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d598:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d59c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d5a0:	54000121	b.ne	0xfffff7f9d5c4  // b.any
   0x0000fffff7f9d5a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d5a8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9d5ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d5b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d5b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d5b8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9d5bc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d5c0:	14000030	b	0xfffff7f9d680
   0x0000fffff7f9d5c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d5c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d5cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d5d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d5d4:	54000120	b.eq	0xfffff7f9d5f8  // b.none
   0x0000fffff7f9d5d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d5dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d5e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d5e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d5e8:	54000321	b.ne	0xfffff7f9d64c  // b.any
   0x0000fffff7f9d5ec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d5f0:	9e620120	scvtf	d0, x9
   0x0000fffff7f9d5f4:	14000002	b	0xfffff7f9d5fc
   0x0000fffff7f9d5f8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9d5fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d600:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d608:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d60c:	54000120	b.eq	0xfffff7f9d630  // b.none
   0x0000fffff7f9d610:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d614:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d61c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d620:	54000161	b.ne	0xfffff7f9d64c  // b.any
   0x0000fffff7f9d624:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9d628:	9e620121	scvtf	d1, x9
   0x0000fffff7f9d62c:	14000002	b	0xfffff7f9d634
   0x0000fffff7f9d630:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9d634:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9d638:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9d63c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d644:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d648:	17ffffde	b	0xfffff7f9d5c0
   0x0000fffff7f9d64c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d650:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d654:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d658:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d65c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f9d660:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d664:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d668:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9d66c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d670:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d674:	d63f0200	blr	x16
   0x0000fffff7f9d678:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d67c:	54004940	b.eq	0xfffff7f9dfa4  // b.none
   0x0000fffff7f9d680:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9d684:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9d688:	540004a0	b.eq	0xfffff7f9d71c  // b.none
   0x0000fffff7f9d68c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9d690:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9d694:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9d698:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9d69c:	54000400	b.eq	0xfffff7f9d71c  // b.none
   0x0000fffff7f9d6a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9d6a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9d6a8:	36d801d1	tbz	w17, #27, 0xfffff7f9d6e0
   0x0000fffff7f9d6ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9d6b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9d6b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9d6b8:	54000321	b.ne	0xfffff7f9d71c  // b.any
   0x0000fffff7f9d6bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9d6c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d6c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9d6c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9d6cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9d6d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9d6d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9d6d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9d6dc:	54000209	b.ls	0xfffff7f9d71c  // b.plast
   0x0000fffff7f9d6e0:	36d8008d	tbz	w13, #27, 0xfffff7f9d6f0
   0x0000fffff7f9d6e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9d6e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9d6ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9d6f0:	36d80091	tbz	w17, #27, 0xfffff7f9d700
   0x0000fffff7f9d6f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d6f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9d6fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9d700:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9d704:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9d708:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9d70c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9d710:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9d714:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9d718:	1400000e	b	0xfffff7f9d750
   0x0000fffff7f9d71c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d720:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d724:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d728:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d72c:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f9d730:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d734:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d738:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9d73c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d740:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d744:	d63f0200	blr	x16
   0x0000fffff7f9d748:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d74c:	54004300	b.eq	0xfffff7f9dfac  // b.none
   0x0000fffff7f9d750:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d754:	37d806a9	tbnz	w9, #27, 0xfffff7f9d828
   0x0000fffff7f9d758:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d75c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d764:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d768:	540001c1	b.ne	0xfffff7f9d7a0  // b.any
   0x0000fffff7f9d76c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d770:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d774:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d778:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d77c:	54000121	b.ne	0xfffff7f9d7a0  // b.any
   0x0000fffff7f9d780:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d784:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9d788:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d78c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d790:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d794:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9d798:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d79c:	14000030	b	0xfffff7f9d85c
   0x0000fffff7f9d7a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d7a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d7a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d7ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d7b0:	54000120	b.eq	0xfffff7f9d7d4  // b.none
   0x0000fffff7f9d7b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d7b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d7bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d7c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d7c4:	54000321	b.ne	0xfffff7f9d828  // b.any
   0x0000fffff7f9d7c8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d7cc:	9e620120	scvtf	d0, x9
   0x0000fffff7f9d7d0:	14000002	b	0xfffff7f9d7d8
   0x0000fffff7f9d7d4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9d7d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d7dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d7e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d7e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d7e8:	54000120	b.eq	0xfffff7f9d80c  // b.none
   0x0000fffff7f9d7ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d7f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d7f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d7f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d7fc:	54000161	b.ne	0xfffff7f9d828  // b.any
   0x0000fffff7f9d800:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9d804:	9e620121	scvtf	d1, x9
   0x0000fffff7f9d808:	14000002	b	0xfffff7f9d810
   0x0000fffff7f9d80c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9d810:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9d814:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9d818:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d81c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d820:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d824:	17ffffde	b	0xfffff7f9d79c
   0x0000fffff7f9d828:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9d82c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d830:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d834:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d838:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f9d83c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d840:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d844:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9d848:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9d84c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d850:	d63f0200	blr	x16
   0x0000fffff7f9d854:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d858:	54003ae0	b.eq	0xfffff7f9dfb4  // b.none
   0x0000fffff7f9d85c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9d860:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9d864:	540004a0	b.eq	0xfffff7f9d8f8  // b.none
   0x0000fffff7f9d868:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9d86c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9d870:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9d874:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9d878:	54000400	b.eq	0xfffff7f9d8f8  // b.none
   0x0000fffff7f9d87c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9d880:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9d884:	36d801d1	tbz	w17, #27, 0xfffff7f9d8bc
   0x0000fffff7f9d888:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9d88c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9d890:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9d894:	54000321	b.ne	0xfffff7f9d8f8  // b.any
   0x0000fffff7f9d898:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9d89c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d8a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9d8a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9d8a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9d8ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9d8b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9d8b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9d8b8:	54000209	b.ls	0xfffff7f9d8f8  // b.plast
   0x0000fffff7f9d8bc:	36d8008d	tbz	w13, #27, 0xfffff7f9d8cc
   0x0000fffff7f9d8c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9d8c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9d8c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9d8cc:	36d80091	tbz	w17, #27, 0xfffff7f9d8dc
   0x0000fffff7f9d8d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9d8d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9d8d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9d8dc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9d8e0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9d8e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9d8e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9d8ec:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9d8f0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9d8f4:	1400000e	b	0xfffff7f9d92c
   0x0000fffff7f9d8f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9d8fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9d900:	aa1303e1	mov	x1, x19
   0x0000fffff7f9d904:	aa1503e2	mov	x2, x21
   0x0000fffff7f9d908:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f9d90c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9d910:	aa1603e5	mov	x5, x22
   0x0000fffff7f9d914:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9d918:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9d91c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9d920:	d63f0200	blr	x16
   0x0000fffff7f9d924:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9d928:	540034a0	b.eq	0xfffff7f9dfbc  // b.none
   0x0000fffff7f9d92c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d930:	37d806a9	tbnz	w9, #27, 0xfffff7f9da04
   0x0000fffff7f9d934:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d93c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d940:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d944:	540001c1	b.ne	0xfffff7f9d97c  // b.any
   0x0000fffff7f9d948:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d94c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d954:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d958:	54000121	b.ne	0xfffff7f9d97c  // b.any
   0x0000fffff7f9d95c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d960:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9d964:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9d968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d96c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d970:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9d974:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9d978:	14000030	b	0xfffff7f9da38
   0x0000fffff7f9d97c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d980:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d988:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d98c:	54000120	b.eq	0xfffff7f9d9b0  // b.none
   0x0000fffff7f9d990:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9d994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d99c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d9a0:	54000321	b.ne	0xfffff7f9da04  // b.any
   0x0000fffff7f9d9a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9d9a8:	9e620120	scvtf	d0, x9
   0x0000fffff7f9d9ac:	14000002	b	0xfffff7f9d9b4
   0x0000fffff7f9d9b0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9d9b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d9b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d9bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d9c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d9c4:	54000120	b.eq	0xfffff7f9d9e8  // b.none
   0x0000fffff7f9d9c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9d9cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9d9d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d9d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9d9d8:	54000161	b.ne	0xfffff7f9da04  // b.any
   0x0000fffff7f9d9dc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9d9e0:	9e620121	scvtf	d1, x9
   0x0000fffff7f9d9e4:	14000002	b	0xfffff7f9d9ec
   0x0000fffff7f9d9e8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9d9ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9d9f0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9d9f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9d9f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9d9fc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9da00:	17ffffde	b	0xfffff7f9d978
   0x0000fffff7f9da04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9da08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9da0c:	aa1303e1	mov	x1, x19
   0x0000fffff7f9da10:	aa1503e2	mov	x2, x21
   0x0000fffff7f9da14:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f9da18:	aa1403e4	mov	x4, x20
   0x0000fffff7f9da1c:	aa1603e5	mov	x5, x22
   0x0000fffff7f9da20:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9da24:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9da28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9da2c:	d63f0200	blr	x16
   0x0000fffff7f9da30:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9da34:	54002c80	b.eq	0xfffff7f9dfc4  // b.none
   0x0000fffff7f9da38:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9da3c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9da40:	540004a0	b.eq	0xfffff7f9dad4  // b.none
   0x0000fffff7f9da44:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9da48:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9da4c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9da50:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9da54:	54000400	b.eq	0xfffff7f9dad4  // b.none
   0x0000fffff7f9da58:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9da5c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9da60:	36d801d1	tbz	w17, #27, 0xfffff7f9da98
   0x0000fffff7f9da64:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9da68:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9da6c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9da70:	54000321	b.ne	0xfffff7f9dad4  // b.any
   0x0000fffff7f9da74:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9da78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9da7c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9da80:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9da84:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9da88:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9da8c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9da90:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9da94:	54000209	b.ls	0xfffff7f9dad4  // b.plast
   0x0000fffff7f9da98:	36d8008d	tbz	w13, #27, 0xfffff7f9daa8
   0x0000fffff7f9da9c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9daa0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9daa4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9daa8:	36d80091	tbz	w17, #27, 0xfffff7f9dab8
   0x0000fffff7f9daac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9dab0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9dab4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9dab8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9dabc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9dac0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9dac4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9dac8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9dacc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9dad0:	1400000e	b	0xfffff7f9db08
   0x0000fffff7f9dad4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9dad8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9dadc:	aa1303e1	mov	x1, x19
   0x0000fffff7f9dae0:	aa1503e2	mov	x2, x21
   0x0000fffff7f9dae4:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f9dae8:	aa1403e4	mov	x4, x20
   0x0000fffff7f9daec:	aa1603e5	mov	x5, x22
   0x0000fffff7f9daf0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9daf4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9daf8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9dafc:	d63f0200	blr	x16
   0x0000fffff7f9db00:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9db04:	54002640	b.eq	0xfffff7f9dfcc  // b.none
   0x0000fffff7f9db08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9db0c:	37d806a9	tbnz	w9, #27, 0xfffff7f9dbe0
   0x0000fffff7f9db10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9db14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9db18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9db1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9db20:	540001c1	b.ne	0xfffff7f9db58  // b.any
   0x0000fffff7f9db24:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9db28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9db2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9db30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9db34:	54000121	b.ne	0xfffff7f9db58  // b.any
   0x0000fffff7f9db38:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9db3c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9db40:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9db44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9db48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9db4c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9db50:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9db54:	14000030	b	0xfffff7f9dc14
   0x0000fffff7f9db58:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9db5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9db60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9db64:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9db68:	54000120	b.eq	0xfffff7f9db8c  // b.none
   0x0000fffff7f9db6c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9db70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9db74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9db78:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9db7c:	54000321	b.ne	0xfffff7f9dbe0  // b.any
   0x0000fffff7f9db80:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9db84:	9e620120	scvtf	d0, x9
   0x0000fffff7f9db88:	14000002	b	0xfffff7f9db90
   0x0000fffff7f9db8c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9db90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9db94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9db98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9db9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9dba0:	54000120	b.eq	0xfffff7f9dbc4  // b.none
   0x0000fffff7f9dba4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9dba8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9dbac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dbb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9dbb4:	54000161	b.ne	0xfffff7f9dbe0  // b.any
   0x0000fffff7f9dbb8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9dbbc:	9e620121	scvtf	d1, x9
   0x0000fffff7f9dbc0:	14000002	b	0xfffff7f9dbc8
   0x0000fffff7f9dbc4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9dbc8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9dbcc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9dbd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9dbd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dbd8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9dbdc:	17ffffde	b	0xfffff7f9db54
   0x0000fffff7f9dbe0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9dbe4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9dbe8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9dbec:	aa1503e2	mov	x2, x21
   0x0000fffff7f9dbf0:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f9dbf4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9dbf8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9dbfc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9dc00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9dc04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9dc08:	d63f0200	blr	x16
   0x0000fffff7f9dc0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9dc10:	54001e20	b.eq	0xfffff7f9dfd4  // b.none
   0x0000fffff7f9dc14:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f9dc18:	f100017f	cmp	x11, #0x0
   0x0000fffff7f9dc1c:	540004a0	b.eq	0xfffff7f9dcb0  // b.none
   0x0000fffff7f9dc20:	b940016d	ldr	w13, [x11]
   0x0000fffff7f9dc24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f9dc28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f9dc2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f9dc30:	54000400	b.eq	0xfffff7f9dcb0  // b.none
   0x0000fffff7f9dc34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f9dc38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f9dc3c:	36d801d1	tbz	w17, #27, 0xfffff7f9dc74
   0x0000fffff7f9dc40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f9dc44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f9dc48:	f100013f	cmp	x9, #0x0
   0x0000fffff7f9dc4c:	54000321	b.ne	0xfffff7f9dcb0  // b.any
   0x0000fffff7f9dc50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f9dc54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9dc58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f9dc5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f9dc60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f9dc64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f9dc68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f9dc6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f9dc70:	54000209	b.ls	0xfffff7f9dcb0  // b.plast
   0x0000fffff7f9dc74:	36d8008d	tbz	w13, #27, 0xfffff7f9dc84
   0x0000fffff7f9dc78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f9dc7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f9dc80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f9dc84:	36d80091	tbz	w17, #27, 0xfffff7f9dc94
   0x0000fffff7f9dc88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f9dc8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f9dc90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f9dc94:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f9dc98:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f9dc9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f9dca0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f9dca4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f9dca8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f9dcac:	1400000e	b	0xfffff7f9dce4
   0x0000fffff7f9dcb0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9dcb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9dcb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f9dcbc:	aa1503e2	mov	x2, x21
   0x0000fffff7f9dcc0:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f9dcc4:	aa1403e4	mov	x4, x20
   0x0000fffff7f9dcc8:	aa1603e5	mov	x5, x22
   0x0000fffff7f9dccc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f9dcd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9dcd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9dcd8:	d63f0200	blr	x16
   0x0000fffff7f9dcdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9dce0:	540017e0	b.eq	0xfffff7f9dfdc  // b.none
   0x0000fffff7f9dce4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9dce8:	37d806a9	tbnz	w9, #27, 0xfffff7f9ddbc
   0x0000fffff7f9dcec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9dcf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9dcf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dcf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9dcfc:	540001c1	b.ne	0xfffff7f9dd34  // b.any
   0x0000fffff7f9dd00:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9dd04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9dd08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dd0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9dd10:	54000121	b.ne	0xfffff7f9dd34  // b.any
   0x0000fffff7f9dd14:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9dd18:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f9dd1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f9dd20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9dd24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dd28:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f9dd2c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9dd30:	14000030	b	0xfffff7f9ddf0
   0x0000fffff7f9dd34:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9dd38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9dd3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dd40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9dd44:	54000120	b.eq	0xfffff7f9dd68  // b.none
   0x0000fffff7f9dd48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f9dd4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9dd50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dd54:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9dd58:	54000321	b.ne	0xfffff7f9ddbc  // b.any
   0x0000fffff7f9dd5c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f9dd60:	9e620120	scvtf	d0, x9
   0x0000fffff7f9dd64:	14000002	b	0xfffff7f9dd6c
   0x0000fffff7f9dd68:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f9dd6c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9dd70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9dd74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dd78:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9dd7c:	54000120	b.eq	0xfffff7f9dda0  // b.none
   0x0000fffff7f9dd80:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9dd84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9dd88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dd8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9dd90:	54000161	b.ne	0xfffff7f9ddbc  // b.any
   0x0000fffff7f9dd94:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f9dd98:	9e620121	scvtf	d1, x9
   0x0000fffff7f9dd9c:	14000002	b	0xfffff7f9dda4
   0x0000fffff7f9dda0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f9dda4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f9dda8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f9ddac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f9ddb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9ddb4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f9ddb8:	17ffffde	b	0xfffff7f9dd30
   0x0000fffff7f9ddbc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9ddc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9ddc4:	aa1303e1	mov	x1, x19
   0x0000fffff7f9ddc8:	aa1503e2	mov	x2, x21
   0x0000fffff7f9ddcc:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f9ddd0:	aa1403e4	mov	x4, x20
   0x0000fffff7f9ddd4:	aa1603e5	mov	x5, x22
   0x0000fffff7f9ddd8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f9dddc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9dde0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9dde4:	d63f0200	blr	x16
   0x0000fffff7f9dde8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9ddec:	54000fc0	b.eq	0xfffff7f9dfe4  // b.none
   0x0000fffff7f9ddf0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f9ddf4:	37d80269	tbnz	w9, #27, 0xfffff7f9de40
   0x0000fffff7f9ddf8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f9ddfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9de00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9de04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f9de08:	540001c1	b.ne	0xfffff7f9de40  // b.any
   0x0000fffff7f9de0c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f9de10:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f9de14:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f9de18:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f9de1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9de20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9de24:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f9de28:	aa0b03e9	mov	x9, x11
   0x0000fffff7f9de2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9de30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9de34:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f9de38:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f9de3c:	1400000e	b	0xfffff7f9de74
   0x0000fffff7f9de40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9de44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9de48:	aa1303e1	mov	x1, x19
   0x0000fffff7f9de4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f9de50:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f9de54:	aa1403e4	mov	x4, x20
   0x0000fffff7f9de58:	aa1603e5	mov	x5, x22
   0x0000fffff7f9de5c:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7f9de60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9de64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9de68:	d63f0200	blr	x16
   0x0000fffff7f9de6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9de70:	54000be0	b.eq	0xfffff7f9dfec  // b.none
   0x0000fffff7f9de74:	17fff8d2	b	0xfffff7f9c1bc
   0x0000fffff7f9de78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9de7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9de80:	aa1303e1	mov	x1, x19
   0x0000fffff7f9de84:	aa1503e2	mov	x2, x21
   0x0000fffff7f9de88:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f9de8c:	aa1403e4	mov	x4, x20
   0x0000fffff7f9de90:	aa1603e5	mov	x5, x22
   0x0000fffff7f9de94:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7f9de98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9de9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9dea0:	d63f0200	blr	x16
   0x0000fffff7f9dea4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9dea8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9deac:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9deb0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9deb4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f9deb8:	d65f03c0	ret
   0x0000fffff7f9debc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9dec0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f9dec4:	b900028a	str	w10, [x20]
   0x0000fffff7f9dec8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9decc:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f9ded0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9ded4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f9ded8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9dedc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f9dee0:	d65f03c0	ret
   0x0000fffff7f9dee4:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f9dee8:	17fffff5	b	0xfffff7f9debc
   0x0000fffff7f9deec:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f9def0:	17fffff3	b	0xfffff7f9debc
   0x0000fffff7f9def4:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f9def8:	17fffff1	b	0xfffff7f9debc
   0x0000fffff7f9defc:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f9df00:	17ffffef	b	0xfffff7f9debc
   0x0000fffff7f9df04:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f9df08:	17ffffed	b	0xfffff7f9debc
   0x0000fffff7f9df0c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f9df10:	17ffffeb	b	0xfffff7f9debc
   0x0000fffff7f9df14:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f9df18:	17ffffe9	b	0xfffff7f9debc
   0x0000fffff7f9df1c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f9df20:	17ffffe7	b	0xfffff7f9debc
   0x0000fffff7f9df24:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f9df28:	17ffffe5	b	0xfffff7f9debc
   0x0000fffff7f9df2c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f9df30:	17ffffe3	b	0xfffff7f9debc
   0x0000fffff7f9df34:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f9df38:	17ffffe1	b	0xfffff7f9debc
   0x0000fffff7f9df3c:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f9df40:	17ffffdf	b	0xfffff7f9debc
   0x0000fffff7f9df44:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f9df48:	17ffffdd	b	0xfffff7f9debc
   0x0000fffff7f9df4c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f9df50:	17ffffdb	b	0xfffff7f9debc
   0x0000fffff7f9df54:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f9df58:	17ffffd9	b	0xfffff7f9debc
   0x0000fffff7f9df5c:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f9df60:	17ffffd7	b	0xfffff7f9debc
   0x0000fffff7f9df64:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f9df68:	17ffffd5	b	0xfffff7f9debc
   0x0000fffff7f9df6c:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f9df70:	17ffffd3	b	0xfffff7f9debc
   0x0000fffff7f9df74:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f9df78:	17ffffd1	b	0xfffff7f9debc
   0x0000fffff7f9df7c:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f9df80:	17ffffcf	b	0xfffff7f9debc
   0x0000fffff7f9df84:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f9df88:	17ffffcd	b	0xfffff7f9debc
   0x0000fffff7f9df8c:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f9df90:	17ffffcb	b	0xfffff7f9debc
   0x0000fffff7f9df94:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f9df98:	17ffffc9	b	0xfffff7f9debc
   0x0000fffff7f9df9c:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f9dfa0:	17ffffc7	b	0xfffff7f9debc
   0x0000fffff7f9dfa4:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f9dfa8:	17ffffc5	b	0xfffff7f9debc
   0x0000fffff7f9dfac:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f9dfb0:	17ffffc3	b	0xfffff7f9debc
   0x0000fffff7f9dfb4:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f9dfb8:	17ffffc1	b	0xfffff7f9debc
   0x0000fffff7f9dfbc:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f9dfc0:	17ffffbf	b	0xfffff7f9debc
   0x0000fffff7f9dfc4:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f9dfc8:	17ffffbd	b	0xfffff7f9debc
   0x0000fffff7f9dfcc:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f9dfd0:	17ffffbb	b	0xfffff7f9debc
   0x0000fffff7f9dfd4:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f9dfd8:	17ffffb9	b	0xfffff7f9debc
   0x0000fffff7f9dfdc:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f9dfe0:	17ffffb7	b	0xfffff7f9debc
   0x0000fffff7f9dfe4:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f9dfe8:	17ffffb5	b	0xfffff7f9debc
   0x0000fffff7f9dfec:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f9dff0:	17ffffb3	b	0xfffff7f9debc
   0x0000fffff7f9dff4:	00000000	udf	#0
   0x0000fffff7f9dff8:	00000000	udf	#0
   0x0000fffff7f9dffc:	00000000	udf	#0
End of assembler dump.
