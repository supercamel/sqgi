Dump of assembler code from 0xfffff7fa6000 to 0xfffff7fa8000:
   0x0000fffff7fa6000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa6004:	910003fd	mov	x29, sp
   0x0000fffff7fa6008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa600c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa6010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa6014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa6018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa601c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa6020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa6024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa6028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa602c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa6030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa6034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa6038:	d29ea810	mov	x16, #0xf540                	// #62784
   0x0000fffff7fa603c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa6040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6044:	d63f0200	blr	x16
   0x0000fffff7fa6048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa604c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa6050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa6054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa6058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa605c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa6060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa6064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa6068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa606c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fa6070:	36d801d1	tbz	w17, #27, 0xfffff7fa60a8
   0x0000fffff7fa6074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa607c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6080:	54000281	b.ne	0xfffff7fa60d0  // b.any
   0x0000fffff7fa6084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fa6088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa608c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa609c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa60a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa60a4:	54000169	b.ls	0xfffff7fa60d0  // b.plast
   0x0000fffff7fa60a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa60ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa60b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa60b4:	36d80091	tbz	w17, #27, 0xfffff7fa60c4
   0x0000fffff7fa60b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa60bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa60c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa60c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fa60c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fa60cc:	1400000e	b	0xfffff7fa6104
   0x0000fffff7fa60d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa60d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa60d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa60dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa60e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa60e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa60e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa60ec:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa60f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa60f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa60f8:	d63f0200	blr	x16
   0x0000fffff7fa60fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6100:	5400d8c0	b.eq	0xfffff7fa7c18  // b.none
   0x0000fffff7fa6104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa6108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa610c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fa6110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa6114:	36d80211	tbz	w17, #27, 0xfffff7fa6154
   0x0000fffff7fa6118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa611c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6124:	540001e1	b.ne	0xfffff7fa6160  // b.any
   0x0000fffff7fa6128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa612c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa613c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6148:	540000c9	b.ls	0xfffff7fa6160  // b.plast
   0x0000fffff7fa614c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa6158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa615c:	1400000e	b	0xfffff7fa6194
   0x0000fffff7fa6160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6168:	aa1303e1	mov	x1, x19
   0x0000fffff7fa616c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa6174:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6178:	aa1603e5	mov	x5, x22
   0x0000fffff7fa617c:	d2855410	mov	x16, #0x2aa0                	// #10912
   0x0000fffff7fa6180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6188:	d63f0200	blr	x16
   0x0000fffff7fa618c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6190:	5400d480	b.eq	0xfffff7fa7c20  // b.none
   0x0000fffff7fa6194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa6198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa619c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa61a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa61a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa61a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa61ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa61b0:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa61b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa61b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa61bc:	d63f0200	blr	x16
   0x0000fffff7fa61c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa61c4:	5400d320	b.eq	0xfffff7fa7c28  // b.none
   0x0000fffff7fa61c8:	14000001	b	0xfffff7fa61cc
   0x0000fffff7fa61cc:	14000001	b	0xfffff7fa61d0
   0x0000fffff7fa61d0:	14000001	b	0xfffff7fa61d4
   0x0000fffff7fa61d4:	14000001	b	0xfffff7fa61d8
   0x0000fffff7fa61d8:	14000001	b	0xfffff7fa61dc
   0x0000fffff7fa61dc:	14000001	b	0xfffff7fa61e0
   0x0000fffff7fa61e0:	14000001	b	0xfffff7fa61e4
   0x0000fffff7fa61e4:	14000001	b	0xfffff7fa61e8
   0x0000fffff7fa61e8:	14000001	b	0xfffff7fa61ec
   0x0000fffff7fa61ec:	14000001	b	0xfffff7fa61f0
   0x0000fffff7fa61f0:	14000001	b	0xfffff7fa61f4
   0x0000fffff7fa61f4:	14000001	b	0xfffff7fa61f8
   0x0000fffff7fa61f8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa61fc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa6200:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa6204:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa6208:	36d80211	tbz	w17, #27, 0xfffff7fa6248
   0x0000fffff7fa620c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6210:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6214:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6218:	540001e1	b.ne	0xfffff7fa6254  // b.any
   0x0000fffff7fa621c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa6220:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6224:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6228:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa622c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6230:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6234:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6238:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa623c:	540000c9	b.ls	0xfffff7fa6254  // b.plast
   0x0000fffff7fa6240:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6244:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6248:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa624c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa6250:	1400000e	b	0xfffff7fa6288
   0x0000fffff7fa6254:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6258:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa625c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6260:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6264:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa6268:	aa1403e4	mov	x4, x20
   0x0000fffff7fa626c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6270:	d2855410	mov	x16, #0x2aa0                	// #10912
   0x0000fffff7fa6274:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6278:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa627c:	d63f0200	blr	x16
   0x0000fffff7fa6280:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6284:	5400cd60	b.eq	0xfffff7fa7c30  // b.none
   0x0000fffff7fa6288:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa628c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6290:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6294:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6298:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa629c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa62a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa62a4:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa62a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa62ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa62b0:	d63f0200	blr	x16
   0x0000fffff7fa62b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa62b8:	5400cc00	b.eq	0xfffff7fa7c38  // b.none
   0x0000fffff7fa62bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa62c0:	37d806a9	tbnz	w9, #27, 0xfffff7fa6394
   0x0000fffff7fa62c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa62c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa62cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa62d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa62d4:	540001c1	b.ne	0xfffff7fa630c  // b.any
   0x0000fffff7fa62d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa62dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa62e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa62e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa62e8:	54000121	b.ne	0xfffff7fa630c  // b.any
   0x0000fffff7fa62ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa62f0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa62f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa62f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa62fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6300:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa6304:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6308:	14000030	b	0xfffff7fa63c8
   0x0000fffff7fa630c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6310:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6314:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6318:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa631c:	54000120	b.eq	0xfffff7fa6340  // b.none
   0x0000fffff7fa6320:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6324:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa632c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6330:	54000321	b.ne	0xfffff7fa6394  // b.any
   0x0000fffff7fa6334:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6338:	9e620120	scvtf	d0, x9
   0x0000fffff7fa633c:	14000002	b	0xfffff7fa6344
   0x0000fffff7fa6340:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa6344:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6348:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa634c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6350:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6354:	54000120	b.eq	0xfffff7fa6378  // b.none
   0x0000fffff7fa6358:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa635c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6364:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6368:	54000161	b.ne	0xfffff7fa6394  // b.any
   0x0000fffff7fa636c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6370:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6374:	14000002	b	0xfffff7fa637c
   0x0000fffff7fa6378:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa637c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6380:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa6384:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6388:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa638c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6390:	17ffffde	b	0xfffff7fa6308
   0x0000fffff7fa6394:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6398:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa639c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa63a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa63a4:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa63a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa63ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa63b0:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa63b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa63b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa63bc:	d63f0200	blr	x16
   0x0000fffff7fa63c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa63c4:	5400c3e0	b.eq	0xfffff7fa7c40  // b.none
   0x0000fffff7fa63c8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa63cc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa63d0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa63d4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa63d8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa63dc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa63e0:	36d801d1	tbz	w17, #27, 0xfffff7fa6418
   0x0000fffff7fa63e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa63e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa63ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa63f0:	54000281	b.ne	0xfffff7fa6440  // b.any
   0x0000fffff7fa63f4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa63f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa63fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6400:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6404:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6408:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa640c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6410:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6414:	54000169	b.ls	0xfffff7fa6440  // b.plast
   0x0000fffff7fa6418:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa641c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6420:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6424:	36d80091	tbz	w17, #27, 0xfffff7fa6434
   0x0000fffff7fa6428:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa642c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6430:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6434:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa6438:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa643c:	1400000e	b	0xfffff7fa6474
   0x0000fffff7fa6440:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6448:	aa1303e1	mov	x1, x19
   0x0000fffff7fa644c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6450:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa6454:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6458:	aa1603e5	mov	x5, x22
   0x0000fffff7fa645c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa6460:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6468:	d63f0200	blr	x16
   0x0000fffff7fa646c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6470:	5400bec0	b.eq	0xfffff7fa7c48  // b.none
   0x0000fffff7fa6474:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa6478:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa647c:	540003a0	b.eq	0xfffff7fa64f0  // b.none
   0x0000fffff7fa6480:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa6484:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa6488:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa648c:	36d801d1	tbz	w17, #27, 0xfffff7fa64c4
   0x0000fffff7fa6490:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6494:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6498:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa649c:	540002a1	b.ne	0xfffff7fa64f0  // b.any
   0x0000fffff7fa64a0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa64a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa64a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa64ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa64b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa64b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa64b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa64bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa64c0:	54000189	b.ls	0xfffff7fa64f0  // b.plast
   0x0000fffff7fa64c4:	36d8008d	tbz	w13, #27, 0xfffff7fa64d4
   0x0000fffff7fa64c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa64cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa64d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa64d4:	36d80091	tbz	w17, #27, 0xfffff7fa64e4
   0x0000fffff7fa64d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa64dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa64e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa64e4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa64e8:	b900016d	str	w13, [x11]
   0x0000fffff7fa64ec:	1400000e	b	0xfffff7fa6524
   0x0000fffff7fa64f0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa64f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa64f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa64fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6500:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa6504:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6508:	aa1603e5	mov	x5, x22
   0x0000fffff7fa650c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa6510:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6514:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6518:	d63f0200	blr	x16
   0x0000fffff7fa651c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6520:	5400b980	b.eq	0xfffff7fa7c50  // b.none
   0x0000fffff7fa6524:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6528:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa652c:	540004a0	b.eq	0xfffff7fa65c0  // b.none
   0x0000fffff7fa6530:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6534:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6538:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa653c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6540:	54000400	b.eq	0xfffff7fa65c0  // b.none
   0x0000fffff7fa6544:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6548:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa654c:	36d801d1	tbz	w17, #27, 0xfffff7fa6584
   0x0000fffff7fa6550:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6554:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6558:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa655c:	54000321	b.ne	0xfffff7fa65c0  // b.any
   0x0000fffff7fa6560:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6564:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6568:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa656c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6570:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6574:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6578:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa657c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6580:	54000209	b.ls	0xfffff7fa65c0  // b.plast
   0x0000fffff7fa6584:	36d8008d	tbz	w13, #27, 0xfffff7fa6594
   0x0000fffff7fa6588:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa658c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6590:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6594:	36d80091	tbz	w17, #27, 0xfffff7fa65a4
   0x0000fffff7fa6598:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa659c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa65a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa65a4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa65a8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa65ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa65b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa65b4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa65b8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa65bc:	1400000e	b	0xfffff7fa65f4
   0x0000fffff7fa65c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa65c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa65c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa65cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa65d0:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa65d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa65d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa65dc:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa65e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa65e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa65e8:	d63f0200	blr	x16
   0x0000fffff7fa65ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa65f0:	5400b340	b.eq	0xfffff7fa7c58  // b.none
   0x0000fffff7fa65f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa65f8:	37d806a9	tbnz	w9, #27, 0xfffff7fa66cc
   0x0000fffff7fa65fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6608:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa660c:	540001c1	b.ne	0xfffff7fa6644  // b.any
   0x0000fffff7fa6610:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6614:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa661c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6620:	54000121	b.ne	0xfffff7fa6644  // b.any
   0x0000fffff7fa6624:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6628:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa662c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6638:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa663c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6640:	14000030	b	0xfffff7fa6700
   0x0000fffff7fa6644:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6648:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa664c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6650:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6654:	54000120	b.eq	0xfffff7fa6678  // b.none
   0x0000fffff7fa6658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa665c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6668:	54000321	b.ne	0xfffff7fa66cc  // b.any
   0x0000fffff7fa666c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6670:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6674:	14000002	b	0xfffff7fa667c
   0x0000fffff7fa6678:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa667c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6680:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6688:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa668c:	54000120	b.eq	0xfffff7fa66b0  // b.none
   0x0000fffff7fa6690:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa669c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa66a0:	54000161	b.ne	0xfffff7fa66cc  // b.any
   0x0000fffff7fa66a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa66a8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa66ac:	14000002	b	0xfffff7fa66b4
   0x0000fffff7fa66b0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa66b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa66b8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa66bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa66c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa66c4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa66c8:	17ffffde	b	0xfffff7fa6640
   0x0000fffff7fa66cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa66d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa66d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa66d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa66dc:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa66e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa66e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa66e8:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa66ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa66f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa66f4:	d63f0200	blr	x16
   0x0000fffff7fa66f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa66fc:	5400ab20	b.eq	0xfffff7fa7c60  // b.none
   0x0000fffff7fa6700:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa6704:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa6708:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa670c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa6710:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa6714:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa6718:	36d801d1	tbz	w17, #27, 0xfffff7fa6750
   0x0000fffff7fa671c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6720:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6724:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6728:	54000281	b.ne	0xfffff7fa6778  // b.any
   0x0000fffff7fa672c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa6730:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6734:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6738:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa673c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6740:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6744:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6748:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa674c:	54000169	b.ls	0xfffff7fa6778  // b.plast
   0x0000fffff7fa6750:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6754:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6758:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa675c:	36d80091	tbz	w17, #27, 0xfffff7fa676c
   0x0000fffff7fa6760:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6764:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6768:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa676c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa6770:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa6774:	1400000e	b	0xfffff7fa67ac
   0x0000fffff7fa6778:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa677c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6780:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6784:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6788:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa678c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6790:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6794:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa6798:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa679c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa67a0:	d63f0200	blr	x16
   0x0000fffff7fa67a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa67a8:	5400a600	b.eq	0xfffff7fa7c68  // b.none
   0x0000fffff7fa67ac:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa67b0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa67b4:	540003a0	b.eq	0xfffff7fa6828  // b.none
   0x0000fffff7fa67b8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa67bc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa67c0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa67c4:	36d801d1	tbz	w17, #27, 0xfffff7fa67fc
   0x0000fffff7fa67c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa67cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa67d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa67d4:	540002a1	b.ne	0xfffff7fa6828  // b.any
   0x0000fffff7fa67d8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa67dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa67e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa67e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa67e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa67ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa67f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa67f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa67f8:	54000189	b.ls	0xfffff7fa6828  // b.plast
   0x0000fffff7fa67fc:	36d8008d	tbz	w13, #27, 0xfffff7fa680c
   0x0000fffff7fa6800:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6804:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6808:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa680c:	36d80091	tbz	w17, #27, 0xfffff7fa681c
   0x0000fffff7fa6810:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6814:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6818:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa681c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa6820:	b900016d	str	w13, [x11]
   0x0000fffff7fa6824:	1400000e	b	0xfffff7fa685c
   0x0000fffff7fa6828:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa682c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6830:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6834:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6838:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa683c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6840:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6844:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa6848:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa684c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6850:	d63f0200	blr	x16
   0x0000fffff7fa6854:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6858:	5400a0c0	b.eq	0xfffff7fa7c70  // b.none
   0x0000fffff7fa685c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6860:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6864:	540004a0	b.eq	0xfffff7fa68f8  // b.none
   0x0000fffff7fa6868:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa686c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6870:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6874:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6878:	54000400	b.eq	0xfffff7fa68f8  // b.none
   0x0000fffff7fa687c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6880:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6884:	36d801d1	tbz	w17, #27, 0xfffff7fa68bc
   0x0000fffff7fa6888:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa688c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6890:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6894:	54000321	b.ne	0xfffff7fa68f8  // b.any
   0x0000fffff7fa6898:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa689c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa68a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa68a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa68a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa68ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa68b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa68b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa68b8:	54000209	b.ls	0xfffff7fa68f8  // b.plast
   0x0000fffff7fa68bc:	36d8008d	tbz	w13, #27, 0xfffff7fa68cc
   0x0000fffff7fa68c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa68c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa68c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa68cc:	36d80091	tbz	w17, #27, 0xfffff7fa68dc
   0x0000fffff7fa68d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa68d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa68d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa68dc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa68e0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa68e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa68e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa68ec:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa68f0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa68f4:	1400000e	b	0xfffff7fa692c
   0x0000fffff7fa68f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa68fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6900:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6904:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6908:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa690c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6910:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6914:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa6918:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa691c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6920:	d63f0200	blr	x16
   0x0000fffff7fa6924:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6928:	54009a80	b.eq	0xfffff7fa7c78  // b.none
   0x0000fffff7fa692c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6930:	37d806a9	tbnz	w9, #27, 0xfffff7fa6a04
   0x0000fffff7fa6934:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa693c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6940:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6944:	540001c1	b.ne	0xfffff7fa697c  // b.any
   0x0000fffff7fa6948:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa694c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6954:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6958:	54000121	b.ne	0xfffff7fa697c  // b.any
   0x0000fffff7fa695c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6960:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa6964:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa696c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6970:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa6974:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6978:	14000030	b	0xfffff7fa6a38
   0x0000fffff7fa697c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6980:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6988:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa698c:	54000120	b.eq	0xfffff7fa69b0  // b.none
   0x0000fffff7fa6990:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa699c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa69a0:	54000321	b.ne	0xfffff7fa6a04  // b.any
   0x0000fffff7fa69a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa69a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa69ac:	14000002	b	0xfffff7fa69b4
   0x0000fffff7fa69b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa69b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa69b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa69bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa69c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa69c4:	54000120	b.eq	0xfffff7fa69e8  // b.none
   0x0000fffff7fa69c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa69cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa69d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa69d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa69d8:	54000161	b.ne	0xfffff7fa6a04  // b.any
   0x0000fffff7fa69dc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa69e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa69e4:	14000002	b	0xfffff7fa69ec
   0x0000fffff7fa69e8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa69ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa69f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa69f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa69f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa69fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6a00:	17ffffde	b	0xfffff7fa6978
   0x0000fffff7fa6a04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6a08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6a0c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6a10:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6a14:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa6a18:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6a1c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6a20:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa6a24:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6a28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6a2c:	d63f0200	blr	x16
   0x0000fffff7fa6a30:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6a34:	54009260	b.eq	0xfffff7fa7c80  // b.none
   0x0000fffff7fa6a38:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa6a3c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa6a40:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa6a44:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa6a48:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa6a4c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa6a50:	36d801d1	tbz	w17, #27, 0xfffff7fa6a88
   0x0000fffff7fa6a54:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6a58:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6a5c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6a60:	54000281	b.ne	0xfffff7fa6ab0  // b.any
   0x0000fffff7fa6a64:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa6a68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6a6c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6a70:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6a74:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6a78:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6a7c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6a80:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6a84:	54000169	b.ls	0xfffff7fa6ab0  // b.plast
   0x0000fffff7fa6a88:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6a8c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6a90:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6a94:	36d80091	tbz	w17, #27, 0xfffff7fa6aa4
   0x0000fffff7fa6a98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6a9c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6aa0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6aa4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa6aa8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa6aac:	1400000e	b	0xfffff7fa6ae4
   0x0000fffff7fa6ab0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6ab4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6ab8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6abc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6ac0:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa6ac4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6ac8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6acc:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa6ad0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6ad4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6ad8:	d63f0200	blr	x16
   0x0000fffff7fa6adc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6ae0:	54008d40	b.eq	0xfffff7fa7c88  // b.none
   0x0000fffff7fa6ae4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa6ae8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6aec:	540003a0	b.eq	0xfffff7fa6b60  // b.none
   0x0000fffff7fa6af0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa6af4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa6af8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa6afc:	36d801d1	tbz	w17, #27, 0xfffff7fa6b34
   0x0000fffff7fa6b00:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6b04:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6b08:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6b0c:	540002a1	b.ne	0xfffff7fa6b60  // b.any
   0x0000fffff7fa6b10:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa6b14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6b18:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6b1c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6b20:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6b24:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6b28:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6b2c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6b30:	54000189	b.ls	0xfffff7fa6b60  // b.plast
   0x0000fffff7fa6b34:	36d8008d	tbz	w13, #27, 0xfffff7fa6b44
   0x0000fffff7fa6b38:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6b3c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6b40:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6b44:	36d80091	tbz	w17, #27, 0xfffff7fa6b54
   0x0000fffff7fa6b48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6b4c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6b50:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6b54:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa6b58:	b900016d	str	w13, [x11]
   0x0000fffff7fa6b5c:	1400000e	b	0xfffff7fa6b94
   0x0000fffff7fa6b60:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa6b64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6b68:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6b6c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6b70:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa6b74:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6b78:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6b7c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa6b80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6b84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6b88:	d63f0200	blr	x16
   0x0000fffff7fa6b8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6b90:	54008800	b.eq	0xfffff7fa7c90  // b.none
   0x0000fffff7fa6b94:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6b98:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6b9c:	540004a0	b.eq	0xfffff7fa6c30  // b.none
   0x0000fffff7fa6ba0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6ba4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6ba8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6bac:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6bb0:	54000400	b.eq	0xfffff7fa6c30  // b.none
   0x0000fffff7fa6bb4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6bb8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6bbc:	36d801d1	tbz	w17, #27, 0xfffff7fa6bf4
   0x0000fffff7fa6bc0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6bc4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6bc8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6bcc:	54000321	b.ne	0xfffff7fa6c30  // b.any
   0x0000fffff7fa6bd0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6bd4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6bd8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6bdc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6be0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6be4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6be8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6bec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6bf0:	54000209	b.ls	0xfffff7fa6c30  // b.plast
   0x0000fffff7fa6bf4:	36d8008d	tbz	w13, #27, 0xfffff7fa6c04
   0x0000fffff7fa6bf8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6bfc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6c00:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6c04:	36d80091	tbz	w17, #27, 0xfffff7fa6c14
   0x0000fffff7fa6c08:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6c0c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6c10:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6c14:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa6c18:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa6c1c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6c20:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6c24:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa6c28:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa6c2c:	1400000e	b	0xfffff7fa6c64
   0x0000fffff7fa6c30:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6c34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6c38:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6c3c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6c40:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa6c44:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6c48:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6c4c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa6c50:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6c54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6c58:	d63f0200	blr	x16
   0x0000fffff7fa6c5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6c60:	540081c0	b.eq	0xfffff7fa7c98  // b.none
   0x0000fffff7fa6c64:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6c68:	37d806a9	tbnz	w9, #27, 0xfffff7fa6d3c
   0x0000fffff7fa6c6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6c70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6c74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6c78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6c7c:	540001c1	b.ne	0xfffff7fa6cb4  // b.any
   0x0000fffff7fa6c80:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6c84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6c90:	54000121	b.ne	0xfffff7fa6cb4  // b.any
   0x0000fffff7fa6c94:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6c98:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa6c9c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6ca0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6ca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ca8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa6cac:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6cb0:	14000030	b	0xfffff7fa6d70
   0x0000fffff7fa6cb4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6cb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6cbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6cc0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6cc4:	54000120	b.eq	0xfffff7fa6ce8  // b.none
   0x0000fffff7fa6cc8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6ccc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6cd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6cd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6cd8:	54000321	b.ne	0xfffff7fa6d3c  // b.any
   0x0000fffff7fa6cdc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6ce0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa6ce4:	14000002	b	0xfffff7fa6cec
   0x0000fffff7fa6ce8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa6cec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6cf0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6cf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6cf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6cfc:	54000120	b.eq	0xfffff7fa6d20  // b.none
   0x0000fffff7fa6d00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6d04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6d08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6d0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6d10:	54000161	b.ne	0xfffff7fa6d3c  // b.any
   0x0000fffff7fa6d14:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa6d18:	9e620121	scvtf	d1, x9
   0x0000fffff7fa6d1c:	14000002	b	0xfffff7fa6d24
   0x0000fffff7fa6d20:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa6d24:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa6d28:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa6d2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6d30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6d34:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6d38:	17ffffde	b	0xfffff7fa6cb0
   0x0000fffff7fa6d3c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6d40:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6d44:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6d48:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6d4c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa6d50:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6d54:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6d58:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa6d5c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6d60:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6d64:	d63f0200	blr	x16
   0x0000fffff7fa6d68:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6d6c:	540079a0	b.eq	0xfffff7fa7ca0  // b.none
   0x0000fffff7fa6d70:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa6d74:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa6d78:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa6d7c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa6d80:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa6d84:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa6d88:	36d801d1	tbz	w17, #27, 0xfffff7fa6dc0
   0x0000fffff7fa6d8c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6d90:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6d94:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6d98:	54000281	b.ne	0xfffff7fa6de8  // b.any
   0x0000fffff7fa6d9c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa6da0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6da4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6da8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6dac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6db0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6db4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6db8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6dbc:	54000169	b.ls	0xfffff7fa6de8  // b.plast
   0x0000fffff7fa6dc0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6dc4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6dc8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6dcc:	36d80091	tbz	w17, #27, 0xfffff7fa6ddc
   0x0000fffff7fa6dd0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6dd4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6dd8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6ddc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa6de0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa6de4:	1400000e	b	0xfffff7fa6e1c
   0x0000fffff7fa6de8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa6dec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6df0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6df4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6df8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa6dfc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6e00:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6e04:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa6e08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6e0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6e10:	d63f0200	blr	x16
   0x0000fffff7fa6e14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6e18:	54007480	b.eq	0xfffff7fa7ca8  // b.none
   0x0000fffff7fa6e1c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa6e20:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6e24:	540003a0	b.eq	0xfffff7fa6e98  // b.none
   0x0000fffff7fa6e28:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa6e2c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa6e30:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa6e34:	36d801d1	tbz	w17, #27, 0xfffff7fa6e6c
   0x0000fffff7fa6e38:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6e3c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6e40:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6e44:	540002a1	b.ne	0xfffff7fa6e98  // b.any
   0x0000fffff7fa6e48:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa6e4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6e50:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6e54:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6e58:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6e5c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6e60:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6e64:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6e68:	54000189	b.ls	0xfffff7fa6e98  // b.plast
   0x0000fffff7fa6e6c:	36d8008d	tbz	w13, #27, 0xfffff7fa6e7c
   0x0000fffff7fa6e70:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6e74:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6e78:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6e7c:	36d80091	tbz	w17, #27, 0xfffff7fa6e8c
   0x0000fffff7fa6e80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6e84:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6e88:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6e8c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa6e90:	b900016d	str	w13, [x11]
   0x0000fffff7fa6e94:	1400000e	b	0xfffff7fa6ecc
   0x0000fffff7fa6e98:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa6e9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6ea0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6ea4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6ea8:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa6eac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6eb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6eb4:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa6eb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa6ebc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6ec0:	d63f0200	blr	x16
   0x0000fffff7fa6ec4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6ec8:	54006f40	b.eq	0xfffff7fa7cb0  // b.none
   0x0000fffff7fa6ecc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa6ed0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa6ed4:	540004a0	b.eq	0xfffff7fa6f68  // b.none
   0x0000fffff7fa6ed8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa6edc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa6ee0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa6ee4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa6ee8:	54000400	b.eq	0xfffff7fa6f68  // b.none
   0x0000fffff7fa6eec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa6ef0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa6ef4:	36d801d1	tbz	w17, #27, 0xfffff7fa6f2c
   0x0000fffff7fa6ef8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa6efc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa6f00:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa6f04:	54000321	b.ne	0xfffff7fa6f68  // b.any
   0x0000fffff7fa6f08:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa6f0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6f10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa6f14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa6f18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa6f1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa6f20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa6f24:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa6f28:	54000209	b.ls	0xfffff7fa6f68  // b.plast
   0x0000fffff7fa6f2c:	36d8008d	tbz	w13, #27, 0xfffff7fa6f3c
   0x0000fffff7fa6f30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa6f34:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa6f38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa6f3c:	36d80091	tbz	w17, #27, 0xfffff7fa6f4c
   0x0000fffff7fa6f40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa6f44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa6f48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa6f4c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa6f50:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa6f54:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa6f58:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa6f5c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa6f60:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa6f64:	1400000e	b	0xfffff7fa6f9c
   0x0000fffff7fa6f68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa6f6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa6f70:	aa1303e1	mov	x1, x19
   0x0000fffff7fa6f74:	aa1503e2	mov	x2, x21
   0x0000fffff7fa6f78:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa6f7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa6f80:	aa1603e5	mov	x5, x22
   0x0000fffff7fa6f84:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa6f88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa6f8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa6f90:	d63f0200	blr	x16
   0x0000fffff7fa6f94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa6f98:	54006900	b.eq	0xfffff7fa7cb8  // b.none
   0x0000fffff7fa6f9c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6fa0:	37d806a9	tbnz	w9, #27, 0xfffff7fa7074
   0x0000fffff7fa6fa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6fa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6fac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6fb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6fb4:	540001c1	b.ne	0xfffff7fa6fec  // b.any
   0x0000fffff7fa6fb8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa6fbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6fc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6fc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6fc8:	54000121	b.ne	0xfffff7fa6fec  // b.any
   0x0000fffff7fa6fcc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa6fd0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa6fd4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa6fd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa6fdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6fe0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa6fe4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa6fe8:	14000030	b	0xfffff7fa70a8
   0x0000fffff7fa6fec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa6ff0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa6ff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa6ff8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa6ffc:	54000120	b.eq	0xfffff7fa7020  // b.none
   0x0000fffff7fa7000:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7004:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa700c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7010:	54000321	b.ne	0xfffff7fa7074  // b.any
   0x0000fffff7fa7014:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7018:	9e620120	scvtf	d0, x9
   0x0000fffff7fa701c:	14000002	b	0xfffff7fa7024
   0x0000fffff7fa7020:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa7024:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7028:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa702c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7030:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7034:	54000120	b.eq	0xfffff7fa7058  // b.none
   0x0000fffff7fa7038:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa703c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7044:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7048:	54000161	b.ne	0xfffff7fa7074  // b.any
   0x0000fffff7fa704c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7050:	9e620121	scvtf	d1, x9
   0x0000fffff7fa7054:	14000002	b	0xfffff7fa705c
   0x0000fffff7fa7058:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa705c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7060:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa7064:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa706c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7070:	17ffffde	b	0xfffff7fa6fe8
   0x0000fffff7fa7074:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7078:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa707c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7080:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7084:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa7088:	aa1403e4	mov	x4, x20
   0x0000fffff7fa708c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7090:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa7094:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7098:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa709c:	d63f0200	blr	x16
   0x0000fffff7fa70a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa70a4:	540060e0	b.eq	0xfffff7fa7cc0  // b.none
   0x0000fffff7fa70a8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa70ac:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa70b0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa70b4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa70b8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa70bc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa70c0:	36d801d1	tbz	w17, #27, 0xfffff7fa70f8
   0x0000fffff7fa70c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa70c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa70cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa70d0:	54000281	b.ne	0xfffff7fa7120  // b.any
   0x0000fffff7fa70d4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa70d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa70dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa70e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa70e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa70e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa70ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa70f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa70f4:	54000169	b.ls	0xfffff7fa7120  // b.plast
   0x0000fffff7fa70f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa70fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7100:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7104:	36d80091	tbz	w17, #27, 0xfffff7fa7114
   0x0000fffff7fa7108:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa710c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7110:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7114:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa7118:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa711c:	1400000e	b	0xfffff7fa7154
   0x0000fffff7fa7120:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7124:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7128:	aa1303e1	mov	x1, x19
   0x0000fffff7fa712c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7130:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa7134:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7138:	aa1603e5	mov	x5, x22
   0x0000fffff7fa713c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa7140:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7148:	d63f0200	blr	x16
   0x0000fffff7fa714c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7150:	54005bc0	b.eq	0xfffff7fa7cc8  // b.none
   0x0000fffff7fa7154:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa7158:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa715c:	540003a0	b.eq	0xfffff7fa71d0  // b.none
   0x0000fffff7fa7160:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa7164:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa7168:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa716c:	36d801d1	tbz	w17, #27, 0xfffff7fa71a4
   0x0000fffff7fa7170:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7174:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7178:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa717c:	540002a1	b.ne	0xfffff7fa71d0  // b.any
   0x0000fffff7fa7180:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa7184:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7188:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa718c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7190:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7194:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7198:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa719c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa71a0:	54000189	b.ls	0xfffff7fa71d0  // b.plast
   0x0000fffff7fa71a4:	36d8008d	tbz	w13, #27, 0xfffff7fa71b4
   0x0000fffff7fa71a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa71ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa71b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa71b4:	36d80091	tbz	w17, #27, 0xfffff7fa71c4
   0x0000fffff7fa71b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa71bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa71c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa71c4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa71c8:	b900016d	str	w13, [x11]
   0x0000fffff7fa71cc:	1400000e	b	0xfffff7fa7204
   0x0000fffff7fa71d0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa71d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa71d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa71dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa71e0:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa71e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa71e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa71ec:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa71f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa71f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa71f8:	d63f0200	blr	x16
   0x0000fffff7fa71fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7200:	54005680	b.eq	0xfffff7fa7cd0  // b.none
   0x0000fffff7fa7204:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7208:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa720c:	540004a0	b.eq	0xfffff7fa72a0  // b.none
   0x0000fffff7fa7210:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7214:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7218:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa721c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7220:	54000400	b.eq	0xfffff7fa72a0  // b.none
   0x0000fffff7fa7224:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7228:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa722c:	36d801d1	tbz	w17, #27, 0xfffff7fa7264
   0x0000fffff7fa7230:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7234:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7238:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa723c:	54000321	b.ne	0xfffff7fa72a0  // b.any
   0x0000fffff7fa7240:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa7244:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7248:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa724c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7250:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7254:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7258:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa725c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7260:	54000209	b.ls	0xfffff7fa72a0  // b.plast
   0x0000fffff7fa7264:	36d8008d	tbz	w13, #27, 0xfffff7fa7274
   0x0000fffff7fa7268:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa726c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7270:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7274:	36d80091	tbz	w17, #27, 0xfffff7fa7284
   0x0000fffff7fa7278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa727c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7280:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7284:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa7288:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa728c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7290:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7294:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa7298:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa729c:	1400000e	b	0xfffff7fa72d4
   0x0000fffff7fa72a0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa72a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa72a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa72ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa72b0:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa72b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa72b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa72bc:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa72c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa72c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa72c8:	d63f0200	blr	x16
   0x0000fffff7fa72cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa72d0:	54005040	b.eq	0xfffff7fa7cd8  // b.none
   0x0000fffff7fa72d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa72d8:	37d806a9	tbnz	w9, #27, 0xfffff7fa73ac
   0x0000fffff7fa72dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa72e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa72e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa72e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa72ec:	540001c1	b.ne	0xfffff7fa7324  // b.any
   0x0000fffff7fa72f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa72f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa72f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa72fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7300:	54000121	b.ne	0xfffff7fa7324  // b.any
   0x0000fffff7fa7304:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7308:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa730c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7310:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7314:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7318:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa731c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7320:	14000030	b	0xfffff7fa73e0
   0x0000fffff7fa7324:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7328:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa732c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7330:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7334:	54000120	b.eq	0xfffff7fa7358  // b.none
   0x0000fffff7fa7338:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa733c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7344:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7348:	54000321	b.ne	0xfffff7fa73ac  // b.any
   0x0000fffff7fa734c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7350:	9e620120	scvtf	d0, x9
   0x0000fffff7fa7354:	14000002	b	0xfffff7fa735c
   0x0000fffff7fa7358:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa735c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7360:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7364:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7368:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa736c:	54000120	b.eq	0xfffff7fa7390  // b.none
   0x0000fffff7fa7370:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7374:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa737c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7380:	54000161	b.ne	0xfffff7fa73ac  // b.any
   0x0000fffff7fa7384:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa7388:	9e620121	scvtf	d1, x9
   0x0000fffff7fa738c:	14000002	b	0xfffff7fa7394
   0x0000fffff7fa7390:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa7394:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7398:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa739c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa73a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa73a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa73a8:	17ffffde	b	0xfffff7fa7320
   0x0000fffff7fa73ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa73b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa73b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa73b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa73bc:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa73c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa73c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa73c8:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa73cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa73d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa73d4:	d63f0200	blr	x16
   0x0000fffff7fa73d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa73dc:	54004820	b.eq	0xfffff7fa7ce0  // b.none
   0x0000fffff7fa73e0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa73e4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa73e8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa73ec:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa73f0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa73f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa73f8:	36d801d1	tbz	w17, #27, 0xfffff7fa7430
   0x0000fffff7fa73fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7400:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7404:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7408:	54000281	b.ne	0xfffff7fa7458  // b.any
   0x0000fffff7fa740c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa7410:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7414:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7418:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa741c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7420:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7424:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7428:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa742c:	54000169	b.ls	0xfffff7fa7458  // b.plast
   0x0000fffff7fa7430:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa7434:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7438:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa743c:	36d80091	tbz	w17, #27, 0xfffff7fa744c
   0x0000fffff7fa7440:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7444:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7448:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa744c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa7450:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa7454:	1400000e	b	0xfffff7fa748c
   0x0000fffff7fa7458:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa745c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7460:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7464:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7468:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa746c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7470:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7474:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa7478:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa747c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7480:	d63f0200	blr	x16
   0x0000fffff7fa7484:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7488:	54004300	b.eq	0xfffff7fa7ce8  // b.none
   0x0000fffff7fa748c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa7490:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7494:	540003a0	b.eq	0xfffff7fa7508  // b.none
   0x0000fffff7fa7498:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa749c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa74a0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa74a4:	36d801d1	tbz	w17, #27, 0xfffff7fa74dc
   0x0000fffff7fa74a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa74ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa74b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa74b4:	540002a1	b.ne	0xfffff7fa7508  // b.any
   0x0000fffff7fa74b8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa74bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa74c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa74c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa74c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa74cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa74d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa74d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa74d8:	54000189	b.ls	0xfffff7fa7508  // b.plast
   0x0000fffff7fa74dc:	36d8008d	tbz	w13, #27, 0xfffff7fa74ec
   0x0000fffff7fa74e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa74e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa74e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa74ec:	36d80091	tbz	w17, #27, 0xfffff7fa74fc
   0x0000fffff7fa74f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa74f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa74f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa74fc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa7500:	b900016d	str	w13, [x11]
   0x0000fffff7fa7504:	1400000e	b	0xfffff7fa753c
   0x0000fffff7fa7508:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa750c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7510:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7514:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7518:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa751c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7520:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7524:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa7528:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa752c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7530:	d63f0200	blr	x16
   0x0000fffff7fa7534:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7538:	54003dc0	b.eq	0xfffff7fa7cf0  // b.none
   0x0000fffff7fa753c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7540:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7544:	540004a0	b.eq	0xfffff7fa75d8  // b.none
   0x0000fffff7fa7548:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa754c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7550:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa7554:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7558:	54000400	b.eq	0xfffff7fa75d8  // b.none
   0x0000fffff7fa755c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7560:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa7564:	36d801d1	tbz	w17, #27, 0xfffff7fa759c
   0x0000fffff7fa7568:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa756c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7570:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7574:	54000321	b.ne	0xfffff7fa75d8  // b.any
   0x0000fffff7fa7578:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa757c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7580:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7584:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7588:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa758c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7590:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7594:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7598:	54000209	b.ls	0xfffff7fa75d8  // b.plast
   0x0000fffff7fa759c:	36d8008d	tbz	w13, #27, 0xfffff7fa75ac
   0x0000fffff7fa75a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa75a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa75a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa75ac:	36d80091	tbz	w17, #27, 0xfffff7fa75bc
   0x0000fffff7fa75b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa75b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa75b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa75bc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa75c0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa75c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa75c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa75cc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa75d0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa75d4:	1400000e	b	0xfffff7fa760c
   0x0000fffff7fa75d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa75dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa75e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa75e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa75e8:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa75ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fa75f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa75f4:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa75f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa75fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7600:	d63f0200	blr	x16
   0x0000fffff7fa7604:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7608:	54003780	b.eq	0xfffff7fa7cf8  // b.none
   0x0000fffff7fa760c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7610:	37d806a9	tbnz	w9, #27, 0xfffff7fa76e4
   0x0000fffff7fa7614:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa761c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7620:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7624:	540001c1	b.ne	0xfffff7fa765c  // b.any
   0x0000fffff7fa7628:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa762c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7634:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7638:	54000121	b.ne	0xfffff7fa765c  // b.any
   0x0000fffff7fa763c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7640:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa7644:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7648:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa764c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7650:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa7654:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7658:	14000030	b	0xfffff7fa7718
   0x0000fffff7fa765c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7660:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7668:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa766c:	54000120	b.eq	0xfffff7fa7690  // b.none
   0x0000fffff7fa7670:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7674:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7678:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa767c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7680:	54000321	b.ne	0xfffff7fa76e4  // b.any
   0x0000fffff7fa7684:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7688:	9e620120	scvtf	d0, x9
   0x0000fffff7fa768c:	14000002	b	0xfffff7fa7694
   0x0000fffff7fa7690:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa7694:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7698:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa769c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa76a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa76a4:	54000120	b.eq	0xfffff7fa76c8  // b.none
   0x0000fffff7fa76a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa76ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa76b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa76b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa76b8:	54000161	b.ne	0xfffff7fa76e4  // b.any
   0x0000fffff7fa76bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa76c0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa76c4:	14000002	b	0xfffff7fa76cc
   0x0000fffff7fa76c8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa76cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa76d0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa76d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa76d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa76dc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa76e0:	17ffffde	b	0xfffff7fa7658
   0x0000fffff7fa76e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa76e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa76ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fa76f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa76f4:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa76f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa76fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7700:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa7704:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7708:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa770c:	d63f0200	blr	x16
   0x0000fffff7fa7710:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7714:	54002f60	b.eq	0xfffff7fa7d00  // b.none
   0x0000fffff7fa7718:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa771c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa7720:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa7724:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa7728:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa772c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa7730:	36d801d1	tbz	w17, #27, 0xfffff7fa7768
   0x0000fffff7fa7734:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7738:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa773c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7740:	54000281	b.ne	0xfffff7fa7790  // b.any
   0x0000fffff7fa7744:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa7748:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa774c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7750:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7754:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7758:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa775c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7760:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7764:	54000169	b.ls	0xfffff7fa7790  // b.plast
   0x0000fffff7fa7768:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa776c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7770:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7774:	36d80091	tbz	w17, #27, 0xfffff7fa7784
   0x0000fffff7fa7778:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa777c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7780:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7784:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa7788:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa778c:	1400000e	b	0xfffff7fa77c4
   0x0000fffff7fa7790:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7794:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7798:	aa1303e1	mov	x1, x19
   0x0000fffff7fa779c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa77a0:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa77a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa77a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa77ac:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa77b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa77b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa77b8:	d63f0200	blr	x16
   0x0000fffff7fa77bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa77c0:	54002a40	b.eq	0xfffff7fa7d08  // b.none
   0x0000fffff7fa77c4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa77c8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa77cc:	540003a0	b.eq	0xfffff7fa7840  // b.none
   0x0000fffff7fa77d0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa77d4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa77d8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa77dc:	36d801d1	tbz	w17, #27, 0xfffff7fa7814
   0x0000fffff7fa77e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa77e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa77e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa77ec:	540002a1	b.ne	0xfffff7fa7840  // b.any
   0x0000fffff7fa77f0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa77f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa77f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa77fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7800:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7804:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7808:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa780c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7810:	54000189	b.ls	0xfffff7fa7840  // b.plast
   0x0000fffff7fa7814:	36d8008d	tbz	w13, #27, 0xfffff7fa7824
   0x0000fffff7fa7818:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa781c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7820:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7824:	36d80091	tbz	w17, #27, 0xfffff7fa7834
   0x0000fffff7fa7828:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa782c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7830:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7834:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa7838:	b900016d	str	w13, [x11]
   0x0000fffff7fa783c:	1400000e	b	0xfffff7fa7874
   0x0000fffff7fa7840:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa7844:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7848:	aa1303e1	mov	x1, x19
   0x0000fffff7fa784c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7850:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa7854:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7858:	aa1603e5	mov	x5, x22
   0x0000fffff7fa785c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa7860:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7864:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7868:	d63f0200	blr	x16
   0x0000fffff7fa786c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7870:	54002500	b.eq	0xfffff7fa7d10  // b.none
   0x0000fffff7fa7874:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa7878:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa787c:	540004a0	b.eq	0xfffff7fa7910  // b.none
   0x0000fffff7fa7880:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa7884:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa7888:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa788c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa7890:	54000400	b.eq	0xfffff7fa7910  // b.none
   0x0000fffff7fa7894:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa7898:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa789c:	36d801d1	tbz	w17, #27, 0xfffff7fa78d4
   0x0000fffff7fa78a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa78a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa78a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa78ac:	54000321	b.ne	0xfffff7fa7910  // b.any
   0x0000fffff7fa78b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa78b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa78b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa78bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa78c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa78c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa78c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa78cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa78d0:	54000209	b.ls	0xfffff7fa7910  // b.plast
   0x0000fffff7fa78d4:	36d8008d	tbz	w13, #27, 0xfffff7fa78e4
   0x0000fffff7fa78d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa78dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa78e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa78e4:	36d80091	tbz	w17, #27, 0xfffff7fa78f4
   0x0000fffff7fa78e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa78ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa78f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa78f4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa78f8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa78fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa7900:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa7904:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa7908:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa790c:	1400000e	b	0xfffff7fa7944
   0x0000fffff7fa7910:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa7914:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7918:	aa1303e1	mov	x1, x19
   0x0000fffff7fa791c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7920:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa7924:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7928:	aa1603e5	mov	x5, x22
   0x0000fffff7fa792c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa7930:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7934:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7938:	d63f0200	blr	x16
   0x0000fffff7fa793c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7940:	54001ec0	b.eq	0xfffff7fa7d18  // b.none
   0x0000fffff7fa7944:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7948:	37d806a9	tbnz	w9, #27, 0xfffff7fa7a1c
   0x0000fffff7fa794c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa795c:	540001c1	b.ne	0xfffff7fa7994  // b.any
   0x0000fffff7fa7960:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa7964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa796c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa7970:	54000121	b.ne	0xfffff7fa7994  // b.any
   0x0000fffff7fa7974:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa7978:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa797c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa7980:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7988:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa798c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7990:	14000030	b	0xfffff7fa7a50
   0x0000fffff7fa7994:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa7998:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa799c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa79a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa79a4:	54000120	b.eq	0xfffff7fa79c8  // b.none
   0x0000fffff7fa79a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa79ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa79b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa79b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa79b8:	54000321	b.ne	0xfffff7fa7a1c  // b.any
   0x0000fffff7fa79bc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa79c0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa79c4:	14000002	b	0xfffff7fa79cc
   0x0000fffff7fa79c8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa79cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa79d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa79d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa79d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa79dc:	54000120	b.eq	0xfffff7fa7a00  // b.none
   0x0000fffff7fa79e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa79e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa79e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa79ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa79f0:	54000161	b.ne	0xfffff7fa7a1c  // b.any
   0x0000fffff7fa79f4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa79f8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa79fc:	14000002	b	0xfffff7fa7a04
   0x0000fffff7fa7a00:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa7a04:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa7a08:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa7a0c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa7a10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7a14:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa7a18:	17ffffde	b	0xfffff7fa7990
   0x0000fffff7fa7a1c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7a20:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7a24:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7a28:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7a2c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa7a30:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7a34:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7a38:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa7a3c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7a40:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7a44:	d63f0200	blr	x16
   0x0000fffff7fa7a48:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7a4c:	540016a0	b.eq	0xfffff7fa7d20  // b.none
   0x0000fffff7fa7a50:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa7a54:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa7a58:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa7a5c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa7a60:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa7a64:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa7a68:	36d801d1	tbz	w17, #27, 0xfffff7fa7aa0
   0x0000fffff7fa7a6c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7a70:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7a74:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7a78:	54000281	b.ne	0xfffff7fa7ac8  // b.any
   0x0000fffff7fa7a7c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa7a80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7a84:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7a88:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7a8c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7a90:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7a94:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7a98:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7a9c:	54000169	b.ls	0xfffff7fa7ac8  // b.plast
   0x0000fffff7fa7aa0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa7aa4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7aa8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7aac:	36d80091	tbz	w17, #27, 0xfffff7fa7abc
   0x0000fffff7fa7ab0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7ab4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7ab8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7abc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa7ac0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa7ac4:	1400000e	b	0xfffff7fa7afc
   0x0000fffff7fa7ac8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7acc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7ad0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7ad4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7ad8:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa7adc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7ae0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7ae4:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa7ae8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7aec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7af0:	d63f0200	blr	x16
   0x0000fffff7fa7af4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7af8:	54001180	b.eq	0xfffff7fa7d28  // b.none
   0x0000fffff7fa7afc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa7b00:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa7b04:	540003a0	b.eq	0xfffff7fa7b78  // b.none
   0x0000fffff7fa7b08:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa7b0c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa7b10:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa7b14:	36d801d1	tbz	w17, #27, 0xfffff7fa7b4c
   0x0000fffff7fa7b18:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa7b1c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa7b20:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa7b24:	540002a1	b.ne	0xfffff7fa7b78  // b.any
   0x0000fffff7fa7b28:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa7b2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7b30:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa7b34:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa7b38:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa7b3c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa7b40:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa7b44:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa7b48:	54000189	b.ls	0xfffff7fa7b78  // b.plast
   0x0000fffff7fa7b4c:	36d8008d	tbz	w13, #27, 0xfffff7fa7b5c
   0x0000fffff7fa7b50:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa7b54:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa7b58:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa7b5c:	36d80091	tbz	w17, #27, 0xfffff7fa7b6c
   0x0000fffff7fa7b60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa7b64:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa7b68:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa7b6c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa7b70:	b900016d	str	w13, [x11]
   0x0000fffff7fa7b74:	1400000e	b	0xfffff7fa7bac
   0x0000fffff7fa7b78:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa7b7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7b80:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7b84:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7b88:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa7b8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7b90:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7b94:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa7b98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa7b9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7ba0:	d63f0200	blr	x16
   0x0000fffff7fa7ba4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa7ba8:	54000c40	b.eq	0xfffff7fa7d30  // b.none
   0x0000fffff7fa7bac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa7bb0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa7bb4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa7bb8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa7bbc:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fa7bc0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa7bc4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa7bc8:	d286ae90	mov	x16, #0x3574                	// #13684
   0x0000fffff7fa7bcc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa7bd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa7bd4:	d63f0200	blr	x16
   0x0000fffff7fa7bd8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa7bdc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa7be0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa7be4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa7be8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa7bec:	d65f03c0	ret
   0x0000fffff7fa7bf0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa7bf4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa7bf8:	b900028a	str	w10, [x20]
   0x0000fffff7fa7bfc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa7c00:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa7c04:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa7c08:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa7c0c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa7c10:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa7c14:	d65f03c0	ret
   0x0000fffff7fa7c18:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa7c1c:	17fffff5	b	0xfffff7fa7bf0
   0x0000fffff7fa7c20:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa7c24:	17fffff3	b	0xfffff7fa7bf0
   0x0000fffff7fa7c28:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa7c2c:	17fffff1	b	0xfffff7fa7bf0
   0x0000fffff7fa7c30:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa7c34:	17ffffef	b	0xfffff7fa7bf0
   0x0000fffff7fa7c38:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa7c3c:	17ffffed	b	0xfffff7fa7bf0
   0x0000fffff7fa7c40:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa7c44:	17ffffeb	b	0xfffff7fa7bf0
   0x0000fffff7fa7c48:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa7c4c:	17ffffe9	b	0xfffff7fa7bf0
   0x0000fffff7fa7c50:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa7c54:	17ffffe7	b	0xfffff7fa7bf0
   0x0000fffff7fa7c58:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa7c5c:	17ffffe5	b	0xfffff7fa7bf0
   0x0000fffff7fa7c60:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa7c64:	17ffffe3	b	0xfffff7fa7bf0
   0x0000fffff7fa7c68:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa7c6c:	17ffffe1	b	0xfffff7fa7bf0
   0x0000fffff7fa7c70:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa7c74:	17ffffdf	b	0xfffff7fa7bf0
   0x0000fffff7fa7c78:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa7c7c:	17ffffdd	b	0xfffff7fa7bf0
   0x0000fffff7fa7c80:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa7c84:	17ffffdb	b	0xfffff7fa7bf0
   0x0000fffff7fa7c88:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa7c8c:	17ffffd9	b	0xfffff7fa7bf0
   0x0000fffff7fa7c90:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa7c94:	17ffffd7	b	0xfffff7fa7bf0
   0x0000fffff7fa7c98:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa7c9c:	17ffffd5	b	0xfffff7fa7bf0
   0x0000fffff7fa7ca0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa7ca4:	17ffffd3	b	0xfffff7fa7bf0
   0x0000fffff7fa7ca8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa7cac:	17ffffd1	b	0xfffff7fa7bf0
   0x0000fffff7fa7cb0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa7cb4:	17ffffcf	b	0xfffff7fa7bf0
   0x0000fffff7fa7cb8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa7cbc:	17ffffcd	b	0xfffff7fa7bf0
   0x0000fffff7fa7cc0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa7cc4:	17ffffcb	b	0xfffff7fa7bf0
   0x0000fffff7fa7cc8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa7ccc:	17ffffc9	b	0xfffff7fa7bf0
   0x0000fffff7fa7cd0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa7cd4:	17ffffc7	b	0xfffff7fa7bf0
   0x0000fffff7fa7cd8:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa7cdc:	17ffffc5	b	0xfffff7fa7bf0
   0x0000fffff7fa7ce0:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa7ce4:	17ffffc3	b	0xfffff7fa7bf0
   0x0000fffff7fa7ce8:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa7cec:	17ffffc1	b	0xfffff7fa7bf0
   0x0000fffff7fa7cf0:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa7cf4:	17ffffbf	b	0xfffff7fa7bf0
   0x0000fffff7fa7cf8:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa7cfc:	17ffffbd	b	0xfffff7fa7bf0
   0x0000fffff7fa7d00:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa7d04:	17ffffbb	b	0xfffff7fa7bf0
   0x0000fffff7fa7d08:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa7d0c:	17ffffb9	b	0xfffff7fa7bf0
   0x0000fffff7fa7d10:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa7d14:	17ffffb7	b	0xfffff7fa7bf0
   0x0000fffff7fa7d18:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa7d1c:	17ffffb5	b	0xfffff7fa7bf0
   0x0000fffff7fa7d20:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa7d24:	17ffffb3	b	0xfffff7fa7bf0
   0x0000fffff7fa7d28:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa7d2c:	17ffffb1	b	0xfffff7fa7bf0
   0x0000fffff7fa7d30:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fa7d34:	17ffffaf	b	0xfffff7fa7bf0
   0x0000fffff7fa7d38:	00000000	udf	#0
   0x0000fffff7fa7d3c:	00000000	udf	#0
   0x0000fffff7fa7d40:	00000000	udf	#0
   0x0000fffff7fa7d44:	00000000	udf	#0
   0x0000fffff7fa7d48:	00000000	udf	#0
   0x0000fffff7fa7d4c:	00000000	udf	#0
   0x0000fffff7fa7d50:	00000000	udf	#0
   0x0000fffff7fa7d54:	00000000	udf	#0
   0x0000fffff7fa7d58:	00000000	udf	#0
   0x0000fffff7fa7d5c:	00000000	udf	#0
   0x0000fffff7fa7d60:	00000000	udf	#0
   0x0000fffff7fa7d64:	00000000	udf	#0
   0x0000fffff7fa7d68:	00000000	udf	#0
   0x0000fffff7fa7d6c:	00000000	udf	#0
   0x0000fffff7fa7d70:	00000000	udf	#0
   0x0000fffff7fa7d74:	00000000	udf	#0
   0x0000fffff7fa7d78:	00000000	udf	#0
   0x0000fffff7fa7d7c:	00000000	udf	#0
   0x0000fffff7fa7d80:	00000000	udf	#0
   0x0000fffff7fa7d84:	00000000	udf	#0
   0x0000fffff7fa7d88:	00000000	udf	#0
   0x0000fffff7fa7d8c:	00000000	udf	#0
   0x0000fffff7fa7d90:	00000000	udf	#0
   0x0000fffff7fa7d94:	00000000	udf	#0
   0x0000fffff7fa7d98:	00000000	udf	#0
   0x0000fffff7fa7d9c:	00000000	udf	#0
   0x0000fffff7fa7da0:	00000000	udf	#0
   0x0000fffff7fa7da4:	00000000	udf	#0
   0x0000fffff7fa7da8:	00000000	udf	#0
   0x0000fffff7fa7dac:	00000000	udf	#0
   0x0000fffff7fa7db0:	00000000	udf	#0
   0x0000fffff7fa7db4:	00000000	udf	#0
   0x0000fffff7fa7db8:	00000000	udf	#0
   0x0000fffff7fa7dbc:	00000000	udf	#0
   0x0000fffff7fa7dc0:	00000000	udf	#0
   0x0000fffff7fa7dc4:	00000000	udf	#0
   0x0000fffff7fa7dc8:	00000000	udf	#0
   0x0000fffff7fa7dcc:	00000000	udf	#0
   0x0000fffff7fa7dd0:	00000000	udf	#0
   0x0000fffff7fa7dd4:	00000000	udf	#0
   0x0000fffff7fa7dd8:	00000000	udf	#0
   0x0000fffff7fa7ddc:	00000000	udf	#0
   0x0000fffff7fa7de0:	00000000	udf	#0
   0x0000fffff7fa7de4:	00000000	udf	#0
   0x0000fffff7fa7de8:	00000000	udf	#0
   0x0000fffff7fa7dec:	00000000	udf	#0
   0x0000fffff7fa7df0:	00000000	udf	#0
   0x0000fffff7fa7df4:	00000000	udf	#0
   0x0000fffff7fa7df8:	00000000	udf	#0
   0x0000fffff7fa7dfc:	00000000	udf	#0
   0x0000fffff7fa7e00:	00000000	udf	#0
   0x0000fffff7fa7e04:	00000000	udf	#0
   0x0000fffff7fa7e08:	00000000	udf	#0
   0x0000fffff7fa7e0c:	00000000	udf	#0
   0x0000fffff7fa7e10:	00000000	udf	#0
   0x0000fffff7fa7e14:	00000000	udf	#0
   0x0000fffff7fa7e18:	00000000	udf	#0
   0x0000fffff7fa7e1c:	00000000	udf	#0
   0x0000fffff7fa7e20:	00000000	udf	#0
   0x0000fffff7fa7e24:	00000000	udf	#0
   0x0000fffff7fa7e28:	00000000	udf	#0
   0x0000fffff7fa7e2c:	00000000	udf	#0
   0x0000fffff7fa7e30:	00000000	udf	#0
   0x0000fffff7fa7e34:	00000000	udf	#0
   0x0000fffff7fa7e38:	00000000	udf	#0
   0x0000fffff7fa7e3c:	00000000	udf	#0
   0x0000fffff7fa7e40:	00000000	udf	#0
   0x0000fffff7fa7e44:	00000000	udf	#0
   0x0000fffff7fa7e48:	00000000	udf	#0
   0x0000fffff7fa7e4c:	00000000	udf	#0
   0x0000fffff7fa7e50:	00000000	udf	#0
   0x0000fffff7fa7e54:	00000000	udf	#0
   0x0000fffff7fa7e58:	00000000	udf	#0
   0x0000fffff7fa7e5c:	00000000	udf	#0
   0x0000fffff7fa7e60:	00000000	udf	#0
   0x0000fffff7fa7e64:	00000000	udf	#0
   0x0000fffff7fa7e68:	00000000	udf	#0
   0x0000fffff7fa7e6c:	00000000	udf	#0
   0x0000fffff7fa7e70:	00000000	udf	#0
   0x0000fffff7fa7e74:	00000000	udf	#0
   0x0000fffff7fa7e78:	00000000	udf	#0
   0x0000fffff7fa7e7c:	00000000	udf	#0
   0x0000fffff7fa7e80:	00000000	udf	#0
   0x0000fffff7fa7e84:	00000000	udf	#0
   0x0000fffff7fa7e88:	00000000	udf	#0
   0x0000fffff7fa7e8c:	00000000	udf	#0
   0x0000fffff7fa7e90:	00000000	udf	#0
   0x0000fffff7fa7e94:	00000000	udf	#0
   0x0000fffff7fa7e98:	00000000	udf	#0
   0x0000fffff7fa7e9c:	00000000	udf	#0
   0x0000fffff7fa7ea0:	00000000	udf	#0
   0x0000fffff7fa7ea4:	00000000	udf	#0
   0x0000fffff7fa7ea8:	00000000	udf	#0
   0x0000fffff7fa7eac:	00000000	udf	#0
   0x0000fffff7fa7eb0:	00000000	udf	#0
   0x0000fffff7fa7eb4:	00000000	udf	#0
   0x0000fffff7fa7eb8:	00000000	udf	#0
   0x0000fffff7fa7ebc:	00000000	udf	#0
   0x0000fffff7fa7ec0:	00000000	udf	#0
   0x0000fffff7fa7ec4:	00000000	udf	#0
   0x0000fffff7fa7ec8:	00000000	udf	#0
   0x0000fffff7fa7ecc:	00000000	udf	#0
   0x0000fffff7fa7ed0:	00000000	udf	#0
   0x0000fffff7fa7ed4:	00000000	udf	#0
   0x0000fffff7fa7ed8:	00000000	udf	#0
   0x0000fffff7fa7edc:	00000000	udf	#0
   0x0000fffff7fa7ee0:	00000000	udf	#0
   0x0000fffff7fa7ee4:	00000000	udf	#0
   0x0000fffff7fa7ee8:	00000000	udf	#0
   0x0000fffff7fa7eec:	00000000	udf	#0
   0x0000fffff7fa7ef0:	00000000	udf	#0
   0x0000fffff7fa7ef4:	00000000	udf	#0
   0x0000fffff7fa7ef8:	00000000	udf	#0
   0x0000fffff7fa7efc:	00000000	udf	#0
   0x0000fffff7fa7f00:	00000000	udf	#0
   0x0000fffff7fa7f04:	00000000	udf	#0
   0x0000fffff7fa7f08:	00000000	udf	#0
   0x0000fffff7fa7f0c:	00000000	udf	#0
   0x0000fffff7fa7f10:	00000000	udf	#0
   0x0000fffff7fa7f14:	00000000	udf	#0
   0x0000fffff7fa7f18:	00000000	udf	#0
   0x0000fffff7fa7f1c:	00000000	udf	#0
   0x0000fffff7fa7f20:	00000000	udf	#0
   0x0000fffff7fa7f24:	00000000	udf	#0
   0x0000fffff7fa7f28:	00000000	udf	#0
   0x0000fffff7fa7f2c:	00000000	udf	#0
   0x0000fffff7fa7f30:	00000000	udf	#0
   0x0000fffff7fa7f34:	00000000	udf	#0
   0x0000fffff7fa7f38:	00000000	udf	#0
   0x0000fffff7fa7f3c:	00000000	udf	#0
   0x0000fffff7fa7f40:	00000000	udf	#0
   0x0000fffff7fa7f44:	00000000	udf	#0
   0x0000fffff7fa7f48:	00000000	udf	#0
   0x0000fffff7fa7f4c:	00000000	udf	#0
   0x0000fffff7fa7f50:	00000000	udf	#0
   0x0000fffff7fa7f54:	00000000	udf	#0
   0x0000fffff7fa7f58:	00000000	udf	#0
   0x0000fffff7fa7f5c:	00000000	udf	#0
   0x0000fffff7fa7f60:	00000000	udf	#0
   0x0000fffff7fa7f64:	00000000	udf	#0
   0x0000fffff7fa7f68:	00000000	udf	#0
   0x0000fffff7fa7f6c:	00000000	udf	#0
   0x0000fffff7fa7f70:	00000000	udf	#0
   0x0000fffff7fa7f74:	00000000	udf	#0
   0x0000fffff7fa7f78:	00000000	udf	#0
   0x0000fffff7fa7f7c:	00000000	udf	#0
   0x0000fffff7fa7f80:	00000000	udf	#0
   0x0000fffff7fa7f84:	00000000	udf	#0
   0x0000fffff7fa7f88:	00000000	udf	#0
   0x0000fffff7fa7f8c:	00000000	udf	#0
   0x0000fffff7fa7f90:	00000000	udf	#0
   0x0000fffff7fa7f94:	00000000	udf	#0
   0x0000fffff7fa7f98:	00000000	udf	#0
   0x0000fffff7fa7f9c:	00000000	udf	#0
   0x0000fffff7fa7fa0:	00000000	udf	#0
   0x0000fffff7fa7fa4:	00000000	udf	#0
   0x0000fffff7fa7fa8:	00000000	udf	#0
   0x0000fffff7fa7fac:	00000000	udf	#0
   0x0000fffff7fa7fb0:	00000000	udf	#0
   0x0000fffff7fa7fb4:	00000000	udf	#0
   0x0000fffff7fa7fb8:	00000000	udf	#0
   0x0000fffff7fa7fbc:	00000000	udf	#0
   0x0000fffff7fa7fc0:	00000000	udf	#0
   0x0000fffff7fa7fc4:	00000000	udf	#0
   0x0000fffff7fa7fc8:	00000000	udf	#0
   0x0000fffff7fa7fcc:	00000000	udf	#0
   0x0000fffff7fa7fd0:	00000000	udf	#0
   0x0000fffff7fa7fd4:	00000000	udf	#0
   0x0000fffff7fa7fd8:	00000000	udf	#0
   0x0000fffff7fa7fdc:	00000000	udf	#0
   0x0000fffff7fa7fe0:	00000000	udf	#0
   0x0000fffff7fa7fe4:	00000000	udf	#0
   0x0000fffff7fa7fe8:	00000000	udf	#0
   0x0000fffff7fa7fec:	00000000	udf	#0
   0x0000fffff7fa7ff0:	00000000	udf	#0
   0x0000fffff7fa7ff4:	00000000	udf	#0
   0x0000fffff7fa7ff8:	00000000	udf	#0
   0x0000fffff7fa7ffc:	00000000	udf	#0
End of assembler dump.
