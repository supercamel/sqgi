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
   0x0000fffff7f84094:	d294de90	mov	x16, #0xa6f4                	// #42740
   0x0000fffff7f84098:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8409c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840a0:	d63f0200	blr	x16
   0x0000fffff7f840a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f840a8:	5400ad20	b.eq	0xfffff7f8564c  // b.none
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
   0x0000fffff7f840fc:	5400abe0	b.eq	0xfffff7f85678  // b.none
   0x0000fffff7f84100:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84108:	aa1303e1	mov	x1, x19
   0x0000fffff7f8410c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84110:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f84114:	aa1403e4	mov	x4, x20
   0x0000fffff7f84118:	aa1603e5	mov	x5, x22
   0x0000fffff7f8411c:	d291ea10	mov	x16, #0x8f50                	// #36688
   0x0000fffff7f84120:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84128:	d63f0200	blr	x16
   0x0000fffff7f8412c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84130:	5400aba0	b.eq	0xfffff7f856a4  // b.none
   0x0000fffff7f84134:	f100041f	cmp	x0, #0x1
   0x0000fffff7f84138:	5400a680	b.eq	0xfffff7f85608  // b.none
   0x0000fffff7f8413c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84140:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84144:	540005a0	b.eq	0xfffff7f841f8  // b.none
   0x0000fffff7f84148:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8414c:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f84150:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84154:	54000521	b.ne	0xfffff7f841f8  // b.any
   0x0000fffff7f84158:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f8415c:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f84160:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84164:	540004a1	b.ne	0xfffff7f841f8  // b.any
   0x0000fffff7f84168:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8416c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84170:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84174:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84178:	54000400	b.eq	0xfffff7f841f8  // b.none
   0x0000fffff7f8417c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84180:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84184:	36d801d1	tbz	w17, #27, 0xfffff7f841bc
   0x0000fffff7f84188:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8418c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84190:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84194:	54000321	b.ne	0xfffff7f841f8  // b.any
   0x0000fffff7f84198:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8419c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f841a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f841a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f841a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f841ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f841b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f841b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f841b8:	54000209	b.ls	0xfffff7f841f8  // b.plast
   0x0000fffff7f841bc:	36d8008d	tbz	w13, #27, 0xfffff7f841cc
   0x0000fffff7f841c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f841c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f841c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f841cc:	36d80091	tbz	w17, #27, 0xfffff7f841dc
   0x0000fffff7f841d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f841d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f841d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f841dc:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f841e0:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f841e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f841e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f841ec:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f841f0:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f841f4:	1400000e	b	0xfffff7f8422c
   0x0000fffff7f841f8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f841fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84200:	aa1303e1	mov	x1, x19
   0x0000fffff7f84204:	aa1503e2	mov	x2, x21
   0x0000fffff7f84208:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f8420c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84210:	aa1603e5	mov	x5, x22
   0x0000fffff7f84214:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f84218:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8421c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84220:	d63f0200	blr	x16
   0x0000fffff7f84224:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84228:	5400a540	b.eq	0xfffff7f856d0  // b.none
   0x0000fffff7f8422c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84230:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84234:	aa1303e1	mov	x1, x19
   0x0000fffff7f84238:	aa1503e2	mov	x2, x21
   0x0000fffff7f8423c:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f84240:	aa1403e4	mov	x4, x20
   0x0000fffff7f84244:	aa1603e5	mov	x5, x22
   0x0000fffff7f84248:	d294de90	mov	x16, #0xa6f4                	// #42740
   0x0000fffff7f8424c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84250:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84254:	d63f0200	blr	x16
   0x0000fffff7f84258:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8425c:	5400a500	b.eq	0xfffff7f856fc  // b.none
   0x0000fffff7f84260:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84264:	37d80389	tbnz	w9, #27, 0xfffff7f842d4
   0x0000fffff7f84268:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8426c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84270:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84274:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84278:	540002e1	b.ne	0xfffff7f842d4  // b.any
   0x0000fffff7f8427c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84280:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84284:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84288:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8428c:	54000241	b.ne	0xfffff7f842d4  // b.any
   0x0000fffff7f84290:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84294:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f84298:	f100015f	cmp	x10, #0x0
   0x0000fffff7f8429c:	540001c0	b.eq	0xfffff7f842d4  // b.none
   0x0000fffff7f842a0:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f842a4:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f842a8:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f842ac:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f842b0:	eb0b015f	cmp	x10, x11
   0x0000fffff7f842b4:	54000100	b.eq	0xfffff7f842d4  // b.none
   0x0000fffff7f842b8:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f842bc:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f842c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f842c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f842c8:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f842cc:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f842d0:	1400000e	b	0xfffff7f84308
   0x0000fffff7f842d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f842d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f842dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f842e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f842e4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f842e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f842ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f842f0:	d2936610	mov	x16, #0x9b30                	// #39728
   0x0000fffff7f842f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f842f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842fc:	d63f0200	blr	x16
   0x0000fffff7f84300:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84304:	5400a120	b.eq	0xfffff7f85728  // b.none
   0x0000fffff7f84308:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f8430c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84310:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84314:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84318:	540001c1	b.ne	0xfffff7f84350  // b.any
   0x0000fffff7f8431c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84320:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84324:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84328:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8432c:	54000801	b.ne	0xfffff7f8442c  // b.any
   0x0000fffff7f84330:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84334:	f940166b	ldr	x11, [x19, #40]
   0x0000fffff7f84338:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8433c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84340:	54000762	b.cs	0xfffff7f8442c  // b.hs, b.nlast
   0x0000fffff7f84344:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84348:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8434c:	14000014	b	0xfffff7f8439c
   0x0000fffff7f84350:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84354:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84358:	540006a0	b.eq	0xfffff7f8442c  // b.none
   0x0000fffff7f8435c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f84360:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f84364:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84368:	54000621	b.ne	0xfffff7f8442c  // b.any
   0x0000fffff7f8436c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f84370:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f84374:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84378:	540005a1	b.ne	0xfffff7f8442c  // b.any
   0x0000fffff7f8437c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84380:	b94037ea	ldr	w10, [sp, #52]
   0x0000fffff7f84384:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84388:	54000521	b.ne	0xfffff7f8442c  // b.any
   0x0000fffff7f8438c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84390:	f94023ea	ldr	x10, [sp, #64]
   0x0000fffff7f84394:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84398:	540004a1	b.ne	0xfffff7f8442c  // b.any
   0x0000fffff7f8439c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f843a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f843a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f843a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f843ac:	54000400	b.eq	0xfffff7f8442c  // b.none
   0x0000fffff7f843b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f843b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f843b8:	36d801d1	tbz	w17, #27, 0xfffff7f843f0
   0x0000fffff7f843bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f843c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f843c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f843c8:	54000321	b.ne	0xfffff7f8442c  // b.any
   0x0000fffff7f843cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f843d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f843d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f843d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f843dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f843e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f843e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f843e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f843ec:	54000209	b.ls	0xfffff7f8442c  // b.plast
   0x0000fffff7f843f0:	36d8008d	tbz	w13, #27, 0xfffff7f84400
   0x0000fffff7f843f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f843f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f843fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84400:	36d80091	tbz	w17, #27, 0xfffff7f84410
   0x0000fffff7f84404:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84408:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8440c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84410:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f84414:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f84418:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8441c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84420:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84424:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f84428:	1400000e	b	0xfffff7f84460
   0x0000fffff7f8442c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84434:	aa1303e1	mov	x1, x19
   0x0000fffff7f84438:	aa1503e2	mov	x2, x21
   0x0000fffff7f8443c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f84440:	aa1403e4	mov	x4, x20
   0x0000fffff7f84444:	aa1603e5	mov	x5, x22
   0x0000fffff7f84448:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f8444c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84454:	d63f0200	blr	x16
   0x0000fffff7f84458:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8445c:	540097c0	b.eq	0xfffff7f85754  // b.none
   0x0000fffff7f84460:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84468:	aa1303e1	mov	x1, x19
   0x0000fffff7f8446c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84470:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f84474:	aa1403e4	mov	x4, x20
   0x0000fffff7f84478:	aa1603e5	mov	x5, x22
   0x0000fffff7f8447c:	d299ca10	mov	x16, #0xce50                	// #52816
   0x0000fffff7f84480:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84488:	d63f0200	blr	x16
   0x0000fffff7f8448c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84490:	54009780	b.eq	0xfffff7f85780  // b.none
   0x0000fffff7f84494:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84498:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8449c:	540005a0	b.eq	0xfffff7f84550  // b.none
   0x0000fffff7f844a0:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f844a4:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f844a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844ac:	54000521	b.ne	0xfffff7f84550  // b.any
   0x0000fffff7f844b0:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f844b4:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f844b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844bc:	540004a1	b.ne	0xfffff7f84550  // b.any
   0x0000fffff7f844c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f844c4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f844c8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f844cc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f844d0:	54000400	b.eq	0xfffff7f84550  // b.none
   0x0000fffff7f844d4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f844d8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f844dc:	36d801d1	tbz	w17, #27, 0xfffff7f84514
   0x0000fffff7f844e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f844e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f844e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f844ec:	54000321	b.ne	0xfffff7f84550  // b.any
   0x0000fffff7f844f0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f844f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f844fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84500:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84504:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84508:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8450c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84510:	54000209	b.ls	0xfffff7f84550  // b.plast
   0x0000fffff7f84514:	36d8008d	tbz	w13, #27, 0xfffff7f84524
   0x0000fffff7f84518:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8451c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84520:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84524:	36d80091	tbz	w17, #27, 0xfffff7f84534
   0x0000fffff7f84528:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8452c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84530:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84534:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f84538:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f8453c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84540:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84544:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84548:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f8454c:	1400000e	b	0xfffff7f84584
   0x0000fffff7f84550:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84554:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84558:	aa1303e1	mov	x1, x19
   0x0000fffff7f8455c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84560:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f84564:	aa1403e4	mov	x4, x20
   0x0000fffff7f84568:	aa1603e5	mov	x5, x22
   0x0000fffff7f8456c:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f84570:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84574:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84578:	d63f0200	blr	x16
   0x0000fffff7f8457c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84580:	54009160	b.eq	0xfffff7f857ac  // b.none
   0x0000fffff7f84584:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84588:	37d800e9	tbnz	w9, #27, 0xfffff7f845a4
   0x0000fffff7f8458c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84590:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84594:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84598:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f8459c:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f845a0:	1400000e	b	0xfffff7f845d8
   0x0000fffff7f845a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f845a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f845ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f845b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f845b4:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f845b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f845bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f845c0:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f845c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f845c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f845cc:	d63f0200	blr	x16
   0x0000fffff7f845d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f845d4:	54009020	b.eq	0xfffff7f857d8  // b.none
   0x0000fffff7f845d8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f845dc:	37d800e9	tbnz	w9, #27, 0xfffff7f845f8
   0x0000fffff7f845e0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f845e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f845e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f845ec:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f845f0:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f845f4:	1400000e	b	0xfffff7f8462c
   0x0000fffff7f845f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f845fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84600:	aa1303e1	mov	x1, x19
   0x0000fffff7f84604:	aa1503e2	mov	x2, x21
   0x0000fffff7f84608:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f8460c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84610:	aa1603e5	mov	x5, x22
   0x0000fffff7f84614:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84618:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8461c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84620:	d63f0200	blr	x16
   0x0000fffff7f84624:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84628:	54008ee0	b.eq	0xfffff7f85804  // b.none
   0x0000fffff7f8462c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84630:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84634:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84638:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8463c:	540001c1	b.ne	0xfffff7f84674  // b.any
   0x0000fffff7f84640:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8464c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84650:	54000801	b.ne	0xfffff7f84750  // b.any
   0x0000fffff7f84654:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f84658:	f9403e6b	ldr	x11, [x19, #120]
   0x0000fffff7f8465c:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84660:	eb09015f	cmp	x10, x9
   0x0000fffff7f84664:	54000762	b.cs	0xfffff7f84750  // b.hs, b.nlast
   0x0000fffff7f84668:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f8466c:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84670:	14000014	b	0xfffff7f846c0
   0x0000fffff7f84674:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f84678:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8467c:	540006a0	b.eq	0xfffff7f84750  // b.none
   0x0000fffff7f84680:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84684:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f84688:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8468c:	54000621	b.ne	0xfffff7f84750  // b.any
   0x0000fffff7f84690:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f84694:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f84698:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8469c:	540005a1	b.ne	0xfffff7f84750  // b.any
   0x0000fffff7f846a0:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f846a4:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f846a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846ac:	54000521	b.ne	0xfffff7f84750  // b.any
   0x0000fffff7f846b0:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f846b4:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f846b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846bc:	540004a1	b.ne	0xfffff7f84750  // b.any
   0x0000fffff7f846c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f846c4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f846c8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f846cc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f846d0:	54000400	b.eq	0xfffff7f84750  // b.none
   0x0000fffff7f846d4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f846d8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f846dc:	36d801d1	tbz	w17, #27, 0xfffff7f84714
   0x0000fffff7f846e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f846e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f846e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f846ec:	54000321	b.ne	0xfffff7f84750  // b.any
   0x0000fffff7f846f0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f846f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f846f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f846fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84700:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84704:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84708:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8470c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84710:	54000209	b.ls	0xfffff7f84750  // b.plast
   0x0000fffff7f84714:	36d8008d	tbz	w13, #27, 0xfffff7f84724
   0x0000fffff7f84718:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8471c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84720:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84724:	36d80091	tbz	w17, #27, 0xfffff7f84734
   0x0000fffff7f84728:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8472c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84730:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84734:	b940a26e	ldr	w14, [x19, #160]
   0x0000fffff7f84738:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f8473c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84740:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84744:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f84748:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f8474c:	1400000e	b	0xfffff7f84784
   0x0000fffff7f84750:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f84754:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84758:	aa1303e1	mov	x1, x19
   0x0000fffff7f8475c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84760:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f84764:	aa1403e4	mov	x4, x20
   0x0000fffff7f84768:	aa1603e5	mov	x5, x22
   0x0000fffff7f8476c:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84770:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84774:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84778:	d63f0200	blr	x16
   0x0000fffff7f8477c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84780:	54008580	b.eq	0xfffff7f85830  // b.none
   0x0000fffff7f84784:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84788:	37d806a9	tbnz	w9, #27, 0xfffff7f8485c
   0x0000fffff7f8478c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84790:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84794:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84798:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8479c:	540001c1	b.ne	0xfffff7f847d4  // b.any
   0x0000fffff7f847a0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f847a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f847a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847b0:	54000121	b.ne	0xfffff7f847d4  // b.any
   0x0000fffff7f847b4:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f847b8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f847bc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f847c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f847c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847c8:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f847cc:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f847d0:	14000030	b	0xfffff7f84890
   0x0000fffff7f847d4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f847d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f847dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847e4:	54000120	b.eq	0xfffff7f84808  // b.none
   0x0000fffff7f847e8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f847ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f847f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847f8:	54000321	b.ne	0xfffff7f8485c  // b.any
   0x0000fffff7f847fc:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84800:	9e620120	scvtf	d0, x9
   0x0000fffff7f84804:	14000002	b	0xfffff7f8480c
   0x0000fffff7f84808:	fd405660	ldr	d0, [x19, #168]
   0x0000fffff7f8480c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84810:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84814:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84818:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8481c:	54000120	b.eq	0xfffff7f84840  // b.none
   0x0000fffff7f84820:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84824:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8482c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84830:	54000161	b.ne	0xfffff7f8485c  // b.any
   0x0000fffff7f84834:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84838:	9e620121	scvtf	d1, x9
   0x0000fffff7f8483c:	14000002	b	0xfffff7f84844
   0x0000fffff7f84840:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84844:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84848:	fd005660	str	d0, [x19, #168]
   0x0000fffff7f8484c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84854:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84858:	17ffffde	b	0xfffff7f847d0
   0x0000fffff7f8485c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84860:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84864:	aa1303e1	mov	x1, x19
   0x0000fffff7f84868:	aa1503e2	mov	x2, x21
   0x0000fffff7f8486c:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f84870:	aa1403e4	mov	x4, x20
   0x0000fffff7f84874:	aa1603e5	mov	x5, x22
   0x0000fffff7f84878:	d2949490	mov	x16, #0xa4a4                	// #42148
   0x0000fffff7f8487c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84880:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84884:	d63f0200	blr	x16
   0x0000fffff7f84888:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8488c:	54007e80	b.eq	0xfffff7f8585c  // b.none
   0x0000fffff7f84890:	b940b269	ldr	w9, [x19, #176]
   0x0000fffff7f84894:	37d800e9	tbnz	w9, #27, 0xfffff7f848b0
   0x0000fffff7f84898:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7f8489c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848a4:	f9005e69	str	x9, [x19, #184]
   0x0000fffff7f848a8:	b900b26a	str	w10, [x19, #176]
   0x0000fffff7f848ac:	1400000e	b	0xfffff7f848e4
   0x0000fffff7f848b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f848b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f848b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f848bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f848c0:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f848c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f848c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f848cc:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f848d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f848d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f848d8:	d63f0200	blr	x16
   0x0000fffff7f848dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f848e0:	54007d40	b.eq	0xfffff7f85888  // b.none
   0x0000fffff7f848e4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f848e8:	37d80389	tbnz	w9, #27, 0xfffff7f84958
   0x0000fffff7f848ec:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f848f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848fc:	540002e1	b.ne	0xfffff7f84958  // b.any
   0x0000fffff7f84900:	b940b269	ldr	w9, [x19, #176]
   0x0000fffff7f84904:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84908:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8490c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84910:	54000241	b.ne	0xfffff7f84958  // b.any
   0x0000fffff7f84914:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84918:	f9405e6a	ldr	x10, [x19, #184]
   0x0000fffff7f8491c:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84920:	540001c0	b.eq	0xfffff7f84958  // b.none
   0x0000fffff7f84924:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84928:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f8492c:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84930:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84934:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84938:	54000100	b.eq	0xfffff7f84958  // b.none
   0x0000fffff7f8493c:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84940:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8494c:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f84950:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84954:	1400000e	b	0xfffff7f8498c
   0x0000fffff7f84958:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8495c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84960:	aa1303e1	mov	x1, x19
   0x0000fffff7f84964:	aa1503e2	mov	x2, x21
   0x0000fffff7f84968:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f8496c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84970:	aa1603e5	mov	x5, x22
   0x0000fffff7f84974:	d2936610	mov	x16, #0x9b30                	// #39728
   0x0000fffff7f84978:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8497c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84980:	d63f0200	blr	x16
   0x0000fffff7f84984:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84988:	54007960	b.eq	0xfffff7f858b4  // b.none
   0x0000fffff7f8498c:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84990:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84994:	aa1303e1	mov	x1, x19
   0x0000fffff7f84998:	aa1503e2	mov	x2, x21
   0x0000fffff7f8499c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f849a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f849a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f849a8:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f849ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f849b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849b4:	d63f0200	blr	x16
   0x0000fffff7f849b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f849bc:	54007920	b.eq	0xfffff7f858e0  // b.none
   0x0000fffff7f849c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f849c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f849cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f849d0:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f849d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f849d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f849dc:	d294de90	mov	x16, #0xa6f4                	// #42740
   0x0000fffff7f849e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f849e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849e8:	d63f0200	blr	x16
   0x0000fffff7f849ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f849f0:	540078e0	b.eq	0xfffff7f8590c  // b.none
   0x0000fffff7f849f4:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f849f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f84a00:	aa1503e2	mov	x2, x21
   0x0000fffff7f84a04:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f84a08:	aa1403e4	mov	x4, x20
   0x0000fffff7f84a0c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84a10:	d299ca10	mov	x16, #0xce50                	// #52816
   0x0000fffff7f84a14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84a18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84a1c:	d63f0200	blr	x16
   0x0000fffff7f84a20:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84a24:	540078a0	b.eq	0xfffff7f85938  // b.none
   0x0000fffff7f84a28:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84a2c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84a30:	aa1303e1	mov	x1, x19
   0x0000fffff7f84a34:	aa1503e2	mov	x2, x21
   0x0000fffff7f84a38:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f84a3c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84a40:	aa1603e5	mov	x5, x22
   0x0000fffff7f84a44:	d2898810	mov	x16, #0x4c40                	// #19520
   0x0000fffff7f84a48:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84a4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84a50:	d63f0200	blr	x16
   0x0000fffff7f84a54:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84a58:	54007860	b.eq	0xfffff7f85964  // b.none
   0x0000fffff7f84a5c:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f84a60:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84a64:	540005a0	b.eq	0xfffff7f84b18  // b.none
   0x0000fffff7f84a68:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84a6c:	b940b3ea	ldr	w10, [sp, #176]
   0x0000fffff7f84a70:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a74:	54000521	b.ne	0xfffff7f84b18  // b.any
   0x0000fffff7f84a78:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84a7c:	f9405fea	ldr	x10, [sp, #184]
   0x0000fffff7f84a80:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a84:	540004a1	b.ne	0xfffff7f84b18  // b.any
   0x0000fffff7f84a88:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84a8c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84a90:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84a94:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84a98:	54000400	b.eq	0xfffff7f84b18  // b.none
   0x0000fffff7f84a9c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84aa0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84aa4:	36d801d1	tbz	w17, #27, 0xfffff7f84adc
   0x0000fffff7f84aa8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84aac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84ab0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84ab4:	54000321	b.ne	0xfffff7f84b18  // b.any
   0x0000fffff7f84ab8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84abc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84ac0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84ac4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84ac8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84acc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84ad0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84ad4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84ad8:	54000209	b.ls	0xfffff7f84b18  // b.plast
   0x0000fffff7f84adc:	36d8008d	tbz	w13, #27, 0xfffff7f84aec
   0x0000fffff7f84ae0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84ae4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84ae8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84aec:	36d80091	tbz	w17, #27, 0xfffff7f84afc
   0x0000fffff7f84af0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84af4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84af8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84afc:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f84b00:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f84b04:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84b08:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84b0c:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84b10:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f84b14:	1400000e	b	0xfffff7f84b4c
   0x0000fffff7f84b18:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f84b1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84b20:	aa1303e1	mov	x1, x19
   0x0000fffff7f84b24:	aa1503e2	mov	x2, x21
   0x0000fffff7f84b28:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f84b2c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84b30:	aa1603e5	mov	x5, x22
   0x0000fffff7f84b34:	d2956c10	mov	x16, #0xab60                	// #43872
   0x0000fffff7f84b38:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84b3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84b40:	d63f0200	blr	x16
   0x0000fffff7f84b44:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84b48:	54007240	b.eq	0xfffff7f85990  // b.none
   0x0000fffff7f84b4c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84b50:	37d80109	tbnz	w9, #27, 0xfffff7f84b70
   0x0000fffff7f84b54:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84b58:	f2e7fa09	movk	x9, #0x3fd0, lsl #48
   0x0000fffff7f84b5c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84b60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b64:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f84b68:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84b6c:	1400000e	b	0xfffff7f84ba4
   0x0000fffff7f84b70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84b74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84b78:	aa1303e1	mov	x1, x19
   0x0000fffff7f84b7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84b80:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f84b84:	aa1403e4	mov	x4, x20
   0x0000fffff7f84b88:	aa1603e5	mov	x5, x22
   0x0000fffff7f84b8c:	d294de90	mov	x16, #0xa6f4                	// #42740
   0x0000fffff7f84b90:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84b94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84b98:	d63f0200	blr	x16
   0x0000fffff7f84b9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ba0:	540070e0	b.eq	0xfffff7f859bc  // b.none
   0x0000fffff7f84ba4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84ba8:	37d806a9	tbnz	w9, #27, 0xfffff7f84c7c
   0x0000fffff7f84bac:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84bb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84bb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84bb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bbc:	540001c1	b.ne	0xfffff7f84bf4  // b.any
   0x0000fffff7f84bc0:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84bc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84bc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84bcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bd0:	54000121	b.ne	0xfffff7f84bf4  // b.any
   0x0000fffff7f84bd4:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84bd8:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f84bdc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84be0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84be4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84be8:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f84bec:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f84bf0:	14000030	b	0xfffff7f84cb0
   0x0000fffff7f84bf4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84bf8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c04:	54000120	b.eq	0xfffff7f84c28  // b.none
   0x0000fffff7f84c08:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84c0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84c10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c14:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c18:	54000321	b.ne	0xfffff7f84c7c  // b.any
   0x0000fffff7f84c1c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84c20:	9e620120	scvtf	d0, x9
   0x0000fffff7f84c24:	14000002	b	0xfffff7f84c2c
   0x0000fffff7f84c28:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7f84c2c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84c30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84c34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c3c:	54000120	b.eq	0xfffff7f84c60  // b.none
   0x0000fffff7f84c40:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84c44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84c48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c50:	54000161	b.ne	0xfffff7f84c7c  // b.any
   0x0000fffff7f84c54:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84c58:	9e620121	scvtf	d1, x9
   0x0000fffff7f84c5c:	14000002	b	0xfffff7f84c64
   0x0000fffff7f84c60:	fd405661	ldr	d1, [x19, #168]
   0x0000fffff7f84c64:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84c68:	fd004e60	str	d0, [x19, #152]
   0x0000fffff7f84c6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84c70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c74:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f84c78:	17ffffde	b	0xfffff7f84bf0
   0x0000fffff7f84c7c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84c80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84c84:	aa1303e1	mov	x1, x19
   0x0000fffff7f84c88:	aa1503e2	mov	x2, x21
   0x0000fffff7f84c8c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f84c90:	aa1403e4	mov	x4, x20
   0x0000fffff7f84c94:	aa1603e5	mov	x5, x22
   0x0000fffff7f84c98:	d2949490	mov	x16, #0xa4a4                	// #42148
   0x0000fffff7f84c9c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84ca0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ca4:	d63f0200	blr	x16
   0x0000fffff7f84ca8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84cac:	540069e0	b.eq	0xfffff7f859e8  // b.none
   0x0000fffff7f84cb0:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f84cb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84cb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f84cbc:	aa1503e2	mov	x2, x21
   0x0000fffff7f84cc0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f84cc4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84cc8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ccc:	d299ca10	mov	x16, #0xce50                	// #52816
   0x0000fffff7f84cd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84cd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84cd8:	d63f0200	blr	x16
   0x0000fffff7f84cdc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ce0:	540069a0	b.eq	0xfffff7f85a14  // b.none
   0x0000fffff7f84ce4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84ce8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84cec:	540005a0	b.eq	0xfffff7f84da0  // b.none
   0x0000fffff7f84cf0:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84cf4:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f84cf8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84cfc:	54000521	b.ne	0xfffff7f84da0  // b.any
   0x0000fffff7f84d00:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84d04:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f84d08:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84d0c:	540004a1	b.ne	0xfffff7f84da0  // b.any
   0x0000fffff7f84d10:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84d14:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84d18:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84d1c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84d20:	54000400	b.eq	0xfffff7f84da0  // b.none
   0x0000fffff7f84d24:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84d28:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84d2c:	36d801d1	tbz	w17, #27, 0xfffff7f84d64
   0x0000fffff7f84d30:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84d34:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84d38:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84d3c:	54000321	b.ne	0xfffff7f84da0  // b.any
   0x0000fffff7f84d40:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84d44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d48:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84d4c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84d50:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84d54:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84d58:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84d5c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84d60:	54000209	b.ls	0xfffff7f84da0  // b.plast
   0x0000fffff7f84d64:	36d8008d	tbz	w13, #27, 0xfffff7f84d74
   0x0000fffff7f84d68:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84d6c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84d70:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84d74:	36d80091	tbz	w17, #27, 0xfffff7f84d84
   0x0000fffff7f84d78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d7c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84d80:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84d84:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f84d88:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f84d8c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84d90:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84d94:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84d98:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f84d9c:	1400000e	b	0xfffff7f84dd4
   0x0000fffff7f84da0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84da4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84da8:	aa1303e1	mov	x1, x19
   0x0000fffff7f84dac:	aa1503e2	mov	x2, x21
   0x0000fffff7f84db0:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f84db4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84db8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84dbc:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f84dc0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84dc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84dc8:	d63f0200	blr	x16
   0x0000fffff7f84dcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84dd0:	54006380	b.eq	0xfffff7f85a40  // b.none
   0x0000fffff7f84dd4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84dd8:	37d800e9	tbnz	w9, #27, 0xfffff7f84df4
   0x0000fffff7f84ddc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84de0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84de4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84de8:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f84dec:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f84df0:	1400000e	b	0xfffff7f84e28
   0x0000fffff7f84df4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84df8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84dfc:	aa1303e1	mov	x1, x19
   0x0000fffff7f84e00:	aa1503e2	mov	x2, x21
   0x0000fffff7f84e04:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f84e08:	aa1403e4	mov	x4, x20
   0x0000fffff7f84e0c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84e10:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84e14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84e18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84e1c:	d63f0200	blr	x16
   0x0000fffff7f84e20:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84e24:	54006240	b.eq	0xfffff7f85a6c  // b.none
   0x0000fffff7f84e28:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84e2c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84e30:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84e34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84e38:	540001c1	b.ne	0xfffff7f84e70  // b.any
   0x0000fffff7f84e3c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84e40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84e44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84e48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84e4c:	54000801	b.ne	0xfffff7f84f4c  // b.any
   0x0000fffff7f84e50:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84e54:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f84e58:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84e5c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84e60:	54000762	b.cs	0xfffff7f84f4c  // b.hs, b.nlast
   0x0000fffff7f84e64:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84e68:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84e6c:	14000014	b	0xfffff7f84ebc
   0x0000fffff7f84e70:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84e74:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84e78:	540006a0	b.eq	0xfffff7f84f4c  // b.none
   0x0000fffff7f84e7c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84e80:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84e84:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84e88:	54000621	b.ne	0xfffff7f84f4c  // b.any
   0x0000fffff7f84e8c:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f84e90:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84e94:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84e98:	540005a1	b.ne	0xfffff7f84f4c  // b.any
   0x0000fffff7f84e9c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84ea0:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f84ea4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84ea8:	54000521	b.ne	0xfffff7f84f4c  // b.any
   0x0000fffff7f84eac:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84eb0:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f84eb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84eb8:	540004a1	b.ne	0xfffff7f84f4c  // b.any
   0x0000fffff7f84ebc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84ec0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84ec4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84ec8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84ecc:	54000400	b.eq	0xfffff7f84f4c  // b.none
   0x0000fffff7f84ed0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84ed4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84ed8:	36d801d1	tbz	w17, #27, 0xfffff7f84f10
   0x0000fffff7f84edc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84ee0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84ee4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84ee8:	54000321	b.ne	0xfffff7f84f4c  // b.any
   0x0000fffff7f84eec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84ef0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84ef4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84ef8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84efc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84f00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84f04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84f08:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84f0c:	54000209	b.ls	0xfffff7f84f4c  // b.plast
   0x0000fffff7f84f10:	36d8008d	tbz	w13, #27, 0xfffff7f84f20
   0x0000fffff7f84f14:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84f18:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84f1c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84f20:	36d80091	tbz	w17, #27, 0xfffff7f84f30
   0x0000fffff7f84f24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84f28:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84f2c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84f30:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f84f34:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f84f38:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84f3c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84f40:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84f44:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f84f48:	1400000e	b	0xfffff7f84f80
   0x0000fffff7f84f4c:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84f50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84f54:	aa1303e1	mov	x1, x19
   0x0000fffff7f84f58:	aa1503e2	mov	x2, x21
   0x0000fffff7f84f5c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f84f60:	aa1403e4	mov	x4, x20
   0x0000fffff7f84f64:	aa1603e5	mov	x5, x22
   0x0000fffff7f84f68:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84f6c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84f70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84f74:	d63f0200	blr	x16
   0x0000fffff7f84f78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84f7c:	540058e0	b.eq	0xfffff7f85a98  // b.none
   0x0000fffff7f84f80:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7f84f84:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84f88:	540005a0	b.eq	0xfffff7f8503c  // b.none
   0x0000fffff7f84f8c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84f90:	b94093ea	ldr	w10, [sp, #144]
   0x0000fffff7f84f94:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84f98:	54000521	b.ne	0xfffff7f8503c  // b.any
   0x0000fffff7f84f9c:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84fa0:	f9404fea	ldr	x10, [sp, #152]
   0x0000fffff7f84fa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84fa8:	540004a1	b.ne	0xfffff7f8503c  // b.any
   0x0000fffff7f84fac:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84fb0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84fb4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84fb8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84fbc:	54000400	b.eq	0xfffff7f8503c  // b.none
   0x0000fffff7f84fc0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84fc4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84fc8:	36d801d1	tbz	w17, #27, 0xfffff7f85000
   0x0000fffff7f84fcc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84fd0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84fd4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84fd8:	54000321	b.ne	0xfffff7f8503c  // b.any
   0x0000fffff7f84fdc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84fe0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84fe4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84fe8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84fec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84ff0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84ff4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84ff8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84ffc:	54000209	b.ls	0xfffff7f8503c  // b.plast
   0x0000fffff7f85000:	36d8008d	tbz	w13, #27, 0xfffff7f85010
   0x0000fffff7f85004:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85008:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8500c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85010:	36d80091	tbz	w17, #27, 0xfffff7f85020
   0x0000fffff7f85014:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85018:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8501c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85020:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f85024:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f85028:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8502c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85030:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f85034:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f85038:	1400000e	b	0xfffff7f85070
   0x0000fffff7f8503c:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f85040:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85044:	aa1303e1	mov	x1, x19
   0x0000fffff7f85048:	aa1503e2	mov	x2, x21
   0x0000fffff7f8504c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f85050:	aa1403e4	mov	x4, x20
   0x0000fffff7f85054:	aa1603e5	mov	x5, x22
   0x0000fffff7f85058:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f8505c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85060:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85064:	d63f0200	blr	x16
   0x0000fffff7f85068:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8506c:	540052c0	b.eq	0xfffff7f85ac4  // b.none
   0x0000fffff7f85070:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f85074:	37d800e9	tbnz	w9, #27, 0xfffff7f85090
   0x0000fffff7f85078:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f8507c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85080:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85084:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f85088:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f8508c:	1400000e	b	0xfffff7f850c4
   0x0000fffff7f85090:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85094:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85098:	aa1303e1	mov	x1, x19
   0x0000fffff7f8509c:	aa1503e2	mov	x2, x21
   0x0000fffff7f850a0:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f850a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f850a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f850ac:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f850b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f850b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f850b8:	d63f0200	blr	x16
   0x0000fffff7f850bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f850c0:	54005180	b.eq	0xfffff7f85af0  // b.none
   0x0000fffff7f850c4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f850c8:	37d80389	tbnz	w9, #27, 0xfffff7f85138
   0x0000fffff7f850cc:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f850d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f850d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850dc:	540002e1	b.ne	0xfffff7f85138  // b.any
   0x0000fffff7f850e0:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f850e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f850e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850f0:	54000241	b.ne	0xfffff7f85138  // b.any
   0x0000fffff7f850f4:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f850f8:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f850fc:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85100:	540001c0	b.eq	0xfffff7f85138  // b.none
   0x0000fffff7f85104:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85108:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f8510c:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85110:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f85114:	eb0b015f	cmp	x10, x11
   0x0000fffff7f85118:	54000100	b.eq	0xfffff7f85138  // b.none
   0x0000fffff7f8511c:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f85120:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85124:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85128:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8512c:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f85130:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f85134:	1400000e	b	0xfffff7f8516c
   0x0000fffff7f85138:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8513c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85140:	aa1303e1	mov	x1, x19
   0x0000fffff7f85144:	aa1503e2	mov	x2, x21
   0x0000fffff7f85148:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f8514c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85150:	aa1603e5	mov	x5, x22
   0x0000fffff7f85154:	d2936610	mov	x16, #0x9b30                	// #39728
   0x0000fffff7f85158:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8515c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85160:	d63f0200	blr	x16
   0x0000fffff7f85164:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85168:	54004da0	b.eq	0xfffff7f85b1c  // b.none
   0x0000fffff7f8516c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85170:	37d806a9	tbnz	w9, #27, 0xfffff7f85244
   0x0000fffff7f85174:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85178:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8517c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85180:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85184:	540001c1	b.ne	0xfffff7f851bc  // b.any
   0x0000fffff7f85188:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8518c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85190:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85194:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85198:	54000121	b.ne	0xfffff7f851bc  // b.any
   0x0000fffff7f8519c:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f851a0:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f851a4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f851a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851b0:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f851b4:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f851b8:	14000030	b	0xfffff7f85278
   0x0000fffff7f851bc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f851c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f851c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851cc:	54000120	b.eq	0xfffff7f851f0  // b.none
   0x0000fffff7f851d0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f851d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851e0:	54000321	b.ne	0xfffff7f85244  // b.any
   0x0000fffff7f851e4:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f851e8:	9e620120	scvtf	d0, x9
   0x0000fffff7f851ec:	14000002	b	0xfffff7f851f4
   0x0000fffff7f851f0:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f851f4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f851f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f851fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85200:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85204:	54000120	b.eq	0xfffff7f85228  // b.none
   0x0000fffff7f85208:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8520c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85210:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85214:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85218:	54000161	b.ne	0xfffff7f85244  // b.any
   0x0000fffff7f8521c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f85220:	9e620121	scvtf	d1, x9
   0x0000fffff7f85224:	14000002	b	0xfffff7f8522c
   0x0000fffff7f85228:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f8522c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85230:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f85234:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85238:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8523c:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f85240:	17ffffde	b	0xfffff7f851b8
   0x0000fffff7f85244:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85248:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8524c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85250:	aa1503e2	mov	x2, x21
   0x0000fffff7f85254:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f85258:	aa1403e4	mov	x4, x20
   0x0000fffff7f8525c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85260:	d2949490	mov	x16, #0xa4a4                	// #42148
   0x0000fffff7f85264:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85268:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8526c:	d63f0200	blr	x16
   0x0000fffff7f85270:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85274:	540046a0	b.eq	0xfffff7f85b48  // b.none
   0x0000fffff7f85278:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f8527c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85280:	540005a0	b.eq	0xfffff7f85334  // b.none
   0x0000fffff7f85284:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85288:	b940b3ea	ldr	w10, [sp, #176]
   0x0000fffff7f8528c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85290:	54000521	b.ne	0xfffff7f85334  // b.any
   0x0000fffff7f85294:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85298:	f9405fea	ldr	x10, [sp, #184]
   0x0000fffff7f8529c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852a0:	540004a1	b.ne	0xfffff7f85334  // b.any
   0x0000fffff7f852a4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f852a8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f852ac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f852b0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f852b4:	54000400	b.eq	0xfffff7f85334  // b.none
   0x0000fffff7f852b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f852bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f852c0:	36d801d1	tbz	w17, #27, 0xfffff7f852f8
   0x0000fffff7f852c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f852c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f852cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f852d0:	54000321	b.ne	0xfffff7f85334  // b.any
   0x0000fffff7f852d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f852d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f852dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f852e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f852e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f852e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f852ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f852f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f852f4:	54000209	b.ls	0xfffff7f85334  // b.plast
   0x0000fffff7f852f8:	36d8008d	tbz	w13, #27, 0xfffff7f85308
   0x0000fffff7f852fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85300:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85304:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85308:	36d80091	tbz	w17, #27, 0xfffff7f85318
   0x0000fffff7f8530c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85310:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85314:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85318:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f8531c:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f85320:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85324:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85328:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f8532c:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f85330:	1400000e	b	0xfffff7f85368
   0x0000fffff7f85334:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f85338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8533c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85340:	aa1503e2	mov	x2, x21
   0x0000fffff7f85344:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f85348:	aa1403e4	mov	x4, x20
   0x0000fffff7f8534c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85350:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f85354:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8535c:	d63f0200	blr	x16
   0x0000fffff7f85360:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85364:	54004080	b.eq	0xfffff7f85b74  // b.none
   0x0000fffff7f85368:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f8536c:	37d806a9	tbnz	w9, #27, 0xfffff7f85440
   0x0000fffff7f85370:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85374:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85378:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8537c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85380:	540001c1	b.ne	0xfffff7f853b8  // b.any
   0x0000fffff7f85384:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85388:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8538c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85390:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85394:	54000121	b.ne	0xfffff7f853b8  // b.any
   0x0000fffff7f85398:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f8539c:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f853a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f853a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f853a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853ac:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f853b0:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f853b4:	14000030	b	0xfffff7f85474
   0x0000fffff7f853b8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f853bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f853c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853c8:	54000120	b.eq	0xfffff7f853ec  // b.none
   0x0000fffff7f853cc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f853d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f853d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853dc:	54000321	b.ne	0xfffff7f85440  // b.any
   0x0000fffff7f853e0:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f853e4:	9e620120	scvtf	d0, x9
   0x0000fffff7f853e8:	14000002	b	0xfffff7f853f0
   0x0000fffff7f853ec:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f853f0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f853f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f853f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85400:	54000120	b.eq	0xfffff7f85424  // b.none
   0x0000fffff7f85404:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85408:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8540c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85410:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85414:	54000161	b.ne	0xfffff7f85440  // b.any
   0x0000fffff7f85418:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f8541c:	9e620121	scvtf	d1, x9
   0x0000fffff7f85420:	14000002	b	0xfffff7f85428
   0x0000fffff7f85424:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f85428:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8542c:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f85430:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85434:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85438:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f8543c:	17ffffde	b	0xfffff7f853b4
   0x0000fffff7f85440:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85448:	aa1303e1	mov	x1, x19
   0x0000fffff7f8544c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85450:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f85454:	aa1403e4	mov	x4, x20
   0x0000fffff7f85458:	aa1603e5	mov	x5, x22
   0x0000fffff7f8545c:	d2949490	mov	x16, #0xa4a4                	// #42148
   0x0000fffff7f85460:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85468:	d63f0200	blr	x16
   0x0000fffff7f8546c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85470:	54003980	b.eq	0xfffff7f85ba0  // b.none
   0x0000fffff7f85474:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85478:	37d806a9	tbnz	w9, #27, 0xfffff7f8554c
   0x0000fffff7f8547c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85480:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85484:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85488:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8548c:	540001c1	b.ne	0xfffff7f854c4  // b.any
   0x0000fffff7f85490:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85494:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85498:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8549c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854a0:	54000121	b.ne	0xfffff7f854c4  // b.any
   0x0000fffff7f854a4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f854a8:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7f854ac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f854b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f854b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854b8:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f854bc:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f854c0:	14000030	b	0xfffff7f85580
   0x0000fffff7f854c4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f854c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f854cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854d4:	54000120	b.eq	0xfffff7f854f8  // b.none
   0x0000fffff7f854d8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f854dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f854e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f854e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f854e8:	54000321	b.ne	0xfffff7f8554c  // b.any
   0x0000fffff7f854ec:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f854f0:	9e620120	scvtf	d0, x9
   0x0000fffff7f854f4:	14000002	b	0xfffff7f854fc
   0x0000fffff7f854f8:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f854fc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85500:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85508:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8550c:	54000120	b.eq	0xfffff7f85530  // b.none
   0x0000fffff7f85510:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8551c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85520:	54000161	b.ne	0xfffff7f8554c  // b.any
   0x0000fffff7f85524:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85528:	9e620121	scvtf	d1, x9
   0x0000fffff7f8552c:	14000002	b	0xfffff7f85534
   0x0000fffff7f85530:	fd404661	ldr	d1, [x19, #136]
   0x0000fffff7f85534:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85538:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f8553c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85540:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85544:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85548:	17ffffde	b	0xfffff7f854c0
   0x0000fffff7f8554c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85554:	aa1303e1	mov	x1, x19
   0x0000fffff7f85558:	aa1503e2	mov	x2, x21
   0x0000fffff7f8555c:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f85560:	aa1403e4	mov	x4, x20
   0x0000fffff7f85564:	aa1603e5	mov	x5, x22
   0x0000fffff7f85568:	d2949490	mov	x16, #0xa4a4                	// #42148
   0x0000fffff7f8556c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85574:	d63f0200	blr	x16
   0x0000fffff7f85578:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8557c:	54003280	b.eq	0xfffff7f85bcc  // b.none
   0x0000fffff7f85580:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85584:	37d80269	tbnz	w9, #27, 0xfffff7f855d0
   0x0000fffff7f85588:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8558c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85594:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85598:	540001c1	b.ne	0xfffff7f855d0  // b.any
   0x0000fffff7f8559c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f855a0:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f855a4:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f855a8:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f855ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855b4:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f855b8:	aa0b03e9	mov	x9, x11
   0x0000fffff7f855bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855c4:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f855c8:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f855cc:	1400000e	b	0xfffff7f85604
   0x0000fffff7f855d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f855d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f855dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f855e0:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f855e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f855e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f855ec:	d292ba10	mov	x16, #0x95d0                	// #38352
   0x0000fffff7f855f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f855f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f855f8:	d63f0200	blr	x16
   0x0000fffff7f855fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85600:	54002fc0	b.eq	0xfffff7f85bf8  // b.none
   0x0000fffff7f85604:	17fffabf	b	0xfffff7f84100
   0x0000fffff7f85608:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8560c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85610:	aa1303e1	mov	x1, x19
   0x0000fffff7f85614:	aa1503e2	mov	x2, x21
   0x0000fffff7f85618:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f8561c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85620:	aa1603e5	mov	x5, x22
   0x0000fffff7f85624:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f85628:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8562c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85630:	d63f0200	blr	x16
   0x0000fffff7f85634:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85638:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8563c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85640:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85644:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85648:	d65f03c0	ret
   0x0000fffff7f8564c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85650:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85654:	b9000289	str	w9, [x20]
   0x0000fffff7f85658:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8565c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85660:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85664:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85668:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8566c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85670:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85674:	d65f03c0	ret
   0x0000fffff7f85678:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8567c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85680:	b9000289	str	w9, [x20]
   0x0000fffff7f85684:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85688:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8568c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85690:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85694:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85698:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8569c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f856a0:	d65f03c0	ret
   0x0000fffff7f856a4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f856a8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f856ac:	b9000289	str	w9, [x20]
   0x0000fffff7f856b0:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f856b4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f856b8:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f856bc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f856c0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f856c4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f856c8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f856cc:	d65f03c0	ret
   0x0000fffff7f856d0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f856d4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f856d8:	b9000289	str	w9, [x20]
   0x0000fffff7f856dc:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f856e0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f856e4:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f856e8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f856ec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f856f0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f856f4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f856f8:	d65f03c0	ret
   0x0000fffff7f856fc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85700:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85704:	b9000289	str	w9, [x20]
   0x0000fffff7f85708:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f8570c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85710:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85714:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85718:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8571c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85720:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85724:	d65f03c0	ret
   0x0000fffff7f85728:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8572c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85730:	b9000289	str	w9, [x20]
   0x0000fffff7f85734:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85738:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8573c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85740:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85744:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85748:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8574c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85750:	d65f03c0	ret
   0x0000fffff7f85754:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85758:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8575c:	b9000289	str	w9, [x20]
   0x0000fffff7f85760:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85764:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85768:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f8576c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85770:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85774:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85778:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8577c:	d65f03c0	ret
   0x0000fffff7f85780:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85784:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85788:	b9000289	str	w9, [x20]
   0x0000fffff7f8578c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85790:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85794:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85798:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8579c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f857a0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f857a4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f857a8:	d65f03c0	ret
   0x0000fffff7f857ac:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f857b0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f857b4:	b9000289	str	w9, [x20]
   0x0000fffff7f857b8:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f857bc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f857c0:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f857c4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f857c8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f857cc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f857d0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f857d4:	d65f03c0	ret
   0x0000fffff7f857d8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f857dc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f857e0:	b9000289	str	w9, [x20]
   0x0000fffff7f857e4:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f857e8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f857ec:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f857f0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f857f4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f857f8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f857fc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85800:	d65f03c0	ret
   0x0000fffff7f85804:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85808:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8580c:	b9000289	str	w9, [x20]
   0x0000fffff7f85810:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85814:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85818:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f8581c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85820:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85824:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85828:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8582c:	d65f03c0	ret
   0x0000fffff7f85830:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85834:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85838:	b9000289	str	w9, [x20]
   0x0000fffff7f8583c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85840:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85844:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85848:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8584c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85850:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85854:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85858:	d65f03c0	ret
   0x0000fffff7f8585c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85860:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85864:	b9000289	str	w9, [x20]
   0x0000fffff7f85868:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f8586c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85870:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85874:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85878:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8587c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85880:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85884:	d65f03c0	ret
   0x0000fffff7f85888:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8588c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85890:	b9000289	str	w9, [x20]
   0x0000fffff7f85894:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85898:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8589c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f858a0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f858a4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f858a8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f858ac:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f858b0:	d65f03c0	ret
   0x0000fffff7f858b4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f858b8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f858bc:	b9000289	str	w9, [x20]
   0x0000fffff7f858c0:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f858c4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f858c8:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f858cc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f858d0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f858d4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f858d8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f858dc:	d65f03c0	ret
   0x0000fffff7f858e0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f858e4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f858e8:	b9000289	str	w9, [x20]
   0x0000fffff7f858ec:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f858f0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f858f4:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f858f8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f858fc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85900:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85904:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85908:	d65f03c0	ret
   0x0000fffff7f8590c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85910:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85914:	b9000289	str	w9, [x20]
   0x0000fffff7f85918:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f8591c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85920:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85924:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85928:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8592c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85930:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85934:	d65f03c0	ret
   0x0000fffff7f85938:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8593c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85940:	b9000289	str	w9, [x20]
   0x0000fffff7f85944:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f85948:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8594c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85950:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85954:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85958:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f8595c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85960:	d65f03c0	ret
   0x0000fffff7f85964:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85968:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8596c:	b9000289	str	w9, [x20]
   0x0000fffff7f85970:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f85974:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85978:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f8597c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85980:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85984:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85988:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8598c:	d65f03c0	ret
   0x0000fffff7f85990:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85994:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85998:	b9000289	str	w9, [x20]
   0x0000fffff7f8599c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f859a0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f859a4:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f859a8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f859ac:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f859b0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f859b4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f859b8:	d65f03c0	ret
   0x0000fffff7f859bc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f859c0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f859c4:	b9000289	str	w9, [x20]
   0x0000fffff7f859c8:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f859cc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f859d0:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f859d4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f859d8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f859dc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f859e0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f859e4:	d65f03c0	ret
   0x0000fffff7f859e8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f859ec:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f859f0:	b9000289	str	w9, [x20]
   0x0000fffff7f859f4:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f859f8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f859fc:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85a00:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a04:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a08:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a0c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a10:	d65f03c0	ret
   0x0000fffff7f85a14:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a18:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a1c:	b9000289	str	w9, [x20]
   0x0000fffff7f85a20:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f85a24:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a28:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85a2c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a30:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a34:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a38:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a3c:	d65f03c0	ret
   0x0000fffff7f85a40:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a44:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a48:	b9000289	str	w9, [x20]
   0x0000fffff7f85a4c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f85a50:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a54:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85a58:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a5c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a60:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a64:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a68:	d65f03c0	ret
   0x0000fffff7f85a6c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a70:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85a74:	b9000289	str	w9, [x20]
   0x0000fffff7f85a78:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f85a7c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85a80:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85a84:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85a88:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85a8c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85a90:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85a94:	d65f03c0	ret
   0x0000fffff7f85a98:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85a9c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85aa0:	b9000289	str	w9, [x20]
   0x0000fffff7f85aa4:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f85aa8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85aac:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85ab0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85ab4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ab8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85abc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ac0:	d65f03c0	ret
   0x0000fffff7f85ac4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85ac8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85acc:	b9000289	str	w9, [x20]
   0x0000fffff7f85ad0:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f85ad4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ad8:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85adc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85ae0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ae4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ae8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85aec:	d65f03c0	ret
   0x0000fffff7f85af0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85af4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85af8:	b9000289	str	w9, [x20]
   0x0000fffff7f85afc:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f85b00:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85b04:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85b08:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b0c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b10:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85b14:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85b18:	d65f03c0	ret
   0x0000fffff7f85b1c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85b20:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85b24:	b9000289	str	w9, [x20]
   0x0000fffff7f85b28:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f85b2c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85b30:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85b34:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b38:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b3c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85b40:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85b44:	d65f03c0	ret
   0x0000fffff7f85b48:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85b4c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85b50:	b9000289	str	w9, [x20]
   0x0000fffff7f85b54:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f85b58:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85b5c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85b60:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b64:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b68:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85b6c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85b70:	d65f03c0	ret
   0x0000fffff7f85b74:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85b78:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85b7c:	b9000289	str	w9, [x20]
   0x0000fffff7f85b80:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f85b84:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85b88:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85b8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85b98:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85b9c:	d65f03c0	ret
   0x0000fffff7f85ba0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85ba4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85ba8:	b9000289	str	w9, [x20]
   0x0000fffff7f85bac:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f85bb0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85bb4:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85bb8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85bbc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85bc0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85bc4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85bc8:	d65f03c0	ret
   0x0000fffff7f85bcc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85bd0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85bd4:	b9000289	str	w9, [x20]
   0x0000fffff7f85bd8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f85bdc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85be0:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85be4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85be8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85bec:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85bf0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85bf4:	d65f03c0	ret
   0x0000fffff7f85bf8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f85bfc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f85c00:	b9000289	str	w9, [x20]
   0x0000fffff7f85c04:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f85c08:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85c0c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85c10:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85c14:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85c18:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85c1c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85c20:	d65f03c0	ret
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
