
/tmp/sqgi-v22-native-profile/floats/649130-2.bin:     file format binary


Disassembly of section .data:

0000ffff8eebb000 <.data>:
    ffff8eebb000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff8eebb004:	910003fd 	mov	x29, sp
    ffff8eebb008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff8eebb00c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff8eebb010:	d13003ff 	sub	sp, sp, #0xc00
    ffff8eebb014:	aa0003f3 	mov	x19, x0
    ffff8eebb018:	aa0103f4 	mov	x20, x1
    ffff8eebb01c:	aa0203f5 	mov	x21, x2
    ffff8eebb020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebb024:	912063e1 	add	x1, sp, #0x818
    ffff8eebb028:	d28b6c02 	mov	x2, #0x5b60                	// #23392
    ffff8eebb02c:	f2bbbc22 	movk	x2, #0xdde1, lsl #16
    ffff8eebb030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eebb034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff8eebb038:	f2b7a090 	movk	x16, #0xbd04, lsl #16
    ffff8eebb03c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb040:	d63f0200 	blr	x16
    ffff8eebb044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebb048:	f90403e9 	str	x9, [sp, #2048]
    ffff8eebb04c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff8eebb050:	d28bda0a 	mov	x10, #0x5ed0                	// #24272
    ffff8eebb054:	f2bbbc6a 	movk	x10, #0xdde3, lsl #16
    ffff8eebb058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff8eebb05c:	eb0a013f 	cmp	x9, x10
    ffff8eebb060:	54003221 	b.ne	0xffff8eebb6a4  // b.any
    ffff8eebb064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebb068:	aa1303e1 	mov	x1, x19
    ffff8eebb06c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff8eebb070:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eebb074:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb07c:	d63f0200 	blr	x16
    ffff8eebb080:	f100001f 	cmp	x0, #0x0
    ffff8eebb084:	54003100 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebb08c:	aa1303e1 	mov	x1, x19
    ffff8eebb090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff8eebb094:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eebb098:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb09c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb0a0:	d63f0200 	blr	x16
    ffff8eebb0a4:	f100001f 	cmp	x0, #0x0
    ffff8eebb0a8:	54002fe0 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb0ac:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebb0b0:	aa1303e1 	mov	x1, x19
    ffff8eebb0b4:	d2800082 	mov	x2, #0x4                   	// #4
    ffff8eebb0b8:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eebb0bc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb0c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb0c4:	d63f0200 	blr	x16
    ffff8eebb0c8:	f100001f 	cmp	x0, #0x0
    ffff8eebb0cc:	54002ec0 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb0d0:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebb0d4:	aa1303e1 	mov	x1, x19
    ffff8eebb0d8:	d28000a2 	mov	x2, #0x5                   	// #5
    ffff8eebb0dc:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eebb0e0:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb0e4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb0e8:	d63f0200 	blr	x16
    ffff8eebb0ec:	f100001f 	cmp	x0, #0x0
    ffff8eebb0f0:	54002da0 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb0f4:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebb0f8:	aa1303e1 	mov	x1, x19
    ffff8eebb0fc:	d28000c2 	mov	x2, #0x6                   	// #6
    ffff8eebb100:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eebb104:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb108:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb10c:	d63f0200 	blr	x16
    ffff8eebb110:	f100001f 	cmp	x0, #0x0
    ffff8eebb114:	54002c80 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb118:	b9401269 	ldr	w9, [x19, #16]
    ffff8eebb11c:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eebb120:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eebb124:	eb0a013f 	cmp	x9, x10
    ffff8eebb128:	54002be1 	b.ne	0xffff8eebb6a4  // b.any
    ffff8eebb12c:	f9400e69 	ldr	x9, [x19, #24]
    ffff8eebb130:	f90007e9 	str	x9, [sp, #8]
    ffff8eebb134:	b9402269 	ldr	w9, [x19, #32]
    ffff8eebb138:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eebb13c:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eebb140:	eb0a013f 	cmp	x9, x10
    ffff8eebb144:	54002b01 	b.ne	0xffff8eebb6a4  // b.any
    ffff8eebb148:	fd401660 	ldr	d0, [x19, #40]
    ffff8eebb14c:	fd000be0 	str	d0, [sp, #16]
    ffff8eebb150:	b9403269 	ldr	w9, [x19, #48]
    ffff8eebb154:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eebb158:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eebb15c:	eb0a013f 	cmp	x9, x10
    ffff8eebb160:	54002a21 	b.ne	0xffff8eebb6a4  // b.any
    ffff8eebb164:	fd401e60 	ldr	d0, [x19, #56]
    ffff8eebb168:	fd000fe0 	str	d0, [sp, #24]
    ffff8eebb16c:	b9404269 	ldr	w9, [x19, #64]
    ffff8eebb170:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eebb174:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eebb178:	eb0a013f 	cmp	x9, x10
    ffff8eebb17c:	54002941 	b.ne	0xffff8eebb6a4  // b.any
    ffff8eebb180:	fd402660 	ldr	d0, [x19, #72]
    ffff8eebb184:	fd0013e0 	str	d0, [sp, #32]
    ffff8eebb188:	b9405269 	ldr	w9, [x19, #80]
    ffff8eebb18c:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eebb190:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eebb194:	eb0a013f 	cmp	x9, x10
    ffff8eebb198:	54002861 	b.ne	0xffff8eebb6a4  // b.any
    ffff8eebb19c:	fd402e60 	ldr	d0, [x19, #88]
    ffff8eebb1a0:	fd0017e0 	str	d0, [sp, #40]
    ffff8eebb1a4:	b9406269 	ldr	w9, [x19, #96]
    ffff8eebb1a8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eebb1ac:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eebb1b0:	eb0a013f 	cmp	x9, x10
    ffff8eebb1b4:	54002781 	b.ne	0xffff8eebb6a4  // b.any
    ffff8eebb1b8:	f9403669 	ldr	x9, [x19, #104]
    ffff8eebb1bc:	f9001be9 	str	x9, [sp, #48]
    ffff8eebb1c0:	14000144 	b	0xffff8eebb6d0
    ffff8eebb1c4:	f9401be9 	ldr	x9, [sp, #48]
    ffff8eebb1c8:	f94007ea 	ldr	x10, [sp, #8]
    ffff8eebb1cc:	eb0a013f 	cmp	x9, x10
    ffff8eebb1d0:	54001cca 	b.ge	0xffff8eebb568  // b.tcont
    ffff8eebb1d4:	d2800029 	mov	x9, #0x1                   	// #1
    ffff8eebb1d8:	f90403e9 	str	x9, [sp, #2048]
    ffff8eebb1dc:	d28002e9 	mov	x9, #0x17                  	// #23
    ffff8eebb1e0:	f9401be9 	ldr	x9, [sp, #48]
    ffff8eebb1e4:	d28002ea 	mov	x10, #0x17                  	// #23
    ffff8eebb1e8:	9aca0d2b 	sdiv	x11, x9, x10
    ffff8eebb1ec:	9b0aa569 	msub	x9, x11, x10, x9
    ffff8eebb1f0:	f9001fe9 	str	x9, [sp, #56]
    ffff8eebb1f4:	14000011 	b	0xffff8eebb238
    ffff8eebb1f8:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eebb1fc:	d2910702 	mov	x2, #0x8838                	// #34872
    ffff8eebb200:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eebb204:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eebb208:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eebb20c:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eebb210:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eebb214:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eebb218:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eebb21c:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eebb220:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eebb224:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb228:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb22c:	d63f0200 	blr	x16
    ffff8eebb230:	f100001f 	cmp	x0, #0x0
    ffff8eebb234:	54002380 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb238:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eebb23c:	1e604010 	fmov	d16, d0
    ffff8eebb240:	f9401fe9 	ldr	x9, [sp, #56]
    ffff8eebb244:	9e670131 	fmov	d17, x9
    ffff8eebb248:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebb24c:	f2e7fd89 	movk	x9, #0x3fec, lsl #48
    ffff8eebb250:	9e670132 	fmov	d18, x9
    ffff8eebb254:	1e604200 	fmov	d0, d16
    ffff8eebb258:	1e604241 	fmov	d1, d18
    ffff8eebb25c:	1e610800 	fmul	d0, d0, d1
    ffff8eebb260:	1e604013 	fmov	d19, d0
    ffff8eebb264:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebb268:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff8eebb26c:	9e670134 	fmov	d20, x9
    ffff8eebb270:	1e604280 	fmov	d0, d20
    ffff8eebb274:	1e604241 	fmov	d1, d18
    ffff8eebb278:	1e613800 	fsub	d0, d0, d1
    ffff8eebb27c:	1e604014 	fmov	d20, d0
    ffff8eebb280:	9e660229 	fmov	x9, d17
    ffff8eebb284:	9e620120 	scvtf	d0, x9
    ffff8eebb288:	1e604281 	fmov	d1, d20
    ffff8eebb28c:	1e610800 	fmul	d0, d0, d1
    ffff8eebb290:	1e604014 	fmov	d20, d0
    ffff8eebb294:	1e604260 	fmov	d0, d19
    ffff8eebb298:	1e604281 	fmov	d1, d20
    ffff8eebb29c:	1e612800 	fadd	d0, d0, d1
    ffff8eebb2a0:	1e604013 	fmov	d19, d0
    ffff8eebb2a4:	1e604260 	fmov	d0, d19
    ffff8eebb2a8:	1e604015 	fmov	d21, d0
    ffff8eebb2ac:	1e6042a0 	fmov	d0, d21
    ffff8eebb2b0:	fd000be0 	str	d0, [sp, #16]
    ffff8eebb2b4:	fd002bf0 	str	d16, [sp, #80]
    ffff8eebb2b8:	fd002ff1 	str	d17, [sp, #88]
    ffff8eebb2bc:	fd0033f2 	str	d18, [sp, #96]
    ffff8eebb2c0:	fd0037f3 	str	d19, [sp, #104]
    ffff8eebb2c4:	fd003bf4 	str	d20, [sp, #112]
    ffff8eebb2c8:	fd0023f5 	str	d21, [sp, #64]
    ffff8eebb2cc:	14000011 	b	0xffff8eebb310
    ffff8eebb2d0:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eebb2d4:	d2910702 	mov	x2, #0x8838                	// #34872
    ffff8eebb2d8:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eebb2dc:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eebb2e0:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eebb2e4:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eebb2e8:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eebb2ec:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eebb2f0:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eebb2f4:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eebb2f8:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eebb2fc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb300:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb304:	d63f0200 	blr	x16
    ffff8eebb308:	f100001f 	cmp	x0, #0x0
    ffff8eebb30c:	54001cc0 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb310:	fd400fe0 	ldr	d0, [sp, #24]
    ffff8eebb314:	1e604010 	fmov	d16, d0
    ffff8eebb318:	f9401fe9 	ldr	x9, [sp, #56]
    ffff8eebb31c:	9e670131 	fmov	d17, x9
    ffff8eebb320:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebb324:	f2e7fd09 	movk	x9, #0x3fe8, lsl #48
    ffff8eebb328:	9e670132 	fmov	d18, x9
    ffff8eebb32c:	1e604200 	fmov	d0, d16
    ffff8eebb330:	1e604241 	fmov	d1, d18
    ffff8eebb334:	1e610800 	fmul	d0, d0, d1
    ffff8eebb338:	1e604013 	fmov	d19, d0
    ffff8eebb33c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebb340:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff8eebb344:	9e670134 	fmov	d20, x9
    ffff8eebb348:	1e604280 	fmov	d0, d20
    ffff8eebb34c:	1e604241 	fmov	d1, d18
    ffff8eebb350:	1e613800 	fsub	d0, d0, d1
    ffff8eebb354:	1e604014 	fmov	d20, d0
    ffff8eebb358:	9e660229 	fmov	x9, d17
    ffff8eebb35c:	9e620120 	scvtf	d0, x9
    ffff8eebb360:	1e604281 	fmov	d1, d20
    ffff8eebb364:	1e610800 	fmul	d0, d0, d1
    ffff8eebb368:	1e604014 	fmov	d20, d0
    ffff8eebb36c:	1e604260 	fmov	d0, d19
    ffff8eebb370:	1e604281 	fmov	d1, d20
    ffff8eebb374:	1e612800 	fadd	d0, d0, d1
    ffff8eebb378:	1e604013 	fmov	d19, d0
    ffff8eebb37c:	1e604260 	fmov	d0, d19
    ffff8eebb380:	1e604015 	fmov	d21, d0
    ffff8eebb384:	1e6042a0 	fmov	d0, d21
    ffff8eebb388:	fd000fe0 	str	d0, [sp, #24]
    ffff8eebb38c:	fd002bf0 	str	d16, [sp, #80]
    ffff8eebb390:	fd002ff1 	str	d17, [sp, #88]
    ffff8eebb394:	fd0033f2 	str	d18, [sp, #96]
    ffff8eebb398:	fd0037f3 	str	d19, [sp, #104]
    ffff8eebb39c:	fd003bf4 	str	d20, [sp, #112]
    ffff8eebb3a0:	fd0023f5 	str	d21, [sp, #64]
    ffff8eebb3a4:	14000011 	b	0xffff8eebb3e8
    ffff8eebb3a8:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eebb3ac:	d2910702 	mov	x2, #0x8838                	// #34872
    ffff8eebb3b0:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eebb3b4:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eebb3b8:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eebb3bc:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eebb3c0:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eebb3c4:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eebb3c8:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eebb3cc:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eebb3d0:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eebb3d4:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb3d8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb3dc:	d63f0200 	blr	x16
    ffff8eebb3e0:	f100001f 	cmp	x0, #0x0
    ffff8eebb3e4:	54001600 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb3e8:	fd4013e0 	ldr	d0, [sp, #32]
    ffff8eebb3ec:	1e604010 	fmov	d16, d0
    ffff8eebb3f0:	f9401fe9 	ldr	x9, [sp, #56]
    ffff8eebb3f4:	9e670131 	fmov	d17, x9
    ffff8eebb3f8:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebb3fc:	f2e7fc89 	movk	x9, #0x3fe4, lsl #48
    ffff8eebb400:	9e670132 	fmov	d18, x9
    ffff8eebb404:	1e604200 	fmov	d0, d16
    ffff8eebb408:	1e604241 	fmov	d1, d18
    ffff8eebb40c:	1e610800 	fmul	d0, d0, d1
    ffff8eebb410:	1e604013 	fmov	d19, d0
    ffff8eebb414:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebb418:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff8eebb41c:	9e670134 	fmov	d20, x9
    ffff8eebb420:	1e604280 	fmov	d0, d20
    ffff8eebb424:	1e604241 	fmov	d1, d18
    ffff8eebb428:	1e613800 	fsub	d0, d0, d1
    ffff8eebb42c:	1e604014 	fmov	d20, d0
    ffff8eebb430:	9e660229 	fmov	x9, d17
    ffff8eebb434:	9e620120 	scvtf	d0, x9
    ffff8eebb438:	1e604281 	fmov	d1, d20
    ffff8eebb43c:	1e610800 	fmul	d0, d0, d1
    ffff8eebb440:	1e604014 	fmov	d20, d0
    ffff8eebb444:	1e604260 	fmov	d0, d19
    ffff8eebb448:	1e604281 	fmov	d1, d20
    ffff8eebb44c:	1e612800 	fadd	d0, d0, d1
    ffff8eebb450:	1e604013 	fmov	d19, d0
    ffff8eebb454:	1e604260 	fmov	d0, d19
    ffff8eebb458:	1e604015 	fmov	d21, d0
    ffff8eebb45c:	1e6042a0 	fmov	d0, d21
    ffff8eebb460:	fd0013e0 	str	d0, [sp, #32]
    ffff8eebb464:	fd002bf0 	str	d16, [sp, #80]
    ffff8eebb468:	fd002ff1 	str	d17, [sp, #88]
    ffff8eebb46c:	fd0033f2 	str	d18, [sp, #96]
    ffff8eebb470:	fd0037f3 	str	d19, [sp, #104]
    ffff8eebb474:	fd003bf4 	str	d20, [sp, #112]
    ffff8eebb478:	fd0023f5 	str	d21, [sp, #64]
    ffff8eebb47c:	14000011 	b	0xffff8eebb4c0
    ffff8eebb480:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eebb484:	d2910702 	mov	x2, #0x8838                	// #34872
    ffff8eebb488:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eebb48c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eebb490:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eebb494:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eebb498:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eebb49c:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eebb4a0:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eebb4a4:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eebb4a8:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eebb4ac:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb4b0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb4b4:	d63f0200 	blr	x16
    ffff8eebb4b8:	f100001f 	cmp	x0, #0x0
    ffff8eebb4bc:	54000f40 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb4c0:	fd4017e0 	ldr	d0, [sp, #40]
    ffff8eebb4c4:	1e604010 	fmov	d16, d0
    ffff8eebb4c8:	f9401fe9 	ldr	x9, [sp, #56]
    ffff8eebb4cc:	9e670131 	fmov	d17, x9
    ffff8eebb4d0:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebb4d4:	f2e7fc09 	movk	x9, #0x3fe0, lsl #48
    ffff8eebb4d8:	9e670132 	fmov	d18, x9
    ffff8eebb4dc:	1e604200 	fmov	d0, d16
    ffff8eebb4e0:	1e604241 	fmov	d1, d18
    ffff8eebb4e4:	1e610800 	fmul	d0, d0, d1
    ffff8eebb4e8:	1e604013 	fmov	d19, d0
    ffff8eebb4ec:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eebb4f0:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff8eebb4f4:	9e670134 	fmov	d20, x9
    ffff8eebb4f8:	1e604280 	fmov	d0, d20
    ffff8eebb4fc:	1e604241 	fmov	d1, d18
    ffff8eebb500:	1e613800 	fsub	d0, d0, d1
    ffff8eebb504:	1e604014 	fmov	d20, d0
    ffff8eebb508:	9e660229 	fmov	x9, d17
    ffff8eebb50c:	9e620120 	scvtf	d0, x9
    ffff8eebb510:	1e604281 	fmov	d1, d20
    ffff8eebb514:	1e610800 	fmul	d0, d0, d1
    ffff8eebb518:	1e604014 	fmov	d20, d0
    ffff8eebb51c:	1e604260 	fmov	d0, d19
    ffff8eebb520:	1e604281 	fmov	d1, d20
    ffff8eebb524:	1e612800 	fadd	d0, d0, d1
    ffff8eebb528:	1e604013 	fmov	d19, d0
    ffff8eebb52c:	1e604260 	fmov	d0, d19
    ffff8eebb530:	1e604015 	fmov	d21, d0
    ffff8eebb534:	1e6042a0 	fmov	d0, d21
    ffff8eebb538:	fd0017e0 	str	d0, [sp, #40]
    ffff8eebb53c:	f9401be9 	ldr	x9, [sp, #48]
    ffff8eebb540:	f9001fe9 	str	x9, [sp, #56]
    ffff8eebb544:	91000529 	add	x9, x9, #0x1
    ffff8eebb548:	f9001be9 	str	x9, [sp, #48]
    ffff8eebb54c:	fd002bf0 	str	d16, [sp, #80]
    ffff8eebb550:	fd002ff1 	str	d17, [sp, #88]
    ffff8eebb554:	fd0033f2 	str	d18, [sp, #96]
    ffff8eebb558:	fd0037f3 	str	d19, [sp, #104]
    ffff8eebb55c:	fd003bf4 	str	d20, [sp, #112]
    ffff8eebb560:	fd0023f5 	str	d21, [sp, #64]
    ffff8eebb564:	17ffff18 	b	0xffff8eebb1c4
    ffff8eebb568:	f94403e9 	ldr	x9, [sp, #2048]
    ffff8eebb56c:	f100013f 	cmp	x9, #0x0
    ffff8eebb570:	54000800 	b.eq	0xffff8eebb670  // b.none
    ffff8eebb574:	aa1303e0 	mov	x0, x19
    ffff8eebb578:	d2800041 	mov	x1, #0x2                   	// #2
    ffff8eebb57c:	910043e2 	add	x2, sp, #0x10
    ffff8eebb580:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eebb584:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb588:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb58c:	d63f0200 	blr	x16
    ffff8eebb590:	aa1303e0 	mov	x0, x19
    ffff8eebb594:	d2800061 	mov	x1, #0x3                   	// #3
    ffff8eebb598:	910063e2 	add	x2, sp, #0x18
    ffff8eebb59c:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eebb5a0:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb5a4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb5a8:	d63f0200 	blr	x16
    ffff8eebb5ac:	aa1303e0 	mov	x0, x19
    ffff8eebb5b0:	d2800081 	mov	x1, #0x4                   	// #4
    ffff8eebb5b4:	910083e2 	add	x2, sp, #0x20
    ffff8eebb5b8:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eebb5bc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb5c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb5c4:	d63f0200 	blr	x16
    ffff8eebb5c8:	aa1303e0 	mov	x0, x19
    ffff8eebb5cc:	d28000a1 	mov	x1, #0x5                   	// #5
    ffff8eebb5d0:	9100a3e2 	add	x2, sp, #0x28
    ffff8eebb5d4:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eebb5d8:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb5dc:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb5e0:	d63f0200 	blr	x16
    ffff8eebb5e4:	aa1303e0 	mov	x0, x19
    ffff8eebb5e8:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff8eebb5ec:	f9401be2 	ldr	x2, [sp, #48]
    ffff8eebb5f0:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eebb5f4:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb5f8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb5fc:	d63f0200 	blr	x16
    ffff8eebb600:	aa1303e0 	mov	x0, x19
    ffff8eebb604:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff8eebb608:	f9401fe2 	ldr	x2, [sp, #56]
    ffff8eebb60c:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eebb610:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb614:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb618:	d63f0200 	blr	x16
    ffff8eebb61c:	aa1303e0 	mov	x0, x19
    ffff8eebb620:	d2800101 	mov	x1, #0x8                   	// #8
    ffff8eebb624:	910103e2 	add	x2, sp, #0x40
    ffff8eebb628:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eebb62c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb630:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb634:	d63f0200 	blr	x16
    ffff8eebb638:	aa1303e0 	mov	x0, x19
    ffff8eebb63c:	d2800141 	mov	x1, #0xa                   	// #10
    ffff8eebb640:	910143e2 	add	x2, sp, #0x50
    ffff8eebb644:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eebb648:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb64c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb650:	d63f0200 	blr	x16
    ffff8eebb654:	aa1303e0 	mov	x0, x19
    ffff8eebb658:	d2800161 	mov	x1, #0xb                   	// #11
    ffff8eebb65c:	f9402fe2 	ldr	x2, [sp, #88]
    ffff8eebb660:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eebb664:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb668:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb66c:	d63f0200 	blr	x16
    ffff8eebb670:	d2800389 	mov	x9, #0x1c                  	// #28
    ffff8eebb674:	f9000289 	str	x9, [x20]
    ffff8eebb678:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebb67c:	d2849210 	mov	x16, #0x2490                	// #9360
    ffff8eebb680:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb684:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb688:	d63f0200 	blr	x16
    ffff8eebb68c:	913003ff 	add	sp, sp, #0xc00
    ffff8eebb690:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eebb694:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eebb698:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eebb69c:	d2800020 	mov	x0, #0x1                   	// #1
    ffff8eebb6a0:	d65f03c0 	ret
    ffff8eebb6a4:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eebb6a8:	d2849410 	mov	x16, #0x24a0                	// #9376
    ffff8eebb6ac:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb6b0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb6b4:	d63f0200 	blr	x16
    ffff8eebb6b8:	913003ff 	add	sp, sp, #0xc00
    ffff8eebb6bc:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eebb6c0:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eebb6c4:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eebb6c8:	d2800000 	mov	x0, #0x0                   	// #0
    ffff8eebb6cc:	d65f03c0 	ret
    ffff8eebb6d0:	aa1303e0 	mov	x0, x19
    ffff8eebb6d4:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eebb6d8:	d2910702 	mov	x2, #0x8838                	// #34872
    ffff8eebb6dc:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eebb6e0:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eebb6e4:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eebb6e8:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eebb6ec:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eebb6f0:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eebb6f4:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eebb6f8:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eebb6fc:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eebb700:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eebb704:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eebb708:	d63f0200 	blr	x16
    ffff8eebb70c:	f100001f 	cmp	x0, #0x0
    ffff8eebb710:	54fffca0 	b.eq	0xffff8eebb6a4  // b.none
    ffff8eebb714:	17fffeac 	b	0xffff8eebb1c4
