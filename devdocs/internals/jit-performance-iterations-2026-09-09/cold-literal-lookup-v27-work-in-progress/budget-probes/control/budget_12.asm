Dump of assembler code from 0xfffff7faa000 to 0xfffff7fac000:
   0x0000fffff7faa000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7faa004:	910003fd	mov	x29, sp
   0x0000fffff7faa008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7faa00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7faa010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7faa014:	aa0003f3	mov	x19, x0
   0x0000fffff7faa018:	aa0103f4	mov	x20, x1
   0x0000fffff7faa01c:	aa0203f5	mov	x21, x2
   0x0000fffff7faa020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7faa024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7faa028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7faa02c:	f90003e9	str	x9, [sp]
   0x0000fffff7faa030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7faa034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7faa038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7faa03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7faa040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa044:	d63f0200	blr	x16
   0x0000fffff7faa048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7faa04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7faa050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7faa054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7faa058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa05c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa060:	aa1303e1	mov	x1, x19
   0x0000fffff7faa064:	aa1503e2	mov	x2, x21
   0x0000fffff7faa068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7faa06c:	aa1403e4	mov	x4, x20
   0x0000fffff7faa070:	aa1603e5	mov	x5, x22
   0x0000fffff7faa074:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faa078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa07c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa080:	d63f0200	blr	x16
   0x0000fffff7faa084:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa088:	5400df00	b.eq	0xfffff7fabc68  // b.none
   0x0000fffff7faa08c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa090:	37d800e9	tbnz	w9, #27, 0xfffff7faa0ac
   0x0000fffff7faa094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7faa098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa09c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa0a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faa0a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa0a8:	1400000e	b	0xfffff7faa0e0
   0x0000fffff7faa0ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa0b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa0b4:	aa1303e1	mov	x1, x19
   0x0000fffff7faa0b8:	aa1503e2	mov	x2, x21
   0x0000fffff7faa0bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7faa0c0:	aa1403e4	mov	x4, x20
   0x0000fffff7faa0c4:	aa1603e5	mov	x5, x22
   0x0000fffff7faa0c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7faa0cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa0d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa0d4:	d63f0200	blr	x16
   0x0000fffff7faa0d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa0dc:	5400dca0	b.eq	0xfffff7fabc70  // b.none
   0x0000fffff7faa0e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa0e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa0e8:	aa1303e1	mov	x1, x19
   0x0000fffff7faa0ec:	aa1503e2	mov	x2, x21
   0x0000fffff7faa0f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7faa0f4:	aa1403e4	mov	x4, x20
   0x0000fffff7faa0f8:	aa1603e5	mov	x5, x22
   0x0000fffff7faa0fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faa100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa108:	d63f0200	blr	x16
   0x0000fffff7faa10c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa110:	5400db40	b.eq	0xfffff7fabc78  // b.none
   0x0000fffff7faa114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa118:	37d800e9	tbnz	w9, #27, 0xfffff7faa134
   0x0000fffff7faa11c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7faa120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faa12c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa130:	1400000e	b	0xfffff7faa168
   0x0000fffff7faa134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa13c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa140:	aa1503e2	mov	x2, x21
   0x0000fffff7faa144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7faa148:	aa1403e4	mov	x4, x20
   0x0000fffff7faa14c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa150:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7faa154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa15c:	d63f0200	blr	x16
   0x0000fffff7faa160:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa164:	5400d8e0	b.eq	0xfffff7fabc80  // b.none
   0x0000fffff7faa168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa16c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa170:	aa1303e1	mov	x1, x19
   0x0000fffff7faa174:	aa1503e2	mov	x2, x21
   0x0000fffff7faa178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7faa17c:	aa1403e4	mov	x4, x20
   0x0000fffff7faa180:	aa1603e5	mov	x5, x22
   0x0000fffff7faa184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa18c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa190:	d63f0200	blr	x16
   0x0000fffff7faa194:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa198:	5400d780	b.eq	0xfffff7fabc88  // b.none
   0x0000fffff7faa19c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa1a0:	37d806a9	tbnz	w9, #27, 0xfffff7faa274
   0x0000fffff7faa1a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa1a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa1ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1b4:	540001c1	b.ne	0xfffff7faa1ec  // b.any
   0x0000fffff7faa1b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa1bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa1c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1c8:	54000121	b.ne	0xfffff7faa1ec  // b.any
   0x0000fffff7faa1cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa1d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faa1d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa1d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa1dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faa1e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa1e8:	14000030	b	0xfffff7faa2a8
   0x0000fffff7faa1ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa1f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa1f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa1f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa1fc:	54000120	b.eq	0xfffff7faa220  // b.none
   0x0000fffff7faa200:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa210:	54000321	b.ne	0xfffff7faa274  // b.any
   0x0000fffff7faa214:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa218:	9e620120	scvtf	d0, x9
   0x0000fffff7faa21c:	14000002	b	0xfffff7faa224
   0x0000fffff7faa220:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faa224:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa22c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa230:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa234:	54000120	b.eq	0xfffff7faa258  // b.none
   0x0000fffff7faa238:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa23c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa244:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa248:	54000161	b.ne	0xfffff7faa274  // b.any
   0x0000fffff7faa24c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa250:	9e620121	scvtf	d1, x9
   0x0000fffff7faa254:	14000002	b	0xfffff7faa25c
   0x0000fffff7faa258:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faa25c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa260:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faa264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa26c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa270:	17ffffde	b	0xfffff7faa1e8
   0x0000fffff7faa274:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa27c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa280:	aa1503e2	mov	x2, x21
   0x0000fffff7faa284:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7faa288:	aa1403e4	mov	x4, x20
   0x0000fffff7faa28c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa290:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faa294:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa29c:	d63f0200	blr	x16
   0x0000fffff7faa2a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa2a4:	5400cf60	b.eq	0xfffff7fabc90  // b.none
   0x0000fffff7faa2a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa2ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa2b0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa2b4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa2b8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7faa2bc:	aa1403e4	mov	x4, x20
   0x0000fffff7faa2c0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa2c4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faa2c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa2cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa2d0:	d63f0200	blr	x16
   0x0000fffff7faa2d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa2d8:	5400ce00	b.eq	0xfffff7fabc98  // b.none
   0x0000fffff7faa2dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa2e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa2e4:	aa1303e1	mov	x1, x19
   0x0000fffff7faa2e8:	aa1503e2	mov	x2, x21
   0x0000fffff7faa2ec:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7faa2f0:	aa1403e4	mov	x4, x20
   0x0000fffff7faa2f4:	aa1603e5	mov	x5, x22
   0x0000fffff7faa2f8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faa2fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa304:	d63f0200	blr	x16
   0x0000fffff7faa308:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa30c:	5400cca0	b.eq	0xfffff7fabca0  // b.none
   0x0000fffff7faa310:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa314:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa318:	540004a0	b.eq	0xfffff7faa3ac  // b.none
   0x0000fffff7faa31c:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa320:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa324:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa328:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa32c:	54000400	b.eq	0xfffff7faa3ac  // b.none
   0x0000fffff7faa330:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa334:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa338:	36d801d1	tbz	w17, #27, 0xfffff7faa370
   0x0000fffff7faa33c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa340:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa344:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa348:	54000321	b.ne	0xfffff7faa3ac  // b.any
   0x0000fffff7faa34c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa350:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa354:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa358:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa35c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa360:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa364:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa368:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa36c:	54000209	b.ls	0xfffff7faa3ac  // b.plast
   0x0000fffff7faa370:	36d8008d	tbz	w13, #27, 0xfffff7faa380
   0x0000fffff7faa374:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa378:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa37c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa380:	36d80091	tbz	w17, #27, 0xfffff7faa390
   0x0000fffff7faa384:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa388:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa38c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa390:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faa394:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faa398:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa39c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa3a0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faa3a4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faa3a8:	1400000e	b	0xfffff7faa3e0
   0x0000fffff7faa3ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa3b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa3b4:	aa1303e1	mov	x1, x19
   0x0000fffff7faa3b8:	aa1503e2	mov	x2, x21
   0x0000fffff7faa3bc:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7faa3c0:	aa1403e4	mov	x4, x20
   0x0000fffff7faa3c4:	aa1603e5	mov	x5, x22
   0x0000fffff7faa3c8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa3cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa3d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa3d4:	d63f0200	blr	x16
   0x0000fffff7faa3d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa3dc:	5400c660	b.eq	0xfffff7fabca8  // b.none
   0x0000fffff7faa3e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa3e4:	37d806a9	tbnz	w9, #27, 0xfffff7faa4b8
   0x0000fffff7faa3e8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa3ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa3f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa3f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa3f8:	540001c1	b.ne	0xfffff7faa430  // b.any
   0x0000fffff7faa3fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa400:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa404:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa408:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa40c:	54000121	b.ne	0xfffff7faa430  // b.any
   0x0000fffff7faa410:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa414:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faa418:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa41c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa420:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa424:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faa428:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa42c:	14000030	b	0xfffff7faa4ec
   0x0000fffff7faa430:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa434:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa438:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa43c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa440:	54000120	b.eq	0xfffff7faa464  // b.none
   0x0000fffff7faa444:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa448:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa44c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa450:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa454:	54000321	b.ne	0xfffff7faa4b8  // b.any
   0x0000fffff7faa458:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa45c:	9e620120	scvtf	d0, x9
   0x0000fffff7faa460:	14000002	b	0xfffff7faa468
   0x0000fffff7faa464:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faa468:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa46c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa470:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa474:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa478:	54000120	b.eq	0xfffff7faa49c  // b.none
   0x0000fffff7faa47c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa488:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa48c:	54000161	b.ne	0xfffff7faa4b8  // b.any
   0x0000fffff7faa490:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa494:	9e620121	scvtf	d1, x9
   0x0000fffff7faa498:	14000002	b	0xfffff7faa4a0
   0x0000fffff7faa49c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faa4a0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa4a4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faa4a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa4ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa4b0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa4b4:	17ffffde	b	0xfffff7faa42c
   0x0000fffff7faa4b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa4bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa4c0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa4c4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa4c8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7faa4cc:	aa1403e4	mov	x4, x20
   0x0000fffff7faa4d0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa4d4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faa4d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa4dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa4e0:	d63f0200	blr	x16
   0x0000fffff7faa4e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa4e8:	5400be40	b.eq	0xfffff7fabcb0  // b.none
   0x0000fffff7faa4ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa4f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa4f4:	aa1303e1	mov	x1, x19
   0x0000fffff7faa4f8:	aa1503e2	mov	x2, x21
   0x0000fffff7faa4fc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7faa500:	aa1403e4	mov	x4, x20
   0x0000fffff7faa504:	aa1603e5	mov	x5, x22
   0x0000fffff7faa508:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faa50c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa510:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa514:	d63f0200	blr	x16
   0x0000fffff7faa518:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa51c:	5400bce0	b.eq	0xfffff7fabcb8  // b.none
   0x0000fffff7faa520:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa524:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa528:	aa1303e1	mov	x1, x19
   0x0000fffff7faa52c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa530:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7faa534:	aa1403e4	mov	x4, x20
   0x0000fffff7faa538:	aa1603e5	mov	x5, x22
   0x0000fffff7faa53c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faa540:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa544:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa548:	d63f0200	blr	x16
   0x0000fffff7faa54c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa550:	5400bb80	b.eq	0xfffff7fabcc0  // b.none
   0x0000fffff7faa554:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa558:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa55c:	540004a0	b.eq	0xfffff7faa5f0  // b.none
   0x0000fffff7faa560:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa564:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa568:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa56c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa570:	54000400	b.eq	0xfffff7faa5f0  // b.none
   0x0000fffff7faa574:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa578:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa57c:	36d801d1	tbz	w17, #27, 0xfffff7faa5b4
   0x0000fffff7faa580:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa584:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa588:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa58c:	54000321	b.ne	0xfffff7faa5f0  // b.any
   0x0000fffff7faa590:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa594:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa598:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa59c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa5a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa5a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa5a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa5ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa5b0:	54000209	b.ls	0xfffff7faa5f0  // b.plast
   0x0000fffff7faa5b4:	36d8008d	tbz	w13, #27, 0xfffff7faa5c4
   0x0000fffff7faa5b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa5bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa5c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa5c4:	36d80091	tbz	w17, #27, 0xfffff7faa5d4
   0x0000fffff7faa5c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa5cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa5d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa5d4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faa5d8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faa5dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa5e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa5e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faa5e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faa5ec:	1400000e	b	0xfffff7faa624
   0x0000fffff7faa5f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa5f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa5f8:	aa1303e1	mov	x1, x19
   0x0000fffff7faa5fc:	aa1503e2	mov	x2, x21
   0x0000fffff7faa600:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7faa604:	aa1403e4	mov	x4, x20
   0x0000fffff7faa608:	aa1603e5	mov	x5, x22
   0x0000fffff7faa60c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa610:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa614:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa618:	d63f0200	blr	x16
   0x0000fffff7faa61c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa620:	5400b540	b.eq	0xfffff7fabcc8  // b.none
   0x0000fffff7faa624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa628:	37d806a9	tbnz	w9, #27, 0xfffff7faa6fc
   0x0000fffff7faa62c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa638:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa63c:	540001c1	b.ne	0xfffff7faa674  // b.any
   0x0000fffff7faa640:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa64c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa650:	54000121	b.ne	0xfffff7faa674  // b.any
   0x0000fffff7faa654:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa658:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faa65c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa660:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa668:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faa66c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa670:	14000030	b	0xfffff7faa730
   0x0000fffff7faa674:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa680:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa684:	54000120	b.eq	0xfffff7faa6a8  // b.none
   0x0000fffff7faa688:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa68c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa694:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa698:	54000321	b.ne	0xfffff7faa6fc  // b.any
   0x0000fffff7faa69c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa6a0:	9e620120	scvtf	d0, x9
   0x0000fffff7faa6a4:	14000002	b	0xfffff7faa6ac
   0x0000fffff7faa6a8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faa6ac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa6b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa6b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa6bc:	54000120	b.eq	0xfffff7faa6e0  // b.none
   0x0000fffff7faa6c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa6c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa6c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa6d0:	54000161	b.ne	0xfffff7faa6fc  // b.any
   0x0000fffff7faa6d4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa6d8:	9e620121	scvtf	d1, x9
   0x0000fffff7faa6dc:	14000002	b	0xfffff7faa6e4
   0x0000fffff7faa6e0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faa6e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa6e8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faa6ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa6f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6f4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa6f8:	17ffffde	b	0xfffff7faa670
   0x0000fffff7faa6fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa700:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa704:	aa1303e1	mov	x1, x19
   0x0000fffff7faa708:	aa1503e2	mov	x2, x21
   0x0000fffff7faa70c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7faa710:	aa1403e4	mov	x4, x20
   0x0000fffff7faa714:	aa1603e5	mov	x5, x22
   0x0000fffff7faa718:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faa71c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa720:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa724:	d63f0200	blr	x16
   0x0000fffff7faa728:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa72c:	5400ad20	b.eq	0xfffff7fabcd0  // b.none
   0x0000fffff7faa730:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa734:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa738:	aa1303e1	mov	x1, x19
   0x0000fffff7faa73c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa740:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7faa744:	aa1403e4	mov	x4, x20
   0x0000fffff7faa748:	aa1603e5	mov	x5, x22
   0x0000fffff7faa74c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faa750:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa754:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa758:	d63f0200	blr	x16
   0x0000fffff7faa75c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa760:	5400abc0	b.eq	0xfffff7fabcd8  // b.none
   0x0000fffff7faa764:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa768:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa76c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa770:	aa1503e2	mov	x2, x21
   0x0000fffff7faa774:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7faa778:	aa1403e4	mov	x4, x20
   0x0000fffff7faa77c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa780:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faa784:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa788:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa78c:	d63f0200	blr	x16
   0x0000fffff7faa790:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa794:	5400aa60	b.eq	0xfffff7fabce0  // b.none
   0x0000fffff7faa798:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa79c:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa7a0:	540004a0	b.eq	0xfffff7faa834  // b.none
   0x0000fffff7faa7a4:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa7a8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa7ac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa7b0:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa7b4:	54000400	b.eq	0xfffff7faa834  // b.none
   0x0000fffff7faa7b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa7bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa7c0:	36d801d1	tbz	w17, #27, 0xfffff7faa7f8
   0x0000fffff7faa7c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa7c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa7cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa7d0:	54000321	b.ne	0xfffff7faa834  // b.any
   0x0000fffff7faa7d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa7d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa7dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa7e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa7e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa7e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa7ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa7f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa7f4:	54000209	b.ls	0xfffff7faa834  // b.plast
   0x0000fffff7faa7f8:	36d8008d	tbz	w13, #27, 0xfffff7faa808
   0x0000fffff7faa7fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa800:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa804:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa808:	36d80091	tbz	w17, #27, 0xfffff7faa818
   0x0000fffff7faa80c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa810:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa814:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa818:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faa81c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faa820:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa824:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa828:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faa82c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faa830:	1400000e	b	0xfffff7faa868
   0x0000fffff7faa834:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa838:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa83c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa840:	aa1503e2	mov	x2, x21
   0x0000fffff7faa844:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7faa848:	aa1403e4	mov	x4, x20
   0x0000fffff7faa84c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa850:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa854:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa858:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa85c:	d63f0200	blr	x16
   0x0000fffff7faa860:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa864:	5400a420	b.eq	0xfffff7fabce8  // b.none
   0x0000fffff7faa868:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa86c:	37d806a9	tbnz	w9, #27, 0xfffff7faa940
   0x0000fffff7faa870:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa874:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa878:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa87c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa880:	540001c1	b.ne	0xfffff7faa8b8  // b.any
   0x0000fffff7faa884:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa88c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa890:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa894:	54000121	b.ne	0xfffff7faa8b8  // b.any
   0x0000fffff7faa898:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa89c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faa8a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa8a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa8a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8ac:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faa8b0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa8b4:	14000030	b	0xfffff7faa974
   0x0000fffff7faa8b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa8bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa8c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa8c8:	54000120	b.eq	0xfffff7faa8ec  // b.none
   0x0000fffff7faa8cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faa8d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa8d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa8dc:	54000321	b.ne	0xfffff7faa940  // b.any
   0x0000fffff7faa8e0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faa8e4:	9e620120	scvtf	d0, x9
   0x0000fffff7faa8e8:	14000002	b	0xfffff7faa8f0
   0x0000fffff7faa8ec:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faa8f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa8f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa8f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa8fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa900:	54000120	b.eq	0xfffff7faa924  // b.none
   0x0000fffff7faa904:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa90c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa910:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa914:	54000161	b.ne	0xfffff7faa940  // b.any
   0x0000fffff7faa918:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa91c:	9e620121	scvtf	d1, x9
   0x0000fffff7faa920:	14000002	b	0xfffff7faa928
   0x0000fffff7faa924:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faa928:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa92c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faa930:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa938:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faa93c:	17ffffde	b	0xfffff7faa8b4
   0x0000fffff7faa940:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa944:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa948:	aa1303e1	mov	x1, x19
   0x0000fffff7faa94c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa950:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7faa954:	aa1403e4	mov	x4, x20
   0x0000fffff7faa958:	aa1603e5	mov	x5, x22
   0x0000fffff7faa95c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faa960:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa964:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa968:	d63f0200	blr	x16
   0x0000fffff7faa96c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa970:	54009c00	b.eq	0xfffff7fabcf0  // b.none
   0x0000fffff7faa974:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa978:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa97c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa980:	aa1503e2	mov	x2, x21
   0x0000fffff7faa984:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7faa988:	aa1403e4	mov	x4, x20
   0x0000fffff7faa98c:	aa1603e5	mov	x5, x22
   0x0000fffff7faa990:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faa994:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa998:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa99c:	d63f0200	blr	x16
   0x0000fffff7faa9a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa9a4:	54009aa0	b.eq	0xfffff7fabcf8  // b.none
   0x0000fffff7faa9a8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa9ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa9b0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa9b4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa9b8:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7faa9bc:	aa1403e4	mov	x4, x20
   0x0000fffff7faa9c0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa9c4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faa9c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa9cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa9d0:	d63f0200	blr	x16
   0x0000fffff7faa9d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa9d8:	54009940	b.eq	0xfffff7fabd00  // b.none
   0x0000fffff7faa9dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa9e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa9e4:	540004a0	b.eq	0xfffff7faaa78  // b.none
   0x0000fffff7faa9e8:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa9ec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa9f0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa9f4:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa9f8:	54000400	b.eq	0xfffff7faaa78  // b.none
   0x0000fffff7faa9fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faaa00:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faaa04:	36d801d1	tbz	w17, #27, 0xfffff7faaa3c
   0x0000fffff7faaa08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faaa0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faaa10:	f100013f	cmp	x9, #0x0
   0x0000fffff7faaa14:	54000321	b.ne	0xfffff7faaa78  // b.any
   0x0000fffff7faaa18:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faaa1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaa20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faaa24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faaa28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faaa2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faaa30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faaa34:	f100055f	cmp	x10, #0x1
   0x0000fffff7faaa38:	54000209	b.ls	0xfffff7faaa78  // b.plast
   0x0000fffff7faaa3c:	36d8008d	tbz	w13, #27, 0xfffff7faaa4c
   0x0000fffff7faaa40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faaa44:	91000529	add	x9, x9, #0x1
   0x0000fffff7faaa48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faaa4c:	36d80091	tbz	w17, #27, 0xfffff7faaa5c
   0x0000fffff7faaa50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaa54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faaa58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faaa5c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faaa60:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faaa64:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faaa68:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faaa6c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faaa70:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faaa74:	1400000e	b	0xfffff7faaaac
   0x0000fffff7faaa78:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faaa7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaa80:	aa1303e1	mov	x1, x19
   0x0000fffff7faaa84:	aa1503e2	mov	x2, x21
   0x0000fffff7faaa88:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7faaa8c:	aa1403e4	mov	x4, x20
   0x0000fffff7faaa90:	aa1603e5	mov	x5, x22
   0x0000fffff7faaa94:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faaa98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faaa9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaaa0:	d63f0200	blr	x16
   0x0000fffff7faaaa4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaaa8:	54009300	b.eq	0xfffff7fabd08  // b.none
   0x0000fffff7faaaac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaab0:	37d806a9	tbnz	w9, #27, 0xfffff7faab84
   0x0000fffff7faaab4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaabc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaac0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaac4:	540001c1	b.ne	0xfffff7faaafc  // b.any
   0x0000fffff7faaac8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faaacc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaad8:	54000121	b.ne	0xfffff7faaafc  // b.any
   0x0000fffff7faaadc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faaae0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faaae4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faaae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaaec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaaf0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faaaf4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faaaf8:	14000030	b	0xfffff7faabb8
   0x0000fffff7faaafc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faab00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faab04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab08:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab0c:	54000120	b.eq	0xfffff7faab30  // b.none
   0x0000fffff7faab10:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faab14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faab18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab20:	54000321	b.ne	0xfffff7faab84  // b.any
   0x0000fffff7faab24:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faab28:	9e620120	scvtf	d0, x9
   0x0000fffff7faab2c:	14000002	b	0xfffff7faab34
   0x0000fffff7faab30:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faab34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faab38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faab3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab40:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab44:	54000120	b.eq	0xfffff7faab68  // b.none
   0x0000fffff7faab48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faab4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faab50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab54:	eb0a013f	cmp	x9, x10
   0x0000fffff7faab58:	54000161	b.ne	0xfffff7faab84  // b.any
   0x0000fffff7faab5c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faab60:	9e620121	scvtf	d1, x9
   0x0000fffff7faab64:	14000002	b	0xfffff7faab6c
   0x0000fffff7faab68:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faab6c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faab70:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faab74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faab78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faab7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faab80:	17ffffde	b	0xfffff7faaaf8
   0x0000fffff7faab84:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faab88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faab8c:	aa1303e1	mov	x1, x19
   0x0000fffff7faab90:	aa1503e2	mov	x2, x21
   0x0000fffff7faab94:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7faab98:	aa1403e4	mov	x4, x20
   0x0000fffff7faab9c:	aa1603e5	mov	x5, x22
   0x0000fffff7faaba0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faaba4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faaba8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faabac:	d63f0200	blr	x16
   0x0000fffff7faabb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faabb4:	54008ae0	b.eq	0xfffff7fabd10  // b.none
   0x0000fffff7faabb8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faabbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faabc0:	aa1303e1	mov	x1, x19
   0x0000fffff7faabc4:	aa1503e2	mov	x2, x21
   0x0000fffff7faabc8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7faabcc:	aa1403e4	mov	x4, x20
   0x0000fffff7faabd0:	aa1603e5	mov	x5, x22
   0x0000fffff7faabd4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faabd8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faabdc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faabe0:	d63f0200	blr	x16
   0x0000fffff7faabe4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faabe8:	54008980	b.eq	0xfffff7fabd18  // b.none
   0x0000fffff7faabec:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faabf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faabf4:	aa1303e1	mov	x1, x19
   0x0000fffff7faabf8:	aa1503e2	mov	x2, x21
   0x0000fffff7faabfc:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7faac00:	aa1403e4	mov	x4, x20
   0x0000fffff7faac04:	aa1603e5	mov	x5, x22
   0x0000fffff7faac08:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faac0c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faac10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faac14:	d63f0200	blr	x16
   0x0000fffff7faac18:	f100001f	cmp	x0, #0x0
   0x0000fffff7faac1c:	54008820	b.eq	0xfffff7fabd20  // b.none
   0x0000fffff7faac20:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faac24:	f100017f	cmp	x11, #0x0
   0x0000fffff7faac28:	540004a0	b.eq	0xfffff7faacbc  // b.none
   0x0000fffff7faac2c:	b940016d	ldr	w13, [x11]
   0x0000fffff7faac30:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faac34:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faac38:	eb0901bf	cmp	x13, x9
   0x0000fffff7faac3c:	54000400	b.eq	0xfffff7faacbc  // b.none
   0x0000fffff7faac40:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faac44:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faac48:	36d801d1	tbz	w17, #27, 0xfffff7faac80
   0x0000fffff7faac4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faac50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faac54:	f100013f	cmp	x9, #0x0
   0x0000fffff7faac58:	54000321	b.ne	0xfffff7faacbc  // b.any
   0x0000fffff7faac5c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faac60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faac64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faac68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faac6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faac70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faac74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faac78:	f100055f	cmp	x10, #0x1
   0x0000fffff7faac7c:	54000209	b.ls	0xfffff7faacbc  // b.plast
   0x0000fffff7faac80:	36d8008d	tbz	w13, #27, 0xfffff7faac90
   0x0000fffff7faac84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faac88:	91000529	add	x9, x9, #0x1
   0x0000fffff7faac8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faac90:	36d80091	tbz	w17, #27, 0xfffff7faaca0
   0x0000fffff7faac94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faac98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faac9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faaca0:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faaca4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faaca8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faacac:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faacb0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faacb4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faacb8:	1400000e	b	0xfffff7faacf0
   0x0000fffff7faacbc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faacc0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faacc4:	aa1303e1	mov	x1, x19
   0x0000fffff7faacc8:	aa1503e2	mov	x2, x21
   0x0000fffff7faaccc:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7faacd0:	aa1403e4	mov	x4, x20
   0x0000fffff7faacd4:	aa1603e5	mov	x5, x22
   0x0000fffff7faacd8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faacdc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faace0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faace4:	d63f0200	blr	x16
   0x0000fffff7faace8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faacec:	540081e0	b.eq	0xfffff7fabd28  // b.none
   0x0000fffff7faacf0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faacf4:	37d806a9	tbnz	w9, #27, 0xfffff7faadc8
   0x0000fffff7faacf8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faacfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faad00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faad04:	eb0a013f	cmp	x9, x10
   0x0000fffff7faad08:	540001c1	b.ne	0xfffff7faad40  // b.any
   0x0000fffff7faad0c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faad10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faad14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faad18:	eb0a013f	cmp	x9, x10
   0x0000fffff7faad1c:	54000121	b.ne	0xfffff7faad40  // b.any
   0x0000fffff7faad20:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faad24:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faad28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faad2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faad30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faad34:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faad38:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faad3c:	14000030	b	0xfffff7faadfc
   0x0000fffff7faad40:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faad44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faad48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faad4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faad50:	54000120	b.eq	0xfffff7faad74  // b.none
   0x0000fffff7faad54:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faad58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faad5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faad60:	eb0a013f	cmp	x9, x10
   0x0000fffff7faad64:	54000321	b.ne	0xfffff7faadc8  // b.any
   0x0000fffff7faad68:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faad6c:	9e620120	scvtf	d0, x9
   0x0000fffff7faad70:	14000002	b	0xfffff7faad78
   0x0000fffff7faad74:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faad78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faad7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faad80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faad84:	eb0a013f	cmp	x9, x10
   0x0000fffff7faad88:	54000120	b.eq	0xfffff7faadac  // b.none
   0x0000fffff7faad8c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faad90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faad94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faad98:	eb0a013f	cmp	x9, x10
   0x0000fffff7faad9c:	54000161	b.ne	0xfffff7faadc8  // b.any
   0x0000fffff7faada0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faada4:	9e620121	scvtf	d1, x9
   0x0000fffff7faada8:	14000002	b	0xfffff7faadb0
   0x0000fffff7faadac:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faadb0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faadb4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faadb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faadbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faadc0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faadc4:	17ffffde	b	0xfffff7faad3c
   0x0000fffff7faadc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faadcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faadd0:	aa1303e1	mov	x1, x19
   0x0000fffff7faadd4:	aa1503e2	mov	x2, x21
   0x0000fffff7faadd8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7faaddc:	aa1403e4	mov	x4, x20
   0x0000fffff7faade0:	aa1603e5	mov	x5, x22
   0x0000fffff7faade4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faade8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faadec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faadf0:	d63f0200	blr	x16
   0x0000fffff7faadf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faadf8:	540079c0	b.eq	0xfffff7fabd30  // b.none
   0x0000fffff7faadfc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faae00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faae04:	aa1303e1	mov	x1, x19
   0x0000fffff7faae08:	aa1503e2	mov	x2, x21
   0x0000fffff7faae0c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7faae10:	aa1403e4	mov	x4, x20
   0x0000fffff7faae14:	aa1603e5	mov	x5, x22
   0x0000fffff7faae18:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faae1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faae20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faae24:	d63f0200	blr	x16
   0x0000fffff7faae28:	f100001f	cmp	x0, #0x0
   0x0000fffff7faae2c:	54007860	b.eq	0xfffff7fabd38  // b.none
   0x0000fffff7faae30:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faae34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faae38:	aa1303e1	mov	x1, x19
   0x0000fffff7faae3c:	aa1503e2	mov	x2, x21
   0x0000fffff7faae40:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7faae44:	aa1403e4	mov	x4, x20
   0x0000fffff7faae48:	aa1603e5	mov	x5, x22
   0x0000fffff7faae4c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faae50:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faae54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faae58:	d63f0200	blr	x16
   0x0000fffff7faae5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faae60:	54007700	b.eq	0xfffff7fabd40  // b.none
   0x0000fffff7faae64:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faae68:	f100017f	cmp	x11, #0x0
   0x0000fffff7faae6c:	540004a0	b.eq	0xfffff7faaf00  // b.none
   0x0000fffff7faae70:	b940016d	ldr	w13, [x11]
   0x0000fffff7faae74:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faae78:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faae7c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faae80:	54000400	b.eq	0xfffff7faaf00  // b.none
   0x0000fffff7faae84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faae88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faae8c:	36d801d1	tbz	w17, #27, 0xfffff7faaec4
   0x0000fffff7faae90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faae94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faae98:	f100013f	cmp	x9, #0x0
   0x0000fffff7faae9c:	54000321	b.ne	0xfffff7faaf00  // b.any
   0x0000fffff7faaea0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faaea4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaea8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faaeac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faaeb0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faaeb4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faaeb8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faaebc:	f100055f	cmp	x10, #0x1
   0x0000fffff7faaec0:	54000209	b.ls	0xfffff7faaf00  // b.plast
   0x0000fffff7faaec4:	36d8008d	tbz	w13, #27, 0xfffff7faaed4
   0x0000fffff7faaec8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faaecc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faaed0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faaed4:	36d80091	tbz	w17, #27, 0xfffff7faaee4
   0x0000fffff7faaed8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaedc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faaee0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faaee4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faaee8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faaeec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faaef0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faaef4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faaef8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faaefc:	1400000e	b	0xfffff7faaf34
   0x0000fffff7faaf00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faaf04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaf08:	aa1303e1	mov	x1, x19
   0x0000fffff7faaf0c:	aa1503e2	mov	x2, x21
   0x0000fffff7faaf10:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7faaf14:	aa1403e4	mov	x4, x20
   0x0000fffff7faaf18:	aa1603e5	mov	x5, x22
   0x0000fffff7faaf1c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faaf20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faaf24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaf28:	d63f0200	blr	x16
   0x0000fffff7faaf2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaf30:	540070c0	b.eq	0xfffff7fabd48  // b.none
   0x0000fffff7faaf34:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaf38:	37d806a9	tbnz	w9, #27, 0xfffff7fab00c
   0x0000fffff7faaf3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaf40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaf44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaf48:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaf4c:	540001c1	b.ne	0xfffff7faaf84  // b.any
   0x0000fffff7faaf50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faaf54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaf58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaf5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaf60:	54000121	b.ne	0xfffff7faaf84  // b.any
   0x0000fffff7faaf64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faaf68:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faaf6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faaf70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faaf74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaf78:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faaf7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faaf80:	14000030	b	0xfffff7fab040
   0x0000fffff7faaf84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaf88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faaf8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaf90:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaf94:	54000120	b.eq	0xfffff7faafb8  // b.none
   0x0000fffff7faaf98:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faaf9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faafa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faafa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faafa8:	54000321	b.ne	0xfffff7fab00c  // b.any
   0x0000fffff7faafac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faafb0:	9e620120	scvtf	d0, x9
   0x0000fffff7faafb4:	14000002	b	0xfffff7faafbc
   0x0000fffff7faafb8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faafbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faafc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faafc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faafc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faafcc:	54000120	b.eq	0xfffff7faaff0  // b.none
   0x0000fffff7faafd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faafd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faafd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faafdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faafe0:	54000161	b.ne	0xfffff7fab00c  // b.any
   0x0000fffff7faafe4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faafe8:	9e620121	scvtf	d1, x9
   0x0000fffff7faafec:	14000002	b	0xfffff7faaff4
   0x0000fffff7faaff0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faaff4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faaff8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faaffc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab004:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab008:	17ffffde	b	0xfffff7faaf80
   0x0000fffff7fab00c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab010:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab014:	aa1303e1	mov	x1, x19
   0x0000fffff7fab018:	aa1503e2	mov	x2, x21
   0x0000fffff7fab01c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fab020:	aa1403e4	mov	x4, x20
   0x0000fffff7fab024:	aa1603e5	mov	x5, x22
   0x0000fffff7fab028:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab02c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab030:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab034:	d63f0200	blr	x16
   0x0000fffff7fab038:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab03c:	540068a0	b.eq	0xfffff7fabd50  // b.none
   0x0000fffff7fab040:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab044:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab048:	aa1303e1	mov	x1, x19
   0x0000fffff7fab04c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab050:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fab054:	aa1403e4	mov	x4, x20
   0x0000fffff7fab058:	aa1603e5	mov	x5, x22
   0x0000fffff7fab05c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fab060:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab064:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab068:	d63f0200	blr	x16
   0x0000fffff7fab06c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab070:	54006740	b.eq	0xfffff7fabd58  // b.none
   0x0000fffff7fab074:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab078:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab07c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab080:	aa1503e2	mov	x2, x21
   0x0000fffff7fab084:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fab088:	aa1403e4	mov	x4, x20
   0x0000fffff7fab08c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab090:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fab094:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab098:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab09c:	d63f0200	blr	x16
   0x0000fffff7fab0a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab0a4:	540065e0	b.eq	0xfffff7fabd60  // b.none
   0x0000fffff7fab0a8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab0ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab0b0:	540004a0	b.eq	0xfffff7fab144  // b.none
   0x0000fffff7fab0b4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab0b8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab0bc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab0c0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab0c4:	54000400	b.eq	0xfffff7fab144  // b.none
   0x0000fffff7fab0c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab0cc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab0d0:	36d801d1	tbz	w17, #27, 0xfffff7fab108
   0x0000fffff7fab0d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab0d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab0dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab0e0:	54000321	b.ne	0xfffff7fab144  // b.any
   0x0000fffff7fab0e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab0e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab0ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab0f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab0f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab0f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab0fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab100:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab104:	54000209	b.ls	0xfffff7fab144  // b.plast
   0x0000fffff7fab108:	36d8008d	tbz	w13, #27, 0xfffff7fab118
   0x0000fffff7fab10c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab110:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab114:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab118:	36d80091	tbz	w17, #27, 0xfffff7fab128
   0x0000fffff7fab11c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab120:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab124:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab128:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fab12c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fab130:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab134:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab138:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fab13c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fab140:	1400000e	b	0xfffff7fab178
   0x0000fffff7fab144:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab14c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab150:	aa1503e2	mov	x2, x21
   0x0000fffff7fab154:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fab158:	aa1403e4	mov	x4, x20
   0x0000fffff7fab15c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab160:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab16c:	d63f0200	blr	x16
   0x0000fffff7fab170:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab174:	54005fa0	b.eq	0xfffff7fabd68  // b.none
   0x0000fffff7fab178:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab17c:	37d806a9	tbnz	w9, #27, 0xfffff7fab250
   0x0000fffff7fab180:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab184:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab188:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab18c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab190:	540001c1	b.ne	0xfffff7fab1c8  // b.any
   0x0000fffff7fab194:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab19c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab1a4:	54000121	b.ne	0xfffff7fab1c8  // b.any
   0x0000fffff7fab1a8:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab1ac:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fab1b0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab1b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab1b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1bc:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fab1c0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab1c4:	14000030	b	0xfffff7fab284
   0x0000fffff7fab1c8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab1cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab1d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab1d8:	54000120	b.eq	0xfffff7fab1fc  // b.none
   0x0000fffff7fab1dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab1e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab1e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab1e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab1ec:	54000321	b.ne	0xfffff7fab250  // b.any
   0x0000fffff7fab1f0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab1f4:	9e620120	scvtf	d0, x9
   0x0000fffff7fab1f8:	14000002	b	0xfffff7fab200
   0x0000fffff7fab1fc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fab200:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab20c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab210:	54000120	b.eq	0xfffff7fab234  // b.none
   0x0000fffff7fab214:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab21c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab220:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab224:	54000161	b.ne	0xfffff7fab250  // b.any
   0x0000fffff7fab228:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab22c:	9e620121	scvtf	d1, x9
   0x0000fffff7fab230:	14000002	b	0xfffff7fab238
   0x0000fffff7fab234:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fab238:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab23c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fab240:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab244:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab248:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab24c:	17ffffde	b	0xfffff7fab1c4
   0x0000fffff7fab250:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab258:	aa1303e1	mov	x1, x19
   0x0000fffff7fab25c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab260:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fab264:	aa1403e4	mov	x4, x20
   0x0000fffff7fab268:	aa1603e5	mov	x5, x22
   0x0000fffff7fab26c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab270:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab278:	d63f0200	blr	x16
   0x0000fffff7fab27c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab280:	54005780	b.eq	0xfffff7fabd70  // b.none
   0x0000fffff7fab284:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab288:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab28c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab290:	aa1503e2	mov	x2, x21
   0x0000fffff7fab294:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fab298:	aa1403e4	mov	x4, x20
   0x0000fffff7fab29c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab2a0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fab2a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab2a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab2ac:	d63f0200	blr	x16
   0x0000fffff7fab2b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab2b4:	54005620	b.eq	0xfffff7fabd78  // b.none
   0x0000fffff7fab2b8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab2bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab2c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fab2c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fab2c8:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fab2cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fab2d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab2d4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fab2d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab2dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab2e0:	d63f0200	blr	x16
   0x0000fffff7fab2e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab2e8:	540054c0	b.eq	0xfffff7fabd80  // b.none
   0x0000fffff7fab2ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab2f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab2f4:	540004a0	b.eq	0xfffff7fab388  // b.none
   0x0000fffff7fab2f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab2fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab300:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab304:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab308:	54000400	b.eq	0xfffff7fab388  // b.none
   0x0000fffff7fab30c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab310:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab314:	36d801d1	tbz	w17, #27, 0xfffff7fab34c
   0x0000fffff7fab318:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab31c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab320:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab324:	54000321	b.ne	0xfffff7fab388  // b.any
   0x0000fffff7fab328:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab32c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab330:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab334:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab338:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab33c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab340:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab344:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab348:	54000209	b.ls	0xfffff7fab388  // b.plast
   0x0000fffff7fab34c:	36d8008d	tbz	w13, #27, 0xfffff7fab35c
   0x0000fffff7fab350:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab354:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab358:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab35c:	36d80091	tbz	w17, #27, 0xfffff7fab36c
   0x0000fffff7fab360:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab364:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab368:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab36c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fab370:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fab374:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab378:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab37c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fab380:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fab384:	1400000e	b	0xfffff7fab3bc
   0x0000fffff7fab388:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab38c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab390:	aa1303e1	mov	x1, x19
   0x0000fffff7fab394:	aa1503e2	mov	x2, x21
   0x0000fffff7fab398:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fab39c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab3a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab3a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab3a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab3ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab3b0:	d63f0200	blr	x16
   0x0000fffff7fab3b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab3b8:	54004e80	b.eq	0xfffff7fabd88  // b.none
   0x0000fffff7fab3bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab3c0:	37d806a9	tbnz	w9, #27, 0xfffff7fab494
   0x0000fffff7fab3c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab3c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab3cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab3d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab3d4:	540001c1	b.ne	0xfffff7fab40c  // b.any
   0x0000fffff7fab3d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab3dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab3e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab3e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab3e8:	54000121	b.ne	0xfffff7fab40c  // b.any
   0x0000fffff7fab3ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab3f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fab3f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab3f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab3fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab400:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fab404:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab408:	14000030	b	0xfffff7fab4c8
   0x0000fffff7fab40c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab410:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab418:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab41c:	54000120	b.eq	0xfffff7fab440  // b.none
   0x0000fffff7fab420:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab424:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab42c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab430:	54000321	b.ne	0xfffff7fab494  // b.any
   0x0000fffff7fab434:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab438:	9e620120	scvtf	d0, x9
   0x0000fffff7fab43c:	14000002	b	0xfffff7fab444
   0x0000fffff7fab440:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fab444:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab448:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab44c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab450:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab454:	54000120	b.eq	0xfffff7fab478  // b.none
   0x0000fffff7fab458:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab45c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab460:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab464:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab468:	54000161	b.ne	0xfffff7fab494  // b.any
   0x0000fffff7fab46c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab470:	9e620121	scvtf	d1, x9
   0x0000fffff7fab474:	14000002	b	0xfffff7fab47c
   0x0000fffff7fab478:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fab47c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab480:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fab484:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab488:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab48c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab490:	17ffffde	b	0xfffff7fab408
   0x0000fffff7fab494:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab49c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab4a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fab4a4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fab4a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fab4ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fab4b0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab4b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab4b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab4bc:	d63f0200	blr	x16
   0x0000fffff7fab4c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab4c4:	54004660	b.eq	0xfffff7fabd90  // b.none
   0x0000fffff7fab4c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab4cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab4d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fab4d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fab4d8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fab4dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fab4e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab4e4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fab4e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab4ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab4f0:	d63f0200	blr	x16
   0x0000fffff7fab4f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab4f8:	54004500	b.eq	0xfffff7fabd98  // b.none
   0x0000fffff7fab4fc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab500:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab504:	aa1303e1	mov	x1, x19
   0x0000fffff7fab508:	aa1503e2	mov	x2, x21
   0x0000fffff7fab50c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fab510:	aa1403e4	mov	x4, x20
   0x0000fffff7fab514:	aa1603e5	mov	x5, x22
   0x0000fffff7fab518:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fab51c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab520:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab524:	d63f0200	blr	x16
   0x0000fffff7fab528:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab52c:	540043a0	b.eq	0xfffff7fabda0  // b.none
   0x0000fffff7fab530:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab534:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab538:	540004a0	b.eq	0xfffff7fab5cc  // b.none
   0x0000fffff7fab53c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab540:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab544:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab548:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab54c:	54000400	b.eq	0xfffff7fab5cc  // b.none
   0x0000fffff7fab550:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab554:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab558:	36d801d1	tbz	w17, #27, 0xfffff7fab590
   0x0000fffff7fab55c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab560:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab564:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab568:	54000321	b.ne	0xfffff7fab5cc  // b.any
   0x0000fffff7fab56c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab570:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab574:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab578:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab57c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab580:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab584:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab588:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab58c:	54000209	b.ls	0xfffff7fab5cc  // b.plast
   0x0000fffff7fab590:	36d8008d	tbz	w13, #27, 0xfffff7fab5a0
   0x0000fffff7fab594:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab598:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab59c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab5a0:	36d80091	tbz	w17, #27, 0xfffff7fab5b0
   0x0000fffff7fab5a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab5a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab5ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab5b0:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fab5b4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fab5b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab5bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab5c0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fab5c4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fab5c8:	1400000e	b	0xfffff7fab600
   0x0000fffff7fab5cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab5d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab5d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fab5d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fab5dc:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fab5e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fab5e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fab5e8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab5ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab5f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab5f4:	d63f0200	blr	x16
   0x0000fffff7fab5f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab5fc:	54003d60	b.eq	0xfffff7fabda8  // b.none
   0x0000fffff7fab600:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab604:	37d806a9	tbnz	w9, #27, 0xfffff7fab6d8
   0x0000fffff7fab608:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab60c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab614:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab618:	540001c1	b.ne	0xfffff7fab650  // b.any
   0x0000fffff7fab61c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab62c:	54000121	b.ne	0xfffff7fab650  // b.any
   0x0000fffff7fab630:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab634:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fab638:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab63c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab644:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fab648:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab64c:	14000030	b	0xfffff7fab70c
   0x0000fffff7fab650:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab654:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab65c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab660:	54000120	b.eq	0xfffff7fab684  // b.none
   0x0000fffff7fab664:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab668:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab66c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab674:	54000321	b.ne	0xfffff7fab6d8  // b.any
   0x0000fffff7fab678:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab67c:	9e620120	scvtf	d0, x9
   0x0000fffff7fab680:	14000002	b	0xfffff7fab688
   0x0000fffff7fab684:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fab688:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab68c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab698:	54000120	b.eq	0xfffff7fab6bc  // b.none
   0x0000fffff7fab69c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab6a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab6a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab6ac:	54000161	b.ne	0xfffff7fab6d8  // b.any
   0x0000fffff7fab6b0:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab6b4:	9e620121	scvtf	d1, x9
   0x0000fffff7fab6b8:	14000002	b	0xfffff7fab6c0
   0x0000fffff7fab6bc:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fab6c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab6c4:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fab6c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab6cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6d0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab6d4:	17ffffde	b	0xfffff7fab64c
   0x0000fffff7fab6d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab6dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab6e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fab6e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fab6e8:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fab6ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fab6f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab6f4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab6f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab6fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab700:	d63f0200	blr	x16
   0x0000fffff7fab704:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab708:	54003540	b.eq	0xfffff7fabdb0  // b.none
   0x0000fffff7fab70c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab710:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab714:	aa1303e1	mov	x1, x19
   0x0000fffff7fab718:	aa1503e2	mov	x2, x21
   0x0000fffff7fab71c:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fab720:	aa1403e4	mov	x4, x20
   0x0000fffff7fab724:	aa1603e5	mov	x5, x22
   0x0000fffff7fab728:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fab72c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab730:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab734:	d63f0200	blr	x16
   0x0000fffff7fab738:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab73c:	540033e0	b.eq	0xfffff7fabdb8  // b.none
   0x0000fffff7fab740:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab744:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab748:	aa1303e1	mov	x1, x19
   0x0000fffff7fab74c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab750:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fab754:	aa1403e4	mov	x4, x20
   0x0000fffff7fab758:	aa1603e5	mov	x5, x22
   0x0000fffff7fab75c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fab760:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab764:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab768:	d63f0200	blr	x16
   0x0000fffff7fab76c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab770:	54003280	b.eq	0xfffff7fabdc0  // b.none
   0x0000fffff7fab774:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab778:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab77c:	540004a0	b.eq	0xfffff7fab810  // b.none
   0x0000fffff7fab780:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab784:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab788:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab78c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab790:	54000400	b.eq	0xfffff7fab810  // b.none
   0x0000fffff7fab794:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab798:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab79c:	36d801d1	tbz	w17, #27, 0xfffff7fab7d4
   0x0000fffff7fab7a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab7a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab7a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab7ac:	54000321	b.ne	0xfffff7fab810  // b.any
   0x0000fffff7fab7b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab7b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab7b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab7bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab7c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab7c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab7c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab7cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab7d0:	54000209	b.ls	0xfffff7fab810  // b.plast
   0x0000fffff7fab7d4:	36d8008d	tbz	w13, #27, 0xfffff7fab7e4
   0x0000fffff7fab7d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab7dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab7e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab7e4:	36d80091	tbz	w17, #27, 0xfffff7fab7f4
   0x0000fffff7fab7e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab7ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab7f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab7f4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fab7f8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fab7fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab800:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab804:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fab808:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fab80c:	1400000e	b	0xfffff7fab844
   0x0000fffff7fab810:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab818:	aa1303e1	mov	x1, x19
   0x0000fffff7fab81c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab820:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fab824:	aa1403e4	mov	x4, x20
   0x0000fffff7fab828:	aa1603e5	mov	x5, x22
   0x0000fffff7fab82c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab830:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab838:	d63f0200	blr	x16
   0x0000fffff7fab83c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab840:	54002c40	b.eq	0xfffff7fabdc8  // b.none
   0x0000fffff7fab844:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab848:	37d806a9	tbnz	w9, #27, 0xfffff7fab91c
   0x0000fffff7fab84c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab850:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab858:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab85c:	540001c1	b.ne	0xfffff7fab894  // b.any
   0x0000fffff7fab860:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab86c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab870:	54000121	b.ne	0xfffff7fab894  // b.any
   0x0000fffff7fab874:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab878:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fab87c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab888:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fab88c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab890:	14000030	b	0xfffff7fab950
   0x0000fffff7fab894:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab898:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab89c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab8a4:	54000120	b.eq	0xfffff7fab8c8  // b.none
   0x0000fffff7fab8a8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fab8ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab8b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab8b8:	54000321	b.ne	0xfffff7fab91c  // b.any
   0x0000fffff7fab8bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fab8c0:	9e620120	scvtf	d0, x9
   0x0000fffff7fab8c4:	14000002	b	0xfffff7fab8cc
   0x0000fffff7fab8c8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fab8cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab8d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab8d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab8dc:	54000120	b.eq	0xfffff7fab900  // b.none
   0x0000fffff7fab8e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab8e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab8e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab8ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab8f0:	54000161	b.ne	0xfffff7fab91c  // b.any
   0x0000fffff7fab8f4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab8f8:	9e620121	scvtf	d1, x9
   0x0000fffff7fab8fc:	14000002	b	0xfffff7fab904
   0x0000fffff7fab900:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fab904:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab908:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fab90c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab914:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fab918:	17ffffde	b	0xfffff7fab890
   0x0000fffff7fab91c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab920:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab924:	aa1303e1	mov	x1, x19
   0x0000fffff7fab928:	aa1503e2	mov	x2, x21
   0x0000fffff7fab92c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fab930:	aa1403e4	mov	x4, x20
   0x0000fffff7fab934:	aa1603e5	mov	x5, x22
   0x0000fffff7fab938:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab93c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab940:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab944:	d63f0200	blr	x16
   0x0000fffff7fab948:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab94c:	54002420	b.eq	0xfffff7fabdd0  // b.none
   0x0000fffff7fab950:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab954:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab958:	aa1303e1	mov	x1, x19
   0x0000fffff7fab95c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab960:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fab964:	aa1403e4	mov	x4, x20
   0x0000fffff7fab968:	aa1603e5	mov	x5, x22
   0x0000fffff7fab96c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fab970:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab974:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab978:	d63f0200	blr	x16
   0x0000fffff7fab97c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab980:	540022c0	b.eq	0xfffff7fabdd8  // b.none
   0x0000fffff7fab984:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab988:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab98c:	aa1303e1	mov	x1, x19
   0x0000fffff7fab990:	aa1503e2	mov	x2, x21
   0x0000fffff7fab994:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fab998:	aa1403e4	mov	x4, x20
   0x0000fffff7fab99c:	aa1603e5	mov	x5, x22
   0x0000fffff7fab9a0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fab9a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab9a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab9ac:	d63f0200	blr	x16
   0x0000fffff7fab9b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab9b4:	54002160	b.eq	0xfffff7fabde0  // b.none
   0x0000fffff7fab9b8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab9bc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab9c0:	540004a0	b.eq	0xfffff7faba54  // b.none
   0x0000fffff7fab9c4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab9c8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab9cc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab9d0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab9d4:	54000400	b.eq	0xfffff7faba54  // b.none
   0x0000fffff7fab9d8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab9dc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab9e0:	36d801d1	tbz	w17, #27, 0xfffff7faba18
   0x0000fffff7fab9e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab9e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab9ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab9f0:	54000321	b.ne	0xfffff7faba54  // b.any
   0x0000fffff7fab9f4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab9f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab9fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faba00:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faba04:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faba08:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faba0c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faba10:	f100055f	cmp	x10, #0x1
   0x0000fffff7faba14:	54000209	b.ls	0xfffff7faba54  // b.plast
   0x0000fffff7faba18:	36d8008d	tbz	w13, #27, 0xfffff7faba28
   0x0000fffff7faba1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faba20:	91000529	add	x9, x9, #0x1
   0x0000fffff7faba24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faba28:	36d80091	tbz	w17, #27, 0xfffff7faba38
   0x0000fffff7faba2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faba30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faba34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faba38:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faba3c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faba40:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faba44:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faba48:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faba4c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faba50:	1400000e	b	0xfffff7faba88
   0x0000fffff7faba54:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faba58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faba5c:	aa1303e1	mov	x1, x19
   0x0000fffff7faba60:	aa1503e2	mov	x2, x21
   0x0000fffff7faba64:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7faba68:	aa1403e4	mov	x4, x20
   0x0000fffff7faba6c:	aa1603e5	mov	x5, x22
   0x0000fffff7faba70:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faba74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faba78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faba7c:	d63f0200	blr	x16
   0x0000fffff7faba80:	f100001f	cmp	x0, #0x0
   0x0000fffff7faba84:	54001b20	b.eq	0xfffff7fabde8  // b.none
   0x0000fffff7faba88:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faba8c:	37d806a9	tbnz	w9, #27, 0xfffff7fabb60
   0x0000fffff7faba90:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faba94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faba98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faba9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabaa0:	540001c1	b.ne	0xfffff7fabad8  // b.any
   0x0000fffff7fabaa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabaa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabaac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabab4:	54000121	b.ne	0xfffff7fabad8  // b.any
   0x0000fffff7fabab8:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fababc:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fabac0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fabac4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabac8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabacc:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fabad0:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fabad4:	14000030	b	0xfffff7fabb94
   0x0000fffff7fabad8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabadc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabae0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabae4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabae8:	54000120	b.eq	0xfffff7fabb0c  // b.none
   0x0000fffff7fabaec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fabaf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabaf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabaf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabafc:	54000321	b.ne	0xfffff7fabb60  // b.any
   0x0000fffff7fabb00:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fabb04:	9e620120	scvtf	d0, x9
   0x0000fffff7fabb08:	14000002	b	0xfffff7fabb10
   0x0000fffff7fabb0c:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fabb10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabb14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabb18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb20:	54000120	b.eq	0xfffff7fabb44  // b.none
   0x0000fffff7fabb24:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fabb28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabb2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fabb34:	54000161	b.ne	0xfffff7fabb60  // b.any
   0x0000fffff7fabb38:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fabb3c:	9e620121	scvtf	d1, x9
   0x0000fffff7fabb40:	14000002	b	0xfffff7fabb48
   0x0000fffff7fabb44:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fabb48:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fabb4c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fabb50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fabb54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabb58:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fabb5c:	17ffffde	b	0xfffff7fabad4
   0x0000fffff7fabb60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabb64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabb68:	aa1303e1	mov	x1, x19
   0x0000fffff7fabb6c:	aa1503e2	mov	x2, x21
   0x0000fffff7fabb70:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7fabb74:	aa1403e4	mov	x4, x20
   0x0000fffff7fabb78:	aa1603e5	mov	x5, x22
   0x0000fffff7fabb7c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fabb80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabb84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabb88:	d63f0200	blr	x16
   0x0000fffff7fabb8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabb90:	54001300	b.eq	0xfffff7fabdf0  // b.none
   0x0000fffff7fabb94:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabb98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabb9c:	aa1303e1	mov	x1, x19
   0x0000fffff7fabba0:	aa1503e2	mov	x2, x21
   0x0000fffff7fabba4:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7fabba8:	aa1403e4	mov	x4, x20
   0x0000fffff7fabbac:	aa1603e5	mov	x5, x22
   0x0000fffff7fabbb0:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fabbb4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabbb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabbbc:	d63f0200	blr	x16
   0x0000fffff7fabbc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabbc4:	540011a0	b.eq	0xfffff7fabdf8  // b.none
   0x0000fffff7fabbc8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fabbcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabbd0:	aa1303e1	mov	x1, x19
   0x0000fffff7fabbd4:	aa1503e2	mov	x2, x21
   0x0000fffff7fabbd8:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7fabbdc:	aa1403e4	mov	x4, x20
   0x0000fffff7fabbe0:	aa1603e5	mov	x5, x22
   0x0000fffff7fabbe4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fabbe8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabbec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabbf0:	d63f0200	blr	x16
   0x0000fffff7fabbf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabbf8:	54001040	b.eq	0xfffff7fabe00  // b.none
   0x0000fffff7fabbfc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabc00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabc04:	aa1303e1	mov	x1, x19
   0x0000fffff7fabc08:	aa1503e2	mov	x2, x21
   0x0000fffff7fabc0c:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7fabc10:	aa1403e4	mov	x4, x20
   0x0000fffff7fabc14:	aa1603e5	mov	x5, x22
   0x0000fffff7fabc18:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fabc1c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabc20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabc24:	d63f0200	blr	x16
   0x0000fffff7fabc28:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fabc2c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fabc30:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fabc34:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fabc38:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fabc3c:	d65f03c0	ret
   0x0000fffff7fabc40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabc44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabc48:	b900028a	str	w10, [x20]
   0x0000fffff7fabc4c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fabc50:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fabc54:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fabc58:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fabc5c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fabc60:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fabc64:	d65f03c0	ret
   0x0000fffff7fabc68:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fabc6c:	17fffff5	b	0xfffff7fabc40
   0x0000fffff7fabc70:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fabc74:	17fffff3	b	0xfffff7fabc40
   0x0000fffff7fabc78:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fabc7c:	17fffff1	b	0xfffff7fabc40
   0x0000fffff7fabc80:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fabc84:	17ffffef	b	0xfffff7fabc40
   0x0000fffff7fabc88:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fabc8c:	17ffffed	b	0xfffff7fabc40
   0x0000fffff7fabc90:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fabc94:	17ffffeb	b	0xfffff7fabc40
   0x0000fffff7fabc98:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fabc9c:	17ffffe9	b	0xfffff7fabc40
   0x0000fffff7fabca0:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fabca4:	17ffffe7	b	0xfffff7fabc40
   0x0000fffff7fabca8:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fabcac:	17ffffe5	b	0xfffff7fabc40
   0x0000fffff7fabcb0:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fabcb4:	17ffffe3	b	0xfffff7fabc40
   0x0000fffff7fabcb8:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fabcbc:	17ffffe1	b	0xfffff7fabc40
   0x0000fffff7fabcc0:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fabcc4:	17ffffdf	b	0xfffff7fabc40
   0x0000fffff7fabcc8:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fabccc:	17ffffdd	b	0xfffff7fabc40
   0x0000fffff7fabcd0:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fabcd4:	17ffffdb	b	0xfffff7fabc40
   0x0000fffff7fabcd8:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fabcdc:	17ffffd9	b	0xfffff7fabc40
   0x0000fffff7fabce0:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fabce4:	17ffffd7	b	0xfffff7fabc40
   0x0000fffff7fabce8:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fabcec:	17ffffd5	b	0xfffff7fabc40
   0x0000fffff7fabcf0:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fabcf4:	17ffffd3	b	0xfffff7fabc40
   0x0000fffff7fabcf8:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fabcfc:	17ffffd1	b	0xfffff7fabc40
   0x0000fffff7fabd00:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fabd04:	17ffffcf	b	0xfffff7fabc40
   0x0000fffff7fabd08:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fabd0c:	17ffffcd	b	0xfffff7fabc40
   0x0000fffff7fabd10:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fabd14:	17ffffcb	b	0xfffff7fabc40
   0x0000fffff7fabd18:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fabd1c:	17ffffc9	b	0xfffff7fabc40
   0x0000fffff7fabd20:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fabd24:	17ffffc7	b	0xfffff7fabc40
   0x0000fffff7fabd28:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fabd2c:	17ffffc5	b	0xfffff7fabc40
   0x0000fffff7fabd30:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fabd34:	17ffffc3	b	0xfffff7fabc40
   0x0000fffff7fabd38:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fabd3c:	17ffffc1	b	0xfffff7fabc40
   0x0000fffff7fabd40:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fabd44:	17ffffbf	b	0xfffff7fabc40
   0x0000fffff7fabd48:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fabd4c:	17ffffbd	b	0xfffff7fabc40
   0x0000fffff7fabd50:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fabd54:	17ffffbb	b	0xfffff7fabc40
   0x0000fffff7fabd58:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fabd5c:	17ffffb9	b	0xfffff7fabc40
   0x0000fffff7fabd60:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fabd64:	17ffffb7	b	0xfffff7fabc40
   0x0000fffff7fabd68:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fabd6c:	17ffffb5	b	0xfffff7fabc40
   0x0000fffff7fabd70:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fabd74:	17ffffb3	b	0xfffff7fabc40
   0x0000fffff7fabd78:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fabd7c:	17ffffb1	b	0xfffff7fabc40
   0x0000fffff7fabd80:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fabd84:	17ffffaf	b	0xfffff7fabc40
   0x0000fffff7fabd88:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fabd8c:	17ffffad	b	0xfffff7fabc40
   0x0000fffff7fabd90:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fabd94:	17ffffab	b	0xfffff7fabc40
   0x0000fffff7fabd98:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fabd9c:	17ffffa9	b	0xfffff7fabc40
   0x0000fffff7fabda0:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fabda4:	17ffffa7	b	0xfffff7fabc40
   0x0000fffff7fabda8:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fabdac:	17ffffa5	b	0xfffff7fabc40
   0x0000fffff7fabdb0:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fabdb4:	17ffffa3	b	0xfffff7fabc40
   0x0000fffff7fabdb8:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fabdbc:	17ffffa1	b	0xfffff7fabc40
   0x0000fffff7fabdc0:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fabdc4:	17ffff9f	b	0xfffff7fabc40
   0x0000fffff7fabdc8:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fabdcc:	17ffff9d	b	0xfffff7fabc40
   0x0000fffff7fabdd0:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fabdd4:	17ffff9b	b	0xfffff7fabc40
   0x0000fffff7fabdd8:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fabddc:	17ffff99	b	0xfffff7fabc40
   0x0000fffff7fabde0:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fabde4:	17ffff97	b	0xfffff7fabc40
   0x0000fffff7fabde8:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7fabdec:	17ffff95	b	0xfffff7fabc40
   0x0000fffff7fabdf0:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7fabdf4:	17ffff93	b	0xfffff7fabc40
   0x0000fffff7fabdf8:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7fabdfc:	17ffff91	b	0xfffff7fabc40
   0x0000fffff7fabe00:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7fabe04:	17ffff8f	b	0xfffff7fabc40
   0x0000fffff7fabe08:	00000000	udf	#0
   0x0000fffff7fabe0c:	00000000	udf	#0
   0x0000fffff7fabe10:	00000000	udf	#0
   0x0000fffff7fabe14:	00000000	udf	#0
   0x0000fffff7fabe18:	00000000	udf	#0
   0x0000fffff7fabe1c:	00000000	udf	#0
   0x0000fffff7fabe20:	00000000	udf	#0
   0x0000fffff7fabe24:	00000000	udf	#0
   0x0000fffff7fabe28:	00000000	udf	#0
   0x0000fffff7fabe2c:	00000000	udf	#0
   0x0000fffff7fabe30:	00000000	udf	#0
   0x0000fffff7fabe34:	00000000	udf	#0
   0x0000fffff7fabe38:	00000000	udf	#0
   0x0000fffff7fabe3c:	00000000	udf	#0
   0x0000fffff7fabe40:	00000000	udf	#0
   0x0000fffff7fabe44:	00000000	udf	#0
   0x0000fffff7fabe48:	00000000	udf	#0
   0x0000fffff7fabe4c:	00000000	udf	#0
   0x0000fffff7fabe50:	00000000	udf	#0
   0x0000fffff7fabe54:	00000000	udf	#0
   0x0000fffff7fabe58:	00000000	udf	#0
   0x0000fffff7fabe5c:	00000000	udf	#0
   0x0000fffff7fabe60:	00000000	udf	#0
   0x0000fffff7fabe64:	00000000	udf	#0
   0x0000fffff7fabe68:	00000000	udf	#0
   0x0000fffff7fabe6c:	00000000	udf	#0
   0x0000fffff7fabe70:	00000000	udf	#0
   0x0000fffff7fabe74:	00000000	udf	#0
   0x0000fffff7fabe78:	00000000	udf	#0
   0x0000fffff7fabe7c:	00000000	udf	#0
   0x0000fffff7fabe80:	00000000	udf	#0
   0x0000fffff7fabe84:	00000000	udf	#0
   0x0000fffff7fabe88:	00000000	udf	#0
   0x0000fffff7fabe8c:	00000000	udf	#0
   0x0000fffff7fabe90:	00000000	udf	#0
   0x0000fffff7fabe94:	00000000	udf	#0
   0x0000fffff7fabe98:	00000000	udf	#0
   0x0000fffff7fabe9c:	00000000	udf	#0
   0x0000fffff7fabea0:	00000000	udf	#0
   0x0000fffff7fabea4:	00000000	udf	#0
   0x0000fffff7fabea8:	00000000	udf	#0
   0x0000fffff7fabeac:	00000000	udf	#0
   0x0000fffff7fabeb0:	00000000	udf	#0
   0x0000fffff7fabeb4:	00000000	udf	#0
   0x0000fffff7fabeb8:	00000000	udf	#0
   0x0000fffff7fabebc:	00000000	udf	#0
   0x0000fffff7fabec0:	00000000	udf	#0
   0x0000fffff7fabec4:	00000000	udf	#0
   0x0000fffff7fabec8:	00000000	udf	#0
   0x0000fffff7fabecc:	00000000	udf	#0
   0x0000fffff7fabed0:	00000000	udf	#0
   0x0000fffff7fabed4:	00000000	udf	#0
   0x0000fffff7fabed8:	00000000	udf	#0
   0x0000fffff7fabedc:	00000000	udf	#0
   0x0000fffff7fabee0:	00000000	udf	#0
   0x0000fffff7fabee4:	00000000	udf	#0
   0x0000fffff7fabee8:	00000000	udf	#0
   0x0000fffff7fabeec:	00000000	udf	#0
   0x0000fffff7fabef0:	00000000	udf	#0
   0x0000fffff7fabef4:	00000000	udf	#0
   0x0000fffff7fabef8:	00000000	udf	#0
   0x0000fffff7fabefc:	00000000	udf	#0
   0x0000fffff7fabf00:	00000000	udf	#0
   0x0000fffff7fabf04:	00000000	udf	#0
   0x0000fffff7fabf08:	00000000	udf	#0
   0x0000fffff7fabf0c:	00000000	udf	#0
   0x0000fffff7fabf10:	00000000	udf	#0
   0x0000fffff7fabf14:	00000000	udf	#0
   0x0000fffff7fabf18:	00000000	udf	#0
   0x0000fffff7fabf1c:	00000000	udf	#0
   0x0000fffff7fabf20:	00000000	udf	#0
   0x0000fffff7fabf24:	00000000	udf	#0
   0x0000fffff7fabf28:	00000000	udf	#0
   0x0000fffff7fabf2c:	00000000	udf	#0
   0x0000fffff7fabf30:	00000000	udf	#0
   0x0000fffff7fabf34:	00000000	udf	#0
   0x0000fffff7fabf38:	00000000	udf	#0
   0x0000fffff7fabf3c:	00000000	udf	#0
   0x0000fffff7fabf40:	00000000	udf	#0
   0x0000fffff7fabf44:	00000000	udf	#0
   0x0000fffff7fabf48:	00000000	udf	#0
   0x0000fffff7fabf4c:	00000000	udf	#0
   0x0000fffff7fabf50:	00000000	udf	#0
   0x0000fffff7fabf54:	00000000	udf	#0
   0x0000fffff7fabf58:	00000000	udf	#0
   0x0000fffff7fabf5c:	00000000	udf	#0
   0x0000fffff7fabf60:	00000000	udf	#0
   0x0000fffff7fabf64:	00000000	udf	#0
   0x0000fffff7fabf68:	00000000	udf	#0
   0x0000fffff7fabf6c:	00000000	udf	#0
   0x0000fffff7fabf70:	00000000	udf	#0
   0x0000fffff7fabf74:	00000000	udf	#0
   0x0000fffff7fabf78:	00000000	udf	#0
   0x0000fffff7fabf7c:	00000000	udf	#0
   0x0000fffff7fabf80:	00000000	udf	#0
   0x0000fffff7fabf84:	00000000	udf	#0
   0x0000fffff7fabf88:	00000000	udf	#0
   0x0000fffff7fabf8c:	00000000	udf	#0
   0x0000fffff7fabf90:	00000000	udf	#0
   0x0000fffff7fabf94:	00000000	udf	#0
   0x0000fffff7fabf98:	00000000	udf	#0
   0x0000fffff7fabf9c:	00000000	udf	#0
   0x0000fffff7fabfa0:	00000000	udf	#0
   0x0000fffff7fabfa4:	00000000	udf	#0
   0x0000fffff7fabfa8:	00000000	udf	#0
   0x0000fffff7fabfac:	00000000	udf	#0
   0x0000fffff7fabfb0:	00000000	udf	#0
   0x0000fffff7fabfb4:	00000000	udf	#0
   0x0000fffff7fabfb8:	00000000	udf	#0
   0x0000fffff7fabfbc:	00000000	udf	#0
   0x0000fffff7fabfc0:	00000000	udf	#0
   0x0000fffff7fabfc4:	00000000	udf	#0
   0x0000fffff7fabfc8:	00000000	udf	#0
   0x0000fffff7fabfcc:	00000000	udf	#0
   0x0000fffff7fabfd0:	00000000	udf	#0
   0x0000fffff7fabfd4:	00000000	udf	#0
   0x0000fffff7fabfd8:	00000000	udf	#0
   0x0000fffff7fabfdc:	00000000	udf	#0
   0x0000fffff7fabfe0:	00000000	udf	#0
   0x0000fffff7fabfe4:	00000000	udf	#0
   0x0000fffff7fabfe8:	00000000	udf	#0
   0x0000fffff7fabfec:	00000000	udf	#0
   0x0000fffff7fabff0:	00000000	udf	#0
   0x0000fffff7fabff4:	00000000	udf	#0
   0x0000fffff7fabff8:	00000000	udf	#0
   0x0000fffff7fabffc:	00000000	udf	#0
End of assembler dump.
