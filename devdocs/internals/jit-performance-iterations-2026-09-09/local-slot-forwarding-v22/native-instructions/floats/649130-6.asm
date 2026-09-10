
/tmp/sqgi-v22-native-profile/floats/649130-6.bin:     file format binary


Disassembly of section .data:

0000ffff8eeb7000 <.data>:
    ffff8eeb7000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff8eeb7004:	910003fd 	mov	x29, sp
    ffff8eeb7008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff8eeb700c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff8eeb7010:	d13003ff 	sub	sp, sp, #0xc00
    ffff8eeb7014:	aa0003f3 	mov	x19, x0
    ffff8eeb7018:	aa0103f4 	mov	x20, x1
    ffff8eeb701c:	aa0203f5 	mov	x21, x2
    ffff8eeb7020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb7024:	912063e1 	add	x1, sp, #0x818
    ffff8eeb7028:	d28b6c02 	mov	x2, #0x5b60                	// #23392
    ffff8eeb702c:	f2bbbc22 	movk	x2, #0xdde1, lsl #16
    ffff8eeb7030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb7034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff8eeb7038:	f2b7a090 	movk	x16, #0xbd04, lsl #16
    ffff8eeb703c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb7040:	d63f0200 	blr	x16
    ffff8eeb7044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb7048:	f90403e9 	str	x9, [sp, #2048]
    ffff8eeb704c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff8eeb7050:	d28bda0a 	mov	x10, #0x5ed0                	// #24272
    ffff8eeb7054:	f2bbbc6a 	movk	x10, #0xdde3, lsl #16
    ffff8eeb7058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff8eeb705c:	eb0a013f 	cmp	x9, x10
    ffff8eeb7060:	54001a01 	b.ne	0xffff8eeb73a0  // b.any
    ffff8eeb7064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb7068:	aa1303e1 	mov	x1, x19
    ffff8eeb706c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff8eeb7070:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb7074:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb7078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb707c:	d63f0200 	blr	x16
    ffff8eeb7080:	f100001f 	cmp	x0, #0x0
    ffff8eeb7084:	540018e0 	b.eq	0xffff8eeb73a0  // b.none
    ffff8eeb7088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb708c:	aa1303e1 	mov	x1, x19
    ffff8eeb7090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff8eeb7094:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb7098:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb709c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb70a0:	d63f0200 	blr	x16
    ffff8eeb70a4:	f100001f 	cmp	x0, #0x0
    ffff8eeb70a8:	540017c0 	b.eq	0xffff8eeb73a0  // b.none
    ffff8eeb70ac:	b9401269 	ldr	w9, [x19, #16]
    ffff8eeb70b0:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eeb70b4:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb70b8:	eb0a013f 	cmp	x9, x10
    ffff8eeb70bc:	54001721 	b.ne	0xffff8eeb73a0  // b.any
    ffff8eeb70c0:	f9400e69 	ldr	x9, [x19, #24]
    ffff8eeb70c4:	f90007e9 	str	x9, [sp, #8]
    ffff8eeb70c8:	b9402269 	ldr	w9, [x19, #32]
    ffff8eeb70cc:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eeb70d0:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb70d4:	eb0a013f 	cmp	x9, x10
    ffff8eeb70d8:	54001641 	b.ne	0xffff8eeb73a0  // b.any
    ffff8eeb70dc:	fd401660 	ldr	d0, [x19, #40]
    ffff8eeb70e0:	fd000be0 	str	d0, [sp, #16]
    ffff8eeb70e4:	b9403269 	ldr	w9, [x19, #48]
    ffff8eeb70e8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eeb70ec:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb70f0:	eb0a013f 	cmp	x9, x10
    ffff8eeb70f4:	54001561 	b.ne	0xffff8eeb73a0  // b.any
    ffff8eeb70f8:	f9401e69 	ldr	x9, [x19, #56]
    ffff8eeb70fc:	f9000fe9 	str	x9, [sp, #24]
    ffff8eeb7100:	140000b3 	b	0xffff8eeb73cc
    ffff8eeb7104:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eeb7108:	f94007ea 	ldr	x10, [sp, #8]
    ffff8eeb710c:	eb0a013f 	cmp	x9, x10
    ffff8eeb7110:	54000d4a 	b.ge	0xffff8eeb72b8  // b.tcont
    ffff8eeb7114:	d2800029 	mov	x9, #0x1                   	// #1
    ffff8eeb7118:	f90403e9 	str	x9, [sp, #2048]
    ffff8eeb711c:	14000011 	b	0xffff8eeb7160
    ffff8eeb7120:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb7124:	d296d102 	mov	x2, #0xb688                	// #46728
    ffff8eeb7128:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eeb712c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb7130:	d2887e03 	mov	x3, #0x43f0                	// #17392
    ffff8eeb7134:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb7138:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb713c:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb7140:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb7144:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb7148:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb714c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb7150:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb7154:	d63f0200 	blr	x16
    ffff8eeb7158:	f100001f 	cmp	x0, #0x0
    ffff8eeb715c:	54001220 	b.eq	0xffff8eeb73a0  // b.none
    ffff8eeb7160:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eeb7164:	fd001be0 	str	d0, [sp, #48]
    ffff8eeb7168:	d2800229 	mov	x9, #0x11                  	// #17
    ffff8eeb716c:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eeb7170:	d280022a 	mov	x10, #0x11                  	// #17
    ffff8eeb7174:	9aca0d2b 	sdiv	x11, x9, x10
    ffff8eeb7178:	9b0aa569 	msub	x9, x11, x10, x9
    ffff8eeb717c:	9e670130 	fmov	d16, x9
    ffff8eeb7180:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb7184:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff8eeb7188:	9e670131 	fmov	d17, x9
    ffff8eeb718c:	9e660209 	fmov	x9, d16
    ffff8eeb7190:	9e620120 	scvtf	d0, x9
    ffff8eeb7194:	1e604221 	fmov	d1, d17
    ffff8eeb7198:	1e610800 	fmul	d0, d0, d1
    ffff8eeb719c:	fd001fe0 	str	d0, [sp, #56]
    ffff8eeb71a0:	d2800069 	mov	x9, #0x3                   	// #3
    ffff8eeb71a4:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eeb71a8:	d280006a 	mov	x10, #0x3                   	// #3
    ffff8eeb71ac:	9aca0d2b 	sdiv	x11, x9, x10
    ffff8eeb71b0:	9b0aa569 	msub	x9, x11, x10, x9
    ffff8eeb71b4:	9e670130 	fmov	d16, x9
    ffff8eeb71b8:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb71bc:	9e670131 	fmov	d17, x9
    ffff8eeb71c0:	9e660209 	fmov	x9, d16
    ffff8eeb71c4:	9e66022a 	fmov	x10, d17
    ffff8eeb71c8:	eb0a013f 	cmp	x9, x10
    ffff8eeb71cc:	fd0023f0 	str	d16, [sp, #64]
    ffff8eeb71d0:	fd0027f1 	str	d17, [sp, #72]
    ffff8eeb71d4:	9a9f17e9 	cset	x9, eq	// eq = none
    ffff8eeb71d8:	9e670130 	fmov	d16, x9
    ffff8eeb71dc:	fd401be0 	ldr	d0, [sp, #48]
    ffff8eeb71e0:	fd002fe0 	str	d0, [sp, #88]
    ffff8eeb71e4:	fd401fe0 	ldr	d0, [sp, #56]
    ffff8eeb71e8:	fd0033e0 	str	d0, [sp, #96]
    ffff8eeb71ec:	9e660209 	fmov	x9, d16
    ffff8eeb71f0:	9e670131 	fmov	d17, x9
    ffff8eeb71f4:	9e660229 	fmov	x9, d17
    ffff8eeb71f8:	f100013f 	cmp	x9, #0x0
    ffff8eeb71fc:	fd0023f0 	str	d16, [sp, #64]
    ffff8eeb7200:	fd0037f1 	str	d17, [sp, #104]
    ffff8eeb7204:	54000300 	b.eq	0xffff8eeb7264  // b.none
    ffff8eeb7208:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb720c:	f2e7fd09 	movk	x9, #0x3fe8, lsl #48
    ffff8eeb7210:	9e670130 	fmov	d16, x9
    ffff8eeb7214:	fd402fe0 	ldr	d0, [sp, #88]
    ffff8eeb7218:	1e604201 	fmov	d1, d16
    ffff8eeb721c:	1e610800 	fmul	d0, d0, d1
    ffff8eeb7220:	1e604010 	fmov	d16, d0
    ffff8eeb7224:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb7228:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff8eeb722c:	9e670131 	fmov	d17, x9
    ffff8eeb7230:	fd4033e0 	ldr	d0, [sp, #96]
    ffff8eeb7234:	1e604221 	fmov	d1, d17
    ffff8eeb7238:	1e610800 	fmul	d0, d0, d1
    ffff8eeb723c:	1e604011 	fmov	d17, d0
    ffff8eeb7240:	1e604200 	fmov	d0, d16
    ffff8eeb7244:	1e604221 	fmov	d1, d17
    ffff8eeb7248:	1e613800 	fsub	d0, d0, d1
    ffff8eeb724c:	1e604010 	fmov	d16, d0
    ffff8eeb7250:	1e604200 	fmov	d0, d16
    ffff8eeb7254:	fd0013e0 	str	d0, [sp, #32]
    ffff8eeb7258:	fd003bf0 	str	d16, [sp, #112]
    ffff8eeb725c:	fd003ff1 	str	d17, [sp, #120]
    ffff8eeb7260:	1400000f 	b	0xffff8eeb729c
    ffff8eeb7264:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb7268:	f2e7fa09 	movk	x9, #0x3fd0, lsl #48
    ffff8eeb726c:	9e670130 	fmov	d16, x9
    ffff8eeb7270:	fd402fe0 	ldr	d0, [sp, #88]
    ffff8eeb7274:	1e604201 	fmov	d1, d16
    ffff8eeb7278:	1e610800 	fmul	d0, d0, d1
    ffff8eeb727c:	1e604010 	fmov	d16, d0
    ffff8eeb7280:	fd4033e0 	ldr	d0, [sp, #96]
    ffff8eeb7284:	1e604201 	fmov	d1, d16
    ffff8eeb7288:	1e612800 	fadd	d0, d0, d1
    ffff8eeb728c:	1e604010 	fmov	d16, d0
    ffff8eeb7290:	1e604200 	fmov	d0, d16
    ffff8eeb7294:	fd0013e0 	str	d0, [sp, #32]
    ffff8eeb7298:	fd003bf0 	str	d16, [sp, #112]
    ffff8eeb729c:	fd4013e0 	ldr	d0, [sp, #32]
    ffff8eeb72a0:	fd000be0 	str	d0, [sp, #16]
    ffff8eeb72a4:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eeb72a8:	f90013e9 	str	x9, [sp, #32]
    ffff8eeb72ac:	91000529 	add	x9, x9, #0x1
    ffff8eeb72b0:	f9000fe9 	str	x9, [sp, #24]
    ffff8eeb72b4:	17ffff94 	b	0xffff8eeb7104
    ffff8eeb72b8:	f94403e9 	ldr	x9, [sp, #2048]
    ffff8eeb72bc:	f100013f 	cmp	x9, #0x0
    ffff8eeb72c0:	54000560 	b.eq	0xffff8eeb736c  // b.none
    ffff8eeb72c4:	aa1303e0 	mov	x0, x19
    ffff8eeb72c8:	d2800041 	mov	x1, #0x2                   	// #2
    ffff8eeb72cc:	910043e2 	add	x2, sp, #0x10
    ffff8eeb72d0:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb72d4:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb72d8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb72dc:	d63f0200 	blr	x16
    ffff8eeb72e0:	aa1303e0 	mov	x0, x19
    ffff8eeb72e4:	d2800061 	mov	x1, #0x3                   	// #3
    ffff8eeb72e8:	f9400fe2 	ldr	x2, [sp, #24]
    ffff8eeb72ec:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eeb72f0:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb72f4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb72f8:	d63f0200 	blr	x16
    ffff8eeb72fc:	aa1303e0 	mov	x0, x19
    ffff8eeb7300:	d2800081 	mov	x1, #0x4                   	// #4
    ffff8eeb7304:	f94013e2 	ldr	x2, [sp, #32]
    ffff8eeb7308:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eeb730c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb7310:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb7314:	d63f0200 	blr	x16
    ffff8eeb7318:	aa1303e0 	mov	x0, x19
    ffff8eeb731c:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff8eeb7320:	9100c3e2 	add	x2, sp, #0x30
    ffff8eeb7324:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb7328:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb732c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb7330:	d63f0200 	blr	x16
    ffff8eeb7334:	aa1303e0 	mov	x0, x19
    ffff8eeb7338:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff8eeb733c:	9100e3e2 	add	x2, sp, #0x38
    ffff8eeb7340:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb7344:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb7348:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb734c:	d63f0200 	blr	x16
    ffff8eeb7350:	aa1303e0 	mov	x0, x19
    ffff8eeb7354:	d2800101 	mov	x1, #0x8                   	// #8
    ffff8eeb7358:	f94023e2 	ldr	x2, [sp, #64]
    ffff8eeb735c:	d2866210 	mov	x16, #0x3310                	// #13072
    ffff8eeb7360:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb7364:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb7368:	d63f0200 	blr	x16
    ffff8eeb736c:	d2800229 	mov	x9, #0x11                  	// #17
    ffff8eeb7370:	f9000289 	str	x9, [x20]
    ffff8eeb7374:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb7378:	d2849210 	mov	x16, #0x2490                	// #9360
    ffff8eeb737c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb7380:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb7384:	d63f0200 	blr	x16
    ffff8eeb7388:	913003ff 	add	sp, sp, #0xc00
    ffff8eeb738c:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eeb7390:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eeb7394:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eeb7398:	d2800020 	mov	x0, #0x1                   	// #1
    ffff8eeb739c:	d65f03c0 	ret
    ffff8eeb73a0:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb73a4:	d2849410 	mov	x16, #0x24a0                	// #9376
    ffff8eeb73a8:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb73ac:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb73b0:	d63f0200 	blr	x16
    ffff8eeb73b4:	913003ff 	add	sp, sp, #0xc00
    ffff8eeb73b8:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eeb73bc:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eeb73c0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eeb73c4:	d2800000 	mov	x0, #0x0                   	// #0
    ffff8eeb73c8:	d65f03c0 	ret
    ffff8eeb73cc:	aa1303e0 	mov	x0, x19
    ffff8eeb73d0:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb73d4:	d296d102 	mov	x2, #0xb688                	// #46728
    ffff8eeb73d8:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eeb73dc:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb73e0:	d2887e03 	mov	x3, #0x43f0                	// #17392
    ffff8eeb73e4:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb73e8:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb73ec:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb73f0:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb73f4:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb73f8:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb73fc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb7400:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb7404:	d63f0200 	blr	x16
    ffff8eeb7408:	f100001f 	cmp	x0, #0x0
    ffff8eeb740c:	54fffca0 	b.eq	0xffff8eeb73a0  // b.none
    ffff8eeb7410:	17ffff3d 	b	0xffff8eeb7104
