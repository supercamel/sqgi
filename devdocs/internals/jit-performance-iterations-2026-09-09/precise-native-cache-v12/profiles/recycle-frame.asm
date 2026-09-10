Dump of assembler code from 0xfffff7f84000 to 0xfffff7f86000:
   0x0000fffff7f84000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f84004:	910003fd	mov	x29, sp
   0x0000fffff7f84008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8400c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f84010:	d10343ff	sub	sp, sp, #0xd0
   0x0000fffff7f84014:	aa0003f3	mov	x19, x0
   0x0000fffff7f84018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8401c:	aa0203f5	mov	x21, x2
   0x0000fffff7f84020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f84024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f84028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8402c:	f90003e9	str	x9, [sp]
   0x0000fffff7f84030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f84034:	d28000c1	mov	x1, #0x6                   	// #6
   0x0000fffff7f84038:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7f8403c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84044:	d63f0200	blr	x16
   0x0000fffff7f84048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8404c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f84050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f84054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f84058:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8405c:	37d800e9	tbnz	w9, #27, 0xfffff7f84078
   0x0000fffff7f84060:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84064:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84068:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8406c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f84070:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84074:	1400000e	b	0xfffff7f840ac
   0x0000fffff7f84078:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8407c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84080:	aa1303e1	mov	x1, x19
   0x0000fffff7f84084:	aa1503e2	mov	x2, x21
   0x0000fffff7f84088:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f8408c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84090:	aa1603e5	mov	x5, x22
   0x0000fffff7f84094:	d294f290	mov	x16, #0xa794                	// #42900
   0x0000fffff7f84098:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8409c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840a0:	d63f0200	blr	x16
   0x0000fffff7f840a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f840a8:	5400a300	b.eq	0xfffff7f85508  // b.none
   0x0000fffff7f840ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f840b0:	37d800e9	tbnz	w9, #27, 0xfffff7f840cc
   0x0000fffff7f840b4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f840b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f840bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f840c0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f840c4:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f840c8:	1400000e	b	0xfffff7f84100
   0x0000fffff7f840cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f840d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f840d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f840d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f840dc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f840e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f840e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f840e8:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f840ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f840f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840f4:	d63f0200	blr	x16
   0x0000fffff7f840f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f840fc:	5400a1c0	b.eq	0xfffff7f85534  // b.none
   0x0000fffff7f84100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84108:	aa1303e1	mov	x1, x19
   0x0000fffff7f8410c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84110:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f84114:	aa1403e4	mov	x4, x20
   0x0000fffff7f84118:	aa1603e5	mov	x5, x22
   0x0000fffff7f8411c:	d291fe10	mov	x16, #0x8ff0                	// #36848
   0x0000fffff7f84120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84128:	d63f0200	blr	x16
   0x0000fffff7f8412c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84130:	5400a180	b.eq	0xfffff7f85560  // b.none
   0x0000fffff7f84134:	f100041f	cmp	x0, #0x1
   0x0000fffff7f84138:	54009c60	b.eq	0xfffff7f854c4  // b.none
   0x0000fffff7f8413c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84140:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84144:	54000480	b.eq	0xfffff7f841d4  // b.none
   0x0000fffff7f84148:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8414c:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f84150:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84154:	54000401	b.ne	0xfffff7f841d4  // b.any
   0x0000fffff7f84158:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f8415c:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f84160:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84164:	54000381	b.ne	0xfffff7f841d4  // b.any
   0x0000fffff7f84168:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8416c:	37d8034d	tbnz	w13, #27, 0xfffff7f841d4
   0x0000fffff7f84170:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84174:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84178:	36d8020e	tbz	w14, #27, 0xfffff7f841b8
   0x0000fffff7f8417c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84180:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84184:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84188:	54000261	b.ne	0xfffff7f841d4  // b.any
   0x0000fffff7f8418c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84190:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84194:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84198:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8419c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f841a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f841a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f841a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f841ac:	54000149	b.ls	0xfffff7f841d4  // b.plast
   0x0000fffff7f841b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f841b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f841b8:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f841bc:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f841c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f841c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f841c8:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f841cc:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f841d0:	1400000e	b	0xfffff7f84208
   0x0000fffff7f841d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f841d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f841dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f841e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f841e4:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f841e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f841ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f841f0:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f841f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f841f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f841fc:	d63f0200	blr	x16
   0x0000fffff7f84200:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84204:	54009c40	b.eq	0xfffff7f8558c  // b.none
   0x0000fffff7f84208:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8420c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84210:	aa1303e1	mov	x1, x19
   0x0000fffff7f84214:	aa1503e2	mov	x2, x21
   0x0000fffff7f84218:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f8421c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84220:	aa1603e5	mov	x5, x22
   0x0000fffff7f84224:	d294f290	mov	x16, #0xa794                	// #42900
   0x0000fffff7f84228:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8422c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84230:	d63f0200	blr	x16
   0x0000fffff7f84234:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84238:	54009c00	b.eq	0xfffff7f855b8  // b.none
   0x0000fffff7f8423c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84240:	37d80389	tbnz	w9, #27, 0xfffff7f842b0
   0x0000fffff7f84244:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84248:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8424c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84250:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84254:	540002e1	b.ne	0xfffff7f842b0  // b.any
   0x0000fffff7f84258:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8425c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84260:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84264:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84268:	54000241	b.ne	0xfffff7f842b0  // b.any
   0x0000fffff7f8426c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84270:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f84274:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84278:	540001c0	b.eq	0xfffff7f842b0  // b.none
   0x0000fffff7f8427c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84280:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84284:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84288:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f8428c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84290:	54000100	b.eq	0xfffff7f842b0  // b.none
   0x0000fffff7f84294:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84298:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f8429c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f842a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f842a4:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f842a8:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f842ac:	1400000e	b	0xfffff7f842e4
   0x0000fffff7f842b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f842b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f842b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f842bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f842c0:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f842c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f842c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f842cc:	d2937a10	mov	x16, #0x9bd0                	// #39888
   0x0000fffff7f842d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f842d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842d8:	d63f0200	blr	x16
   0x0000fffff7f842dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842e0:	54009820	b.eq	0xfffff7f855e4  // b.none
   0x0000fffff7f842e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f842e8:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f842ec:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f842f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f842f4:	540001c1	b.ne	0xfffff7f8432c  // b.any
   0x0000fffff7f842f8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f842fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84304:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84308:	540006e1	b.ne	0xfffff7f843e4  // b.any
   0x0000fffff7f8430c:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84310:	f940166b	ldr	x11, [x19, #40]
   0x0000fffff7f84314:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84318:	eb09015f	cmp	x10, x9
   0x0000fffff7f8431c:	54000642	b.cs	0xfffff7f843e4  // b.hs, b.nlast
   0x0000fffff7f84320:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84324:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84328:	14000014	b	0xfffff7f84378
   0x0000fffff7f8432c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84330:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84334:	54000580	b.eq	0xfffff7f843e4  // b.none
   0x0000fffff7f84338:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f8433c:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f84340:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84344:	54000501	b.ne	0xfffff7f843e4  // b.any
   0x0000fffff7f84348:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f8434c:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f84350:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84354:	54000481	b.ne	0xfffff7f843e4  // b.any
   0x0000fffff7f84358:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8435c:	b94037ea	ldr	w10, [sp, #52]
   0x0000fffff7f84360:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84364:	54000401	b.ne	0xfffff7f843e4  // b.any
   0x0000fffff7f84368:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f8436c:	f94023ea	ldr	x10, [sp, #64]
   0x0000fffff7f84370:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84374:	54000381	b.ne	0xfffff7f843e4  // b.any
   0x0000fffff7f84378:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8437c:	37d8034d	tbnz	w13, #27, 0xfffff7f843e4
   0x0000fffff7f84380:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84384:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84388:	36d8020e	tbz	w14, #27, 0xfffff7f843c8
   0x0000fffff7f8438c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84390:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84394:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84398:	54000261	b.ne	0xfffff7f843e4  // b.any
   0x0000fffff7f8439c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f843a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f843a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f843a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f843ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f843b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f843b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f843b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f843bc:	54000149	b.ls	0xfffff7f843e4  // b.plast
   0x0000fffff7f843c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f843c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f843c8:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f843cc:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f843d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f843d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f843d8:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f843dc:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f843e0:	1400000e	b	0xfffff7f84418
   0x0000fffff7f843e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f843e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f843ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f843f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f843f4:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f843f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f843fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f84400:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84404:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84408:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8440c:	d63f0200	blr	x16
   0x0000fffff7f84410:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84414:	54008fe0	b.eq	0xfffff7f85610  // b.none
   0x0000fffff7f84418:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8441c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84420:	aa1303e1	mov	x1, x19
   0x0000fffff7f84424:	aa1503e2	mov	x2, x21
   0x0000fffff7f84428:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f8442c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84430:	aa1603e5	mov	x5, x22
   0x0000fffff7f84434:	d297ce10	mov	x16, #0xbe70                	// #48752
   0x0000fffff7f84438:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8443c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84440:	d63f0200	blr	x16
   0x0000fffff7f84444:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84448:	54008fa0	b.eq	0xfffff7f8563c  // b.none
   0x0000fffff7f8444c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84450:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84454:	54000480	b.eq	0xfffff7f844e4  // b.none
   0x0000fffff7f84458:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8445c:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f84460:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84464:	54000401	b.ne	0xfffff7f844e4  // b.any
   0x0000fffff7f84468:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f8446c:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f84470:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84474:	54000381	b.ne	0xfffff7f844e4  // b.any
   0x0000fffff7f84478:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8447c:	37d8034d	tbnz	w13, #27, 0xfffff7f844e4
   0x0000fffff7f84480:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84484:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84488:	36d8020e	tbz	w14, #27, 0xfffff7f844c8
   0x0000fffff7f8448c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84490:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84494:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84498:	54000261	b.ne	0xfffff7f844e4  // b.any
   0x0000fffff7f8449c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f844a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f844a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f844ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f844b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f844b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f844b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f844bc:	54000149	b.ls	0xfffff7f844e4  // b.plast
   0x0000fffff7f844c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f844c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f844c8:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f844cc:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f844d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f844d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f844d8:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f844dc:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f844e0:	1400000e	b	0xfffff7f84518
   0x0000fffff7f844e4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f844e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f844ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f844f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f844f4:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f844f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f844fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f84500:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f84504:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84508:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8450c:	d63f0200	blr	x16
   0x0000fffff7f84510:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84514:	54008aa0	b.eq	0xfffff7f85668  // b.none
   0x0000fffff7f84518:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8451c:	37d800e9	tbnz	w9, #27, 0xfffff7f84538
   0x0000fffff7f84520:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84524:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84528:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8452c:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f84530:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f84534:	1400000e	b	0xfffff7f8456c
   0x0000fffff7f84538:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8453c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84540:	aa1303e1	mov	x1, x19
   0x0000fffff7f84544:	aa1503e2	mov	x2, x21
   0x0000fffff7f84548:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f8454c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84550:	aa1603e5	mov	x5, x22
   0x0000fffff7f84554:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84558:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8455c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84560:	d63f0200	blr	x16
   0x0000fffff7f84564:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84568:	54008960	b.eq	0xfffff7f85694  // b.none
   0x0000fffff7f8456c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84570:	37d800e9	tbnz	w9, #27, 0xfffff7f8458c
   0x0000fffff7f84574:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84578:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8457c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84580:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f84584:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84588:	1400000e	b	0xfffff7f845c0
   0x0000fffff7f8458c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84590:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84594:	aa1303e1	mov	x1, x19
   0x0000fffff7f84598:	aa1503e2	mov	x2, x21
   0x0000fffff7f8459c:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f845a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f845a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f845a8:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f845ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f845b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f845b4:	d63f0200	blr	x16
   0x0000fffff7f845b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f845bc:	54008820	b.eq	0xfffff7f856c0  // b.none
   0x0000fffff7f845c0:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f845c4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f845c8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f845cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845d0:	540001c1	b.ne	0xfffff7f84608  // b.any
   0x0000fffff7f845d4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f845d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f845dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f845e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845e4:	540006e1	b.ne	0xfffff7f846c0  // b.any
   0x0000fffff7f845e8:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f845ec:	f9403e6b	ldr	x11, [x19, #120]
   0x0000fffff7f845f0:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f845f4:	eb09015f	cmp	x10, x9
   0x0000fffff7f845f8:	54000642	b.cs	0xfffff7f846c0  // b.hs, b.nlast
   0x0000fffff7f845fc:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84600:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84604:	14000014	b	0xfffff7f84654
   0x0000fffff7f84608:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f8460c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84610:	54000580	b.eq	0xfffff7f846c0  // b.none
   0x0000fffff7f84614:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84618:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f8461c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84620:	54000501	b.ne	0xfffff7f846c0  // b.any
   0x0000fffff7f84624:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f84628:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f8462c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84630:	54000481	b.ne	0xfffff7f846c0  // b.any
   0x0000fffff7f84634:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84638:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f8463c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84640:	54000401	b.ne	0xfffff7f846c0  // b.any
   0x0000fffff7f84644:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84648:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f8464c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84650:	54000381	b.ne	0xfffff7f846c0  // b.any
   0x0000fffff7f84654:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84658:	37d8034d	tbnz	w13, #27, 0xfffff7f846c0
   0x0000fffff7f8465c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84660:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84664:	36d8020e	tbz	w14, #27, 0xfffff7f846a4
   0x0000fffff7f84668:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8466c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84670:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84674:	54000261	b.ne	0xfffff7f846c0  // b.any
   0x0000fffff7f84678:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8467c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84680:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84684:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84688:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8468c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84690:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84694:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84698:	54000149	b.ls	0xfffff7f846c0  // b.plast
   0x0000fffff7f8469c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f846a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f846a4:	b940a26e	ldr	w14, [x19, #160]
   0x0000fffff7f846a8:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f846ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f846b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f846b4:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f846b8:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f846bc:	1400000e	b	0xfffff7f846f4
   0x0000fffff7f846c0:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f846c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f846c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f846cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f846d0:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f846d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f846d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f846dc:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f846e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f846e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f846e8:	d63f0200	blr	x16
   0x0000fffff7f846ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f846f0:	54007fe0	b.eq	0xfffff7f856ec  // b.none
   0x0000fffff7f846f4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f846f8:	37d806a9	tbnz	w9, #27, 0xfffff7f847cc
   0x0000fffff7f846fc:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84700:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84704:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84708:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8470c:	540001c1	b.ne	0xfffff7f84744  // b.any
   0x0000fffff7f84710:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84714:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8471c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84720:	54000121	b.ne	0xfffff7f84744  // b.any
   0x0000fffff7f84724:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84728:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8472c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84730:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84738:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f8473c:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84740:	14000030	b	0xfffff7f84800
   0x0000fffff7f84744:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84748:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8474c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84750:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84754:	54000120	b.eq	0xfffff7f84778  // b.none
   0x0000fffff7f84758:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f8475c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84764:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84768:	54000321	b.ne	0xfffff7f847cc  // b.any
   0x0000fffff7f8476c:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84770:	9e620120	scvtf	d0, x9
   0x0000fffff7f84774:	14000002	b	0xfffff7f8477c
   0x0000fffff7f84778:	fd405660	ldr	d0, [x19, #168]
   0x0000fffff7f8477c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84780:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84784:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84788:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8478c:	54000120	b.eq	0xfffff7f847b0  // b.none
   0x0000fffff7f84790:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84794:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84798:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8479c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847a0:	54000161	b.ne	0xfffff7f847cc  // b.any
   0x0000fffff7f847a4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f847a8:	9e620121	scvtf	d1, x9
   0x0000fffff7f847ac:	14000002	b	0xfffff7f847b4
   0x0000fffff7f847b0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f847b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f847b8:	fd005660	str	d0, [x19, #168]
   0x0000fffff7f847bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f847c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847c4:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f847c8:	17ffffde	b	0xfffff7f84740
   0x0000fffff7f847cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f847d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f847d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f847d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f847dc:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f847e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f847e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f847e8:	d294a890	mov	x16, #0xa544                	// #42308
   0x0000fffff7f847ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f847f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f847f4:	d63f0200	blr	x16
   0x0000fffff7f847f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f847fc:	540078e0	b.eq	0xfffff7f85718  // b.none
   0x0000fffff7f84800:	b940b269	ldr	w9, [x19, #176]
   0x0000fffff7f84804:	37d800e9	tbnz	w9, #27, 0xfffff7f84820
   0x0000fffff7f84808:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7f8480c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84810:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84814:	f9005e69	str	x9, [x19, #184]
   0x0000fffff7f84818:	b900b26a	str	w10, [x19, #176]
   0x0000fffff7f8481c:	1400000e	b	0xfffff7f84854
   0x0000fffff7f84820:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84824:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84828:	aa1303e1	mov	x1, x19
   0x0000fffff7f8482c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84830:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f84834:	aa1403e4	mov	x4, x20
   0x0000fffff7f84838:	aa1603e5	mov	x5, x22
   0x0000fffff7f8483c:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84840:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84844:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84848:	d63f0200	blr	x16
   0x0000fffff7f8484c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84850:	540077a0	b.eq	0xfffff7f85744  // b.none
   0x0000fffff7f84854:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84858:	37d80389	tbnz	w9, #27, 0xfffff7f848c8
   0x0000fffff7f8485c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84860:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84864:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84868:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8486c:	540002e1	b.ne	0xfffff7f848c8  // b.any
   0x0000fffff7f84870:	b940b269	ldr	w9, [x19, #176]
   0x0000fffff7f84874:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84878:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8487c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84880:	54000241	b.ne	0xfffff7f848c8  // b.any
   0x0000fffff7f84884:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84888:	f9405e6a	ldr	x10, [x19, #184]
   0x0000fffff7f8488c:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84890:	540001c0	b.eq	0xfffff7f848c8  // b.none
   0x0000fffff7f84894:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84898:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f8489c:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f848a0:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f848a4:	eb0b015f	cmp	x10, x11
   0x0000fffff7f848a8:	54000100	b.eq	0xfffff7f848c8  // b.none
   0x0000fffff7f848ac:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f848b0:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f848b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848bc:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f848c0:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f848c4:	1400000e	b	0xfffff7f848fc
   0x0000fffff7f848c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f848cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f848d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f848d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f848d8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f848dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f848e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f848e4:	d2937a10	mov	x16, #0x9bd0                	// #39888
   0x0000fffff7f848e8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f848ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f848f0:	d63f0200	blr	x16
   0x0000fffff7f848f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f848f8:	540073c0	b.eq	0xfffff7f85770  // b.none
   0x0000fffff7f848fc:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84900:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84904:	aa1303e1	mov	x1, x19
   0x0000fffff7f84908:	aa1503e2	mov	x2, x21
   0x0000fffff7f8490c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f84910:	aa1403e4	mov	x4, x20
   0x0000fffff7f84914:	aa1603e5	mov	x5, x22
   0x0000fffff7f84918:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f8491c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84920:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84924:	d63f0200	blr	x16
   0x0000fffff7f84928:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8492c:	54007380	b.eq	0xfffff7f8579c  // b.none
   0x0000fffff7f84930:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84934:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84938:	aa1303e1	mov	x1, x19
   0x0000fffff7f8493c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84940:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f84944:	aa1403e4	mov	x4, x20
   0x0000fffff7f84948:	aa1603e5	mov	x5, x22
   0x0000fffff7f8494c:	d294f290	mov	x16, #0xa794                	// #42900
   0x0000fffff7f84950:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84954:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84958:	d63f0200	blr	x16
   0x0000fffff7f8495c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84960:	54007340	b.eq	0xfffff7f857c8  // b.none
   0x0000fffff7f84964:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f84968:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8496c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84970:	aa1503e2	mov	x2, x21
   0x0000fffff7f84974:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f84978:	aa1403e4	mov	x4, x20
   0x0000fffff7f8497c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84980:	d297ce10	mov	x16, #0xbe70                	// #48752
   0x0000fffff7f84984:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84988:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8498c:	d63f0200	blr	x16
   0x0000fffff7f84990:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84994:	54007300	b.eq	0xfffff7f857f4  // b.none
   0x0000fffff7f84998:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8499c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f849a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f849a8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f849ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f849b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f849b4:	d2898810	mov	x16, #0x4c40                	// #19520
   0x0000fffff7f849b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f849bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849c0:	d63f0200	blr	x16
   0x0000fffff7f849c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f849c8:	540072c0	b.eq	0xfffff7f85820  // b.none
   0x0000fffff7f849cc:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f849d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f849d4:	54000480	b.eq	0xfffff7f84a64  // b.none
   0x0000fffff7f849d8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f849dc:	b940b3ea	ldr	w10, [sp, #176]
   0x0000fffff7f849e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849e4:	54000401	b.ne	0xfffff7f84a64  // b.any
   0x0000fffff7f849e8:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f849ec:	f9405fea	ldr	x10, [sp, #184]
   0x0000fffff7f849f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849f4:	54000381	b.ne	0xfffff7f84a64  // b.any
   0x0000fffff7f849f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f849fc:	37d8034d	tbnz	w13, #27, 0xfffff7f84a64
   0x0000fffff7f84a00:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84a04:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84a08:	36d8020e	tbz	w14, #27, 0xfffff7f84a48
   0x0000fffff7f84a0c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84a10:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84a14:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84a18:	54000261	b.ne	0xfffff7f84a64  // b.any
   0x0000fffff7f84a1c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84a20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84a24:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84a28:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84a2c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84a30:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84a34:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84a38:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84a3c:	54000149	b.ls	0xfffff7f84a64  // b.plast
   0x0000fffff7f84a40:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84a44:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84a48:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f84a4c:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f84a50:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84a54:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84a58:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84a5c:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f84a60:	1400000e	b	0xfffff7f84a98
   0x0000fffff7f84a64:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f84a68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84a6c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84a70:	aa1503e2	mov	x2, x21
   0x0000fffff7f84a74:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f84a78:	aa1403e4	mov	x4, x20
   0x0000fffff7f84a7c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84a80:	d293e410	mov	x16, #0x9f20                	// #40736
   0x0000fffff7f84a84:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84a88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84a8c:	d63f0200	blr	x16
   0x0000fffff7f84a90:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84a94:	54006dc0	b.eq	0xfffff7f8584c  // b.none
   0x0000fffff7f84a98:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84a9c:	37d80109	tbnz	w9, #27, 0xfffff7f84abc
   0x0000fffff7f84aa0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84aa4:	f2e7fa09	movk	x9, #0x3fd0, lsl #48
   0x0000fffff7f84aa8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84ab0:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f84ab4:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84ab8:	1400000e	b	0xfffff7f84af0
   0x0000fffff7f84abc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84ac0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84ac4:	aa1303e1	mov	x1, x19
   0x0000fffff7f84ac8:	aa1503e2	mov	x2, x21
   0x0000fffff7f84acc:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f84ad0:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ad4:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ad8:	d294f290	mov	x16, #0xa794                	// #42900
   0x0000fffff7f84adc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84ae0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ae4:	d63f0200	blr	x16
   0x0000fffff7f84ae8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84aec:	54006c60	b.eq	0xfffff7f85878  // b.none
   0x0000fffff7f84af0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84af4:	37d806a9	tbnz	w9, #27, 0xfffff7f84bc8
   0x0000fffff7f84af8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84afc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b08:	540001c1	b.ne	0xfffff7f84b40  // b.any
   0x0000fffff7f84b0c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84b10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b1c:	54000121	b.ne	0xfffff7f84b40  // b.any
   0x0000fffff7f84b20:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84b24:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f84b28:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84b2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b34:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f84b38:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f84b3c:	14000030	b	0xfffff7f84bfc
   0x0000fffff7f84b40:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84b44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84b48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b50:	54000120	b.eq	0xfffff7f84b74  // b.none
   0x0000fffff7f84b54:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84b58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b60:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b64:	54000321	b.ne	0xfffff7f84bc8  // b.any
   0x0000fffff7f84b68:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84b6c:	9e620120	scvtf	d0, x9
   0x0000fffff7f84b70:	14000002	b	0xfffff7f84b78
   0x0000fffff7f84b74:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7f84b78:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84b7c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84b80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b88:	54000120	b.eq	0xfffff7f84bac  // b.none
   0x0000fffff7f84b8c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84b90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b9c:	54000161	b.ne	0xfffff7f84bc8  // b.any
   0x0000fffff7f84ba0:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84ba4:	9e620121	scvtf	d1, x9
   0x0000fffff7f84ba8:	14000002	b	0xfffff7f84bb0
   0x0000fffff7f84bac:	fd405661	ldr	d1, [x19, #168]
   0x0000fffff7f84bb0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84bb4:	fd004e60	str	d0, [x19, #152]
   0x0000fffff7f84bb8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84bbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84bc0:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f84bc4:	17ffffde	b	0xfffff7f84b3c
   0x0000fffff7f84bc8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84bcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84bd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f84bd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f84bd8:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f84bdc:	aa1403e4	mov	x4, x20
   0x0000fffff7f84be0:	aa1603e5	mov	x5, x22
   0x0000fffff7f84be4:	d294a890	mov	x16, #0xa544                	// #42308
   0x0000fffff7f84be8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84bec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84bf0:	d63f0200	blr	x16
   0x0000fffff7f84bf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84bf8:	54006560	b.eq	0xfffff7f858a4  // b.none
   0x0000fffff7f84bfc:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f84c00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84c04:	aa1303e1	mov	x1, x19
   0x0000fffff7f84c08:	aa1503e2	mov	x2, x21
   0x0000fffff7f84c0c:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f84c10:	aa1403e4	mov	x4, x20
   0x0000fffff7f84c14:	aa1603e5	mov	x5, x22
   0x0000fffff7f84c18:	d297ce10	mov	x16, #0xbe70                	// #48752
   0x0000fffff7f84c1c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84c20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84c24:	d63f0200	blr	x16
   0x0000fffff7f84c28:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84c2c:	54006520	b.eq	0xfffff7f858d0  // b.none
   0x0000fffff7f84c30:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84c34:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84c38:	54000480	b.eq	0xfffff7f84cc8  // b.none
   0x0000fffff7f84c3c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84c40:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f84c44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c48:	54000401	b.ne	0xfffff7f84cc8  // b.any
   0x0000fffff7f84c4c:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84c50:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f84c54:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c58:	54000381	b.ne	0xfffff7f84cc8  // b.any
   0x0000fffff7f84c5c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84c60:	37d8034d	tbnz	w13, #27, 0xfffff7f84cc8
   0x0000fffff7f84c64:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84c68:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84c6c:	36d8020e	tbz	w14, #27, 0xfffff7f84cac
   0x0000fffff7f84c70:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84c74:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84c78:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84c7c:	54000261	b.ne	0xfffff7f84cc8  // b.any
   0x0000fffff7f84c80:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84c84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84c88:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84c8c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84c90:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84c94:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84c98:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84c9c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84ca0:	54000149	b.ls	0xfffff7f84cc8  // b.plast
   0x0000fffff7f84ca4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84ca8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84cac:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f84cb0:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f84cb4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84cb8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84cbc:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84cc0:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f84cc4:	1400000e	b	0xfffff7f84cfc
   0x0000fffff7f84cc8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84ccc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84cd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f84cd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f84cd8:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f84cdc:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ce0:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ce4:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f84ce8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84cec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84cf0:	d63f0200	blr	x16
   0x0000fffff7f84cf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84cf8:	54006020	b.eq	0xfffff7f858fc  // b.none
   0x0000fffff7f84cfc:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84d00:	37d800e9	tbnz	w9, #27, 0xfffff7f84d1c
   0x0000fffff7f84d04:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84d08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84d0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84d10:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f84d14:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f84d18:	1400000e	b	0xfffff7f84d50
   0x0000fffff7f84d1c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84d20:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84d24:	aa1303e1	mov	x1, x19
   0x0000fffff7f84d28:	aa1503e2	mov	x2, x21
   0x0000fffff7f84d2c:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f84d30:	aa1403e4	mov	x4, x20
   0x0000fffff7f84d34:	aa1603e5	mov	x5, x22
   0x0000fffff7f84d38:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84d3c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84d40:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84d44:	d63f0200	blr	x16
   0x0000fffff7f84d48:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84d4c:	54005ee0	b.eq	0xfffff7f85928  // b.none
   0x0000fffff7f84d50:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84d54:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84d58:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84d5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84d60:	540001c1	b.ne	0xfffff7f84d98  // b.any
   0x0000fffff7f84d64:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84d68:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84d6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84d70:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84d74:	540006e1	b.ne	0xfffff7f84e50  // b.any
   0x0000fffff7f84d78:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84d7c:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f84d80:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84d84:	eb09015f	cmp	x10, x9
   0x0000fffff7f84d88:	54000642	b.cs	0xfffff7f84e50  // b.hs, b.nlast
   0x0000fffff7f84d8c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84d90:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84d94:	14000014	b	0xfffff7f84de4
   0x0000fffff7f84d98:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84d9c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84da0:	54000580	b.eq	0xfffff7f84e50  // b.none
   0x0000fffff7f84da4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84da8:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84dac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84db0:	54000501	b.ne	0xfffff7f84e50  // b.any
   0x0000fffff7f84db4:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f84db8:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84dbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84dc0:	54000481	b.ne	0xfffff7f84e50  // b.any
   0x0000fffff7f84dc4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84dc8:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f84dcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84dd0:	54000401	b.ne	0xfffff7f84e50  // b.any
   0x0000fffff7f84dd4:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84dd8:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f84ddc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84de0:	54000381	b.ne	0xfffff7f84e50  // b.any
   0x0000fffff7f84de4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84de8:	37d8034d	tbnz	w13, #27, 0xfffff7f84e50
   0x0000fffff7f84dec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84df0:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84df4:	36d8020e	tbz	w14, #27, 0xfffff7f84e34
   0x0000fffff7f84df8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84dfc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84e00:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84e04:	54000261	b.ne	0xfffff7f84e50  // b.any
   0x0000fffff7f84e08:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84e0c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84e10:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84e14:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84e18:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84e1c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84e20:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84e24:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84e28:	54000149	b.ls	0xfffff7f84e50  // b.plast
   0x0000fffff7f84e2c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84e30:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84e34:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f84e38:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f84e3c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84e40:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84e44:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84e48:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f84e4c:	1400000e	b	0xfffff7f84e84
   0x0000fffff7f84e50:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84e54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84e58:	aa1303e1	mov	x1, x19
   0x0000fffff7f84e5c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84e60:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f84e64:	aa1403e4	mov	x4, x20
   0x0000fffff7f84e68:	aa1603e5	mov	x5, x22
   0x0000fffff7f84e6c:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84e70:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84e74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84e78:	d63f0200	blr	x16
   0x0000fffff7f84e7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84e80:	540056a0	b.eq	0xfffff7f85954  // b.none
   0x0000fffff7f84e84:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7f84e88:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84e8c:	54000480	b.eq	0xfffff7f84f1c  // b.none
   0x0000fffff7f84e90:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84e94:	b94093ea	ldr	w10, [sp, #144]
   0x0000fffff7f84e98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84e9c:	54000401	b.ne	0xfffff7f84f1c  // b.any
   0x0000fffff7f84ea0:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84ea4:	f9404fea	ldr	x10, [sp, #152]
   0x0000fffff7f84ea8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84eac:	54000381	b.ne	0xfffff7f84f1c  // b.any
   0x0000fffff7f84eb0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84eb4:	37d8034d	tbnz	w13, #27, 0xfffff7f84f1c
   0x0000fffff7f84eb8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84ebc:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84ec0:	36d8020e	tbz	w14, #27, 0xfffff7f84f00
   0x0000fffff7f84ec4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84ec8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84ecc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84ed0:	54000261	b.ne	0xfffff7f84f1c  // b.any
   0x0000fffff7f84ed4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84ed8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84edc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84ee0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84ee4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84ee8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84eec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84ef0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84ef4:	54000149	b.ls	0xfffff7f84f1c  // b.plast
   0x0000fffff7f84ef8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84efc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84f00:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f84f04:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f84f08:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84f0c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84f10:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84f14:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f84f18:	1400000e	b	0xfffff7f84f50
   0x0000fffff7f84f1c:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f84f20:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84f24:	aa1303e1	mov	x1, x19
   0x0000fffff7f84f28:	aa1503e2	mov	x2, x21
   0x0000fffff7f84f2c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f84f30:	aa1403e4	mov	x4, x20
   0x0000fffff7f84f34:	aa1603e5	mov	x5, x22
   0x0000fffff7f84f38:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f84f3c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84f40:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84f44:	d63f0200	blr	x16
   0x0000fffff7f84f48:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84f4c:	540051a0	b.eq	0xfffff7f85980  // b.none
   0x0000fffff7f84f50:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84f54:	37d800e9	tbnz	w9, #27, 0xfffff7f84f70
   0x0000fffff7f84f58:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f84f5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84f60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84f64:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f84f68:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84f6c:	1400000e	b	0xfffff7f84fa4
   0x0000fffff7f84f70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84f74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84f78:	aa1303e1	mov	x1, x19
   0x0000fffff7f84f7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84f80:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f84f84:	aa1403e4	mov	x4, x20
   0x0000fffff7f84f88:	aa1603e5	mov	x5, x22
   0x0000fffff7f84f8c:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84f90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84f94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84f98:	d63f0200	blr	x16
   0x0000fffff7f84f9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84fa0:	54005060	b.eq	0xfffff7f859ac  // b.none
   0x0000fffff7f84fa4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84fa8:	37d80389	tbnz	w9, #27, 0xfffff7f85018
   0x0000fffff7f84fac:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84fb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84fb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84fbc:	540002e1	b.ne	0xfffff7f85018  // b.any
   0x0000fffff7f84fc0:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84fc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84fc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84fd0:	54000241	b.ne	0xfffff7f85018  // b.any
   0x0000fffff7f84fd4:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84fd8:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f84fdc:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84fe0:	540001c0	b.eq	0xfffff7f85018  // b.none
   0x0000fffff7f84fe4:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84fe8:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84fec:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84ff0:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84ff4:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84ff8:	54000100	b.eq	0xfffff7f85018  // b.none
   0x0000fffff7f84ffc:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85000:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85004:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8500c:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f85010:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f85014:	1400000e	b	0xfffff7f8504c
   0x0000fffff7f85018:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8501c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85020:	aa1303e1	mov	x1, x19
   0x0000fffff7f85024:	aa1503e2	mov	x2, x21
   0x0000fffff7f85028:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f8502c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85030:	aa1603e5	mov	x5, x22
   0x0000fffff7f85034:	d2937a10	mov	x16, #0x9bd0                	// #39888
   0x0000fffff7f85038:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8503c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85040:	d63f0200	blr	x16
   0x0000fffff7f85044:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85048:	54004c80	b.eq	0xfffff7f859d8  // b.none
   0x0000fffff7f8504c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85050:	37d806a9	tbnz	w9, #27, 0xfffff7f85124
   0x0000fffff7f85054:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85058:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8505c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85060:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85064:	540001c1	b.ne	0xfffff7f8509c  // b.any
   0x0000fffff7f85068:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8506c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85070:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85074:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85078:	54000121	b.ne	0xfffff7f8509c  // b.any
   0x0000fffff7f8507c:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85080:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f85084:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85088:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8508c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85090:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f85094:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f85098:	14000030	b	0xfffff7f85158
   0x0000fffff7f8509c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f850a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f850a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850ac:	54000120	b.eq	0xfffff7f850d0  // b.none
   0x0000fffff7f850b0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f850b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f850b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850c0:	54000321	b.ne	0xfffff7f85124  // b.any
   0x0000fffff7f850c4:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f850c8:	9e620120	scvtf	d0, x9
   0x0000fffff7f850cc:	14000002	b	0xfffff7f850d4
   0x0000fffff7f850d0:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f850d4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f850d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f850dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850e4:	54000120	b.eq	0xfffff7f85108  // b.none
   0x0000fffff7f850e8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f850ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f850f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850f8:	54000161	b.ne	0xfffff7f85124  // b.any
   0x0000fffff7f850fc:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f85100:	9e620121	scvtf	d1, x9
   0x0000fffff7f85104:	14000002	b	0xfffff7f8510c
   0x0000fffff7f85108:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f8510c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85110:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f85114:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85118:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8511c:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f85120:	17ffffde	b	0xfffff7f85098
   0x0000fffff7f85124:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85128:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8512c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85130:	aa1503e2	mov	x2, x21
   0x0000fffff7f85134:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f85138:	aa1403e4	mov	x4, x20
   0x0000fffff7f8513c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85140:	d294a890	mov	x16, #0xa544                	// #42308
   0x0000fffff7f85144:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85148:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8514c:	d63f0200	blr	x16
   0x0000fffff7f85150:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85154:	54004580	b.eq	0xfffff7f85a04  // b.none
   0x0000fffff7f85158:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f8515c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85160:	54000480	b.eq	0xfffff7f851f0  // b.none
   0x0000fffff7f85164:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85168:	b940b3ea	ldr	w10, [sp, #176]
   0x0000fffff7f8516c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85170:	54000401	b.ne	0xfffff7f851f0  // b.any
   0x0000fffff7f85174:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85178:	f9405fea	ldr	x10, [sp, #184]
   0x0000fffff7f8517c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85180:	54000381	b.ne	0xfffff7f851f0  // b.any
   0x0000fffff7f85184:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85188:	37d8034d	tbnz	w13, #27, 0xfffff7f851f0
   0x0000fffff7f8518c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85190:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f85194:	36d8020e	tbz	w14, #27, 0xfffff7f851d4
   0x0000fffff7f85198:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8519c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f851a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f851a4:	54000261	b.ne	0xfffff7f851f0  // b.any
   0x0000fffff7f851a8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f851ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f851b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f851b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f851b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f851bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f851c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f851c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f851c8:	54000149	b.ls	0xfffff7f851f0  // b.plast
   0x0000fffff7f851cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f851d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f851d4:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f851d8:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f851dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f851e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f851e4:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f851e8:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f851ec:	1400000e	b	0xfffff7f85224
   0x0000fffff7f851f0:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f851f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f851f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f851fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f85200:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f85204:	aa1403e4	mov	x4, x20
   0x0000fffff7f85208:	aa1603e5	mov	x5, x22
   0x0000fffff7f8520c:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f85210:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85214:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85218:	d63f0200	blr	x16
   0x0000fffff7f8521c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85220:	54004080	b.eq	0xfffff7f85a30  // b.none
   0x0000fffff7f85224:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85228:	37d806a9	tbnz	w9, #27, 0xfffff7f852fc
   0x0000fffff7f8522c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85230:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85234:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85238:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8523c:	540001c1	b.ne	0xfffff7f85274  // b.any
   0x0000fffff7f85240:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85244:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85248:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8524c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85250:	54000121	b.ne	0xfffff7f85274  // b.any
   0x0000fffff7f85254:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85258:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f8525c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85260:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85264:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85268:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f8526c:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f85270:	14000030	b	0xfffff7f85330
   0x0000fffff7f85274:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85278:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8527c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85280:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85284:	54000120	b.eq	0xfffff7f852a8  // b.none
   0x0000fffff7f85288:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f8528c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85290:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85294:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85298:	54000321	b.ne	0xfffff7f852fc  // b.any
   0x0000fffff7f8529c:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f852a0:	9e620120	scvtf	d0, x9
   0x0000fffff7f852a4:	14000002	b	0xfffff7f852ac
   0x0000fffff7f852a8:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f852ac:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f852b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f852b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852bc:	54000120	b.eq	0xfffff7f852e0  // b.none
   0x0000fffff7f852c0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f852c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852d0:	54000161	b.ne	0xfffff7f852fc  // b.any
   0x0000fffff7f852d4:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f852d8:	9e620121	scvtf	d1, x9
   0x0000fffff7f852dc:	14000002	b	0xfffff7f852e4
   0x0000fffff7f852e0:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f852e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f852e8:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f852ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f852f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852f4:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f852f8:	17ffffde	b	0xfffff7f85270
   0x0000fffff7f852fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85304:	aa1303e1	mov	x1, x19
   0x0000fffff7f85308:	aa1503e2	mov	x2, x21
   0x0000fffff7f8530c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f85310:	aa1403e4	mov	x4, x20
   0x0000fffff7f85314:	aa1603e5	mov	x5, x22
   0x0000fffff7f85318:	d294a890	mov	x16, #0xa544                	// #42308
   0x0000fffff7f8531c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85324:	d63f0200	blr	x16
   0x0000fffff7f85328:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8532c:	54003980	b.eq	0xfffff7f85a5c  // b.none
   0x0000fffff7f85330:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85334:	37d806a9	tbnz	w9, #27, 0xfffff7f85408
   0x0000fffff7f85338:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8533c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85344:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85348:	540001c1	b.ne	0xfffff7f85380  // b.any
   0x0000fffff7f8534c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85350:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85354:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85358:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8535c:	54000121	b.ne	0xfffff7f85380  // b.any
   0x0000fffff7f85360:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85364:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7f85368:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8536c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85374:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f85378:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f8537c:	14000030	b	0xfffff7f8543c
   0x0000fffff7f85380:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85384:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85388:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8538c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85390:	54000120	b.eq	0xfffff7f853b4  // b.none
   0x0000fffff7f85394:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85398:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8539c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853a4:	54000321	b.ne	0xfffff7f85408  // b.any
   0x0000fffff7f853a8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f853ac:	9e620120	scvtf	d0, x9
   0x0000fffff7f853b0:	14000002	b	0xfffff7f853b8
   0x0000fffff7f853b4:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f853b8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f853bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f853c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853c8:	54000120	b.eq	0xfffff7f853ec  // b.none
   0x0000fffff7f853cc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f853d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f853d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853dc:	54000161	b.ne	0xfffff7f85408  // b.any
   0x0000fffff7f853e0:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f853e4:	9e620121	scvtf	d1, x9
   0x0000fffff7f853e8:	14000002	b	0xfffff7f853f0
   0x0000fffff7f853ec:	fd404661	ldr	d1, [x19, #136]
   0x0000fffff7f853f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f853f4:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f853f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f853fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85400:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85404:	17ffffde	b	0xfffff7f8537c
   0x0000fffff7f85408:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8540c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85410:	aa1303e1	mov	x1, x19
   0x0000fffff7f85414:	aa1503e2	mov	x2, x21
   0x0000fffff7f85418:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f8541c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85420:	aa1603e5	mov	x5, x22
   0x0000fffff7f85424:	d294a890	mov	x16, #0xa544                	// #42308
   0x0000fffff7f85428:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8542c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85430:	d63f0200	blr	x16
   0x0000fffff7f85434:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85438:	54003280	b.eq	0xfffff7f85a88  // b.none
   0x0000fffff7f8543c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85440:	37d80269	tbnz	w9, #27, 0xfffff7f8548c
   0x0000fffff7f85444:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85448:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8544c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85450:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85454:	540001c1	b.ne	0xfffff7f8548c  // b.any
   0x0000fffff7f85458:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8545c:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f85460:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f85464:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f85468:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8546c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85470:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f85474:	aa0b03e9	mov	x9, x11
   0x0000fffff7f85478:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8547c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85480:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85484:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85488:	1400000e	b	0xfffff7f854c0
   0x0000fffff7f8548c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85490:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85494:	aa1303e1	mov	x1, x19
   0x0000fffff7f85498:	aa1503e2	mov	x2, x21
   0x0000fffff7f8549c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f854a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f854a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f854a8:	d292ce10	mov	x16, #0x9670                	// #38512
   0x0000fffff7f854ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f854b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854b4:	d63f0200	blr	x16
   0x0000fffff7f854b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f854bc:	54002fc0	b.eq	0xfffff7f85ab4  // b.none
   0x0000fffff7f854c0:	17fffb10	b	0xfffff7f84100
   0x0000fffff7f854c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f854c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f854cc:	aa1303e1	mov	x1, x19
   0x0000fffff7f854d0:	aa1503e2	mov	x2, x21
   0x0000fffff7f854d4:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f854d8:	aa1403e4	mov	x4, x20
   0x0000fffff7f854dc:	aa1603e5	mov	x5, x22
   0x0000fffff7f854e0:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f854e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f854e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854ec:	d63f0200	blr	x16
   0x0000fffff7f854f0:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f854f4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f854f8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f854fc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85500:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85504:	d65f03c0	ret
   0x0000fffff7f85508:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8550c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85510:	b9000289	str	w9, [x20]
   0x0000fffff7f85514:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85518:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8551c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85520:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85524:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85528:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8552c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85530:	d65f03c0	ret
   0x0000fffff7f85534:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85538:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8553c:	b9000289	str	w9, [x20]
   0x0000fffff7f85540:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85544:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85548:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f8554c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85550:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85554:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85558:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8555c:	d65f03c0	ret
   0x0000fffff7f85560:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85564:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85568:	b9000289	str	w9, [x20]
   0x0000fffff7f8556c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85570:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85574:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85578:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8557c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85580:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85584:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85588:	d65f03c0	ret
   0x0000fffff7f8558c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85590:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85594:	b9000289	str	w9, [x20]
   0x0000fffff7f85598:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f8559c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f855a0:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f855a4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f855a8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f855ac:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f855b0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f855b4:	d65f03c0	ret
   0x0000fffff7f855b8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f855bc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f855c0:	b9000289	str	w9, [x20]
   0x0000fffff7f855c4:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f855c8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f855cc:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f855d0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f855d4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f855d8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f855dc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f855e0:	d65f03c0	ret
   0x0000fffff7f855e4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f855e8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f855ec:	b9000289	str	w9, [x20]
   0x0000fffff7f855f0:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f855f4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f855f8:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f855fc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85600:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85604:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85608:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8560c:	d65f03c0	ret
   0x0000fffff7f85610:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85614:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85618:	b9000289	str	w9, [x20]
   0x0000fffff7f8561c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85620:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85624:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85628:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8562c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85630:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85634:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85638:	d65f03c0	ret
   0x0000fffff7f8563c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85640:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85644:	b9000289	str	w9, [x20]
   0x0000fffff7f85648:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f8564c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85650:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85654:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85658:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8565c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85660:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85664:	d65f03c0	ret
   0x0000fffff7f85668:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8566c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85670:	b9000289	str	w9, [x20]
   0x0000fffff7f85674:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85678:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8567c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85680:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85684:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85688:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8568c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85690:	d65f03c0	ret
   0x0000fffff7f85694:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85698:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8569c:	b9000289	str	w9, [x20]
   0x0000fffff7f856a0:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f856a4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f856a8:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f856ac:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f856b0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f856b4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f856b8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f856bc:	d65f03c0	ret
   0x0000fffff7f856c0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f856c4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f856c8:	b9000289	str	w9, [x20]
   0x0000fffff7f856cc:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f856d0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f856d4:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f856d8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f856dc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f856e0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f856e4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f856e8:	d65f03c0	ret
   0x0000fffff7f856ec:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f856f0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f856f4:	b9000289	str	w9, [x20]
   0x0000fffff7f856f8:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f856fc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85700:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85704:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85708:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8570c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85710:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85714:	d65f03c0	ret
   0x0000fffff7f85718:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8571c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85720:	b9000289	str	w9, [x20]
   0x0000fffff7f85724:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85728:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8572c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85730:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85734:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85738:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8573c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85740:	d65f03c0	ret
   0x0000fffff7f85744:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85748:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8574c:	b9000289	str	w9, [x20]
   0x0000fffff7f85750:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85754:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85758:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f8575c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85760:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85764:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85768:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8576c:	d65f03c0	ret
   0x0000fffff7f85770:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85774:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85778:	b9000289	str	w9, [x20]
   0x0000fffff7f8577c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85780:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85784:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85788:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8578c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85790:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85794:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85798:	d65f03c0	ret
   0x0000fffff7f8579c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f857a0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f857a4:	b9000289	str	w9, [x20]
   0x0000fffff7f857a8:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f857ac:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f857b0:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f857b4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f857b8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f857bc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f857c0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f857c4:	d65f03c0	ret
   0x0000fffff7f857c8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f857cc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f857d0:	b9000289	str	w9, [x20]
   0x0000fffff7f857d4:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f857d8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f857dc:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f857e0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f857e4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f857e8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f857ec:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f857f0:	d65f03c0	ret
   0x0000fffff7f857f4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f857f8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f857fc:	b9000289	str	w9, [x20]
   0x0000fffff7f85800:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f85804:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85808:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f8580c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85810:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85814:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85818:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8581c:	d65f03c0	ret
   0x0000fffff7f85820:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85824:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85828:	b9000289	str	w9, [x20]
   0x0000fffff7f8582c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f85830:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85834:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85838:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8583c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85840:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85844:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85848:	d65f03c0	ret
   0x0000fffff7f8584c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85850:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85854:	b9000289	str	w9, [x20]
   0x0000fffff7f85858:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f8585c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85860:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85864:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85868:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8586c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85870:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85874:	d65f03c0	ret
   0x0000fffff7f85878:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8587c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85880:	b9000289	str	w9, [x20]
   0x0000fffff7f85884:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f85888:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8588c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85890:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85894:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85898:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8589c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f858a0:	d65f03c0	ret
   0x0000fffff7f858a4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f858a8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f858ac:	b9000289	str	w9, [x20]
   0x0000fffff7f858b0:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f858b4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f858b8:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f858bc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f858c0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f858c4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f858c8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f858cc:	d65f03c0	ret
   0x0000fffff7f858d0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f858d4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f858d8:	b9000289	str	w9, [x20]
   0x0000fffff7f858dc:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f858e0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f858e4:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f858e8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f858ec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f858f0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f858f4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f858f8:	d65f03c0	ret
   0x0000fffff7f858fc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85900:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85904:	b9000289	str	w9, [x20]
   0x0000fffff7f85908:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f8590c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85910:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85914:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85918:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8591c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85920:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85924:	d65f03c0	ret
   0x0000fffff7f85928:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8592c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85930:	b9000289	str	w9, [x20]
   0x0000fffff7f85934:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f85938:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8593c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85940:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85944:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85948:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8594c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85950:	d65f03c0	ret
   0x0000fffff7f85954:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85958:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8595c:	b9000289	str	w9, [x20]
   0x0000fffff7f85960:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f85964:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85968:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f8596c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85970:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85974:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85978:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8597c:	d65f03c0	ret
   0x0000fffff7f85980:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85984:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85988:	b9000289	str	w9, [x20]
   0x0000fffff7f8598c:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f85990:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85994:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85998:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8599c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f859a0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f859a4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f859a8:	d65f03c0	ret
   0x0000fffff7f859ac:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f859b0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f859b4:	b9000289	str	w9, [x20]
   0x0000fffff7f859b8:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f859bc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f859c0:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f859c4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f859c8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f859cc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f859d0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f859d4:	d65f03c0	ret
   0x0000fffff7f859d8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f859dc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f859e0:	b9000289	str	w9, [x20]
   0x0000fffff7f859e4:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f859e8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f859ec:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f859f0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f859f4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f859f8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f859fc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a00:	d65f03c0	ret
   0x0000fffff7f85a04:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a08:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a0c:	b9000289	str	w9, [x20]
   0x0000fffff7f85a10:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f85a14:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a18:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85a1c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a20:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a24:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a28:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a2c:	d65f03c0	ret
   0x0000fffff7f85a30:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a34:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a38:	b9000289	str	w9, [x20]
   0x0000fffff7f85a3c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f85a40:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a44:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85a48:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a4c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a50:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a54:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a58:	d65f03c0	ret
   0x0000fffff7f85a5c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a60:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a64:	b9000289	str	w9, [x20]
   0x0000fffff7f85a68:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f85a6c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a70:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85a74:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a78:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a7c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a80:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a84:	d65f03c0	ret
   0x0000fffff7f85a88:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a8c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a90:	b9000289	str	w9, [x20]
   0x0000fffff7f85a94:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f85a98:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a9c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85aa0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85aa4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85aa8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85aac:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ab0:	d65f03c0	ret
   0x0000fffff7f85ab4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85ab8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85abc:	b9000289	str	w9, [x20]
   0x0000fffff7f85ac0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f85ac4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ac8:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85acc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85ad0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ad4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ad8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85adc:	d65f03c0	ret
   0x0000fffff7f85ae0:	00000000	udf	#0
   0x0000fffff7f85ae4:	00000000	udf	#0
   0x0000fffff7f85ae8:	00000000	udf	#0
   0x0000fffff7f85aec:	00000000	udf	#0
   0x0000fffff7f85af0:	00000000	udf	#0
   0x0000fffff7f85af4:	00000000	udf	#0
   0x0000fffff7f85af8:	00000000	udf	#0
   0x0000fffff7f85afc:	00000000	udf	#0
   0x0000fffff7f85b00:	00000000	udf	#0
   0x0000fffff7f85b04:	00000000	udf	#0
   0x0000fffff7f85b08:	00000000	udf	#0
   0x0000fffff7f85b0c:	00000000	udf	#0
   0x0000fffff7f85b10:	00000000	udf	#0
   0x0000fffff7f85b14:	00000000	udf	#0
   0x0000fffff7f85b18:	00000000	udf	#0
   0x0000fffff7f85b1c:	00000000	udf	#0
   0x0000fffff7f85b20:	00000000	udf	#0
   0x0000fffff7f85b24:	00000000	udf	#0
   0x0000fffff7f85b28:	00000000	udf	#0
   0x0000fffff7f85b2c:	00000000	udf	#0
   0x0000fffff7f85b30:	00000000	udf	#0
   0x0000fffff7f85b34:	00000000	udf	#0
   0x0000fffff7f85b38:	00000000	udf	#0
   0x0000fffff7f85b3c:	00000000	udf	#0
   0x0000fffff7f85b40:	00000000	udf	#0
   0x0000fffff7f85b44:	00000000	udf	#0
   0x0000fffff7f85b48:	00000000	udf	#0
   0x0000fffff7f85b4c:	00000000	udf	#0
   0x0000fffff7f85b50:	00000000	udf	#0
   0x0000fffff7f85b54:	00000000	udf	#0
   0x0000fffff7f85b58:	00000000	udf	#0
   0x0000fffff7f85b5c:	00000000	udf	#0
   0x0000fffff7f85b60:	00000000	udf	#0
   0x0000fffff7f85b64:	00000000	udf	#0
   0x0000fffff7f85b68:	00000000	udf	#0
   0x0000fffff7f85b6c:	00000000	udf	#0
   0x0000fffff7f85b70:	00000000	udf	#0
   0x0000fffff7f85b74:	00000000	udf	#0
   0x0000fffff7f85b78:	00000000	udf	#0
   0x0000fffff7f85b7c:	00000000	udf	#0
   0x0000fffff7f85b80:	00000000	udf	#0
   0x0000fffff7f85b84:	00000000	udf	#0
   0x0000fffff7f85b88:	00000000	udf	#0
   0x0000fffff7f85b8c:	00000000	udf	#0
   0x0000fffff7f85b90:	00000000	udf	#0
   0x0000fffff7f85b94:	00000000	udf	#0
   0x0000fffff7f85b98:	00000000	udf	#0
   0x0000fffff7f85b9c:	00000000	udf	#0
   0x0000fffff7f85ba0:	00000000	udf	#0
   0x0000fffff7f85ba4:	00000000	udf	#0
   0x0000fffff7f85ba8:	00000000	udf	#0
   0x0000fffff7f85bac:	00000000	udf	#0
   0x0000fffff7f85bb0:	00000000	udf	#0
   0x0000fffff7f85bb4:	00000000	udf	#0
   0x0000fffff7f85bb8:	00000000	udf	#0
   0x0000fffff7f85bbc:	00000000	udf	#0
   0x0000fffff7f85bc0:	00000000	udf	#0
   0x0000fffff7f85bc4:	00000000	udf	#0
   0x0000fffff7f85bc8:	00000000	udf	#0
   0x0000fffff7f85bcc:	00000000	udf	#0
   0x0000fffff7f85bd0:	00000000	udf	#0
   0x0000fffff7f85bd4:	00000000	udf	#0
   0x0000fffff7f85bd8:	00000000	udf	#0
   0x0000fffff7f85bdc:	00000000	udf	#0
   0x0000fffff7f85be0:	00000000	udf	#0
   0x0000fffff7f85be4:	00000000	udf	#0
   0x0000fffff7f85be8:	00000000	udf	#0
   0x0000fffff7f85bec:	00000000	udf	#0
   0x0000fffff7f85bf0:	00000000	udf	#0
   0x0000fffff7f85bf4:	00000000	udf	#0
   0x0000fffff7f85bf8:	00000000	udf	#0
   0x0000fffff7f85bfc:	00000000	udf	#0
   0x0000fffff7f85c00:	00000000	udf	#0
   0x0000fffff7f85c04:	00000000	udf	#0
   0x0000fffff7f85c08:	00000000	udf	#0
   0x0000fffff7f85c0c:	00000000	udf	#0
   0x0000fffff7f85c10:	00000000	udf	#0
   0x0000fffff7f85c14:	00000000	udf	#0
   0x0000fffff7f85c18:	00000000	udf	#0
   0x0000fffff7f85c1c:	00000000	udf	#0
   0x0000fffff7f85c20:	00000000	udf	#0
   0x0000fffff7f85c24:	00000000	udf	#0
   0x0000fffff7f85c28:	00000000	udf	#0
   0x0000fffff7f85c2c:	00000000	udf	#0
   0x0000fffff7f85c30:	00000000	udf	#0
   0x0000fffff7f85c34:	00000000	udf	#0
   0x0000fffff7f85c38:	00000000	udf	#0
   0x0000fffff7f85c3c:	00000000	udf	#0
   0x0000fffff7f85c40:	00000000	udf	#0
   0x0000fffff7f85c44:	00000000	udf	#0
   0x0000fffff7f85c48:	00000000	udf	#0
   0x0000fffff7f85c4c:	00000000	udf	#0
   0x0000fffff7f85c50:	00000000	udf	#0
   0x0000fffff7f85c54:	00000000	udf	#0
   0x0000fffff7f85c58:	00000000	udf	#0
   0x0000fffff7f85c5c:	00000000	udf	#0
   0x0000fffff7f85c60:	00000000	udf	#0
   0x0000fffff7f85c64:	00000000	udf	#0
   0x0000fffff7f85c68:	00000000	udf	#0
   0x0000fffff7f85c6c:	00000000	udf	#0
   0x0000fffff7f85c70:	00000000	udf	#0
   0x0000fffff7f85c74:	00000000	udf	#0
   0x0000fffff7f85c78:	00000000	udf	#0
   0x0000fffff7f85c7c:	00000000	udf	#0
   0x0000fffff7f85c80:	00000000	udf	#0
   0x0000fffff7f85c84:	00000000	udf	#0
   0x0000fffff7f85c88:	00000000	udf	#0
   0x0000fffff7f85c8c:	00000000	udf	#0
   0x0000fffff7f85c90:	00000000	udf	#0
   0x0000fffff7f85c94:	00000000	udf	#0
   0x0000fffff7f85c98:	00000000	udf	#0
   0x0000fffff7f85c9c:	00000000	udf	#0
   0x0000fffff7f85ca0:	00000000	udf	#0
   0x0000fffff7f85ca4:	00000000	udf	#0
   0x0000fffff7f85ca8:	00000000	udf	#0
   0x0000fffff7f85cac:	00000000	udf	#0
   0x0000fffff7f85cb0:	00000000	udf	#0
   0x0000fffff7f85cb4:	00000000	udf	#0
   0x0000fffff7f85cb8:	00000000	udf	#0
   0x0000fffff7f85cbc:	00000000	udf	#0
   0x0000fffff7f85cc0:	00000000	udf	#0
   0x0000fffff7f85cc4:	00000000	udf	#0
   0x0000fffff7f85cc8:	00000000	udf	#0
   0x0000fffff7f85ccc:	00000000	udf	#0
   0x0000fffff7f85cd0:	00000000	udf	#0
   0x0000fffff7f85cd4:	00000000	udf	#0
   0x0000fffff7f85cd8:	00000000	udf	#0
   0x0000fffff7f85cdc:	00000000	udf	#0
   0x0000fffff7f85ce0:	00000000	udf	#0
   0x0000fffff7f85ce4:	00000000	udf	#0
   0x0000fffff7f85ce8:	00000000	udf	#0
   0x0000fffff7f85cec:	00000000	udf	#0
   0x0000fffff7f85cf0:	00000000	udf	#0
   0x0000fffff7f85cf4:	00000000	udf	#0
   0x0000fffff7f85cf8:	00000000	udf	#0
   0x0000fffff7f85cfc:	00000000	udf	#0
   0x0000fffff7f85d00:	00000000	udf	#0
   0x0000fffff7f85d04:	00000000	udf	#0
   0x0000fffff7f85d08:	00000000	udf	#0
   0x0000fffff7f85d0c:	00000000	udf	#0
   0x0000fffff7f85d10:	00000000	udf	#0
   0x0000fffff7f85d14:	00000000	udf	#0
   0x0000fffff7f85d18:	00000000	udf	#0
   0x0000fffff7f85d1c:	00000000	udf	#0
   0x0000fffff7f85d20:	00000000	udf	#0
   0x0000fffff7f85d24:	00000000	udf	#0
   0x0000fffff7f85d28:	00000000	udf	#0
   0x0000fffff7f85d2c:	00000000	udf	#0
   0x0000fffff7f85d30:	00000000	udf	#0
   0x0000fffff7f85d34:	00000000	udf	#0
   0x0000fffff7f85d38:	00000000	udf	#0
   0x0000fffff7f85d3c:	00000000	udf	#0
   0x0000fffff7f85d40:	00000000	udf	#0
   0x0000fffff7f85d44:	00000000	udf	#0
   0x0000fffff7f85d48:	00000000	udf	#0
   0x0000fffff7f85d4c:	00000000	udf	#0
   0x0000fffff7f85d50:	00000000	udf	#0
   0x0000fffff7f85d54:	00000000	udf	#0
   0x0000fffff7f85d58:	00000000	udf	#0
   0x0000fffff7f85d5c:	00000000	udf	#0
   0x0000fffff7f85d60:	00000000	udf	#0
   0x0000fffff7f85d64:	00000000	udf	#0
   0x0000fffff7f85d68:	00000000	udf	#0
   0x0000fffff7f85d6c:	00000000	udf	#0
   0x0000fffff7f85d70:	00000000	udf	#0
   0x0000fffff7f85d74:	00000000	udf	#0
   0x0000fffff7f85d78:	00000000	udf	#0
   0x0000fffff7f85d7c:	00000000	udf	#0
   0x0000fffff7f85d80:	00000000	udf	#0
   0x0000fffff7f85d84:	00000000	udf	#0
   0x0000fffff7f85d88:	00000000	udf	#0
   0x0000fffff7f85d8c:	00000000	udf	#0
   0x0000fffff7f85d90:	00000000	udf	#0
   0x0000fffff7f85d94:	00000000	udf	#0
   0x0000fffff7f85d98:	00000000	udf	#0
   0x0000fffff7f85d9c:	00000000	udf	#0
   0x0000fffff7f85da0:	00000000	udf	#0
   0x0000fffff7f85da4:	00000000	udf	#0
   0x0000fffff7f85da8:	00000000	udf	#0
   0x0000fffff7f85dac:	00000000	udf	#0
   0x0000fffff7f85db0:	00000000	udf	#0
   0x0000fffff7f85db4:	00000000	udf	#0
   0x0000fffff7f85db8:	00000000	udf	#0
   0x0000fffff7f85dbc:	00000000	udf	#0
   0x0000fffff7f85dc0:	00000000	udf	#0
   0x0000fffff7f85dc4:	00000000	udf	#0
   0x0000fffff7f85dc8:	00000000	udf	#0
   0x0000fffff7f85dcc:	00000000	udf	#0
   0x0000fffff7f85dd0:	00000000	udf	#0
   0x0000fffff7f85dd4:	00000000	udf	#0
   0x0000fffff7f85dd8:	00000000	udf	#0
   0x0000fffff7f85ddc:	00000000	udf	#0
   0x0000fffff7f85de0:	00000000	udf	#0
   0x0000fffff7f85de4:	00000000	udf	#0
   0x0000fffff7f85de8:	00000000	udf	#0
   0x0000fffff7f85dec:	00000000	udf	#0
   0x0000fffff7f85df0:	00000000	udf	#0
   0x0000fffff7f85df4:	00000000	udf	#0
   0x0000fffff7f85df8:	00000000	udf	#0
   0x0000fffff7f85dfc:	00000000	udf	#0
   0x0000fffff7f85e00:	00000000	udf	#0
   0x0000fffff7f85e04:	00000000	udf	#0
   0x0000fffff7f85e08:	00000000	udf	#0
   0x0000fffff7f85e0c:	00000000	udf	#0
   0x0000fffff7f85e10:	00000000	udf	#0
   0x0000fffff7f85e14:	00000000	udf	#0
   0x0000fffff7f85e18:	00000000	udf	#0
   0x0000fffff7f85e1c:	00000000	udf	#0
   0x0000fffff7f85e20:	00000000	udf	#0
   0x0000fffff7f85e24:	00000000	udf	#0
   0x0000fffff7f85e28:	00000000	udf	#0
   0x0000fffff7f85e2c:	00000000	udf	#0
   0x0000fffff7f85e30:	00000000	udf	#0
   0x0000fffff7f85e34:	00000000	udf	#0
   0x0000fffff7f85e38:	00000000	udf	#0
   0x0000fffff7f85e3c:	00000000	udf	#0
   0x0000fffff7f85e40:	00000000	udf	#0
   0x0000fffff7f85e44:	00000000	udf	#0
   0x0000fffff7f85e48:	00000000	udf	#0
   0x0000fffff7f85e4c:	00000000	udf	#0
   0x0000fffff7f85e50:	00000000	udf	#0
   0x0000fffff7f85e54:	00000000	udf	#0
   0x0000fffff7f85e58:	00000000	udf	#0
   0x0000fffff7f85e5c:	00000000	udf	#0
   0x0000fffff7f85e60:	00000000	udf	#0
   0x0000fffff7f85e64:	00000000	udf	#0
   0x0000fffff7f85e68:	00000000	udf	#0
   0x0000fffff7f85e6c:	00000000	udf	#0
   0x0000fffff7f85e70:	00000000	udf	#0
   0x0000fffff7f85e74:	00000000	udf	#0
   0x0000fffff7f85e78:	00000000	udf	#0
   0x0000fffff7f85e7c:	00000000	udf	#0
   0x0000fffff7f85e80:	00000000	udf	#0
   0x0000fffff7f85e84:	00000000	udf	#0
   0x0000fffff7f85e88:	00000000	udf	#0
   0x0000fffff7f85e8c:	00000000	udf	#0
   0x0000fffff7f85e90:	00000000	udf	#0
   0x0000fffff7f85e94:	00000000	udf	#0
   0x0000fffff7f85e98:	00000000	udf	#0
   0x0000fffff7f85e9c:	00000000	udf	#0
   0x0000fffff7f85ea0:	00000000	udf	#0
   0x0000fffff7f85ea4:	00000000	udf	#0
   0x0000fffff7f85ea8:	00000000	udf	#0
   0x0000fffff7f85eac:	00000000	udf	#0
   0x0000fffff7f85eb0:	00000000	udf	#0
   0x0000fffff7f85eb4:	00000000	udf	#0
   0x0000fffff7f85eb8:	00000000	udf	#0
   0x0000fffff7f85ebc:	00000000	udf	#0
   0x0000fffff7f85ec0:	00000000	udf	#0
   0x0000fffff7f85ec4:	00000000	udf	#0
   0x0000fffff7f85ec8:	00000000	udf	#0
   0x0000fffff7f85ecc:	00000000	udf	#0
   0x0000fffff7f85ed0:	00000000	udf	#0
   0x0000fffff7f85ed4:	00000000	udf	#0
   0x0000fffff7f85ed8:	00000000	udf	#0
   0x0000fffff7f85edc:	00000000	udf	#0
   0x0000fffff7f85ee0:	00000000	udf	#0
   0x0000fffff7f85ee4:	00000000	udf	#0
   0x0000fffff7f85ee8:	00000000	udf	#0
   0x0000fffff7f85eec:	00000000	udf	#0
   0x0000fffff7f85ef0:	00000000	udf	#0
   0x0000fffff7f85ef4:	00000000	udf	#0
   0x0000fffff7f85ef8:	00000000	udf	#0
   0x0000fffff7f85efc:	00000000	udf	#0
   0x0000fffff7f85f00:	00000000	udf	#0
   0x0000fffff7f85f04:	00000000	udf	#0
   0x0000fffff7f85f08:	00000000	udf	#0
   0x0000fffff7f85f0c:	00000000	udf	#0
   0x0000fffff7f85f10:	00000000	udf	#0
   0x0000fffff7f85f14:	00000000	udf	#0
   0x0000fffff7f85f18:	00000000	udf	#0
   0x0000fffff7f85f1c:	00000000	udf	#0
   0x0000fffff7f85f20:	00000000	udf	#0
   0x0000fffff7f85f24:	00000000	udf	#0
   0x0000fffff7f85f28:	00000000	udf	#0
   0x0000fffff7f85f2c:	00000000	udf	#0
   0x0000fffff7f85f30:	00000000	udf	#0
   0x0000fffff7f85f34:	00000000	udf	#0
   0x0000fffff7f85f38:	00000000	udf	#0
   0x0000fffff7f85f3c:	00000000	udf	#0
   0x0000fffff7f85f40:	00000000	udf	#0
   0x0000fffff7f85f44:	00000000	udf	#0
   0x0000fffff7f85f48:	00000000	udf	#0
   0x0000fffff7f85f4c:	00000000	udf	#0
   0x0000fffff7f85f50:	00000000	udf	#0
   0x0000fffff7f85f54:	00000000	udf	#0
   0x0000fffff7f85f58:	00000000	udf	#0
   0x0000fffff7f85f5c:	00000000	udf	#0
   0x0000fffff7f85f60:	00000000	udf	#0
   0x0000fffff7f85f64:	00000000	udf	#0
   0x0000fffff7f85f68:	00000000	udf	#0
   0x0000fffff7f85f6c:	00000000	udf	#0
   0x0000fffff7f85f70:	00000000	udf	#0
   0x0000fffff7f85f74:	00000000	udf	#0
   0x0000fffff7f85f78:	00000000	udf	#0
   0x0000fffff7f85f7c:	00000000	udf	#0
   0x0000fffff7f85f80:	00000000	udf	#0
   0x0000fffff7f85f84:	00000000	udf	#0
   0x0000fffff7f85f88:	00000000	udf	#0
   0x0000fffff7f85f8c:	00000000	udf	#0
   0x0000fffff7f85f90:	00000000	udf	#0
   0x0000fffff7f85f94:	00000000	udf	#0
   0x0000fffff7f85f98:	00000000	udf	#0
   0x0000fffff7f85f9c:	00000000	udf	#0
   0x0000fffff7f85fa0:	00000000	udf	#0
   0x0000fffff7f85fa4:	00000000	udf	#0
   0x0000fffff7f85fa8:	00000000	udf	#0
   0x0000fffff7f85fac:	00000000	udf	#0
   0x0000fffff7f85fb0:	00000000	udf	#0
   0x0000fffff7f85fb4:	00000000	udf	#0
   0x0000fffff7f85fb8:	00000000	udf	#0
   0x0000fffff7f85fbc:	00000000	udf	#0
   0x0000fffff7f85fc0:	00000000	udf	#0
   0x0000fffff7f85fc4:	00000000	udf	#0
   0x0000fffff7f85fc8:	00000000	udf	#0
   0x0000fffff7f85fcc:	00000000	udf	#0
   0x0000fffff7f85fd0:	00000000	udf	#0
   0x0000fffff7f85fd4:	00000000	udf	#0
   0x0000fffff7f85fd8:	00000000	udf	#0
   0x0000fffff7f85fdc:	00000000	udf	#0
   0x0000fffff7f85fe0:	00000000	udf	#0
   0x0000fffff7f85fe4:	00000000	udf	#0
   0x0000fffff7f85fe8:	00000000	udf	#0
   0x0000fffff7f85fec:	00000000	udf	#0
   0x0000fffff7f85ff0:	00000000	udf	#0
   0x0000fffff7f85ff4:	00000000	udf	#0
   0x0000fffff7f85ff8:	00000000	udf	#0
   0x0000fffff7f85ffc:	00000000	udf	#0
End of assembler dump.
