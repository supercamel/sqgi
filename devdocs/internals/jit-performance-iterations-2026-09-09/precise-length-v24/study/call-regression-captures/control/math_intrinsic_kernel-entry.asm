Dump of assembler code from 0xfffff7d2f000 to 0xfffff7d30000:
   0x0000fffff7d2f000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7d2f004:	910003fd	mov	x29, sp
   0x0000fffff7d2f008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7d2f00c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7d2f010:	d13003ff	sub	sp, sp, #0xc00
   0x0000fffff7d2f014:	aa0003f3	mov	x19, x0
   0x0000fffff7d2f018:	aa0103f4	mov	x20, x1
   0x0000fffff7d2f01c:	aa0203f5	mov	x21, x2
   0x0000fffff7d2f020:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f024:	912043e1	add	x1, sp, #0x810
   0x0000fffff7d2f028:	d2996c02	mov	x2, #0xcb60                	// #52064
   0x0000fffff7d2f02c:	f2b557a2	movk	x2, #0xaabd, lsl #16
   0x0000fffff7d2f030:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f034:	d2910410	mov	x16, #0x8820                	// #34848
   0x0000fffff7d2f038:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f03c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f040:	d63f0200	blr	x16
   0x0000fffff7d2f044:	f9401ea9	ldr	x9, [x21, #56]
   0x0000fffff7d2f048:	d299da0a	mov	x10, #0xced0                	// #52944
   0x0000fffff7d2f04c:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7d2f050:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7d2f054:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f058:	54004c41	b.ne	0xfffff7d2f9e0  // b.any
   0x0000fffff7d2f05c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7d2f060:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d2f064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d2f068:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f06c:	54004ba1	b.ne	0xfffff7d2f9e0  // b.any
   0x0000fffff7d2f070:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7d2f074:	f90007e9	str	x9, [sp, #8]
   0x0000fffff7d2f078:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f07c:	f9000be9	str	x9, [sp, #16]
   0x0000fffff7d2f080:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f084:	36d801c9	tbz	w9, #27, 0xfffff7d2f0bc
   0x0000fffff7d2f088:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f08c:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f090:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f094:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f098:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f09c:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f0a0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f0a4:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f0a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f0ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f0b0:	d63f0200	blr	x16
   0x0000fffff7d2f0b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f0b8:	54004940	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f0bc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f0c0:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7d2f0c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7d2f0c8:	36d801c9	tbz	w9, #27, 0xfffff7d2f100
   0x0000fffff7d2f0cc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f0d0:	f9400fe3	ldr	x3, [sp, #24]
   0x0000fffff7d2f0d4:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2f0d8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f0dc:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f0e0:	d2800062	mov	x2, #0x3                   	// #3
   0x0000fffff7d2f0e4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f0e8:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f0ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f0f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f0f4:	d63f0200	blr	x16
   0x0000fffff7d2f0f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f0fc:	54004720	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f100:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f104:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7d2f108:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f10c:	5400446a	b.ge	0xfffff7d2f998  // b.tcont
   0x0000fffff7d2f110:	d2800c29	mov	x9, #0x61                  	// #97
   0x0000fffff7d2f114:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f118:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d2f11c:	36d801c9	tbz	w9, #27, 0xfffff7d2f154
   0x0000fffff7d2f120:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f124:	f94013e3	ldr	x3, [sp, #32]
   0x0000fffff7d2f128:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2f12c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f130:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f134:	d2800082	mov	x2, #0x4                   	// #4
   0x0000fffff7d2f138:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f13c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f140:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f148:	d63f0200	blr	x16
   0x0000fffff7d2f14c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f150:	54004480	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f154:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f158:	d2800c2a	mov	x10, #0x61                  	// #97
   0x0000fffff7d2f15c:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d2f160:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d2f164:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f168:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7d2f16c:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2f170:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f174:	36d801c9	tbz	w9, #27, 0xfffff7d2f1ac
   0x0000fffff7d2f178:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f17c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f180:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2f184:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f188:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f18c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f190:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f194:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f198:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f19c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f1a0:	d63f0200	blr	x16
   0x0000fffff7d2f1a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f1a8:	540041c0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f1ac:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f1b0:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7d2f1b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d2f1b8:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f1bc:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f1c0:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2f1c4:	aa1503e0	mov	x0, x21
   0x0000fffff7d2f1c8:	d2992b01	mov	x1, #0xc958                	// #51544
   0x0000fffff7d2f1cc:	f2b55821	movk	x1, #0xaac1, lsl #16
   0x0000fffff7d2f1d0:	f2d55541	movk	x1, #0xaaaa, lsl #32
   0x0000fffff7d2f1d4:	d295ea10	mov	x16, #0xaf50                	// #44880
   0x0000fffff7d2f1d8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f1dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f1e0:	d63f0200	blr	x16
   0x0000fffff7d2f1e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f1e8:	54003fc0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f1ec:	f94017e0	ldr	x0, [sp, #40]
   0x0000fffff7d2f1f0:	910083e1	add	x1, sp, #0x20
   0x0000fffff7d2f1f4:	d2959210	mov	x16, #0xac90                	// #44176
   0x0000fffff7d2f1f8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f1fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f200:	d63f0200	blr	x16
   0x0000fffff7d2f204:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f208:	54003ec0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f20c:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f210:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f214:	d2992d02	mov	x2, #0xc968                	// #51560
   0x0000fffff7d2f218:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f21c:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f220:	d2945603	mov	x3, #0xa2b0                	// #41648
   0x0000fffff7d2f224:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2f228:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f22c:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f230:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f234:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f238:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2f23c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f240:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f244:	d63f0200	blr	x16
   0x0000fffff7d2f248:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f24c:	54003ca0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f250:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f254:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f258:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f25c:	36d801c9	tbz	w9, #27, 0xfffff7d2f294
   0x0000fffff7d2f260:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f264:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f268:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f26c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f270:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f274:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f278:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f27c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f280:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f284:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f288:	d63f0200	blr	x16
   0x0000fffff7d2f28c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f290:	54003a80	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f294:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f298:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f29c:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f2a0:	d295ce10	mov	x16, #0xae70                	// #44656
   0x0000fffff7d2f2a4:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f2a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f2ac:	d63f0200	blr	x16
   0x0000fffff7d2f2b0:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f2b4:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f2b8:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f2bc:	d2992f02	mov	x2, #0xc978                	// #51576
   0x0000fffff7d2f2c0:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f2c4:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f2c8:	d2960403	mov	x3, #0xb020                	// #45088
   0x0000fffff7d2f2cc:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2f2d0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f2d4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f2d8:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f2dc:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f2e0:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2f2e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f2e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f2ec:	d63f0200	blr	x16
   0x0000fffff7d2f2f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f2f4:	54003760	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f2f8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f2fc:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f300:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f304:	36d801c9	tbz	w9, #27, 0xfffff7d2f33c
   0x0000fffff7d2f308:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f30c:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f310:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f314:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f318:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f31c:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f320:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f324:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f328:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f32c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f330:	d63f0200	blr	x16
   0x0000fffff7d2f334:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f338:	54003540	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f33c:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f340:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f344:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f348:	d295be10	mov	x16, #0xadf0                	// #44528
   0x0000fffff7d2f34c:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f350:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f354:	d63f0200	blr	x16
   0x0000fffff7d2f358:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f35c:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f360:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f364:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f368:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f36c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f370:	36d801c9	tbz	w9, #27, 0xfffff7d2f3a8
   0x0000fffff7d2f374:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f378:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f37c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f380:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f384:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f388:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f38c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f390:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f394:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f39c:	d63f0200	blr	x16
   0x0000fffff7d2f3a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f3a4:	540031e0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f3a8:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f3ac:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f3b0:	d2993102	mov	x2, #0xc988                	// #51592
   0x0000fffff7d2f3b4:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f3b8:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f3bc:	d297d003	mov	x3, #0xbe80                	// #48768
   0x0000fffff7d2f3c0:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2f3c4:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f3c8:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f3cc:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f3d0:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f3d4:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2f3d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f3dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f3e0:	d63f0200	blr	x16
   0x0000fffff7d2f3e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f3e8:	54002fc0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f3ec:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f3f0:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f3f4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f3f8:	36d801c9	tbz	w9, #27, 0xfffff7d2f430
   0x0000fffff7d2f3fc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f400:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f404:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f408:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f40c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f410:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f414:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f418:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f41c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f420:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f424:	d63f0200	blr	x16
   0x0000fffff7d2f428:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f42c:	54002da0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f430:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f434:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f438:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f43c:	d295ae10	mov	x16, #0xad70                	// #44400
   0x0000fffff7d2f440:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f448:	d63f0200	blr	x16
   0x0000fffff7d2f44c:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f450:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f454:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f458:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f45c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f460:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f464:	36d801c9	tbz	w9, #27, 0xfffff7d2f49c
   0x0000fffff7d2f468:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f46c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f470:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f474:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f478:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f47c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f480:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f484:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f488:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f48c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f490:	d63f0200	blr	x16
   0x0000fffff7d2f494:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f498:	54002a40	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f49c:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f4a0:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f4a4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f4a8:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f4ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f4b0:	36d801c9	tbz	w9, #27, 0xfffff7d2f4e8
   0x0000fffff7d2f4b4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f4b8:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f4bc:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f4c0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f4c4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f4c8:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f4cc:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f4d0:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f4d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f4d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f4dc:	d63f0200	blr	x16
   0x0000fffff7d2f4e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f4e4:	540027e0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f4e8:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f4ec:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f4f0:	d2993302	mov	x2, #0xc998                	// #51608
   0x0000fffff7d2f4f4:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f4f8:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f4fc:	d295ee03	mov	x3, #0xaf70                	// #44912
   0x0000fffff7d2f500:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2f504:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f508:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f50c:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f510:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f514:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2f518:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f51c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f520:	d63f0200	blr	x16
   0x0000fffff7d2f524:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f528:	540025c0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f52c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f530:	f2f80189	movk	x9, #0xc00c, lsl #48
   0x0000fffff7d2f534:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f538:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f53c:	36d801c9	tbz	w9, #27, 0xfffff7d2f574
   0x0000fffff7d2f540:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f544:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f548:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f54c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f550:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f554:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f558:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f55c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f560:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f564:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f568:	d63f0200	blr	x16
   0x0000fffff7d2f56c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f570:	54002380	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f574:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f578:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f57c:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f580:	d294e410	mov	x16, #0xa720                	// #42784
   0x0000fffff7d2f584:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f588:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f58c:	d63f0200	blr	x16
   0x0000fffff7d2f590:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f594:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f598:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f59c:	d2993702	mov	x2, #0xc9b8                	// #51640
   0x0000fffff7d2f5a0:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f5a4:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f5a8:	d2893203	mov	x3, #0x4990                	// #18832
   0x0000fffff7d2f5ac:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7d2f5b0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f5b4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f5b8:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f5bc:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f5c0:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2f5c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f5c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f5cc:	d63f0200	blr	x16
   0x0000fffff7d2f5d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f5d4:	54002060	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f5d8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f5dc:	f2e7ff89	movk	x9, #0x3ffc, lsl #48
   0x0000fffff7d2f5e0:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f5e4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f5e8:	36d801c9	tbz	w9, #27, 0xfffff7d2f620
   0x0000fffff7d2f5ec:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f5f0:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f5f4:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f5f8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f5fc:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f600:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f604:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f608:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f60c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f610:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f614:	d63f0200	blr	x16
   0x0000fffff7d2f618:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f61c:	54001e20	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f620:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f624:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f628:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f62c:	d2953c10	mov	x16, #0xa9e0                	// #43488
   0x0000fffff7d2f630:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f634:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f638:	d63f0200	blr	x16
   0x0000fffff7d2f63c:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f640:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f644:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f648:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f64c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f650:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f654:	36d801c9	tbz	w9, #27, 0xfffff7d2f68c
   0x0000fffff7d2f658:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f65c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f660:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f664:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f668:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f66c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f670:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f674:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f678:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f67c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f680:	d63f0200	blr	x16
   0x0000fffff7d2f684:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f688:	54001ac0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f68c:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f690:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f694:	d2993b02	mov	x2, #0xc9d8                	// #51672
   0x0000fffff7d2f698:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f69c:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f6a0:	d2969803	mov	x3, #0xb4c0                	// #46272
   0x0000fffff7d2f6a4:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7d2f6a8:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f6ac:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f6b0:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f6b4:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f6b8:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2f6bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f6c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f6c4:	d63f0200	blr	x16
   0x0000fffff7d2f6c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f6cc:	540018a0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f6d0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f6d4:	f2e7fe89	movk	x9, #0x3ff4, lsl #48
   0x0000fffff7d2f6d8:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f6dc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f6e0:	36d801c9	tbz	w9, #27, 0xfffff7d2f718
   0x0000fffff7d2f6e4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f6e8:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f6ec:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f6f0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f6f4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f6f8:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f6fc:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f700:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f704:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f708:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f70c:	d63f0200	blr	x16
   0x0000fffff7d2f710:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f714:	54001660	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f718:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f71c:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f720:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f724:	d2952a10	mov	x16, #0xa950                	// #43344
   0x0000fffff7d2f728:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f72c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f730:	d63f0200	blr	x16
   0x0000fffff7d2f734:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f738:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f73c:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f740:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f744:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f748:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f74c:	36d801c9	tbz	w9, #27, 0xfffff7d2f784
   0x0000fffff7d2f750:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f754:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f758:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f75c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f760:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f764:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f768:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f76c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f770:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f774:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f778:	d63f0200	blr	x16
   0x0000fffff7d2f77c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f780:	54001300	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f784:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f788:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f78c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f790:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f794:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f798:	36d801c9	tbz	w9, #27, 0xfffff7d2f7d0
   0x0000fffff7d2f79c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f7a0:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f7a4:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f7a8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f7ac:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f7b0:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f7b4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f7b8:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f7bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f7c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f7c4:	d63f0200	blr	x16
   0x0000fffff7d2f7c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f7cc:	540010a0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f7d0:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f7d4:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f7d8:	d2993f02	mov	x2, #0xc9f8                	// #51704
   0x0000fffff7d2f7dc:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f7e0:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f7e4:	d2969e03	mov	x3, #0xb4f0                	// #46320
   0x0000fffff7d2f7e8:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7d2f7ec:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f7f0:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f7f4:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f7f8:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f7fc:	d28eec10	mov	x16, #0x7760                	// #30560
   0x0000fffff7d2f800:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f804:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f808:	d63f0200	blr	x16
   0x0000fffff7d2f80c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f810:	54000e80	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f814:	d2958e29	mov	x9, #0xac71                	// #44145
   0x0000fffff7d2f818:	f2bb7169	movk	x9, #0xdb8b, lsl #16
   0x0000fffff7d2f81c:	f2c00d09	movk	x9, #0x68, lsl #32
   0x0000fffff7d2f820:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7d2f824:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f828:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f82c:	36d801c9	tbz	w9, #27, 0xfffff7d2f864
   0x0000fffff7d2f830:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f834:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f838:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f83c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f840:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f844:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f848:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f84c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f850:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f854:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f858:	d63f0200	blr	x16
   0x0000fffff7d2f85c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f860:	54000c00	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f864:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7d2f868:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f86c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f870:	36d801c9	tbz	w9, #27, 0xfffff7d2f8a8
   0x0000fffff7d2f874:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f878:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f87c:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2f880:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f884:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f888:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f88c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f890:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f894:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f898:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f89c:	d63f0200	blr	x16
   0x0000fffff7d2f8a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f8a4:	540009e0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f8a8:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f8ac:	d28000aa	mov	x10, #0x5                   	// #5
   0x0000fffff7d2f8b0:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d2f8b4:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d2f8b8:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f8bc:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7d2f8c0:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7d2f8c4:	aa1503e0	mov	x0, x21
   0x0000fffff7d2f8c8:	d2992b01	mov	x1, #0xc958                	// #51544
   0x0000fffff7d2f8cc:	f2b55821	movk	x1, #0xaac1, lsl #16
   0x0000fffff7d2f8d0:	f2d55541	movk	x1, #0xaaaa, lsl #32
   0x0000fffff7d2f8d4:	d295ea10	mov	x16, #0xaf50                	// #44880
   0x0000fffff7d2f8d8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f8dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f8e0:	d63f0200	blr	x16
   0x0000fffff7d2f8e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f8e8:	540007c0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f8ec:	f94027e0	ldr	x0, [sp, #72]
   0x0000fffff7d2f8f0:	910103e1	add	x1, sp, #0x40
   0x0000fffff7d2f8f4:	d2959210	mov	x16, #0xac90                	// #44176
   0x0000fffff7d2f8f8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f8fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f900:	d63f0200	blr	x16
   0x0000fffff7d2f904:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f908:	540006c0	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f90c:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f910:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f914:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f918:	fd0407e0	str	d0, [sp, #2056]
   0x0000fffff7d2f91c:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f920:	fd4407e1	ldr	d1, [sp, #2056]
   0x0000fffff7d2f924:	d294e610	mov	x16, #0xa730                	// #42800
   0x0000fffff7d2f928:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f92c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f930:	d63f0200	blr	x16
   0x0000fffff7d2f934:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f938:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f93c:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f940:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f944:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f948:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f94c:	36d801c9	tbz	w9, #27, 0xfffff7d2f984
   0x0000fffff7d2f950:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f954:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f958:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f95c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f960:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f964:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f968:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f96c:	d2848c90	mov	x16, #0x2464                	// #9316
   0x0000fffff7d2f970:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f974:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f978:	d63f0200	blr	x16
   0x0000fffff7d2f97c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f980:	54000300	b.eq	0xfffff7d2f9e0  // b.none
   0x0000fffff7d2f984:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f988:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f98c:	91000529	add	x9, x9, #0x1
   0x0000fffff7d2f990:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7d2f994:	17fffddb	b	0xfffff7d2f100
   0x0000fffff7d2f998:	52800089	mov	w9, #0x4                   	// #4
   0x0000fffff7d2f99c:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7d2f9a0:	b9000289	str	w9, [x20]
   0x0000fffff7d2f9a4:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f9a8:	f900068a	str	x10, [x20, #8]
   0x0000fffff7d2f9ac:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f9b0:	fd000680	str	d0, [x20, #8]
   0x0000fffff7d2f9b4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f9b8:	d284be10	mov	x16, #0x25f0                	// #9712
   0x0000fffff7d2f9bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f9c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f9c4:	d63f0200	blr	x16
   0x0000fffff7d2f9c8:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2f9cc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2f9d0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2f9d4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2f9d8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d2f9dc:	d65f03c0	ret
   0x0000fffff7d2f9e0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f9e4:	d284c010	mov	x16, #0x2600                	// #9728
   0x0000fffff7d2f9e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f9ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f9f0:	d63f0200	blr	x16
   0x0000fffff7d2f9f4:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2f9f8:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2f9fc:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2fa00:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2fa04:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7d2fa08:	d65f03c0	ret
   0x0000fffff7d2fa0c:	00000000	udf	#0
   0x0000fffff7d2fa10:	00000000	udf	#0
   0x0000fffff7d2fa14:	00000000	udf	#0
   0x0000fffff7d2fa18:	00000000	udf	#0
   0x0000fffff7d2fa1c:	00000000	udf	#0
   0x0000fffff7d2fa20:	00000000	udf	#0
   0x0000fffff7d2fa24:	00000000	udf	#0
   0x0000fffff7d2fa28:	00000000	udf	#0
   0x0000fffff7d2fa2c:	00000000	udf	#0
   0x0000fffff7d2fa30:	00000000	udf	#0
   0x0000fffff7d2fa34:	00000000	udf	#0
   0x0000fffff7d2fa38:	00000000	udf	#0
   0x0000fffff7d2fa3c:	00000000	udf	#0
   0x0000fffff7d2fa40:	00000000	udf	#0
   0x0000fffff7d2fa44:	00000000	udf	#0
   0x0000fffff7d2fa48:	00000000	udf	#0
   0x0000fffff7d2fa4c:	00000000	udf	#0
   0x0000fffff7d2fa50:	00000000	udf	#0
   0x0000fffff7d2fa54:	00000000	udf	#0
   0x0000fffff7d2fa58:	00000000	udf	#0
   0x0000fffff7d2fa5c:	00000000	udf	#0
   0x0000fffff7d2fa60:	00000000	udf	#0
   0x0000fffff7d2fa64:	00000000	udf	#0
   0x0000fffff7d2fa68:	00000000	udf	#0
   0x0000fffff7d2fa6c:	00000000	udf	#0
   0x0000fffff7d2fa70:	00000000	udf	#0
   0x0000fffff7d2fa74:	00000000	udf	#0
   0x0000fffff7d2fa78:	00000000	udf	#0
   0x0000fffff7d2fa7c:	00000000	udf	#0
   0x0000fffff7d2fa80:	00000000	udf	#0
   0x0000fffff7d2fa84:	00000000	udf	#0
   0x0000fffff7d2fa88:	00000000	udf	#0
   0x0000fffff7d2fa8c:	00000000	udf	#0
   0x0000fffff7d2fa90:	00000000	udf	#0
   0x0000fffff7d2fa94:	00000000	udf	#0
   0x0000fffff7d2fa98:	00000000	udf	#0
   0x0000fffff7d2fa9c:	00000000	udf	#0
   0x0000fffff7d2faa0:	00000000	udf	#0
   0x0000fffff7d2faa4:	00000000	udf	#0
   0x0000fffff7d2faa8:	00000000	udf	#0
   0x0000fffff7d2faac:	00000000	udf	#0
   0x0000fffff7d2fab0:	00000000	udf	#0
   0x0000fffff7d2fab4:	00000000	udf	#0
   0x0000fffff7d2fab8:	00000000	udf	#0
   0x0000fffff7d2fabc:	00000000	udf	#0
   0x0000fffff7d2fac0:	00000000	udf	#0
   0x0000fffff7d2fac4:	00000000	udf	#0
   0x0000fffff7d2fac8:	00000000	udf	#0
   0x0000fffff7d2facc:	00000000	udf	#0
   0x0000fffff7d2fad0:	00000000	udf	#0
   0x0000fffff7d2fad4:	00000000	udf	#0
   0x0000fffff7d2fad8:	00000000	udf	#0
   0x0000fffff7d2fadc:	00000000	udf	#0
   0x0000fffff7d2fae0:	00000000	udf	#0
   0x0000fffff7d2fae4:	00000000	udf	#0
   0x0000fffff7d2fae8:	00000000	udf	#0
   0x0000fffff7d2faec:	00000000	udf	#0
   0x0000fffff7d2faf0:	00000000	udf	#0
   0x0000fffff7d2faf4:	00000000	udf	#0
   0x0000fffff7d2faf8:	00000000	udf	#0
   0x0000fffff7d2fafc:	00000000	udf	#0
   0x0000fffff7d2fb00:	00000000	udf	#0
   0x0000fffff7d2fb04:	00000000	udf	#0
   0x0000fffff7d2fb08:	00000000	udf	#0
   0x0000fffff7d2fb0c:	00000000	udf	#0
   0x0000fffff7d2fb10:	00000000	udf	#0
   0x0000fffff7d2fb14:	00000000	udf	#0
   0x0000fffff7d2fb18:	00000000	udf	#0
   0x0000fffff7d2fb1c:	00000000	udf	#0
   0x0000fffff7d2fb20:	00000000	udf	#0
   0x0000fffff7d2fb24:	00000000	udf	#0
   0x0000fffff7d2fb28:	00000000	udf	#0
   0x0000fffff7d2fb2c:	00000000	udf	#0
   0x0000fffff7d2fb30:	00000000	udf	#0
   0x0000fffff7d2fb34:	00000000	udf	#0
   0x0000fffff7d2fb38:	00000000	udf	#0
   0x0000fffff7d2fb3c:	00000000	udf	#0
   0x0000fffff7d2fb40:	00000000	udf	#0
   0x0000fffff7d2fb44:	00000000	udf	#0
   0x0000fffff7d2fb48:	00000000	udf	#0
   0x0000fffff7d2fb4c:	00000000	udf	#0
   0x0000fffff7d2fb50:	00000000	udf	#0
   0x0000fffff7d2fb54:	00000000	udf	#0
   0x0000fffff7d2fb58:	00000000	udf	#0
   0x0000fffff7d2fb5c:	00000000	udf	#0
   0x0000fffff7d2fb60:	00000000	udf	#0
   0x0000fffff7d2fb64:	00000000	udf	#0
   0x0000fffff7d2fb68:	00000000	udf	#0
   0x0000fffff7d2fb6c:	00000000	udf	#0
   0x0000fffff7d2fb70:	00000000	udf	#0
   0x0000fffff7d2fb74:	00000000	udf	#0
   0x0000fffff7d2fb78:	00000000	udf	#0
   0x0000fffff7d2fb7c:	00000000	udf	#0
   0x0000fffff7d2fb80:	00000000	udf	#0
   0x0000fffff7d2fb84:	00000000	udf	#0
   0x0000fffff7d2fb88:	00000000	udf	#0
   0x0000fffff7d2fb8c:	00000000	udf	#0
   0x0000fffff7d2fb90:	00000000	udf	#0
   0x0000fffff7d2fb94:	00000000	udf	#0
   0x0000fffff7d2fb98:	00000000	udf	#0
   0x0000fffff7d2fb9c:	00000000	udf	#0
   0x0000fffff7d2fba0:	00000000	udf	#0
   0x0000fffff7d2fba4:	00000000	udf	#0
   0x0000fffff7d2fba8:	00000000	udf	#0
   0x0000fffff7d2fbac:	00000000	udf	#0
   0x0000fffff7d2fbb0:	00000000	udf	#0
   0x0000fffff7d2fbb4:	00000000	udf	#0
   0x0000fffff7d2fbb8:	00000000	udf	#0
   0x0000fffff7d2fbbc:	00000000	udf	#0
   0x0000fffff7d2fbc0:	00000000	udf	#0
   0x0000fffff7d2fbc4:	00000000	udf	#0
   0x0000fffff7d2fbc8:	00000000	udf	#0
   0x0000fffff7d2fbcc:	00000000	udf	#0
   0x0000fffff7d2fbd0:	00000000	udf	#0
   0x0000fffff7d2fbd4:	00000000	udf	#0
   0x0000fffff7d2fbd8:	00000000	udf	#0
   0x0000fffff7d2fbdc:	00000000	udf	#0
   0x0000fffff7d2fbe0:	00000000	udf	#0
   0x0000fffff7d2fbe4:	00000000	udf	#0
   0x0000fffff7d2fbe8:	00000000	udf	#0
   0x0000fffff7d2fbec:	00000000	udf	#0
   0x0000fffff7d2fbf0:	00000000	udf	#0
   0x0000fffff7d2fbf4:	00000000	udf	#0
   0x0000fffff7d2fbf8:	00000000	udf	#0
   0x0000fffff7d2fbfc:	00000000	udf	#0
   0x0000fffff7d2fc00:	00000000	udf	#0
   0x0000fffff7d2fc04:	00000000	udf	#0
   0x0000fffff7d2fc08:	00000000	udf	#0
   0x0000fffff7d2fc0c:	00000000	udf	#0
   0x0000fffff7d2fc10:	00000000	udf	#0
   0x0000fffff7d2fc14:	00000000	udf	#0
   0x0000fffff7d2fc18:	00000000	udf	#0
   0x0000fffff7d2fc1c:	00000000	udf	#0
   0x0000fffff7d2fc20:	00000000	udf	#0
   0x0000fffff7d2fc24:	00000000	udf	#0
   0x0000fffff7d2fc28:	00000000	udf	#0
   0x0000fffff7d2fc2c:	00000000	udf	#0
   0x0000fffff7d2fc30:	00000000	udf	#0
   0x0000fffff7d2fc34:	00000000	udf	#0
   0x0000fffff7d2fc38:	00000000	udf	#0
   0x0000fffff7d2fc3c:	00000000	udf	#0
   0x0000fffff7d2fc40:	00000000	udf	#0
   0x0000fffff7d2fc44:	00000000	udf	#0
   0x0000fffff7d2fc48:	00000000	udf	#0
   0x0000fffff7d2fc4c:	00000000	udf	#0
   0x0000fffff7d2fc50:	00000000	udf	#0
   0x0000fffff7d2fc54:	00000000	udf	#0
   0x0000fffff7d2fc58:	00000000	udf	#0
   0x0000fffff7d2fc5c:	00000000	udf	#0
   0x0000fffff7d2fc60:	00000000	udf	#0
   0x0000fffff7d2fc64:	00000000	udf	#0
   0x0000fffff7d2fc68:	00000000	udf	#0
   0x0000fffff7d2fc6c:	00000000	udf	#0
   0x0000fffff7d2fc70:	00000000	udf	#0
   0x0000fffff7d2fc74:	00000000	udf	#0
   0x0000fffff7d2fc78:	00000000	udf	#0
   0x0000fffff7d2fc7c:	00000000	udf	#0
   0x0000fffff7d2fc80:	00000000	udf	#0
   0x0000fffff7d2fc84:	00000000	udf	#0
   0x0000fffff7d2fc88:	00000000	udf	#0
   0x0000fffff7d2fc8c:	00000000	udf	#0
   0x0000fffff7d2fc90:	00000000	udf	#0
   0x0000fffff7d2fc94:	00000000	udf	#0
   0x0000fffff7d2fc98:	00000000	udf	#0
   0x0000fffff7d2fc9c:	00000000	udf	#0
   0x0000fffff7d2fca0:	00000000	udf	#0
   0x0000fffff7d2fca4:	00000000	udf	#0
   0x0000fffff7d2fca8:	00000000	udf	#0
   0x0000fffff7d2fcac:	00000000	udf	#0
   0x0000fffff7d2fcb0:	00000000	udf	#0
   0x0000fffff7d2fcb4:	00000000	udf	#0
   0x0000fffff7d2fcb8:	00000000	udf	#0
   0x0000fffff7d2fcbc:	00000000	udf	#0
   0x0000fffff7d2fcc0:	00000000	udf	#0
   0x0000fffff7d2fcc4:	00000000	udf	#0
   0x0000fffff7d2fcc8:	00000000	udf	#0
   0x0000fffff7d2fccc:	00000000	udf	#0
   0x0000fffff7d2fcd0:	00000000	udf	#0
   0x0000fffff7d2fcd4:	00000000	udf	#0
   0x0000fffff7d2fcd8:	00000000	udf	#0
   0x0000fffff7d2fcdc:	00000000	udf	#0
   0x0000fffff7d2fce0:	00000000	udf	#0
   0x0000fffff7d2fce4:	00000000	udf	#0
   0x0000fffff7d2fce8:	00000000	udf	#0
   0x0000fffff7d2fcec:	00000000	udf	#0
   0x0000fffff7d2fcf0:	00000000	udf	#0
   0x0000fffff7d2fcf4:	00000000	udf	#0
   0x0000fffff7d2fcf8:	00000000	udf	#0
   0x0000fffff7d2fcfc:	00000000	udf	#0
   0x0000fffff7d2fd00:	00000000	udf	#0
   0x0000fffff7d2fd04:	00000000	udf	#0
   0x0000fffff7d2fd08:	00000000	udf	#0
   0x0000fffff7d2fd0c:	00000000	udf	#0
   0x0000fffff7d2fd10:	00000000	udf	#0
   0x0000fffff7d2fd14:	00000000	udf	#0
   0x0000fffff7d2fd18:	00000000	udf	#0
   0x0000fffff7d2fd1c:	00000000	udf	#0
   0x0000fffff7d2fd20:	00000000	udf	#0
   0x0000fffff7d2fd24:	00000000	udf	#0
   0x0000fffff7d2fd28:	00000000	udf	#0
   0x0000fffff7d2fd2c:	00000000	udf	#0
   0x0000fffff7d2fd30:	00000000	udf	#0
   0x0000fffff7d2fd34:	00000000	udf	#0
   0x0000fffff7d2fd38:	00000000	udf	#0
   0x0000fffff7d2fd3c:	00000000	udf	#0
   0x0000fffff7d2fd40:	00000000	udf	#0
   0x0000fffff7d2fd44:	00000000	udf	#0
   0x0000fffff7d2fd48:	00000000	udf	#0
   0x0000fffff7d2fd4c:	00000000	udf	#0
   0x0000fffff7d2fd50:	00000000	udf	#0
   0x0000fffff7d2fd54:	00000000	udf	#0
   0x0000fffff7d2fd58:	00000000	udf	#0
   0x0000fffff7d2fd5c:	00000000	udf	#0
   0x0000fffff7d2fd60:	00000000	udf	#0
   0x0000fffff7d2fd64:	00000000	udf	#0
   0x0000fffff7d2fd68:	00000000	udf	#0
   0x0000fffff7d2fd6c:	00000000	udf	#0
   0x0000fffff7d2fd70:	00000000	udf	#0
   0x0000fffff7d2fd74:	00000000	udf	#0
   0x0000fffff7d2fd78:	00000000	udf	#0
   0x0000fffff7d2fd7c:	00000000	udf	#0
   0x0000fffff7d2fd80:	00000000	udf	#0
   0x0000fffff7d2fd84:	00000000	udf	#0
   0x0000fffff7d2fd88:	00000000	udf	#0
   0x0000fffff7d2fd8c:	00000000	udf	#0
   0x0000fffff7d2fd90:	00000000	udf	#0
   0x0000fffff7d2fd94:	00000000	udf	#0
   0x0000fffff7d2fd98:	00000000	udf	#0
   0x0000fffff7d2fd9c:	00000000	udf	#0
   0x0000fffff7d2fda0:	00000000	udf	#0
   0x0000fffff7d2fda4:	00000000	udf	#0
   0x0000fffff7d2fda8:	00000000	udf	#0
   0x0000fffff7d2fdac:	00000000	udf	#0
   0x0000fffff7d2fdb0:	00000000	udf	#0
   0x0000fffff7d2fdb4:	00000000	udf	#0
   0x0000fffff7d2fdb8:	00000000	udf	#0
   0x0000fffff7d2fdbc:	00000000	udf	#0
   0x0000fffff7d2fdc0:	00000000	udf	#0
   0x0000fffff7d2fdc4:	00000000	udf	#0
   0x0000fffff7d2fdc8:	00000000	udf	#0
   0x0000fffff7d2fdcc:	00000000	udf	#0
   0x0000fffff7d2fdd0:	00000000	udf	#0
   0x0000fffff7d2fdd4:	00000000	udf	#0
   0x0000fffff7d2fdd8:	00000000	udf	#0
   0x0000fffff7d2fddc:	00000000	udf	#0
   0x0000fffff7d2fde0:	00000000	udf	#0
   0x0000fffff7d2fde4:	00000000	udf	#0
   0x0000fffff7d2fde8:	00000000	udf	#0
   0x0000fffff7d2fdec:	00000000	udf	#0
   0x0000fffff7d2fdf0:	00000000	udf	#0
   0x0000fffff7d2fdf4:	00000000	udf	#0
   0x0000fffff7d2fdf8:	00000000	udf	#0
   0x0000fffff7d2fdfc:	00000000	udf	#0
   0x0000fffff7d2fe00:	00000000	udf	#0
   0x0000fffff7d2fe04:	00000000	udf	#0
   0x0000fffff7d2fe08:	00000000	udf	#0
   0x0000fffff7d2fe0c:	00000000	udf	#0
   0x0000fffff7d2fe10:	00000000	udf	#0
   0x0000fffff7d2fe14:	00000000	udf	#0
   0x0000fffff7d2fe18:	00000000	udf	#0
   0x0000fffff7d2fe1c:	00000000	udf	#0
   0x0000fffff7d2fe20:	00000000	udf	#0
   0x0000fffff7d2fe24:	00000000	udf	#0
   0x0000fffff7d2fe28:	00000000	udf	#0
   0x0000fffff7d2fe2c:	00000000	udf	#0
   0x0000fffff7d2fe30:	00000000	udf	#0
   0x0000fffff7d2fe34:	00000000	udf	#0
   0x0000fffff7d2fe38:	00000000	udf	#0
   0x0000fffff7d2fe3c:	00000000	udf	#0
   0x0000fffff7d2fe40:	00000000	udf	#0
   0x0000fffff7d2fe44:	00000000	udf	#0
   0x0000fffff7d2fe48:	00000000	udf	#0
   0x0000fffff7d2fe4c:	00000000	udf	#0
   0x0000fffff7d2fe50:	00000000	udf	#0
   0x0000fffff7d2fe54:	00000000	udf	#0
   0x0000fffff7d2fe58:	00000000	udf	#0
   0x0000fffff7d2fe5c:	00000000	udf	#0
   0x0000fffff7d2fe60:	00000000	udf	#0
   0x0000fffff7d2fe64:	00000000	udf	#0
   0x0000fffff7d2fe68:	00000000	udf	#0
   0x0000fffff7d2fe6c:	00000000	udf	#0
   0x0000fffff7d2fe70:	00000000	udf	#0
   0x0000fffff7d2fe74:	00000000	udf	#0
   0x0000fffff7d2fe78:	00000000	udf	#0
   0x0000fffff7d2fe7c:	00000000	udf	#0
   0x0000fffff7d2fe80:	00000000	udf	#0
   0x0000fffff7d2fe84:	00000000	udf	#0
   0x0000fffff7d2fe88:	00000000	udf	#0
   0x0000fffff7d2fe8c:	00000000	udf	#0
   0x0000fffff7d2fe90:	00000000	udf	#0
   0x0000fffff7d2fe94:	00000000	udf	#0
   0x0000fffff7d2fe98:	00000000	udf	#0
   0x0000fffff7d2fe9c:	00000000	udf	#0
   0x0000fffff7d2fea0:	00000000	udf	#0
   0x0000fffff7d2fea4:	00000000	udf	#0
   0x0000fffff7d2fea8:	00000000	udf	#0
   0x0000fffff7d2feac:	00000000	udf	#0
   0x0000fffff7d2feb0:	00000000	udf	#0
   0x0000fffff7d2feb4:	00000000	udf	#0
   0x0000fffff7d2feb8:	00000000	udf	#0
   0x0000fffff7d2febc:	00000000	udf	#0
   0x0000fffff7d2fec0:	00000000	udf	#0
   0x0000fffff7d2fec4:	00000000	udf	#0
   0x0000fffff7d2fec8:	00000000	udf	#0
   0x0000fffff7d2fecc:	00000000	udf	#0
   0x0000fffff7d2fed0:	00000000	udf	#0
   0x0000fffff7d2fed4:	00000000	udf	#0
   0x0000fffff7d2fed8:	00000000	udf	#0
   0x0000fffff7d2fedc:	00000000	udf	#0
   0x0000fffff7d2fee0:	00000000	udf	#0
   0x0000fffff7d2fee4:	00000000	udf	#0
   0x0000fffff7d2fee8:	00000000	udf	#0
   0x0000fffff7d2feec:	00000000	udf	#0
   0x0000fffff7d2fef0:	00000000	udf	#0
   0x0000fffff7d2fef4:	00000000	udf	#0
   0x0000fffff7d2fef8:	00000000	udf	#0
   0x0000fffff7d2fefc:	00000000	udf	#0
   0x0000fffff7d2ff00:	00000000	udf	#0
   0x0000fffff7d2ff04:	00000000	udf	#0
   0x0000fffff7d2ff08:	00000000	udf	#0
   0x0000fffff7d2ff0c:	00000000	udf	#0
   0x0000fffff7d2ff10:	00000000	udf	#0
   0x0000fffff7d2ff14:	00000000	udf	#0
   0x0000fffff7d2ff18:	00000000	udf	#0
   0x0000fffff7d2ff1c:	00000000	udf	#0
   0x0000fffff7d2ff20:	00000000	udf	#0
   0x0000fffff7d2ff24:	00000000	udf	#0
   0x0000fffff7d2ff28:	00000000	udf	#0
   0x0000fffff7d2ff2c:	00000000	udf	#0
   0x0000fffff7d2ff30:	00000000	udf	#0
   0x0000fffff7d2ff34:	00000000	udf	#0
   0x0000fffff7d2ff38:	00000000	udf	#0
   0x0000fffff7d2ff3c:	00000000	udf	#0
   0x0000fffff7d2ff40:	00000000	udf	#0
   0x0000fffff7d2ff44:	00000000	udf	#0
   0x0000fffff7d2ff48:	00000000	udf	#0
   0x0000fffff7d2ff4c:	00000000	udf	#0
   0x0000fffff7d2ff50:	00000000	udf	#0
   0x0000fffff7d2ff54:	00000000	udf	#0
   0x0000fffff7d2ff58:	00000000	udf	#0
   0x0000fffff7d2ff5c:	00000000	udf	#0
   0x0000fffff7d2ff60:	00000000	udf	#0
   0x0000fffff7d2ff64:	00000000	udf	#0
   0x0000fffff7d2ff68:	00000000	udf	#0
   0x0000fffff7d2ff6c:	00000000	udf	#0
   0x0000fffff7d2ff70:	00000000	udf	#0
   0x0000fffff7d2ff74:	00000000	udf	#0
   0x0000fffff7d2ff78:	00000000	udf	#0
   0x0000fffff7d2ff7c:	00000000	udf	#0
   0x0000fffff7d2ff80:	00000000	udf	#0
   0x0000fffff7d2ff84:	00000000	udf	#0
   0x0000fffff7d2ff88:	00000000	udf	#0
   0x0000fffff7d2ff8c:	00000000	udf	#0
   0x0000fffff7d2ff90:	00000000	udf	#0
   0x0000fffff7d2ff94:	00000000	udf	#0
   0x0000fffff7d2ff98:	00000000	udf	#0
   0x0000fffff7d2ff9c:	00000000	udf	#0
   0x0000fffff7d2ffa0:	00000000	udf	#0
   0x0000fffff7d2ffa4:	00000000	udf	#0
   0x0000fffff7d2ffa8:	00000000	udf	#0
   0x0000fffff7d2ffac:	00000000	udf	#0
   0x0000fffff7d2ffb0:	00000000	udf	#0
   0x0000fffff7d2ffb4:	00000000	udf	#0
   0x0000fffff7d2ffb8:	00000000	udf	#0
   0x0000fffff7d2ffbc:	00000000	udf	#0
   0x0000fffff7d2ffc0:	00000000	udf	#0
   0x0000fffff7d2ffc4:	00000000	udf	#0
   0x0000fffff7d2ffc8:	00000000	udf	#0
   0x0000fffff7d2ffcc:	00000000	udf	#0
   0x0000fffff7d2ffd0:	00000000	udf	#0
   0x0000fffff7d2ffd4:	00000000	udf	#0
   0x0000fffff7d2ffd8:	00000000	udf	#0
   0x0000fffff7d2ffdc:	00000000	udf	#0
   0x0000fffff7d2ffe0:	00000000	udf	#0
   0x0000fffff7d2ffe4:	00000000	udf	#0
   0x0000fffff7d2ffe8:	00000000	udf	#0
   0x0000fffff7d2ffec:	00000000	udf	#0
   0x0000fffff7d2fff0:	00000000	udf	#0
   0x0000fffff7d2fff4:	00000000	udf	#0
   0x0000fffff7d2fff8:	00000000	udf	#0
   0x0000fffff7d2fffc:	00000000	udf	#0
End of assembler dump.
