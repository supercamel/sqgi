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
   0x0000fffff7d2f034:	d28c1010	mov	x16, #0x6080                	// #24704
   0x0000fffff7d2f038:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f03c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f040:	d63f0200	blr	x16
   0x0000fffff7d2f044:	f9401ea9	ldr	x9, [x21, #56]
   0x0000fffff7d2f048:	d299da0a	mov	x10, #0xced0                	// #52944
   0x0000fffff7d2f04c:	f2b557ca	movk	x10, #0xaabe, lsl #16
   0x0000fffff7d2f050:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7d2f054:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f058:	54004e21	b.ne	0xfffff7d2fa1c  // b.any
   0x0000fffff7d2f05c:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7d2f060:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7d2f064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7d2f068:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f06c:	54004d81	b.ne	0xfffff7d2fa1c  // b.any
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
   0x0000fffff7d2f0a4:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f0a8:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f0ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f0b0:	d63f0200	blr	x16
   0x0000fffff7d2f0b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f0b8:	54004b20	b.eq	0xfffff7d2fa1c  // b.none
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
   0x0000fffff7d2f0e8:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f0ec:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f0f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f0f4:	d63f0200	blr	x16
   0x0000fffff7d2f0f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f0fc:	54004900	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f100:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f104:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7d2f108:	eb0a013f	cmp	x9, x10
   0x0000fffff7d2f10c:	5400464a	b.ge	0xfffff7d2f9d4  // b.tcont
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
   0x0000fffff7d2f13c:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f140:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f144:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f148:	d63f0200	blr	x16
   0x0000fffff7d2f14c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f150:	54004660	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f154:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f158:	d2951d2a	mov	x10, #0xa8e9                	// #43241
   0x0000fffff7d2f15c:	f2a2f80a	movk	x10, #0x17c0, lsl #16
   0x0000fffff7d2f160:	f2c7eaea	movk	x10, #0x3f57, lsl #32
   0x0000fffff7d2f164:	f2f51d0a	movk	x10, #0xa8e8, lsl #48
   0x0000fffff7d2f168:	9b4a7d2b	smulh	x11, x9, x10
   0x0000fffff7d2f16c:	8b09016b	add	x11, x11, x9
   0x0000fffff7d2f170:	9346fd6b	asr	x11, x11, #6
   0x0000fffff7d2f174:	d37ffd6c	lsr	x12, x11, #63
   0x0000fffff7d2f178:	8b0c016b	add	x11, x11, x12
   0x0000fffff7d2f17c:	d2800c2a	mov	x10, #0x61                  	// #97
   0x0000fffff7d2f180:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d2f184:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f188:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7d2f18c:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2f190:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f194:	36d801c9	tbz	w9, #27, 0xfffff7d2f1cc
   0x0000fffff7d2f198:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f19c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f1a0:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2f1a4:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f1a8:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f1ac:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f1b0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f1b4:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f1b8:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f1bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f1c0:	d63f0200	blr	x16
   0x0000fffff7d2f1c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f1c8:	540042a0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f1cc:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f1d0:	f94017ea	ldr	x10, [sp, #40]
   0x0000fffff7d2f1d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7d2f1d8:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f1dc:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f1e0:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7d2f1e4:	aa1503e0	mov	x0, x21
   0x0000fffff7d2f1e8:	d2994f01	mov	x1, #0xca78                	// #51832
   0x0000fffff7d2f1ec:	f2b55801	movk	x1, #0xaac0, lsl #16
   0x0000fffff7d2f1f0:	f2d55541	movk	x1, #0xaaaa, lsl #32
   0x0000fffff7d2f1f4:	d290f610	mov	x16, #0x87b0                	// #34736
   0x0000fffff7d2f1f8:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f1fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f200:	d63f0200	blr	x16
   0x0000fffff7d2f204:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f208:	540040a0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f20c:	f94017e0	ldr	x0, [sp, #40]
   0x0000fffff7d2f210:	910083e1	add	x1, sp, #0x20
   0x0000fffff7d2f214:	d2909e10	mov	x16, #0x84f0                	// #34032
   0x0000fffff7d2f218:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f21c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f220:	d63f0200	blr	x16
   0x0000fffff7d2f224:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f228:	54003fa0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f22c:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f230:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f234:	d2995102	mov	x2, #0xca88                	// #51848
   0x0000fffff7d2f238:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f23c:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f240:	d285a603	mov	x3, #0x2d30                	// #11568
   0x0000fffff7d2f244:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f248:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f24c:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f250:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f254:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f258:	d2850010	mov	x16, #0x2800                	// #10240
   0x0000fffff7d2f25c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f260:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f264:	d63f0200	blr	x16
   0x0000fffff7d2f268:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f26c:	54003d80	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f270:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7d2f274:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f278:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f27c:	36d801c9	tbz	w9, #27, 0xfffff7d2f2b4
   0x0000fffff7d2f280:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f284:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f288:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f28c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f290:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f294:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f298:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f29c:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f2a0:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f2a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f2a8:	d63f0200	blr	x16
   0x0000fffff7d2f2ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f2b0:	54003b60	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f2b4:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f2b8:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f2bc:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f2c0:	d291be10	mov	x16, #0x8df0                	// #36336
   0x0000fffff7d2f2c4:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f2c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f2cc:	d63f0200	blr	x16
   0x0000fffff7d2f2d0:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f2d4:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f2d8:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f2dc:	d2995302	mov	x2, #0xca98                	// #51864
   0x0000fffff7d2f2e0:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f2e4:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f2e8:	d285c803	mov	x3, #0x2e40                	// #11840
   0x0000fffff7d2f2ec:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f2f0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f2f4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f2f8:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f2fc:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f300:	d2850010	mov	x16, #0x2800                	// #10240
   0x0000fffff7d2f304:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f308:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f30c:	d63f0200	blr	x16
   0x0000fffff7d2f310:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f314:	54003840	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f318:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f31c:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f320:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f324:	36d801c9	tbz	w9, #27, 0xfffff7d2f35c
   0x0000fffff7d2f328:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f32c:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f330:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f334:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f338:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f33c:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f340:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f344:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f348:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f34c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f350:	d63f0200	blr	x16
   0x0000fffff7d2f354:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f358:	54003620	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f35c:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f360:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f364:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f368:	d291ae10	mov	x16, #0x8d70                	// #36208
   0x0000fffff7d2f36c:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f370:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f374:	d63f0200	blr	x16
   0x0000fffff7d2f378:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f37c:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f380:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f384:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f388:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f38c:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f390:	36d801c9	tbz	w9, #27, 0xfffff7d2f3c8
   0x0000fffff7d2f394:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f398:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f39c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f3a0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f3a4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f3a8:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f3ac:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f3b0:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f3b4:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f3b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f3bc:	d63f0200	blr	x16
   0x0000fffff7d2f3c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f3c4:	540032c0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f3c8:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f3cc:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f3d0:	d2995502	mov	x2, #0xcaa8                	// #51880
   0x0000fffff7d2f3d4:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f3d8:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f3dc:	d285ea03	mov	x3, #0x2f50                	// #12112
   0x0000fffff7d2f3e0:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f3e4:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f3e8:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f3ec:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f3f0:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f3f4:	d2850010	mov	x16, #0x2800                	// #10240
   0x0000fffff7d2f3f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f3fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f400:	d63f0200	blr	x16
   0x0000fffff7d2f404:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f408:	540030a0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f40c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f410:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f414:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f418:	36d801c9	tbz	w9, #27, 0xfffff7d2f450
   0x0000fffff7d2f41c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f420:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f424:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f428:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f42c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f430:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f434:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f438:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f43c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f440:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f444:	d63f0200	blr	x16
   0x0000fffff7d2f448:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f44c:	54002e80	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f450:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f454:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f458:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f45c:	d2919e10	mov	x16, #0x8cf0                	// #36080
   0x0000fffff7d2f460:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f468:	d63f0200	blr	x16
   0x0000fffff7d2f46c:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f470:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f474:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f478:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f47c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f480:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f484:	36d801c9	tbz	w9, #27, 0xfffff7d2f4bc
   0x0000fffff7d2f488:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f48c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f490:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f494:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f498:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f49c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f4a0:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f4a4:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f4a8:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f4ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f4b0:	d63f0200	blr	x16
   0x0000fffff7d2f4b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f4b8:	54002b20	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f4bc:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f4c0:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f4c4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f4c8:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f4cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f4d0:	36d801c9	tbz	w9, #27, 0xfffff7d2f508
   0x0000fffff7d2f4d4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f4d8:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f4dc:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f4e0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f4e4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f4e8:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f4ec:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f4f0:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f4f4:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f4f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f4fc:	d63f0200	blr	x16
   0x0000fffff7d2f500:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f504:	540028c0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f508:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f50c:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f510:	d2995702	mov	x2, #0xcab8                	// #51896
   0x0000fffff7d2f514:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f518:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f51c:	d28b6603	mov	x3, #0x5b30                	// #23344
   0x0000fffff7d2f520:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f524:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f528:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f52c:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f530:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f534:	d2850010	mov	x16, #0x2800                	// #10240
   0x0000fffff7d2f538:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f53c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f540:	d63f0200	blr	x16
   0x0000fffff7d2f544:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f548:	540026a0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f54c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f550:	f2f80189	movk	x9, #0xc00c, lsl #48
   0x0000fffff7d2f554:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f558:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f55c:	36d801c9	tbz	w9, #27, 0xfffff7d2f594
   0x0000fffff7d2f560:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f564:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f568:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f56c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f570:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f574:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f578:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f57c:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f580:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f584:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f588:	d63f0200	blr	x16
   0x0000fffff7d2f58c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f590:	54002460	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f594:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f598:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f59c:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f5a0:	d290d410	mov	x16, #0x86a0                	// #34464
   0x0000fffff7d2f5a4:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f5a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f5ac:	d63f0200	blr	x16
   0x0000fffff7d2f5b0:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f5b4:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f5b8:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f5bc:	d2995b02	mov	x2, #0xcad8                	// #51928
   0x0000fffff7d2f5c0:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f5c4:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f5c8:	d28ac003	mov	x3, #0x5600                	// #22016
   0x0000fffff7d2f5cc:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f5d0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f5d4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f5d8:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f5dc:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f5e0:	d2850010	mov	x16, #0x2800                	// #10240
   0x0000fffff7d2f5e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f5e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f5ec:	d63f0200	blr	x16
   0x0000fffff7d2f5f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f5f4:	54002140	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f5f8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f5fc:	f2e7ff89	movk	x9, #0x3ffc, lsl #48
   0x0000fffff7d2f600:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f604:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f608:	36d801c9	tbz	w9, #27, 0xfffff7d2f640
   0x0000fffff7d2f60c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f610:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f614:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f618:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f61c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f620:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f624:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f628:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f62c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f630:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f634:	d63f0200	blr	x16
   0x0000fffff7d2f638:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f63c:	54001f00	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f640:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f644:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f648:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f64c:	d2912c10	mov	x16, #0x8960                	// #35168
   0x0000fffff7d2f650:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f654:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f658:	d63f0200	blr	x16
   0x0000fffff7d2f65c:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f660:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f664:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f668:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f66c:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f670:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f674:	36d801c9	tbz	w9, #27, 0xfffff7d2f6ac
   0x0000fffff7d2f678:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f67c:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f680:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f684:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f688:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f68c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f690:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f694:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f698:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f69c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f6a0:	d63f0200	blr	x16
   0x0000fffff7d2f6a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f6a8:	54001ba0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f6ac:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f6b0:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f6b4:	d2995f02	mov	x2, #0xcaf8                	// #51960
   0x0000fffff7d2f6b8:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f6bc:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f6c0:	d28ae203	mov	x3, #0x5710                	// #22288
   0x0000fffff7d2f6c4:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f6c8:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f6cc:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f6d0:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f6d4:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f6d8:	d2850010	mov	x16, #0x2800                	// #10240
   0x0000fffff7d2f6dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f6e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f6e4:	d63f0200	blr	x16
   0x0000fffff7d2f6e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f6ec:	54001980	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f6f0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7d2f6f4:	f2e7fe89	movk	x9, #0x3ff4, lsl #48
   0x0000fffff7d2f6f8:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f6fc:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f700:	36d801c9	tbz	w9, #27, 0xfffff7d2f738
   0x0000fffff7d2f704:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f708:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f70c:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f710:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f714:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f718:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f71c:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f720:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f724:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f728:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f72c:	d63f0200	blr	x16
   0x0000fffff7d2f730:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f734:	54001740	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f738:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f73c:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f740:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f744:	d2911a10	mov	x16, #0x88d0                	// #35024
   0x0000fffff7d2f748:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f74c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f750:	d63f0200	blr	x16
   0x0000fffff7d2f754:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7d2f758:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7d2f75c:	fd401be1	ldr	d1, [sp, #48]
   0x0000fffff7d2f760:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f764:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f768:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7d2f76c:	36d801c9	tbz	w9, #27, 0xfffff7d2f7a4
   0x0000fffff7d2f770:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f774:	f94017e3	ldr	x3, [sp, #40]
   0x0000fffff7d2f778:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f77c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f780:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f784:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7d2f788:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f78c:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f790:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f794:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f798:	d63f0200	blr	x16
   0x0000fffff7d2f79c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f7a0:	540013e0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f7a4:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f7a8:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f7ac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f7b0:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f7b4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f7b8:	36d801c9	tbz	w9, #27, 0xfffff7d2f7f0
   0x0000fffff7d2f7bc:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f7c0:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f7c4:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f7c8:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f7cc:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f7d0:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f7d4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f7d8:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f7dc:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f7e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f7e4:	d63f0200	blr	x16
   0x0000fffff7d2f7e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f7ec:	54001180	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f7f0:	aa1303e0	mov	x0, x19
   0x0000fffff7d2f7f4:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7d2f7f8:	d2996302	mov	x2, #0xcb18                	// #51992
   0x0000fffff7d2f7fc:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7d2f800:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7d2f804:	d286fa03	mov	x3, #0x37d0                	// #14288
   0x0000fffff7d2f808:	f2b557c3	movk	x3, #0xaabe, lsl #16
   0x0000fffff7d2f80c:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7d2f810:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7d2f814:	f2b557c4	movk	x4, #0xaabe, lsl #16
   0x0000fffff7d2f818:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7d2f81c:	d2850010	mov	x16, #0x2800                	// #10240
   0x0000fffff7d2f820:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7d2f824:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f828:	d63f0200	blr	x16
   0x0000fffff7d2f82c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f830:	54000f60	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f834:	d2958e29	mov	x9, #0xac71                	// #44145
   0x0000fffff7d2f838:	f2bb7169	movk	x9, #0xdb8b, lsl #16
   0x0000fffff7d2f83c:	f2c00d09	movk	x9, #0x68, lsl #32
   0x0000fffff7d2f840:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7d2f844:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7d2f848:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7d2f84c:	36d801c9	tbz	w9, #27, 0xfffff7d2f884
   0x0000fffff7d2f850:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f854:	f9401fe3	ldr	x3, [sp, #56]
   0x0000fffff7d2f858:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f85c:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f860:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f864:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7d2f868:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f86c:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f870:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f874:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f878:	d63f0200	blr	x16
   0x0000fffff7d2f87c:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f880:	54000ce0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f884:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7d2f888:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f88c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7d2f890:	36d801c9	tbz	w9, #27, 0xfffff7d2f8c8
   0x0000fffff7d2f894:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f898:	f94023e3	ldr	x3, [sp, #64]
   0x0000fffff7d2f89c:	d2800044	mov	x4, #0x2                   	// #2
   0x0000fffff7d2f8a0:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f8a4:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f8a8:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7d2f8ac:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f8b0:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f8b4:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f8b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f8bc:	d63f0200	blr	x16
   0x0000fffff7d2f8c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f8c4:	54000ac0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f8c8:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f8cc:	d28cccea	mov	x10, #0x6667                	// #26215
   0x0000fffff7d2f8d0:	f2acccca	movk	x10, #0x6666, lsl #16
   0x0000fffff7d2f8d4:	f2ccccca	movk	x10, #0x6666, lsl #32
   0x0000fffff7d2f8d8:	f2ecccca	movk	x10, #0x6666, lsl #48
   0x0000fffff7d2f8dc:	9b4a7d2b	smulh	x11, x9, x10
   0x0000fffff7d2f8e0:	9341fd6b	asr	x11, x11, #1
   0x0000fffff7d2f8e4:	d37ffd6c	lsr	x12, x11, #63
   0x0000fffff7d2f8e8:	8b0c016b	add	x11, x11, x12
   0x0000fffff7d2f8ec:	d28000aa	mov	x10, #0x5                   	// #5
   0x0000fffff7d2f8f0:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7d2f8f4:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7d2f8f8:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7d2f8fc:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7d2f900:	aa1503e0	mov	x0, x21
   0x0000fffff7d2f904:	d2994f01	mov	x1, #0xca78                	// #51832
   0x0000fffff7d2f908:	f2b55801	movk	x1, #0xaac0, lsl #16
   0x0000fffff7d2f90c:	f2d55541	movk	x1, #0xaaaa, lsl #32
   0x0000fffff7d2f910:	d290f610	mov	x16, #0x87b0                	// #34736
   0x0000fffff7d2f914:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f918:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f91c:	d63f0200	blr	x16
   0x0000fffff7d2f920:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f924:	540007c0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f928:	f94027e0	ldr	x0, [sp, #72]
   0x0000fffff7d2f92c:	910103e1	add	x1, sp, #0x40
   0x0000fffff7d2f930:	d2909e10	mov	x16, #0x84f0                	// #34032
   0x0000fffff7d2f934:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7d2f938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f93c:	d63f0200	blr	x16
   0x0000fffff7d2f940:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f944:	540006c0	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f948:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7d2f94c:	fd0403e0	str	d0, [sp, #2048]
   0x0000fffff7d2f950:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7d2f954:	fd0407e0	str	d0, [sp, #2056]
   0x0000fffff7d2f958:	fd4403e0	ldr	d0, [sp, #2048]
   0x0000fffff7d2f95c:	fd4407e1	ldr	d1, [sp, #2056]
   0x0000fffff7d2f960:	d290d610	mov	x16, #0x86b0                	// #34480
   0x0000fffff7d2f964:	f2b55630	movk	x16, #0xaab1, lsl #16
   0x0000fffff7d2f968:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f96c:	d63f0200	blr	x16
   0x0000fffff7d2f970:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7d2f974:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f978:	fd4017e1	ldr	d1, [sp, #40]
   0x0000fffff7d2f97c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7d2f980:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7d2f984:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7d2f988:	36d801c9	tbz	w9, #27, 0xfffff7d2f9c0
   0x0000fffff7d2f98c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f990:	f9400be3	ldr	x3, [sp, #16]
   0x0000fffff7d2f994:	d2800084	mov	x4, #0x4                   	// #4
   0x0000fffff7d2f998:	f2a0a004	movk	x4, #0x500, lsl #16
   0x0000fffff7d2f99c:	aa1303e1	mov	x1, x19
   0x0000fffff7d2f9a0:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7d2f9a4:	d2800005	mov	x5, #0x0                   	// #0
   0x0000fffff7d2f9a8:	d29dd490	mov	x16, #0xeea4                	// #61092
   0x0000fffff7d2f9ac:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f9b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2f9b4:	d63f0200	blr	x16
   0x0000fffff7d2f9b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7d2f9bc:	54000300	b.eq	0xfffff7d2fa1c  // b.none
   0x0000fffff7d2f9c0:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7d2f9c4:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7d2f9c8:	91000529	add	x9, x9, #0x1
   0x0000fffff7d2f9cc:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7d2f9d0:	17fffdcc	b	0xfffff7d2f100
   0x0000fffff7d2f9d4:	52800089	mov	w9, #0x4                   	// #4
   0x0000fffff7d2f9d8:	72a0a009	movk	w9, #0x500, lsl #16
   0x0000fffff7d2f9dc:	b9000289	str	w9, [x20]
   0x0000fffff7d2f9e0:	d280000a	mov	x10, #0x0                   	// #0
   0x0000fffff7d2f9e4:	f900068a	str	x10, [x20, #8]
   0x0000fffff7d2f9e8:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7d2f9ec:	fd000680	str	d0, [x20, #8]
   0x0000fffff7d2f9f0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2f9f4:	d29e0610	mov	x16, #0xf030                	// #61488
   0x0000fffff7d2f9f8:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2f9fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fa00:	d63f0200	blr	x16
   0x0000fffff7d2fa04:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2fa08:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2fa0c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2fa10:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2fa14:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7d2fa18:	d65f03c0	ret
   0x0000fffff7d2fa1c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7d2fa20:	d29e0810	mov	x16, #0xf040                	// #61504
   0x0000fffff7d2fa24:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7d2fa28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7d2fa2c:	d63f0200	blr	x16
   0x0000fffff7d2fa30:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7d2fa34:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7d2fa38:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7d2fa3c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7d2fa40:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7d2fa44:	d65f03c0	ret
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
