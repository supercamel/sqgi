Dump of assembler code from 0xfffff7faf000 to 0xfffff7fb1000:
   0x0000fffff7faf000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7faf004:	910003fd	mov	x29, sp
   0x0000fffff7faf008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7faf00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7faf010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7faf014:	aa0003f3	mov	x19, x0
   0x0000fffff7faf018:	aa0103f4	mov	x20, x1
   0x0000fffff7faf01c:	aa0203f5	mov	x21, x2
   0x0000fffff7faf020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7faf024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7faf028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7faf02c:	f90003e9	str	x9, [sp]
   0x0000fffff7faf030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7faf034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7faf038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7faf03c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7faf040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf044:	d63f0200	blr	x16
   0x0000fffff7faf048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7faf04c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7faf050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7faf054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7faf058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf05c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf06c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7faf070:	36d801d1	tbz	w17, #27, 0xfffff7faf0a8
   0x0000fffff7faf074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf07c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf080:	54000281	b.ne	0xfffff7faf0d0  // b.any
   0x0000fffff7faf084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7faf088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf08c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf09c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf0a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf0a4:	54000169	b.ls	0xfffff7faf0d0  // b.plast
   0x0000fffff7faf0a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf0ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf0b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf0b4:	36d80091	tbz	w17, #27, 0xfffff7faf0c4
   0x0000fffff7faf0b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf0bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf0c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf0c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7faf0c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7faf0cc:	1400000e	b	0xfffff7faf104
   0x0000fffff7faf0d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf0d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf0d8:	aa1303e1	mov	x1, x19
   0x0000fffff7faf0dc:	aa1503e2	mov	x2, x21
   0x0000fffff7faf0e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7faf0e4:	aa1403e4	mov	x4, x20
   0x0000fffff7faf0e8:	aa1603e5	mov	x5, x22
   0x0000fffff7faf0ec:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faf0f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf0f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf0f8:	d63f0200	blr	x16
   0x0000fffff7faf0fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf100:	5400ce20	b.eq	0xfffff7fb0ac4  // b.none
   0x0000fffff7faf104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7faf108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7faf10c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7faf110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faf114:	36d80211	tbz	w17, #27, 0xfffff7faf154
   0x0000fffff7faf118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf11c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf120:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf124:	540001e1	b.ne	0xfffff7faf160  // b.any
   0x0000fffff7faf128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf12c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf13c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf144:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf148:	540000c9	b.ls	0xfffff7faf160  // b.plast
   0x0000fffff7faf14c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf15c:	1400000e	b	0xfffff7faf194
   0x0000fffff7faf160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf168:	aa1303e1	mov	x1, x19
   0x0000fffff7faf16c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7faf174:	aa1403e4	mov	x4, x20
   0x0000fffff7faf178:	aa1603e5	mov	x5, x22
   0x0000fffff7faf17c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7faf180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf188:	d63f0200	blr	x16
   0x0000fffff7faf18c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf190:	5400c9e0	b.eq	0xfffff7fb0acc  // b.none
   0x0000fffff7faf194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf19c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf1a0:	aa1503e2	mov	x2, x21
   0x0000fffff7faf1a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7faf1a8:	aa1403e4	mov	x4, x20
   0x0000fffff7faf1ac:	aa1603e5	mov	x5, x22
   0x0000fffff7faf1b0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faf1b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf1b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf1bc:	d63f0200	blr	x16
   0x0000fffff7faf1c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf1c4:	5400c880	b.eq	0xfffff7fb0ad4  // b.none
   0x0000fffff7faf1c8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7faf1cc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7faf1d0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7faf1d4:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7faf1d8:	36d80211	tbz	w17, #27, 0xfffff7faf218
   0x0000fffff7faf1dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf1e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf1e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf1e8:	540001e1	b.ne	0xfffff7faf224  // b.any
   0x0000fffff7faf1ec:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7faf1f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf1f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf1f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf1fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf200:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf204:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf208:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf20c:	540000c9	b.ls	0xfffff7faf224  // b.plast
   0x0000fffff7faf210:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf214:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf218:	f900166c	str	x12, [x19, #40]
   0x0000fffff7faf21c:	b900226d	str	w13, [x19, #32]
   0x0000fffff7faf220:	1400000e	b	0xfffff7faf258
   0x0000fffff7faf224:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf228:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf22c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf230:	aa1503e2	mov	x2, x21
   0x0000fffff7faf234:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7faf238:	aa1403e4	mov	x4, x20
   0x0000fffff7faf23c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf240:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7faf244:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf24c:	d63f0200	blr	x16
   0x0000fffff7faf250:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf254:	5400c440	b.eq	0xfffff7fb0adc  // b.none
   0x0000fffff7faf258:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf25c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf260:	aa1303e1	mov	x1, x19
   0x0000fffff7faf264:	aa1503e2	mov	x2, x21
   0x0000fffff7faf268:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7faf26c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf270:	aa1603e5	mov	x5, x22
   0x0000fffff7faf274:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faf278:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf27c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf280:	d63f0200	blr	x16
   0x0000fffff7faf284:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf288:	5400c2e0	b.eq	0xfffff7fb0ae4  // b.none
   0x0000fffff7faf28c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf290:	37d806a9	tbnz	w9, #27, 0xfffff7faf364
   0x0000fffff7faf294:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf298:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf29c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf2a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf2a4:	540001c1	b.ne	0xfffff7faf2dc  // b.any
   0x0000fffff7faf2a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf2ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf2b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf2b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf2b8:	54000121	b.ne	0xfffff7faf2dc  // b.any
   0x0000fffff7faf2bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf2c0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faf2c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf2c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf2cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf2d0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faf2d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf2d8:	14000030	b	0xfffff7faf398
   0x0000fffff7faf2dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf2e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf2e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf2e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf2ec:	54000120	b.eq	0xfffff7faf310  // b.none
   0x0000fffff7faf2f0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf2f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf2f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf2fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf300:	54000321	b.ne	0xfffff7faf364  // b.any
   0x0000fffff7faf304:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf308:	9e620120	scvtf	d0, x9
   0x0000fffff7faf30c:	14000002	b	0xfffff7faf314
   0x0000fffff7faf310:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faf314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf31c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf320:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf324:	54000120	b.eq	0xfffff7faf348  // b.none
   0x0000fffff7faf328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf32c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf334:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf338:	54000161	b.ne	0xfffff7faf364  // b.any
   0x0000fffff7faf33c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf340:	9e620121	scvtf	d1, x9
   0x0000fffff7faf344:	14000002	b	0xfffff7faf34c
   0x0000fffff7faf348:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faf34c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf350:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faf354:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf35c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf360:	17ffffde	b	0xfffff7faf2d8
   0x0000fffff7faf364:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf368:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf36c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf370:	aa1503e2	mov	x2, x21
   0x0000fffff7faf374:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7faf378:	aa1403e4	mov	x4, x20
   0x0000fffff7faf37c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf380:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faf384:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf388:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf38c:	d63f0200	blr	x16
   0x0000fffff7faf390:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf394:	5400bac0	b.eq	0xfffff7fb0aec  // b.none
   0x0000fffff7faf398:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf39c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf3a0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf3a4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf3a8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf3ac:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faf3b0:	36d801d1	tbz	w17, #27, 0xfffff7faf3e8
   0x0000fffff7faf3b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf3b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf3bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf3c0:	54000281	b.ne	0xfffff7faf410  // b.any
   0x0000fffff7faf3c4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf3c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf3cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf3d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf3d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf3d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf3dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf3e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf3e4:	54000169	b.ls	0xfffff7faf410  // b.plast
   0x0000fffff7faf3e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf3ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf3f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf3f4:	36d80091	tbz	w17, #27, 0xfffff7faf404
   0x0000fffff7faf3f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf3fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf400:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf404:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf408:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf40c:	1400000e	b	0xfffff7faf444
   0x0000fffff7faf410:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf414:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf418:	aa1303e1	mov	x1, x19
   0x0000fffff7faf41c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf420:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7faf424:	aa1403e4	mov	x4, x20
   0x0000fffff7faf428:	aa1603e5	mov	x5, x22
   0x0000fffff7faf42c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faf430:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf438:	d63f0200	blr	x16
   0x0000fffff7faf43c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf440:	5400b5a0	b.eq	0xfffff7fb0af4  // b.none
   0x0000fffff7faf444:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf448:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf44c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf450:	aa1503e2	mov	x2, x21
   0x0000fffff7faf454:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7faf458:	aa1403e4	mov	x4, x20
   0x0000fffff7faf45c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf460:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faf464:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf468:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf46c:	d63f0200	blr	x16
   0x0000fffff7faf470:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf474:	5400b440	b.eq	0xfffff7fb0afc  // b.none
   0x0000fffff7faf478:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf47c:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf480:	540004a0	b.eq	0xfffff7faf514  // b.none
   0x0000fffff7faf484:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf488:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf48c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf490:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf494:	54000400	b.eq	0xfffff7faf514  // b.none
   0x0000fffff7faf498:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf49c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf4a0:	36d801d1	tbz	w17, #27, 0xfffff7faf4d8
   0x0000fffff7faf4a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf4a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf4ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf4b0:	54000321	b.ne	0xfffff7faf514  // b.any
   0x0000fffff7faf4b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf4b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf4bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf4c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf4c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf4c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf4cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf4d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf4d4:	54000209	b.ls	0xfffff7faf514  // b.plast
   0x0000fffff7faf4d8:	36d8008d	tbz	w13, #27, 0xfffff7faf4e8
   0x0000fffff7faf4dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf4e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf4e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf4e8:	36d80091	tbz	w17, #27, 0xfffff7faf4f8
   0x0000fffff7faf4ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf4f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf4f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf4f8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faf4fc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf500:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf504:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf508:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf50c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf510:	1400000e	b	0xfffff7faf548
   0x0000fffff7faf514:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf518:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf51c:	aa1303e1	mov	x1, x19
   0x0000fffff7faf520:	aa1503e2	mov	x2, x21
   0x0000fffff7faf524:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7faf528:	aa1403e4	mov	x4, x20
   0x0000fffff7faf52c:	aa1603e5	mov	x5, x22
   0x0000fffff7faf530:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faf534:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf538:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf53c:	d63f0200	blr	x16
   0x0000fffff7faf540:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf544:	5400ae00	b.eq	0xfffff7fb0b04  // b.none
   0x0000fffff7faf548:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf54c:	37d806a9	tbnz	w9, #27, 0xfffff7faf620
   0x0000fffff7faf550:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf554:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf55c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf560:	540001c1	b.ne	0xfffff7faf598  // b.any
   0x0000fffff7faf564:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf568:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf56c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf570:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf574:	54000121	b.ne	0xfffff7faf598  // b.any
   0x0000fffff7faf578:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf57c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faf580:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf584:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf58c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faf590:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf594:	14000030	b	0xfffff7faf654
   0x0000fffff7faf598:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf59c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf5a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5a8:	54000120	b.eq	0xfffff7faf5cc  // b.none
   0x0000fffff7faf5ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf5b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf5b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5bc:	54000321	b.ne	0xfffff7faf620  // b.any
   0x0000fffff7faf5c0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf5c4:	9e620120	scvtf	d0, x9
   0x0000fffff7faf5c8:	14000002	b	0xfffff7faf5d0
   0x0000fffff7faf5cc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faf5d0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf5d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf5d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5e0:	54000120	b.eq	0xfffff7faf604  // b.none
   0x0000fffff7faf5e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf5e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf5ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf5f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf5f4:	54000161	b.ne	0xfffff7faf620  // b.any
   0x0000fffff7faf5f8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf5fc:	9e620121	scvtf	d1, x9
   0x0000fffff7faf600:	14000002	b	0xfffff7faf608
   0x0000fffff7faf604:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faf608:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf60c:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faf610:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf618:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf61c:	17ffffde	b	0xfffff7faf594
   0x0000fffff7faf620:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf624:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf628:	aa1303e1	mov	x1, x19
   0x0000fffff7faf62c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf630:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7faf634:	aa1403e4	mov	x4, x20
   0x0000fffff7faf638:	aa1603e5	mov	x5, x22
   0x0000fffff7faf63c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faf640:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf644:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf648:	d63f0200	blr	x16
   0x0000fffff7faf64c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf650:	5400a5e0	b.eq	0xfffff7fb0b0c  // b.none
   0x0000fffff7faf654:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf658:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf65c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf660:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf664:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf668:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faf66c:	36d801d1	tbz	w17, #27, 0xfffff7faf6a4
   0x0000fffff7faf670:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf674:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf678:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf67c:	54000281	b.ne	0xfffff7faf6cc  // b.any
   0x0000fffff7faf680:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf684:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf688:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf68c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf690:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf694:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf698:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf69c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf6a0:	54000169	b.ls	0xfffff7faf6cc  // b.plast
   0x0000fffff7faf6a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf6a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf6ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf6b0:	36d80091	tbz	w17, #27, 0xfffff7faf6c0
   0x0000fffff7faf6b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf6b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf6bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf6c0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf6c4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf6c8:	1400000e	b	0xfffff7faf700
   0x0000fffff7faf6cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf6d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf6d4:	aa1303e1	mov	x1, x19
   0x0000fffff7faf6d8:	aa1503e2	mov	x2, x21
   0x0000fffff7faf6dc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7faf6e0:	aa1403e4	mov	x4, x20
   0x0000fffff7faf6e4:	aa1603e5	mov	x5, x22
   0x0000fffff7faf6e8:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faf6ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf6f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf6f4:	d63f0200	blr	x16
   0x0000fffff7faf6f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf6fc:	5400a0c0	b.eq	0xfffff7fb0b14  // b.none
   0x0000fffff7faf700:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf704:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf708:	aa1303e1	mov	x1, x19
   0x0000fffff7faf70c:	aa1503e2	mov	x2, x21
   0x0000fffff7faf710:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7faf714:	aa1403e4	mov	x4, x20
   0x0000fffff7faf718:	aa1603e5	mov	x5, x22
   0x0000fffff7faf71c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faf720:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf724:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf728:	d63f0200	blr	x16
   0x0000fffff7faf72c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf730:	54009f60	b.eq	0xfffff7fb0b1c  // b.none
   0x0000fffff7faf734:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf738:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf73c:	540004a0	b.eq	0xfffff7faf7d0  // b.none
   0x0000fffff7faf740:	b940016d	ldr	w13, [x11]
   0x0000fffff7faf744:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faf748:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faf74c:	eb0901bf	cmp	x13, x9
   0x0000fffff7faf750:	54000400	b.eq	0xfffff7faf7d0  // b.none
   0x0000fffff7faf754:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faf758:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faf75c:	36d801d1	tbz	w17, #27, 0xfffff7faf794
   0x0000fffff7faf760:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf764:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf768:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf76c:	54000321	b.ne	0xfffff7faf7d0  // b.any
   0x0000fffff7faf770:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faf774:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf778:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf77c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf780:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf784:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf788:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf78c:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf790:	54000209	b.ls	0xfffff7faf7d0  // b.plast
   0x0000fffff7faf794:	36d8008d	tbz	w13, #27, 0xfffff7faf7a4
   0x0000fffff7faf798:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf79c:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf7a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf7a4:	36d80091	tbz	w17, #27, 0xfffff7faf7b4
   0x0000fffff7faf7a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf7ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf7b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf7b4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faf7b8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf7bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7faf7c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7faf7c4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf7c8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf7cc:	1400000e	b	0xfffff7faf804
   0x0000fffff7faf7d0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7faf7d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf7d8:	aa1303e1	mov	x1, x19
   0x0000fffff7faf7dc:	aa1503e2	mov	x2, x21
   0x0000fffff7faf7e0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7faf7e4:	aa1403e4	mov	x4, x20
   0x0000fffff7faf7e8:	aa1603e5	mov	x5, x22
   0x0000fffff7faf7ec:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7faf7f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7faf7f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf7f8:	d63f0200	blr	x16
   0x0000fffff7faf7fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf800:	54009920	b.eq	0xfffff7fb0b24  // b.none
   0x0000fffff7faf804:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf808:	37d806a9	tbnz	w9, #27, 0xfffff7faf8dc
   0x0000fffff7faf80c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf810:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf814:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf818:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf81c:	540001c1	b.ne	0xfffff7faf854  // b.any
   0x0000fffff7faf820:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf82c:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf830:	54000121	b.ne	0xfffff7faf854  // b.any
   0x0000fffff7faf834:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf838:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7faf83c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7faf840:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf844:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf848:	f9001669	str	x9, [x19, #40]
   0x0000fffff7faf84c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf850:	14000030	b	0xfffff7faf910
   0x0000fffff7faf854:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf858:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf85c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf860:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf864:	54000120	b.eq	0xfffff7faf888  // b.none
   0x0000fffff7faf868:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7faf86c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf870:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf874:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf878:	54000321	b.ne	0xfffff7faf8dc  // b.any
   0x0000fffff7faf87c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7faf880:	9e620120	scvtf	d0, x9
   0x0000fffff7faf884:	14000002	b	0xfffff7faf88c
   0x0000fffff7faf888:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7faf88c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf890:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf898:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf89c:	54000120	b.eq	0xfffff7faf8c0  // b.none
   0x0000fffff7faf8a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7faf8a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7faf8a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf8ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7faf8b0:	54000161	b.ne	0xfffff7faf8dc  // b.any
   0x0000fffff7faf8b4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7faf8b8:	9e620121	scvtf	d1, x9
   0x0000fffff7faf8bc:	14000002	b	0xfffff7faf8c4
   0x0000fffff7faf8c0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7faf8c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7faf8c8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7faf8cc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7faf8d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7faf8d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7faf8d8:	17ffffde	b	0xfffff7faf850
   0x0000fffff7faf8dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf8e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf8e4:	aa1303e1	mov	x1, x19
   0x0000fffff7faf8e8:	aa1503e2	mov	x2, x21
   0x0000fffff7faf8ec:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7faf8f0:	aa1403e4	mov	x4, x20
   0x0000fffff7faf8f4:	aa1603e5	mov	x5, x22
   0x0000fffff7faf8f8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7faf8fc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf900:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf904:	d63f0200	blr	x16
   0x0000fffff7faf908:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf90c:	54009100	b.eq	0xfffff7fb0b2c  // b.none
   0x0000fffff7faf910:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7faf914:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7faf918:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7faf91c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7faf920:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7faf924:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7faf928:	36d801d1	tbz	w17, #27, 0xfffff7faf960
   0x0000fffff7faf92c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faf930:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faf934:	f100013f	cmp	x9, #0x0
   0x0000fffff7faf938:	54000281	b.ne	0xfffff7faf988  // b.any
   0x0000fffff7faf93c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7faf940:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf944:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faf948:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faf94c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faf950:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faf954:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faf958:	f100055f	cmp	x10, #0x1
   0x0000fffff7faf95c:	54000169	b.ls	0xfffff7faf988  // b.plast
   0x0000fffff7faf960:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faf964:	91000529	add	x9, x9, #0x1
   0x0000fffff7faf968:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faf96c:	36d80091	tbz	w17, #27, 0xfffff7faf97c
   0x0000fffff7faf970:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faf974:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faf978:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faf97c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7faf980:	b900326d	str	w13, [x19, #48]
   0x0000fffff7faf984:	1400000e	b	0xfffff7faf9bc
   0x0000fffff7faf988:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faf98c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf990:	aa1303e1	mov	x1, x19
   0x0000fffff7faf994:	aa1503e2	mov	x2, x21
   0x0000fffff7faf998:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7faf99c:	aa1403e4	mov	x4, x20
   0x0000fffff7faf9a0:	aa1603e5	mov	x5, x22
   0x0000fffff7faf9a4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faf9a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf9ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf9b0:	d63f0200	blr	x16
   0x0000fffff7faf9b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf9b8:	54008be0	b.eq	0xfffff7fb0b34  // b.none
   0x0000fffff7faf9bc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faf9c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faf9c4:	aa1303e1	mov	x1, x19
   0x0000fffff7faf9c8:	aa1503e2	mov	x2, x21
   0x0000fffff7faf9cc:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7faf9d0:	aa1403e4	mov	x4, x20
   0x0000fffff7faf9d4:	aa1603e5	mov	x5, x22
   0x0000fffff7faf9d8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faf9dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faf9e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faf9e4:	d63f0200	blr	x16
   0x0000fffff7faf9e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7faf9ec:	54008a80	b.eq	0xfffff7fb0b3c  // b.none
   0x0000fffff7faf9f0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faf9f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7faf9f8:	540004a0	b.eq	0xfffff7fafa8c  // b.none
   0x0000fffff7faf9fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fafa00:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fafa04:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fafa08:	eb0901bf	cmp	x13, x9
   0x0000fffff7fafa0c:	54000400	b.eq	0xfffff7fafa8c  // b.none
   0x0000fffff7fafa10:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fafa14:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fafa18:	36d801d1	tbz	w17, #27, 0xfffff7fafa50
   0x0000fffff7fafa1c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafa20:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafa24:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafa28:	54000321	b.ne	0xfffff7fafa8c  // b.any
   0x0000fffff7fafa2c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fafa30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafa34:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafa38:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafa3c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafa40:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafa44:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafa48:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafa4c:	54000209	b.ls	0xfffff7fafa8c  // b.plast
   0x0000fffff7fafa50:	36d8008d	tbz	w13, #27, 0xfffff7fafa60
   0x0000fffff7fafa54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafa58:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafa5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafa60:	36d80091	tbz	w17, #27, 0xfffff7fafa70
   0x0000fffff7fafa64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafa68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafa6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafa70:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fafa74:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fafa78:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fafa7c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fafa80:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fafa84:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fafa88:	1400000e	b	0xfffff7fafac0
   0x0000fffff7fafa8c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fafa90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafa94:	aa1303e1	mov	x1, x19
   0x0000fffff7fafa98:	aa1503e2	mov	x2, x21
   0x0000fffff7fafa9c:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fafaa0:	aa1403e4	mov	x4, x20
   0x0000fffff7fafaa4:	aa1603e5	mov	x5, x22
   0x0000fffff7fafaa8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fafaac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafab0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafab4:	d63f0200	blr	x16
   0x0000fffff7fafab8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafabc:	54008440	b.eq	0xfffff7fb0b44  // b.none
   0x0000fffff7fafac0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafac4:	37d806a9	tbnz	w9, #27, 0xfffff7fafb98
   0x0000fffff7fafac8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafacc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafad8:	540001c1	b.ne	0xfffff7fafb10  // b.any
   0x0000fffff7fafadc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafae0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafae8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafaec:	54000121	b.ne	0xfffff7fafb10  // b.any
   0x0000fffff7fafaf0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fafaf4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fafaf8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fafafc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb04:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fafb08:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fafb0c:	14000030	b	0xfffff7fafbcc
   0x0000fffff7fafb10:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafb14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafb18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb20:	54000120	b.eq	0xfffff7fafb44  // b.none
   0x0000fffff7fafb24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafb28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb34:	54000321	b.ne	0xfffff7fafb98  // b.any
   0x0000fffff7fafb38:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fafb3c:	9e620120	scvtf	d0, x9
   0x0000fffff7fafb40:	14000002	b	0xfffff7fafb48
   0x0000fffff7fafb44:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fafb48:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafb4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafb50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb58:	54000120	b.eq	0xfffff7fafb7c  // b.none
   0x0000fffff7fafb5c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafb60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafb64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafb6c:	54000161	b.ne	0xfffff7fafb98  // b.any
   0x0000fffff7fafb70:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fafb74:	9e620121	scvtf	d1, x9
   0x0000fffff7fafb78:	14000002	b	0xfffff7fafb80
   0x0000fffff7fafb7c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fafb80:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fafb84:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fafb88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafb8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafb90:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fafb94:	17ffffde	b	0xfffff7fafb0c
   0x0000fffff7fafb98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafb9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafba0:	aa1303e1	mov	x1, x19
   0x0000fffff7fafba4:	aa1503e2	mov	x2, x21
   0x0000fffff7fafba8:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fafbac:	aa1403e4	mov	x4, x20
   0x0000fffff7fafbb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fafbb4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fafbb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafbbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafbc0:	d63f0200	blr	x16
   0x0000fffff7fafbc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafbc8:	54007c20	b.eq	0xfffff7fb0b4c  // b.none
   0x0000fffff7fafbcc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fafbd0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fafbd4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fafbd8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fafbdc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fafbe0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fafbe4:	36d801d1	tbz	w17, #27, 0xfffff7fafc1c
   0x0000fffff7fafbe8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafbec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafbf0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafbf4:	54000281	b.ne	0xfffff7fafc44  // b.any
   0x0000fffff7fafbf8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fafbfc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafc00:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafc04:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafc08:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafc0c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafc10:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafc14:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafc18:	54000169	b.ls	0xfffff7fafc44  // b.plast
   0x0000fffff7fafc1c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafc20:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafc24:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafc28:	36d80091	tbz	w17, #27, 0xfffff7fafc38
   0x0000fffff7fafc2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafc30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafc34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafc38:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fafc3c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fafc40:	1400000e	b	0xfffff7fafc78
   0x0000fffff7fafc44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafc48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafc4c:	aa1303e1	mov	x1, x19
   0x0000fffff7fafc50:	aa1503e2	mov	x2, x21
   0x0000fffff7fafc54:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fafc58:	aa1403e4	mov	x4, x20
   0x0000fffff7fafc5c:	aa1603e5	mov	x5, x22
   0x0000fffff7fafc60:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fafc64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafc68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafc6c:	d63f0200	blr	x16
   0x0000fffff7fafc70:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafc74:	54007700	b.eq	0xfffff7fb0b54  // b.none
   0x0000fffff7fafc78:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fafc7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafc80:	aa1303e1	mov	x1, x19
   0x0000fffff7fafc84:	aa1503e2	mov	x2, x21
   0x0000fffff7fafc88:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fafc8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fafc90:	aa1603e5	mov	x5, x22
   0x0000fffff7fafc94:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fafc98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafc9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafca0:	d63f0200	blr	x16
   0x0000fffff7fafca4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafca8:	540075a0	b.eq	0xfffff7fb0b5c  // b.none
   0x0000fffff7fafcac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fafcb0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fafcb4:	540004a0	b.eq	0xfffff7fafd48  // b.none
   0x0000fffff7fafcb8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fafcbc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fafcc0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fafcc4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fafcc8:	54000400	b.eq	0xfffff7fafd48  // b.none
   0x0000fffff7fafccc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fafcd0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fafcd4:	36d801d1	tbz	w17, #27, 0xfffff7fafd0c
   0x0000fffff7fafcd8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafcdc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafce0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafce4:	54000321	b.ne	0xfffff7fafd48  // b.any
   0x0000fffff7fafce8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fafcec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafcf0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafcf4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafcf8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafcfc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafd00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafd04:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafd08:	54000209	b.ls	0xfffff7fafd48  // b.plast
   0x0000fffff7fafd0c:	36d8008d	tbz	w13, #27, 0xfffff7fafd1c
   0x0000fffff7fafd10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafd14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafd18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafd1c:	36d80091	tbz	w17, #27, 0xfffff7fafd2c
   0x0000fffff7fafd20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafd24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafd28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafd2c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fafd30:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fafd34:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fafd38:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fafd3c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fafd40:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fafd44:	1400000e	b	0xfffff7fafd7c
   0x0000fffff7fafd48:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fafd4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafd50:	aa1303e1	mov	x1, x19
   0x0000fffff7fafd54:	aa1503e2	mov	x2, x21
   0x0000fffff7fafd58:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fafd5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fafd60:	aa1603e5	mov	x5, x22
   0x0000fffff7fafd64:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fafd68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fafd6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafd70:	d63f0200	blr	x16
   0x0000fffff7fafd74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafd78:	54006f60	b.eq	0xfffff7fb0b64  // b.none
   0x0000fffff7fafd7c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafd80:	37d806a9	tbnz	w9, #27, 0xfffff7fafe54
   0x0000fffff7fafd84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafd88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafd8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafd90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafd94:	540001c1	b.ne	0xfffff7fafdcc  // b.any
   0x0000fffff7fafd98:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafd9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafda0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafda4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafda8:	54000121	b.ne	0xfffff7fafdcc  // b.any
   0x0000fffff7fafdac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fafdb0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fafdb4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fafdb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafdbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafdc0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fafdc4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fafdc8:	14000030	b	0xfffff7fafe88
   0x0000fffff7fafdcc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafdd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafdd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafdd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafddc:	54000120	b.eq	0xfffff7fafe00  // b.none
   0x0000fffff7fafde0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fafde4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafde8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafdec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafdf0:	54000321	b.ne	0xfffff7fafe54  // b.any
   0x0000fffff7fafdf4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fafdf8:	9e620120	scvtf	d0, x9
   0x0000fffff7fafdfc:	14000002	b	0xfffff7fafe04
   0x0000fffff7fafe00:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fafe04:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafe08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafe0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafe10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafe14:	54000120	b.eq	0xfffff7fafe38  // b.none
   0x0000fffff7fafe18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fafe1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fafe20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafe24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fafe28:	54000161	b.ne	0xfffff7fafe54  // b.any
   0x0000fffff7fafe2c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fafe30:	9e620121	scvtf	d1, x9
   0x0000fffff7fafe34:	14000002	b	0xfffff7fafe3c
   0x0000fffff7fafe38:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fafe3c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fafe40:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fafe44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fafe48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fafe4c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fafe50:	17ffffde	b	0xfffff7fafdc8
   0x0000fffff7fafe54:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fafe58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fafe5c:	aa1303e1	mov	x1, x19
   0x0000fffff7fafe60:	aa1503e2	mov	x2, x21
   0x0000fffff7fafe64:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fafe68:	aa1403e4	mov	x4, x20
   0x0000fffff7fafe6c:	aa1603e5	mov	x5, x22
   0x0000fffff7fafe70:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fafe74:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fafe78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fafe7c:	d63f0200	blr	x16
   0x0000fffff7fafe80:	f100001f	cmp	x0, #0x0
   0x0000fffff7fafe84:	54006740	b.eq	0xfffff7fb0b6c  // b.none
   0x0000fffff7fafe88:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fafe8c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fafe90:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fafe94:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fafe98:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fafe9c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fafea0:	36d801d1	tbz	w17, #27, 0xfffff7fafed8
   0x0000fffff7fafea4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fafea8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fafeac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fafeb0:	54000281	b.ne	0xfffff7faff00  // b.any
   0x0000fffff7fafeb4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fafeb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafebc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fafec0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fafec4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fafec8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fafecc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fafed0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fafed4:	54000169	b.ls	0xfffff7faff00  // b.plast
   0x0000fffff7fafed8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fafedc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fafee0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fafee4:	36d80091	tbz	w17, #27, 0xfffff7fafef4
   0x0000fffff7fafee8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fafeec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fafef0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fafef4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fafef8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fafefc:	1400000e	b	0xfffff7faff34
   0x0000fffff7faff00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7faff04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faff08:	aa1303e1	mov	x1, x19
   0x0000fffff7faff0c:	aa1503e2	mov	x2, x21
   0x0000fffff7faff10:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7faff14:	aa1403e4	mov	x4, x20
   0x0000fffff7faff18:	aa1603e5	mov	x5, x22
   0x0000fffff7faff1c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7faff20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faff24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faff28:	d63f0200	blr	x16
   0x0000fffff7faff2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7faff30:	54006220	b.eq	0xfffff7fb0b74  // b.none
   0x0000fffff7faff34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7faff38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7faff3c:	aa1303e1	mov	x1, x19
   0x0000fffff7faff40:	aa1503e2	mov	x2, x21
   0x0000fffff7faff44:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7faff48:	aa1403e4	mov	x4, x20
   0x0000fffff7faff4c:	aa1603e5	mov	x5, x22
   0x0000fffff7faff50:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7faff54:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7faff58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7faff5c:	d63f0200	blr	x16
   0x0000fffff7faff60:	f100001f	cmp	x0, #0x0
   0x0000fffff7faff64:	540060c0	b.eq	0xfffff7fb0b7c  // b.none
   0x0000fffff7faff68:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7faff6c:	f100017f	cmp	x11, #0x0
   0x0000fffff7faff70:	540004a0	b.eq	0xfffff7fb0004  // b.none
   0x0000fffff7faff74:	b940016d	ldr	w13, [x11]
   0x0000fffff7faff78:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7faff7c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7faff80:	eb0901bf	cmp	x13, x9
   0x0000fffff7faff84:	54000400	b.eq	0xfffff7fb0004  // b.none
   0x0000fffff7faff88:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7faff8c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7faff90:	36d801d1	tbz	w17, #27, 0xfffff7faffc8
   0x0000fffff7faff94:	f94003e9	ldr	x9, [sp]
   0x0000fffff7faff98:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7faff9c:	f100013f	cmp	x9, #0x0
   0x0000fffff7faffa0:	54000321	b.ne	0xfffff7fb0004  // b.any
   0x0000fffff7faffa4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7faffa8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faffac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7faffb0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7faffb4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7faffb8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7faffbc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7faffc0:	f100055f	cmp	x10, #0x1
   0x0000fffff7faffc4:	54000209	b.ls	0xfffff7fb0004  // b.plast
   0x0000fffff7faffc8:	36d8008d	tbz	w13, #27, 0xfffff7faffd8
   0x0000fffff7faffcc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7faffd0:	91000529	add	x9, x9, #0x1
   0x0000fffff7faffd4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7faffd8:	36d80091	tbz	w17, #27, 0xfffff7faffe8
   0x0000fffff7faffdc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7faffe0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7faffe4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7faffe8:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7faffec:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fafff0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fafff4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fafff8:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fafffc:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0000:	1400000e	b	0xfffff7fb0038
   0x0000fffff7fb0004:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0008:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb000c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0010:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0014:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb0018:	aa1403e4	mov	x4, x20
   0x0000fffff7fb001c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0020:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb0024:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0028:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb002c:	d63f0200	blr	x16
   0x0000fffff7fb0030:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0034:	54005a80	b.eq	0xfffff7fb0b84  // b.none
   0x0000fffff7fb0038:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb003c:	37d806a9	tbnz	w9, #27, 0xfffff7fb0110
   0x0000fffff7fb0040:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0044:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb004c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0050:	540001c1	b.ne	0xfffff7fb0088  // b.any
   0x0000fffff7fb0054:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0058:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb005c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0060:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0064:	54000121	b.ne	0xfffff7fb0088  // b.any
   0x0000fffff7fb0068:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb006c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb0070:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0074:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb007c:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb0080:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0084:	14000030	b	0xfffff7fb0144
   0x0000fffff7fb0088:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb008c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0090:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0094:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0098:	54000120	b.eq	0xfffff7fb00bc  // b.none
   0x0000fffff7fb009c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb00a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb00a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb00a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb00ac:	54000321	b.ne	0xfffff7fb0110  // b.any
   0x0000fffff7fb00b0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb00b4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb00b8:	14000002	b	0xfffff7fb00c0
   0x0000fffff7fb00bc:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb00c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb00c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb00c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb00cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb00d0:	54000120	b.eq	0xfffff7fb00f4  // b.none
   0x0000fffff7fb00d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb00d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb00dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb00e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb00e4:	54000161	b.ne	0xfffff7fb0110  // b.any
   0x0000fffff7fb00e8:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb00ec:	9e620121	scvtf	d1, x9
   0x0000fffff7fb00f0:	14000002	b	0xfffff7fb00f8
   0x0000fffff7fb00f4:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb00f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb00fc:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb0100:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0104:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0108:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb010c:	17ffffde	b	0xfffff7fb0084
   0x0000fffff7fb0110:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0114:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0118:	aa1303e1	mov	x1, x19
   0x0000fffff7fb011c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0120:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb0124:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0128:	aa1603e5	mov	x5, x22
   0x0000fffff7fb012c:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb0130:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0134:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0138:	d63f0200	blr	x16
   0x0000fffff7fb013c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0140:	54005260	b.eq	0xfffff7fb0b8c  // b.none
   0x0000fffff7fb0144:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb0148:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb014c:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb0150:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0154:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0158:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb015c:	36d801d1	tbz	w17, #27, 0xfffff7fb0194
   0x0000fffff7fb0160:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0164:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0168:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb016c:	54000281	b.ne	0xfffff7fb01bc  // b.any
   0x0000fffff7fb0170:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0174:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0178:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb017c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0180:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0184:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0188:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb018c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0190:	54000169	b.ls	0xfffff7fb01bc  // b.plast
   0x0000fffff7fb0194:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0198:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb019c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb01a0:	36d80091	tbz	w17, #27, 0xfffff7fb01b0
   0x0000fffff7fb01a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb01a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb01ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb01b0:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb01b4:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb01b8:	1400000e	b	0xfffff7fb01f0
   0x0000fffff7fb01bc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb01c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb01c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb01c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb01cc:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb01d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb01d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb01d8:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb01dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb01e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb01e4:	d63f0200	blr	x16
   0x0000fffff7fb01e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb01ec:	54004d40	b.eq	0xfffff7fb0b94  // b.none
   0x0000fffff7fb01f0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb01f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb01f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb01fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0200:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb0204:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0208:	aa1603e5	mov	x5, x22
   0x0000fffff7fb020c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb0210:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0214:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0218:	d63f0200	blr	x16
   0x0000fffff7fb021c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0220:	54004be0	b.eq	0xfffff7fb0b9c  // b.none
   0x0000fffff7fb0224:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb0228:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb022c:	540004a0	b.eq	0xfffff7fb02c0  // b.none
   0x0000fffff7fb0230:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb0234:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb0238:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb023c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb0240:	54000400	b.eq	0xfffff7fb02c0  // b.none
   0x0000fffff7fb0244:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0248:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb024c:	36d801d1	tbz	w17, #27, 0xfffff7fb0284
   0x0000fffff7fb0250:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0254:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0258:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb025c:	54000321	b.ne	0xfffff7fb02c0  // b.any
   0x0000fffff7fb0260:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0264:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0268:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb026c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb0270:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0274:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0278:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb027c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0280:	54000209	b.ls	0xfffff7fb02c0  // b.plast
   0x0000fffff7fb0284:	36d8008d	tbz	w13, #27, 0xfffff7fb0294
   0x0000fffff7fb0288:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb028c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0290:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0294:	36d80091	tbz	w17, #27, 0xfffff7fb02a4
   0x0000fffff7fb0298:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb029c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb02a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb02a4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb02a8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb02ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb02b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb02b4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb02b8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb02bc:	1400000e	b	0xfffff7fb02f4
   0x0000fffff7fb02c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb02c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb02c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb02cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb02d0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb02d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb02d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb02dc:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb02e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb02e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb02e8:	d63f0200	blr	x16
   0x0000fffff7fb02ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb02f0:	540045a0	b.eq	0xfffff7fb0ba4  // b.none
   0x0000fffff7fb02f4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb02f8:	37d806a9	tbnz	w9, #27, 0xfffff7fb03cc
   0x0000fffff7fb02fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0300:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0308:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb030c:	540001c1	b.ne	0xfffff7fb0344  // b.any
   0x0000fffff7fb0310:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0314:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0318:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb031c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0320:	54000121	b.ne	0xfffff7fb0344  // b.any
   0x0000fffff7fb0324:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb0328:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb032c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb0330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0338:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb033c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0340:	14000030	b	0xfffff7fb0400
   0x0000fffff7fb0344:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0348:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb034c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0350:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0354:	54000120	b.eq	0xfffff7fb0378  // b.none
   0x0000fffff7fb0358:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb035c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0364:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0368:	54000321	b.ne	0xfffff7fb03cc  // b.any
   0x0000fffff7fb036c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb0370:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0374:	14000002	b	0xfffff7fb037c
   0x0000fffff7fb0378:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb037c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0380:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0388:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb038c:	54000120	b.eq	0xfffff7fb03b0  // b.none
   0x0000fffff7fb0390:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0394:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0398:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb039c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb03a0:	54000161	b.ne	0xfffff7fb03cc  // b.any
   0x0000fffff7fb03a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb03a8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb03ac:	14000002	b	0xfffff7fb03b4
   0x0000fffff7fb03b0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb03b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb03b8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb03bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb03c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb03c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb03c8:	17ffffde	b	0xfffff7fb0340
   0x0000fffff7fb03cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb03d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb03d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb03d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb03dc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb03e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb03e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb03e8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb03ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb03f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb03f4:	d63f0200	blr	x16
   0x0000fffff7fb03f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb03fc:	54003d80	b.eq	0xfffff7fb0bac  // b.none
   0x0000fffff7fb0400:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb0404:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb0408:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb040c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0410:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb0414:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb0418:	36d801d1	tbz	w17, #27, 0xfffff7fb0450
   0x0000fffff7fb041c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0420:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0424:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0428:	54000281	b.ne	0xfffff7fb0478  // b.any
   0x0000fffff7fb042c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0430:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0434:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0438:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb043c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0440:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0444:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0448:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb044c:	54000169	b.ls	0xfffff7fb0478  // b.plast
   0x0000fffff7fb0450:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0454:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0458:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb045c:	36d80091	tbz	w17, #27, 0xfffff7fb046c
   0x0000fffff7fb0460:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0464:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0468:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb046c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0470:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0474:	1400000e	b	0xfffff7fb04ac
   0x0000fffff7fb0478:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb047c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0480:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0484:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0488:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb048c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0490:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0494:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb0498:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb049c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb04a0:	d63f0200	blr	x16
   0x0000fffff7fb04a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb04a8:	54003860	b.eq	0xfffff7fb0bb4  // b.none
   0x0000fffff7fb04ac:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb04b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb04b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb04b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb04bc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb04c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb04c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb04c8:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb04cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb04d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb04d4:	d63f0200	blr	x16
   0x0000fffff7fb04d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb04dc:	54003700	b.eq	0xfffff7fb0bbc  // b.none
   0x0000fffff7fb04e0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb04e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb04e8:	540004a0	b.eq	0xfffff7fb057c  // b.none
   0x0000fffff7fb04ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb04f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb04f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb04f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb04fc:	54000400	b.eq	0xfffff7fb057c  // b.none
   0x0000fffff7fb0500:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb0504:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb0508:	36d801d1	tbz	w17, #27, 0xfffff7fb0540
   0x0000fffff7fb050c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0510:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb0514:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb0518:	54000321	b.ne	0xfffff7fb057c  // b.any
   0x0000fffff7fb051c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb0520:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0524:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb0528:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb052c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb0530:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0534:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0538:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb053c:	54000209	b.ls	0xfffff7fb057c  // b.plast
   0x0000fffff7fb0540:	36d8008d	tbz	w13, #27, 0xfffff7fb0550
   0x0000fffff7fb0544:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0548:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb054c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0550:	36d80091	tbz	w17, #27, 0xfffff7fb0560
   0x0000fffff7fb0554:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0558:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb055c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0560:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb0564:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0568:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb056c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb0570:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0574:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0578:	1400000e	b	0xfffff7fb05b0
   0x0000fffff7fb057c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb0580:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0584:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0588:	aa1503e2	mov	x2, x21
   0x0000fffff7fb058c:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb0590:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0594:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0598:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb059c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb05a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb05a4:	d63f0200	blr	x16
   0x0000fffff7fb05a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb05ac:	540030c0	b.eq	0xfffff7fb0bc4  // b.none
   0x0000fffff7fb05b0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb05b4:	37d806a9	tbnz	w9, #27, 0xfffff7fb0688
   0x0000fffff7fb05b8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb05bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb05c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05c8:	540001c1	b.ne	0xfffff7fb0600  // b.any
   0x0000fffff7fb05cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb05d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb05d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb05dc:	54000121	b.ne	0xfffff7fb0600  // b.any
   0x0000fffff7fb05e0:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb05e4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb05e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb05ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb05f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb05f4:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb05f8:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb05fc:	14000030	b	0xfffff7fb06bc
   0x0000fffff7fb0600:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0604:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0608:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb060c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0610:	54000120	b.eq	0xfffff7fb0634  // b.none
   0x0000fffff7fb0614:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb061c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0620:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0624:	54000321	b.ne	0xfffff7fb0688  // b.any
   0x0000fffff7fb0628:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb062c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb0630:	14000002	b	0xfffff7fb0638
   0x0000fffff7fb0634:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb0638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb063c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0644:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0648:	54000120	b.eq	0xfffff7fb066c  // b.none
   0x0000fffff7fb064c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb0650:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0658:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb065c:	54000161	b.ne	0xfffff7fb0688  // b.any
   0x0000fffff7fb0660:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0664:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0668:	14000002	b	0xfffff7fb0670
   0x0000fffff7fb066c:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb0670:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0674:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb0678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb067c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0680:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0684:	17ffffde	b	0xfffff7fb05fc
   0x0000fffff7fb0688:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb068c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0690:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0694:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0698:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb069c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb06a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb06a4:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb06a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb06ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb06b0:	d63f0200	blr	x16
   0x0000fffff7fb06b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb06b8:	540028a0	b.eq	0xfffff7fb0bcc  // b.none
   0x0000fffff7fb06bc:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb06c0:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb06c4:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb06c8:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb06cc:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb06d0:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb06d4:	36d801d1	tbz	w17, #27, 0xfffff7fb070c
   0x0000fffff7fb06d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb06dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb06e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb06e4:	54000281	b.ne	0xfffff7fb0734  // b.any
   0x0000fffff7fb06e8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb06ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb06f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb06f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb06f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb06fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb0700:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb0704:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb0708:	54000169	b.ls	0xfffff7fb0734  // b.plast
   0x0000fffff7fb070c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0710:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0714:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb0718:	36d80091	tbz	w17, #27, 0xfffff7fb0728
   0x0000fffff7fb071c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0720:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0724:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb0728:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb072c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0730:	1400000e	b	0xfffff7fb0768
   0x0000fffff7fb0734:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0738:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb073c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0740:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0744:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb0748:	aa1403e4	mov	x4, x20
   0x0000fffff7fb074c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0750:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb0754:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0758:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb075c:	d63f0200	blr	x16
   0x0000fffff7fb0760:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0764:	54002380	b.eq	0xfffff7fb0bd4  // b.none
   0x0000fffff7fb0768:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb076c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0770:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0774:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0778:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb077c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0780:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0784:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb0788:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb078c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0790:	d63f0200	blr	x16
   0x0000fffff7fb0794:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0798:	54002220	b.eq	0xfffff7fb0bdc  // b.none
   0x0000fffff7fb079c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb07a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb07a4:	540004a0	b.eq	0xfffff7fb0838  // b.none
   0x0000fffff7fb07a8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb07ac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb07b0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb07b4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb07b8:	54000400	b.eq	0xfffff7fb0838  // b.none
   0x0000fffff7fb07bc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb07c0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb07c4:	36d801d1	tbz	w17, #27, 0xfffff7fb07fc
   0x0000fffff7fb07c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb07cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb07d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb07d4:	54000321	b.ne	0xfffff7fb0838  // b.any
   0x0000fffff7fb07d8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb07dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb07e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb07e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb07e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb07ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb07f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb07f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb07f8:	54000209	b.ls	0xfffff7fb0838  // b.plast
   0x0000fffff7fb07fc:	36d8008d	tbz	w13, #27, 0xfffff7fb080c
   0x0000fffff7fb0800:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb0804:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb0808:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb080c:	36d80091	tbz	w17, #27, 0xfffff7fb081c
   0x0000fffff7fb0810:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb0814:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb0818:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb081c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb0820:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb0824:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb0828:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb082c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb0830:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb0834:	1400000e	b	0xfffff7fb086c
   0x0000fffff7fb0838:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb083c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0840:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0844:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0848:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb084c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0850:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0854:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb0858:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb085c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0860:	d63f0200	blr	x16
   0x0000fffff7fb0864:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0868:	54001be0	b.eq	0xfffff7fb0be4  // b.none
   0x0000fffff7fb086c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0870:	37d806a9	tbnz	w9, #27, 0xfffff7fb0944
   0x0000fffff7fb0874:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb0878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb087c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0880:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0884:	540001c1	b.ne	0xfffff7fb08bc  // b.any
   0x0000fffff7fb0888:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb088c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0890:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0894:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0898:	54000121	b.ne	0xfffff7fb08bc  // b.any
   0x0000fffff7fb089c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb08a0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb08a4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb08a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb08ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb08b0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb08b4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb08b8:	14000030	b	0xfffff7fb0978
   0x0000fffff7fb08bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb08c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb08c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb08c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb08cc:	54000120	b.eq	0xfffff7fb08f0  // b.none
   0x0000fffff7fb08d0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb08d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb08d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb08dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb08e0:	54000321	b.ne	0xfffff7fb0944  // b.any
   0x0000fffff7fb08e4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb08e8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb08ec:	14000002	b	0xfffff7fb08f4
   0x0000fffff7fb08f0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb08f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb08f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb08fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0900:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0904:	54000120	b.eq	0xfffff7fb0928  // b.none
   0x0000fffff7fb0908:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb090c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0914:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb0918:	54000161	b.ne	0xfffff7fb0944  // b.any
   0x0000fffff7fb091c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb0920:	9e620121	scvtf	d1, x9
   0x0000fffff7fb0924:	14000002	b	0xfffff7fb092c
   0x0000fffff7fb0928:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb092c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb0930:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb0934:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb0938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb093c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb0940:	17ffffde	b	0xfffff7fb08b8
   0x0000fffff7fb0944:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0948:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb094c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0950:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0954:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb0958:	aa1403e4	mov	x4, x20
   0x0000fffff7fb095c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0960:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb0964:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0968:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb096c:	d63f0200	blr	x16
   0x0000fffff7fb0970:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0974:	540013c0	b.eq	0xfffff7fb0bec  // b.none
   0x0000fffff7fb0978:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb097c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb0980:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb0984:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb0988:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb098c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb0990:	36d801d1	tbz	w17, #27, 0xfffff7fb09c8
   0x0000fffff7fb0994:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb0998:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb099c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb09a0:	54000281	b.ne	0xfffff7fb09f0  // b.any
   0x0000fffff7fb09a4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb09a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb09ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb09b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb09b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb09b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb09bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb09c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb09c4:	54000169	b.ls	0xfffff7fb09f0  // b.plast
   0x0000fffff7fb09c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb09cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb09d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb09d4:	36d80091	tbz	w17, #27, 0xfffff7fb09e4
   0x0000fffff7fb09d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb09dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb09e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb09e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb09e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb09ec:	1400000e	b	0xfffff7fb0a24
   0x0000fffff7fb09f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb09f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb09f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb09fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0a00:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb0a04:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0a08:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0a0c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb0a10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0a14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0a18:	d63f0200	blr	x16
   0x0000fffff7fb0a1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0a20:	54000ea0	b.eq	0xfffff7fb0bf4  // b.none
   0x0000fffff7fb0a24:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb0a28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0a2c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0a30:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0a34:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb0a38:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0a3c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0a40:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb0a44:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb0a48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0a4c:	d63f0200	blr	x16
   0x0000fffff7fb0a50:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb0a54:	54000d40	b.eq	0xfffff7fb0bfc  // b.none
   0x0000fffff7fb0a58:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb0a5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb0a60:	aa1303e1	mov	x1, x19
   0x0000fffff7fb0a64:	aa1503e2	mov	x2, x21
   0x0000fffff7fb0a68:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fb0a6c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb0a70:	aa1603e5	mov	x5, x22
   0x0000fffff7fb0a74:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fb0a78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb0a7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb0a80:	d63f0200	blr	x16
   0x0000fffff7fb0a84:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb0a88:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb0a8c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb0a90:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb0a94:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb0a98:	d65f03c0	ret
   0x0000fffff7fb0a9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb0aa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb0aa4:	b900028a	str	w10, [x20]
   0x0000fffff7fb0aa8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb0aac:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb0ab0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb0ab4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb0ab8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb0abc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb0ac0:	d65f03c0	ret
   0x0000fffff7fb0ac4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb0ac8:	17fffff5	b	0xfffff7fb0a9c
   0x0000fffff7fb0acc:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb0ad0:	17fffff3	b	0xfffff7fb0a9c
   0x0000fffff7fb0ad4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb0ad8:	17fffff1	b	0xfffff7fb0a9c
   0x0000fffff7fb0adc:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fb0ae0:	17ffffef	b	0xfffff7fb0a9c
   0x0000fffff7fb0ae4:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb0ae8:	17ffffed	b	0xfffff7fb0a9c
   0x0000fffff7fb0aec:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb0af0:	17ffffeb	b	0xfffff7fb0a9c
   0x0000fffff7fb0af4:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb0af8:	17ffffe9	b	0xfffff7fb0a9c
   0x0000fffff7fb0afc:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb0b00:	17ffffe7	b	0xfffff7fb0a9c
   0x0000fffff7fb0b04:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb0b08:	17ffffe5	b	0xfffff7fb0a9c
   0x0000fffff7fb0b0c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb0b10:	17ffffe3	b	0xfffff7fb0a9c
   0x0000fffff7fb0b14:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb0b18:	17ffffe1	b	0xfffff7fb0a9c
   0x0000fffff7fb0b1c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb0b20:	17ffffdf	b	0xfffff7fb0a9c
   0x0000fffff7fb0b24:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb0b28:	17ffffdd	b	0xfffff7fb0a9c
   0x0000fffff7fb0b2c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb0b30:	17ffffdb	b	0xfffff7fb0a9c
   0x0000fffff7fb0b34:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb0b38:	17ffffd9	b	0xfffff7fb0a9c
   0x0000fffff7fb0b3c:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb0b40:	17ffffd7	b	0xfffff7fb0a9c
   0x0000fffff7fb0b44:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb0b48:	17ffffd5	b	0xfffff7fb0a9c
   0x0000fffff7fb0b4c:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb0b50:	17ffffd3	b	0xfffff7fb0a9c
   0x0000fffff7fb0b54:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb0b58:	17ffffd1	b	0xfffff7fb0a9c
   0x0000fffff7fb0b5c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb0b60:	17ffffcf	b	0xfffff7fb0a9c
   0x0000fffff7fb0b64:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb0b68:	17ffffcd	b	0xfffff7fb0a9c
   0x0000fffff7fb0b6c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb0b70:	17ffffcb	b	0xfffff7fb0a9c
   0x0000fffff7fb0b74:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb0b78:	17ffffc9	b	0xfffff7fb0a9c
   0x0000fffff7fb0b7c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb0b80:	17ffffc7	b	0xfffff7fb0a9c
   0x0000fffff7fb0b84:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb0b88:	17ffffc5	b	0xfffff7fb0a9c
   0x0000fffff7fb0b8c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb0b90:	17ffffc3	b	0xfffff7fb0a9c
   0x0000fffff7fb0b94:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb0b98:	17ffffc1	b	0xfffff7fb0a9c
   0x0000fffff7fb0b9c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb0ba0:	17ffffbf	b	0xfffff7fb0a9c
   0x0000fffff7fb0ba4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb0ba8:	17ffffbd	b	0xfffff7fb0a9c
   0x0000fffff7fb0bac:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb0bb0:	17ffffbb	b	0xfffff7fb0a9c
   0x0000fffff7fb0bb4:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb0bb8:	17ffffb9	b	0xfffff7fb0a9c
   0x0000fffff7fb0bbc:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb0bc0:	17ffffb7	b	0xfffff7fb0a9c
   0x0000fffff7fb0bc4:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb0bc8:	17ffffb5	b	0xfffff7fb0a9c
   0x0000fffff7fb0bcc:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb0bd0:	17ffffb3	b	0xfffff7fb0a9c
   0x0000fffff7fb0bd4:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb0bd8:	17ffffb1	b	0xfffff7fb0a9c
   0x0000fffff7fb0bdc:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb0be0:	17ffffaf	b	0xfffff7fb0a9c
   0x0000fffff7fb0be4:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb0be8:	17ffffad	b	0xfffff7fb0a9c
   0x0000fffff7fb0bec:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb0bf0:	17ffffab	b	0xfffff7fb0a9c
   0x0000fffff7fb0bf4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb0bf8:	17ffffa9	b	0xfffff7fb0a9c
   0x0000fffff7fb0bfc:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fb0c00:	17ffffa7	b	0xfffff7fb0a9c
   0x0000fffff7fb0c04:	00000000	udf	#0
   0x0000fffff7fb0c08:	00000000	udf	#0
   0x0000fffff7fb0c0c:	00000000	udf	#0
   0x0000fffff7fb0c10:	00000000	udf	#0
   0x0000fffff7fb0c14:	00000000	udf	#0
   0x0000fffff7fb0c18:	00000000	udf	#0
   0x0000fffff7fb0c1c:	00000000	udf	#0
   0x0000fffff7fb0c20:	00000000	udf	#0
   0x0000fffff7fb0c24:	00000000	udf	#0
   0x0000fffff7fb0c28:	00000000	udf	#0
   0x0000fffff7fb0c2c:	00000000	udf	#0
   0x0000fffff7fb0c30:	00000000	udf	#0
   0x0000fffff7fb0c34:	00000000	udf	#0
   0x0000fffff7fb0c38:	00000000	udf	#0
   0x0000fffff7fb0c3c:	00000000	udf	#0
   0x0000fffff7fb0c40:	00000000	udf	#0
   0x0000fffff7fb0c44:	00000000	udf	#0
   0x0000fffff7fb0c48:	00000000	udf	#0
   0x0000fffff7fb0c4c:	00000000	udf	#0
   0x0000fffff7fb0c50:	00000000	udf	#0
   0x0000fffff7fb0c54:	00000000	udf	#0
   0x0000fffff7fb0c58:	00000000	udf	#0
   0x0000fffff7fb0c5c:	00000000	udf	#0
   0x0000fffff7fb0c60:	00000000	udf	#0
   0x0000fffff7fb0c64:	00000000	udf	#0
   0x0000fffff7fb0c68:	00000000	udf	#0
   0x0000fffff7fb0c6c:	00000000	udf	#0
   0x0000fffff7fb0c70:	00000000	udf	#0
   0x0000fffff7fb0c74:	00000000	udf	#0
   0x0000fffff7fb0c78:	00000000	udf	#0
   0x0000fffff7fb0c7c:	00000000	udf	#0
   0x0000fffff7fb0c80:	00000000	udf	#0
   0x0000fffff7fb0c84:	00000000	udf	#0
   0x0000fffff7fb0c88:	00000000	udf	#0
   0x0000fffff7fb0c8c:	00000000	udf	#0
   0x0000fffff7fb0c90:	00000000	udf	#0
   0x0000fffff7fb0c94:	00000000	udf	#0
   0x0000fffff7fb0c98:	00000000	udf	#0
   0x0000fffff7fb0c9c:	00000000	udf	#0
   0x0000fffff7fb0ca0:	00000000	udf	#0
   0x0000fffff7fb0ca4:	00000000	udf	#0
   0x0000fffff7fb0ca8:	00000000	udf	#0
   0x0000fffff7fb0cac:	00000000	udf	#0
   0x0000fffff7fb0cb0:	00000000	udf	#0
   0x0000fffff7fb0cb4:	00000000	udf	#0
   0x0000fffff7fb0cb8:	00000000	udf	#0
   0x0000fffff7fb0cbc:	00000000	udf	#0
   0x0000fffff7fb0cc0:	00000000	udf	#0
   0x0000fffff7fb0cc4:	00000000	udf	#0
   0x0000fffff7fb0cc8:	00000000	udf	#0
   0x0000fffff7fb0ccc:	00000000	udf	#0
   0x0000fffff7fb0cd0:	00000000	udf	#0
   0x0000fffff7fb0cd4:	00000000	udf	#0
   0x0000fffff7fb0cd8:	00000000	udf	#0
   0x0000fffff7fb0cdc:	00000000	udf	#0
   0x0000fffff7fb0ce0:	00000000	udf	#0
   0x0000fffff7fb0ce4:	00000000	udf	#0
   0x0000fffff7fb0ce8:	00000000	udf	#0
   0x0000fffff7fb0cec:	00000000	udf	#0
   0x0000fffff7fb0cf0:	00000000	udf	#0
   0x0000fffff7fb0cf4:	00000000	udf	#0
   0x0000fffff7fb0cf8:	00000000	udf	#0
   0x0000fffff7fb0cfc:	00000000	udf	#0
   0x0000fffff7fb0d00:	00000000	udf	#0
   0x0000fffff7fb0d04:	00000000	udf	#0
   0x0000fffff7fb0d08:	00000000	udf	#0
   0x0000fffff7fb0d0c:	00000000	udf	#0
   0x0000fffff7fb0d10:	00000000	udf	#0
   0x0000fffff7fb0d14:	00000000	udf	#0
   0x0000fffff7fb0d18:	00000000	udf	#0
   0x0000fffff7fb0d1c:	00000000	udf	#0
   0x0000fffff7fb0d20:	00000000	udf	#0
   0x0000fffff7fb0d24:	00000000	udf	#0
   0x0000fffff7fb0d28:	00000000	udf	#0
   0x0000fffff7fb0d2c:	00000000	udf	#0
   0x0000fffff7fb0d30:	00000000	udf	#0
   0x0000fffff7fb0d34:	00000000	udf	#0
   0x0000fffff7fb0d38:	00000000	udf	#0
   0x0000fffff7fb0d3c:	00000000	udf	#0
   0x0000fffff7fb0d40:	00000000	udf	#0
   0x0000fffff7fb0d44:	00000000	udf	#0
   0x0000fffff7fb0d48:	00000000	udf	#0
   0x0000fffff7fb0d4c:	00000000	udf	#0
   0x0000fffff7fb0d50:	00000000	udf	#0
   0x0000fffff7fb0d54:	00000000	udf	#0
   0x0000fffff7fb0d58:	00000000	udf	#0
   0x0000fffff7fb0d5c:	00000000	udf	#0
   0x0000fffff7fb0d60:	00000000	udf	#0
   0x0000fffff7fb0d64:	00000000	udf	#0
   0x0000fffff7fb0d68:	00000000	udf	#0
   0x0000fffff7fb0d6c:	00000000	udf	#0
   0x0000fffff7fb0d70:	00000000	udf	#0
   0x0000fffff7fb0d74:	00000000	udf	#0
   0x0000fffff7fb0d78:	00000000	udf	#0
   0x0000fffff7fb0d7c:	00000000	udf	#0
   0x0000fffff7fb0d80:	00000000	udf	#0
   0x0000fffff7fb0d84:	00000000	udf	#0
   0x0000fffff7fb0d88:	00000000	udf	#0
   0x0000fffff7fb0d8c:	00000000	udf	#0
   0x0000fffff7fb0d90:	00000000	udf	#0
   0x0000fffff7fb0d94:	00000000	udf	#0
   0x0000fffff7fb0d98:	00000000	udf	#0
   0x0000fffff7fb0d9c:	00000000	udf	#0
   0x0000fffff7fb0da0:	00000000	udf	#0
   0x0000fffff7fb0da4:	00000000	udf	#0
   0x0000fffff7fb0da8:	00000000	udf	#0
   0x0000fffff7fb0dac:	00000000	udf	#0
   0x0000fffff7fb0db0:	00000000	udf	#0
   0x0000fffff7fb0db4:	00000000	udf	#0
   0x0000fffff7fb0db8:	00000000	udf	#0
   0x0000fffff7fb0dbc:	00000000	udf	#0
   0x0000fffff7fb0dc0:	00000000	udf	#0
   0x0000fffff7fb0dc4:	00000000	udf	#0
   0x0000fffff7fb0dc8:	00000000	udf	#0
   0x0000fffff7fb0dcc:	00000000	udf	#0
   0x0000fffff7fb0dd0:	00000000	udf	#0
   0x0000fffff7fb0dd4:	00000000	udf	#0
   0x0000fffff7fb0dd8:	00000000	udf	#0
   0x0000fffff7fb0ddc:	00000000	udf	#0
   0x0000fffff7fb0de0:	00000000	udf	#0
   0x0000fffff7fb0de4:	00000000	udf	#0
   0x0000fffff7fb0de8:	00000000	udf	#0
   0x0000fffff7fb0dec:	00000000	udf	#0
   0x0000fffff7fb0df0:	00000000	udf	#0
   0x0000fffff7fb0df4:	00000000	udf	#0
   0x0000fffff7fb0df8:	00000000	udf	#0
   0x0000fffff7fb0dfc:	00000000	udf	#0
   0x0000fffff7fb0e00:	00000000	udf	#0
   0x0000fffff7fb0e04:	00000000	udf	#0
   0x0000fffff7fb0e08:	00000000	udf	#0
   0x0000fffff7fb0e0c:	00000000	udf	#0
   0x0000fffff7fb0e10:	00000000	udf	#0
   0x0000fffff7fb0e14:	00000000	udf	#0
   0x0000fffff7fb0e18:	00000000	udf	#0
   0x0000fffff7fb0e1c:	00000000	udf	#0
   0x0000fffff7fb0e20:	00000000	udf	#0
   0x0000fffff7fb0e24:	00000000	udf	#0
   0x0000fffff7fb0e28:	00000000	udf	#0
   0x0000fffff7fb0e2c:	00000000	udf	#0
   0x0000fffff7fb0e30:	00000000	udf	#0
   0x0000fffff7fb0e34:	00000000	udf	#0
   0x0000fffff7fb0e38:	00000000	udf	#0
   0x0000fffff7fb0e3c:	00000000	udf	#0
   0x0000fffff7fb0e40:	00000000	udf	#0
   0x0000fffff7fb0e44:	00000000	udf	#0
   0x0000fffff7fb0e48:	00000000	udf	#0
   0x0000fffff7fb0e4c:	00000000	udf	#0
   0x0000fffff7fb0e50:	00000000	udf	#0
   0x0000fffff7fb0e54:	00000000	udf	#0
   0x0000fffff7fb0e58:	00000000	udf	#0
   0x0000fffff7fb0e5c:	00000000	udf	#0
   0x0000fffff7fb0e60:	00000000	udf	#0
   0x0000fffff7fb0e64:	00000000	udf	#0
   0x0000fffff7fb0e68:	00000000	udf	#0
   0x0000fffff7fb0e6c:	00000000	udf	#0
   0x0000fffff7fb0e70:	00000000	udf	#0
   0x0000fffff7fb0e74:	00000000	udf	#0
   0x0000fffff7fb0e78:	00000000	udf	#0
   0x0000fffff7fb0e7c:	00000000	udf	#0
   0x0000fffff7fb0e80:	00000000	udf	#0
   0x0000fffff7fb0e84:	00000000	udf	#0
   0x0000fffff7fb0e88:	00000000	udf	#0
   0x0000fffff7fb0e8c:	00000000	udf	#0
   0x0000fffff7fb0e90:	00000000	udf	#0
   0x0000fffff7fb0e94:	00000000	udf	#0
   0x0000fffff7fb0e98:	00000000	udf	#0
   0x0000fffff7fb0e9c:	00000000	udf	#0
   0x0000fffff7fb0ea0:	00000000	udf	#0
   0x0000fffff7fb0ea4:	00000000	udf	#0
   0x0000fffff7fb0ea8:	00000000	udf	#0
   0x0000fffff7fb0eac:	00000000	udf	#0
   0x0000fffff7fb0eb0:	00000000	udf	#0
   0x0000fffff7fb0eb4:	00000000	udf	#0
   0x0000fffff7fb0eb8:	00000000	udf	#0
   0x0000fffff7fb0ebc:	00000000	udf	#0
   0x0000fffff7fb0ec0:	00000000	udf	#0
   0x0000fffff7fb0ec4:	00000000	udf	#0
   0x0000fffff7fb0ec8:	00000000	udf	#0
   0x0000fffff7fb0ecc:	00000000	udf	#0
   0x0000fffff7fb0ed0:	00000000	udf	#0
   0x0000fffff7fb0ed4:	00000000	udf	#0
   0x0000fffff7fb0ed8:	00000000	udf	#0
   0x0000fffff7fb0edc:	00000000	udf	#0
   0x0000fffff7fb0ee0:	00000000	udf	#0
   0x0000fffff7fb0ee4:	00000000	udf	#0
   0x0000fffff7fb0ee8:	00000000	udf	#0
   0x0000fffff7fb0eec:	00000000	udf	#0
   0x0000fffff7fb0ef0:	00000000	udf	#0
   0x0000fffff7fb0ef4:	00000000	udf	#0
   0x0000fffff7fb0ef8:	00000000	udf	#0
   0x0000fffff7fb0efc:	00000000	udf	#0
   0x0000fffff7fb0f00:	00000000	udf	#0
   0x0000fffff7fb0f04:	00000000	udf	#0
   0x0000fffff7fb0f08:	00000000	udf	#0
   0x0000fffff7fb0f0c:	00000000	udf	#0
   0x0000fffff7fb0f10:	00000000	udf	#0
   0x0000fffff7fb0f14:	00000000	udf	#0
   0x0000fffff7fb0f18:	00000000	udf	#0
   0x0000fffff7fb0f1c:	00000000	udf	#0
   0x0000fffff7fb0f20:	00000000	udf	#0
   0x0000fffff7fb0f24:	00000000	udf	#0
   0x0000fffff7fb0f28:	00000000	udf	#0
   0x0000fffff7fb0f2c:	00000000	udf	#0
   0x0000fffff7fb0f30:	00000000	udf	#0
   0x0000fffff7fb0f34:	00000000	udf	#0
   0x0000fffff7fb0f38:	00000000	udf	#0
   0x0000fffff7fb0f3c:	00000000	udf	#0
   0x0000fffff7fb0f40:	00000000	udf	#0
   0x0000fffff7fb0f44:	00000000	udf	#0
   0x0000fffff7fb0f48:	00000000	udf	#0
   0x0000fffff7fb0f4c:	00000000	udf	#0
   0x0000fffff7fb0f50:	00000000	udf	#0
   0x0000fffff7fb0f54:	00000000	udf	#0
   0x0000fffff7fb0f58:	00000000	udf	#0
   0x0000fffff7fb0f5c:	00000000	udf	#0
   0x0000fffff7fb0f60:	00000000	udf	#0
   0x0000fffff7fb0f64:	00000000	udf	#0
   0x0000fffff7fb0f68:	00000000	udf	#0
   0x0000fffff7fb0f6c:	00000000	udf	#0
   0x0000fffff7fb0f70:	00000000	udf	#0
   0x0000fffff7fb0f74:	00000000	udf	#0
   0x0000fffff7fb0f78:	00000000	udf	#0
   0x0000fffff7fb0f7c:	00000000	udf	#0
   0x0000fffff7fb0f80:	00000000	udf	#0
   0x0000fffff7fb0f84:	00000000	udf	#0
   0x0000fffff7fb0f88:	00000000	udf	#0
   0x0000fffff7fb0f8c:	00000000	udf	#0
   0x0000fffff7fb0f90:	00000000	udf	#0
   0x0000fffff7fb0f94:	00000000	udf	#0
   0x0000fffff7fb0f98:	00000000	udf	#0
   0x0000fffff7fb0f9c:	00000000	udf	#0
   0x0000fffff7fb0fa0:	00000000	udf	#0
   0x0000fffff7fb0fa4:	00000000	udf	#0
   0x0000fffff7fb0fa8:	00000000	udf	#0
   0x0000fffff7fb0fac:	00000000	udf	#0
   0x0000fffff7fb0fb0:	00000000	udf	#0
   0x0000fffff7fb0fb4:	00000000	udf	#0
   0x0000fffff7fb0fb8:	00000000	udf	#0
   0x0000fffff7fb0fbc:	00000000	udf	#0
   0x0000fffff7fb0fc0:	00000000	udf	#0
   0x0000fffff7fb0fc4:	00000000	udf	#0
   0x0000fffff7fb0fc8:	00000000	udf	#0
   0x0000fffff7fb0fcc:	00000000	udf	#0
   0x0000fffff7fb0fd0:	00000000	udf	#0
   0x0000fffff7fb0fd4:	00000000	udf	#0
   0x0000fffff7fb0fd8:	00000000	udf	#0
   0x0000fffff7fb0fdc:	00000000	udf	#0
   0x0000fffff7fb0fe0:	00000000	udf	#0
   0x0000fffff7fb0fe4:	00000000	udf	#0
   0x0000fffff7fb0fe8:	00000000	udf	#0
   0x0000fffff7fb0fec:	00000000	udf	#0
   0x0000fffff7fb0ff0:	00000000	udf	#0
   0x0000fffff7fb0ff4:	00000000	udf	#0
   0x0000fffff7fb0ff8:	00000000	udf	#0
   0x0000fffff7fb0ffc:	00000000	udf	#0
End of assembler dump.
