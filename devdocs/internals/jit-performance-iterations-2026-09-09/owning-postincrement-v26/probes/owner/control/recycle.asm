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
   0x0000fffff7f84038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8403c:	f2b55670	movk	x16, #0xaab3, lsl #16
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
   0x0000fffff7f840d0:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f840d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f840d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840dc:	d63f0200	blr	x16
   0x0000fffff7f840e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f840e4:	5400d460	b.eq	0xfffff7f85b70  // b.none
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
   0x0000fffff7f84160:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f84164:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84168:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8416c:	d63f0200	blr	x16
   0x0000fffff7f84170:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84174:	5400d020	b.eq	0xfffff7f85b78  // b.none
   0x0000fffff7f84178:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8417c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84184:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84188:	54000421	b.ne	0xfffff7f8420c  // b.any
   0x0000fffff7f8418c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f84190:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84194:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84198:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8419c:	54000381	b.ne	0xfffff7f8420c  // b.any
   0x0000fffff7f841a0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f841a4:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f841a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f841ac:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7f841b0:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7f841b4:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7f841b8:	91000580	add	x0, x12, #0x1
   0x0000fffff7f841bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f841c0:	36d80211	tbz	w17, #27, 0xfffff7f84200
   0x0000fffff7f841c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f841c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f841cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f841d0:	540001e1	b.ne	0xfffff7f8420c  // b.any
   0x0000fffff7f841d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f841d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f841dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f841e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f841e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f841e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f841ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f841f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f841f4:	540000c9	b.ls	0xfffff7f8420c  // b.plast
   0x0000fffff7f841f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f841fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84200:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7f84204:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7f84208:	1400000e	b	0xfffff7f84240
   0x0000fffff7f8420c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84210:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84214:	aa1303e1	mov	x1, x19
   0x0000fffff7f84218:	aa1503e2	mov	x2, x21
   0x0000fffff7f8421c:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f84220:	aa1403e4	mov	x4, x20
   0x0000fffff7f84224:	aa1603e5	mov	x5, x22
   0x0000fffff7f84228:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7f8422c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84230:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84234:	d63f0200	blr	x16
   0x0000fffff7f84238:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8423c:	5400ca20	b.eq	0xfffff7f85b80  // b.none
   0x0000fffff7f84240:	f100041f	cmp	x0, #0x1
   0x0000fffff7f84244:	5400c600	b.eq	0xfffff7f85b04  // b.none
   0x0000fffff7f84248:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f8424c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84250:	540004a0	b.eq	0xfffff7f842e4  // b.none
   0x0000fffff7f84254:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84258:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8425c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84260:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84264:	54000400	b.eq	0xfffff7f842e4  // b.none
   0x0000fffff7f84268:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8426c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84270:	36d801d1	tbz	w17, #27, 0xfffff7f842a8
   0x0000fffff7f84274:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84278:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8427c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84280:	54000321	b.ne	0xfffff7f842e4  // b.any
   0x0000fffff7f84284:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84288:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8428c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84290:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84294:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84298:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8429c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f842a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f842a4:	54000209	b.ls	0xfffff7f842e4  // b.plast
   0x0000fffff7f842a8:	36d8008d	tbz	w13, #27, 0xfffff7f842b8
   0x0000fffff7f842ac:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f842b0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f842b4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f842b8:	36d80091	tbz	w17, #27, 0xfffff7f842c8
   0x0000fffff7f842bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f842c0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f842c4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f842c8:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f842cc:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f842d0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f842d4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f842d8:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f842dc:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f842e0:	1400000e	b	0xfffff7f84318
   0x0000fffff7f842e4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f842e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f842ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f842f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f842f4:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f842f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f842fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f84300:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f84304:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84308:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8430c:	d63f0200	blr	x16
   0x0000fffff7f84310:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84314:	5400c3a0	b.eq	0xfffff7f85b88  // b.none
   0x0000fffff7f84318:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8431c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f84320:	d29a880c	mov	x12, #0xd440                	// #54336
   0x0000fffff7f84324:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84328:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8432c:	b9408271	ldr	w17, [x19, #128]
   0x0000fffff7f84330:	36d801d1	tbz	w17, #27, 0xfffff7f84368
   0x0000fffff7f84334:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84338:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8433c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84340:	54000281	b.ne	0xfffff7f84390  // b.any
   0x0000fffff7f84344:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f84348:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8434c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84350:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84354:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84358:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8435c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84360:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84364:	54000169	b.ls	0xfffff7f84390  // b.plast
   0x0000fffff7f84368:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8436c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84370:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84374:	36d80091	tbz	w17, #27, 0xfffff7f84384
   0x0000fffff7f84378:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8437c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84380:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84384:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84388:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f8438c:	1400000e	b	0xfffff7f843c4
   0x0000fffff7f84390:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84394:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84398:	aa1303e1	mov	x1, x19
   0x0000fffff7f8439c:	aa1503e2	mov	x2, x21
   0x0000fffff7f843a0:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f843a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f843a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f843ac:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f843b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f843b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843b8:	d63f0200	blr	x16
   0x0000fffff7f843bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843c0:	5400be80	b.eq	0xfffff7f85b90  // b.none
   0x0000fffff7f843c4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f843c8:	37d80389	tbnz	w9, #27, 0xfffff7f84438
   0x0000fffff7f843cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f843d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f843d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f843d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843dc:	540002e1	b.ne	0xfffff7f84438  // b.any
   0x0000fffff7f843e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f843e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f843e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f843ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843f0:	54000241	b.ne	0xfffff7f84438  // b.any
   0x0000fffff7f843f4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f843f8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f843fc:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84400:	540001c0	b.eq	0xfffff7f84438  // b.none
   0x0000fffff7f84404:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84408:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f8440c:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84410:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84414:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84418:	54000100	b.eq	0xfffff7f84438  // b.none
   0x0000fffff7f8441c:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84420:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84424:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84428:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8442c:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f84430:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f84434:	1400000e	b	0xfffff7f8446c
   0x0000fffff7f84438:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8443c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84440:	aa1303e1	mov	x1, x19
   0x0000fffff7f84444:	aa1503e2	mov	x2, x21
   0x0000fffff7f84448:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f8444c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84450:	aa1603e5	mov	x5, x22
   0x0000fffff7f84454:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f84458:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8445c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84460:	d63f0200	blr	x16
   0x0000fffff7f84464:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84468:	5400b980	b.eq	0xfffff7f85b98  // b.none
   0x0000fffff7f8446c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f84470:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84474:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84478:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8447c:	540001c1	b.ne	0xfffff7f844b4  // b.any
   0x0000fffff7f84480:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84484:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84488:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8448c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84490:	54000701	b.ne	0xfffff7f84570  // b.any
   0x0000fffff7f84494:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84498:	f940166b	ldr	x11, [x19, #40]
   0x0000fffff7f8449c:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f844a0:	eb09015f	cmp	x10, x9
   0x0000fffff7f844a4:	54000662	b.cs	0xfffff7f84570  // b.hs, b.nlast
   0x0000fffff7f844a8:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f844ac:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f844b0:	1400000c	b	0xfffff7f844e0
   0x0000fffff7f844b4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f844b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f844bc:	540005a0	b.eq	0xfffff7f84570  // b.none
   0x0000fffff7f844c0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f844c4:	b94037ea	ldr	w10, [sp, #52]
   0x0000fffff7f844c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844cc:	54000521	b.ne	0xfffff7f84570  // b.any
   0x0000fffff7f844d0:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f844d4:	f94023ea	ldr	x10, [sp, #64]
   0x0000fffff7f844d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844dc:	540004a1	b.ne	0xfffff7f84570  // b.any
   0x0000fffff7f844e0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f844e4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f844e8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f844ec:	eb0901bf	cmp	x13, x9
   0x0000fffff7f844f0:	54000400	b.eq	0xfffff7f84570  // b.none
   0x0000fffff7f844f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f844f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f844fc:	36d801d1	tbz	w17, #27, 0xfffff7f84534
   0x0000fffff7f84500:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84504:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84508:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8450c:	54000321	b.ne	0xfffff7f84570  // b.any
   0x0000fffff7f84510:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84514:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84518:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8451c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84520:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84524:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84528:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8452c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84530:	54000209	b.ls	0xfffff7f84570  // b.plast
   0x0000fffff7f84534:	36d8008d	tbz	w13, #27, 0xfffff7f84544
   0x0000fffff7f84538:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8453c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84540:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84544:	36d80091	tbz	w17, #27, 0xfffff7f84554
   0x0000fffff7f84548:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8454c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84550:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84554:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f84558:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f8455c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84560:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84564:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84568:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f8456c:	1400000e	b	0xfffff7f845a4
   0x0000fffff7f84570:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84574:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84578:	aa1303e1	mov	x1, x19
   0x0000fffff7f8457c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84580:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f84584:	aa1403e4	mov	x4, x20
   0x0000fffff7f84588:	aa1603e5	mov	x5, x22
   0x0000fffff7f8458c:	d28a0010	mov	x16, #0x5000                	// #20480
   0x0000fffff7f84590:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84594:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84598:	d63f0200	blr	x16
   0x0000fffff7f8459c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f845a0:	5400b000	b.eq	0xfffff7f85ba0  // b.none
   0x0000fffff7f845a4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f845a8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f845ac:	540003a0	b.eq	0xfffff7f84620  // b.none
   0x0000fffff7f845b0:	b940926d	ldr	w13, [x19, #144]
   0x0000fffff7f845b4:	f9404e6c	ldr	x12, [x19, #152]
   0x0000fffff7f845b8:	b9400171	ldr	w17, [x11]
   0x0000fffff7f845bc:	36d801d1	tbz	w17, #27, 0xfffff7f845f4
   0x0000fffff7f845c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f845c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f845c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f845cc:	540002a1	b.ne	0xfffff7f84620  // b.any
   0x0000fffff7f845d0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f845d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f845d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f845dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f845e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f845e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f845e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f845ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7f845f0:	54000189	b.ls	0xfffff7f84620  // b.plast
   0x0000fffff7f845f4:	36d8008d	tbz	w13, #27, 0xfffff7f84604
   0x0000fffff7f845f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f845fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84600:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84604:	36d80091	tbz	w17, #27, 0xfffff7f84614
   0x0000fffff7f84608:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8460c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84610:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84614:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84618:	b900016d	str	w13, [x11]
   0x0000fffff7f8461c:	1400000e	b	0xfffff7f84654
   0x0000fffff7f84620:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84624:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84628:	aa1303e1	mov	x1, x19
   0x0000fffff7f8462c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84630:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f84634:	aa1403e4	mov	x4, x20
   0x0000fffff7f84638:	aa1603e5	mov	x5, x22
   0x0000fffff7f8463c:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7f84640:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84644:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84648:	d63f0200	blr	x16
   0x0000fffff7f8464c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84650:	5400aac0	b.eq	0xfffff7f85ba8  // b.none
   0x0000fffff7f84654:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84658:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8465c:	540004a0	b.eq	0xfffff7f846f0  // b.none
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
   0x0000fffff7f846d4:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f846d8:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f846dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f846e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f846e4:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f846e8:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f846ec:	1400000e	b	0xfffff7f84724
   0x0000fffff7f846f0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f846f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f846f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f846fc:	aa1503e2	mov	x2, x21
   0x0000fffff7f84700:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f84704:	aa1403e4	mov	x4, x20
   0x0000fffff7f84708:	aa1603e5	mov	x5, x22
   0x0000fffff7f8470c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f84710:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84714:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84718:	d63f0200	blr	x16
   0x0000fffff7f8471c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84720:	5400a480	b.eq	0xfffff7f85bb0  // b.none
   0x0000fffff7f84724:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f84728:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8472c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f84730:	b9409271	ldr	w17, [x19, #144]
   0x0000fffff7f84734:	36d80211	tbz	w17, #27, 0xfffff7f84774
   0x0000fffff7f84738:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8473c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84740:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84744:	540001e1	b.ne	0xfffff7f84780  // b.any
   0x0000fffff7f84748:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f8474c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84750:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84754:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84758:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8475c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84760:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84764:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84768:	540000c9	b.ls	0xfffff7f84780  // b.plast
   0x0000fffff7f8476c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84770:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84774:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84778:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f8477c:	1400000e	b	0xfffff7f847b4
   0x0000fffff7f84780:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84784:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84788:	aa1303e1	mov	x1, x19
   0x0000fffff7f8478c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84790:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f84794:	aa1403e4	mov	x4, x20
   0x0000fffff7f84798:	aa1603e5	mov	x5, x22
   0x0000fffff7f8479c:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f847a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f847a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f847a8:	d63f0200	blr	x16
   0x0000fffff7f847ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f847b0:	5400a040	b.eq	0xfffff7f85bb8  // b.none
   0x0000fffff7f847b4:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f847b8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f847bc:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f847c0:	b940a271	ldr	w17, [x19, #160]
   0x0000fffff7f847c4:	36d80211	tbz	w17, #27, 0xfffff7f84804
   0x0000fffff7f847c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f847cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f847d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f847d4:	540001e1	b.ne	0xfffff7f84810  // b.any
   0x0000fffff7f847d8:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f847dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f847e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f847e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f847e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f847ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f847f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f847f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7f847f8:	540000c9	b.ls	0xfffff7f84810  // b.plast
   0x0000fffff7f847fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84800:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84804:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f84808:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f8480c:	1400000e	b	0xfffff7f84844
   0x0000fffff7f84810:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84818:	aa1303e1	mov	x1, x19
   0x0000fffff7f8481c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84820:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f84824:	aa1403e4	mov	x4, x20
   0x0000fffff7f84828:	aa1603e5	mov	x5, x22
   0x0000fffff7f8482c:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f84830:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84838:	d63f0200	blr	x16
   0x0000fffff7f8483c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84840:	54009c00	b.eq	0xfffff7f85bc0  // b.none
   0x0000fffff7f84844:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84848:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8484c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84850:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84854:	540001c1	b.ne	0xfffff7f8488c  // b.any
   0x0000fffff7f84858:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f8485c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84860:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84864:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84868:	54000801	b.ne	0xfffff7f84968  // b.any
   0x0000fffff7f8486c:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f84870:	f9403e6b	ldr	x11, [x19, #120]
   0x0000fffff7f84874:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84878:	eb09015f	cmp	x10, x9
   0x0000fffff7f8487c:	54000762	b.cs	0xfffff7f84968  // b.hs, b.nlast
   0x0000fffff7f84880:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84884:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84888:	14000014	b	0xfffff7f848d8
   0x0000fffff7f8488c:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f84890:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84894:	540006a0	b.eq	0xfffff7f84968  // b.none
   0x0000fffff7f84898:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f8489c:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f848a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848a4:	54000621	b.ne	0xfffff7f84968  // b.any
   0x0000fffff7f848a8:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f848ac:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f848b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848b4:	540005a1	b.ne	0xfffff7f84968  // b.any
   0x0000fffff7f848b8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f848bc:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f848c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848c4:	54000521	b.ne	0xfffff7f84968  // b.any
   0x0000fffff7f848c8:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f848cc:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f848d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848d4:	540004a1	b.ne	0xfffff7f84968  // b.any
   0x0000fffff7f848d8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f848dc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f848e0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f848e4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f848e8:	54000400	b.eq	0xfffff7f84968  // b.none
   0x0000fffff7f848ec:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f848f0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f848f4:	36d801d1	tbz	w17, #27, 0xfffff7f8492c
   0x0000fffff7f848f8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f848fc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84900:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84904:	54000321	b.ne	0xfffff7f84968  // b.any
   0x0000fffff7f84908:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8490c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84910:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84914:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84918:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8491c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84920:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84924:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84928:	54000209	b.ls	0xfffff7f84968  // b.plast
   0x0000fffff7f8492c:	36d8008d	tbz	w13, #27, 0xfffff7f8493c
   0x0000fffff7f84930:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84934:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84938:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8493c:	36d80091	tbz	w17, #27, 0xfffff7f8494c
   0x0000fffff7f84940:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84944:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84948:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8494c:	b940a26e	ldr	w14, [x19, #160]
   0x0000fffff7f84950:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f84954:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84958:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8495c:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f84960:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f84964:	1400000e	b	0xfffff7f8499c
   0x0000fffff7f84968:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f8496c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84970:	aa1303e1	mov	x1, x19
   0x0000fffff7f84974:	aa1503e2	mov	x2, x21
   0x0000fffff7f84978:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f8497c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84980:	aa1603e5	mov	x5, x22
   0x0000fffff7f84984:	d28a0010	mov	x16, #0x5000                	// #20480
   0x0000fffff7f84988:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8498c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84990:	d63f0200	blr	x16
   0x0000fffff7f84994:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84998:	54009180	b.eq	0xfffff7f85bc8  // b.none
   0x0000fffff7f8499c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f849a0:	37d806a9	tbnz	w9, #27, 0xfffff7f84a74
   0x0000fffff7f849a4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f849a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849b4:	540001c1	b.ne	0xfffff7f849ec  // b.any
   0x0000fffff7f849b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f849bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849c8:	54000121	b.ne	0xfffff7f849ec  // b.any
   0x0000fffff7f849cc:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f849d0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f849d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f849d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849e0:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f849e4:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f849e8:	14000030	b	0xfffff7f84aa8
   0x0000fffff7f849ec:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f849f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f849f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849fc:	54000120	b.eq	0xfffff7f84a20  // b.none
   0x0000fffff7f84a00:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84a04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a10:	54000321	b.ne	0xfffff7f84a74  // b.any
   0x0000fffff7f84a14:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84a18:	9e620120	scvtf	d0, x9
   0x0000fffff7f84a1c:	14000002	b	0xfffff7f84a24
   0x0000fffff7f84a20:	fd405660	ldr	d0, [x19, #168]
   0x0000fffff7f84a24:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a28:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84a2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a34:	54000120	b.eq	0xfffff7f84a58  // b.none
   0x0000fffff7f84a38:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a48:	54000161	b.ne	0xfffff7f84a74  // b.any
   0x0000fffff7f84a4c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84a50:	9e620121	scvtf	d1, x9
   0x0000fffff7f84a54:	14000002	b	0xfffff7f84a5c
   0x0000fffff7f84a58:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84a5c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84a60:	fd005660	str	d0, [x19, #168]
   0x0000fffff7f84a64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84a68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a6c:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84a70:	17ffffde	b	0xfffff7f849e8
   0x0000fffff7f84a74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84a78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84a7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84a80:	aa1503e2	mov	x2, x21
   0x0000fffff7f84a84:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f84a88:	aa1403e4	mov	x4, x20
   0x0000fffff7f84a8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84a90:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f84a94:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84a98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84a9c:	d63f0200	blr	x16
   0x0000fffff7f84aa0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84aa4:	54008960	b.eq	0xfffff7f85bd0  // b.none
   0x0000fffff7f84aa8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f84aac:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84ab0:	d2807cac	mov	x12, #0x3e5                 	// #997
   0x0000fffff7f84ab4:	b940b271	ldr	w17, [x19, #176]
   0x0000fffff7f84ab8:	36d80211	tbz	w17, #27, 0xfffff7f84af8
   0x0000fffff7f84abc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84ac0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84ac4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84ac8:	540001e1	b.ne	0xfffff7f84b04  // b.any
   0x0000fffff7f84acc:	f9405e6f	ldr	x15, [x19, #184]
   0x0000fffff7f84ad0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84ad4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84ad8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84adc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84ae0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84ae4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84ae8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84aec:	540000c9	b.ls	0xfffff7f84b04  // b.plast
   0x0000fffff7f84af0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84af4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84af8:	f9005e6c	str	x12, [x19, #184]
   0x0000fffff7f84afc:	b900b26d	str	w13, [x19, #176]
   0x0000fffff7f84b00:	1400000e	b	0xfffff7f84b38
   0x0000fffff7f84b04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84b08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84b0c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84b10:	aa1503e2	mov	x2, x21
   0x0000fffff7f84b14:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f84b18:	aa1403e4	mov	x4, x20
   0x0000fffff7f84b1c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84b20:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f84b24:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84b28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84b2c:	d63f0200	blr	x16
   0x0000fffff7f84b30:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84b34:	54008520	b.eq	0xfffff7f85bd8  // b.none
   0x0000fffff7f84b38:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84b3c:	37d80389	tbnz	w9, #27, 0xfffff7f84bac
   0x0000fffff7f84b40:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84b44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b50:	540002e1	b.ne	0xfffff7f84bac  // b.any
   0x0000fffff7f84b54:	b940b269	ldr	w9, [x19, #176]
   0x0000fffff7f84b58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b60:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b64:	54000241	b.ne	0xfffff7f84bac  // b.any
   0x0000fffff7f84b68:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84b6c:	f9405e6a	ldr	x10, [x19, #184]
   0x0000fffff7f84b70:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84b74:	540001c0	b.eq	0xfffff7f84bac  // b.none
   0x0000fffff7f84b78:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84b7c:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84b80:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84b84:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84b88:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84b8c:	54000100	b.eq	0xfffff7f84bac  // b.none
   0x0000fffff7f84b90:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84b94:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84b98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84ba0:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f84ba4:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84ba8:	1400000e	b	0xfffff7f84be0
   0x0000fffff7f84bac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84bb0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84bb4:	aa1303e1	mov	x1, x19
   0x0000fffff7f84bb8:	aa1503e2	mov	x2, x21
   0x0000fffff7f84bbc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f84bc0:	aa1403e4	mov	x4, x20
   0x0000fffff7f84bc4:	aa1603e5	mov	x5, x22
   0x0000fffff7f84bc8:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f84bcc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84bd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84bd4:	d63f0200	blr	x16
   0x0000fffff7f84bd8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84bdc:	54008020	b.eq	0xfffff7f85be0  // b.none
   0x0000fffff7f84be0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84be4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84be8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84bec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bf0:	540001c1	b.ne	0xfffff7f84c28  // b.any
   0x0000fffff7f84bf4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c04:	54000701	b.ne	0xfffff7f84ce4  // b.any
   0x0000fffff7f84c08:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84c0c:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f84c10:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84c14:	eb09015f	cmp	x10, x9
   0x0000fffff7f84c18:	54000662	b.cs	0xfffff7f84ce4  // b.hs, b.nlast
   0x0000fffff7f84c1c:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84c20:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84c24:	14000014	b	0xfffff7f84c74
   0x0000fffff7f84c28:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84c2c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84c30:	540005a0	b.eq	0xfffff7f84ce4  // b.none
   0x0000fffff7f84c34:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84c38:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84c3c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c40:	54000521	b.ne	0xfffff7f84ce4  // b.any
   0x0000fffff7f84c44:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f84c48:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84c4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c50:	540004a1	b.ne	0xfffff7f84ce4  // b.any
   0x0000fffff7f84c54:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84c58:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f84c5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c60:	54000421	b.ne	0xfffff7f84ce4  // b.any
   0x0000fffff7f84c64:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84c68:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f84c6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c70:	540003a1	b.ne	0xfffff7f84ce4  // b.any
   0x0000fffff7f84c74:	b940a26d	ldr	w13, [x19, #160]
   0x0000fffff7f84c78:	f940566c	ldr	x12, [x19, #168]
   0x0000fffff7f84c7c:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84c80:	36d801d1	tbz	w17, #27, 0xfffff7f84cb8
   0x0000fffff7f84c84:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84c88:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84c8c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84c90:	540002a1	b.ne	0xfffff7f84ce4  // b.any
   0x0000fffff7f84c94:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84c98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84c9c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84ca0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84ca4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84ca8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84cac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84cb0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84cb4:	54000189	b.ls	0xfffff7f84ce4  // b.plast
   0x0000fffff7f84cb8:	36d8008d	tbz	w13, #27, 0xfffff7f84cc8
   0x0000fffff7f84cbc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84cc0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84cc4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84cc8:	36d80091	tbz	w17, #27, 0xfffff7f84cd8
   0x0000fffff7f84ccc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84cd0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84cd4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84cd8:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84cdc:	b900016d	str	w13, [x11]
   0x0000fffff7f84ce0:	1400000e	b	0xfffff7f84d18
   0x0000fffff7f84ce4:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84ce8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84cec:	aa1303e1	mov	x1, x19
   0x0000fffff7f84cf0:	aa1503e2	mov	x2, x21
   0x0000fffff7f84cf4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f84cf8:	aa1403e4	mov	x4, x20
   0x0000fffff7f84cfc:	aa1603e5	mov	x5, x22
   0x0000fffff7f84d00:	d28c1410	mov	x16, #0x60a0                	// #24736
   0x0000fffff7f84d04:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84d08:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84d0c:	d63f0200	blr	x16
   0x0000fffff7f84d10:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84d14:	540076a0	b.eq	0xfffff7f85be8  // b.none
   0x0000fffff7f84d18:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f84d1c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f84d20:	d29a940c	mov	x12, #0xd4a0                	// #54432
   0x0000fffff7f84d24:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84d28:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f84d2c:	b9408271	ldr	w17, [x19, #128]
   0x0000fffff7f84d30:	36d801d1	tbz	w17, #27, 0xfffff7f84d68
   0x0000fffff7f84d34:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84d38:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84d3c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84d40:	54000281	b.ne	0xfffff7f84d90  // b.any
   0x0000fffff7f84d44:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f84d48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d4c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84d50:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84d54:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84d58:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84d5c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84d60:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84d64:	54000169	b.ls	0xfffff7f84d90  // b.plast
   0x0000fffff7f84d68:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84d6c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84d70:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84d74:	36d80091	tbz	w17, #27, 0xfffff7f84d84
   0x0000fffff7f84d78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d7c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84d80:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84d84:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84d88:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f84d8c:	1400000e	b	0xfffff7f84dc4
   0x0000fffff7f84d90:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84d94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84d98:	aa1303e1	mov	x1, x19
   0x0000fffff7f84d9c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84da0:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f84da4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84da8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84dac:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f84db0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84db4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84db8:	d63f0200	blr	x16
   0x0000fffff7f84dbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84dc0:	54007180	b.eq	0xfffff7f85bf0  // b.none
   0x0000fffff7f84dc4:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7f84dc8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84dcc:	540003a0	b.eq	0xfffff7f84e40  // b.none
   0x0000fffff7f84dd0:	b940626d	ldr	w13, [x19, #96]
   0x0000fffff7f84dd4:	f940366c	ldr	x12, [x19, #104]
   0x0000fffff7f84dd8:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84ddc:	36d801d1	tbz	w17, #27, 0xfffff7f84e14
   0x0000fffff7f84de0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84de4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84de8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84dec:	540002a1	b.ne	0xfffff7f84e40  // b.any
   0x0000fffff7f84df0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84df4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84df8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84dfc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84e00:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84e04:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84e08:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84e0c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84e10:	54000189	b.ls	0xfffff7f84e40  // b.plast
   0x0000fffff7f84e14:	36d8008d	tbz	w13, #27, 0xfffff7f84e24
   0x0000fffff7f84e18:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84e1c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84e20:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84e24:	36d80091	tbz	w17, #27, 0xfffff7f84e34
   0x0000fffff7f84e28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84e2c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84e30:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84e34:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84e38:	b900016d	str	w13, [x11]
   0x0000fffff7f84e3c:	1400000e	b	0xfffff7f84e74
   0x0000fffff7f84e40:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f84e44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84e48:	aa1303e1	mov	x1, x19
   0x0000fffff7f84e4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84e50:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f84e54:	aa1403e4	mov	x4, x20
   0x0000fffff7f84e58:	aa1603e5	mov	x5, x22
   0x0000fffff7f84e5c:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7f84e60:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84e64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84e68:	d63f0200	blr	x16
   0x0000fffff7f84e6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84e70:	54006c40	b.eq	0xfffff7f85bf8  // b.none
   0x0000fffff7f84e74:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84e78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84e7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84e80:	aa1503e2	mov	x2, x21
   0x0000fffff7f84e84:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f84e88:	aa1403e4	mov	x4, x20
   0x0000fffff7f84e8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84e90:	d286d410	mov	x16, #0x36a0                	// #13984
   0x0000fffff7f84e94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84e98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84e9c:	d63f0200	blr	x16
   0x0000fffff7f84ea0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ea4:	54006ae0	b.eq	0xfffff7f85c00  // b.none
   0x0000fffff7f84ea8:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f84eac:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84eb0:	540004a0	b.eq	0xfffff7f84f44  // b.none
   0x0000fffff7f84eb4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84eb8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84ebc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84ec0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84ec4:	54000400	b.eq	0xfffff7f84f44  // b.none
   0x0000fffff7f84ec8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84ecc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84ed0:	36d801d1	tbz	w17, #27, 0xfffff7f84f08
   0x0000fffff7f84ed4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84ed8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84edc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84ee0:	54000321	b.ne	0xfffff7f84f44  // b.any
   0x0000fffff7f84ee4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84ee8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84eec:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84ef0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84ef4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84ef8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84efc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84f00:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84f04:	54000209	b.ls	0xfffff7f84f44  // b.plast
   0x0000fffff7f84f08:	36d8008d	tbz	w13, #27, 0xfffff7f84f18
   0x0000fffff7f84f0c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84f10:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84f14:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84f18:	36d80091	tbz	w17, #27, 0xfffff7f84f28
   0x0000fffff7f84f1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84f20:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84f24:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84f28:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f84f2c:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f84f30:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84f34:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84f38:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84f3c:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f84f40:	1400000e	b	0xfffff7f84f78
   0x0000fffff7f84f44:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f84f48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84f4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84f50:	aa1503e2	mov	x2, x21
   0x0000fffff7f84f54:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f84f58:	aa1403e4	mov	x4, x20
   0x0000fffff7f84f5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84f60:	d2945010	mov	x16, #0xa280                	// #41600
   0x0000fffff7f84f64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84f68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84f6c:	d63f0200	blr	x16
   0x0000fffff7f84f70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84f74:	540064a0	b.eq	0xfffff7f85c08  // b.none
   0x0000fffff7f84f78:	5280008d	mov	w13, #0x4                   	// #4
   0x0000fffff7f84f7c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84f80:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f84f84:	f2e7fa0c	movk	x12, #0x3fd0, lsl #48
   0x0000fffff7f84f88:	b940a271	ldr	w17, [x19, #160]
   0x0000fffff7f84f8c:	36d80211	tbz	w17, #27, 0xfffff7f84fcc
   0x0000fffff7f84f90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84f94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84f98:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84f9c:	540001e1	b.ne	0xfffff7f84fd8  // b.any
   0x0000fffff7f84fa0:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f84fa4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84fa8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84fac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84fb0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84fb4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84fb8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84fbc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84fc0:	540000c9	b.ls	0xfffff7f84fd8  // b.plast
   0x0000fffff7f84fc4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84fc8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84fcc:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f84fd0:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f84fd4:	1400000e	b	0xfffff7f8500c
   0x0000fffff7f84fd8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84fdc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84fe0:	aa1303e1	mov	x1, x19
   0x0000fffff7f84fe4:	aa1503e2	mov	x2, x21
   0x0000fffff7f84fe8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f84fec:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ff0:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ff4:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7f84ff8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84ffc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85000:	d63f0200	blr	x16
   0x0000fffff7f85004:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85008:	54006040	b.eq	0xfffff7f85c10  // b.none
   0x0000fffff7f8500c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85010:	37d806a9	tbnz	w9, #27, 0xfffff7f850e4
   0x0000fffff7f85014:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85018:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8501c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85020:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85024:	540001c1	b.ne	0xfffff7f8505c  // b.any
   0x0000fffff7f85028:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f8502c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85030:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85034:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85038:	54000121	b.ne	0xfffff7f8505c  // b.any
   0x0000fffff7f8503c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f85040:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f85044:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8504c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85050:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f85054:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f85058:	14000030	b	0xfffff7f85118
   0x0000fffff7f8505c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85060:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85068:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8506c:	54000120	b.eq	0xfffff7f85090  // b.none
   0x0000fffff7f85070:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85074:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8507c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85080:	54000321	b.ne	0xfffff7f850e4  // b.any
   0x0000fffff7f85084:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f85088:	9e620120	scvtf	d0, x9
   0x0000fffff7f8508c:	14000002	b	0xfffff7f85094
   0x0000fffff7f85090:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7f85094:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f85098:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8509c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850a4:	54000120	b.eq	0xfffff7f850c8  // b.none
   0x0000fffff7f850a8:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f850ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f850b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f850b8:	54000161	b.ne	0xfffff7f850e4  // b.any
   0x0000fffff7f850bc:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f850c0:	9e620121	scvtf	d1, x9
   0x0000fffff7f850c4:	14000002	b	0xfffff7f850cc
   0x0000fffff7f850c8:	fd405661	ldr	d1, [x19, #168]
   0x0000fffff7f850cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f850d0:	fd004e60	str	d0, [x19, #152]
   0x0000fffff7f850d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f850d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f850dc:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f850e0:	17ffffde	b	0xfffff7f85058
   0x0000fffff7f850e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f850e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f850ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f850f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f850f4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f850f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f850fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f85100:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f85104:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85108:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8510c:	d63f0200	blr	x16
   0x0000fffff7f85110:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85114:	54005820	b.eq	0xfffff7f85c18  // b.none
   0x0000fffff7f85118:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f8511c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85120:	540003a0	b.eq	0xfffff7f85194  // b.none
   0x0000fffff7f85124:	b940926d	ldr	w13, [x19, #144]
   0x0000fffff7f85128:	f9404e6c	ldr	x12, [x19, #152]
   0x0000fffff7f8512c:	b9400171	ldr	w17, [x11]
   0x0000fffff7f85130:	36d801d1	tbz	w17, #27, 0xfffff7f85168
   0x0000fffff7f85134:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85138:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8513c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85140:	540002a1	b.ne	0xfffff7f85194  // b.any
   0x0000fffff7f85144:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f85148:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8514c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85150:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85154:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85158:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8515c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85160:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85164:	54000189	b.ls	0xfffff7f85194  // b.plast
   0x0000fffff7f85168:	36d8008d	tbz	w13, #27, 0xfffff7f85178
   0x0000fffff7f8516c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85170:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85174:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85178:	36d80091	tbz	w17, #27, 0xfffff7f85188
   0x0000fffff7f8517c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85180:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85184:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85188:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f8518c:	b900016d	str	w13, [x11]
   0x0000fffff7f85190:	1400000e	b	0xfffff7f851c8
   0x0000fffff7f85194:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f85198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8519c:	aa1303e1	mov	x1, x19
   0x0000fffff7f851a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f851a4:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f851a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f851ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f851b0:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7f851b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f851b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f851bc:	d63f0200	blr	x16
   0x0000fffff7f851c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f851c4:	540052e0	b.eq	0xfffff7f85c20  // b.none
   0x0000fffff7f851c8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f851cc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f851d0:	540004a0	b.eq	0xfffff7f85264  // b.none
   0x0000fffff7f851d4:	b940016d	ldr	w13, [x11]
   0x0000fffff7f851d8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f851dc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f851e0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f851e4:	54000400	b.eq	0xfffff7f85264  // b.none
   0x0000fffff7f851e8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f851ec:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f851f0:	36d801d1	tbz	w17, #27, 0xfffff7f85228
   0x0000fffff7f851f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f851f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f851fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85200:	54000321	b.ne	0xfffff7f85264  // b.any
   0x0000fffff7f85204:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85208:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8520c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85210:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85214:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85218:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8521c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85220:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85224:	54000209	b.ls	0xfffff7f85264  // b.plast
   0x0000fffff7f85228:	36d8008d	tbz	w13, #27, 0xfffff7f85238
   0x0000fffff7f8522c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85230:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85234:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85238:	36d80091	tbz	w17, #27, 0xfffff7f85248
   0x0000fffff7f8523c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85240:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85244:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85248:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f8524c:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f85250:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85254:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85258:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f8525c:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f85260:	1400000e	b	0xfffff7f85298
   0x0000fffff7f85264:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f85268:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8526c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85270:	aa1503e2	mov	x2, x21
   0x0000fffff7f85274:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f85278:	aa1403e4	mov	x4, x20
   0x0000fffff7f8527c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85280:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f85284:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85288:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8528c:	d63f0200	blr	x16
   0x0000fffff7f85290:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85294:	54004ca0	b.eq	0xfffff7f85c28  // b.none
   0x0000fffff7f85298:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f8529c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f852a0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f852a4:	b9409271	ldr	w17, [x19, #144]
   0x0000fffff7f852a8:	36d80211	tbz	w17, #27, 0xfffff7f852e8
   0x0000fffff7f852ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f852b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f852b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f852b8:	540001e1	b.ne	0xfffff7f852f4  // b.any
   0x0000fffff7f852bc:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f852c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f852c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f852c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f852cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f852d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f852d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f852d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f852dc:	540000c9	b.ls	0xfffff7f852f4  // b.plast
   0x0000fffff7f852e0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f852e4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f852e8:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f852ec:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f852f0:	1400000e	b	0xfffff7f85328
   0x0000fffff7f852f4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f852f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f852fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f85300:	aa1503e2	mov	x2, x21
   0x0000fffff7f85304:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f85308:	aa1403e4	mov	x4, x20
   0x0000fffff7f8530c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85310:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f85314:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85318:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8531c:	d63f0200	blr	x16
   0x0000fffff7f85320:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85324:	54004860	b.eq	0xfffff7f85c30  // b.none
   0x0000fffff7f85328:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f8532c:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f85330:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f85334:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85338:	540001c1	b.ne	0xfffff7f85370  // b.any
   0x0000fffff7f8533c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85340:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85344:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85348:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8534c:	54000801	b.ne	0xfffff7f8544c  // b.any
   0x0000fffff7f85350:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f85354:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f85358:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8535c:	eb09015f	cmp	x10, x9
   0x0000fffff7f85360:	54000762	b.cs	0xfffff7f8544c  // b.hs, b.nlast
   0x0000fffff7f85364:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f85368:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8536c:	14000014	b	0xfffff7f853bc
   0x0000fffff7f85370:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f85374:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85378:	540006a0	b.eq	0xfffff7f8544c  // b.none
   0x0000fffff7f8537c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85380:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f85384:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85388:	54000621	b.ne	0xfffff7f8544c  // b.any
   0x0000fffff7f8538c:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85390:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f85394:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85398:	540005a1	b.ne	0xfffff7f8544c  // b.any
   0x0000fffff7f8539c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f853a0:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f853a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853a8:	54000521	b.ne	0xfffff7f8544c  // b.any
   0x0000fffff7f853ac:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f853b0:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f853b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853b8:	540004a1	b.ne	0xfffff7f8544c  // b.any
   0x0000fffff7f853bc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f853c0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f853c4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f853c8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f853cc:	54000400	b.eq	0xfffff7f8544c  // b.none
   0x0000fffff7f853d0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f853d4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f853d8:	36d801d1	tbz	w17, #27, 0xfffff7f85410
   0x0000fffff7f853dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f853e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f853e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f853e8:	54000321	b.ne	0xfffff7f8544c  // b.any
   0x0000fffff7f853ec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f853f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f853f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f853f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f853fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85400:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85404:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85408:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8540c:	54000209	b.ls	0xfffff7f8544c  // b.plast
   0x0000fffff7f85410:	36d8008d	tbz	w13, #27, 0xfffff7f85420
   0x0000fffff7f85414:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85418:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8541c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85420:	36d80091	tbz	w17, #27, 0xfffff7f85430
   0x0000fffff7f85424:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85428:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8542c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85430:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f85434:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f85438:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8543c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85440:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f85444:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f85448:	1400000e	b	0xfffff7f85480
   0x0000fffff7f8544c:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f85450:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85454:	aa1303e1	mov	x1, x19
   0x0000fffff7f85458:	aa1503e2	mov	x2, x21
   0x0000fffff7f8545c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f85460:	aa1403e4	mov	x4, x20
   0x0000fffff7f85464:	aa1603e5	mov	x5, x22
   0x0000fffff7f85468:	d28a0010	mov	x16, #0x5000                	// #20480
   0x0000fffff7f8546c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85470:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85474:	d63f0200	blr	x16
   0x0000fffff7f85478:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8547c:	54003de0	b.eq	0xfffff7f85c38  // b.none
   0x0000fffff7f85480:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7f85484:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85488:	540004a0	b.eq	0xfffff7f8551c  // b.none
   0x0000fffff7f8548c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85490:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85494:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85498:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8549c:	54000400	b.eq	0xfffff7f8551c  // b.none
   0x0000fffff7f854a0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f854a4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f854a8:	36d801d1	tbz	w17, #27, 0xfffff7f854e0
   0x0000fffff7f854ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f854b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f854b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f854b8:	54000321	b.ne	0xfffff7f8551c  // b.any
   0x0000fffff7f854bc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f854c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f854c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f854c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f854cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f854d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f854d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f854d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f854dc:	54000209	b.ls	0xfffff7f8551c  // b.plast
   0x0000fffff7f854e0:	36d8008d	tbz	w13, #27, 0xfffff7f854f0
   0x0000fffff7f854e4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f854e8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f854ec:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f854f0:	36d80091	tbz	w17, #27, 0xfffff7f85500
   0x0000fffff7f854f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f854f8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f854fc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85500:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f85504:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f85508:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8550c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85510:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f85514:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f85518:	1400000e	b	0xfffff7f85550
   0x0000fffff7f8551c:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f85520:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85524:	aa1303e1	mov	x1, x19
   0x0000fffff7f85528:	aa1503e2	mov	x2, x21
   0x0000fffff7f8552c:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f85530:	aa1403e4	mov	x4, x20
   0x0000fffff7f85534:	aa1603e5	mov	x5, x22
   0x0000fffff7f85538:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f8553c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85540:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85544:	d63f0200	blr	x16
   0x0000fffff7f85548:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8554c:	540037a0	b.eq	0xfffff7f85c40  // b.none
   0x0000fffff7f85550:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f85554:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f85558:	d280022c	mov	x12, #0x11                  	// #17
   0x0000fffff7f8555c:	b940a271	ldr	w17, [x19, #160]
   0x0000fffff7f85560:	36d80211	tbz	w17, #27, 0xfffff7f855a0
   0x0000fffff7f85564:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85568:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8556c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85570:	540001e1	b.ne	0xfffff7f855ac  // b.any
   0x0000fffff7f85574:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f85578:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8557c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85580:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85584:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85588:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8558c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85590:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85594:	540000c9	b.ls	0xfffff7f855ac  // b.plast
   0x0000fffff7f85598:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8559c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f855a0:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f855a4:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f855a8:	1400000e	b	0xfffff7f855e0
   0x0000fffff7f855ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f855b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f855b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f855bc:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f855c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f855c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f855c8:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7f855cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f855d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f855d4:	d63f0200	blr	x16
   0x0000fffff7f855d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f855dc:	54003360	b.eq	0xfffff7f85c48  // b.none
   0x0000fffff7f855e0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f855e4:	37d80389	tbnz	w9, #27, 0xfffff7f85654
   0x0000fffff7f855e8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f855ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855f8:	540002e1	b.ne	0xfffff7f85654  // b.any
   0x0000fffff7f855fc:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f85600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85608:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8560c:	54000241	b.ne	0xfffff7f85654  // b.any
   0x0000fffff7f85610:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f85614:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f85618:	f100015f	cmp	x10, #0x0
   0x0000fffff7f8561c:	540001c0	b.eq	0xfffff7f85654  // b.none
   0x0000fffff7f85620:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85624:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85628:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f8562c:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f85630:	eb0b015f	cmp	x10, x11
   0x0000fffff7f85634:	54000100	b.eq	0xfffff7f85654  // b.none
   0x0000fffff7f85638:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f8563c:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f85640:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85644:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85648:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f8564c:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f85650:	1400000e	b	0xfffff7f85688
   0x0000fffff7f85654:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85658:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8565c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85660:	aa1503e2	mov	x2, x21
   0x0000fffff7f85664:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f85668:	aa1403e4	mov	x4, x20
   0x0000fffff7f8566c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85670:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f85674:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85678:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8567c:	d63f0200	blr	x16
   0x0000fffff7f85680:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85684:	54002e60	b.eq	0xfffff7f85c50  // b.none
   0x0000fffff7f85688:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f8568c:	37d806a9	tbnz	w9, #27, 0xfffff7f85760
   0x0000fffff7f85690:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8569c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856a0:	540001c1	b.ne	0xfffff7f856d8  // b.any
   0x0000fffff7f856a4:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f856a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f856ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856b4:	54000121	b.ne	0xfffff7f856d8  // b.any
   0x0000fffff7f856b8:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f856bc:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f856c0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f856c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f856c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856cc:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f856d0:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f856d4:	14000030	b	0xfffff7f85794
   0x0000fffff7f856d8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f856dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f856e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856e8:	54000120	b.eq	0xfffff7f8570c  // b.none
   0x0000fffff7f856ec:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f856f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f856f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856fc:	54000321	b.ne	0xfffff7f85760  // b.any
   0x0000fffff7f85700:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85704:	9e620120	scvtf	d0, x9
   0x0000fffff7f85708:	14000002	b	0xfffff7f85710
   0x0000fffff7f8570c:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f85710:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85714:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8571c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85720:	54000120	b.eq	0xfffff7f85744  // b.none
   0x0000fffff7f85724:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85728:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8572c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85730:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85734:	54000161	b.ne	0xfffff7f85760  // b.any
   0x0000fffff7f85738:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f8573c:	9e620121	scvtf	d1, x9
   0x0000fffff7f85740:	14000002	b	0xfffff7f85748
   0x0000fffff7f85744:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f85748:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8574c:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f85750:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85754:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85758:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f8575c:	17ffffde	b	0xfffff7f856d4
   0x0000fffff7f85760:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85764:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85768:	aa1303e1	mov	x1, x19
   0x0000fffff7f8576c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85770:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f85774:	aa1403e4	mov	x4, x20
   0x0000fffff7f85778:	aa1603e5	mov	x5, x22
   0x0000fffff7f8577c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f85780:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85784:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85788:	d63f0200	blr	x16
   0x0000fffff7f8578c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85790:	54002640	b.eq	0xfffff7f85c58  // b.none
   0x0000fffff7f85794:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f85798:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8579c:	540004a0	b.eq	0xfffff7f85830  // b.none
   0x0000fffff7f857a0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f857a4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f857a8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f857ac:	eb0901bf	cmp	x13, x9
   0x0000fffff7f857b0:	54000400	b.eq	0xfffff7f85830  // b.none
   0x0000fffff7f857b4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f857b8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f857bc:	36d801d1	tbz	w17, #27, 0xfffff7f857f4
   0x0000fffff7f857c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f857c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f857c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f857cc:	54000321	b.ne	0xfffff7f85830  // b.any
   0x0000fffff7f857d0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f857d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f857d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f857dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f857e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f857e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f857e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f857ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7f857f0:	54000209	b.ls	0xfffff7f85830  // b.plast
   0x0000fffff7f857f4:	36d8008d	tbz	w13, #27, 0xfffff7f85804
   0x0000fffff7f857f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f857fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85800:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85804:	36d80091	tbz	w17, #27, 0xfffff7f85814
   0x0000fffff7f85808:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8580c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85810:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85814:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f85818:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f8581c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85820:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85824:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f85828:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f8582c:	1400000e	b	0xfffff7f85864
   0x0000fffff7f85830:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f85834:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85838:	aa1303e1	mov	x1, x19
   0x0000fffff7f8583c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85840:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f85844:	aa1403e4	mov	x4, x20
   0x0000fffff7f85848:	aa1603e5	mov	x5, x22
   0x0000fffff7f8584c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7f85850:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85854:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85858:	d63f0200	blr	x16
   0x0000fffff7f8585c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85860:	54002000	b.eq	0xfffff7f85c60  // b.none
   0x0000fffff7f85864:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85868:	37d806a9	tbnz	w9, #27, 0xfffff7f8593c
   0x0000fffff7f8586c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85870:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85874:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85878:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8587c:	540001c1	b.ne	0xfffff7f858b4  // b.any
   0x0000fffff7f85880:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85884:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85888:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8588c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85890:	54000121	b.ne	0xfffff7f858b4  // b.any
   0x0000fffff7f85894:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85898:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f8589c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f858a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858a8:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f858ac:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f858b0:	14000030	b	0xfffff7f85970
   0x0000fffff7f858b4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f858b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f858bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858c4:	54000120	b.eq	0xfffff7f858e8  // b.none
   0x0000fffff7f858c8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f858cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858d8:	54000321	b.ne	0xfffff7f8593c  // b.any
   0x0000fffff7f858dc:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f858e0:	9e620120	scvtf	d0, x9
   0x0000fffff7f858e4:	14000002	b	0xfffff7f858ec
   0x0000fffff7f858e8:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f858ec:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f858f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f858f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858fc:	54000120	b.eq	0xfffff7f85920  // b.none
   0x0000fffff7f85900:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85904:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85908:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8590c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85910:	54000161	b.ne	0xfffff7f8593c  // b.any
   0x0000fffff7f85914:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f85918:	9e620121	scvtf	d1, x9
   0x0000fffff7f8591c:	14000002	b	0xfffff7f85924
   0x0000fffff7f85920:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f85924:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85928:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f8592c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85934:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f85938:	17ffffde	b	0xfffff7f858b0
   0x0000fffff7f8593c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85940:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85944:	aa1303e1	mov	x1, x19
   0x0000fffff7f85948:	aa1503e2	mov	x2, x21
   0x0000fffff7f8594c:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f85950:	aa1403e4	mov	x4, x20
   0x0000fffff7f85954:	aa1603e5	mov	x5, x22
   0x0000fffff7f85958:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f8595c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85960:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85964:	d63f0200	blr	x16
   0x0000fffff7f85968:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8596c:	540017e0	b.eq	0xfffff7f85c68  // b.none
   0x0000fffff7f85970:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85974:	37d806a9	tbnz	w9, #27, 0xfffff7f85a48
   0x0000fffff7f85978:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8597c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85984:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85988:	540001c1	b.ne	0xfffff7f859c0  // b.any
   0x0000fffff7f8598c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85990:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85998:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8599c:	54000121	b.ne	0xfffff7f859c0  // b.any
   0x0000fffff7f859a0:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f859a4:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7f859a8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f859ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859b4:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f859b8:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f859bc:	14000030	b	0xfffff7f85a7c
   0x0000fffff7f859c0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f859c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f859c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859d0:	54000120	b.eq	0xfffff7f859f4  // b.none
   0x0000fffff7f859d4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f859d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f859e4:	54000321	b.ne	0xfffff7f85a48  // b.any
   0x0000fffff7f859e8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f859ec:	9e620120	scvtf	d0, x9
   0x0000fffff7f859f0:	14000002	b	0xfffff7f859f8
   0x0000fffff7f859f4:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f859f8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f859fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85a00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a08:	54000120	b.eq	0xfffff7f85a2c  // b.none
   0x0000fffff7f85a0c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85a10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a18:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a1c:	54000161	b.ne	0xfffff7f85a48  // b.any
   0x0000fffff7f85a20:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85a24:	9e620121	scvtf	d1, x9
   0x0000fffff7f85a28:	14000002	b	0xfffff7f85a30
   0x0000fffff7f85a2c:	fd404661	ldr	d1, [x19, #136]
   0x0000fffff7f85a30:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85a34:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f85a38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85a3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a40:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85a44:	17ffffde	b	0xfffff7f859bc
   0x0000fffff7f85a48:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85a4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a50:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a54:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a58:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f85a5c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a60:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a64:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7f85a68:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85a6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a70:	d63f0200	blr	x16
   0x0000fffff7f85a74:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a78:	54000fc0	b.eq	0xfffff7f85c70  // b.none
   0x0000fffff7f85a7c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f85a80:	37d80269	tbnz	w9, #27, 0xfffff7f85acc
   0x0000fffff7f85a84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85a88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a90:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a94:	540001c1	b.ne	0xfffff7f85acc  // b.any
   0x0000fffff7f85a98:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85a9c:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f85aa0:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f85aa4:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f85aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ab0:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f85ab4:	aa0b03e9	mov	x9, x11
   0x0000fffff7f85ab8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85abc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ac0:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85ac4:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85ac8:	1400000e	b	0xfffff7f85b00
   0x0000fffff7f85acc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85ad0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85ad4:	aa1303e1	mov	x1, x19
   0x0000fffff7f85ad8:	aa1503e2	mov	x2, x21
   0x0000fffff7f85adc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f85ae0:	aa1403e4	mov	x4, x20
   0x0000fffff7f85ae4:	aa1603e5	mov	x5, x22
   0x0000fffff7f85ae8:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7f85aec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85af0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85af4:	d63f0200	blr	x16
   0x0000fffff7f85af8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85afc:	54000be0	b.eq	0xfffff7f85c78  // b.none
   0x0000fffff7f85b00:	17fff99e	b	0xfffff7f84178
   0x0000fffff7f85b04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85b08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85b0c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b10:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b14:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f85b18:	aa1403e4	mov	x4, x20
   0x0000fffff7f85b1c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85b20:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7f85b24:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85b28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85b2c:	d63f0200	blr	x16
   0x0000fffff7f85b30:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85b34:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b38:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b3c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85b40:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85b44:	d65f03c0	ret
   0x0000fffff7f85b48:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b50:	b900028a	str	w10, [x20]
   0x0000fffff7f85b54:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85b58:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85b5c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85b60:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85b64:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85b68:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85b6c:	d65f03c0	ret
   0x0000fffff7f85b70:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85b74:	17fffff5	b	0xfffff7f85b48
   0x0000fffff7f85b78:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85b7c:	17fffff3	b	0xfffff7f85b48
   0x0000fffff7f85b80:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85b84:	17fffff1	b	0xfffff7f85b48
   0x0000fffff7f85b88:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f85b8c:	17ffffef	b	0xfffff7f85b48
   0x0000fffff7f85b90:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85b94:	17ffffed	b	0xfffff7f85b48
   0x0000fffff7f85b98:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85b9c:	17ffffeb	b	0xfffff7f85b48
   0x0000fffff7f85ba0:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85ba4:	17ffffe9	b	0xfffff7f85b48
   0x0000fffff7f85ba8:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85bac:	17ffffe7	b	0xfffff7f85b48
   0x0000fffff7f85bb0:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85bb4:	17ffffe5	b	0xfffff7f85b48
   0x0000fffff7f85bb8:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85bbc:	17ffffe3	b	0xfffff7f85b48
   0x0000fffff7f85bc0:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85bc4:	17ffffe1	b	0xfffff7f85b48
   0x0000fffff7f85bc8:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85bcc:	17ffffdf	b	0xfffff7f85b48
   0x0000fffff7f85bd0:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85bd4:	17ffffdd	b	0xfffff7f85b48
   0x0000fffff7f85bd8:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85bdc:	17ffffdb	b	0xfffff7f85b48
   0x0000fffff7f85be0:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85be4:	17ffffd9	b	0xfffff7f85b48
   0x0000fffff7f85be8:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f85bec:	17ffffd7	b	0xfffff7f85b48
   0x0000fffff7f85bf0:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f85bf4:	17ffffd5	b	0xfffff7f85b48
   0x0000fffff7f85bf8:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f85bfc:	17ffffd3	b	0xfffff7f85b48
   0x0000fffff7f85c00:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f85c04:	17ffffd1	b	0xfffff7f85b48
   0x0000fffff7f85c08:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f85c0c:	17ffffcf	b	0xfffff7f85b48
   0x0000fffff7f85c10:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f85c14:	17ffffcd	b	0xfffff7f85b48
   0x0000fffff7f85c18:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f85c1c:	17ffffcb	b	0xfffff7f85b48
   0x0000fffff7f85c20:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f85c24:	17ffffc9	b	0xfffff7f85b48
   0x0000fffff7f85c28:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f85c2c:	17ffffc7	b	0xfffff7f85b48
   0x0000fffff7f85c30:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f85c34:	17ffffc5	b	0xfffff7f85b48
   0x0000fffff7f85c38:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f85c3c:	17ffffc3	b	0xfffff7f85b48
   0x0000fffff7f85c40:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f85c44:	17ffffc1	b	0xfffff7f85b48
   0x0000fffff7f85c48:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f85c4c:	17ffffbf	b	0xfffff7f85b48
   0x0000fffff7f85c50:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f85c54:	17ffffbd	b	0xfffff7f85b48
   0x0000fffff7f85c58:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f85c5c:	17ffffbb	b	0xfffff7f85b48
   0x0000fffff7f85c60:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f85c64:	17ffffb9	b	0xfffff7f85b48
   0x0000fffff7f85c68:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f85c6c:	17ffffb7	b	0xfffff7f85b48
   0x0000fffff7f85c70:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f85c74:	17ffffb5	b	0xfffff7f85b48
   0x0000fffff7f85c78:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f85c7c:	17ffffb3	b	0xfffff7f85b48
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
