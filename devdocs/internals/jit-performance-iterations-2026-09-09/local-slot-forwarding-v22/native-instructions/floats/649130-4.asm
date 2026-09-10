
/tmp/sqgi-v22-native-profile/floats/649130-4.bin:     file format binary


Disassembly of section .data:

0000ffff8eeb9000 <.data>:
    ffff8eeb9000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff8eeb9004:	910003fd 	mov	x29, sp
    ffff8eeb9008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff8eeb900c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff8eeb9010:	d13003ff 	sub	sp, sp, #0xc00
    ffff8eeb9014:	aa0003f3 	mov	x19, x0
    ffff8eeb9018:	aa0103f4 	mov	x20, x1
    ffff8eeb901c:	aa0203f5 	mov	x21, x2
    ffff8eeb9020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb9024:	912063e1 	add	x1, sp, #0x818
    ffff8eeb9028:	d28b6c02 	mov	x2, #0x5b60                	// #23392
    ffff8eeb902c:	f2bbbc22 	movk	x2, #0xdde1, lsl #16
    ffff8eeb9030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb9034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff8eeb9038:	f2b7a090 	movk	x16, #0xbd04, lsl #16
    ffff8eeb903c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb9040:	d63f0200 	blr	x16
    ffff8eeb9044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb9048:	f90403e9 	str	x9, [sp, #2048]
    ffff8eeb904c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff8eeb9050:	d28bda0a 	mov	x10, #0x5ed0                	// #24272
    ffff8eeb9054:	f2bbbc6a 	movk	x10, #0xdde3, lsl #16
    ffff8eeb9058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff8eeb905c:	eb0a013f 	cmp	x9, x10
    ffff8eeb9060:	54001dc1 	b.ne	0xffff8eeb9418  // b.any
    ffff8eeb9064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb9068:	aa1303e1 	mov	x1, x19
    ffff8eeb906c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff8eeb9070:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb9074:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb9078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb907c:	d63f0200 	blr	x16
    ffff8eeb9080:	f100001f 	cmp	x0, #0x0
    ffff8eeb9084:	54001ca0 	b.eq	0xffff8eeb9418  // b.none
    ffff8eeb9088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb908c:	aa1303e1 	mov	x1, x19
    ffff8eeb9090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff8eeb9094:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb9098:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb909c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb90a0:	d63f0200 	blr	x16
    ffff8eeb90a4:	f100001f 	cmp	x0, #0x0
    ffff8eeb90a8:	54001b80 	b.eq	0xffff8eeb9418  // b.none
    ffff8eeb90ac:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb90b0:	aa1303e1 	mov	x1, x19
    ffff8eeb90b4:	d2800082 	mov	x2, #0x4                   	// #4
    ffff8eeb90b8:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb90bc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb90c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb90c4:	d63f0200 	blr	x16
    ffff8eeb90c8:	f100001f 	cmp	x0, #0x0
    ffff8eeb90cc:	54001a60 	b.eq	0xffff8eeb9418  // b.none
    ffff8eeb90d0:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb90d4:	aa1303e1 	mov	x1, x19
    ffff8eeb90d8:	d28000a2 	mov	x2, #0x5                   	// #5
    ffff8eeb90dc:	d2843a10 	mov	x16, #0x21d0                	// #8656
    ffff8eeb90e0:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb90e4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb90e8:	d63f0200 	blr	x16
    ffff8eeb90ec:	f100001f 	cmp	x0, #0x0
    ffff8eeb90f0:	54001940 	b.eq	0xffff8eeb9418  // b.none
    ffff8eeb90f4:	b9401269 	ldr	w9, [x19, #16]
    ffff8eeb90f8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eeb90fc:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb9100:	eb0a013f 	cmp	x9, x10
    ffff8eeb9104:	540018a1 	b.ne	0xffff8eeb9418  // b.any
    ffff8eeb9108:	f9400e69 	ldr	x9, [x19, #24]
    ffff8eeb910c:	f90007e9 	str	x9, [sp, #8]
    ffff8eeb9110:	b9402269 	ldr	w9, [x19, #32]
    ffff8eeb9114:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eeb9118:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb911c:	eb0a013f 	cmp	x9, x10
    ffff8eeb9120:	540017c1 	b.ne	0xffff8eeb9418  // b.any
    ffff8eeb9124:	fd401660 	ldr	d0, [x19, #40]
    ffff8eeb9128:	fd000be0 	str	d0, [sp, #16]
    ffff8eeb912c:	b9403269 	ldr	w9, [x19, #48]
    ffff8eeb9130:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eeb9134:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb9138:	eb0a013f 	cmp	x9, x10
    ffff8eeb913c:	540016e1 	b.ne	0xffff8eeb9418  // b.any
    ffff8eeb9140:	fd401e60 	ldr	d0, [x19, #56]
    ffff8eeb9144:	fd000fe0 	str	d0, [sp, #24]
    ffff8eeb9148:	b9404269 	ldr	w9, [x19, #64]
    ffff8eeb914c:	5280008a 	mov	w10, #0x4                   	// #4
    ffff8eeb9150:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb9154:	eb0a013f 	cmp	x9, x10
    ffff8eeb9158:	54001601 	b.ne	0xffff8eeb9418  // b.any
    ffff8eeb915c:	fd402660 	ldr	d0, [x19, #72]
    ffff8eeb9160:	fd0013e0 	str	d0, [sp, #32]
    ffff8eeb9164:	b9405269 	ldr	w9, [x19, #80]
    ffff8eeb9168:	5280004a 	mov	w10, #0x2                   	// #2
    ffff8eeb916c:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff8eeb9170:	eb0a013f 	cmp	x9, x10
    ffff8eeb9174:	54001521 	b.ne	0xffff8eeb9418  // b.any
    ffff8eeb9178:	f9402e69 	ldr	x9, [x19, #88]
    ffff8eeb917c:	f90017e9 	str	x9, [sp, #40]
    ffff8eeb9180:	140000b1 	b	0xffff8eeb9444
    ffff8eeb9184:	f94017e9 	ldr	x9, [sp, #40]
    ffff8eeb9188:	f94007ea 	ldr	x10, [sp, #8]
    ffff8eeb918c:	eb0a013f 	cmp	x9, x10
    ffff8eeb9190:	54000c2a 	b.ge	0xffff8eeb9314  // b.tcont
    ffff8eeb9194:	d2800029 	mov	x9, #0x1                   	// #1
    ffff8eeb9198:	f90403e9 	str	x9, [sp, #2048]
    ffff8eeb919c:	14000011 	b	0xffff8eeb91e0
    ffff8eeb91a0:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb91a4:	d295da02 	mov	x2, #0xaed0                	// #44752
    ffff8eeb91a8:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eeb91ac:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb91b0:	d287e803 	mov	x3, #0x3f40                	// #16192
    ffff8eeb91b4:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb91b8:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb91bc:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb91c0:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb91c4:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb91c8:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb91cc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb91d0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb91d4:	d63f0200 	blr	x16
    ffff8eeb91d8:	f100001f 	cmp	x0, #0x0
    ffff8eeb91dc:	540011e0 	b.eq	0xffff8eeb9418  // b.none
    ffff8eeb91e0:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eeb91e4:	1e604010 	fmov	d16, d0
    ffff8eeb91e8:	fd400fe0 	ldr	d0, [sp, #24]
    ffff8eeb91ec:	1e604011 	fmov	d17, d0
    ffff8eeb91f0:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb91f4:	f2dc0009 	movk	x9, #0xe000, lsl #32
    ffff8eeb91f8:	f2e7fde9 	movk	x9, #0x3fef, lsl #48
    ffff8eeb91fc:	9e670132 	fmov	d18, x9
    ffff8eeb9200:	1e604220 	fmov	d0, d17
    ffff8eeb9204:	1e604241 	fmov	d1, d18
    ffff8eeb9208:	1e610800 	fmul	d0, d0, d1
    ffff8eeb920c:	1e604012 	fmov	d18, d0
    ffff8eeb9210:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb9214:	f2e7f209 	movk	x9, #0x3f90, lsl #48
    ffff8eeb9218:	9e670133 	fmov	d19, x9
    ffff8eeb921c:	1e604200 	fmov	d0, d16
    ffff8eeb9220:	1e604261 	fmov	d1, d19
    ffff8eeb9224:	1e610800 	fmul	d0, d0, d1
    ffff8eeb9228:	1e604013 	fmov	d19, d0
    ffff8eeb922c:	1e604240 	fmov	d0, d18
    ffff8eeb9230:	1e604261 	fmov	d1, d19
    ffff8eeb9234:	1e613800 	fsub	d0, d0, d1
    ffff8eeb9238:	1e604012 	fmov	d18, d0
    ffff8eeb923c:	1e604240 	fmov	d0, d18
    ffff8eeb9240:	1e604014 	fmov	d20, d0
    ffff8eeb9244:	d2800229 	mov	x9, #0x11                  	// #17
    ffff8eeb9248:	f94017e9 	ldr	x9, [sp, #40]
    ffff8eeb924c:	d280022a 	mov	x10, #0x11                  	// #17
    ffff8eeb9250:	9aca0d2b 	sdiv	x11, x9, x10
    ffff8eeb9254:	9b0aa569 	msub	x9, x11, x10, x9
    ffff8eeb9258:	9e670135 	fmov	d21, x9
    ffff8eeb925c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb9260:	f2e7ea09 	movk	x9, #0x3f50, lsl #48
    ffff8eeb9264:	9e670130 	fmov	d16, x9
    ffff8eeb9268:	9e6602a9 	fmov	x9, d21
    ffff8eeb926c:	9e620120 	scvtf	d0, x9
    ffff8eeb9270:	1e604201 	fmov	d1, d16
    ffff8eeb9274:	1e610800 	fmul	d0, d0, d1
    ffff8eeb9278:	1e604015 	fmov	d21, d0
    ffff8eeb927c:	1e604280 	fmov	d0, d20
    ffff8eeb9280:	1e6042a1 	fmov	d1, d21
    ffff8eeb9284:	1e612800 	fadd	d0, d0, d1
    ffff8eeb9288:	1e604016 	fmov	d22, d0
    ffff8eeb928c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb9290:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff8eeb9294:	9e670134 	fmov	d20, x9
    ffff8eeb9298:	1e6042c0 	fmov	d0, d22
    ffff8eeb929c:	1e604281 	fmov	d1, d20
    ffff8eeb92a0:	1e610800 	fmul	d0, d0, d1
    ffff8eeb92a4:	1e604014 	fmov	d20, d0
    ffff8eeb92a8:	fd400be0 	ldr	d0, [sp, #16]
    ffff8eeb92ac:	1e604281 	fmov	d1, d20
    ffff8eeb92b0:	1e612800 	fadd	d0, d0, d1
    ffff8eeb92b4:	1e604017 	fmov	d23, d0
    ffff8eeb92b8:	d2800009 	mov	x9, #0x0                   	// #0
    ffff8eeb92bc:	f2e7f209 	movk	x9, #0x3f90, lsl #48
    ffff8eeb92c0:	9e670134 	fmov	d20, x9
    ffff8eeb92c4:	1e6042e0 	fmov	d0, d23
    ffff8eeb92c8:	1e604281 	fmov	d1, d20
    ffff8eeb92cc:	1e610800 	fmul	d0, d0, d1
    ffff8eeb92d0:	1e604014 	fmov	d20, d0
    ffff8eeb92d4:	fd4013e0 	ldr	d0, [sp, #32]
    ffff8eeb92d8:	1e604281 	fmov	d1, d20
    ffff8eeb92dc:	1e612800 	fadd	d0, d0, d1
    ffff8eeb92e0:	fd0013e0 	str	d0, [sp, #32]
    ffff8eeb92e4:	f94017e9 	ldr	x9, [sp, #40]
    ffff8eeb92e8:	f9001be9 	str	x9, [sp, #48]
    ffff8eeb92ec:	91000529 	add	x9, x9, #0x1
    ffff8eeb92f0:	f90017e9 	str	x9, [sp, #40]
    ffff8eeb92f4:	fd0023f0 	str	d16, [sp, #64]
    ffff8eeb92f8:	fd0027f1 	str	d17, [sp, #72]
    ffff8eeb92fc:	fd002bf2 	str	d18, [sp, #80]
    ffff8eeb9300:	fd002ff3 	str	d19, [sp, #88]
    ffff8eeb9304:	fd001ff5 	str	d21, [sp, #56]
    ffff8eeb9308:	fd000ff6 	str	d22, [sp, #24]
    ffff8eeb930c:	fd000bf7 	str	d23, [sp, #16]
    ffff8eeb9310:	17ffff9d 	b	0xffff8eeb9184
    ffff8eeb9314:	f94403e9 	ldr	x9, [sp, #2048]
    ffff8eeb9318:	f100013f 	cmp	x9, #0x0
    ffff8eeb931c:	54000640 	b.eq	0xffff8eeb93e4  // b.none
    ffff8eeb9320:	aa1303e0 	mov	x0, x19
    ffff8eeb9324:	d2800041 	mov	x1, #0x2                   	// #2
    ffff8eeb9328:	910043e2 	add	x2, sp, #0x10
    ffff8eeb932c:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb9330:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb9334:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb9338:	d63f0200 	blr	x16
    ffff8eeb933c:	aa1303e0 	mov	x0, x19
    ffff8eeb9340:	d2800061 	mov	x1, #0x3                   	// #3
    ffff8eeb9344:	910063e2 	add	x2, sp, #0x18
    ffff8eeb9348:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb934c:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb9350:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb9354:	d63f0200 	blr	x16
    ffff8eeb9358:	aa1303e0 	mov	x0, x19
    ffff8eeb935c:	d2800081 	mov	x1, #0x4                   	// #4
    ffff8eeb9360:	910083e2 	add	x2, sp, #0x20
    ffff8eeb9364:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb9368:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb936c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb9370:	d63f0200 	blr	x16
    ffff8eeb9374:	aa1303e0 	mov	x0, x19
    ffff8eeb9378:	d28000a1 	mov	x1, #0x5                   	// #5
    ffff8eeb937c:	f94017e2 	ldr	x2, [sp, #40]
    ffff8eeb9380:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eeb9384:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb9388:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb938c:	d63f0200 	blr	x16
    ffff8eeb9390:	aa1303e0 	mov	x0, x19
    ffff8eeb9394:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff8eeb9398:	f9401be2 	ldr	x2, [sp, #48]
    ffff8eeb939c:	d284c210 	mov	x16, #0x2610                	// #9744
    ffff8eeb93a0:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb93a4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb93a8:	d63f0200 	blr	x16
    ffff8eeb93ac:	aa1303e0 	mov	x0, x19
    ffff8eeb93b0:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff8eeb93b4:	9100e3e2 	add	x2, sp, #0x38
    ffff8eeb93b8:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb93bc:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb93c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb93c4:	d63f0200 	blr	x16
    ffff8eeb93c8:	aa1303e0 	mov	x0, x19
    ffff8eeb93cc:	d2800121 	mov	x1, #0x9                   	// #9
    ffff8eeb93d0:	910123e2 	add	x2, sp, #0x48
    ffff8eeb93d4:	d285c290 	mov	x16, #0x2e14                	// #11796
    ffff8eeb93d8:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb93dc:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb93e0:	d63f0200 	blr	x16
    ffff8eeb93e4:	d2800289 	mov	x9, #0x14                  	// #20
    ffff8eeb93e8:	f9000289 	str	x9, [x20]
    ffff8eeb93ec:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb93f0:	d2849210 	mov	x16, #0x2490                	// #9360
    ffff8eeb93f4:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb93f8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb93fc:	d63f0200 	blr	x16
    ffff8eeb9400:	913003ff 	add	sp, sp, #0xc00
    ffff8eeb9404:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eeb9408:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eeb940c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eeb9410:	d2800020 	mov	x0, #0x1                   	// #1
    ffff8eeb9414:	d65f03c0 	ret
    ffff8eeb9418:	911fe3e0 	add	x0, sp, #0x7f8
    ffff8eeb941c:	d2849410 	mov	x16, #0x24a0                	// #9376
    ffff8eeb9420:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb9424:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb9428:	d63f0200 	blr	x16
    ffff8eeb942c:	913003ff 	add	sp, sp, #0xc00
    ffff8eeb9430:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff8eeb9434:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff8eeb9438:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff8eeb943c:	d2800000 	mov	x0, #0x0                   	// #0
    ffff8eeb9440:	d65f03c0 	ret
    ffff8eeb9444:	aa1303e0 	mov	x0, x19
    ffff8eeb9448:	d2800001 	mov	x1, #0x0                   	// #0
    ffff8eeb944c:	d295da02 	mov	x2, #0xaed0                	// #44752
    ffff8eeb9450:	f2bbbc82 	movk	x2, #0xdde4, lsl #16
    ffff8eeb9454:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff8eeb9458:	d287e803 	mov	x3, #0x3f40                	// #16192
    ffff8eeb945c:	f2bbbec3 	movk	x3, #0xddf6, lsl #16
    ffff8eeb9460:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff8eeb9464:	d28bdd04 	mov	x4, #0x5ee8                	// #24296
    ffff8eeb9468:	f2bbbc64 	movk	x4, #0xdde3, lsl #16
    ffff8eeb946c:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff8eeb9470:	d28edc10 	mov	x16, #0x76e0                	// #30432
    ffff8eeb9474:	f2b7a0d0 	movk	x16, #0xbd06, lsl #16
    ffff8eeb9478:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff8eeb947c:	d63f0200 	blr	x16
    ffff8eeb9480:	f100001f 	cmp	x0, #0x0
    ffff8eeb9484:	54fffca0 	b.eq	0xffff8eeb9418  // b.none
    ffff8eeb9488:	17ffff3f 	b	0xffff8eeb9184
