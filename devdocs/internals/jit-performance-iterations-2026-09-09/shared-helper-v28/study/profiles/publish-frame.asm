Dump of assembler code from 0xfffff7f84000 to 0xfffff7f85000:
   0x0000fffff7f84000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f84004:	910003fd	mov	x29, sp
   0x0000fffff7f84008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8400c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f84010:	d10243ff	sub	sp, sp, #0x90
   0x0000fffff7f84014:	aa0003f3	mov	x19, x0
   0x0000fffff7f84018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8401c:	aa0203f5	mov	x21, x2
   0x0000fffff7f84020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f84024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f84028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8402c:	f90003e9	str	x9, [sp]
   0x0000fffff7f84030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f84034:	d2800081	mov	x1, #0x4                   	// #4
   0x0000fffff7f84038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8403c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f84040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84044:	d63f0200	blr	x16
   0x0000fffff7f84048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8404c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f84050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f84054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f84058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8405c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f84060:	d29a880c	mov	x12, #0xd440                	// #54336
   0x0000fffff7f84064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8406c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f84070:	36d801d1	tbz	w17, #27, 0xfffff7f840a8
   0x0000fffff7f84074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8407c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84080:	54000281	b.ne	0xfffff7f840d0  // b.any
   0x0000fffff7f84084:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8408c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8409c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f840a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f840a4:	54000169	b.ls	0xfffff7f840d0  // b.plast
   0x0000fffff7f840a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f840ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7f840b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f840b4:	36d80091	tbz	w17, #27, 0xfffff7f840c4
   0x0000fffff7f840b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f840bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f840c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f840c4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f840c8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f840cc:	1400000e	b	0xfffff7f84104
   0x0000fffff7f840d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f840d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f840d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f840dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f840e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f840e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f840e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f840ec:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f840f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f840f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840f8:	d63f0200	blr	x16
   0x0000fffff7f840fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84100:	540052c0	b.eq	0xfffff7f84b58  // b.none
   0x0000fffff7f84104:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7f84108:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7f8410c:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f84110:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f84114:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f84118:	54000100	b.eq	0xfffff7f84138  // b.none
   0x0000fffff7f8411c:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7f84120:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f84124:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f84128:	54000a41	b.ne	0xfffff7f84270  // b.any
   0x0000fffff7f8412c:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7f84130:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84134:	14000002	b	0xfffff7f8413c
   0x0000fffff7f84138:	aa0c03eb	mov	x11, x12
   0x0000fffff7f8413c:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f84140:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7f84144:	d292fc2a	mov	x10, #0x97e1                	// #38881
   0x0000fffff7f84148:	f2bf84ea	movk	x10, #0xfc27, lsl #16
   0x0000fffff7f8414c:	f2c00b2a	movk	x10, #0x59, lsl #32
   0x0000fffff7f84150:	8a09014a	and	x10, x10, x9
   0x0000fffff7f84154:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f84158:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f8415c:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7f84160:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f84164:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f84168:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f8416c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84170:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84174:	540007e1	b.ne	0xfffff7f84270  // b.any
   0x0000fffff7f84178:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f8417c:	d29a880a	mov	x10, #0xd440                	// #54336
   0x0000fffff7f84180:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7f84184:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f84188:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8418c:	54000721	b.ne	0xfffff7f84270  // b.any
   0x0000fffff7f84190:	9100016b	add	x11, x11, #0x0
   0x0000fffff7f84194:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f84198:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f8419c:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f841a0:	540002a0	b.eq	0xfffff7f841f4  // b.none
   0x0000fffff7f841a4:	b9400169	ldr	w9, [x11]
   0x0000fffff7f841a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841b4:	540005e1	b.ne	0xfffff7f84270  // b.any
   0x0000fffff7f841b8:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f841bc:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f841c0:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7f841c4:	8a0a012a	and	x10, x9, x10
   0x0000fffff7f841c8:	f100015f	cmp	x10, #0x0
   0x0000fffff7f841cc:	54000520	b.eq	0xfffff7f84270  // b.none
   0x0000fffff7f841d0:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7f841d4:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7f841d8:	8a0a0129	and	x9, x9, x10
   0x0000fffff7f841dc:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7f841e0:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7f841e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841e8:	54000442	b.cs	0xfffff7f84270  // b.hs, b.nlast
   0x0000fffff7f841ec:	9101618b	add	x11, x12, #0x58
   0x0000fffff7f841f0:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7f841f4:	b90013ed	str	w13, [sp, #16]
   0x0000fffff7f841f8:	f9000fec	str	x12, [sp, #24]
   0x0000fffff7f841fc:	f90017eb	str	x11, [sp, #40]
   0x0000fffff7f84200:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7f84204:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7f84208:	b9400171	ldr	w17, [x11]
   0x0000fffff7f8420c:	36d801d1	tbz	w17, #27, 0xfffff7f84244
   0x0000fffff7f84210:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84214:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84218:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8421c:	540002a1	b.ne	0xfffff7f84270  // b.any
   0x0000fffff7f84220:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84224:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84228:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8422c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84230:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84234:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84238:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8423c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84240:	54000189	b.ls	0xfffff7f84270  // b.plast
   0x0000fffff7f84244:	36d8008d	tbz	w13, #27, 0xfffff7f84254
   0x0000fffff7f84248:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8424c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84250:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84254:	36d80091	tbz	w17, #27, 0xfffff7f84264
   0x0000fffff7f84258:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8425c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84260:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84264:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84268:	b900016d	str	w13, [x11]
   0x0000fffff7f8426c:	1400000e	b	0xfffff7f842a4
   0x0000fffff7f84270:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84274:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84278:	aa1303e1	mov	x1, x19
   0x0000fffff7f8427c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84280:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f84284:	aa1403e4	mov	x4, x20
   0x0000fffff7f84288:	aa1603e5	mov	x5, x22
   0x0000fffff7f8428c:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f84290:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84294:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84298:	d63f0200	blr	x16
   0x0000fffff7f8429c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842a0:	54004600	b.eq	0xfffff7f84b60  // b.none
   0x0000fffff7f842a4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f842a8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f842ac:	d29a940c	mov	x12, #0xd4a0                	// #54432
   0x0000fffff7f842b0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f842b4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f842b8:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f842bc:	36d801d1	tbz	w17, #27, 0xfffff7f842f4
   0x0000fffff7f842c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f842c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f842c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f842cc:	54000281	b.ne	0xfffff7f8431c  // b.any
   0x0000fffff7f842d0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f842d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f842d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f842dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f842e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f842e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f842e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f842ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7f842f0:	54000169	b.ls	0xfffff7f8431c  // b.plast
   0x0000fffff7f842f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f842f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f842fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84300:	36d80091	tbz	w17, #27, 0xfffff7f84310
   0x0000fffff7f84304:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84308:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8430c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84310:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84314:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84318:	1400000e	b	0xfffff7f84350
   0x0000fffff7f8431c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84320:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84324:	aa1303e1	mov	x1, x19
   0x0000fffff7f84328:	aa1503e2	mov	x2, x21
   0x0000fffff7f8432c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f84330:	aa1403e4	mov	x4, x20
   0x0000fffff7f84334:	aa1603e5	mov	x5, x22
   0x0000fffff7f84338:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f8433c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84340:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84344:	d63f0200	blr	x16
   0x0000fffff7f84348:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8434c:	540040e0	b.eq	0xfffff7f84b68  // b.none
   0x0000fffff7f84350:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7f84354:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7f84358:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f8435c:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f84360:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f84364:	54000100	b.eq	0xfffff7f84384  // b.none
   0x0000fffff7f84368:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7f8436c:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f84370:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f84374:	54000a41	b.ne	0xfffff7f844bc  // b.any
   0x0000fffff7f84378:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7f8437c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84380:	14000002	b	0xfffff7f84388
   0x0000fffff7f84384:	aa0c03eb	mov	x11, x12
   0x0000fffff7f84388:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f8438c:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7f84390:	d297258a	mov	x10, #0xb92c                	// #47404
   0x0000fffff7f84394:	f2b1912a	movk	x10, #0x8c89, lsl #16
   0x0000fffff7f84398:	f2c00aaa	movk	x10, #0x55, lsl #32
   0x0000fffff7f8439c:	8a09014a	and	x10, x10, x9
   0x0000fffff7f843a0:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f843a4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f843a8:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7f843ac:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f843b0:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f843b4:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f843b8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f843bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843c0:	540007e1	b.ne	0xfffff7f844bc  // b.any
   0x0000fffff7f843c4:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f843c8:	d29a940a	mov	x10, #0xd4a0                	// #54432
   0x0000fffff7f843cc:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7f843d0:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f843d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843d8:	54000721	b.ne	0xfffff7f844bc  // b.any
   0x0000fffff7f843dc:	9100016b	add	x11, x11, #0x0
   0x0000fffff7f843e0:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f843e4:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f843e8:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f843ec:	540002a0	b.eq	0xfffff7f84440  // b.none
   0x0000fffff7f843f0:	b9400169	ldr	w9, [x11]
   0x0000fffff7f843f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f843f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f843fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84400:	540005e1	b.ne	0xfffff7f844bc  // b.any
   0x0000fffff7f84404:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f84408:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f8440c:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7f84410:	8a0a012a	and	x10, x9, x10
   0x0000fffff7f84414:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84418:	54000520	b.eq	0xfffff7f844bc  // b.none
   0x0000fffff7f8441c:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7f84420:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7f84424:	8a0a0129	and	x9, x9, x10
   0x0000fffff7f84428:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7f8442c:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7f84430:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84434:	54000442	b.cs	0xfffff7f844bc  // b.hs, b.nlast
   0x0000fffff7f84438:	9101618b	add	x11, x12, #0x58
   0x0000fffff7f8443c:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7f84440:	b90033ed	str	w13, [sp, #48]
   0x0000fffff7f84444:	f9001fec	str	x12, [sp, #56]
   0x0000fffff7f84448:	f90027eb	str	x11, [sp, #72]
   0x0000fffff7f8444c:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7f84450:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7f84454:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84458:	36d801d1	tbz	w17, #27, 0xfffff7f84490
   0x0000fffff7f8445c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84460:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84464:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84468:	540002a1	b.ne	0xfffff7f844bc  // b.any
   0x0000fffff7f8446c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84470:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84474:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84478:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8447c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84480:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84484:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84488:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8448c:	54000189	b.ls	0xfffff7f844bc  // b.plast
   0x0000fffff7f84490:	36d8008d	tbz	w13, #27, 0xfffff7f844a0
   0x0000fffff7f84494:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84498:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8449c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f844a0:	36d80091	tbz	w17, #27, 0xfffff7f844b0
   0x0000fffff7f844a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f844ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f844b0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f844b4:	b900016d	str	w13, [x11]
   0x0000fffff7f844b8:	1400000e	b	0xfffff7f844f0
   0x0000fffff7f844bc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f844c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f844c4:	aa1303e1	mov	x1, x19
   0x0000fffff7f844c8:	aa1503e2	mov	x2, x21
   0x0000fffff7f844cc:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f844d0:	aa1403e4	mov	x4, x20
   0x0000fffff7f844d4:	aa1603e5	mov	x5, x22
   0x0000fffff7f844d8:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f844dc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f844e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f844e4:	d63f0200	blr	x16
   0x0000fffff7f844e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f844ec:	54003420	b.eq	0xfffff7f84b70  // b.none
   0x0000fffff7f844f0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f844f4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f844f8:	d29aa00c	mov	x12, #0xd500                	// #54528
   0x0000fffff7f844fc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84500:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f84504:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f84508:	36d801d1	tbz	w17, #27, 0xfffff7f84540
   0x0000fffff7f8450c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84510:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84514:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84518:	54000281	b.ne	0xfffff7f84568  // b.any
   0x0000fffff7f8451c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84520:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84524:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84528:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8452c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84530:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84534:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84538:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8453c:	54000169	b.ls	0xfffff7f84568  // b.plast
   0x0000fffff7f84540:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84544:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84548:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8454c:	36d80091	tbz	w17, #27, 0xfffff7f8455c
   0x0000fffff7f84550:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84554:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84558:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8455c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84560:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84564:	1400000e	b	0xfffff7f8459c
   0x0000fffff7f84568:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8456c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84570:	aa1303e1	mov	x1, x19
   0x0000fffff7f84574:	aa1503e2	mov	x2, x21
   0x0000fffff7f84578:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f8457c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84580:	aa1603e5	mov	x5, x22
   0x0000fffff7f84584:	d2957a10	mov	x16, #0xabd0                	// #43984
   0x0000fffff7f84588:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8458c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84590:	d63f0200	blr	x16
   0x0000fffff7f84594:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84598:	54002f00	b.eq	0xfffff7f84b78  // b.none
   0x0000fffff7f8459c:	b940126d	ldr	w13, [x19, #16]
   0x0000fffff7f845a0:	f9400e6c	ldr	x12, [x19, #24]
   0x0000fffff7f845a4:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f845a8:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f845ac:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f845b0:	54000100	b.eq	0xfffff7f845d0  // b.none
   0x0000fffff7f845b4:	5290000a	mov	w10, #0x8000                	// #32768
   0x0000fffff7f845b8:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f845bc:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f845c0:	54000a21	b.ne	0xfffff7f84704  // b.any
   0x0000fffff7f845c4:	f9401d8b	ldr	x11, [x12, #56]
   0x0000fffff7f845c8:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f845cc:	14000002	b	0xfffff7f845d4
   0x0000fffff7f845d0:	aa0c03eb	mov	x11, x12
   0x0000fffff7f845d4:	f9402569	ldr	x9, [x11, #72]
   0x0000fffff7f845d8:	d1000529	sub	x9, x9, #0x1
   0x0000fffff7f845dc:	d29ba34a	mov	x10, #0xdd1a                	// #56602
   0x0000fffff7f845e0:	f2a2374a	movk	x10, #0x11ba, lsl #16
   0x0000fffff7f845e4:	8a09014a	and	x10, x10, x9
   0x0000fffff7f845e8:	f940216b	ldr	x11, [x11, #64]
   0x0000fffff7f845ec:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f845f0:	9b097d4a	mul	x10, x10, x9
   0x0000fffff7f845f4:	8b0a016b	add	x11, x11, x10
   0x0000fffff7f845f8:	b9401169	ldr	w9, [x11, #16]
   0x0000fffff7f845fc:	5280020a	mov	w10, #0x10                  	// #16
   0x0000fffff7f84600:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84604:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84608:	540007e1	b.ne	0xfffff7f84704  // b.any
   0x0000fffff7f8460c:	f9400d69	ldr	x9, [x11, #24]
   0x0000fffff7f84610:	d29aa00a	mov	x10, #0xd500                	// #54528
   0x0000fffff7f84614:	f2b5580a	movk	x10, #0xaac0, lsl #16
   0x0000fffff7f84618:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f8461c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84620:	54000721	b.ne	0xfffff7f84704  // b.any
   0x0000fffff7f84624:	9100016b	add	x11, x11, #0x0
   0x0000fffff7f84628:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7f8462c:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7f84630:	eb0a01bf	cmp	x13, x10
   0x0000fffff7f84634:	540002a0	b.eq	0xfffff7f84688  // b.none
   0x0000fffff7f84638:	b9400169	ldr	w9, [x11]
   0x0000fffff7f8463c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84648:	540005e1	b.ne	0xfffff7f84704  // b.any
   0x0000fffff7f8464c:	f9400569	ldr	x9, [x11, #8]
   0x0000fffff7f84650:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7f84654:	f2a0400a	movk	x10, #0x200, lsl #16
   0x0000fffff7f84658:	8a0a012a	and	x10, x9, x10
   0x0000fffff7f8465c:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84660:	54000520	b.eq	0xfffff7f84704  // b.none
   0x0000fffff7f84664:	d29fffea	mov	x10, #0xffff                	// #65535
   0x0000fffff7f84668:	f2a01fea	movk	x10, #0xff, lsl #16
   0x0000fffff7f8466c:	8a0a0129	and	x9, x9, x10
   0x0000fffff7f84670:	f9401d8a	ldr	x10, [x12, #56]
   0x0000fffff7f84674:	f940254a	ldr	x10, [x10, #72]
   0x0000fffff7f84678:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8467c:	54000442	b.cs	0xfffff7f84704  // b.hs, b.nlast
   0x0000fffff7f84680:	9101618b	add	x11, x12, #0x58
   0x0000fffff7f84684:	8b09116b	add	x11, x11, x9, lsl #4
   0x0000fffff7f84688:	b90053ed	str	w13, [sp, #80]
   0x0000fffff7f8468c:	f9002fec	str	x12, [sp, #88]
   0x0000fffff7f84690:	f90037eb	str	x11, [sp, #104]
   0x0000fffff7f84694:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f84698:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f8469c:	b9400171	ldr	w17, [x11]
   0x0000fffff7f846a0:	36d801d1	tbz	w17, #27, 0xfffff7f846d8
   0x0000fffff7f846a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f846a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f846ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7f846b0:	540002a1	b.ne	0xfffff7f84704  // b.any
   0x0000fffff7f846b4:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f846b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f846bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f846c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f846c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f846c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f846cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f846d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f846d4:	54000189	b.ls	0xfffff7f84704  // b.plast
   0x0000fffff7f846d8:	36d8008d	tbz	w13, #27, 0xfffff7f846e8
   0x0000fffff7f846dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f846e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f846e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f846e8:	36d80091	tbz	w17, #27, 0xfffff7f846f8
   0x0000fffff7f846ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f846f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f846f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f846f8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f846fc:	b900016d	str	w13, [x11]
   0x0000fffff7f84700:	1400000e	b	0xfffff7f84738
   0x0000fffff7f84704:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f84708:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8470c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84710:	aa1503e2	mov	x2, x21
   0x0000fffff7f84714:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f84718:	aa1403e4	mov	x4, x20
   0x0000fffff7f8471c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84720:	d282b010	mov	x16, #0x1580                	// #5504
   0x0000fffff7f84724:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84728:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8472c:	d63f0200	blr	x16
   0x0000fffff7f84730:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84734:	54002260	b.eq	0xfffff7f84b80  // b.none
   0x0000fffff7f84738:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f8473c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84740:	540004a0	b.eq	0xfffff7f847d4  // b.none
   0x0000fffff7f84744:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84748:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8474c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84750:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84754:	54000400	b.eq	0xfffff7f847d4  // b.none
   0x0000fffff7f84758:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8475c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84760:	36d801d1	tbz	w17, #27, 0xfffff7f84798
   0x0000fffff7f84764:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84768:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8476c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84770:	54000321	b.ne	0xfffff7f847d4  // b.any
   0x0000fffff7f84774:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84778:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8477c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84780:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84784:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84788:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8478c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84790:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84794:	54000209	b.ls	0xfffff7f847d4  // b.plast
   0x0000fffff7f84798:	36d8008d	tbz	w13, #27, 0xfffff7f847a8
   0x0000fffff7f8479c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f847a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f847a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f847a8:	36d80091	tbz	w17, #27, 0xfffff7f847b8
   0x0000fffff7f847ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f847b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f847b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f847b8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f847bc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f847c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f847c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f847c8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f847cc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f847d0:	1400000e	b	0xfffff7f84808
   0x0000fffff7f847d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f847d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f847dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f847e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f847e4:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f847e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f847ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f847f0:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f847f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f847f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f847fc:	d63f0200	blr	x16
   0x0000fffff7f84800:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84804:	54001c20	b.eq	0xfffff7f84b88  // b.none
   0x0000fffff7f84808:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8480c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84810:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84814:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84818:	54000621	b.ne	0xfffff7f848dc  // b.any
   0x0000fffff7f8481c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84820:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84824:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84828:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8482c:	54000581	b.ne	0xfffff7f848dc  // b.any
   0x0000fffff7f84830:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f84834:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7f84838:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8483c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84840:	540004e2	b.cs	0xfffff7f848dc  // b.hs, b.nlast
   0x0000fffff7f84844:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84848:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8484c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84850:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84854:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84858:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8485c:	54000400	b.eq	0xfffff7f848dc  // b.none
   0x0000fffff7f84860:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84864:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84868:	36d801d1	tbz	w17, #27, 0xfffff7f848a0
   0x0000fffff7f8486c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84870:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84874:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84878:	54000321	b.ne	0xfffff7f848dc  // b.any
   0x0000fffff7f8487c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84880:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84884:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84888:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8488c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84890:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84894:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84898:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8489c:	54000209	b.ls	0xfffff7f848dc  // b.plast
   0x0000fffff7f848a0:	36d8008d	tbz	w13, #27, 0xfffff7f848b0
   0x0000fffff7f848a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f848a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f848ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f848b0:	36d80091	tbz	w17, #27, 0xfffff7f848c0
   0x0000fffff7f848b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f848b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f848bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f848c0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f848c4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f848c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f848cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f848d0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f848d4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f848d8:	1400000e	b	0xfffff7f84910
   0x0000fffff7f848dc:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f848e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f848e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f848e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f848ec:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f848f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f848f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f848f8:	d289d210	mov	x16, #0x4e90                	// #20112
   0x0000fffff7f848fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84900:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84904:	d63f0200	blr	x16
   0x0000fffff7f84908:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8490c:	54001420	b.eq	0xfffff7f84b90  // b.none
   0x0000fffff7f84910:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f84914:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84918:	540004a0	b.eq	0xfffff7f849ac  // b.none
   0x0000fffff7f8491c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84920:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84924:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84928:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8492c:	54000400	b.eq	0xfffff7f849ac  // b.none
   0x0000fffff7f84930:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84934:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84938:	36d801d1	tbz	w17, #27, 0xfffff7f84970
   0x0000fffff7f8493c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84940:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84944:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84948:	54000321	b.ne	0xfffff7f849ac  // b.any
   0x0000fffff7f8494c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84950:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84954:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84958:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8495c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84960:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84964:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84968:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8496c:	54000209	b.ls	0xfffff7f849ac  // b.plast
   0x0000fffff7f84970:	36d8008d	tbz	w13, #27, 0xfffff7f84980
   0x0000fffff7f84974:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84978:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8497c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84980:	36d80091	tbz	w17, #27, 0xfffff7f84990
   0x0000fffff7f84984:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84988:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8498c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84990:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f84994:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f84998:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8499c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f849a0:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f849a4:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f849a8:	1400000e	b	0xfffff7f849e0
   0x0000fffff7f849ac:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f849b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f849b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f849bc:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f849c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f849c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f849c8:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7f849cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f849d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849d4:	d63f0200	blr	x16
   0x0000fffff7f849d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f849dc:	54000de0	b.eq	0xfffff7f84b98  // b.none
   0x0000fffff7f849e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f849e4:	37d806a9	tbnz	w9, #27, 0xfffff7f84ab8
   0x0000fffff7f849e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f849ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849f8:	540001c1	b.ne	0xfffff7f84a30  // b.any
   0x0000fffff7f849fc:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84a00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a0c:	54000121	b.ne	0xfffff7f84a30  // b.any
   0x0000fffff7f84a10:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84a14:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f84a18:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84a1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a24:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f84a28:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f84a2c:	14000030	b	0xfffff7f84aec
   0x0000fffff7f84a30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84a38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a40:	54000120	b.eq	0xfffff7f84a64  // b.none
   0x0000fffff7f84a44:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a50:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a54:	54000321	b.ne	0xfffff7f84ab8  // b.any
   0x0000fffff7f84a58:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84a5c:	9e620120	scvtf	d0, x9
   0x0000fffff7f84a60:	14000002	b	0xfffff7f84a68
   0x0000fffff7f84a64:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f84a68:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84a6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84a70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a74:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a78:	54000120	b.eq	0xfffff7f84a9c  // b.none
   0x0000fffff7f84a7c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84a80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a88:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a8c:	54000161	b.ne	0xfffff7f84ab8  // b.any
   0x0000fffff7f84a90:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f84a94:	9e620121	scvtf	d1, x9
   0x0000fffff7f84a98:	14000002	b	0xfffff7f84aa0
   0x0000fffff7f84a9c:	fd403e61	ldr	d1, [x19, #120]
   0x0000fffff7f84aa0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84aa4:	fd003660	str	d0, [x19, #104]
   0x0000fffff7f84aa8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84ab0:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f84ab4:	17ffffde	b	0xfffff7f84a2c
   0x0000fffff7f84ab8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84abc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84ac0:	aa1303e1	mov	x1, x19
   0x0000fffff7f84ac4:	aa1503e2	mov	x2, x21
   0x0000fffff7f84ac8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f84acc:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ad0:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ad4:	d294d490	mov	x16, #0xa6a4                	// #42660
   0x0000fffff7f84ad8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84adc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ae0:	d63f0200	blr	x16
   0x0000fffff7f84ae4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ae8:	540005c0	b.eq	0xfffff7f84ba0  // b.none
   0x0000fffff7f84aec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84af0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84af4:	aa1303e1	mov	x1, x19
   0x0000fffff7f84af8:	aa1503e2	mov	x2, x21
   0x0000fffff7f84afc:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f84b00:	aa1403e4	mov	x4, x20
   0x0000fffff7f84b04:	aa1603e5	mov	x5, x22
   0x0000fffff7f84b08:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7f84b0c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84b10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84b14:	d63f0200	blr	x16
   0x0000fffff7f84b18:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84b1c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84b20:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84b24:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84b28:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f84b2c:	d65f03c0	ret
   0x0000fffff7f84b30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b38:	b900028a	str	w10, [x20]
   0x0000fffff7f84b3c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84b40:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84b44:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84b48:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84b4c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84b50:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84b54:	d65f03c0	ret
   0x0000fffff7f84b58:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84b5c:	17fffff5	b	0xfffff7f84b30
   0x0000fffff7f84b60:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f84b64:	17fffff3	b	0xfffff7f84b30
   0x0000fffff7f84b68:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f84b6c:	17fffff1	b	0xfffff7f84b30
   0x0000fffff7f84b70:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f84b74:	17ffffef	b	0xfffff7f84b30
   0x0000fffff7f84b78:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f84b7c:	17ffffed	b	0xfffff7f84b30
   0x0000fffff7f84b80:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f84b84:	17ffffeb	b	0xfffff7f84b30
   0x0000fffff7f84b88:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f84b8c:	17ffffe9	b	0xfffff7f84b30
   0x0000fffff7f84b90:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f84b94:	17ffffe7	b	0xfffff7f84b30
   0x0000fffff7f84b98:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f84b9c:	17ffffe5	b	0xfffff7f84b30
   0x0000fffff7f84ba0:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f84ba4:	17ffffe3	b	0xfffff7f84b30
   0x0000fffff7f84ba8:	00000000	udf	#0
   0x0000fffff7f84bac:	00000000	udf	#0
   0x0000fffff7f84bb0:	00000000	udf	#0
   0x0000fffff7f84bb4:	00000000	udf	#0
   0x0000fffff7f84bb8:	00000000	udf	#0
   0x0000fffff7f84bbc:	00000000	udf	#0
   0x0000fffff7f84bc0:	00000000	udf	#0
   0x0000fffff7f84bc4:	00000000	udf	#0
   0x0000fffff7f84bc8:	00000000	udf	#0
   0x0000fffff7f84bcc:	00000000	udf	#0
   0x0000fffff7f84bd0:	00000000	udf	#0
   0x0000fffff7f84bd4:	00000000	udf	#0
   0x0000fffff7f84bd8:	00000000	udf	#0
   0x0000fffff7f84bdc:	00000000	udf	#0
   0x0000fffff7f84be0:	00000000	udf	#0
   0x0000fffff7f84be4:	00000000	udf	#0
   0x0000fffff7f84be8:	00000000	udf	#0
   0x0000fffff7f84bec:	00000000	udf	#0
   0x0000fffff7f84bf0:	00000000	udf	#0
   0x0000fffff7f84bf4:	00000000	udf	#0
   0x0000fffff7f84bf8:	00000000	udf	#0
   0x0000fffff7f84bfc:	00000000	udf	#0
   0x0000fffff7f84c00:	00000000	udf	#0
   0x0000fffff7f84c04:	00000000	udf	#0
   0x0000fffff7f84c08:	00000000	udf	#0
   0x0000fffff7f84c0c:	00000000	udf	#0
   0x0000fffff7f84c10:	00000000	udf	#0
   0x0000fffff7f84c14:	00000000	udf	#0
   0x0000fffff7f84c18:	00000000	udf	#0
   0x0000fffff7f84c1c:	00000000	udf	#0
   0x0000fffff7f84c20:	00000000	udf	#0
   0x0000fffff7f84c24:	00000000	udf	#0
   0x0000fffff7f84c28:	00000000	udf	#0
   0x0000fffff7f84c2c:	00000000	udf	#0
   0x0000fffff7f84c30:	00000000	udf	#0
   0x0000fffff7f84c34:	00000000	udf	#0
   0x0000fffff7f84c38:	00000000	udf	#0
   0x0000fffff7f84c3c:	00000000	udf	#0
   0x0000fffff7f84c40:	00000000	udf	#0
   0x0000fffff7f84c44:	00000000	udf	#0
   0x0000fffff7f84c48:	00000000	udf	#0
   0x0000fffff7f84c4c:	00000000	udf	#0
   0x0000fffff7f84c50:	00000000	udf	#0
   0x0000fffff7f84c54:	00000000	udf	#0
   0x0000fffff7f84c58:	00000000	udf	#0
   0x0000fffff7f84c5c:	00000000	udf	#0
   0x0000fffff7f84c60:	00000000	udf	#0
   0x0000fffff7f84c64:	00000000	udf	#0
   0x0000fffff7f84c68:	00000000	udf	#0
   0x0000fffff7f84c6c:	00000000	udf	#0
   0x0000fffff7f84c70:	00000000	udf	#0
   0x0000fffff7f84c74:	00000000	udf	#0
   0x0000fffff7f84c78:	00000000	udf	#0
   0x0000fffff7f84c7c:	00000000	udf	#0
   0x0000fffff7f84c80:	00000000	udf	#0
   0x0000fffff7f84c84:	00000000	udf	#0
   0x0000fffff7f84c88:	00000000	udf	#0
   0x0000fffff7f84c8c:	00000000	udf	#0
   0x0000fffff7f84c90:	00000000	udf	#0
   0x0000fffff7f84c94:	00000000	udf	#0
   0x0000fffff7f84c98:	00000000	udf	#0
   0x0000fffff7f84c9c:	00000000	udf	#0
   0x0000fffff7f84ca0:	00000000	udf	#0
   0x0000fffff7f84ca4:	00000000	udf	#0
   0x0000fffff7f84ca8:	00000000	udf	#0
   0x0000fffff7f84cac:	00000000	udf	#0
   0x0000fffff7f84cb0:	00000000	udf	#0
   0x0000fffff7f84cb4:	00000000	udf	#0
   0x0000fffff7f84cb8:	00000000	udf	#0
   0x0000fffff7f84cbc:	00000000	udf	#0
   0x0000fffff7f84cc0:	00000000	udf	#0
   0x0000fffff7f84cc4:	00000000	udf	#0
   0x0000fffff7f84cc8:	00000000	udf	#0
   0x0000fffff7f84ccc:	00000000	udf	#0
   0x0000fffff7f84cd0:	00000000	udf	#0
   0x0000fffff7f84cd4:	00000000	udf	#0
   0x0000fffff7f84cd8:	00000000	udf	#0
   0x0000fffff7f84cdc:	00000000	udf	#0
   0x0000fffff7f84ce0:	00000000	udf	#0
   0x0000fffff7f84ce4:	00000000	udf	#0
   0x0000fffff7f84ce8:	00000000	udf	#0
   0x0000fffff7f84cec:	00000000	udf	#0
   0x0000fffff7f84cf0:	00000000	udf	#0
   0x0000fffff7f84cf4:	00000000	udf	#0
   0x0000fffff7f84cf8:	00000000	udf	#0
   0x0000fffff7f84cfc:	00000000	udf	#0
   0x0000fffff7f84d00:	00000000	udf	#0
   0x0000fffff7f84d04:	00000000	udf	#0
   0x0000fffff7f84d08:	00000000	udf	#0
   0x0000fffff7f84d0c:	00000000	udf	#0
   0x0000fffff7f84d10:	00000000	udf	#0
   0x0000fffff7f84d14:	00000000	udf	#0
   0x0000fffff7f84d18:	00000000	udf	#0
   0x0000fffff7f84d1c:	00000000	udf	#0
   0x0000fffff7f84d20:	00000000	udf	#0
   0x0000fffff7f84d24:	00000000	udf	#0
   0x0000fffff7f84d28:	00000000	udf	#0
   0x0000fffff7f84d2c:	00000000	udf	#0
   0x0000fffff7f84d30:	00000000	udf	#0
   0x0000fffff7f84d34:	00000000	udf	#0
   0x0000fffff7f84d38:	00000000	udf	#0
   0x0000fffff7f84d3c:	00000000	udf	#0
   0x0000fffff7f84d40:	00000000	udf	#0
   0x0000fffff7f84d44:	00000000	udf	#0
   0x0000fffff7f84d48:	00000000	udf	#0
   0x0000fffff7f84d4c:	00000000	udf	#0
   0x0000fffff7f84d50:	00000000	udf	#0
   0x0000fffff7f84d54:	00000000	udf	#0
   0x0000fffff7f84d58:	00000000	udf	#0
   0x0000fffff7f84d5c:	00000000	udf	#0
   0x0000fffff7f84d60:	00000000	udf	#0
   0x0000fffff7f84d64:	00000000	udf	#0
   0x0000fffff7f84d68:	00000000	udf	#0
   0x0000fffff7f84d6c:	00000000	udf	#0
   0x0000fffff7f84d70:	00000000	udf	#0
   0x0000fffff7f84d74:	00000000	udf	#0
   0x0000fffff7f84d78:	00000000	udf	#0
   0x0000fffff7f84d7c:	00000000	udf	#0
   0x0000fffff7f84d80:	00000000	udf	#0
   0x0000fffff7f84d84:	00000000	udf	#0
   0x0000fffff7f84d88:	00000000	udf	#0
   0x0000fffff7f84d8c:	00000000	udf	#0
   0x0000fffff7f84d90:	00000000	udf	#0
   0x0000fffff7f84d94:	00000000	udf	#0
   0x0000fffff7f84d98:	00000000	udf	#0
   0x0000fffff7f84d9c:	00000000	udf	#0
   0x0000fffff7f84da0:	00000000	udf	#0
   0x0000fffff7f84da4:	00000000	udf	#0
   0x0000fffff7f84da8:	00000000	udf	#0
   0x0000fffff7f84dac:	00000000	udf	#0
   0x0000fffff7f84db0:	00000000	udf	#0
   0x0000fffff7f84db4:	00000000	udf	#0
   0x0000fffff7f84db8:	00000000	udf	#0
   0x0000fffff7f84dbc:	00000000	udf	#0
   0x0000fffff7f84dc0:	00000000	udf	#0
   0x0000fffff7f84dc4:	00000000	udf	#0
   0x0000fffff7f84dc8:	00000000	udf	#0
   0x0000fffff7f84dcc:	00000000	udf	#0
   0x0000fffff7f84dd0:	00000000	udf	#0
   0x0000fffff7f84dd4:	00000000	udf	#0
   0x0000fffff7f84dd8:	00000000	udf	#0
   0x0000fffff7f84ddc:	00000000	udf	#0
   0x0000fffff7f84de0:	00000000	udf	#0
   0x0000fffff7f84de4:	00000000	udf	#0
   0x0000fffff7f84de8:	00000000	udf	#0
   0x0000fffff7f84dec:	00000000	udf	#0
   0x0000fffff7f84df0:	00000000	udf	#0
   0x0000fffff7f84df4:	00000000	udf	#0
   0x0000fffff7f84df8:	00000000	udf	#0
   0x0000fffff7f84dfc:	00000000	udf	#0
   0x0000fffff7f84e00:	00000000	udf	#0
   0x0000fffff7f84e04:	00000000	udf	#0
   0x0000fffff7f84e08:	00000000	udf	#0
   0x0000fffff7f84e0c:	00000000	udf	#0
   0x0000fffff7f84e10:	00000000	udf	#0
   0x0000fffff7f84e14:	00000000	udf	#0
   0x0000fffff7f84e18:	00000000	udf	#0
   0x0000fffff7f84e1c:	00000000	udf	#0
   0x0000fffff7f84e20:	00000000	udf	#0
   0x0000fffff7f84e24:	00000000	udf	#0
   0x0000fffff7f84e28:	00000000	udf	#0
   0x0000fffff7f84e2c:	00000000	udf	#0
   0x0000fffff7f84e30:	00000000	udf	#0
   0x0000fffff7f84e34:	00000000	udf	#0
   0x0000fffff7f84e38:	00000000	udf	#0
   0x0000fffff7f84e3c:	00000000	udf	#0
   0x0000fffff7f84e40:	00000000	udf	#0
   0x0000fffff7f84e44:	00000000	udf	#0
   0x0000fffff7f84e48:	00000000	udf	#0
   0x0000fffff7f84e4c:	00000000	udf	#0
   0x0000fffff7f84e50:	00000000	udf	#0
   0x0000fffff7f84e54:	00000000	udf	#0
   0x0000fffff7f84e58:	00000000	udf	#0
   0x0000fffff7f84e5c:	00000000	udf	#0
   0x0000fffff7f84e60:	00000000	udf	#0
   0x0000fffff7f84e64:	00000000	udf	#0
   0x0000fffff7f84e68:	00000000	udf	#0
   0x0000fffff7f84e6c:	00000000	udf	#0
   0x0000fffff7f84e70:	00000000	udf	#0
   0x0000fffff7f84e74:	00000000	udf	#0
   0x0000fffff7f84e78:	00000000	udf	#0
   0x0000fffff7f84e7c:	00000000	udf	#0
   0x0000fffff7f84e80:	00000000	udf	#0
   0x0000fffff7f84e84:	00000000	udf	#0
   0x0000fffff7f84e88:	00000000	udf	#0
   0x0000fffff7f84e8c:	00000000	udf	#0
   0x0000fffff7f84e90:	00000000	udf	#0
   0x0000fffff7f84e94:	00000000	udf	#0
   0x0000fffff7f84e98:	00000000	udf	#0
   0x0000fffff7f84e9c:	00000000	udf	#0
   0x0000fffff7f84ea0:	00000000	udf	#0
   0x0000fffff7f84ea4:	00000000	udf	#0
   0x0000fffff7f84ea8:	00000000	udf	#0
   0x0000fffff7f84eac:	00000000	udf	#0
   0x0000fffff7f84eb0:	00000000	udf	#0
   0x0000fffff7f84eb4:	00000000	udf	#0
   0x0000fffff7f84eb8:	00000000	udf	#0
   0x0000fffff7f84ebc:	00000000	udf	#0
   0x0000fffff7f84ec0:	00000000	udf	#0
   0x0000fffff7f84ec4:	00000000	udf	#0
   0x0000fffff7f84ec8:	00000000	udf	#0
   0x0000fffff7f84ecc:	00000000	udf	#0
   0x0000fffff7f84ed0:	00000000	udf	#0
   0x0000fffff7f84ed4:	00000000	udf	#0
   0x0000fffff7f84ed8:	00000000	udf	#0
   0x0000fffff7f84edc:	00000000	udf	#0
   0x0000fffff7f84ee0:	00000000	udf	#0
   0x0000fffff7f84ee4:	00000000	udf	#0
   0x0000fffff7f84ee8:	00000000	udf	#0
   0x0000fffff7f84eec:	00000000	udf	#0
   0x0000fffff7f84ef0:	00000000	udf	#0
   0x0000fffff7f84ef4:	00000000	udf	#0
   0x0000fffff7f84ef8:	00000000	udf	#0
   0x0000fffff7f84efc:	00000000	udf	#0
   0x0000fffff7f84f00:	00000000	udf	#0
   0x0000fffff7f84f04:	00000000	udf	#0
   0x0000fffff7f84f08:	00000000	udf	#0
   0x0000fffff7f84f0c:	00000000	udf	#0
   0x0000fffff7f84f10:	00000000	udf	#0
   0x0000fffff7f84f14:	00000000	udf	#0
   0x0000fffff7f84f18:	00000000	udf	#0
   0x0000fffff7f84f1c:	00000000	udf	#0
   0x0000fffff7f84f20:	00000000	udf	#0
   0x0000fffff7f84f24:	00000000	udf	#0
   0x0000fffff7f84f28:	00000000	udf	#0
   0x0000fffff7f84f2c:	00000000	udf	#0
   0x0000fffff7f84f30:	00000000	udf	#0
   0x0000fffff7f84f34:	00000000	udf	#0
   0x0000fffff7f84f38:	00000000	udf	#0
   0x0000fffff7f84f3c:	00000000	udf	#0
   0x0000fffff7f84f40:	00000000	udf	#0
   0x0000fffff7f84f44:	00000000	udf	#0
   0x0000fffff7f84f48:	00000000	udf	#0
   0x0000fffff7f84f4c:	00000000	udf	#0
   0x0000fffff7f84f50:	00000000	udf	#0
   0x0000fffff7f84f54:	00000000	udf	#0
   0x0000fffff7f84f58:	00000000	udf	#0
   0x0000fffff7f84f5c:	00000000	udf	#0
   0x0000fffff7f84f60:	00000000	udf	#0
   0x0000fffff7f84f64:	00000000	udf	#0
   0x0000fffff7f84f68:	00000000	udf	#0
   0x0000fffff7f84f6c:	00000000	udf	#0
   0x0000fffff7f84f70:	00000000	udf	#0
   0x0000fffff7f84f74:	00000000	udf	#0
   0x0000fffff7f84f78:	00000000	udf	#0
   0x0000fffff7f84f7c:	00000000	udf	#0
   0x0000fffff7f84f80:	00000000	udf	#0
   0x0000fffff7f84f84:	00000000	udf	#0
   0x0000fffff7f84f88:	00000000	udf	#0
   0x0000fffff7f84f8c:	00000000	udf	#0
   0x0000fffff7f84f90:	00000000	udf	#0
   0x0000fffff7f84f94:	00000000	udf	#0
   0x0000fffff7f84f98:	00000000	udf	#0
   0x0000fffff7f84f9c:	00000000	udf	#0
   0x0000fffff7f84fa0:	00000000	udf	#0
   0x0000fffff7f84fa4:	00000000	udf	#0
   0x0000fffff7f84fa8:	00000000	udf	#0
   0x0000fffff7f84fac:	00000000	udf	#0
   0x0000fffff7f84fb0:	00000000	udf	#0
   0x0000fffff7f84fb4:	00000000	udf	#0
   0x0000fffff7f84fb8:	00000000	udf	#0
   0x0000fffff7f84fbc:	00000000	udf	#0
   0x0000fffff7f84fc0:	00000000	udf	#0
   0x0000fffff7f84fc4:	00000000	udf	#0
   0x0000fffff7f84fc8:	00000000	udf	#0
   0x0000fffff7f84fcc:	00000000	udf	#0
   0x0000fffff7f84fd0:	00000000	udf	#0
   0x0000fffff7f84fd4:	00000000	udf	#0
   0x0000fffff7f84fd8:	00000000	udf	#0
   0x0000fffff7f84fdc:	00000000	udf	#0
   0x0000fffff7f84fe0:	00000000	udf	#0
   0x0000fffff7f84fe4:	00000000	udf	#0
   0x0000fffff7f84fe8:	00000000	udf	#0
   0x0000fffff7f84fec:	00000000	udf	#0
   0x0000fffff7f84ff0:	00000000	udf	#0
   0x0000fffff7f84ff4:	00000000	udf	#0
   0x0000fffff7f84ff8:	00000000	udf	#0
   0x0000fffff7f84ffc:	00000000	udf	#0
End of assembler dump.
