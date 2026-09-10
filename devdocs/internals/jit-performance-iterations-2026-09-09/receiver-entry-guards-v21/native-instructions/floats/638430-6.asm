
/tmp/sqgi-v21-native-profile/floats/638430-6.bin:     file format binary


Disassembly of section .data:

0000ffff9c677000 <.data>:
    ffff9c677000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff9c677004:	910003fd 	mov	x29, sp
    ffff9c677008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff9c67700c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff9c677010:	d13003ff 	sub	sp, sp, #0xc00
    ffff9c677014:	aa0003f3 	mov	x19, x0
    ffff9c677018:	aa0103f4 	mov	x20, x1
    ffff9c67701c:	aa0203f5 	mov	x21, x2
    ffff9c677020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c677024:	912063e1 	add	x1, sp, #0x818
    ffff9c677028:	d2856c02 	mov	x2, #0x2b60                	// #11104
    ffff9c67702c:	f2ba7742 	movk	x2, #0xd3ba, lsl #16
    ffff9c677030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c677034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff9c677038:	f2ba2290 	movk	x16, #0xd114, lsl #16
    ffff9c67703c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c677040:	d63f0200 	blr	x16
    ffff9c677044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c677048:	f90403e9 	str	x9, [sp, #2048]
    ffff9c67704c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff9c677050:	d285da0a 	mov	x10, #0x2ed0                	// #11984
    ffff9c677054:	f2ba778a 	movk	x10, #0xd3bc, lsl #16
    ffff9c677058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff9c67705c:	eb0a013f 	cmp	x9, x10
    ffff9c677060:	54001961 	b.ne	0xffff9c67738c  // b.any
    ffff9c677064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c677068:	aa1303e1 	mov	x1, x19
    ffff9c67706c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff9c677070:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c677074:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c677078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c67707c:	d63f0200 	blr	x16
    ffff9c677080:	f100001f 	cmp	x0, #0x0
    ffff9c677084:	54001840 	b.eq	0xffff9c67738c  // b.none
    ffff9c677088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c67708c:	aa1303e1 	mov	x1, x19
    ffff9c677090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff9c677094:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c677098:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c67709c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6770a0:	d63f0200 	blr	x16
    ffff9c6770a4:	f100001f 	cmp	x0, #0x0
    ffff9c6770a8:	54001720 	b.eq	0xffff9c67738c  // b.none
    ffff9c6770ac:	b9401269 	ldr	w9, [x19, #16]
    ffff9c6770b0:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6770b4:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6770b8:	eb0a013f 	cmp	x9, x10
    ffff9c6770bc:	54001681 	b.ne	0xffff9c67738c  // b.any
    ffff9c6770c0:	f9400e69 	ldr	x9, [x19, #24]
    ffff9c6770c4:	f90007e9 	str	x9, [sp, #8]
    ffff9c6770c8:	b9402269 	ldr	w9, [x19, #32]
    ffff9c6770cc:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6770d0:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6770d4:	eb0a013f 	cmp	x9, x10
    ffff9c6770d8:	540015a1 	b.ne	0xffff9c67738c  // b.any
    ffff9c6770dc:	fd401660 	ldr	d0, [x19, #40]
    ffff9c6770e0:	fd000be0 	str	d0, [sp, #16]
    ffff9c6770e4:	b9403269 	ldr	w9, [x19, #48]
    ffff9c6770e8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6770ec:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6770f0:	eb0a013f 	cmp	x9, x10
    ffff9c6770f4:	540014c1 	b.ne	0xffff9c67738c  // b.any
    ffff9c6770f8:	f9401e69 	ldr	x9, [x19, #56]
    ffff9c6770fc:	f9000fe9 	str	x9, [sp, #24]
    ffff9c677100:	140000ae 	b	0xffff9c6773b8
    ffff9c677104:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c677108:	f94007ea 	ldr	x10, [sp, #8]
    ffff9c67710c:	eb0a013f 	cmp	x9, x10
    ffff9c677110:	54000caa 	b.ge	0xffff9c6772a4  // b.tcont
    ffff9c677114:	d2800029 	mov	x9, #0x1                   	// #1
    ffff9c677118:	f90403e9 	str	x9, [sp, #2048]
    ffff9c67711c:	14000011 	b	0xffff9c677160
    ffff9c677120:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c677124:	d290d102 	mov	x2, #0x8688                	// #34440
    ffff9c677128:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c67712c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c677130:	d2827e03 	mov	x3, #0x13f0                	// #5104
    ffff9c677134:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c677138:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c67713c:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c677140:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c677144:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c677148:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c67714c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c677150:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c677154:	d63f0200 	blr	x16
    ffff9c677158:	f100001f 	cmp	x0, #0x0
    ffff9c67715c:	54001180 	b.eq	0xffff9c67738c  // b.none
    ffff9c677160:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c677164:	f9001be9 	str	x9, [sp, #48]
    ffff9c677168:	d2800229 	mov	x9, #0x11                  	// #17
    ffff9c67716c:	f9001fe9 	str	x9, [sp, #56]
    ffff9c677170:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c677174:	d280022a 	mov	x10, #0x11                  	// #17
    ffff9c677178:	9aca0d2b 	sdiv	x11, x9, x10
    ffff9c67717c:	9b0aa569 	msub	x9, x11, x10, x9
    ffff9c677180:	f9001fe9 	str	x9, [sp, #56]
    ffff9c677184:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c677188:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff9c67718c:	f90023e9 	str	x9, [sp, #64]
    ffff9c677190:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c677194:	9e620120 	scvtf	d0, x9
    ffff9c677198:	fd4023e1 	ldr	d1, [sp, #64]
    ffff9c67719c:	1e610800 	fmul	d0, d0, d1
    ffff9c6771a0:	fd001fe0 	str	d0, [sp, #56]
    ffff9c6771a4:	d2800069 	mov	x9, #0x3                   	// #3
    ffff9c6771a8:	f90023e9 	str	x9, [sp, #64]
    ffff9c6771ac:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c6771b0:	d280006a 	mov	x10, #0x3                   	// #3
    ffff9c6771b4:	9aca0d2b 	sdiv	x11, x9, x10
    ffff9c6771b8:	9b0aa569 	msub	x9, x11, x10, x9
    ffff9c6771bc:	f90023e9 	str	x9, [sp, #64]
    ffff9c6771c0:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6771c4:	f90027e9 	str	x9, [sp, #72]
    ffff9c6771c8:	f94023e9 	ldr	x9, [sp, #64]
    ffff9c6771cc:	f94027ea 	ldr	x10, [sp, #72]
    ffff9c6771d0:	eb0a013f 	cmp	x9, x10
    ffff9c6771d4:	9a9f17e9 	cset	x9, eq	// eq = none
    ffff9c6771d8:	f90023e9 	str	x9, [sp, #64]
    ffff9c6771dc:	f9401be9 	ldr	x9, [sp, #48]
    ffff9c6771e0:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6771e4:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c6771e8:	f90033e9 	str	x9, [sp, #96]
    ffff9c6771ec:	f94023e9 	ldr	x9, [sp, #64]
    ffff9c6771f0:	f90037e9 	str	x9, [sp, #104]
    ffff9c6771f4:	f94037e9 	ldr	x9, [sp, #104]
    ffff9c6771f8:	f100013f 	cmp	x9, #0x0
    ffff9c6771fc:	540002c0 	b.eq	0xffff9c677254  // b.none
    ffff9c677200:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c677204:	f2e7fd09 	movk	x9, #0x3fe8, lsl #48
    ffff9c677208:	f9003be9 	str	x9, [sp, #112]
    ffff9c67720c:	fd402fe0 	ldr	d0, [sp, #88]
    ffff9c677210:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c677214:	1e610800 	fmul	d0, d0, d1
    ffff9c677218:	fd003be0 	str	d0, [sp, #112]
    ffff9c67721c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c677220:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff9c677224:	f9003fe9 	str	x9, [sp, #120]
    ffff9c677228:	fd4033e0 	ldr	d0, [sp, #96]
    ffff9c67722c:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c677230:	1e610800 	fmul	d0, d0, d1
    ffff9c677234:	fd003fe0 	str	d0, [sp, #120]
    ffff9c677238:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c67723c:	fd403fe1 	ldr	d1, [sp, #120]
    ffff9c677240:	1e613800 	fsub	d0, d0, d1
    ffff9c677244:	fd003be0 	str	d0, [sp, #112]
    ffff9c677248:	f9403be9 	ldr	x9, [sp, #112]
    ffff9c67724c:	f90013e9 	str	x9, [sp, #32]
    ffff9c677250:	1400000e 	b	0xffff9c677288
    ffff9c677254:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c677258:	f2e7fa09 	movk	x9, #0x3fd0, lsl #48
    ffff9c67725c:	f9003be9 	str	x9, [sp, #112]
    ffff9c677260:	fd402fe0 	ldr	d0, [sp, #88]
    ffff9c677264:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c677268:	1e610800 	fmul	d0, d0, d1
    ffff9c67726c:	fd003be0 	str	d0, [sp, #112]
    ffff9c677270:	fd4033e0 	ldr	d0, [sp, #96]
    ffff9c677274:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c677278:	1e612800 	fadd	d0, d0, d1
    ffff9c67727c:	fd003be0 	str	d0, [sp, #112]
    ffff9c677280:	f9403be9 	ldr	x9, [sp, #112]
    ffff9c677284:	f90013e9 	str	x9, [sp, #32]
    ffff9c677288:	f94013e9 	ldr	x9, [sp, #32]
    ffff9c67728c:	f9000be9 	str	x9, [sp, #16]
    ffff9c677290:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c677294:	f90013e9 	str	x9, [sp, #32]
    ffff9c677298:	91000529 	add	x9, x9, #0x1
    ffff9c67729c:	f9000fe9 	str	x9, [sp, #24]
    ffff9c6772a0:	17ffff99 	b	0xffff9c677104
    ffff9c6772a4:	f94403e9 	ldr	x9, [sp, #2048]
    ffff9c6772a8:	f100013f 	cmp	x9, #0x0
    ffff9c6772ac:	54000560 	b.eq	0xffff9c677358  // b.none
    ffff9c6772b0:	aa1303e0 	mov	x0, x19
    ffff9c6772b4:	d2800041 	mov	x1, #0x2                   	// #2
    ffff9c6772b8:	910043e2 	add	x2, sp, #0x10
    ffff9c6772bc:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6772c0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6772c4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6772c8:	d63f0200 	blr	x16
    ffff9c6772cc:	aa1303e0 	mov	x0, x19
    ffff9c6772d0:	d2800061 	mov	x1, #0x3                   	// #3
    ffff9c6772d4:	f9400fe2 	ldr	x2, [sp, #24]
    ffff9c6772d8:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6772dc:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6772e0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6772e4:	d63f0200 	blr	x16
    ffff9c6772e8:	aa1303e0 	mov	x0, x19
    ffff9c6772ec:	d2800081 	mov	x1, #0x4                   	// #4
    ffff9c6772f0:	f94013e2 	ldr	x2, [sp, #32]
    ffff9c6772f4:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6772f8:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6772fc:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c677300:	d63f0200 	blr	x16
    ffff9c677304:	aa1303e0 	mov	x0, x19
    ffff9c677308:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff9c67730c:	9100c3e2 	add	x2, sp, #0x30
    ffff9c677310:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c677314:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c677318:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c67731c:	d63f0200 	blr	x16
    ffff9c677320:	aa1303e0 	mov	x0, x19
    ffff9c677324:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff9c677328:	9100e3e2 	add	x2, sp, #0x38
    ffff9c67732c:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c677330:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c677334:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c677338:	d63f0200 	blr	x16
    ffff9c67733c:	aa1303e0 	mov	x0, x19
    ffff9c677340:	d2800101 	mov	x1, #0x8                   	// #8
    ffff9c677344:	f94023e2 	ldr	x2, [sp, #64]
    ffff9c677348:	d2844e10 	mov	x16, #0x2270                	// #8816
    ffff9c67734c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c677350:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c677354:	d63f0200 	blr	x16
    ffff9c677358:	d2800229 	mov	x9, #0x11                  	// #17
    ffff9c67735c:	f9000289 	str	x9, [x20]
    ffff9c677360:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c677364:	d2827e10 	mov	x16, #0x13f0                	// #5104
    ffff9c677368:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c67736c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c677370:	d63f0200 	blr	x16
    ffff9c677374:	913003ff 	add	sp, sp, #0xc00
    ffff9c677378:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c67737c:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c677380:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c677384:	d2800020 	mov	x0, #0x1                   	// #1
    ffff9c677388:	d65f03c0 	ret
    ffff9c67738c:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c677390:	d2828010 	mov	x16, #0x1400                	// #5120
    ffff9c677394:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c677398:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c67739c:	d63f0200 	blr	x16
    ffff9c6773a0:	913003ff 	add	sp, sp, #0xc00
    ffff9c6773a4:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6773a8:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6773ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6773b0:	d2800000 	mov	x0, #0x0                   	// #0
    ffff9c6773b4:	d65f03c0 	ret
    ffff9c6773b8:	aa1303e0 	mov	x0, x19
    ffff9c6773bc:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6773c0:	d290d102 	mov	x2, #0x8688                	// #34440
    ffff9c6773c4:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6773c8:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6773cc:	d2827e03 	mov	x3, #0x13f0                	// #5104
    ffff9c6773d0:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6773d4:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6773d8:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6773dc:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6773e0:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6773e4:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6773e8:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6773ec:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6773f0:	d63f0200 	blr	x16
    ffff9c6773f4:	f100001f 	cmp	x0, #0x0
    ffff9c6773f8:	54fffca0 	b.eq	0xffff9c67738c  // b.none
    ffff9c6773fc:	17ffff42 	b	0xffff9c677104
