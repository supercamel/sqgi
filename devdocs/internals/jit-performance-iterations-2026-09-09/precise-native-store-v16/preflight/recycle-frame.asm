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
   0x0000fffff7f84058:	5280008d	mov	w13, #0x4                   	// #4
   0x0000fffff7f8405c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84060:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f84064:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f84068:	36d80211	tbz	w17, #27, 0xfffff7f840a8
   0x0000fffff7f8406c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84070:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84074:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84078:	540001e1	b.ne	0xfffff7f840b4  // b.any
   0x0000fffff7f8407c:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f84080:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84084:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84088:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8408c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84090:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84094:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84098:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8409c:	540000c9	b.ls	0xfffff7f840b4  // b.plast
   0x0000fffff7f840a0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f840a4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f840a8:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f840ac:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f840b0:	1400000e	b	0xfffff7f840e8
   0x0000fffff7f840b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f840b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f840bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f840c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f840c4:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f840c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f840cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f840d0:	d2961c90	mov	x16, #0xb0e4                	// #45284
   0x0000fffff7f840d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f840d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840dc:	d63f0200	blr	x16
   0x0000fffff7f840e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f840e4:	5400d9c0	b.eq	0xfffff7f85c1c  // b.none
   0x0000fffff7f840e8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f840ec:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f840f0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f840f4:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f840f8:	36d80211	tbz	w17, #27, 0xfffff7f84138
   0x0000fffff7f840fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84100:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84104:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84108:	540001e1	b.ne	0xfffff7f84144  // b.any
   0x0000fffff7f8410c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84114:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84118:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8411c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84120:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84124:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84128:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8412c:	540000c9	b.ls	0xfffff7f84144  // b.plast
   0x0000fffff7f84130:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84134:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84138:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8413c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84140:	1400000e	b	0xfffff7f84178
   0x0000fffff7f84144:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84148:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8414c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84150:	aa1503e2	mov	x2, x21
   0x0000fffff7f84154:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f84158:	aa1403e4	mov	x4, x20
   0x0000fffff7f8415c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84160:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f84164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8416c:	d63f0200	blr	x16
   0x0000fffff7f84170:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84174:	5400d580	b.eq	0xfffff7f85c24  // b.none
   0x0000fffff7f84178:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8417c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84180:	aa1303e1	mov	x1, x19
   0x0000fffff7f84184:	aa1503e2	mov	x2, x21
   0x0000fffff7f84188:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f8418c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84190:	aa1603e5	mov	x5, x22
   0x0000fffff7f84194:	d2932890	mov	x16, #0x9944                	// #39236
   0x0000fffff7f84198:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8419c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f841a0:	d63f0200	blr	x16
   0x0000fffff7f841a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f841a8:	5400d420	b.eq	0xfffff7f85c2c  // b.none
   0x0000fffff7f841ac:	f100041f	cmp	x0, #0x1
   0x0000fffff7f841b0:	5400d000	b.eq	0xfffff7f85bb0  // b.none
   0x0000fffff7f841b4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f841b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f841bc:	540005a0	b.eq	0xfffff7f84270  // b.none
   0x0000fffff7f841c0:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f841c4:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f841c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841cc:	54000521	b.ne	0xfffff7f84270  // b.any
   0x0000fffff7f841d0:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f841d4:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f841d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841dc:	540004a1	b.ne	0xfffff7f84270  // b.any
   0x0000fffff7f841e0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f841e4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f841e8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f841ec:	eb0901bf	cmp	x13, x9
   0x0000fffff7f841f0:	54000400	b.eq	0xfffff7f84270  // b.none
   0x0000fffff7f841f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f841f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f841fc:	36d801d1	tbz	w17, #27, 0xfffff7f84234
   0x0000fffff7f84200:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84204:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84208:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8420c:	54000321	b.ne	0xfffff7f84270  // b.any
   0x0000fffff7f84210:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84214:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84218:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8421c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84220:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84224:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84228:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8422c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84230:	54000209	b.ls	0xfffff7f84270  // b.plast
   0x0000fffff7f84234:	36d8008d	tbz	w13, #27, 0xfffff7f84244
   0x0000fffff7f84238:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8423c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84240:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84244:	36d80091	tbz	w17, #27, 0xfffff7f84254
   0x0000fffff7f84248:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8424c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84250:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84254:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f84258:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f8425c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84260:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84264:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f84268:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f8426c:	1400000e	b	0xfffff7f842a4
   0x0000fffff7f84270:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84274:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84278:	aa1303e1	mov	x1, x19
   0x0000fffff7f8427c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84280:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f84284:	aa1403e4	mov	x4, x20
   0x0000fffff7f84288:	aa1603e5	mov	x5, x22
   0x0000fffff7f8428c:	d2947010	mov	x16, #0xa380                	// #41856
   0x0000fffff7f84290:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84294:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84298:	d63f0200	blr	x16
   0x0000fffff7f8429c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842a0:	5400cca0	b.eq	0xfffff7f85c34  // b.none
   0x0000fffff7f842a4:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f842a8:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f842ac:	d29a880c	mov	x12, #0xd440                	// #54336
   0x0000fffff7f842b0:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f842b4:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f842b8:	b9408271	ldr	w17, [x19, #128]
   0x0000fffff7f842bc:	36d801d1	tbz	w17, #27, 0xfffff7f842f4
   0x0000fffff7f842c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f842c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f842c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f842cc:	54000281	b.ne	0xfffff7f8431c  // b.any
   0x0000fffff7f842d0:	f940466f	ldr	x15, [x19, #136]
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
   0x0000fffff7f84310:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84314:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f84318:	1400000e	b	0xfffff7f84350
   0x0000fffff7f8431c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84320:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84324:	aa1303e1	mov	x1, x19
   0x0000fffff7f84328:	aa1503e2	mov	x2, x21
   0x0000fffff7f8432c:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f84330:	aa1403e4	mov	x4, x20
   0x0000fffff7f84334:	aa1603e5	mov	x5, x22
   0x0000fffff7f84338:	d2961c90	mov	x16, #0xb0e4                	// #45284
   0x0000fffff7f8433c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84340:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84344:	d63f0200	blr	x16
   0x0000fffff7f84348:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8434c:	5400c780	b.eq	0xfffff7f85c3c  // b.none
   0x0000fffff7f84350:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84354:	37d80389	tbnz	w9, #27, 0xfffff7f843c4
   0x0000fffff7f84358:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8435c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84364:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84368:	540002e1	b.ne	0xfffff7f843c4  // b.any
   0x0000fffff7f8436c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84370:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84374:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84378:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8437c:	54000241	b.ne	0xfffff7f843c4  // b.any
   0x0000fffff7f84380:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84384:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f84388:	f100015f	cmp	x10, #0x0
   0x0000fffff7f8438c:	540001c0	b.eq	0xfffff7f843c4  // b.none
   0x0000fffff7f84390:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84394:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84398:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f8439c:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f843a0:	eb0b015f	cmp	x10, x11
   0x0000fffff7f843a4:	54000100	b.eq	0xfffff7f843c4  // b.none
   0x0000fffff7f843a8:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f843ac:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f843b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f843b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f843b8:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f843bc:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f843c0:	1400000e	b	0xfffff7f843f8
   0x0000fffff7f843c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f843c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f843cc:	aa1303e1	mov	x1, x19
   0x0000fffff7f843d0:	aa1503e2	mov	x2, x21
   0x0000fffff7f843d4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f843d8:	aa1403e4	mov	x4, x20
   0x0000fffff7f843dc:	aa1603e5	mov	x5, x22
   0x0000fffff7f843e0:	d294a410	mov	x16, #0xa520                	// #42272
   0x0000fffff7f843e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f843e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843ec:	d63f0200	blr	x16
   0x0000fffff7f843f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843f4:	5400c280	b.eq	0xfffff7f85c44  // b.none
   0x0000fffff7f843f8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f843fc:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84400:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84404:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84408:	540001c1	b.ne	0xfffff7f84440  // b.any
   0x0000fffff7f8440c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84410:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84418:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8441c:	54000801	b.ne	0xfffff7f8451c  // b.any
   0x0000fffff7f84420:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84424:	f940166b	ldr	x11, [x19, #40]
   0x0000fffff7f84428:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8442c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84430:	54000762	b.cs	0xfffff7f8451c  // b.hs, b.nlast
   0x0000fffff7f84434:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84438:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8443c:	14000014	b	0xfffff7f8448c
   0x0000fffff7f84440:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84444:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84448:	540006a0	b.eq	0xfffff7f8451c  // b.none
   0x0000fffff7f8444c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f84450:	b94033ea	ldr	w10, [sp, #48]
   0x0000fffff7f84454:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84458:	54000621	b.ne	0xfffff7f8451c  // b.any
   0x0000fffff7f8445c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f84460:	f9401fea	ldr	x10, [sp, #56]
   0x0000fffff7f84464:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84468:	540005a1	b.ne	0xfffff7f8451c  // b.any
   0x0000fffff7f8446c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84470:	b94037ea	ldr	w10, [sp, #52]
   0x0000fffff7f84474:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84478:	54000521	b.ne	0xfffff7f8451c  // b.any
   0x0000fffff7f8447c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84480:	f94023ea	ldr	x10, [sp, #64]
   0x0000fffff7f84484:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84488:	540004a1	b.ne	0xfffff7f8451c  // b.any
   0x0000fffff7f8448c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84490:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84494:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84498:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8449c:	54000400	b.eq	0xfffff7f8451c  // b.none
   0x0000fffff7f844a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f844a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f844a8:	36d801d1	tbz	w17, #27, 0xfffff7f844e0
   0x0000fffff7f844ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f844b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f844b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f844b8:	54000321	b.ne	0xfffff7f8451c  // b.any
   0x0000fffff7f844bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f844c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f844c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f844cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f844d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f844d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f844d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f844dc:	54000209	b.ls	0xfffff7f8451c  // b.plast
   0x0000fffff7f844e0:	36d8008d	tbz	w13, #27, 0xfffff7f844f0
   0x0000fffff7f844e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f844e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f844ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f844f0:	36d80091	tbz	w17, #27, 0xfffff7f84500
   0x0000fffff7f844f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f844fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84500:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f84504:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f84508:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8450c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84510:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84514:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f84518:	1400000e	b	0xfffff7f84550
   0x0000fffff7f8451c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84520:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84524:	aa1303e1	mov	x1, x19
   0x0000fffff7f84528:	aa1503e2	mov	x2, x21
   0x0000fffff7f8452c:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f84530:	aa1403e4	mov	x4, x20
   0x0000fffff7f84534:	aa1603e5	mov	x5, x22
   0x0000fffff7f84538:	d28b5c10	mov	x16, #0x5ae0                	// #23264
   0x0000fffff7f8453c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84540:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84544:	d63f0200	blr	x16
   0x0000fffff7f84548:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8454c:	5400b800	b.eq	0xfffff7f85c4c  // b.none
   0x0000fffff7f84550:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84554:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84558:	540004a0	b.eq	0xfffff7f845ec  // b.none
   0x0000fffff7f8455c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84560:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f84564:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84568:	54000421	b.ne	0xfffff7f845ec  // b.any
   0x0000fffff7f8456c:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84570:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f84574:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84578:	540003a1	b.ne	0xfffff7f845ec  // b.any
   0x0000fffff7f8457c:	b940926d	ldr	w13, [x19, #144]
   0x0000fffff7f84580:	f9404e6c	ldr	x12, [x19, #152]
   0x0000fffff7f84584:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84588:	36d801d1	tbz	w17, #27, 0xfffff7f845c0
   0x0000fffff7f8458c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84590:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84594:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84598:	540002a1	b.ne	0xfffff7f845ec  // b.any
   0x0000fffff7f8459c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f845a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f845a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f845a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f845ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f845b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f845b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f845b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f845bc:	54000189	b.ls	0xfffff7f845ec  // b.plast
   0x0000fffff7f845c0:	36d8008d	tbz	w13, #27, 0xfffff7f845d0
   0x0000fffff7f845c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f845c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f845cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f845d0:	36d80091	tbz	w17, #27, 0xfffff7f845e0
   0x0000fffff7f845d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f845d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f845dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f845e0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f845e4:	b900016d	str	w13, [x11]
   0x0000fffff7f845e8:	1400000e	b	0xfffff7f84620
   0x0000fffff7f845ec:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f845f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f845f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f845f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f845fc:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f84600:	aa1403e4	mov	x4, x20
   0x0000fffff7f84604:	aa1603e5	mov	x5, x22
   0x0000fffff7f84608:	d29bc410	mov	x16, #0xde20                	// #56864
   0x0000fffff7f8460c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84610:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84614:	d63f0200	blr	x16
   0x0000fffff7f84618:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8461c:	5400b1c0	b.eq	0xfffff7f85c54  // b.none
   0x0000fffff7f84620:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84624:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84628:	540005a0	b.eq	0xfffff7f846dc  // b.none
   0x0000fffff7f8462c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84630:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f84634:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84638:	54000521	b.ne	0xfffff7f846dc  // b.any
   0x0000fffff7f8463c:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84640:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f84644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84648:	540004a1	b.ne	0xfffff7f846dc  // b.any
   0x0000fffff7f8464c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84650:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84654:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84658:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8465c:	54000400	b.eq	0xfffff7f846dc  // b.none
   0x0000fffff7f84660:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84664:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84668:	36d801d1	tbz	w17, #27, 0xfffff7f846a0
   0x0000fffff7f8466c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84670:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84674:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84678:	54000321	b.ne	0xfffff7f846dc  // b.any
   0x0000fffff7f8467c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84680:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84684:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84688:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8468c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84690:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84694:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84698:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8469c:	54000209	b.ls	0xfffff7f846dc  // b.plast
   0x0000fffff7f846a0:	36d8008d	tbz	w13, #27, 0xfffff7f846b0
   0x0000fffff7f846a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f846a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f846ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f846b0:	36d80091	tbz	w17, #27, 0xfffff7f846c0
   0x0000fffff7f846b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f846b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f846bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f846c0:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f846c4:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f846c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f846cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f846d0:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f846d4:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f846d8:	1400000e	b	0xfffff7f84710
   0x0000fffff7f846dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f846e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f846e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f846e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f846ec:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f846f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f846f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f846f8:	d2947010	mov	x16, #0xa380                	// #41856
   0x0000fffff7f846fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84700:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84704:	d63f0200	blr	x16
   0x0000fffff7f84708:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8470c:	5400aa80	b.eq	0xfffff7f85c5c  // b.none
   0x0000fffff7f84710:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f84714:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84718:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f8471c:	b9409271	ldr	w17, [x19, #144]
   0x0000fffff7f84720:	36d80211	tbz	w17, #27, 0xfffff7f84760
   0x0000fffff7f84724:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84728:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8472c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84730:	540001e1	b.ne	0xfffff7f8476c  // b.any
   0x0000fffff7f84734:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f84738:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8473c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84740:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84744:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84748:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8474c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84750:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84754:	540000c9	b.ls	0xfffff7f8476c  // b.plast
   0x0000fffff7f84758:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8475c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84760:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84764:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f84768:	1400000e	b	0xfffff7f847a0
   0x0000fffff7f8476c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84770:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84774:	aa1303e1	mov	x1, x19
   0x0000fffff7f84778:	aa1503e2	mov	x2, x21
   0x0000fffff7f8477c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f84780:	aa1403e4	mov	x4, x20
   0x0000fffff7f84784:	aa1603e5	mov	x5, x22
   0x0000fffff7f84788:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f8478c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84790:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84794:	d63f0200	blr	x16
   0x0000fffff7f84798:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8479c:	5400a640	b.eq	0xfffff7f85c64  // b.none
   0x0000fffff7f847a0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f847a4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f847a8:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f847ac:	b940a271	ldr	w17, [x19, #160]
   0x0000fffff7f847b0:	36d80211	tbz	w17, #27, 0xfffff7f847f0
   0x0000fffff7f847b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f847b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f847bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f847c0:	540001e1	b.ne	0xfffff7f847fc  // b.any
   0x0000fffff7f847c4:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f847c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f847cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f847d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f847d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f847d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f847dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f847e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f847e4:	540000c9	b.ls	0xfffff7f847fc  // b.plast
   0x0000fffff7f847e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f847ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f847f0:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f847f4:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f847f8:	1400000e	b	0xfffff7f84830
   0x0000fffff7f847fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84800:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84804:	aa1303e1	mov	x1, x19
   0x0000fffff7f84808:	aa1503e2	mov	x2, x21
   0x0000fffff7f8480c:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f84810:	aa1403e4	mov	x4, x20
   0x0000fffff7f84814:	aa1603e5	mov	x5, x22
   0x0000fffff7f84818:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f8481c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84820:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84824:	d63f0200	blr	x16
   0x0000fffff7f84828:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8482c:	5400a200	b.eq	0xfffff7f85c6c  // b.none
   0x0000fffff7f84830:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84834:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84838:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f8483c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84840:	540001c1	b.ne	0xfffff7f84878  // b.any
   0x0000fffff7f84844:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84848:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8484c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84850:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84854:	54000801	b.ne	0xfffff7f84954  // b.any
   0x0000fffff7f84858:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f8485c:	f9403e6b	ldr	x11, [x19, #120]
   0x0000fffff7f84860:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84864:	eb09015f	cmp	x10, x9
   0x0000fffff7f84868:	54000762	b.cs	0xfffff7f84954  // b.hs, b.nlast
   0x0000fffff7f8486c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84870:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84874:	14000014	b	0xfffff7f848c4
   0x0000fffff7f84878:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f8487c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84880:	540006a0	b.eq	0xfffff7f84954  // b.none
   0x0000fffff7f84884:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84888:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f8488c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84890:	54000621	b.ne	0xfffff7f84954  // b.any
   0x0000fffff7f84894:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f84898:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f8489c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848a0:	540005a1	b.ne	0xfffff7f84954  // b.any
   0x0000fffff7f848a4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f848a8:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f848ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848b0:	54000521	b.ne	0xfffff7f84954  // b.any
   0x0000fffff7f848b4:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f848b8:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f848bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848c0:	540004a1	b.ne	0xfffff7f84954  // b.any
   0x0000fffff7f848c4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f848c8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f848cc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f848d0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f848d4:	54000400	b.eq	0xfffff7f84954  // b.none
   0x0000fffff7f848d8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f848dc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f848e0:	36d801d1	tbz	w17, #27, 0xfffff7f84918
   0x0000fffff7f848e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f848e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f848ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7f848f0:	54000321	b.ne	0xfffff7f84954  // b.any
   0x0000fffff7f848f4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f848f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f848fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84900:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84904:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84908:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8490c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84910:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84914:	54000209	b.ls	0xfffff7f84954  // b.plast
   0x0000fffff7f84918:	36d8008d	tbz	w13, #27, 0xfffff7f84928
   0x0000fffff7f8491c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84920:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84924:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84928:	36d80091	tbz	w17, #27, 0xfffff7f84938
   0x0000fffff7f8492c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84930:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84934:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84938:	b940a26e	ldr	w14, [x19, #160]
   0x0000fffff7f8493c:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f84940:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84944:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84948:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f8494c:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f84950:	1400000e	b	0xfffff7f84988
   0x0000fffff7f84954:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f84958:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8495c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84960:	aa1503e2	mov	x2, x21
   0x0000fffff7f84964:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f84968:	aa1403e4	mov	x4, x20
   0x0000fffff7f8496c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84970:	d28b5c10	mov	x16, #0x5ae0                	// #23264
   0x0000fffff7f84974:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84978:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8497c:	d63f0200	blr	x16
   0x0000fffff7f84980:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84984:	54009780	b.eq	0xfffff7f85c74  // b.none
   0x0000fffff7f84988:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f8498c:	37d806a9	tbnz	w9, #27, 0xfffff7f84a60
   0x0000fffff7f84990:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8499c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849a0:	540001c1	b.ne	0xfffff7f849d8  // b.any
   0x0000fffff7f849a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f849a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849b4:	54000121	b.ne	0xfffff7f849d8  // b.any
   0x0000fffff7f849b8:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f849bc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f849c0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f849c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849cc:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f849d0:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f849d4:	14000030	b	0xfffff7f84a94
   0x0000fffff7f849d8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f849dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f849e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849e8:	54000120	b.eq	0xfffff7f84a0c  // b.none
   0x0000fffff7f849ec:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f849f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849fc:	54000321	b.ne	0xfffff7f84a60  // b.any
   0x0000fffff7f84a00:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84a04:	9e620120	scvtf	d0, x9
   0x0000fffff7f84a08:	14000002	b	0xfffff7f84a10
   0x0000fffff7f84a0c:	fd405660	ldr	d0, [x19, #168]
   0x0000fffff7f84a10:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84a18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a20:	54000120	b.eq	0xfffff7f84a44  // b.none
   0x0000fffff7f84a24:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a34:	54000161	b.ne	0xfffff7f84a60  // b.any
   0x0000fffff7f84a38:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84a3c:	9e620121	scvtf	d1, x9
   0x0000fffff7f84a40:	14000002	b	0xfffff7f84a48
   0x0000fffff7f84a44:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84a48:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84a4c:	fd005660	str	d0, [x19, #168]
   0x0000fffff7f84a50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84a54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a58:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84a5c:	17ffffde	b	0xfffff7f849d4
   0x0000fffff7f84a60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84a64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84a68:	aa1303e1	mov	x1, x19
   0x0000fffff7f84a6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84a70:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f84a74:	aa1403e4	mov	x4, x20
   0x0000fffff7f84a78:	aa1603e5	mov	x5, x22
   0x0000fffff7f84a7c:	d295d290	mov	x16, #0xae94                	// #44692
   0x0000fffff7f84a80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84a84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84a88:	d63f0200	blr	x16
   0x0000fffff7f84a8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84a90:	54008f60	b.eq	0xfffff7f85c7c  // b.none
   0x0000fffff7f84a94:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f84a98:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84a9c:	d2807cac	mov	x12, #0x3e5                 	// #997
   0x0000fffff7f84aa0:	b940b271	ldr	w17, [x19, #176]
   0x0000fffff7f84aa4:	36d80211	tbz	w17, #27, 0xfffff7f84ae4
   0x0000fffff7f84aa8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84aac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84ab0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84ab4:	540001e1	b.ne	0xfffff7f84af0  // b.any
   0x0000fffff7f84ab8:	f9405e6f	ldr	x15, [x19, #184]
   0x0000fffff7f84abc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84ac0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84ac4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84ac8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84acc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84ad0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84ad4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84ad8:	540000c9	b.ls	0xfffff7f84af0  // b.plast
   0x0000fffff7f84adc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84ae0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84ae4:	f9005e6c	str	x12, [x19, #184]
   0x0000fffff7f84ae8:	b900b26d	str	w13, [x19, #176]
   0x0000fffff7f84aec:	1400000e	b	0xfffff7f84b24
   0x0000fffff7f84af0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84af4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84af8:	aa1303e1	mov	x1, x19
   0x0000fffff7f84afc:	aa1503e2	mov	x2, x21
   0x0000fffff7f84b00:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f84b04:	aa1403e4	mov	x4, x20
   0x0000fffff7f84b08:	aa1603e5	mov	x5, x22
   0x0000fffff7f84b0c:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f84b10:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84b14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84b18:	d63f0200	blr	x16
   0x0000fffff7f84b1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84b20:	54008b20	b.eq	0xfffff7f85c84  // b.none
   0x0000fffff7f84b24:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84b28:	37d80389	tbnz	w9, #27, 0xfffff7f84b98
   0x0000fffff7f84b2c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84b30:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b3c:	540002e1	b.ne	0xfffff7f84b98  // b.any
   0x0000fffff7f84b40:	b940b269	ldr	w9, [x19, #176]
   0x0000fffff7f84b44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b50:	54000241	b.ne	0xfffff7f84b98  // b.any
   0x0000fffff7f84b54:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84b58:	f9405e6a	ldr	x10, [x19, #184]
   0x0000fffff7f84b5c:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84b60:	540001c0	b.eq	0xfffff7f84b98  // b.none
   0x0000fffff7f84b64:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84b68:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84b6c:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84b70:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84b74:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84b78:	54000100	b.eq	0xfffff7f84b98  // b.none
   0x0000fffff7f84b7c:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84b80:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84b84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b8c:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f84b90:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84b94:	1400000e	b	0xfffff7f84bcc
   0x0000fffff7f84b98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84b9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84ba0:	aa1303e1	mov	x1, x19
   0x0000fffff7f84ba4:	aa1503e2	mov	x2, x21
   0x0000fffff7f84ba8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f84bac:	aa1403e4	mov	x4, x20
   0x0000fffff7f84bb0:	aa1603e5	mov	x5, x22
   0x0000fffff7f84bb4:	d294a410	mov	x16, #0xa520                	// #42272
   0x0000fffff7f84bb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84bbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84bc0:	d63f0200	blr	x16
   0x0000fffff7f84bc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84bc8:	54008620	b.eq	0xfffff7f85c8c  // b.none
   0x0000fffff7f84bcc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84bd0:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84bd4:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84bd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bdc:	540001c1	b.ne	0xfffff7f84c14  // b.any
   0x0000fffff7f84be0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84be4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84be8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84bec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bf0:	54000701	b.ne	0xfffff7f84cd0  // b.any
   0x0000fffff7f84bf4:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84bf8:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f84bfc:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84c00:	eb09015f	cmp	x10, x9
   0x0000fffff7f84c04:	54000662	b.cs	0xfffff7f84cd0  // b.hs, b.nlast
   0x0000fffff7f84c08:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84c0c:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84c10:	14000014	b	0xfffff7f84c60
   0x0000fffff7f84c14:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84c18:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84c1c:	540005a0	b.eq	0xfffff7f84cd0  // b.none
   0x0000fffff7f84c20:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84c24:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84c28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c2c:	54000521	b.ne	0xfffff7f84cd0  // b.any
   0x0000fffff7f84c30:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f84c34:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84c38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c3c:	540004a1	b.ne	0xfffff7f84cd0  // b.any
   0x0000fffff7f84c40:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84c44:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f84c48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c4c:	54000421	b.ne	0xfffff7f84cd0  // b.any
   0x0000fffff7f84c50:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84c54:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f84c58:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c5c:	540003a1	b.ne	0xfffff7f84cd0  // b.any
   0x0000fffff7f84c60:	b940a26d	ldr	w13, [x19, #160]
   0x0000fffff7f84c64:	f940566c	ldr	x12, [x19, #168]
   0x0000fffff7f84c68:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84c6c:	36d801d1	tbz	w17, #27, 0xfffff7f84ca4
   0x0000fffff7f84c70:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84c74:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84c78:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84c7c:	540002a1	b.ne	0xfffff7f84cd0  // b.any
   0x0000fffff7f84c80:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84c84:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84c88:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84c8c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84c90:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84c94:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84c98:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84c9c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84ca0:	54000189	b.ls	0xfffff7f84cd0  // b.plast
   0x0000fffff7f84ca4:	36d8008d	tbz	w13, #27, 0xfffff7f84cb4
   0x0000fffff7f84ca8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84cac:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84cb0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84cb4:	36d80091	tbz	w17, #27, 0xfffff7f84cc4
   0x0000fffff7f84cb8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84cbc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84cc0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84cc4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84cc8:	b900016d	str	w13, [x11]
   0x0000fffff7f84ccc:	1400000e	b	0xfffff7f84d04
   0x0000fffff7f84cd0:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84cd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84cd8:	aa1303e1	mov	x1, x19
   0x0000fffff7f84cdc:	aa1503e2	mov	x2, x21
   0x0000fffff7f84ce0:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f84ce4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ce8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84cec:	d28dc410	mov	x16, #0x6e20                	// #28192
   0x0000fffff7f84cf0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84cf4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84cf8:	d63f0200	blr	x16
   0x0000fffff7f84cfc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84d00:	54007ca0	b.eq	0xfffff7f85c94  // b.none
   0x0000fffff7f84d04:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f84d08:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f84d0c:	d29a940c	mov	x12, #0xd4a0                	// #54432
   0x0000fffff7f84d10:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84d14:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f84d18:	b9408271	ldr	w17, [x19, #128]
   0x0000fffff7f84d1c:	36d801d1	tbz	w17, #27, 0xfffff7f84d54
   0x0000fffff7f84d20:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84d24:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84d28:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84d2c:	54000281	b.ne	0xfffff7f84d7c  // b.any
   0x0000fffff7f84d30:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f84d34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d38:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84d3c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84d40:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84d44:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84d48:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84d4c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84d50:	54000169	b.ls	0xfffff7f84d7c  // b.plast
   0x0000fffff7f84d54:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84d58:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84d5c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84d60:	36d80091	tbz	w17, #27, 0xfffff7f84d70
   0x0000fffff7f84d64:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d68:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84d6c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84d70:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84d74:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f84d78:	1400000e	b	0xfffff7f84db0
   0x0000fffff7f84d7c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84d80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84d84:	aa1303e1	mov	x1, x19
   0x0000fffff7f84d88:	aa1503e2	mov	x2, x21
   0x0000fffff7f84d8c:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f84d90:	aa1403e4	mov	x4, x20
   0x0000fffff7f84d94:	aa1603e5	mov	x5, x22
   0x0000fffff7f84d98:	d2961c90	mov	x16, #0xb0e4                	// #45284
   0x0000fffff7f84d9c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84da0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84da4:	d63f0200	blr	x16
   0x0000fffff7f84da8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84dac:	54007780	b.eq	0xfffff7f85c9c  // b.none
   0x0000fffff7f84db0:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7f84db4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84db8:	540004a0	b.eq	0xfffff7f84e4c  // b.none
   0x0000fffff7f84dbc:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84dc0:	b94093ea	ldr	w10, [sp, #144]
   0x0000fffff7f84dc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84dc8:	54000421	b.ne	0xfffff7f84e4c  // b.any
   0x0000fffff7f84dcc:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84dd0:	f9404fea	ldr	x10, [sp, #152]
   0x0000fffff7f84dd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84dd8:	540003a1	b.ne	0xfffff7f84e4c  // b.any
   0x0000fffff7f84ddc:	b940626d	ldr	w13, [x19, #96]
   0x0000fffff7f84de0:	f940366c	ldr	x12, [x19, #104]
   0x0000fffff7f84de4:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84de8:	36d801d1	tbz	w17, #27, 0xfffff7f84e20
   0x0000fffff7f84dec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84df0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84df4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84df8:	540002a1	b.ne	0xfffff7f84e4c  // b.any
   0x0000fffff7f84dfc:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84e00:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84e04:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84e08:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84e0c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84e10:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84e14:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84e18:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84e1c:	54000189	b.ls	0xfffff7f84e4c  // b.plast
   0x0000fffff7f84e20:	36d8008d	tbz	w13, #27, 0xfffff7f84e30
   0x0000fffff7f84e24:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84e28:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84e2c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84e30:	36d80091	tbz	w17, #27, 0xfffff7f84e40
   0x0000fffff7f84e34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84e38:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84e3c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84e40:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84e44:	b900016d	str	w13, [x11]
   0x0000fffff7f84e48:	1400000e	b	0xfffff7f84e80
   0x0000fffff7f84e4c:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f84e50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84e54:	aa1303e1	mov	x1, x19
   0x0000fffff7f84e58:	aa1503e2	mov	x2, x21
   0x0000fffff7f84e5c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f84e60:	aa1403e4	mov	x4, x20
   0x0000fffff7f84e64:	aa1603e5	mov	x5, x22
   0x0000fffff7f84e68:	d29bc410	mov	x16, #0xde20                	// #56864
   0x0000fffff7f84e6c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84e70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84e74:	d63f0200	blr	x16
   0x0000fffff7f84e78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84e7c:	54007140	b.eq	0xfffff7f85ca4  // b.none
   0x0000fffff7f84e80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84e84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84e88:	aa1303e1	mov	x1, x19
   0x0000fffff7f84e8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84e90:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f84e94:	aa1403e4	mov	x4, x20
   0x0000fffff7f84e98:	aa1603e5	mov	x5, x22
   0x0000fffff7f84e9c:	d28a1c10	mov	x16, #0x50e0                	// #20704
   0x0000fffff7f84ea0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84ea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ea8:	d63f0200	blr	x16
   0x0000fffff7f84eac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84eb0:	54006fe0	b.eq	0xfffff7f85cac  // b.none
   0x0000fffff7f84eb4:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f84eb8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84ebc:	540005a0	b.eq	0xfffff7f84f70  // b.none
   0x0000fffff7f84ec0:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84ec4:	b940b3ea	ldr	w10, [sp, #176]
   0x0000fffff7f84ec8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84ecc:	54000521	b.ne	0xfffff7f84f70  // b.any
   0x0000fffff7f84ed0:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84ed4:	f9405fea	ldr	x10, [sp, #184]
   0x0000fffff7f84ed8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84edc:	540004a1	b.ne	0xfffff7f84f70  // b.any
   0x0000fffff7f84ee0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84ee4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84ee8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84eec:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84ef0:	54000400	b.eq	0xfffff7f84f70  // b.none
   0x0000fffff7f84ef4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84ef8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84efc:	36d801d1	tbz	w17, #27, 0xfffff7f84f34
   0x0000fffff7f84f00:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84f04:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84f08:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84f0c:	54000321	b.ne	0xfffff7f84f70  // b.any
   0x0000fffff7f84f10:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84f14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84f18:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84f1c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84f20:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84f24:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84f28:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84f2c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84f30:	54000209	b.ls	0xfffff7f84f70  // b.plast
   0x0000fffff7f84f34:	36d8008d	tbz	w13, #27, 0xfffff7f84f44
   0x0000fffff7f84f38:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84f3c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84f40:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84f44:	36d80091	tbz	w17, #27, 0xfffff7f84f54
   0x0000fffff7f84f48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84f4c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84f50:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84f54:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f84f58:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f84f5c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84f60:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84f64:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84f68:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f84f6c:	1400000e	b	0xfffff7f84fa4
   0x0000fffff7f84f70:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f84f74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84f78:	aa1303e1	mov	x1, x19
   0x0000fffff7f84f7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84f80:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f84f84:	aa1403e4	mov	x4, x20
   0x0000fffff7f84f88:	aa1603e5	mov	x5, x22
   0x0000fffff7f84f8c:	d2939e10	mov	x16, #0x9cf0                	// #40176
   0x0000fffff7f84f90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84f94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84f98:	d63f0200	blr	x16
   0x0000fffff7f84f9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84fa0:	540068a0	b.eq	0xfffff7f85cb4  // b.none
   0x0000fffff7f84fa4:	5280008d	mov	w13, #0x4                   	// #4
   0x0000fffff7f84fa8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84fac:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f84fb0:	f2e7fa0c	movk	x12, #0x3fd0, lsl #48
   0x0000fffff7f84fb4:	b940a271	ldr	w17, [x19, #160]
   0x0000fffff7f84fb8:	36d80211	tbz	w17, #27, 0xfffff7f84ff8
   0x0000fffff7f84fbc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84fc0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84fc4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84fc8:	540001e1	b.ne	0xfffff7f85004  // b.any
   0x0000fffff7f84fcc:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f84fd0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84fd4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84fd8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84fdc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84fe0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84fe4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84fe8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84fec:	540000c9	b.ls	0xfffff7f85004  // b.plast
   0x0000fffff7f84ff0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84ff4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84ff8:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f84ffc:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f85000:	1400000e	b	0xfffff7f85038
   0x0000fffff7f85004:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85008:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8500c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85010:	aa1503e2	mov	x2, x21
   0x0000fffff7f85014:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f85018:	aa1403e4	mov	x4, x20
   0x0000fffff7f8501c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85020:	d2961c90	mov	x16, #0xb0e4                	// #45284
   0x0000fffff7f85024:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85028:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8502c:	d63f0200	blr	x16
   0x0000fffff7f85030:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85034:	54006440	b.eq	0xfffff7f85cbc  // b.none
   0x0000fffff7f85038:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8503c:	37d806a9	tbnz	w9, #27, 0xfffff7f85110
   0x0000fffff7f85040:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85044:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8504c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85050:	540001c1	b.ne	0xfffff7f85088  // b.any
   0x0000fffff7f85054:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f85058:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8505c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85060:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85064:	54000121	b.ne	0xfffff7f85088  // b.any
   0x0000fffff7f85068:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f8506c:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f85070:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85074:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8507c:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f85080:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f85084:	14000030	b	0xfffff7f85144
   0x0000fffff7f85088:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8508c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85090:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85094:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85098:	54000120	b.eq	0xfffff7f850bc  // b.none
   0x0000fffff7f8509c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f850a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f850a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850ac:	54000321	b.ne	0xfffff7f85110  // b.any
   0x0000fffff7f850b0:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f850b4:	9e620120	scvtf	d0, x9
   0x0000fffff7f850b8:	14000002	b	0xfffff7f850c0
   0x0000fffff7f850bc:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7f850c0:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f850c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f850c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850d0:	54000120	b.eq	0xfffff7f850f4  // b.none
   0x0000fffff7f850d4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f850d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f850dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850e4:	54000161	b.ne	0xfffff7f85110  // b.any
   0x0000fffff7f850e8:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f850ec:	9e620121	scvtf	d1, x9
   0x0000fffff7f850f0:	14000002	b	0xfffff7f850f8
   0x0000fffff7f850f4:	fd405661	ldr	d1, [x19, #168]
   0x0000fffff7f850f8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f850fc:	fd004e60	str	d0, [x19, #152]
   0x0000fffff7f85100:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85104:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85108:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f8510c:	17ffffde	b	0xfffff7f85084
   0x0000fffff7f85110:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85114:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85118:	aa1303e1	mov	x1, x19
   0x0000fffff7f8511c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85120:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f85124:	aa1403e4	mov	x4, x20
   0x0000fffff7f85128:	aa1603e5	mov	x5, x22
   0x0000fffff7f8512c:	d295d290	mov	x16, #0xae94                	// #44692
   0x0000fffff7f85130:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85134:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85138:	d63f0200	blr	x16
   0x0000fffff7f8513c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85140:	54005c20	b.eq	0xfffff7f85cc4  // b.none
   0x0000fffff7f85144:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f85148:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8514c:	540004a0	b.eq	0xfffff7f851e0  // b.none
   0x0000fffff7f85150:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85154:	b940b3ea	ldr	w10, [sp, #176]
   0x0000fffff7f85158:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8515c:	54000421	b.ne	0xfffff7f851e0  // b.any
   0x0000fffff7f85160:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85164:	f9405fea	ldr	x10, [sp, #184]
   0x0000fffff7f85168:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8516c:	540003a1	b.ne	0xfffff7f851e0  // b.any
   0x0000fffff7f85170:	b940926d	ldr	w13, [x19, #144]
   0x0000fffff7f85174:	f9404e6c	ldr	x12, [x19, #152]
   0x0000fffff7f85178:	b9400171	ldr	w17, [x11]
   0x0000fffff7f8517c:	36d801d1	tbz	w17, #27, 0xfffff7f851b4
   0x0000fffff7f85180:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85184:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85188:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8518c:	540002a1	b.ne	0xfffff7f851e0  // b.any
   0x0000fffff7f85190:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f85194:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85198:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8519c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f851a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f851a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f851a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f851ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7f851b0:	54000189	b.ls	0xfffff7f851e0  // b.plast
   0x0000fffff7f851b4:	36d8008d	tbz	w13, #27, 0xfffff7f851c4
   0x0000fffff7f851b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f851bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f851c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f851c4:	36d80091	tbz	w17, #27, 0xfffff7f851d4
   0x0000fffff7f851c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f851cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f851d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f851d4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f851d8:	b900016d	str	w13, [x11]
   0x0000fffff7f851dc:	1400000e	b	0xfffff7f85214
   0x0000fffff7f851e0:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f851e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f851e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f851ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f851f0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f851f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f851f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f851fc:	d29bc410	mov	x16, #0xde20                	// #56864
   0x0000fffff7f85200:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85208:	d63f0200	blr	x16
   0x0000fffff7f8520c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85210:	540055e0	b.eq	0xfffff7f85ccc  // b.none
   0x0000fffff7f85214:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f85218:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8521c:	540005a0	b.eq	0xfffff7f852d0  // b.none
   0x0000fffff7f85220:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85224:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f85228:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8522c:	54000521	b.ne	0xfffff7f852d0  // b.any
   0x0000fffff7f85230:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85234:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f85238:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8523c:	540004a1	b.ne	0xfffff7f852d0  // b.any
   0x0000fffff7f85240:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85244:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85248:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8524c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85250:	54000400	b.eq	0xfffff7f852d0  // b.none
   0x0000fffff7f85254:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85258:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8525c:	36d801d1	tbz	w17, #27, 0xfffff7f85294
   0x0000fffff7f85260:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85264:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85268:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8526c:	54000321	b.ne	0xfffff7f852d0  // b.any
   0x0000fffff7f85270:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85274:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85278:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8527c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85280:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85284:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85288:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8528c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85290:	54000209	b.ls	0xfffff7f852d0  // b.plast
   0x0000fffff7f85294:	36d8008d	tbz	w13, #27, 0xfffff7f852a4
   0x0000fffff7f85298:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8529c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f852a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f852a4:	36d80091	tbz	w17, #27, 0xfffff7f852b4
   0x0000fffff7f852a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f852ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f852b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f852b4:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f852b8:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f852bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f852c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f852c4:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f852c8:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f852cc:	1400000e	b	0xfffff7f85304
   0x0000fffff7f852d0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f852d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f852d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f852dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f852e0:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f852e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f852e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f852ec:	d2947010	mov	x16, #0xa380                	// #41856
   0x0000fffff7f852f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f852f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f852f8:	d63f0200	blr	x16
   0x0000fffff7f852fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85300:	54004ea0	b.eq	0xfffff7f85cd4  // b.none
   0x0000fffff7f85304:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f85308:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8530c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f85310:	b9409271	ldr	w17, [x19, #144]
   0x0000fffff7f85314:	36d80211	tbz	w17, #27, 0xfffff7f85354
   0x0000fffff7f85318:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8531c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85320:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85324:	540001e1	b.ne	0xfffff7f85360  // b.any
   0x0000fffff7f85328:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f8532c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85330:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85334:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85338:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8533c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85340:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85344:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85348:	540000c9	b.ls	0xfffff7f85360  // b.plast
   0x0000fffff7f8534c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85350:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85354:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f85358:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f8535c:	1400000e	b	0xfffff7f85394
   0x0000fffff7f85360:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85364:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85368:	aa1303e1	mov	x1, x19
   0x0000fffff7f8536c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85370:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f85374:	aa1403e4	mov	x4, x20
   0x0000fffff7f85378:	aa1603e5	mov	x5, x22
   0x0000fffff7f8537c:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f85380:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85384:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85388:	d63f0200	blr	x16
   0x0000fffff7f8538c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85390:	54004a60	b.eq	0xfffff7f85cdc  // b.none
   0x0000fffff7f85394:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85398:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8539c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f853a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853a4:	540001c1	b.ne	0xfffff7f853dc  // b.any
   0x0000fffff7f853a8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f853ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f853b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853b8:	54000801	b.ne	0xfffff7f854b8  // b.any
   0x0000fffff7f853bc:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f853c0:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f853c4:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f853c8:	eb09015f	cmp	x10, x9
   0x0000fffff7f853cc:	54000762	b.cs	0xfffff7f854b8  // b.hs, b.nlast
   0x0000fffff7f853d0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f853d4:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f853d8:	14000014	b	0xfffff7f85428
   0x0000fffff7f853dc:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f853e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f853e4:	540006a0	b.eq	0xfffff7f854b8  // b.none
   0x0000fffff7f853e8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f853ec:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f853f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853f4:	54000621	b.ne	0xfffff7f854b8  // b.any
   0x0000fffff7f853f8:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f853fc:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f85400:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85404:	540005a1	b.ne	0xfffff7f854b8  // b.any
   0x0000fffff7f85408:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8540c:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f85410:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85414:	54000521	b.ne	0xfffff7f854b8  // b.any
   0x0000fffff7f85418:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f8541c:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f85420:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85424:	540004a1	b.ne	0xfffff7f854b8  // b.any
   0x0000fffff7f85428:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8542c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85430:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85434:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85438:	54000400	b.eq	0xfffff7f854b8  // b.none
   0x0000fffff7f8543c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85440:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85444:	36d801d1	tbz	w17, #27, 0xfffff7f8547c
   0x0000fffff7f85448:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8544c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85450:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85454:	54000321	b.ne	0xfffff7f854b8  // b.any
   0x0000fffff7f85458:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8545c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85460:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85464:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85468:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8546c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85470:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85474:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85478:	54000209	b.ls	0xfffff7f854b8  // b.plast
   0x0000fffff7f8547c:	36d8008d	tbz	w13, #27, 0xfffff7f8548c
   0x0000fffff7f85480:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85484:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85488:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8548c:	36d80091	tbz	w17, #27, 0xfffff7f8549c
   0x0000fffff7f85490:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85494:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85498:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8549c:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f854a0:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f854a4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f854a8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f854ac:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f854b0:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f854b4:	1400000e	b	0xfffff7f854ec
   0x0000fffff7f854b8:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f854bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f854c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f854c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f854c8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f854cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f854d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f854d4:	d28b5c10	mov	x16, #0x5ae0                	// #23264
   0x0000fffff7f854d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f854dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854e0:	d63f0200	blr	x16
   0x0000fffff7f854e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f854e8:	54003fe0	b.eq	0xfffff7f85ce4  // b.none
   0x0000fffff7f854ec:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7f854f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f854f4:	540005a0	b.eq	0xfffff7f855a8  // b.none
   0x0000fffff7f854f8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f854fc:	b94093ea	ldr	w10, [sp, #144]
   0x0000fffff7f85500:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85504:	54000521	b.ne	0xfffff7f855a8  // b.any
   0x0000fffff7f85508:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f8550c:	f9404fea	ldr	x10, [sp, #152]
   0x0000fffff7f85510:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85514:	540004a1	b.ne	0xfffff7f855a8  // b.any
   0x0000fffff7f85518:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8551c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85520:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85524:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85528:	54000400	b.eq	0xfffff7f855a8  // b.none
   0x0000fffff7f8552c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85530:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85534:	36d801d1	tbz	w17, #27, 0xfffff7f8556c
   0x0000fffff7f85538:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8553c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85540:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85544:	54000321	b.ne	0xfffff7f855a8  // b.any
   0x0000fffff7f85548:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8554c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85550:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85554:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85558:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8555c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85560:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85564:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85568:	54000209	b.ls	0xfffff7f855a8  // b.plast
   0x0000fffff7f8556c:	36d8008d	tbz	w13, #27, 0xfffff7f8557c
   0x0000fffff7f85570:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85574:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85578:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8557c:	36d80091	tbz	w17, #27, 0xfffff7f8558c
   0x0000fffff7f85580:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85584:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85588:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8558c:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f85590:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f85594:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85598:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8559c:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f855a0:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f855a4:	1400000e	b	0xfffff7f855dc
   0x0000fffff7f855a8:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f855ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f855b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f855b8:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f855bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f855c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f855c4:	d2947010	mov	x16, #0xa380                	// #41856
   0x0000fffff7f855c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f855cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f855d0:	d63f0200	blr	x16
   0x0000fffff7f855d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f855d8:	540038a0	b.eq	0xfffff7f85cec  // b.none
   0x0000fffff7f855dc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f855e0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f855e4:	d280022c	mov	x12, #0x11                  	// #17
   0x0000fffff7f855e8:	b940a271	ldr	w17, [x19, #160]
   0x0000fffff7f855ec:	36d80211	tbz	w17, #27, 0xfffff7f8562c
   0x0000fffff7f855f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f855f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f855f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f855fc:	540001e1	b.ne	0xfffff7f85638  // b.any
   0x0000fffff7f85600:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f85604:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85608:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8560c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85610:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85614:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85618:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8561c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85620:	540000c9	b.ls	0xfffff7f85638  // b.plast
   0x0000fffff7f85624:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85628:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8562c:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f85630:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f85634:	1400000e	b	0xfffff7f8566c
   0x0000fffff7f85638:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8563c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85640:	aa1303e1	mov	x1, x19
   0x0000fffff7f85644:	aa1503e2	mov	x2, x21
   0x0000fffff7f85648:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f8564c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85650:	aa1603e5	mov	x5, x22
   0x0000fffff7f85654:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f85658:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8565c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85660:	d63f0200	blr	x16
   0x0000fffff7f85664:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85668:	54003460	b.eq	0xfffff7f85cf4  // b.none
   0x0000fffff7f8566c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85670:	37d80389	tbnz	w9, #27, 0xfffff7f856e0
   0x0000fffff7f85674:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85678:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8567c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85680:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85684:	540002e1	b.ne	0xfffff7f856e0  // b.any
   0x0000fffff7f85688:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f8568c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85694:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85698:	54000241	b.ne	0xfffff7f856e0  // b.any
   0x0000fffff7f8569c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f856a0:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f856a4:	f100015f	cmp	x10, #0x0
   0x0000fffff7f856a8:	540001c0	b.eq	0xfffff7f856e0  // b.none
   0x0000fffff7f856ac:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f856b0:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f856b4:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f856b8:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f856bc:	eb0b015f	cmp	x10, x11
   0x0000fffff7f856c0:	54000100	b.eq	0xfffff7f856e0  // b.none
   0x0000fffff7f856c4:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f856c8:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f856cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f856d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856d4:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f856d8:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f856dc:	1400000e	b	0xfffff7f85714
   0x0000fffff7f856e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f856e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f856e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f856ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f856f0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f856f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f856f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f856fc:	d294a410	mov	x16, #0xa520                	// #42272
   0x0000fffff7f85700:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85704:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85708:	d63f0200	blr	x16
   0x0000fffff7f8570c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85710:	54002f60	b.eq	0xfffff7f85cfc  // b.none
   0x0000fffff7f85714:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85718:	37d806a9	tbnz	w9, #27, 0xfffff7f857ec
   0x0000fffff7f8571c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85720:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85724:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85728:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8572c:	540001c1	b.ne	0xfffff7f85764  // b.any
   0x0000fffff7f85730:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85734:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85738:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8573c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85740:	54000121	b.ne	0xfffff7f85764  // b.any
   0x0000fffff7f85744:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85748:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f8574c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85750:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85754:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85758:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f8575c:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f85760:	14000030	b	0xfffff7f85820
   0x0000fffff7f85764:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85768:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8576c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85770:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85774:	54000120	b.eq	0xfffff7f85798  // b.none
   0x0000fffff7f85778:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f8577c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85780:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85784:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85788:	54000321	b.ne	0xfffff7f857ec  // b.any
   0x0000fffff7f8578c:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85790:	9e620120	scvtf	d0, x9
   0x0000fffff7f85794:	14000002	b	0xfffff7f8579c
   0x0000fffff7f85798:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f8579c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f857a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f857a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857ac:	54000120	b.eq	0xfffff7f857d0  // b.none
   0x0000fffff7f857b0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f857b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857c0:	54000161	b.ne	0xfffff7f857ec  // b.any
   0x0000fffff7f857c4:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f857c8:	9e620121	scvtf	d1, x9
   0x0000fffff7f857cc:	14000002	b	0xfffff7f857d4
   0x0000fffff7f857d0:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f857d4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f857d8:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f857dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f857e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857e4:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f857e8:	17ffffde	b	0xfffff7f85760
   0x0000fffff7f857ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f857f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f857f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f857f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f857fc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f85800:	aa1403e4	mov	x4, x20
   0x0000fffff7f85804:	aa1603e5	mov	x5, x22
   0x0000fffff7f85808:	d295d290	mov	x16, #0xae94                	// #44692
   0x0000fffff7f8580c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85810:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85814:	d63f0200	blr	x16
   0x0000fffff7f85818:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8581c:	54002740	b.eq	0xfffff7f85d04  // b.none
   0x0000fffff7f85820:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f85824:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85828:	540005a0	b.eq	0xfffff7f858dc  // b.none
   0x0000fffff7f8582c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f85830:	b940b3ea	ldr	w10, [sp, #176]
   0x0000fffff7f85834:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85838:	54000521	b.ne	0xfffff7f858dc  // b.any
   0x0000fffff7f8583c:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f85840:	f9405fea	ldr	x10, [sp, #184]
   0x0000fffff7f85844:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85848:	540004a1	b.ne	0xfffff7f858dc  // b.any
   0x0000fffff7f8584c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85850:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85854:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85858:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8585c:	54000400	b.eq	0xfffff7f858dc  // b.none
   0x0000fffff7f85860:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85864:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85868:	36d801d1	tbz	w17, #27, 0xfffff7f858a0
   0x0000fffff7f8586c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85870:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85874:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85878:	54000321	b.ne	0xfffff7f858dc  // b.any
   0x0000fffff7f8587c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85880:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85884:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85888:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8588c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85890:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85894:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85898:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8589c:	54000209	b.ls	0xfffff7f858dc  // b.plast
   0x0000fffff7f858a0:	36d8008d	tbz	w13, #27, 0xfffff7f858b0
   0x0000fffff7f858a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f858a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f858ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f858b0:	36d80091	tbz	w17, #27, 0xfffff7f858c0
   0x0000fffff7f858b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f858b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f858bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f858c0:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f858c4:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f858c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f858cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f858d0:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f858d4:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f858d8:	1400000e	b	0xfffff7f85910
   0x0000fffff7f858dc:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f858e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f858e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f858e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f858ec:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f858f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f858f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f858f8:	d2947010	mov	x16, #0xa380                	// #41856
   0x0000fffff7f858fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85900:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85904:	d63f0200	blr	x16
   0x0000fffff7f85908:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8590c:	54002000	b.eq	0xfffff7f85d0c  // b.none
   0x0000fffff7f85910:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85914:	37d806a9	tbnz	w9, #27, 0xfffff7f859e8
   0x0000fffff7f85918:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f8591c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85924:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85928:	540001c1	b.ne	0xfffff7f85960  // b.any
   0x0000fffff7f8592c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85930:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85938:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8593c:	54000121	b.ne	0xfffff7f85960  // b.any
   0x0000fffff7f85940:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85944:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f85948:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8594c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85954:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f85958:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f8595c:	14000030	b	0xfffff7f85a1c
   0x0000fffff7f85960:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85964:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8596c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85970:	54000120	b.eq	0xfffff7f85994  // b.none
   0x0000fffff7f85974:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85978:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8597c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85980:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85984:	54000321	b.ne	0xfffff7f859e8  // b.any
   0x0000fffff7f85988:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f8598c:	9e620120	scvtf	d0, x9
   0x0000fffff7f85990:	14000002	b	0xfffff7f85998
   0x0000fffff7f85994:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f85998:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8599c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f859a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859a8:	54000120	b.eq	0xfffff7f859cc  // b.none
   0x0000fffff7f859ac:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f859b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859bc:	54000161	b.ne	0xfffff7f859e8  // b.any
   0x0000fffff7f859c0:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f859c4:	9e620121	scvtf	d1, x9
   0x0000fffff7f859c8:	14000002	b	0xfffff7f859d0
   0x0000fffff7f859cc:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f859d0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f859d4:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f859d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f859dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859e0:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f859e4:	17ffffde	b	0xfffff7f8595c
   0x0000fffff7f859e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f859ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f859f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f859f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f859f8:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f859fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a00:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a04:	d295d290	mov	x16, #0xae94                	// #44692
   0x0000fffff7f85a08:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85a0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a10:	d63f0200	blr	x16
   0x0000fffff7f85a14:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a18:	540017e0	b.eq	0xfffff7f85d14  // b.none
   0x0000fffff7f85a1c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85a20:	37d806a9	tbnz	w9, #27, 0xfffff7f85af4
   0x0000fffff7f85a24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85a28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a34:	540001c1	b.ne	0xfffff7f85a6c  // b.any
   0x0000fffff7f85a38:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85a3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a48:	54000121	b.ne	0xfffff7f85a6c  // b.any
   0x0000fffff7f85a4c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85a50:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7f85a54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85a58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a60:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f85a64:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85a68:	14000030	b	0xfffff7f85b28
   0x0000fffff7f85a6c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85a70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a7c:	54000120	b.eq	0xfffff7f85aa0  // b.none
   0x0000fffff7f85a80:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85a84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a90:	54000321	b.ne	0xfffff7f85af4  // b.any
   0x0000fffff7f85a94:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85a98:	9e620120	scvtf	d0, x9
   0x0000fffff7f85a9c:	14000002	b	0xfffff7f85aa4
   0x0000fffff7f85aa0:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f85aa4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85aa8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ab4:	54000120	b.eq	0xfffff7f85ad8  // b.none
   0x0000fffff7f85ab8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ac8:	54000161	b.ne	0xfffff7f85af4  // b.any
   0x0000fffff7f85acc:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85ad0:	9e620121	scvtf	d1, x9
   0x0000fffff7f85ad4:	14000002	b	0xfffff7f85adc
   0x0000fffff7f85ad8:	fd404661	ldr	d1, [x19, #136]
   0x0000fffff7f85adc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85ae0:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f85ae4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85ae8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85aec:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85af0:	17ffffde	b	0xfffff7f85a68
   0x0000fffff7f85af4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85af8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85afc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b00:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b04:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f85b08:	aa1403e4	mov	x4, x20
   0x0000fffff7f85b0c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85b10:	d295d290	mov	x16, #0xae94                	// #44692
   0x0000fffff7f85b14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85b18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85b1c:	d63f0200	blr	x16
   0x0000fffff7f85b20:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85b24:	54000fc0	b.eq	0xfffff7f85d1c  // b.none
   0x0000fffff7f85b28:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85b2c:	37d80269	tbnz	w9, #27, 0xfffff7f85b78
   0x0000fffff7f85b30:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85b34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b40:	540001c1	b.ne	0xfffff7f85b78  // b.any
   0x0000fffff7f85b44:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85b48:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f85b4c:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f85b50:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f85b54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b5c:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f85b60:	aa0b03e9	mov	x9, x11
   0x0000fffff7f85b64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b6c:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85b70:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85b74:	1400000e	b	0xfffff7f85bac
   0x0000fffff7f85b78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85b7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85b80:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b84:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b88:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f85b8c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85b90:	aa1603e5	mov	x5, x22
   0x0000fffff7f85b94:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7f85b98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85b9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ba0:	d63f0200	blr	x16
   0x0000fffff7f85ba4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85ba8:	54000be0	b.eq	0xfffff7f85d24  // b.none
   0x0000fffff7f85bac:	17fff973	b	0xfffff7f84178
   0x0000fffff7f85bb0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85bb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85bb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f85bbc:	aa1503e2	mov	x2, x21
   0x0000fffff7f85bc0:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f85bc4:	aa1403e4	mov	x4, x20
   0x0000fffff7f85bc8:	aa1603e5	mov	x5, x22
   0x0000fffff7f85bcc:	d2895490	mov	x16, #0x4aa4                	// #19108
   0x0000fffff7f85bd0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85bd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85bd8:	d63f0200	blr	x16
   0x0000fffff7f85bdc:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85be0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85be4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85be8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85bec:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85bf0:	d65f03c0	ret
   0x0000fffff7f85bf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85bf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85bfc:	b900028a	str	w10, [x20]
   0x0000fffff7f85c00:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85c04:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85c08:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85c0c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85c10:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85c14:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85c18:	d65f03c0	ret
   0x0000fffff7f85c1c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85c20:	17fffff5	b	0xfffff7f85bf4
   0x0000fffff7f85c24:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85c28:	17fffff3	b	0xfffff7f85bf4
   0x0000fffff7f85c2c:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85c30:	17fffff1	b	0xfffff7f85bf4
   0x0000fffff7f85c34:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f85c38:	17ffffef	b	0xfffff7f85bf4
   0x0000fffff7f85c3c:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85c40:	17ffffed	b	0xfffff7f85bf4
   0x0000fffff7f85c44:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85c48:	17ffffeb	b	0xfffff7f85bf4
   0x0000fffff7f85c4c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85c50:	17ffffe9	b	0xfffff7f85bf4
   0x0000fffff7f85c54:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85c58:	17ffffe7	b	0xfffff7f85bf4
   0x0000fffff7f85c5c:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85c60:	17ffffe5	b	0xfffff7f85bf4
   0x0000fffff7f85c64:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85c68:	17ffffe3	b	0xfffff7f85bf4
   0x0000fffff7f85c6c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85c70:	17ffffe1	b	0xfffff7f85bf4
   0x0000fffff7f85c74:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85c78:	17ffffdf	b	0xfffff7f85bf4
   0x0000fffff7f85c7c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85c80:	17ffffdd	b	0xfffff7f85bf4
   0x0000fffff7f85c84:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85c88:	17ffffdb	b	0xfffff7f85bf4
   0x0000fffff7f85c8c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85c90:	17ffffd9	b	0xfffff7f85bf4
   0x0000fffff7f85c94:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f85c98:	17ffffd7	b	0xfffff7f85bf4
   0x0000fffff7f85c9c:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f85ca0:	17ffffd5	b	0xfffff7f85bf4
   0x0000fffff7f85ca4:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f85ca8:	17ffffd3	b	0xfffff7f85bf4
   0x0000fffff7f85cac:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f85cb0:	17ffffd1	b	0xfffff7f85bf4
   0x0000fffff7f85cb4:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f85cb8:	17ffffcf	b	0xfffff7f85bf4
   0x0000fffff7f85cbc:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f85cc0:	17ffffcd	b	0xfffff7f85bf4
   0x0000fffff7f85cc4:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f85cc8:	17ffffcb	b	0xfffff7f85bf4
   0x0000fffff7f85ccc:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f85cd0:	17ffffc9	b	0xfffff7f85bf4
   0x0000fffff7f85cd4:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f85cd8:	17ffffc7	b	0xfffff7f85bf4
   0x0000fffff7f85cdc:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f85ce0:	17ffffc5	b	0xfffff7f85bf4
   0x0000fffff7f85ce4:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f85ce8:	17ffffc3	b	0xfffff7f85bf4
   0x0000fffff7f85cec:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f85cf0:	17ffffc1	b	0xfffff7f85bf4
   0x0000fffff7f85cf4:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f85cf8:	17ffffbf	b	0xfffff7f85bf4
   0x0000fffff7f85cfc:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f85d00:	17ffffbd	b	0xfffff7f85bf4
   0x0000fffff7f85d04:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f85d08:	17ffffbb	b	0xfffff7f85bf4
   0x0000fffff7f85d0c:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f85d10:	17ffffb9	b	0xfffff7f85bf4
   0x0000fffff7f85d14:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f85d18:	17ffffb7	b	0xfffff7f85bf4
   0x0000fffff7f85d1c:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f85d20:	17ffffb5	b	0xfffff7f85bf4
   0x0000fffff7f85d24:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f85d28:	17ffffb3	b	0xfffff7f85bf4
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
