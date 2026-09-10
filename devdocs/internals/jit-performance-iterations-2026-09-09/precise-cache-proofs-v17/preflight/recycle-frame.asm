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
   0x0000fffff7f840d0:	d295f290	mov	x16, #0xaf94                	// #44948
   0x0000fffff7f840d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f840d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840dc:	d63f0200	blr	x16
   0x0000fffff7f840e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f840e4:	5400cfc0	b.eq	0xfffff7f85adc  // b.none
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
   0x0000fffff7f84174:	5400cb80	b.eq	0xfffff7f85ae4  // b.none
   0x0000fffff7f84178:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8417c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84180:	aa1303e1	mov	x1, x19
   0x0000fffff7f84184:	aa1503e2	mov	x2, x21
   0x0000fffff7f84188:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f8418c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84190:	aa1603e5	mov	x5, x22
   0x0000fffff7f84194:	d292fe90	mov	x16, #0x97f4                	// #38900
   0x0000fffff7f84198:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8419c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f841a0:	d63f0200	blr	x16
   0x0000fffff7f841a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f841a8:	5400ca20	b.eq	0xfffff7f85aec  // b.none
   0x0000fffff7f841ac:	f100041f	cmp	x0, #0x1
   0x0000fffff7f841b0:	5400c600	b.eq	0xfffff7f85a70  // b.none
   0x0000fffff7f841b4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f841b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f841bc:	540004a0	b.eq	0xfffff7f84250  // b.none
   0x0000fffff7f841c0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f841c4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f841c8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f841cc:	eb0901bf	cmp	x13, x9
   0x0000fffff7f841d0:	54000400	b.eq	0xfffff7f84250  // b.none
   0x0000fffff7f841d4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f841d8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f841dc:	36d801d1	tbz	w17, #27, 0xfffff7f84214
   0x0000fffff7f841e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f841e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f841e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f841ec:	54000321	b.ne	0xfffff7f84250  // b.any
   0x0000fffff7f841f0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f841f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f841f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f841fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84200:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84204:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84208:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8420c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84210:	54000209	b.ls	0xfffff7f84250  // b.plast
   0x0000fffff7f84214:	36d8008d	tbz	w13, #27, 0xfffff7f84224
   0x0000fffff7f84218:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8421c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84220:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84224:	36d80091	tbz	w17, #27, 0xfffff7f84234
   0x0000fffff7f84228:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8422c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84230:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84234:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f84238:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f8423c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84240:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84244:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f84248:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f8424c:	1400000e	b	0xfffff7f84284
   0x0000fffff7f84250:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84254:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84258:	aa1303e1	mov	x1, x19
   0x0000fffff7f8425c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84260:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f84264:	aa1403e4	mov	x4, x20
   0x0000fffff7f84268:	aa1603e5	mov	x5, x22
   0x0000fffff7f8426c:	d296d210	mov	x16, #0xb690                	// #46736
   0x0000fffff7f84270:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84274:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84278:	d63f0200	blr	x16
   0x0000fffff7f8427c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84280:	5400c3a0	b.eq	0xfffff7f85af4  // b.none
   0x0000fffff7f84284:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f84288:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f8428c:	d29a880c	mov	x12, #0xd440                	// #54336
   0x0000fffff7f84290:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84294:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f84298:	b9408271	ldr	w17, [x19, #128]
   0x0000fffff7f8429c:	36d801d1	tbz	w17, #27, 0xfffff7f842d4
   0x0000fffff7f842a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f842a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f842a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f842ac:	54000281	b.ne	0xfffff7f842fc  // b.any
   0x0000fffff7f842b0:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f842b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f842b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f842bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f842c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f842c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f842c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f842cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f842d0:	54000169	b.ls	0xfffff7f842fc  // b.plast
   0x0000fffff7f842d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f842d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f842dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f842e0:	36d80091	tbz	w17, #27, 0xfffff7f842f0
   0x0000fffff7f842e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f842e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f842ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f842f0:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f842f4:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f842f8:	1400000e	b	0xfffff7f84330
   0x0000fffff7f842fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84300:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84304:	aa1303e1	mov	x1, x19
   0x0000fffff7f84308:	aa1503e2	mov	x2, x21
   0x0000fffff7f8430c:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f84310:	aa1403e4	mov	x4, x20
   0x0000fffff7f84314:	aa1603e5	mov	x5, x22
   0x0000fffff7f84318:	d295f290	mov	x16, #0xaf94                	// #44948
   0x0000fffff7f8431c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84324:	d63f0200	blr	x16
   0x0000fffff7f84328:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8432c:	5400be80	b.eq	0xfffff7f85afc  // b.none
   0x0000fffff7f84330:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84334:	37d80389	tbnz	w9, #27, 0xfffff7f843a4
   0x0000fffff7f84338:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8433c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84340:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84344:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84348:	540002e1	b.ne	0xfffff7f843a4  // b.any
   0x0000fffff7f8434c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84350:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84354:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84358:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8435c:	54000241	b.ne	0xfffff7f843a4  // b.any
   0x0000fffff7f84360:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84364:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f84368:	f100015f	cmp	x10, #0x0
   0x0000fffff7f8436c:	540001c0	b.eq	0xfffff7f843a4  // b.none
   0x0000fffff7f84370:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84374:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84378:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f8437c:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84380:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84384:	54000100	b.eq	0xfffff7f843a4  // b.none
   0x0000fffff7f84388:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f8438c:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84390:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84394:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84398:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f8439c:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f843a0:	1400000e	b	0xfffff7f843d8
   0x0000fffff7f843a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f843a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f843ac:	aa1303e1	mov	x1, x19
   0x0000fffff7f843b0:	aa1503e2	mov	x2, x21
   0x0000fffff7f843b4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f843b8:	aa1403e4	mov	x4, x20
   0x0000fffff7f843bc:	aa1603e5	mov	x5, x22
   0x0000fffff7f843c0:	d2947a10	mov	x16, #0xa3d0                	// #41936
   0x0000fffff7f843c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f843c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843cc:	d63f0200	blr	x16
   0x0000fffff7f843d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843d4:	5400b980	b.eq	0xfffff7f85b04  // b.none
   0x0000fffff7f843d8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f843dc:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f843e0:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f843e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843e8:	540001c1	b.ne	0xfffff7f84420  // b.any
   0x0000fffff7f843ec:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f843f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f843f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f843f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843fc:	54000701	b.ne	0xfffff7f844dc  // b.any
   0x0000fffff7f84400:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84404:	f940166b	ldr	x11, [x19, #40]
   0x0000fffff7f84408:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8440c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84410:	54000662	b.cs	0xfffff7f844dc  // b.hs, b.nlast
   0x0000fffff7f84414:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84418:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8441c:	1400000c	b	0xfffff7f8444c
   0x0000fffff7f84420:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84424:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84428:	540005a0	b.eq	0xfffff7f844dc  // b.none
   0x0000fffff7f8442c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84430:	b94037ea	ldr	w10, [sp, #52]
   0x0000fffff7f84434:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84438:	54000521	b.ne	0xfffff7f844dc  // b.any
   0x0000fffff7f8443c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84440:	f94023ea	ldr	x10, [sp, #64]
   0x0000fffff7f84444:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84448:	540004a1	b.ne	0xfffff7f844dc  // b.any
   0x0000fffff7f8444c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84450:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84454:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84458:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8445c:	54000400	b.eq	0xfffff7f844dc  // b.none
   0x0000fffff7f84460:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84464:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84468:	36d801d1	tbz	w17, #27, 0xfffff7f844a0
   0x0000fffff7f8446c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84470:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84474:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84478:	54000321	b.ne	0xfffff7f844dc  // b.any
   0x0000fffff7f8447c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84480:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84484:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84488:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8448c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84490:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84494:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84498:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8449c:	54000209	b.ls	0xfffff7f844dc  // b.plast
   0x0000fffff7f844a0:	36d8008d	tbz	w13, #27, 0xfffff7f844b0
   0x0000fffff7f844a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f844a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f844ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f844b0:	36d80091	tbz	w17, #27, 0xfffff7f844c0
   0x0000fffff7f844b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f844bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f844c0:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f844c4:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f844c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f844cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f844d0:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f844d4:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f844d8:	1400000e	b	0xfffff7f84510
   0x0000fffff7f844dc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f844e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f844e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f844e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f844ec:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f844f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f844f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f844f8:	d28b5c10	mov	x16, #0x5ae0                	// #23264
   0x0000fffff7f844fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84500:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84504:	d63f0200	blr	x16
   0x0000fffff7f84508:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8450c:	5400b000	b.eq	0xfffff7f85b0c  // b.none
   0x0000fffff7f84510:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f84514:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84518:	540003a0	b.eq	0xfffff7f8458c  // b.none
   0x0000fffff7f8451c:	b940926d	ldr	w13, [x19, #144]
   0x0000fffff7f84520:	f9404e6c	ldr	x12, [x19, #152]
   0x0000fffff7f84524:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84528:	36d801d1	tbz	w17, #27, 0xfffff7f84560
   0x0000fffff7f8452c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84530:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84534:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84538:	540002a1	b.ne	0xfffff7f8458c  // b.any
   0x0000fffff7f8453c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84540:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84544:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84548:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8454c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84550:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84554:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84558:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8455c:	54000189	b.ls	0xfffff7f8458c  // b.plast
   0x0000fffff7f84560:	36d8008d	tbz	w13, #27, 0xfffff7f84570
   0x0000fffff7f84564:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84568:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8456c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84570:	36d80091	tbz	w17, #27, 0xfffff7f84580
   0x0000fffff7f84574:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84578:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8457c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84580:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84584:	b900016d	str	w13, [x11]
   0x0000fffff7f84588:	1400000e	b	0xfffff7f845c0
   0x0000fffff7f8458c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84590:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84594:	aa1303e1	mov	x1, x19
   0x0000fffff7f84598:	aa1503e2	mov	x2, x21
   0x0000fffff7f8459c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f845a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f845a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f845a8:	d299ea10	mov	x16, #0xcf50                	// #53072
   0x0000fffff7f845ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f845b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f845b4:	d63f0200	blr	x16
   0x0000fffff7f845b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f845bc:	5400aac0	b.eq	0xfffff7f85b14  // b.none
   0x0000fffff7f845c0:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f845c4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f845c8:	540004a0	b.eq	0xfffff7f8465c  // b.none
   0x0000fffff7f845cc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f845d0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f845d4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f845d8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f845dc:	54000400	b.eq	0xfffff7f8465c  // b.none
   0x0000fffff7f845e0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f845e4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f845e8:	36d801d1	tbz	w17, #27, 0xfffff7f84620
   0x0000fffff7f845ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f845f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f845f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f845f8:	54000321	b.ne	0xfffff7f8465c  // b.any
   0x0000fffff7f845fc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84600:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84604:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84608:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8460c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84610:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84614:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84618:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8461c:	54000209	b.ls	0xfffff7f8465c  // b.plast
   0x0000fffff7f84620:	36d8008d	tbz	w13, #27, 0xfffff7f84630
   0x0000fffff7f84624:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84628:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8462c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84630:	36d80091	tbz	w17, #27, 0xfffff7f84640
   0x0000fffff7f84634:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84638:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8463c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84640:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f84644:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f84648:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8464c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84650:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84654:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f84658:	1400000e	b	0xfffff7f84690
   0x0000fffff7f8465c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84660:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84664:	aa1303e1	mov	x1, x19
   0x0000fffff7f84668:	aa1503e2	mov	x2, x21
   0x0000fffff7f8466c:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f84670:	aa1403e4	mov	x4, x20
   0x0000fffff7f84674:	aa1603e5	mov	x5, x22
   0x0000fffff7f84678:	d296d210	mov	x16, #0xb690                	// #46736
   0x0000fffff7f8467c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84680:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84684:	d63f0200	blr	x16
   0x0000fffff7f84688:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8468c:	5400a480	b.eq	0xfffff7f85b1c  // b.none
   0x0000fffff7f84690:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f84694:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84698:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f8469c:	b9409271	ldr	w17, [x19, #144]
   0x0000fffff7f846a0:	36d80211	tbz	w17, #27, 0xfffff7f846e0
   0x0000fffff7f846a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f846a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f846ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7f846b0:	540001e1	b.ne	0xfffff7f846ec  // b.any
   0x0000fffff7f846b4:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f846b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f846bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f846c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f846c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f846c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f846cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f846d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f846d4:	540000c9	b.ls	0xfffff7f846ec  // b.plast
   0x0000fffff7f846d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f846dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f846e0:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f846e4:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f846e8:	1400000e	b	0xfffff7f84720
   0x0000fffff7f846ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f846f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f846f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f846f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f846fc:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f84700:	aa1403e4	mov	x4, x20
   0x0000fffff7f84704:	aa1603e5	mov	x5, x22
   0x0000fffff7f84708:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f8470c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84710:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84714:	d63f0200	blr	x16
   0x0000fffff7f84718:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8471c:	5400a040	b.eq	0xfffff7f85b24  // b.none
   0x0000fffff7f84720:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f84724:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84728:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f8472c:	b940a271	ldr	w17, [x19, #160]
   0x0000fffff7f84730:	36d80211	tbz	w17, #27, 0xfffff7f84770
   0x0000fffff7f84734:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84738:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8473c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84740:	540001e1	b.ne	0xfffff7f8477c  // b.any
   0x0000fffff7f84744:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f84748:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8474c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84750:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84754:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84758:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8475c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84760:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84764:	540000c9	b.ls	0xfffff7f8477c  // b.plast
   0x0000fffff7f84768:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8476c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84770:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f84774:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f84778:	1400000e	b	0xfffff7f847b0
   0x0000fffff7f8477c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84780:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84784:	aa1303e1	mov	x1, x19
   0x0000fffff7f84788:	aa1503e2	mov	x2, x21
   0x0000fffff7f8478c:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f84790:	aa1403e4	mov	x4, x20
   0x0000fffff7f84794:	aa1603e5	mov	x5, x22
   0x0000fffff7f84798:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f8479c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f847a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f847a4:	d63f0200	blr	x16
   0x0000fffff7f847a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f847ac:	54009c00	b.eq	0xfffff7f85b2c  // b.none
   0x0000fffff7f847b0:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f847b4:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f847b8:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f847bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847c0:	540001c1	b.ne	0xfffff7f847f8  // b.any
   0x0000fffff7f847c4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f847c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f847cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f847d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f847d4:	54000801	b.ne	0xfffff7f848d4  // b.any
   0x0000fffff7f847d8:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f847dc:	f9403e6b	ldr	x11, [x19, #120]
   0x0000fffff7f847e0:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f847e4:	eb09015f	cmp	x10, x9
   0x0000fffff7f847e8:	54000762	b.cs	0xfffff7f848d4  // b.hs, b.nlast
   0x0000fffff7f847ec:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f847f0:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f847f4:	14000014	b	0xfffff7f84844
   0x0000fffff7f847f8:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f847fc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84800:	540006a0	b.eq	0xfffff7f848d4  // b.none
   0x0000fffff7f84804:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84808:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f8480c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84810:	54000621	b.ne	0xfffff7f848d4  // b.any
   0x0000fffff7f84814:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f84818:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f8481c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84820:	540005a1	b.ne	0xfffff7f848d4  // b.any
   0x0000fffff7f84824:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84828:	b94057ea	ldr	w10, [sp, #84]
   0x0000fffff7f8482c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84830:	54000521	b.ne	0xfffff7f848d4  // b.any
   0x0000fffff7f84834:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84838:	f94033ea	ldr	x10, [sp, #96]
   0x0000fffff7f8483c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84840:	540004a1	b.ne	0xfffff7f848d4  // b.any
   0x0000fffff7f84844:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84848:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8484c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84850:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84854:	54000400	b.eq	0xfffff7f848d4  // b.none
   0x0000fffff7f84858:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8485c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84860:	36d801d1	tbz	w17, #27, 0xfffff7f84898
   0x0000fffff7f84864:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84868:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8486c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84870:	54000321	b.ne	0xfffff7f848d4  // b.any
   0x0000fffff7f84874:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84878:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8487c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84880:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84884:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84888:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8488c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84890:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84894:	54000209	b.ls	0xfffff7f848d4  // b.plast
   0x0000fffff7f84898:	36d8008d	tbz	w13, #27, 0xfffff7f848a8
   0x0000fffff7f8489c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f848a0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f848a4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f848a8:	36d80091	tbz	w17, #27, 0xfffff7f848b8
   0x0000fffff7f848ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f848b0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f848b4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f848b8:	b940a26e	ldr	w14, [x19, #160]
   0x0000fffff7f848bc:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f848c0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f848c4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f848c8:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f848cc:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f848d0:	1400000e	b	0xfffff7f84908
   0x0000fffff7f848d4:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f848d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f848dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f848e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f848e4:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f848e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f848ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f848f0:	d28b5c10	mov	x16, #0x5ae0                	// #23264
   0x0000fffff7f848f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f848f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f848fc:	d63f0200	blr	x16
   0x0000fffff7f84900:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84904:	54009180	b.eq	0xfffff7f85b34  // b.none
   0x0000fffff7f84908:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f8490c:	37d806a9	tbnz	w9, #27, 0xfffff7f849e0
   0x0000fffff7f84910:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84914:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84918:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8491c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84920:	540001c1	b.ne	0xfffff7f84958  // b.any
   0x0000fffff7f84924:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84928:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8492c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84930:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84934:	54000121	b.ne	0xfffff7f84958  // b.any
   0x0000fffff7f84938:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f8493c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84940:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8494c:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f84950:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84954:	14000030	b	0xfffff7f84a14
   0x0000fffff7f84958:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f8495c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84964:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84968:	54000120	b.eq	0xfffff7f8498c  // b.none
   0x0000fffff7f8496c:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84970:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84978:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8497c:	54000321	b.ne	0xfffff7f849e0  // b.any
   0x0000fffff7f84980:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84984:	9e620120	scvtf	d0, x9
   0x0000fffff7f84988:	14000002	b	0xfffff7f84990
   0x0000fffff7f8498c:	fd405660	ldr	d0, [x19, #168]
   0x0000fffff7f84990:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84994:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8499c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849a0:	54000120	b.eq	0xfffff7f849c4  // b.none
   0x0000fffff7f849a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f849a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f849b4:	54000161	b.ne	0xfffff7f849e0  // b.any
   0x0000fffff7f849b8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f849bc:	9e620121	scvtf	d1, x9
   0x0000fffff7f849c0:	14000002	b	0xfffff7f849c8
   0x0000fffff7f849c4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f849c8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f849cc:	fd005660	str	d0, [x19, #168]
   0x0000fffff7f849d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f849d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849d8:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f849dc:	17ffffde	b	0xfffff7f84954
   0x0000fffff7f849e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f849e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f849ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f849f0:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f849f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f849f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f849fc:	d295a890	mov	x16, #0xad44                	// #44356
   0x0000fffff7f84a00:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84a04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84a08:	d63f0200	blr	x16
   0x0000fffff7f84a0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84a10:	54008960	b.eq	0xfffff7f85b3c  // b.none
   0x0000fffff7f84a14:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f84a18:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84a1c:	d2807cac	mov	x12, #0x3e5                 	// #997
   0x0000fffff7f84a20:	b940b271	ldr	w17, [x19, #176]
   0x0000fffff7f84a24:	36d80211	tbz	w17, #27, 0xfffff7f84a64
   0x0000fffff7f84a28:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84a2c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84a30:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84a34:	540001e1	b.ne	0xfffff7f84a70  // b.any
   0x0000fffff7f84a38:	f9405e6f	ldr	x15, [x19, #184]
   0x0000fffff7f84a3c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84a40:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84a44:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84a48:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84a4c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84a50:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84a54:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84a58:	540000c9	b.ls	0xfffff7f84a70  // b.plast
   0x0000fffff7f84a5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84a60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84a64:	f9005e6c	str	x12, [x19, #184]
   0x0000fffff7f84a68:	b900b26d	str	w13, [x19, #176]
   0x0000fffff7f84a6c:	1400000e	b	0xfffff7f84aa4
   0x0000fffff7f84a70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84a74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84a78:	aa1303e1	mov	x1, x19
   0x0000fffff7f84a7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84a80:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f84a84:	aa1403e4	mov	x4, x20
   0x0000fffff7f84a88:	aa1603e5	mov	x5, x22
   0x0000fffff7f84a8c:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f84a90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84a94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84a98:	d63f0200	blr	x16
   0x0000fffff7f84a9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84aa0:	54008520	b.eq	0xfffff7f85b44  // b.none
   0x0000fffff7f84aa4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84aa8:	37d80389	tbnz	w9, #27, 0xfffff7f84b18
   0x0000fffff7f84aac:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84ab0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84ab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84ab8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84abc:	540002e1	b.ne	0xfffff7f84b18  // b.any
   0x0000fffff7f84ac0:	b940b269	ldr	w9, [x19, #176]
   0x0000fffff7f84ac4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84ac8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84acc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84ad0:	54000241	b.ne	0xfffff7f84b18  // b.any
   0x0000fffff7f84ad4:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f84ad8:	f9405e6a	ldr	x10, [x19, #184]
   0x0000fffff7f84adc:	f100015f	cmp	x10, #0x0
   0x0000fffff7f84ae0:	540001c0	b.eq	0xfffff7f84b18  // b.none
   0x0000fffff7f84ae4:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f84ae8:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f84aec:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f84af0:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f84af4:	eb0b015f	cmp	x10, x11
   0x0000fffff7f84af8:	54000100	b.eq	0xfffff7f84b18  // b.none
   0x0000fffff7f84afc:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f84b00:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f84b04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b0c:	f9005669	str	x9, [x19, #168]
   0x0000fffff7f84b10:	b900a26a	str	w10, [x19, #160]
   0x0000fffff7f84b14:	1400000e	b	0xfffff7f84b4c
   0x0000fffff7f84b18:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84b1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84b20:	aa1303e1	mov	x1, x19
   0x0000fffff7f84b24:	aa1503e2	mov	x2, x21
   0x0000fffff7f84b28:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f84b2c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84b30:	aa1603e5	mov	x5, x22
   0x0000fffff7f84b34:	d2947a10	mov	x16, #0xa3d0                	// #41936
   0x0000fffff7f84b38:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84b3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84b40:	d63f0200	blr	x16
   0x0000fffff7f84b44:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84b48:	54008020	b.eq	0xfffff7f85b4c  // b.none
   0x0000fffff7f84b4c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84b50:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f84b54:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f84b58:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b5c:	540001c1	b.ne	0xfffff7f84b94  // b.any
   0x0000fffff7f84b60:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84b64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84b68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84b6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84b70:	54000701	b.ne	0xfffff7f84c50  // b.any
   0x0000fffff7f84b74:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f84b78:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f84b7c:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f84b80:	eb09015f	cmp	x10, x9
   0x0000fffff7f84b84:	54000662	b.cs	0xfffff7f84c50  // b.hs, b.nlast
   0x0000fffff7f84b88:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84b8c:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f84b90:	14000014	b	0xfffff7f84be0
   0x0000fffff7f84b94:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84b98:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84b9c:	540005a0	b.eq	0xfffff7f84c50  // b.none
   0x0000fffff7f84ba0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f84ba4:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84ba8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bac:	54000521	b.ne	0xfffff7f84c50  // b.any
   0x0000fffff7f84bb0:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f84bb4:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84bb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bbc:	540004a1	b.ne	0xfffff7f84c50  // b.any
   0x0000fffff7f84bc0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84bc4:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f84bc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bcc:	54000421	b.ne	0xfffff7f84c50  // b.any
   0x0000fffff7f84bd0:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84bd4:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f84bd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bdc:	540003a1	b.ne	0xfffff7f84c50  // b.any
   0x0000fffff7f84be0:	b940a26d	ldr	w13, [x19, #160]
   0x0000fffff7f84be4:	f940566c	ldr	x12, [x19, #168]
   0x0000fffff7f84be8:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84bec:	36d801d1	tbz	w17, #27, 0xfffff7f84c24
   0x0000fffff7f84bf0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84bf4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84bf8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84bfc:	540002a1	b.ne	0xfffff7f84c50  // b.any
   0x0000fffff7f84c00:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84c04:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84c08:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84c0c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84c10:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84c14:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84c18:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84c1c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84c20:	54000189	b.ls	0xfffff7f84c50  // b.plast
   0x0000fffff7f84c24:	36d8008d	tbz	w13, #27, 0xfffff7f84c34
   0x0000fffff7f84c28:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84c2c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84c30:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84c34:	36d80091	tbz	w17, #27, 0xfffff7f84c44
   0x0000fffff7f84c38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84c3c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84c40:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84c44:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84c48:	b900016d	str	w13, [x11]
   0x0000fffff7f84c4c:	1400000e	b	0xfffff7f84c84
   0x0000fffff7f84c50:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84c54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84c58:	aa1303e1	mov	x1, x19
   0x0000fffff7f84c5c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84c60:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f84c64:	aa1403e4	mov	x4, x20
   0x0000fffff7f84c68:	aa1603e5	mov	x5, x22
   0x0000fffff7f84c6c:	d28dc410	mov	x16, #0x6e20                	// #28192
   0x0000fffff7f84c70:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84c74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84c78:	d63f0200	blr	x16
   0x0000fffff7f84c7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84c80:	540076a0	b.eq	0xfffff7f85b54  // b.none
   0x0000fffff7f84c84:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f84c88:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f84c8c:	d29a940c	mov	x12, #0xd4a0                	// #54432
   0x0000fffff7f84c90:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84c94:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f84c98:	b9408271	ldr	w17, [x19, #128]
   0x0000fffff7f84c9c:	36d801d1	tbz	w17, #27, 0xfffff7f84cd4
   0x0000fffff7f84ca0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84ca4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84ca8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84cac:	54000281	b.ne	0xfffff7f84cfc  // b.any
   0x0000fffff7f84cb0:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f84cb4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84cb8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84cbc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84cc0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84cc4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84cc8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84ccc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84cd0:	54000169	b.ls	0xfffff7f84cfc  // b.plast
   0x0000fffff7f84cd4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84cd8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84cdc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84ce0:	36d80091	tbz	w17, #27, 0xfffff7f84cf0
   0x0000fffff7f84ce4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84ce8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84cec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84cf0:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f84cf4:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f84cf8:	1400000e	b	0xfffff7f84d30
   0x0000fffff7f84cfc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84d00:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84d04:	aa1303e1	mov	x1, x19
   0x0000fffff7f84d08:	aa1503e2	mov	x2, x21
   0x0000fffff7f84d0c:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f84d10:	aa1403e4	mov	x4, x20
   0x0000fffff7f84d14:	aa1603e5	mov	x5, x22
   0x0000fffff7f84d18:	d295f290	mov	x16, #0xaf94                	// #44948
   0x0000fffff7f84d1c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84d20:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84d24:	d63f0200	blr	x16
   0x0000fffff7f84d28:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84d2c:	54007180	b.eq	0xfffff7f85b5c  // b.none
   0x0000fffff7f84d30:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7f84d34:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84d38:	540003a0	b.eq	0xfffff7f84dac  // b.none
   0x0000fffff7f84d3c:	b940626d	ldr	w13, [x19, #96]
   0x0000fffff7f84d40:	f940366c	ldr	x12, [x19, #104]
   0x0000fffff7f84d44:	b9400171	ldr	w17, [x11]
   0x0000fffff7f84d48:	36d801d1	tbz	w17, #27, 0xfffff7f84d80
   0x0000fffff7f84d4c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84d50:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84d54:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84d58:	540002a1	b.ne	0xfffff7f84dac  // b.any
   0x0000fffff7f84d5c:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84d60:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d64:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84d68:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84d6c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84d70:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84d74:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84d78:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84d7c:	54000189	b.ls	0xfffff7f84dac  // b.plast
   0x0000fffff7f84d80:	36d8008d	tbz	w13, #27, 0xfffff7f84d90
   0x0000fffff7f84d84:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84d88:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84d8c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84d90:	36d80091	tbz	w17, #27, 0xfffff7f84da0
   0x0000fffff7f84d94:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d98:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84d9c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84da0:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84da4:	b900016d	str	w13, [x11]
   0x0000fffff7f84da8:	1400000e	b	0xfffff7f84de0
   0x0000fffff7f84dac:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f84db0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84db4:	aa1303e1	mov	x1, x19
   0x0000fffff7f84db8:	aa1503e2	mov	x2, x21
   0x0000fffff7f84dbc:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f84dc0:	aa1403e4	mov	x4, x20
   0x0000fffff7f84dc4:	aa1603e5	mov	x5, x22
   0x0000fffff7f84dc8:	d299ea10	mov	x16, #0xcf50                	// #53072
   0x0000fffff7f84dcc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84dd0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84dd4:	d63f0200	blr	x16
   0x0000fffff7f84dd8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ddc:	54006c40	b.eq	0xfffff7f85b64  // b.none
   0x0000fffff7f84de0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84de4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84de8:	aa1303e1	mov	x1, x19
   0x0000fffff7f84dec:	aa1503e2	mov	x2, x21
   0x0000fffff7f84df0:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f84df4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84df8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84dfc:	d28a1c10	mov	x16, #0x50e0                	// #20704
   0x0000fffff7f84e00:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84e04:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84e08:	d63f0200	blr	x16
   0x0000fffff7f84e0c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84e10:	54006ae0	b.eq	0xfffff7f85b6c  // b.none
   0x0000fffff7f84e14:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f84e18:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84e1c:	540004a0	b.eq	0xfffff7f84eb0  // b.none
   0x0000fffff7f84e20:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84e24:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84e28:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84e2c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84e30:	54000400	b.eq	0xfffff7f84eb0  // b.none
   0x0000fffff7f84e34:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84e38:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84e3c:	36d801d1	tbz	w17, #27, 0xfffff7f84e74
   0x0000fffff7f84e40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84e44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84e48:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84e4c:	54000321	b.ne	0xfffff7f84eb0  // b.any
   0x0000fffff7f84e50:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84e54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84e58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84e5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84e60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84e64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84e68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84e6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84e70:	54000209	b.ls	0xfffff7f84eb0  // b.plast
   0x0000fffff7f84e74:	36d8008d	tbz	w13, #27, 0xfffff7f84e84
   0x0000fffff7f84e78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84e7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84e80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84e84:	36d80091	tbz	w17, #27, 0xfffff7f84e94
   0x0000fffff7f84e88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84e8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84e90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84e94:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f84e98:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f84e9c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84ea0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84ea4:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f84ea8:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f84eac:	1400000e	b	0xfffff7f84ee4
   0x0000fffff7f84eb0:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f84eb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84eb8:	aa1303e1	mov	x1, x19
   0x0000fffff7f84ebc:	aa1503e2	mov	x2, x21
   0x0000fffff7f84ec0:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f84ec4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ec8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84ecc:	d2960010	mov	x16, #0xb000                	// #45056
   0x0000fffff7f84ed0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84ed4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ed8:	d63f0200	blr	x16
   0x0000fffff7f84edc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ee0:	540064a0	b.eq	0xfffff7f85b74  // b.none
   0x0000fffff7f84ee4:	5280008d	mov	w13, #0x4                   	// #4
   0x0000fffff7f84ee8:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84eec:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f84ef0:	f2e7fa0c	movk	x12, #0x3fd0, lsl #48
   0x0000fffff7f84ef4:	b940a271	ldr	w17, [x19, #160]
   0x0000fffff7f84ef8:	36d80211	tbz	w17, #27, 0xfffff7f84f38
   0x0000fffff7f84efc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84f00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84f04:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84f08:	540001e1	b.ne	0xfffff7f84f44  // b.any
   0x0000fffff7f84f0c:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f84f10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84f14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84f18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84f1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84f20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84f24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84f28:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84f2c:	540000c9	b.ls	0xfffff7f84f44  // b.plast
   0x0000fffff7f84f30:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84f34:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84f38:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f84f3c:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f84f40:	1400000e	b	0xfffff7f84f78
   0x0000fffff7f84f44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84f48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84f4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84f50:	aa1503e2	mov	x2, x21
   0x0000fffff7f84f54:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f84f58:	aa1403e4	mov	x4, x20
   0x0000fffff7f84f5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84f60:	d295f290	mov	x16, #0xaf94                	// #44948
   0x0000fffff7f84f64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84f68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84f6c:	d63f0200	blr	x16
   0x0000fffff7f84f70:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84f74:	54006040	b.eq	0xfffff7f85b7c  // b.none
   0x0000fffff7f84f78:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84f7c:	37d806a9	tbnz	w9, #27, 0xfffff7f85050
   0x0000fffff7f84f80:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84f84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84f88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84f8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84f90:	540001c1	b.ne	0xfffff7f84fc8  // b.any
   0x0000fffff7f84f94:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f84f98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84f9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fa0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84fa4:	54000121	b.ne	0xfffff7f84fc8  // b.any
   0x0000fffff7f84fa8:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84fac:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f84fb0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84fb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84fb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fbc:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f84fc0:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f84fc4:	14000030	b	0xfffff7f85084
   0x0000fffff7f84fc8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84fcc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84fd0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fd4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84fd8:	54000120	b.eq	0xfffff7f84ffc  // b.none
   0x0000fffff7f84fdc:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f84fe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84fe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fe8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84fec:	54000321	b.ne	0xfffff7f85050  // b.any
   0x0000fffff7f84ff0:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f84ff4:	9e620120	scvtf	d0, x9
   0x0000fffff7f84ff8:	14000002	b	0xfffff7f85000
   0x0000fffff7f84ffc:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7f85000:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f85004:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85008:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8500c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85010:	54000120	b.eq	0xfffff7f85034  // b.none
   0x0000fffff7f85014:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f85018:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8501c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85020:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85024:	54000161	b.ne	0xfffff7f85050  // b.any
   0x0000fffff7f85028:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f8502c:	9e620121	scvtf	d1, x9
   0x0000fffff7f85030:	14000002	b	0xfffff7f85038
   0x0000fffff7f85034:	fd405661	ldr	d1, [x19, #168]
   0x0000fffff7f85038:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8503c:	fd004e60	str	d0, [x19, #152]
   0x0000fffff7f85040:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85044:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85048:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f8504c:	17ffffde	b	0xfffff7f84fc4
   0x0000fffff7f85050:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85054:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85058:	aa1303e1	mov	x1, x19
   0x0000fffff7f8505c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85060:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f85064:	aa1403e4	mov	x4, x20
   0x0000fffff7f85068:	aa1603e5	mov	x5, x22
   0x0000fffff7f8506c:	d295a890	mov	x16, #0xad44                	// #44356
   0x0000fffff7f85070:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85074:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85078:	d63f0200	blr	x16
   0x0000fffff7f8507c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85080:	54005820	b.eq	0xfffff7f85b84  // b.none
   0x0000fffff7f85084:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f85088:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8508c:	540003a0	b.eq	0xfffff7f85100  // b.none
   0x0000fffff7f85090:	b940926d	ldr	w13, [x19, #144]
   0x0000fffff7f85094:	f9404e6c	ldr	x12, [x19, #152]
   0x0000fffff7f85098:	b9400171	ldr	w17, [x11]
   0x0000fffff7f8509c:	36d801d1	tbz	w17, #27, 0xfffff7f850d4
   0x0000fffff7f850a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f850a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f850a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f850ac:	540002a1	b.ne	0xfffff7f85100  // b.any
   0x0000fffff7f850b0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f850b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f850b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f850bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f850c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f850c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f850c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f850cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f850d0:	54000189	b.ls	0xfffff7f85100  // b.plast
   0x0000fffff7f850d4:	36d8008d	tbz	w13, #27, 0xfffff7f850e4
   0x0000fffff7f850d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f850dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f850e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f850e4:	36d80091	tbz	w17, #27, 0xfffff7f850f4
   0x0000fffff7f850e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f850ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f850f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f850f4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f850f8:	b900016d	str	w13, [x11]
   0x0000fffff7f850fc:	1400000e	b	0xfffff7f85134
   0x0000fffff7f85100:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f85104:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85108:	aa1303e1	mov	x1, x19
   0x0000fffff7f8510c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85110:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f85114:	aa1403e4	mov	x4, x20
   0x0000fffff7f85118:	aa1603e5	mov	x5, x22
   0x0000fffff7f8511c:	d299ea10	mov	x16, #0xcf50                	// #53072
   0x0000fffff7f85120:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85124:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85128:	d63f0200	blr	x16
   0x0000fffff7f8512c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85130:	540052e0	b.eq	0xfffff7f85b8c  // b.none
   0x0000fffff7f85134:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f85138:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8513c:	540004a0	b.eq	0xfffff7f851d0  // b.none
   0x0000fffff7f85140:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85144:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85148:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8514c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85150:	54000400	b.eq	0xfffff7f851d0  // b.none
   0x0000fffff7f85154:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85158:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8515c:	36d801d1	tbz	w17, #27, 0xfffff7f85194
   0x0000fffff7f85160:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85164:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85168:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8516c:	54000321	b.ne	0xfffff7f851d0  // b.any
   0x0000fffff7f85170:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85174:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85178:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8517c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85180:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85184:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85188:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8518c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85190:	54000209	b.ls	0xfffff7f851d0  // b.plast
   0x0000fffff7f85194:	36d8008d	tbz	w13, #27, 0xfffff7f851a4
   0x0000fffff7f85198:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8519c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f851a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f851a4:	36d80091	tbz	w17, #27, 0xfffff7f851b4
   0x0000fffff7f851a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f851ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f851b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f851b4:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f851b8:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f851bc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f851c0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f851c4:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f851c8:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f851cc:	1400000e	b	0xfffff7f85204
   0x0000fffff7f851d0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f851d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f851d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f851dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f851e0:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f851e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f851e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f851ec:	d296d210	mov	x16, #0xb690                	// #46736
   0x0000fffff7f851f0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f851f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f851f8:	d63f0200	blr	x16
   0x0000fffff7f851fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85200:	54004ca0	b.eq	0xfffff7f85b94  // b.none
   0x0000fffff7f85204:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f85208:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f8520c:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f85210:	b9409271	ldr	w17, [x19, #144]
   0x0000fffff7f85214:	36d80211	tbz	w17, #27, 0xfffff7f85254
   0x0000fffff7f85218:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8521c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85220:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85224:	540001e1	b.ne	0xfffff7f85260  // b.any
   0x0000fffff7f85228:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f8522c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85230:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85234:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85238:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8523c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85240:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85244:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85248:	540000c9	b.ls	0xfffff7f85260  // b.plast
   0x0000fffff7f8524c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85250:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85254:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f85258:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f8525c:	1400000e	b	0xfffff7f85294
   0x0000fffff7f85260:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85264:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85268:	aa1303e1	mov	x1, x19
   0x0000fffff7f8526c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85270:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f85274:	aa1403e4	mov	x4, x20
   0x0000fffff7f85278:	aa1603e5	mov	x5, x22
   0x0000fffff7f8527c:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f85280:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85284:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85288:	d63f0200	blr	x16
   0x0000fffff7f8528c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85290:	54004860	b.eq	0xfffff7f85b9c  // b.none
   0x0000fffff7f85294:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85298:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f8529c:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f852a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852a4:	540001c1	b.ne	0xfffff7f852dc  // b.any
   0x0000fffff7f852a8:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f852ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f852b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f852b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852b8:	54000801	b.ne	0xfffff7f853b8  // b.any
   0x0000fffff7f852bc:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f852c0:	f940466b	ldr	x11, [x19, #136]
   0x0000fffff7f852c4:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f852c8:	eb09015f	cmp	x10, x9
   0x0000fffff7f852cc:	54000762	b.cs	0xfffff7f853b8  // b.hs, b.nlast
   0x0000fffff7f852d0:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f852d4:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f852d8:	14000014	b	0xfffff7f85328
   0x0000fffff7f852dc:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f852e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f852e4:	540006a0	b.eq	0xfffff7f853b8  // b.none
   0x0000fffff7f852e8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f852ec:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f852f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f852f4:	54000621	b.ne	0xfffff7f853b8  // b.any
   0x0000fffff7f852f8:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f852fc:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f85300:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85304:	540005a1	b.ne	0xfffff7f853b8  // b.any
   0x0000fffff7f85308:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8530c:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f85310:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85314:	54000521	b.ne	0xfffff7f853b8  // b.any
   0x0000fffff7f85318:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f8531c:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f85320:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85324:	540004a1	b.ne	0xfffff7f853b8  // b.any
   0x0000fffff7f85328:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8532c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85330:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85334:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85338:	54000400	b.eq	0xfffff7f853b8  // b.none
   0x0000fffff7f8533c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85340:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85344:	36d801d1	tbz	w17, #27, 0xfffff7f8537c
   0x0000fffff7f85348:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8534c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85350:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85354:	54000321	b.ne	0xfffff7f853b8  // b.any
   0x0000fffff7f85358:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8535c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85360:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85364:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85368:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8536c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85370:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85374:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85378:	54000209	b.ls	0xfffff7f853b8  // b.plast
   0x0000fffff7f8537c:	36d8008d	tbz	w13, #27, 0xfffff7f8538c
   0x0000fffff7f85380:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85384:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85388:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8538c:	36d80091	tbz	w17, #27, 0xfffff7f8539c
   0x0000fffff7f85390:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85394:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85398:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8539c:	b940826e	ldr	w14, [x19, #128]
   0x0000fffff7f853a0:	f940466f	ldr	x15, [x19, #136]
   0x0000fffff7f853a4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f853a8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f853ac:	f900466c	str	x12, [x19, #136]
   0x0000fffff7f853b0:	b900826d	str	w13, [x19, #128]
   0x0000fffff7f853b4:	1400000e	b	0xfffff7f853ec
   0x0000fffff7f853b8:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f853bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f853c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f853c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f853c8:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f853cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f853d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f853d4:	d28b5c10	mov	x16, #0x5ae0                	// #23264
   0x0000fffff7f853d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f853dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f853e0:	d63f0200	blr	x16
   0x0000fffff7f853e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f853e8:	54003de0	b.eq	0xfffff7f85ba4  // b.none
   0x0000fffff7f853ec:	f94057eb	ldr	x11, [sp, #168]
   0x0000fffff7f853f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f853f4:	540004a0	b.eq	0xfffff7f85488  // b.none
   0x0000fffff7f853f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f853fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85400:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85404:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85408:	54000400	b.eq	0xfffff7f85488  // b.none
   0x0000fffff7f8540c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85410:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85414:	36d801d1	tbz	w17, #27, 0xfffff7f8544c
   0x0000fffff7f85418:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8541c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85420:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85424:	54000321	b.ne	0xfffff7f85488  // b.any
   0x0000fffff7f85428:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8542c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85430:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85434:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85438:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8543c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85440:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85444:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85448:	54000209	b.ls	0xfffff7f85488  // b.plast
   0x0000fffff7f8544c:	36d8008d	tbz	w13, #27, 0xfffff7f8545c
   0x0000fffff7f85450:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85454:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85458:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8545c:	36d80091	tbz	w17, #27, 0xfffff7f8546c
   0x0000fffff7f85460:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85464:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85468:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8546c:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f85470:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f85474:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85478:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f8547c:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f85480:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f85484:	1400000e	b	0xfffff7f854bc
   0x0000fffff7f85488:	910243e6	add	x6, sp, #0x90
   0x0000fffff7f8548c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85490:	aa1303e1	mov	x1, x19
   0x0000fffff7f85494:	aa1503e2	mov	x2, x21
   0x0000fffff7f85498:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f8549c:	aa1403e4	mov	x4, x20
   0x0000fffff7f854a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f854a4:	d296d210	mov	x16, #0xb690                	// #46736
   0x0000fffff7f854a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f854ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f854b0:	d63f0200	blr	x16
   0x0000fffff7f854b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f854b8:	540037a0	b.eq	0xfffff7f85bac  // b.none
   0x0000fffff7f854bc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f854c0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f854c4:	d280022c	mov	x12, #0x11                  	// #17
   0x0000fffff7f854c8:	b940a271	ldr	w17, [x19, #160]
   0x0000fffff7f854cc:	36d80211	tbz	w17, #27, 0xfffff7f8550c
   0x0000fffff7f854d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f854d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f854d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f854dc:	540001e1	b.ne	0xfffff7f85518  // b.any
   0x0000fffff7f854e0:	f940566f	ldr	x15, [x19, #168]
   0x0000fffff7f854e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f854e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f854ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f854f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f854f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f854f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f854fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85500:	540000c9	b.ls	0xfffff7f85518  // b.plast
   0x0000fffff7f85504:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85508:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8550c:	f900566c	str	x12, [x19, #168]
   0x0000fffff7f85510:	b900a26d	str	w13, [x19, #160]
   0x0000fffff7f85514:	1400000e	b	0xfffff7f8554c
   0x0000fffff7f85518:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8551c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85520:	aa1303e1	mov	x1, x19
   0x0000fffff7f85524:	aa1503e2	mov	x2, x21
   0x0000fffff7f85528:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f8552c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85530:	aa1603e5	mov	x5, x22
   0x0000fffff7f85534:	d2875210	mov	x16, #0x3a90                	// #14992
   0x0000fffff7f85538:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8553c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85540:	d63f0200	blr	x16
   0x0000fffff7f85544:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85548:	54003360	b.eq	0xfffff7f85bb4  // b.none
   0x0000fffff7f8554c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85550:	37d80389	tbnz	w9, #27, 0xfffff7f855c0
   0x0000fffff7f85554:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85558:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8555c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85560:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85564:	540002e1	b.ne	0xfffff7f855c0  // b.any
   0x0000fffff7f85568:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f8556c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85570:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85574:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85578:	54000241	b.ne	0xfffff7f855c0  // b.any
   0x0000fffff7f8557c:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f85580:	f940566a	ldr	x10, [x19, #168]
   0x0000fffff7f85584:	f100015f	cmp	x10, #0x0
   0x0000fffff7f85588:	540001c0	b.eq	0xfffff7f855c0  // b.none
   0x0000fffff7f8558c:	d29fffeb	mov	x11, #0xffff                	// #65535
   0x0000fffff7f85590:	f2bfffeb	movk	x11, #0xffff, lsl #16
   0x0000fffff7f85594:	f2dfffeb	movk	x11, #0xffff, lsl #32
   0x0000fffff7f85598:	f2ffffeb	movk	x11, #0xffff, lsl #48
   0x0000fffff7f8559c:	eb0b015f	cmp	x10, x11
   0x0000fffff7f855a0:	54000100	b.eq	0xfffff7f855c0  // b.none
   0x0000fffff7f855a4:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f855a8:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f855ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855b4:	f9004e69	str	x9, [x19, #152]
   0x0000fffff7f855b8:	b900926a	str	w10, [x19, #144]
   0x0000fffff7f855bc:	1400000e	b	0xfffff7f855f4
   0x0000fffff7f855c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f855c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f855cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f855d0:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f855d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f855d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f855dc:	d2947a10	mov	x16, #0xa3d0                	// #41936
   0x0000fffff7f855e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f855e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f855e8:	d63f0200	blr	x16
   0x0000fffff7f855ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f855f0:	54002e60	b.eq	0xfffff7f85bbc  // b.none
   0x0000fffff7f855f4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f855f8:	37d806a9	tbnz	w9, #27, 0xfffff7f856cc
   0x0000fffff7f855fc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85608:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8560c:	540001c1	b.ne	0xfffff7f85644  // b.any
   0x0000fffff7f85610:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85614:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8561c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85620:	54000121	b.ne	0xfffff7f85644  // b.any
   0x0000fffff7f85624:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85628:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f8562c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85638:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f8563c:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f85640:	14000030	b	0xfffff7f85700
   0x0000fffff7f85644:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85648:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8564c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85650:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85654:	54000120	b.eq	0xfffff7f85678  // b.none
   0x0000fffff7f85658:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f8565c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85664:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85668:	54000321	b.ne	0xfffff7f856cc  // b.any
   0x0000fffff7f8566c:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85670:	9e620120	scvtf	d0, x9
   0x0000fffff7f85674:	14000002	b	0xfffff7f8567c
   0x0000fffff7f85678:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f8567c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85680:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85688:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8568c:	54000120	b.eq	0xfffff7f856b0  // b.none
   0x0000fffff7f85690:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8569c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f856a0:	54000161	b.ne	0xfffff7f856cc  // b.any
   0x0000fffff7f856a4:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f856a8:	9e620121	scvtf	d1, x9
   0x0000fffff7f856ac:	14000002	b	0xfffff7f856b4
   0x0000fffff7f856b0:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f856b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f856b8:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f856bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f856c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f856c4:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f856c8:	17ffffde	b	0xfffff7f85640
   0x0000fffff7f856cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f856d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f856d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f856d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f856dc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f856e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f856e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f856e8:	d295a890	mov	x16, #0xad44                	// #44356
   0x0000fffff7f856ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f856f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f856f4:	d63f0200	blr	x16
   0x0000fffff7f856f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f856fc:	54002640	b.eq	0xfffff7f85bc4  // b.none
   0x0000fffff7f85700:	f94067eb	ldr	x11, [sp, #200]
   0x0000fffff7f85704:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85708:	540004a0	b.eq	0xfffff7f8579c  // b.none
   0x0000fffff7f8570c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85710:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85714:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85718:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8571c:	54000400	b.eq	0xfffff7f8579c  // b.none
   0x0000fffff7f85720:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85724:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85728:	36d801d1	tbz	w17, #27, 0xfffff7f85760
   0x0000fffff7f8572c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85730:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85734:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85738:	54000321	b.ne	0xfffff7f8579c  // b.any
   0x0000fffff7f8573c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85740:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85744:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85748:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8574c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85750:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85754:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85758:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8575c:	54000209	b.ls	0xfffff7f8579c  // b.plast
   0x0000fffff7f85760:	36d8008d	tbz	w13, #27, 0xfffff7f85770
   0x0000fffff7f85764:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85768:	91000529	add	x9, x9, #0x1
   0x0000fffff7f8576c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85770:	36d80091	tbz	w17, #27, 0xfffff7f85780
   0x0000fffff7f85774:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85778:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f8577c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85780:	b940926e	ldr	w14, [x19, #144]
   0x0000fffff7f85784:	f9404e6f	ldr	x15, [x19, #152]
   0x0000fffff7f85788:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f8578c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85790:	f9004e6c	str	x12, [x19, #152]
   0x0000fffff7f85794:	b900926d	str	w13, [x19, #144]
   0x0000fffff7f85798:	1400000e	b	0xfffff7f857d0
   0x0000fffff7f8579c:	9102c3e6	add	x6, sp, #0xb0
   0x0000fffff7f857a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f857a4:	aa1303e1	mov	x1, x19
   0x0000fffff7f857a8:	aa1503e2	mov	x2, x21
   0x0000fffff7f857ac:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f857b0:	aa1403e4	mov	x4, x20
   0x0000fffff7f857b4:	aa1603e5	mov	x5, x22
   0x0000fffff7f857b8:	d296d210	mov	x16, #0xb690                	// #46736
   0x0000fffff7f857bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f857c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f857c4:	d63f0200	blr	x16
   0x0000fffff7f857c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f857cc:	54002000	b.eq	0xfffff7f85bcc  // b.none
   0x0000fffff7f857d0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f857d4:	37d806a9	tbnz	w9, #27, 0xfffff7f858a8
   0x0000fffff7f857d8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f857dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857e8:	540001c1	b.ne	0xfffff7f85820  // b.any
   0x0000fffff7f857ec:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f857f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f857f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f857fc:	54000121	b.ne	0xfffff7f85820  // b.any
   0x0000fffff7f85800:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85804:	f9404e6a	ldr	x10, [x19, #152]
   0x0000fffff7f85808:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8580c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85810:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85814:	f9004669	str	x9, [x19, #136]
   0x0000fffff7f85818:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f8581c:	14000030	b	0xfffff7f858dc
   0x0000fffff7f85820:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85824:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85828:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8582c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85830:	54000120	b.eq	0xfffff7f85854  // b.none
   0x0000fffff7f85834:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85838:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8583c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85840:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85844:	54000321	b.ne	0xfffff7f858a8  // b.any
   0x0000fffff7f85848:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f8584c:	9e620120	scvtf	d0, x9
   0x0000fffff7f85850:	14000002	b	0xfffff7f85858
   0x0000fffff7f85854:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f85858:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8585c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85860:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85864:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85868:	54000120	b.eq	0xfffff7f8588c  // b.none
   0x0000fffff7f8586c:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f85870:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85874:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85878:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8587c:	54000161	b.ne	0xfffff7f858a8  // b.any
   0x0000fffff7f85880:	f9404e69	ldr	x9, [x19, #152]
   0x0000fffff7f85884:	9e620121	scvtf	d1, x9
   0x0000fffff7f85888:	14000002	b	0xfffff7f85890
   0x0000fffff7f8588c:	fd404e61	ldr	d1, [x19, #152]
   0x0000fffff7f85890:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85894:	fd004660	str	d0, [x19, #136]
   0x0000fffff7f85898:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8589c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858a0:	b900826a	str	w10, [x19, #128]
   0x0000fffff7f858a4:	17ffffde	b	0xfffff7f8581c
   0x0000fffff7f858a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f858ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f858b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f858b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f858b8:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f858bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f858c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f858c4:	d295a890	mov	x16, #0xad44                	// #44356
   0x0000fffff7f858c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f858cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858d0:	d63f0200	blr	x16
   0x0000fffff7f858d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f858d8:	540017e0	b.eq	0xfffff7f85bd4  // b.none
   0x0000fffff7f858dc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f858e0:	37d806a9	tbnz	w9, #27, 0xfffff7f859b4
   0x0000fffff7f858e4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f858e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858f4:	540001c1	b.ne	0xfffff7f8592c  // b.any
   0x0000fffff7f858f8:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f858fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85900:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85904:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85908:	54000121	b.ne	0xfffff7f8592c  // b.any
   0x0000fffff7f8590c:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85910:	f940466a	ldr	x10, [x19, #136]
   0x0000fffff7f85914:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85918:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8591c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85920:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7f85924:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f85928:	14000030	b	0xfffff7f859e8
   0x0000fffff7f8592c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85930:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85938:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8593c:	54000120	b.eq	0xfffff7f85960  // b.none
   0x0000fffff7f85940:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85944:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85948:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8594c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85950:	54000321	b.ne	0xfffff7f859b4  // b.any
   0x0000fffff7f85954:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7f85958:	9e620120	scvtf	d0, x9
   0x0000fffff7f8595c:	14000002	b	0xfffff7f85964
   0x0000fffff7f85960:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f85964:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f85968:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8596c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85970:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85974:	54000120	b.eq	0xfffff7f85998  // b.none
   0x0000fffff7f85978:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f8597c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85984:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85988:	54000161	b.ne	0xfffff7f859b4  // b.any
   0x0000fffff7f8598c:	f9404669	ldr	x9, [x19, #136]
   0x0000fffff7f85990:	9e620121	scvtf	d1, x9
   0x0000fffff7f85994:	14000002	b	0xfffff7f8599c
   0x0000fffff7f85998:	fd404661	ldr	d1, [x19, #136]
   0x0000fffff7f8599c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f859a0:	fd002e60	str	d0, [x19, #88]
   0x0000fffff7f859a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f859a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859ac:	b900526a	str	w10, [x19, #80]
   0x0000fffff7f859b0:	17ffffde	b	0xfffff7f85928
   0x0000fffff7f859b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f859b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f859bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f859c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f859c4:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f859c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f859cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f859d0:	d295a890	mov	x16, #0xad44                	// #44356
   0x0000fffff7f859d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f859d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f859dc:	d63f0200	blr	x16
   0x0000fffff7f859e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f859e4:	54000fc0	b.eq	0xfffff7f85bdc  // b.none
   0x0000fffff7f859e8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f859ec:	37d80269	tbnz	w9, #27, 0xfffff7f85a38
   0x0000fffff7f859f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f859f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f859f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f859fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85a00:	540001c1	b.ne	0xfffff7f85a38  // b.any
   0x0000fffff7f85a04:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85a08:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f85a0c:	8b0a012b	add	x11, x9, x10
   0x0000fffff7f85a10:	f9003e69	str	x9, [x19, #120]
   0x0000fffff7f85a14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a1c:	b900726a	str	w10, [x19, #112]
   0x0000fffff7f85a20:	aa0b03e9	mov	x9, x11
   0x0000fffff7f85a24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85a28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85a2c:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f85a30:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f85a34:	1400000e	b	0xfffff7f85a6c
   0x0000fffff7f85a38:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85a3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a40:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a44:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a48:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f85a4c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a50:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a54:	d293ce10	mov	x16, #0x9e70                	// #40560
   0x0000fffff7f85a58:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85a5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a60:	d63f0200	blr	x16
   0x0000fffff7f85a64:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85a68:	54000be0	b.eq	0xfffff7f85be4  // b.none
   0x0000fffff7f85a6c:	17fff9c3	b	0xfffff7f84178
   0x0000fffff7f85a70:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85a74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a78:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a80:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f85a84:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a88:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a8c:	d2895490	mov	x16, #0x4aa4                	// #19108
   0x0000fffff7f85a90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85a94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a98:	d63f0200	blr	x16
   0x0000fffff7f85a9c:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85aa0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85aa4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85aa8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85aac:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85ab0:	d65f03c0	ret
   0x0000fffff7f85ab4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ab8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85abc:	b900028a	str	w10, [x20]
   0x0000fffff7f85ac0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85ac4:	910343ff	add	sp, sp, #0xd0
   0x0000fffff7f85ac8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85acc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ad0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ad4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85ad8:	d65f03c0	ret
   0x0000fffff7f85adc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f85ae0:	17fffff5	b	0xfffff7f85ab4
   0x0000fffff7f85ae4:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f85ae8:	17fffff3	b	0xfffff7f85ab4
   0x0000fffff7f85aec:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f85af0:	17fffff1	b	0xfffff7f85ab4
   0x0000fffff7f85af4:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f85af8:	17ffffef	b	0xfffff7f85ab4
   0x0000fffff7f85afc:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f85b00:	17ffffed	b	0xfffff7f85ab4
   0x0000fffff7f85b04:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f85b08:	17ffffeb	b	0xfffff7f85ab4
   0x0000fffff7f85b0c:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f85b10:	17ffffe9	b	0xfffff7f85ab4
   0x0000fffff7f85b14:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f85b18:	17ffffe7	b	0xfffff7f85ab4
   0x0000fffff7f85b1c:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f85b20:	17ffffe5	b	0xfffff7f85ab4
   0x0000fffff7f85b24:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f85b28:	17ffffe3	b	0xfffff7f85ab4
   0x0000fffff7f85b2c:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f85b30:	17ffffe1	b	0xfffff7f85ab4
   0x0000fffff7f85b34:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f85b38:	17ffffdf	b	0xfffff7f85ab4
   0x0000fffff7f85b3c:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f85b40:	17ffffdd	b	0xfffff7f85ab4
   0x0000fffff7f85b44:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f85b48:	17ffffdb	b	0xfffff7f85ab4
   0x0000fffff7f85b4c:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f85b50:	17ffffd9	b	0xfffff7f85ab4
   0x0000fffff7f85b54:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f85b58:	17ffffd7	b	0xfffff7f85ab4
   0x0000fffff7f85b5c:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f85b60:	17ffffd5	b	0xfffff7f85ab4
   0x0000fffff7f85b64:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f85b68:	17ffffd3	b	0xfffff7f85ab4
   0x0000fffff7f85b6c:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f85b70:	17ffffd1	b	0xfffff7f85ab4
   0x0000fffff7f85b74:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f85b78:	17ffffcf	b	0xfffff7f85ab4
   0x0000fffff7f85b7c:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f85b80:	17ffffcd	b	0xfffff7f85ab4
   0x0000fffff7f85b84:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f85b88:	17ffffcb	b	0xfffff7f85ab4
   0x0000fffff7f85b8c:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f85b90:	17ffffc9	b	0xfffff7f85ab4
   0x0000fffff7f85b94:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f85b98:	17ffffc7	b	0xfffff7f85ab4
   0x0000fffff7f85b9c:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f85ba0:	17ffffc5	b	0xfffff7f85ab4
   0x0000fffff7f85ba4:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f85ba8:	17ffffc3	b	0xfffff7f85ab4
   0x0000fffff7f85bac:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f85bb0:	17ffffc1	b	0xfffff7f85ab4
   0x0000fffff7f85bb4:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f85bb8:	17ffffbf	b	0xfffff7f85ab4
   0x0000fffff7f85bbc:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f85bc0:	17ffffbd	b	0xfffff7f85ab4
   0x0000fffff7f85bc4:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f85bc8:	17ffffbb	b	0xfffff7f85ab4
   0x0000fffff7f85bcc:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f85bd0:	17ffffb9	b	0xfffff7f85ab4
   0x0000fffff7f85bd4:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f85bd8:	17ffffb7	b	0xfffff7f85ab4
   0x0000fffff7f85bdc:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f85be0:	17ffffb5	b	0xfffff7f85ab4
   0x0000fffff7f85be4:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f85be8:	17ffffb3	b	0xfffff7f85ab4
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
