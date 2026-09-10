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
   0x0000fffff7f84058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8405c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f84060:	d29a880c	mov	x12, #0xd440                	// #54336
   0x0000fffff7f84064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8406c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f84070:	36d801d1	tbz	w17, #27, 0xfffff7f840a8
   0x0000fffff7f84074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8407c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84080:	54000281	b.ne	0xfffff7f840d0  // b.any
   0x0000fffff7f84084:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8408c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8409c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f840a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f840a4:	54000169	b.ls	0xfffff7f840d0  // b.plast
   0x0000fffff7f840a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f840ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7f840b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f840b4:	36d80091	tbz	w17, #27, 0xfffff7f840c4
   0x0000fffff7f840b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f840bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f840c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f840c4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f840c8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f840cc:	1400000e	b	0xfffff7f84104
   0x0000fffff7f840d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f840d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f840d8:	aa1303e1	mov	x1, x19
   0x0000fffff7f840dc:	aa1503e2	mov	x2, x21
   0x0000fffff7f840e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f840e4:	aa1403e4	mov	x4, x20
   0x0000fffff7f840e8:	aa1603e5	mov	x5, x22
   0x0000fffff7f840ec:	d2961890	mov	x16, #0xb0c4                	// #45252
   0x0000fffff7f840f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f840f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f840f8:	d63f0200	blr	x16
   0x0000fffff7f840fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84100:	54003400	b.eq	0xfffff7f84780  // b.none
   0x0000fffff7f84104:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84108:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8410c:	aa1303e1	mov	x1, x19
   0x0000fffff7f84110:	aa1503e2	mov	x2, x21
   0x0000fffff7f84114:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f84118:	aa1403e4	mov	x4, x20
   0x0000fffff7f8411c:	aa1603e5	mov	x5, x22
   0x0000fffff7f84120:	d2995610	mov	x16, #0xcab0                	// #51888
   0x0000fffff7f84124:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84128:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8412c:	d63f0200	blr	x16
   0x0000fffff7f84130:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84134:	540033c0	b.eq	0xfffff7f847ac  // b.none
   0x0000fffff7f84138:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8413c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f84140:	d29a940c	mov	x12, #0xd4a0                	// #54432
   0x0000fffff7f84144:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84148:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8414c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f84150:	36d801d1	tbz	w17, #27, 0xfffff7f84188
   0x0000fffff7f84154:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84158:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8415c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84160:	54000281	b.ne	0xfffff7f841b0  // b.any
   0x0000fffff7f84164:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84168:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8416c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84170:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84174:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84178:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8417c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84180:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84184:	54000169	b.ls	0xfffff7f841b0  // b.plast
   0x0000fffff7f84188:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8418c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84190:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84194:	36d80091	tbz	w17, #27, 0xfffff7f841a4
   0x0000fffff7f84198:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8419c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f841a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f841a4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f841a8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f841ac:	1400000e	b	0xfffff7f841e4
   0x0000fffff7f841b0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f841b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f841b8:	aa1303e1	mov	x1, x19
   0x0000fffff7f841bc:	aa1503e2	mov	x2, x21
   0x0000fffff7f841c0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f841c4:	aa1403e4	mov	x4, x20
   0x0000fffff7f841c8:	aa1603e5	mov	x5, x22
   0x0000fffff7f841cc:	d2961890	mov	x16, #0xb0c4                	// #45252
   0x0000fffff7f841d0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f841d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f841d8:	d63f0200	blr	x16
   0x0000fffff7f841dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f841e0:	54002fc0	b.eq	0xfffff7f847d8  // b.none
   0x0000fffff7f841e4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f841e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f841ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f841f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f841f4:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f841f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f841fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f84200:	d2995610	mov	x16, #0xcab0                	// #51888
   0x0000fffff7f84204:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84208:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8420c:	d63f0200	blr	x16
   0x0000fffff7f84210:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84214:	54002f80	b.eq	0xfffff7f84804  // b.none
   0x0000fffff7f84218:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8421c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f84220:	d29aa00c	mov	x12, #0xd500                	// #54528
   0x0000fffff7f84224:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84228:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8422c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f84230:	36d801d1	tbz	w17, #27, 0xfffff7f84268
   0x0000fffff7f84234:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84238:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8423c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84240:	54000281	b.ne	0xfffff7f84290  // b.any
   0x0000fffff7f84244:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84248:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8424c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84250:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84254:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84258:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8425c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84260:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84264:	54000169	b.ls	0xfffff7f84290  // b.plast
   0x0000fffff7f84268:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8426c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84270:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84274:	36d80091	tbz	w17, #27, 0xfffff7f84284
   0x0000fffff7f84278:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8427c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84280:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84284:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84288:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8428c:	1400000e	b	0xfffff7f842c4
   0x0000fffff7f84290:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84294:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84298:	aa1303e1	mov	x1, x19
   0x0000fffff7f8429c:	aa1503e2	mov	x2, x21
   0x0000fffff7f842a0:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f842a4:	aa1403e4	mov	x4, x20
   0x0000fffff7f842a8:	aa1603e5	mov	x5, x22
   0x0000fffff7f842ac:	d2961890	mov	x16, #0xb0c4                	// #45252
   0x0000fffff7f842b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f842b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842b8:	d63f0200	blr	x16
   0x0000fffff7f842bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842c0:	54002b80	b.eq	0xfffff7f84830  // b.none
   0x0000fffff7f842c4:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f842c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f842cc:	aa1303e1	mov	x1, x19
   0x0000fffff7f842d0:	aa1503e2	mov	x2, x21
   0x0000fffff7f842d4:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f842d8:	aa1403e4	mov	x4, x20
   0x0000fffff7f842dc:	aa1603e5	mov	x5, x22
   0x0000fffff7f842e0:	d2995610	mov	x16, #0xcab0                	// #51888
   0x0000fffff7f842e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f842e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842ec:	d63f0200	blr	x16
   0x0000fffff7f842f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842f4:	54002b40	b.eq	0xfffff7f8485c  // b.none
   0x0000fffff7f842f8:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f842fc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84300:	540005a0	b.eq	0xfffff7f843b4  // b.none
   0x0000fffff7f84304:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84308:	b94013ea	ldr	w10, [sp, #16]
   0x0000fffff7f8430c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84310:	54000521	b.ne	0xfffff7f843b4  // b.any
   0x0000fffff7f84314:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84318:	f9400fea	ldr	x10, [sp, #24]
   0x0000fffff7f8431c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84320:	540004a1	b.ne	0xfffff7f843b4  // b.any
   0x0000fffff7f84324:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84328:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8432c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84330:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84334:	54000400	b.eq	0xfffff7f843b4  // b.none
   0x0000fffff7f84338:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8433c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84340:	36d801d1	tbz	w17, #27, 0xfffff7f84378
   0x0000fffff7f84344:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84348:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8434c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84350:	54000321	b.ne	0xfffff7f843b4  // b.any
   0x0000fffff7f84354:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84358:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8435c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84360:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84364:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84368:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8436c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84370:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84374:	54000209	b.ls	0xfffff7f843b4  // b.plast
   0x0000fffff7f84378:	36d8008d	tbz	w13, #27, 0xfffff7f84388
   0x0000fffff7f8437c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84380:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84384:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84388:	36d80091	tbz	w17, #27, 0xfffff7f84398
   0x0000fffff7f8438c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84390:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84394:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84398:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8439c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f843a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f843a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f843a8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f843ac:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f843b0:	1400000e	b	0xfffff7f843e8
   0x0000fffff7f843b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f843b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f843bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f843c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f843c4:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f843c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f843cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f843d0:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f843d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f843d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f843dc:	d63f0200	blr	x16
   0x0000fffff7f843e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f843e4:	54002520	b.eq	0xfffff7f84888  // b.none
   0x0000fffff7f843e8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f843ec:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f843f0:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f843f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f843f8:	540001c1	b.ne	0xfffff7f84430  // b.any
   0x0000fffff7f843fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84400:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84404:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84408:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8440c:	54000801	b.ne	0xfffff7f8450c  // b.any
   0x0000fffff7f84410:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7f84414:	f940366b	ldr	x11, [x19, #104]
   0x0000fffff7f84418:	f9401d69	ldr	x9, [x11, #56]
   0x0000fffff7f8441c:	eb09015f	cmp	x10, x9
   0x0000fffff7f84420:	54000762	b.cs	0xfffff7f8450c  // b.hs, b.nlast
   0x0000fffff7f84424:	f940196b	ldr	x11, [x11, #48]
   0x0000fffff7f84428:	8b0a116b	add	x11, x11, x10, lsl #4
   0x0000fffff7f8442c:	14000014	b	0xfffff7f8447c
   0x0000fffff7f84430:	f94047eb	ldr	x11, [sp, #136]
   0x0000fffff7f84434:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84438:	540006a0	b.eq	0xfffff7f8450c  // b.none
   0x0000fffff7f8443c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84440:	b94073ea	ldr	w10, [sp, #112]
   0x0000fffff7f84444:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84448:	54000621	b.ne	0xfffff7f8450c  // b.any
   0x0000fffff7f8444c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84450:	f9403fea	ldr	x10, [sp, #120]
   0x0000fffff7f84454:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84458:	540005a1	b.ne	0xfffff7f8450c  // b.any
   0x0000fffff7f8445c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84460:	b94077ea	ldr	w10, [sp, #116]
   0x0000fffff7f84464:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84468:	54000521	b.ne	0xfffff7f8450c  // b.any
   0x0000fffff7f8446c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84470:	f94043ea	ldr	x10, [sp, #128]
   0x0000fffff7f84474:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84478:	540004a1	b.ne	0xfffff7f8450c  // b.any
   0x0000fffff7f8447c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84480:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84484:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84488:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8448c:	54000400	b.eq	0xfffff7f8450c  // b.none
   0x0000fffff7f84490:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84494:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84498:	36d801d1	tbz	w17, #27, 0xfffff7f844d0
   0x0000fffff7f8449c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f844a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f844a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f844a8:	54000321	b.ne	0xfffff7f8450c  // b.any
   0x0000fffff7f844ac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f844b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f844b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f844bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f844c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f844c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f844c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f844cc:	54000209	b.ls	0xfffff7f8450c  // b.plast
   0x0000fffff7f844d0:	36d8008d	tbz	w13, #27, 0xfffff7f844e0
   0x0000fffff7f844d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f844d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f844dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f844e0:	36d80091	tbz	w17, #27, 0xfffff7f844f0
   0x0000fffff7f844e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f844e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f844ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f844f0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f844f4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f844f8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f844fc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84500:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84504:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84508:	1400000e	b	0xfffff7f84540
   0x0000fffff7f8450c:	9101c3e6	add	x6, sp, #0x70
   0x0000fffff7f84510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84514:	aa1303e1	mov	x1, x19
   0x0000fffff7f84518:	aa1503e2	mov	x2, x21
   0x0000fffff7f8451c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f84520:	aa1403e4	mov	x4, x20
   0x0000fffff7f84524:	aa1603e5	mov	x5, x22
   0x0000fffff7f84528:	d28ac810	mov	x16, #0x5640                	// #22080
   0x0000fffff7f8452c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84534:	d63f0200	blr	x16
   0x0000fffff7f84538:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8453c:	54001bc0	b.eq	0xfffff7f848b4  // b.none
   0x0000fffff7f84540:	f94037eb	ldr	x11, [sp, #104]
   0x0000fffff7f84544:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84548:	540005a0	b.eq	0xfffff7f845fc  // b.none
   0x0000fffff7f8454c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f84550:	b94053ea	ldr	w10, [sp, #80]
   0x0000fffff7f84554:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84558:	54000521	b.ne	0xfffff7f845fc  // b.any
   0x0000fffff7f8455c:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f84560:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f84564:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84568:	540004a1	b.ne	0xfffff7f845fc  // b.any
   0x0000fffff7f8456c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84570:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84574:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84578:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8457c:	54000400	b.eq	0xfffff7f845fc  // b.none
   0x0000fffff7f84580:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84584:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84588:	36d801d1	tbz	w17, #27, 0xfffff7f845c0
   0x0000fffff7f8458c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84590:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84594:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84598:	54000321	b.ne	0xfffff7f845fc  // b.any
   0x0000fffff7f8459c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f845a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f845a4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f845a8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f845ac:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f845b0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f845b4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f845b8:	f100055f	cmp	x10, #0x1
   0x0000fffff7f845bc:	54000209	b.ls	0xfffff7f845fc  // b.plast
   0x0000fffff7f845c0:	36d8008d	tbz	w13, #27, 0xfffff7f845d0
   0x0000fffff7f845c4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f845c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f845cc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f845d0:	36d80091	tbz	w17, #27, 0xfffff7f845e0
   0x0000fffff7f845d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f845d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f845dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f845e0:	b940726e	ldr	w14, [x19, #112]
   0x0000fffff7f845e4:	f9403e6f	ldr	x15, [x19, #120]
   0x0000fffff7f845e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f845ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f845f0:	f9003e6c	str	x12, [x19, #120]
   0x0000fffff7f845f4:	b900726d	str	w13, [x19, #112]
   0x0000fffff7f845f8:	1400000e	b	0xfffff7f84630
   0x0000fffff7f845fc:	910143e6	add	x6, sp, #0x50
   0x0000fffff7f84600:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84604:	aa1303e1	mov	x1, x19
   0x0000fffff7f84608:	aa1503e2	mov	x2, x21
   0x0000fffff7f8460c:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f84610:	aa1403e4	mov	x4, x20
   0x0000fffff7f84614:	aa1603e5	mov	x5, x22
   0x0000fffff7f84618:	d2963e10	mov	x16, #0xb1f0                	// #45552
   0x0000fffff7f8461c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84620:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84624:	d63f0200	blr	x16
   0x0000fffff7f84628:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8462c:	540015a0	b.eq	0xfffff7f848e0  // b.none
   0x0000fffff7f84630:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84634:	37d806a9	tbnz	w9, #27, 0xfffff7f84708
   0x0000fffff7f84638:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8463c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84648:	540001c1	b.ne	0xfffff7f84680  // b.any
   0x0000fffff7f8464c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f84650:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84658:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8465c:	54000121	b.ne	0xfffff7f84680  // b.any
   0x0000fffff7f84660:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84664:	f9403e6a	ldr	x10, [x19, #120]
   0x0000fffff7f84668:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8466c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84670:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84674:	f9003669	str	x9, [x19, #104]
   0x0000fffff7f84678:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f8467c:	14000030	b	0xfffff7f8473c
   0x0000fffff7f84680:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84684:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8468c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84690:	54000120	b.eq	0xfffff7f846b4  // b.none
   0x0000fffff7f84694:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84698:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8469c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f846a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846a4:	54000321	b.ne	0xfffff7f84708  // b.any
   0x0000fffff7f846a8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f846ac:	9e620120	scvtf	d0, x9
   0x0000fffff7f846b0:	14000002	b	0xfffff7f846b8
   0x0000fffff7f846b4:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f846b8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f846bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f846c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f846c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846c8:	54000120	b.eq	0xfffff7f846ec  // b.none
   0x0000fffff7f846cc:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f846d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f846d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f846d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846dc:	54000161	b.ne	0xfffff7f84708  // b.any
   0x0000fffff7f846e0:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f846e4:	9e620121	scvtf	d1, x9
   0x0000fffff7f846e8:	14000002	b	0xfffff7f846f0
   0x0000fffff7f846ec:	fd403e61	ldr	d1, [x19, #120]
   0x0000fffff7f846f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f846f4:	fd003660	str	d0, [x19, #104]
   0x0000fffff7f846f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f846fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84700:	b900626a	str	w10, [x19, #96]
   0x0000fffff7f84704:	17ffffde	b	0xfffff7f8467c
   0x0000fffff7f84708:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8470c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84710:	aa1303e1	mov	x1, x19
   0x0000fffff7f84714:	aa1503e2	mov	x2, x21
   0x0000fffff7f84718:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f8471c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84720:	aa1603e5	mov	x5, x22
   0x0000fffff7f84724:	d295ce90	mov	x16, #0xae74                	// #44660
   0x0000fffff7f84728:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8472c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84730:	d63f0200	blr	x16
   0x0000fffff7f84734:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84738:	54000ea0	b.eq	0xfffff7f8490c  // b.none
   0x0000fffff7f8473c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84740:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84744:	aa1303e1	mov	x1, x19
   0x0000fffff7f84748:	aa1503e2	mov	x2, x21
   0x0000fffff7f8474c:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f84750:	aa1403e4	mov	x4, x20
   0x0000fffff7f84754:	aa1603e5	mov	x5, x22
   0x0000fffff7f84758:	d288c090	mov	x16, #0x4604                	// #17924
   0x0000fffff7f8475c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84760:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84764:	d63f0200	blr	x16
   0x0000fffff7f84768:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f8476c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84770:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84774:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84778:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f8477c:	d65f03c0	ret
   0x0000fffff7f84780:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84784:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84788:	b9000289	str	w9, [x20]
   0x0000fffff7f8478c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f84790:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84794:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84798:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8479c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f847a0:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f847a4:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f847a8:	d65f03c0	ret
   0x0000fffff7f847ac:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f847b0:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f847b4:	b9000289	str	w9, [x20]
   0x0000fffff7f847b8:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f847bc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f847c0:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f847c4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f847c8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f847cc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f847d0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f847d4:	d65f03c0	ret
   0x0000fffff7f847d8:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f847dc:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f847e0:	b9000289	str	w9, [x20]
   0x0000fffff7f847e4:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f847e8:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f847ec:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f847f0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f847f4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f847f8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f847fc:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84800:	d65f03c0	ret
   0x0000fffff7f84804:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84808:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f8480c:	b9000289	str	w9, [x20]
   0x0000fffff7f84810:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f84814:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84818:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f8481c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84820:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84824:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84828:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f8482c:	d65f03c0	ret
   0x0000fffff7f84830:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84834:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84838:	b9000289	str	w9, [x20]
   0x0000fffff7f8483c:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f84840:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84844:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84848:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8484c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84850:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84854:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84858:	d65f03c0	ret
   0x0000fffff7f8485c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84860:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84864:	b9000289	str	w9, [x20]
   0x0000fffff7f84868:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f8486c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84870:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84874:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84878:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8487c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84880:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84884:	d65f03c0	ret
   0x0000fffff7f84888:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f8488c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84890:	b9000289	str	w9, [x20]
   0x0000fffff7f84894:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f84898:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f8489c:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f848a0:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f848a4:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f848a8:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f848ac:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f848b0:	d65f03c0	ret
   0x0000fffff7f848b4:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f848b8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f848bc:	b9000289	str	w9, [x20]
   0x0000fffff7f848c0:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f848c4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f848c8:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f848cc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f848d0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f848d4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f848d8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f848dc:	d65f03c0	ret
   0x0000fffff7f848e0:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f848e4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f848e8:	b9000289	str	w9, [x20]
   0x0000fffff7f848ec:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f848f0:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f848f4:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f848f8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f848fc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f84900:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84904:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84908:	d65f03c0	ret
   0x0000fffff7f8490c:	52800049	mov	w9, #0x2                   	// #2
   0x0000fffff7f84910:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7f84914:	b9000289	str	w9, [x20]
   0x0000fffff7f84918:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f8491c:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f84920:	910243ff	add	sp, sp, #0x90
   0x0000fffff7f84924:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f84928:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8492c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f84930:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f84934:	d65f03c0	ret
   0x0000fffff7f84938:	00000000	udf	#0
   0x0000fffff7f8493c:	00000000	udf	#0
   0x0000fffff7f84940:	00000000	udf	#0
   0x0000fffff7f84944:	00000000	udf	#0
   0x0000fffff7f84948:	00000000	udf	#0
   0x0000fffff7f8494c:	00000000	udf	#0
   0x0000fffff7f84950:	00000000	udf	#0
   0x0000fffff7f84954:	00000000	udf	#0
   0x0000fffff7f84958:	00000000	udf	#0
   0x0000fffff7f8495c:	00000000	udf	#0
   0x0000fffff7f84960:	00000000	udf	#0
   0x0000fffff7f84964:	00000000	udf	#0
   0x0000fffff7f84968:	00000000	udf	#0
   0x0000fffff7f8496c:	00000000	udf	#0
   0x0000fffff7f84970:	00000000	udf	#0
   0x0000fffff7f84974:	00000000	udf	#0
   0x0000fffff7f84978:	00000000	udf	#0
   0x0000fffff7f8497c:	00000000	udf	#0
   0x0000fffff7f84980:	00000000	udf	#0
   0x0000fffff7f84984:	00000000	udf	#0
   0x0000fffff7f84988:	00000000	udf	#0
   0x0000fffff7f8498c:	00000000	udf	#0
   0x0000fffff7f84990:	00000000	udf	#0
   0x0000fffff7f84994:	00000000	udf	#0
   0x0000fffff7f84998:	00000000	udf	#0
   0x0000fffff7f8499c:	00000000	udf	#0
   0x0000fffff7f849a0:	00000000	udf	#0
   0x0000fffff7f849a4:	00000000	udf	#0
   0x0000fffff7f849a8:	00000000	udf	#0
   0x0000fffff7f849ac:	00000000	udf	#0
   0x0000fffff7f849b0:	00000000	udf	#0
   0x0000fffff7f849b4:	00000000	udf	#0
   0x0000fffff7f849b8:	00000000	udf	#0
   0x0000fffff7f849bc:	00000000	udf	#0
   0x0000fffff7f849c0:	00000000	udf	#0
   0x0000fffff7f849c4:	00000000	udf	#0
   0x0000fffff7f849c8:	00000000	udf	#0
   0x0000fffff7f849cc:	00000000	udf	#0
   0x0000fffff7f849d0:	00000000	udf	#0
   0x0000fffff7f849d4:	00000000	udf	#0
   0x0000fffff7f849d8:	00000000	udf	#0
   0x0000fffff7f849dc:	00000000	udf	#0
   0x0000fffff7f849e0:	00000000	udf	#0
   0x0000fffff7f849e4:	00000000	udf	#0
   0x0000fffff7f849e8:	00000000	udf	#0
   0x0000fffff7f849ec:	00000000	udf	#0
   0x0000fffff7f849f0:	00000000	udf	#0
   0x0000fffff7f849f4:	00000000	udf	#0
   0x0000fffff7f849f8:	00000000	udf	#0
   0x0000fffff7f849fc:	00000000	udf	#0
   0x0000fffff7f84a00:	00000000	udf	#0
   0x0000fffff7f84a04:	00000000	udf	#0
   0x0000fffff7f84a08:	00000000	udf	#0
   0x0000fffff7f84a0c:	00000000	udf	#0
   0x0000fffff7f84a10:	00000000	udf	#0
   0x0000fffff7f84a14:	00000000	udf	#0
   0x0000fffff7f84a18:	00000000	udf	#0
   0x0000fffff7f84a1c:	00000000	udf	#0
   0x0000fffff7f84a20:	00000000	udf	#0
   0x0000fffff7f84a24:	00000000	udf	#0
   0x0000fffff7f84a28:	00000000	udf	#0
   0x0000fffff7f84a2c:	00000000	udf	#0
   0x0000fffff7f84a30:	00000000	udf	#0
   0x0000fffff7f84a34:	00000000	udf	#0
   0x0000fffff7f84a38:	00000000	udf	#0
   0x0000fffff7f84a3c:	00000000	udf	#0
   0x0000fffff7f84a40:	00000000	udf	#0
   0x0000fffff7f84a44:	00000000	udf	#0
   0x0000fffff7f84a48:	00000000	udf	#0
   0x0000fffff7f84a4c:	00000000	udf	#0
   0x0000fffff7f84a50:	00000000	udf	#0
   0x0000fffff7f84a54:	00000000	udf	#0
   0x0000fffff7f84a58:	00000000	udf	#0
   0x0000fffff7f84a5c:	00000000	udf	#0
   0x0000fffff7f84a60:	00000000	udf	#0
   0x0000fffff7f84a64:	00000000	udf	#0
   0x0000fffff7f84a68:	00000000	udf	#0
   0x0000fffff7f84a6c:	00000000	udf	#0
   0x0000fffff7f84a70:	00000000	udf	#0
   0x0000fffff7f84a74:	00000000	udf	#0
   0x0000fffff7f84a78:	00000000	udf	#0
   0x0000fffff7f84a7c:	00000000	udf	#0
   0x0000fffff7f84a80:	00000000	udf	#0
   0x0000fffff7f84a84:	00000000	udf	#0
   0x0000fffff7f84a88:	00000000	udf	#0
   0x0000fffff7f84a8c:	00000000	udf	#0
   0x0000fffff7f84a90:	00000000	udf	#0
   0x0000fffff7f84a94:	00000000	udf	#0
   0x0000fffff7f84a98:	00000000	udf	#0
   0x0000fffff7f84a9c:	00000000	udf	#0
   0x0000fffff7f84aa0:	00000000	udf	#0
   0x0000fffff7f84aa4:	00000000	udf	#0
   0x0000fffff7f84aa8:	00000000	udf	#0
   0x0000fffff7f84aac:	00000000	udf	#0
   0x0000fffff7f84ab0:	00000000	udf	#0
   0x0000fffff7f84ab4:	00000000	udf	#0
   0x0000fffff7f84ab8:	00000000	udf	#0
   0x0000fffff7f84abc:	00000000	udf	#0
   0x0000fffff7f84ac0:	00000000	udf	#0
   0x0000fffff7f84ac4:	00000000	udf	#0
   0x0000fffff7f84ac8:	00000000	udf	#0
   0x0000fffff7f84acc:	00000000	udf	#0
   0x0000fffff7f84ad0:	00000000	udf	#0
   0x0000fffff7f84ad4:	00000000	udf	#0
   0x0000fffff7f84ad8:	00000000	udf	#0
   0x0000fffff7f84adc:	00000000	udf	#0
   0x0000fffff7f84ae0:	00000000	udf	#0
   0x0000fffff7f84ae4:	00000000	udf	#0
   0x0000fffff7f84ae8:	00000000	udf	#0
   0x0000fffff7f84aec:	00000000	udf	#0
   0x0000fffff7f84af0:	00000000	udf	#0
   0x0000fffff7f84af4:	00000000	udf	#0
   0x0000fffff7f84af8:	00000000	udf	#0
   0x0000fffff7f84afc:	00000000	udf	#0
   0x0000fffff7f84b00:	00000000	udf	#0
   0x0000fffff7f84b04:	00000000	udf	#0
   0x0000fffff7f84b08:	00000000	udf	#0
   0x0000fffff7f84b0c:	00000000	udf	#0
   0x0000fffff7f84b10:	00000000	udf	#0
   0x0000fffff7f84b14:	00000000	udf	#0
   0x0000fffff7f84b18:	00000000	udf	#0
   0x0000fffff7f84b1c:	00000000	udf	#0
   0x0000fffff7f84b20:	00000000	udf	#0
   0x0000fffff7f84b24:	00000000	udf	#0
   0x0000fffff7f84b28:	00000000	udf	#0
   0x0000fffff7f84b2c:	00000000	udf	#0
   0x0000fffff7f84b30:	00000000	udf	#0
   0x0000fffff7f84b34:	00000000	udf	#0
   0x0000fffff7f84b38:	00000000	udf	#0
   0x0000fffff7f84b3c:	00000000	udf	#0
   0x0000fffff7f84b40:	00000000	udf	#0
   0x0000fffff7f84b44:	00000000	udf	#0
   0x0000fffff7f84b48:	00000000	udf	#0
   0x0000fffff7f84b4c:	00000000	udf	#0
   0x0000fffff7f84b50:	00000000	udf	#0
   0x0000fffff7f84b54:	00000000	udf	#0
   0x0000fffff7f84b58:	00000000	udf	#0
   0x0000fffff7f84b5c:	00000000	udf	#0
   0x0000fffff7f84b60:	00000000	udf	#0
   0x0000fffff7f84b64:	00000000	udf	#0
   0x0000fffff7f84b68:	00000000	udf	#0
   0x0000fffff7f84b6c:	00000000	udf	#0
   0x0000fffff7f84b70:	00000000	udf	#0
   0x0000fffff7f84b74:	00000000	udf	#0
   0x0000fffff7f84b78:	00000000	udf	#0
   0x0000fffff7f84b7c:	00000000	udf	#0
   0x0000fffff7f84b80:	00000000	udf	#0
   0x0000fffff7f84b84:	00000000	udf	#0
   0x0000fffff7f84b88:	00000000	udf	#0
   0x0000fffff7f84b8c:	00000000	udf	#0
   0x0000fffff7f84b90:	00000000	udf	#0
   0x0000fffff7f84b94:	00000000	udf	#0
   0x0000fffff7f84b98:	00000000	udf	#0
   0x0000fffff7f84b9c:	00000000	udf	#0
   0x0000fffff7f84ba0:	00000000	udf	#0
   0x0000fffff7f84ba4:	00000000	udf	#0
   0x0000fffff7f84ba8:	00000000	udf	#0
   0x0000fffff7f84bac:	00000000	udf	#0
   0x0000fffff7f84bb0:	00000000	udf	#0
   0x0000fffff7f84bb4:	00000000	udf	#0
   0x0000fffff7f84bb8:	00000000	udf	#0
   0x0000fffff7f84bbc:	00000000	udf	#0
   0x0000fffff7f84bc0:	00000000	udf	#0
   0x0000fffff7f84bc4:	00000000	udf	#0
   0x0000fffff7f84bc8:	00000000	udf	#0
   0x0000fffff7f84bcc:	00000000	udf	#0
   0x0000fffff7f84bd0:	00000000	udf	#0
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
