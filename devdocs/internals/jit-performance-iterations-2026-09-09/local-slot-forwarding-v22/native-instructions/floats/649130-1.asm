
/tmp/sqgi-v22-native-profile/floats/649130-1.bin:     file format binary


Disassembly of section .data:

0000ffff8eebc000 <.data>:
    ffff8eebc000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff8eebc004:	910003fd 	mov	x29, sp
    ffff8eebc008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff8eebc00c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff8eebc010:	d13003ff 	sub	sp, sp, #0xc00
    ffff8eebc014:	aa0003f3 	mov	x19, x0
    ffff8eebc018:	aa0103f4 	mov	x20, x1
    ffff8eebc01c:	aa0203f5 	mov	x21, x2
    ffff8eebc020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebc024:	912063e1 	add	x1, sp, #0x818
    ffff8eebc028:	d28b6c02 	mov	x2, #0x5b60                	// #23392
    ffff8eebc02c:	f2bbbc22 	movk	x2, #0xdde1, lsl #16
    ffff8eebc030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eebc034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff8eebc038:	f2b7a090 	movk	x16, #0xbd04, lsl #16
    ffff8eebc03c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc040:	d63f0200 	blr	x16
    ffff8eebc044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebc048:	f90403e9 	str	x9, [sp, #2048]
    ffff8eebc04c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff8eebc050:	d28bda0a 	mov	x10, #0x5ed0                	// #24272
    ffff8eebc054:	f2bbbc6a 	movk	x10, #0xdde3, lsl #16
    ffff8eebc058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff8eebc05c:	eb0a013f 	cmp	x9, x10
    ffff8eebc060:	54001401 	b.ne	0xffff8eebc2e0  // b.any
    ffff8eebc064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebc068:	aa1303e1 	mov	x1, x19
    ffff8eebc06c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff8eebc070:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eebc074:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc07c:	d63f0200 	blr	x16
    ffff8eebc080:	f100001f 	cmp	x0, #0x0
    ffff8eebc084:	540012e0 	b.eq	0xffff8eebc2e0  // b.none
    ffff8eebc088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebc08c:	aa1303e1 	mov	x1, x19
    ffff8eebc090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff8eebc094:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eebc098:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc09c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc0a0:	d63f0200 	blr	x16
    ffff8eebc0a4:	f100001f 	cmp	x0, #0x0
    ffff8eebc0a8:	540011c0 	b.eq	0xffff8eebc2e0  // b.none
    ffff8eebc0ac:	b9401269 	ldr	w9, [x19, #16]
    ffff8eebc0b0:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eebc0b4:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eebc0b8:	eb0a013f 	cmp	x9, x10
    ffff8eebc0bc:	54001121 	b.ne	0xffff8eebc2e0  // b.any
    ffff8eebc0c0:	f9400e69 	ldr	x9, [x19, #24]
    ffff8eebc0c4:	f90007e9 	str	x9, [sp, #8]
    ffff8eebc0c8:	b9402269 	ldr	w9, [x19, #32]
    ffff8eebc0cc:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eebc0d0:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eebc0d4:	eb0a013f 	cmp	x9, x10
    ffff8eebc0d8:	54001041 	b.ne	0xffff8eebc2e0  // b.any
    ffff8eebc0dc:	fd401660 	ldr	d0, [x19, #40]
    ffff8eebc0e0:	fd000be0 	str	d0, [sp, #16]
    ffff8eebc0e4:	b9403269 	ldr	w9, [x19, #48]
    ffff8eebc0e8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eebc0ec:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eebc0f0:	eb0a013f 	cmp	x9, x10
    ffff8eebc0f4:	54000f61 	b.ne	0xffff8eebc2e0  // b.any
    ffff8eebc0f8:	f9401e69 	ldr	x9, [x19, #56]
    ffff8eebc0fc:	f9000fe9 	str	x9, [sp, #24]
    ffff8eebc100:	14000083 	b	0xffff8eebc30c
    ffff8eebc104:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eebc108:	f94007ea 	ldr	x10, [sp, #8]
    ffff8eebc10c:	eb0a013f 	cmp	x9, x10
    ffff8eebc110:	5400082a 	b.ge	0xffff8eebc214  // b.tcont
    ffff8eebc114:	d2800029 	mov	x9, #0x1                   	// #1
    ffff8eebc118:	f90403e9 	str	x9, [sp, #2048]
    ffff8eebc11c:	14000011 	b	0xffff8eebc160
    ffff8eebc120:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eebc124:	d28f9e02 	mov	x2, #0x7cf0                	// #31984
    ffff8eebc128:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eebc12c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eebc130:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eebc134:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eebc138:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eebc13c:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eebc140:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eebc144:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eebc148:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eebc14c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc150:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc154:	d63f0200 	blr	x16
    ffff8eebc158:	f100001f 	cmp	x0, #0x0
    ffff8eebc15c:	54000c20 	b.eq	0xffff8eebc2e0  // b.none
    ffff8eebc160:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eebc164:	1e604010 	fmov	d16, d0
    ffff8eebc168:	d28002e9 	mov	x9, #0x17                  	// #23
    ffff8eebc16c:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eebc170:	d28002ea 	mov	x10, #0x17                  	// #23
    ffff8eebc174:	9aca0d2b 	sdiv	x11, x9, x10
    ffff8eebc178:	9b0aa569 	msub	x9, x11, x10, x9
    ffff8eebc17c:	9e670131 	fmov	d17, x9
    ffff8eebc180:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebc184:	f2e7fd89 	movk	x9, #0x3fec, lsl #48
    ffff8eebc188:	9e670132 	fmov	d18, x9
    ffff8eebc18c:	1e604200 	fmov	d0, d16
    ffff8eebc190:	1e604241 	fmov	d1, d18
    ffff8eebc194:	1e610800 	fmul	d0, d0, d1
    ffff8eebc198:	1e604013 	fmov	d19, d0
    ffff8eebc19c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebc1a0:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff8eebc1a4:	9e670134 	fmov	d20, x9
    ffff8eebc1a8:	1e604280 	fmov	d0, d20
    ffff8eebc1ac:	1e604241 	fmov	d1, d18
    ffff8eebc1b0:	1e613800 	fsub	d0, d0, d1
    ffff8eebc1b4:	1e604014 	fmov	d20, d0
    ffff8eebc1b8:	9e660229 	fmov	x9, d17
    ffff8eebc1bc:	9e620120 	scvtf	d0, x9
    ffff8eebc1c0:	1e604281 	fmov	d1, d20
    ffff8eebc1c4:	1e610800 	fmul	d0, d0, d1
    ffff8eebc1c8:	1e604014 	fmov	d20, d0
    ffff8eebc1cc:	1e604260 	fmov	d0, d19
    ffff8eebc1d0:	1e604281 	fmov	d1, d20
    ffff8eebc1d4:	1e612800 	fadd	d0, d0, d1
    ffff8eebc1d8:	1e604013 	fmov	d19, d0
    ffff8eebc1dc:	1e604260 	fmov	d0, d19
    ffff8eebc1e0:	1e604015 	fmov	d21, d0
    ffff8eebc1e4:	1e6042a0 	fmov	d0, d21
    ffff8eebc1e8:	fd000be0 	str	d0, [sp, #16]
    ffff8eebc1ec:	f9400fe9 	ldr	x9, [sp, #24]
    ffff8eebc1f0:	f90013e9 	str	x9, [sp, #32]
    ffff8eebc1f4:	91000529 	add	x9, x9, #0x1
    ffff8eebc1f8:	f9000fe9 	str	x9, [sp, #24]
    ffff8eebc1fc:	fd001bf0 	str	d16, [sp, #48]
    ffff8eebc200:	fd001ff1 	str	d17, [sp, #56]
    ffff8eebc204:	fd0023f2 	str	d18, [sp, #64]
    ffff8eebc208:	fd0027f3 	str	d19, [sp, #72]
    ffff8eebc20c:	fd002bf4 	str	d20, [sp, #80]
    ffff8eebc210:	17ffffbd 	b	0xffff8eebc104
    ffff8eebc214:	f94403e9 	ldr	x9, [sp, #2048]
    ffff8eebc218:	f100013f 	cmp	x9, #0x0
    ffff8eebc21c:	54000480 	b.eq	0xffff8eebc2ac  // b.none
    ffff8eebc220:	aa1303e0 	mov	x0, x19
    ffff8eebc224:	d2800041 	mov	x1, #0x2                   	// #2
    ffff8eebc228:	910043e2 	add	x2, sp, #0x10
    ffff8eebc22c:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eebc230:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc234:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc238:	d63f0200 	blr	x16
    ffff8eebc23c:	aa1303e0 	mov	x0, x19
    ffff8eebc240:	d2800061 	mov	x1, #0x3                   	// #3
    ffff8eebc244:	f9400fe2 	ldr	x2, [sp, #24]
    ffff8eebc248:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eebc24c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc250:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc254:	d63f0200 	blr	x16
    ffff8eebc258:	aa1303e0 	mov	x0, x19
    ffff8eebc25c:	d2800081 	mov	x1, #0x4                   	// #4
    ffff8eebc260:	f94013e2 	ldr	x2, [sp, #32]
    ffff8eebc264:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eebc268:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc26c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc270:	d63f0200 	blr	x16
    ffff8eebc274:	aa1303e0 	mov	x0, x19
    ffff8eebc278:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff8eebc27c:	9100c3e2 	add	x2, sp, #0x30
    ffff8eebc280:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eebc284:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc288:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc28c:	d63f0200 	blr	x16
    ffff8eebc290:	aa1303e0 	mov	x0, x19
    ffff8eebc294:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff8eebc298:	f9401fe2 	ldr	x2, [sp, #56]
    ffff8eebc29c:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eebc2a0:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc2a4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc2a8:	d63f0200 	blr	x16
    ffff8eebc2ac:	d2800189 	mov	x9, #0xc                   	// #12
    ffff8eebc2b0:	f9000289 	str	x9, [x20]
    ffff8eebc2b4:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebc2b8:	d2849210 	mov	x16, #0x2490                	// #9360
    ffff8eebc2bc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc2c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc2c4:	d63f0200 	blr	x16
    ffff8eebc2c8:	913003ff 	add	sp, sp, #0xc00
    ffff8eebc2cc:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eebc2d0:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eebc2d4:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eebc2d8:	d2800020 	mov	x0, #0x1                   	// #1
    ffff8eebc2dc:	d65f03c0 	ret
    ffff8eebc2e0:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebc2e4:	d2849410 	mov	x16, #0x24a0                	// #9376
    ffff8eebc2e8:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc2ec:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc2f0:	d63f0200 	blr	x16
    ffff8eebc2f4:	913003ff 	add	sp, sp, #0xc00
    ffff8eebc2f8:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eebc2fc:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eebc300:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eebc304:	d2800000 	mov	x0, #0x0                   	// #0
    ffff8eebc308:	d65f03c0 	ret
    ffff8eebc30c:	aa1303e0 	mov	x0, x19
    ffff8eebc310:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eebc314:	d28f9e02 	mov	x2, #0x7cf0                	// #31984
    ffff8eebc318:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eebc31c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eebc320:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eebc324:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eebc328:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eebc32c:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eebc330:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eebc334:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eebc338:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eebc33c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebc340:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebc344:	d63f0200 	blr	x16
    ffff8eebc348:	f100001f 	cmp	x0, #0x0
    ffff8eebc34c:	54fffca0 	b.eq	0xffff8eebc2e0  // b.none
    ffff8eebc350:	17ffff6d 	b	0xffff8eebc104
