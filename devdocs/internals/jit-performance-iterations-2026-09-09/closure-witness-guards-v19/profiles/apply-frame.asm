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
   0x0000fffff7f84038:	d2803010	mov	x16, #0x180                 	// #384
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
   0x0000fffff7f84068:	54000621	b.ne	0xfffff7f8412c  // b.any
   0x0000fffff7f8406c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84070:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84074:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84078:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8407c:	54000581	b.ne	0xfffff7f8412c  // b.any
   0x0000fffff7f84080:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f84084:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f84088:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8408c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84090:	540004e2	b.cs	0xfffff7f8412c  // b.hs, b.nlast
   0x0000fffff7f84094:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84098:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8409c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f840a0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f840a4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f840a8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f840ac:	54000400	b.eq	0xfffff7f8412c  // b.none
   0x0000fffff7f840b0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f840b4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f840b8:	36d801d1	tbz	w17, #27, 0xfffff7f840f0
   0x0000fffff7f840bc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f840c0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f840c4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f840c8:	54000321	b.ne	0xfffff7f8412c  // b.any
   0x0000fffff7f840cc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f840d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f840d4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f840d8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f840dc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f840e0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f840e4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f840e8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f840ec:	54000209	b.ls	0xfffff7f8412c  // b.plast
   0x0000fffff7f840f0:	36d8008d	tbz	w13, #27, 0xfffff7f84100
   0x0000fffff7f840f4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f840f8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f840fc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84100:	36d80091	tbz	w17, #27, 0xfffff7f84110
   0x0000fffff7f84104:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84108:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8410c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84110:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84114:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84118:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8411c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84120:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84124:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84128:	1400000e	b	0xfffff7f84160
   0x0000fffff7f8412c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84130:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84134:	aa1303e1	mov	x1, x19
   0x0000fffff7f84138:	aa1503e2	mov	x2, x21
   0x0000fffff7f8413c:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f84140:	aa1403e4	mov	x4, x20
   0x0000fffff7f84144:	aa1603e5	mov	x5, x22
   0x0000fffff7f84148:	d28a3210	mov	x16, #0x5190                	// #20880
   0x0000fffff7f8414c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84150:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84154:	d63f0200	blr	x16
   0x0000fffff7f84158:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8415c:	54006020	b.eq	0xfffff7f84d60  // b.none
   0x0000fffff7f84160:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84164:	37d806a9	tbnz	w9, #27, 0xfffff7f84238
   0x0000fffff7f84168:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8416c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84170:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84174:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84178:	540001c1	b.ne	0xfffff7f841b0  // b.any
   0x0000fffff7f8417c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f84180:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84184:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84188:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8418c:	54000121	b.ne	0xfffff7f841b0  // b.any
   0x0000fffff7f84190:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84194:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7f84198:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8419c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841a4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f841a8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f841ac:	14000030	b	0xfffff7f8426c
   0x0000fffff7f841b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f841b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f841b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841c0:	54000120	b.eq	0xfffff7f841e4  // b.none
   0x0000fffff7f841c4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f841c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f841cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841d4:	54000321	b.ne	0xfffff7f84238  // b.any
   0x0000fffff7f841d8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f841dc:	9e620120	scvtf	d0, x9
   0x0000fffff7f841e0:	14000002	b	0xfffff7f841e8
   0x0000fffff7f841e4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f841e8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f841ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f841f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f841f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841f8:	54000120	b.eq	0xfffff7f8421c  // b.none
   0x0000fffff7f841fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f84200:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84204:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84208:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8420c:	54000161	b.ne	0xfffff7f84238  // b.any
   0x0000fffff7f84210:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f84214:	9e620121	scvtf	d1, x9
   0x0000fffff7f84218:	14000002	b	0xfffff7f84220
   0x0000fffff7f8421c:	fd401661	ldr	d1, [x19, #40]
   0x0000fffff7f84220:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84224:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f84228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8422c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84230:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84234:	17ffffde	b	0xfffff7f841ac
   0x0000fffff7f84238:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8423c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84240:	aa1303e1	mov	x1, x19
   0x0000fffff7f84244:	aa1503e2	mov	x2, x21
   0x0000fffff7f84248:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f8424c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84250:	aa1603e5	mov	x5, x22
   0x0000fffff7f84254:	d2952690	mov	x16, #0xa934                	// #43316
   0x0000fffff7f84258:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8425c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84260:	d63f0200	blr	x16
   0x0000fffff7f84264:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84268:	54005800	b.eq	0xfffff7f84d68  // b.none
   0x0000fffff7f8426c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f84270:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84274:	d29ffe2c	mov	x12, #0xfff1                	// #65521
   0x0000fffff7f84278:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f8427c:	36d80211	tbz	w17, #27, 0xfffff7f842bc
   0x0000fffff7f84280:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84284:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84288:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8428c:	540001e1	b.ne	0xfffff7f842c8  // b.any
   0x0000fffff7f84290:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f84294:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84298:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8429c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f842a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f842a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f842a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f842ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7f842b0:	540000c9	b.ls	0xfffff7f842c8  // b.plast
   0x0000fffff7f842b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f842b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f842bc:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f842c0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f842c4:	1400000e	b	0xfffff7f842fc
   0x0000fffff7f842c8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f842cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f842d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f842d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f842d8:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f842dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f842e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f842e4:	d286d010	mov	x16, #0x3680                	// #13952
   0x0000fffff7f842e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f842ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842f0:	d63f0200	blr	x16
   0x0000fffff7f842f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842f8:	540053c0	b.eq	0xfffff7f84d70  // b.none
   0x0000fffff7f842fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84300:	37d80389	tbnz	w9, #27, 0xfffff7f84370
   0x0000fffff7f84304:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84308:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8430c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84310:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84314:	540002e1	b.ne	0xfffff7f84370  // b.any
   0x0000fffff7f84318:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8431c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84320:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84324:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84328:	54000241	b.ne	0xfffff7f84370  // b.any
   0x0000fffff7f8432c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84330:	f9402e6a	ldr	x10, [x19, #88]
   0x0000fffff7f84334:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84338:	540001c0	b.eq	0xfffff7f84370  // b.none
   0x0000fffff7f8433c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84340:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84344:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84348:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f8434c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84350:	54000100	b.eq	0xfffff7f84370  // b.none
   0x0000fffff7f84354:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84358:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f8435c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84364:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84368:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8436c:	1400000e	b	0xfffff7f843a4
   0x0000fffff7f84370:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84374:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84378:	aa1303e1	mov	x1, x19
   0x0000fffff7f8437c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84380:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f84384:	aa1403e4	mov	x4, x20
   0x0000fffff7f84388:	aa1603e5	mov	x5, x22
   0x0000fffff7f8438c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7f84390:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84394:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84398:	d63f0200	blr	x16
   0x0000fffff7f8439c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843a0:	54004ec0	b.eq	0xfffff7f84d78  // b.none
   0x0000fffff7f843a4:	b9400269	ldr	w9, [x19]
   0x0000fffff7f843a8:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f843ac:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f843b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843b4:	540001c1	b.ne	0xfffff7f843ec  // b.any
   0x0000fffff7f843b8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f843bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f843c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f843c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843c8:	54000501	b.ne	0xfffff7f84468  // b.any
   0x0000fffff7f843cc:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f843d0:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f843d4:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f843d8:	eb09015f	cmp	x10, x9
   0x0000fffff7f843dc:	54000462	b.cs	0xfffff7f84468  // b.hs, b.nlast
   0x0000fffff7f843e0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f843e4:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f843e8:	14000004	b	0xfffff7f843f8
   0x0000fffff7f843ec:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f843f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f843f4:	540003a0	b.eq	0xfffff7f84468  // b.none
   0x0000fffff7f843f8:	b940426d	ldr	w13, [x19, #64]
   0x0000fffff7f843fc:	f940266c	ldr	x12, [x19, #72]
   0x0000fffff7f84400:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84404:	36d801d1	tbz	w17, #27, 0xfffff7f8443c
   0x0000fffff7f84408:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8440c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84410:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84414:	540002a1	b.ne	0xfffff7f84468  // b.any
   0x0000fffff7f84418:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f8441c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84420:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84424:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84428:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8442c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84430:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84434:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84438:	54000189	b.ls	0xfffff7f84468  // b.plast
   0x0000fffff7f8443c:	36d8008d	tbz	w13, #27, 0xfffff7f8444c
   0x0000fffff7f84440:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84444:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84448:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8444c:	36d80091	tbz	w17, #27, 0xfffff7f8445c
   0x0000fffff7f84450:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84454:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84458:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8445c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84460:	b900016d	str	w13, [x11]
   0x0000fffff7f84464:	1400000e	b	0xfffff7f8449c
   0x0000fffff7f84468:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f8446c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84470:	aa1303e1	mov	x1, x19
   0x0000fffff7f84474:	aa1503e2	mov	x2, x21
   0x0000fffff7f84478:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f8447c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84480:	aa1603e5	mov	x5, x22
   0x0000fffff7f84484:	d28c9610	mov	x16, #0x64b0                	// #25776
   0x0000fffff7f84488:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8448c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84490:	d63f0200	blr	x16
   0x0000fffff7f84494:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84498:	54004740	b.eq	0xfffff7f84d80  // b.none
   0x0000fffff7f8449c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f844a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f844a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f844a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f844ac:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f844b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f844b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f844b8:	d295a410	mov	x16, #0xad20                	// #44320
   0x0000fffff7f844bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f844c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f844c4:	d63f0200	blr	x16
   0x0000fffff7f844c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f844cc:	540045e0	b.eq	0xfffff7f84d88  // b.none
   0x0000fffff7f844d0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f844d4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f844d8:	540004a0	b.eq	0xfffff7f8456c  // b.none
   0x0000fffff7f844dc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f844e0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f844e4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f844e8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f844ec:	54000400	b.eq	0xfffff7f8456c  // b.none
   0x0000fffff7f844f0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f844f4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f844f8:	36d801d1	tbz	w17, #27, 0xfffff7f84530
   0x0000fffff7f844fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84500:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84504:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84508:	54000321	b.ne	0xfffff7f8456c  // b.any
   0x0000fffff7f8450c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84510:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84514:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84518:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8451c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84520:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84524:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84528:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8452c:	54000209	b.ls	0xfffff7f8456c  // b.plast
   0x0000fffff7f84530:	36d8008d	tbz	w13, #27, 0xfffff7f84540
   0x0000fffff7f84534:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84538:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8453c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84540:	36d80091	tbz	w17, #27, 0xfffff7f84550
   0x0000fffff7f84544:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84548:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8454c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84550:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f84554:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f84558:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8455c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84560:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f84564:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f84568:	1400000e	b	0xfffff7f845a0
   0x0000fffff7f8456c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84570:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84574:	aa1303e1	mov	x1, x19
   0x0000fffff7f84578:	aa1503e2	mov	x2, x21
   0x0000fffff7f8457c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f84580:	aa1403e4	mov	x4, x20
   0x0000fffff7f84584:	aa1603e5	mov	x5, x22
   0x0000fffff7f84588:	d295a410	mov	x16, #0xad20                	// #44320
   0x0000fffff7f8458c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84590:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84594:	d63f0200	blr	x16
   0x0000fffff7f84598:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8459c:	54003fa0	b.eq	0xfffff7f84d90  // b.none
   0x0000fffff7f845a0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f845a4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f845a8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f845ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845b0:	54000621	b.ne	0xfffff7f84674  // b.any
   0x0000fffff7f845b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f845b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f845bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f845c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f845c4:	54000581	b.ne	0xfffff7f84674  // b.any
   0x0000fffff7f845c8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f845cc:	f9402e6b	ldr	x11, [x19, #88]
   0x0000fffff7f845d0:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f845d4:	eb09015f	cmp	x10, x9
   0x0000fffff7f845d8:	540004e2	b.cs	0xfffff7f84674  // b.hs, b.nlast
   0x0000fffff7f845dc:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f845e0:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f845e4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f845e8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f845ec:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f845f0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f845f4:	54000400	b.eq	0xfffff7f84674  // b.none
   0x0000fffff7f845f8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f845fc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84600:	36d801d1	tbz	w17, #27, 0xfffff7f84638
   0x0000fffff7f84604:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84608:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8460c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84610:	54000321	b.ne	0xfffff7f84674  // b.any
   0x0000fffff7f84614:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84618:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8461c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84620:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84624:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84628:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8462c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84630:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84634:	54000209	b.ls	0xfffff7f84674  // b.plast
   0x0000fffff7f84638:	36d8008d	tbz	w13, #27, 0xfffff7f84648
   0x0000fffff7f8463c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84640:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84644:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84648:	36d80091	tbz	w17, #27, 0xfffff7f84658
   0x0000fffff7f8464c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84650:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84654:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84658:	b940526e	ldr	w14, [x19, #80]
   0x0000fffff7f8465c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f84660:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84664:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84668:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f8466c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f84670:	1400000e	b	0xfffff7f846a8
   0x0000fffff7f84674:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f84678:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8467c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84680:	aa1503e2	mov	x2, x21
   0x0000fffff7f84684:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f84688:	aa1403e4	mov	x4, x20
   0x0000fffff7f8468c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84690:	d28a3210	mov	x16, #0x5190                	// #20880
   0x0000fffff7f84694:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84698:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8469c:	d63f0200	blr	x16
   0x0000fffff7f846a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f846a4:	540037a0	b.eq	0xfffff7f84d98  // b.none
   0x0000fffff7f846a8:	b9400269	ldr	w9, [x19]
   0x0000fffff7f846ac:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f846b0:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f846b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846b8:	540001c1	b.ne	0xfffff7f846f0  // b.any
   0x0000fffff7f846bc:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f846c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f846c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f846c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846cc:	54000601	b.ne	0xfffff7f8478c  // b.any
   0x0000fffff7f846d0:	f9400e6a	ldr	x10, [x19, #24]
   0x0000fffff7f846d4:	f940066b	ldr	x11, [x19, #8]
   0x0000fffff7f846d8:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f846dc:	eb09015f	cmp	x10, x9
   0x0000fffff7f846e0:	54000562	b.cs	0xfffff7f8478c  // b.hs, b.nlast
   0x0000fffff7f846e4:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f846e8:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f846ec:	14000004	b	0xfffff7f846fc
   0x0000fffff7f846f0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f846f4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f846f8:	540004a0	b.eq	0xfffff7f8478c  // b.none
   0x0000fffff7f846fc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84700:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84704:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84708:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8470c:	54000400	b.eq	0xfffff7f8478c  // b.none
   0x0000fffff7f84710:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84714:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84718:	36d801d1	tbz	w17, #27, 0xfffff7f84750
   0x0000fffff7f8471c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84720:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84724:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84728:	54000321	b.ne	0xfffff7f8478c  // b.any
   0x0000fffff7f8472c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84730:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84734:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84738:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8473c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84740:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84744:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84748:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8474c:	54000209	b.ls	0xfffff7f8478c  // b.plast
   0x0000fffff7f84750:	36d8008d	tbz	w13, #27, 0xfffff7f84760
   0x0000fffff7f84754:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84758:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8475c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84760:	36d80091	tbz	w17, #27, 0xfffff7f84770
   0x0000fffff7f84764:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84768:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8476c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84770:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f84774:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84778:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8477c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84780:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84784:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84788:	1400000e	b	0xfffff7f847c0
   0x0000fffff7f8478c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84790:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84794:	aa1303e1	mov	x1, x19
   0x0000fffff7f84798:	aa1503e2	mov	x2, x21
   0x0000fffff7f8479c:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f847a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f847a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f847a8:	d28a3210	mov	x16, #0x5190                	// #20880
   0x0000fffff7f847ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f847b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f847b4:	d63f0200	blr	x16
   0x0000fffff7f847b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f847bc:	54002f20	b.eq	0xfffff7f84da0  // b.none
   0x0000fffff7f847c0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f847c4:	37d806a9	tbnz	w9, #27, 0xfffff7f84898
   0x0000fffff7f847c8:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f847cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f847d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847d8:	540001c1	b.ne	0xfffff7f84810  // b.any
   0x0000fffff7f847dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f847e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f847e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847ec:	54000121	b.ne	0xfffff7f84810  // b.any
   0x0000fffff7f847f0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f847f4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f847f8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f847fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84800:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84804:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f84808:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f8480c:	14000030	b	0xfffff7f848cc
   0x0000fffff7f84810:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84814:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84818:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8481c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84820:	54000120	b.eq	0xfffff7f84844  // b.none
   0x0000fffff7f84824:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84828:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8482c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84830:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84834:	54000321	b.ne	0xfffff7f84898  // b.any
   0x0000fffff7f84838:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f8483c:	9e620120	scvtf	d0, x9
   0x0000fffff7f84840:	14000002	b	0xfffff7f84848
   0x0000fffff7f84844:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f84848:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8484c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84850:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84854:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84858:	54000120	b.eq	0xfffff7f8487c  // b.none
   0x0000fffff7f8485c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84860:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84864:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84868:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8486c:	54000161	b.ne	0xfffff7f84898  // b.any
   0x0000fffff7f84870:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84874:	9e620121	scvtf	d1, x9
   0x0000fffff7f84878:	14000002	b	0xfffff7f84880
   0x0000fffff7f8487c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84880:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84884:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f84888:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8488c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84890:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f84894:	17ffffde	b	0xfffff7f8480c
   0x0000fffff7f84898:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8489c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f848a0:	aa1303e1	mov	x1, x19
   0x0000fffff7f848a4:	aa1503e2	mov	x2, x21
   0x0000fffff7f848a8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f848ac:	aa1403e4	mov	x4, x20
   0x0000fffff7f848b0:	aa1603e5	mov	x5, x22
   0x0000fffff7f848b4:	d2952690	mov	x16, #0xa934                	// #43316
   0x0000fffff7f848b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f848bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f848c0:	d63f0200	blr	x16
   0x0000fffff7f848c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f848c8:	54002700	b.eq	0xfffff7f84da8  // b.none
   0x0000fffff7f848cc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f848d0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f848d4:	d2807cac	mov	x12, #0x3e5                 	// #997
   0x0000fffff7f848d8:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f848dc:	36d80211	tbz	w17, #27, 0xfffff7f8491c
   0x0000fffff7f848e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f848e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f848e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f848ec:	540001e1	b.ne	0xfffff7f84928  // b.any
   0x0000fffff7f848f0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f848f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f848f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f848fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84900:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84904:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84908:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8490c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84910:	540000c9	b.ls	0xfffff7f84928  // b.plast
   0x0000fffff7f84914:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84918:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8491c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84920:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84924:	1400000e	b	0xfffff7f8495c
   0x0000fffff7f84928:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8492c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84930:	aa1303e1	mov	x1, x19
   0x0000fffff7f84934:	aa1503e2	mov	x2, x21
   0x0000fffff7f84938:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f8493c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84940:	aa1603e5	mov	x5, x22
   0x0000fffff7f84944:	d286d010	mov	x16, #0x3680                	// #13952
   0x0000fffff7f84948:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8494c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84950:	d63f0200	blr	x16
   0x0000fffff7f84954:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84958:	540022c0	b.eq	0xfffff7f84db0  // b.none
   0x0000fffff7f8495c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84960:	37d80389	tbnz	w9, #27, 0xfffff7f849d0
   0x0000fffff7f84964:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f84968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8496c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84970:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84974:	540002e1	b.ne	0xfffff7f849d0  // b.any
   0x0000fffff7f84978:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8497c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84984:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84988:	54000241	b.ne	0xfffff7f849d0  // b.any
   0x0000fffff7f8498c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f84990:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84994:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84998:	540001c0	b.eq	0xfffff7f849d0  // b.none
   0x0000fffff7f8499c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f849a0:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f849a4:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f849a8:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f849ac:	eb0b015f	cmp	x10, x11
   0x0000fffff7f849b0:	54000100	b.eq	0xfffff7f849d0  // b.none
   0x0000fffff7f849b4:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f849b8:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f849bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849c4:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f849c8:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f849cc:	1400000e	b	0xfffff7f84a04
   0x0000fffff7f849d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f849d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f849dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f849e0:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f849e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f849e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f849ec:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7f849f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f849f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849f8:	d63f0200	blr	x16
   0x0000fffff7f849fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84a00:	54001dc0	b.eq	0xfffff7f84db8  // b.none
   0x0000fffff7f84a04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84a08:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84a0c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84a10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a14:	54000521	b.ne	0xfffff7f84ab8  // b.any
   0x0000fffff7f84a18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84a1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a28:	54000481	b.ne	0xfffff7f84ab8  // b.any
   0x0000fffff7f84a2c:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f84a30:	f940266b	ldr	x11, [x19, #72]
   0x0000fffff7f84a34:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84a38:	eb09015f	cmp	x10, x9
   0x0000fffff7f84a3c:	540003e2	b.cs	0xfffff7f84ab8  // b.hs, b.nlast
   0x0000fffff7f84a40:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84a44:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84a48:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f84a4c:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f84a50:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84a54:	36d801d1	tbz	w17, #27, 0xfffff7f84a8c
   0x0000fffff7f84a58:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84a5c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84a60:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84a64:	540002a1	b.ne	0xfffff7f84ab8  // b.any
   0x0000fffff7f84a68:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84a6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84a70:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84a74:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84a78:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84a7c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84a80:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84a84:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84a88:	54000189	b.ls	0xfffff7f84ab8  // b.plast
   0x0000fffff7f84a8c:	36d8008d	tbz	w13, #27, 0xfffff7f84a9c
   0x0000fffff7f84a90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84a94:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84a98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84a9c:	36d80091	tbz	w17, #27, 0xfffff7f84aac
   0x0000fffff7f84aa0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84aa4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84aa8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84aac:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84ab0:	b900016d	str	w13, [x11]
   0x0000fffff7f84ab4:	1400000e	b	0xfffff7f84aec
   0x0000fffff7f84ab8:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84abc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84ac0:	aa1303e1	mov	x1, x19
   0x0000fffff7f84ac4:	aa1503e2	mov	x2, x21
   0x0000fffff7f84ac8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f84acc:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ad0:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ad4:	d28c9610	mov	x16, #0x64b0                	// #25776
   0x0000fffff7f84ad8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84adc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ae0:	d63f0200	blr	x16
   0x0000fffff7f84ae4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ae8:	540016c0	b.eq	0xfffff7f84dc0  // b.none
   0x0000fffff7f84aec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84af0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84af4:	540004a0	b.eq	0xfffff7f84b88  // b.none
   0x0000fffff7f84af8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84afc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84b00:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84b04:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84b08:	54000400	b.eq	0xfffff7f84b88  // b.none
   0x0000fffff7f84b0c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84b10:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84b14:	36d801d1	tbz	w17, #27, 0xfffff7f84b4c
   0x0000fffff7f84b18:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84b1c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84b20:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84b24:	54000321	b.ne	0xfffff7f84b88  // b.any
   0x0000fffff7f84b28:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84b2c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84b30:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84b34:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84b38:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84b3c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84b40:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84b44:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84b48:	54000209	b.ls	0xfffff7f84b88  // b.plast
   0x0000fffff7f84b4c:	36d8008d	tbz	w13, #27, 0xfffff7f84b5c
   0x0000fffff7f84b50:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84b54:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84b58:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84b5c:	36d80091	tbz	w17, #27, 0xfffff7f84b6c
   0x0000fffff7f84b60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84b64:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84b68:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84b6c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84b70:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84b74:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84b78:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84b7c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84b80:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84b84:	1400000e	b	0xfffff7f84bbc
   0x0000fffff7f84b88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84b8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84b90:	aa1303e1	mov	x1, x19
   0x0000fffff7f84b94:	aa1503e2	mov	x2, x21
   0x0000fffff7f84b98:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f84b9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ba4:	d295a410	mov	x16, #0xad20                	// #44320
   0x0000fffff7f84ba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84bac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84bb0:	d63f0200	blr	x16
   0x0000fffff7f84bb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84bb8:	54001080	b.eq	0xfffff7f84dc8  // b.none
   0x0000fffff7f84bbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84bc0:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84bc4:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84bc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bcc:	540001c1	b.ne	0xfffff7f84c04  // b.any
   0x0000fffff7f84bd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84bd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84bd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84bdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84be0:	54000701	b.ne	0xfffff7f84cc0  // b.any
   0x0000fffff7f84be4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f84be8:	f940266b	ldr	x11, [x19, #72]
   0x0000fffff7f84bec:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84bf0:	eb09015f	cmp	x10, x9
   0x0000fffff7f84bf4:	54000662	b.cs	0xfffff7f84cc0  // b.hs, b.nlast
   0x0000fffff7f84bf8:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84bfc:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84c00:	1400000c	b	0xfffff7f84c30
   0x0000fffff7f84c04:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84c08:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84c0c:	540005a0	b.eq	0xfffff7f84cc0  // b.none
   0x0000fffff7f84c10:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84c14:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84c18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c1c:	54000521	b.ne	0xfffff7f84cc0  // b.any
   0x0000fffff7f84c20:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84c24:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84c28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c2c:	540004a1	b.ne	0xfffff7f84cc0  // b.any
   0x0000fffff7f84c30:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84c34:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84c38:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84c3c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84c40:	54000400	b.eq	0xfffff7f84cc0  // b.none
   0x0000fffff7f84c44:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84c48:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84c4c:	36d801d1	tbz	w17, #27, 0xfffff7f84c84
   0x0000fffff7f84c50:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84c54:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84c58:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84c5c:	54000321	b.ne	0xfffff7f84cc0  // b.any
   0x0000fffff7f84c60:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84c64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84c68:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84c6c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84c70:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84c74:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84c78:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84c7c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84c80:	54000209	b.ls	0xfffff7f84cc0  // b.plast
   0x0000fffff7f84c84:	36d8008d	tbz	w13, #27, 0xfffff7f84c94
   0x0000fffff7f84c88:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84c8c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84c90:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84c94:	36d80091	tbz	w17, #27, 0xfffff7f84ca4
   0x0000fffff7f84c98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84c9c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84ca0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84ca4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7f84ca8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f84cac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84cb0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84cb4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84cb8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84cbc:	1400000e	b	0xfffff7f84cf4
   0x0000fffff7f84cc0:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84cc4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84cc8:	aa1303e1	mov	x1, x19
   0x0000fffff7f84ccc:	aa1503e2	mov	x2, x21
   0x0000fffff7f84cd0:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f84cd4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84cd8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84cdc:	d28a3210	mov	x16, #0x5190                	// #20880
   0x0000fffff7f84ce0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84ce4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ce8:	d63f0200	blr	x16
   0x0000fffff7f84cec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84cf0:	54000700	b.eq	0xfffff7f84dd0  // b.none
   0x0000fffff7f84cf4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84cf8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84cfc:	aa1303e1	mov	x1, x19
   0x0000fffff7f84d00:	aa1503e2	mov	x2, x21
   0x0000fffff7f84d04:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f84d08:	aa1403e4	mov	x4, x20
   0x0000fffff7f84d0c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84d10:	d2882a90	mov	x16, #0x4154                	// #16724
   0x0000fffff7f84d14:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84d18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84d1c:	d63f0200	blr	x16
   0x0000fffff7f84d20:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84d24:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84d28:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84d2c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84d30:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f84d34:	d65f03c0	ret
   0x0000fffff7f84d38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84d3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84d40:	b900028a	str	w10, [x20]
   0x0000fffff7f84d44:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84d48:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84d4c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84d50:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84d54:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84d58:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84d5c:	d65f03c0	ret
   0x0000fffff7f84d60:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84d64:	17fffff5	b	0xfffff7f84d38
   0x0000fffff7f84d68:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f84d6c:	17fffff3	b	0xfffff7f84d38
   0x0000fffff7f84d70:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f84d74:	17fffff1	b	0xfffff7f84d38
   0x0000fffff7f84d78:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f84d7c:	17ffffef	b	0xfffff7f84d38
   0x0000fffff7f84d80:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f84d84:	17ffffed	b	0xfffff7f84d38
   0x0000fffff7f84d88:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f84d8c:	17ffffeb	b	0xfffff7f84d38
   0x0000fffff7f84d90:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f84d94:	17ffffe9	b	0xfffff7f84d38
   0x0000fffff7f84d98:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f84d9c:	17ffffe7	b	0xfffff7f84d38
   0x0000fffff7f84da0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f84da4:	17ffffe5	b	0xfffff7f84d38
   0x0000fffff7f84da8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f84dac:	17ffffe3	b	0xfffff7f84d38
   0x0000fffff7f84db0:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f84db4:	17ffffe1	b	0xfffff7f84d38
   0x0000fffff7f84db8:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f84dbc:	17ffffdf	b	0xfffff7f84d38
   0x0000fffff7f84dc0:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f84dc4:	17ffffdd	b	0xfffff7f84d38
   0x0000fffff7f84dc8:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f84dcc:	17ffffdb	b	0xfffff7f84d38
   0x0000fffff7f84dd0:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f84dd4:	17ffffd9	b	0xfffff7f84d38
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
