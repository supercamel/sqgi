
/tmp/sqgi-v21-native-profile/floats/638430-7.bin:     file format binary


Disassembly of section .data:

0000ffff9c676000 <.data>:
    ffff9c676000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff9c676004:	910003fd 	mov	x29, sp
    ffff9c676008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff9c67600c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff9c676010:	d13003ff 	sub	sp, sp, #0xc00
    ffff9c676014:	aa0003f3 	mov	x19, x0
    ffff9c676018:	aa0103f4 	mov	x20, x1
    ffff9c67601c:	aa0203f5 	mov	x21, x2
    ffff9c676020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c676024:	912063e1 	add	x1, sp, #0x818
    ffff9c676028:	d2856c02 	mov	x2, #0x2b60                	// #11104
    ffff9c67602c:	f2ba7742 	movk	x2, #0xd3ba, lsl #16
    ffff9c676030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c676034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff9c676038:	f2ba2290 	movk	x16, #0xd114, lsl #16
    ffff9c67603c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c676040:	d63f0200 	blr	x16
    ffff9c676044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c676048:	f90403e9 	str	x9, [sp, #2048]
    ffff9c67604c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff9c676050:	d285da0a 	mov	x10, #0x2ed0                	// #11984
    ffff9c676054:	f2ba778a 	movk	x10, #0xd3bc, lsl #16
    ffff9c676058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff9c67605c:	eb0a013f 	cmp	x9, x10
    ffff9c676060:	54001861 	b.ne	0xffff9c67636c  // b.any
    ffff9c676064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c676068:	aa1303e1 	mov	x1, x19
    ffff9c67606c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff9c676070:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c676074:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c676078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c67607c:	d63f0200 	blr	x16
    ffff9c676080:	f100001f 	cmp	x0, #0x0
    ffff9c676084:	54001740 	b.eq	0xffff9c67636c  // b.none
    ffff9c676088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c67608c:	aa1303e1 	mov	x1, x19
    ffff9c676090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff9c676094:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c676098:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c67609c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6760a0:	d63f0200 	blr	x16
    ffff9c6760a4:	f100001f 	cmp	x0, #0x0
    ffff9c6760a8:	54001620 	b.eq	0xffff9c67636c  // b.none
    ffff9c6760ac:	b9401269 	ldr	w9, [x19, #16]
    ffff9c6760b0:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6760b4:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6760b8:	eb0a013f 	cmp	x9, x10
    ffff9c6760bc:	54001581 	b.ne	0xffff9c67636c  // b.any
    ffff9c6760c0:	f9400e69 	ldr	x9, [x19, #24]
    ffff9c6760c4:	f90007e9 	str	x9, [sp, #8]
    ffff9c6760c8:	b9402269 	ldr	w9, [x19, #32]
    ffff9c6760cc:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6760d0:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6760d4:	eb0a013f 	cmp	x9, x10
    ffff9c6760d8:	540014a1 	b.ne	0xffff9c67636c  // b.any
    ffff9c6760dc:	fd401660 	ldr	d0, [x19, #40]
    ffff9c6760e0:	fd000be0 	str	d0, [sp, #16]
    ffff9c6760e4:	b9403269 	ldr	w9, [x19, #48]
    ffff9c6760e8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6760ec:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6760f0:	eb0a013f 	cmp	x9, x10
    ffff9c6760f4:	540013c1 	b.ne	0xffff9c67636c  // b.any
    ffff9c6760f8:	f9401e69 	ldr	x9, [x19, #56]
    ffff9c6760fc:	f9000fe9 	str	x9, [sp, #24]
    ffff9c676100:	140000a6 	b	0xffff9c676398
    ffff9c676104:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c676108:	f94007ea 	ldr	x10, [sp, #8]
    ffff9c67610c:	eb0a013f 	cmp	x9, x10
    ffff9c676110:	54000baa 	b.ge	0xffff9c676284  // b.tcont
    ffff9c676114:	d2800029 	mov	x9, #0x1                   	// #1
    ffff9c676118:	f90403e9 	str	x9, [sp, #2048]
    ffff9c67611c:	14000011 	b	0xffff9c676160
    ffff9c676120:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c676124:	d28dc602 	mov	x2, #0x6e30                	// #28208
    ffff9c676128:	f2ba7782 	movk	x2, #0xd3bc, lsl #16
    ffff9c67612c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c676130:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c676134:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c676138:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c67613c:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c676140:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c676144:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c676148:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c67614c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c676150:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c676154:	d63f0200 	blr	x16
    ffff9c676158:	f100001f 	cmp	x0, #0x0
    ffff9c67615c:	54001080 	b.eq	0xffff9c67636c  // b.none
    ffff9c676160:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c676164:	f9001be9 	str	x9, [sp, #48]
    ffff9c676168:	14000011 	b	0xffff9c6761ac
    ffff9c67616c:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c676170:	d28dc802 	mov	x2, #0x6e40                	// #28224
    ffff9c676174:	f2ba7782 	movk	x2, #0xd3bc, lsl #16
    ffff9c676178:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c67617c:	d2862403 	mov	x3, #0x3120                	// #12576
    ffff9c676180:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c676184:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c676188:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c67618c:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c676190:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c676194:	d28cac10 	mov	x16, #0x6560                	// #25952
    ffff9c676198:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c67619c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6761a0:	d63f0200 	blr	x16
    ffff9c6761a4:	f100001f 	cmp	x0, #0x0
    ffff9c6761a8:	54000e20 	b.eq	0xffff9c67636c  // b.none
    ffff9c6761ac:	d28003e9 	mov	x9, #0x1f                  	// #31
    ffff9c6761b0:	f90027e9 	str	x9, [sp, #72]
    ffff9c6761b4:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c6761b8:	d28003ea 	mov	x10, #0x1f                  	// #31
    ffff9c6761bc:	9aca0d2b 	sdiv	x11, x9, x10
    ffff9c6761c0:	9b0aa569 	msub	x9, x11, x10, x9
    ffff9c6761c4:	f90027e9 	str	x9, [sp, #72]
    ffff9c6761c8:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6761cc:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6761d0:	f9002be9 	str	x9, [sp, #80]
    ffff9c6761d4:	f94027e9 	ldr	x9, [sp, #72]
    ffff9c6761d8:	9e620120 	scvtf	d0, x9
    ffff9c6761dc:	fd402be1 	ldr	d1, [sp, #80]
    ffff9c6761e0:	1e612800 	fadd	d0, d0, d1
    ffff9c6761e4:	fd0027e0 	str	d0, [sp, #72]
    ffff9c6761e8:	fd4027e0 	ldr	d0, [sp, #72]
    ffff9c6761ec:	fd0407e0 	str	d0, [sp, #2056]
    ffff9c6761f0:	fd4407e0 	ldr	d0, [sp, #2056]
    ffff9c6761f4:	d295ce10 	mov	x16, #0xae70                	// #44656
    ffff9c6761f8:	f2ba2270 	movk	x16, #0xd113, lsl #16
    ffff9c6761fc:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c676200:	d63f0200 	blr	x16
    ffff9c676204:	fd001fe0 	str	d0, [sp, #56]
    ffff9c676208:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c67620c:	f2e7fd89 	movk	x9, #0x3fec, lsl #48
    ffff9c676210:	f90023e9 	str	x9, [sp, #64]
    ffff9c676214:	fd401be0 	ldr	d0, [sp, #48]
    ffff9c676218:	fd4023e1 	ldr	d1, [sp, #64]
    ffff9c67621c:	1e610800 	fmul	d0, d0, d1
    ffff9c676220:	fd002fe0 	str	d0, [sp, #88]
    ffff9c676224:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c676228:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c67622c:	f90033e9 	str	x9, [sp, #96]
    ffff9c676230:	fd4033e0 	ldr	d0, [sp, #96]
    ffff9c676234:	fd4023e1 	ldr	d1, [sp, #64]
    ffff9c676238:	1e613800 	fsub	d0, d0, d1
    ffff9c67623c:	fd0033e0 	str	d0, [sp, #96]
    ffff9c676240:	fd401fe0 	ldr	d0, [sp, #56]
    ffff9c676244:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c676248:	1e610800 	fmul	d0, d0, d1
    ffff9c67624c:	fd0033e0 	str	d0, [sp, #96]
    ffff9c676250:	fd402fe0 	ldr	d0, [sp, #88]
    ffff9c676254:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c676258:	1e612800 	fadd	d0, d0, d1
    ffff9c67625c:	fd002fe0 	str	d0, [sp, #88]
    ffff9c676260:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c676264:	f90013e9 	str	x9, [sp, #32]
    ffff9c676268:	f94013e9 	ldr	x9, [sp, #32]
    ffff9c67626c:	f9000be9 	str	x9, [sp, #16]
    ffff9c676270:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c676274:	f90013e9 	str	x9, [sp, #32]
    ffff9c676278:	91000529 	add	x9, x9, #0x1
    ffff9c67627c:	f9000fe9 	str	x9, [sp, #24]
    ffff9c676280:	17ffffa1 	b	0xffff9c676104
    ffff9c676284:	f94403e9 	ldr	x9, [sp, #2048]
    ffff9c676288:	f100013f 	cmp	x9, #0x0
    ffff9c67628c:	54000560 	b.eq	0xffff9c676338  // b.none
    ffff9c676290:	aa1303e0 	mov	x0, x19
    ffff9c676294:	d2800041 	mov	x1, #0x2                   	// #2
    ffff9c676298:	910043e2 	add	x2, sp, #0x10
    ffff9c67629c:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6762a0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6762a4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6762a8:	d63f0200 	blr	x16
    ffff9c6762ac:	aa1303e0 	mov	x0, x19
    ffff9c6762b0:	d2800061 	mov	x1, #0x3                   	// #3
    ffff9c6762b4:	f9400fe2 	ldr	x2, [sp, #24]
    ffff9c6762b8:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6762bc:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6762c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6762c4:	d63f0200 	blr	x16
    ffff9c6762c8:	aa1303e0 	mov	x0, x19
    ffff9c6762cc:	d2800081 	mov	x1, #0x4                   	// #4
    ffff9c6762d0:	f94013e2 	ldr	x2, [sp, #32]
    ffff9c6762d4:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6762d8:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6762dc:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6762e0:	d63f0200 	blr	x16
    ffff9c6762e4:	aa1303e0 	mov	x0, x19
    ffff9c6762e8:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff9c6762ec:	9100c3e2 	add	x2, sp, #0x30
    ffff9c6762f0:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6762f4:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6762f8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6762fc:	d63f0200 	blr	x16
    ffff9c676300:	aa1303e0 	mov	x0, x19
    ffff9c676304:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff9c676308:	9100e3e2 	add	x2, sp, #0x38
    ffff9c67630c:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c676310:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c676314:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c676318:	d63f0200 	blr	x16
    ffff9c67631c:	aa1303e0 	mov	x0, x19
    ffff9c676320:	d2800121 	mov	x1, #0x9                   	// #9
    ffff9c676324:	910123e2 	add	x2, sp, #0x48
    ffff9c676328:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c67632c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c676330:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c676334:	d63f0200 	blr	x16
    ffff9c676338:	d2800209 	mov	x9, #0x10                  	// #16
    ffff9c67633c:	f9000289 	str	x9, [x20]
    ffff9c676340:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c676344:	d2827e10 	mov	x16, #0x13f0                	// #5104
    ffff9c676348:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c67634c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c676350:	d63f0200 	blr	x16
    ffff9c676354:	913003ff 	add	sp, sp, #0xc00
    ffff9c676358:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c67635c:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c676360:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c676364:	d2800020 	mov	x0, #0x1                   	// #1
    ffff9c676368:	d65f03c0 	ret
    ffff9c67636c:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c676370:	d2828010 	mov	x16, #0x1400                	// #5120
    ffff9c676374:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c676378:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c67637c:	d63f0200 	blr	x16
    ffff9c676380:	913003ff 	add	sp, sp, #0xc00
    ffff9c676384:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c676388:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c67638c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c676390:	d2800000 	mov	x0, #0x0                   	// #0
    ffff9c676394:	d65f03c0 	ret
    ffff9c676398:	aa1303e0 	mov	x0, x19
    ffff9c67639c:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6763a0:	d28dc602 	mov	x2, #0x6e30                	// #28208
    ffff9c6763a4:	f2ba7782 	movk	x2, #0xd3bc, lsl #16
    ffff9c6763a8:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6763ac:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6763b0:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6763b4:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6763b8:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6763bc:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6763c0:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6763c4:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6763c8:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6763cc:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6763d0:	d63f0200 	blr	x16
    ffff9c6763d4:	f100001f 	cmp	x0, #0x0
    ffff9c6763d8:	54fffca0 	b.eq	0xffff9c67636c  // b.none
    ffff9c6763dc:	aa1303e0 	mov	x0, x19
    ffff9c6763e0:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6763e4:	d28dc802 	mov	x2, #0x6e40                	// #28224
    ffff9c6763e8:	f2ba7782 	movk	x2, #0xd3bc, lsl #16
    ffff9c6763ec:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6763f0:	d2862403 	mov	x3, #0x3120                	// #12576
    ffff9c6763f4:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6763f8:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6763fc:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c676400:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c676404:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c676408:	d28cac10 	mov	x16, #0x6560                	// #25952
    ffff9c67640c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c676410:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c676414:	d63f0200 	blr	x16
    ffff9c676418:	f100001f 	cmp	x0, #0x0
    ffff9c67641c:	54fffa80 	b.eq	0xffff9c67636c  // b.none
    ffff9c676420:	17ffff39 	b	0xffff9c676104
