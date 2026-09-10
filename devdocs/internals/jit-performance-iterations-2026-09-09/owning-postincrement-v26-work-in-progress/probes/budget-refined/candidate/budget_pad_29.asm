Dump of assembler code from 0xfffff7f84000 to 0xfffff7f86000:
   0x0000fffff7f84000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f84004:	910003fd	mov	x29, sp
   0x0000fffff7f84008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8400c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f84010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f84014:	aa0003f3	mov	x19, x0
   0x0000fffff7f84018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8401c:	aa0203f5	mov	x21, x2
   0x0000fffff7f84020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f84024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f84028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f8402c:	f90003e9	str	x9, [sp]
   0x0000fffff7f84030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f84034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f84038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f8403c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f84040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84044:	d63f0200	blr	x16
   0x0000fffff7f84048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f8404c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f84050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f84054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f84058:	14000001	b	0xfffff7f8405c
   0x0000fffff7f8405c:	14000001	b	0xfffff7f84060
   0x0000fffff7f84060:	14000001	b	0xfffff7f84064
   0x0000fffff7f84064:	14000001	b	0xfffff7f84068
   0x0000fffff7f84068:	14000001	b	0xfffff7f8406c
   0x0000fffff7f8406c:	14000001	b	0xfffff7f84070
   0x0000fffff7f84070:	14000001	b	0xfffff7f84074
   0x0000fffff7f84074:	14000001	b	0xfffff7f84078
   0x0000fffff7f84078:	14000001	b	0xfffff7f8407c
   0x0000fffff7f8407c:	14000001	b	0xfffff7f84080
   0x0000fffff7f84080:	14000001	b	0xfffff7f84084
   0x0000fffff7f84084:	14000001	b	0xfffff7f84088
   0x0000fffff7f84088:	14000001	b	0xfffff7f8408c
   0x0000fffff7f8408c:	14000001	b	0xfffff7f84090
   0x0000fffff7f84090:	14000001	b	0xfffff7f84094
   0x0000fffff7f84094:	14000001	b	0xfffff7f84098
   0x0000fffff7f84098:	14000001	b	0xfffff7f8409c
   0x0000fffff7f8409c:	14000001	b	0xfffff7f840a0
   0x0000fffff7f840a0:	14000001	b	0xfffff7f840a4
   0x0000fffff7f840a4:	14000001	b	0xfffff7f840a8
   0x0000fffff7f840a8:	14000001	b	0xfffff7f840ac
   0x0000fffff7f840ac:	14000001	b	0xfffff7f840b0
   0x0000fffff7f840b0:	14000001	b	0xfffff7f840b4
   0x0000fffff7f840b4:	14000001	b	0xfffff7f840b8
   0x0000fffff7f840b8:	14000001	b	0xfffff7f840bc
   0x0000fffff7f840bc:	14000001	b	0xfffff7f840c0
   0x0000fffff7f840c0:	14000001	b	0xfffff7f840c4
   0x0000fffff7f840c4:	14000001	b	0xfffff7f840c8
   0x0000fffff7f840c8:	14000001	b	0xfffff7f840cc
   0x0000fffff7f840cc:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f840d0:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f840d4:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f840d8:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7f840dc:	36d80211	tbz	w17, #27, 0xfffff7f8411c
   0x0000fffff7f840e0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f840e4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f840e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f840ec:	540001e1	b.ne	0xfffff7f84128  // b.any
   0x0000fffff7f840f0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7f840f4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f840f8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f840fc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84100:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84104:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84108:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8410c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84110:	540000c9	b.ls	0xfffff7f84128  // b.plast
   0x0000fffff7f84114:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84118:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8411c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7f84120:	b900426d	str	w13, [x19, #64]
   0x0000fffff7f84124:	1400000e	b	0xfffff7f8415c
   0x0000fffff7f84128:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8412c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84130:	aa1303e1	mov	x1, x19
   0x0000fffff7f84134:	aa1503e2	mov	x2, x21
   0x0000fffff7f84138:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f8413c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84140:	aa1603e5	mov	x5, x22
   0x0000fffff7f84144:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f84148:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8414c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84150:	d63f0200	blr	x16
   0x0000fffff7f84154:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84158:	5400eac0	b.eq	0xfffff7f85eb0  // b.none
   0x0000fffff7f8415c:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f84160:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f84164:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7f84168:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7f8416c:	36d80211	tbz	w17, #27, 0xfffff7f841ac
   0x0000fffff7f84170:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84174:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84178:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8417c:	540001e1	b.ne	0xfffff7f841b8  // b.any
   0x0000fffff7f84180:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7f84184:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84188:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8418c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84190:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84194:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84198:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8419c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f841a0:	540000c9	b.ls	0xfffff7f841b8  // b.plast
   0x0000fffff7f841a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f841a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f841ac:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7f841b0:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f841b4:	1400000e	b	0xfffff7f841ec
   0x0000fffff7f841b8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f841bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f841c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f841c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f841c8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f841cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f841d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f841d4:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f841d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f841dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f841e0:	d63f0200	blr	x16
   0x0000fffff7f841e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f841e8:	5400e680	b.eq	0xfffff7f85eb8  // b.none
   0x0000fffff7f841ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f841f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f841f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f841f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f841fc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f84200:	aa1403e4	mov	x4, x20
   0x0000fffff7f84204:	aa1603e5	mov	x5, x22
   0x0000fffff7f84208:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7f8420c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84210:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84214:	d63f0200	blr	x16
   0x0000fffff7f84218:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8421c:	5400e520	b.eq	0xfffff7f85ec0  // b.none
   0x0000fffff7f84220:	f100041f	cmp	x0, #0x1
   0x0000fffff7f84224:	5400e100	b.eq	0xfffff7f85e44  // b.none
   0x0000fffff7f84228:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7f8422c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7f84230:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7f84234:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7f84238:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7f8423c:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f84240:	36d801d1	tbz	w17, #27, 0xfffff7f84278
   0x0000fffff7f84244:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84248:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8424c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84250:	54000281	b.ne	0xfffff7f842a0  // b.any
   0x0000fffff7f84254:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84258:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8425c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84260:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84264:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84268:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8426c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84270:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84274:	54000169	b.ls	0xfffff7f842a0  // b.plast
   0x0000fffff7f84278:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8427c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84280:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84284:	36d80091	tbz	w17, #27, 0xfffff7f84294
   0x0000fffff7f84288:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8428c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84290:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84294:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84298:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8429c:	1400000e	b	0xfffff7f842d4
   0x0000fffff7f842a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f842a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f842a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f842ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f842b0:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f842b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f842b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f842bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f842c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f842c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f842c8:	d63f0200	blr	x16
   0x0000fffff7f842cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f842d0:	5400dfc0	b.eq	0xfffff7f85ec8  // b.none
   0x0000fffff7f842d4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7f842d8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f842dc:	540003a0	b.eq	0xfffff7f84350  // b.none
   0x0000fffff7f842e0:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7f842e4:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f842e8:	b9400171	ldr	w17, [x11]
   0x0000fffff7f842ec:	36d801d1	tbz	w17, #27, 0xfffff7f84324
   0x0000fffff7f842f0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f842f4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f842f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f842fc:	540002a1	b.ne	0xfffff7f84350  // b.any
   0x0000fffff7f84300:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7f84304:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84308:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f8430c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84310:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84314:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84318:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f8431c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84320:	54000189	b.ls	0xfffff7f84350  // b.plast
   0x0000fffff7f84324:	36d8008d	tbz	w13, #27, 0xfffff7f84334
   0x0000fffff7f84328:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f8432c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84330:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84334:	36d80091	tbz	w17, #27, 0xfffff7f84344
   0x0000fffff7f84338:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8433c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84340:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84344:	f900056c	str	x12, [x11, #8]
   0x0000fffff7f84348:	b900016d	str	w13, [x11]
   0x0000fffff7f8434c:	1400000e	b	0xfffff7f84384
   0x0000fffff7f84350:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f84354:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84358:	aa1303e1	mov	x1, x19
   0x0000fffff7f8435c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84360:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f84364:	aa1403e4	mov	x4, x20
   0x0000fffff7f84368:	aa1603e5	mov	x5, x22
   0x0000fffff7f8436c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f84370:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84374:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84378:	d63f0200	blr	x16
   0x0000fffff7f8437c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84380:	5400da80	b.eq	0xfffff7f85ed0  // b.none
   0x0000fffff7f84384:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84388:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8438c:	540004a0	b.eq	0xfffff7f84420  // b.none
   0x0000fffff7f84390:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84394:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84398:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8439c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f843a0:	54000400	b.eq	0xfffff7f84420  // b.none
   0x0000fffff7f843a4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f843a8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f843ac:	36d801d1	tbz	w17, #27, 0xfffff7f843e4
   0x0000fffff7f843b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f843b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f843b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f843bc:	54000321	b.ne	0xfffff7f84420  // b.any
   0x0000fffff7f843c0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f843c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f843c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f843cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f843d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f843d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f843d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f843dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f843e0:	54000209	b.ls	0xfffff7f84420  // b.plast
   0x0000fffff7f843e4:	36d8008d	tbz	w13, #27, 0xfffff7f843f4
   0x0000fffff7f843e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f843ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7f843f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f843f4:	36d80091	tbz	w17, #27, 0xfffff7f84404
   0x0000fffff7f843f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f843fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84400:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84404:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f84408:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f8440c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84410:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84414:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84418:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f8441c:	1400000e	b	0xfffff7f84454
   0x0000fffff7f84420:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84424:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84428:	aa1303e1	mov	x1, x19
   0x0000fffff7f8442c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84430:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f84434:	aa1403e4	mov	x4, x20
   0x0000fffff7f84438:	aa1603e5	mov	x5, x22
   0x0000fffff7f8443c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f84440:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84448:	d63f0200	blr	x16
   0x0000fffff7f8444c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84450:	5400d440	b.eq	0xfffff7f85ed8  // b.none
   0x0000fffff7f84454:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84458:	37d806a9	tbnz	w9, #27, 0xfffff7f8452c
   0x0000fffff7f8445c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84460:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84464:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84468:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8446c:	540001c1	b.ne	0xfffff7f844a4  // b.any
   0x0000fffff7f84470:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84474:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84478:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8447c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84480:	54000121	b.ne	0xfffff7f844a4  // b.any
   0x0000fffff7f84484:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84488:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8448c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84490:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84494:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84498:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8449c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f844a0:	14000030	b	0xfffff7f84560
   0x0000fffff7f844a4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f844a8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f844ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f844b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844b4:	54000120	b.eq	0xfffff7f844d8  // b.none
   0x0000fffff7f844b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f844bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f844c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f844c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844c8:	54000321	b.ne	0xfffff7f8452c  // b.any
   0x0000fffff7f844cc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f844d0:	9e620120	scvtf	d0, x9
   0x0000fffff7f844d4:	14000002	b	0xfffff7f844dc
   0x0000fffff7f844d8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f844dc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f844e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f844e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f844e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f844ec:	54000120	b.eq	0xfffff7f84510  // b.none
   0x0000fffff7f844f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f844f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f844f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f844fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84500:	54000161	b.ne	0xfffff7f8452c  // b.any
   0x0000fffff7f84504:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84508:	9e620121	scvtf	d1, x9
   0x0000fffff7f8450c:	14000002	b	0xfffff7f84514
   0x0000fffff7f84510:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84514:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84518:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f8451c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84524:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84528:	17ffffde	b	0xfffff7f844a0
   0x0000fffff7f8452c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84530:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84534:	aa1303e1	mov	x1, x19
   0x0000fffff7f84538:	aa1503e2	mov	x2, x21
   0x0000fffff7f8453c:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f84540:	aa1403e4	mov	x4, x20
   0x0000fffff7f84544:	aa1603e5	mov	x5, x22
   0x0000fffff7f84548:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8454c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84550:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84554:	d63f0200	blr	x16
   0x0000fffff7f84558:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8455c:	5400cc20	b.eq	0xfffff7f85ee0  // b.none
   0x0000fffff7f84560:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84564:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84568:	540004a0	b.eq	0xfffff7f845fc  // b.none
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
   0x0000fffff7f845e0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f845e4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f845e8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f845ec:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f845f0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f845f4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f845f8:	1400000e	b	0xfffff7f84630
   0x0000fffff7f845fc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84600:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84604:	aa1303e1	mov	x1, x19
   0x0000fffff7f84608:	aa1503e2	mov	x2, x21
   0x0000fffff7f8460c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f84610:	aa1403e4	mov	x4, x20
   0x0000fffff7f84614:	aa1603e5	mov	x5, x22
   0x0000fffff7f84618:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f8461c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84620:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84624:	d63f0200	blr	x16
   0x0000fffff7f84628:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8462c:	5400c5e0	b.eq	0xfffff7f85ee8  // b.none
   0x0000fffff7f84630:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84634:	37d806a9	tbnz	w9, #27, 0xfffff7f84708
   0x0000fffff7f84638:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8463c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84648:	540001c1	b.ne	0xfffff7f84680  // b.any
   0x0000fffff7f8464c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84650:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84658:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8465c:	54000121	b.ne	0xfffff7f84680  // b.any
   0x0000fffff7f84660:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84664:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84668:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8466c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84670:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84674:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84678:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8467c:	14000030	b	0xfffff7f8473c
   0x0000fffff7f84680:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84684:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84688:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8468c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84690:	54000120	b.eq	0xfffff7f846b4  // b.none
   0x0000fffff7f84694:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84698:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8469c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f846a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846a4:	54000321	b.ne	0xfffff7f84708  // b.any
   0x0000fffff7f846a8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f846ac:	9e620120	scvtf	d0, x9
   0x0000fffff7f846b0:	14000002	b	0xfffff7f846b8
   0x0000fffff7f846b4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f846b8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f846bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f846c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f846c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846c8:	54000120	b.eq	0xfffff7f846ec  // b.none
   0x0000fffff7f846cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f846d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f846d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f846d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f846dc:	54000161	b.ne	0xfffff7f84708  // b.any
   0x0000fffff7f846e0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f846e4:	9e620121	scvtf	d1, x9
   0x0000fffff7f846e8:	14000002	b	0xfffff7f846f0
   0x0000fffff7f846ec:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f846f0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f846f4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f846f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f846fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84700:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84704:	17ffffde	b	0xfffff7f8467c
   0x0000fffff7f84708:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f8470c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84710:	aa1303e1	mov	x1, x19
   0x0000fffff7f84714:	aa1503e2	mov	x2, x21
   0x0000fffff7f84718:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f8471c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84720:	aa1603e5	mov	x5, x22
   0x0000fffff7f84724:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f84728:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8472c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84730:	d63f0200	blr	x16
   0x0000fffff7f84734:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84738:	5400bdc0	b.eq	0xfffff7f85ef0  // b.none
   0x0000fffff7f8473c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84740:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84744:	540004a0	b.eq	0xfffff7f847d8  // b.none
   0x0000fffff7f84748:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8474c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84750:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84754:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84758:	54000400	b.eq	0xfffff7f847d8  // b.none
   0x0000fffff7f8475c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84760:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84764:	36d801d1	tbz	w17, #27, 0xfffff7f8479c
   0x0000fffff7f84768:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8476c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84770:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84774:	54000321	b.ne	0xfffff7f847d8  // b.any
   0x0000fffff7f84778:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8477c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84780:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84784:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84788:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8478c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84790:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84794:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84798:	54000209	b.ls	0xfffff7f847d8  // b.plast
   0x0000fffff7f8479c:	36d8008d	tbz	w13, #27, 0xfffff7f847ac
   0x0000fffff7f847a0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f847a4:	91000529	add	x9, x9, #0x1
   0x0000fffff7f847a8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f847ac:	36d80091	tbz	w17, #27, 0xfffff7f847bc
   0x0000fffff7f847b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f847b4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f847b8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f847bc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f847c0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f847c4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f847c8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f847cc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f847d0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f847d4:	1400000e	b	0xfffff7f8480c
   0x0000fffff7f847d8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f847dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f847e0:	aa1303e1	mov	x1, x19
   0x0000fffff7f847e4:	aa1503e2	mov	x2, x21
   0x0000fffff7f847e8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f847ec:	aa1403e4	mov	x4, x20
   0x0000fffff7f847f0:	aa1603e5	mov	x5, x22
   0x0000fffff7f847f4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f847f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f847fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84800:	d63f0200	blr	x16
   0x0000fffff7f84804:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84808:	5400b780	b.eq	0xfffff7f85ef8  // b.none
   0x0000fffff7f8480c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84810:	37d806a9	tbnz	w9, #27, 0xfffff7f848e4
   0x0000fffff7f84814:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84818:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8481c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84820:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84824:	540001c1	b.ne	0xfffff7f8485c  // b.any
   0x0000fffff7f84828:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8482c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84830:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84834:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84838:	54000121	b.ne	0xfffff7f8485c  // b.any
   0x0000fffff7f8483c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84840:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84844:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84848:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8484c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84850:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84854:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84858:	14000030	b	0xfffff7f84918
   0x0000fffff7f8485c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84860:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84864:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84868:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8486c:	54000120	b.eq	0xfffff7f84890  // b.none
   0x0000fffff7f84870:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84874:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84878:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8487c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84880:	54000321	b.ne	0xfffff7f848e4  // b.any
   0x0000fffff7f84884:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84888:	9e620120	scvtf	d0, x9
   0x0000fffff7f8488c:	14000002	b	0xfffff7f84894
   0x0000fffff7f84890:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f84894:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84898:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8489c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848a4:	54000120	b.eq	0xfffff7f848c8  // b.none
   0x0000fffff7f848a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f848ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f848b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f848b8:	54000161	b.ne	0xfffff7f848e4  // b.any
   0x0000fffff7f848bc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f848c0:	9e620121	scvtf	d1, x9
   0x0000fffff7f848c4:	14000002	b	0xfffff7f848cc
   0x0000fffff7f848c8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f848cc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f848d0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f848d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f848d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f848dc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f848e0:	17ffffde	b	0xfffff7f84858
   0x0000fffff7f848e4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f848e8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f848ec:	aa1303e1	mov	x1, x19
   0x0000fffff7f848f0:	aa1503e2	mov	x2, x21
   0x0000fffff7f848f4:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f848f8:	aa1403e4	mov	x4, x20
   0x0000fffff7f848fc:	aa1603e5	mov	x5, x22
   0x0000fffff7f84900:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f84904:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84908:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8490c:	d63f0200	blr	x16
   0x0000fffff7f84910:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84914:	5400af60	b.eq	0xfffff7f85f00  // b.none
   0x0000fffff7f84918:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8491c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84920:	540004a0	b.eq	0xfffff7f849b4  // b.none
   0x0000fffff7f84924:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84928:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8492c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84930:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84934:	54000400	b.eq	0xfffff7f849b4  // b.none
   0x0000fffff7f84938:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8493c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84940:	36d801d1	tbz	w17, #27, 0xfffff7f84978
   0x0000fffff7f84944:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84948:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8494c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84950:	54000321	b.ne	0xfffff7f849b4  // b.any
   0x0000fffff7f84954:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84958:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8495c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84960:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84964:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84968:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8496c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84970:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84974:	54000209	b.ls	0xfffff7f849b4  // b.plast
   0x0000fffff7f84978:	36d8008d	tbz	w13, #27, 0xfffff7f84988
   0x0000fffff7f8497c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84980:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84984:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84988:	36d80091	tbz	w17, #27, 0xfffff7f84998
   0x0000fffff7f8498c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84990:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84994:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84998:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8499c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f849a0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f849a4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f849a8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f849ac:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f849b0:	1400000e	b	0xfffff7f849e8
   0x0000fffff7f849b4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f849b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f849bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f849c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f849c4:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f849c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f849cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f849d0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f849d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f849d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f849dc:	d63f0200	blr	x16
   0x0000fffff7f849e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f849e4:	5400a920	b.eq	0xfffff7f85f08  // b.none
   0x0000fffff7f849e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f849ec:	37d806a9	tbnz	w9, #27, 0xfffff7f84ac0
   0x0000fffff7f849f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f849f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f849f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f849fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a00:	540001c1	b.ne	0xfffff7f84a38  // b.any
   0x0000fffff7f84a04:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a14:	54000121	b.ne	0xfffff7f84a38  // b.any
   0x0000fffff7f84a18:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84a1c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84a20:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84a24:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a28:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a2c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84a30:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84a34:	14000030	b	0xfffff7f84af4
   0x0000fffff7f84a38:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84a3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84a40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a48:	54000120	b.eq	0xfffff7f84a6c  // b.none
   0x0000fffff7f84a4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84a50:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a58:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a5c:	54000321	b.ne	0xfffff7f84ac0  // b.any
   0x0000fffff7f84a60:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84a64:	9e620120	scvtf	d0, x9
   0x0000fffff7f84a68:	14000002	b	0xfffff7f84a70
   0x0000fffff7f84a6c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f84a70:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84a78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a80:	54000120	b.eq	0xfffff7f84aa4  // b.none
   0x0000fffff7f84a84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84a88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84a8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84a90:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84a94:	54000161	b.ne	0xfffff7f84ac0  // b.any
   0x0000fffff7f84a98:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84a9c:	9e620121	scvtf	d1, x9
   0x0000fffff7f84aa0:	14000002	b	0xfffff7f84aa8
   0x0000fffff7f84aa4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84aa8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84aac:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f84ab0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84ab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84ab8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84abc:	17ffffde	b	0xfffff7f84a34
   0x0000fffff7f84ac0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84ac4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84ac8:	aa1303e1	mov	x1, x19
   0x0000fffff7f84acc:	aa1503e2	mov	x2, x21
   0x0000fffff7f84ad0:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f84ad4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ad8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84adc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f84ae0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84ae4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ae8:	d63f0200	blr	x16
   0x0000fffff7f84aec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84af0:	5400a100	b.eq	0xfffff7f85f10  // b.none
   0x0000fffff7f84af4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84af8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84afc:	540004a0	b.eq	0xfffff7f84b90  // b.none
   0x0000fffff7f84b00:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84b04:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84b08:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84b0c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84b10:	54000400	b.eq	0xfffff7f84b90  // b.none
   0x0000fffff7f84b14:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84b18:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84b1c:	36d801d1	tbz	w17, #27, 0xfffff7f84b54
   0x0000fffff7f84b20:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84b24:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84b28:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84b2c:	54000321	b.ne	0xfffff7f84b90  // b.any
   0x0000fffff7f84b30:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84b34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84b38:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84b3c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84b40:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84b44:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84b48:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84b4c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84b50:	54000209	b.ls	0xfffff7f84b90  // b.plast
   0x0000fffff7f84b54:	36d8008d	tbz	w13, #27, 0xfffff7f84b64
   0x0000fffff7f84b58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84b5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84b60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84b64:	36d80091	tbz	w17, #27, 0xfffff7f84b74
   0x0000fffff7f84b68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84b6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84b70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84b74:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f84b78:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84b7c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84b80:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84b84:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84b88:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84b8c:	1400000e	b	0xfffff7f84bc4
   0x0000fffff7f84b90:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84b94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84b98:	aa1303e1	mov	x1, x19
   0x0000fffff7f84b9c:	aa1503e2	mov	x2, x21
   0x0000fffff7f84ba0:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f84ba4:	aa1403e4	mov	x4, x20
   0x0000fffff7f84ba8:	aa1603e5	mov	x5, x22
   0x0000fffff7f84bac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f84bb0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84bb4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84bb8:	d63f0200	blr	x16
   0x0000fffff7f84bbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84bc0:	54009ac0	b.eq	0xfffff7f85f18  // b.none
   0x0000fffff7f84bc4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84bc8:	37d806a9	tbnz	w9, #27, 0xfffff7f84c9c
   0x0000fffff7f84bcc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84bd0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84bd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84bd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bdc:	540001c1	b.ne	0xfffff7f84c14  // b.any
   0x0000fffff7f84be0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84be4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84be8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84bec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84bf0:	54000121	b.ne	0xfffff7f84c14  // b.any
   0x0000fffff7f84bf4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84bf8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84bfc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84c00:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84c04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c08:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84c0c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84c10:	14000030	b	0xfffff7f84cd0
   0x0000fffff7f84c14:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84c18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84c1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c20:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c24:	54000120	b.eq	0xfffff7f84c48  // b.none
   0x0000fffff7f84c28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84c2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84c30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c38:	54000321	b.ne	0xfffff7f84c9c  // b.any
   0x0000fffff7f84c3c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84c40:	9e620120	scvtf	d0, x9
   0x0000fffff7f84c44:	14000002	b	0xfffff7f84c4c
   0x0000fffff7f84c48:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f84c4c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84c50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84c54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c58:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c5c:	54000120	b.eq	0xfffff7f84c80  // b.none
   0x0000fffff7f84c60:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84c64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84c68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84c70:	54000161	b.ne	0xfffff7f84c9c  // b.any
   0x0000fffff7f84c74:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84c78:	9e620121	scvtf	d1, x9
   0x0000fffff7f84c7c:	14000002	b	0xfffff7f84c84
   0x0000fffff7f84c80:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84c84:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84c88:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f84c8c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84c90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84c94:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84c98:	17ffffde	b	0xfffff7f84c10
   0x0000fffff7f84c9c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84ca0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84ca4:	aa1303e1	mov	x1, x19
   0x0000fffff7f84ca8:	aa1503e2	mov	x2, x21
   0x0000fffff7f84cac:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f84cb0:	aa1403e4	mov	x4, x20
   0x0000fffff7f84cb4:	aa1603e5	mov	x5, x22
   0x0000fffff7f84cb8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f84cbc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84cc0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84cc4:	d63f0200	blr	x16
   0x0000fffff7f84cc8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ccc:	540092a0	b.eq	0xfffff7f85f20  // b.none
   0x0000fffff7f84cd0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84cd4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84cd8:	540004a0	b.eq	0xfffff7f84d6c  // b.none
   0x0000fffff7f84cdc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84ce0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84ce4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84ce8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84cec:	54000400	b.eq	0xfffff7f84d6c  // b.none
   0x0000fffff7f84cf0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84cf4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84cf8:	36d801d1	tbz	w17, #27, 0xfffff7f84d30
   0x0000fffff7f84cfc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84d00:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84d04:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84d08:	54000321	b.ne	0xfffff7f84d6c  // b.any
   0x0000fffff7f84d0c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84d10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d14:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84d18:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84d1c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84d20:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84d24:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84d28:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84d2c:	54000209	b.ls	0xfffff7f84d6c  // b.plast
   0x0000fffff7f84d30:	36d8008d	tbz	w13, #27, 0xfffff7f84d40
   0x0000fffff7f84d34:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84d38:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84d3c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84d40:	36d80091	tbz	w17, #27, 0xfffff7f84d50
   0x0000fffff7f84d44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84d48:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84d4c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84d50:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f84d54:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84d58:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84d5c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84d60:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84d64:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84d68:	1400000e	b	0xfffff7f84da0
   0x0000fffff7f84d6c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84d70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84d74:	aa1303e1	mov	x1, x19
   0x0000fffff7f84d78:	aa1503e2	mov	x2, x21
   0x0000fffff7f84d7c:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f84d80:	aa1403e4	mov	x4, x20
   0x0000fffff7f84d84:	aa1603e5	mov	x5, x22
   0x0000fffff7f84d88:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f84d8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84d90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84d94:	d63f0200	blr	x16
   0x0000fffff7f84d98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84d9c:	54008c60	b.eq	0xfffff7f85f28  // b.none
   0x0000fffff7f84da0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84da4:	37d806a9	tbnz	w9, #27, 0xfffff7f84e78
   0x0000fffff7f84da8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84dac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84db0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84db4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84db8:	540001c1	b.ne	0xfffff7f84df0  // b.any
   0x0000fffff7f84dbc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84dc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84dc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84dc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84dcc:	54000121	b.ne	0xfffff7f84df0  // b.any
   0x0000fffff7f84dd0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84dd4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84dd8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84ddc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84de0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84de4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84de8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84dec:	14000030	b	0xfffff7f84eac
   0x0000fffff7f84df0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84df4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84df8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84dfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84e00:	54000120	b.eq	0xfffff7f84e24  // b.none
   0x0000fffff7f84e04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84e08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84e10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84e14:	54000321	b.ne	0xfffff7f84e78  // b.any
   0x0000fffff7f84e18:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84e1c:	9e620120	scvtf	d0, x9
   0x0000fffff7f84e20:	14000002	b	0xfffff7f84e28
   0x0000fffff7f84e24:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f84e28:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84e2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84e30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84e34:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84e38:	54000120	b.eq	0xfffff7f84e5c  // b.none
   0x0000fffff7f84e3c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84e40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84e44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84e48:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84e4c:	54000161	b.ne	0xfffff7f84e78  // b.any
   0x0000fffff7f84e50:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f84e54:	9e620121	scvtf	d1, x9
   0x0000fffff7f84e58:	14000002	b	0xfffff7f84e60
   0x0000fffff7f84e5c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f84e60:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f84e64:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f84e68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84e6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84e70:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84e74:	17ffffde	b	0xfffff7f84dec
   0x0000fffff7f84e78:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f84e7c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84e80:	aa1303e1	mov	x1, x19
   0x0000fffff7f84e84:	aa1503e2	mov	x2, x21
   0x0000fffff7f84e88:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f84e8c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84e90:	aa1603e5	mov	x5, x22
   0x0000fffff7f84e94:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f84e98:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f84e9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84ea0:	d63f0200	blr	x16
   0x0000fffff7f84ea4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84ea8:	54008440	b.eq	0xfffff7f85f30  // b.none
   0x0000fffff7f84eac:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f84eb0:	f100017f	cmp	x11, #0x0
   0x0000fffff7f84eb4:	540004a0	b.eq	0xfffff7f84f48  // b.none
   0x0000fffff7f84eb8:	b940016d	ldr	w13, [x11]
   0x0000fffff7f84ebc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f84ec0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f84ec4:	eb0901bf	cmp	x13, x9
   0x0000fffff7f84ec8:	54000400	b.eq	0xfffff7f84f48  // b.none
   0x0000fffff7f84ecc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f84ed0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f84ed4:	36d801d1	tbz	w17, #27, 0xfffff7f84f0c
   0x0000fffff7f84ed8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f84edc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f84ee0:	f100013f	cmp	x9, #0x0
   0x0000fffff7f84ee4:	54000321	b.ne	0xfffff7f84f48  // b.any
   0x0000fffff7f84ee8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f84eec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84ef0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f84ef4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f84ef8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f84efc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f84f00:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f84f04:	f100055f	cmp	x10, #0x1
   0x0000fffff7f84f08:	54000209	b.ls	0xfffff7f84f48  // b.plast
   0x0000fffff7f84f0c:	36d8008d	tbz	w13, #27, 0xfffff7f84f1c
   0x0000fffff7f84f10:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f84f14:	91000529	add	x9, x9, #0x1
   0x0000fffff7f84f18:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f84f1c:	36d80091	tbz	w17, #27, 0xfffff7f84f2c
   0x0000fffff7f84f20:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f84f24:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f84f28:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f84f2c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f84f30:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f84f34:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f84f38:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f84f3c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f84f40:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f84f44:	1400000e	b	0xfffff7f84f7c
   0x0000fffff7f84f48:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f84f4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f84f50:	aa1303e1	mov	x1, x19
   0x0000fffff7f84f54:	aa1503e2	mov	x2, x21
   0x0000fffff7f84f58:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f84f5c:	aa1403e4	mov	x4, x20
   0x0000fffff7f84f60:	aa1603e5	mov	x5, x22
   0x0000fffff7f84f64:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f84f68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f84f6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f84f70:	d63f0200	blr	x16
   0x0000fffff7f84f74:	f100001f	cmp	x0, #0x0
   0x0000fffff7f84f78:	54007e00	b.eq	0xfffff7f85f38  // b.none
   0x0000fffff7f84f7c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84f80:	37d806a9	tbnz	w9, #27, 0xfffff7f85054
   0x0000fffff7f84f84:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84f88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84f8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84f90:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84f94:	540001c1	b.ne	0xfffff7f84fcc  // b.any
   0x0000fffff7f84f98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f84f9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84fa0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fa4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84fa8:	54000121	b.ne	0xfffff7f84fcc  // b.any
   0x0000fffff7f84fac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84fb0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f84fb4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f84fb8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84fbc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fc0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f84fc4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f84fc8:	14000030	b	0xfffff7f85088
   0x0000fffff7f84fcc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84fd0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f84fd4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fd8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84fdc:	54000120	b.eq	0xfffff7f85000  // b.none
   0x0000fffff7f84fe0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f84fe4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f84fe8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f84fec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f84ff0:	54000321	b.ne	0xfffff7f85054  // b.any
   0x0000fffff7f84ff4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f84ff8:	9e620120	scvtf	d0, x9
   0x0000fffff7f84ffc:	14000002	b	0xfffff7f85004
   0x0000fffff7f85000:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f85004:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85008:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8500c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85010:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85014:	54000120	b.eq	0xfffff7f85038  // b.none
   0x0000fffff7f85018:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8501c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85020:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85024:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85028:	54000161	b.ne	0xfffff7f85054  // b.any
   0x0000fffff7f8502c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85030:	9e620121	scvtf	d1, x9
   0x0000fffff7f85034:	14000002	b	0xfffff7f8503c
   0x0000fffff7f85038:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f8503c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85040:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f85044:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8504c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f85050:	17ffffde	b	0xfffff7f84fc8
   0x0000fffff7f85054:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85058:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8505c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85060:	aa1503e2	mov	x2, x21
   0x0000fffff7f85064:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f85068:	aa1403e4	mov	x4, x20
   0x0000fffff7f8506c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85070:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85074:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85078:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8507c:	d63f0200	blr	x16
   0x0000fffff7f85080:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85084:	540075e0	b.eq	0xfffff7f85f40  // b.none
   0x0000fffff7f85088:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f8508c:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85090:	540004a0	b.eq	0xfffff7f85124  // b.none
   0x0000fffff7f85094:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85098:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8509c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f850a0:	eb0901bf	cmp	x13, x9
   0x0000fffff7f850a4:	54000400	b.eq	0xfffff7f85124  // b.none
   0x0000fffff7f850a8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f850ac:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f850b0:	36d801d1	tbz	w17, #27, 0xfffff7f850e8
   0x0000fffff7f850b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f850b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f850bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f850c0:	54000321	b.ne	0xfffff7f85124  // b.any
   0x0000fffff7f850c4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f850c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f850cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f850d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f850d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f850d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f850dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f850e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f850e4:	54000209	b.ls	0xfffff7f85124  // b.plast
   0x0000fffff7f850e8:	36d8008d	tbz	w13, #27, 0xfffff7f850f8
   0x0000fffff7f850ec:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f850f0:	91000529	add	x9, x9, #0x1
   0x0000fffff7f850f4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f850f8:	36d80091	tbz	w17, #27, 0xfffff7f85108
   0x0000fffff7f850fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85100:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85104:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85108:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8510c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85110:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85114:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85118:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8511c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85120:	1400000e	b	0xfffff7f85158
   0x0000fffff7f85124:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85128:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8512c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85130:	aa1503e2	mov	x2, x21
   0x0000fffff7f85134:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f85138:	aa1403e4	mov	x4, x20
   0x0000fffff7f8513c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85140:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85144:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85148:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8514c:	d63f0200	blr	x16
   0x0000fffff7f85150:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85154:	54006fa0	b.eq	0xfffff7f85f48  // b.none
   0x0000fffff7f85158:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8515c:	37d806a9	tbnz	w9, #27, 0xfffff7f85230
   0x0000fffff7f85160:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85164:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85168:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8516c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85170:	540001c1	b.ne	0xfffff7f851a8  // b.any
   0x0000fffff7f85174:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85178:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8517c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85180:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85184:	54000121	b.ne	0xfffff7f851a8  // b.any
   0x0000fffff7f85188:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8518c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85190:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85194:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85198:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8519c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f851a0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f851a4:	14000030	b	0xfffff7f85264
   0x0000fffff7f851a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f851ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f851b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851b8:	54000120	b.eq	0xfffff7f851dc  // b.none
   0x0000fffff7f851bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f851c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851cc:	54000321	b.ne	0xfffff7f85230  // b.any
   0x0000fffff7f851d0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f851d4:	9e620120	scvtf	d0, x9
   0x0000fffff7f851d8:	14000002	b	0xfffff7f851e0
   0x0000fffff7f851dc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f851e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f851e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f851e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f851ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f851f0:	54000120	b.eq	0xfffff7f85214  // b.none
   0x0000fffff7f851f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f851f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f851fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85200:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85204:	54000161	b.ne	0xfffff7f85230  // b.any
   0x0000fffff7f85208:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8520c:	9e620121	scvtf	d1, x9
   0x0000fffff7f85210:	14000002	b	0xfffff7f85218
   0x0000fffff7f85214:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f85218:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8521c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f85220:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85224:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85228:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8522c:	17ffffde	b	0xfffff7f851a4
   0x0000fffff7f85230:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85234:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85238:	aa1303e1	mov	x1, x19
   0x0000fffff7f8523c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85240:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f85244:	aa1403e4	mov	x4, x20
   0x0000fffff7f85248:	aa1603e5	mov	x5, x22
   0x0000fffff7f8524c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85250:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85254:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85258:	d63f0200	blr	x16
   0x0000fffff7f8525c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85260:	54006780	b.eq	0xfffff7f85f50  // b.none
   0x0000fffff7f85264:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85268:	f100017f	cmp	x11, #0x0
   0x0000fffff7f8526c:	540004a0	b.eq	0xfffff7f85300  // b.none
   0x0000fffff7f85270:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85274:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85278:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f8527c:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85280:	54000400	b.eq	0xfffff7f85300  // b.none
   0x0000fffff7f85284:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85288:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f8528c:	36d801d1	tbz	w17, #27, 0xfffff7f852c4
   0x0000fffff7f85290:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85294:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85298:	f100013f	cmp	x9, #0x0
   0x0000fffff7f8529c:	54000321	b.ne	0xfffff7f85300  // b.any
   0x0000fffff7f852a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f852a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f852a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f852ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f852b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f852b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f852b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f852bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7f852c0:	54000209	b.ls	0xfffff7f85300  // b.plast
   0x0000fffff7f852c4:	36d8008d	tbz	w13, #27, 0xfffff7f852d4
   0x0000fffff7f852c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f852cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7f852d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f852d4:	36d80091	tbz	w17, #27, 0xfffff7f852e4
   0x0000fffff7f852d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f852dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f852e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f852e4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f852e8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f852ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f852f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f852f4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f852f8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f852fc:	1400000e	b	0xfffff7f85334
   0x0000fffff7f85300:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85304:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85308:	aa1303e1	mov	x1, x19
   0x0000fffff7f8530c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85310:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f85314:	aa1403e4	mov	x4, x20
   0x0000fffff7f85318:	aa1603e5	mov	x5, x22
   0x0000fffff7f8531c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85320:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85324:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85328:	d63f0200	blr	x16
   0x0000fffff7f8532c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85330:	54006140	b.eq	0xfffff7f85f58  // b.none
   0x0000fffff7f85334:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85338:	37d806a9	tbnz	w9, #27, 0xfffff7f8540c
   0x0000fffff7f8533c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85340:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85344:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85348:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8534c:	540001c1	b.ne	0xfffff7f85384  // b.any
   0x0000fffff7f85350:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85354:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8535c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85360:	54000121	b.ne	0xfffff7f85384  // b.any
   0x0000fffff7f85364:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85368:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f8536c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85370:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85374:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85378:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f8537c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f85380:	14000030	b	0xfffff7f85440
   0x0000fffff7f85384:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85388:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8538c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85390:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85394:	54000120	b.eq	0xfffff7f853b8  // b.none
   0x0000fffff7f85398:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8539c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f853a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853a8:	54000321	b.ne	0xfffff7f8540c  // b.any
   0x0000fffff7f853ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f853b0:	9e620120	scvtf	d0, x9
   0x0000fffff7f853b4:	14000002	b	0xfffff7f853bc
   0x0000fffff7f853b8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f853bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f853c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f853c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853cc:	54000120	b.eq	0xfffff7f853f0  // b.none
   0x0000fffff7f853d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f853d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f853d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f853dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f853e0:	54000161	b.ne	0xfffff7f8540c  // b.any
   0x0000fffff7f853e4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f853e8:	9e620121	scvtf	d1, x9
   0x0000fffff7f853ec:	14000002	b	0xfffff7f853f4
   0x0000fffff7f853f0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f853f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f853f8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f853fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85404:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f85408:	17ffffde	b	0xfffff7f85380
   0x0000fffff7f8540c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85410:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85414:	aa1303e1	mov	x1, x19
   0x0000fffff7f85418:	aa1503e2	mov	x2, x21
   0x0000fffff7f8541c:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f85420:	aa1403e4	mov	x4, x20
   0x0000fffff7f85424:	aa1603e5	mov	x5, x22
   0x0000fffff7f85428:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f8542c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85430:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85434:	d63f0200	blr	x16
   0x0000fffff7f85438:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8543c:	54005920	b.eq	0xfffff7f85f60  // b.none
   0x0000fffff7f85440:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85444:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85448:	540004a0	b.eq	0xfffff7f854dc  // b.none
   0x0000fffff7f8544c:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85450:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85454:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85458:	eb0901bf	cmp	x13, x9
   0x0000fffff7f8545c:	54000400	b.eq	0xfffff7f854dc  // b.none
   0x0000fffff7f85460:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85464:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85468:	36d801d1	tbz	w17, #27, 0xfffff7f854a0
   0x0000fffff7f8546c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85470:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85474:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85478:	54000321	b.ne	0xfffff7f854dc  // b.any
   0x0000fffff7f8547c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85480:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85484:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85488:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f8548c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85490:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85494:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85498:	f100055f	cmp	x10, #0x1
   0x0000fffff7f8549c:	54000209	b.ls	0xfffff7f854dc  // b.plast
   0x0000fffff7f854a0:	36d8008d	tbz	w13, #27, 0xfffff7f854b0
   0x0000fffff7f854a4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f854a8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f854ac:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f854b0:	36d80091	tbz	w17, #27, 0xfffff7f854c0
   0x0000fffff7f854b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f854b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f854bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f854c0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f854c4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f854c8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f854cc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f854d0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f854d4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f854d8:	1400000e	b	0xfffff7f85510
   0x0000fffff7f854dc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f854e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f854e4:	aa1303e1	mov	x1, x19
   0x0000fffff7f854e8:	aa1503e2	mov	x2, x21
   0x0000fffff7f854ec:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f854f0:	aa1403e4	mov	x4, x20
   0x0000fffff7f854f4:	aa1603e5	mov	x5, x22
   0x0000fffff7f854f8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f854fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85500:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85504:	d63f0200	blr	x16
   0x0000fffff7f85508:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8550c:	540052e0	b.eq	0xfffff7f85f68  // b.none
   0x0000fffff7f85510:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85514:	37d806a9	tbnz	w9, #27, 0xfffff7f855e8
   0x0000fffff7f85518:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8551c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85524:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85528:	540001c1	b.ne	0xfffff7f85560  // b.any
   0x0000fffff7f8552c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85530:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85534:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85538:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8553c:	54000121	b.ne	0xfffff7f85560  // b.any
   0x0000fffff7f85540:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85544:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85548:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f8554c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85550:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85554:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f85558:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8555c:	14000030	b	0xfffff7f8561c
   0x0000fffff7f85560:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85564:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85568:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8556c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85570:	54000120	b.eq	0xfffff7f85594  // b.none
   0x0000fffff7f85574:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85578:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8557c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85580:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85584:	54000321	b.ne	0xfffff7f855e8  // b.any
   0x0000fffff7f85588:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f8558c:	9e620120	scvtf	d0, x9
   0x0000fffff7f85590:	14000002	b	0xfffff7f85598
   0x0000fffff7f85594:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f85598:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8559c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f855a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855a8:	54000120	b.eq	0xfffff7f855cc  // b.none
   0x0000fffff7f855ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f855b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f855b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f855bc:	54000161	b.ne	0xfffff7f855e8  // b.any
   0x0000fffff7f855c0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f855c4:	9e620121	scvtf	d1, x9
   0x0000fffff7f855c8:	14000002	b	0xfffff7f855d0
   0x0000fffff7f855cc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f855d0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f855d4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f855d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f855dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f855e0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f855e4:	17ffffde	b	0xfffff7f8555c
   0x0000fffff7f855e8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f855ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f855f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f855f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f855f8:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f855fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f85600:	aa1603e5	mov	x5, x22
   0x0000fffff7f85604:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85608:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f8560c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85610:	d63f0200	blr	x16
   0x0000fffff7f85614:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85618:	54004ac0	b.eq	0xfffff7f85f70  // b.none
   0x0000fffff7f8561c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85620:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85624:	540004a0	b.eq	0xfffff7f856b8  // b.none
   0x0000fffff7f85628:	b940016d	ldr	w13, [x11]
   0x0000fffff7f8562c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85630:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85634:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85638:	54000400	b.eq	0xfffff7f856b8  // b.none
   0x0000fffff7f8563c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85640:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85644:	36d801d1	tbz	w17, #27, 0xfffff7f8567c
   0x0000fffff7f85648:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f8564c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85650:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85654:	54000321	b.ne	0xfffff7f856b8  // b.any
   0x0000fffff7f85658:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f8565c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85660:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85664:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85668:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f8566c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85670:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85674:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85678:	54000209	b.ls	0xfffff7f856b8  // b.plast
   0x0000fffff7f8567c:	36d8008d	tbz	w13, #27, 0xfffff7f8568c
   0x0000fffff7f85680:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85684:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85688:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f8568c:	36d80091	tbz	w17, #27, 0xfffff7f8569c
   0x0000fffff7f85690:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85694:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85698:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f8569c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f856a0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f856a4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f856a8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f856ac:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f856b0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f856b4:	1400000e	b	0xfffff7f856ec
   0x0000fffff7f856b8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f856bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f856c0:	aa1303e1	mov	x1, x19
   0x0000fffff7f856c4:	aa1503e2	mov	x2, x21
   0x0000fffff7f856c8:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f856cc:	aa1403e4	mov	x4, x20
   0x0000fffff7f856d0:	aa1603e5	mov	x5, x22
   0x0000fffff7f856d4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f856d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f856dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f856e0:	d63f0200	blr	x16
   0x0000fffff7f856e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f856e8:	54004480	b.eq	0xfffff7f85f78  // b.none
   0x0000fffff7f856ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f856f0:	37d806a9	tbnz	w9, #27, 0xfffff7f857c4
   0x0000fffff7f856f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f856f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f856fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85700:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85704:	540001c1	b.ne	0xfffff7f8573c  // b.any
   0x0000fffff7f85708:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8570c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85710:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85714:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85718:	54000121	b.ne	0xfffff7f8573c  // b.any
   0x0000fffff7f8571c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85720:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85724:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85728:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8572c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85730:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f85734:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f85738:	14000030	b	0xfffff7f857f8
   0x0000fffff7f8573c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85740:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85744:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85748:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8574c:	54000120	b.eq	0xfffff7f85770  // b.none
   0x0000fffff7f85750:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85754:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85758:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8575c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85760:	54000321	b.ne	0xfffff7f857c4  // b.any
   0x0000fffff7f85764:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85768:	9e620120	scvtf	d0, x9
   0x0000fffff7f8576c:	14000002	b	0xfffff7f85774
   0x0000fffff7f85770:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f85774:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85778:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8577c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85780:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85784:	54000120	b.eq	0xfffff7f857a8  // b.none
   0x0000fffff7f85788:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f8578c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85790:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85794:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85798:	54000161	b.ne	0xfffff7f857c4  // b.any
   0x0000fffff7f8579c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f857a0:	9e620121	scvtf	d1, x9
   0x0000fffff7f857a4:	14000002	b	0xfffff7f857ac
   0x0000fffff7f857a8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f857ac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f857b0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f857b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f857b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f857bc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f857c0:	17ffffde	b	0xfffff7f85738
   0x0000fffff7f857c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f857c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f857cc:	aa1303e1	mov	x1, x19
   0x0000fffff7f857d0:	aa1503e2	mov	x2, x21
   0x0000fffff7f857d4:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f857d8:	aa1403e4	mov	x4, x20
   0x0000fffff7f857dc:	aa1603e5	mov	x5, x22
   0x0000fffff7f857e0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f857e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f857e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f857ec:	d63f0200	blr	x16
   0x0000fffff7f857f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f857f4:	54003c60	b.eq	0xfffff7f85f80  // b.none
   0x0000fffff7f857f8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f857fc:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85800:	540004a0	b.eq	0xfffff7f85894  // b.none
   0x0000fffff7f85804:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85808:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f8580c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85810:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85814:	54000400	b.eq	0xfffff7f85894  // b.none
   0x0000fffff7f85818:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f8581c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85820:	36d801d1	tbz	w17, #27, 0xfffff7f85858
   0x0000fffff7f85824:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85828:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f8582c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85830:	54000321	b.ne	0xfffff7f85894  // b.any
   0x0000fffff7f85834:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85838:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f8583c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85840:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85844:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85848:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f8584c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85850:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85854:	54000209	b.ls	0xfffff7f85894  // b.plast
   0x0000fffff7f85858:	36d8008d	tbz	w13, #27, 0xfffff7f85868
   0x0000fffff7f8585c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85860:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85864:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85868:	36d80091	tbz	w17, #27, 0xfffff7f85878
   0x0000fffff7f8586c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85870:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85874:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85878:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f8587c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85880:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85884:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85888:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f8588c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85890:	1400000e	b	0xfffff7f858c8
   0x0000fffff7f85894:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85898:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f8589c:	aa1303e1	mov	x1, x19
   0x0000fffff7f858a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f858a4:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f858a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f858ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f858b0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f858b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f858b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f858bc:	d63f0200	blr	x16
   0x0000fffff7f858c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f858c4:	54003620	b.eq	0xfffff7f85f88  // b.none
   0x0000fffff7f858c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f858cc:	37d806a9	tbnz	w9, #27, 0xfffff7f859a0
   0x0000fffff7f858d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f858d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858e0:	540001c1	b.ne	0xfffff7f85918  // b.any
   0x0000fffff7f858e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f858e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f858ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f858f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f858f4:	54000121	b.ne	0xfffff7f85918  // b.any
   0x0000fffff7f858f8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f858fc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85900:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85904:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85908:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8590c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f85910:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f85914:	14000030	b	0xfffff7f859d4
   0x0000fffff7f85918:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f8591c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85924:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85928:	54000120	b.eq	0xfffff7f8594c  // b.none
   0x0000fffff7f8592c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85930:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85934:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85938:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8593c:	54000321	b.ne	0xfffff7f859a0  // b.any
   0x0000fffff7f85940:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85944:	9e620120	scvtf	d0, x9
   0x0000fffff7f85948:	14000002	b	0xfffff7f85950
   0x0000fffff7f8594c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f85950:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85954:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8595c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85960:	54000120	b.eq	0xfffff7f85984  // b.none
   0x0000fffff7f85964:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f8596c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85970:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85974:	54000161	b.ne	0xfffff7f859a0  // b.any
   0x0000fffff7f85978:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f8597c:	9e620121	scvtf	d1, x9
   0x0000fffff7f85980:	14000002	b	0xfffff7f85988
   0x0000fffff7f85984:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f85988:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8598c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f85990:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85994:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85998:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f8599c:	17ffffde	b	0xfffff7f85914
   0x0000fffff7f859a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f859a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f859a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f859ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f859b0:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f859b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f859b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f859bc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f859c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f859c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f859c8:	d63f0200	blr	x16
   0x0000fffff7f859cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f859d0:	54002e00	b.eq	0xfffff7f85f90  // b.none
   0x0000fffff7f859d4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f859d8:	f100017f	cmp	x11, #0x0
   0x0000fffff7f859dc:	540004a0	b.eq	0xfffff7f85a70  // b.none
   0x0000fffff7f859e0:	b940016d	ldr	w13, [x11]
   0x0000fffff7f859e4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f859e8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f859ec:	eb0901bf	cmp	x13, x9
   0x0000fffff7f859f0:	54000400	b.eq	0xfffff7f85a70  // b.none
   0x0000fffff7f859f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f859f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f859fc:	36d801d1	tbz	w17, #27, 0xfffff7f85a34
   0x0000fffff7f85a00:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85a04:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85a08:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85a0c:	54000321	b.ne	0xfffff7f85a70  // b.any
   0x0000fffff7f85a10:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85a14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85a18:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85a1c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85a20:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85a24:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85a28:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85a2c:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85a30:	54000209	b.ls	0xfffff7f85a70  // b.plast
   0x0000fffff7f85a34:	36d8008d	tbz	w13, #27, 0xfffff7f85a44
   0x0000fffff7f85a38:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85a3c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85a40:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85a44:	36d80091	tbz	w17, #27, 0xfffff7f85a54
   0x0000fffff7f85a48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85a4c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85a50:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85a54:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f85a58:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85a5c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85a60:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85a64:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85a68:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85a6c:	1400000e	b	0xfffff7f85aa4
   0x0000fffff7f85a70:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85a74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85a78:	aa1303e1	mov	x1, x19
   0x0000fffff7f85a7c:	aa1503e2	mov	x2, x21
   0x0000fffff7f85a80:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f85a84:	aa1403e4	mov	x4, x20
   0x0000fffff7f85a88:	aa1603e5	mov	x5, x22
   0x0000fffff7f85a8c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85a90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85a94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85a98:	d63f0200	blr	x16
   0x0000fffff7f85a9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85aa0:	540027c0	b.eq	0xfffff7f85f98  // b.none
   0x0000fffff7f85aa4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85aa8:	37d806a9	tbnz	w9, #27, 0xfffff7f85b7c
   0x0000fffff7f85aac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85ab0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ab8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85abc:	540001c1	b.ne	0xfffff7f85af4  // b.any
   0x0000fffff7f85ac0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85ac4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ac8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85acc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ad0:	54000121	b.ne	0xfffff7f85af4  // b.any
   0x0000fffff7f85ad4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85ad8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85adc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85ae0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ae8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f85aec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f85af0:	14000030	b	0xfffff7f85bb0
   0x0000fffff7f85af4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85af8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85afc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b00:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b04:	54000120	b.eq	0xfffff7f85b28  // b.none
   0x0000fffff7f85b08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85b0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b14:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b18:	54000321	b.ne	0xfffff7f85b7c  // b.any
   0x0000fffff7f85b1c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85b20:	9e620120	scvtf	d0, x9
   0x0000fffff7f85b24:	14000002	b	0xfffff7f85b2c
   0x0000fffff7f85b28:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f85b2c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85b30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85b34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b38:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b3c:	54000120	b.eq	0xfffff7f85b60  // b.none
   0x0000fffff7f85b40:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85b44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85b48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85b50:	54000161	b.ne	0xfffff7f85b7c  // b.any
   0x0000fffff7f85b54:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85b58:	9e620121	scvtf	d1, x9
   0x0000fffff7f85b5c:	14000002	b	0xfffff7f85b64
   0x0000fffff7f85b60:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f85b64:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85b68:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f85b6c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85b70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85b74:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f85b78:	17ffffde	b	0xfffff7f85af0
   0x0000fffff7f85b7c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85b80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85b84:	aa1303e1	mov	x1, x19
   0x0000fffff7f85b88:	aa1503e2	mov	x2, x21
   0x0000fffff7f85b8c:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f85b90:	aa1403e4	mov	x4, x20
   0x0000fffff7f85b94:	aa1603e5	mov	x5, x22
   0x0000fffff7f85b98:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85b9c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85ba0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85ba4:	d63f0200	blr	x16
   0x0000fffff7f85ba8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85bac:	54001fa0	b.eq	0xfffff7f85fa0  // b.none
   0x0000fffff7f85bb0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7f85bb4:	f100017f	cmp	x11, #0x0
   0x0000fffff7f85bb8:	540004a0	b.eq	0xfffff7f85c4c  // b.none
   0x0000fffff7f85bbc:	b940016d	ldr	w13, [x11]
   0x0000fffff7f85bc0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7f85bc4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7f85bc8:	eb0901bf	cmp	x13, x9
   0x0000fffff7f85bcc:	54000400	b.eq	0xfffff7f85c4c  // b.none
   0x0000fffff7f85bd0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7f85bd4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7f85bd8:	36d801d1	tbz	w17, #27, 0xfffff7f85c10
   0x0000fffff7f85bdc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85be0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85be4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85be8:	54000321	b.ne	0xfffff7f85c4c  // b.any
   0x0000fffff7f85bec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7f85bf0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85bf4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85bf8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85bfc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85c00:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85c04:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85c08:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85c0c:	54000209	b.ls	0xfffff7f85c4c  // b.plast
   0x0000fffff7f85c10:	36d8008d	tbz	w13, #27, 0xfffff7f85c20
   0x0000fffff7f85c14:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7f85c18:	91000529	add	x9, x9, #0x1
   0x0000fffff7f85c1c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7f85c20:	36d80091	tbz	w17, #27, 0xfffff7f85c30
   0x0000fffff7f85c24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85c28:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85c2c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85c30:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7f85c34:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85c38:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7f85c3c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7f85c40:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85c44:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85c48:	1400000e	b	0xfffff7f85c80
   0x0000fffff7f85c4c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f85c50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85c54:	aa1303e1	mov	x1, x19
   0x0000fffff7f85c58:	aa1503e2	mov	x2, x21
   0x0000fffff7f85c5c:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f85c60:	aa1403e4	mov	x4, x20
   0x0000fffff7f85c64:	aa1603e5	mov	x5, x22
   0x0000fffff7f85c68:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f85c6c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85c70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85c74:	d63f0200	blr	x16
   0x0000fffff7f85c78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85c7c:	54001960	b.eq	0xfffff7f85fa8  // b.none
   0x0000fffff7f85c80:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85c84:	37d806a9	tbnz	w9, #27, 0xfffff7f85d58
   0x0000fffff7f85c88:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85c8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85c90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85c94:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85c98:	540001c1	b.ne	0xfffff7f85cd0  // b.any
   0x0000fffff7f85c9c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85ca0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85ca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85ca8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85cac:	54000121	b.ne	0xfffff7f85cd0  // b.any
   0x0000fffff7f85cb0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85cb4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7f85cb8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f85cbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85cc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85cc4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7f85cc8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f85ccc:	14000030	b	0xfffff7f85d8c
   0x0000fffff7f85cd0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85cd4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85cd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85cdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85ce0:	54000120	b.eq	0xfffff7f85d04  // b.none
   0x0000fffff7f85ce4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f85ce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85cec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85cf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85cf4:	54000321	b.ne	0xfffff7f85d58  // b.any
   0x0000fffff7f85cf8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f85cfc:	9e620120	scvtf	d0, x9
   0x0000fffff7f85d00:	14000002	b	0xfffff7f85d08
   0x0000fffff7f85d04:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f85d08:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85d0c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85d10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d14:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85d18:	54000120	b.eq	0xfffff7f85d3c  // b.none
   0x0000fffff7f85d1c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f85d20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85d24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d28:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85d2c:	54000161	b.ne	0xfffff7f85d58  // b.any
   0x0000fffff7f85d30:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7f85d34:	9e620121	scvtf	d1, x9
   0x0000fffff7f85d38:	14000002	b	0xfffff7f85d40
   0x0000fffff7f85d3c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7f85d40:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f85d44:	fd002660	str	d0, [x19, #72]
   0x0000fffff7f85d48:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f85d4c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d50:	b900426a	str	w10, [x19, #64]
   0x0000fffff7f85d54:	17ffffde	b	0xfffff7f85ccc
   0x0000fffff7f85d58:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85d5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85d60:	aa1303e1	mov	x1, x19
   0x0000fffff7f85d64:	aa1503e2	mov	x2, x21
   0x0000fffff7f85d68:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f85d6c:	aa1403e4	mov	x4, x20
   0x0000fffff7f85d70:	aa1603e5	mov	x5, x22
   0x0000fffff7f85d74:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f85d78:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85d7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85d80:	d63f0200	blr	x16
   0x0000fffff7f85d84:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85d88:	54001140	b.eq	0xfffff7f85fb0  // b.none
   0x0000fffff7f85d8c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f85d90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85d94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85d98:	eb0a013f	cmp	x9, x10
   0x0000fffff7f85d9c:	54000381	b.ne	0xfffff7f85e0c  // b.any
   0x0000fffff7f85da0:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7f85da4:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7f85da8:	8b0a018b	add	x11, x12, x10
   0x0000fffff7f85dac:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7f85db0:	36d80211	tbz	w17, #27, 0xfffff7f85df0
   0x0000fffff7f85db4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7f85db8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7f85dbc:	f100013f	cmp	x9, #0x0
   0x0000fffff7f85dc0:	54000261	b.ne	0xfffff7f85e0c  // b.any
   0x0000fffff7f85dc4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7f85dc8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7f85dcc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7f85dd0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7f85dd4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7f85dd8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7f85ddc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7f85de0:	f100055f	cmp	x10, #0x1
   0x0000fffff7f85de4:	54000149	b.ls	0xfffff7f85e0c  // b.plast
   0x0000fffff7f85de8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7f85dec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7f85df0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7f85df4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7f85df8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7f85dfc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7f85e00:	f9002e6b	str	x11, [x19, #88]
   0x0000fffff7f85e04:	b900526d	str	w13, [x19, #80]
   0x0000fffff7f85e08:	1400000e	b	0xfffff7f85e40
   0x0000fffff7f85e0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85e10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85e14:	aa1303e1	mov	x1, x19
   0x0000fffff7f85e18:	aa1503e2	mov	x2, x21
   0x0000fffff7f85e1c:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7f85e20:	aa1403e4	mov	x4, x20
   0x0000fffff7f85e24:	aa1603e5	mov	x5, x22
   0x0000fffff7f85e28:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7f85e2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f85e30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85e34:	d63f0200	blr	x16
   0x0000fffff7f85e38:	f100001f	cmp	x0, #0x0
   0x0000fffff7f85e3c:	54000be0	b.eq	0xfffff7f85fb8  // b.none
   0x0000fffff7f85e40:	17fff8eb	b	0xfffff7f841ec
   0x0000fffff7f85e44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f85e48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f85e4c:	aa1303e1	mov	x1, x19
   0x0000fffff7f85e50:	aa1503e2	mov	x2, x21
   0x0000fffff7f85e54:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7f85e58:	aa1403e4	mov	x4, x20
   0x0000fffff7f85e5c:	aa1603e5	mov	x5, x22
   0x0000fffff7f85e60:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f85e64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f85e68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f85e6c:	d63f0200	blr	x16
   0x0000fffff7f85e70:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f85e74:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85e78:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85e7c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85e80:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f85e84:	d65f03c0	ret
   0x0000fffff7f85e88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f85e8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f85e90:	b900028a	str	w10, [x20]
   0x0000fffff7f85e94:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f85e98:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f85e9c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f85ea0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f85ea4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f85ea8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f85eac:	d65f03c0	ret
   0x0000fffff7f85eb0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f85eb4:	17fffff5	b	0xfffff7f85e88
   0x0000fffff7f85eb8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f85ebc:	17fffff3	b	0xfffff7f85e88
   0x0000fffff7f85ec0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f85ec4:	17fffff1	b	0xfffff7f85e88
   0x0000fffff7f85ec8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f85ecc:	17ffffef	b	0xfffff7f85e88
   0x0000fffff7f85ed0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f85ed4:	17ffffed	b	0xfffff7f85e88
   0x0000fffff7f85ed8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f85edc:	17ffffeb	b	0xfffff7f85e88
   0x0000fffff7f85ee0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f85ee4:	17ffffe9	b	0xfffff7f85e88
   0x0000fffff7f85ee8:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f85eec:	17ffffe7	b	0xfffff7f85e88
   0x0000fffff7f85ef0:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f85ef4:	17ffffe5	b	0xfffff7f85e88
   0x0000fffff7f85ef8:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f85efc:	17ffffe3	b	0xfffff7f85e88
   0x0000fffff7f85f00:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f85f04:	17ffffe1	b	0xfffff7f85e88
   0x0000fffff7f85f08:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f85f0c:	17ffffdf	b	0xfffff7f85e88
   0x0000fffff7f85f10:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f85f14:	17ffffdd	b	0xfffff7f85e88
   0x0000fffff7f85f18:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f85f1c:	17ffffdb	b	0xfffff7f85e88
   0x0000fffff7f85f20:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f85f24:	17ffffd9	b	0xfffff7f85e88
   0x0000fffff7f85f28:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f85f2c:	17ffffd7	b	0xfffff7f85e88
   0x0000fffff7f85f30:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f85f34:	17ffffd5	b	0xfffff7f85e88
   0x0000fffff7f85f38:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f85f3c:	17ffffd3	b	0xfffff7f85e88
   0x0000fffff7f85f40:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f85f44:	17ffffd1	b	0xfffff7f85e88
   0x0000fffff7f85f48:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f85f4c:	17ffffcf	b	0xfffff7f85e88
   0x0000fffff7f85f50:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f85f54:	17ffffcd	b	0xfffff7f85e88
   0x0000fffff7f85f58:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f85f5c:	17ffffcb	b	0xfffff7f85e88
   0x0000fffff7f85f60:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f85f64:	17ffffc9	b	0xfffff7f85e88
   0x0000fffff7f85f68:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f85f6c:	17ffffc7	b	0xfffff7f85e88
   0x0000fffff7f85f70:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f85f74:	17ffffc5	b	0xfffff7f85e88
   0x0000fffff7f85f78:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f85f7c:	17ffffc3	b	0xfffff7f85e88
   0x0000fffff7f85f80:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f85f84:	17ffffc1	b	0xfffff7f85e88
   0x0000fffff7f85f88:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f85f8c:	17ffffbf	b	0xfffff7f85e88
   0x0000fffff7f85f90:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f85f94:	17ffffbd	b	0xfffff7f85e88
   0x0000fffff7f85f98:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f85f9c:	17ffffbb	b	0xfffff7f85e88
   0x0000fffff7f85fa0:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f85fa4:	17ffffb9	b	0xfffff7f85e88
   0x0000fffff7f85fa8:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f85fac:	17ffffb7	b	0xfffff7f85e88
   0x0000fffff7f85fb0:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7f85fb4:	17ffffb5	b	0xfffff7f85e88
   0x0000fffff7f85fb8:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7f85fbc:	17ffffb3	b	0xfffff7f85e88
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
