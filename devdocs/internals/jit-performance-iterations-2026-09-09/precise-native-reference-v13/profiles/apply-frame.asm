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
   0x0000fffff7f841ac:	54005cc0	b.eq	0xfffff7f84d44  // b.none
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
   0x0000fffff7f842a4:	d2949490	mov	x16, #0xa4a4                	// #42148
   0x0000fffff7f842a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f842ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842b0:	d63f0200	blr	x16
   0x0000fffff7f842b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842b8:	540055c0	b.eq	0xfffff7f84d70  // b.none
   0x0000fffff7f842bc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f842c0:	37d800e9	tbnz	w9, #27, 0xfffff7f842dc
   0x0000fffff7f842c4:	d29ffe29	mov	x9, #0xfff1                	// #65521
   0x0000fffff7f842c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f842cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f842d0:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f842d4:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f842d8:	1400000e	b	0xfffff7f84310
   0x0000fffff7f842dc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f842e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f842e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f842e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f842ec:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f842f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f842f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f842f8:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f842fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84304:	d63f0200	blr	x16
   0x0000fffff7f84308:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8430c:	54005480	b.eq	0xfffff7f84d9c  // b.none
   0x0000fffff7f84310:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84314:	37d80389	tbnz	w9, #27, 0xfffff7f84384
   0x0000fffff7f84318:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8431c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84324:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84328:	540002e1	b.ne	0xfffff7f84384  // b.any
   0x0000fffff7f8432c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84330:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84338:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8433c:	54000241	b.ne	0xfffff7f84384  // b.any
   0x0000fffff7f84340:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84344:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f84348:	f100015f	cmp	x10, #0x0
   0x0000fffff7f8434c:	540001c0	b.eq	0xfffff7f84384  // b.none
   0x0000fffff7f84350:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84354:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84358:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f8435c:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84360:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84364:	54000100	b.eq	0xfffff7f84384  // b.none
   0x0000fffff7f84368:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f8436c:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84370:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84374:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84378:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8437c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84380:	1400000e	b	0xfffff7f843b8
   0x0000fffff7f84384:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84388:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8438c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84390:	aa1503e2	mov	x2, x21
   0x0000fffff7f84394:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f84398:	aa1403e4	mov	x4, x20
   0x0000fffff7f8439c:	aa1603e5	mov	x5, x22
   0x0000fffff7f843a0:	d2936610	mov	x16, #0x9b30                	// #39728
   0x0000fffff7f843a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f843a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843ac:	d63f0200	blr	x16
   0x0000fffff7f843b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843b4:	540050a0	b.eq	0xfffff7f84dc8  // b.none
   0x0000fffff7f843b8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f843bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f843c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f843c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f843c8:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f843cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f843d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f843d4:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f843d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f843dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843e0:	d63f0200	blr	x16
   0x0000fffff7f843e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843e8:	54005060	b.eq	0xfffff7f84df4  // b.none
   0x0000fffff7f843ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f843f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f843f4:	540005a0	b.eq	0xfffff7f844a8  // b.none
   0x0000fffff7f843f8:	b9400269	ldr	w9, [x19]
   0x0000fffff7f843fc:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f84400:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84404:	54000521	b.ne	0xfffff7f844a8  // b.any
   0x0000fffff7f84408:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f8440c:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f84410:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84414:	540004a1	b.ne	0xfffff7f844a8  // b.any
   0x0000fffff7f84418:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8441c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84420:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84424:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84428:	54000400	b.eq	0xfffff7f844a8  // b.none
   0x0000fffff7f8442c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84430:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84434:	36d801d1	tbz	w17, #27, 0xfffff7f8446c
   0x0000fffff7f84438:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8443c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84440:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84444:	54000321	b.ne	0xfffff7f844a8  // b.any
   0x0000fffff7f84448:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8444c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84450:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84454:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84458:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8445c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84460:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84464:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84468:	54000209	b.ls	0xfffff7f844a8  // b.plast
   0x0000fffff7f8446c:	36d8008d	tbz	w13, #27, 0xfffff7f8447c
   0x0000fffff7f84470:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84474:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84478:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8447c:	36d80091	tbz	w17, #27, 0xfffff7f8448c
   0x0000fffff7f84480:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84484:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84488:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8448c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84490:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84494:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84498:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8449c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f844a0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f844a4:	1400000e	b	0xfffff7f844dc
   0x0000fffff7f844a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f844ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f844b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f844b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f844b8:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f844bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f844c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f844c4:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f844c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f844cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f844d0:	d63f0200	blr	x16
   0x0000fffff7f844d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f844d8:	54004a40	b.eq	0xfffff7f84e20  // b.none
   0x0000fffff7f844dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f844e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f844e4:	540005a0	b.eq	0xfffff7f84598  // b.none
   0x0000fffff7f844e8:	b9400269	ldr	w9, [x19]
   0x0000fffff7f844ec:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f844f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844f4:	54000521	b.ne	0xfffff7f84598  // b.any
   0x0000fffff7f844f8:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f844fc:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f84500:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84504:	540004a1	b.ne	0xfffff7f84598  // b.any
   0x0000fffff7f84508:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8450c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84510:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84514:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84518:	54000400	b.eq	0xfffff7f84598  // b.none
   0x0000fffff7f8451c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84520:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84524:	36d801d1	tbz	w17, #27, 0xfffff7f8455c
   0x0000fffff7f84528:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8452c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84530:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84534:	54000321	b.ne	0xfffff7f84598  // b.any
   0x0000fffff7f84538:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8453c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84540:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84544:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84548:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8454c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84550:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84554:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84558:	54000209	b.ls	0xfffff7f84598  // b.plast
   0x0000fffff7f8455c:	36d8008d	tbz	w13, #27, 0xfffff7f8456c
   0x0000fffff7f84560:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84564:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84568:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8456c:	36d80091	tbz	w17, #27, 0xfffff7f8457c
   0x0000fffff7f84570:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84574:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84578:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8457c:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f84580:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f84584:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84588:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8458c:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f84590:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f84594:	1400000e	b	0xfffff7f845cc
   0x0000fffff7f84598:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f8459c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f845a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f845a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f845a8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f845ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f845b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f845b4:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f845b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f845bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f845c0:	d63f0200	blr	x16
   0x0000fffff7f845c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f845c8:	54004420	b.eq	0xfffff7f84e4c  // b.none
   0x0000fffff7f845cc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f845d0:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f845d4:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f845d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845dc:	540001c1	b.ne	0xfffff7f84614  // b.any
   0x0000fffff7f845e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f845e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f845e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f845ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845f0:	54000801	b.ne	0xfffff7f846f0  // b.any
   0x0000fffff7f845f4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f845f8:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f845fc:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84600:	eb09015f	cmp	x10, x9
   0x0000fffff7f84604:	54000762	b.cs	0xfffff7f846f0  // b.hs, b.nlast
   0x0000fffff7f84608:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f8460c:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84610:	14000014	b	0xfffff7f84660
   0x0000fffff7f84614:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f84618:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8461c:	540006a0	b.eq	0xfffff7f846f0  // b.none
   0x0000fffff7f84620:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84624:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f84628:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8462c:	54000621	b.ne	0xfffff7f846f0  // b.any
   0x0000fffff7f84630:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f84634:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f84638:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8463c:	540005a1	b.ne	0xfffff7f846f0  // b.any
   0x0000fffff7f84640:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84644:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f84648:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8464c:	54000521	b.ne	0xfffff7f846f0  // b.any
   0x0000fffff7f84650:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f84654:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f84658:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8465c:	540004a1	b.ne	0xfffff7f846f0  // b.any
   0x0000fffff7f84660:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84664:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84668:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8466c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84670:	54000400	b.eq	0xfffff7f846f0  // b.none
   0x0000fffff7f84674:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84678:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8467c:	36d801d1	tbz	w17, #27, 0xfffff7f846b4
   0x0000fffff7f84680:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84684:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84688:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8468c:	54000321	b.ne	0xfffff7f846f0  // b.any
   0x0000fffff7f84690:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84694:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84698:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8469c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f846a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f846a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f846a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f846ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7f846b0:	54000209	b.ls	0xfffff7f846f0  // b.plast
   0x0000fffff7f846b4:	36d8008d	tbz	w13, #27, 0xfffff7f846c4
   0x0000fffff7f846b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f846bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f846c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f846c4:	36d80091	tbz	w17, #27, 0xfffff7f846d4
   0x0000fffff7f846c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f846cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f846d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f846d4:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f846d8:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f846dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f846e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f846e4:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f846e8:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f846ec:	1400000e	b	0xfffff7f84724
   0x0000fffff7f846f0:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f846f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f846f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f846fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f84700:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f84704:	aa1403e4	mov	x4, x20
   0x0000fffff7f84708:	aa1603e5	mov	x5, x22
   0x0000fffff7f8470c:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84710:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84714:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84718:	d63f0200	blr	x16
   0x0000fffff7f8471c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84720:	54003ac0	b.eq	0xfffff7f84e78  // b.none
   0x0000fffff7f84724:	b9400269	ldr	w9, [x19]
   0x0000fffff7f84728:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8472c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84730:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84734:	540001c1	b.ne	0xfffff7f8476c  // b.any
   0x0000fffff7f84738:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8473c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84740:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84744:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84748:	54000801	b.ne	0xfffff7f84848  // b.any
   0x0000fffff7f8474c:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f84750:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f84754:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84758:	eb09015f	cmp	x10, x9
   0x0000fffff7f8475c:	54000762	b.cs	0xfffff7f84848  // b.hs, b.nlast
   0x0000fffff7f84760:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84764:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84768:	14000014	b	0xfffff7f847b8
   0x0000fffff7f8476c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84770:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84774:	540006a0	b.eq	0xfffff7f84848  // b.none
   0x0000fffff7f84778:	b9400269	ldr	w9, [x19]
   0x0000fffff7f8477c:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f84780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84784:	54000621	b.ne	0xfffff7f84848  // b.any
   0x0000fffff7f84788:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f8478c:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f84790:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84794:	540005a1	b.ne	0xfffff7f84848  // b.any
   0x0000fffff7f84798:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f8479c:	b94017ea	ldr	w10, [sp, #20]
   0x0000fffff7f847a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847a4:	54000521	b.ne	0xfffff7f84848  // b.any
   0x0000fffff7f847a8:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f847ac:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f847b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847b4:	540004a1	b.ne	0xfffff7f84848  // b.any
   0x0000fffff7f847b8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f847bc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f847c0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f847c4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f847c8:	54000400	b.eq	0xfffff7f84848  // b.none
   0x0000fffff7f847cc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f847d0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f847d4:	36d801d1	tbz	w17, #27, 0xfffff7f8480c
   0x0000fffff7f847d8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f847dc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f847e0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f847e4:	54000321	b.ne	0xfffff7f84848  // b.any
   0x0000fffff7f847e8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f847ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f847f0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f847f4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f847f8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f847fc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84800:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84804:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84808:	54000209	b.ls	0xfffff7f84848  // b.plast
   0x0000fffff7f8480c:	36d8008d	tbz	w13, #27, 0xfffff7f8481c
   0x0000fffff7f84810:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84814:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84818:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8481c:	36d80091	tbz	w17, #27, 0xfffff7f8482c
   0x0000fffff7f84820:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84824:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84828:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8482c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f84830:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84834:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84838:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8483c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84840:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84844:	1400000e	b	0xfffff7f8487c
   0x0000fffff7f84848:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8484c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84850:	aa1303e1	mov	x1, x19
   0x0000fffff7f84854:	aa1503e2	mov	x2, x21
   0x0000fffff7f84858:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f8485c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84860:	aa1603e5	mov	x5, x22
   0x0000fffff7f84864:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84868:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8486c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84870:	d63f0200	blr	x16
   0x0000fffff7f84874:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84878:	54003160	b.eq	0xfffff7f84ea4  // b.none
   0x0000fffff7f8487c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84880:	37d806a9	tbnz	w9, #27, 0xfffff7f84954
   0x0000fffff7f84884:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84888:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8488c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84890:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84894:	540001c1	b.ne	0xfffff7f848cc  // b.any
   0x0000fffff7f84898:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8489c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848a8:	54000121	b.ne	0xfffff7f848cc  // b.any
   0x0000fffff7f848ac:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f848b0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f848b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f848b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848c0:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f848c4:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f848c8:	14000030	b	0xfffff7f84988
   0x0000fffff7f848cc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f848d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f848d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848dc:	54000120	b.eq	0xfffff7f84900  // b.none
   0x0000fffff7f848e0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f848e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848f0:	54000321	b.ne	0xfffff7f84954  // b.any
   0x0000fffff7f848f4:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f848f8:	9e620120	scvtf	d0, x9
   0x0000fffff7f848fc:	14000002	b	0xfffff7f84904
   0x0000fffff7f84900:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f84904:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84908:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8490c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84910:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84914:	54000120	b.eq	0xfffff7f84938  // b.none
   0x0000fffff7f84918:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8491c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84924:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84928:	54000161	b.ne	0xfffff7f84954  // b.any
   0x0000fffff7f8492c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84930:	9e620121	scvtf	d1, x9
   0x0000fffff7f84934:	14000002	b	0xfffff7f8493c
   0x0000fffff7f84938:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8493c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84940:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f84944:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8494c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84950:	17ffffde	b	0xfffff7f848c8
   0x0000fffff7f84954:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84958:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8495c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84960:	aa1503e2	mov	x2, x21
   0x0000fffff7f84964:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f84968:	aa1403e4	mov	x4, x20
   0x0000fffff7f8496c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84970:	d2949490	mov	x16, #0xa4a4                	// #42148
   0x0000fffff7f84974:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84978:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8497c:	d63f0200	blr	x16
   0x0000fffff7f84980:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84984:	54002a60	b.eq	0xfffff7f84ed0  // b.none
   0x0000fffff7f84988:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8498c:	37d800e9	tbnz	w9, #27, 0xfffff7f849a8
   0x0000fffff7f84990:	d2807ca9	mov	x9, #0x3e5                 	// #997
   0x0000fffff7f84994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8499c:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f849a0:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f849a4:	1400000e	b	0xfffff7f849dc
   0x0000fffff7f849a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f849ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f849b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f849b8:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f849bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f849c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f849c4:	d286be10	mov	x16, #0x35f0                	// #13808
   0x0000fffff7f849c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f849cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849d0:	d63f0200	blr	x16
   0x0000fffff7f849d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f849d8:	54002920	b.eq	0xfffff7f84efc  // b.none
   0x0000fffff7f849dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f849e0:	37d80389	tbnz	w9, #27, 0xfffff7f84a50
   0x0000fffff7f849e4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f849e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849f4:	540002e1	b.ne	0xfffff7f84a50  // b.any
   0x0000fffff7f849f8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f849fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a08:	54000241	b.ne	0xfffff7f84a50  // b.any
   0x0000fffff7f84a0c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f84a10:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84a14:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84a18:	540001c0	b.eq	0xfffff7f84a50  // b.none
   0x0000fffff7f84a1c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84a20:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84a24:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84a28:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84a2c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84a30:	54000100	b.eq	0xfffff7f84a50  // b.none
   0x0000fffff7f84a34:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84a38:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84a3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a44:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f84a48:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84a4c:	1400000e	b	0xfffff7f84a84
   0x0000fffff7f84a50:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84a54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84a58:	aa1303e1	mov	x1, x19
   0x0000fffff7f84a5c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84a60:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f84a64:	aa1403e4	mov	x4, x20
   0x0000fffff7f84a68:	aa1603e5	mov	x5, x22
   0x0000fffff7f84a6c:	d2936610	mov	x16, #0x9b30                	// #39728
   0x0000fffff7f84a70:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84a74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84a78:	d63f0200	blr	x16
   0x0000fffff7f84a7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84a80:	54002540	b.eq	0xfffff7f84f28  // b.none
   0x0000fffff7f84a84:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84a88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84a8c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84a90:	aa1503e2	mov	x2, x21
   0x0000fffff7f84a94:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f84a98:	aa1403e4	mov	x4, x20
   0x0000fffff7f84a9c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84aa0:	d28d3010	mov	x16, #0x6980                	// #27008
   0x0000fffff7f84aa4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84aa8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84aac:	d63f0200	blr	x16
   0x0000fffff7f84ab0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ab4:	54002500	b.eq	0xfffff7f84f54  // b.none
   0x0000fffff7f84ab8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84abc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84ac0:	540005a0	b.eq	0xfffff7f84b74  // b.none
   0x0000fffff7f84ac4:	b9400269	ldr	w9, [x19]
   0x0000fffff7f84ac8:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f84acc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84ad0:	54000521	b.ne	0xfffff7f84b74  // b.any
   0x0000fffff7f84ad4:	f9400669	ldr	x9, [x19, #8]
   0x0000fffff7f84ad8:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f84adc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84ae0:	540004a1	b.ne	0xfffff7f84b74  // b.any
   0x0000fffff7f84ae4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84ae8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84aec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84af0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84af4:	54000400	b.eq	0xfffff7f84b74  // b.none
   0x0000fffff7f84af8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84afc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84b00:	36d801d1	tbz	w17, #27, 0xfffff7f84b38
   0x0000fffff7f84b04:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84b08:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84b0c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84b10:	54000321	b.ne	0xfffff7f84b74  // b.any
   0x0000fffff7f84b14:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84b18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84b1c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84b20:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84b24:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84b28:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84b2c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84b30:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84b34:	54000209	b.ls	0xfffff7f84b74  // b.plast
   0x0000fffff7f84b38:	36d8008d	tbz	w13, #27, 0xfffff7f84b48
   0x0000fffff7f84b3c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84b40:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84b44:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84b48:	36d80091	tbz	w17, #27, 0xfffff7f84b58
   0x0000fffff7f84b4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84b50:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84b54:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84b58:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84b5c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84b60:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84b64:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84b68:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84b6c:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84b70:	1400000e	b	0xfffff7f84ba8
   0x0000fffff7f84b74:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84b78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84b7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84b80:	aa1503e2	mov	x2, x21
   0x0000fffff7f84b84:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f84b88:	aa1403e4	mov	x4, x20
   0x0000fffff7f84b8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84b90:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f84b94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84b98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84b9c:	d63f0200	blr	x16
   0x0000fffff7f84ba0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ba4:	54001ee0	b.eq	0xfffff7f84f80  // b.none
   0x0000fffff7f84ba8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84bac:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84bb0:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84bb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bb8:	540001c1	b.ne	0xfffff7f84bf0  // b.any
   0x0000fffff7f84bbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84bc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84bc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84bc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bcc:	54000801	b.ne	0xfffff7f84ccc  // b.any
   0x0000fffff7f84bd0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f84bd4:	f940266b	ldr	x11, [x19, #72]
   0x0000fffff7f84bd8:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84bdc:	eb09015f	cmp	x10, x9
   0x0000fffff7f84be0:	54000762	b.cs	0xfffff7f84ccc  // b.hs, b.nlast
   0x0000fffff7f84be4:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84be8:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84bec:	14000014	b	0xfffff7f84c3c
   0x0000fffff7f84bf0:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84bf4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84bf8:	540006a0	b.eq	0xfffff7f84ccc  // b.none
   0x0000fffff7f84bfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84c00:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84c04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c08:	54000621	b.ne	0xfffff7f84ccc  // b.any
   0x0000fffff7f84c0c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84c10:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84c14:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c18:	540005a1	b.ne	0xfffff7f84ccc  // b.any
   0x0000fffff7f84c1c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84c20:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f84c24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c28:	54000521	b.ne	0xfffff7f84ccc  // b.any
   0x0000fffff7f84c2c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7f84c30:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f84c34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c38:	540004a1	b.ne	0xfffff7f84ccc  // b.any
   0x0000fffff7f84c3c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84c40:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84c44:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84c48:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84c4c:	54000400	b.eq	0xfffff7f84ccc  // b.none
   0x0000fffff7f84c50:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84c54:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84c58:	36d801d1	tbz	w17, #27, 0xfffff7f84c90
   0x0000fffff7f84c5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84c60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84c64:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84c68:	54000321	b.ne	0xfffff7f84ccc  // b.any
   0x0000fffff7f84c6c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84c70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84c74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84c78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84c7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84c80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84c84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84c88:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84c8c:	54000209	b.ls	0xfffff7f84ccc  // b.plast
   0x0000fffff7f84c90:	36d8008d	tbz	w13, #27, 0xfffff7f84ca0
   0x0000fffff7f84c94:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84c98:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84c9c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84ca0:	36d80091	tbz	w17, #27, 0xfffff7f84cb0
   0x0000fffff7f84ca4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84ca8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84cac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84cb0:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84cb4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84cb8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84cbc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84cc0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84cc4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84cc8:	1400000e	b	0xfffff7f84d00
   0x0000fffff7f84ccc:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84cd0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84cd4:	aa1303e1	mov	x1, x19
   0x0000fffff7f84cd8:	aa1503e2	mov	x2, x21
   0x0000fffff7f84cdc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f84ce0:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ce4:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ce8:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f84cec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84cf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84cf4:	d63f0200	blr	x16
   0x0000fffff7f84cf8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84cfc:	54001580	b.eq	0xfffff7f84fac  // b.none
   0x0000fffff7f84d00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84d04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84d08:	aa1303e1	mov	x1, x19
   0x0000fffff7f84d0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84d10:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f84d14:	aa1403e4	mov	x4, x20
   0x0000fffff7f84d18:	aa1603e5	mov	x5, x22
   0x0000fffff7f84d1c:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f84d20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84d24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84d28:	d63f0200	blr	x16
   0x0000fffff7f84d2c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84d30:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84d34:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84d38:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84d3c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f84d40:	d65f03c0	ret
   0x0000fffff7f84d44:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84d48:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84d4c:	b9000289	str	w9, [x20]
   0x0000fffff7f84d50:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84d54:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84d58:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84d5c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84d60:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84d64:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84d68:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84d6c:	d65f03c0	ret
   0x0000fffff7f84d70:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84d74:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84d78:	b9000289	str	w9, [x20]
   0x0000fffff7f84d7c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f84d80:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84d84:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84d88:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84d8c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84d90:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84d94:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84d98:	d65f03c0	ret
   0x0000fffff7f84d9c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84da0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84da4:	b9000289	str	w9, [x20]
   0x0000fffff7f84da8:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f84dac:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84db0:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84db4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84db8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84dbc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84dc0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84dc4:	d65f03c0	ret
   0x0000fffff7f84dc8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84dcc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84dd0:	b9000289	str	w9, [x20]
   0x0000fffff7f84dd4:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f84dd8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84ddc:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84de0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84de4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84de8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84dec:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84df0:	d65f03c0	ret
   0x0000fffff7f84df4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84df8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84dfc:	b9000289	str	w9, [x20]
   0x0000fffff7f84e00:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f84e04:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84e08:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84e0c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84e10:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84e14:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84e18:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84e1c:	d65f03c0	ret
   0x0000fffff7f84e20:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84e24:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84e28:	b9000289	str	w9, [x20]
   0x0000fffff7f84e2c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f84e30:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84e34:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84e38:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84e3c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84e40:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84e44:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84e48:	d65f03c0	ret
   0x0000fffff7f84e4c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84e50:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84e54:	b9000289	str	w9, [x20]
   0x0000fffff7f84e58:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f84e5c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84e60:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84e64:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84e68:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84e6c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84e70:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84e74:	d65f03c0	ret
   0x0000fffff7f84e78:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84e7c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84e80:	b9000289	str	w9, [x20]
   0x0000fffff7f84e84:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f84e88:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84e8c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84e90:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84e94:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84e98:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84e9c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84ea0:	d65f03c0	ret
   0x0000fffff7f84ea4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84ea8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84eac:	b9000289	str	w9, [x20]
   0x0000fffff7f84eb0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f84eb4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84eb8:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84ebc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84ec0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84ec4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84ec8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84ecc:	d65f03c0	ret
   0x0000fffff7f84ed0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84ed4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84ed8:	b9000289	str	w9, [x20]
   0x0000fffff7f84edc:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f84ee0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84ee4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84ee8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84eec:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84ef0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84ef4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84ef8:	d65f03c0	ret
   0x0000fffff7f84efc:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84f00:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84f04:	b9000289	str	w9, [x20]
   0x0000fffff7f84f08:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f84f0c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84f10:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84f14:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84f18:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84f1c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84f20:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84f24:	d65f03c0	ret
   0x0000fffff7f84f28:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84f2c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84f30:	b9000289	str	w9, [x20]
   0x0000fffff7f84f34:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f84f38:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84f3c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84f40:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84f44:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84f48:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84f4c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84f50:	d65f03c0	ret
   0x0000fffff7f84f54:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84f58:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84f5c:	b9000289	str	w9, [x20]
   0x0000fffff7f84f60:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f84f64:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84f68:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84f6c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84f70:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84f74:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84f78:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84f7c:	d65f03c0	ret
   0x0000fffff7f84f80:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84f84:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84f88:	b9000289	str	w9, [x20]
   0x0000fffff7f84f8c:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f84f90:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84f94:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84f98:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84f9c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84fa0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84fa4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84fa8:	d65f03c0	ret
   0x0000fffff7f84fac:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84fb0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84fb4:	b9000289	str	w9, [x20]
   0x0000fffff7f84fb8:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f84fbc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84fc0:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84fc4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84fc8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84fcc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84fd0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84fd4:	d65f03c0	ret
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
