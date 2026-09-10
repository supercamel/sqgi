Dump of assembler code from 0xfffff7d2e000 to 0xfffff7d2f000:
   0x0000fffff7d2e000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7d2e004:	910003fd	mov	x29, sp
   0x0000fffff7d2e008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7d2e00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7d2e010:	d13003ff	sub	sp, sp, #0xc00
   0x0000fffff7d2e014:	aa0003f3	mov	x19, x0
   0x0000fffff7d2e018:	aa0103f4	mov	x20, x1
   0x0000fffff7d2e01c:	aa0203f5	mov	x21, x2
   0x0000fffff7d2e020:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e024:	912043e1	add	x1, sp, #0x810
   0x0000fffff7d2e028:	d2996c02	mov	x2, #0xcb60                	// #52064
   0x0000fffff7d2e02c:	f2b557a2	movk	x2, #0xaabd, lsl #16
   0x0000fffff7d2e030:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2e034:	d2910410	mov	x16, #0x8820                	// #34848
   0x0000fffff7d2e038:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2e03c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e040:	d63f0200	blr	x16
   0x0000fffff7d2e044:	f9401ea9	ldr	x9, [x21, #56]
   0x0000fffff7d2e048:	d299da0a	mov	x10, #0xced0                	// #52944
   0x0000fffff7d2e04c:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7d2e050:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7d2e054:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2e058:	54004861	b.ne	0xfffff7d2e964  // b.any
   0x0000fffff7d2e05c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7d2e060:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d2e064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d2e068:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2e06c:	540047c1	b.ne	0xfffff7d2e964  // b.any
   0x0000fffff7d2e070:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7d2e074:	f90007e9	str	x9, [sp, #8]
   0x0000fffff7d2e078:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2e07c:	f9000be9	str	x9, [sp, #16]
   0x0000fffff7d2e080:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2e084:	36d801c9	tbz	w9, #27, 0xfffff7d2e0bc
   0x0000fffff7d2e088:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e08c:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2e090:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e094:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e098:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e09c:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2e0a0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e0a4:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e0a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e0ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e0b0:	d63f0200	blr	x16
   0x0000fffff7d2e0b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e0b8:	54004560	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e0bc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2e0c0:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7d2e0c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7d2e0c8:	36d801c9	tbz	w9, #27, 0xfffff7d2e100
   0x0000fffff7d2e0cc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e0d0:	f9400fe3	ldr	x3, [sp, #24]
   0x0000fffff7d2e0d4:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2e0d8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e0dc:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e0e0:	d2800062	mov	x2, #0x3                   	// #3
   0x0000fffff7d2e0e4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e0e8:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e0ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e0f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e0f4:	d63f0200	blr	x16
   0x0000fffff7d2e0f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e0fc:	54004340	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e100:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2e104:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7d2e108:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2e10c:	5400408a	b.ge	0xfffff7d2e91c  // b.tcont
   0x0000fffff7d2e110:	d2800c29	mov	x9, #0x61                  	// #97
   0x0000fffff7d2e114:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2e118:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d2e11c:	36d801c9	tbz	w9, #27, 0xfffff7d2e154
   0x0000fffff7d2e120:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e124:	f94013e3	ldr	x3, [sp, #32]
   0x0000fffff7d2e128:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2e12c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e130:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e134:	d2800082	mov	x2, #0x4                   	// #4
   0x0000fffff7d2e138:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e13c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e140:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e148:	d63f0200	blr	x16
   0x0000fffff7d2e14c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e150:	540040a0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e154:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2e158:	d2800c2a	mov	x10, #0x61                  	// #97
   0x0000fffff7d2e15c:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d2e160:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d2e164:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2e168:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7d2e16c:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2e170:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2e174:	36d801c9	tbz	w9, #27, 0xfffff7d2e1ac
   0x0000fffff7d2e178:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e17c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2e180:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2e184:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e188:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e18c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2e190:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e194:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e198:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e19c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e1a0:	d63f0200	blr	x16
   0x0000fffff7d2e1a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e1a8:	54003de0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e1ac:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2e1b0:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7d2e1b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d2e1b8:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2e1bc:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2e1c0:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2e1c4:	aa1503e0	mov	x0, x21
   0x0000fffff7d2e1c8:	d2962901	mov	x1, #0xb148                	// #45384
   0x0000fffff7d2e1cc:	f2b55821	movk	x1, #0xaac1, lsl #16
   0x0000fffff7d2e1d0:	f2d55541	movk	x1, #0xaaaa, lsl #32
   0x0000fffff7d2e1d4:	d295ea10	mov	x16, #0xaf50                	// #44880
   0x0000fffff7d2e1d8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2e1dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e1e0:	d63f0200	blr	x16
   0x0000fffff7d2e1e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e1e8:	54003be0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e1ec:	f94017e0	ldr	x0, [sp, #40]
   0x0000fffff7d2e1f0:	910083e1	add	x1, sp, #0x20
   0x0000fffff7d2e1f4:	d2959210	mov	x16, #0xac90                	// #44176
   0x0000fffff7d2e1f8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2e1fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e200:	d63f0200	blr	x16
   0x0000fffff7d2e204:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e208:	54003ae0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e20c:	d2828f69	mov	x9, #0x147b                	// #5243
   0x0000fffff7d2e210:	f2a8f5c9	movk	x9, #0x47ae, lsl #16
   0x0000fffff7d2e214:	f2cf5c29	movk	x9, #0x7ae1, lsl #32
   0x0000fffff7d2e218:	f2e7f089	movk	x9, #0x3f84, lsl #48
   0x0000fffff7d2e21c:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2e220:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2e224:	36d801c9	tbz	w9, #27, 0xfffff7d2e25c
   0x0000fffff7d2e228:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e22c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2e230:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e234:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e238:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e23c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2e240:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e244:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e248:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e24c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e250:	d63f0200	blr	x16
   0x0000fffff7d2e254:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e258:	54003860	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e25c:	fd4013e0	ldr	d0, [sp, #32]
   0x0000fffff7d2e260:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2e264:	1e610800	fmul	d0, d0, d1
   0x0000fffff7d2e268:	fd0013e0	str	d0, [sp, #32]
   0x0000fffff7d2e26c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d2e270:	36d801c9	tbz	w9, #27, 0xfffff7d2e2a8
   0x0000fffff7d2e274:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e278:	f94013e3	ldr	x3, [sp, #32]
   0x0000fffff7d2e27c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e280:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e284:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e288:	d2800082	mov	x2, #0x4                   	// #4
   0x0000fffff7d2e28c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e290:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e294:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e29c:	d63f0200	blr	x16
   0x0000fffff7d2e2a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e2a4:	54003600	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e2a8:	aa1303e0	mov	x0, x19
   0x0000fffff7d2e2ac:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2e2b0:	d2962d02	mov	x2, #0xb168                	// #45416
   0x0000fffff7d2e2b4:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2e2b8:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2e2bc:	d2945603	mov	x3, #0xa2b0                	// #41648
   0x0000fffff7d2e2c0:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2e2c4:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2e2c8:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2e2cc:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2e2d0:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2e2d4:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2e2d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e2dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e2e0:	d63f0200	blr	x16
   0x0000fffff7d2e2e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e2e8:	540033e0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e2ec:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2e2f0:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2e2f4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2e2f8:	36d801c9	tbz	w9, #27, 0xfffff7d2e330
   0x0000fffff7d2e2fc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e300:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2e304:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e308:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e30c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e310:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2e314:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e318:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e31c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e320:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e324:	d63f0200	blr	x16
   0x0000fffff7d2e328:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e32c:	540031c0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e330:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2e334:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2e338:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2e33c:	d295ce10	mov	x16, #0xae70                	// #44656
   0x0000fffff7d2e340:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2e344:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e348:	d63f0200	blr	x16
   0x0000fffff7d2e34c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2e350:	aa1303e0	mov	x0, x19
   0x0000fffff7d2e354:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2e358:	d2962f02	mov	x2, #0xb178                	// #45432
   0x0000fffff7d2e35c:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2e360:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2e364:	d2960403	mov	x3, #0xb020                	// #45088
   0x0000fffff7d2e368:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2e36c:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2e370:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2e374:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2e378:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2e37c:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2e380:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e384:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e388:	d63f0200	blr	x16
   0x0000fffff7d2e38c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e390:	54002ea0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e394:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2e398:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2e39c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2e3a0:	36d801c9	tbz	w9, #27, 0xfffff7d2e3d8
   0x0000fffff7d2e3a4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e3a8:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2e3ac:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e3b0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e3b4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e3b8:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2e3bc:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e3c0:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e3c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e3c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e3cc:	d63f0200	blr	x16
   0x0000fffff7d2e3d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e3d4:	54002c80	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e3d8:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2e3dc:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2e3e0:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2e3e4:	d295be10	mov	x16, #0xadf0                	// #44528
   0x0000fffff7d2e3e8:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2e3ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e3f0:	d63f0200	blr	x16
   0x0000fffff7d2e3f4:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2e3f8:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2e3fc:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2e400:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2e404:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2e408:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2e40c:	36d801c9	tbz	w9, #27, 0xfffff7d2e444
   0x0000fffff7d2e410:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e414:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2e418:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e41c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e420:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e424:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2e428:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e42c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e430:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e438:	d63f0200	blr	x16
   0x0000fffff7d2e43c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e440:	54002920	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e444:	aa1303e0	mov	x0, x19
   0x0000fffff7d2e448:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2e44c:	d2963102	mov	x2, #0xb188                	// #45448
   0x0000fffff7d2e450:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2e454:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2e458:	d297d003	mov	x3, #0xbe80                	// #48768
   0x0000fffff7d2e45c:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2e460:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2e464:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2e468:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2e46c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2e470:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2e474:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e47c:	d63f0200	blr	x16
   0x0000fffff7d2e480:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e484:	54002700	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e488:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2e48c:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2e490:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2e494:	36d801c9	tbz	w9, #27, 0xfffff7d2e4cc
   0x0000fffff7d2e498:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e49c:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2e4a0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e4a4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e4a8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e4ac:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2e4b0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e4b4:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e4b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e4bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e4c0:	d63f0200	blr	x16
   0x0000fffff7d2e4c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e4c8:	540024e0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e4cc:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2e4d0:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2e4d4:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2e4d8:	d295ae10	mov	x16, #0xad70                	// #44400
   0x0000fffff7d2e4dc:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2e4e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e4e4:	d63f0200	blr	x16
   0x0000fffff7d2e4e8:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2e4ec:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2e4f0:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2e4f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2e4f8:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2e4fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2e500:	36d801c9	tbz	w9, #27, 0xfffff7d2e538
   0x0000fffff7d2e504:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e508:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2e50c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e510:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e514:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e518:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2e51c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e520:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e524:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e528:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e52c:	d63f0200	blr	x16
   0x0000fffff7d2e530:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e534:	54002180	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e538:	aa1303e0	mov	x0, x19
   0x0000fffff7d2e53c:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2e540:	d2963302	mov	x2, #0xb198                	// #45464
   0x0000fffff7d2e544:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2e548:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2e54c:	d295aa03	mov	x3, #0xad50                	// #44368
   0x0000fffff7d2e550:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2e554:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2e558:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2e55c:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2e560:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2e564:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2e568:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e56c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e570:	d63f0200	blr	x16
   0x0000fffff7d2e574:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e578:	54001f60	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e57c:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2e580:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2e584:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2e588:	36d801c9	tbz	w9, #27, 0xfffff7d2e5c0
   0x0000fffff7d2e58c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e590:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2e594:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e598:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e59c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e5a0:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2e5a4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e5a8:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e5ac:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e5b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e5b4:	d63f0200	blr	x16
   0x0000fffff7d2e5b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e5bc:	54001d40	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e5c0:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2e5c4:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2e5c8:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2e5cc:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7d2e5d0:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2e5d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e5d8:	d63f0200	blr	x16
   0x0000fffff7d2e5dc:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2e5e0:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2e5e4:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2e5e8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2e5ec:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2e5f0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2e5f4:	36d801c9	tbz	w9, #27, 0xfffff7d2e62c
   0x0000fffff7d2e5f8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e5fc:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2e600:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e604:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e608:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e60c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2e610:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e614:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e618:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e61c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e620:	d63f0200	blr	x16
   0x0000fffff7d2e624:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e628:	540019e0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e62c:	aa1303e0	mov	x0, x19
   0x0000fffff7d2e630:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2e634:	d2963502	mov	x2, #0xb1a8                	// #45480
   0x0000fffff7d2e638:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2e63c:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2e640:	d2995a03	mov	x3, #0xcad0                	// #51920
   0x0000fffff7d2e644:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2e648:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2e64c:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2e650:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2e654:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2e658:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2e65c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e660:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e664:	d63f0200	blr	x16
   0x0000fffff7d2e668:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e66c:	540017c0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e670:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2e674:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2e678:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2e67c:	36d801c9	tbz	w9, #27, 0xfffff7d2e6b4
   0x0000fffff7d2e680:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e684:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2e688:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e68c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e690:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e694:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2e698:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e69c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e6a0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e6a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e6a8:	d63f0200	blr	x16
   0x0000fffff7d2e6ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e6b0:	540015a0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e6b4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2e6b8:	f2e7fd09	movk	x9, #0x3fe8, lsl #48
   0x0000fffff7d2e6bc:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7d2e6c0:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d2e6c4:	36d801c9	tbz	w9, #27, 0xfffff7d2e6fc
   0x0000fffff7d2e6c8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e6cc:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7d2e6d0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e6d4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e6d8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e6dc:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7d2e6e0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e6e4:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e6e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e6ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e6f0:	d63f0200	blr	x16
   0x0000fffff7d2e6f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e6f8:	54001360	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e6fc:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2e700:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2e704:	fd4027e0	ldr	d0, [sp, #72]
   0x0000fffff7d2e708:	fd0407e0	str	d0, [sp, #2056]
   0x0000fffff7d2e70c:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2e710:	fd4407e1	ldr	d1, [sp, #2056]
   0x0000fffff7d2e714:	d2950810	mov	x16, #0xa840                	// #43072
   0x0000fffff7d2e718:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2e71c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e720:	d63f0200	blr	x16
   0x0000fffff7d2e724:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2e728:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2e72c:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2e730:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2e734:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2e738:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2e73c:	36d801c9	tbz	w9, #27, 0xfffff7d2e774
   0x0000fffff7d2e740:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e744:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2e748:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e74c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e750:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e754:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2e758:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e75c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e760:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e764:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e768:	d63f0200	blr	x16
   0x0000fffff7d2e76c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e770:	54000fa0	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e774:	aa1303e0	mov	x0, x19
   0x0000fffff7d2e778:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2e77c:	d2963902	mov	x2, #0xb1c8                	// #45512
   0x0000fffff7d2e780:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2e784:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2e788:	d2969e03	mov	x3, #0xb4f0                	// #46320
   0x0000fffff7d2e78c:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7d2e790:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2e794:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2e798:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2e79c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2e7a0:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2e7a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e7a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e7ac:	d63f0200	blr	x16
   0x0000fffff7d2e7b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e7b4:	54000d80	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e7b8:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2e7bc:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2e7c0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2e7c4:	36d801c9	tbz	w9, #27, 0xfffff7d2e7fc
   0x0000fffff7d2e7c8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e7cc:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2e7d0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e7d4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e7d8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e7dc:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2e7e0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e7e4:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e7e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e7ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e7f0:	d63f0200	blr	x16
   0x0000fffff7d2e7f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e7f8:	54000b60	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e7fc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2e800:	f2e7fe49	movk	x9, #0x3ff2, lsl #48
   0x0000fffff7d2e804:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7d2e808:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d2e80c:	36d801c9	tbz	w9, #27, 0xfffff7d2e844
   0x0000fffff7d2e810:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e814:	f94027e3	ldr	x3, [sp, #72]
   0x0000fffff7d2e818:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e81c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e820:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e824:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7d2e828:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e82c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e830:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e838:	d63f0200	blr	x16
   0x0000fffff7d2e83c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e840:	54000920	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e844:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2e848:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2e84c:	fd4027e0	ldr	d0, [sp, #72]
   0x0000fffff7d2e850:	fd0407e0	str	d0, [sp, #2056]
   0x0000fffff7d2e854:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2e858:	fd4407e1	ldr	d1, [sp, #2056]
   0x0000fffff7d2e85c:	d294e610	mov	x16, #0xa730                	// #42800
   0x0000fffff7d2e860:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2e864:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e868:	d63f0200	blr	x16
   0x0000fffff7d2e86c:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2e870:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2e874:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2e878:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2e87c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2e880:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2e884:	36d801c9	tbz	w9, #27, 0xfffff7d2e8bc
   0x0000fffff7d2e888:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e88c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2e890:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e894:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e898:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e89c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2e8a0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e8a4:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e8a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e8ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e8b0:	d63f0200	blr	x16
   0x0000fffff7d2e8b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e8b8:	54000560	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e8bc:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2e8c0:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2e8c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2e8c8:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2e8cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2e8d0:	36d801c9	tbz	w9, #27, 0xfffff7d2e908
   0x0000fffff7d2e8d4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e8d8:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2e8dc:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2e8e0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2e8e4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2e8e8:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2e8ec:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2e8f0:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2e8f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e8f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e8fc:	d63f0200	blr	x16
   0x0000fffff7d2e900:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2e904:	54000300	b.eq	0xfffff7d2e964  // b.none
   0x0000fffff7d2e908:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2e90c:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2e910:	91000529	add	x9, x9, #0x1
   0x0000fffff7d2e914:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7d2e918:	17fffdfa	b	0xfffff7d2e100
   0x0000fffff7d2e91c:	52800089	mov	w9, #0x4                   	// #4
   0x0000fffff7d2e920:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7d2e924:	b9000289	str	w9, [x20]
   0x0000fffff7d2e928:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2e92c:	f900068a	str	x10, [x20, #8]
   0x0000fffff7d2e930:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2e934:	fd000680	str	d0, [x20, #8]
   0x0000fffff7d2e938:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e93c:	d284be10	mov	x16, #0x25f0                	// #9712
   0x0000fffff7d2e940:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e944:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e948:	d63f0200	blr	x16
   0x0000fffff7d2e94c:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2e950:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2e954:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2e958:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2e95c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d2e960:	d65f03c0	ret
   0x0000fffff7d2e964:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2e968:	d284c010	mov	x16, #0x2600                	// #9728
   0x0000fffff7d2e96c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2e970:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2e974:	d63f0200	blr	x16
   0x0000fffff7d2e978:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2e97c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2e980:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2e984:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2e988:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7d2e98c:	d65f03c0	ret
   0x0000fffff7d2e990:	00000000	udf	#0
   0x0000fffff7d2e994:	00000000	udf	#0
   0x0000fffff7d2e998:	00000000	udf	#0
   0x0000fffff7d2e99c:	00000000	udf	#0
   0x0000fffff7d2e9a0:	00000000	udf	#0
   0x0000fffff7d2e9a4:	00000000	udf	#0
   0x0000fffff7d2e9a8:	00000000	udf	#0
   0x0000fffff7d2e9ac:	00000000	udf	#0
   0x0000fffff7d2e9b0:	00000000	udf	#0
   0x0000fffff7d2e9b4:	00000000	udf	#0
   0x0000fffff7d2e9b8:	00000000	udf	#0
   0x0000fffff7d2e9bc:	00000000	udf	#0
   0x0000fffff7d2e9c0:	00000000	udf	#0
   0x0000fffff7d2e9c4:	00000000	udf	#0
   0x0000fffff7d2e9c8:	00000000	udf	#0
   0x0000fffff7d2e9cc:	00000000	udf	#0
   0x0000fffff7d2e9d0:	00000000	udf	#0
   0x0000fffff7d2e9d4:	00000000	udf	#0
   0x0000fffff7d2e9d8:	00000000	udf	#0
   0x0000fffff7d2e9dc:	00000000	udf	#0
   0x0000fffff7d2e9e0:	00000000	udf	#0
   0x0000fffff7d2e9e4:	00000000	udf	#0
   0x0000fffff7d2e9e8:	00000000	udf	#0
   0x0000fffff7d2e9ec:	00000000	udf	#0
   0x0000fffff7d2e9f0:	00000000	udf	#0
   0x0000fffff7d2e9f4:	00000000	udf	#0
   0x0000fffff7d2e9f8:	00000000	udf	#0
   0x0000fffff7d2e9fc:	00000000	udf	#0
   0x0000fffff7d2ea00:	00000000	udf	#0
   0x0000fffff7d2ea04:	00000000	udf	#0
   0x0000fffff7d2ea08:	00000000	udf	#0
   0x0000fffff7d2ea0c:	00000000	udf	#0
   0x0000fffff7d2ea10:	00000000	udf	#0
   0x0000fffff7d2ea14:	00000000	udf	#0
   0x0000fffff7d2ea18:	00000000	udf	#0
   0x0000fffff7d2ea1c:	00000000	udf	#0
   0x0000fffff7d2ea20:	00000000	udf	#0
   0x0000fffff7d2ea24:	00000000	udf	#0
   0x0000fffff7d2ea28:	00000000	udf	#0
   0x0000fffff7d2ea2c:	00000000	udf	#0
   0x0000fffff7d2ea30:	00000000	udf	#0
   0x0000fffff7d2ea34:	00000000	udf	#0
   0x0000fffff7d2ea38:	00000000	udf	#0
   0x0000fffff7d2ea3c:	00000000	udf	#0
   0x0000fffff7d2ea40:	00000000	udf	#0
   0x0000fffff7d2ea44:	00000000	udf	#0
   0x0000fffff7d2ea48:	00000000	udf	#0
   0x0000fffff7d2ea4c:	00000000	udf	#0
   0x0000fffff7d2ea50:	00000000	udf	#0
   0x0000fffff7d2ea54:	00000000	udf	#0
   0x0000fffff7d2ea58:	00000000	udf	#0
   0x0000fffff7d2ea5c:	00000000	udf	#0
   0x0000fffff7d2ea60:	00000000	udf	#0
   0x0000fffff7d2ea64:	00000000	udf	#0
   0x0000fffff7d2ea68:	00000000	udf	#0
   0x0000fffff7d2ea6c:	00000000	udf	#0
   0x0000fffff7d2ea70:	00000000	udf	#0
   0x0000fffff7d2ea74:	00000000	udf	#0
   0x0000fffff7d2ea78:	00000000	udf	#0
   0x0000fffff7d2ea7c:	00000000	udf	#0
   0x0000fffff7d2ea80:	00000000	udf	#0
   0x0000fffff7d2ea84:	00000000	udf	#0
   0x0000fffff7d2ea88:	00000000	udf	#0
   0x0000fffff7d2ea8c:	00000000	udf	#0
   0x0000fffff7d2ea90:	00000000	udf	#0
   0x0000fffff7d2ea94:	00000000	udf	#0
   0x0000fffff7d2ea98:	00000000	udf	#0
   0x0000fffff7d2ea9c:	00000000	udf	#0
   0x0000fffff7d2eaa0:	00000000	udf	#0
   0x0000fffff7d2eaa4:	00000000	udf	#0
   0x0000fffff7d2eaa8:	00000000	udf	#0
   0x0000fffff7d2eaac:	00000000	udf	#0
   0x0000fffff7d2eab0:	00000000	udf	#0
   0x0000fffff7d2eab4:	00000000	udf	#0
   0x0000fffff7d2eab8:	00000000	udf	#0
   0x0000fffff7d2eabc:	00000000	udf	#0
   0x0000fffff7d2eac0:	00000000	udf	#0
   0x0000fffff7d2eac4:	00000000	udf	#0
   0x0000fffff7d2eac8:	00000000	udf	#0
   0x0000fffff7d2eacc:	00000000	udf	#0
   0x0000fffff7d2ead0:	00000000	udf	#0
   0x0000fffff7d2ead4:	00000000	udf	#0
   0x0000fffff7d2ead8:	00000000	udf	#0
   0x0000fffff7d2eadc:	00000000	udf	#0
   0x0000fffff7d2eae0:	00000000	udf	#0
   0x0000fffff7d2eae4:	00000000	udf	#0
   0x0000fffff7d2eae8:	00000000	udf	#0
   0x0000fffff7d2eaec:	00000000	udf	#0
   0x0000fffff7d2eaf0:	00000000	udf	#0
   0x0000fffff7d2eaf4:	00000000	udf	#0
   0x0000fffff7d2eaf8:	00000000	udf	#0
   0x0000fffff7d2eafc:	00000000	udf	#0
   0x0000fffff7d2eb00:	00000000	udf	#0
   0x0000fffff7d2eb04:	00000000	udf	#0
   0x0000fffff7d2eb08:	00000000	udf	#0
   0x0000fffff7d2eb0c:	00000000	udf	#0
   0x0000fffff7d2eb10:	00000000	udf	#0
   0x0000fffff7d2eb14:	00000000	udf	#0
   0x0000fffff7d2eb18:	00000000	udf	#0
   0x0000fffff7d2eb1c:	00000000	udf	#0
   0x0000fffff7d2eb20:	00000000	udf	#0
   0x0000fffff7d2eb24:	00000000	udf	#0
   0x0000fffff7d2eb28:	00000000	udf	#0
   0x0000fffff7d2eb2c:	00000000	udf	#0
   0x0000fffff7d2eb30:	00000000	udf	#0
   0x0000fffff7d2eb34:	00000000	udf	#0
   0x0000fffff7d2eb38:	00000000	udf	#0
   0x0000fffff7d2eb3c:	00000000	udf	#0
   0x0000fffff7d2eb40:	00000000	udf	#0
   0x0000fffff7d2eb44:	00000000	udf	#0
   0x0000fffff7d2eb48:	00000000	udf	#0
   0x0000fffff7d2eb4c:	00000000	udf	#0
   0x0000fffff7d2eb50:	00000000	udf	#0
   0x0000fffff7d2eb54:	00000000	udf	#0
   0x0000fffff7d2eb58:	00000000	udf	#0
   0x0000fffff7d2eb5c:	00000000	udf	#0
   0x0000fffff7d2eb60:	00000000	udf	#0
   0x0000fffff7d2eb64:	00000000	udf	#0
   0x0000fffff7d2eb68:	00000000	udf	#0
   0x0000fffff7d2eb6c:	00000000	udf	#0
   0x0000fffff7d2eb70:	00000000	udf	#0
   0x0000fffff7d2eb74:	00000000	udf	#0
   0x0000fffff7d2eb78:	00000000	udf	#0
   0x0000fffff7d2eb7c:	00000000	udf	#0
   0x0000fffff7d2eb80:	00000000	udf	#0
   0x0000fffff7d2eb84:	00000000	udf	#0
   0x0000fffff7d2eb88:	00000000	udf	#0
   0x0000fffff7d2eb8c:	00000000	udf	#0
   0x0000fffff7d2eb90:	00000000	udf	#0
   0x0000fffff7d2eb94:	00000000	udf	#0
   0x0000fffff7d2eb98:	00000000	udf	#0
   0x0000fffff7d2eb9c:	00000000	udf	#0
   0x0000fffff7d2eba0:	00000000	udf	#0
   0x0000fffff7d2eba4:	00000000	udf	#0
   0x0000fffff7d2eba8:	00000000	udf	#0
   0x0000fffff7d2ebac:	00000000	udf	#0
   0x0000fffff7d2ebb0:	00000000	udf	#0
   0x0000fffff7d2ebb4:	00000000	udf	#0
   0x0000fffff7d2ebb8:	00000000	udf	#0
   0x0000fffff7d2ebbc:	00000000	udf	#0
   0x0000fffff7d2ebc0:	00000000	udf	#0
   0x0000fffff7d2ebc4:	00000000	udf	#0
   0x0000fffff7d2ebc8:	00000000	udf	#0
   0x0000fffff7d2ebcc:	00000000	udf	#0
   0x0000fffff7d2ebd0:	00000000	udf	#0
   0x0000fffff7d2ebd4:	00000000	udf	#0
   0x0000fffff7d2ebd8:	00000000	udf	#0
   0x0000fffff7d2ebdc:	00000000	udf	#0
   0x0000fffff7d2ebe0:	00000000	udf	#0
   0x0000fffff7d2ebe4:	00000000	udf	#0
   0x0000fffff7d2ebe8:	00000000	udf	#0
   0x0000fffff7d2ebec:	00000000	udf	#0
   0x0000fffff7d2ebf0:	00000000	udf	#0
   0x0000fffff7d2ebf4:	00000000	udf	#0
   0x0000fffff7d2ebf8:	00000000	udf	#0
   0x0000fffff7d2ebfc:	00000000	udf	#0
   0x0000fffff7d2ec00:	00000000	udf	#0
   0x0000fffff7d2ec04:	00000000	udf	#0
   0x0000fffff7d2ec08:	00000000	udf	#0
   0x0000fffff7d2ec0c:	00000000	udf	#0
   0x0000fffff7d2ec10:	00000000	udf	#0
   0x0000fffff7d2ec14:	00000000	udf	#0
   0x0000fffff7d2ec18:	00000000	udf	#0
   0x0000fffff7d2ec1c:	00000000	udf	#0
   0x0000fffff7d2ec20:	00000000	udf	#0
   0x0000fffff7d2ec24:	00000000	udf	#0
   0x0000fffff7d2ec28:	00000000	udf	#0
   0x0000fffff7d2ec2c:	00000000	udf	#0
   0x0000fffff7d2ec30:	00000000	udf	#0
   0x0000fffff7d2ec34:	00000000	udf	#0
   0x0000fffff7d2ec38:	00000000	udf	#0
   0x0000fffff7d2ec3c:	00000000	udf	#0
   0x0000fffff7d2ec40:	00000000	udf	#0
   0x0000fffff7d2ec44:	00000000	udf	#0
   0x0000fffff7d2ec48:	00000000	udf	#0
   0x0000fffff7d2ec4c:	00000000	udf	#0
   0x0000fffff7d2ec50:	00000000	udf	#0
   0x0000fffff7d2ec54:	00000000	udf	#0
   0x0000fffff7d2ec58:	00000000	udf	#0
   0x0000fffff7d2ec5c:	00000000	udf	#0
   0x0000fffff7d2ec60:	00000000	udf	#0
   0x0000fffff7d2ec64:	00000000	udf	#0
   0x0000fffff7d2ec68:	00000000	udf	#0
   0x0000fffff7d2ec6c:	00000000	udf	#0
   0x0000fffff7d2ec70:	00000000	udf	#0
   0x0000fffff7d2ec74:	00000000	udf	#0
   0x0000fffff7d2ec78:	00000000	udf	#0
   0x0000fffff7d2ec7c:	00000000	udf	#0
   0x0000fffff7d2ec80:	00000000	udf	#0
   0x0000fffff7d2ec84:	00000000	udf	#0
   0x0000fffff7d2ec88:	00000000	udf	#0
   0x0000fffff7d2ec8c:	00000000	udf	#0
   0x0000fffff7d2ec90:	00000000	udf	#0
   0x0000fffff7d2ec94:	00000000	udf	#0
   0x0000fffff7d2ec98:	00000000	udf	#0
   0x0000fffff7d2ec9c:	00000000	udf	#0
   0x0000fffff7d2eca0:	00000000	udf	#0
   0x0000fffff7d2eca4:	00000000	udf	#0
   0x0000fffff7d2eca8:	00000000	udf	#0
   0x0000fffff7d2ecac:	00000000	udf	#0
   0x0000fffff7d2ecb0:	00000000	udf	#0
   0x0000fffff7d2ecb4:	00000000	udf	#0
   0x0000fffff7d2ecb8:	00000000	udf	#0
   0x0000fffff7d2ecbc:	00000000	udf	#0
   0x0000fffff7d2ecc0:	00000000	udf	#0
   0x0000fffff7d2ecc4:	00000000	udf	#0
   0x0000fffff7d2ecc8:	00000000	udf	#0
   0x0000fffff7d2eccc:	00000000	udf	#0
   0x0000fffff7d2ecd0:	00000000	udf	#0
   0x0000fffff7d2ecd4:	00000000	udf	#0
   0x0000fffff7d2ecd8:	00000000	udf	#0
   0x0000fffff7d2ecdc:	00000000	udf	#0
   0x0000fffff7d2ece0:	00000000	udf	#0
   0x0000fffff7d2ece4:	00000000	udf	#0
   0x0000fffff7d2ece8:	00000000	udf	#0
   0x0000fffff7d2ecec:	00000000	udf	#0
   0x0000fffff7d2ecf0:	00000000	udf	#0
   0x0000fffff7d2ecf4:	00000000	udf	#0
   0x0000fffff7d2ecf8:	00000000	udf	#0
   0x0000fffff7d2ecfc:	00000000	udf	#0
   0x0000fffff7d2ed00:	00000000	udf	#0
   0x0000fffff7d2ed04:	00000000	udf	#0
   0x0000fffff7d2ed08:	00000000	udf	#0
   0x0000fffff7d2ed0c:	00000000	udf	#0
   0x0000fffff7d2ed10:	00000000	udf	#0
   0x0000fffff7d2ed14:	00000000	udf	#0
   0x0000fffff7d2ed18:	00000000	udf	#0
   0x0000fffff7d2ed1c:	00000000	udf	#0
   0x0000fffff7d2ed20:	00000000	udf	#0
   0x0000fffff7d2ed24:	00000000	udf	#0
   0x0000fffff7d2ed28:	00000000	udf	#0
   0x0000fffff7d2ed2c:	00000000	udf	#0
   0x0000fffff7d2ed30:	00000000	udf	#0
   0x0000fffff7d2ed34:	00000000	udf	#0
   0x0000fffff7d2ed38:	00000000	udf	#0
   0x0000fffff7d2ed3c:	00000000	udf	#0
   0x0000fffff7d2ed40:	00000000	udf	#0
   0x0000fffff7d2ed44:	00000000	udf	#0
   0x0000fffff7d2ed48:	00000000	udf	#0
   0x0000fffff7d2ed4c:	00000000	udf	#0
   0x0000fffff7d2ed50:	00000000	udf	#0
   0x0000fffff7d2ed54:	00000000	udf	#0
   0x0000fffff7d2ed58:	00000000	udf	#0
   0x0000fffff7d2ed5c:	00000000	udf	#0
   0x0000fffff7d2ed60:	00000000	udf	#0
   0x0000fffff7d2ed64:	00000000	udf	#0
   0x0000fffff7d2ed68:	00000000	udf	#0
   0x0000fffff7d2ed6c:	00000000	udf	#0
   0x0000fffff7d2ed70:	00000000	udf	#0
   0x0000fffff7d2ed74:	00000000	udf	#0
   0x0000fffff7d2ed78:	00000000	udf	#0
   0x0000fffff7d2ed7c:	00000000	udf	#0
   0x0000fffff7d2ed80:	00000000	udf	#0
   0x0000fffff7d2ed84:	00000000	udf	#0
   0x0000fffff7d2ed88:	00000000	udf	#0
   0x0000fffff7d2ed8c:	00000000	udf	#0
   0x0000fffff7d2ed90:	00000000	udf	#0
   0x0000fffff7d2ed94:	00000000	udf	#0
   0x0000fffff7d2ed98:	00000000	udf	#0
   0x0000fffff7d2ed9c:	00000000	udf	#0
   0x0000fffff7d2eda0:	00000000	udf	#0
   0x0000fffff7d2eda4:	00000000	udf	#0
   0x0000fffff7d2eda8:	00000000	udf	#0
   0x0000fffff7d2edac:	00000000	udf	#0
   0x0000fffff7d2edb0:	00000000	udf	#0
   0x0000fffff7d2edb4:	00000000	udf	#0
   0x0000fffff7d2edb8:	00000000	udf	#0
   0x0000fffff7d2edbc:	00000000	udf	#0
   0x0000fffff7d2edc0:	00000000	udf	#0
   0x0000fffff7d2edc4:	00000000	udf	#0
   0x0000fffff7d2edc8:	00000000	udf	#0
   0x0000fffff7d2edcc:	00000000	udf	#0
   0x0000fffff7d2edd0:	00000000	udf	#0
   0x0000fffff7d2edd4:	00000000	udf	#0
   0x0000fffff7d2edd8:	00000000	udf	#0
   0x0000fffff7d2eddc:	00000000	udf	#0
   0x0000fffff7d2ede0:	00000000	udf	#0
   0x0000fffff7d2ede4:	00000000	udf	#0
   0x0000fffff7d2ede8:	00000000	udf	#0
   0x0000fffff7d2edec:	00000000	udf	#0
   0x0000fffff7d2edf0:	00000000	udf	#0
   0x0000fffff7d2edf4:	00000000	udf	#0
   0x0000fffff7d2edf8:	00000000	udf	#0
   0x0000fffff7d2edfc:	00000000	udf	#0
   0x0000fffff7d2ee00:	00000000	udf	#0
   0x0000fffff7d2ee04:	00000000	udf	#0
   0x0000fffff7d2ee08:	00000000	udf	#0
   0x0000fffff7d2ee0c:	00000000	udf	#0
   0x0000fffff7d2ee10:	00000000	udf	#0
   0x0000fffff7d2ee14:	00000000	udf	#0
   0x0000fffff7d2ee18:	00000000	udf	#0
   0x0000fffff7d2ee1c:	00000000	udf	#0
   0x0000fffff7d2ee20:	00000000	udf	#0
   0x0000fffff7d2ee24:	00000000	udf	#0
   0x0000fffff7d2ee28:	00000000	udf	#0
   0x0000fffff7d2ee2c:	00000000	udf	#0
   0x0000fffff7d2ee30:	00000000	udf	#0
   0x0000fffff7d2ee34:	00000000	udf	#0
   0x0000fffff7d2ee38:	00000000	udf	#0
   0x0000fffff7d2ee3c:	00000000	udf	#0
   0x0000fffff7d2ee40:	00000000	udf	#0
   0x0000fffff7d2ee44:	00000000	udf	#0
   0x0000fffff7d2ee48:	00000000	udf	#0
   0x0000fffff7d2ee4c:	00000000	udf	#0
   0x0000fffff7d2ee50:	00000000	udf	#0
   0x0000fffff7d2ee54:	00000000	udf	#0
   0x0000fffff7d2ee58:	00000000	udf	#0
   0x0000fffff7d2ee5c:	00000000	udf	#0
   0x0000fffff7d2ee60:	00000000	udf	#0
   0x0000fffff7d2ee64:	00000000	udf	#0
   0x0000fffff7d2ee68:	00000000	udf	#0
   0x0000fffff7d2ee6c:	00000000	udf	#0
   0x0000fffff7d2ee70:	00000000	udf	#0
   0x0000fffff7d2ee74:	00000000	udf	#0
   0x0000fffff7d2ee78:	00000000	udf	#0
   0x0000fffff7d2ee7c:	00000000	udf	#0
   0x0000fffff7d2ee80:	00000000	udf	#0
   0x0000fffff7d2ee84:	00000000	udf	#0
   0x0000fffff7d2ee88:	00000000	udf	#0
   0x0000fffff7d2ee8c:	00000000	udf	#0
   0x0000fffff7d2ee90:	00000000	udf	#0
   0x0000fffff7d2ee94:	00000000	udf	#0
   0x0000fffff7d2ee98:	00000000	udf	#0
   0x0000fffff7d2ee9c:	00000000	udf	#0
   0x0000fffff7d2eea0:	00000000	udf	#0
   0x0000fffff7d2eea4:	00000000	udf	#0
   0x0000fffff7d2eea8:	00000000	udf	#0
   0x0000fffff7d2eeac:	00000000	udf	#0
   0x0000fffff7d2eeb0:	00000000	udf	#0
   0x0000fffff7d2eeb4:	00000000	udf	#0
   0x0000fffff7d2eeb8:	00000000	udf	#0
   0x0000fffff7d2eebc:	00000000	udf	#0
   0x0000fffff7d2eec0:	00000000	udf	#0
   0x0000fffff7d2eec4:	00000000	udf	#0
   0x0000fffff7d2eec8:	00000000	udf	#0
   0x0000fffff7d2eecc:	00000000	udf	#0
   0x0000fffff7d2eed0:	00000000	udf	#0
   0x0000fffff7d2eed4:	00000000	udf	#0
   0x0000fffff7d2eed8:	00000000	udf	#0
   0x0000fffff7d2eedc:	00000000	udf	#0
   0x0000fffff7d2eee0:	00000000	udf	#0
   0x0000fffff7d2eee4:	00000000	udf	#0
   0x0000fffff7d2eee8:	00000000	udf	#0
   0x0000fffff7d2eeec:	00000000	udf	#0
   0x0000fffff7d2eef0:	00000000	udf	#0
   0x0000fffff7d2eef4:	00000000	udf	#0
   0x0000fffff7d2eef8:	00000000	udf	#0
   0x0000fffff7d2eefc:	00000000	udf	#0
   0x0000fffff7d2ef00:	00000000	udf	#0
   0x0000fffff7d2ef04:	00000000	udf	#0
   0x0000fffff7d2ef08:	00000000	udf	#0
   0x0000fffff7d2ef0c:	00000000	udf	#0
   0x0000fffff7d2ef10:	00000000	udf	#0
   0x0000fffff7d2ef14:	00000000	udf	#0
   0x0000fffff7d2ef18:	00000000	udf	#0
   0x0000fffff7d2ef1c:	00000000	udf	#0
   0x0000fffff7d2ef20:	00000000	udf	#0
   0x0000fffff7d2ef24:	00000000	udf	#0
   0x0000fffff7d2ef28:	00000000	udf	#0
   0x0000fffff7d2ef2c:	00000000	udf	#0
   0x0000fffff7d2ef30:	00000000	udf	#0
   0x0000fffff7d2ef34:	00000000	udf	#0
   0x0000fffff7d2ef38:	00000000	udf	#0
   0x0000fffff7d2ef3c:	00000000	udf	#0
   0x0000fffff7d2ef40:	00000000	udf	#0
   0x0000fffff7d2ef44:	00000000	udf	#0
   0x0000fffff7d2ef48:	00000000	udf	#0
   0x0000fffff7d2ef4c:	00000000	udf	#0
   0x0000fffff7d2ef50:	00000000	udf	#0
   0x0000fffff7d2ef54:	00000000	udf	#0
   0x0000fffff7d2ef58:	00000000	udf	#0
   0x0000fffff7d2ef5c:	00000000	udf	#0
   0x0000fffff7d2ef60:	00000000	udf	#0
   0x0000fffff7d2ef64:	00000000	udf	#0
   0x0000fffff7d2ef68:	00000000	udf	#0
   0x0000fffff7d2ef6c:	00000000	udf	#0
   0x0000fffff7d2ef70:	00000000	udf	#0
   0x0000fffff7d2ef74:	00000000	udf	#0
   0x0000fffff7d2ef78:	00000000	udf	#0
   0x0000fffff7d2ef7c:	00000000	udf	#0
   0x0000fffff7d2ef80:	00000000	udf	#0
   0x0000fffff7d2ef84:	00000000	udf	#0
   0x0000fffff7d2ef88:	00000000	udf	#0
   0x0000fffff7d2ef8c:	00000000	udf	#0
   0x0000fffff7d2ef90:	00000000	udf	#0
   0x0000fffff7d2ef94:	00000000	udf	#0
   0x0000fffff7d2ef98:	00000000	udf	#0
   0x0000fffff7d2ef9c:	00000000	udf	#0
   0x0000fffff7d2efa0:	00000000	udf	#0
   0x0000fffff7d2efa4:	00000000	udf	#0
   0x0000fffff7d2efa8:	00000000	udf	#0
   0x0000fffff7d2efac:	00000000	udf	#0
   0x0000fffff7d2efb0:	00000000	udf	#0
   0x0000fffff7d2efb4:	00000000	udf	#0
   0x0000fffff7d2efb8:	00000000	udf	#0
   0x0000fffff7d2efbc:	00000000	udf	#0
   0x0000fffff7d2efc0:	00000000	udf	#0
   0x0000fffff7d2efc4:	00000000	udf	#0
   0x0000fffff7d2efc8:	00000000	udf	#0
   0x0000fffff7d2efcc:	00000000	udf	#0
   0x0000fffff7d2efd0:	00000000	udf	#0
   0x0000fffff7d2efd4:	00000000	udf	#0
   0x0000fffff7d2efd8:	00000000	udf	#0
   0x0000fffff7d2efdc:	00000000	udf	#0
   0x0000fffff7d2efe0:	00000000	udf	#0
   0x0000fffff7d2efe4:	00000000	udf	#0
   0x0000fffff7d2efe8:	00000000	udf	#0
   0x0000fffff7d2efec:	00000000	udf	#0
   0x0000fffff7d2eff0:	00000000	udf	#0
   0x0000fffff7d2eff4:	00000000	udf	#0
   0x0000fffff7d2eff8:	00000000	udf	#0
   0x0000fffff7d2effc:	00000000	udf	#0
End of assembler dump.
