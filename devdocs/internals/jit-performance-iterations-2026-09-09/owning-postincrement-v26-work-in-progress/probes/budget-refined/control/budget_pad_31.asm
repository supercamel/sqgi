Dump of assembler code from 0xfffff7d7c000 to 0xfffff7d7e000:
   0x0000fffff7d7c000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7d7c004:	910003fd	mov	x29, sp
   0x0000fffff7d7c008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7d7c00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7d7c010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7d7c014:	aa0003f3	mov	x19, x0
   0x0000fffff7d7c018:	aa0103f4	mov	x20, x1
   0x0000fffff7d7c01c:	aa0203f5	mov	x21, x2
   0x0000fffff7d7c020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7d7c024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7d7c028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7d7c02c:	f90003e9	str	x9, [sp]
   0x0000fffff7d7c030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7d7c034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7d7c038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7d7c03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d7c040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c044:	d63f0200	blr	x16
   0x0000fffff7d7c048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7d7c04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7d7c050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7d7c054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7d7c058:	14000001	b	0xfffff7d7c05c
   0x0000fffff7d7c05c:	14000001	b	0xfffff7d7c060
   0x0000fffff7d7c060:	14000001	b	0xfffff7d7c064
   0x0000fffff7d7c064:	14000001	b	0xfffff7d7c068
   0x0000fffff7d7c068:	14000001	b	0xfffff7d7c06c
   0x0000fffff7d7c06c:	14000001	b	0xfffff7d7c070
   0x0000fffff7d7c070:	14000001	b	0xfffff7d7c074
   0x0000fffff7d7c074:	14000001	b	0xfffff7d7c078
   0x0000fffff7d7c078:	14000001	b	0xfffff7d7c07c
   0x0000fffff7d7c07c:	14000001	b	0xfffff7d7c080
   0x0000fffff7d7c080:	14000001	b	0xfffff7d7c084
   0x0000fffff7d7c084:	14000001	b	0xfffff7d7c088
   0x0000fffff7d7c088:	14000001	b	0xfffff7d7c08c
   0x0000fffff7d7c08c:	14000001	b	0xfffff7d7c090
   0x0000fffff7d7c090:	14000001	b	0xfffff7d7c094
   0x0000fffff7d7c094:	14000001	b	0xfffff7d7c098
   0x0000fffff7d7c098:	14000001	b	0xfffff7d7c09c
   0x0000fffff7d7c09c:	14000001	b	0xfffff7d7c0a0
   0x0000fffff7d7c0a0:	14000001	b	0xfffff7d7c0a4
   0x0000fffff7d7c0a4:	14000001	b	0xfffff7d7c0a8
   0x0000fffff7d7c0a8:	14000001	b	0xfffff7d7c0ac
   0x0000fffff7d7c0ac:	14000001	b	0xfffff7d7c0b0
   0x0000fffff7d7c0b0:	14000001	b	0xfffff7d7c0b4
   0x0000fffff7d7c0b4:	14000001	b	0xfffff7d7c0b8
   0x0000fffff7d7c0b8:	14000001	b	0xfffff7d7c0bc
   0x0000fffff7d7c0bc:	14000001	b	0xfffff7d7c0c0
   0x0000fffff7d7c0c0:	14000001	b	0xfffff7d7c0c4
   0x0000fffff7d7c0c4:	14000001	b	0xfffff7d7c0c8
   0x0000fffff7d7c0c8:	14000001	b	0xfffff7d7c0cc
   0x0000fffff7d7c0cc:	14000001	b	0xfffff7d7c0d0
   0x0000fffff7d7c0d0:	14000001	b	0xfffff7d7c0d4
   0x0000fffff7d7c0d4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7d7c0d8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7d7c0dc:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7d7c0e0:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7d7c0e4:	36d80211	tbz	w17, #27, 0xfffff7d7c124
   0x0000fffff7d7c0e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7c0ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7c0f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7c0f4:	540001e1	b.ne	0xfffff7d7c130  // b.any
   0x0000fffff7d7c0f8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7d7c0fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c100:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7c104:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7c108:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7c10c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7c110:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7c114:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7c118:	540000c9	b.ls	0xfffff7d7c130  // b.plast
   0x0000fffff7d7c11c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7c120:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7c124:	f900266c	str	x12, [x19, #72]
   0x0000fffff7d7c128:	b900426d	str	w13, [x19, #64]
   0x0000fffff7d7c12c:	1400000e	b	0xfffff7d7c164
   0x0000fffff7d7c130:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7c134:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c138:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c13c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c140:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7d7c144:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c148:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c14c:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7d7c150:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7c154:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c158:	d63f0200	blr	x16
   0x0000fffff7d7c15c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c160:	5400e940	b.eq	0xfffff7d7de88  // b.none
   0x0000fffff7d7c164:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7d7c168:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7d7c16c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7d7c170:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7d7c174:	36d80211	tbz	w17, #27, 0xfffff7d7c1b4
   0x0000fffff7d7c178:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7c17c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7c180:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7c184:	540001e1	b.ne	0xfffff7d7c1c0  // b.any
   0x0000fffff7d7c188:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7d7c18c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c190:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7c194:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7c198:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7c19c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7c1a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7c1a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7c1a8:	540000c9	b.ls	0xfffff7d7c1c0  // b.plast
   0x0000fffff7d7c1ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7c1b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7c1b4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7d7c1b8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7d7c1bc:	1400000e	b	0xfffff7d7c1f4
   0x0000fffff7d7c1c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7c1c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c1c8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c1cc:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c1d0:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7d7c1d4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c1d8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c1dc:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7d7c1e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7c1e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c1e8:	d63f0200	blr	x16
   0x0000fffff7d7c1ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c1f0:	5400e500	b.eq	0xfffff7d7de90  // b.none
   0x0000fffff7d7c1f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7c1f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c1fc:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c200:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c204:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7d7c208:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c20c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c210:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7d7c214:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7c218:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c21c:	d63f0200	blr	x16
   0x0000fffff7d7c220:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c224:	5400e3a0	b.eq	0xfffff7d7de98  // b.none
   0x0000fffff7d7c228:	f100041f	cmp	x0, #0x1
   0x0000fffff7d7c22c:	5400df80	b.eq	0xfffff7d7de1c  // b.none
   0x0000fffff7d7c230:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7d7c234:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7d7c238:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7d7c23c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7d7c240:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7d7c244:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7d7c248:	36d801d1	tbz	w17, #27, 0xfffff7d7c280
   0x0000fffff7d7c24c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7c250:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7c254:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7c258:	54000281	b.ne	0xfffff7d7c2a8  // b.any
   0x0000fffff7d7c25c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7c260:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c264:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7c268:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7c26c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7c270:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7c274:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7c278:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7c27c:	54000169	b.ls	0xfffff7d7c2a8  // b.plast
   0x0000fffff7d7c280:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7c284:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7c288:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7c28c:	36d80091	tbz	w17, #27, 0xfffff7d7c29c
   0x0000fffff7d7c290:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c294:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7c298:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7c29c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7c2a0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7c2a4:	1400000e	b	0xfffff7d7c2dc
   0x0000fffff7d7c2a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7c2ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c2b0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c2b4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c2b8:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7d7c2bc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c2c0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c2c4:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7d7c2c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7c2cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c2d0:	d63f0200	blr	x16
   0x0000fffff7d7c2d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c2d8:	5400de40	b.eq	0xfffff7d7dea0  // b.none
   0x0000fffff7d7c2dc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7d7c2e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7c2e4:	540003a0	b.eq	0xfffff7d7c358  // b.none
   0x0000fffff7d7c2e8:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7d7c2ec:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7d7c2f0:	b9400171	ldr	w17, [x11]
   0x0000fffff7d7c2f4:	36d801d1	tbz	w17, #27, 0xfffff7d7c32c
   0x0000fffff7d7c2f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7c2fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7c300:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7c304:	540002a1	b.ne	0xfffff7d7c358  // b.any
   0x0000fffff7d7c308:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7d7c30c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c310:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7c314:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7c318:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7c31c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7c320:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7c324:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7c328:	54000189	b.ls	0xfffff7d7c358  // b.plast
   0x0000fffff7d7c32c:	36d8008d	tbz	w13, #27, 0xfffff7d7c33c
   0x0000fffff7d7c330:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7c334:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7c338:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7c33c:	36d80091	tbz	w17, #27, 0xfffff7d7c34c
   0x0000fffff7d7c340:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c344:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7c348:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7c34c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7d7c350:	b900016d	str	w13, [x11]
   0x0000fffff7d7c354:	1400000e	b	0xfffff7d7c38c
   0x0000fffff7d7c358:	910043e6	add	x6, sp, #0x10
   0x0000fffff7d7c35c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c360:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c364:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c368:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7d7c36c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c370:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c374:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7d7c378:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7c37c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c380:	d63f0200	blr	x16
   0x0000fffff7d7c384:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c388:	5400d900	b.eq	0xfffff7d7dea8  // b.none
   0x0000fffff7d7c38c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7c390:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7c394:	540004a0	b.eq	0xfffff7d7c428  // b.none
   0x0000fffff7d7c398:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7c39c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7c3a0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7c3a4:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7c3a8:	54000400	b.eq	0xfffff7d7c428  // b.none
   0x0000fffff7d7c3ac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7c3b0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7c3b4:	36d801d1	tbz	w17, #27, 0xfffff7d7c3ec
   0x0000fffff7d7c3b8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7c3bc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7c3c0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7c3c4:	54000321	b.ne	0xfffff7d7c428  // b.any
   0x0000fffff7d7c3c8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7c3cc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c3d0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7c3d4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7c3d8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7c3dc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7c3e0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7c3e4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7c3e8:	54000209	b.ls	0xfffff7d7c428  // b.plast
   0x0000fffff7d7c3ec:	36d8008d	tbz	w13, #27, 0xfffff7d7c3fc
   0x0000fffff7d7c3f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7c3f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7c3f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7c3fc:	36d80091	tbz	w17, #27, 0xfffff7d7c40c
   0x0000fffff7d7c400:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c404:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7c408:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7c40c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7c410:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7c414:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7c418:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7c41c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7c420:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7c424:	1400000e	b	0xfffff7d7c45c
   0x0000fffff7d7c428:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7c42c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c430:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c434:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c438:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7d7c43c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c440:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c444:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7c448:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7c44c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c450:	d63f0200	blr	x16
   0x0000fffff7d7c454:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c458:	5400d2c0	b.eq	0xfffff7d7deb0  // b.none
   0x0000fffff7d7c45c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c460:	37d806a9	tbnz	w9, #27, 0xfffff7d7c534
   0x0000fffff7d7c464:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c468:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c46c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c470:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c474:	540001c1	b.ne	0xfffff7d7c4ac  // b.any
   0x0000fffff7d7c478:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7c47c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c480:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c484:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c488:	54000121	b.ne	0xfffff7d7c4ac  // b.any
   0x0000fffff7d7c48c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7c490:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7c494:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7c498:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c49c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c4a0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7c4a4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7c4a8:	14000030	b	0xfffff7d7c568
   0x0000fffff7d7c4ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c4b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7c4b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c4b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c4bc:	54000120	b.eq	0xfffff7d7c4e0  // b.none
   0x0000fffff7d7c4c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c4c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c4c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c4cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c4d0:	54000321	b.ne	0xfffff7d7c534  // b.any
   0x0000fffff7d7c4d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7c4d8:	9e620120	scvtf	d0, x9
   0x0000fffff7d7c4dc:	14000002	b	0xfffff7d7c4e4
   0x0000fffff7d7c4e0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7c4e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7c4e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7c4ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c4f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c4f4:	54000120	b.eq	0xfffff7d7c518  // b.none
   0x0000fffff7d7c4f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7c4fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c500:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c504:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c508:	54000161	b.ne	0xfffff7d7c534  // b.any
   0x0000fffff7d7c50c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7c510:	9e620121	scvtf	d1, x9
   0x0000fffff7d7c514:	14000002	b	0xfffff7d7c51c
   0x0000fffff7d7c518:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7c51c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7c520:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7c524:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7c528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c52c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7c530:	17ffffde	b	0xfffff7d7c4a8
   0x0000fffff7d7c534:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7c538:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c53c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c540:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c544:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7d7c548:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c54c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c550:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7c554:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7c558:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c55c:	d63f0200	blr	x16
   0x0000fffff7d7c560:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c564:	5400caa0	b.eq	0xfffff7d7deb8  // b.none
   0x0000fffff7d7c568:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7c56c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7c570:	540004a0	b.eq	0xfffff7d7c604  // b.none
   0x0000fffff7d7c574:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7c578:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7c57c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7c580:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7c584:	54000400	b.eq	0xfffff7d7c604  // b.none
   0x0000fffff7d7c588:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7c58c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7c590:	36d801d1	tbz	w17, #27, 0xfffff7d7c5c8
   0x0000fffff7d7c594:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7c598:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7c59c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7c5a0:	54000321	b.ne	0xfffff7d7c604  // b.any
   0x0000fffff7d7c5a4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7c5a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c5ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7c5b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7c5b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7c5b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7c5bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7c5c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7c5c4:	54000209	b.ls	0xfffff7d7c604  // b.plast
   0x0000fffff7d7c5c8:	36d8008d	tbz	w13, #27, 0xfffff7d7c5d8
   0x0000fffff7d7c5cc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7c5d0:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7c5d4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7c5d8:	36d80091	tbz	w17, #27, 0xfffff7d7c5e8
   0x0000fffff7d7c5dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c5e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7c5e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7c5e8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7c5ec:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7c5f0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7c5f4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7c5f8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7c5fc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7c600:	1400000e	b	0xfffff7d7c638
   0x0000fffff7d7c604:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7c608:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c60c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c610:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c614:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7d7c618:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c61c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c620:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7c624:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7c628:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c62c:	d63f0200	blr	x16
   0x0000fffff7d7c630:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c634:	5400c460	b.eq	0xfffff7d7dec0  // b.none
   0x0000fffff7d7c638:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c63c:	37d806a9	tbnz	w9, #27, 0xfffff7d7c710
   0x0000fffff7d7c640:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c64c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c650:	540001c1	b.ne	0xfffff7d7c688  // b.any
   0x0000fffff7d7c654:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7c658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c65c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c660:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c664:	54000121	b.ne	0xfffff7d7c688  // b.any
   0x0000fffff7d7c668:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7c66c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7c670:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7c674:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c678:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c67c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7c680:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7c684:	14000030	b	0xfffff7d7c744
   0x0000fffff7d7c688:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c68c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7c690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c694:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c698:	54000120	b.eq	0xfffff7d7c6bc  // b.none
   0x0000fffff7d7c69c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c6a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c6a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c6a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c6ac:	54000321	b.ne	0xfffff7d7c710  // b.any
   0x0000fffff7d7c6b0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7c6b4:	9e620120	scvtf	d0, x9
   0x0000fffff7d7c6b8:	14000002	b	0xfffff7d7c6c0
   0x0000fffff7d7c6bc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7c6c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7c6c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7c6c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c6cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c6d0:	54000120	b.eq	0xfffff7d7c6f4  // b.none
   0x0000fffff7d7c6d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7c6d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c6dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c6e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c6e4:	54000161	b.ne	0xfffff7d7c710  // b.any
   0x0000fffff7d7c6e8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7c6ec:	9e620121	scvtf	d1, x9
   0x0000fffff7d7c6f0:	14000002	b	0xfffff7d7c6f8
   0x0000fffff7d7c6f4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7c6f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7c6fc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7c700:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7c704:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c708:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7c70c:	17ffffde	b	0xfffff7d7c684
   0x0000fffff7d7c710:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7c714:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c718:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c71c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c720:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7d7c724:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c728:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c72c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7c730:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7c734:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c738:	d63f0200	blr	x16
   0x0000fffff7d7c73c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c740:	5400bc40	b.eq	0xfffff7d7dec8  // b.none
   0x0000fffff7d7c744:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7c748:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7c74c:	540004a0	b.eq	0xfffff7d7c7e0  // b.none
   0x0000fffff7d7c750:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7c754:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7c758:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7c75c:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7c760:	54000400	b.eq	0xfffff7d7c7e0  // b.none
   0x0000fffff7d7c764:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7c768:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7c76c:	36d801d1	tbz	w17, #27, 0xfffff7d7c7a4
   0x0000fffff7d7c770:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7c774:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7c778:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7c77c:	54000321	b.ne	0xfffff7d7c7e0  // b.any
   0x0000fffff7d7c780:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7c784:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c788:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7c78c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7c790:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7c794:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7c798:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7c79c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7c7a0:	54000209	b.ls	0xfffff7d7c7e0  // b.plast
   0x0000fffff7d7c7a4:	36d8008d	tbz	w13, #27, 0xfffff7d7c7b4
   0x0000fffff7d7c7a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7c7ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7c7b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7c7b4:	36d80091	tbz	w17, #27, 0xfffff7d7c7c4
   0x0000fffff7d7c7b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c7bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7c7c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7c7c4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7c7c8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7c7cc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7c7d0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7c7d4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7c7d8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7c7dc:	1400000e	b	0xfffff7d7c814
   0x0000fffff7d7c7e0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7c7e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c7e8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c7ec:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c7f0:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7d7c7f4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c7f8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c7fc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7c800:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7c804:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c808:	d63f0200	blr	x16
   0x0000fffff7d7c80c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c810:	5400b600	b.eq	0xfffff7d7ded0  // b.none
   0x0000fffff7d7c814:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c818:	37d806a9	tbnz	w9, #27, 0xfffff7d7c8ec
   0x0000fffff7d7c81c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c820:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c824:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c828:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c82c:	540001c1	b.ne	0xfffff7d7c864  // b.any
   0x0000fffff7d7c830:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7c834:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c838:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c83c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c840:	54000121	b.ne	0xfffff7d7c864  // b.any
   0x0000fffff7d7c844:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7c848:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7c84c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7c850:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c858:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7c85c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7c860:	14000030	b	0xfffff7d7c920
   0x0000fffff7d7c864:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c868:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7c86c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c870:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c874:	54000120	b.eq	0xfffff7d7c898  // b.none
   0x0000fffff7d7c878:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c87c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c884:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c888:	54000321	b.ne	0xfffff7d7c8ec  // b.any
   0x0000fffff7d7c88c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7c890:	9e620120	scvtf	d0, x9
   0x0000fffff7d7c894:	14000002	b	0xfffff7d7c89c
   0x0000fffff7d7c898:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7c89c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7c8a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7c8a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c8a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c8ac:	54000120	b.eq	0xfffff7d7c8d0  // b.none
   0x0000fffff7d7c8b0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7c8b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7c8b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c8bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7c8c0:	54000161	b.ne	0xfffff7d7c8ec  // b.any
   0x0000fffff7d7c8c4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7c8c8:	9e620121	scvtf	d1, x9
   0x0000fffff7d7c8cc:	14000002	b	0xfffff7d7c8d4
   0x0000fffff7d7c8d0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7c8d4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7c8d8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7c8dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7c8e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7c8e4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7c8e8:	17ffffde	b	0xfffff7d7c860
   0x0000fffff7d7c8ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7c8f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c8f4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c8f8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c8fc:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7d7c900:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c904:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c908:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7c90c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7c910:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c914:	d63f0200	blr	x16
   0x0000fffff7d7c918:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c91c:	5400ade0	b.eq	0xfffff7d7ded8  // b.none
   0x0000fffff7d7c920:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7c924:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7c928:	540004a0	b.eq	0xfffff7d7c9bc  // b.none
   0x0000fffff7d7c92c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7c930:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7c934:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7c938:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7c93c:	54000400	b.eq	0xfffff7d7c9bc  // b.none
   0x0000fffff7d7c940:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7c944:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7c948:	36d801d1	tbz	w17, #27, 0xfffff7d7c980
   0x0000fffff7d7c94c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7c950:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7c954:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7c958:	54000321	b.ne	0xfffff7d7c9bc  // b.any
   0x0000fffff7d7c95c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7c960:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c964:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7c968:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7c96c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7c970:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7c974:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7c978:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7c97c:	54000209	b.ls	0xfffff7d7c9bc  // b.plast
   0x0000fffff7d7c980:	36d8008d	tbz	w13, #27, 0xfffff7d7c990
   0x0000fffff7d7c984:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7c988:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7c98c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7c990:	36d80091	tbz	w17, #27, 0xfffff7d7c9a0
   0x0000fffff7d7c994:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7c998:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7c99c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7c9a0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7c9a4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7c9a8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7c9ac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7c9b0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7c9b4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7c9b8:	1400000e	b	0xfffff7d7c9f0
   0x0000fffff7d7c9bc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7c9c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7c9c4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7c9c8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7c9cc:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7d7c9d0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7c9d4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7c9d8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7c9dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7c9e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7c9e4:	d63f0200	blr	x16
   0x0000fffff7d7c9e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7c9ec:	5400a7a0	b.eq	0xfffff7d7dee0  // b.none
   0x0000fffff7d7c9f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c9f4:	37d806a9	tbnz	w9, #27, 0xfffff7d7cac8
   0x0000fffff7d7c9f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7c9fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ca00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ca04:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ca08:	540001c1	b.ne	0xfffff7d7ca40  // b.any
   0x0000fffff7d7ca0c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ca10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ca14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ca18:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ca1c:	54000121	b.ne	0xfffff7d7ca40  // b.any
   0x0000fffff7d7ca20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ca24:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7ca28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7ca2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ca30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ca34:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7ca38:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7ca3c:	14000030	b	0xfffff7d7cafc
   0x0000fffff7d7ca40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ca44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ca48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ca4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ca50:	54000120	b.eq	0xfffff7d7ca74  // b.none
   0x0000fffff7d7ca54:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ca58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ca5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ca60:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ca64:	54000321	b.ne	0xfffff7d7cac8  // b.any
   0x0000fffff7d7ca68:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ca6c:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ca70:	14000002	b	0xfffff7d7ca78
   0x0000fffff7d7ca74:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7ca78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ca7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ca80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ca84:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ca88:	54000120	b.eq	0xfffff7d7caac  // b.none
   0x0000fffff7d7ca8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ca90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ca94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ca98:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ca9c:	54000161	b.ne	0xfffff7d7cac8  // b.any
   0x0000fffff7d7caa0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7caa4:	9e620121	scvtf	d1, x9
   0x0000fffff7d7caa8:	14000002	b	0xfffff7d7cab0
   0x0000fffff7d7caac:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7cab0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7cab4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7cab8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7cabc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cac0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7cac4:	17ffffde	b	0xfffff7d7ca3c
   0x0000fffff7d7cac8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7cacc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7cad0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7cad4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7cad8:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7d7cadc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7cae0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7cae4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7cae8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7caec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7caf0:	d63f0200	blr	x16
   0x0000fffff7d7caf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7caf8:	54009f80	b.eq	0xfffff7d7dee8  // b.none
   0x0000fffff7d7cafc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7cb00:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7cb04:	540004a0	b.eq	0xfffff7d7cb98  // b.none
   0x0000fffff7d7cb08:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7cb0c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7cb10:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7cb14:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7cb18:	54000400	b.eq	0xfffff7d7cb98  // b.none
   0x0000fffff7d7cb1c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7cb20:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7cb24:	36d801d1	tbz	w17, #27, 0xfffff7d7cb5c
   0x0000fffff7d7cb28:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7cb2c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7cb30:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7cb34:	54000321	b.ne	0xfffff7d7cb98  // b.any
   0x0000fffff7d7cb38:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7cb3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7cb40:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7cb44:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7cb48:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7cb4c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7cb50:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7cb54:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7cb58:	54000209	b.ls	0xfffff7d7cb98  // b.plast
   0x0000fffff7d7cb5c:	36d8008d	tbz	w13, #27, 0xfffff7d7cb6c
   0x0000fffff7d7cb60:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7cb64:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7cb68:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7cb6c:	36d80091	tbz	w17, #27, 0xfffff7d7cb7c
   0x0000fffff7d7cb70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7cb74:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7cb78:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7cb7c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7cb80:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7cb84:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7cb88:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7cb8c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7cb90:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7cb94:	1400000e	b	0xfffff7d7cbcc
   0x0000fffff7d7cb98:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7cb9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7cba0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7cba4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7cba8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7d7cbac:	aa1403e4	mov	x4, x20
   0x0000fffff7d7cbb0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7cbb4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7cbb8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7cbbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7cbc0:	d63f0200	blr	x16
   0x0000fffff7d7cbc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7cbc8:	54009940	b.eq	0xfffff7d7def0  // b.none
   0x0000fffff7d7cbcc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cbd0:	37d806a9	tbnz	w9, #27, 0xfffff7d7cca4
   0x0000fffff7d7cbd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cbd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cbdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cbe0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cbe4:	540001c1	b.ne	0xfffff7d7cc1c  // b.any
   0x0000fffff7d7cbe8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7cbec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cbf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cbf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cbf8:	54000121	b.ne	0xfffff7d7cc1c  // b.any
   0x0000fffff7d7cbfc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7cc00:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7cc04:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7cc08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cc0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cc10:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7cc14:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7cc18:	14000030	b	0xfffff7d7ccd8
   0x0000fffff7d7cc1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cc20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7cc24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cc28:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cc2c:	54000120	b.eq	0xfffff7d7cc50  // b.none
   0x0000fffff7d7cc30:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cc34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cc38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cc3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cc40:	54000321	b.ne	0xfffff7d7cca4  // b.any
   0x0000fffff7d7cc44:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7cc48:	9e620120	scvtf	d0, x9
   0x0000fffff7d7cc4c:	14000002	b	0xfffff7d7cc54
   0x0000fffff7d7cc50:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7cc54:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7cc58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7cc5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cc60:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cc64:	54000120	b.eq	0xfffff7d7cc88  // b.none
   0x0000fffff7d7cc68:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7cc6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cc70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cc74:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cc78:	54000161	b.ne	0xfffff7d7cca4  // b.any
   0x0000fffff7d7cc7c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7cc80:	9e620121	scvtf	d1, x9
   0x0000fffff7d7cc84:	14000002	b	0xfffff7d7cc8c
   0x0000fffff7d7cc88:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7cc8c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7cc90:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7cc94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7cc98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cc9c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7cca0:	17ffffde	b	0xfffff7d7cc18
   0x0000fffff7d7cca4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7cca8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ccac:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ccb0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ccb4:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7d7ccb8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ccbc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ccc0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7ccc4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7ccc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7cccc:	d63f0200	blr	x16
   0x0000fffff7d7ccd0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ccd4:	54009120	b.eq	0xfffff7d7def8  // b.none
   0x0000fffff7d7ccd8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7ccdc:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7cce0:	540004a0	b.eq	0xfffff7d7cd74  // b.none
   0x0000fffff7d7cce4:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7cce8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7ccec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7ccf0:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7ccf4:	54000400	b.eq	0xfffff7d7cd74  // b.none
   0x0000fffff7d7ccf8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ccfc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7cd00:	36d801d1	tbz	w17, #27, 0xfffff7d7cd38
   0x0000fffff7d7cd04:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7cd08:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7cd0c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7cd10:	54000321	b.ne	0xfffff7d7cd74  // b.any
   0x0000fffff7d7cd14:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7cd18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7cd1c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7cd20:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7cd24:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7cd28:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7cd2c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7cd30:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7cd34:	54000209	b.ls	0xfffff7d7cd74  // b.plast
   0x0000fffff7d7cd38:	36d8008d	tbz	w13, #27, 0xfffff7d7cd48
   0x0000fffff7d7cd3c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7cd40:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7cd44:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7cd48:	36d80091	tbz	w17, #27, 0xfffff7d7cd58
   0x0000fffff7d7cd4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7cd50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7cd54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7cd58:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7cd5c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7cd60:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7cd64:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7cd68:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7cd6c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7cd70:	1400000e	b	0xfffff7d7cda8
   0x0000fffff7d7cd74:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7cd78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7cd7c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7cd80:	aa1503e2	mov	x2, x21
   0x0000fffff7d7cd84:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7d7cd88:	aa1403e4	mov	x4, x20
   0x0000fffff7d7cd8c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7cd90:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7cd94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7cd98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7cd9c:	d63f0200	blr	x16
   0x0000fffff7d7cda0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7cda4:	54008ae0	b.eq	0xfffff7d7df00  // b.none
   0x0000fffff7d7cda8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cdac:	37d806a9	tbnz	w9, #27, 0xfffff7d7ce80
   0x0000fffff7d7cdb0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cdb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cdb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cdbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cdc0:	540001c1	b.ne	0xfffff7d7cdf8  // b.any
   0x0000fffff7d7cdc4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7cdc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cdcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cdd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cdd4:	54000121	b.ne	0xfffff7d7cdf8  // b.any
   0x0000fffff7d7cdd8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7cddc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7cde0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7cde4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cde8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cdec:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7cdf0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7cdf4:	14000030	b	0xfffff7d7ceb4
   0x0000fffff7d7cdf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cdfc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ce00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ce04:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ce08:	54000120	b.eq	0xfffff7d7ce2c  // b.none
   0x0000fffff7d7ce0c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7ce10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ce14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ce18:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ce1c:	54000321	b.ne	0xfffff7d7ce80  // b.any
   0x0000fffff7d7ce20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7ce24:	9e620120	scvtf	d0, x9
   0x0000fffff7d7ce28:	14000002	b	0xfffff7d7ce30
   0x0000fffff7d7ce2c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7ce30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ce34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ce38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ce3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ce40:	54000120	b.eq	0xfffff7d7ce64  // b.none
   0x0000fffff7d7ce44:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7ce48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ce4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ce50:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ce54:	54000161	b.ne	0xfffff7d7ce80  // b.any
   0x0000fffff7d7ce58:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7ce5c:	9e620121	scvtf	d1, x9
   0x0000fffff7d7ce60:	14000002	b	0xfffff7d7ce68
   0x0000fffff7d7ce64:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7ce68:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7ce6c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7ce70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7ce74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ce78:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7ce7c:	17ffffde	b	0xfffff7d7cdf4
   0x0000fffff7d7ce80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7ce84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ce88:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ce8c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ce90:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7d7ce94:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ce98:	aa1603e5	mov	x5, x22
   0x0000fffff7d7ce9c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7cea0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7cea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7cea8:	d63f0200	blr	x16
   0x0000fffff7d7ceac:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7ceb0:	540082c0	b.eq	0xfffff7d7df08  // b.none
   0x0000fffff7d7ceb4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7ceb8:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7cebc:	540004a0	b.eq	0xfffff7d7cf50  // b.none
   0x0000fffff7d7cec0:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7cec4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7cec8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7cecc:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7ced0:	54000400	b.eq	0xfffff7d7cf50  // b.none
   0x0000fffff7d7ced4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7ced8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7cedc:	36d801d1	tbz	w17, #27, 0xfffff7d7cf14
   0x0000fffff7d7cee0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7cee4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7cee8:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7ceec:	54000321	b.ne	0xfffff7d7cf50  // b.any
   0x0000fffff7d7cef0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7cef4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7cef8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7cefc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7cf00:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7cf04:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7cf08:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7cf0c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7cf10:	54000209	b.ls	0xfffff7d7cf50  // b.plast
   0x0000fffff7d7cf14:	36d8008d	tbz	w13, #27, 0xfffff7d7cf24
   0x0000fffff7d7cf18:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7cf1c:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7cf20:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7cf24:	36d80091	tbz	w17, #27, 0xfffff7d7cf34
   0x0000fffff7d7cf28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7cf2c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7cf30:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7cf34:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7cf38:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7cf3c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7cf40:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7cf44:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7cf48:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7cf4c:	1400000e	b	0xfffff7d7cf84
   0x0000fffff7d7cf50:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7cf54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7cf58:	aa1303e1	mov	x1, x19
   0x0000fffff7d7cf5c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7cf60:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7d7cf64:	aa1403e4	mov	x4, x20
   0x0000fffff7d7cf68:	aa1603e5	mov	x5, x22
   0x0000fffff7d7cf6c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7cf70:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7cf74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7cf78:	d63f0200	blr	x16
   0x0000fffff7d7cf7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7cf80:	54007c80	b.eq	0xfffff7d7df10  // b.none
   0x0000fffff7d7cf84:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cf88:	37d806a9	tbnz	w9, #27, 0xfffff7d7d05c
   0x0000fffff7d7cf8c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cf90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cf94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cf98:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cf9c:	540001c1	b.ne	0xfffff7d7cfd4  // b.any
   0x0000fffff7d7cfa0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7cfa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cfa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cfac:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cfb0:	54000121	b.ne	0xfffff7d7cfd4  // b.any
   0x0000fffff7d7cfb4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7cfb8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7cfbc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7cfc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cfc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cfc8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7cfcc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7cfd0:	14000030	b	0xfffff7d7d090
   0x0000fffff7d7cfd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cfd8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7cfdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cfe0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cfe4:	54000120	b.eq	0xfffff7d7d008  // b.none
   0x0000fffff7d7cfe8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7cfec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7cff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7cff4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7cff8:	54000321	b.ne	0xfffff7d7d05c  // b.any
   0x0000fffff7d7cffc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d000:	9e620120	scvtf	d0, x9
   0x0000fffff7d7d004:	14000002	b	0xfffff7d7d00c
   0x0000fffff7d7d008:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7d00c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d010:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d014:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d018:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d01c:	54000120	b.eq	0xfffff7d7d040  // b.none
   0x0000fffff7d7d020:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d024:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d028:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d02c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d030:	54000161	b.ne	0xfffff7d7d05c  // b.any
   0x0000fffff7d7d034:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7d038:	9e620121	scvtf	d1, x9
   0x0000fffff7d7d03c:	14000002	b	0xfffff7d7d044
   0x0000fffff7d7d040:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7d044:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7d048:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7d04c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d050:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d054:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d058:	17ffffde	b	0xfffff7d7cfd0
   0x0000fffff7d7d05c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7d060:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d064:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d068:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d06c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7d7d070:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d074:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d078:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7d07c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7d080:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d084:	d63f0200	blr	x16
   0x0000fffff7d7d088:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d08c:	54007460	b.eq	0xfffff7d7df18  // b.none
   0x0000fffff7d7d090:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7d094:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7d098:	540004a0	b.eq	0xfffff7d7d12c  // b.none
   0x0000fffff7d7d09c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7d0a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7d0a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7d0a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7d0ac:	54000400	b.eq	0xfffff7d7d12c  // b.none
   0x0000fffff7d7d0b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7d0b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7d0b8:	36d801d1	tbz	w17, #27, 0xfffff7d7d0f0
   0x0000fffff7d7d0bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7d0c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7d0c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7d0c8:	54000321	b.ne	0xfffff7d7d12c  // b.any
   0x0000fffff7d7d0cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7d0d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d0d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7d0d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7d0dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7d0e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7d0e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7d0e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7d0ec:	54000209	b.ls	0xfffff7d7d12c  // b.plast
   0x0000fffff7d7d0f0:	36d8008d	tbz	w13, #27, 0xfffff7d7d100
   0x0000fffff7d7d0f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7d0f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7d0fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7d100:	36d80091	tbz	w17, #27, 0xfffff7d7d110
   0x0000fffff7d7d104:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d108:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7d10c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7d110:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7d114:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7d118:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7d11c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7d120:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7d124:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7d128:	1400000e	b	0xfffff7d7d160
   0x0000fffff7d7d12c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7d130:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d134:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d138:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d13c:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7d7d140:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d144:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d148:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7d14c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7d150:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d154:	d63f0200	blr	x16
   0x0000fffff7d7d158:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d15c:	54006e20	b.eq	0xfffff7d7df20  // b.none
   0x0000fffff7d7d160:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d164:	37d806a9	tbnz	w9, #27, 0xfffff7d7d238
   0x0000fffff7d7d168:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d16c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d170:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d174:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d178:	540001c1	b.ne	0xfffff7d7d1b0  // b.any
   0x0000fffff7d7d17c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d180:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d184:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d188:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d18c:	54000121	b.ne	0xfffff7d7d1b0  // b.any
   0x0000fffff7d7d190:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d194:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7d198:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7d19c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d1a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d1a4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7d1a8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d1ac:	14000030	b	0xfffff7d7d26c
   0x0000fffff7d7d1b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d1b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d1b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d1bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d1c0:	54000120	b.eq	0xfffff7d7d1e4  // b.none
   0x0000fffff7d7d1c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d1c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d1cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d1d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d1d4:	54000321	b.ne	0xfffff7d7d238  // b.any
   0x0000fffff7d7d1d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d1dc:	9e620120	scvtf	d0, x9
   0x0000fffff7d7d1e0:	14000002	b	0xfffff7d7d1e8
   0x0000fffff7d7d1e4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7d1e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d1ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d1f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d1f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d1f8:	54000120	b.eq	0xfffff7d7d21c  // b.none
   0x0000fffff7d7d1fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d200:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d204:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d208:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d20c:	54000161	b.ne	0xfffff7d7d238  // b.any
   0x0000fffff7d7d210:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7d214:	9e620121	scvtf	d1, x9
   0x0000fffff7d7d218:	14000002	b	0xfffff7d7d220
   0x0000fffff7d7d21c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7d220:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7d224:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7d228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d22c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d230:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d234:	17ffffde	b	0xfffff7d7d1ac
   0x0000fffff7d7d238:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7d23c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d240:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d244:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d248:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7d7d24c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d250:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d254:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7d258:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7d25c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d260:	d63f0200	blr	x16
   0x0000fffff7d7d264:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d268:	54006600	b.eq	0xfffff7d7df28  // b.none
   0x0000fffff7d7d26c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7d270:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7d274:	540004a0	b.eq	0xfffff7d7d308  // b.none
   0x0000fffff7d7d278:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7d27c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7d280:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7d284:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7d288:	54000400	b.eq	0xfffff7d7d308  // b.none
   0x0000fffff7d7d28c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7d290:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7d294:	36d801d1	tbz	w17, #27, 0xfffff7d7d2cc
   0x0000fffff7d7d298:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7d29c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7d2a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7d2a4:	54000321	b.ne	0xfffff7d7d308  // b.any
   0x0000fffff7d7d2a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7d2ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d2b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7d2b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7d2b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7d2bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7d2c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7d2c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7d2c8:	54000209	b.ls	0xfffff7d7d308  // b.plast
   0x0000fffff7d7d2cc:	36d8008d	tbz	w13, #27, 0xfffff7d7d2dc
   0x0000fffff7d7d2d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7d2d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7d2d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7d2dc:	36d80091	tbz	w17, #27, 0xfffff7d7d2ec
   0x0000fffff7d7d2e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d2e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7d2e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7d2ec:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7d2f0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7d2f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7d2f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7d2fc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7d300:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7d304:	1400000e	b	0xfffff7d7d33c
   0x0000fffff7d7d308:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7d30c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d310:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d314:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d318:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7d7d31c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d320:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d324:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7d328:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7d32c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d330:	d63f0200	blr	x16
   0x0000fffff7d7d334:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d338:	54005fc0	b.eq	0xfffff7d7df30  // b.none
   0x0000fffff7d7d33c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d340:	37d806a9	tbnz	w9, #27, 0xfffff7d7d414
   0x0000fffff7d7d344:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d348:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d34c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d350:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d354:	540001c1	b.ne	0xfffff7d7d38c  // b.any
   0x0000fffff7d7d358:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d35c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d364:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d368:	54000121	b.ne	0xfffff7d7d38c  // b.any
   0x0000fffff7d7d36c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d370:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7d374:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7d378:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d37c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d380:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7d384:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d388:	14000030	b	0xfffff7d7d448
   0x0000fffff7d7d38c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d390:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d398:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d39c:	54000120	b.eq	0xfffff7d7d3c0  // b.none
   0x0000fffff7d7d3a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d3a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d3a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d3ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d3b0:	54000321	b.ne	0xfffff7d7d414  // b.any
   0x0000fffff7d7d3b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d3b8:	9e620120	scvtf	d0, x9
   0x0000fffff7d7d3bc:	14000002	b	0xfffff7d7d3c4
   0x0000fffff7d7d3c0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7d3c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d3c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d3cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d3d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d3d4:	54000120	b.eq	0xfffff7d7d3f8  // b.none
   0x0000fffff7d7d3d8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d3dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d3e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d3e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d3e8:	54000161	b.ne	0xfffff7d7d414  // b.any
   0x0000fffff7d7d3ec:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7d3f0:	9e620121	scvtf	d1, x9
   0x0000fffff7d7d3f4:	14000002	b	0xfffff7d7d3fc
   0x0000fffff7d7d3f8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7d3fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7d400:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7d404:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d408:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d40c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d410:	17ffffde	b	0xfffff7d7d388
   0x0000fffff7d7d414:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7d418:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d41c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d420:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d424:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7d7d428:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d42c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d430:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7d434:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7d438:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d43c:	d63f0200	blr	x16
   0x0000fffff7d7d440:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d444:	540057a0	b.eq	0xfffff7d7df38  // b.none
   0x0000fffff7d7d448:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7d44c:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7d450:	540004a0	b.eq	0xfffff7d7d4e4  // b.none
   0x0000fffff7d7d454:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7d458:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7d45c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7d460:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7d464:	54000400	b.eq	0xfffff7d7d4e4  // b.none
   0x0000fffff7d7d468:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7d46c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7d470:	36d801d1	tbz	w17, #27, 0xfffff7d7d4a8
   0x0000fffff7d7d474:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7d478:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7d47c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7d480:	54000321	b.ne	0xfffff7d7d4e4  // b.any
   0x0000fffff7d7d484:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7d488:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d48c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7d490:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7d494:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7d498:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7d49c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7d4a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7d4a4:	54000209	b.ls	0xfffff7d7d4e4  // b.plast
   0x0000fffff7d7d4a8:	36d8008d	tbz	w13, #27, 0xfffff7d7d4b8
   0x0000fffff7d7d4ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7d4b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7d4b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7d4b8:	36d80091	tbz	w17, #27, 0xfffff7d7d4c8
   0x0000fffff7d7d4bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d4c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7d4c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7d4c8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7d4cc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7d4d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7d4d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7d4d8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7d4dc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7d4e0:	1400000e	b	0xfffff7d7d518
   0x0000fffff7d7d4e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7d4e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d4ec:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d4f0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d4f4:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7d7d4f8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d4fc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d500:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7d504:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7d508:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d50c:	d63f0200	blr	x16
   0x0000fffff7d7d510:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d514:	54005160	b.eq	0xfffff7d7df40  // b.none
   0x0000fffff7d7d518:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d51c:	37d806a9	tbnz	w9, #27, 0xfffff7d7d5f0
   0x0000fffff7d7d520:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d524:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d52c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d530:	540001c1	b.ne	0xfffff7d7d568  // b.any
   0x0000fffff7d7d534:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d53c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d540:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d544:	54000121	b.ne	0xfffff7d7d568  // b.any
   0x0000fffff7d7d548:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d54c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7d550:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7d554:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d55c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7d560:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d564:	14000030	b	0xfffff7d7d624
   0x0000fffff7d7d568:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d56c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d574:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d578:	54000120	b.eq	0xfffff7d7d59c  // b.none
   0x0000fffff7d7d57c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d580:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d584:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d588:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d58c:	54000321	b.ne	0xfffff7d7d5f0  // b.any
   0x0000fffff7d7d590:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d594:	9e620120	scvtf	d0, x9
   0x0000fffff7d7d598:	14000002	b	0xfffff7d7d5a0
   0x0000fffff7d7d59c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7d5a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d5a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d5a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d5ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d5b0:	54000120	b.eq	0xfffff7d7d5d4  // b.none
   0x0000fffff7d7d5b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d5b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d5bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d5c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d5c4:	54000161	b.ne	0xfffff7d7d5f0  // b.any
   0x0000fffff7d7d5c8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7d5cc:	9e620121	scvtf	d1, x9
   0x0000fffff7d7d5d0:	14000002	b	0xfffff7d7d5d8
   0x0000fffff7d7d5d4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7d5d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7d5dc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7d5e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d5e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d5e8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d5ec:	17ffffde	b	0xfffff7d7d564
   0x0000fffff7d7d5f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7d5f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d5f8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d5fc:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d600:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7d7d604:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d608:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d60c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7d610:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7d614:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d618:	d63f0200	blr	x16
   0x0000fffff7d7d61c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d620:	54004940	b.eq	0xfffff7d7df48  // b.none
   0x0000fffff7d7d624:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7d628:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7d62c:	540004a0	b.eq	0xfffff7d7d6c0  // b.none
   0x0000fffff7d7d630:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7d634:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7d638:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7d63c:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7d640:	54000400	b.eq	0xfffff7d7d6c0  // b.none
   0x0000fffff7d7d644:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7d648:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7d64c:	36d801d1	tbz	w17, #27, 0xfffff7d7d684
   0x0000fffff7d7d650:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7d654:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7d658:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7d65c:	54000321	b.ne	0xfffff7d7d6c0  // b.any
   0x0000fffff7d7d660:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7d664:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d668:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7d66c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7d670:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7d674:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7d678:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7d67c:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7d680:	54000209	b.ls	0xfffff7d7d6c0  // b.plast
   0x0000fffff7d7d684:	36d8008d	tbz	w13, #27, 0xfffff7d7d694
   0x0000fffff7d7d688:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7d68c:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7d690:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7d694:	36d80091	tbz	w17, #27, 0xfffff7d7d6a4
   0x0000fffff7d7d698:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d69c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7d6a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7d6a4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7d6a8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7d6ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7d6b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7d6b4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7d6b8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7d6bc:	1400000e	b	0xfffff7d7d6f4
   0x0000fffff7d7d6c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7d6c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d6c8:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d6cc:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d6d0:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7d7d6d4:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d6d8:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d6dc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7d6e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7d6e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d6e8:	d63f0200	blr	x16
   0x0000fffff7d7d6ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d6f0:	54004300	b.eq	0xfffff7d7df50  // b.none
   0x0000fffff7d7d6f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d6f8:	37d806a9	tbnz	w9, #27, 0xfffff7d7d7cc
   0x0000fffff7d7d6fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d700:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d704:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d708:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d70c:	540001c1	b.ne	0xfffff7d7d744  // b.any
   0x0000fffff7d7d710:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d714:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d71c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d720:	54000121	b.ne	0xfffff7d7d744  // b.any
   0x0000fffff7d7d724:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d728:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7d72c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7d730:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d738:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7d73c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d740:	14000030	b	0xfffff7d7d800
   0x0000fffff7d7d744:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d748:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d74c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d750:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d754:	54000120	b.eq	0xfffff7d7d778  // b.none
   0x0000fffff7d7d758:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d75c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d764:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d768:	54000321	b.ne	0xfffff7d7d7cc  // b.any
   0x0000fffff7d7d76c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d770:	9e620120	scvtf	d0, x9
   0x0000fffff7d7d774:	14000002	b	0xfffff7d7d77c
   0x0000fffff7d7d778:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7d77c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d780:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d784:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d788:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d78c:	54000120	b.eq	0xfffff7d7d7b0  // b.none
   0x0000fffff7d7d790:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d794:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d798:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d79c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d7a0:	54000161	b.ne	0xfffff7d7d7cc  // b.any
   0x0000fffff7d7d7a4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7d7a8:	9e620121	scvtf	d1, x9
   0x0000fffff7d7d7ac:	14000002	b	0xfffff7d7d7b4
   0x0000fffff7d7d7b0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7d7b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7d7b8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7d7bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d7c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d7c4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d7c8:	17ffffde	b	0xfffff7d7d740
   0x0000fffff7d7d7cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7d7d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d7d4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d7d8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d7dc:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7d7d7e0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d7e4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d7e8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7d7ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7d7f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d7f4:	d63f0200	blr	x16
   0x0000fffff7d7d7f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d7fc:	54003ae0	b.eq	0xfffff7d7df58  // b.none
   0x0000fffff7d7d800:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7d804:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7d808:	540004a0	b.eq	0xfffff7d7d89c  // b.none
   0x0000fffff7d7d80c:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7d810:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7d814:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7d818:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7d81c:	54000400	b.eq	0xfffff7d7d89c  // b.none
   0x0000fffff7d7d820:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7d824:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7d828:	36d801d1	tbz	w17, #27, 0xfffff7d7d860
   0x0000fffff7d7d82c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7d830:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7d834:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7d838:	54000321	b.ne	0xfffff7d7d89c  // b.any
   0x0000fffff7d7d83c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7d840:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d844:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7d848:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7d84c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7d850:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7d854:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7d858:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7d85c:	54000209	b.ls	0xfffff7d7d89c  // b.plast
   0x0000fffff7d7d860:	36d8008d	tbz	w13, #27, 0xfffff7d7d870
   0x0000fffff7d7d864:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7d868:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7d86c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7d870:	36d80091	tbz	w17, #27, 0xfffff7d7d880
   0x0000fffff7d7d874:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7d878:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7d87c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7d880:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7d884:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7d888:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7d88c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7d890:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7d894:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7d898:	1400000e	b	0xfffff7d7d8d0
   0x0000fffff7d7d89c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7d8a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d8a4:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d8a8:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d8ac:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7d7d8b0:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d8b4:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d8b8:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7d8bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7d8c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d8c4:	d63f0200	blr	x16
   0x0000fffff7d7d8c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d8cc:	540034a0	b.eq	0xfffff7d7df60  // b.none
   0x0000fffff7d7d8d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d8d4:	37d806a9	tbnz	w9, #27, 0xfffff7d7d9a8
   0x0000fffff7d7d8d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d8dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d8e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d8e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d8e8:	540001c1	b.ne	0xfffff7d7d920  // b.any
   0x0000fffff7d7d8ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d8f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d8f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d8f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d8fc:	54000121	b.ne	0xfffff7d7d920  // b.any
   0x0000fffff7d7d900:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d904:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7d908:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7d90c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d914:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7d918:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d91c:	14000030	b	0xfffff7d7d9dc
   0x0000fffff7d7d920:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d924:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d928:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d92c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d930:	54000120	b.eq	0xfffff7d7d954  // b.none
   0x0000fffff7d7d934:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7d938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d93c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d940:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d944:	54000321	b.ne	0xfffff7d7d9a8  // b.any
   0x0000fffff7d7d948:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7d94c:	9e620120	scvtf	d0, x9
   0x0000fffff7d7d950:	14000002	b	0xfffff7d7d958
   0x0000fffff7d7d954:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7d958:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d95c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d964:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d968:	54000120	b.eq	0xfffff7d7d98c  // b.none
   0x0000fffff7d7d96c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7d970:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7d974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d978:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7d97c:	54000161	b.ne	0xfffff7d7d9a8  // b.any
   0x0000fffff7d7d980:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7d984:	9e620121	scvtf	d1, x9
   0x0000fffff7d7d988:	14000002	b	0xfffff7d7d990
   0x0000fffff7d7d98c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7d990:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7d994:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7d998:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7d99c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7d9a0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7d9a4:	17ffffde	b	0xfffff7d7d91c
   0x0000fffff7d7d9a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7d9ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7d9b0:	aa1303e1	mov	x1, x19
   0x0000fffff7d7d9b4:	aa1503e2	mov	x2, x21
   0x0000fffff7d7d9b8:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7d7d9bc:	aa1403e4	mov	x4, x20
   0x0000fffff7d7d9c0:	aa1603e5	mov	x5, x22
   0x0000fffff7d7d9c4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7d9c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7d9cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7d9d0:	d63f0200	blr	x16
   0x0000fffff7d7d9d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7d9d8:	54002c80	b.eq	0xfffff7d7df68  // b.none
   0x0000fffff7d7d9dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7d9e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7d9e4:	540004a0	b.eq	0xfffff7d7da78  // b.none
   0x0000fffff7d7d9e8:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7d9ec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7d9f0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7d9f4:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7d9f8:	54000400	b.eq	0xfffff7d7da78  // b.none
   0x0000fffff7d7d9fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7da00:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7da04:	36d801d1	tbz	w17, #27, 0xfffff7d7da3c
   0x0000fffff7d7da08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7da0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7da10:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7da14:	54000321	b.ne	0xfffff7d7da78  // b.any
   0x0000fffff7d7da18:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7da1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7da20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7da24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7da28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7da2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7da30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7da34:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7da38:	54000209	b.ls	0xfffff7d7da78  // b.plast
   0x0000fffff7d7da3c:	36d8008d	tbz	w13, #27, 0xfffff7d7da4c
   0x0000fffff7d7da40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7da44:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7da48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7da4c:	36d80091	tbz	w17, #27, 0xfffff7d7da5c
   0x0000fffff7d7da50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7da54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7da58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7da5c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7da60:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7da64:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7da68:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7da6c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7da70:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7da74:	1400000e	b	0xfffff7d7daac
   0x0000fffff7d7da78:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7da7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7da80:	aa1303e1	mov	x1, x19
   0x0000fffff7d7da84:	aa1503e2	mov	x2, x21
   0x0000fffff7d7da88:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7d7da8c:	aa1403e4	mov	x4, x20
   0x0000fffff7d7da90:	aa1603e5	mov	x5, x22
   0x0000fffff7d7da94:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7da98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7da9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7daa0:	d63f0200	blr	x16
   0x0000fffff7d7daa4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7daa8:	54002640	b.eq	0xfffff7d7df70  // b.none
   0x0000fffff7d7daac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7dab0:	37d806a9	tbnz	w9, #27, 0xfffff7d7db84
   0x0000fffff7d7dab4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7dab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7dabc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7dac4:	540001c1	b.ne	0xfffff7d7dafc  // b.any
   0x0000fffff7d7dac8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7dacc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7dad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7dad8:	54000121	b.ne	0xfffff7d7dafc  // b.any
   0x0000fffff7d7dadc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7dae0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7dae4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7dae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7daec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7daf0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7daf4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7daf8:	14000030	b	0xfffff7d7dbb8
   0x0000fffff7d7dafc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7db00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7db04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7db08:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7db0c:	54000120	b.eq	0xfffff7d7db30  // b.none
   0x0000fffff7d7db10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7db14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7db18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7db1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7db20:	54000321	b.ne	0xfffff7d7db84  // b.any
   0x0000fffff7d7db24:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7db28:	9e620120	scvtf	d0, x9
   0x0000fffff7d7db2c:	14000002	b	0xfffff7d7db34
   0x0000fffff7d7db30:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7db34:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7db38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7db3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7db40:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7db44:	54000120	b.eq	0xfffff7d7db68  // b.none
   0x0000fffff7d7db48:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7db4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7db50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7db54:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7db58:	54000161	b.ne	0xfffff7d7db84  // b.any
   0x0000fffff7d7db5c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7db60:	9e620121	scvtf	d1, x9
   0x0000fffff7d7db64:	14000002	b	0xfffff7d7db6c
   0x0000fffff7d7db68:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7db6c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7db70:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7db74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7db78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7db7c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7db80:	17ffffde	b	0xfffff7d7daf8
   0x0000fffff7d7db84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7db88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7db8c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7db90:	aa1503e2	mov	x2, x21
   0x0000fffff7d7db94:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7d7db98:	aa1403e4	mov	x4, x20
   0x0000fffff7d7db9c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7dba0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7dba4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7dba8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7dbac:	d63f0200	blr	x16
   0x0000fffff7d7dbb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7dbb4:	54001e20	b.eq	0xfffff7d7df78  // b.none
   0x0000fffff7d7dbb8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7d7dbbc:	f100017f	cmp	x11, #0x0
   0x0000fffff7d7dbc0:	540004a0	b.eq	0xfffff7d7dc54  // b.none
   0x0000fffff7d7dbc4:	b940016d	ldr	w13, [x11]
   0x0000fffff7d7dbc8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7d7dbcc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7d7dbd0:	eb0901bf	cmp	x13, x9
   0x0000fffff7d7dbd4:	54000400	b.eq	0xfffff7d7dc54  // b.none
   0x0000fffff7d7dbd8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7d7dbdc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7d7dbe0:	36d801d1	tbz	w17, #27, 0xfffff7d7dc18
   0x0000fffff7d7dbe4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7d7dbe8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7d7dbec:	f100013f	cmp	x9, #0x0
   0x0000fffff7d7dbf0:	54000321	b.ne	0xfffff7d7dc54  // b.any
   0x0000fffff7d7dbf4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7d7dbf8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7dbfc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7d7dc00:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7d7dc04:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7d7dc08:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7d7dc0c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7d7dc10:	f100055f	cmp	x10, #0x1
   0x0000fffff7d7dc14:	54000209	b.ls	0xfffff7d7dc54  // b.plast
   0x0000fffff7d7dc18:	36d8008d	tbz	w13, #27, 0xfffff7d7dc28
   0x0000fffff7d7dc1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7d7dc20:	91000529	add	x9, x9, #0x1
   0x0000fffff7d7dc24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7d7dc28:	36d80091	tbz	w17, #27, 0xfffff7d7dc38
   0x0000fffff7d7dc2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7d7dc30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7d7dc34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7d7dc38:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7d7dc3c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7d7dc40:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7d7dc44:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7d7dc48:	f900366c	str	x12, [x19, #104]
   0x0000fffff7d7dc4c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7d7dc50:	1400000e	b	0xfffff7d7dc88
   0x0000fffff7d7dc54:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7d7dc58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7dc5c:	aa1303e1	mov	x1, x19
   0x0000fffff7d7dc60:	aa1503e2	mov	x2, x21
   0x0000fffff7d7dc64:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7d7dc68:	aa1403e4	mov	x4, x20
   0x0000fffff7d7dc6c:	aa1603e5	mov	x5, x22
   0x0000fffff7d7dc70:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7d7dc74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7dc78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7dc7c:	d63f0200	blr	x16
   0x0000fffff7d7dc80:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7dc84:	540017e0	b.eq	0xfffff7d7df80  // b.none
   0x0000fffff7d7dc88:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7dc8c:	37d806a9	tbnz	w9, #27, 0xfffff7d7dd60
   0x0000fffff7d7dc90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7dc94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7dc98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dc9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7dca0:	540001c1	b.ne	0xfffff7d7dcd8  // b.any
   0x0000fffff7d7dca4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7dca8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7dcac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dcb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7dcb4:	54000121	b.ne	0xfffff7d7dcd8  // b.any
   0x0000fffff7d7dcb8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7dcbc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7d7dcc0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d7dcc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7dcc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dccc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7d7dcd0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7dcd4:	14000030	b	0xfffff7d7dd94
   0x0000fffff7d7dcd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7dcdc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7dce0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dce4:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7dce8:	54000120	b.eq	0xfffff7d7dd0c  // b.none
   0x0000fffff7d7dcec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d7dcf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7dcf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dcf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7dcfc:	54000321	b.ne	0xfffff7d7dd60  // b.any
   0x0000fffff7d7dd00:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7d7dd04:	9e620120	scvtf	d0, x9
   0x0000fffff7d7dd08:	14000002	b	0xfffff7d7dd10
   0x0000fffff7d7dd0c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7d7dd10:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7dd14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7dd18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dd1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7dd20:	54000120	b.eq	0xfffff7d7dd44  // b.none
   0x0000fffff7d7dd24:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7dd28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7dd2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dd30:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7dd34:	54000161	b.ne	0xfffff7d7dd60  // b.any
   0x0000fffff7d7dd38:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d7dd3c:	9e620121	scvtf	d1, x9
   0x0000fffff7d7dd40:	14000002	b	0xfffff7d7dd48
   0x0000fffff7d7dd44:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7d7dd48:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d7dd4c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7d7dd50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7d7dd54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dd58:	b900426a	str	w10, [x19, #64]
   0x0000fffff7d7dd5c:	17ffffde	b	0xfffff7d7dcd4
   0x0000fffff7d7dd60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7dd64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7dd68:	aa1303e1	mov	x1, x19
   0x0000fffff7d7dd6c:	aa1503e2	mov	x2, x21
   0x0000fffff7d7dd70:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7d7dd74:	aa1403e4	mov	x4, x20
   0x0000fffff7d7dd78:	aa1603e5	mov	x5, x22
   0x0000fffff7d7dd7c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7d7dd80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7dd84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7dd88:	d63f0200	blr	x16
   0x0000fffff7d7dd8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7dd90:	54000fc0	b.eq	0xfffff7d7df88  // b.none
   0x0000fffff7d7dd94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d7dd98:	37d80269	tbnz	w9, #27, 0xfffff7d7dde4
   0x0000fffff7d7dd9c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d7dda0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7dda4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7dda8:	eb0a013f	cmp	x9, x10
   0x0000fffff7d7ddac:	540001c1	b.ne	0xfffff7d7dde4  // b.any
   0x0000fffff7d7ddb0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7d7ddb4:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7d7ddb8:	8b0a012b	add	x11, x9, x10
   0x0000fffff7d7ddbc:	f9003669	str	x9, [x19, #104]
   0x0000fffff7d7ddc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ddc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ddc8:	b900626a	str	w10, [x19, #96]
   0x0000fffff7d7ddcc:	aa0b03e9	mov	x9, x11
   0x0000fffff7d7ddd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7ddd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7ddd8:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7d7dddc:	b900526a	str	w10, [x19, #80]
   0x0000fffff7d7dde0:	1400000e	b	0xfffff7d7de18
   0x0000fffff7d7dde4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7dde8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7ddec:	aa1303e1	mov	x1, x19
   0x0000fffff7d7ddf0:	aa1503e2	mov	x2, x21
   0x0000fffff7d7ddf4:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7d7ddf8:	aa1403e4	mov	x4, x20
   0x0000fffff7d7ddfc:	aa1603e5	mov	x5, x22
   0x0000fffff7d7de00:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7d7de04:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7d7de08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7de0c:	d63f0200	blr	x16
   0x0000fffff7d7de10:	f100001f	cmp	x0, #0x0
   0x0000fffff7d7de14:	54000be0	b.eq	0xfffff7d7df90  // b.none
   0x0000fffff7d7de18:	17fff8f7	b	0xfffff7d7c1f4
   0x0000fffff7d7de1c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7d7de20:	f94003e0	ldr	x0, [sp]
   0x0000fffff7d7de24:	aa1303e1	mov	x1, x19
   0x0000fffff7d7de28:	aa1503e2	mov	x2, x21
   0x0000fffff7d7de2c:	d2800843	mov	x3, #0x42                  	// #66
   0x0000fffff7d7de30:	aa1403e4	mov	x4, x20
   0x0000fffff7d7de34:	aa1603e5	mov	x5, x22
   0x0000fffff7d7de38:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7d7de3c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d7de40:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d7de44:	d63f0200	blr	x16
   0x0000fffff7d7de48:	910143ff	add	sp, sp, #0x50
   0x0000fffff7d7de4c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7de50:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7de54:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7de58:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d7de5c:	d65f03c0	ret
   0x0000fffff7d7de60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d7de64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d7de68:	b900028a	str	w10, [x20]
   0x0000fffff7d7de6c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7d7de70:	910143ff	add	sp, sp, #0x50
   0x0000fffff7d7de74:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d7de78:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d7de7c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d7de80:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7d7de84:	d65f03c0	ret
   0x0000fffff7d7de88:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7d7de8c:	17fffff5	b	0xfffff7d7de60
   0x0000fffff7d7de90:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7d7de94:	17fffff3	b	0xfffff7d7de60
   0x0000fffff7d7de98:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7d7de9c:	17fffff1	b	0xfffff7d7de60
   0x0000fffff7d7dea0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7d7dea4:	17ffffef	b	0xfffff7d7de60
   0x0000fffff7d7dea8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7d7deac:	17ffffed	b	0xfffff7d7de60
   0x0000fffff7d7deb0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7d7deb4:	17ffffeb	b	0xfffff7d7de60
   0x0000fffff7d7deb8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7d7debc:	17ffffe9	b	0xfffff7d7de60
   0x0000fffff7d7dec0:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7d7dec4:	17ffffe7	b	0xfffff7d7de60
   0x0000fffff7d7dec8:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7d7decc:	17ffffe5	b	0xfffff7d7de60
   0x0000fffff7d7ded0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7d7ded4:	17ffffe3	b	0xfffff7d7de60
   0x0000fffff7d7ded8:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7d7dedc:	17ffffe1	b	0xfffff7d7de60
   0x0000fffff7d7dee0:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7d7dee4:	17ffffdf	b	0xfffff7d7de60
   0x0000fffff7d7dee8:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7d7deec:	17ffffdd	b	0xfffff7d7de60
   0x0000fffff7d7def0:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7d7def4:	17ffffdb	b	0xfffff7d7de60
   0x0000fffff7d7def8:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7d7defc:	17ffffd9	b	0xfffff7d7de60
   0x0000fffff7d7df00:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7d7df04:	17ffffd7	b	0xfffff7d7de60
   0x0000fffff7d7df08:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7d7df0c:	17ffffd5	b	0xfffff7d7de60
   0x0000fffff7d7df10:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7d7df14:	17ffffd3	b	0xfffff7d7de60
   0x0000fffff7d7df18:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7d7df1c:	17ffffd1	b	0xfffff7d7de60
   0x0000fffff7d7df20:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7d7df24:	17ffffcf	b	0xfffff7d7de60
   0x0000fffff7d7df28:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7d7df2c:	17ffffcd	b	0xfffff7d7de60
   0x0000fffff7d7df30:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7d7df34:	17ffffcb	b	0xfffff7d7de60
   0x0000fffff7d7df38:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7d7df3c:	17ffffc9	b	0xfffff7d7de60
   0x0000fffff7d7df40:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7d7df44:	17ffffc7	b	0xfffff7d7de60
   0x0000fffff7d7df48:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7d7df4c:	17ffffc5	b	0xfffff7d7de60
   0x0000fffff7d7df50:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7d7df54:	17ffffc3	b	0xfffff7d7de60
   0x0000fffff7d7df58:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7d7df5c:	17ffffc1	b	0xfffff7d7de60
   0x0000fffff7d7df60:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7d7df64:	17ffffbf	b	0xfffff7d7de60
   0x0000fffff7d7df68:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7d7df6c:	17ffffbd	b	0xfffff7d7de60
   0x0000fffff7d7df70:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7d7df74:	17ffffbb	b	0xfffff7d7de60
   0x0000fffff7d7df78:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7d7df7c:	17ffffb9	b	0xfffff7d7de60
   0x0000fffff7d7df80:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7d7df84:	17ffffb7	b	0xfffff7d7de60
   0x0000fffff7d7df88:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7d7df8c:	17ffffb5	b	0xfffff7d7de60
   0x0000fffff7d7df90:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7d7df94:	17ffffb3	b	0xfffff7d7de60
   0x0000fffff7d7df98:	00000000	udf	#0
   0x0000fffff7d7df9c:	00000000	udf	#0
   0x0000fffff7d7dfa0:	00000000	udf	#0
   0x0000fffff7d7dfa4:	00000000	udf	#0
   0x0000fffff7d7dfa8:	00000000	udf	#0
   0x0000fffff7d7dfac:	00000000	udf	#0
   0x0000fffff7d7dfb0:	00000000	udf	#0
   0x0000fffff7d7dfb4:	00000000	udf	#0
   0x0000fffff7d7dfb8:	00000000	udf	#0
   0x0000fffff7d7dfbc:	00000000	udf	#0
   0x0000fffff7d7dfc0:	00000000	udf	#0
   0x0000fffff7d7dfc4:	00000000	udf	#0
   0x0000fffff7d7dfc8:	00000000	udf	#0
   0x0000fffff7d7dfcc:	00000000	udf	#0
   0x0000fffff7d7dfd0:	00000000	udf	#0
   0x0000fffff7d7dfd4:	00000000	udf	#0
   0x0000fffff7d7dfd8:	00000000	udf	#0
   0x0000fffff7d7dfdc:	00000000	udf	#0
   0x0000fffff7d7dfe0:	00000000	udf	#0
   0x0000fffff7d7dfe4:	00000000	udf	#0
   0x0000fffff7d7dfe8:	00000000	udf	#0
   0x0000fffff7d7dfec:	00000000	udf	#0
   0x0000fffff7d7dff0:	00000000	udf	#0
   0x0000fffff7d7dff4:	00000000	udf	#0
   0x0000fffff7d7dff8:	00000000	udf	#0
   0x0000fffff7d7dffc:	00000000	udf	#0
End of assembler dump.
