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
   0x0000fffff7f84068:	54000501	b.ne	0xfffff7f84108  // b.any
   0x0000fffff7f8406c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84070:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84078:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8407c:	54000461	b.ne	0xfffff7f84108  // b.any
   0x0000fffff7f84080:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f84084:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f84088:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8408c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84090:	540003c2	b.cs	0xfffff7f84108  // b.hs, b.nlast
   0x0000fffff7f84094:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84098:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8409c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f840a0:	37d8034d	tbnz	w13, #27, 0xfffff7f84108
   0x0000fffff7f840a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f840a8:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f840ac:	36d8020e	tbz	w14, #27, 0xfffff7f840ec
   0x0000fffff7f840b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f840b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f840b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f840bc:	54000261	b.ne	0xfffff7f84108  // b.any
   0x0000fffff7f840c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f840c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f840c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f840cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f840d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f840d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f840d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f840dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f840e0:	54000149	b.ls	0xfffff7f84108  // b.plast
   0x0000fffff7f840e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f840e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f840ec:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f840f0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f840f4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f840f8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f840fc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84100:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84104:	1400000e	b	0xfffff7f8413c
   0x0000fffff7f84108:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8410c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84110:	aa1303e1	mov	x1, x19
   0x0000fffff7f84114:	aa1503e2	mov	x2, x21
   0x0000fffff7f84118:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f8411c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84120:	aa1603e5	mov	x5, x22
   0x0000fffff7f84124:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f84128:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8412c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84130:	d63f0200	blr	x16
   0x0000fffff7f84134:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84138:	54004040	b.eq	0xfffff7f84940  // b.none
   0x0000fffff7f8413c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84140:	37d806a9	tbnz	w9, #27, 0xfffff7f84214
   0x0000fffff7f84144:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84148:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8414c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84150:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84154:	540001c1	b.ne	0xfffff7f8418c  // b.any
   0x0000fffff7f84158:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f8415c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84160:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84164:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84168:	54000121	b.ne	0xfffff7f8418c  // b.any
   0x0000fffff7f8416c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84170:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f84174:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84178:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8417c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84180:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84184:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84188:	14000030	b	0xfffff7f84248
   0x0000fffff7f8418c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84190:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84198:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8419c:	54000120	b.eq	0xfffff7f841c0  // b.none
   0x0000fffff7f841a0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f841a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841b0:	54000321	b.ne	0xfffff7f84214  // b.any
   0x0000fffff7f841b4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f841b8:	9e620120	scvtf	d0, x9
   0x0000fffff7f841bc:	14000002	b	0xfffff7f841c4
   0x0000fffff7f841c0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f841c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f841c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f841cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841d4:	54000120	b.eq	0xfffff7f841f8  // b.none
   0x0000fffff7f841d8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f841dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841e8:	54000161	b.ne	0xfffff7f84214  // b.any
   0x0000fffff7f841ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f841f0:	9e620121	scvtf	d1, x9
   0x0000fffff7f841f4:	14000002	b	0xfffff7f841fc
   0x0000fffff7f841f8:	fd401661	ldr	d1, [x19, #40]
   0x0000fffff7f841fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84200:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f84204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8420c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84210:	17ffffde	b	0xfffff7f84188
   0x0000fffff7f84214:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84218:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8421c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84220:	aa1503e2	mov	x2, x21
   0x0000fffff7f84224:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f84228:	aa1403e4	mov	x4, x20
   0x0000fffff7f8422c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84230:	d293fa90	mov	x16, #0x9fd4                	// #40916
   0x0000fffff7f84234:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84238:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8423c:	d63f0200	blr	x16
   0x0000fffff7f84240:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84244:	54003940	b.eq	0xfffff7f8496c  // b.none
   0x0000fffff7f84248:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8424c:	37d800e9	tbnz	w9, #27, 0xfffff7f84268
   0x0000fffff7f84250:	d29ffe29	mov	x9, #0xfff1                	// #65521
   0x0000fffff7f84254:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8425c:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f84260:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84264:	1400000e	b	0xfffff7f8429c
   0x0000fffff7f84268:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8426c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84270:	aa1303e1	mov	x1, x19
   0x0000fffff7f84274:	aa1503e2	mov	x2, x21
   0x0000fffff7f84278:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f8427c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84280:	aa1603e5	mov	x5, x22
   0x0000fffff7f84284:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84288:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8428c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84290:	d63f0200	blr	x16
   0x0000fffff7f84294:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84298:	54003800	b.eq	0xfffff7f84998  // b.none
   0x0000fffff7f8429c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f842a0:	37d80389	tbnz	w9, #27, 0xfffff7f84310
   0x0000fffff7f842a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f842a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f842ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f842b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f842b4:	540002e1	b.ne	0xfffff7f84310  // b.any
   0x0000fffff7f842b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f842bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f842c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f842c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f842c8:	54000241	b.ne	0xfffff7f84310  // b.any
   0x0000fffff7f842cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f842d0:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f842d4:	f100015f	cmp	x10, #0x0
   0x0000fffff7f842d8:	540001c0	b.eq	0xfffff7f84310  // b.none
   0x0000fffff7f842dc:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f842e0:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f842e4:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f842e8:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f842ec:	eb0b015f	cmp	x10, x11
   0x0000fffff7f842f0:	54000100	b.eq	0xfffff7f84310  // b.none
   0x0000fffff7f842f4:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f842f8:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f842fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84304:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84308:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8430c:	1400000e	b	0xfffff7f84344
   0x0000fffff7f84310:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84314:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84318:	aa1303e1	mov	x1, x19
   0x0000fffff7f8431c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84320:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f84324:	aa1403e4	mov	x4, x20
   0x0000fffff7f84328:	aa1603e5	mov	x5, x22
   0x0000fffff7f8432c:	d292cc10	mov	x16, #0x9660                	// #38496
   0x0000fffff7f84330:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84334:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84338:	d63f0200	blr	x16
   0x0000fffff7f8433c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84340:	54003420	b.eq	0xfffff7f849c4  // b.none
   0x0000fffff7f84344:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84348:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8434c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84350:	aa1503e2	mov	x2, x21
   0x0000fffff7f84354:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f84358:	aa1403e4	mov	x4, x20
   0x0000fffff7f8435c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84360:	d2908810	mov	x16, #0x8440                	// #33856
   0x0000fffff7f84364:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84368:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8436c:	d63f0200	blr	x16
   0x0000fffff7f84370:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84374:	540033e0	b.eq	0xfffff7f849f0  // b.none
   0x0000fffff7f84378:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8437c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84380:	aa1303e1	mov	x1, x19
   0x0000fffff7f84384:	aa1503e2	mov	x2, x21
   0x0000fffff7f84388:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f8438c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84390:	aa1603e5	mov	x5, x22
   0x0000fffff7f84394:	d2980e10	mov	x16, #0xc070                	// #49264
   0x0000fffff7f84398:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8439c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843a0:	d63f0200	blr	x16
   0x0000fffff7f843a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843a8:	540033a0	b.eq	0xfffff7f84a1c  // b.none
   0x0000fffff7f843ac:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f843b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f843b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f843b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f843bc:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f843c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f843c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f843c8:	d2980e10	mov	x16, #0xc070                	// #49264
   0x0000fffff7f843cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f843d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843d4:	d63f0200	blr	x16
   0x0000fffff7f843d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843dc:	54003360	b.eq	0xfffff7f84a48  // b.none
   0x0000fffff7f843e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f843e4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f843e8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f843ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843f0:	54000501	b.ne	0xfffff7f84490  // b.any
   0x0000fffff7f843f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f843f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f843fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84400:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84404:	54000461	b.ne	0xfffff7f84490  // b.any
   0x0000fffff7f84408:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f8440c:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f84410:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84414:	eb09015f	cmp	x10, x9
   0x0000fffff7f84418:	540003c2	b.cs	0xfffff7f84490  // b.hs, b.nlast
   0x0000fffff7f8441c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84420:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84424:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84428:	37d8034d	tbnz	w13, #27, 0xfffff7f84490
   0x0000fffff7f8442c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84430:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84434:	36d8020e	tbz	w14, #27, 0xfffff7f84474
   0x0000fffff7f84438:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8443c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84440:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84444:	54000261	b.ne	0xfffff7f84490  // b.any
   0x0000fffff7f84448:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8444c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84450:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84454:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84458:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8445c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84460:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84464:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84468:	54000149	b.ls	0xfffff7f84490  // b.plast
   0x0000fffff7f8446c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84470:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84474:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f84478:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f8447c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84480:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84484:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f84488:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f8448c:	1400000e	b	0xfffff7f844c4
   0x0000fffff7f84490:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f84494:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84498:	aa1303e1	mov	x1, x19
   0x0000fffff7f8449c:	aa1503e2	mov	x2, x21
   0x0000fffff7f844a0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f844a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f844a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f844ac:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f844b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f844b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f844b8:	d63f0200	blr	x16
   0x0000fffff7f844bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f844c0:	54002da0	b.eq	0xfffff7f84a74  // b.none
   0x0000fffff7f844c4:	b9400269	ldr	w9, [x19]
   0x0000fffff7f844c8:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f844cc:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f844d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844d4:	54000501	b.ne	0xfffff7f84574  // b.any
   0x0000fffff7f844d8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f844dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f844e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f844e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844e8:	54000461	b.ne	0xfffff7f84574  // b.any
   0x0000fffff7f844ec:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f844f0:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f844f4:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f844f8:	eb09015f	cmp	x10, x9
   0x0000fffff7f844fc:	540003c2	b.cs	0xfffff7f84574  // b.hs, b.nlast
   0x0000fffff7f84500:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84504:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84508:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8450c:	37d8034d	tbnz	w13, #27, 0xfffff7f84574
   0x0000fffff7f84510:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84514:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f84518:	36d8020e	tbz	w14, #27, 0xfffff7f84558
   0x0000fffff7f8451c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84520:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84524:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84528:	54000261	b.ne	0xfffff7f84574  // b.any
   0x0000fffff7f8452c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84530:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84534:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84538:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8453c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84540:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84544:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84548:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8454c:	54000149	b.ls	0xfffff7f84574  // b.plast
   0x0000fffff7f84550:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84554:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84558:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8455c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84560:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84564:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84568:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8456c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84570:	1400000e	b	0xfffff7f845a8
   0x0000fffff7f84574:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84578:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8457c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84580:	aa1503e2	mov	x2, x21
   0x0000fffff7f84584:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f84588:	aa1403e4	mov	x4, x20
   0x0000fffff7f8458c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84590:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f84594:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8459c:	d63f0200	blr	x16
   0x0000fffff7f845a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f845a4:	540027e0	b.eq	0xfffff7f84aa0  // b.none
   0x0000fffff7f845a8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f845ac:	37d806a9	tbnz	w9, #27, 0xfffff7f84680
   0x0000fffff7f845b0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f845b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f845b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f845bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845c0:	540001c1	b.ne	0xfffff7f845f8  // b.any
   0x0000fffff7f845c4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f845c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f845cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f845d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845d4:	54000121	b.ne	0xfffff7f845f8  // b.any
   0x0000fffff7f845d8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f845dc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f845e0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f845e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f845e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f845ec:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f845f0:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f845f4:	14000030	b	0xfffff7f846b4
   0x0000fffff7f845f8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f845fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84604:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84608:	54000120	b.eq	0xfffff7f8462c  // b.none
   0x0000fffff7f8460c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84610:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84618:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8461c:	54000321	b.ne	0xfffff7f84680  // b.any
   0x0000fffff7f84620:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f84624:	9e620120	scvtf	d0, x9
   0x0000fffff7f84628:	14000002	b	0xfffff7f84630
   0x0000fffff7f8462c:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f84630:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84634:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8463c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84640:	54000120	b.eq	0xfffff7f84664  // b.none
   0x0000fffff7f84644:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84648:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8464c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84650:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84654:	54000161	b.ne	0xfffff7f84680  // b.any
   0x0000fffff7f84658:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8465c:	9e620121	scvtf	d1, x9
   0x0000fffff7f84660:	14000002	b	0xfffff7f84668
   0x0000fffff7f84664:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84668:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8466c:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f84670:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84674:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84678:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f8467c:	17ffffde	b	0xfffff7f845f4
   0x0000fffff7f84680:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84684:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84688:	aa1303e1	mov	x1, x19
   0x0000fffff7f8468c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84690:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f84694:	aa1403e4	mov	x4, x20
   0x0000fffff7f84698:	aa1603e5	mov	x5, x22
   0x0000fffff7f8469c:	d293fa90	mov	x16, #0x9fd4                	// #40916
   0x0000fffff7f846a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f846a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f846a8:	d63f0200	blr	x16
   0x0000fffff7f846ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f846b0:	540020e0	b.eq	0xfffff7f84acc  // b.none
   0x0000fffff7f846b4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f846b8:	37d800e9	tbnz	w9, #27, 0xfffff7f846d4
   0x0000fffff7f846bc:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7f846c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f846c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f846c8:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f846cc:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f846d0:	1400000e	b	0xfffff7f84708
   0x0000fffff7f846d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f846d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f846dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f846e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f846e4:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f846e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f846ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f846f0:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f846f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f846f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f846fc:	d63f0200	blr	x16
   0x0000fffff7f84700:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84704:	54001fa0	b.eq	0xfffff7f84af8  // b.none
   0x0000fffff7f84708:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8470c:	37d80389	tbnz	w9, #27, 0xfffff7f8477c
   0x0000fffff7f84710:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84714:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8471c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84720:	540002e1	b.ne	0xfffff7f8477c  // b.any
   0x0000fffff7f84724:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84728:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8472c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84730:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84734:	54000241	b.ne	0xfffff7f8477c  // b.any
   0x0000fffff7f84738:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f8473c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84740:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84744:	540001c0	b.eq	0xfffff7f8477c  // b.none
   0x0000fffff7f84748:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f8474c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84750:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84754:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84758:	eb0b015f	cmp	x10, x11
   0x0000fffff7f8475c:	54000100	b.eq	0xfffff7f8477c  // b.none
   0x0000fffff7f84760:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84764:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84768:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8476c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84770:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f84774:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84778:	1400000e	b	0xfffff7f847b0
   0x0000fffff7f8477c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84780:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84784:	aa1303e1	mov	x1, x19
   0x0000fffff7f84788:	aa1503e2	mov	x2, x21
   0x0000fffff7f8478c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f84790:	aa1403e4	mov	x4, x20
   0x0000fffff7f84794:	aa1603e5	mov	x5, x22
   0x0000fffff7f84798:	d292cc10	mov	x16, #0x9660                	// #38496
   0x0000fffff7f8479c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f847a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f847a4:	d63f0200	blr	x16
   0x0000fffff7f847a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f847ac:	54001bc0	b.eq	0xfffff7f84b24  // b.none
   0x0000fffff7f847b0:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f847b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f847b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f847bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f847c0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f847c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f847c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f847cc:	d2908810	mov	x16, #0x8440                	// #33856
   0x0000fffff7f847d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f847d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f847d8:	d63f0200	blr	x16
   0x0000fffff7f847dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f847e0:	54001b80	b.eq	0xfffff7f84b50  // b.none
   0x0000fffff7f847e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f847e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f847ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f847f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f847f4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f847f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f847fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f84800:	d2980e10	mov	x16, #0xc070                	// #49264
   0x0000fffff7f84804:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84808:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8480c:	d63f0200	blr	x16
   0x0000fffff7f84810:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84814:	54001b40	b.eq	0xfffff7f84b7c  // b.none
   0x0000fffff7f84818:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8481c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84820:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84824:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84828:	54000501	b.ne	0xfffff7f848c8  // b.any
   0x0000fffff7f8482c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84830:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84834:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84838:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8483c:	54000461	b.ne	0xfffff7f848c8  // b.any
   0x0000fffff7f84840:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f84844:	f940266b	ldr	x11, [x19, #72]
   0x0000fffff7f84848:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8484c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84850:	540003c2	b.cs	0xfffff7f848c8  // b.hs, b.nlast
   0x0000fffff7f84854:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84858:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8485c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84860:	37d8034d	tbnz	w13, #27, 0xfffff7f848c8
   0x0000fffff7f84864:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84868:	b940b2ce	ldr	w14, [x22, #176]
   0x0000fffff7f8486c:	36d8020e	tbz	w14, #27, 0xfffff7f848ac
   0x0000fffff7f84870:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84874:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84878:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8487c:	54000261	b.ne	0xfffff7f848c8  // b.any
   0x0000fffff7f84880:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84884:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84888:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8488c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84890:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84894:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84898:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8489c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f848a0:	54000149	b.ls	0xfffff7f848c8  // b.plast
   0x0000fffff7f848a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f848a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f848ac:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f848b0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f848b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f848b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f848bc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f848c0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f848c4:	1400000e	b	0xfffff7f848fc
   0x0000fffff7f848c8:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f848cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f848d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f848d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f848d8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f848dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f848e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f848e4:	d28e2010	mov	x16, #0x7100                	// #28928
   0x0000fffff7f848e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f848ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f848f0:	d63f0200	blr	x16
   0x0000fffff7f848f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f848f8:	54001580	b.eq	0xfffff7f84ba8  // b.none
   0x0000fffff7f848fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84900:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84904:	aa1303e1	mov	x1, x19
   0x0000fffff7f84908:	aa1503e2	mov	x2, x21
   0x0000fffff7f8490c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f84910:	aa1403e4	mov	x4, x20
   0x0000fffff7f84914:	aa1603e5	mov	x5, x22
   0x0000fffff7f84918:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f8491c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84920:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84924:	d63f0200	blr	x16
   0x0000fffff7f84928:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f8492c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84930:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84934:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84938:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f8493c:	d65f03c0	ret
   0x0000fffff7f84940:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84944:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84948:	b9000289	str	w9, [x20]
   0x0000fffff7f8494c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84950:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84954:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84958:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8495c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84960:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84964:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84968:	d65f03c0	ret
   0x0000fffff7f8496c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84970:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84974:	b9000289	str	w9, [x20]
   0x0000fffff7f84978:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f8497c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84980:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84984:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84988:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8498c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84990:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84994:	d65f03c0	ret
   0x0000fffff7f84998:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8499c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f849a0:	b9000289	str	w9, [x20]
   0x0000fffff7f849a4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f849a8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f849ac:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f849b0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f849b4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f849b8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f849bc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f849c0:	d65f03c0	ret
   0x0000fffff7f849c4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f849c8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f849cc:	b9000289	str	w9, [x20]
   0x0000fffff7f849d0:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f849d4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f849d8:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f849dc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f849e0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f849e4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f849e8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f849ec:	d65f03c0	ret
   0x0000fffff7f849f0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f849f4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f849f8:	b9000289	str	w9, [x20]
   0x0000fffff7f849fc:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f84a00:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84a04:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84a08:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84a0c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84a10:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84a14:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84a18:	d65f03c0	ret
   0x0000fffff7f84a1c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84a20:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84a24:	b9000289	str	w9, [x20]
   0x0000fffff7f84a28:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f84a2c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84a30:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84a34:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84a38:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84a3c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84a40:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84a44:	d65f03c0	ret
   0x0000fffff7f84a48:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84a4c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84a50:	b9000289	str	w9, [x20]
   0x0000fffff7f84a54:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f84a58:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84a5c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84a60:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84a64:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84a68:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84a6c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84a70:	d65f03c0	ret
   0x0000fffff7f84a74:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84a78:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84a7c:	b9000289	str	w9, [x20]
   0x0000fffff7f84a80:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f84a84:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84a88:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84a8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84a90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84a94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84a98:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84a9c:	d65f03c0	ret
   0x0000fffff7f84aa0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84aa4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84aa8:	b9000289	str	w9, [x20]
   0x0000fffff7f84aac:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f84ab0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84ab4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84ab8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84abc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84ac0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84ac4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84ac8:	d65f03c0	ret
   0x0000fffff7f84acc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84ad0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84ad4:	b9000289	str	w9, [x20]
   0x0000fffff7f84ad8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f84adc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84ae0:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84ae4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84ae8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84aec:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84af0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84af4:	d65f03c0	ret
   0x0000fffff7f84af8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84afc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84b00:	b9000289	str	w9, [x20]
   0x0000fffff7f84b04:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f84b08:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84b0c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84b10:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84b14:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84b18:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84b1c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84b20:	d65f03c0	ret
   0x0000fffff7f84b24:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84b28:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84b2c:	b9000289	str	w9, [x20]
   0x0000fffff7f84b30:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f84b34:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84b38:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84b3c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84b40:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84b44:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84b48:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84b4c:	d65f03c0	ret
   0x0000fffff7f84b50:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84b54:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84b58:	b9000289	str	w9, [x20]
   0x0000fffff7f84b5c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f84b60:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84b64:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84b68:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84b6c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84b70:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84b74:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84b78:	d65f03c0	ret
   0x0000fffff7f84b7c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84b80:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84b84:	b9000289	str	w9, [x20]
   0x0000fffff7f84b88:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f84b8c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84b90:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84b94:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84b98:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84b9c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84ba0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84ba4:	d65f03c0	ret
   0x0000fffff7f84ba8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84bac:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84bb0:	b9000289	str	w9, [x20]
   0x0000fffff7f84bb4:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f84bb8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84bbc:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84bc0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84bc4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84bc8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84bcc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84bd0:	d65f03c0	ret
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
