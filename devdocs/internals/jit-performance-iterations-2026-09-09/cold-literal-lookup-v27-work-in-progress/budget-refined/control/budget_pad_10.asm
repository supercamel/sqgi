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
   0x0000fffff7faa058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faa05c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faa060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faa064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faa068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faa06c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7faa070:	36d801d1	tbz	w17, #27, 0xfffff7faa0a8
   0x0000fffff7faa074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa080:	54000281	b.ne	0xfffff7faa0d0  // b.any
   0x0000fffff7faa084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7faa088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa0a4:	54000169	b.ls	0xfffff7faa0d0  // b.plast
   0x0000fffff7faa0a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa0ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa0b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa0b4:	36d80091	tbz	w17, #27, 0xfffff7faa0c4
   0x0000fffff7faa0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa0bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa0c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa0c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7faa0c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7faa0cc:	1400000e	b	0xfffff7faa104
   0x0000fffff7faa0d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa0d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa0d8:	aa1303e1	mov	x1, x19
   0x0000fffff7faa0dc:	aa1503e2	mov	x2, x21
   0x0000fffff7faa0e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7faa0e4:	aa1403e4	mov	x4, x20
   0x0000fffff7faa0e8:	aa1603e5	mov	x5, x22
   0x0000fffff7faa0ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faa0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa0f8:	d63f0200	blr	x16
   0x0000fffff7faa0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa100:	5400d880	b.eq	0xfffff7fabc10  // b.none
   0x0000fffff7faa104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7faa108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7faa10c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7faa110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faa114:	36d80211	tbz	w17, #27, 0xfffff7faa154
   0x0000fffff7faa118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa120:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa124:	540001e1	b.ne	0xfffff7faa160  // b.any
   0x0000fffff7faa128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faa12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa144:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa148:	540000c9	b.ls	0xfffff7faa160  // b.plast
   0x0000fffff7faa14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faa158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faa15c:	1400000e	b	0xfffff7faa194
   0x0000fffff7faa160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa168:	aa1303e1	mov	x1, x19
   0x0000fffff7faa16c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7faa174:	aa1403e4	mov	x4, x20
   0x0000fffff7faa178:	aa1603e5	mov	x5, x22
   0x0000fffff7faa17c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7faa180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa188:	d63f0200	blr	x16
   0x0000fffff7faa18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa190:	5400d440	b.eq	0xfffff7fabc18  // b.none
   0x0000fffff7faa194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa19c:	aa1303e1	mov	x1, x19
   0x0000fffff7faa1a0:	aa1503e2	mov	x2, x21
   0x0000fffff7faa1a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7faa1a8:	aa1403e4	mov	x4, x20
   0x0000fffff7faa1ac:	aa1603e5	mov	x5, x22
   0x0000fffff7faa1b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faa1b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa1b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa1bc:	d63f0200	blr	x16
   0x0000fffff7faa1c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa1c4:	5400d2e0	b.eq	0xfffff7fabc20  // b.none
   0x0000fffff7faa1c8:	14000001	b	0xfffff7faa1cc
   0x0000fffff7faa1cc:	14000001	b	0xfffff7faa1d0
   0x0000fffff7faa1d0:	14000001	b	0xfffff7faa1d4
   0x0000fffff7faa1d4:	14000001	b	0xfffff7faa1d8
   0x0000fffff7faa1d8:	14000001	b	0xfffff7faa1dc
   0x0000fffff7faa1dc:	14000001	b	0xfffff7faa1e0
   0x0000fffff7faa1e0:	14000001	b	0xfffff7faa1e4
   0x0000fffff7faa1e4:	14000001	b	0xfffff7faa1e8
   0x0000fffff7faa1e8:	14000001	b	0xfffff7faa1ec
   0x0000fffff7faa1ec:	14000001	b	0xfffff7faa1f0
   0x0000fffff7faa1f0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7faa1f4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7faa1f8:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7faa1fc:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faa200:	36d80211	tbz	w17, #27, 0xfffff7faa240
   0x0000fffff7faa204:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa208:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa20c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa210:	540001e1	b.ne	0xfffff7faa24c  // b.any
   0x0000fffff7faa214:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faa218:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa21c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa220:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa224:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa228:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa22c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa230:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa234:	540000c9	b.ls	0xfffff7faa24c  // b.plast
   0x0000fffff7faa238:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa23c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa240:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faa244:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faa248:	1400000e	b	0xfffff7faa280
   0x0000fffff7faa24c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa250:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa254:	aa1303e1	mov	x1, x19
   0x0000fffff7faa258:	aa1503e2	mov	x2, x21
   0x0000fffff7faa25c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7faa260:	aa1403e4	mov	x4, x20
   0x0000fffff7faa264:	aa1603e5	mov	x5, x22
   0x0000fffff7faa268:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7faa26c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa270:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa274:	d63f0200	blr	x16
   0x0000fffff7faa278:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa27c:	5400cd60	b.eq	0xfffff7fabc28  // b.none
   0x0000fffff7faa280:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa284:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa288:	aa1303e1	mov	x1, x19
   0x0000fffff7faa28c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa290:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7faa294:	aa1403e4	mov	x4, x20
   0x0000fffff7faa298:	aa1603e5	mov	x5, x22
   0x0000fffff7faa29c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa2a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa2a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa2a8:	d63f0200	blr	x16
   0x0000fffff7faa2ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa2b0:	5400cc00	b.eq	0xfffff7fabc30  // b.none
   0x0000fffff7faa2b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa2b8:	37d806a9	tbnz	w9, #27, 0xfffff7faa38c
   0x0000fffff7faa2bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa2c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa2c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa2c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa2cc:	540001c1	b.ne	0xfffff7faa304  // b.any
   0x0000fffff7faa2d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa2d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa2d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa2dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa2e0:	54000121	b.ne	0xfffff7faa304  // b.any
   0x0000fffff7faa2e4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa2e8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faa2ec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa2f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa2f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa2f8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faa2fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa300:	14000030	b	0xfffff7faa3c0
   0x0000fffff7faa304:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa308:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa30c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa310:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa314:	54000120	b.eq	0xfffff7faa338  // b.none
   0x0000fffff7faa318:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa31c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa324:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa328:	54000321	b.ne	0xfffff7faa38c  // b.any
   0x0000fffff7faa32c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa330:	9e620120	scvtf	d0, x9
   0x0000fffff7faa334:	14000002	b	0xfffff7faa33c
   0x0000fffff7faa338:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faa33c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa340:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa344:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa348:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa34c:	54000120	b.eq	0xfffff7faa370  // b.none
   0x0000fffff7faa350:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa354:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa35c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa360:	54000161	b.ne	0xfffff7faa38c  // b.any
   0x0000fffff7faa364:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faa368:	9e620121	scvtf	d1, x9
   0x0000fffff7faa36c:	14000002	b	0xfffff7faa374
   0x0000fffff7faa370:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7faa374:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa378:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faa37c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa380:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa384:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa388:	17ffffde	b	0xfffff7faa300
   0x0000fffff7faa38c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa390:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa394:	aa1303e1	mov	x1, x19
   0x0000fffff7faa398:	aa1503e2	mov	x2, x21
   0x0000fffff7faa39c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7faa3a0:	aa1403e4	mov	x4, x20
   0x0000fffff7faa3a4:	aa1603e5	mov	x5, x22
   0x0000fffff7faa3a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faa3ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa3b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa3b4:	d63f0200	blr	x16
   0x0000fffff7faa3b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa3bc:	5400c3e0	b.eq	0xfffff7fabc38  // b.none
   0x0000fffff7faa3c0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faa3c4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faa3c8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faa3cc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faa3d0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faa3d4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faa3d8:	36d801d1	tbz	w17, #27, 0xfffff7faa410
   0x0000fffff7faa3dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa3e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa3e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa3e8:	54000281	b.ne	0xfffff7faa438  // b.any
   0x0000fffff7faa3ec:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faa3f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa3f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa3f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa3fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa400:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa404:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa408:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa40c:	54000169	b.ls	0xfffff7faa438  // b.plast
   0x0000fffff7faa410:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa414:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa418:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa41c:	36d80091	tbz	w17, #27, 0xfffff7faa42c
   0x0000fffff7faa420:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa424:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa428:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa42c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faa430:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faa434:	1400000e	b	0xfffff7faa46c
   0x0000fffff7faa438:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa43c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa440:	aa1303e1	mov	x1, x19
   0x0000fffff7faa444:	aa1503e2	mov	x2, x21
   0x0000fffff7faa448:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7faa44c:	aa1403e4	mov	x4, x20
   0x0000fffff7faa450:	aa1603e5	mov	x5, x22
   0x0000fffff7faa454:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faa458:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa45c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa460:	d63f0200	blr	x16
   0x0000fffff7faa464:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa468:	5400bec0	b.eq	0xfffff7fabc40  // b.none
   0x0000fffff7faa46c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faa470:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa474:	540003a0	b.eq	0xfffff7faa4e8  // b.none
   0x0000fffff7faa478:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7faa47c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7faa480:	b9400171	ldr	w17, [x11]
   0x0000fffff7faa484:	36d801d1	tbz	w17, #27, 0xfffff7faa4bc
   0x0000fffff7faa488:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa48c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa490:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa494:	540002a1	b.ne	0xfffff7faa4e8  // b.any
   0x0000fffff7faa498:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faa49c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa4a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa4a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa4a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa4ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa4b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa4b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa4b8:	54000189	b.ls	0xfffff7faa4e8  // b.plast
   0x0000fffff7faa4bc:	36d8008d	tbz	w13, #27, 0xfffff7faa4cc
   0x0000fffff7faa4c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa4c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa4c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa4cc:	36d80091	tbz	w17, #27, 0xfffff7faa4dc
   0x0000fffff7faa4d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa4d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa4d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa4dc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faa4e0:	b900016d	str	w13, [x11]
   0x0000fffff7faa4e4:	1400000e	b	0xfffff7faa51c
   0x0000fffff7faa4e8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa4ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa4f0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa4f4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa4f8:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7faa4fc:	aa1403e4	mov	x4, x20
   0x0000fffff7faa500:	aa1603e5	mov	x5, x22
   0x0000fffff7faa504:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faa508:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa50c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa510:	d63f0200	blr	x16
   0x0000fffff7faa514:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa518:	5400b980	b.eq	0xfffff7fabc48  // b.none
   0x0000fffff7faa51c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa520:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa524:	540004a0	b.eq	0xfffff7faa5b8  // b.none
   0x0000fffff7faa528:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa52c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa530:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa534:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa538:	54000400	b.eq	0xfffff7faa5b8  // b.none
   0x0000fffff7faa53c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa540:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa544:	36d801d1	tbz	w17, #27, 0xfffff7faa57c
   0x0000fffff7faa548:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa54c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa550:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa554:	54000321	b.ne	0xfffff7faa5b8  // b.any
   0x0000fffff7faa558:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa55c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa560:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa564:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa568:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa56c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa570:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa574:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa578:	54000209	b.ls	0xfffff7faa5b8  // b.plast
   0x0000fffff7faa57c:	36d8008d	tbz	w13, #27, 0xfffff7faa58c
   0x0000fffff7faa580:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa584:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa588:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa58c:	36d80091	tbz	w17, #27, 0xfffff7faa59c
   0x0000fffff7faa590:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa594:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa598:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa59c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7faa5a0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faa5a4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa5a8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa5ac:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faa5b0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faa5b4:	1400000e	b	0xfffff7faa5ec
   0x0000fffff7faa5b8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa5bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa5c0:	aa1303e1	mov	x1, x19
   0x0000fffff7faa5c4:	aa1503e2	mov	x2, x21
   0x0000fffff7faa5c8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7faa5cc:	aa1403e4	mov	x4, x20
   0x0000fffff7faa5d0:	aa1603e5	mov	x5, x22
   0x0000fffff7faa5d4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa5d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa5dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa5e0:	d63f0200	blr	x16
   0x0000fffff7faa5e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa5e8:	5400b340	b.eq	0xfffff7fabc50  // b.none
   0x0000fffff7faa5ec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa5f0:	37d806a9	tbnz	w9, #27, 0xfffff7faa6c4
   0x0000fffff7faa5f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa5f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa5fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa600:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa604:	540001c1	b.ne	0xfffff7faa63c  // b.any
   0x0000fffff7faa608:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa60c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa614:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa618:	54000121	b.ne	0xfffff7faa63c  // b.any
   0x0000fffff7faa61c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa620:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faa624:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa62c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa630:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faa634:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa638:	14000030	b	0xfffff7faa6f8
   0x0000fffff7faa63c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa640:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa648:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa64c:	54000120	b.eq	0xfffff7faa670  // b.none
   0x0000fffff7faa650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa654:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa65c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa660:	54000321	b.ne	0xfffff7faa6c4  // b.any
   0x0000fffff7faa664:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa668:	9e620120	scvtf	d0, x9
   0x0000fffff7faa66c:	14000002	b	0xfffff7faa674
   0x0000fffff7faa670:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faa674:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa67c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa680:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa684:	54000120	b.eq	0xfffff7faa6a8  // b.none
   0x0000fffff7faa688:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa68c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa694:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa698:	54000161	b.ne	0xfffff7faa6c4  // b.any
   0x0000fffff7faa69c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faa6a0:	9e620121	scvtf	d1, x9
   0x0000fffff7faa6a4:	14000002	b	0xfffff7faa6ac
   0x0000fffff7faa6a8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7faa6ac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa6b0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faa6b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa6b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa6bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa6c0:	17ffffde	b	0xfffff7faa638
   0x0000fffff7faa6c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa6c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa6cc:	aa1303e1	mov	x1, x19
   0x0000fffff7faa6d0:	aa1503e2	mov	x2, x21
   0x0000fffff7faa6d4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7faa6d8:	aa1403e4	mov	x4, x20
   0x0000fffff7faa6dc:	aa1603e5	mov	x5, x22
   0x0000fffff7faa6e0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faa6e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa6e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa6ec:	d63f0200	blr	x16
   0x0000fffff7faa6f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa6f4:	5400ab20	b.eq	0xfffff7fabc58  // b.none
   0x0000fffff7faa6f8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faa6fc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faa700:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faa704:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faa708:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faa70c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faa710:	36d801d1	tbz	w17, #27, 0xfffff7faa748
   0x0000fffff7faa714:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa718:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa71c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa720:	54000281	b.ne	0xfffff7faa770  // b.any
   0x0000fffff7faa724:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faa728:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa72c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa730:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa734:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa738:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa73c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa740:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa744:	54000169	b.ls	0xfffff7faa770  // b.plast
   0x0000fffff7faa748:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa74c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa750:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa754:	36d80091	tbz	w17, #27, 0xfffff7faa764
   0x0000fffff7faa758:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa75c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa760:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa764:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faa768:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faa76c:	1400000e	b	0xfffff7faa7a4
   0x0000fffff7faa770:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faa774:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa778:	aa1303e1	mov	x1, x19
   0x0000fffff7faa77c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa780:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7faa784:	aa1403e4	mov	x4, x20
   0x0000fffff7faa788:	aa1603e5	mov	x5, x22
   0x0000fffff7faa78c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faa790:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faa794:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa798:	d63f0200	blr	x16
   0x0000fffff7faa79c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa7a0:	5400a600	b.eq	0xfffff7fabc60  // b.none
   0x0000fffff7faa7a4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faa7a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa7ac:	540003a0	b.eq	0xfffff7faa820  // b.none
   0x0000fffff7faa7b0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7faa7b4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7faa7b8:	b9400171	ldr	w17, [x11]
   0x0000fffff7faa7bc:	36d801d1	tbz	w17, #27, 0xfffff7faa7f4
   0x0000fffff7faa7c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa7c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa7c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa7cc:	540002a1	b.ne	0xfffff7faa820  // b.any
   0x0000fffff7faa7d0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faa7d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa7d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa7dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa7e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa7e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa7e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa7ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa7f0:	54000189	b.ls	0xfffff7faa820  // b.plast
   0x0000fffff7faa7f4:	36d8008d	tbz	w13, #27, 0xfffff7faa804
   0x0000fffff7faa7f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa7fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa800:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa804:	36d80091	tbz	w17, #27, 0xfffff7faa814
   0x0000fffff7faa808:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa80c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa810:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa814:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faa818:	b900016d	str	w13, [x11]
   0x0000fffff7faa81c:	1400000e	b	0xfffff7faa854
   0x0000fffff7faa820:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faa824:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa828:	aa1303e1	mov	x1, x19
   0x0000fffff7faa82c:	aa1503e2	mov	x2, x21
   0x0000fffff7faa830:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7faa834:	aa1403e4	mov	x4, x20
   0x0000fffff7faa838:	aa1603e5	mov	x5, x22
   0x0000fffff7faa83c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faa840:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa844:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa848:	d63f0200	blr	x16
   0x0000fffff7faa84c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa850:	5400a0c0	b.eq	0xfffff7fabc68  // b.none
   0x0000fffff7faa854:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faa858:	f100017f	cmp	x11, #0x0
   0x0000fffff7faa85c:	540004a0	b.eq	0xfffff7faa8f0  // b.none
   0x0000fffff7faa860:	b940016d	ldr	w13, [x11]
   0x0000fffff7faa864:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faa868:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faa86c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faa870:	54000400	b.eq	0xfffff7faa8f0  // b.none
   0x0000fffff7faa874:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faa878:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faa87c:	36d801d1	tbz	w17, #27, 0xfffff7faa8b4
   0x0000fffff7faa880:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faa884:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faa888:	f100013f	cmp	x9, #0x0
   0x0000fffff7faa88c:	54000321	b.ne	0xfffff7faa8f0  // b.any
   0x0000fffff7faa890:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faa894:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa898:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faa89c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faa8a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faa8a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faa8a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faa8ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7faa8b0:	54000209	b.ls	0xfffff7faa8f0  // b.plast
   0x0000fffff7faa8b4:	36d8008d	tbz	w13, #27, 0xfffff7faa8c4
   0x0000fffff7faa8b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faa8bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faa8c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faa8c4:	36d80091	tbz	w17, #27, 0xfffff7faa8d4
   0x0000fffff7faa8c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faa8cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faa8d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faa8d4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7faa8d8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faa8dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faa8e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faa8e4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faa8e8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faa8ec:	1400000e	b	0xfffff7faa924
   0x0000fffff7faa8f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faa8f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faa8f8:	aa1303e1	mov	x1, x19
   0x0000fffff7faa8fc:	aa1503e2	mov	x2, x21
   0x0000fffff7faa900:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7faa904:	aa1403e4	mov	x4, x20
   0x0000fffff7faa908:	aa1603e5	mov	x5, x22
   0x0000fffff7faa90c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faa910:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faa914:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faa918:	d63f0200	blr	x16
   0x0000fffff7faa91c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faa920:	54009a80	b.eq	0xfffff7fabc70  // b.none
   0x0000fffff7faa924:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa928:	37d806a9	tbnz	w9, #27, 0xfffff7faa9fc
   0x0000fffff7faa92c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa930:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa938:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa93c:	540001c1	b.ne	0xfffff7faa974  // b.any
   0x0000fffff7faa940:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa94c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa950:	54000121	b.ne	0xfffff7faa974  // b.any
   0x0000fffff7faa954:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa958:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faa95c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faa960:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa968:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faa96c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa970:	14000030	b	0xfffff7faaa30
   0x0000fffff7faa974:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa978:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa97c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa980:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa984:	54000120	b.eq	0xfffff7faa9a8  // b.none
   0x0000fffff7faa988:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faa98c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa994:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa998:	54000321	b.ne	0xfffff7faa9fc  // b.any
   0x0000fffff7faa99c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faa9a0:	9e620120	scvtf	d0, x9
   0x0000fffff7faa9a4:	14000002	b	0xfffff7faa9ac
   0x0000fffff7faa9a8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faa9ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa9b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa9b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa9b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa9bc:	54000120	b.eq	0xfffff7faa9e0  // b.none
   0x0000fffff7faa9c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faa9c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faa9c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa9cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faa9d0:	54000161	b.ne	0xfffff7faa9fc  // b.any
   0x0000fffff7faa9d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faa9d8:	9e620121	scvtf	d1, x9
   0x0000fffff7faa9dc:	14000002	b	0xfffff7faa9e4
   0x0000fffff7faa9e0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7faa9e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faa9e8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faa9ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faa9f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faa9f4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faa9f8:	17ffffde	b	0xfffff7faa970
   0x0000fffff7faa9fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faaa00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaa04:	aa1303e1	mov	x1, x19
   0x0000fffff7faaa08:	aa1503e2	mov	x2, x21
   0x0000fffff7faaa0c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7faaa10:	aa1403e4	mov	x4, x20
   0x0000fffff7faaa14:	aa1603e5	mov	x5, x22
   0x0000fffff7faaa18:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faaa1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faaa20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaa24:	d63f0200	blr	x16
   0x0000fffff7faaa28:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaa2c:	54009260	b.eq	0xfffff7fabc78  // b.none
   0x0000fffff7faaa30:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faaa34:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faaa38:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faaa3c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faaa40:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faaa44:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faaa48:	36d801d1	tbz	w17, #27, 0xfffff7faaa80
   0x0000fffff7faaa4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faaa50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faaa54:	f100013f	cmp	x9, #0x0
   0x0000fffff7faaa58:	54000281	b.ne	0xfffff7faaaa8  // b.any
   0x0000fffff7faaa5c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faaa60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaa64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faaa68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faaa6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faaa70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faaa74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faaa78:	f100055f	cmp	x10, #0x1
   0x0000fffff7faaa7c:	54000169	b.ls	0xfffff7faaaa8  // b.plast
   0x0000fffff7faaa80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faaa84:	91000529	add	x9, x9, #0x1
   0x0000fffff7faaa88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faaa8c:	36d80091	tbz	w17, #27, 0xfffff7faaa9c
   0x0000fffff7faaa90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaa94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faaa98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faaa9c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faaaa0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faaaa4:	1400000e	b	0xfffff7faaadc
   0x0000fffff7faaaa8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faaaac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaab0:	aa1303e1	mov	x1, x19
   0x0000fffff7faaab4:	aa1503e2	mov	x2, x21
   0x0000fffff7faaab8:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7faaabc:	aa1403e4	mov	x4, x20
   0x0000fffff7faaac0:	aa1603e5	mov	x5, x22
   0x0000fffff7faaac4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faaac8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faaacc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaad0:	d63f0200	blr	x16
   0x0000fffff7faaad4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaad8:	54008d40	b.eq	0xfffff7fabc80  // b.none
   0x0000fffff7faaadc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faaae0:	f100017f	cmp	x11, #0x0
   0x0000fffff7faaae4:	540003a0	b.eq	0xfffff7faab58  // b.none
   0x0000fffff7faaae8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7faaaec:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7faaaf0:	b9400171	ldr	w17, [x11]
   0x0000fffff7faaaf4:	36d801d1	tbz	w17, #27, 0xfffff7faab2c
   0x0000fffff7faaaf8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faaafc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faab00:	f100013f	cmp	x9, #0x0
   0x0000fffff7faab04:	540002a1	b.ne	0xfffff7faab58  // b.any
   0x0000fffff7faab08:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faab0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faab10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faab14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faab18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faab1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faab20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faab24:	f100055f	cmp	x10, #0x1
   0x0000fffff7faab28:	54000189	b.ls	0xfffff7faab58  // b.plast
   0x0000fffff7faab2c:	36d8008d	tbz	w13, #27, 0xfffff7faab3c
   0x0000fffff7faab30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faab34:	91000529	add	x9, x9, #0x1
   0x0000fffff7faab38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faab3c:	36d80091	tbz	w17, #27, 0xfffff7faab4c
   0x0000fffff7faab40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faab44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faab48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faab4c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faab50:	b900016d	str	w13, [x11]
   0x0000fffff7faab54:	1400000e	b	0xfffff7faab8c
   0x0000fffff7faab58:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faab5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faab60:	aa1303e1	mov	x1, x19
   0x0000fffff7faab64:	aa1503e2	mov	x2, x21
   0x0000fffff7faab68:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7faab6c:	aa1403e4	mov	x4, x20
   0x0000fffff7faab70:	aa1603e5	mov	x5, x22
   0x0000fffff7faab74:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faab78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faab7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faab80:	d63f0200	blr	x16
   0x0000fffff7faab84:	f100001f	cmp	x0, #0x0
   0x0000fffff7faab88:	54008800	b.eq	0xfffff7fabc88  // b.none
   0x0000fffff7faab8c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faab90:	f100017f	cmp	x11, #0x0
   0x0000fffff7faab94:	540004a0	b.eq	0xfffff7faac28  // b.none
   0x0000fffff7faab98:	b940016d	ldr	w13, [x11]
   0x0000fffff7faab9c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faaba0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faaba4:	eb0901bf	cmp	x13, x9
   0x0000fffff7faaba8:	54000400	b.eq	0xfffff7faac28  // b.none
   0x0000fffff7faabac:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faabb0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faabb4:	36d801d1	tbz	w17, #27, 0xfffff7faabec
   0x0000fffff7faabb8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faabbc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faabc0:	f100013f	cmp	x9, #0x0
   0x0000fffff7faabc4:	54000321	b.ne	0xfffff7faac28  // b.any
   0x0000fffff7faabc8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faabcc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faabd0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faabd4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faabd8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faabdc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faabe0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faabe4:	f100055f	cmp	x10, #0x1
   0x0000fffff7faabe8:	54000209	b.ls	0xfffff7faac28  // b.plast
   0x0000fffff7faabec:	36d8008d	tbz	w13, #27, 0xfffff7faabfc
   0x0000fffff7faabf0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faabf4:	91000529	add	x9, x9, #0x1
   0x0000fffff7faabf8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faabfc:	36d80091	tbz	w17, #27, 0xfffff7faac0c
   0x0000fffff7faac00:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faac04:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faac08:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faac0c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7faac10:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faac14:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faac18:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faac1c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faac20:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faac24:	1400000e	b	0xfffff7faac5c
   0x0000fffff7faac28:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faac2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faac30:	aa1303e1	mov	x1, x19
   0x0000fffff7faac34:	aa1503e2	mov	x2, x21
   0x0000fffff7faac38:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7faac3c:	aa1403e4	mov	x4, x20
   0x0000fffff7faac40:	aa1603e5	mov	x5, x22
   0x0000fffff7faac44:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faac48:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faac4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faac50:	d63f0200	blr	x16
   0x0000fffff7faac54:	f100001f	cmp	x0, #0x0
   0x0000fffff7faac58:	540081c0	b.eq	0xfffff7fabc90  // b.none
   0x0000fffff7faac5c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faac60:	37d806a9	tbnz	w9, #27, 0xfffff7faad34
   0x0000fffff7faac64:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faac68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac70:	eb0a013f	cmp	x9, x10
   0x0000fffff7faac74:	540001c1	b.ne	0xfffff7faacac  // b.any
   0x0000fffff7faac78:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faac7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faac84:	eb0a013f	cmp	x9, x10
   0x0000fffff7faac88:	54000121	b.ne	0xfffff7faacac  // b.any
   0x0000fffff7faac8c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faac90:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faac94:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faac98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faac9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaca0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faaca4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faaca8:	14000030	b	0xfffff7faad68
   0x0000fffff7faacac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faacb0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faacb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faacb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faacbc:	54000120	b.eq	0xfffff7faace0  // b.none
   0x0000fffff7faacc0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faacc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faacc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaccc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faacd0:	54000321	b.ne	0xfffff7faad34  // b.any
   0x0000fffff7faacd4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faacd8:	9e620120	scvtf	d0, x9
   0x0000fffff7faacdc:	14000002	b	0xfffff7faace4
   0x0000fffff7faace0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7faace4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faace8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faacec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faacf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faacf4:	54000120	b.eq	0xfffff7faad18  // b.none
   0x0000fffff7faacf8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faacfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faad00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faad04:	eb0a013f	cmp	x9, x10
   0x0000fffff7faad08:	54000161	b.ne	0xfffff7faad34  // b.any
   0x0000fffff7faad0c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7faad10:	9e620121	scvtf	d1, x9
   0x0000fffff7faad14:	14000002	b	0xfffff7faad1c
   0x0000fffff7faad18:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7faad1c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faad20:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faad24:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faad28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faad2c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faad30:	17ffffde	b	0xfffff7faaca8
   0x0000fffff7faad34:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faad38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faad3c:	aa1303e1	mov	x1, x19
   0x0000fffff7faad40:	aa1503e2	mov	x2, x21
   0x0000fffff7faad44:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7faad48:	aa1403e4	mov	x4, x20
   0x0000fffff7faad4c:	aa1603e5	mov	x5, x22
   0x0000fffff7faad50:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faad54:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faad58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faad5c:	d63f0200	blr	x16
   0x0000fffff7faad60:	f100001f	cmp	x0, #0x0
   0x0000fffff7faad64:	540079a0	b.eq	0xfffff7fabc98  // b.none
   0x0000fffff7faad68:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faad6c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faad70:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faad74:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faad78:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faad7c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faad80:	36d801d1	tbz	w17, #27, 0xfffff7faadb8
   0x0000fffff7faad84:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faad88:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faad8c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faad90:	54000281	b.ne	0xfffff7faade0  // b.any
   0x0000fffff7faad94:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faad98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faad9c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faada0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faada4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faada8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faadac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faadb0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faadb4:	54000169	b.ls	0xfffff7faade0  // b.plast
   0x0000fffff7faadb8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faadbc:	91000529	add	x9, x9, #0x1
   0x0000fffff7faadc0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faadc4:	36d80091	tbz	w17, #27, 0xfffff7faadd4
   0x0000fffff7faadc8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faadcc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faadd0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faadd4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faadd8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faaddc:	1400000e	b	0xfffff7faae14
   0x0000fffff7faade0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faade4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faade8:	aa1303e1	mov	x1, x19
   0x0000fffff7faadec:	aa1503e2	mov	x2, x21
   0x0000fffff7faadf0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7faadf4:	aa1403e4	mov	x4, x20
   0x0000fffff7faadf8:	aa1603e5	mov	x5, x22
   0x0000fffff7faadfc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7faae00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faae04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faae08:	d63f0200	blr	x16
   0x0000fffff7faae0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faae10:	54007480	b.eq	0xfffff7fabca0  // b.none
   0x0000fffff7faae14:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7faae18:	f100017f	cmp	x11, #0x0
   0x0000fffff7faae1c:	540003a0	b.eq	0xfffff7faae90  // b.none
   0x0000fffff7faae20:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7faae24:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7faae28:	b9400171	ldr	w17, [x11]
   0x0000fffff7faae2c:	36d801d1	tbz	w17, #27, 0xfffff7faae64
   0x0000fffff7faae30:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faae34:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faae38:	f100013f	cmp	x9, #0x0
   0x0000fffff7faae3c:	540002a1	b.ne	0xfffff7faae90  // b.any
   0x0000fffff7faae40:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7faae44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faae48:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faae4c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faae50:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faae54:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faae58:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faae5c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faae60:	54000189	b.ls	0xfffff7faae90  // b.plast
   0x0000fffff7faae64:	36d8008d	tbz	w13, #27, 0xfffff7faae74
   0x0000fffff7faae68:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faae6c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faae70:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faae74:	36d80091	tbz	w17, #27, 0xfffff7faae84
   0x0000fffff7faae78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faae7c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faae80:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faae84:	f900056c	str	x12, [x11, #8]
   0x0000fffff7faae88:	b900016d	str	w13, [x11]
   0x0000fffff7faae8c:	1400000e	b	0xfffff7faaec4
   0x0000fffff7faae90:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faae94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faae98:	aa1303e1	mov	x1, x19
   0x0000fffff7faae9c:	aa1503e2	mov	x2, x21
   0x0000fffff7faaea0:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7faaea4:	aa1403e4	mov	x4, x20
   0x0000fffff7faaea8:	aa1603e5	mov	x5, x22
   0x0000fffff7faaeac:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7faaeb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faaeb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaeb8:	d63f0200	blr	x16
   0x0000fffff7faaebc:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaec0:	54006f40	b.eq	0xfffff7fabca8  // b.none
   0x0000fffff7faaec4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faaec8:	f100017f	cmp	x11, #0x0
   0x0000fffff7faaecc:	540004a0	b.eq	0xfffff7faaf60  // b.none
   0x0000fffff7faaed0:	b940016d	ldr	w13, [x11]
   0x0000fffff7faaed4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faaed8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faaedc:	eb0901bf	cmp	x13, x9
   0x0000fffff7faaee0:	54000400	b.eq	0xfffff7faaf60  // b.none
   0x0000fffff7faaee4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faaee8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faaeec:	36d801d1	tbz	w17, #27, 0xfffff7faaf24
   0x0000fffff7faaef0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faaef4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faaef8:	f100013f	cmp	x9, #0x0
   0x0000fffff7faaefc:	54000321	b.ne	0xfffff7faaf60  // b.any
   0x0000fffff7faaf00:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faaf04:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaf08:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faaf0c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faaf10:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faaf14:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faaf18:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faaf1c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faaf20:	54000209	b.ls	0xfffff7faaf60  // b.plast
   0x0000fffff7faaf24:	36d8008d	tbz	w13, #27, 0xfffff7faaf34
   0x0000fffff7faaf28:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faaf2c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faaf30:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faaf34:	36d80091	tbz	w17, #27, 0xfffff7faaf44
   0x0000fffff7faaf38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faaf3c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faaf40:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faaf44:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7faaf48:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faaf4c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faaf50:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faaf54:	f900266c	str	x12, [x19, #72]
   0x0000fffff7faaf58:	b900426d	str	w13, [x19, #64]
   0x0000fffff7faaf5c:	1400000e	b	0xfffff7faaf94
   0x0000fffff7faaf60:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faaf64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faaf68:	aa1303e1	mov	x1, x19
   0x0000fffff7faaf6c:	aa1503e2	mov	x2, x21
   0x0000fffff7faaf70:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7faaf74:	aa1403e4	mov	x4, x20
   0x0000fffff7faaf78:	aa1603e5	mov	x5, x22
   0x0000fffff7faaf7c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7faaf80:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faaf84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faaf88:	d63f0200	blr	x16
   0x0000fffff7faaf8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faaf90:	54006900	b.eq	0xfffff7fabcb0  // b.none
   0x0000fffff7faaf94:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faaf98:	37d806a9	tbnz	w9, #27, 0xfffff7fab06c
   0x0000fffff7faaf9c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faafa0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faafa4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faafa8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faafac:	540001c1	b.ne	0xfffff7faafe4  // b.any
   0x0000fffff7faafb0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7faafb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faafb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faafbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faafc0:	54000121	b.ne	0xfffff7faafe4  // b.any
   0x0000fffff7faafc4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faafc8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7faafcc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faafd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faafd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faafd8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7faafdc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faafe0:	14000030	b	0xfffff7fab0a0
   0x0000fffff7faafe4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faafe8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faafec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faaff0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faaff4:	54000120	b.eq	0xfffff7fab018  // b.none
   0x0000fffff7faaff8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faaffc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab000:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab004:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab008:	54000321	b.ne	0xfffff7fab06c  // b.any
   0x0000fffff7fab00c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab010:	9e620120	scvtf	d0, x9
   0x0000fffff7fab014:	14000002	b	0xfffff7fab01c
   0x0000fffff7fab018:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fab01c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab020:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab024:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab028:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab02c:	54000120	b.eq	0xfffff7fab050  // b.none
   0x0000fffff7fab030:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab034:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab038:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab03c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab040:	54000161	b.ne	0xfffff7fab06c  // b.any
   0x0000fffff7fab044:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab048:	9e620121	scvtf	d1, x9
   0x0000fffff7fab04c:	14000002	b	0xfffff7fab054
   0x0000fffff7fab050:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fab054:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab058:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fab05c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab060:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab064:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab068:	17ffffde	b	0xfffff7faafe0
   0x0000fffff7fab06c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab070:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab074:	aa1303e1	mov	x1, x19
   0x0000fffff7fab078:	aa1503e2	mov	x2, x21
   0x0000fffff7fab07c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fab080:	aa1403e4	mov	x4, x20
   0x0000fffff7fab084:	aa1603e5	mov	x5, x22
   0x0000fffff7fab088:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab08c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab090:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab094:	d63f0200	blr	x16
   0x0000fffff7fab098:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab09c:	540060e0	b.eq	0xfffff7fabcb8  // b.none
   0x0000fffff7fab0a0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fab0a4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fab0a8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fab0ac:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fab0b0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fab0b4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fab0b8:	36d801d1	tbz	w17, #27, 0xfffff7fab0f0
   0x0000fffff7fab0bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab0c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab0c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab0c8:	54000281	b.ne	0xfffff7fab118  // b.any
   0x0000fffff7fab0cc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fab0d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab0d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab0d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab0dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab0e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab0e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab0e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab0ec:	54000169	b.ls	0xfffff7fab118  // b.plast
   0x0000fffff7fab0f0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab0f4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab0f8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab0fc:	36d80091	tbz	w17, #27, 0xfffff7fab10c
   0x0000fffff7fab100:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab104:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab108:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab10c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fab110:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fab114:	1400000e	b	0xfffff7fab14c
   0x0000fffff7fab118:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab11c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab120:	aa1303e1	mov	x1, x19
   0x0000fffff7fab124:	aa1503e2	mov	x2, x21
   0x0000fffff7fab128:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fab12c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab130:	aa1603e5	mov	x5, x22
   0x0000fffff7fab134:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fab138:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab13c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab140:	d63f0200	blr	x16
   0x0000fffff7fab144:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab148:	54005bc0	b.eq	0xfffff7fabcc0  // b.none
   0x0000fffff7fab14c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fab150:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab154:	540003a0	b.eq	0xfffff7fab1c8  // b.none
   0x0000fffff7fab158:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fab15c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fab160:	b9400171	ldr	w17, [x11]
   0x0000fffff7fab164:	36d801d1	tbz	w17, #27, 0xfffff7fab19c
   0x0000fffff7fab168:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab16c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab170:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab174:	540002a1	b.ne	0xfffff7fab1c8  // b.any
   0x0000fffff7fab178:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fab17c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab180:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab184:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab188:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab18c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab190:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab194:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab198:	54000189	b.ls	0xfffff7fab1c8  // b.plast
   0x0000fffff7fab19c:	36d8008d	tbz	w13, #27, 0xfffff7fab1ac
   0x0000fffff7fab1a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab1a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab1a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab1ac:	36d80091	tbz	w17, #27, 0xfffff7fab1bc
   0x0000fffff7fab1b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab1b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab1b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab1bc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fab1c0:	b900016d	str	w13, [x11]
   0x0000fffff7fab1c4:	1400000e	b	0xfffff7fab1fc
   0x0000fffff7fab1c8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab1cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab1d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fab1d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fab1d8:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fab1dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fab1e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab1e4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fab1e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab1ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab1f0:	d63f0200	blr	x16
   0x0000fffff7fab1f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab1f8:	54005680	b.eq	0xfffff7fabcc8  // b.none
   0x0000fffff7fab1fc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab200:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab204:	540004a0	b.eq	0xfffff7fab298  // b.none
   0x0000fffff7fab208:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab20c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab210:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab214:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab218:	54000400	b.eq	0xfffff7fab298  // b.none
   0x0000fffff7fab21c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab220:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab224:	36d801d1	tbz	w17, #27, 0xfffff7fab25c
   0x0000fffff7fab228:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab22c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab230:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab234:	54000321	b.ne	0xfffff7fab298  // b.any
   0x0000fffff7fab238:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab23c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab240:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab244:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab248:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab24c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab250:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab254:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab258:	54000209	b.ls	0xfffff7fab298  // b.plast
   0x0000fffff7fab25c:	36d8008d	tbz	w13, #27, 0xfffff7fab26c
   0x0000fffff7fab260:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab264:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab268:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab26c:	36d80091	tbz	w17, #27, 0xfffff7fab27c
   0x0000fffff7fab270:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab274:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab278:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab27c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fab280:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fab284:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab288:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab28c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fab290:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fab294:	1400000e	b	0xfffff7fab2cc
   0x0000fffff7fab298:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab29c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab2a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fab2a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fab2a8:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fab2ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fab2b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab2b4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab2b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab2bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab2c0:	d63f0200	blr	x16
   0x0000fffff7fab2c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab2c8:	54005040	b.eq	0xfffff7fabcd0  // b.none
   0x0000fffff7fab2cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab2d0:	37d806a9	tbnz	w9, #27, 0xfffff7fab3a4
   0x0000fffff7fab2d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab2d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab2dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab2e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab2e4:	540001c1	b.ne	0xfffff7fab31c  // b.any
   0x0000fffff7fab2e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab2ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab2f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab2f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab2f8:	54000121	b.ne	0xfffff7fab31c  // b.any
   0x0000fffff7fab2fc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab300:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fab304:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab308:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab30c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab310:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fab314:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab318:	14000030	b	0xfffff7fab3d8
   0x0000fffff7fab31c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab320:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab324:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab328:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab32c:	54000120	b.eq	0xfffff7fab350  // b.none
   0x0000fffff7fab330:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab334:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab338:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab33c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab340:	54000321	b.ne	0xfffff7fab3a4  // b.any
   0x0000fffff7fab344:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab348:	9e620120	scvtf	d0, x9
   0x0000fffff7fab34c:	14000002	b	0xfffff7fab354
   0x0000fffff7fab350:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fab354:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab358:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab35c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab360:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab364:	54000120	b.eq	0xfffff7fab388  // b.none
   0x0000fffff7fab368:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab36c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab374:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab378:	54000161	b.ne	0xfffff7fab3a4  // b.any
   0x0000fffff7fab37c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab380:	9e620121	scvtf	d1, x9
   0x0000fffff7fab384:	14000002	b	0xfffff7fab38c
   0x0000fffff7fab388:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fab38c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab390:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fab394:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab39c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab3a0:	17ffffde	b	0xfffff7fab318
   0x0000fffff7fab3a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab3a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab3ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fab3b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fab3b4:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fab3b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fab3bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fab3c0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab3c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab3c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab3cc:	d63f0200	blr	x16
   0x0000fffff7fab3d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab3d4:	54004820	b.eq	0xfffff7fabcd8  // b.none
   0x0000fffff7fab3d8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fab3dc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fab3e0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fab3e4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fab3e8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fab3ec:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fab3f0:	36d801d1	tbz	w17, #27, 0xfffff7fab428
   0x0000fffff7fab3f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab3f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab3fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab400:	54000281	b.ne	0xfffff7fab450  // b.any
   0x0000fffff7fab404:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fab408:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab40c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab410:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab414:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab418:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab41c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab420:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab424:	54000169	b.ls	0xfffff7fab450  // b.plast
   0x0000fffff7fab428:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab42c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab430:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab434:	36d80091	tbz	w17, #27, 0xfffff7fab444
   0x0000fffff7fab438:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab43c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab440:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab444:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fab448:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fab44c:	1400000e	b	0xfffff7fab484
   0x0000fffff7fab450:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab454:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab458:	aa1303e1	mov	x1, x19
   0x0000fffff7fab45c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab460:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fab464:	aa1403e4	mov	x4, x20
   0x0000fffff7fab468:	aa1603e5	mov	x5, x22
   0x0000fffff7fab46c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fab470:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab474:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab478:	d63f0200	blr	x16
   0x0000fffff7fab47c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab480:	54004300	b.eq	0xfffff7fabce0  // b.none
   0x0000fffff7fab484:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fab488:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab48c:	540003a0	b.eq	0xfffff7fab500  // b.none
   0x0000fffff7fab490:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fab494:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fab498:	b9400171	ldr	w17, [x11]
   0x0000fffff7fab49c:	36d801d1	tbz	w17, #27, 0xfffff7fab4d4
   0x0000fffff7fab4a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab4a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab4a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab4ac:	540002a1	b.ne	0xfffff7fab500  // b.any
   0x0000fffff7fab4b0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fab4b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab4b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab4bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab4c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab4c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab4c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab4cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab4d0:	54000189	b.ls	0xfffff7fab500  // b.plast
   0x0000fffff7fab4d4:	36d8008d	tbz	w13, #27, 0xfffff7fab4e4
   0x0000fffff7fab4d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab4dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab4e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab4e4:	36d80091	tbz	w17, #27, 0xfffff7fab4f4
   0x0000fffff7fab4e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab4ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab4f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab4f4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fab4f8:	b900016d	str	w13, [x11]
   0x0000fffff7fab4fc:	1400000e	b	0xfffff7fab534
   0x0000fffff7fab500:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab504:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab508:	aa1303e1	mov	x1, x19
   0x0000fffff7fab50c:	aa1503e2	mov	x2, x21
   0x0000fffff7fab510:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fab514:	aa1403e4	mov	x4, x20
   0x0000fffff7fab518:	aa1603e5	mov	x5, x22
   0x0000fffff7fab51c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fab520:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab524:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab528:	d63f0200	blr	x16
   0x0000fffff7fab52c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab530:	54003dc0	b.eq	0xfffff7fabce8  // b.none
   0x0000fffff7fab534:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab538:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab53c:	540004a0	b.eq	0xfffff7fab5d0  // b.none
   0x0000fffff7fab540:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab544:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab548:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab54c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab550:	54000400	b.eq	0xfffff7fab5d0  // b.none
   0x0000fffff7fab554:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab558:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab55c:	36d801d1	tbz	w17, #27, 0xfffff7fab594
   0x0000fffff7fab560:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab564:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab568:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab56c:	54000321	b.ne	0xfffff7fab5d0  // b.any
   0x0000fffff7fab570:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab574:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab578:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab57c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab580:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab584:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab588:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab58c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab590:	54000209	b.ls	0xfffff7fab5d0  // b.plast
   0x0000fffff7fab594:	36d8008d	tbz	w13, #27, 0xfffff7fab5a4
   0x0000fffff7fab598:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab59c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab5a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab5a4:	36d80091	tbz	w17, #27, 0xfffff7fab5b4
   0x0000fffff7fab5a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab5ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab5b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab5b4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fab5b8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fab5bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab5c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab5c4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fab5c8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fab5cc:	1400000e	b	0xfffff7fab604
   0x0000fffff7fab5d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab5d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab5d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fab5dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fab5e0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fab5e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fab5e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fab5ec:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab5f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab5f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab5f8:	d63f0200	blr	x16
   0x0000fffff7fab5fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab600:	54003780	b.eq	0xfffff7fabcf0  // b.none
   0x0000fffff7fab604:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab608:	37d806a9	tbnz	w9, #27, 0xfffff7fab6dc
   0x0000fffff7fab60c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab610:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab618:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab61c:	540001c1	b.ne	0xfffff7fab654  // b.any
   0x0000fffff7fab620:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab624:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab628:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab62c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab630:	54000121	b.ne	0xfffff7fab654  // b.any
   0x0000fffff7fab634:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab638:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fab63c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab640:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab648:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fab64c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab650:	14000030	b	0xfffff7fab710
   0x0000fffff7fab654:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab658:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab65c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab660:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab664:	54000120	b.eq	0xfffff7fab688  // b.none
   0x0000fffff7fab668:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab66c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab670:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab674:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab678:	54000321	b.ne	0xfffff7fab6dc  // b.any
   0x0000fffff7fab67c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab680:	9e620120	scvtf	d0, x9
   0x0000fffff7fab684:	14000002	b	0xfffff7fab68c
   0x0000fffff7fab688:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fab68c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab690:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab694:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab698:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab69c:	54000120	b.eq	0xfffff7fab6c0  // b.none
   0x0000fffff7fab6a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab6a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab6a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab6b0:	54000161	b.ne	0xfffff7fab6dc  // b.any
   0x0000fffff7fab6b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab6b8:	9e620121	scvtf	d1, x9
   0x0000fffff7fab6bc:	14000002	b	0xfffff7fab6c4
   0x0000fffff7fab6c0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fab6c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fab6c8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fab6cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab6d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab6d4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab6d8:	17ffffde	b	0xfffff7fab650
   0x0000fffff7fab6dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab6e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab6e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fab6e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fab6ec:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fab6f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fab6f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fab6f8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fab6fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab700:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab704:	d63f0200	blr	x16
   0x0000fffff7fab708:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab70c:	54002f60	b.eq	0xfffff7fabcf8  // b.none
   0x0000fffff7fab710:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fab714:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fab718:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fab71c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fab720:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fab724:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fab728:	36d801d1	tbz	w17, #27, 0xfffff7fab760
   0x0000fffff7fab72c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab730:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab734:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab738:	54000281	b.ne	0xfffff7fab788  // b.any
   0x0000fffff7fab73c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fab740:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab744:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab748:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab74c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab750:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab754:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab758:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab75c:	54000169	b.ls	0xfffff7fab788  // b.plast
   0x0000fffff7fab760:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab764:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab768:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab76c:	36d80091	tbz	w17, #27, 0xfffff7fab77c
   0x0000fffff7fab770:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab774:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab778:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab77c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fab780:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fab784:	1400000e	b	0xfffff7fab7bc
   0x0000fffff7fab788:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fab78c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab790:	aa1303e1	mov	x1, x19
   0x0000fffff7fab794:	aa1503e2	mov	x2, x21
   0x0000fffff7fab798:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fab79c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab7a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fab7a4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fab7a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fab7ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab7b0:	d63f0200	blr	x16
   0x0000fffff7fab7b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab7b8:	54002a40	b.eq	0xfffff7fabd00  // b.none
   0x0000fffff7fab7bc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fab7c0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab7c4:	540003a0	b.eq	0xfffff7fab838  // b.none
   0x0000fffff7fab7c8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fab7cc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fab7d0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fab7d4:	36d801d1	tbz	w17, #27, 0xfffff7fab80c
   0x0000fffff7fab7d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab7dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab7e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab7e4:	540002a1	b.ne	0xfffff7fab838  // b.any
   0x0000fffff7fab7e8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fab7ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab7f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab7f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab7f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab7fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab800:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab804:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab808:	54000189	b.ls	0xfffff7fab838  // b.plast
   0x0000fffff7fab80c:	36d8008d	tbz	w13, #27, 0xfffff7fab81c
   0x0000fffff7fab810:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab814:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab818:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab81c:	36d80091	tbz	w17, #27, 0xfffff7fab82c
   0x0000fffff7fab820:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab824:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab828:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab82c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fab830:	b900016d	str	w13, [x11]
   0x0000fffff7fab834:	1400000e	b	0xfffff7fab86c
   0x0000fffff7fab838:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fab83c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab840:	aa1303e1	mov	x1, x19
   0x0000fffff7fab844:	aa1503e2	mov	x2, x21
   0x0000fffff7fab848:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fab84c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab850:	aa1603e5	mov	x5, x22
   0x0000fffff7fab854:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fab858:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab85c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab860:	d63f0200	blr	x16
   0x0000fffff7fab864:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab868:	54002500	b.eq	0xfffff7fabd08  // b.none
   0x0000fffff7fab86c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fab870:	f100017f	cmp	x11, #0x0
   0x0000fffff7fab874:	540004a0	b.eq	0xfffff7fab908  // b.none
   0x0000fffff7fab878:	b940016d	ldr	w13, [x11]
   0x0000fffff7fab87c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fab880:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fab884:	eb0901bf	cmp	x13, x9
   0x0000fffff7fab888:	54000400	b.eq	0xfffff7fab908  // b.none
   0x0000fffff7fab88c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fab890:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fab894:	36d801d1	tbz	w17, #27, 0xfffff7fab8cc
   0x0000fffff7fab898:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fab89c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fab8a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fab8a4:	54000321	b.ne	0xfffff7fab908  // b.any
   0x0000fffff7fab8a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fab8ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab8b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fab8b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fab8b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fab8bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fab8c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fab8c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fab8c8:	54000209	b.ls	0xfffff7fab908  // b.plast
   0x0000fffff7fab8cc:	36d8008d	tbz	w13, #27, 0xfffff7fab8dc
   0x0000fffff7fab8d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fab8d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fab8d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fab8dc:	36d80091	tbz	w17, #27, 0xfffff7fab8ec
   0x0000fffff7fab8e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fab8e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fab8e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fab8ec:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fab8f0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fab8f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fab8f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fab8fc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fab900:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fab904:	1400000e	b	0xfffff7fab93c
   0x0000fffff7fab908:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fab90c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fab910:	aa1303e1	mov	x1, x19
   0x0000fffff7fab914:	aa1503e2	mov	x2, x21
   0x0000fffff7fab918:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fab91c:	aa1403e4	mov	x4, x20
   0x0000fffff7fab920:	aa1603e5	mov	x5, x22
   0x0000fffff7fab924:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fab928:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fab92c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fab930:	d63f0200	blr	x16
   0x0000fffff7fab934:	f100001f	cmp	x0, #0x0
   0x0000fffff7fab938:	54001ec0	b.eq	0xfffff7fabd10  // b.none
   0x0000fffff7fab93c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab940:	37d806a9	tbnz	w9, #27, 0xfffff7faba14
   0x0000fffff7fab944:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab94c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab950:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab954:	540001c1	b.ne	0xfffff7fab98c  // b.any
   0x0000fffff7fab958:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab95c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab964:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab968:	54000121	b.ne	0xfffff7fab98c  // b.any
   0x0000fffff7fab96c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab970:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fab974:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fab978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab97c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab980:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fab984:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fab988:	14000030	b	0xfffff7faba48
   0x0000fffff7fab98c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab990:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab998:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab99c:	54000120	b.eq	0xfffff7fab9c0  // b.none
   0x0000fffff7fab9a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fab9a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab9a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab9ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab9b0:	54000321	b.ne	0xfffff7faba14  // b.any
   0x0000fffff7fab9b4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fab9b8:	9e620120	scvtf	d0, x9
   0x0000fffff7fab9bc:	14000002	b	0xfffff7fab9c4
   0x0000fffff7fab9c0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fab9c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab9c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fab9cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab9d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab9d4:	54000120	b.eq	0xfffff7fab9f8  // b.none
   0x0000fffff7fab9d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fab9dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fab9e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fab9e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fab9e8:	54000161	b.ne	0xfffff7faba14  // b.any
   0x0000fffff7fab9ec:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fab9f0:	9e620121	scvtf	d1, x9
   0x0000fffff7fab9f4:	14000002	b	0xfffff7fab9fc
   0x0000fffff7fab9f8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fab9fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faba00:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7faba04:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faba08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faba0c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7faba10:	17ffffde	b	0xfffff7fab988
   0x0000fffff7faba14:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faba18:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faba1c:	aa1303e1	mov	x1, x19
   0x0000fffff7faba20:	aa1503e2	mov	x2, x21
   0x0000fffff7faba24:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7faba28:	aa1403e4	mov	x4, x20
   0x0000fffff7faba2c:	aa1603e5	mov	x5, x22
   0x0000fffff7faba30:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7faba34:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faba38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faba3c:	d63f0200	blr	x16
   0x0000fffff7faba40:	f100001f	cmp	x0, #0x0
   0x0000fffff7faba44:	540016a0	b.eq	0xfffff7fabd18  // b.none
   0x0000fffff7faba48:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faba4c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faba50:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faba54:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faba58:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faba5c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7faba60:	36d801d1	tbz	w17, #27, 0xfffff7faba98
   0x0000fffff7faba64:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faba68:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faba6c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faba70:	54000281	b.ne	0xfffff7fabac0  // b.any
   0x0000fffff7faba74:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7faba78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faba7c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faba80:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faba84:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faba88:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faba8c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faba90:	f100055f	cmp	x10, #0x1
   0x0000fffff7faba94:	54000169	b.ls	0xfffff7fabac0  // b.plast
   0x0000fffff7faba98:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faba9c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fabaa0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fabaa4:	36d80091	tbz	w17, #27, 0xfffff7fabab4
   0x0000fffff7fabaa8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabaac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fabab0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fabab4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fabab8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fababc:	1400000e	b	0xfffff7fabaf4
   0x0000fffff7fabac0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabac4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabac8:	aa1303e1	mov	x1, x19
   0x0000fffff7fabacc:	aa1503e2	mov	x2, x21
   0x0000fffff7fabad0:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fabad4:	aa1403e4	mov	x4, x20
   0x0000fffff7fabad8:	aa1603e5	mov	x5, x22
   0x0000fffff7fabadc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fabae0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fabae4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabae8:	d63f0200	blr	x16
   0x0000fffff7fabaec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabaf0:	54001180	b.eq	0xfffff7fabd20  // b.none
   0x0000fffff7fabaf4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fabaf8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fabafc:	540003a0	b.eq	0xfffff7fabb70  // b.none
   0x0000fffff7fabb00:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fabb04:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fabb08:	b9400171	ldr	w17, [x11]
   0x0000fffff7fabb0c:	36d801d1	tbz	w17, #27, 0xfffff7fabb44
   0x0000fffff7fabb10:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fabb14:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fabb18:	f100013f	cmp	x9, #0x0
   0x0000fffff7fabb1c:	540002a1	b.ne	0xfffff7fabb70  // b.any
   0x0000fffff7fabb20:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fabb24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabb28:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fabb2c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fabb30:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fabb34:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fabb38:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fabb3c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fabb40:	54000189	b.ls	0xfffff7fabb70  // b.plast
   0x0000fffff7fabb44:	36d8008d	tbz	w13, #27, 0xfffff7fabb54
   0x0000fffff7fabb48:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fabb4c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fabb50:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fabb54:	36d80091	tbz	w17, #27, 0xfffff7fabb64
   0x0000fffff7fabb58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fabb5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fabb60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fabb64:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fabb68:	b900016d	str	w13, [x11]
   0x0000fffff7fabb6c:	1400000e	b	0xfffff7fabba4
   0x0000fffff7fabb70:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fabb74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabb78:	aa1303e1	mov	x1, x19
   0x0000fffff7fabb7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fabb80:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fabb84:	aa1403e4	mov	x4, x20
   0x0000fffff7fabb88:	aa1603e5	mov	x5, x22
   0x0000fffff7fabb8c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fabb90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabb94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabb98:	d63f0200	blr	x16
   0x0000fffff7fabb9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fabba0:	54000c40	b.eq	0xfffff7fabd28  // b.none
   0x0000fffff7fabba4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fabba8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fabbac:	aa1303e1	mov	x1, x19
   0x0000fffff7fabbb0:	aa1503e2	mov	x2, x21
   0x0000fffff7fabbb4:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fabbb8:	aa1403e4	mov	x4, x20
   0x0000fffff7fabbbc:	aa1603e5	mov	x5, x22
   0x0000fffff7fabbc0:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fabbc4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fabbc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fabbcc:	d63f0200	blr	x16
   0x0000fffff7fabbd0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fabbd4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fabbd8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fabbdc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fabbe0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fabbe4:	d65f03c0	ret
   0x0000fffff7fabbe8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fabbec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fabbf0:	b900028a	str	w10, [x20]
   0x0000fffff7fabbf4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fabbf8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fabbfc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fabc00:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fabc04:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fabc08:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fabc0c:	d65f03c0	ret
   0x0000fffff7fabc10:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fabc14:	17fffff5	b	0xfffff7fabbe8
   0x0000fffff7fabc18:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fabc1c:	17fffff3	b	0xfffff7fabbe8
   0x0000fffff7fabc20:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fabc24:	17fffff1	b	0xfffff7fabbe8
   0x0000fffff7fabc28:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fabc2c:	17ffffef	b	0xfffff7fabbe8
   0x0000fffff7fabc30:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fabc34:	17ffffed	b	0xfffff7fabbe8
   0x0000fffff7fabc38:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fabc3c:	17ffffeb	b	0xfffff7fabbe8
   0x0000fffff7fabc40:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fabc44:	17ffffe9	b	0xfffff7fabbe8
   0x0000fffff7fabc48:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fabc4c:	17ffffe7	b	0xfffff7fabbe8
   0x0000fffff7fabc50:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fabc54:	17ffffe5	b	0xfffff7fabbe8
   0x0000fffff7fabc58:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fabc5c:	17ffffe3	b	0xfffff7fabbe8
   0x0000fffff7fabc60:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fabc64:	17ffffe1	b	0xfffff7fabbe8
   0x0000fffff7fabc68:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fabc6c:	17ffffdf	b	0xfffff7fabbe8
   0x0000fffff7fabc70:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fabc74:	17ffffdd	b	0xfffff7fabbe8
   0x0000fffff7fabc78:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fabc7c:	17ffffdb	b	0xfffff7fabbe8
   0x0000fffff7fabc80:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fabc84:	17ffffd9	b	0xfffff7fabbe8
   0x0000fffff7fabc88:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fabc8c:	17ffffd7	b	0xfffff7fabbe8
   0x0000fffff7fabc90:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fabc94:	17ffffd5	b	0xfffff7fabbe8
   0x0000fffff7fabc98:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fabc9c:	17ffffd3	b	0xfffff7fabbe8
   0x0000fffff7fabca0:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fabca4:	17ffffd1	b	0xfffff7fabbe8
   0x0000fffff7fabca8:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fabcac:	17ffffcf	b	0xfffff7fabbe8
   0x0000fffff7fabcb0:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fabcb4:	17ffffcd	b	0xfffff7fabbe8
   0x0000fffff7fabcb8:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fabcbc:	17ffffcb	b	0xfffff7fabbe8
   0x0000fffff7fabcc0:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fabcc4:	17ffffc9	b	0xfffff7fabbe8
   0x0000fffff7fabcc8:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fabccc:	17ffffc7	b	0xfffff7fabbe8
   0x0000fffff7fabcd0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fabcd4:	17ffffc5	b	0xfffff7fabbe8
   0x0000fffff7fabcd8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fabcdc:	17ffffc3	b	0xfffff7fabbe8
   0x0000fffff7fabce0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fabce4:	17ffffc1	b	0xfffff7fabbe8
   0x0000fffff7fabce8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fabcec:	17ffffbf	b	0xfffff7fabbe8
   0x0000fffff7fabcf0:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fabcf4:	17ffffbd	b	0xfffff7fabbe8
   0x0000fffff7fabcf8:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fabcfc:	17ffffbb	b	0xfffff7fabbe8
   0x0000fffff7fabd00:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fabd04:	17ffffb9	b	0xfffff7fabbe8
   0x0000fffff7fabd08:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fabd0c:	17ffffb7	b	0xfffff7fabbe8
   0x0000fffff7fabd10:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fabd14:	17ffffb5	b	0xfffff7fabbe8
   0x0000fffff7fabd18:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fabd1c:	17ffffb3	b	0xfffff7fabbe8
   0x0000fffff7fabd20:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fabd24:	17ffffb1	b	0xfffff7fabbe8
   0x0000fffff7fabd28:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fabd2c:	17ffffaf	b	0xfffff7fabbe8
   0x0000fffff7fabd30:	00000000	udf	#0
   0x0000fffff7fabd34:	00000000	udf	#0
   0x0000fffff7fabd38:	00000000	udf	#0
   0x0000fffff7fabd3c:	00000000	udf	#0
   0x0000fffff7fabd40:	00000000	udf	#0
   0x0000fffff7fabd44:	00000000	udf	#0
   0x0000fffff7fabd48:	00000000	udf	#0
   0x0000fffff7fabd4c:	00000000	udf	#0
   0x0000fffff7fabd50:	00000000	udf	#0
   0x0000fffff7fabd54:	00000000	udf	#0
   0x0000fffff7fabd58:	00000000	udf	#0
   0x0000fffff7fabd5c:	00000000	udf	#0
   0x0000fffff7fabd60:	00000000	udf	#0
   0x0000fffff7fabd64:	00000000	udf	#0
   0x0000fffff7fabd68:	00000000	udf	#0
   0x0000fffff7fabd6c:	00000000	udf	#0
   0x0000fffff7fabd70:	00000000	udf	#0
   0x0000fffff7fabd74:	00000000	udf	#0
   0x0000fffff7fabd78:	00000000	udf	#0
   0x0000fffff7fabd7c:	00000000	udf	#0
   0x0000fffff7fabd80:	00000000	udf	#0
   0x0000fffff7fabd84:	00000000	udf	#0
   0x0000fffff7fabd88:	00000000	udf	#0
   0x0000fffff7fabd8c:	00000000	udf	#0
   0x0000fffff7fabd90:	00000000	udf	#0
   0x0000fffff7fabd94:	00000000	udf	#0
   0x0000fffff7fabd98:	00000000	udf	#0
   0x0000fffff7fabd9c:	00000000	udf	#0
   0x0000fffff7fabda0:	00000000	udf	#0
   0x0000fffff7fabda4:	00000000	udf	#0
   0x0000fffff7fabda8:	00000000	udf	#0
   0x0000fffff7fabdac:	00000000	udf	#0
   0x0000fffff7fabdb0:	00000000	udf	#0
   0x0000fffff7fabdb4:	00000000	udf	#0
   0x0000fffff7fabdb8:	00000000	udf	#0
   0x0000fffff7fabdbc:	00000000	udf	#0
   0x0000fffff7fabdc0:	00000000	udf	#0
   0x0000fffff7fabdc4:	00000000	udf	#0
   0x0000fffff7fabdc8:	00000000	udf	#0
   0x0000fffff7fabdcc:	00000000	udf	#0
   0x0000fffff7fabdd0:	00000000	udf	#0
   0x0000fffff7fabdd4:	00000000	udf	#0
   0x0000fffff7fabdd8:	00000000	udf	#0
   0x0000fffff7fabddc:	00000000	udf	#0
   0x0000fffff7fabde0:	00000000	udf	#0
   0x0000fffff7fabde4:	00000000	udf	#0
   0x0000fffff7fabde8:	00000000	udf	#0
   0x0000fffff7fabdec:	00000000	udf	#0
   0x0000fffff7fabdf0:	00000000	udf	#0
   0x0000fffff7fabdf4:	00000000	udf	#0
   0x0000fffff7fabdf8:	00000000	udf	#0
   0x0000fffff7fabdfc:	00000000	udf	#0
   0x0000fffff7fabe00:	00000000	udf	#0
   0x0000fffff7fabe04:	00000000	udf	#0
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
