
/tmp/sqgi-v21-native-profile/floats/638430-2.bin:     file format binary


Disassembly of section .data:

0000ffff9c6d4000 <.data>:
    ffff9c6d4000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff9c6d4004:	910003fd 	mov	x29, sp
    ffff9c6d4008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff9c6d400c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff9c6d4010:	d13003ff 	sub	sp, sp, #0xc00
    ffff9c6d4014:	aa0003f3 	mov	x19, x0
    ffff9c6d4018:	aa0103f4 	mov	x20, x1
    ffff9c6d401c:	aa0203f5 	mov	x21, x2
    ffff9c6d4020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d4024:	912063e1 	add	x1, sp, #0x818
    ffff9c6d4028:	d2856c02 	mov	x2, #0x2b60                	// #11104
    ffff9c6d402c:	f2ba7742 	movk	x2, #0xd3ba, lsl #16
    ffff9c6d4030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d4034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff9c6d4038:	f2ba2290 	movk	x16, #0xd114, lsl #16
    ffff9c6d403c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d4040:	d63f0200 	blr	x16
    ffff9c6d4044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d4048:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d404c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff9c6d4050:	d285da0a 	mov	x10, #0x2ed0                	// #11984
    ffff9c6d4054:	f2ba778a 	movk	x10, #0xd3bc, lsl #16
    ffff9c6d4058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff9c6d405c:	eb0a013f 	cmp	x9, x10
    ffff9c6d4060:	54002f41 	b.ne	0xffff9c6d4648  // b.any
    ffff9c6d4064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d4068:	aa1303e1 	mov	x1, x19
    ffff9c6d406c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff9c6d4070:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d4074:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d4078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d407c:	d63f0200 	blr	x16
    ffff9c6d4080:	f100001f 	cmp	x0, #0x0
    ffff9c6d4084:	54002e20 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d4088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d408c:	aa1303e1 	mov	x1, x19
    ffff9c6d4090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff9c6d4094:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d4098:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d409c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d40a0:	d63f0200 	blr	x16
    ffff9c6d40a4:	f100001f 	cmp	x0, #0x0
    ffff9c6d40a8:	54002d00 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d40ac:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d40b0:	aa1303e1 	mov	x1, x19
    ffff9c6d40b4:	d2800082 	mov	x2, #0x4                   	// #4
    ffff9c6d40b8:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d40bc:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d40c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d40c4:	d63f0200 	blr	x16
    ffff9c6d40c8:	f100001f 	cmp	x0, #0x0
    ffff9c6d40cc:	54002be0 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d40d0:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d40d4:	aa1303e1 	mov	x1, x19
    ffff9c6d40d8:	d28000a2 	mov	x2, #0x5                   	// #5
    ffff9c6d40dc:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d40e0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d40e4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d40e8:	d63f0200 	blr	x16
    ffff9c6d40ec:	f100001f 	cmp	x0, #0x0
    ffff9c6d40f0:	54002ac0 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d40f4:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d40f8:	aa1303e1 	mov	x1, x19
    ffff9c6d40fc:	d28000c2 	mov	x2, #0x6                   	// #6
    ffff9c6d4100:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d4104:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d4108:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d410c:	d63f0200 	blr	x16
    ffff9c6d4110:	f100001f 	cmp	x0, #0x0
    ffff9c6d4114:	540029a0 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d4118:	b9401269 	ldr	w9, [x19, #16]
    ffff9c6d411c:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d4120:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d4124:	eb0a013f 	cmp	x9, x10
    ffff9c6d4128:	54002901 	b.ne	0xffff9c6d4648  // b.any
    ffff9c6d412c:	f9400e69 	ldr	x9, [x19, #24]
    ffff9c6d4130:	f90007e9 	str	x9, [sp, #8]
    ffff9c6d4134:	b9402269 	ldr	w9, [x19, #32]
    ffff9c6d4138:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d413c:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d4140:	eb0a013f 	cmp	x9, x10
    ffff9c6d4144:	54002821 	b.ne	0xffff9c6d4648  // b.any
    ffff9c6d4148:	fd401660 	ldr	d0, [x19, #40]
    ffff9c6d414c:	fd000be0 	str	d0, [sp, #16]
    ffff9c6d4150:	b9403269 	ldr	w9, [x19, #48]
    ffff9c6d4154:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d4158:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d415c:	eb0a013f 	cmp	x9, x10
    ffff9c6d4160:	54002741 	b.ne	0xffff9c6d4648  // b.any
    ffff9c6d4164:	fd401e60 	ldr	d0, [x19, #56]
    ffff9c6d4168:	fd000fe0 	str	d0, [sp, #24]
    ffff9c6d416c:	b9404269 	ldr	w9, [x19, #64]
    ffff9c6d4170:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d4174:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d4178:	eb0a013f 	cmp	x9, x10
    ffff9c6d417c:	54002661 	b.ne	0xffff9c6d4648  // b.any
    ffff9c6d4180:	fd402660 	ldr	d0, [x19, #72]
    ffff9c6d4184:	fd0013e0 	str	d0, [sp, #32]
    ffff9c6d4188:	b9405269 	ldr	w9, [x19, #80]
    ffff9c6d418c:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d4190:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d4194:	eb0a013f 	cmp	x9, x10
    ffff9c6d4198:	54002581 	b.ne	0xffff9c6d4648  // b.any
    ffff9c6d419c:	fd402e60 	ldr	d0, [x19, #88]
    ffff9c6d41a0:	fd0017e0 	str	d0, [sp, #40]
    ffff9c6d41a4:	b9406269 	ldr	w9, [x19, #96]
    ffff9c6d41a8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d41ac:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d41b0:	eb0a013f 	cmp	x9, x10
    ffff9c6d41b4:	540024a1 	b.ne	0xffff9c6d4648  // b.any
    ffff9c6d41b8:	f9403669 	ldr	x9, [x19, #104]
    ffff9c6d41bc:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d41c0:	1400012d 	b	0xffff9c6d4674
    ffff9c6d41c4:	f9401be9 	ldr	x9, [sp, #48]
    ffff9c6d41c8:	f94007ea 	ldr	x10, [sp, #8]
    ffff9c6d41cc:	eb0a013f 	cmp	x9, x10
    ffff9c6d41d0:	540019ea 	b.ge	0xffff9c6d450c  // b.tcont
    ffff9c6d41d4:	d2800029 	mov	x9, #0x1                   	// #1
    ffff9c6d41d8:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d41dc:	d28002e9 	mov	x9, #0x17                  	// #23
    ffff9c6d41e0:	f9001fe9 	str	x9, [sp, #56]
    ffff9c6d41e4:	f9401be9 	ldr	x9, [sp, #48]
    ffff9c6d41e8:	d28002ea 	mov	x10, #0x17                  	// #23
    ffff9c6d41ec:	9aca0d2b 	sdiv	x11, x9, x10
    ffff9c6d41f0:	9b0aa569 	msub	x9, x11, x10, x9
    ffff9c6d41f4:	f9001fe9 	str	x9, [sp, #56]
    ffff9c6d41f8:	14000011 	b	0xffff9c6d423c
    ffff9c6d41fc:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d4200:	d28b0702 	mov	x2, #0x5838                	// #22584
    ffff9c6d4204:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d4208:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d420c:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d4210:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d4214:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d4218:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d421c:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d4220:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d4224:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d4228:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d422c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d4230:	d63f0200 	blr	x16
    ffff9c6d4234:	f100001f 	cmp	x0, #0x0
    ffff9c6d4238:	54002080 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d423c:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c6d4240:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d4244:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c6d4248:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d424c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d4250:	f2e7fd89 	movk	x9, #0x3fec, lsl #48
    ffff9c6d4254:	f90033e9 	str	x9, [sp, #96]
    ffff9c6d4258:	fd402be0 	ldr	d0, [sp, #80]
    ffff9c6d425c:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d4260:	1e610800 	fmul	d0, d0, d1
    ffff9c6d4264:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d4268:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d426c:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d4270:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d4274:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d4278:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d427c:	1e613800 	fsub	d0, d0, d1
    ffff9c6d4280:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d4284:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d4288:	9e620120 	scvtf	d0, x9
    ffff9c6d428c:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d4290:	1e610800 	fmul	d0, d0, d1
    ffff9c6d4294:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d4298:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d429c:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d42a0:	1e612800 	fadd	d0, d0, d1
    ffff9c6d42a4:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d42a8:	f94037e9 	ldr	x9, [sp, #104]
    ffff9c6d42ac:	f90023e9 	str	x9, [sp, #64]
    ffff9c6d42b0:	f94023e9 	ldr	x9, [sp, #64]
    ffff9c6d42b4:	f9000be9 	str	x9, [sp, #16]
    ffff9c6d42b8:	14000011 	b	0xffff9c6d42fc
    ffff9c6d42bc:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d42c0:	d28b0702 	mov	x2, #0x5838                	// #22584
    ffff9c6d42c4:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d42c8:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d42cc:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d42d0:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d42d4:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d42d8:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d42dc:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d42e0:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d42e4:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d42e8:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d42ec:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d42f0:	d63f0200 	blr	x16
    ffff9c6d42f4:	f100001f 	cmp	x0, #0x0
    ffff9c6d42f8:	54001a80 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d42fc:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c6d4300:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d4304:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c6d4308:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d430c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d4310:	f2e7fd09 	movk	x9, #0x3fe8, lsl #48
    ffff9c6d4314:	f90033e9 	str	x9, [sp, #96]
    ffff9c6d4318:	fd402be0 	ldr	d0, [sp, #80]
    ffff9c6d431c:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d4320:	1e610800 	fmul	d0, d0, d1
    ffff9c6d4324:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d4328:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d432c:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d4330:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d4334:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d4338:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d433c:	1e613800 	fsub	d0, d0, d1
    ffff9c6d4340:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d4344:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d4348:	9e620120 	scvtf	d0, x9
    ffff9c6d434c:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d4350:	1e610800 	fmul	d0, d0, d1
    ffff9c6d4354:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d4358:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d435c:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d4360:	1e612800 	fadd	d0, d0, d1
    ffff9c6d4364:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d4368:	f94037e9 	ldr	x9, [sp, #104]
    ffff9c6d436c:	f90023e9 	str	x9, [sp, #64]
    ffff9c6d4370:	f94023e9 	ldr	x9, [sp, #64]
    ffff9c6d4374:	f9000fe9 	str	x9, [sp, #24]
    ffff9c6d4378:	14000011 	b	0xffff9c6d43bc
    ffff9c6d437c:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d4380:	d28b0702 	mov	x2, #0x5838                	// #22584
    ffff9c6d4384:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d4388:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d438c:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d4390:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d4394:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d4398:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d439c:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d43a0:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d43a4:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d43a8:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d43ac:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d43b0:	d63f0200 	blr	x16
    ffff9c6d43b4:	f100001f 	cmp	x0, #0x0
    ffff9c6d43b8:	54001480 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d43bc:	f94013e9 	ldr	x9, [sp, #32]
    ffff9c6d43c0:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d43c4:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c6d43c8:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d43cc:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d43d0:	f2e7fc89 	movk	x9, #0x3fe4, lsl #48
    ffff9c6d43d4:	f90033e9 	str	x9, [sp, #96]
    ffff9c6d43d8:	fd402be0 	ldr	d0, [sp, #80]
    ffff9c6d43dc:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d43e0:	1e610800 	fmul	d0, d0, d1
    ffff9c6d43e4:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d43e8:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d43ec:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d43f0:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d43f4:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d43f8:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d43fc:	1e613800 	fsub	d0, d0, d1
    ffff9c6d4400:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d4404:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d4408:	9e620120 	scvtf	d0, x9
    ffff9c6d440c:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d4410:	1e610800 	fmul	d0, d0, d1
    ffff9c6d4414:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d4418:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d441c:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d4420:	1e612800 	fadd	d0, d0, d1
    ffff9c6d4424:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d4428:	f94037e9 	ldr	x9, [sp, #104]
    ffff9c6d442c:	f90023e9 	str	x9, [sp, #64]
    ffff9c6d4430:	f94023e9 	ldr	x9, [sp, #64]
    ffff9c6d4434:	f90013e9 	str	x9, [sp, #32]
    ffff9c6d4438:	14000011 	b	0xffff9c6d447c
    ffff9c6d443c:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d4440:	d28b0702 	mov	x2, #0x5838                	// #22584
    ffff9c6d4444:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d4448:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d444c:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d4450:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d4454:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d4458:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d445c:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d4460:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d4464:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d4468:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d446c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d4470:	d63f0200 	blr	x16
    ffff9c6d4474:	f100001f 	cmp	x0, #0x0
    ffff9c6d4478:	54000e80 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d447c:	f94017e9 	ldr	x9, [sp, #40]
    ffff9c6d4480:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d4484:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c6d4488:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d448c:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d4490:	f2e7fc09 	movk	x9, #0x3fe0, lsl #48
    ffff9c6d4494:	f90033e9 	str	x9, [sp, #96]
    ffff9c6d4498:	fd402be0 	ldr	d0, [sp, #80]
    ffff9c6d449c:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d44a0:	1e610800 	fmul	d0, d0, d1
    ffff9c6d44a4:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d44a8:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d44ac:	f2e7fe09 	movk	x9, #0x3ff0, lsl #48
    ffff9c6d44b0:	f9003be9 	str	x9, [sp, #112]
    ffff9c6d44b4:	fd403be0 	ldr	d0, [sp, #112]
    ffff9c6d44b8:	fd4033e1 	ldr	d1, [sp, #96]
    ffff9c6d44bc:	1e613800 	fsub	d0, d0, d1
    ffff9c6d44c0:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d44c4:	f9402fe9 	ldr	x9, [sp, #88]
    ffff9c6d44c8:	9e620120 	scvtf	d0, x9
    ffff9c6d44cc:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d44d0:	1e610800 	fmul	d0, d0, d1
    ffff9c6d44d4:	fd003be0 	str	d0, [sp, #112]
    ffff9c6d44d8:	fd4037e0 	ldr	d0, [sp, #104]
    ffff9c6d44dc:	fd403be1 	ldr	d1, [sp, #112]
    ffff9c6d44e0:	1e612800 	fadd	d0, d0, d1
    ffff9c6d44e4:	fd0037e0 	str	d0, [sp, #104]
    ffff9c6d44e8:	f94037e9 	ldr	x9, [sp, #104]
    ffff9c6d44ec:	f90023e9 	str	x9, [sp, #64]
    ffff9c6d44f0:	f94023e9 	ldr	x9, [sp, #64]
    ffff9c6d44f4:	f90017e9 	str	x9, [sp, #40]
    ffff9c6d44f8:	f9401be9 	ldr	x9, [sp, #48]
    ffff9c6d44fc:	f9001fe9 	str	x9, [sp, #56]
    ffff9c6d4500:	91000529 	add	x9, x9, #0x1
    ffff9c6d4504:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d4508:	17ffff2f 	b	0xffff9c6d41c4
    ffff9c6d450c:	f94403e9 	ldr	x9, [sp, #2048]
    ffff9c6d4510:	f100013f 	cmp	x9, #0x0
    ffff9c6d4514:	54000800 	b.eq	0xffff9c6d4614  // b.none
    ffff9c6d4518:	aa1303e0 	mov	x0, x19
    ffff9c6d451c:	d2800041 	mov	x1, #0x2                   	// #2
    ffff9c6d4520:	910043e2 	add	x2, sp, #0x10
    ffff9c6d4524:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d4528:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d452c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d4530:	d63f0200 	blr	x16
    ffff9c6d4534:	aa1303e0 	mov	x0, x19
    ffff9c6d4538:	d2800061 	mov	x1, #0x3                   	// #3
    ffff9c6d453c:	910063e2 	add	x2, sp, #0x18
    ffff9c6d4540:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d4544:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d4548:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d454c:	d63f0200 	blr	x16
    ffff9c6d4550:	aa1303e0 	mov	x0, x19
    ffff9c6d4554:	d2800081 	mov	x1, #0x4                   	// #4
    ffff9c6d4558:	910083e2 	add	x2, sp, #0x20
    ffff9c6d455c:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d4560:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d4564:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d4568:	d63f0200 	blr	x16
    ffff9c6d456c:	aa1303e0 	mov	x0, x19
    ffff9c6d4570:	d28000a1 	mov	x1, #0x5                   	// #5
    ffff9c6d4574:	9100a3e2 	add	x2, sp, #0x28
    ffff9c6d4578:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d457c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d4580:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d4584:	d63f0200 	blr	x16
    ffff9c6d4588:	aa1303e0 	mov	x0, x19
    ffff9c6d458c:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff9c6d4590:	f9401be2 	ldr	x2, [sp, #48]
    ffff9c6d4594:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d4598:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d459c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d45a0:	d63f0200 	blr	x16
    ffff9c6d45a4:	aa1303e0 	mov	x0, x19
    ffff9c6d45a8:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff9c6d45ac:	f9401fe2 	ldr	x2, [sp, #56]
    ffff9c6d45b0:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d45b4:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d45b8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d45bc:	d63f0200 	blr	x16
    ffff9c6d45c0:	aa1303e0 	mov	x0, x19
    ffff9c6d45c4:	d2800101 	mov	x1, #0x8                   	// #8
    ffff9c6d45c8:	910103e2 	add	x2, sp, #0x40
    ffff9c6d45cc:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d45d0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d45d4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d45d8:	d63f0200 	blr	x16
    ffff9c6d45dc:	aa1303e0 	mov	x0, x19
    ffff9c6d45e0:	d2800141 	mov	x1, #0xa                   	// #10
    ffff9c6d45e4:	910143e2 	add	x2, sp, #0x50
    ffff9c6d45e8:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d45ec:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d45f0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d45f4:	d63f0200 	blr	x16
    ffff9c6d45f8:	aa1303e0 	mov	x0, x19
    ffff9c6d45fc:	d2800161 	mov	x1, #0xb                   	// #11
    ffff9c6d4600:	f9402fe2 	ldr	x2, [sp, #88]
    ffff9c6d4604:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d4608:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d460c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d4610:	d63f0200 	blr	x16
    ffff9c6d4614:	d2800389 	mov	x9, #0x1c                  	// #28
    ffff9c6d4618:	f9000289 	str	x9, [x20]
    ffff9c6d461c:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d4620:	d2827e10 	mov	x16, #0x13f0                	// #5104
    ffff9c6d4624:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d4628:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d462c:	d63f0200 	blr	x16
    ffff9c6d4630:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d4634:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d4638:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d463c:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d4640:	d2800020 	mov	x0, #0x1                   	// #1
    ffff9c6d4644:	d65f03c0 	ret
    ffff9c6d4648:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d464c:	d2828010 	mov	x16, #0x1400                	// #5120
    ffff9c6d4650:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d4654:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d4658:	d63f0200 	blr	x16
    ffff9c6d465c:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d4660:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d4664:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d4668:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d466c:	d2800000 	mov	x0, #0x0                   	// #0
    ffff9c6d4670:	d65f03c0 	ret
    ffff9c6d4674:	aa1303e0 	mov	x0, x19
    ffff9c6d4678:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d467c:	d28b0702 	mov	x2, #0x5838                	// #22584
    ffff9c6d4680:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d4684:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d4688:	d2826803 	mov	x3, #0x1340                	// #4928
    ffff9c6d468c:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d4690:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d4694:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d4698:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d469c:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d46a0:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d46a4:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d46a8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d46ac:	d63f0200 	blr	x16
    ffff9c6d46b0:	f100001f 	cmp	x0, #0x0
    ffff9c6d46b4:	54fffca0 	b.eq	0xffff9c6d4648  // b.none
    ffff9c6d46b8:	17fffec3 	b	0xffff9c6d41c4
