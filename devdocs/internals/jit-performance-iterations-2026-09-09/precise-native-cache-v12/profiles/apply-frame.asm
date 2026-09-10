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
   0x0000fffff7f84038:	d2802e10	mov	x16, #0x170                 	// #368
   0x0000fffff7f8403c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84044:	d63f0200	blr	x16
   0x0000fffff7f84048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8404c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f84050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f84054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f84058:	b9400269	ldr	w9, [x19]
   0x0000fffff7f8405c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84060:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84064:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84068:	540001c1	b.ne	0xfffff7f840a0  // b.any
   0x0000fffff7f8406c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84070:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84078:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8407c:	540006e1	b.ne	0xfffff7f84158  // b.any
   0x0000fffff7f84080:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f84084:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f84088:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8408c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84090:	54000642	b.cs	0xfffff7f84158  // b.hs, b.nlast
   0x0000fffff7f84094:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84098:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8409c:	14000014	b	0xfffff7f840ec
   0x0000fffff7f840a0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f840a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f840a8:	54000580	b.eq	0xfffff7f84158  // b.none
   0x0000fffff7f840ac:	b9400269	ldr	w9, [x19]
   0x0000fffff7f840b0:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f840b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f840b8:	54000501	b.ne	0xfffff7f84158  // b.any
   0x0000fffff7f840bc:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f840c0:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f840c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f840c8:	54000481	b.ne	0xfffff7f84158  // b.any
   0x0000fffff7f840cc:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f840d0:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f840d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f840d8:	54000401	b.ne	0xfffff7f84158  // b.any
   0x0000fffff7f840dc:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f840e0:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f840e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f840e8:	54000381	b.ne	0xfffff7f84158  // b.any
   0x0000fffff7f840ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7f840f0:	37d8034d	tbnz	w13, #27, 0xfffff7f84158
   0x0000fffff7f840f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f840f8:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f840fc:	36d8020e	tbz	w14, #27, 0xfffff7f8413c
   0x0000fffff7f84100:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84104:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84108:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8410c:	54000261	b.ne	0xfffff7f84158  // b.any
   0x0000fffff7f84110:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84114:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84118:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8411c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84120:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84124:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84128:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8412c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84130:	54000149	b.ls	0xfffff7f84158  // b.plast
   0x0000fffff7f84134:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84138:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8413c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84140:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84144:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84148:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8414c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84150:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84154:	1400000e	b	0xfffff7f8418c
   0x0000fffff7f84158:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8415c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84160:	aa1303e1	mov	x1, x19
   0x0000fffff7f84164:	aa1503e2	mov	x2, x21
   0x0000fffff7f84168:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f8416c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84170:	aa1603e5	mov	x5, x22
   0x0000fffff7f84174:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84178:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8417c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84180:	d63f0200	blr	x16
   0x0000fffff7f84184:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84188:	54005600	b.eq	0xfffff7f84c48  // b.none
   0x0000fffff7f8418c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84190:	37d806a9	tbnz	w9, #27, 0xfffff7f84264
   0x0000fffff7f84194:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8419c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841a4:	540001c1	b.ne	0xfffff7f841dc  // b.any
   0x0000fffff7f841a8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f841ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841b8:	54000121	b.ne	0xfffff7f841dc  // b.any
   0x0000fffff7f841bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f841c0:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f841c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f841c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841d0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f841d4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f841d8:	14000030	b	0xfffff7f84298
   0x0000fffff7f841dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f841e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f841e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841ec:	54000120	b.eq	0xfffff7f84210  // b.none
   0x0000fffff7f841f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f841f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84200:	54000321	b.ne	0xfffff7f84264  // b.any
   0x0000fffff7f84204:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84208:	9e620120	scvtf	d0, x9
   0x0000fffff7f8420c:	14000002	b	0xfffff7f84214
   0x0000fffff7f84210:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f84214:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f84218:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8421c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84220:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84224:	54000120	b.eq	0xfffff7f84248  // b.none
   0x0000fffff7f84228:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f8422c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84230:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84234:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84238:	54000161	b.ne	0xfffff7f84264  // b.any
   0x0000fffff7f8423c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f84240:	9e620121	scvtf	d1, x9
   0x0000fffff7f84244:	14000002	b	0xfffff7f8424c
   0x0000fffff7f84248:	fd401661	ldr	d1, [x19, #40]
   0x0000fffff7f8424c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84250:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f84254:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8425c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84260:	17ffffde	b	0xfffff7f841d8
   0x0000fffff7f84264:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84268:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8426c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84270:	aa1503e2	mov	x2, x21
   0x0000fffff7f84274:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f84278:	aa1403e4	mov	x4, x20
   0x0000fffff7f8427c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84280:	d294a890	mov	x16, #0xa544                	// #42308
   0x0000fffff7f84284:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84288:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8428c:	d63f0200	blr	x16
   0x0000fffff7f84290:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84294:	54004f00	b.eq	0xfffff7f84c74  // b.none
   0x0000fffff7f84298:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8429c:	37d800e9	tbnz	w9, #27, 0xfffff7f842b8
   0x0000fffff7f842a0:	d29ffe29	mov	x9, #0xfff1                	// #65521
   0x0000fffff7f842a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f842a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f842ac:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f842b0:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f842b4:	1400000e	b	0xfffff7f842ec
   0x0000fffff7f842b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f842bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f842c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f842c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f842c8:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f842cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f842d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f842d4:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f842d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f842dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842e0:	d63f0200	blr	x16
   0x0000fffff7f842e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842e8:	54004dc0	b.eq	0xfffff7f84ca0  // b.none
   0x0000fffff7f842ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f842f0:	37d80389	tbnz	w9, #27, 0xfffff7f84360
   0x0000fffff7f842f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f842f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f842fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84300:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84304:	540002e1	b.ne	0xfffff7f84360  // b.any
   0x0000fffff7f84308:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8430c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84310:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84314:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84318:	54000241	b.ne	0xfffff7f84360  // b.any
   0x0000fffff7f8431c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84320:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f84324:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84328:	540001c0	b.eq	0xfffff7f84360  // b.none
   0x0000fffff7f8432c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84330:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84334:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84338:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f8433c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84340:	54000100	b.eq	0xfffff7f84360  // b.none
   0x0000fffff7f84344:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84348:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f8434c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84350:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84354:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84358:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8435c:	1400000e	b	0xfffff7f84394
   0x0000fffff7f84360:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84364:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84368:	aa1303e1	mov	x1, x19
   0x0000fffff7f8436c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84370:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f84374:	aa1403e4	mov	x4, x20
   0x0000fffff7f84378:	aa1603e5	mov	x5, x22
   0x0000fffff7f8437c:	d2937a10	mov	x16, #0x9bd0                	// #39888
   0x0000fffff7f84380:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84384:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84388:	d63f0200	blr	x16
   0x0000fffff7f8438c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84390:	540049e0	b.eq	0xfffff7f84ccc  // b.none
   0x0000fffff7f84394:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84398:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8439c:	aa1303e1	mov	x1, x19
   0x0000fffff7f843a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f843a4:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f843a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f843ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f843b0:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f843b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f843b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843bc:	d63f0200	blr	x16
   0x0000fffff7f843c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843c4:	540049a0	b.eq	0xfffff7f84cf8  // b.none
   0x0000fffff7f843c8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f843cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f843d0:	54000480	b.eq	0xfffff7f84460  // b.none
   0x0000fffff7f843d4:	b9400269	ldr	w9, [x19]
   0x0000fffff7f843d8:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f843dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843e0:	54000401	b.ne	0xfffff7f84460  // b.any
   0x0000fffff7f843e4:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f843e8:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f843ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843f0:	54000381	b.ne	0xfffff7f84460  // b.any
   0x0000fffff7f843f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f843f8:	37d8034d	tbnz	w13, #27, 0xfffff7f84460
   0x0000fffff7f843fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84400:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84404:	36d8020e	tbz	w14, #27, 0xfffff7f84444
   0x0000fffff7f84408:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8440c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84410:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84414:	54000261	b.ne	0xfffff7f84460  // b.any
   0x0000fffff7f84418:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8441c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84420:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84424:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84428:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8442c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84430:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84434:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84438:	54000149	b.ls	0xfffff7f84460  // b.plast
   0x0000fffff7f8443c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84440:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84444:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84448:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f8444c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84450:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84454:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84458:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f8445c:	1400000e	b	0xfffff7f84494
   0x0000fffff7f84460:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84468:	aa1303e1	mov	x1, x19
   0x0000fffff7f8446c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84470:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f84474:	aa1403e4	mov	x4, x20
   0x0000fffff7f84478:	aa1603e5	mov	x5, x22
   0x0000fffff7f8447c:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f84480:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84488:	d63f0200	blr	x16
   0x0000fffff7f8448c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84490:	540044a0	b.eq	0xfffff7f84d24  // b.none
   0x0000fffff7f84494:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84498:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8449c:	54000480	b.eq	0xfffff7f8452c  // b.none
   0x0000fffff7f844a0:	b9400269	ldr	w9, [x19]
   0x0000fffff7f844a4:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f844a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844ac:	54000401	b.ne	0xfffff7f8452c  // b.any
   0x0000fffff7f844b0:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f844b4:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f844b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844bc:	54000381	b.ne	0xfffff7f8452c  // b.any
   0x0000fffff7f844c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f844c4:	37d8034d	tbnz	w13, #27, 0xfffff7f8452c
   0x0000fffff7f844c8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f844cc:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f844d0:	36d8020e	tbz	w14, #27, 0xfffff7f84510
   0x0000fffff7f844d4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f844d8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f844dc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f844e0:	54000261	b.ne	0xfffff7f8452c  // b.any
   0x0000fffff7f844e4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f844e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844ec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f844f0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f844f4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f844f8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f844fc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84500:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84504:	54000149	b.ls	0xfffff7f8452c  // b.plast
   0x0000fffff7f84508:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8450c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84510:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f84514:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f84518:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8451c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84520:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f84524:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f84528:	1400000e	b	0xfffff7f84560
   0x0000fffff7f8452c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84530:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84534:	aa1303e1	mov	x1, x19
   0x0000fffff7f84538:	aa1503e2	mov	x2, x21
   0x0000fffff7f8453c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f84540:	aa1403e4	mov	x4, x20
   0x0000fffff7f84544:	aa1603e5	mov	x5, x22
   0x0000fffff7f84548:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f8454c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84550:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84554:	d63f0200	blr	x16
   0x0000fffff7f84558:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8455c:	54003fa0	b.eq	0xfffff7f84d50  // b.none
   0x0000fffff7f84560:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84564:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84568:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f8456c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84570:	540001c1	b.ne	0xfffff7f845a8  // b.any
   0x0000fffff7f84574:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84578:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8457c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84580:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84584:	540006e1	b.ne	0xfffff7f84660  // b.any
   0x0000fffff7f84588:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f8458c:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f84590:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84594:	eb09015f	cmp	x10, x9
   0x0000fffff7f84598:	54000642	b.cs	0xfffff7f84660  // b.hs, b.nlast
   0x0000fffff7f8459c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f845a0:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f845a4:	14000014	b	0xfffff7f845f4
   0x0000fffff7f845a8:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f845ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7f845b0:	54000580	b.eq	0xfffff7f84660  // b.none
   0x0000fffff7f845b4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f845b8:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f845bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845c0:	54000501	b.ne	0xfffff7f84660  // b.any
   0x0000fffff7f845c4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f845c8:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f845cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845d0:	54000481	b.ne	0xfffff7f84660  // b.any
   0x0000fffff7f845d4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f845d8:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f845dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845e0:	54000401	b.ne	0xfffff7f84660  // b.any
   0x0000fffff7f845e4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f845e8:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f845ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845f0:	54000381	b.ne	0xfffff7f84660  // b.any
   0x0000fffff7f845f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f845f8:	37d8034d	tbnz	w13, #27, 0xfffff7f84660
   0x0000fffff7f845fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84600:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84604:	36d8020e	tbz	w14, #27, 0xfffff7f84644
   0x0000fffff7f84608:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8460c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84610:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84614:	54000261	b.ne	0xfffff7f84660  // b.any
   0x0000fffff7f84618:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8461c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84620:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84624:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84628:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8462c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84630:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84634:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84638:	54000149	b.ls	0xfffff7f84660  // b.plast
   0x0000fffff7f8463c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84640:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84644:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f84648:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f8464c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84650:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84654:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f84658:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f8465c:	1400000e	b	0xfffff7f84694
   0x0000fffff7f84660:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f84664:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84668:	aa1303e1	mov	x1, x19
   0x0000fffff7f8466c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84670:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f84674:	aa1403e4	mov	x4, x20
   0x0000fffff7f84678:	aa1603e5	mov	x5, x22
   0x0000fffff7f8467c:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84680:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84688:	d63f0200	blr	x16
   0x0000fffff7f8468c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84690:	54003760	b.eq	0xfffff7f84d7c  // b.none
   0x0000fffff7f84694:	b9400269	ldr	w9, [x19]
   0x0000fffff7f84698:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8469c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f846a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846a4:	540001c1	b.ne	0xfffff7f846dc  // b.any
   0x0000fffff7f846a8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f846ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f846b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f846b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846b8:	540006e1	b.ne	0xfffff7f84794  // b.any
   0x0000fffff7f846bc:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f846c0:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f846c4:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f846c8:	eb09015f	cmp	x10, x9
   0x0000fffff7f846cc:	54000642	b.cs	0xfffff7f84794  // b.hs, b.nlast
   0x0000fffff7f846d0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f846d4:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f846d8:	14000014	b	0xfffff7f84728
   0x0000fffff7f846dc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f846e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f846e4:	54000580	b.eq	0xfffff7f84794  // b.none
   0x0000fffff7f846e8:	b9400269	ldr	w9, [x19]
   0x0000fffff7f846ec:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f846f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846f4:	54000501	b.ne	0xfffff7f84794  // b.any
   0x0000fffff7f846f8:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f846fc:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f84700:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84704:	54000481	b.ne	0xfffff7f84794  // b.any
   0x0000fffff7f84708:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8470c:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f84710:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84714:	54000401	b.ne	0xfffff7f84794  // b.any
   0x0000fffff7f84718:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f8471c:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f84720:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84724:	54000381	b.ne	0xfffff7f84794  // b.any
   0x0000fffff7f84728:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8472c:	37d8034d	tbnz	w13, #27, 0xfffff7f84794
   0x0000fffff7f84730:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84734:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84738:	36d8020e	tbz	w14, #27, 0xfffff7f84778
   0x0000fffff7f8473c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84740:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84744:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84748:	54000261	b.ne	0xfffff7f84794  // b.any
   0x0000fffff7f8474c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84750:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84754:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84758:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8475c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84760:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84764:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84768:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8476c:	54000149	b.ls	0xfffff7f84794  // b.plast
   0x0000fffff7f84770:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84774:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84778:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8477c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84780:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84784:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84788:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8478c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84790:	1400000e	b	0xfffff7f847c8
   0x0000fffff7f84794:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84798:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8479c:	aa1303e1	mov	x1, x19
   0x0000fffff7f847a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f847a4:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f847a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f847ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f847b0:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f847b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f847b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f847bc:	d63f0200	blr	x16
   0x0000fffff7f847c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f847c4:	54002f20	b.eq	0xfffff7f84da8  // b.none
   0x0000fffff7f847c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f847cc:	37d806a9	tbnz	w9, #27, 0xfffff7f848a0
   0x0000fffff7f847d0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f847d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f847d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847e0:	540001c1	b.ne	0xfffff7f84818  // b.any
   0x0000fffff7f847e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f847e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f847ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847f4:	54000121	b.ne	0xfffff7f84818  // b.any
   0x0000fffff7f847f8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f847fc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84800:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84804:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84808:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8480c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f84810:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84814:	14000030	b	0xfffff7f848d4
   0x0000fffff7f84818:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8481c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84820:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84824:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84828:	54000120	b.eq	0xfffff7f8484c  // b.none
   0x0000fffff7f8482c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84830:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84834:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84838:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8483c:	54000321	b.ne	0xfffff7f848a0  // b.any
   0x0000fffff7f84840:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f84844:	9e620120	scvtf	d0, x9
   0x0000fffff7f84848:	14000002	b	0xfffff7f84850
   0x0000fffff7f8484c:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f84850:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84854:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84858:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8485c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84860:	54000120	b.eq	0xfffff7f84884  // b.none
   0x0000fffff7f84864:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8486c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84870:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84874:	54000161	b.ne	0xfffff7f848a0  // b.any
   0x0000fffff7f84878:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8487c:	9e620121	scvtf	d1, x9
   0x0000fffff7f84880:	14000002	b	0xfffff7f84888
   0x0000fffff7f84884:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84888:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8488c:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f84890:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84898:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f8489c:	17ffffde	b	0xfffff7f84814
   0x0000fffff7f848a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f848a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f848a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f848ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f848b0:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f848b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f848b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f848bc:	d294a890	mov	x16, #0xa544                	// #42308
   0x0000fffff7f848c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f848c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f848c8:	d63f0200	blr	x16
   0x0000fffff7f848cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f848d0:	54002820	b.eq	0xfffff7f84dd4  // b.none
   0x0000fffff7f848d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f848d8:	37d800e9	tbnz	w9, #27, 0xfffff7f848f4
   0x0000fffff7f848dc:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7f848e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848e8:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f848ec:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f848f0:	1400000e	b	0xfffff7f84928
   0x0000fffff7f848f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f848f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f848fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f84900:	aa1503e2	mov	x2, x21
   0x0000fffff7f84904:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f84908:	aa1403e4	mov	x4, x20
   0x0000fffff7f8490c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84910:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84914:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84918:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8491c:	d63f0200	blr	x16
   0x0000fffff7f84920:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84924:	540026e0	b.eq	0xfffff7f84e00  // b.none
   0x0000fffff7f84928:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8492c:	37d80389	tbnz	w9, #27, 0xfffff7f8499c
   0x0000fffff7f84930:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8493c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84940:	540002e1	b.ne	0xfffff7f8499c  // b.any
   0x0000fffff7f84944:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84948:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8494c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84950:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84954:	54000241	b.ne	0xfffff7f8499c  // b.any
   0x0000fffff7f84958:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f8495c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84960:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84964:	540001c0	b.eq	0xfffff7f8499c  // b.none
   0x0000fffff7f84968:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f8496c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84970:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84974:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84978:	eb0b015f	cmp	x10, x11
   0x0000fffff7f8497c:	54000100	b.eq	0xfffff7f8499c  // b.none
   0x0000fffff7f84980:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84984:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8498c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84990:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f84994:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84998:	1400000e	b	0xfffff7f849d0
   0x0000fffff7f8499c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f849a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f849a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f849ac:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f849b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f849b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f849b8:	d2937a10	mov	x16, #0x9bd0                	// #39888
   0x0000fffff7f849bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f849c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849c4:	d63f0200	blr	x16
   0x0000fffff7f849c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f849cc:	54002300	b.eq	0xfffff7f84e2c  // b.none
   0x0000fffff7f849d0:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f849d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f849dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f849e0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f849e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f849e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f849ec:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f849f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f849f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849f8:	d63f0200	blr	x16
   0x0000fffff7f849fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84a00:	540022c0	b.eq	0xfffff7f84e58  // b.none
   0x0000fffff7f84a04:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84a08:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84a0c:	54000480	b.eq	0xfffff7f84a9c  // b.none
   0x0000fffff7f84a10:	b9400269	ldr	w9, [x19]
   0x0000fffff7f84a14:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f84a18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a1c:	54000401	b.ne	0xfffff7f84a9c  // b.any
   0x0000fffff7f84a20:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f84a24:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f84a28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a2c:	54000381	b.ne	0xfffff7f84a9c  // b.any
   0x0000fffff7f84a30:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84a34:	37d8034d	tbnz	w13, #27, 0xfffff7f84a9c
   0x0000fffff7f84a38:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84a3c:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84a40:	36d8020e	tbz	w14, #27, 0xfffff7f84a80
   0x0000fffff7f84a44:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84a48:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84a4c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84a50:	54000261	b.ne	0xfffff7f84a9c  // b.any
   0x0000fffff7f84a54:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84a58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84a5c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84a60:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84a64:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84a68:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84a6c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84a70:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84a74:	54000149	b.ls	0xfffff7f84a9c  // b.plast
   0x0000fffff7f84a78:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84a7c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84a80:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84a84:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84a88:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84a8c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84a90:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84a94:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84a98:	1400000e	b	0xfffff7f84ad0
   0x0000fffff7f84a9c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84aa0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84aa4:	aa1303e1	mov	x1, x19
   0x0000fffff7f84aa8:	aa1503e2	mov	x2, x21
   0x0000fffff7f84aac:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f84ab0:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ab4:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ab8:	d294b610	mov	x16, #0xa5b0                	// #42416
   0x0000fffff7f84abc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84ac0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ac4:	d63f0200	blr	x16
   0x0000fffff7f84ac8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84acc:	54001dc0	b.eq	0xfffff7f84e84  // b.none
   0x0000fffff7f84ad0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84ad4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84ad8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84adc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84ae0:	540001c1	b.ne	0xfffff7f84b18  // b.any
   0x0000fffff7f84ae4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84ae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84aec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84af0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84af4:	540006e1	b.ne	0xfffff7f84bd0  // b.any
   0x0000fffff7f84af8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f84afc:	f940266b	ldr	x11, [x19, #72]
   0x0000fffff7f84b00:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84b04:	eb09015f	cmp	x10, x9
   0x0000fffff7f84b08:	54000642	b.cs	0xfffff7f84bd0  // b.hs, b.nlast
   0x0000fffff7f84b0c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84b10:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84b14:	14000014	b	0xfffff7f84b64
   0x0000fffff7f84b18:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84b1c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84b20:	54000580	b.eq	0xfffff7f84bd0  // b.none
   0x0000fffff7f84b24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84b28:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84b2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b30:	54000501	b.ne	0xfffff7f84bd0  // b.any
   0x0000fffff7f84b34:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84b38:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84b3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b40:	54000481	b.ne	0xfffff7f84bd0  // b.any
   0x0000fffff7f84b44:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84b48:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f84b4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b50:	54000401	b.ne	0xfffff7f84bd0  // b.any
   0x0000fffff7f84b54:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f84b58:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f84b5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b60:	54000381	b.ne	0xfffff7f84bd0  // b.any
   0x0000fffff7f84b64:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84b68:	37d8034d	tbnz	w13, #27, 0xfffff7f84bd0
   0x0000fffff7f84b6c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84b70:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84b74:	36d8020e	tbz	w14, #27, 0xfffff7f84bb4
   0x0000fffff7f84b78:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84b7c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84b80:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84b84:	54000261	b.ne	0xfffff7f84bd0  // b.any
   0x0000fffff7f84b88:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84b8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84b90:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84b94:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84b98:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84b9c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84ba0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84ba4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84ba8:	54000149	b.ls	0xfffff7f84bd0  // b.plast
   0x0000fffff7f84bac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84bb0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84bb4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84bb8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84bbc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84bc0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84bc4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84bc8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84bcc:	1400000e	b	0xfffff7f84c04
   0x0000fffff7f84bd0:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84bd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84bd8:	aa1303e1	mov	x1, x19
   0x0000fffff7f84bdc:	aa1503e2	mov	x2, x21
   0x0000fffff7f84be0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f84be4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84be8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84bec:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84bf0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84bf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84bf8:	d63f0200	blr	x16
   0x0000fffff7f84bfc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84c00:	54001580	b.eq	0xfffff7f84eb0  // b.none
   0x0000fffff7f84c04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84c08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84c0c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84c10:	aa1503e2	mov	x2, x21
   0x0000fffff7f84c14:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f84c18:	aa1403e4	mov	x4, x20
   0x0000fffff7f84c1c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84c20:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f84c24:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84c28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84c2c:	d63f0200	blr	x16
   0x0000fffff7f84c30:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84c34:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84c38:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84c3c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84c40:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f84c44:	d65f03c0	ret
   0x0000fffff7f84c48:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84c4c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84c50:	b9000289	str	w9, [x20]
   0x0000fffff7f84c54:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84c58:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84c5c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84c60:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84c64:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84c68:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84c6c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84c70:	d65f03c0	ret
   0x0000fffff7f84c74:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84c78:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84c7c:	b9000289	str	w9, [x20]
   0x0000fffff7f84c80:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f84c84:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84c88:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84c8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84c90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84c94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84c98:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84c9c:	d65f03c0	ret
   0x0000fffff7f84ca0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84ca4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84ca8:	b9000289	str	w9, [x20]
   0x0000fffff7f84cac:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f84cb0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84cb4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84cb8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84cbc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84cc0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84cc4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84cc8:	d65f03c0	ret
   0x0000fffff7f84ccc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84cd0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84cd4:	b9000289	str	w9, [x20]
   0x0000fffff7f84cd8:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f84cdc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84ce0:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84ce4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84ce8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84cec:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84cf0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84cf4:	d65f03c0	ret
   0x0000fffff7f84cf8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84cfc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84d00:	b9000289	str	w9, [x20]
   0x0000fffff7f84d04:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f84d08:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84d0c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84d10:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84d14:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84d18:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84d1c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84d20:	d65f03c0	ret
   0x0000fffff7f84d24:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84d28:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84d2c:	b9000289	str	w9, [x20]
   0x0000fffff7f84d30:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f84d34:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84d38:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84d3c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84d40:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84d44:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84d48:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84d4c:	d65f03c0	ret
   0x0000fffff7f84d50:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84d54:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84d58:	b9000289	str	w9, [x20]
   0x0000fffff7f84d5c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f84d60:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84d64:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84d68:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84d6c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84d70:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84d74:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84d78:	d65f03c0	ret
   0x0000fffff7f84d7c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84d80:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84d84:	b9000289	str	w9, [x20]
   0x0000fffff7f84d88:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f84d8c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84d90:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84d94:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84d98:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84d9c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84da0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84da4:	d65f03c0	ret
   0x0000fffff7f84da8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84dac:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84db0:	b9000289	str	w9, [x20]
   0x0000fffff7f84db4:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f84db8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84dbc:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84dc0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84dc4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84dc8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84dcc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84dd0:	d65f03c0	ret
   0x0000fffff7f84dd4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84dd8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84ddc:	b9000289	str	w9, [x20]
   0x0000fffff7f84de0:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f84de4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84de8:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84dec:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84df0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84df4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84df8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84dfc:	d65f03c0	ret
   0x0000fffff7f84e00:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84e04:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84e08:	b9000289	str	w9, [x20]
   0x0000fffff7f84e0c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f84e10:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84e14:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84e18:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84e1c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84e20:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84e24:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84e28:	d65f03c0	ret
   0x0000fffff7f84e2c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84e30:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84e34:	b9000289	str	w9, [x20]
   0x0000fffff7f84e38:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f84e3c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84e40:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84e44:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84e48:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84e4c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84e50:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84e54:	d65f03c0	ret
   0x0000fffff7f84e58:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84e5c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84e60:	b9000289	str	w9, [x20]
   0x0000fffff7f84e64:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f84e68:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84e6c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84e70:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84e74:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84e78:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84e7c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84e80:	d65f03c0	ret
   0x0000fffff7f84e84:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84e88:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84e8c:	b9000289	str	w9, [x20]
   0x0000fffff7f84e90:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f84e94:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84e98:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84e9c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84ea0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84ea4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84ea8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84eac:	d65f03c0	ret
   0x0000fffff7f84eb0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84eb4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84eb8:	b9000289	str	w9, [x20]
   0x0000fffff7f84ebc:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f84ec0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84ec4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84ec8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84ecc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84ed0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84ed4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84ed8:	d65f03c0	ret
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
