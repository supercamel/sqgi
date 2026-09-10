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
   0x0000fffff7d2f034:	d28d0c10	mov	x16, #0x6860                	// #26720
   0x0000fffff7d2f038:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f03c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f040:	d63f0200	blr	x16
   0x0000fffff7d2f044:	f9401ea9	ldr	x9, [x21, #56]
   0x0000fffff7d2f048:	d299da0a	mov	x10, #0xced0                	// #52944
   0x0000fffff7d2f04c:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7d2f050:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7d2f054:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f058:	54006581	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2f05c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7d2f060:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d2f064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d2f068:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f06c:	540064e1	b.ne	0xfffff7d2fd08  // b.any
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
   0x0000fffff7d2f0a4:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f0a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f0ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f0b0:	d63f0200	blr	x16
   0x0000fffff7d2f0b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f0b8:	54006280	b.eq	0xfffff7d2fd08  // b.none
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
   0x0000fffff7d2f0e8:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f0ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f0f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f0f4:	d63f0200	blr	x16
   0x0000fffff7d2f0f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f0fc:	54006060	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f100:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f104:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7d2f108:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f10c:	54005daa	b.ge	0xfffff7d2fcc0  // b.tcont
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
   0x0000fffff7d2f13c:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f140:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f148:	d63f0200	blr	x16
   0x0000fffff7d2f14c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f150:	54005dc0	b.eq	0xfffff7d2fd08  // b.none
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
   0x0000fffff7d2f194:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f198:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f19c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f1a0:	d63f0200	blr	x16
   0x0000fffff7d2f1a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f1a8:	54005b00	b.eq	0xfffff7d2fd08  // b.none
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
   0x0000fffff7d2f1d4:	d291f210	mov	x16, #0x8f90                	// #36752
   0x0000fffff7d2f1d8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f1dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f1e0:	d63f0200	blr	x16
   0x0000fffff7d2f1e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f1e8:	54005900	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f1ec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f1f0:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f1f4:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2f1f8:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2f1fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2f200:	54005841	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2f204:	f94017e0	ldr	x0, [sp, #40]
   0x0000fffff7d2f208:	910083e1	add	x1, sp, #0x20
   0x0000fffff7d2f20c:	d2919a10	mov	x16, #0x8cd0                	// #36048
   0x0000fffff7d2f210:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f214:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f218:	d63f0200	blr	x16
   0x0000fffff7d2f21c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f220:	54005740	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f224:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7d2f228:	36d801c9	tbz	w9, #27, 0xfffff7d2f260
   0x0000fffff7d2f22c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f230:	f94013e3	ldr	x3, [sp, #32]
   0x0000fffff7d2f234:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f238:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f23c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f240:	d2800082	mov	x2, #0x4                   	// #4
   0x0000fffff7d2f244:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f248:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f24c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f250:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f254:	d63f0200	blr	x16
   0x0000fffff7d2f258:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f25c:	54005560	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f260:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f264:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f268:	d2992d02	mov	x2, #0xc968                	// #51560
   0x0000fffff7d2f26c:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f270:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f274:	d2945603	mov	x3, #0xa2b0                	// #41648
   0x0000fffff7d2f278:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2f27c:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f280:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f284:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f288:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f28c:	d28bae10	mov	x16, #0x5d70                	// #23920
   0x0000fffff7d2f290:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f294:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f298:	d63f0200	blr	x16
   0x0000fffff7d2f29c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f2a0:	54005340	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f2a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2f2a8:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f2ac:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2f2b0:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2f2b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2f2b8:	54005281	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2f2bc:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f2c0:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f2c4:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f2c8:	36d801c9	tbz	w9, #27, 0xfffff7d2f300
   0x0000fffff7d2f2cc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f2d0:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f2d4:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f2d8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f2dc:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f2e0:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f2e4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f2e8:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f2ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f2f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f2f4:	d63f0200	blr	x16
   0x0000fffff7d2f2f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f2fc:	54005060	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f300:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f304:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f308:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f30c:	d291d610	mov	x16, #0x8eb0                	// #36528
   0x0000fffff7d2f310:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f314:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f318:	d63f0200	blr	x16
   0x0000fffff7d2f31c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f320:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f324:	36d801c9	tbz	w9, #27, 0xfffff7d2f35c
   0x0000fffff7d2f328:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f32c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f330:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f334:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f338:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f33c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f340:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f344:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f348:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f34c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f350:	d63f0200	blr	x16
   0x0000fffff7d2f354:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f358:	54004d80	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f35c:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f360:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f364:	d2992f02	mov	x2, #0xc978                	// #51576
   0x0000fffff7d2f368:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f36c:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f370:	d2960403	mov	x3, #0xb020                	// #45088
   0x0000fffff7d2f374:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2f378:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f37c:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f380:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f384:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f388:	d28bae10	mov	x16, #0x5d70                	// #23920
   0x0000fffff7d2f38c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f390:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f394:	d63f0200	blr	x16
   0x0000fffff7d2f398:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f39c:	54004b60	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f3a0:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f3a4:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f3a8:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2f3ac:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2f3b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2f3b4:	54004aa1	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2f3b8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f3bc:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f3c0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f3c4:	36d801c9	tbz	w9, #27, 0xfffff7d2f3fc
   0x0000fffff7d2f3c8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f3cc:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f3d0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f3d4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f3d8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f3dc:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f3e0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f3e4:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f3e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f3ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f3f0:	d63f0200	blr	x16
   0x0000fffff7d2f3f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f3f8:	54004880	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f3fc:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f400:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f404:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f408:	d291c610	mov	x16, #0x8e30                	// #36400
   0x0000fffff7d2f40c:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f410:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f414:	d63f0200	blr	x16
   0x0000fffff7d2f418:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f41c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2f420:	36d801c9	tbz	w9, #27, 0xfffff7d2f458
   0x0000fffff7d2f424:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f428:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7d2f42c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f430:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f434:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f438:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2f43c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f440:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f444:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f448:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f44c:	d63f0200	blr	x16
   0x0000fffff7d2f450:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f454:	540045a0	b.eq	0xfffff7d2fd08  // b.none
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
   0x0000fffff7d2f48c:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f490:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f494:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f498:	d63f0200	blr	x16
   0x0000fffff7d2f49c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f4a0:	54004340	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f4a4:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f4a8:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f4ac:	d2993102	mov	x2, #0xc988                	// #51592
   0x0000fffff7d2f4b0:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f4b4:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f4b8:	d297d003	mov	x3, #0xbe80                	// #48768
   0x0000fffff7d2f4bc:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2f4c0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f4c4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f4c8:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f4cc:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f4d0:	d28bae10	mov	x16, #0x5d70                	// #23920
   0x0000fffff7d2f4d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f4d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f4dc:	d63f0200	blr	x16
   0x0000fffff7d2f4e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f4e4:	54004120	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f4e8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f4ec:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f4f0:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2f4f4:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2f4f8:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2f4fc:	54004061	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2f500:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f504:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f508:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f50c:	36d801c9	tbz	w9, #27, 0xfffff7d2f544
   0x0000fffff7d2f510:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f514:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f518:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f51c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f520:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f524:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f528:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f52c:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f530:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f534:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f538:	d63f0200	blr	x16
   0x0000fffff7d2f53c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f540:	54003e40	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f544:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f548:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f54c:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f550:	d291b610	mov	x16, #0x8db0                	// #36272
   0x0000fffff7d2f554:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f558:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f55c:	d63f0200	blr	x16
   0x0000fffff7d2f560:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f564:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2f568:	36d801c9	tbz	w9, #27, 0xfffff7d2f5a0
   0x0000fffff7d2f56c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f570:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7d2f574:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f578:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f57c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f580:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2f584:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f588:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f58c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f590:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f594:	d63f0200	blr	x16
   0x0000fffff7d2f598:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f59c:	54003b60	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f5a0:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f5a4:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f5a8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f5ac:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f5b0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f5b4:	36d801c9	tbz	w9, #27, 0xfffff7d2f5ec
   0x0000fffff7d2f5b8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f5bc:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f5c0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f5c4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f5c8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f5cc:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f5d0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f5d4:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f5d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f5dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f5e0:	d63f0200	blr	x16
   0x0000fffff7d2f5e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f5e8:	54003900	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f5ec:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f5f0:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f5f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f5f8:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f5fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f600:	36d801c9	tbz	w9, #27, 0xfffff7d2f638
   0x0000fffff7d2f604:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f608:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f60c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f610:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f614:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f618:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f61c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f620:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f624:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f628:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f62c:	d63f0200	blr	x16
   0x0000fffff7d2f630:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f634:	540036a0	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f638:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f63c:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f640:	d2993302	mov	x2, #0xc998                	// #51608
   0x0000fffff7d2f644:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f648:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f64c:	d295ee03	mov	x3, #0xaf70                	// #44912
   0x0000fffff7d2f650:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7d2f654:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f658:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f65c:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f660:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f664:	d28bae10	mov	x16, #0x5d70                	// #23920
   0x0000fffff7d2f668:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f66c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f670:	d63f0200	blr	x16
   0x0000fffff7d2f674:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f678:	54003480	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f67c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2f680:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f684:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2f688:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2f68c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2f690:	540033c1	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2f694:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f698:	f2f80189	movk	x9, #0xc00c, lsl #48
   0x0000fffff7d2f69c:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f6a0:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f6a4:	36d801c9	tbz	w9, #27, 0xfffff7d2f6dc
   0x0000fffff7d2f6a8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f6ac:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f6b0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f6b4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f6b8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f6bc:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f6c0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f6c4:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f6c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f6cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f6d0:	d63f0200	blr	x16
   0x0000fffff7d2f6d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f6d8:	54003180	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f6dc:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f6e0:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f6e4:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f6e8:	d290ec10	mov	x16, #0x8760                	// #34656
   0x0000fffff7d2f6ec:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f6f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f6f4:	d63f0200	blr	x16
   0x0000fffff7d2f6f8:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f6fc:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f700:	36d801c9	tbz	w9, #27, 0xfffff7d2f738
   0x0000fffff7d2f704:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f708:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f70c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f710:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f714:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f718:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f71c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f720:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f724:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f728:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f72c:	d63f0200	blr	x16
   0x0000fffff7d2f730:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f734:	54002ea0	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f738:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f73c:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f740:	d2993702	mov	x2, #0xc9b8                	// #51640
   0x0000fffff7d2f744:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f748:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f74c:	d2893203	mov	x3, #0x4990                	// #18832
   0x0000fffff7d2f750:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7d2f754:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f758:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f75c:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f760:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f764:	d28bae10	mov	x16, #0x5d70                	// #23920
   0x0000fffff7d2f768:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f76c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f770:	d63f0200	blr	x16
   0x0000fffff7d2f774:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f778:	54002c80	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f77c:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f780:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f784:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2f788:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2f78c:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2f790:	54002bc1	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2f794:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f798:	f2e7ff89	movk	x9, #0x3ffc, lsl #48
   0x0000fffff7d2f79c:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f7a0:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f7a4:	36d801c9	tbz	w9, #27, 0xfffff7d2f7dc
   0x0000fffff7d2f7a8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f7ac:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f7b0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f7b4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f7b8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f7bc:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f7c0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f7c4:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f7c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f7cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f7d0:	d63f0200	blr	x16
   0x0000fffff7d2f7d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f7d8:	54002980	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f7dc:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f7e0:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f7e4:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f7e8:	d2914410	mov	x16, #0x8a20                	// #35360
   0x0000fffff7d2f7ec:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f7f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f7f4:	d63f0200	blr	x16
   0x0000fffff7d2f7f8:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f7fc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2f800:	36d801c9	tbz	w9, #27, 0xfffff7d2f838
   0x0000fffff7d2f804:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f808:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7d2f80c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f810:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f814:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f818:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2f81c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f820:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f824:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f828:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f82c:	d63f0200	blr	x16
   0x0000fffff7d2f830:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f834:	540026a0	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f838:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f83c:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f840:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f844:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f848:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f84c:	36d801c9	tbz	w9, #27, 0xfffff7d2f884
   0x0000fffff7d2f850:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f854:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f858:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f85c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f860:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f864:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f868:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f86c:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f870:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f874:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f878:	d63f0200	blr	x16
   0x0000fffff7d2f87c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f880:	54002440	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f884:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f888:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f88c:	d2993b02	mov	x2, #0xc9d8                	// #51672
   0x0000fffff7d2f890:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2f894:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f898:	d2969803	mov	x3, #0xb4c0                	// #46272
   0x0000fffff7d2f89c:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7d2f8a0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f8a4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f8a8:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2f8ac:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f8b0:	d28bae10	mov	x16, #0x5d70                	// #23920
   0x0000fffff7d2f8b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f8b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f8bc:	d63f0200	blr	x16
   0x0000fffff7d2f8c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f8c4:	54002220	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f8c8:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f8cc:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f8d0:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2f8d4:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2f8d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2f8dc:	54002161	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2f8e0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f8e4:	f2e7fe89	movk	x9, #0x3ff4, lsl #48
   0x0000fffff7d2f8e8:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f8ec:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f8f0:	36d801c9	tbz	w9, #27, 0xfffff7d2f928
   0x0000fffff7d2f8f4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f8f8:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f8fc:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f900:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f904:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f908:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f90c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f910:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f914:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f918:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f91c:	d63f0200	blr	x16
   0x0000fffff7d2f920:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f924:	54001f20	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f928:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f92c:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f930:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f934:	d2913210	mov	x16, #0x8990                	// #35216
   0x0000fffff7d2f938:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f93c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f940:	d63f0200	blr	x16
   0x0000fffff7d2f944:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f948:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2f94c:	36d801c9	tbz	w9, #27, 0xfffff7d2f984
   0x0000fffff7d2f950:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f954:	f9401be3	ldr	x3, [sp, #48]
   0x0000fffff7d2f958:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f95c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f960:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f964:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2f968:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f96c:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f970:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f974:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f978:	d63f0200	blr	x16
   0x0000fffff7d2f97c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f980:	54001c40	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f984:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f988:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f98c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f990:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f994:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f998:	36d801c9	tbz	w9, #27, 0xfffff7d2f9d0
   0x0000fffff7d2f99c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f9a0:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f9a4:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f9a8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f9ac:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f9b0:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f9b4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f9b8:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2f9bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f9c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f9c4:	d63f0200	blr	x16
   0x0000fffff7d2f9c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f9cc:	540019e0	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2f9d0:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f9d4:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f9d8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f9dc:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f9e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f9e4:	36d801c9	tbz	w9, #27, 0xfffff7d2fa1c
   0x0000fffff7d2f9e8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f9ec:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f9f0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f9f4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f9f8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f9fc:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2fa00:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2fa04:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2fa08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2fa0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fa10:	d63f0200	blr	x16
   0x0000fffff7d2fa14:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2fa18:	54001780	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fa1c:	aa1303e0	mov	x0, x19
   0x0000fffff7d2fa20:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2fa24:	d2993f02	mov	x2, #0xc9f8                	// #51704
   0x0000fffff7d2fa28:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7d2fa2c:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2fa30:	d2969e03	mov	x3, #0xb4f0                	// #46320
   0x0000fffff7d2fa34:	f2b557e3	movk	x3, #0xaabf, lsl #16
   0x0000fffff7d2fa38:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2fa3c:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2fa40:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7d2fa44:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2fa48:	d28bae10	mov	x16, #0x5d70                	// #23920
   0x0000fffff7d2fa4c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2fa50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fa54:	d63f0200	blr	x16
   0x0000fffff7d2fa58:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2fa5c:	54001560	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fa60:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2fa64:	91000263	add	x3, x19, #0x0
   0x0000fffff7d2fa68:	d2800004	mov	x4, #0x0                   	// #0
   0x0000fffff7d2fa6c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2fa70:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7d2fa74:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2fa78:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2fa7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2fa80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fa84:	d63f0200	blr	x16
   0x0000fffff7d2fa88:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2fa8c:	540013e0	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fa90:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7d2fa94:	5280040a	mov	w10, #0x20                  	// #32
   0x0000fffff7d2fa98:	72a1400a	movk	w10, #0xa00, lsl #16
   0x0000fffff7d2fa9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2faa0:	54001341	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2faa4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7d2faa8:	f9001be9	str	x9, [sp, #48]
   0x0000fffff7d2faac:	d2958e29	mov	x9, #0xac71                	// #44145
   0x0000fffff7d2fab0:	f2bb7169	movk	x9, #0xdb8b, lsl #16
   0x0000fffff7d2fab4:	f2c00d09	movk	x9, #0x68, lsl #32
   0x0000fffff7d2fab8:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7d2fabc:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2fac0:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2fac4:	36d801c9	tbz	w9, #27, 0xfffff7d2fafc
   0x0000fffff7d2fac8:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2facc:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2fad0:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2fad4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2fad8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2fadc:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2fae0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2fae4:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2fae8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2faec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2faf0:	d63f0200	blr	x16
   0x0000fffff7d2faf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2faf8:	54001080	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fafc:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7d2fb00:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2fb04:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2fb08:	36d801c9	tbz	w9, #27, 0xfffff7d2fb40
   0x0000fffff7d2fb0c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2fb10:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2fb14:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2fb18:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2fb1c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2fb20:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2fb24:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2fb28:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2fb2c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2fb30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fb34:	d63f0200	blr	x16
   0x0000fffff7d2fb38:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2fb3c:	54000e60	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fb40:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2fb44:	d28000aa	mov	x10, #0x5                   	// #5
   0x0000fffff7d2fb48:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7d2fb4c:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d2fb50:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2fb54:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7d2fb58:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7d2fb5c:	aa1503e0	mov	x0, x21
   0x0000fffff7d2fb60:	d2992b01	mov	x1, #0xc958                	// #51544
   0x0000fffff7d2fb64:	f2b55821	movk	x1, #0xaac1, lsl #16
   0x0000fffff7d2fb68:	f2d55541	movk	x1, #0xaaaa, lsl #32
   0x0000fffff7d2fb6c:	d291f210	mov	x16, #0x8f90                	// #36752
   0x0000fffff7d2fb70:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2fb74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fb78:	d63f0200	blr	x16
   0x0000fffff7d2fb7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2fb80:	54000c40	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fb84:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7d2fb88:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2fb8c:	f2a1000a	movk	x10, #0x800, lsl #16
   0x0000fffff7d2fb90:	8a0a0129	and	x9, x9, x10
   0x0000fffff7d2fb94:	f100013f	cmp	x9, #0x0
   0x0000fffff7d2fb98:	54000b81	b.ne	0xfffff7d2fd08  // b.any
   0x0000fffff7d2fb9c:	f94027e0	ldr	x0, [sp, #72]
   0x0000fffff7d2fba0:	910103e1	add	x1, sp, #0x40
   0x0000fffff7d2fba4:	d2919a10	mov	x16, #0x8cd0                	// #36048
   0x0000fffff7d2fba8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2fbac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fbb0:	d63f0200	blr	x16
   0x0000fffff7d2fbb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2fbb8:	54000a80	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fbbc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2fbc0:	36d801c9	tbz	w9, #27, 0xfffff7d2fbf8
   0x0000fffff7d2fbc4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2fbc8:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2fbcc:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2fbd0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2fbd4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2fbd8:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2fbdc:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2fbe0:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2fbe4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2fbe8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fbec:	d63f0200	blr	x16
   0x0000fffff7d2fbf0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2fbf4:	540008a0	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fbf8:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2fbfc:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2fc00:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2fc04:	fd0407e0	str	d0, [sp, #2056]
   0x0000fffff7d2fc08:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2fc0c:	fd4407e1	ldr	d1, [sp, #2056]
   0x0000fffff7d2fc10:	d290ee10	mov	x16, #0x8770                	// #34672
   0x0000fffff7d2fc14:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2fc18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fc1c:	d63f0200	blr	x16
   0x0000fffff7d2fc20:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2fc24:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2fc28:	36d801c9	tbz	w9, #27, 0xfffff7d2fc60
   0x0000fffff7d2fc2c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2fc30:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2fc34:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2fc38:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2fc3c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2fc40:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2fc44:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2fc48:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2fc4c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2fc50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fc54:	d63f0200	blr	x16
   0x0000fffff7d2fc58:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2fc5c:	54000560	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fc60:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2fc64:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2fc68:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2fc6c:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2fc70:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2fc74:	36d801c9	tbz	w9, #27, 0xfffff7d2fcac
   0x0000fffff7d2fc78:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2fc7c:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2fc80:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2fc84:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2fc88:	aa1303e1	mov	x1, x19
   0x0000fffff7d2fc8c:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2fc90:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2fc94:	d2801e10	mov	x16, #0xf0                  	// #240
   0x0000fffff7d2fc98:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2fc9c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fca0:	d63f0200	blr	x16
   0x0000fffff7d2fca4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2fca8:	54000300	b.eq	0xfffff7d2fd08  // b.none
   0x0000fffff7d2fcac:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2fcb0:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2fcb4:	91000529	add	x9, x9, #0x1
   0x0000fffff7d2fcb8:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7d2fcbc:	17fffd11	b	0xfffff7d2f100
   0x0000fffff7d2fcc0:	52800089	mov	w9, #0x4                   	// #4
   0x0000fffff7d2fcc4:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7d2fcc8:	b9000289	str	w9, [x20]
   0x0000fffff7d2fccc:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2fcd0:	f900068a	str	x10, [x20, #8]
   0x0000fffff7d2fcd4:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2fcd8:	fd000680	str	d0, [x20, #8]
   0x0000fffff7d2fcdc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2fce0:	d2809610	mov	x16, #0x4b0                 	// #1200
   0x0000fffff7d2fce4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2fce8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fcec:	d63f0200	blr	x16
   0x0000fffff7d2fcf0:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2fcf4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2fcf8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2fcfc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2fd00:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d2fd04:	d65f03c0	ret
   0x0000fffff7d2fd08:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2fd0c:	d2809810	mov	x16, #0x4c0                 	// #1216
   0x0000fffff7d2fd10:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2fd14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fd18:	d63f0200	blr	x16
   0x0000fffff7d2fd1c:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2fd20:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2fd24:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2fd28:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2fd2c:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7d2fd30:	d65f03c0	ret
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
