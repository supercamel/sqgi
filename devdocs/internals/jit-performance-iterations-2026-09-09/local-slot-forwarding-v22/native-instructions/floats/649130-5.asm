
/tmp/sqgi-v22-native-profile/floats/649130-5.bin:     file format binary


Disassembly of section .data:

0000ffff8eeb8000 <.data>:
    ffff8eeb8000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff8eeb8004:	910003fd 	mov	x29, sp
    ffff8eeb8008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff8eeb800c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff8eeb8010:	d13003ff 	sub	sp, sp, #0xc00
    ffff8eeb8014:	aa0003f3 	mov	x19, x0
    ffff8eeb8018:	aa0103f4 	mov	x20, x1
    ffff8eeb801c:	aa0203f5 	mov	x21, x2
    ffff8eeb8020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb8024:	912063e1 	add	x1, sp, #0x818
    ffff8eeb8028:	d28b6c02 	mov	x2, #0x5b60                	// #23392
    ffff8eeb802c:	f2bbbc22 	movk	x2, #0xdde1, lsl #16
    ffff8eeb8030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb8034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff8eeb8038:	f2b7a090 	movk	x16, #0xbd04, lsl #16
    ffff8eeb803c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb8040:	d63f0200 	blr	x16
    ffff8eeb8044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb8048:	f90403e9 	str	x9, [sp, #2048]
    ffff8eeb804c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff8eeb8050:	d28bda0a 	mov	x10, #0x5ed0                	// #24272
    ffff8eeb8054:	f2bbbc6a 	movk	x10, #0xdde3, lsl #16
    ffff8eeb8058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff8eeb805c:	eb0a013f 	cmp	x9, x10
    ffff8eeb8060:	54002181 	b.ne	0xffff8eeb8490  // b.any
    ffff8eeb8064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb8068:	aa1303e1 	mov	x1, x19
    ffff8eeb806c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff8eeb8070:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb8074:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb8078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb807c:	d63f0200 	blr	x16
    ffff8eeb8080:	f100001f 	cmp	x0, #0x0
    ffff8eeb8084:	54002060 	b.eq	0xffff8eeb8490  // b.none
    ffff8eeb8088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb808c:	aa1303e1 	mov	x1, x19
    ffff8eeb8090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff8eeb8094:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb8098:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb809c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb80a0:	d63f0200 	blr	x16
    ffff8eeb80a4:	f100001f 	cmp	x0, #0x0
    ffff8eeb80a8:	54001f40 	b.eq	0xffff8eeb8490  // b.none
    ffff8eeb80ac:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb80b0:	aa1303e1 	mov	x1, x19
    ffff8eeb80b4:	d2800082 	mov	x2, #0x4                   	// #4
    ffff8eeb80b8:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb80bc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb80c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb80c4:	d63f0200 	blr	x16
    ffff8eeb80c8:	f100001f 	cmp	x0, #0x0
    ffff8eeb80cc:	54001e20 	b.eq	0xffff8eeb8490  // b.none
    ffff8eeb80d0:	b9401269 	ldr	w9, [x19, #16]
    ffff8eeb80d4:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eeb80d8:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb80dc:	eb0a013f 	cmp	x9, x10
    ffff8eeb80e0:	54001d81 	b.ne	0xffff8eeb8490  // b.any
    ffff8eeb80e4:	f9400e69 	ldr	x9, [x19, #24]
    ffff8eeb80e8:	f90007e9 	str	x9, [sp, #8]
    ffff8eeb80ec:	b9402269 	ldr	w9, [x19, #32]
    ffff8eeb80f0:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eeb80f4:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb80f8:	eb0a013f 	cmp	x9, x10
    ffff8eeb80fc:	54001ca1 	b.ne	0xffff8eeb8490  // b.any
    ffff8eeb8100:	fd401660 	ldr	d0, [x19, #40]
    ffff8eeb8104:	fd000be0 	str	d0, [sp, #16]
    ffff8eeb8108:	b9403269 	ldr	w9, [x19, #48]
    ffff8eeb810c:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eeb8110:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb8114:	eb0a013f 	cmp	x9, x10
    ffff8eeb8118:	54001bc1 	b.ne	0xffff8eeb8490  // b.any
    ffff8eeb811c:	fd401e60 	ldr	d0, [x19, #56]
    ffff8eeb8120:	fd000fe0 	str	d0, [sp, #24]
    ffff8eeb8124:	b9404269 	ldr	w9, [x19, #64]
    ffff8eeb8128:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eeb812c:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb8130:	eb0a013f 	cmp	x9, x10
    ffff8eeb8134:	54001ae1 	b.ne	0xffff8eeb8490  // b.any
    ffff8eeb8138:	f9402669 	ldr	x9, [x19, #72]
    ffff8eeb813c:	f90013e9 	str	x9, [sp, #32]
    ffff8eeb8140:	140000df 	b	0xffff8eeb84bc
    ffff8eeb8144:	f94013e9 	ldr	x9, [sp, #32]
    ffff8eeb8148:	f94007ea 	ldr	x10, [sp, #8]
    ffff8eeb814c:	eb0a013f 	cmp	x9, x10
    ffff8eeb8150:	5400102a 	b.ge	0xffff8eeb8354  // b.tcont
    ffff8eeb8154:	d2800029 	mov	x9, #0x1                   	// #1
    ffff8eeb8158:	f90403e9 	str	x9, [sp, #2048]
    ffff8eeb815c:	d2800229 	mov	x9, #0x11                  	// #17
    ffff8eeb8160:	f94013e9 	ldr	x9, [sp, #32]
    ffff8eeb8164:	d280022a 	mov	x10, #0x11                  	// #17
    ffff8eeb8168:	9aca0d2b 	sdiv	x11, x9, x10
    ffff8eeb816c:	9b0aa569 	msub	x9, x11, x10, x9
    ffff8eeb8170:	9e670130 	fmov	d16, x9
    ffff8eeb8174:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb8178:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff8eeb817c:	9e670131 	fmov	d17, x9
    ffff8eeb8180:	9e660209 	fmov	x9, d16
    ffff8eeb8184:	9e620120 	scvtf	d0, x9
    ffff8eeb8188:	1e604221 	fmov	d1, d17
    ffff8eeb818c:	1e610800 	fmul	d0, d0, d1
    ffff8eeb8190:	fd0017e0 	str	d0, [sp, #40]
    ffff8eeb8194:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eeb8198:	fd001be0 	str	d0, [sp, #48]
    ffff8eeb819c:	14000011 	b	0xffff8eeb81e0
    ffff8eeb81a0:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb81a4:	d295f002 	mov	x2, #0xaf80                	// #44928
    ffff8eeb81a8:	f2bbbc62 	movk	x2, #0xdde3, lsl #16
    ffff8eeb81ac:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb81b0:	d28e3e03 	mov	x3, #0x71f0                	// #29168
    ffff8eeb81b4:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb81b8:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb81bc:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb81c0:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb81c4:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb81c8:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb81cc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb81d0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb81d4:	d63f0200 	blr	x16
    ffff8eeb81d8:	f100001f 	cmp	x0, #0x0
    ffff8eeb81dc:	540015a0 	b.eq	0xffff8eeb8490  // b.none
    ffff8eeb81e0:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eeb81e4:	1e604010 	fmov	d16, d0
    ffff8eeb81e8:	fd4017e0 	ldr	d0, [sp, #40]
    ffff8eeb81ec:	1e604011 	fmov	d17, d0
    ffff8eeb81f0:	1e604200 	fmov	d0, d16
    ffff8eeb81f4:	1e604221 	fmov	d1, d17
    ffff8eeb81f8:	1e613800 	fsub	d0, d0, d1
    ffff8eeb81fc:	1e604012 	fmov	d18, d0
    ffff8eeb8200:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb8204:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff8eeb8208:	9e670133 	fmov	d19, x9
    ffff8eeb820c:	1e604240 	fmov	d0, d18
    ffff8eeb8210:	1e604261 	fmov	d1, d19
    ffff8eeb8214:	1e610800 	fmul	d0, d0, d1
    ffff8eeb8218:	1e604012 	fmov	d18, d0
    ffff8eeb821c:	1e604240 	fmov	d0, d18
    ffff8eeb8220:	1e604014 	fmov	d20, d0
    ffff8eeb8224:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eeb8228:	fd401be1 	ldr	d1, [sp, #48]
    ffff8eeb822c:	1e612800 	fadd	d0, d0, d1
    ffff8eeb8230:	1e604015 	fmov	d21, d0
    ffff8eeb8234:	1e6042a0 	fmov	d0, d21
    ffff8eeb8238:	1e604281 	fmov	d1, d20
    ffff8eeb823c:	1e612800 	fadd	d0, d0, d1
    ffff8eeb8240:	1e604015 	fmov	d21, d0
    ffff8eeb8244:	fd400fe0 	ldr	d0, [sp, #24]
    ffff8eeb8248:	1e6042a1 	fmov	d1, d21
    ffff8eeb824c:	1e612800 	fadd	d0, d0, d1
    ffff8eeb8250:	fd000fe0 	str	d0, [sp, #24]
    ffff8eeb8254:	fd0027f0 	str	d16, [sp, #72]
    ffff8eeb8258:	fd002bf1 	str	d17, [sp, #80]
    ffff8eeb825c:	fd0037f2 	str	d18, [sp, #104]
    ffff8eeb8260:	fd003bf3 	str	d19, [sp, #112]
    ffff8eeb8264:	fd001ff4 	str	d20, [sp, #56]
    ffff8eeb8268:	fd0023f5 	str	d21, [sp, #64]
    ffff8eeb826c:	14000011 	b	0xffff8eeb82b0
    ffff8eeb8270:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb8274:	d295f202 	mov	x2, #0xaf90                	// #44944
    ffff8eeb8278:	f2bbbc62 	movk	x2, #0xdde3, lsl #16
    ffff8eeb827c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb8280:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eeb8284:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb8288:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb828c:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb8290:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb8294:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb8298:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb829c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb82a0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb82a4:	d63f0200 	blr	x16
    ffff8eeb82a8:	f100001f 	cmp	x0, #0x0
    ffff8eeb82ac:	54000f20 	b.eq	0xffff8eeb8490  // b.none
    ffff8eeb82b0:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eeb82b4:	1e604010 	fmov	d16, d0
    ffff8eeb82b8:	fd4017e0 	ldr	d0, [sp, #40]
    ffff8eeb82bc:	1e604011 	fmov	d17, d0
    ffff8eeb82c0:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb82c4:	f2e7fd09 	movk	x9, #0x3fe8, lsl #48
    ffff8eeb82c8:	9e670132 	fmov	d18, x9
    ffff8eeb82cc:	1e604200 	fmov	d0, d16
    ffff8eeb82d0:	1e604241 	fmov	d1, d18
    ffff8eeb82d4:	1e610800 	fmul	d0, d0, d1
    ffff8eeb82d8:	1e604013 	fmov	d19, d0
    ffff8eeb82dc:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb82e0:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff8eeb82e4:	9e670134 	fmov	d20, x9
    ffff8eeb82e8:	1e604280 	fmov	d0, d20
    ffff8eeb82ec:	1e604241 	fmov	d1, d18
    ffff8eeb82f0:	1e613800 	fsub	d0, d0, d1
    ffff8eeb82f4:	1e604014 	fmov	d20, d0
    ffff8eeb82f8:	1e604220 	fmov	d0, d17
    ffff8eeb82fc:	1e604281 	fmov	d1, d20
    ffff8eeb8300:	1e610800 	fmul	d0, d0, d1
    ffff8eeb8304:	1e604014 	fmov	d20, d0
    ffff8eeb8308:	1e604260 	fmov	d0, d19
    ffff8eeb830c:	1e604281 	fmov	d1, d20
    ffff8eeb8310:	1e612800 	fadd	d0, d0, d1
    ffff8eeb8314:	1e604013 	fmov	d19, d0
    ffff8eeb8318:	1e604260 	fmov	d0, d19
    ffff8eeb831c:	1e604015 	fmov	d21, d0
    ffff8eeb8320:	1e6042a0 	fmov	d0, d21
    ffff8eeb8324:	fd000be0 	str	d0, [sp, #16]
    ffff8eeb8328:	f94013e9 	ldr	x9, [sp, #32]
    ffff8eeb832c:	f90017e9 	str	x9, [sp, #40]
    ffff8eeb8330:	91000529 	add	x9, x9, #0x1
    ffff8eeb8334:	f90013e9 	str	x9, [sp, #32]
    ffff8eeb8338:	fd002bf0 	str	d16, [sp, #80]
    ffff8eeb833c:	fd002ff1 	str	d17, [sp, #88]
    ffff8eeb8340:	fd0033f2 	str	d18, [sp, #96]
    ffff8eeb8344:	fd0037f3 	str	d19, [sp, #104]
    ffff8eeb8348:	fd003bf4 	str	d20, [sp, #112]
    ffff8eeb834c:	fd0023f5 	str	d21, [sp, #64]
    ffff8eeb8350:	17ffff7d 	b	0xffff8eeb8144
    ffff8eeb8354:	f94403e9 	ldr	x9, [sp, #2048]
    ffff8eeb8358:	f100013f 	cmp	x9, #0x0
    ffff8eeb835c:	54000800 	b.eq	0xffff8eeb845c  // b.none
    ffff8eeb8360:	aa1303e0 	mov	x0, x19
    ffff8eeb8364:	d2800041 	mov	x1, #0x2                   	// #2
    ffff8eeb8368:	910043e2 	add	x2, sp, #0x10
    ffff8eeb836c:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb8370:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb8374:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb8378:	d63f0200 	blr	x16
    ffff8eeb837c:	aa1303e0 	mov	x0, x19
    ffff8eeb8380:	d2800061 	mov	x1, #0x3                   	// #3
    ffff8eeb8384:	910063e2 	add	x2, sp, #0x18
    ffff8eeb8388:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb838c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb8390:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb8394:	d63f0200 	blr	x16
    ffff8eeb8398:	aa1303e0 	mov	x0, x19
    ffff8eeb839c:	d2800081 	mov	x1, #0x4                   	// #4
    ffff8eeb83a0:	f94013e2 	ldr	x2, [sp, #32]
    ffff8eeb83a4:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eeb83a8:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb83ac:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb83b0:	d63f0200 	blr	x16
    ffff8eeb83b4:	aa1303e0 	mov	x0, x19
    ffff8eeb83b8:	d28000a1 	mov	x1, #0x5                   	// #5
    ffff8eeb83bc:	f94017e2 	ldr	x2, [sp, #40]
    ffff8eeb83c0:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eeb83c4:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb83c8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb83cc:	d63f0200 	blr	x16
    ffff8eeb83d0:	aa1303e0 	mov	x0, x19
    ffff8eeb83d4:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff8eeb83d8:	9100c3e2 	add	x2, sp, #0x30
    ffff8eeb83dc:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb83e0:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb83e4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb83e8:	d63f0200 	blr	x16
    ffff8eeb83ec:	aa1303e0 	mov	x0, x19
    ffff8eeb83f0:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff8eeb83f4:	9100e3e2 	add	x2, sp, #0x38
    ffff8eeb83f8:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb83fc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb8400:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb8404:	d63f0200 	blr	x16
    ffff8eeb8408:	aa1303e0 	mov	x0, x19
    ffff8eeb840c:	d2800101 	mov	x1, #0x8                   	// #8
    ffff8eeb8410:	910103e2 	add	x2, sp, #0x40
    ffff8eeb8414:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb8418:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb841c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb8420:	d63f0200 	blr	x16
    ffff8eeb8424:	aa1303e0 	mov	x0, x19
    ffff8eeb8428:	d2800141 	mov	x1, #0xa                   	// #10
    ffff8eeb842c:	910143e2 	add	x2, sp, #0x50
    ffff8eeb8430:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb8434:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb8438:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb843c:	d63f0200 	blr	x16
    ffff8eeb8440:	aa1303e0 	mov	x0, x19
    ffff8eeb8444:	d2800161 	mov	x1, #0xb                   	// #11
    ffff8eeb8448:	910163e2 	add	x2, sp, #0x58
    ffff8eeb844c:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb8450:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb8454:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb8458:	d63f0200 	blr	x16
    ffff8eeb845c:	d28002a9 	mov	x9, #0x15                  	// #21
    ffff8eeb8460:	f9000289 	str	x9, [x20]
    ffff8eeb8464:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb8468:	d2849210 	mov	x16, #0x2490                	// #9360
    ffff8eeb846c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb8470:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb8474:	d63f0200 	blr	x16
    ffff8eeb8478:	913003ff 	add	sp, sp, #0xc00
    ffff8eeb847c:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eeb8480:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eeb8484:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eeb8488:	d2800020 	mov	x0, #0x1                   	// #1
    ffff8eeb848c:	d65f03c0 	ret
    ffff8eeb8490:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb8494:	d2849410 	mov	x16, #0x24a0                	// #9376
    ffff8eeb8498:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb849c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb84a0:	d63f0200 	blr	x16
    ffff8eeb84a4:	913003ff 	add	sp, sp, #0xc00
    ffff8eeb84a8:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eeb84ac:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eeb84b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eeb84b4:	d2800000 	mov	x0, #0x0                   	// #0
    ffff8eeb84b8:	d65f03c0 	ret
    ffff8eeb84bc:	aa1303e0 	mov	x0, x19
    ffff8eeb84c0:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb84c4:	d295f002 	mov	x2, #0xaf80                	// #44928
    ffff8eeb84c8:	f2bbbc62 	movk	x2, #0xdde3, lsl #16
    ffff8eeb84cc:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb84d0:	d28e3e03 	mov	x3, #0x71f0                	// #29168
    ffff8eeb84d4:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb84d8:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb84dc:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb84e0:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb84e4:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb84e8:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb84ec:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb84f0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb84f4:	d63f0200 	blr	x16
    ffff8eeb84f8:	f100001f 	cmp	x0, #0x0
    ffff8eeb84fc:	54fffca0 	b.eq	0xffff8eeb8490  // b.none
    ffff8eeb8500:	aa1303e0 	mov	x0, x19
    ffff8eeb8504:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb8508:	d295f202 	mov	x2, #0xaf90                	// #44944
    ffff8eeb850c:	f2bbbc62 	movk	x2, #0xdde3, lsl #16
    ffff8eeb8510:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb8514:	d2886803 	mov	x3, #0x4340                	// #17216
    ffff8eeb8518:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb851c:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb8520:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb8524:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb8528:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb852c:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb8530:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb8534:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb8538:	d63f0200 	blr	x16
    ffff8eeb853c:	f100001f 	cmp	x0, #0x0
    ffff8eeb8540:	54fffa80 	b.eq	0xffff8eeb8490  // b.none
    ffff8eeb8544:	17ffff00 	b	0xffff8eeb8144
