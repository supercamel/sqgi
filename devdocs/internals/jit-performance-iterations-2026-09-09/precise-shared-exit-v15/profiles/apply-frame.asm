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
   0x0000fffff7f8407c:	54000801	b.ne	0xfffff7f8417c  // b.any
   0x0000fffff7f84080:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f84084:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f84088:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8408c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84090:	54000762	b.cs	0xfffff7f8417c  // b.hs, b.nlast
   0x0000fffff7f84094:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84098:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8409c:	14000014	b	0xfffff7f840ec
   0x0000fffff7f840a0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f840a4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f840a8:	540006a0	b.eq	0xfffff7f8417c  // b.none
   0x0000fffff7f840ac:	b9400269	ldr	w9, [x19]
   0x0000fffff7f840b0:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f840b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f840b8:	54000621	b.ne	0xfffff7f8417c  // b.any
   0x0000fffff7f840bc:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f840c0:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f840c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f840c8:	540005a1	b.ne	0xfffff7f8417c  // b.any
   0x0000fffff7f840cc:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f840d0:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f840d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f840d8:	54000521	b.ne	0xfffff7f8417c  // b.any
   0x0000fffff7f840dc:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f840e0:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f840e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f840e8:	540004a1	b.ne	0xfffff7f8417c  // b.any
   0x0000fffff7f840ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7f840f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f840f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f840f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f840fc:	54000400	b.eq	0xfffff7f8417c  // b.none
   0x0000fffff7f84100:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84104:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84108:	36d801d1	tbz	w17, #27, 0xfffff7f84140
   0x0000fffff7f8410c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84110:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84114:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84118:	54000321	b.ne	0xfffff7f8417c  // b.any
   0x0000fffff7f8411c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84120:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84124:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84128:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8412c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84130:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84134:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84138:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8413c:	54000209	b.ls	0xfffff7f8417c  // b.plast
   0x0000fffff7f84140:	36d8008d	tbz	w13, #27, 0xfffff7f84150
   0x0000fffff7f84144:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84148:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8414c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84150:	36d80091	tbz	w17, #27, 0xfffff7f84160
   0x0000fffff7f84154:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84158:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8415c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84160:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84164:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84168:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8416c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84170:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84174:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84178:	1400000e	b	0xfffff7f841b0
   0x0000fffff7f8417c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84180:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84184:	aa1303e1	mov	x1, x19
   0x0000fffff7f84188:	aa1503e2	mov	x2, x21
   0x0000fffff7f8418c:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f84190:	aa1403e4	mov	x4, x20
   0x0000fffff7f84194:	aa1603e5	mov	x5, x22
   0x0000fffff7f84198:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f8419c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f841a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f841a4:	d63f0200	blr	x16
   0x0000fffff7f841a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f841ac:	540061c0	b.eq	0xfffff7f84de4  // b.none
   0x0000fffff7f841b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f841b4:	37d806a9	tbnz	w9, #27, 0xfffff7f84288
   0x0000fffff7f841b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f841bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841c8:	540001c1	b.ne	0xfffff7f84200  // b.any
   0x0000fffff7f841cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f841d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841dc:	54000121	b.ne	0xfffff7f84200  // b.any
   0x0000fffff7f841e0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f841e4:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f841e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f841ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841f4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f841f8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f841fc:	14000030	b	0xfffff7f842bc
   0x0000fffff7f84200:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8420c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84210:	54000120	b.eq	0xfffff7f84234  // b.none
   0x0000fffff7f84214:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8421c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84220:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84224:	54000321	b.ne	0xfffff7f84288  // b.any
   0x0000fffff7f84228:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8422c:	9e620120	scvtf	d0, x9
   0x0000fffff7f84230:	14000002	b	0xfffff7f84238
   0x0000fffff7f84234:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f84238:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f8423c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84244:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84248:	54000120	b.eq	0xfffff7f8426c  // b.none
   0x0000fffff7f8424c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f84250:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84254:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84258:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8425c:	54000161	b.ne	0xfffff7f84288  // b.any
   0x0000fffff7f84260:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f84264:	9e620121	scvtf	d1, x9
   0x0000fffff7f84268:	14000002	b	0xfffff7f84270
   0x0000fffff7f8426c:	fd401661	ldr	d1, [x19, #40]
   0x0000fffff7f84270:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84274:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f84278:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8427c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84280:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84284:	17ffffde	b	0xfffff7f841fc
   0x0000fffff7f84288:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8428c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84290:	aa1303e1	mov	x1, x19
   0x0000fffff7f84294:	aa1503e2	mov	x2, x21
   0x0000fffff7f84298:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f8429c:	aa1403e4	mov	x4, x20
   0x0000fffff7f842a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f842a4:	d295e690	mov	x16, #0xaf34                	// #44852
   0x0000fffff7f842a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f842ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842b0:	d63f0200	blr	x16
   0x0000fffff7f842b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842b8:	540059a0	b.eq	0xfffff7f84dec  // b.none
   0x0000fffff7f842bc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f842c0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f842c4:	d29ffe2c	mov	x12, #0xfff1                	// #65521
   0x0000fffff7f842c8:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f842cc:	36d80211	tbz	w17, #27, 0xfffff7f8430c
   0x0000fffff7f842d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f842d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f842d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f842dc:	540001e1	b.ne	0xfffff7f84318  // b.any
   0x0000fffff7f842e0:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f842e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f842e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f842ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f842f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f842f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f842f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f842fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84300:	540000c9	b.ls	0xfffff7f84318  // b.plast
   0x0000fffff7f84304:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84308:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8430c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f84310:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f84314:	1400000e	b	0xfffff7f8434c
   0x0000fffff7f84318:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8431c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84320:	aa1303e1	mov	x1, x19
   0x0000fffff7f84324:	aa1503e2	mov	x2, x21
   0x0000fffff7f84328:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f8432c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84330:	aa1603e5	mov	x5, x22
   0x0000fffff7f84334:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84338:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8433c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84340:	d63f0200	blr	x16
   0x0000fffff7f84344:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84348:	54005560	b.eq	0xfffff7f84df4  // b.none
   0x0000fffff7f8434c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84350:	37d80389	tbnz	w9, #27, 0xfffff7f843c0
   0x0000fffff7f84354:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84358:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8435c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84360:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84364:	540002e1	b.ne	0xfffff7f843c0  // b.any
   0x0000fffff7f84368:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8436c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84374:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84378:	54000241	b.ne	0xfffff7f843c0  // b.any
   0x0000fffff7f8437c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84380:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f84384:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84388:	540001c0	b.eq	0xfffff7f843c0  // b.none
   0x0000fffff7f8438c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84390:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84394:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84398:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f8439c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f843a0:	54000100	b.eq	0xfffff7f843c0  // b.none
   0x0000fffff7f843a4:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f843a8:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f843ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f843b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f843b4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f843b8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f843bc:	1400000e	b	0xfffff7f843f4
   0x0000fffff7f843c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f843c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f843c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f843cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f843d0:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f843d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f843d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f843dc:	d294b810	mov	x16, #0xa5c0                	// #42432
   0x0000fffff7f843e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f843e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843e8:	d63f0200	blr	x16
   0x0000fffff7f843ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843f0:	54005060	b.eq	0xfffff7f84dfc  // b.none
   0x0000fffff7f843f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f843f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f843fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f84400:	aa1503e2	mov	x2, x21
   0x0000fffff7f84404:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f84408:	aa1403e4	mov	x4, x20
   0x0000fffff7f8440c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84410:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f84414:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84418:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8441c:	d63f0200	blr	x16
   0x0000fffff7f84420:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84424:	54004f00	b.eq	0xfffff7f84e04  // b.none
   0x0000fffff7f84428:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8442c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84430:	540005a0	b.eq	0xfffff7f844e4  // b.none
   0x0000fffff7f84434:	b9400269	ldr	w9, [x19]
   0x0000fffff7f84438:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f8443c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84440:	54000521	b.ne	0xfffff7f844e4  // b.any
   0x0000fffff7f84444:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f84448:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f8444c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84450:	540004a1	b.ne	0xfffff7f844e4  // b.any
   0x0000fffff7f84454:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84458:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8445c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84460:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84464:	54000400	b.eq	0xfffff7f844e4  // b.none
   0x0000fffff7f84468:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8446c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84470:	36d801d1	tbz	w17, #27, 0xfffff7f844a8
   0x0000fffff7f84474:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84478:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8447c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84480:	54000321	b.ne	0xfffff7f844e4  // b.any
   0x0000fffff7f84484:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84488:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8448c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84490:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84494:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84498:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8449c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f844a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f844a4:	54000209	b.ls	0xfffff7f844e4  // b.plast
   0x0000fffff7f844a8:	36d8008d	tbz	w13, #27, 0xfffff7f844b8
   0x0000fffff7f844ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f844b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f844b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f844b8:	36d80091	tbz	w17, #27, 0xfffff7f844c8
   0x0000fffff7f844bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f844c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f844c8:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f844cc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f844d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f844d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f844d8:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f844dc:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f844e0:	1400000e	b	0xfffff7f84518
   0x0000fffff7f844e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f844e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f844ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f844f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f844f4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f844f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f844fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f84500:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f84504:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84508:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8450c:	d63f0200	blr	x16
   0x0000fffff7f84510:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84514:	540047c0	b.eq	0xfffff7f84e0c  // b.none
   0x0000fffff7f84518:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8451c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84520:	540005a0	b.eq	0xfffff7f845d4  // b.none
   0x0000fffff7f84524:	b9400269	ldr	w9, [x19]
   0x0000fffff7f84528:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f8452c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84530:	54000521	b.ne	0xfffff7f845d4  // b.any
   0x0000fffff7f84534:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f84538:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f8453c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84540:	540004a1	b.ne	0xfffff7f845d4  // b.any
   0x0000fffff7f84544:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84548:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8454c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84550:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84554:	54000400	b.eq	0xfffff7f845d4  // b.none
   0x0000fffff7f84558:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8455c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84560:	36d801d1	tbz	w17, #27, 0xfffff7f84598
   0x0000fffff7f84564:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84568:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8456c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84570:	54000321	b.ne	0xfffff7f845d4  // b.any
   0x0000fffff7f84574:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84578:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8457c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84580:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84584:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84588:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8458c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84590:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84594:	54000209	b.ls	0xfffff7f845d4  // b.plast
   0x0000fffff7f84598:	36d8008d	tbz	w13, #27, 0xfffff7f845a8
   0x0000fffff7f8459c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f845a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f845a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f845a8:	36d80091	tbz	w17, #27, 0xfffff7f845b8
   0x0000fffff7f845ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f845b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f845b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f845b8:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f845bc:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f845c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f845c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f845c8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f845cc:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f845d0:	1400000e	b	0xfffff7f84608
   0x0000fffff7f845d4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f845d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f845dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f845e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f845e4:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f845e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f845ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f845f0:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f845f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f845f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f845fc:	d63f0200	blr	x16
   0x0000fffff7f84600:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84604:	54004080	b.eq	0xfffff7f84e14  // b.none
   0x0000fffff7f84608:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8460c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84610:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84614:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84618:	540001c1	b.ne	0xfffff7f84650  // b.any
   0x0000fffff7f8461c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84628:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8462c:	54000801	b.ne	0xfffff7f8472c  // b.any
   0x0000fffff7f84630:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f84634:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f84638:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8463c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84640:	54000762	b.cs	0xfffff7f8472c  // b.hs, b.nlast
   0x0000fffff7f84644:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84648:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8464c:	14000014	b	0xfffff7f8469c
   0x0000fffff7f84650:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f84654:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84658:	540006a0	b.eq	0xfffff7f8472c  // b.none
   0x0000fffff7f8465c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84660:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f84664:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84668:	54000621	b.ne	0xfffff7f8472c  // b.any
   0x0000fffff7f8466c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f84670:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f84674:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84678:	540005a1	b.ne	0xfffff7f8472c  // b.any
   0x0000fffff7f8467c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84680:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f84684:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84688:	54000521	b.ne	0xfffff7f8472c  // b.any
   0x0000fffff7f8468c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f84690:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f84694:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84698:	540004a1	b.ne	0xfffff7f8472c  // b.any
   0x0000fffff7f8469c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f846a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f846a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f846a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f846ac:	54000400	b.eq	0xfffff7f8472c  // b.none
   0x0000fffff7f846b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f846b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f846b8:	36d801d1	tbz	w17, #27, 0xfffff7f846f0
   0x0000fffff7f846bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f846c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f846c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f846c8:	54000321	b.ne	0xfffff7f8472c  // b.any
   0x0000fffff7f846cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f846d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f846d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f846d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f846dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f846e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f846e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f846e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f846ec:	54000209	b.ls	0xfffff7f8472c  // b.plast
   0x0000fffff7f846f0:	36d8008d	tbz	w13, #27, 0xfffff7f84700
   0x0000fffff7f846f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f846f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f846fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84700:	36d80091	tbz	w17, #27, 0xfffff7f84710
   0x0000fffff7f84704:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84708:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8470c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84710:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f84714:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f84718:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8471c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84720:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f84724:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f84728:	1400000e	b	0xfffff7f84760
   0x0000fffff7f8472c:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f84730:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84734:	aa1303e1	mov	x1, x19
   0x0000fffff7f84738:	aa1503e2	mov	x2, x21
   0x0000fffff7f8473c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f84740:	aa1403e4	mov	x4, x20
   0x0000fffff7f84744:	aa1603e5	mov	x5, x22
   0x0000fffff7f84748:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f8474c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84750:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84754:	d63f0200	blr	x16
   0x0000fffff7f84758:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8475c:	54003600	b.eq	0xfffff7f84e1c  // b.none
   0x0000fffff7f84760:	b9400269	ldr	w9, [x19]
   0x0000fffff7f84764:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84768:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f8476c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84770:	540001c1	b.ne	0xfffff7f847a8  // b.any
   0x0000fffff7f84774:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8477c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84784:	54000801	b.ne	0xfffff7f84884  // b.any
   0x0000fffff7f84788:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f8478c:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f84790:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84794:	eb09015f	cmp	x10, x9
   0x0000fffff7f84798:	54000762	b.cs	0xfffff7f84884  // b.hs, b.nlast
   0x0000fffff7f8479c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f847a0:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f847a4:	14000014	b	0xfffff7f847f4
   0x0000fffff7f847a8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f847ac:	f100017f	cmp	x11, #0x0
   0x0000fffff7f847b0:	540006a0	b.eq	0xfffff7f84884  // b.none
   0x0000fffff7f847b4:	b9400269	ldr	w9, [x19]
   0x0000fffff7f847b8:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f847bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847c0:	54000621	b.ne	0xfffff7f84884  // b.any
   0x0000fffff7f847c4:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f847c8:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f847cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847d0:	540005a1	b.ne	0xfffff7f84884  // b.any
   0x0000fffff7f847d4:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f847d8:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f847dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847e0:	54000521	b.ne	0xfffff7f84884  // b.any
   0x0000fffff7f847e4:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f847e8:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f847ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847f0:	540004a1	b.ne	0xfffff7f84884  // b.any
   0x0000fffff7f847f4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f847f8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f847fc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84800:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84804:	54000400	b.eq	0xfffff7f84884  // b.none
   0x0000fffff7f84808:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8480c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84810:	36d801d1	tbz	w17, #27, 0xfffff7f84848
   0x0000fffff7f84814:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84818:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8481c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84820:	54000321	b.ne	0xfffff7f84884  // b.any
   0x0000fffff7f84824:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84828:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8482c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84830:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84834:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84838:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8483c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84840:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84844:	54000209	b.ls	0xfffff7f84884  // b.plast
   0x0000fffff7f84848:	36d8008d	tbz	w13, #27, 0xfffff7f84858
   0x0000fffff7f8484c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84850:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84854:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84858:	36d80091	tbz	w17, #27, 0xfffff7f84868
   0x0000fffff7f8485c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84860:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84864:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84868:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8486c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84870:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84874:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84878:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8487c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84880:	1400000e	b	0xfffff7f848b8
   0x0000fffff7f84884:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84888:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8488c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84890:	aa1503e2	mov	x2, x21
   0x0000fffff7f84894:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f84898:	aa1403e4	mov	x4, x20
   0x0000fffff7f8489c:	aa1603e5	mov	x5, x22
   0x0000fffff7f848a0:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f848a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f848a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f848ac:	d63f0200	blr	x16
   0x0000fffff7f848b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f848b4:	54002b80	b.eq	0xfffff7f84e24  // b.none
   0x0000fffff7f848b8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f848bc:	37d806a9	tbnz	w9, #27, 0xfffff7f84990
   0x0000fffff7f848c0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f848c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848d0:	540001c1	b.ne	0xfffff7f84908  // b.any
   0x0000fffff7f848d4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f848d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848e4:	54000121	b.ne	0xfffff7f84908  // b.any
   0x0000fffff7f848e8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f848ec:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f848f0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f848f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848fc:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f84900:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84904:	14000030	b	0xfffff7f849c4
   0x0000fffff7f84908:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8490c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84914:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84918:	54000120	b.eq	0xfffff7f8493c  // b.none
   0x0000fffff7f8491c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84920:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84928:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8492c:	54000321	b.ne	0xfffff7f84990  // b.any
   0x0000fffff7f84930:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f84934:	9e620120	scvtf	d0, x9
   0x0000fffff7f84938:	14000002	b	0xfffff7f84940
   0x0000fffff7f8493c:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f84940:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84944:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8494c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84950:	54000120	b.eq	0xfffff7f84974  // b.none
   0x0000fffff7f84954:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8495c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84960:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84964:	54000161	b.ne	0xfffff7f84990  // b.any
   0x0000fffff7f84968:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8496c:	9e620121	scvtf	d1, x9
   0x0000fffff7f84970:	14000002	b	0xfffff7f84978
   0x0000fffff7f84974:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84978:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8497c:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f84980:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84988:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f8498c:	17ffffde	b	0xfffff7f84904
   0x0000fffff7f84990:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84994:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84998:	aa1303e1	mov	x1, x19
   0x0000fffff7f8499c:	aa1503e2	mov	x2, x21
   0x0000fffff7f849a0:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f849a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f849a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f849ac:	d295e690	mov	x16, #0xaf34                	// #44852
   0x0000fffff7f849b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f849b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849b8:	d63f0200	blr	x16
   0x0000fffff7f849bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f849c0:	54002360	b.eq	0xfffff7f84e2c  // b.none
   0x0000fffff7f849c4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f849c8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f849cc:	d2807cac	mov	x12, #0x3e5                 	// #997
   0x0000fffff7f849d0:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f849d4:	36d80211	tbz	w17, #27, 0xfffff7f84a14
   0x0000fffff7f849d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f849dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f849e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f849e4:	540001e1	b.ne	0xfffff7f84a20  // b.any
   0x0000fffff7f849e8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f849ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f849f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f849f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f849f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f849fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84a00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84a04:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84a08:	540000c9	b.ls	0xfffff7f84a20  // b.plast
   0x0000fffff7f84a0c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84a10:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84a14:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84a18:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84a1c:	1400000e	b	0xfffff7f84a54
   0x0000fffff7f84a20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84a24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84a28:	aa1303e1	mov	x1, x19
   0x0000fffff7f84a2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84a30:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f84a34:	aa1403e4	mov	x4, x20
   0x0000fffff7f84a38:	aa1603e5	mov	x5, x22
   0x0000fffff7f84a3c:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f84a40:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84a44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84a48:	d63f0200	blr	x16
   0x0000fffff7f84a4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84a50:	54001f20	b.eq	0xfffff7f84e34  // b.none
   0x0000fffff7f84a54:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84a58:	37d80389	tbnz	w9, #27, 0xfffff7f84ac8
   0x0000fffff7f84a5c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84a60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a68:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a6c:	540002e1	b.ne	0xfffff7f84ac8  // b.any
   0x0000fffff7f84a70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a74:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a80:	54000241	b.ne	0xfffff7f84ac8  // b.any
   0x0000fffff7f84a84:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f84a88:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84a8c:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84a90:	540001c0	b.eq	0xfffff7f84ac8  // b.none
   0x0000fffff7f84a94:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84a98:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84a9c:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84aa0:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84aa4:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84aa8:	54000100	b.eq	0xfffff7f84ac8  // b.none
   0x0000fffff7f84aac:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84ab0:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84ab4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84ab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84abc:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f84ac0:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84ac4:	1400000e	b	0xfffff7f84afc
   0x0000fffff7f84ac8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84acc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84ad0:	aa1303e1	mov	x1, x19
   0x0000fffff7f84ad4:	aa1503e2	mov	x2, x21
   0x0000fffff7f84ad8:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f84adc:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ae0:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ae4:	d294b810	mov	x16, #0xa5c0                	// #42432
   0x0000fffff7f84ae8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84aec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84af0:	d63f0200	blr	x16
   0x0000fffff7f84af4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84af8:	54001a20	b.eq	0xfffff7f84e3c  // b.none
   0x0000fffff7f84afc:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84b00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84b04:	aa1303e1	mov	x1, x19
   0x0000fffff7f84b08:	aa1503e2	mov	x2, x21
   0x0000fffff7f84b0c:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f84b10:	aa1403e4	mov	x4, x20
   0x0000fffff7f84b14:	aa1603e5	mov	x5, x22
   0x0000fffff7f84b18:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f84b1c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84b20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84b24:	d63f0200	blr	x16
   0x0000fffff7f84b28:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84b2c:	540018c0	b.eq	0xfffff7f84e44  // b.none
   0x0000fffff7f84b30:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84b34:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84b38:	540005a0	b.eq	0xfffff7f84bec  // b.none
   0x0000fffff7f84b3c:	b9400269	ldr	w9, [x19]
   0x0000fffff7f84b40:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f84b44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b48:	54000521	b.ne	0xfffff7f84bec  // b.any
   0x0000fffff7f84b4c:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f84b50:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f84b54:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b58:	540004a1	b.ne	0xfffff7f84bec  // b.any
   0x0000fffff7f84b5c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84b60:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84b64:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84b68:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84b6c:	54000400	b.eq	0xfffff7f84bec  // b.none
   0x0000fffff7f84b70:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84b74:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84b78:	36d801d1	tbz	w17, #27, 0xfffff7f84bb0
   0x0000fffff7f84b7c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84b80:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84b84:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84b88:	54000321	b.ne	0xfffff7f84bec  // b.any
   0x0000fffff7f84b8c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84b90:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84b94:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84b98:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84b9c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84ba0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84ba4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84ba8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84bac:	54000209	b.ls	0xfffff7f84bec  // b.plast
   0x0000fffff7f84bb0:	36d8008d	tbz	w13, #27, 0xfffff7f84bc0
   0x0000fffff7f84bb4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84bb8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84bbc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84bc0:	36d80091	tbz	w17, #27, 0xfffff7f84bd0
   0x0000fffff7f84bc4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84bc8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84bcc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84bd0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84bd4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84bd8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84bdc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84be0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84be4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84be8:	1400000e	b	0xfffff7f84c20
   0x0000fffff7f84bec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84bf0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84bf4:	aa1303e1	mov	x1, x19
   0x0000fffff7f84bf8:	aa1503e2	mov	x2, x21
   0x0000fffff7f84bfc:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f84c00:	aa1403e4	mov	x4, x20
   0x0000fffff7f84c04:	aa1603e5	mov	x5, x22
   0x0000fffff7f84c08:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f84c0c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84c10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84c14:	d63f0200	blr	x16
   0x0000fffff7f84c18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84c1c:	54001180	b.eq	0xfffff7f84e4c  // b.none
   0x0000fffff7f84c20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84c24:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84c28:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84c2c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c30:	540001c1	b.ne	0xfffff7f84c68  // b.any
   0x0000fffff7f84c34:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84c38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84c3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c40:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c44:	54000801	b.ne	0xfffff7f84d44  // b.any
   0x0000fffff7f84c48:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f84c4c:	f940266b	ldr	x11, [x19, #72]
   0x0000fffff7f84c50:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84c54:	eb09015f	cmp	x10, x9
   0x0000fffff7f84c58:	54000762	b.cs	0xfffff7f84d44  // b.hs, b.nlast
   0x0000fffff7f84c5c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84c60:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84c64:	14000014	b	0xfffff7f84cb4
   0x0000fffff7f84c68:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84c6c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84c70:	540006a0	b.eq	0xfffff7f84d44  // b.none
   0x0000fffff7f84c74:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84c78:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84c7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c80:	54000621	b.ne	0xfffff7f84d44  // b.any
   0x0000fffff7f84c84:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84c88:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c90:	540005a1	b.ne	0xfffff7f84d44  // b.any
   0x0000fffff7f84c94:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84c98:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f84c9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84ca0:	54000521	b.ne	0xfffff7f84d44  // b.any
   0x0000fffff7f84ca4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f84ca8:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f84cac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84cb0:	540004a1	b.ne	0xfffff7f84d44  // b.any
   0x0000fffff7f84cb4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84cb8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84cbc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84cc0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84cc4:	54000400	b.eq	0xfffff7f84d44  // b.none
   0x0000fffff7f84cc8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84ccc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84cd0:	36d801d1	tbz	w17, #27, 0xfffff7f84d08
   0x0000fffff7f84cd4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84cd8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84cdc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84ce0:	54000321	b.ne	0xfffff7f84d44  // b.any
   0x0000fffff7f84ce4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84ce8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84cec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84cf0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84cf4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84cf8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84cfc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84d00:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84d04:	54000209	b.ls	0xfffff7f84d44  // b.plast
   0x0000fffff7f84d08:	36d8008d	tbz	w13, #27, 0xfffff7f84d18
   0x0000fffff7f84d0c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84d10:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84d14:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84d18:	36d80091	tbz	w17, #27, 0xfffff7f84d28
   0x0000fffff7f84d1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d20:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84d24:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84d28:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84d2c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84d30:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84d34:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84d38:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84d3c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84d40:	1400000e	b	0xfffff7f84d78
   0x0000fffff7f84d44:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84d48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84d4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84d50:	aa1503e2	mov	x2, x21
   0x0000fffff7f84d54:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f84d58:	aa1403e4	mov	x4, x20
   0x0000fffff7f84d5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84d60:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84d64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84d68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84d6c:	d63f0200	blr	x16
   0x0000fffff7f84d70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84d74:	54000700	b.eq	0xfffff7f84e54  // b.none
   0x0000fffff7f84d78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84d7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84d80:	aa1303e1	mov	x1, x19
   0x0000fffff7f84d84:	aa1503e2	mov	x2, x21
   0x0000fffff7f84d88:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f84d8c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84d90:	aa1603e5	mov	x5, x22
   0x0000fffff7f84d94:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f84d98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84d9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84da0:	d63f0200	blr	x16
   0x0000fffff7f84da4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84da8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84dac:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84db0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84db4:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f84db8:	d65f03c0	ret
   0x0000fffff7f84dbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84dc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84dc4:	b900028a	str	w10, [x20]
   0x0000fffff7f84dc8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84dcc:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84dd0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84dd4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84dd8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84ddc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84de0:	d65f03c0	ret
   0x0000fffff7f84de4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84de8:	17fffff5	b	0xfffff7f84dbc
   0x0000fffff7f84dec:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f84df0:	17fffff3	b	0xfffff7f84dbc
   0x0000fffff7f84df4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f84df8:	17fffff1	b	0xfffff7f84dbc
   0x0000fffff7f84dfc:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f84e00:	17ffffef	b	0xfffff7f84dbc
   0x0000fffff7f84e04:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f84e08:	17ffffed	b	0xfffff7f84dbc
   0x0000fffff7f84e0c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f84e10:	17ffffeb	b	0xfffff7f84dbc
   0x0000fffff7f84e14:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f84e18:	17ffffe9	b	0xfffff7f84dbc
   0x0000fffff7f84e1c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f84e20:	17ffffe7	b	0xfffff7f84dbc
   0x0000fffff7f84e24:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f84e28:	17ffffe5	b	0xfffff7f84dbc
   0x0000fffff7f84e2c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f84e30:	17ffffe3	b	0xfffff7f84dbc
   0x0000fffff7f84e34:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f84e38:	17ffffe1	b	0xfffff7f84dbc
   0x0000fffff7f84e3c:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f84e40:	17ffffdf	b	0xfffff7f84dbc
   0x0000fffff7f84e44:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f84e48:	17ffffdd	b	0xfffff7f84dbc
   0x0000fffff7f84e4c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f84e50:	17ffffdb	b	0xfffff7f84dbc
   0x0000fffff7f84e54:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f84e58:	17ffffd9	b	0xfffff7f84dbc
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
