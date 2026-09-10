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
   0x0000fffff7d2f02c:	f2b55782	movk	x2, #0xaabc, lsl #16
   0x0000fffff7d2f030:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f034:	d28c0810	mov	x16, #0x6040                	// #24640
   0x0000fffff7d2f038:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f03c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f040:	d63f0200	blr	x16
   0x0000fffff7d2f044:	f9401ea9	ldr	x9, [x21, #56]
   0x0000fffff7d2f048:	d299da0a	mov	x10, #0xced0                	// #52944
   0x0000fffff7d2f04c:	f2b557ca	movk	x10, #0xaabe, lsl #16
   0x0000fffff7d2f050:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7d2f054:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f058:	54004cc1	b.ne	0xfffff7d2f9f0  // b.any
   0x0000fffff7d2f05c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7d2f060:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d2f064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d2f068:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f06c:	54004c21	b.ne	0xfffff7d2f9f0  // b.any
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
   0x0000fffff7d2f0a4:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f0a8:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f0ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f0b0:	d63f0200	blr	x16
   0x0000fffff7d2f0b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f0b8:	540049c0	b.eq	0xfffff7d2f9f0  // b.none
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
   0x0000fffff7d2f0e8:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f0ec:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f0f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f0f4:	d63f0200	blr	x16
   0x0000fffff7d2f0f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f0fc:	540047a0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f100:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f104:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7d2f108:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f10c:	540044ea	b.ge	0xfffff7d2f9a8  // b.tcont
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
   0x0000fffff7d2f13c:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f140:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f148:	d63f0200	blr	x16
   0x0000fffff7d2f14c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f150:	54004500	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f154:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f158:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7d2f15c:	f100015f	cmp	x10, #0x0
   0x0000fffff7d2f160:	54004480	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f164:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d2f168:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d2f16c:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f170:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7d2f174:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2f178:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f17c:	36d801c9	tbz	w9, #27, 0xfffff7d2f1b4
   0x0000fffff7d2f180:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f184:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f188:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2f18c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f190:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f194:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f198:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f19c:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f1a0:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f1a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f1a8:	d63f0200	blr	x16
   0x0000fffff7d2f1ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f1b0:	54004200	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f1b4:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f1b8:	f94017ea	ldr	x10, [sp, #40]
   0x0000fffff7d2f1bc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d2f1c0:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f1c4:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f1c8:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2f1cc:	aa1503e0	mov	x0, x21
   0x0000fffff7d2f1d0:	d2996301	mov	x1, #0xcb18                	// #51992
   0x0000fffff7d2f1d4:	f2b55801	movk	x1, #0xaac0, lsl #16
   0x0000fffff7d2f1d8:	f2d55541	movk	x1, #0xaaaa, lsl #32
   0x0000fffff7d2f1dc:	d290ee10	mov	x16, #0x8770                	// #34672
   0x0000fffff7d2f1e0:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f1e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f1e8:	d63f0200	blr	x16
   0x0000fffff7d2f1ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f1f0:	54004000	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f1f4:	f94017e0	ldr	x0, [sp, #40]
   0x0000fffff7d2f1f8:	910083e1	add	x1, sp, #0x20
   0x0000fffff7d2f1fc:	d2909610	mov	x16, #0x84b0                	// #33968
   0x0000fffff7d2f200:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f208:	d63f0200	blr	x16
   0x0000fffff7d2f20c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f210:	54003f00	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f214:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f218:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f21c:	d2996502	mov	x2, #0xcb28                	// #52008
   0x0000fffff7d2f220:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f224:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f228:	d285a603	mov	x3, #0x2d30                	// #11568
   0x0000fffff7d2f22c:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f230:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f234:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f238:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f23c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f240:	d2849a10	mov	x16, #0x24d0                	// #9424
   0x0000fffff7d2f244:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f24c:	d63f0200	blr	x16
   0x0000fffff7d2f250:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f254:	54003ce0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f258:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f25c:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f260:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f264:	36d801c9	tbz	w9, #27, 0xfffff7d2f29c
   0x0000fffff7d2f268:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f26c:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f270:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f274:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f278:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f27c:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f280:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f284:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f288:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f28c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f290:	d63f0200	blr	x16
   0x0000fffff7d2f294:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f298:	54003ac0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f29c:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f2a0:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f2a4:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f2a8:	d291be10	mov	x16, #0x8df0                	// #36336
   0x0000fffff7d2f2ac:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f2b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f2b4:	d63f0200	blr	x16
   0x0000fffff7d2f2b8:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f2bc:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f2c0:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f2c4:	d2996702	mov	x2, #0xcb38                	// #52024
   0x0000fffff7d2f2c8:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f2cc:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f2d0:	d285c803	mov	x3, #0x2e40                	// #11840
   0x0000fffff7d2f2d4:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f2d8:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f2dc:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f2e0:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f2e4:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f2e8:	d2849a10	mov	x16, #0x24d0                	// #9424
   0x0000fffff7d2f2ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f2f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f2f4:	d63f0200	blr	x16
   0x0000fffff7d2f2f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f2fc:	540037a0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f300:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f304:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f308:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f30c:	36d801c9	tbz	w9, #27, 0xfffff7d2f344
   0x0000fffff7d2f310:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f314:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f318:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f31c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f320:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f324:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f328:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f32c:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f330:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f334:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f338:	d63f0200	blr	x16
   0x0000fffff7d2f33c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f340:	54003580	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f344:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f348:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f34c:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f350:	d291ae10	mov	x16, #0x8d70                	// #36208
   0x0000fffff7d2f354:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f35c:	d63f0200	blr	x16
   0x0000fffff7d2f360:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f364:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f368:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f36c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f370:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f374:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f378:	36d801c9	tbz	w9, #27, 0xfffff7d2f3b0
   0x0000fffff7d2f37c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f380:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f384:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f388:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f38c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f390:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f394:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f398:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f39c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f3a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f3a4:	d63f0200	blr	x16
   0x0000fffff7d2f3a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f3ac:	54003220	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f3b0:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f3b4:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f3b8:	d2996902	mov	x2, #0xcb48                	// #52040
   0x0000fffff7d2f3bc:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f3c0:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f3c4:	d285ea03	mov	x3, #0x2f50                	// #12112
   0x0000fffff7d2f3c8:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f3cc:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f3d0:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f3d4:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f3d8:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f3dc:	d2849a10	mov	x16, #0x24d0                	// #9424
   0x0000fffff7d2f3e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f3e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f3e8:	d63f0200	blr	x16
   0x0000fffff7d2f3ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f3f0:	54003000	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f3f4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f3f8:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f3fc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f400:	36d801c9	tbz	w9, #27, 0xfffff7d2f438
   0x0000fffff7d2f404:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f408:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f40c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f410:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f414:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f418:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f41c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f420:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f424:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f428:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f42c:	d63f0200	blr	x16
   0x0000fffff7d2f430:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f434:	54002de0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f438:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f43c:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f440:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f444:	d2919e10	mov	x16, #0x8cf0                	// #36080
   0x0000fffff7d2f448:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f44c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f450:	d63f0200	blr	x16
   0x0000fffff7d2f454:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f458:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f45c:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f460:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f464:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f468:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f46c:	36d801c9	tbz	w9, #27, 0xfffff7d2f4a4
   0x0000fffff7d2f470:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f474:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f478:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f47c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f480:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f484:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f488:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f48c:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f490:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f494:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f498:	d63f0200	blr	x16
   0x0000fffff7d2f49c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f4a0:	54002a80	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f4a4:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f4a8:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f4ac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f4b0:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f4b4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f4b8:	36d801c9	tbz	w9, #27, 0xfffff7d2f4f0
   0x0000fffff7d2f4bc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f4c0:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f4c4:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f4c8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f4cc:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f4d0:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f4d4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f4d8:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f4dc:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f4e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f4e4:	d63f0200	blr	x16
   0x0000fffff7d2f4e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f4ec:	54002820	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f4f0:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f4f4:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f4f8:	d2996b02	mov	x2, #0xcb58                	// #52056
   0x0000fffff7d2f4fc:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f500:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f504:	d28b6603	mov	x3, #0x5b30                	// #23344
   0x0000fffff7d2f508:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f50c:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f510:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f514:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f518:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f51c:	d2849a10	mov	x16, #0x24d0                	// #9424
   0x0000fffff7d2f520:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f524:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f528:	d63f0200	blr	x16
   0x0000fffff7d2f52c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f530:	54002600	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f534:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f538:	f2f80189	movk	x9, #0xc00c, lsl #48
   0x0000fffff7d2f53c:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f540:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f544:	36d801c9	tbz	w9, #27, 0xfffff7d2f57c
   0x0000fffff7d2f548:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f54c:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f550:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f554:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f558:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f55c:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f560:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f564:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f568:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f56c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f570:	d63f0200	blr	x16
   0x0000fffff7d2f574:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f578:	540023c0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f57c:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f580:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f584:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f588:	d290d410	mov	x16, #0x86a0                	// #34464
   0x0000fffff7d2f58c:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f590:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f594:	d63f0200	blr	x16
   0x0000fffff7d2f598:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f59c:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f5a0:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f5a4:	d2996f02	mov	x2, #0xcb78                	// #52088
   0x0000fffff7d2f5a8:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f5ac:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f5b0:	d28ac003	mov	x3, #0x5600                	// #22016
   0x0000fffff7d2f5b4:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f5b8:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f5bc:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f5c0:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f5c4:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f5c8:	d2849a10	mov	x16, #0x24d0                	// #9424
   0x0000fffff7d2f5cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f5d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f5d4:	d63f0200	blr	x16
   0x0000fffff7d2f5d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f5dc:	540020a0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f5e0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f5e4:	f2e7ff89	movk	x9, #0x3ffc, lsl #48
   0x0000fffff7d2f5e8:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f5ec:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f5f0:	36d801c9	tbz	w9, #27, 0xfffff7d2f628
   0x0000fffff7d2f5f4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f5f8:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f5fc:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f600:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f604:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f608:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f60c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f610:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f614:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f618:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f61c:	d63f0200	blr	x16
   0x0000fffff7d2f620:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f624:	54001e60	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f628:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f62c:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f630:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f634:	d2912c10	mov	x16, #0x8960                	// #35168
   0x0000fffff7d2f638:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f63c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f640:	d63f0200	blr	x16
   0x0000fffff7d2f644:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f648:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f64c:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f650:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f654:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f658:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f65c:	36d801c9	tbz	w9, #27, 0xfffff7d2f694
   0x0000fffff7d2f660:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f664:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f668:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f66c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f670:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f674:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f678:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f67c:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f680:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f688:	d63f0200	blr	x16
   0x0000fffff7d2f68c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f690:	54001b00	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f694:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f698:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f69c:	d2997302	mov	x2, #0xcb98                	// #52120
   0x0000fffff7d2f6a0:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f6a4:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f6a8:	d28ae203	mov	x3, #0x5710                	// #22288
   0x0000fffff7d2f6ac:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f6b0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f6b4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f6b8:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f6bc:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f6c0:	d2849a10	mov	x16, #0x24d0                	// #9424
   0x0000fffff7d2f6c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f6c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f6cc:	d63f0200	blr	x16
   0x0000fffff7d2f6d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f6d4:	540018e0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f6d8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f6dc:	f2e7fe89	movk	x9, #0x3ff4, lsl #48
   0x0000fffff7d2f6e0:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f6e4:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f6e8:	36d801c9	tbz	w9, #27, 0xfffff7d2f720
   0x0000fffff7d2f6ec:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f6f0:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f6f4:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f6f8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f6fc:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f700:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f704:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f708:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f70c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f710:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f714:	d63f0200	blr	x16
   0x0000fffff7d2f718:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f71c:	540016a0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f720:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f724:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f728:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f72c:	d2911a10	mov	x16, #0x88d0                	// #35024
   0x0000fffff7d2f730:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f734:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f738:	d63f0200	blr	x16
   0x0000fffff7d2f73c:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f740:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f744:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f748:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f74c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f750:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f754:	36d801c9	tbz	w9, #27, 0xfffff7d2f78c
   0x0000fffff7d2f758:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f75c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f760:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f764:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f768:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f76c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f770:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f774:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f778:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f77c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f780:	d63f0200	blr	x16
   0x0000fffff7d2f784:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f788:	54001340	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f78c:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f790:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f794:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f798:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f79c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f7a0:	36d801c9	tbz	w9, #27, 0xfffff7d2f7d8
   0x0000fffff7d2f7a4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f7a8:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f7ac:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f7b0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f7b4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f7b8:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f7bc:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f7c0:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f7c4:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f7c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f7cc:	d63f0200	blr	x16
   0x0000fffff7d2f7d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f7d4:	540010e0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f7d8:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f7dc:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f7e0:	d2997702	mov	x2, #0xcbb8                	// #52152
   0x0000fffff7d2f7e4:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f7e8:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f7ec:	d286fa03	mov	x3, #0x37d0                	// #14288
   0x0000fffff7d2f7f0:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f7f4:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f7f8:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f7fc:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f800:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f804:	d2849a10	mov	x16, #0x24d0                	// #9424
   0x0000fffff7d2f808:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f80c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f810:	d63f0200	blr	x16
   0x0000fffff7d2f814:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f818:	54000ec0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f81c:	d2958e29	mov	x9, #0xac71                	// #44145
   0x0000fffff7d2f820:	f2bb7169	movk	x9, #0xdb8b, lsl #16
   0x0000fffff7d2f824:	f2c00d09	movk	x9, #0x68, lsl #32
   0x0000fffff7d2f828:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7d2f82c:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f830:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f834:	36d801c9	tbz	w9, #27, 0xfffff7d2f86c
   0x0000fffff7d2f838:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f83c:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f840:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f844:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f848:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f84c:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f850:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f854:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f858:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f85c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f860:	d63f0200	blr	x16
   0x0000fffff7d2f864:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f868:	54000c40	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f86c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7d2f870:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f874:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f878:	36d801c9	tbz	w9, #27, 0xfffff7d2f8b0
   0x0000fffff7d2f87c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f880:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f884:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2f888:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f88c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f890:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f894:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f898:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f89c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f8a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f8a4:	d63f0200	blr	x16
   0x0000fffff7d2f8a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f8ac:	54000a20	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f8b0:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f8b4:	f94023ea	ldr	x10, [sp, #64]
   0x0000fffff7d2f8b8:	f100015f	cmp	x10, #0x0
   0x0000fffff7d2f8bc:	540009a0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f8c0:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d2f8c4:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d2f8c8:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f8cc:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7d2f8d0:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7d2f8d4:	aa1503e0	mov	x0, x21
   0x0000fffff7d2f8d8:	d2996301	mov	x1, #0xcb18                	// #51992
   0x0000fffff7d2f8dc:	f2b55801	movk	x1, #0xaac0, lsl #16
   0x0000fffff7d2f8e0:	f2d55541	movk	x1, #0xaaaa, lsl #32
   0x0000fffff7d2f8e4:	d290ee10	mov	x16, #0x8770                	// #34672
   0x0000fffff7d2f8e8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f8ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f8f0:	d63f0200	blr	x16
   0x0000fffff7d2f8f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f8f8:	540007c0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f8fc:	f94027e0	ldr	x0, [sp, #72]
   0x0000fffff7d2f900:	910103e1	add	x1, sp, #0x40
   0x0000fffff7d2f904:	d2909610	mov	x16, #0x84b0                	// #33968
   0x0000fffff7d2f908:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f90c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f910:	d63f0200	blr	x16
   0x0000fffff7d2f914:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f918:	540006c0	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f91c:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f920:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f924:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f928:	fd0407e0	str	d0, [sp, #2056]
   0x0000fffff7d2f92c:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f930:	fd4407e1	ldr	d1, [sp, #2056]
   0x0000fffff7d2f934:	d290d610	mov	x16, #0x86b0                	// #34480
   0x0000fffff7d2f938:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f93c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f940:	d63f0200	blr	x16
   0x0000fffff7d2f944:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f948:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f94c:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f950:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f954:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f958:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f95c:	36d801c9	tbz	w9, #27, 0xfffff7d2f994
   0x0000fffff7d2f960:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f964:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f968:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f96c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f970:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f974:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f978:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f97c:	d29d8c90	mov	x16, #0xec64                	// #60516
   0x0000fffff7d2f980:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f984:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f988:	d63f0200	blr	x16
   0x0000fffff7d2f98c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f990:	54000300	b.eq	0xfffff7d2f9f0  // b.none
   0x0000fffff7d2f994:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f998:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f99c:	91000529	add	x9, x9, #0x1
   0x0000fffff7d2f9a0:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7d2f9a4:	17fffdd7	b	0xfffff7d2f100
   0x0000fffff7d2f9a8:	52800089	mov	w9, #0x4                   	// #4
   0x0000fffff7d2f9ac:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7d2f9b0:	b9000289	str	w9, [x20]
   0x0000fffff7d2f9b4:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f9b8:	f900068a	str	x10, [x20, #8]
   0x0000fffff7d2f9bc:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f9c0:	fd000680	str	d0, [x20, #8]
   0x0000fffff7d2f9c4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f9c8:	d29dbe10	mov	x16, #0xedf0                	// #60912
   0x0000fffff7d2f9cc:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f9d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f9d4:	d63f0200	blr	x16
   0x0000fffff7d2f9d8:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2f9dc:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2f9e0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2f9e4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2f9e8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d2f9ec:	d65f03c0	ret
   0x0000fffff7d2f9f0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f9f4:	d29dc010	mov	x16, #0xee00                	// #60928
   0x0000fffff7d2f9f8:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f9fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fa00:	d63f0200	blr	x16
   0x0000fffff7d2fa04:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2fa08:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2fa0c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2fa10:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2fa14:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7d2fa18:	d65f03c0	ret
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
