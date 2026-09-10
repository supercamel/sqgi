Dump of assembler code from 0xfffff7fab000 to 0xfffff7fad000:
   0x0000fffff7fab000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fab004:	910003fd	mov	x29, sp
   0x0000fffff7fab008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fab00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fab010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fab014:	aa0003f3	mov	x19, x0
   0x0000fffff7fab018:	aa0103f4	mov	x20, x1
   0x0000fffff7fab01c:	aa0203f5	mov	x21, x2
   0x0000fffff7fab020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fab024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fab028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fab02c:	f90003e9	str	x9, [sp]
   0x0000fffff7fab030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fab034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fab038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fab03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fab040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab044:	d63f0200	blr	x16
   0x0000fffff7fab048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fab04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fab050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fab054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fab058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab05c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab060:	aa1303e1	mov	x1, x19
   0x0000fffff7fab064:	aa1503e2	mov	x2, x21
   0x0000fffff7fab068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fab06c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab070:	aa1603e5	mov	x5, x22
   0x0000fffff7fab074:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fab078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab07c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab080:	d63f0200	blr	x16
   0x0000fffff7fab084:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab088:	5400cce0	b.eq	0xfffff7faca24  // b.none
   0x0000fffff7fab08c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab090:	37d800e9	tbnz	w9, #27, 0xfffff7fab0ac
   0x0000fffff7fab094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fab098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab09c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab0a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fab0a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab0a8:	1400000e	b	0xfffff7fab0e0
   0x0000fffff7fab0ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab0b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab0b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fab0b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fab0bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fab0c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fab0c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fab0c8:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fab0cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab0d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab0d4:	d63f0200	blr	x16
   0x0000fffff7fab0d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab0dc:	5400ca80	b.eq	0xfffff7faca2c  // b.none
   0x0000fffff7fab0e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab0e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab0e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fab0ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fab0f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fab0f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fab0f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fab0fc:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fab100:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab108:	d63f0200	blr	x16
   0x0000fffff7fab10c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab110:	5400c920	b.eq	0xfffff7faca34  // b.none
   0x0000fffff7fab114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab118:	37d800e9	tbnz	w9, #27, 0xfffff7fab134
   0x0000fffff7fab11c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fab120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fab12c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab130:	1400000e	b	0xfffff7fab168
   0x0000fffff7fab134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab13c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab140:	aa1503e2	mov	x2, x21
   0x0000fffff7fab144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fab148:	aa1403e4	mov	x4, x20
   0x0000fffff7fab14c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab150:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fab154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab15c:	d63f0200	blr	x16
   0x0000fffff7fab160:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab164:	5400c6c0	b.eq	0xfffff7faca3c  // b.none
   0x0000fffff7fab168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab16c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab170:	aa1303e1	mov	x1, x19
   0x0000fffff7fab174:	aa1503e2	mov	x2, x21
   0x0000fffff7fab178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fab17c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab180:	aa1603e5	mov	x5, x22
   0x0000fffff7fab184:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fab188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab18c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab190:	d63f0200	blr	x16
   0x0000fffff7fab194:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab198:	5400c560	b.eq	0xfffff7faca44  // b.none
   0x0000fffff7fab19c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab1a0:	37d806a9	tbnz	w9, #27, 0xfffff7fab274
   0x0000fffff7fab1a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab1a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab1ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab1b4:	540001c1	b.ne	0xfffff7fab1ec  // b.any
   0x0000fffff7fab1b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab1bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab1c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab1c8:	54000121	b.ne	0xfffff7fab1ec  // b.any
   0x0000fffff7fab1cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab1d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fab1d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab1d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab1dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fab1e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab1e8:	14000030	b	0xfffff7fab2a8
   0x0000fffff7fab1ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab1f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab1f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab1fc:	54000120	b.eq	0xfffff7fab220  // b.none
   0x0000fffff7fab200:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab210:	54000321	b.ne	0xfffff7fab274  // b.any
   0x0000fffff7fab214:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab218:	9e620120	scvtf	d0, x9
   0x0000fffff7fab21c:	14000002	b	0xfffff7fab224
   0x0000fffff7fab220:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fab224:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab22c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab230:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab234:	54000120	b.eq	0xfffff7fab258  // b.none
   0x0000fffff7fab238:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab23c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab244:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab248:	54000161	b.ne	0xfffff7fab274  // b.any
   0x0000fffff7fab24c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab250:	9e620121	scvtf	d1, x9
   0x0000fffff7fab254:	14000002	b	0xfffff7fab25c
   0x0000fffff7fab258:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fab25c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab260:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fab264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab26c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab270:	17ffffde	b	0xfffff7fab1e8
   0x0000fffff7fab274:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab27c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab280:	aa1503e2	mov	x2, x21
   0x0000fffff7fab284:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fab288:	aa1403e4	mov	x4, x20
   0x0000fffff7fab28c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab290:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fab294:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab29c:	d63f0200	blr	x16
   0x0000fffff7fab2a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab2a4:	5400bd40	b.eq	0xfffff7faca4c  // b.none
   0x0000fffff7fab2a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab2ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab2b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fab2b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fab2b8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fab2bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fab2c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab2c4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fab2c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab2cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab2d0:	d63f0200	blr	x16
   0x0000fffff7fab2d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab2d8:	5400bbe0	b.eq	0xfffff7faca54  // b.none
   0x0000fffff7fab2dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab2e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab2e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fab2e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fab2ec:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fab2f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fab2f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fab2f8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fab2fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab304:	d63f0200	blr	x16
   0x0000fffff7fab308:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab30c:	5400ba80	b.eq	0xfffff7faca5c  // b.none
   0x0000fffff7fab310:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab314:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab318:	540004a0	b.eq	0xfffff7fab3ac  // b.none
   0x0000fffff7fab31c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab320:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab324:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab328:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab32c:	54000400	b.eq	0xfffff7fab3ac  // b.none
   0x0000fffff7fab330:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab334:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab338:	36d801d1	tbz	w17, #27, 0xfffff7fab370
   0x0000fffff7fab33c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab340:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab344:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab348:	54000321	b.ne	0xfffff7fab3ac  // b.any
   0x0000fffff7fab34c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab350:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab354:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab358:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab35c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab360:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab364:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab368:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab36c:	54000209	b.ls	0xfffff7fab3ac  // b.plast
   0x0000fffff7fab370:	36d8008d	tbz	w13, #27, 0xfffff7fab380
   0x0000fffff7fab374:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab378:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab37c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab380:	36d80091	tbz	w17, #27, 0xfffff7fab390
   0x0000fffff7fab384:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab388:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab38c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab390:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fab394:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fab398:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab39c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab3a0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fab3a4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fab3a8:	1400000e	b	0xfffff7fab3e0
   0x0000fffff7fab3ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab3b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab3b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fab3b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fab3bc:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fab3c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fab3c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fab3c8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fab3cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab3d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab3d4:	d63f0200	blr	x16
   0x0000fffff7fab3d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab3dc:	5400b440	b.eq	0xfffff7faca64  // b.none
   0x0000fffff7fab3e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab3e4:	37d806a9	tbnz	w9, #27, 0xfffff7fab4b8
   0x0000fffff7fab3e8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab3ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab3f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab3f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab3f8:	540001c1	b.ne	0xfffff7fab430  // b.any
   0x0000fffff7fab3fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab400:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab404:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab408:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab40c:	54000121	b.ne	0xfffff7fab430  // b.any
   0x0000fffff7fab410:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab414:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fab418:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab41c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab424:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fab428:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab42c:	14000030	b	0xfffff7fab4ec
   0x0000fffff7fab430:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab434:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab438:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab43c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab440:	54000120	b.eq	0xfffff7fab464  // b.none
   0x0000fffff7fab444:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab448:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab44c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab450:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab454:	54000321	b.ne	0xfffff7fab4b8  // b.any
   0x0000fffff7fab458:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab45c:	9e620120	scvtf	d0, x9
   0x0000fffff7fab460:	14000002	b	0xfffff7fab468
   0x0000fffff7fab464:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fab468:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab46c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab470:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab474:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab478:	54000120	b.eq	0xfffff7fab49c  // b.none
   0x0000fffff7fab47c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab488:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab48c:	54000161	b.ne	0xfffff7fab4b8  // b.any
   0x0000fffff7fab490:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab494:	9e620121	scvtf	d1, x9
   0x0000fffff7fab498:	14000002	b	0xfffff7fab4a0
   0x0000fffff7fab49c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fab4a0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab4a4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fab4a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab4ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab4b0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab4b4:	17ffffde	b	0xfffff7fab42c
   0x0000fffff7fab4b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab4bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab4c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fab4c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fab4c8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fab4cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fab4d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab4d4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fab4d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab4dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab4e0:	d63f0200	blr	x16
   0x0000fffff7fab4e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab4e8:	5400ac20	b.eq	0xfffff7faca6c  // b.none
   0x0000fffff7fab4ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab4f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab4f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fab4f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fab4fc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fab500:	aa1403e4	mov	x4, x20
   0x0000fffff7fab504:	aa1603e5	mov	x5, x22
   0x0000fffff7fab508:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fab50c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab510:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab514:	d63f0200	blr	x16
   0x0000fffff7fab518:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab51c:	5400aac0	b.eq	0xfffff7faca74  // b.none
   0x0000fffff7fab520:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab524:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab528:	aa1303e1	mov	x1, x19
   0x0000fffff7fab52c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab530:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fab534:	aa1403e4	mov	x4, x20
   0x0000fffff7fab538:	aa1603e5	mov	x5, x22
   0x0000fffff7fab53c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fab540:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab544:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab548:	d63f0200	blr	x16
   0x0000fffff7fab54c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab550:	5400a960	b.eq	0xfffff7faca7c  // b.none
   0x0000fffff7fab554:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab558:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab55c:	540004a0	b.eq	0xfffff7fab5f0  // b.none
   0x0000fffff7fab560:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab564:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab568:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab56c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab570:	54000400	b.eq	0xfffff7fab5f0  // b.none
   0x0000fffff7fab574:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab578:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab57c:	36d801d1	tbz	w17, #27, 0xfffff7fab5b4
   0x0000fffff7fab580:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab584:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab588:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab58c:	54000321	b.ne	0xfffff7fab5f0  // b.any
   0x0000fffff7fab590:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab594:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab598:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab59c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab5a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab5a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab5a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab5ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab5b0:	54000209	b.ls	0xfffff7fab5f0  // b.plast
   0x0000fffff7fab5b4:	36d8008d	tbz	w13, #27, 0xfffff7fab5c4
   0x0000fffff7fab5b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab5bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab5c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab5c4:	36d80091	tbz	w17, #27, 0xfffff7fab5d4
   0x0000fffff7fab5c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab5cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab5d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab5d4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fab5d8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fab5dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab5e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab5e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fab5e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fab5ec:	1400000e	b	0xfffff7fab624
   0x0000fffff7fab5f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab5f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab5f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fab5fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fab600:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fab604:	aa1403e4	mov	x4, x20
   0x0000fffff7fab608:	aa1603e5	mov	x5, x22
   0x0000fffff7fab60c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fab610:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab614:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab618:	d63f0200	blr	x16
   0x0000fffff7fab61c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab620:	5400a320	b.eq	0xfffff7faca84  // b.none
   0x0000fffff7fab624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab628:	37d806a9	tbnz	w9, #27, 0xfffff7fab6fc
   0x0000fffff7fab62c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab63c:	540001c1	b.ne	0xfffff7fab674  // b.any
   0x0000fffff7fab640:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab64c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab650:	54000121	b.ne	0xfffff7fab674  // b.any
   0x0000fffff7fab654:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab658:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fab65c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab660:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab668:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fab66c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab670:	14000030	b	0xfffff7fab730
   0x0000fffff7fab674:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab680:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab684:	54000120	b.eq	0xfffff7fab6a8  // b.none
   0x0000fffff7fab688:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab68c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab698:	54000321	b.ne	0xfffff7fab6fc  // b.any
   0x0000fffff7fab69c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab6a0:	9e620120	scvtf	d0, x9
   0x0000fffff7fab6a4:	14000002	b	0xfffff7fab6ac
   0x0000fffff7fab6a8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fab6ac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab6b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab6b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab6bc:	54000120	b.eq	0xfffff7fab6e0  // b.none
   0x0000fffff7fab6c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab6c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab6c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab6d0:	54000161	b.ne	0xfffff7fab6fc  // b.any
   0x0000fffff7fab6d4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab6d8:	9e620121	scvtf	d1, x9
   0x0000fffff7fab6dc:	14000002	b	0xfffff7fab6e4
   0x0000fffff7fab6e0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fab6e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab6e8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fab6ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab6f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6f4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab6f8:	17ffffde	b	0xfffff7fab670
   0x0000fffff7fab6fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab700:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab704:	aa1303e1	mov	x1, x19
   0x0000fffff7fab708:	aa1503e2	mov	x2, x21
   0x0000fffff7fab70c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fab710:	aa1403e4	mov	x4, x20
   0x0000fffff7fab714:	aa1603e5	mov	x5, x22
   0x0000fffff7fab718:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fab71c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab720:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab724:	d63f0200	blr	x16
   0x0000fffff7fab728:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab72c:	54009b00	b.eq	0xfffff7faca8c  // b.none
   0x0000fffff7fab730:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab734:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab738:	aa1303e1	mov	x1, x19
   0x0000fffff7fab73c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab740:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fab744:	aa1403e4	mov	x4, x20
   0x0000fffff7fab748:	aa1603e5	mov	x5, x22
   0x0000fffff7fab74c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fab750:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab754:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab758:	d63f0200	blr	x16
   0x0000fffff7fab75c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab760:	540099a0	b.eq	0xfffff7faca94  // b.none
   0x0000fffff7fab764:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab768:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab76c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab770:	aa1503e2	mov	x2, x21
   0x0000fffff7fab774:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fab778:	aa1403e4	mov	x4, x20
   0x0000fffff7fab77c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab780:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fab784:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab788:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab78c:	d63f0200	blr	x16
   0x0000fffff7fab790:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab794:	54009840	b.eq	0xfffff7faca9c  // b.none
   0x0000fffff7fab798:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab79c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab7a0:	540004a0	b.eq	0xfffff7fab834  // b.none
   0x0000fffff7fab7a4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab7a8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab7ac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab7b0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab7b4:	54000400	b.eq	0xfffff7fab834  // b.none
   0x0000fffff7fab7b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab7bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab7c0:	36d801d1	tbz	w17, #27, 0xfffff7fab7f8
   0x0000fffff7fab7c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab7c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab7cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab7d0:	54000321	b.ne	0xfffff7fab834  // b.any
   0x0000fffff7fab7d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab7d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab7dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab7e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab7e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab7e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab7ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab7f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab7f4:	54000209	b.ls	0xfffff7fab834  // b.plast
   0x0000fffff7fab7f8:	36d8008d	tbz	w13, #27, 0xfffff7fab808
   0x0000fffff7fab7fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab800:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab804:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab808:	36d80091	tbz	w17, #27, 0xfffff7fab818
   0x0000fffff7fab80c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab810:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab814:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab818:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fab81c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fab820:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab824:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab828:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fab82c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fab830:	1400000e	b	0xfffff7fab868
   0x0000fffff7fab834:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab838:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab83c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab840:	aa1503e2	mov	x2, x21
   0x0000fffff7fab844:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fab848:	aa1403e4	mov	x4, x20
   0x0000fffff7fab84c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab850:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fab854:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab858:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab85c:	d63f0200	blr	x16
   0x0000fffff7fab860:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab864:	54009200	b.eq	0xfffff7facaa4  // b.none
   0x0000fffff7fab868:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab86c:	37d806a9	tbnz	w9, #27, 0xfffff7fab940
   0x0000fffff7fab870:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab874:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab878:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab87c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab880:	540001c1	b.ne	0xfffff7fab8b8  // b.any
   0x0000fffff7fab884:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab88c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab890:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab894:	54000121	b.ne	0xfffff7fab8b8  // b.any
   0x0000fffff7fab898:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab89c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fab8a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab8a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab8a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8ac:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fab8b0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab8b4:	14000030	b	0xfffff7fab974
   0x0000fffff7fab8b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab8bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab8c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab8c8:	54000120	b.eq	0xfffff7fab8ec  // b.none
   0x0000fffff7fab8cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab8d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab8d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab8dc:	54000321	b.ne	0xfffff7fab940  // b.any
   0x0000fffff7fab8e0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab8e4:	9e620120	scvtf	d0, x9
   0x0000fffff7fab8e8:	14000002	b	0xfffff7fab8f0
   0x0000fffff7fab8ec:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fab8f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab8f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab900:	54000120	b.eq	0xfffff7fab924  // b.none
   0x0000fffff7fab904:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab90c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab914:	54000161	b.ne	0xfffff7fab940  // b.any
   0x0000fffff7fab918:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab91c:	9e620121	scvtf	d1, x9
   0x0000fffff7fab920:	14000002	b	0xfffff7fab928
   0x0000fffff7fab924:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fab928:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab92c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fab930:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab938:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab93c:	17ffffde	b	0xfffff7fab8b4
   0x0000fffff7fab940:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab944:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab948:	aa1303e1	mov	x1, x19
   0x0000fffff7fab94c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab950:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fab954:	aa1403e4	mov	x4, x20
   0x0000fffff7fab958:	aa1603e5	mov	x5, x22
   0x0000fffff7fab95c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fab960:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab964:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab968:	d63f0200	blr	x16
   0x0000fffff7fab96c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab970:	540089e0	b.eq	0xfffff7facaac  // b.none
   0x0000fffff7fab974:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab978:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab97c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab980:	aa1503e2	mov	x2, x21
   0x0000fffff7fab984:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fab988:	aa1403e4	mov	x4, x20
   0x0000fffff7fab98c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab990:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fab994:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab998:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab99c:	d63f0200	blr	x16
   0x0000fffff7fab9a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab9a4:	54008880	b.eq	0xfffff7facab4  // b.none
   0x0000fffff7fab9a8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab9ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab9b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fab9b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fab9b8:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fab9bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fab9c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab9c4:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fab9c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab9cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab9d0:	d63f0200	blr	x16
   0x0000fffff7fab9d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab9d8:	54008720	b.eq	0xfffff7facabc  // b.none
   0x0000fffff7fab9dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab9e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab9e4:	540004a0	b.eq	0xfffff7faba78  // b.none
   0x0000fffff7fab9e8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab9ec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab9f0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab9f4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab9f8:	54000400	b.eq	0xfffff7faba78  // b.none
   0x0000fffff7fab9fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faba00:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faba04:	36d801d1	tbz	w17, #27, 0xfffff7faba3c
   0x0000fffff7faba08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faba0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faba10:	f100013f	cmp	x9, #0x0
   0x0000fffff7faba14:	54000321	b.ne	0xfffff7faba78  // b.any
   0x0000fffff7faba18:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faba1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faba20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faba24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faba28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faba2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faba30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faba34:	f100055f	cmp	x10, #0x1
   0x0000fffff7faba38:	54000209	b.ls	0xfffff7faba78  // b.plast
   0x0000fffff7faba3c:	36d8008d	tbz	w13, #27, 0xfffff7faba4c
   0x0000fffff7faba40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faba44:	91000529	add	x9, x9, #0x1
   0x0000fffff7faba48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faba4c:	36d80091	tbz	w17, #27, 0xfffff7faba5c
   0x0000fffff7faba50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faba54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faba58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faba5c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faba60:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faba64:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faba68:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faba6c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faba70:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faba74:	1400000e	b	0xfffff7fabaac
   0x0000fffff7faba78:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faba7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faba80:	aa1303e1	mov	x1, x19
   0x0000fffff7faba84:	aa1503e2	mov	x2, x21
   0x0000fffff7faba88:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7faba8c:	aa1403e4	mov	x4, x20
   0x0000fffff7faba90:	aa1603e5	mov	x5, x22
   0x0000fffff7faba94:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faba98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faba9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabaa0:	d63f0200	blr	x16
   0x0000fffff7fabaa4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabaa8:	540080e0	b.eq	0xfffff7facac4  // b.none
   0x0000fffff7fabaac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabab0:	37d806a9	tbnz	w9, #27, 0xfffff7fabb84
   0x0000fffff7fabab4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fababc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabac4:	540001c1	b.ne	0xfffff7fabafc  // b.any
   0x0000fffff7fabac8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabacc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabad8:	54000121	b.ne	0xfffff7fabafc  // b.any
   0x0000fffff7fabadc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fabae0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fabae4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fabae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabaec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabaf0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fabaf4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fabaf8:	14000030	b	0xfffff7fabbb8
   0x0000fffff7fabafc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabb00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabb04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb0c:	54000120	b.eq	0xfffff7fabb30  // b.none
   0x0000fffff7fabb10:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabb14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabb18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb20:	54000321	b.ne	0xfffff7fabb84  // b.any
   0x0000fffff7fabb24:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fabb28:	9e620120	scvtf	d0, x9
   0x0000fffff7fabb2c:	14000002	b	0xfffff7fabb34
   0x0000fffff7fabb30:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fabb34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabb38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabb3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb44:	54000120	b.eq	0xfffff7fabb68  // b.none
   0x0000fffff7fabb48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabb4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabb50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb58:	54000161	b.ne	0xfffff7fabb84  // b.any
   0x0000fffff7fabb5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fabb60:	9e620121	scvtf	d1, x9
   0x0000fffff7fabb64:	14000002	b	0xfffff7fabb6c
   0x0000fffff7fabb68:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fabb6c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fabb70:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fabb74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabb78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fabb80:	17ffffde	b	0xfffff7fabaf8
   0x0000fffff7fabb84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabb88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabb8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fabb90:	aa1503e2	mov	x2, x21
   0x0000fffff7fabb94:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fabb98:	aa1403e4	mov	x4, x20
   0x0000fffff7fabb9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fabba0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fabba4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabba8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabbac:	d63f0200	blr	x16
   0x0000fffff7fabbb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabbb4:	540078c0	b.eq	0xfffff7facacc  // b.none
   0x0000fffff7fabbb8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabbbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabbc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fabbc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fabbc8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fabbcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fabbd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fabbd4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fabbd8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabbdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabbe0:	d63f0200	blr	x16
   0x0000fffff7fabbe4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabbe8:	54007760	b.eq	0xfffff7facad4  // b.none
   0x0000fffff7fabbec:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fabbf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabbf4:	aa1303e1	mov	x1, x19
   0x0000fffff7fabbf8:	aa1503e2	mov	x2, x21
   0x0000fffff7fabbfc:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fabc00:	aa1403e4	mov	x4, x20
   0x0000fffff7fabc04:	aa1603e5	mov	x5, x22
   0x0000fffff7fabc08:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fabc0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabc10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabc14:	d63f0200	blr	x16
   0x0000fffff7fabc18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabc1c:	54007600	b.eq	0xfffff7facadc  // b.none
   0x0000fffff7fabc20:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fabc24:	f100017f	cmp	x11, #0x0
   0x0000fffff7fabc28:	540004a0	b.eq	0xfffff7fabcbc  // b.none
   0x0000fffff7fabc2c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fabc30:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fabc34:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fabc38:	eb0901bf	cmp	x13, x9
   0x0000fffff7fabc3c:	54000400	b.eq	0xfffff7fabcbc  // b.none
   0x0000fffff7fabc40:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fabc44:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fabc48:	36d801d1	tbz	w17, #27, 0xfffff7fabc80
   0x0000fffff7fabc4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fabc50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fabc54:	f100013f	cmp	x9, #0x0
   0x0000fffff7fabc58:	54000321	b.ne	0xfffff7fabcbc  // b.any
   0x0000fffff7fabc5c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fabc60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabc64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fabc68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fabc6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fabc70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fabc74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fabc78:	f100055f	cmp	x10, #0x1
   0x0000fffff7fabc7c:	54000209	b.ls	0xfffff7fabcbc  // b.plast
   0x0000fffff7fabc80:	36d8008d	tbz	w13, #27, 0xfffff7fabc90
   0x0000fffff7fabc84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fabc88:	91000529	add	x9, x9, #0x1
   0x0000fffff7fabc8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fabc90:	36d80091	tbz	w17, #27, 0xfffff7fabca0
   0x0000fffff7fabc94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabc98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fabc9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fabca0:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fabca4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fabca8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fabcac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fabcb0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fabcb4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fabcb8:	1400000e	b	0xfffff7fabcf0
   0x0000fffff7fabcbc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fabcc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabcc4:	aa1303e1	mov	x1, x19
   0x0000fffff7fabcc8:	aa1503e2	mov	x2, x21
   0x0000fffff7fabccc:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fabcd0:	aa1403e4	mov	x4, x20
   0x0000fffff7fabcd4:	aa1603e5	mov	x5, x22
   0x0000fffff7fabcd8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fabcdc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabce0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabce4:	d63f0200	blr	x16
   0x0000fffff7fabce8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabcec:	54006fc0	b.eq	0xfffff7facae4  // b.none
   0x0000fffff7fabcf0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabcf4:	37d806a9	tbnz	w9, #27, 0xfffff7fabdc8
   0x0000fffff7fabcf8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabcfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabd00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd08:	540001c1	b.ne	0xfffff7fabd40  // b.any
   0x0000fffff7fabd0c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabd10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabd14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd18:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd1c:	54000121	b.ne	0xfffff7fabd40  // b.any
   0x0000fffff7fabd20:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fabd24:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fabd28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fabd2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabd30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd34:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fabd38:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fabd3c:	14000030	b	0xfffff7fabdfc
   0x0000fffff7fabd40:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabd44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabd48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd50:	54000120	b.eq	0xfffff7fabd74  // b.none
   0x0000fffff7fabd54:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabd58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabd5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd64:	54000321	b.ne	0xfffff7fabdc8  // b.any
   0x0000fffff7fabd68:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fabd6c:	9e620120	scvtf	d0, x9
   0x0000fffff7fabd70:	14000002	b	0xfffff7fabd78
   0x0000fffff7fabd74:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fabd78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabd7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabd80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd88:	54000120	b.eq	0xfffff7fabdac  // b.none
   0x0000fffff7fabd8c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabd90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabd94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabd98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabd9c:	54000161	b.ne	0xfffff7fabdc8  // b.any
   0x0000fffff7fabda0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fabda4:	9e620121	scvtf	d1, x9
   0x0000fffff7fabda8:	14000002	b	0xfffff7fabdb0
   0x0000fffff7fabdac:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fabdb0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fabdb4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fabdb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabdbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabdc0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fabdc4:	17ffffde	b	0xfffff7fabd3c
   0x0000fffff7fabdc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabdcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabdd0:	aa1303e1	mov	x1, x19
   0x0000fffff7fabdd4:	aa1503e2	mov	x2, x21
   0x0000fffff7fabdd8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fabddc:	aa1403e4	mov	x4, x20
   0x0000fffff7fabde0:	aa1603e5	mov	x5, x22
   0x0000fffff7fabde4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fabde8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabdec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabdf0:	d63f0200	blr	x16
   0x0000fffff7fabdf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabdf8:	540067a0	b.eq	0xfffff7facaec  // b.none
   0x0000fffff7fabdfc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabe00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabe04:	aa1303e1	mov	x1, x19
   0x0000fffff7fabe08:	aa1503e2	mov	x2, x21
   0x0000fffff7fabe0c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fabe10:	aa1403e4	mov	x4, x20
   0x0000fffff7fabe14:	aa1603e5	mov	x5, x22
   0x0000fffff7fabe18:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fabe1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabe20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabe24:	d63f0200	blr	x16
   0x0000fffff7fabe28:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabe2c:	54006640	b.eq	0xfffff7facaf4  // b.none
   0x0000fffff7fabe30:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fabe34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabe38:	aa1303e1	mov	x1, x19
   0x0000fffff7fabe3c:	aa1503e2	mov	x2, x21
   0x0000fffff7fabe40:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fabe44:	aa1403e4	mov	x4, x20
   0x0000fffff7fabe48:	aa1603e5	mov	x5, x22
   0x0000fffff7fabe4c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fabe50:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabe54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabe58:	d63f0200	blr	x16
   0x0000fffff7fabe5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabe60:	540064e0	b.eq	0xfffff7facafc  // b.none
   0x0000fffff7fabe64:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fabe68:	f100017f	cmp	x11, #0x0
   0x0000fffff7fabe6c:	540004a0	b.eq	0xfffff7fabf00  // b.none
   0x0000fffff7fabe70:	b940016d	ldr	w13, [x11]
   0x0000fffff7fabe74:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fabe78:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fabe7c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fabe80:	54000400	b.eq	0xfffff7fabf00  // b.none
   0x0000fffff7fabe84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fabe88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fabe8c:	36d801d1	tbz	w17, #27, 0xfffff7fabec4
   0x0000fffff7fabe90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fabe94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fabe98:	f100013f	cmp	x9, #0x0
   0x0000fffff7fabe9c:	54000321	b.ne	0xfffff7fabf00  // b.any
   0x0000fffff7fabea0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fabea4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabea8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fabeac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fabeb0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fabeb4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fabeb8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fabebc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fabec0:	54000209	b.ls	0xfffff7fabf00  // b.plast
   0x0000fffff7fabec4:	36d8008d	tbz	w13, #27, 0xfffff7fabed4
   0x0000fffff7fabec8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fabecc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fabed0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fabed4:	36d80091	tbz	w17, #27, 0xfffff7fabee4
   0x0000fffff7fabed8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabedc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fabee0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fabee4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fabee8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fabeec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fabef0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fabef4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fabef8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fabefc:	1400000e	b	0xfffff7fabf34
   0x0000fffff7fabf00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fabf04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabf08:	aa1303e1	mov	x1, x19
   0x0000fffff7fabf0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fabf10:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fabf14:	aa1403e4	mov	x4, x20
   0x0000fffff7fabf18:	aa1603e5	mov	x5, x22
   0x0000fffff7fabf1c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fabf20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabf24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabf28:	d63f0200	blr	x16
   0x0000fffff7fabf2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabf30:	54005ea0	b.eq	0xfffff7facb04  // b.none
   0x0000fffff7fabf34:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabf38:	37d806a9	tbnz	w9, #27, 0xfffff7fac00c
   0x0000fffff7fabf3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabf40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabf44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabf48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabf4c:	540001c1	b.ne	0xfffff7fabf84  // b.any
   0x0000fffff7fabf50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabf54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabf58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabf5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabf60:	54000121	b.ne	0xfffff7fabf84  // b.any
   0x0000fffff7fabf64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fabf68:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fabf6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fabf70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabf74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabf78:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fabf7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fabf80:	14000030	b	0xfffff7fac040
   0x0000fffff7fabf84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabf88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabf8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabf90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabf94:	54000120	b.eq	0xfffff7fabfb8  // b.none
   0x0000fffff7fabf98:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabf9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabfa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabfa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabfa8:	54000321	b.ne	0xfffff7fac00c  // b.any
   0x0000fffff7fabfac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fabfb0:	9e620120	scvtf	d0, x9
   0x0000fffff7fabfb4:	14000002	b	0xfffff7fabfbc
   0x0000fffff7fabfb8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fabfbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabfc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabfc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabfc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabfcc:	54000120	b.eq	0xfffff7fabff0  // b.none
   0x0000fffff7fabfd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabfd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabfd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabfdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabfe0:	54000161	b.ne	0xfffff7fac00c  // b.any
   0x0000fffff7fabfe4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fabfe8:	9e620121	scvtf	d1, x9
   0x0000fffff7fabfec:	14000002	b	0xfffff7fabff4
   0x0000fffff7fabff0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fabff4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fabff8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fabffc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac004:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac008:	17ffffde	b	0xfffff7fabf80
   0x0000fffff7fac00c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac010:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac014:	aa1303e1	mov	x1, x19
   0x0000fffff7fac018:	aa1503e2	mov	x2, x21
   0x0000fffff7fac01c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fac020:	aa1403e4	mov	x4, x20
   0x0000fffff7fac024:	aa1603e5	mov	x5, x22
   0x0000fffff7fac028:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fac02c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac030:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac034:	d63f0200	blr	x16
   0x0000fffff7fac038:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac03c:	54005680	b.eq	0xfffff7facb0c  // b.none
   0x0000fffff7fac040:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac044:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac048:	aa1303e1	mov	x1, x19
   0x0000fffff7fac04c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac050:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fac054:	aa1403e4	mov	x4, x20
   0x0000fffff7fac058:	aa1603e5	mov	x5, x22
   0x0000fffff7fac05c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fac060:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac064:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac068:	d63f0200	blr	x16
   0x0000fffff7fac06c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac070:	54005520	b.eq	0xfffff7facb14  // b.none
   0x0000fffff7fac074:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac078:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac07c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac080:	aa1503e2	mov	x2, x21
   0x0000fffff7fac084:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fac088:	aa1403e4	mov	x4, x20
   0x0000fffff7fac08c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac090:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fac094:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac098:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac09c:	d63f0200	blr	x16
   0x0000fffff7fac0a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac0a4:	540053c0	b.eq	0xfffff7facb1c  // b.none
   0x0000fffff7fac0a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac0ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac0b0:	540004a0	b.eq	0xfffff7fac144  // b.none
   0x0000fffff7fac0b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac0b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac0bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac0c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac0c4:	54000400	b.eq	0xfffff7fac144  // b.none
   0x0000fffff7fac0c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac0cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac0d0:	36d801d1	tbz	w17, #27, 0xfffff7fac108
   0x0000fffff7fac0d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac0d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac0dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac0e0:	54000321	b.ne	0xfffff7fac144  // b.any
   0x0000fffff7fac0e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac0e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac0ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac0f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac0f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac0f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac0fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac100:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac104:	54000209	b.ls	0xfffff7fac144  // b.plast
   0x0000fffff7fac108:	36d8008d	tbz	w13, #27, 0xfffff7fac118
   0x0000fffff7fac10c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac110:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac114:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac118:	36d80091	tbz	w17, #27, 0xfffff7fac128
   0x0000fffff7fac11c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac120:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac124:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac128:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fac12c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fac130:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac134:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac138:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fac13c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fac140:	1400000e	b	0xfffff7fac178
   0x0000fffff7fac144:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac14c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac150:	aa1503e2	mov	x2, x21
   0x0000fffff7fac154:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fac158:	aa1403e4	mov	x4, x20
   0x0000fffff7fac15c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac160:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fac164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac16c:	d63f0200	blr	x16
   0x0000fffff7fac170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac174:	54004d80	b.eq	0xfffff7facb24  // b.none
   0x0000fffff7fac178:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac17c:	37d806a9	tbnz	w9, #27, 0xfffff7fac250
   0x0000fffff7fac180:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac18c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac190:	540001c1	b.ne	0xfffff7fac1c8  // b.any
   0x0000fffff7fac194:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1a4:	54000121	b.ne	0xfffff7fac1c8  // b.any
   0x0000fffff7fac1a8:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac1ac:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fac1b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac1b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac1b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1bc:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fac1c0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac1c4:	14000030	b	0xfffff7fac284
   0x0000fffff7fac1c8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac1cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac1d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1d8:	54000120	b.eq	0xfffff7fac1fc  // b.none
   0x0000fffff7fac1dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac1e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac1e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac1e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac1ec:	54000321	b.ne	0xfffff7fac250  // b.any
   0x0000fffff7fac1f0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac1f4:	9e620120	scvtf	d0, x9
   0x0000fffff7fac1f8:	14000002	b	0xfffff7fac200
   0x0000fffff7fac1fc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fac200:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac210:	54000120	b.eq	0xfffff7fac234  // b.none
   0x0000fffff7fac214:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac21c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac220:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac224:	54000161	b.ne	0xfffff7fac250  // b.any
   0x0000fffff7fac228:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac22c:	9e620121	scvtf	d1, x9
   0x0000fffff7fac230:	14000002	b	0xfffff7fac238
   0x0000fffff7fac234:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fac238:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac23c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fac240:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac248:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac24c:	17ffffde	b	0xfffff7fac1c4
   0x0000fffff7fac250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac258:	aa1303e1	mov	x1, x19
   0x0000fffff7fac25c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac260:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fac264:	aa1403e4	mov	x4, x20
   0x0000fffff7fac268:	aa1603e5	mov	x5, x22
   0x0000fffff7fac26c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fac270:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac278:	d63f0200	blr	x16
   0x0000fffff7fac27c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac280:	54004560	b.eq	0xfffff7facb2c  // b.none
   0x0000fffff7fac284:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac288:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac28c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac290:	aa1503e2	mov	x2, x21
   0x0000fffff7fac294:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fac298:	aa1403e4	mov	x4, x20
   0x0000fffff7fac29c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac2a0:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fac2a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac2a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac2ac:	d63f0200	blr	x16
   0x0000fffff7fac2b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac2b4:	54004400	b.eq	0xfffff7facb34  // b.none
   0x0000fffff7fac2b8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac2bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac2c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fac2c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fac2c8:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fac2cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fac2d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac2d4:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fac2d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac2dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac2e0:	d63f0200	blr	x16
   0x0000fffff7fac2e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac2e8:	540042a0	b.eq	0xfffff7facb3c  // b.none
   0x0000fffff7fac2ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac2f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac2f4:	540004a0	b.eq	0xfffff7fac388  // b.none
   0x0000fffff7fac2f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac2fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac300:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac304:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac308:	54000400	b.eq	0xfffff7fac388  // b.none
   0x0000fffff7fac30c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac310:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac314:	36d801d1	tbz	w17, #27, 0xfffff7fac34c
   0x0000fffff7fac318:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac31c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac320:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac324:	54000321	b.ne	0xfffff7fac388  // b.any
   0x0000fffff7fac328:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac32c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac330:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac334:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac338:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac33c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac340:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac344:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac348:	54000209	b.ls	0xfffff7fac388  // b.plast
   0x0000fffff7fac34c:	36d8008d	tbz	w13, #27, 0xfffff7fac35c
   0x0000fffff7fac350:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac354:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac358:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac35c:	36d80091	tbz	w17, #27, 0xfffff7fac36c
   0x0000fffff7fac360:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac364:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac368:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac36c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fac370:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fac374:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac378:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac37c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fac380:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fac384:	1400000e	b	0xfffff7fac3bc
   0x0000fffff7fac388:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac38c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac390:	aa1303e1	mov	x1, x19
   0x0000fffff7fac394:	aa1503e2	mov	x2, x21
   0x0000fffff7fac398:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fac39c:	aa1403e4	mov	x4, x20
   0x0000fffff7fac3a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac3a4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fac3a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac3ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac3b0:	d63f0200	blr	x16
   0x0000fffff7fac3b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac3b8:	54003c60	b.eq	0xfffff7facb44  // b.none
   0x0000fffff7fac3bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac3c0:	37d806a9	tbnz	w9, #27, 0xfffff7fac494
   0x0000fffff7fac3c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac3c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac3cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac3d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac3d4:	540001c1	b.ne	0xfffff7fac40c  // b.any
   0x0000fffff7fac3d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac3dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac3e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac3e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac3e8:	54000121	b.ne	0xfffff7fac40c  // b.any
   0x0000fffff7fac3ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac3f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fac3f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac3f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac3fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac400:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fac404:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac408:	14000030	b	0xfffff7fac4c8
   0x0000fffff7fac40c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac410:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac418:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac41c:	54000120	b.eq	0xfffff7fac440  // b.none
   0x0000fffff7fac420:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac424:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac42c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac430:	54000321	b.ne	0xfffff7fac494  // b.any
   0x0000fffff7fac434:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac438:	9e620120	scvtf	d0, x9
   0x0000fffff7fac43c:	14000002	b	0xfffff7fac444
   0x0000fffff7fac440:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fac444:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac448:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac44c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac450:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac454:	54000120	b.eq	0xfffff7fac478  // b.none
   0x0000fffff7fac458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac45c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac464:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac468:	54000161	b.ne	0xfffff7fac494  // b.any
   0x0000fffff7fac46c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac470:	9e620121	scvtf	d1, x9
   0x0000fffff7fac474:	14000002	b	0xfffff7fac47c
   0x0000fffff7fac478:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fac47c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac480:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fac484:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac488:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac48c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac490:	17ffffde	b	0xfffff7fac408
   0x0000fffff7fac494:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac49c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac4a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fac4a4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fac4a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fac4ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fac4b0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fac4b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac4b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac4bc:	d63f0200	blr	x16
   0x0000fffff7fac4c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac4c4:	54003440	b.eq	0xfffff7facb4c  // b.none
   0x0000fffff7fac4c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac4cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac4d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fac4d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fac4d8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fac4dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fac4e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac4e4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fac4e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac4ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac4f0:	d63f0200	blr	x16
   0x0000fffff7fac4f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac4f8:	540032e0	b.eq	0xfffff7facb54  // b.none
   0x0000fffff7fac4fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac504:	aa1303e1	mov	x1, x19
   0x0000fffff7fac508:	aa1503e2	mov	x2, x21
   0x0000fffff7fac50c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fac510:	aa1403e4	mov	x4, x20
   0x0000fffff7fac514:	aa1603e5	mov	x5, x22
   0x0000fffff7fac518:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fac51c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac524:	d63f0200	blr	x16
   0x0000fffff7fac528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac52c:	54003180	b.eq	0xfffff7facb5c  // b.none
   0x0000fffff7fac530:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac534:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac538:	540004a0	b.eq	0xfffff7fac5cc  // b.none
   0x0000fffff7fac53c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac540:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac544:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac548:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac54c:	54000400	b.eq	0xfffff7fac5cc  // b.none
   0x0000fffff7fac550:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac554:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac558:	36d801d1	tbz	w17, #27, 0xfffff7fac590
   0x0000fffff7fac55c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac560:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac564:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac568:	54000321	b.ne	0xfffff7fac5cc  // b.any
   0x0000fffff7fac56c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac570:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac574:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac578:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac57c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac580:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac584:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac588:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac58c:	54000209	b.ls	0xfffff7fac5cc  // b.plast
   0x0000fffff7fac590:	36d8008d	tbz	w13, #27, 0xfffff7fac5a0
   0x0000fffff7fac594:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac598:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac59c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac5a0:	36d80091	tbz	w17, #27, 0xfffff7fac5b0
   0x0000fffff7fac5a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac5a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac5ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac5b0:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fac5b4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fac5b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac5bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac5c0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fac5c4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fac5c8:	1400000e	b	0xfffff7fac600
   0x0000fffff7fac5cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac5d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac5d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fac5d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fac5dc:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fac5e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fac5e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fac5e8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fac5ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac5f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac5f4:	d63f0200	blr	x16
   0x0000fffff7fac5f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac5fc:	54002b40	b.eq	0xfffff7facb64  // b.none
   0x0000fffff7fac600:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac604:	37d806a9	tbnz	w9, #27, 0xfffff7fac6d8
   0x0000fffff7fac608:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac60c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac614:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac618:	540001c1	b.ne	0xfffff7fac650  // b.any
   0x0000fffff7fac61c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac62c:	54000121	b.ne	0xfffff7fac650  // b.any
   0x0000fffff7fac630:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac634:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fac638:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac644:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fac648:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac64c:	14000030	b	0xfffff7fac70c
   0x0000fffff7fac650:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac654:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac65c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac660:	54000120	b.eq	0xfffff7fac684  // b.none
   0x0000fffff7fac664:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac66c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac674:	54000321	b.ne	0xfffff7fac6d8  // b.any
   0x0000fffff7fac678:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac67c:	9e620120	scvtf	d0, x9
   0x0000fffff7fac680:	14000002	b	0xfffff7fac688
   0x0000fffff7fac684:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fac688:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac68c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac698:	54000120	b.eq	0xfffff7fac6bc  // b.none
   0x0000fffff7fac69c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac6a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac6a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac6a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac6ac:	54000161	b.ne	0xfffff7fac6d8  // b.any
   0x0000fffff7fac6b0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac6b4:	9e620121	scvtf	d1, x9
   0x0000fffff7fac6b8:	14000002	b	0xfffff7fac6c0
   0x0000fffff7fac6bc:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fac6c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac6c4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fac6c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac6cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac6d0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac6d4:	17ffffde	b	0xfffff7fac64c
   0x0000fffff7fac6d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac6dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac6e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fac6e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fac6e8:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fac6ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fac6f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac6f4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fac6f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac6fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac700:	d63f0200	blr	x16
   0x0000fffff7fac704:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac708:	54002320	b.eq	0xfffff7facb6c  // b.none
   0x0000fffff7fac70c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac710:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac714:	aa1303e1	mov	x1, x19
   0x0000fffff7fac718:	aa1503e2	mov	x2, x21
   0x0000fffff7fac71c:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fac720:	aa1403e4	mov	x4, x20
   0x0000fffff7fac724:	aa1603e5	mov	x5, x22
   0x0000fffff7fac728:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fac72c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac730:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac734:	d63f0200	blr	x16
   0x0000fffff7fac738:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac73c:	540021c0	b.eq	0xfffff7facb74  // b.none
   0x0000fffff7fac740:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac744:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac748:	aa1303e1	mov	x1, x19
   0x0000fffff7fac74c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac750:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fac754:	aa1403e4	mov	x4, x20
   0x0000fffff7fac758:	aa1603e5	mov	x5, x22
   0x0000fffff7fac75c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fac760:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac764:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac768:	d63f0200	blr	x16
   0x0000fffff7fac76c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac770:	54002060	b.eq	0xfffff7facb7c  // b.none
   0x0000fffff7fac774:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fac778:	f100017f	cmp	x11, #0x0
   0x0000fffff7fac77c:	540004a0	b.eq	0xfffff7fac810  // b.none
   0x0000fffff7fac780:	b940016d	ldr	w13, [x11]
   0x0000fffff7fac784:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fac788:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fac78c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fac790:	54000400	b.eq	0xfffff7fac810  // b.none
   0x0000fffff7fac794:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fac798:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fac79c:	36d801d1	tbz	w17, #27, 0xfffff7fac7d4
   0x0000fffff7fac7a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fac7a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fac7a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fac7ac:	54000321	b.ne	0xfffff7fac810  // b.any
   0x0000fffff7fac7b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fac7b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac7b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fac7bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fac7c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fac7c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fac7c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fac7cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fac7d0:	54000209	b.ls	0xfffff7fac810  // b.plast
   0x0000fffff7fac7d4:	36d8008d	tbz	w13, #27, 0xfffff7fac7e4
   0x0000fffff7fac7d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fac7dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fac7e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fac7e4:	36d80091	tbz	w17, #27, 0xfffff7fac7f4
   0x0000fffff7fac7e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fac7ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fac7f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fac7f4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fac7f8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fac7fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fac800:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fac804:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fac808:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fac80c:	1400000e	b	0xfffff7fac844
   0x0000fffff7fac810:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fac814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac818:	aa1303e1	mov	x1, x19
   0x0000fffff7fac81c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac820:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fac824:	aa1403e4	mov	x4, x20
   0x0000fffff7fac828:	aa1603e5	mov	x5, x22
   0x0000fffff7fac82c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fac830:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac838:	d63f0200	blr	x16
   0x0000fffff7fac83c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac840:	54001a20	b.eq	0xfffff7facb84  // b.none
   0x0000fffff7fac844:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac848:	37d806a9	tbnz	w9, #27, 0xfffff7fac91c
   0x0000fffff7fac84c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac850:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac858:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac85c:	540001c1	b.ne	0xfffff7fac894  // b.any
   0x0000fffff7fac860:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac86c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac870:	54000121	b.ne	0xfffff7fac894  // b.any
   0x0000fffff7fac874:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac878:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fac87c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fac880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac888:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fac88c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac890:	14000030	b	0xfffff7fac950
   0x0000fffff7fac894:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac898:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac89c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8a4:	54000120	b.eq	0xfffff7fac8c8  // b.none
   0x0000fffff7fac8a8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fac8ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac8b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8b8:	54000321	b.ne	0xfffff7fac91c  // b.any
   0x0000fffff7fac8bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fac8c0:	9e620120	scvtf	d0, x9
   0x0000fffff7fac8c4:	14000002	b	0xfffff7fac8cc
   0x0000fffff7fac8c8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fac8cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac8d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac8d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8dc:	54000120	b.eq	0xfffff7fac900  // b.none
   0x0000fffff7fac8e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fac8e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fac8e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac8ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fac8f0:	54000161	b.ne	0xfffff7fac91c  // b.any
   0x0000fffff7fac8f4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fac8f8:	9e620121	scvtf	d1, x9
   0x0000fffff7fac8fc:	14000002	b	0xfffff7fac904
   0x0000fffff7fac900:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fac904:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fac908:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fac90c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fac910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fac914:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fac918:	17ffffde	b	0xfffff7fac890
   0x0000fffff7fac91c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac920:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac924:	aa1303e1	mov	x1, x19
   0x0000fffff7fac928:	aa1503e2	mov	x2, x21
   0x0000fffff7fac92c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fac930:	aa1403e4	mov	x4, x20
   0x0000fffff7fac934:	aa1603e5	mov	x5, x22
   0x0000fffff7fac938:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fac93c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac940:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac944:	d63f0200	blr	x16
   0x0000fffff7fac948:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac94c:	54001200	b.eq	0xfffff7facb8c  // b.none
   0x0000fffff7fac950:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac954:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac958:	aa1303e1	mov	x1, x19
   0x0000fffff7fac95c:	aa1503e2	mov	x2, x21
   0x0000fffff7fac960:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fac964:	aa1403e4	mov	x4, x20
   0x0000fffff7fac968:	aa1603e5	mov	x5, x22
   0x0000fffff7fac96c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fac970:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac974:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac978:	d63f0200	blr	x16
   0x0000fffff7fac97c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac980:	540010a0	b.eq	0xfffff7facb94  // b.none
   0x0000fffff7fac984:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fac988:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac98c:	aa1303e1	mov	x1, x19
   0x0000fffff7fac990:	aa1503e2	mov	x2, x21
   0x0000fffff7fac994:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fac998:	aa1403e4	mov	x4, x20
   0x0000fffff7fac99c:	aa1603e5	mov	x5, x22
   0x0000fffff7fac9a0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fac9a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fac9a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac9ac:	d63f0200	blr	x16
   0x0000fffff7fac9b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fac9b4:	54000f40	b.eq	0xfffff7facb9c  // b.none
   0x0000fffff7fac9b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fac9bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fac9c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fac9c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fac9c8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fac9cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fac9d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fac9d4:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fac9d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fac9dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fac9e0:	d63f0200	blr	x16
   0x0000fffff7fac9e4:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fac9e8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fac9ec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fac9f0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fac9f4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fac9f8:	d65f03c0	ret
   0x0000fffff7fac9fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faca00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faca04:	b900028a	str	w10, [x20]
   0x0000fffff7faca08:	f9000689	str	x9, [x20, #8]
   0x0000fffff7faca0c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7faca10:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7faca14:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7faca18:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7faca1c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7faca20:	d65f03c0	ret
   0x0000fffff7faca24:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7faca28:	17fffff5	b	0xfffff7fac9fc
   0x0000fffff7faca2c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7faca30:	17fffff3	b	0xfffff7fac9fc
   0x0000fffff7faca34:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7faca38:	17fffff1	b	0xfffff7fac9fc
   0x0000fffff7faca3c:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7faca40:	17ffffef	b	0xfffff7fac9fc
   0x0000fffff7faca44:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7faca48:	17ffffed	b	0xfffff7fac9fc
   0x0000fffff7faca4c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7faca50:	17ffffeb	b	0xfffff7fac9fc
   0x0000fffff7faca54:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7faca58:	17ffffe9	b	0xfffff7fac9fc
   0x0000fffff7faca5c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7faca60:	17ffffe7	b	0xfffff7fac9fc
   0x0000fffff7faca64:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7faca68:	17ffffe5	b	0xfffff7fac9fc
   0x0000fffff7faca6c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7faca70:	17ffffe3	b	0xfffff7fac9fc
   0x0000fffff7faca74:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7faca78:	17ffffe1	b	0xfffff7fac9fc
   0x0000fffff7faca7c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7faca80:	17ffffdf	b	0xfffff7fac9fc
   0x0000fffff7faca84:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7faca88:	17ffffdd	b	0xfffff7fac9fc
   0x0000fffff7faca8c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7faca90:	17ffffdb	b	0xfffff7fac9fc
   0x0000fffff7faca94:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7faca98:	17ffffd9	b	0xfffff7fac9fc
   0x0000fffff7faca9c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7facaa0:	17ffffd7	b	0xfffff7fac9fc
   0x0000fffff7facaa4:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7facaa8:	17ffffd5	b	0xfffff7fac9fc
   0x0000fffff7facaac:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7facab0:	17ffffd3	b	0xfffff7fac9fc
   0x0000fffff7facab4:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7facab8:	17ffffd1	b	0xfffff7fac9fc
   0x0000fffff7facabc:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7facac0:	17ffffcf	b	0xfffff7fac9fc
   0x0000fffff7facac4:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7facac8:	17ffffcd	b	0xfffff7fac9fc
   0x0000fffff7facacc:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7facad0:	17ffffcb	b	0xfffff7fac9fc
   0x0000fffff7facad4:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7facad8:	17ffffc9	b	0xfffff7fac9fc
   0x0000fffff7facadc:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7facae0:	17ffffc7	b	0xfffff7fac9fc
   0x0000fffff7facae4:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7facae8:	17ffffc5	b	0xfffff7fac9fc
   0x0000fffff7facaec:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7facaf0:	17ffffc3	b	0xfffff7fac9fc
   0x0000fffff7facaf4:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7facaf8:	17ffffc1	b	0xfffff7fac9fc
   0x0000fffff7facafc:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7facb00:	17ffffbf	b	0xfffff7fac9fc
   0x0000fffff7facb04:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7facb08:	17ffffbd	b	0xfffff7fac9fc
   0x0000fffff7facb0c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7facb10:	17ffffbb	b	0xfffff7fac9fc
   0x0000fffff7facb14:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7facb18:	17ffffb9	b	0xfffff7fac9fc
   0x0000fffff7facb1c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7facb20:	17ffffb7	b	0xfffff7fac9fc
   0x0000fffff7facb24:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7facb28:	17ffffb5	b	0xfffff7fac9fc
   0x0000fffff7facb2c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7facb30:	17ffffb3	b	0xfffff7fac9fc
   0x0000fffff7facb34:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7facb38:	17ffffb1	b	0xfffff7fac9fc
   0x0000fffff7facb3c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7facb40:	17ffffaf	b	0xfffff7fac9fc
   0x0000fffff7facb44:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7facb48:	17ffffad	b	0xfffff7fac9fc
   0x0000fffff7facb4c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7facb50:	17ffffab	b	0xfffff7fac9fc
   0x0000fffff7facb54:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7facb58:	17ffffa9	b	0xfffff7fac9fc
   0x0000fffff7facb5c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7facb60:	17ffffa7	b	0xfffff7fac9fc
   0x0000fffff7facb64:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7facb68:	17ffffa5	b	0xfffff7fac9fc
   0x0000fffff7facb6c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7facb70:	17ffffa3	b	0xfffff7fac9fc
   0x0000fffff7facb74:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7facb78:	17ffffa1	b	0xfffff7fac9fc
   0x0000fffff7facb7c:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7facb80:	17ffff9f	b	0xfffff7fac9fc
   0x0000fffff7facb84:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7facb88:	17ffff9d	b	0xfffff7fac9fc
   0x0000fffff7facb8c:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7facb90:	17ffff9b	b	0xfffff7fac9fc
   0x0000fffff7facb94:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7facb98:	17ffff99	b	0xfffff7fac9fc
   0x0000fffff7facb9c:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7facba0:	17ffff97	b	0xfffff7fac9fc
   0x0000fffff7facba4:	00000000	udf	#0
   0x0000fffff7facba8:	00000000	udf	#0
   0x0000fffff7facbac:	00000000	udf	#0
   0x0000fffff7facbb0:	00000000	udf	#0
   0x0000fffff7facbb4:	00000000	udf	#0
   0x0000fffff7facbb8:	00000000	udf	#0
   0x0000fffff7facbbc:	00000000	udf	#0
   0x0000fffff7facbc0:	00000000	udf	#0
   0x0000fffff7facbc4:	00000000	udf	#0
   0x0000fffff7facbc8:	00000000	udf	#0
   0x0000fffff7facbcc:	00000000	udf	#0
   0x0000fffff7facbd0:	00000000	udf	#0
   0x0000fffff7facbd4:	00000000	udf	#0
   0x0000fffff7facbd8:	00000000	udf	#0
   0x0000fffff7facbdc:	00000000	udf	#0
   0x0000fffff7facbe0:	00000000	udf	#0
   0x0000fffff7facbe4:	00000000	udf	#0
   0x0000fffff7facbe8:	00000000	udf	#0
   0x0000fffff7facbec:	00000000	udf	#0
   0x0000fffff7facbf0:	00000000	udf	#0
   0x0000fffff7facbf4:	00000000	udf	#0
   0x0000fffff7facbf8:	00000000	udf	#0
   0x0000fffff7facbfc:	00000000	udf	#0
   0x0000fffff7facc00:	00000000	udf	#0
   0x0000fffff7facc04:	00000000	udf	#0
   0x0000fffff7facc08:	00000000	udf	#0
   0x0000fffff7facc0c:	00000000	udf	#0
   0x0000fffff7facc10:	00000000	udf	#0
   0x0000fffff7facc14:	00000000	udf	#0
   0x0000fffff7facc18:	00000000	udf	#0
   0x0000fffff7facc1c:	00000000	udf	#0
   0x0000fffff7facc20:	00000000	udf	#0
   0x0000fffff7facc24:	00000000	udf	#0
   0x0000fffff7facc28:	00000000	udf	#0
   0x0000fffff7facc2c:	00000000	udf	#0
   0x0000fffff7facc30:	00000000	udf	#0
   0x0000fffff7facc34:	00000000	udf	#0
   0x0000fffff7facc38:	00000000	udf	#0
   0x0000fffff7facc3c:	00000000	udf	#0
   0x0000fffff7facc40:	00000000	udf	#0
   0x0000fffff7facc44:	00000000	udf	#0
   0x0000fffff7facc48:	00000000	udf	#0
   0x0000fffff7facc4c:	00000000	udf	#0
   0x0000fffff7facc50:	00000000	udf	#0
   0x0000fffff7facc54:	00000000	udf	#0
   0x0000fffff7facc58:	00000000	udf	#0
   0x0000fffff7facc5c:	00000000	udf	#0
   0x0000fffff7facc60:	00000000	udf	#0
   0x0000fffff7facc64:	00000000	udf	#0
   0x0000fffff7facc68:	00000000	udf	#0
   0x0000fffff7facc6c:	00000000	udf	#0
   0x0000fffff7facc70:	00000000	udf	#0
   0x0000fffff7facc74:	00000000	udf	#0
   0x0000fffff7facc78:	00000000	udf	#0
   0x0000fffff7facc7c:	00000000	udf	#0
   0x0000fffff7facc80:	00000000	udf	#0
   0x0000fffff7facc84:	00000000	udf	#0
   0x0000fffff7facc88:	00000000	udf	#0
   0x0000fffff7facc8c:	00000000	udf	#0
   0x0000fffff7facc90:	00000000	udf	#0
   0x0000fffff7facc94:	00000000	udf	#0
   0x0000fffff7facc98:	00000000	udf	#0
   0x0000fffff7facc9c:	00000000	udf	#0
   0x0000fffff7facca0:	00000000	udf	#0
   0x0000fffff7facca4:	00000000	udf	#0
   0x0000fffff7facca8:	00000000	udf	#0
   0x0000fffff7faccac:	00000000	udf	#0
   0x0000fffff7faccb0:	00000000	udf	#0
   0x0000fffff7faccb4:	00000000	udf	#0
   0x0000fffff7faccb8:	00000000	udf	#0
   0x0000fffff7faccbc:	00000000	udf	#0
   0x0000fffff7faccc0:	00000000	udf	#0
   0x0000fffff7faccc4:	00000000	udf	#0
   0x0000fffff7faccc8:	00000000	udf	#0
   0x0000fffff7facccc:	00000000	udf	#0
   0x0000fffff7faccd0:	00000000	udf	#0
   0x0000fffff7faccd4:	00000000	udf	#0
   0x0000fffff7faccd8:	00000000	udf	#0
   0x0000fffff7faccdc:	00000000	udf	#0
   0x0000fffff7facce0:	00000000	udf	#0
   0x0000fffff7facce4:	00000000	udf	#0
   0x0000fffff7facce8:	00000000	udf	#0
   0x0000fffff7faccec:	00000000	udf	#0
   0x0000fffff7faccf0:	00000000	udf	#0
   0x0000fffff7faccf4:	00000000	udf	#0
   0x0000fffff7faccf8:	00000000	udf	#0
   0x0000fffff7faccfc:	00000000	udf	#0
   0x0000fffff7facd00:	00000000	udf	#0
   0x0000fffff7facd04:	00000000	udf	#0
   0x0000fffff7facd08:	00000000	udf	#0
   0x0000fffff7facd0c:	00000000	udf	#0
   0x0000fffff7facd10:	00000000	udf	#0
   0x0000fffff7facd14:	00000000	udf	#0
   0x0000fffff7facd18:	00000000	udf	#0
   0x0000fffff7facd1c:	00000000	udf	#0
   0x0000fffff7facd20:	00000000	udf	#0
   0x0000fffff7facd24:	00000000	udf	#0
   0x0000fffff7facd28:	00000000	udf	#0
   0x0000fffff7facd2c:	00000000	udf	#0
   0x0000fffff7facd30:	00000000	udf	#0
   0x0000fffff7facd34:	00000000	udf	#0
   0x0000fffff7facd38:	00000000	udf	#0
   0x0000fffff7facd3c:	00000000	udf	#0
   0x0000fffff7facd40:	00000000	udf	#0
   0x0000fffff7facd44:	00000000	udf	#0
   0x0000fffff7facd48:	00000000	udf	#0
   0x0000fffff7facd4c:	00000000	udf	#0
   0x0000fffff7facd50:	00000000	udf	#0
   0x0000fffff7facd54:	00000000	udf	#0
   0x0000fffff7facd58:	00000000	udf	#0
   0x0000fffff7facd5c:	00000000	udf	#0
   0x0000fffff7facd60:	00000000	udf	#0
   0x0000fffff7facd64:	00000000	udf	#0
   0x0000fffff7facd68:	00000000	udf	#0
   0x0000fffff7facd6c:	00000000	udf	#0
   0x0000fffff7facd70:	00000000	udf	#0
   0x0000fffff7facd74:	00000000	udf	#0
   0x0000fffff7facd78:	00000000	udf	#0
   0x0000fffff7facd7c:	00000000	udf	#0
   0x0000fffff7facd80:	00000000	udf	#0
   0x0000fffff7facd84:	00000000	udf	#0
   0x0000fffff7facd88:	00000000	udf	#0
   0x0000fffff7facd8c:	00000000	udf	#0
   0x0000fffff7facd90:	00000000	udf	#0
   0x0000fffff7facd94:	00000000	udf	#0
   0x0000fffff7facd98:	00000000	udf	#0
   0x0000fffff7facd9c:	00000000	udf	#0
   0x0000fffff7facda0:	00000000	udf	#0
   0x0000fffff7facda4:	00000000	udf	#0
   0x0000fffff7facda8:	00000000	udf	#0
   0x0000fffff7facdac:	00000000	udf	#0
   0x0000fffff7facdb0:	00000000	udf	#0
   0x0000fffff7facdb4:	00000000	udf	#0
   0x0000fffff7facdb8:	00000000	udf	#0
   0x0000fffff7facdbc:	00000000	udf	#0
   0x0000fffff7facdc0:	00000000	udf	#0
   0x0000fffff7facdc4:	00000000	udf	#0
   0x0000fffff7facdc8:	00000000	udf	#0
   0x0000fffff7facdcc:	00000000	udf	#0
   0x0000fffff7facdd0:	00000000	udf	#0
   0x0000fffff7facdd4:	00000000	udf	#0
   0x0000fffff7facdd8:	00000000	udf	#0
   0x0000fffff7facddc:	00000000	udf	#0
   0x0000fffff7facde0:	00000000	udf	#0
   0x0000fffff7facde4:	00000000	udf	#0
   0x0000fffff7facde8:	00000000	udf	#0
   0x0000fffff7facdec:	00000000	udf	#0
   0x0000fffff7facdf0:	00000000	udf	#0
   0x0000fffff7facdf4:	00000000	udf	#0
   0x0000fffff7facdf8:	00000000	udf	#0
   0x0000fffff7facdfc:	00000000	udf	#0
   0x0000fffff7face00:	00000000	udf	#0
   0x0000fffff7face04:	00000000	udf	#0
   0x0000fffff7face08:	00000000	udf	#0
   0x0000fffff7face0c:	00000000	udf	#0
   0x0000fffff7face10:	00000000	udf	#0
   0x0000fffff7face14:	00000000	udf	#0
   0x0000fffff7face18:	00000000	udf	#0
   0x0000fffff7face1c:	00000000	udf	#0
   0x0000fffff7face20:	00000000	udf	#0
   0x0000fffff7face24:	00000000	udf	#0
   0x0000fffff7face28:	00000000	udf	#0
   0x0000fffff7face2c:	00000000	udf	#0
   0x0000fffff7face30:	00000000	udf	#0
   0x0000fffff7face34:	00000000	udf	#0
   0x0000fffff7face38:	00000000	udf	#0
   0x0000fffff7face3c:	00000000	udf	#0
   0x0000fffff7face40:	00000000	udf	#0
   0x0000fffff7face44:	00000000	udf	#0
   0x0000fffff7face48:	00000000	udf	#0
   0x0000fffff7face4c:	00000000	udf	#0
   0x0000fffff7face50:	00000000	udf	#0
   0x0000fffff7face54:	00000000	udf	#0
   0x0000fffff7face58:	00000000	udf	#0
   0x0000fffff7face5c:	00000000	udf	#0
   0x0000fffff7face60:	00000000	udf	#0
   0x0000fffff7face64:	00000000	udf	#0
   0x0000fffff7face68:	00000000	udf	#0
   0x0000fffff7face6c:	00000000	udf	#0
   0x0000fffff7face70:	00000000	udf	#0
   0x0000fffff7face74:	00000000	udf	#0
   0x0000fffff7face78:	00000000	udf	#0
   0x0000fffff7face7c:	00000000	udf	#0
   0x0000fffff7face80:	00000000	udf	#0
   0x0000fffff7face84:	00000000	udf	#0
   0x0000fffff7face88:	00000000	udf	#0
   0x0000fffff7face8c:	00000000	udf	#0
   0x0000fffff7face90:	00000000	udf	#0
   0x0000fffff7face94:	00000000	udf	#0
   0x0000fffff7face98:	00000000	udf	#0
   0x0000fffff7face9c:	00000000	udf	#0
   0x0000fffff7facea0:	00000000	udf	#0
   0x0000fffff7facea4:	00000000	udf	#0
   0x0000fffff7facea8:	00000000	udf	#0
   0x0000fffff7faceac:	00000000	udf	#0
   0x0000fffff7faceb0:	00000000	udf	#0
   0x0000fffff7faceb4:	00000000	udf	#0
   0x0000fffff7faceb8:	00000000	udf	#0
   0x0000fffff7facebc:	00000000	udf	#0
   0x0000fffff7facec0:	00000000	udf	#0
   0x0000fffff7facec4:	00000000	udf	#0
   0x0000fffff7facec8:	00000000	udf	#0
   0x0000fffff7facecc:	00000000	udf	#0
   0x0000fffff7faced0:	00000000	udf	#0
   0x0000fffff7faced4:	00000000	udf	#0
   0x0000fffff7faced8:	00000000	udf	#0
   0x0000fffff7facedc:	00000000	udf	#0
   0x0000fffff7facee0:	00000000	udf	#0
   0x0000fffff7facee4:	00000000	udf	#0
   0x0000fffff7facee8:	00000000	udf	#0
   0x0000fffff7faceec:	00000000	udf	#0
   0x0000fffff7facef0:	00000000	udf	#0
   0x0000fffff7facef4:	00000000	udf	#0
   0x0000fffff7facef8:	00000000	udf	#0
   0x0000fffff7facefc:	00000000	udf	#0
   0x0000fffff7facf00:	00000000	udf	#0
   0x0000fffff7facf04:	00000000	udf	#0
   0x0000fffff7facf08:	00000000	udf	#0
   0x0000fffff7facf0c:	00000000	udf	#0
   0x0000fffff7facf10:	00000000	udf	#0
   0x0000fffff7facf14:	00000000	udf	#0
   0x0000fffff7facf18:	00000000	udf	#0
   0x0000fffff7facf1c:	00000000	udf	#0
   0x0000fffff7facf20:	00000000	udf	#0
   0x0000fffff7facf24:	00000000	udf	#0
   0x0000fffff7facf28:	00000000	udf	#0
   0x0000fffff7facf2c:	00000000	udf	#0
   0x0000fffff7facf30:	00000000	udf	#0
   0x0000fffff7facf34:	00000000	udf	#0
   0x0000fffff7facf38:	00000000	udf	#0
   0x0000fffff7facf3c:	00000000	udf	#0
   0x0000fffff7facf40:	00000000	udf	#0
   0x0000fffff7facf44:	00000000	udf	#0
   0x0000fffff7facf48:	00000000	udf	#0
   0x0000fffff7facf4c:	00000000	udf	#0
   0x0000fffff7facf50:	00000000	udf	#0
   0x0000fffff7facf54:	00000000	udf	#0
   0x0000fffff7facf58:	00000000	udf	#0
   0x0000fffff7facf5c:	00000000	udf	#0
   0x0000fffff7facf60:	00000000	udf	#0
   0x0000fffff7facf64:	00000000	udf	#0
   0x0000fffff7facf68:	00000000	udf	#0
   0x0000fffff7facf6c:	00000000	udf	#0
   0x0000fffff7facf70:	00000000	udf	#0
   0x0000fffff7facf74:	00000000	udf	#0
   0x0000fffff7facf78:	00000000	udf	#0
   0x0000fffff7facf7c:	00000000	udf	#0
   0x0000fffff7facf80:	00000000	udf	#0
   0x0000fffff7facf84:	00000000	udf	#0
   0x0000fffff7facf88:	00000000	udf	#0
   0x0000fffff7facf8c:	00000000	udf	#0
   0x0000fffff7facf90:	00000000	udf	#0
   0x0000fffff7facf94:	00000000	udf	#0
   0x0000fffff7facf98:	00000000	udf	#0
   0x0000fffff7facf9c:	00000000	udf	#0
   0x0000fffff7facfa0:	00000000	udf	#0
   0x0000fffff7facfa4:	00000000	udf	#0
   0x0000fffff7facfa8:	00000000	udf	#0
   0x0000fffff7facfac:	00000000	udf	#0
   0x0000fffff7facfb0:	00000000	udf	#0
   0x0000fffff7facfb4:	00000000	udf	#0
   0x0000fffff7facfb8:	00000000	udf	#0
   0x0000fffff7facfbc:	00000000	udf	#0
   0x0000fffff7facfc0:	00000000	udf	#0
   0x0000fffff7facfc4:	00000000	udf	#0
   0x0000fffff7facfc8:	00000000	udf	#0
   0x0000fffff7facfcc:	00000000	udf	#0
   0x0000fffff7facfd0:	00000000	udf	#0
   0x0000fffff7facfd4:	00000000	udf	#0
   0x0000fffff7facfd8:	00000000	udf	#0
   0x0000fffff7facfdc:	00000000	udf	#0
   0x0000fffff7facfe0:	00000000	udf	#0
   0x0000fffff7facfe4:	00000000	udf	#0
   0x0000fffff7facfe8:	00000000	udf	#0
   0x0000fffff7facfec:	00000000	udf	#0
   0x0000fffff7facff0:	00000000	udf	#0
   0x0000fffff7facff4:	00000000	udf	#0
   0x0000fffff7facff8:	00000000	udf	#0
   0x0000fffff7facffc:	00000000	udf	#0
End of assembler dump.
