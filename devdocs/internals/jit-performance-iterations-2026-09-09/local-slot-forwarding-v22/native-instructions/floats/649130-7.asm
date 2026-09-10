
/tmp/sqgi-v22-native-profile/floats/649130-7.bin:     file format binary


Disassembly of section .data:

0000ffff8eeb6000 <.data>:
    ffff8eeb6000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff8eeb6004:	910003fd 	mov	x29, sp
    ffff8eeb6008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff8eeb600c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff8eeb6010:	d13003ff 	sub	sp, sp, #0xc00
    ffff8eeb6014:	aa0003f3 	mov	x19, x0
    ffff8eeb6018:	aa0103f4 	mov	x20, x1
    ffff8eeb601c:	aa0203f5 	mov	x21, x2
    ffff8eeb6020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb6024:	912063e1 	add	x1, sp, #0x818
    ffff8eeb6028:	d28b6c02 	mov	x2, #0x5b60                	// #23392
    ffff8eeb602c:	f2bbbc22 	movk	x2, #0xdde1, lsl #16
    ffff8eeb6030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb6034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff8eeb6038:	f2b7a090 	movk	x16, #0xbd04, lsl #16
    ffff8eeb603c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb6040:	d63f0200 	blr	x16
    ffff8eeb6044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb6048:	f90403e9 	str	x9, [sp, #2048]
    ffff8eeb604c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff8eeb6050:	d28bda0a 	mov	x10, #0x5ed0                	// #24272
    ffff8eeb6054:	f2bbbc6a 	movk	x10, #0xdde3, lsl #16
    ffff8eeb6058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff8eeb605c:	eb0a013f 	cmp	x9, x10
    ffff8eeb6060:	54001901 	b.ne	0xffff8eeb6380  // b.any
    ffff8eeb6064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb6068:	aa1303e1 	mov	x1, x19
    ffff8eeb606c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff8eeb6070:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb6074:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb6078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb607c:	d63f0200 	blr	x16
    ffff8eeb6080:	f100001f 	cmp	x0, #0x0
    ffff8eeb6084:	540017e0 	b.eq	0xffff8eeb6380  // b.none
    ffff8eeb6088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb608c:	aa1303e1 	mov	x1, x19
    ffff8eeb6090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff8eeb6094:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb6098:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb609c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb60a0:	d63f0200 	blr	x16
    ffff8eeb60a4:	f100001f 	cmp	x0, #0x0
    ffff8eeb60a8:	540016c0 	b.eq	0xffff8eeb6380  // b.none
    ffff8eeb60ac:	b9401269 	ldr	w9, [x19, #16]
    ffff8eeb60b0:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eeb60b4:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb60b8:	eb0a013f 	cmp	x9, x10
    ffff8eeb60bc:	54001621 	b.ne	0xffff8eeb6380  // b.any
    ffff8eeb60c0:	f9400e69 	ldr	x9, [x19, #24]
    ffff8eeb60c4:	f90007e9 	str	x9, [sp, #8]
    ffff8eeb60c8:	b9402269 	ldr	w9, [x19, #32]
    ffff8eeb60cc:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eeb60d0:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb60d4:	eb0a013f 	cmp	x9, x10
    ffff8eeb60d8:	54001541 	b.ne	0xffff8eeb6380  // b.any
    ffff8eeb60dc:	fd401660 	ldr	d0, [x19, #40]
    ffff8eeb60e0:	fd000be0 	str	d0, [sp, #16]
    ffff8eeb60e4:	b9403269 	ldr	w9, [x19, #48]
    ffff8eeb60e8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eeb60ec:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb60f0:	eb0a013f 	cmp	x9, x10
    ffff8eeb60f4:	54001461 	b.ne	0xffff8eeb6380  // b.any
    ffff8eeb60f8:	f9401e69 	ldr	x9, [x19, #56]
    ffff8eeb60fc:	f9000fe9 	str	x9, [sp, #24]
    ffff8eeb6100:	140000ab 	b	0xffff8eeb63ac
    ffff8eeb6104:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eeb6108:	f94007ea 	ldr	x10, [sp, #8]
    ffff8eeb610c:	eb0a013f 	cmp	x9, x10
    ffff8eeb6110:	54000c4a 	b.ge	0xffff8eeb6298  // b.tcont
    ffff8eeb6114:	d2800029 	mov	x9, #0x1                   	// #1
    ffff8eeb6118:	f90403e9 	str	x9, [sp, #2048]
    ffff8eeb611c:	14000011 	b	0xffff8eeb6160
    ffff8eeb6120:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb6124:	d293c602 	mov	x2, #0x9e30                	// #40496
    ffff8eeb6128:	f2bbbc62 	movk	x2, #0xdde3, lsl #16
    ffff8eeb612c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb6130:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eeb6134:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb6138:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb613c:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb6140:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb6144:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb6148:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb614c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb6150:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb6154:	d63f0200 	blr	x16
    ffff8eeb6158:	f100001f 	cmp	x0, #0x0
    ffff8eeb615c:	54001120 	b.eq	0xffff8eeb6380  // b.none
    ffff8eeb6160:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eeb6164:	fd001be0 	str	d0, [sp, #48]
    ffff8eeb6168:	14000011 	b	0xffff8eeb61ac
    ffff8eeb616c:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb6170:	d293c802 	mov	x2, #0x9e40                	// #40512
    ffff8eeb6174:	f2bbbc62 	movk	x2, #0xdde3, lsl #16
    ffff8eeb6178:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb617c:	d288b803 	mov	x3, #0x45c0                	// #17856
    ffff8eeb6180:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb6184:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb6188:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb618c:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb6190:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb6194:	d28ec010 	mov	x16, #0x7600                	// #30208
    ffff8eeb6198:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb619c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb61a0:	d63f0200 	blr	x16
    ffff8eeb61a4:	f100001f 	cmp	x0, #0x0
    ffff8eeb61a8:	54000ec0 	b.eq	0xffff8eeb6380  // b.none
    ffff8eeb61ac:	d28003e9 	mov	x9, #0x1f                  	// #31
    ffff8eeb61b0:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eeb61b4:	d28003ea 	mov	x10, #0x1f                  	// #31
    ffff8eeb61b8:	9aca0d2b 	sdiv	x11, x9, x10
    ffff8eeb61bc:	9b0aa569 	msub	x9, x11, x10, x9
    ffff8eeb61c0:	9e670130 	fmov	d16, x9
    ffff8eeb61c4:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb61c8:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff8eeb61cc:	9e670131 	fmov	d17, x9
    ffff8eeb61d0:	9e660209 	fmov	x9, d16
    ffff8eeb61d4:	9e620120 	scvtf	d0, x9
    ffff8eeb61d8:	1e604221 	fmov	d1, d17
    ffff8eeb61dc:	1e612800 	fadd	d0, d0, d1
    ffff8eeb61e0:	1e604010 	fmov	d16, d0
    ffff8eeb61e4:	1e604200 	fmov	d0, d16
    ffff8eeb61e8:	fd0027f0 	str	d16, [sp, #72]
    ffff8eeb61ec:	fd002bf1 	str	d17, [sp, #80]
    ffff8eeb61f0:	fd0407e0 	str	d0, [sp, #2056]
    ffff8eeb61f4:	fd4407e0 	ldr	d0, [sp, #2056]
    ffff8eeb61f8:	d295ce10 	mov	x16, #0xae70                	// #44656
    ffff8eeb61fc:	f2b7a070 	movk	x16, #0xbd03, lsl #16
    ffff8eeb6200:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb6204:	d63f0200 	blr	x16
    ffff8eeb6208:	1e604010 	fmov	d16, d0
    ffff8eeb620c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb6210:	f2e7fd89 	movk	x9, #0x3fec, lsl #48
    ffff8eeb6214:	9e670131 	fmov	d17, x9
    ffff8eeb6218:	fd401be0 	ldr	d0, [sp, #48]
    ffff8eeb621c:	1e604221 	fmov	d1, d17
    ffff8eeb6220:	1e610800 	fmul	d0, d0, d1
    ffff8eeb6224:	1e604012 	fmov	d18, d0
    ffff8eeb6228:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb622c:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff8eeb6230:	9e670133 	fmov	d19, x9
    ffff8eeb6234:	1e604260 	fmov	d0, d19
    ffff8eeb6238:	1e604221 	fmov	d1, d17
    ffff8eeb623c:	1e613800 	fsub	d0, d0, d1
    ffff8eeb6240:	1e604013 	fmov	d19, d0
    ffff8eeb6244:	1e604200 	fmov	d0, d16
    ffff8eeb6248:	1e604261 	fmov	d1, d19
    ffff8eeb624c:	1e610800 	fmul	d0, d0, d1
    ffff8eeb6250:	1e604013 	fmov	d19, d0
    ffff8eeb6254:	1e604240 	fmov	d0, d18
    ffff8eeb6258:	1e604261 	fmov	d1, d19
    ffff8eeb625c:	1e612800 	fadd	d0, d0, d1
    ffff8eeb6260:	1e604012 	fmov	d18, d0
    ffff8eeb6264:	1e604240 	fmov	d0, d18
    ffff8eeb6268:	1e604014 	fmov	d20, d0
    ffff8eeb626c:	1e604280 	fmov	d0, d20
    ffff8eeb6270:	fd000be0 	str	d0, [sp, #16]
    ffff8eeb6274:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eeb6278:	f90013e9 	str	x9, [sp, #32]
    ffff8eeb627c:	91000529 	add	x9, x9, #0x1
    ffff8eeb6280:	f9000fe9 	str	x9, [sp, #24]
    ffff8eeb6284:	fd001ff0 	str	d16, [sp, #56]
    ffff8eeb6288:	fd0023f1 	str	d17, [sp, #64]
    ffff8eeb628c:	fd002ff2 	str	d18, [sp, #88]
    ffff8eeb6290:	fd0033f3 	str	d19, [sp, #96]
    ffff8eeb6294:	17ffff9c 	b	0xffff8eeb6104
    ffff8eeb6298:	f94403e9 	ldr	x9, [sp, #2048]
    ffff8eeb629c:	f100013f 	cmp	x9, #0x0
    ffff8eeb62a0:	54000560 	b.eq	0xffff8eeb634c  // b.none
    ffff8eeb62a4:	aa1303e0 	mov	x0, x19
    ffff8eeb62a8:	d2800041 	mov	x1, #0x2                   	// #2
    ffff8eeb62ac:	910043e2 	add	x2, sp, #0x10
    ffff8eeb62b0:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb62b4:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb62b8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb62bc:	d63f0200 	blr	x16
    ffff8eeb62c0:	aa1303e0 	mov	x0, x19
    ffff8eeb62c4:	d2800061 	mov	x1, #0x3                   	// #3
    ffff8eeb62c8:	f9400fe2 	ldr	x2, [sp, #24]
    ffff8eeb62cc:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eeb62d0:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb62d4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb62d8:	d63f0200 	blr	x16
    ffff8eeb62dc:	aa1303e0 	mov	x0, x19
    ffff8eeb62e0:	d2800081 	mov	x1, #0x4                   	// #4
    ffff8eeb62e4:	f94013e2 	ldr	x2, [sp, #32]
    ffff8eeb62e8:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eeb62ec:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb62f0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb62f4:	d63f0200 	blr	x16
    ffff8eeb62f8:	aa1303e0 	mov	x0, x19
    ffff8eeb62fc:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff8eeb6300:	9100c3e2 	add	x2, sp, #0x30
    ffff8eeb6304:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb6308:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb630c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb6310:	d63f0200 	blr	x16
    ffff8eeb6314:	aa1303e0 	mov	x0, x19
    ffff8eeb6318:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff8eeb631c:	9100e3e2 	add	x2, sp, #0x38
    ffff8eeb6320:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb6324:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb6328:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb632c:	d63f0200 	blr	x16
    ffff8eeb6330:	aa1303e0 	mov	x0, x19
    ffff8eeb6334:	d2800121 	mov	x1, #0x9                   	// #9
    ffff8eeb6338:	910123e2 	add	x2, sp, #0x48
    ffff8eeb633c:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb6340:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb6344:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb6348:	d63f0200 	blr	x16
    ffff8eeb634c:	d2800209 	mov	x9, #0x10                  	// #16
    ffff8eeb6350:	f9000289 	str	x9, [x20]
    ffff8eeb6354:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb6358:	d2849210 	mov	x16, #0x2490                	// #9360
    ffff8eeb635c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb6360:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb6364:	d63f0200 	blr	x16
    ffff8eeb6368:	913003ff 	add	sp, sp, #0xc00
    ffff8eeb636c:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eeb6370:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eeb6374:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eeb6378:	d2800020 	mov	x0, #0x1                   	// #1
    ffff8eeb637c:	d65f03c0 	ret
    ffff8eeb6380:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb6384:	d2849410 	mov	x16, #0x24a0                	// #9376
    ffff8eeb6388:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb638c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb6390:	d63f0200 	blr	x16
    ffff8eeb6394:	913003ff 	add	sp, sp, #0xc00
    ffff8eeb6398:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eeb639c:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eeb63a0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eeb63a4:	d2800000 	mov	x0, #0x0                   	// #0
    ffff8eeb63a8:	d65f03c0 	ret
    ffff8eeb63ac:	aa1303e0 	mov	x0, x19
    ffff8eeb63b0:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb63b4:	d293c602 	mov	x2, #0x9e30                	// #40496
    ffff8eeb63b8:	f2bbbc62 	movk	x2, #0xdde3, lsl #16
    ffff8eeb63bc:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb63c0:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eeb63c4:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb63c8:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb63cc:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb63d0:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb63d4:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb63d8:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb63dc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb63e0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb63e4:	d63f0200 	blr	x16
    ffff8eeb63e8:	f100001f 	cmp	x0, #0x0
    ffff8eeb63ec:	54fffca0 	b.eq	0xffff8eeb6380  // b.none
    ffff8eeb63f0:	aa1303e0 	mov	x0, x19
    ffff8eeb63f4:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb63f8:	d293c802 	mov	x2, #0x9e40                	// #40512
    ffff8eeb63fc:	f2bbbc62 	movk	x2, #0xdde3, lsl #16
    ffff8eeb6400:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb6404:	d288b803 	mov	x3, #0x45c0                	// #17856
    ffff8eeb6408:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb640c:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb6410:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb6414:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb6418:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb641c:	d28ec010 	mov	x16, #0x7600                	// #30208
    ffff8eeb6420:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb6424:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb6428:	d63f0200 	blr	x16
    ffff8eeb642c:	f100001f 	cmp	x0, #0x0
    ffff8eeb6430:	54fffa80 	b.eq	0xffff8eeb6380  // b.none
    ffff8eeb6434:	17ffff34 	b	0xffff8eeb6104
