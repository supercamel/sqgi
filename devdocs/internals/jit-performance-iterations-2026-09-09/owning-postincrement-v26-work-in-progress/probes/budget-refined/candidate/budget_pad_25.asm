Dump of assembler code from 0xfffff7f8c000 to 0xfffff7f8e000:
   0x0000fffff7f8c000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f8c004:	910003fd	mov	x29, sp
   0x0000fffff7f8c008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8c00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f8c010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f8c014:	aa0003f3	mov	x19, x0
   0x0000fffff7f8c018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8c01c:	aa0203f5	mov	x21, x2
   0x0000fffff7f8c020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f8c024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f8c028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8c02c:	f90003e9	str	x9, [sp]
   0x0000fffff7f8c030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f8c034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f8c038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8c03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f8c040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c044:	d63f0200	blr	x16
   0x0000fffff7f8c048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8c04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f8c050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f8c054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f8c058:	14000001	b	0xfffff7f8c05c
   0x0000fffff7f8c05c:	14000001	b	0xfffff7f8c060
   0x0000fffff7f8c060:	14000001	b	0xfffff7f8c064
   0x0000fffff7f8c064:	14000001	b	0xfffff7f8c068
   0x0000fffff7f8c068:	14000001	b	0xfffff7f8c06c
   0x0000fffff7f8c06c:	14000001	b	0xfffff7f8c070
   0x0000fffff7f8c070:	14000001	b	0xfffff7f8c074
   0x0000fffff7f8c074:	14000001	b	0xfffff7f8c078
   0x0000fffff7f8c078:	14000001	b	0xfffff7f8c07c
   0x0000fffff7f8c07c:	14000001	b	0xfffff7f8c080
   0x0000fffff7f8c080:	14000001	b	0xfffff7f8c084
   0x0000fffff7f8c084:	14000001	b	0xfffff7f8c088
   0x0000fffff7f8c088:	14000001	b	0xfffff7f8c08c
   0x0000fffff7f8c08c:	14000001	b	0xfffff7f8c090
   0x0000fffff7f8c090:	14000001	b	0xfffff7f8c094
   0x0000fffff7f8c094:	14000001	b	0xfffff7f8c098
   0x0000fffff7f8c098:	14000001	b	0xfffff7f8c09c
   0x0000fffff7f8c09c:	14000001	b	0xfffff7f8c0a0
   0x0000fffff7f8c0a0:	14000001	b	0xfffff7f8c0a4
   0x0000fffff7f8c0a4:	14000001	b	0xfffff7f8c0a8
   0x0000fffff7f8c0a8:	14000001	b	0xfffff7f8c0ac
   0x0000fffff7f8c0ac:	14000001	b	0xfffff7f8c0b0
   0x0000fffff7f8c0b0:	14000001	b	0xfffff7f8c0b4
   0x0000fffff7f8c0b4:	14000001	b	0xfffff7f8c0b8
   0x0000fffff7f8c0b8:	14000001	b	0xfffff7f8c0bc
   0x0000fffff7f8c0bc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8c0c0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8c0c4:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f8c0c8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f8c0cc:	36d80211	tbz	w17, #27, 0xfffff7f8c10c
   0x0000fffff7f8c0d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8c0d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8c0d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8c0dc:	540001e1	b.ne	0xfffff7f8c118  // b.any
   0x0000fffff7f8c0e0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f8c0e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c0e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8c0ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8c0f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8c0f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8c0f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8c0fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8c100:	540000c9	b.ls	0xfffff7f8c118  // b.plast
   0x0000fffff7f8c104:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8c108:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8c10c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f8c110:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f8c114:	1400000e	b	0xfffff7f8c14c
   0x0000fffff7f8c118:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8c11c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c120:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c124:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c128:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f8c12c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c130:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c134:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f8c138:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8c13c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c140:	d63f0200	blr	x16
   0x0000fffff7f8c144:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c148:	5400eac0	b.eq	0xfffff7f8dea0  // b.none
   0x0000fffff7f8c14c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8c150:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8c154:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f8c158:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f8c15c:	36d80211	tbz	w17, #27, 0xfffff7f8c19c
   0x0000fffff7f8c160:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8c164:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8c168:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8c16c:	540001e1	b.ne	0xfffff7f8c1a8  // b.any
   0x0000fffff7f8c170:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f8c174:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c178:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8c17c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8c180:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8c184:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8c188:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8c18c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8c190:	540000c9	b.ls	0xfffff7f8c1a8  // b.plast
   0x0000fffff7f8c194:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8c198:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8c19c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f8c1a0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f8c1a4:	1400000e	b	0xfffff7f8c1dc
   0x0000fffff7f8c1a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8c1ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c1b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c1b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c1b8:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f8c1bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c1c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c1c4:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f8c1c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8c1cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c1d0:	d63f0200	blr	x16
   0x0000fffff7f8c1d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c1d8:	5400e680	b.eq	0xfffff7f8dea8  // b.none
   0x0000fffff7f8c1dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8c1e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c1e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c1e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c1ec:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f8c1f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c1f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c1f8:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7f8c1fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8c200:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c204:	d63f0200	blr	x16
   0x0000fffff7f8c208:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c20c:	5400e520	b.eq	0xfffff7f8deb0  // b.none
   0x0000fffff7f8c210:	f100041f	cmp	x0, #0x1
   0x0000fffff7f8c214:	5400e100	b.eq	0xfffff7f8de34  // b.none
   0x0000fffff7f8c218:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8c21c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f8c220:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f8c224:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f8c228:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8c22c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f8c230:	36d801d1	tbz	w17, #27, 0xfffff7f8c268
   0x0000fffff7f8c234:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8c238:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8c23c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8c240:	54000281	b.ne	0xfffff7f8c290  // b.any
   0x0000fffff7f8c244:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8c248:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c24c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8c250:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8c254:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8c258:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8c25c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8c260:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8c264:	54000169	b.ls	0xfffff7f8c290  // b.plast
   0x0000fffff7f8c268:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8c26c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8c270:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8c274:	36d80091	tbz	w17, #27, 0xfffff7f8c284
   0x0000fffff7f8c278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c27c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8c280:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8c284:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8c288:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8c28c:	1400000e	b	0xfffff7f8c2c4
   0x0000fffff7f8c290:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8c294:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c298:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c29c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c2a0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f8c2a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c2a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c2ac:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f8c2b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8c2b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c2b8:	d63f0200	blr	x16
   0x0000fffff7f8c2bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c2c0:	5400dfc0	b.eq	0xfffff7f8deb8  // b.none
   0x0000fffff7f8c2c4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f8c2c8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8c2cc:	540003a0	b.eq	0xfffff7f8c340  // b.none
   0x0000fffff7f8c2d0:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f8c2d4:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f8c2d8:	b9400171	ldr	w17, [x11]
   0x0000fffff7f8c2dc:	36d801d1	tbz	w17, #27, 0xfffff7f8c314
   0x0000fffff7f8c2e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8c2e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8c2e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8c2ec:	540002a1	b.ne	0xfffff7f8c340  // b.any
   0x0000fffff7f8c2f0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f8c2f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c2f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8c2fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8c300:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8c304:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8c308:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8c30c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8c310:	54000189	b.ls	0xfffff7f8c340  // b.plast
   0x0000fffff7f8c314:	36d8008d	tbz	w13, #27, 0xfffff7f8c324
   0x0000fffff7f8c318:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8c31c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8c320:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8c324:	36d80091	tbz	w17, #27, 0xfffff7f8c334
   0x0000fffff7f8c328:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c32c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8c330:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8c334:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f8c338:	b900016d	str	w13, [x11]
   0x0000fffff7f8c33c:	1400000e	b	0xfffff7f8c374
   0x0000fffff7f8c340:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8c344:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c348:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c34c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c350:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f8c354:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c358:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c35c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f8c360:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8c364:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c368:	d63f0200	blr	x16
   0x0000fffff7f8c36c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c370:	5400da80	b.eq	0xfffff7f8dec0  // b.none
   0x0000fffff7f8c374:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8c378:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8c37c:	540004a0	b.eq	0xfffff7f8c410  // b.none
   0x0000fffff7f8c380:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8c384:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8c388:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8c38c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8c390:	54000400	b.eq	0xfffff7f8c410  // b.none
   0x0000fffff7f8c394:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8c398:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8c39c:	36d801d1	tbz	w17, #27, 0xfffff7f8c3d4
   0x0000fffff7f8c3a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8c3a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8c3a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8c3ac:	54000321	b.ne	0xfffff7f8c410  // b.any
   0x0000fffff7f8c3b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8c3b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c3b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8c3bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8c3c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8c3c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8c3c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8c3cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8c3d0:	54000209	b.ls	0xfffff7f8c410  // b.plast
   0x0000fffff7f8c3d4:	36d8008d	tbz	w13, #27, 0xfffff7f8c3e4
   0x0000fffff7f8c3d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8c3dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8c3e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8c3e4:	36d80091	tbz	w17, #27, 0xfffff7f8c3f4
   0x0000fffff7f8c3e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c3ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8c3f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8c3f4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8c3f8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8c3fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8c400:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8c404:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8c408:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8c40c:	1400000e	b	0xfffff7f8c444
   0x0000fffff7f8c410:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8c414:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c418:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c41c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c420:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f8c424:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c428:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c42c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8c430:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8c434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c438:	d63f0200	blr	x16
   0x0000fffff7f8c43c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c440:	5400d440	b.eq	0xfffff7f8dec8  // b.none
   0x0000fffff7f8c444:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c448:	37d806a9	tbnz	w9, #27, 0xfffff7f8c51c
   0x0000fffff7f8c44c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c450:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c454:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c458:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c45c:	540001c1	b.ne	0xfffff7f8c494  // b.any
   0x0000fffff7f8c460:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c464:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c468:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c46c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c470:	54000121	b.ne	0xfffff7f8c494  // b.any
   0x0000fffff7f8c474:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8c478:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8c47c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8c480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c488:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8c48c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8c490:	14000030	b	0xfffff7f8c550
   0x0000fffff7f8c494:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c498:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8c49c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c4a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c4a4:	54000120	b.eq	0xfffff7f8c4c8  // b.none
   0x0000fffff7f8c4a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c4ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c4b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c4b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c4b8:	54000321	b.ne	0xfffff7f8c51c  // b.any
   0x0000fffff7f8c4bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8c4c0:	9e620120	scvtf	d0, x9
   0x0000fffff7f8c4c4:	14000002	b	0xfffff7f8c4cc
   0x0000fffff7f8c4c8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8c4cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c4d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8c4d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c4d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c4dc:	54000120	b.eq	0xfffff7f8c500  // b.none
   0x0000fffff7f8c4e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c4e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c4e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c4ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c4f0:	54000161	b.ne	0xfffff7f8c51c  // b.any
   0x0000fffff7f8c4f4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8c4f8:	9e620121	scvtf	d1, x9
   0x0000fffff7f8c4fc:	14000002	b	0xfffff7f8c504
   0x0000fffff7f8c500:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8c504:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8c508:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8c50c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8c510:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c514:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8c518:	17ffffde	b	0xfffff7f8c490
   0x0000fffff7f8c51c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8c520:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c524:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c528:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c52c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f8c530:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c534:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c538:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8c53c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8c540:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c544:	d63f0200	blr	x16
   0x0000fffff7f8c548:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c54c:	5400cc20	b.eq	0xfffff7f8ded0  // b.none
   0x0000fffff7f8c550:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8c554:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8c558:	540004a0	b.eq	0xfffff7f8c5ec  // b.none
   0x0000fffff7f8c55c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8c560:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8c564:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8c568:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8c56c:	54000400	b.eq	0xfffff7f8c5ec  // b.none
   0x0000fffff7f8c570:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8c574:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8c578:	36d801d1	tbz	w17, #27, 0xfffff7f8c5b0
   0x0000fffff7f8c57c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8c580:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8c584:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8c588:	54000321	b.ne	0xfffff7f8c5ec  // b.any
   0x0000fffff7f8c58c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8c590:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c594:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8c598:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8c59c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8c5a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8c5a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8c5a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8c5ac:	54000209	b.ls	0xfffff7f8c5ec  // b.plast
   0x0000fffff7f8c5b0:	36d8008d	tbz	w13, #27, 0xfffff7f8c5c0
   0x0000fffff7f8c5b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8c5b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8c5bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8c5c0:	36d80091	tbz	w17, #27, 0xfffff7f8c5d0
   0x0000fffff7f8c5c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c5c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8c5cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8c5d0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8c5d4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8c5d8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8c5dc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8c5e0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8c5e4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8c5e8:	1400000e	b	0xfffff7f8c620
   0x0000fffff7f8c5ec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8c5f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c5f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c5f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c5fc:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f8c600:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c604:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c608:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8c60c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8c610:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c614:	d63f0200	blr	x16
   0x0000fffff7f8c618:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c61c:	5400c5e0	b.eq	0xfffff7f8ded8  // b.none
   0x0000fffff7f8c620:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c624:	37d806a9	tbnz	w9, #27, 0xfffff7f8c6f8
   0x0000fffff7f8c628:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c62c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c634:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c638:	540001c1	b.ne	0xfffff7f8c670  // b.any
   0x0000fffff7f8c63c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c640:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c648:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c64c:	54000121	b.ne	0xfffff7f8c670  // b.any
   0x0000fffff7f8c650:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8c654:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8c658:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8c65c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c664:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8c668:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8c66c:	14000030	b	0xfffff7f8c72c
   0x0000fffff7f8c670:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c674:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8c678:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c67c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c680:	54000120	b.eq	0xfffff7f8c6a4  // b.none
   0x0000fffff7f8c684:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c688:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c68c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c690:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c694:	54000321	b.ne	0xfffff7f8c6f8  // b.any
   0x0000fffff7f8c698:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8c69c:	9e620120	scvtf	d0, x9
   0x0000fffff7f8c6a0:	14000002	b	0xfffff7f8c6a8
   0x0000fffff7f8c6a4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8c6a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c6ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8c6b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c6b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c6b8:	54000120	b.eq	0xfffff7f8c6dc  // b.none
   0x0000fffff7f8c6bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c6c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c6c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c6c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c6cc:	54000161	b.ne	0xfffff7f8c6f8  // b.any
   0x0000fffff7f8c6d0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8c6d4:	9e620121	scvtf	d1, x9
   0x0000fffff7f8c6d8:	14000002	b	0xfffff7f8c6e0
   0x0000fffff7f8c6dc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8c6e0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8c6e4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8c6e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8c6ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c6f0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8c6f4:	17ffffde	b	0xfffff7f8c66c
   0x0000fffff7f8c6f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8c6fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c700:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c704:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c708:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f8c70c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c710:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c714:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8c718:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8c71c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c720:	d63f0200	blr	x16
   0x0000fffff7f8c724:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c728:	5400bdc0	b.eq	0xfffff7f8dee0  // b.none
   0x0000fffff7f8c72c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8c730:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8c734:	540004a0	b.eq	0xfffff7f8c7c8  // b.none
   0x0000fffff7f8c738:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8c73c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8c740:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8c744:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8c748:	54000400	b.eq	0xfffff7f8c7c8  // b.none
   0x0000fffff7f8c74c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8c750:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8c754:	36d801d1	tbz	w17, #27, 0xfffff7f8c78c
   0x0000fffff7f8c758:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8c75c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8c760:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8c764:	54000321	b.ne	0xfffff7f8c7c8  // b.any
   0x0000fffff7f8c768:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8c76c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c770:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8c774:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8c778:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8c77c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8c780:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8c784:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8c788:	54000209	b.ls	0xfffff7f8c7c8  // b.plast
   0x0000fffff7f8c78c:	36d8008d	tbz	w13, #27, 0xfffff7f8c79c
   0x0000fffff7f8c790:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8c794:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8c798:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8c79c:	36d80091	tbz	w17, #27, 0xfffff7f8c7ac
   0x0000fffff7f8c7a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c7a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8c7a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8c7ac:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8c7b0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8c7b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8c7b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8c7bc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8c7c0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8c7c4:	1400000e	b	0xfffff7f8c7fc
   0x0000fffff7f8c7c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8c7cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c7d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c7d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c7d8:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f8c7dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c7e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c7e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8c7e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8c7ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c7f0:	d63f0200	blr	x16
   0x0000fffff7f8c7f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c7f8:	5400b780	b.eq	0xfffff7f8dee8  // b.none
   0x0000fffff7f8c7fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c800:	37d806a9	tbnz	w9, #27, 0xfffff7f8c8d4
   0x0000fffff7f8c804:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c808:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c80c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c810:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c814:	540001c1	b.ne	0xfffff7f8c84c  // b.any
   0x0000fffff7f8c818:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c81c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c820:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c824:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c828:	54000121	b.ne	0xfffff7f8c84c  // b.any
   0x0000fffff7f8c82c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8c830:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8c834:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8c838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c83c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c840:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8c844:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8c848:	14000030	b	0xfffff7f8c908
   0x0000fffff7f8c84c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c850:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8c854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c858:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c85c:	54000120	b.eq	0xfffff7f8c880  // b.none
   0x0000fffff7f8c860:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c86c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c870:	54000321	b.ne	0xfffff7f8c8d4  // b.any
   0x0000fffff7f8c874:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8c878:	9e620120	scvtf	d0, x9
   0x0000fffff7f8c87c:	14000002	b	0xfffff7f8c884
   0x0000fffff7f8c880:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8c884:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c888:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8c88c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c890:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c894:	54000120	b.eq	0xfffff7f8c8b8  // b.none
   0x0000fffff7f8c898:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c89c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c8a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c8a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c8a8:	54000161	b.ne	0xfffff7f8c8d4  // b.any
   0x0000fffff7f8c8ac:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8c8b0:	9e620121	scvtf	d1, x9
   0x0000fffff7f8c8b4:	14000002	b	0xfffff7f8c8bc
   0x0000fffff7f8c8b8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8c8bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8c8c0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8c8c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8c8c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c8cc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8c8d0:	17ffffde	b	0xfffff7f8c848
   0x0000fffff7f8c8d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8c8d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c8dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c8e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c8e4:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f8c8e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c8ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c8f0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8c8f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8c8f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c8fc:	d63f0200	blr	x16
   0x0000fffff7f8c900:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c904:	5400af60	b.eq	0xfffff7f8def0  // b.none
   0x0000fffff7f8c908:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8c90c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8c910:	540004a0	b.eq	0xfffff7f8c9a4  // b.none
   0x0000fffff7f8c914:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8c918:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8c91c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8c920:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8c924:	54000400	b.eq	0xfffff7f8c9a4  // b.none
   0x0000fffff7f8c928:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8c92c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8c930:	36d801d1	tbz	w17, #27, 0xfffff7f8c968
   0x0000fffff7f8c934:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8c938:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8c93c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8c940:	54000321	b.ne	0xfffff7f8c9a4  // b.any
   0x0000fffff7f8c944:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8c948:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c94c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8c950:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8c954:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8c958:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8c95c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8c960:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8c964:	54000209	b.ls	0xfffff7f8c9a4  // b.plast
   0x0000fffff7f8c968:	36d8008d	tbz	w13, #27, 0xfffff7f8c978
   0x0000fffff7f8c96c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8c970:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8c974:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8c978:	36d80091	tbz	w17, #27, 0xfffff7f8c988
   0x0000fffff7f8c97c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8c980:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8c984:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8c988:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8c98c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8c990:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8c994:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8c998:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8c99c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8c9a0:	1400000e	b	0xfffff7f8c9d8
   0x0000fffff7f8c9a4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8c9a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8c9ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f8c9b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8c9b4:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f8c9b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8c9bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f8c9c0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8c9c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8c9c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8c9cc:	d63f0200	blr	x16
   0x0000fffff7f8c9d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8c9d4:	5400a920	b.eq	0xfffff7f8def8  // b.none
   0x0000fffff7f8c9d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c9dc:	37d806a9	tbnz	w9, #27, 0xfffff7f8cab0
   0x0000fffff7f8c9e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8c9e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c9e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8c9ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8c9f0:	540001c1	b.ne	0xfffff7f8ca28  // b.any
   0x0000fffff7f8c9f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8c9f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8c9fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ca00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ca04:	54000121	b.ne	0xfffff7f8ca28  // b.any
   0x0000fffff7f8ca08:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ca0c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8ca10:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8ca14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ca18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ca1c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8ca20:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ca24:	14000030	b	0xfffff7f8cae4
   0x0000fffff7f8ca28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ca2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ca30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ca34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ca38:	54000120	b.eq	0xfffff7f8ca5c  // b.none
   0x0000fffff7f8ca3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8ca40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ca44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ca48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ca4c:	54000321	b.ne	0xfffff7f8cab0  // b.any
   0x0000fffff7f8ca50:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ca54:	9e620120	scvtf	d0, x9
   0x0000fffff7f8ca58:	14000002	b	0xfffff7f8ca60
   0x0000fffff7f8ca5c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8ca60:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ca64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ca68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ca6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ca70:	54000120	b.eq	0xfffff7f8ca94  // b.none
   0x0000fffff7f8ca74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ca78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ca7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ca80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ca84:	54000161	b.ne	0xfffff7f8cab0  // b.any
   0x0000fffff7f8ca88:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8ca8c:	9e620121	scvtf	d1, x9
   0x0000fffff7f8ca90:	14000002	b	0xfffff7f8ca98
   0x0000fffff7f8ca94:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8ca98:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8ca9c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8caa0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8caa4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8caa8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8caac:	17ffffde	b	0xfffff7f8ca24
   0x0000fffff7f8cab0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8cab4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8cab8:	aa1303e1	mov	x1, x19
   0x0000fffff7f8cabc:	aa1503e2	mov	x2, x21
   0x0000fffff7f8cac0:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f8cac4:	aa1403e4	mov	x4, x20
   0x0000fffff7f8cac8:	aa1603e5	mov	x5, x22
   0x0000fffff7f8cacc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8cad0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8cad4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8cad8:	d63f0200	blr	x16
   0x0000fffff7f8cadc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8cae0:	5400a100	b.eq	0xfffff7f8df00  // b.none
   0x0000fffff7f8cae4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8cae8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8caec:	540004a0	b.eq	0xfffff7f8cb80  // b.none
   0x0000fffff7f8caf0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8caf4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8caf8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8cafc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8cb00:	54000400	b.eq	0xfffff7f8cb80  // b.none
   0x0000fffff7f8cb04:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8cb08:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8cb0c:	36d801d1	tbz	w17, #27, 0xfffff7f8cb44
   0x0000fffff7f8cb10:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8cb14:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8cb18:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8cb1c:	54000321	b.ne	0xfffff7f8cb80  // b.any
   0x0000fffff7f8cb20:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8cb24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8cb28:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8cb2c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8cb30:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8cb34:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8cb38:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8cb3c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8cb40:	54000209	b.ls	0xfffff7f8cb80  // b.plast
   0x0000fffff7f8cb44:	36d8008d	tbz	w13, #27, 0xfffff7f8cb54
   0x0000fffff7f8cb48:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8cb4c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8cb50:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8cb54:	36d80091	tbz	w17, #27, 0xfffff7f8cb64
   0x0000fffff7f8cb58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8cb5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8cb60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8cb64:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8cb68:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8cb6c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8cb70:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8cb74:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8cb78:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8cb7c:	1400000e	b	0xfffff7f8cbb4
   0x0000fffff7f8cb80:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8cb84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8cb88:	aa1303e1	mov	x1, x19
   0x0000fffff7f8cb8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8cb90:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f8cb94:	aa1403e4	mov	x4, x20
   0x0000fffff7f8cb98:	aa1603e5	mov	x5, x22
   0x0000fffff7f8cb9c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8cba0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8cba4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8cba8:	d63f0200	blr	x16
   0x0000fffff7f8cbac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8cbb0:	54009ac0	b.eq	0xfffff7f8df08  // b.none
   0x0000fffff7f8cbb4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cbb8:	37d806a9	tbnz	w9, #27, 0xfffff7f8cc8c
   0x0000fffff7f8cbbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cbc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cbc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cbc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cbcc:	540001c1	b.ne	0xfffff7f8cc04  // b.any
   0x0000fffff7f8cbd0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8cbd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cbd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cbdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cbe0:	54000121	b.ne	0xfffff7f8cc04  // b.any
   0x0000fffff7f8cbe4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8cbe8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8cbec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8cbf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cbf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cbf8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8cbfc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8cc00:	14000030	b	0xfffff7f8ccc0
   0x0000fffff7f8cc04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cc08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8cc0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cc10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cc14:	54000120	b.eq	0xfffff7f8cc38  // b.none
   0x0000fffff7f8cc18:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cc1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cc20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cc24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cc28:	54000321	b.ne	0xfffff7f8cc8c  // b.any
   0x0000fffff7f8cc2c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8cc30:	9e620120	scvtf	d0, x9
   0x0000fffff7f8cc34:	14000002	b	0xfffff7f8cc3c
   0x0000fffff7f8cc38:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8cc3c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8cc40:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8cc44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cc48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cc4c:	54000120	b.eq	0xfffff7f8cc70  // b.none
   0x0000fffff7f8cc50:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8cc54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cc58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cc5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cc60:	54000161	b.ne	0xfffff7f8cc8c  // b.any
   0x0000fffff7f8cc64:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8cc68:	9e620121	scvtf	d1, x9
   0x0000fffff7f8cc6c:	14000002	b	0xfffff7f8cc74
   0x0000fffff7f8cc70:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8cc74:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8cc78:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8cc7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8cc80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cc84:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8cc88:	17ffffde	b	0xfffff7f8cc00
   0x0000fffff7f8cc8c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8cc90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8cc94:	aa1303e1	mov	x1, x19
   0x0000fffff7f8cc98:	aa1503e2	mov	x2, x21
   0x0000fffff7f8cc9c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f8cca0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8cca4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8cca8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8ccac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8ccb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ccb4:	d63f0200	blr	x16
   0x0000fffff7f8ccb8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ccbc:	540092a0	b.eq	0xfffff7f8df10  // b.none
   0x0000fffff7f8ccc0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8ccc4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8ccc8:	540004a0	b.eq	0xfffff7f8cd5c  // b.none
   0x0000fffff7f8cccc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8ccd0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8ccd4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8ccd8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8ccdc:	54000400	b.eq	0xfffff7f8cd5c  // b.none
   0x0000fffff7f8cce0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8cce4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8cce8:	36d801d1	tbz	w17, #27, 0xfffff7f8cd20
   0x0000fffff7f8ccec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8ccf0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8ccf4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8ccf8:	54000321	b.ne	0xfffff7f8cd5c  // b.any
   0x0000fffff7f8ccfc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8cd00:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8cd04:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8cd08:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8cd0c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8cd10:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8cd14:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8cd18:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8cd1c:	54000209	b.ls	0xfffff7f8cd5c  // b.plast
   0x0000fffff7f8cd20:	36d8008d	tbz	w13, #27, 0xfffff7f8cd30
   0x0000fffff7f8cd24:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8cd28:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8cd2c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8cd30:	36d80091	tbz	w17, #27, 0xfffff7f8cd40
   0x0000fffff7f8cd34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8cd38:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8cd3c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8cd40:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8cd44:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8cd48:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8cd4c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8cd50:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8cd54:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8cd58:	1400000e	b	0xfffff7f8cd90
   0x0000fffff7f8cd5c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8cd60:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8cd64:	aa1303e1	mov	x1, x19
   0x0000fffff7f8cd68:	aa1503e2	mov	x2, x21
   0x0000fffff7f8cd6c:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f8cd70:	aa1403e4	mov	x4, x20
   0x0000fffff7f8cd74:	aa1603e5	mov	x5, x22
   0x0000fffff7f8cd78:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8cd7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8cd80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8cd84:	d63f0200	blr	x16
   0x0000fffff7f8cd88:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8cd8c:	54008c60	b.eq	0xfffff7f8df18  // b.none
   0x0000fffff7f8cd90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cd94:	37d806a9	tbnz	w9, #27, 0xfffff7f8ce68
   0x0000fffff7f8cd98:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cd9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cda0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cda4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cda8:	540001c1	b.ne	0xfffff7f8cde0  // b.any
   0x0000fffff7f8cdac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8cdb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cdb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cdb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cdbc:	54000121	b.ne	0xfffff7f8cde0  // b.any
   0x0000fffff7f8cdc0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8cdc4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8cdc8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8cdcc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cdd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cdd4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8cdd8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8cddc:	14000030	b	0xfffff7f8ce9c
   0x0000fffff7f8cde0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cde4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8cde8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cdec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cdf0:	54000120	b.eq	0xfffff7f8ce14  // b.none
   0x0000fffff7f8cdf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cdf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cdfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ce00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ce04:	54000321	b.ne	0xfffff7f8ce68  // b.any
   0x0000fffff7f8ce08:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8ce0c:	9e620120	scvtf	d0, x9
   0x0000fffff7f8ce10:	14000002	b	0xfffff7f8ce18
   0x0000fffff7f8ce14:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8ce18:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ce1c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ce20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ce24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ce28:	54000120	b.eq	0xfffff7f8ce4c  // b.none
   0x0000fffff7f8ce2c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8ce30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8ce34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ce38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8ce3c:	54000161	b.ne	0xfffff7f8ce68  // b.any
   0x0000fffff7f8ce40:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8ce44:	9e620121	scvtf	d1, x9
   0x0000fffff7f8ce48:	14000002	b	0xfffff7f8ce50
   0x0000fffff7f8ce4c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8ce50:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8ce54:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8ce58:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8ce5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8ce60:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8ce64:	17ffffde	b	0xfffff7f8cddc
   0x0000fffff7f8ce68:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8ce6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8ce70:	aa1303e1	mov	x1, x19
   0x0000fffff7f8ce74:	aa1503e2	mov	x2, x21
   0x0000fffff7f8ce78:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f8ce7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8ce80:	aa1603e5	mov	x5, x22
   0x0000fffff7f8ce84:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8ce88:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8ce8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8ce90:	d63f0200	blr	x16
   0x0000fffff7f8ce94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8ce98:	54008440	b.eq	0xfffff7f8df20  // b.none
   0x0000fffff7f8ce9c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8cea0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8cea4:	540004a0	b.eq	0xfffff7f8cf38  // b.none
   0x0000fffff7f8cea8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8ceac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8ceb0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8ceb4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8ceb8:	54000400	b.eq	0xfffff7f8cf38  // b.none
   0x0000fffff7f8cebc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8cec0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8cec4:	36d801d1	tbz	w17, #27, 0xfffff7f8cefc
   0x0000fffff7f8cec8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8cecc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8ced0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8ced4:	54000321	b.ne	0xfffff7f8cf38  // b.any
   0x0000fffff7f8ced8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8cedc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8cee0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8cee4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8cee8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8ceec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8cef0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8cef4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8cef8:	54000209	b.ls	0xfffff7f8cf38  // b.plast
   0x0000fffff7f8cefc:	36d8008d	tbz	w13, #27, 0xfffff7f8cf0c
   0x0000fffff7f8cf00:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8cf04:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8cf08:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8cf0c:	36d80091	tbz	w17, #27, 0xfffff7f8cf1c
   0x0000fffff7f8cf10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8cf14:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8cf18:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8cf1c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8cf20:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8cf24:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8cf28:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8cf2c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8cf30:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8cf34:	1400000e	b	0xfffff7f8cf6c
   0x0000fffff7f8cf38:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8cf3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8cf40:	aa1303e1	mov	x1, x19
   0x0000fffff7f8cf44:	aa1503e2	mov	x2, x21
   0x0000fffff7f8cf48:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f8cf4c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8cf50:	aa1603e5	mov	x5, x22
   0x0000fffff7f8cf54:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8cf58:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8cf5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8cf60:	d63f0200	blr	x16
   0x0000fffff7f8cf64:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8cf68:	54007e00	b.eq	0xfffff7f8df28  // b.none
   0x0000fffff7f8cf6c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cf70:	37d806a9	tbnz	w9, #27, 0xfffff7f8d044
   0x0000fffff7f8cf74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cf78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cf7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cf80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cf84:	540001c1	b.ne	0xfffff7f8cfbc  // b.any
   0x0000fffff7f8cf88:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8cf8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cf90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cf94:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cf98:	54000121	b.ne	0xfffff7f8cfbc  // b.any
   0x0000fffff7f8cf9c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8cfa0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8cfa4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8cfa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cfac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cfb0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8cfb4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8cfb8:	14000030	b	0xfffff7f8d078
   0x0000fffff7f8cfbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cfc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8cfc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cfc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cfcc:	54000120	b.eq	0xfffff7f8cff0  // b.none
   0x0000fffff7f8cfd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8cfd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8cfd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8cfdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8cfe0:	54000321	b.ne	0xfffff7f8d044  // b.any
   0x0000fffff7f8cfe4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8cfe8:	9e620120	scvtf	d0, x9
   0x0000fffff7f8cfec:	14000002	b	0xfffff7f8cff4
   0x0000fffff7f8cff0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8cff4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8cff8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8cffc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d000:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d004:	54000120	b.eq	0xfffff7f8d028  // b.none
   0x0000fffff7f8d008:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d00c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d014:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d018:	54000161	b.ne	0xfffff7f8d044  // b.any
   0x0000fffff7f8d01c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8d020:	9e620121	scvtf	d1, x9
   0x0000fffff7f8d024:	14000002	b	0xfffff7f8d02c
   0x0000fffff7f8d028:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8d02c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8d030:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8d034:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d038:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d03c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d040:	17ffffde	b	0xfffff7f8cfb8
   0x0000fffff7f8d044:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8d048:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d04c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d050:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d054:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f8d058:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d05c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d060:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8d064:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8d068:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d06c:	d63f0200	blr	x16
   0x0000fffff7f8d070:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d074:	540075e0	b.eq	0xfffff7f8df30  // b.none
   0x0000fffff7f8d078:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8d07c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8d080:	540004a0	b.eq	0xfffff7f8d114  // b.none
   0x0000fffff7f8d084:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8d088:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8d08c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8d090:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8d094:	54000400	b.eq	0xfffff7f8d114  // b.none
   0x0000fffff7f8d098:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8d09c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8d0a0:	36d801d1	tbz	w17, #27, 0xfffff7f8d0d8
   0x0000fffff7f8d0a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8d0a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8d0ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8d0b0:	54000321	b.ne	0xfffff7f8d114  // b.any
   0x0000fffff7f8d0b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8d0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d0bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8d0c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8d0c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8d0c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8d0cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8d0d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8d0d4:	54000209	b.ls	0xfffff7f8d114  // b.plast
   0x0000fffff7f8d0d8:	36d8008d	tbz	w13, #27, 0xfffff7f8d0e8
   0x0000fffff7f8d0dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8d0e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8d0e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8d0e8:	36d80091	tbz	w17, #27, 0xfffff7f8d0f8
   0x0000fffff7f8d0ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d0f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8d0f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8d0f8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8d0fc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8d100:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8d104:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8d108:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8d10c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8d110:	1400000e	b	0xfffff7f8d148
   0x0000fffff7f8d114:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8d118:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d11c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d120:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d124:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f8d128:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d12c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d130:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8d134:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8d138:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d13c:	d63f0200	blr	x16
   0x0000fffff7f8d140:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d144:	54006fa0	b.eq	0xfffff7f8df38  // b.none
   0x0000fffff7f8d148:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d14c:	37d806a9	tbnz	w9, #27, 0xfffff7f8d220
   0x0000fffff7f8d150:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d154:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d158:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d15c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d160:	540001c1	b.ne	0xfffff7f8d198  // b.any
   0x0000fffff7f8d164:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d168:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d16c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d170:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d174:	54000121	b.ne	0xfffff7f8d198  // b.any
   0x0000fffff7f8d178:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d17c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8d180:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8d184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d18c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8d190:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d194:	14000030	b	0xfffff7f8d254
   0x0000fffff7f8d198:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d19c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d1a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d1a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d1a8:	54000120	b.eq	0xfffff7f8d1cc  // b.none
   0x0000fffff7f8d1ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d1b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d1b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d1b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d1bc:	54000321	b.ne	0xfffff7f8d220  // b.any
   0x0000fffff7f8d1c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d1c4:	9e620120	scvtf	d0, x9
   0x0000fffff7f8d1c8:	14000002	b	0xfffff7f8d1d0
   0x0000fffff7f8d1cc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8d1d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d1d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d1d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d1dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d1e0:	54000120	b.eq	0xfffff7f8d204  // b.none
   0x0000fffff7f8d1e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d1e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d1ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d1f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d1f4:	54000161	b.ne	0xfffff7f8d220  // b.any
   0x0000fffff7f8d1f8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8d1fc:	9e620121	scvtf	d1, x9
   0x0000fffff7f8d200:	14000002	b	0xfffff7f8d208
   0x0000fffff7f8d204:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8d208:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8d20c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8d210:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d214:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d218:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d21c:	17ffffde	b	0xfffff7f8d194
   0x0000fffff7f8d220:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8d224:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d228:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d22c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d230:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f8d234:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d238:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d23c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8d240:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8d244:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d248:	d63f0200	blr	x16
   0x0000fffff7f8d24c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d250:	54006780	b.eq	0xfffff7f8df40  // b.none
   0x0000fffff7f8d254:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8d258:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8d25c:	540004a0	b.eq	0xfffff7f8d2f0  // b.none
   0x0000fffff7f8d260:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8d264:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8d268:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8d26c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8d270:	54000400	b.eq	0xfffff7f8d2f0  // b.none
   0x0000fffff7f8d274:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8d278:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8d27c:	36d801d1	tbz	w17, #27, 0xfffff7f8d2b4
   0x0000fffff7f8d280:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8d284:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8d288:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8d28c:	54000321	b.ne	0xfffff7f8d2f0  // b.any
   0x0000fffff7f8d290:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8d294:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d298:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8d29c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8d2a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8d2a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8d2a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8d2ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8d2b0:	54000209	b.ls	0xfffff7f8d2f0  // b.plast
   0x0000fffff7f8d2b4:	36d8008d	tbz	w13, #27, 0xfffff7f8d2c4
   0x0000fffff7f8d2b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8d2bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8d2c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8d2c4:	36d80091	tbz	w17, #27, 0xfffff7f8d2d4
   0x0000fffff7f8d2c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d2cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8d2d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8d2d4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8d2d8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8d2dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8d2e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8d2e4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8d2e8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8d2ec:	1400000e	b	0xfffff7f8d324
   0x0000fffff7f8d2f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8d2f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d2f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d2fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d300:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f8d304:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d308:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d30c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8d310:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8d314:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d318:	d63f0200	blr	x16
   0x0000fffff7f8d31c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d320:	54006140	b.eq	0xfffff7f8df48  // b.none
   0x0000fffff7f8d324:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d328:	37d806a9	tbnz	w9, #27, 0xfffff7f8d3fc
   0x0000fffff7f8d32c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d338:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d33c:	540001c1	b.ne	0xfffff7f8d374  // b.any
   0x0000fffff7f8d340:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d344:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d348:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d34c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d350:	54000121	b.ne	0xfffff7f8d374  // b.any
   0x0000fffff7f8d354:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d358:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8d35c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8d360:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d368:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8d36c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d370:	14000030	b	0xfffff7f8d430
   0x0000fffff7f8d374:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d378:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d37c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d380:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d384:	54000120	b.eq	0xfffff7f8d3a8  // b.none
   0x0000fffff7f8d388:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d38c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d390:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d394:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d398:	54000321	b.ne	0xfffff7f8d3fc  // b.any
   0x0000fffff7f8d39c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d3a0:	9e620120	scvtf	d0, x9
   0x0000fffff7f8d3a4:	14000002	b	0xfffff7f8d3ac
   0x0000fffff7f8d3a8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8d3ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d3b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d3b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d3b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d3bc:	54000120	b.eq	0xfffff7f8d3e0  // b.none
   0x0000fffff7f8d3c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d3c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d3c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d3cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d3d0:	54000161	b.ne	0xfffff7f8d3fc  // b.any
   0x0000fffff7f8d3d4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8d3d8:	9e620121	scvtf	d1, x9
   0x0000fffff7f8d3dc:	14000002	b	0xfffff7f8d3e4
   0x0000fffff7f8d3e0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8d3e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8d3e8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8d3ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d3f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d3f4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d3f8:	17ffffde	b	0xfffff7f8d370
   0x0000fffff7f8d3fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8d400:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d404:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d408:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d40c:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f8d410:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d414:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d418:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8d41c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8d420:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d424:	d63f0200	blr	x16
   0x0000fffff7f8d428:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d42c:	54005920	b.eq	0xfffff7f8df50  // b.none
   0x0000fffff7f8d430:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8d434:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8d438:	540004a0	b.eq	0xfffff7f8d4cc  // b.none
   0x0000fffff7f8d43c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8d440:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8d444:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8d448:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8d44c:	54000400	b.eq	0xfffff7f8d4cc  // b.none
   0x0000fffff7f8d450:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8d454:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8d458:	36d801d1	tbz	w17, #27, 0xfffff7f8d490
   0x0000fffff7f8d45c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8d460:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8d464:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8d468:	54000321	b.ne	0xfffff7f8d4cc  // b.any
   0x0000fffff7f8d46c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8d470:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d474:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8d478:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8d47c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8d480:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8d484:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8d488:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8d48c:	54000209	b.ls	0xfffff7f8d4cc  // b.plast
   0x0000fffff7f8d490:	36d8008d	tbz	w13, #27, 0xfffff7f8d4a0
   0x0000fffff7f8d494:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8d498:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8d49c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8d4a0:	36d80091	tbz	w17, #27, 0xfffff7f8d4b0
   0x0000fffff7f8d4a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d4a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8d4ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8d4b0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8d4b4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8d4b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8d4bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8d4c0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8d4c4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8d4c8:	1400000e	b	0xfffff7f8d500
   0x0000fffff7f8d4cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8d4d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d4d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d4d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d4dc:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f8d4e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d4e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d4e8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8d4ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8d4f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d4f4:	d63f0200	blr	x16
   0x0000fffff7f8d4f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d4fc:	540052e0	b.eq	0xfffff7f8df58  // b.none
   0x0000fffff7f8d500:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d504:	37d806a9	tbnz	w9, #27, 0xfffff7f8d5d8
   0x0000fffff7f8d508:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d50c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d510:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d514:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d518:	540001c1	b.ne	0xfffff7f8d550  // b.any
   0x0000fffff7f8d51c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d520:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d524:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d528:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d52c:	54000121	b.ne	0xfffff7f8d550  // b.any
   0x0000fffff7f8d530:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d534:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8d538:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8d53c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d544:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8d548:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d54c:	14000030	b	0xfffff7f8d60c
   0x0000fffff7f8d550:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d554:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d55c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d560:	54000120	b.eq	0xfffff7f8d584  // b.none
   0x0000fffff7f8d564:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d568:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d56c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d570:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d574:	54000321	b.ne	0xfffff7f8d5d8  // b.any
   0x0000fffff7f8d578:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d57c:	9e620120	scvtf	d0, x9
   0x0000fffff7f8d580:	14000002	b	0xfffff7f8d588
   0x0000fffff7f8d584:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8d588:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d58c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d594:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d598:	54000120	b.eq	0xfffff7f8d5bc  // b.none
   0x0000fffff7f8d59c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d5a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d5a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d5a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d5ac:	54000161	b.ne	0xfffff7f8d5d8  // b.any
   0x0000fffff7f8d5b0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8d5b4:	9e620121	scvtf	d1, x9
   0x0000fffff7f8d5b8:	14000002	b	0xfffff7f8d5c0
   0x0000fffff7f8d5bc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8d5c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8d5c4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8d5c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d5cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d5d0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d5d4:	17ffffde	b	0xfffff7f8d54c
   0x0000fffff7f8d5d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8d5dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d5e0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d5e4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d5e8:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f8d5ec:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d5f0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d5f4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8d5f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8d5fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d600:	d63f0200	blr	x16
   0x0000fffff7f8d604:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d608:	54004ac0	b.eq	0xfffff7f8df60  // b.none
   0x0000fffff7f8d60c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8d610:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8d614:	540004a0	b.eq	0xfffff7f8d6a8  // b.none
   0x0000fffff7f8d618:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8d61c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8d620:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8d624:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8d628:	54000400	b.eq	0xfffff7f8d6a8  // b.none
   0x0000fffff7f8d62c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8d630:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8d634:	36d801d1	tbz	w17, #27, 0xfffff7f8d66c
   0x0000fffff7f8d638:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8d63c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8d640:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8d644:	54000321	b.ne	0xfffff7f8d6a8  // b.any
   0x0000fffff7f8d648:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8d64c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d650:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8d654:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8d658:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8d65c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8d660:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8d664:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8d668:	54000209	b.ls	0xfffff7f8d6a8  // b.plast
   0x0000fffff7f8d66c:	36d8008d	tbz	w13, #27, 0xfffff7f8d67c
   0x0000fffff7f8d670:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8d674:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8d678:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8d67c:	36d80091	tbz	w17, #27, 0xfffff7f8d68c
   0x0000fffff7f8d680:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d684:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8d688:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8d68c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8d690:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8d694:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8d698:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8d69c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8d6a0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8d6a4:	1400000e	b	0xfffff7f8d6dc
   0x0000fffff7f8d6a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8d6ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d6b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d6b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d6b8:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f8d6bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d6c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d6c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8d6c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8d6cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d6d0:	d63f0200	blr	x16
   0x0000fffff7f8d6d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d6d8:	54004480	b.eq	0xfffff7f8df68  // b.none
   0x0000fffff7f8d6dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d6e0:	37d806a9	tbnz	w9, #27, 0xfffff7f8d7b4
   0x0000fffff7f8d6e4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d6e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d6ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d6f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d6f4:	540001c1	b.ne	0xfffff7f8d72c  // b.any
   0x0000fffff7f8d6f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d6fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d704:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d708:	54000121	b.ne	0xfffff7f8d72c  // b.any
   0x0000fffff7f8d70c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d710:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8d714:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8d718:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d71c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d720:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8d724:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d728:	14000030	b	0xfffff7f8d7e8
   0x0000fffff7f8d72c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d730:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d738:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d73c:	54000120	b.eq	0xfffff7f8d760  // b.none
   0x0000fffff7f8d740:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d744:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d74c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d750:	54000321	b.ne	0xfffff7f8d7b4  // b.any
   0x0000fffff7f8d754:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d758:	9e620120	scvtf	d0, x9
   0x0000fffff7f8d75c:	14000002	b	0xfffff7f8d764
   0x0000fffff7f8d760:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8d764:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d768:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d76c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d770:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d774:	54000120	b.eq	0xfffff7f8d798  // b.none
   0x0000fffff7f8d778:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d77c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d784:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d788:	54000161	b.ne	0xfffff7f8d7b4  // b.any
   0x0000fffff7f8d78c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8d790:	9e620121	scvtf	d1, x9
   0x0000fffff7f8d794:	14000002	b	0xfffff7f8d79c
   0x0000fffff7f8d798:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8d79c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8d7a0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8d7a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d7a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d7ac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d7b0:	17ffffde	b	0xfffff7f8d728
   0x0000fffff7f8d7b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8d7b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d7bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d7c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d7c4:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f8d7c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d7cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d7d0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8d7d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8d7d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d7dc:	d63f0200	blr	x16
   0x0000fffff7f8d7e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d7e4:	54003c60	b.eq	0xfffff7f8df70  // b.none
   0x0000fffff7f8d7e8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8d7ec:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8d7f0:	540004a0	b.eq	0xfffff7f8d884  // b.none
   0x0000fffff7f8d7f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8d7f8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8d7fc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8d800:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8d804:	54000400	b.eq	0xfffff7f8d884  // b.none
   0x0000fffff7f8d808:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8d80c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8d810:	36d801d1	tbz	w17, #27, 0xfffff7f8d848
   0x0000fffff7f8d814:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8d818:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8d81c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8d820:	54000321	b.ne	0xfffff7f8d884  // b.any
   0x0000fffff7f8d824:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8d828:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d82c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8d830:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8d834:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8d838:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8d83c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8d840:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8d844:	54000209	b.ls	0xfffff7f8d884  // b.plast
   0x0000fffff7f8d848:	36d8008d	tbz	w13, #27, 0xfffff7f8d858
   0x0000fffff7f8d84c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8d850:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8d854:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8d858:	36d80091	tbz	w17, #27, 0xfffff7f8d868
   0x0000fffff7f8d85c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8d860:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8d864:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8d868:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8d86c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8d870:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8d874:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8d878:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8d87c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8d880:	1400000e	b	0xfffff7f8d8b8
   0x0000fffff7f8d884:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8d888:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d88c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d890:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d894:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f8d898:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d89c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d8a0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8d8a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8d8a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d8ac:	d63f0200	blr	x16
   0x0000fffff7f8d8b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d8b4:	54003620	b.eq	0xfffff7f8df78  // b.none
   0x0000fffff7f8d8b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d8bc:	37d806a9	tbnz	w9, #27, 0xfffff7f8d990
   0x0000fffff7f8d8c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d8c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d8c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d8cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d8d0:	540001c1	b.ne	0xfffff7f8d908  // b.any
   0x0000fffff7f8d8d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d8d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d8dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d8e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d8e4:	54000121	b.ne	0xfffff7f8d908  // b.any
   0x0000fffff7f8d8e8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d8ec:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8d8f0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8d8f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d8fc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8d900:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d904:	14000030	b	0xfffff7f8d9c4
   0x0000fffff7f8d908:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d90c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d914:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d918:	54000120	b.eq	0xfffff7f8d93c  // b.none
   0x0000fffff7f8d91c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8d920:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d928:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d92c:	54000321	b.ne	0xfffff7f8d990  // b.any
   0x0000fffff7f8d930:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8d934:	9e620120	scvtf	d0, x9
   0x0000fffff7f8d938:	14000002	b	0xfffff7f8d940
   0x0000fffff7f8d93c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8d940:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d944:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d94c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d950:	54000120	b.eq	0xfffff7f8d974  // b.none
   0x0000fffff7f8d954:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8d958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8d95c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d960:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8d964:	54000161	b.ne	0xfffff7f8d990  // b.any
   0x0000fffff7f8d968:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8d96c:	9e620121	scvtf	d1, x9
   0x0000fffff7f8d970:	14000002	b	0xfffff7f8d978
   0x0000fffff7f8d974:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8d978:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8d97c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8d980:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8d984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8d988:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8d98c:	17ffffde	b	0xfffff7f8d904
   0x0000fffff7f8d990:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8d994:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8d998:	aa1303e1	mov	x1, x19
   0x0000fffff7f8d99c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8d9a0:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f8d9a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f8d9a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f8d9ac:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8d9b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8d9b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8d9b8:	d63f0200	blr	x16
   0x0000fffff7f8d9bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8d9c0:	54002e00	b.eq	0xfffff7f8df80  // b.none
   0x0000fffff7f8d9c4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8d9c8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8d9cc:	540004a0	b.eq	0xfffff7f8da60  // b.none
   0x0000fffff7f8d9d0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8d9d4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8d9d8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8d9dc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8d9e0:	54000400	b.eq	0xfffff7f8da60  // b.none
   0x0000fffff7f8d9e4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8d9e8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8d9ec:	36d801d1	tbz	w17, #27, 0xfffff7f8da24
   0x0000fffff7f8d9f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8d9f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8d9f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8d9fc:	54000321	b.ne	0xfffff7f8da60  // b.any
   0x0000fffff7f8da00:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8da04:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8da08:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8da0c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8da10:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8da14:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8da18:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8da1c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8da20:	54000209	b.ls	0xfffff7f8da60  // b.plast
   0x0000fffff7f8da24:	36d8008d	tbz	w13, #27, 0xfffff7f8da34
   0x0000fffff7f8da28:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8da2c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8da30:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8da34:	36d80091	tbz	w17, #27, 0xfffff7f8da44
   0x0000fffff7f8da38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8da3c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8da40:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8da44:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8da48:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8da4c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8da50:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8da54:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8da58:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8da5c:	1400000e	b	0xfffff7f8da94
   0x0000fffff7f8da60:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8da64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8da68:	aa1303e1	mov	x1, x19
   0x0000fffff7f8da6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f8da70:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f8da74:	aa1403e4	mov	x4, x20
   0x0000fffff7f8da78:	aa1603e5	mov	x5, x22
   0x0000fffff7f8da7c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8da80:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8da84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8da88:	d63f0200	blr	x16
   0x0000fffff7f8da8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8da90:	540027c0	b.eq	0xfffff7f8df88  // b.none
   0x0000fffff7f8da94:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8da98:	37d806a9	tbnz	w9, #27, 0xfffff7f8db6c
   0x0000fffff7f8da9c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8daa0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8daa4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8daa8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8daac:	540001c1	b.ne	0xfffff7f8dae4  // b.any
   0x0000fffff7f8dab0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8dab4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8dab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dabc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8dac0:	54000121	b.ne	0xfffff7f8dae4  // b.any
   0x0000fffff7f8dac4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8dac8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8dacc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8dad0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8dad4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dad8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8dadc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8dae0:	14000030	b	0xfffff7f8dba0
   0x0000fffff7f8dae4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8dae8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8daec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8daf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8daf4:	54000120	b.eq	0xfffff7f8db18  // b.none
   0x0000fffff7f8daf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8dafc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8db00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8db04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8db08:	54000321	b.ne	0xfffff7f8db6c  // b.any
   0x0000fffff7f8db0c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8db10:	9e620120	scvtf	d0, x9
   0x0000fffff7f8db14:	14000002	b	0xfffff7f8db1c
   0x0000fffff7f8db18:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8db1c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8db20:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8db24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8db28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8db2c:	54000120	b.eq	0xfffff7f8db50  // b.none
   0x0000fffff7f8db30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8db34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8db38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8db3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8db40:	54000161	b.ne	0xfffff7f8db6c  // b.any
   0x0000fffff7f8db44:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8db48:	9e620121	scvtf	d1, x9
   0x0000fffff7f8db4c:	14000002	b	0xfffff7f8db54
   0x0000fffff7f8db50:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8db54:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8db58:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8db5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8db60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8db64:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8db68:	17ffffde	b	0xfffff7f8dae0
   0x0000fffff7f8db6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8db70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8db74:	aa1303e1	mov	x1, x19
   0x0000fffff7f8db78:	aa1503e2	mov	x2, x21
   0x0000fffff7f8db7c:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f8db80:	aa1403e4	mov	x4, x20
   0x0000fffff7f8db84:	aa1603e5	mov	x5, x22
   0x0000fffff7f8db88:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8db8c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8db90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8db94:	d63f0200	blr	x16
   0x0000fffff7f8db98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8db9c:	54001fa0	b.eq	0xfffff7f8df90  // b.none
   0x0000fffff7f8dba0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8dba4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8dba8:	540004a0	b.eq	0xfffff7f8dc3c  // b.none
   0x0000fffff7f8dbac:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8dbb0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8dbb4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8dbb8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8dbbc:	54000400	b.eq	0xfffff7f8dc3c  // b.none
   0x0000fffff7f8dbc0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8dbc4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8dbc8:	36d801d1	tbz	w17, #27, 0xfffff7f8dc00
   0x0000fffff7f8dbcc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8dbd0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8dbd4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8dbd8:	54000321	b.ne	0xfffff7f8dc3c  // b.any
   0x0000fffff7f8dbdc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8dbe0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8dbe4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8dbe8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8dbec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8dbf0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8dbf4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8dbf8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8dbfc:	54000209	b.ls	0xfffff7f8dc3c  // b.plast
   0x0000fffff7f8dc00:	36d8008d	tbz	w13, #27, 0xfffff7f8dc10
   0x0000fffff7f8dc04:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8dc08:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8dc0c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8dc10:	36d80091	tbz	w17, #27, 0xfffff7f8dc20
   0x0000fffff7f8dc14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8dc18:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8dc1c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8dc20:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8dc24:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8dc28:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8dc2c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8dc30:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8dc34:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8dc38:	1400000e	b	0xfffff7f8dc70
   0x0000fffff7f8dc3c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8dc40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8dc44:	aa1303e1	mov	x1, x19
   0x0000fffff7f8dc48:	aa1503e2	mov	x2, x21
   0x0000fffff7f8dc4c:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f8dc50:	aa1403e4	mov	x4, x20
   0x0000fffff7f8dc54:	aa1603e5	mov	x5, x22
   0x0000fffff7f8dc58:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8dc5c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8dc60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8dc64:	d63f0200	blr	x16
   0x0000fffff7f8dc68:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8dc6c:	54001960	b.eq	0xfffff7f8df98  // b.none
   0x0000fffff7f8dc70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8dc74:	37d806a9	tbnz	w9, #27, 0xfffff7f8dd48
   0x0000fffff7f8dc78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8dc7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8dc80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dc84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8dc88:	540001c1	b.ne	0xfffff7f8dcc0  // b.any
   0x0000fffff7f8dc8c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8dc90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8dc94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dc98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8dc9c:	54000121	b.ne	0xfffff7f8dcc0  // b.any
   0x0000fffff7f8dca0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8dca4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8dca8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8dcac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8dcb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dcb4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8dcb8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8dcbc:	14000030	b	0xfffff7f8dd7c
   0x0000fffff7f8dcc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8dcc4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8dcc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dccc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8dcd0:	54000120	b.eq	0xfffff7f8dcf4  // b.none
   0x0000fffff7f8dcd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8dcd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8dcdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dce0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8dce4:	54000321	b.ne	0xfffff7f8dd48  // b.any
   0x0000fffff7f8dce8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8dcec:	9e620120	scvtf	d0, x9
   0x0000fffff7f8dcf0:	14000002	b	0xfffff7f8dcf8
   0x0000fffff7f8dcf4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f8dcf8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8dcfc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8dd00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dd04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8dd08:	54000120	b.eq	0xfffff7f8dd2c  // b.none
   0x0000fffff7f8dd0c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8dd10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8dd14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dd18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8dd1c:	54000161	b.ne	0xfffff7f8dd48  // b.any
   0x0000fffff7f8dd20:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8dd24:	9e620121	scvtf	d1, x9
   0x0000fffff7f8dd28:	14000002	b	0xfffff7f8dd30
   0x0000fffff7f8dd2c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8dd30:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8dd34:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8dd38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8dd3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dd40:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8dd44:	17ffffde	b	0xfffff7f8dcbc
   0x0000fffff7f8dd48:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8dd4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8dd50:	aa1303e1	mov	x1, x19
   0x0000fffff7f8dd54:	aa1503e2	mov	x2, x21
   0x0000fffff7f8dd58:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f8dd5c:	aa1403e4	mov	x4, x20
   0x0000fffff7f8dd60:	aa1603e5	mov	x5, x22
   0x0000fffff7f8dd64:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8dd68:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8dd6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8dd70:	d63f0200	blr	x16
   0x0000fffff7f8dd74:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8dd78:	54001140	b.eq	0xfffff7f8dfa0  // b.none
   0x0000fffff7f8dd7c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8dd80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8dd84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8dd88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8dd8c:	54000381	b.ne	0xfffff7f8ddfc  // b.any
   0x0000fffff7f8dd90:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f8dd94:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f8dd98:	8b0a018b	add	x11, x12, x10
   0x0000fffff7f8dd9c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f8dda0:	36d80211	tbz	w17, #27, 0xfffff7f8dde0
   0x0000fffff7f8dda4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8dda8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8ddac:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8ddb0:	54000261	b.ne	0xfffff7f8ddfc  // b.any
   0x0000fffff7f8ddb4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8ddb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8ddbc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8ddc0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8ddc4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8ddc8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8ddcc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8ddd0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8ddd4:	54000149	b.ls	0xfffff7f8ddfc  // b.plast
   0x0000fffff7f8ddd8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8dddc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8dde0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8dde4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8dde8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8ddec:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8ddf0:	f9002e6b	str	x11, [x19, #88]
   0x0000fffff7f8ddf4:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f8ddf8:	1400000e	b	0xfffff7f8de30
   0x0000fffff7f8ddfc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8de00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8de04:	aa1303e1	mov	x1, x19
   0x0000fffff7f8de08:	aa1503e2	mov	x2, x21
   0x0000fffff7f8de0c:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f8de10:	aa1403e4	mov	x4, x20
   0x0000fffff7f8de14:	aa1603e5	mov	x5, x22
   0x0000fffff7f8de18:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f8de1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8de20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8de24:	d63f0200	blr	x16
   0x0000fffff7f8de28:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8de2c:	54000be0	b.eq	0xfffff7f8dfa8  // b.none
   0x0000fffff7f8de30:	17fff8eb	b	0xfffff7f8c1dc
   0x0000fffff7f8de34:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8de38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8de3c:	aa1303e1	mov	x1, x19
   0x0000fffff7f8de40:	aa1503e2	mov	x2, x21
   0x0000fffff7f8de44:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f8de48:	aa1403e4	mov	x4, x20
   0x0000fffff7f8de4c:	aa1603e5	mov	x5, x22
   0x0000fffff7f8de50:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f8de54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8de58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8de5c:	d63f0200	blr	x16
   0x0000fffff7f8de60:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f8de64:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8de68:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8de6c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8de70:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f8de74:	d65f03c0	ret
   0x0000fffff7f8de78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8de7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8de80:	b900028a	str	w10, [x20]
   0x0000fffff7f8de84:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8de88:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f8de8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8de90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8de94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8de98:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8de9c:	d65f03c0	ret
   0x0000fffff7f8dea0:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f8dea4:	17fffff5	b	0xfffff7f8de78
   0x0000fffff7f8dea8:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f8deac:	17fffff3	b	0xfffff7f8de78
   0x0000fffff7f8deb0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f8deb4:	17fffff1	b	0xfffff7f8de78
   0x0000fffff7f8deb8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f8debc:	17ffffef	b	0xfffff7f8de78
   0x0000fffff7f8dec0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f8dec4:	17ffffed	b	0xfffff7f8de78
   0x0000fffff7f8dec8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f8decc:	17ffffeb	b	0xfffff7f8de78
   0x0000fffff7f8ded0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f8ded4:	17ffffe9	b	0xfffff7f8de78
   0x0000fffff7f8ded8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f8dedc:	17ffffe7	b	0xfffff7f8de78
   0x0000fffff7f8dee0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f8dee4:	17ffffe5	b	0xfffff7f8de78
   0x0000fffff7f8dee8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f8deec:	17ffffe3	b	0xfffff7f8de78
   0x0000fffff7f8def0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f8def4:	17ffffe1	b	0xfffff7f8de78
   0x0000fffff7f8def8:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f8defc:	17ffffdf	b	0xfffff7f8de78
   0x0000fffff7f8df00:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f8df04:	17ffffdd	b	0xfffff7f8de78
   0x0000fffff7f8df08:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f8df0c:	17ffffdb	b	0xfffff7f8de78
   0x0000fffff7f8df10:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f8df14:	17ffffd9	b	0xfffff7f8de78
   0x0000fffff7f8df18:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f8df1c:	17ffffd7	b	0xfffff7f8de78
   0x0000fffff7f8df20:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f8df24:	17ffffd5	b	0xfffff7f8de78
   0x0000fffff7f8df28:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f8df2c:	17ffffd3	b	0xfffff7f8de78
   0x0000fffff7f8df30:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f8df34:	17ffffd1	b	0xfffff7f8de78
   0x0000fffff7f8df38:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f8df3c:	17ffffcf	b	0xfffff7f8de78
   0x0000fffff7f8df40:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f8df44:	17ffffcd	b	0xfffff7f8de78
   0x0000fffff7f8df48:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f8df4c:	17ffffcb	b	0xfffff7f8de78
   0x0000fffff7f8df50:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f8df54:	17ffffc9	b	0xfffff7f8de78
   0x0000fffff7f8df58:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f8df5c:	17ffffc7	b	0xfffff7f8de78
   0x0000fffff7f8df60:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f8df64:	17ffffc5	b	0xfffff7f8de78
   0x0000fffff7f8df68:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f8df6c:	17ffffc3	b	0xfffff7f8de78
   0x0000fffff7f8df70:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f8df74:	17ffffc1	b	0xfffff7f8de78
   0x0000fffff7f8df78:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f8df7c:	17ffffbf	b	0xfffff7f8de78
   0x0000fffff7f8df80:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f8df84:	17ffffbd	b	0xfffff7f8de78
   0x0000fffff7f8df88:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f8df8c:	17ffffbb	b	0xfffff7f8de78
   0x0000fffff7f8df90:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f8df94:	17ffffb9	b	0xfffff7f8de78
   0x0000fffff7f8df98:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f8df9c:	17ffffb7	b	0xfffff7f8de78
   0x0000fffff7f8dfa0:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f8dfa4:	17ffffb5	b	0xfffff7f8de78
   0x0000fffff7f8dfa8:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f8dfac:	17ffffb3	b	0xfffff7f8de78
   0x0000fffff7f8dfb0:	00000000	udf	#0
   0x0000fffff7f8dfb4:	00000000	udf	#0
   0x0000fffff7f8dfb8:	00000000	udf	#0
   0x0000fffff7f8dfbc:	00000000	udf	#0
   0x0000fffff7f8dfc0:	00000000	udf	#0
   0x0000fffff7f8dfc4:	00000000	udf	#0
   0x0000fffff7f8dfc8:	00000000	udf	#0
   0x0000fffff7f8dfcc:	00000000	udf	#0
   0x0000fffff7f8dfd0:	00000000	udf	#0
   0x0000fffff7f8dfd4:	00000000	udf	#0
   0x0000fffff7f8dfd8:	00000000	udf	#0
   0x0000fffff7f8dfdc:	00000000	udf	#0
   0x0000fffff7f8dfe0:	00000000	udf	#0
   0x0000fffff7f8dfe4:	00000000	udf	#0
   0x0000fffff7f8dfe8:	00000000	udf	#0
   0x0000fffff7f8dfec:	00000000	udf	#0
   0x0000fffff7f8dff0:	00000000	udf	#0
   0x0000fffff7f8dff4:	00000000	udf	#0
   0x0000fffff7f8dff8:	00000000	udf	#0
   0x0000fffff7f8dffc:	00000000	udf	#0
End of assembler dump.
