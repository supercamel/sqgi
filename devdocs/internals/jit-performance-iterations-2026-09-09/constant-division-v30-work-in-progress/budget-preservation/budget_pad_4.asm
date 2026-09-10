Dump of assembler code from 0xfffff7fb6000 to 0xfffff7fb8000:
   0x0000fffff7fb6000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fb6004:	910003fd	mov	x29, sp
   0x0000fffff7fb6008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fb600c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fb6010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fb6014:	aa0003f3	mov	x19, x0
   0x0000fffff7fb6018:	aa0103f4	mov	x20, x1
   0x0000fffff7fb601c:	aa0203f5	mov	x21, x2
   0x0000fffff7fb6020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fb6024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fb6028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fb602c:	f90003e9	str	x9, [sp]
   0x0000fffff7fb6030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fb6034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fb6038:	d29ea810	mov	x16, #0xf540                	// #62784
   0x0000fffff7fb603c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fb6040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6044:	d63f0200	blr	x16
   0x0000fffff7fb6048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fb604c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fb6050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fb6054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fb6058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb605c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb6060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb6064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb6068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb606c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb6070:	36d801d1	tbz	w17, #27, 0xfffff7fb60a8
   0x0000fffff7fb6074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb607c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6080:	54000281	b.ne	0xfffff7fb60d0  // b.any
   0x0000fffff7fb6084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb6088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb608c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb609c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb60a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb60a4:	54000169	b.ls	0xfffff7fb60d0  // b.plast
   0x0000fffff7fb60a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb60ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb60b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb60b4:	36d80091	tbz	w17, #27, 0xfffff7fb60c4
   0x0000fffff7fb60b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb60bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb60c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb60c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb60c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb60cc:	1400000e	b	0xfffff7fb6104
   0x0000fffff7fb60d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb60d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb60d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb60dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb60e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fb60e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb60e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb60ec:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fb60f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb60f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb60f8:	d63f0200	blr	x16
   0x0000fffff7fb60fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6100:	5400d7c0	b.eq	0xfffff7fb7bf8  // b.none
   0x0000fffff7fb6104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb6108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb610c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fb6110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb6114:	36d80211	tbz	w17, #27, 0xfffff7fb6154
   0x0000fffff7fb6118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb611c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6124:	540001e1	b.ne	0xfffff7fb6160  // b.any
   0x0000fffff7fb6128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb612c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb613c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6148:	540000c9	b.ls	0xfffff7fb6160  // b.plast
   0x0000fffff7fb614c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb6158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb615c:	1400000e	b	0xfffff7fb6194
   0x0000fffff7fb6160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6168:	aa1303e1	mov	x1, x19
   0x0000fffff7fb616c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fb6174:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6178:	aa1603e5	mov	x5, x22
   0x0000fffff7fb617c:	d2855410	mov	x16, #0x2aa0                	// #10912
   0x0000fffff7fb6180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6188:	d63f0200	blr	x16
   0x0000fffff7fb618c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6190:	5400d380	b.eq	0xfffff7fb7c00  // b.none
   0x0000fffff7fb6194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb6198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb619c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb61a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb61a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb61a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb61ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb61b0:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fb61b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb61b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb61bc:	d63f0200	blr	x16
   0x0000fffff7fb61c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb61c4:	5400d220	b.eq	0xfffff7fb7c08  // b.none
   0x0000fffff7fb61c8:	14000001	b	0xfffff7fb61cc
   0x0000fffff7fb61cc:	14000001	b	0xfffff7fb61d0
   0x0000fffff7fb61d0:	14000001	b	0xfffff7fb61d4
   0x0000fffff7fb61d4:	14000001	b	0xfffff7fb61d8
   0x0000fffff7fb61d8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb61dc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb61e0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb61e4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb61e8:	36d80211	tbz	w17, #27, 0xfffff7fb6228
   0x0000fffff7fb61ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb61f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb61f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb61f8:	540001e1	b.ne	0xfffff7fb6234  // b.any
   0x0000fffff7fb61fc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb6200:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6204:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6208:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb620c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6210:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6214:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6218:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb621c:	540000c9	b.ls	0xfffff7fb6234  // b.plast
   0x0000fffff7fb6220:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6224:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6228:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb622c:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb6230:	1400000e	b	0xfffff7fb6268
   0x0000fffff7fb6234:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6238:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb623c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6240:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6244:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb6248:	aa1403e4	mov	x4, x20
   0x0000fffff7fb624c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6250:	d2855410	mov	x16, #0x2aa0                	// #10912
   0x0000fffff7fb6254:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6258:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb625c:	d63f0200	blr	x16
   0x0000fffff7fb6260:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6264:	5400cd60	b.eq	0xfffff7fb7c10  // b.none
   0x0000fffff7fb6268:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb626c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6270:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6274:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6278:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb627c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6280:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6284:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fb6288:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb628c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6290:	d63f0200	blr	x16
   0x0000fffff7fb6294:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6298:	5400cc00	b.eq	0xfffff7fb7c18  // b.none
   0x0000fffff7fb629c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb62a0:	37d806a9	tbnz	w9, #27, 0xfffff7fb6374
   0x0000fffff7fb62a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb62a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb62ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb62b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb62b4:	540001c1	b.ne	0xfffff7fb62ec  // b.any
   0x0000fffff7fb62b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb62bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb62c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb62c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb62c8:	54000121	b.ne	0xfffff7fb62ec  // b.any
   0x0000fffff7fb62cc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb62d0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb62d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb62d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb62dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb62e0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb62e4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb62e8:	14000030	b	0xfffff7fb63a8
   0x0000fffff7fb62ec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb62f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb62f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb62f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb62fc:	54000120	b.eq	0xfffff7fb6320  // b.none
   0x0000fffff7fb6300:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6304:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6308:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb630c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6310:	54000321	b.ne	0xfffff7fb6374  // b.any
   0x0000fffff7fb6314:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb6318:	9e620120	scvtf	d0, x9
   0x0000fffff7fb631c:	14000002	b	0xfffff7fb6324
   0x0000fffff7fb6320:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb6324:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6328:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb632c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6330:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6334:	54000120	b.eq	0xfffff7fb6358  // b.none
   0x0000fffff7fb6338:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb633c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6344:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6348:	54000161	b.ne	0xfffff7fb6374  // b.any
   0x0000fffff7fb634c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6350:	9e620121	scvtf	d1, x9
   0x0000fffff7fb6354:	14000002	b	0xfffff7fb635c
   0x0000fffff7fb6358:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb635c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb6360:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb6364:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb636c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb6370:	17ffffde	b	0xfffff7fb62e8
   0x0000fffff7fb6374:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb637c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6380:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6384:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb6388:	aa1403e4	mov	x4, x20
   0x0000fffff7fb638c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6390:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fb6394:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb639c:	d63f0200	blr	x16
   0x0000fffff7fb63a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb63a4:	5400c3e0	b.eq	0xfffff7fb7c20  // b.none
   0x0000fffff7fb63a8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb63ac:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb63b0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb63b4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb63b8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb63bc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb63c0:	36d801d1	tbz	w17, #27, 0xfffff7fb63f8
   0x0000fffff7fb63c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb63c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb63cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb63d0:	54000281	b.ne	0xfffff7fb6420  // b.any
   0x0000fffff7fb63d4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb63d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb63dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb63e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb63e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb63e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb63ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb63f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb63f4:	54000169	b.ls	0xfffff7fb6420  // b.plast
   0x0000fffff7fb63f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb63fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6400:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6404:	36d80091	tbz	w17, #27, 0xfffff7fb6414
   0x0000fffff7fb6408:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb640c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6410:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6414:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb6418:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb641c:	1400000e	b	0xfffff7fb6454
   0x0000fffff7fb6420:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6424:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6428:	aa1303e1	mov	x1, x19
   0x0000fffff7fb642c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6430:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb6434:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6438:	aa1603e5	mov	x5, x22
   0x0000fffff7fb643c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fb6440:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6448:	d63f0200	blr	x16
   0x0000fffff7fb644c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6450:	5400bec0	b.eq	0xfffff7fb7c28  // b.none
   0x0000fffff7fb6454:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb6458:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb645c:	540003a0	b.eq	0xfffff7fb64d0  // b.none
   0x0000fffff7fb6460:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb6464:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb6468:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb646c:	36d801d1	tbz	w17, #27, 0xfffff7fb64a4
   0x0000fffff7fb6470:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6474:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6478:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb647c:	540002a1	b.ne	0xfffff7fb64d0  // b.any
   0x0000fffff7fb6480:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb6484:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6488:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb648c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6490:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6494:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6498:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb649c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb64a0:	54000189	b.ls	0xfffff7fb64d0  // b.plast
   0x0000fffff7fb64a4:	36d8008d	tbz	w13, #27, 0xfffff7fb64b4
   0x0000fffff7fb64a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb64ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb64b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb64b4:	36d80091	tbz	w17, #27, 0xfffff7fb64c4
   0x0000fffff7fb64b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb64bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb64c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb64c4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb64c8:	b900016d	str	w13, [x11]
   0x0000fffff7fb64cc:	1400000e	b	0xfffff7fb6504
   0x0000fffff7fb64d0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb64d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb64d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb64dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb64e0:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb64e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb64e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb64ec:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fb64f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb64f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb64f8:	d63f0200	blr	x16
   0x0000fffff7fb64fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6500:	5400b980	b.eq	0xfffff7fb7c30  // b.none
   0x0000fffff7fb6504:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb6508:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb650c:	540004a0	b.eq	0xfffff7fb65a0  // b.none
   0x0000fffff7fb6510:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb6514:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb6518:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb651c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb6520:	54000400	b.eq	0xfffff7fb65a0  // b.none
   0x0000fffff7fb6524:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb6528:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb652c:	36d801d1	tbz	w17, #27, 0xfffff7fb6564
   0x0000fffff7fb6530:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6534:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6538:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb653c:	54000321	b.ne	0xfffff7fb65a0  // b.any
   0x0000fffff7fb6540:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb6544:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6548:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb654c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6550:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6554:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6558:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb655c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6560:	54000209	b.ls	0xfffff7fb65a0  // b.plast
   0x0000fffff7fb6564:	36d8008d	tbz	w13, #27, 0xfffff7fb6574
   0x0000fffff7fb6568:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb656c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6570:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6574:	36d80091	tbz	w17, #27, 0xfffff7fb6584
   0x0000fffff7fb6578:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb657c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6580:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6584:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb6588:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb658c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb6590:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb6594:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb6598:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb659c:	1400000e	b	0xfffff7fb65d4
   0x0000fffff7fb65a0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb65a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb65a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb65ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fb65b0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb65b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb65b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb65bc:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fb65c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb65c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb65c8:	d63f0200	blr	x16
   0x0000fffff7fb65cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb65d0:	5400b340	b.eq	0xfffff7fb7c38  // b.none
   0x0000fffff7fb65d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb65d8:	37d806a9	tbnz	w9, #27, 0xfffff7fb66ac
   0x0000fffff7fb65dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb65e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb65e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb65e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb65ec:	540001c1	b.ne	0xfffff7fb6624  // b.any
   0x0000fffff7fb65f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb65f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb65f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb65fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6600:	54000121	b.ne	0xfffff7fb6624  // b.any
   0x0000fffff7fb6604:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb6608:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb660c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb6610:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6618:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb661c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb6620:	14000030	b	0xfffff7fb66e0
   0x0000fffff7fb6624:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6628:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb662c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6630:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6634:	54000120	b.eq	0xfffff7fb6658  // b.none
   0x0000fffff7fb6638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb663c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6644:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6648:	54000321	b.ne	0xfffff7fb66ac  // b.any
   0x0000fffff7fb664c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb6650:	9e620120	scvtf	d0, x9
   0x0000fffff7fb6654:	14000002	b	0xfffff7fb665c
   0x0000fffff7fb6658:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb665c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6660:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6664:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6668:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb666c:	54000120	b.eq	0xfffff7fb6690  // b.none
   0x0000fffff7fb6670:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6674:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6678:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb667c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6680:	54000161	b.ne	0xfffff7fb66ac  // b.any
   0x0000fffff7fb6684:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6688:	9e620121	scvtf	d1, x9
   0x0000fffff7fb668c:	14000002	b	0xfffff7fb6694
   0x0000fffff7fb6690:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb6694:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb6698:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb669c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb66a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb66a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb66a8:	17ffffde	b	0xfffff7fb6620
   0x0000fffff7fb66ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb66b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb66b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb66b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb66bc:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb66c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb66c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb66c8:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fb66cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb66d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb66d4:	d63f0200	blr	x16
   0x0000fffff7fb66d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb66dc:	5400ab20	b.eq	0xfffff7fb7c40  // b.none
   0x0000fffff7fb66e0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb66e4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb66e8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb66ec:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb66f0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb66f4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb66f8:	36d801d1	tbz	w17, #27, 0xfffff7fb6730
   0x0000fffff7fb66fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6700:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6704:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6708:	54000281	b.ne	0xfffff7fb6758  // b.any
   0x0000fffff7fb670c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb6710:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6714:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6718:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb671c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6720:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6724:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6728:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb672c:	54000169	b.ls	0xfffff7fb6758  // b.plast
   0x0000fffff7fb6730:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6734:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6738:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb673c:	36d80091	tbz	w17, #27, 0xfffff7fb674c
   0x0000fffff7fb6740:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6744:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6748:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb674c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb6750:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb6754:	1400000e	b	0xfffff7fb678c
   0x0000fffff7fb6758:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb675c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6760:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6764:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6768:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb676c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6770:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6774:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fb6778:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb677c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6780:	d63f0200	blr	x16
   0x0000fffff7fb6784:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6788:	5400a600	b.eq	0xfffff7fb7c48  // b.none
   0x0000fffff7fb678c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb6790:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6794:	540003a0	b.eq	0xfffff7fb6808  // b.none
   0x0000fffff7fb6798:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb679c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb67a0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb67a4:	36d801d1	tbz	w17, #27, 0xfffff7fb67dc
   0x0000fffff7fb67a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb67ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb67b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb67b4:	540002a1	b.ne	0xfffff7fb6808  // b.any
   0x0000fffff7fb67b8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb67bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb67c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb67c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb67c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb67cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb67d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb67d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb67d8:	54000189	b.ls	0xfffff7fb6808  // b.plast
   0x0000fffff7fb67dc:	36d8008d	tbz	w13, #27, 0xfffff7fb67ec
   0x0000fffff7fb67e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb67e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb67e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb67ec:	36d80091	tbz	w17, #27, 0xfffff7fb67fc
   0x0000fffff7fb67f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb67f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb67f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb67fc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb6800:	b900016d	str	w13, [x11]
   0x0000fffff7fb6804:	1400000e	b	0xfffff7fb683c
   0x0000fffff7fb6808:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb680c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6810:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6814:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6818:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb681c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6820:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6824:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fb6828:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb682c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6830:	d63f0200	blr	x16
   0x0000fffff7fb6834:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6838:	5400a0c0	b.eq	0xfffff7fb7c50  // b.none
   0x0000fffff7fb683c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb6840:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6844:	540004a0	b.eq	0xfffff7fb68d8  // b.none
   0x0000fffff7fb6848:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb684c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb6850:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb6854:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb6858:	54000400	b.eq	0xfffff7fb68d8  // b.none
   0x0000fffff7fb685c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb6860:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb6864:	36d801d1	tbz	w17, #27, 0xfffff7fb689c
   0x0000fffff7fb6868:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb686c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6870:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6874:	54000321	b.ne	0xfffff7fb68d8  // b.any
   0x0000fffff7fb6878:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb687c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6880:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6884:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6888:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb688c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6890:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6894:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6898:	54000209	b.ls	0xfffff7fb68d8  // b.plast
   0x0000fffff7fb689c:	36d8008d	tbz	w13, #27, 0xfffff7fb68ac
   0x0000fffff7fb68a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb68a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb68a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb68ac:	36d80091	tbz	w17, #27, 0xfffff7fb68bc
   0x0000fffff7fb68b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb68b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb68b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb68bc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb68c0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb68c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb68c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb68cc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb68d0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb68d4:	1400000e	b	0xfffff7fb690c
   0x0000fffff7fb68d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb68dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb68e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb68e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb68e8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb68ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fb68f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb68f4:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fb68f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb68fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6900:	d63f0200	blr	x16
   0x0000fffff7fb6904:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6908:	54009a80	b.eq	0xfffff7fb7c58  // b.none
   0x0000fffff7fb690c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6910:	37d806a9	tbnz	w9, #27, 0xfffff7fb69e4
   0x0000fffff7fb6914:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6918:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb691c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6920:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6924:	540001c1	b.ne	0xfffff7fb695c  // b.any
   0x0000fffff7fb6928:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb692c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6934:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6938:	54000121	b.ne	0xfffff7fb695c  // b.any
   0x0000fffff7fb693c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb6940:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb6944:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb6948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb694c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6950:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb6954:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb6958:	14000030	b	0xfffff7fb6a18
   0x0000fffff7fb695c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6960:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6968:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb696c:	54000120	b.eq	0xfffff7fb6990  // b.none
   0x0000fffff7fb6970:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6974:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb697c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6980:	54000321	b.ne	0xfffff7fb69e4  // b.any
   0x0000fffff7fb6984:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb6988:	9e620120	scvtf	d0, x9
   0x0000fffff7fb698c:	14000002	b	0xfffff7fb6994
   0x0000fffff7fb6990:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb6994:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6998:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb699c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb69a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb69a4:	54000120	b.eq	0xfffff7fb69c8  // b.none
   0x0000fffff7fb69a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb69ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb69b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb69b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb69b8:	54000161	b.ne	0xfffff7fb69e4  // b.any
   0x0000fffff7fb69bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb69c0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb69c4:	14000002	b	0xfffff7fb69cc
   0x0000fffff7fb69c8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb69cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb69d0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb69d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb69d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb69dc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb69e0:	17ffffde	b	0xfffff7fb6958
   0x0000fffff7fb69e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb69e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb69ec:	aa1303e1	mov	x1, x19
   0x0000fffff7fb69f0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb69f4:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb69f8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb69fc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6a00:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fb6a04:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6a08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6a0c:	d63f0200	blr	x16
   0x0000fffff7fb6a10:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6a14:	54009260	b.eq	0xfffff7fb7c60  // b.none
   0x0000fffff7fb6a18:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb6a1c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb6a20:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb6a24:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb6a28:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb6a2c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb6a30:	36d801d1	tbz	w17, #27, 0xfffff7fb6a68
   0x0000fffff7fb6a34:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6a38:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6a3c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6a40:	54000281	b.ne	0xfffff7fb6a90  // b.any
   0x0000fffff7fb6a44:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb6a48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6a4c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6a50:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6a54:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6a58:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6a5c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6a60:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6a64:	54000169	b.ls	0xfffff7fb6a90  // b.plast
   0x0000fffff7fb6a68:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6a6c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6a70:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6a74:	36d80091	tbz	w17, #27, 0xfffff7fb6a84
   0x0000fffff7fb6a78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6a7c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6a80:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6a84:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb6a88:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb6a8c:	1400000e	b	0xfffff7fb6ac4
   0x0000fffff7fb6a90:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6a94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6a98:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6a9c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6aa0:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb6aa4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6aa8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6aac:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fb6ab0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6ab4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6ab8:	d63f0200	blr	x16
   0x0000fffff7fb6abc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6ac0:	54008d40	b.eq	0xfffff7fb7c68  // b.none
   0x0000fffff7fb6ac4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb6ac8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6acc:	540003a0	b.eq	0xfffff7fb6b40  // b.none
   0x0000fffff7fb6ad0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb6ad4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb6ad8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb6adc:	36d801d1	tbz	w17, #27, 0xfffff7fb6b14
   0x0000fffff7fb6ae0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6ae4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6ae8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6aec:	540002a1	b.ne	0xfffff7fb6b40  // b.any
   0x0000fffff7fb6af0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb6af4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6af8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6afc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6b00:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6b04:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6b08:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6b0c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6b10:	54000189	b.ls	0xfffff7fb6b40  // b.plast
   0x0000fffff7fb6b14:	36d8008d	tbz	w13, #27, 0xfffff7fb6b24
   0x0000fffff7fb6b18:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6b1c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6b20:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6b24:	36d80091	tbz	w17, #27, 0xfffff7fb6b34
   0x0000fffff7fb6b28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6b2c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6b30:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6b34:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb6b38:	b900016d	str	w13, [x11]
   0x0000fffff7fb6b3c:	1400000e	b	0xfffff7fb6b74
   0x0000fffff7fb6b40:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb6b44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6b48:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6b4c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6b50:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb6b54:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6b58:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6b5c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fb6b60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6b64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6b68:	d63f0200	blr	x16
   0x0000fffff7fb6b6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6b70:	54008800	b.eq	0xfffff7fb7c70  // b.none
   0x0000fffff7fb6b74:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb6b78:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6b7c:	540004a0	b.eq	0xfffff7fb6c10  // b.none
   0x0000fffff7fb6b80:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb6b84:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb6b88:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb6b8c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb6b90:	54000400	b.eq	0xfffff7fb6c10  // b.none
   0x0000fffff7fb6b94:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb6b98:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb6b9c:	36d801d1	tbz	w17, #27, 0xfffff7fb6bd4
   0x0000fffff7fb6ba0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6ba4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6ba8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6bac:	54000321	b.ne	0xfffff7fb6c10  // b.any
   0x0000fffff7fb6bb0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb6bb4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6bb8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6bbc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6bc0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6bc4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6bc8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6bcc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6bd0:	54000209	b.ls	0xfffff7fb6c10  // b.plast
   0x0000fffff7fb6bd4:	36d8008d	tbz	w13, #27, 0xfffff7fb6be4
   0x0000fffff7fb6bd8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6bdc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6be0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6be4:	36d80091	tbz	w17, #27, 0xfffff7fb6bf4
   0x0000fffff7fb6be8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6bec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6bf0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6bf4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb6bf8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb6bfc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb6c00:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb6c04:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb6c08:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb6c0c:	1400000e	b	0xfffff7fb6c44
   0x0000fffff7fb6c10:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb6c14:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6c18:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6c1c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6c20:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb6c24:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6c28:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6c2c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fb6c30:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6c34:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6c38:	d63f0200	blr	x16
   0x0000fffff7fb6c3c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6c40:	540081c0	b.eq	0xfffff7fb7c78  // b.none
   0x0000fffff7fb6c44:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6c48:	37d806a9	tbnz	w9, #27, 0xfffff7fb6d1c
   0x0000fffff7fb6c4c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6c50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6c54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6c5c:	540001c1	b.ne	0xfffff7fb6c94  // b.any
   0x0000fffff7fb6c60:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6c64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6c68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6c70:	54000121	b.ne	0xfffff7fb6c94  // b.any
   0x0000fffff7fb6c74:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb6c78:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb6c7c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb6c80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6c84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6c88:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb6c8c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb6c90:	14000030	b	0xfffff7fb6d50
   0x0000fffff7fb6c94:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6c98:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6c9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6ca0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6ca4:	54000120	b.eq	0xfffff7fb6cc8  // b.none
   0x0000fffff7fb6ca8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6cac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6cb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6cb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6cb8:	54000321	b.ne	0xfffff7fb6d1c  // b.any
   0x0000fffff7fb6cbc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb6cc0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb6cc4:	14000002	b	0xfffff7fb6ccc
   0x0000fffff7fb6cc8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb6ccc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6cd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6cd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6cd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6cdc:	54000120	b.eq	0xfffff7fb6d00  // b.none
   0x0000fffff7fb6ce0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6ce4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6ce8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6cec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6cf0:	54000161	b.ne	0xfffff7fb6d1c  // b.any
   0x0000fffff7fb6cf4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb6cf8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb6cfc:	14000002	b	0xfffff7fb6d04
   0x0000fffff7fb6d00:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb6d04:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb6d08:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb6d0c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6d10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6d14:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb6d18:	17ffffde	b	0xfffff7fb6c90
   0x0000fffff7fb6d1c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6d20:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6d24:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6d28:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6d2c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb6d30:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6d34:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6d38:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fb6d3c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6d40:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6d44:	d63f0200	blr	x16
   0x0000fffff7fb6d48:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6d4c:	540079a0	b.eq	0xfffff7fb7c80  // b.none
   0x0000fffff7fb6d50:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb6d54:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb6d58:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb6d5c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb6d60:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb6d64:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb6d68:	36d801d1	tbz	w17, #27, 0xfffff7fb6da0
   0x0000fffff7fb6d6c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6d70:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6d74:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6d78:	54000281	b.ne	0xfffff7fb6dc8  // b.any
   0x0000fffff7fb6d7c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb6d80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6d84:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6d88:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6d8c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6d90:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6d94:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6d98:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6d9c:	54000169	b.ls	0xfffff7fb6dc8  // b.plast
   0x0000fffff7fb6da0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6da4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6da8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6dac:	36d80091	tbz	w17, #27, 0xfffff7fb6dbc
   0x0000fffff7fb6db0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6db4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6db8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6dbc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb6dc0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb6dc4:	1400000e	b	0xfffff7fb6dfc
   0x0000fffff7fb6dc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb6dcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6dd0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6dd4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6dd8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb6ddc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6de0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6de4:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fb6de8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6dec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6df0:	d63f0200	blr	x16
   0x0000fffff7fb6df4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6df8:	54007480	b.eq	0xfffff7fb7c88  // b.none
   0x0000fffff7fb6dfc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb6e00:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6e04:	540003a0	b.eq	0xfffff7fb6e78  // b.none
   0x0000fffff7fb6e08:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb6e0c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb6e10:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb6e14:	36d801d1	tbz	w17, #27, 0xfffff7fb6e4c
   0x0000fffff7fb6e18:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6e1c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6e20:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6e24:	540002a1	b.ne	0xfffff7fb6e78  // b.any
   0x0000fffff7fb6e28:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb6e2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6e30:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6e34:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6e38:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6e3c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6e40:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6e44:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6e48:	54000189	b.ls	0xfffff7fb6e78  // b.plast
   0x0000fffff7fb6e4c:	36d8008d	tbz	w13, #27, 0xfffff7fb6e5c
   0x0000fffff7fb6e50:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6e54:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6e58:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6e5c:	36d80091	tbz	w17, #27, 0xfffff7fb6e6c
   0x0000fffff7fb6e60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6e64:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6e68:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6e6c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb6e70:	b900016d	str	w13, [x11]
   0x0000fffff7fb6e74:	1400000e	b	0xfffff7fb6eac
   0x0000fffff7fb6e78:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb6e7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6e80:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6e84:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6e88:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb6e8c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6e90:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6e94:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fb6e98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb6e9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6ea0:	d63f0200	blr	x16
   0x0000fffff7fb6ea4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6ea8:	54006f40	b.eq	0xfffff7fb7c90  // b.none
   0x0000fffff7fb6eac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb6eb0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb6eb4:	540004a0	b.eq	0xfffff7fb6f48  // b.none
   0x0000fffff7fb6eb8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb6ebc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb6ec0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb6ec4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb6ec8:	54000400	b.eq	0xfffff7fb6f48  // b.none
   0x0000fffff7fb6ecc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb6ed0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb6ed4:	36d801d1	tbz	w17, #27, 0xfffff7fb6f0c
   0x0000fffff7fb6ed8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb6edc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb6ee0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb6ee4:	54000321	b.ne	0xfffff7fb6f48  // b.any
   0x0000fffff7fb6ee8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb6eec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6ef0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb6ef4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb6ef8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb6efc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb6f00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb6f04:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb6f08:	54000209	b.ls	0xfffff7fb6f48  // b.plast
   0x0000fffff7fb6f0c:	36d8008d	tbz	w13, #27, 0xfffff7fb6f1c
   0x0000fffff7fb6f10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb6f14:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb6f18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb6f1c:	36d80091	tbz	w17, #27, 0xfffff7fb6f2c
   0x0000fffff7fb6f20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb6f24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb6f28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb6f2c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb6f30:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb6f34:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb6f38:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb6f3c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb6f40:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb6f44:	1400000e	b	0xfffff7fb6f7c
   0x0000fffff7fb6f48:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb6f4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb6f50:	aa1303e1	mov	x1, x19
   0x0000fffff7fb6f54:	aa1503e2	mov	x2, x21
   0x0000fffff7fb6f58:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb6f5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb6f60:	aa1603e5	mov	x5, x22
   0x0000fffff7fb6f64:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fb6f68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb6f6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb6f70:	d63f0200	blr	x16
   0x0000fffff7fb6f74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb6f78:	54006900	b.eq	0xfffff7fb7c98  // b.none
   0x0000fffff7fb6f7c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6f80:	37d806a9	tbnz	w9, #27, 0xfffff7fb7054
   0x0000fffff7fb6f84:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6f88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6f8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6f90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6f94:	540001c1	b.ne	0xfffff7fb6fcc  // b.any
   0x0000fffff7fb6f98:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb6f9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6fa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6fa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6fa8:	54000121	b.ne	0xfffff7fb6fcc  // b.any
   0x0000fffff7fb6fac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb6fb0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb6fb4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb6fb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6fbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6fc0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb6fc4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb6fc8:	14000030	b	0xfffff7fb7088
   0x0000fffff7fb6fcc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6fd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb6fd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6fd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6fdc:	54000120	b.eq	0xfffff7fb7000  // b.none
   0x0000fffff7fb6fe0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb6fe4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb6fe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb6fec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb6ff0:	54000321	b.ne	0xfffff7fb7054  // b.any
   0x0000fffff7fb6ff4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb6ff8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb6ffc:	14000002	b	0xfffff7fb7004
   0x0000fffff7fb7000:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb7004:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7008:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb700c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7010:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7014:	54000120	b.eq	0xfffff7fb7038  // b.none
   0x0000fffff7fb7018:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb701c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7020:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7024:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7028:	54000161	b.ne	0xfffff7fb7054  // b.any
   0x0000fffff7fb702c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7030:	9e620121	scvtf	d1, x9
   0x0000fffff7fb7034:	14000002	b	0xfffff7fb703c
   0x0000fffff7fb7038:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb703c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb7040:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb7044:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb704c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb7050:	17ffffde	b	0xfffff7fb6fc8
   0x0000fffff7fb7054:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7058:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb705c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7060:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7064:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb7068:	aa1403e4	mov	x4, x20
   0x0000fffff7fb706c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7070:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fb7074:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7078:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb707c:	d63f0200	blr	x16
   0x0000fffff7fb7080:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7084:	540060e0	b.eq	0xfffff7fb7ca0  // b.none
   0x0000fffff7fb7088:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb708c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb7090:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb7094:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb7098:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb709c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb70a0:	36d801d1	tbz	w17, #27, 0xfffff7fb70d8
   0x0000fffff7fb70a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb70a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb70ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb70b0:	54000281	b.ne	0xfffff7fb7100  // b.any
   0x0000fffff7fb70b4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb70b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb70bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb70c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb70c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb70c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb70cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb70d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb70d4:	54000169	b.ls	0xfffff7fb7100  // b.plast
   0x0000fffff7fb70d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb70dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb70e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb70e4:	36d80091	tbz	w17, #27, 0xfffff7fb70f4
   0x0000fffff7fb70e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb70ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb70f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb70f4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb70f8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb70fc:	1400000e	b	0xfffff7fb7134
   0x0000fffff7fb7100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7108:	aa1303e1	mov	x1, x19
   0x0000fffff7fb710c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7110:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb7114:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7118:	aa1603e5	mov	x5, x22
   0x0000fffff7fb711c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fb7120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7128:	d63f0200	blr	x16
   0x0000fffff7fb712c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7130:	54005bc0	b.eq	0xfffff7fb7ca8  // b.none
   0x0000fffff7fb7134:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb7138:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb713c:	540003a0	b.eq	0xfffff7fb71b0  // b.none
   0x0000fffff7fb7140:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb7144:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb7148:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb714c:	36d801d1	tbz	w17, #27, 0xfffff7fb7184
   0x0000fffff7fb7150:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb7154:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7158:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb715c:	540002a1	b.ne	0xfffff7fb71b0  // b.any
   0x0000fffff7fb7160:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb7164:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7168:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb716c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7170:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7174:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb7178:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb717c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7180:	54000189	b.ls	0xfffff7fb71b0  // b.plast
   0x0000fffff7fb7184:	36d8008d	tbz	w13, #27, 0xfffff7fb7194
   0x0000fffff7fb7188:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb718c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7190:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7194:	36d80091	tbz	w17, #27, 0xfffff7fb71a4
   0x0000fffff7fb7198:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb719c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb71a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb71a4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb71a8:	b900016d	str	w13, [x11]
   0x0000fffff7fb71ac:	1400000e	b	0xfffff7fb71e4
   0x0000fffff7fb71b0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb71b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb71b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb71bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb71c0:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb71c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb71c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb71cc:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fb71d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb71d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb71d8:	d63f0200	blr	x16
   0x0000fffff7fb71dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb71e0:	54005680	b.eq	0xfffff7fb7cb0  // b.none
   0x0000fffff7fb71e4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb71e8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb71ec:	540004a0	b.eq	0xfffff7fb7280  // b.none
   0x0000fffff7fb71f0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb71f4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb71f8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb71fc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb7200:	54000400	b.eq	0xfffff7fb7280  // b.none
   0x0000fffff7fb7204:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb7208:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb720c:	36d801d1	tbz	w17, #27, 0xfffff7fb7244
   0x0000fffff7fb7210:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb7214:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7218:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb721c:	54000321	b.ne	0xfffff7fb7280  // b.any
   0x0000fffff7fb7220:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb7224:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7228:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb722c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7230:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7234:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb7238:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb723c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7240:	54000209	b.ls	0xfffff7fb7280  // b.plast
   0x0000fffff7fb7244:	36d8008d	tbz	w13, #27, 0xfffff7fb7254
   0x0000fffff7fb7248:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb724c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7250:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7254:	36d80091	tbz	w17, #27, 0xfffff7fb7264
   0x0000fffff7fb7258:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb725c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7260:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb7264:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb7268:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb726c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb7270:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb7274:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb7278:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb727c:	1400000e	b	0xfffff7fb72b4
   0x0000fffff7fb7280:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb7284:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7288:	aa1303e1	mov	x1, x19
   0x0000fffff7fb728c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7290:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb7294:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7298:	aa1603e5	mov	x5, x22
   0x0000fffff7fb729c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fb72a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb72a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb72a8:	d63f0200	blr	x16
   0x0000fffff7fb72ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb72b0:	54005040	b.eq	0xfffff7fb7cb8  // b.none
   0x0000fffff7fb72b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb72b8:	37d806a9	tbnz	w9, #27, 0xfffff7fb738c
   0x0000fffff7fb72bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb72c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb72c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb72c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb72cc:	540001c1	b.ne	0xfffff7fb7304  // b.any
   0x0000fffff7fb72d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb72d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb72d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb72dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb72e0:	54000121	b.ne	0xfffff7fb7304  // b.any
   0x0000fffff7fb72e4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb72e8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb72ec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb72f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb72f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb72f8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb72fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb7300:	14000030	b	0xfffff7fb73c0
   0x0000fffff7fb7304:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb7308:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb730c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7310:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7314:	54000120	b.eq	0xfffff7fb7338  // b.none
   0x0000fffff7fb7318:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb731c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7324:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7328:	54000321	b.ne	0xfffff7fb738c  // b.any
   0x0000fffff7fb732c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb7330:	9e620120	scvtf	d0, x9
   0x0000fffff7fb7334:	14000002	b	0xfffff7fb733c
   0x0000fffff7fb7338:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb733c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7340:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7344:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7348:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb734c:	54000120	b.eq	0xfffff7fb7370  // b.none
   0x0000fffff7fb7350:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7354:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb735c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7360:	54000161	b.ne	0xfffff7fb738c  // b.any
   0x0000fffff7fb7364:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb7368:	9e620121	scvtf	d1, x9
   0x0000fffff7fb736c:	14000002	b	0xfffff7fb7374
   0x0000fffff7fb7370:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb7374:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb7378:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb737c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7380:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7384:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb7388:	17ffffde	b	0xfffff7fb7300
   0x0000fffff7fb738c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7390:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7394:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7398:	aa1503e2	mov	x2, x21
   0x0000fffff7fb739c:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb73a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb73a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb73a8:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fb73ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb73b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb73b4:	d63f0200	blr	x16
   0x0000fffff7fb73b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb73bc:	54004820	b.eq	0xfffff7fb7cc0  // b.none
   0x0000fffff7fb73c0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb73c4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb73c8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb73cc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb73d0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb73d4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb73d8:	36d801d1	tbz	w17, #27, 0xfffff7fb7410
   0x0000fffff7fb73dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb73e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb73e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb73e8:	54000281	b.ne	0xfffff7fb7438  // b.any
   0x0000fffff7fb73ec:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb73f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb73f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb73f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb73fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7400:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb7404:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb7408:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb740c:	54000169	b.ls	0xfffff7fb7438  // b.plast
   0x0000fffff7fb7410:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb7414:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7418:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb741c:	36d80091	tbz	w17, #27, 0xfffff7fb742c
   0x0000fffff7fb7420:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7424:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7428:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb742c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb7430:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb7434:	1400000e	b	0xfffff7fb746c
   0x0000fffff7fb7438:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb743c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7440:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7444:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7448:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb744c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7450:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7454:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fb7458:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb745c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7460:	d63f0200	blr	x16
   0x0000fffff7fb7464:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7468:	54004300	b.eq	0xfffff7fb7cc8  // b.none
   0x0000fffff7fb746c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb7470:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb7474:	540003a0	b.eq	0xfffff7fb74e8  // b.none
   0x0000fffff7fb7478:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb747c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb7480:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb7484:	36d801d1	tbz	w17, #27, 0xfffff7fb74bc
   0x0000fffff7fb7488:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb748c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7490:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb7494:	540002a1	b.ne	0xfffff7fb74e8  // b.any
   0x0000fffff7fb7498:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb749c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb74a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb74a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb74a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb74ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb74b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb74b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb74b8:	54000189	b.ls	0xfffff7fb74e8  // b.plast
   0x0000fffff7fb74bc:	36d8008d	tbz	w13, #27, 0xfffff7fb74cc
   0x0000fffff7fb74c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb74c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb74c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb74cc:	36d80091	tbz	w17, #27, 0xfffff7fb74dc
   0x0000fffff7fb74d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb74d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb74d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb74dc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb74e0:	b900016d	str	w13, [x11]
   0x0000fffff7fb74e4:	1400000e	b	0xfffff7fb751c
   0x0000fffff7fb74e8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb74ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb74f0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb74f4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb74f8:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb74fc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7500:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7504:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fb7508:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb750c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7510:	d63f0200	blr	x16
   0x0000fffff7fb7514:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7518:	54003dc0	b.eq	0xfffff7fb7cd0  // b.none
   0x0000fffff7fb751c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb7520:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb7524:	540004a0	b.eq	0xfffff7fb75b8  // b.none
   0x0000fffff7fb7528:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb752c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb7530:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb7534:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb7538:	54000400	b.eq	0xfffff7fb75b8  // b.none
   0x0000fffff7fb753c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb7540:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb7544:	36d801d1	tbz	w17, #27, 0xfffff7fb757c
   0x0000fffff7fb7548:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb754c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7550:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb7554:	54000321	b.ne	0xfffff7fb75b8  // b.any
   0x0000fffff7fb7558:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb755c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7560:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb7564:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7568:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb756c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb7570:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb7574:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7578:	54000209	b.ls	0xfffff7fb75b8  // b.plast
   0x0000fffff7fb757c:	36d8008d	tbz	w13, #27, 0xfffff7fb758c
   0x0000fffff7fb7580:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb7584:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7588:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb758c:	36d80091	tbz	w17, #27, 0xfffff7fb759c
   0x0000fffff7fb7590:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7594:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7598:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb759c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb75a0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb75a4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb75a8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb75ac:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb75b0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb75b4:	1400000e	b	0xfffff7fb75ec
   0x0000fffff7fb75b8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb75bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb75c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb75c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb75c8:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb75cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb75d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb75d4:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fb75d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb75dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb75e0:	d63f0200	blr	x16
   0x0000fffff7fb75e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb75e8:	54003780	b.eq	0xfffff7fb7cd8  // b.none
   0x0000fffff7fb75ec:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb75f0:	37d806a9	tbnz	w9, #27, 0xfffff7fb76c4
   0x0000fffff7fb75f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb75f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb75fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7600:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7604:	540001c1	b.ne	0xfffff7fb763c  // b.any
   0x0000fffff7fb7608:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb760c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7610:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7614:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7618:	54000121	b.ne	0xfffff7fb763c  // b.any
   0x0000fffff7fb761c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb7620:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb7624:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb7628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb762c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7630:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb7634:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb7638:	14000030	b	0xfffff7fb76f8
   0x0000fffff7fb763c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb7640:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb7644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7648:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb764c:	54000120	b.eq	0xfffff7fb7670  // b.none
   0x0000fffff7fb7650:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb7654:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7658:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb765c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7660:	54000321	b.ne	0xfffff7fb76c4  // b.any
   0x0000fffff7fb7664:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb7668:	9e620120	scvtf	d0, x9
   0x0000fffff7fb766c:	14000002	b	0xfffff7fb7674
   0x0000fffff7fb7670:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb7674:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7678:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb767c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7680:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7684:	54000120	b.eq	0xfffff7fb76a8  // b.none
   0x0000fffff7fb7688:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb768c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7694:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7698:	54000161	b.ne	0xfffff7fb76c4  // b.any
   0x0000fffff7fb769c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb76a0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb76a4:	14000002	b	0xfffff7fb76ac
   0x0000fffff7fb76a8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb76ac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb76b0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb76b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb76b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb76bc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb76c0:	17ffffde	b	0xfffff7fb7638
   0x0000fffff7fb76c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb76c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb76cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb76d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb76d4:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb76d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb76dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb76e0:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fb76e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb76e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb76ec:	d63f0200	blr	x16
   0x0000fffff7fb76f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb76f4:	54002f60	b.eq	0xfffff7fb7ce0  // b.none
   0x0000fffff7fb76f8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb76fc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb7700:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb7704:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb7708:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb770c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb7710:	36d801d1	tbz	w17, #27, 0xfffff7fb7748
   0x0000fffff7fb7714:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb7718:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb771c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb7720:	54000281	b.ne	0xfffff7fb7770  // b.any
   0x0000fffff7fb7724:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb7728:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb772c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb7730:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7734:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7738:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb773c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb7740:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7744:	54000169	b.ls	0xfffff7fb7770  // b.plast
   0x0000fffff7fb7748:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb774c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7750:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7754:	36d80091	tbz	w17, #27, 0xfffff7fb7764
   0x0000fffff7fb7758:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb775c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7760:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb7764:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb7768:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb776c:	1400000e	b	0xfffff7fb77a4
   0x0000fffff7fb7770:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7774:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7778:	aa1303e1	mov	x1, x19
   0x0000fffff7fb777c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7780:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb7784:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7788:	aa1603e5	mov	x5, x22
   0x0000fffff7fb778c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fb7790:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7794:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7798:	d63f0200	blr	x16
   0x0000fffff7fb779c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb77a0:	54002a40	b.eq	0xfffff7fb7ce8  // b.none
   0x0000fffff7fb77a4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb77a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb77ac:	540003a0	b.eq	0xfffff7fb7820  // b.none
   0x0000fffff7fb77b0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb77b4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb77b8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb77bc:	36d801d1	tbz	w17, #27, 0xfffff7fb77f4
   0x0000fffff7fb77c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb77c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb77c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb77cc:	540002a1	b.ne	0xfffff7fb7820  // b.any
   0x0000fffff7fb77d0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb77d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb77d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb77dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb77e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb77e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb77e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb77ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb77f0:	54000189	b.ls	0xfffff7fb7820  // b.plast
   0x0000fffff7fb77f4:	36d8008d	tbz	w13, #27, 0xfffff7fb7804
   0x0000fffff7fb77f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb77fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7800:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7804:	36d80091	tbz	w17, #27, 0xfffff7fb7814
   0x0000fffff7fb7808:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb780c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7810:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb7814:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb7818:	b900016d	str	w13, [x11]
   0x0000fffff7fb781c:	1400000e	b	0xfffff7fb7854
   0x0000fffff7fb7820:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb7824:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7828:	aa1303e1	mov	x1, x19
   0x0000fffff7fb782c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7830:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb7834:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7838:	aa1603e5	mov	x5, x22
   0x0000fffff7fb783c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fb7840:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7844:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7848:	d63f0200	blr	x16
   0x0000fffff7fb784c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7850:	54002500	b.eq	0xfffff7fb7cf0  // b.none
   0x0000fffff7fb7854:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb7858:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb785c:	540004a0	b.eq	0xfffff7fb78f0  // b.none
   0x0000fffff7fb7860:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb7864:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb7868:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb786c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb7870:	54000400	b.eq	0xfffff7fb78f0  // b.none
   0x0000fffff7fb7874:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb7878:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb787c:	36d801d1	tbz	w17, #27, 0xfffff7fb78b4
   0x0000fffff7fb7880:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb7884:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7888:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb788c:	54000321	b.ne	0xfffff7fb78f0  // b.any
   0x0000fffff7fb7890:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb7894:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7898:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb789c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb78a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb78a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb78a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb78ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb78b0:	54000209	b.ls	0xfffff7fb78f0  // b.plast
   0x0000fffff7fb78b4:	36d8008d	tbz	w13, #27, 0xfffff7fb78c4
   0x0000fffff7fb78b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb78bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb78c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb78c4:	36d80091	tbz	w17, #27, 0xfffff7fb78d4
   0x0000fffff7fb78c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb78cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb78d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb78d4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb78d8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb78dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb78e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb78e4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb78e8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb78ec:	1400000e	b	0xfffff7fb7924
   0x0000fffff7fb78f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb78f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb78f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb78fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7900:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb7904:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7908:	aa1603e5	mov	x5, x22
   0x0000fffff7fb790c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fb7910:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb7914:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7918:	d63f0200	blr	x16
   0x0000fffff7fb791c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7920:	54001ec0	b.eq	0xfffff7fb7cf8  // b.none
   0x0000fffff7fb7924:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb7928:	37d806a9	tbnz	w9, #27, 0xfffff7fb79fc
   0x0000fffff7fb792c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb7930:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7938:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb793c:	540001c1	b.ne	0xfffff7fb7974  // b.any
   0x0000fffff7fb7940:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb7944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb794c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7950:	54000121	b.ne	0xfffff7fb7974  // b.any
   0x0000fffff7fb7954:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb7958:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb795c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb7960:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7964:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7968:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb796c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb7970:	14000030	b	0xfffff7fb7a30
   0x0000fffff7fb7974:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb7978:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb797c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7980:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7984:	54000120	b.eq	0xfffff7fb79a8  // b.none
   0x0000fffff7fb7988:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb798c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7994:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb7998:	54000321	b.ne	0xfffff7fb79fc  // b.any
   0x0000fffff7fb799c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb79a0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb79a4:	14000002	b	0xfffff7fb79ac
   0x0000fffff7fb79a8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb79ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb79b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb79b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb79b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb79bc:	54000120	b.eq	0xfffff7fb79e0  // b.none
   0x0000fffff7fb79c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb79c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb79c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb79cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb79d0:	54000161	b.ne	0xfffff7fb79fc  // b.any
   0x0000fffff7fb79d4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb79d8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb79dc:	14000002	b	0xfffff7fb79e4
   0x0000fffff7fb79e0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb79e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb79e8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb79ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb79f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb79f4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb79f8:	17ffffde	b	0xfffff7fb7970
   0x0000fffff7fb79fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7a00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7a04:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7a08:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7a0c:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb7a10:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7a14:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7a18:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fb7a1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7a20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7a24:	d63f0200	blr	x16
   0x0000fffff7fb7a28:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7a2c:	540016a0	b.eq	0xfffff7fb7d00  // b.none
   0x0000fffff7fb7a30:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb7a34:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb7a38:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb7a3c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb7a40:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb7a44:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb7a48:	36d801d1	tbz	w17, #27, 0xfffff7fb7a80
   0x0000fffff7fb7a4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb7a50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7a54:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb7a58:	54000281	b.ne	0xfffff7fb7aa8  // b.any
   0x0000fffff7fb7a5c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb7a60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7a64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb7a68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7a6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7a70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb7a74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb7a78:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7a7c:	54000169	b.ls	0xfffff7fb7aa8  // b.plast
   0x0000fffff7fb7a80:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb7a84:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7a88:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7a8c:	36d80091	tbz	w17, #27, 0xfffff7fb7a9c
   0x0000fffff7fb7a90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7a94:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7a98:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb7a9c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb7aa0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb7aa4:	1400000e	b	0xfffff7fb7adc
   0x0000fffff7fb7aa8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7aac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7ab0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7ab4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7ab8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb7abc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7ac0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7ac4:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fb7ac8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7acc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7ad0:	d63f0200	blr	x16
   0x0000fffff7fb7ad4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7ad8:	54001180	b.eq	0xfffff7fb7d08  // b.none
   0x0000fffff7fb7adc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb7ae0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb7ae4:	540003a0	b.eq	0xfffff7fb7b58  // b.none
   0x0000fffff7fb7ae8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb7aec:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb7af0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb7af4:	36d801d1	tbz	w17, #27, 0xfffff7fb7b2c
   0x0000fffff7fb7af8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb7afc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb7b00:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb7b04:	540002a1	b.ne	0xfffff7fb7b58  // b.any
   0x0000fffff7fb7b08:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb7b0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7b10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb7b14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb7b18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb7b1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb7b20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb7b24:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb7b28:	54000189	b.ls	0xfffff7fb7b58  // b.plast
   0x0000fffff7fb7b2c:	36d8008d	tbz	w13, #27, 0xfffff7fb7b3c
   0x0000fffff7fb7b30:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb7b34:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb7b38:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb7b3c:	36d80091	tbz	w17, #27, 0xfffff7fb7b4c
   0x0000fffff7fb7b40:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb7b44:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb7b48:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb7b4c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb7b50:	b900016d	str	w13, [x11]
   0x0000fffff7fb7b54:	1400000e	b	0xfffff7fb7b8c
   0x0000fffff7fb7b58:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb7b5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7b60:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7b64:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7b68:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb7b6c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7b70:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7b74:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fb7b78:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb7b7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7b80:	d63f0200	blr	x16
   0x0000fffff7fb7b84:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb7b88:	54000c40	b.eq	0xfffff7fb7d10  // b.none
   0x0000fffff7fb7b8c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb7b90:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb7b94:	aa1303e1	mov	x1, x19
   0x0000fffff7fb7b98:	aa1503e2	mov	x2, x21
   0x0000fffff7fb7b9c:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fb7ba0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb7ba4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb7ba8:	d286ae90	mov	x16, #0x3574                	// #13684
   0x0000fffff7fb7bac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb7bb0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb7bb4:	d63f0200	blr	x16
   0x0000fffff7fb7bb8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb7bbc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb7bc0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb7bc4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb7bc8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb7bcc:	d65f03c0	ret
   0x0000fffff7fb7bd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb7bd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb7bd8:	b900028a	str	w10, [x20]
   0x0000fffff7fb7bdc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb7be0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb7be4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb7be8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb7bec:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb7bf0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb7bf4:	d65f03c0	ret
   0x0000fffff7fb7bf8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb7bfc:	17fffff5	b	0xfffff7fb7bd0
   0x0000fffff7fb7c00:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb7c04:	17fffff3	b	0xfffff7fb7bd0
   0x0000fffff7fb7c08:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb7c0c:	17fffff1	b	0xfffff7fb7bd0
   0x0000fffff7fb7c10:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb7c14:	17ffffef	b	0xfffff7fb7bd0
   0x0000fffff7fb7c18:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb7c1c:	17ffffed	b	0xfffff7fb7bd0
   0x0000fffff7fb7c20:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb7c24:	17ffffeb	b	0xfffff7fb7bd0
   0x0000fffff7fb7c28:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb7c2c:	17ffffe9	b	0xfffff7fb7bd0
   0x0000fffff7fb7c30:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb7c34:	17ffffe7	b	0xfffff7fb7bd0
   0x0000fffff7fb7c38:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb7c3c:	17ffffe5	b	0xfffff7fb7bd0
   0x0000fffff7fb7c40:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb7c44:	17ffffe3	b	0xfffff7fb7bd0
   0x0000fffff7fb7c48:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb7c4c:	17ffffe1	b	0xfffff7fb7bd0
   0x0000fffff7fb7c50:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb7c54:	17ffffdf	b	0xfffff7fb7bd0
   0x0000fffff7fb7c58:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb7c5c:	17ffffdd	b	0xfffff7fb7bd0
   0x0000fffff7fb7c60:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb7c64:	17ffffdb	b	0xfffff7fb7bd0
   0x0000fffff7fb7c68:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb7c6c:	17ffffd9	b	0xfffff7fb7bd0
   0x0000fffff7fb7c70:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb7c74:	17ffffd7	b	0xfffff7fb7bd0
   0x0000fffff7fb7c78:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb7c7c:	17ffffd5	b	0xfffff7fb7bd0
   0x0000fffff7fb7c80:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb7c84:	17ffffd3	b	0xfffff7fb7bd0
   0x0000fffff7fb7c88:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb7c8c:	17ffffd1	b	0xfffff7fb7bd0
   0x0000fffff7fb7c90:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb7c94:	17ffffcf	b	0xfffff7fb7bd0
   0x0000fffff7fb7c98:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb7c9c:	17ffffcd	b	0xfffff7fb7bd0
   0x0000fffff7fb7ca0:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb7ca4:	17ffffcb	b	0xfffff7fb7bd0
   0x0000fffff7fb7ca8:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb7cac:	17ffffc9	b	0xfffff7fb7bd0
   0x0000fffff7fb7cb0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb7cb4:	17ffffc7	b	0xfffff7fb7bd0
   0x0000fffff7fb7cb8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb7cbc:	17ffffc5	b	0xfffff7fb7bd0
   0x0000fffff7fb7cc0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb7cc4:	17ffffc3	b	0xfffff7fb7bd0
   0x0000fffff7fb7cc8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb7ccc:	17ffffc1	b	0xfffff7fb7bd0
   0x0000fffff7fb7cd0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb7cd4:	17ffffbf	b	0xfffff7fb7bd0
   0x0000fffff7fb7cd8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb7cdc:	17ffffbd	b	0xfffff7fb7bd0
   0x0000fffff7fb7ce0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb7ce4:	17ffffbb	b	0xfffff7fb7bd0
   0x0000fffff7fb7ce8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb7cec:	17ffffb9	b	0xfffff7fb7bd0
   0x0000fffff7fb7cf0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb7cf4:	17ffffb7	b	0xfffff7fb7bd0
   0x0000fffff7fb7cf8:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb7cfc:	17ffffb5	b	0xfffff7fb7bd0
   0x0000fffff7fb7d00:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb7d04:	17ffffb3	b	0xfffff7fb7bd0
   0x0000fffff7fb7d08:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb7d0c:	17ffffb1	b	0xfffff7fb7bd0
   0x0000fffff7fb7d10:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fb7d14:	17ffffaf	b	0xfffff7fb7bd0
   0x0000fffff7fb7d18:	00000000	udf	#0
   0x0000fffff7fb7d1c:	00000000	udf	#0
   0x0000fffff7fb7d20:	00000000	udf	#0
   0x0000fffff7fb7d24:	00000000	udf	#0
   0x0000fffff7fb7d28:	00000000	udf	#0
   0x0000fffff7fb7d2c:	00000000	udf	#0
   0x0000fffff7fb7d30:	00000000	udf	#0
   0x0000fffff7fb7d34:	00000000	udf	#0
   0x0000fffff7fb7d38:	00000000	udf	#0
   0x0000fffff7fb7d3c:	00000000	udf	#0
   0x0000fffff7fb7d40:	00000000	udf	#0
   0x0000fffff7fb7d44:	00000000	udf	#0
   0x0000fffff7fb7d48:	00000000	udf	#0
   0x0000fffff7fb7d4c:	00000000	udf	#0
   0x0000fffff7fb7d50:	00000000	udf	#0
   0x0000fffff7fb7d54:	00000000	udf	#0
   0x0000fffff7fb7d58:	00000000	udf	#0
   0x0000fffff7fb7d5c:	00000000	udf	#0
   0x0000fffff7fb7d60:	00000000	udf	#0
   0x0000fffff7fb7d64:	00000000	udf	#0
   0x0000fffff7fb7d68:	00000000	udf	#0
   0x0000fffff7fb7d6c:	00000000	udf	#0
   0x0000fffff7fb7d70:	00000000	udf	#0
   0x0000fffff7fb7d74:	00000000	udf	#0
   0x0000fffff7fb7d78:	00000000	udf	#0
   0x0000fffff7fb7d7c:	00000000	udf	#0
   0x0000fffff7fb7d80:	00000000	udf	#0
   0x0000fffff7fb7d84:	00000000	udf	#0
   0x0000fffff7fb7d88:	00000000	udf	#0
   0x0000fffff7fb7d8c:	00000000	udf	#0
   0x0000fffff7fb7d90:	00000000	udf	#0
   0x0000fffff7fb7d94:	00000000	udf	#0
   0x0000fffff7fb7d98:	00000000	udf	#0
   0x0000fffff7fb7d9c:	00000000	udf	#0
   0x0000fffff7fb7da0:	00000000	udf	#0
   0x0000fffff7fb7da4:	00000000	udf	#0
   0x0000fffff7fb7da8:	00000000	udf	#0
   0x0000fffff7fb7dac:	00000000	udf	#0
   0x0000fffff7fb7db0:	00000000	udf	#0
   0x0000fffff7fb7db4:	00000000	udf	#0
   0x0000fffff7fb7db8:	00000000	udf	#0
   0x0000fffff7fb7dbc:	00000000	udf	#0
   0x0000fffff7fb7dc0:	00000000	udf	#0
   0x0000fffff7fb7dc4:	00000000	udf	#0
   0x0000fffff7fb7dc8:	00000000	udf	#0
   0x0000fffff7fb7dcc:	00000000	udf	#0
   0x0000fffff7fb7dd0:	00000000	udf	#0
   0x0000fffff7fb7dd4:	00000000	udf	#0
   0x0000fffff7fb7dd8:	00000000	udf	#0
   0x0000fffff7fb7ddc:	00000000	udf	#0
   0x0000fffff7fb7de0:	00000000	udf	#0
   0x0000fffff7fb7de4:	00000000	udf	#0
   0x0000fffff7fb7de8:	00000000	udf	#0
   0x0000fffff7fb7dec:	00000000	udf	#0
   0x0000fffff7fb7df0:	00000000	udf	#0
   0x0000fffff7fb7df4:	00000000	udf	#0
   0x0000fffff7fb7df8:	00000000	udf	#0
   0x0000fffff7fb7dfc:	00000000	udf	#0
   0x0000fffff7fb7e00:	00000000	udf	#0
   0x0000fffff7fb7e04:	00000000	udf	#0
   0x0000fffff7fb7e08:	00000000	udf	#0
   0x0000fffff7fb7e0c:	00000000	udf	#0
   0x0000fffff7fb7e10:	00000000	udf	#0
   0x0000fffff7fb7e14:	00000000	udf	#0
   0x0000fffff7fb7e18:	00000000	udf	#0
   0x0000fffff7fb7e1c:	00000000	udf	#0
   0x0000fffff7fb7e20:	00000000	udf	#0
   0x0000fffff7fb7e24:	00000000	udf	#0
   0x0000fffff7fb7e28:	00000000	udf	#0
   0x0000fffff7fb7e2c:	00000000	udf	#0
   0x0000fffff7fb7e30:	00000000	udf	#0
   0x0000fffff7fb7e34:	00000000	udf	#0
   0x0000fffff7fb7e38:	00000000	udf	#0
   0x0000fffff7fb7e3c:	00000000	udf	#0
   0x0000fffff7fb7e40:	00000000	udf	#0
   0x0000fffff7fb7e44:	00000000	udf	#0
   0x0000fffff7fb7e48:	00000000	udf	#0
   0x0000fffff7fb7e4c:	00000000	udf	#0
   0x0000fffff7fb7e50:	00000000	udf	#0
   0x0000fffff7fb7e54:	00000000	udf	#0
   0x0000fffff7fb7e58:	00000000	udf	#0
   0x0000fffff7fb7e5c:	00000000	udf	#0
   0x0000fffff7fb7e60:	00000000	udf	#0
   0x0000fffff7fb7e64:	00000000	udf	#0
   0x0000fffff7fb7e68:	00000000	udf	#0
   0x0000fffff7fb7e6c:	00000000	udf	#0
   0x0000fffff7fb7e70:	00000000	udf	#0
   0x0000fffff7fb7e74:	00000000	udf	#0
   0x0000fffff7fb7e78:	00000000	udf	#0
   0x0000fffff7fb7e7c:	00000000	udf	#0
   0x0000fffff7fb7e80:	00000000	udf	#0
   0x0000fffff7fb7e84:	00000000	udf	#0
   0x0000fffff7fb7e88:	00000000	udf	#0
   0x0000fffff7fb7e8c:	00000000	udf	#0
   0x0000fffff7fb7e90:	00000000	udf	#0
   0x0000fffff7fb7e94:	00000000	udf	#0
   0x0000fffff7fb7e98:	00000000	udf	#0
   0x0000fffff7fb7e9c:	00000000	udf	#0
   0x0000fffff7fb7ea0:	00000000	udf	#0
   0x0000fffff7fb7ea4:	00000000	udf	#0
   0x0000fffff7fb7ea8:	00000000	udf	#0
   0x0000fffff7fb7eac:	00000000	udf	#0
   0x0000fffff7fb7eb0:	00000000	udf	#0
   0x0000fffff7fb7eb4:	00000000	udf	#0
   0x0000fffff7fb7eb8:	00000000	udf	#0
   0x0000fffff7fb7ebc:	00000000	udf	#0
   0x0000fffff7fb7ec0:	00000000	udf	#0
   0x0000fffff7fb7ec4:	00000000	udf	#0
   0x0000fffff7fb7ec8:	00000000	udf	#0
   0x0000fffff7fb7ecc:	00000000	udf	#0
   0x0000fffff7fb7ed0:	00000000	udf	#0
   0x0000fffff7fb7ed4:	00000000	udf	#0
   0x0000fffff7fb7ed8:	00000000	udf	#0
   0x0000fffff7fb7edc:	00000000	udf	#0
   0x0000fffff7fb7ee0:	00000000	udf	#0
   0x0000fffff7fb7ee4:	00000000	udf	#0
   0x0000fffff7fb7ee8:	00000000	udf	#0
   0x0000fffff7fb7eec:	00000000	udf	#0
   0x0000fffff7fb7ef0:	00000000	udf	#0
   0x0000fffff7fb7ef4:	00000000	udf	#0
   0x0000fffff7fb7ef8:	00000000	udf	#0
   0x0000fffff7fb7efc:	00000000	udf	#0
   0x0000fffff7fb7f00:	00000000	udf	#0
   0x0000fffff7fb7f04:	00000000	udf	#0
   0x0000fffff7fb7f08:	00000000	udf	#0
   0x0000fffff7fb7f0c:	00000000	udf	#0
   0x0000fffff7fb7f10:	00000000	udf	#0
   0x0000fffff7fb7f14:	00000000	udf	#0
   0x0000fffff7fb7f18:	00000000	udf	#0
   0x0000fffff7fb7f1c:	00000000	udf	#0
   0x0000fffff7fb7f20:	00000000	udf	#0
   0x0000fffff7fb7f24:	00000000	udf	#0
   0x0000fffff7fb7f28:	00000000	udf	#0
   0x0000fffff7fb7f2c:	00000000	udf	#0
   0x0000fffff7fb7f30:	00000000	udf	#0
   0x0000fffff7fb7f34:	00000000	udf	#0
   0x0000fffff7fb7f38:	00000000	udf	#0
   0x0000fffff7fb7f3c:	00000000	udf	#0
   0x0000fffff7fb7f40:	00000000	udf	#0
   0x0000fffff7fb7f44:	00000000	udf	#0
   0x0000fffff7fb7f48:	00000000	udf	#0
   0x0000fffff7fb7f4c:	00000000	udf	#0
   0x0000fffff7fb7f50:	00000000	udf	#0
   0x0000fffff7fb7f54:	00000000	udf	#0
   0x0000fffff7fb7f58:	00000000	udf	#0
   0x0000fffff7fb7f5c:	00000000	udf	#0
   0x0000fffff7fb7f60:	00000000	udf	#0
   0x0000fffff7fb7f64:	00000000	udf	#0
   0x0000fffff7fb7f68:	00000000	udf	#0
   0x0000fffff7fb7f6c:	00000000	udf	#0
   0x0000fffff7fb7f70:	00000000	udf	#0
   0x0000fffff7fb7f74:	00000000	udf	#0
   0x0000fffff7fb7f78:	00000000	udf	#0
   0x0000fffff7fb7f7c:	00000000	udf	#0
   0x0000fffff7fb7f80:	00000000	udf	#0
   0x0000fffff7fb7f84:	00000000	udf	#0
   0x0000fffff7fb7f88:	00000000	udf	#0
   0x0000fffff7fb7f8c:	00000000	udf	#0
   0x0000fffff7fb7f90:	00000000	udf	#0
   0x0000fffff7fb7f94:	00000000	udf	#0
   0x0000fffff7fb7f98:	00000000	udf	#0
   0x0000fffff7fb7f9c:	00000000	udf	#0
   0x0000fffff7fb7fa0:	00000000	udf	#0
   0x0000fffff7fb7fa4:	00000000	udf	#0
   0x0000fffff7fb7fa8:	00000000	udf	#0
   0x0000fffff7fb7fac:	00000000	udf	#0
   0x0000fffff7fb7fb0:	00000000	udf	#0
   0x0000fffff7fb7fb4:	00000000	udf	#0
   0x0000fffff7fb7fb8:	00000000	udf	#0
   0x0000fffff7fb7fbc:	00000000	udf	#0
   0x0000fffff7fb7fc0:	00000000	udf	#0
   0x0000fffff7fb7fc4:	00000000	udf	#0
   0x0000fffff7fb7fc8:	00000000	udf	#0
   0x0000fffff7fb7fcc:	00000000	udf	#0
   0x0000fffff7fb7fd0:	00000000	udf	#0
   0x0000fffff7fb7fd4:	00000000	udf	#0
   0x0000fffff7fb7fd8:	00000000	udf	#0
   0x0000fffff7fb7fdc:	00000000	udf	#0
   0x0000fffff7fb7fe0:	00000000	udf	#0
   0x0000fffff7fb7fe4:	00000000	udf	#0
   0x0000fffff7fb7fe8:	00000000	udf	#0
   0x0000fffff7fb7fec:	00000000	udf	#0
   0x0000fffff7fb7ff0:	00000000	udf	#0
   0x0000fffff7fb7ff4:	00000000	udf	#0
   0x0000fffff7fb7ff8:	00000000	udf	#0
   0x0000fffff7fb7ffc:	00000000	udf	#0
End of assembler dump.
