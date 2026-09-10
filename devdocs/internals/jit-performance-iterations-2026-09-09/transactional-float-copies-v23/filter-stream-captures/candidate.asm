Dump of assembler code from 0xfffff7f83000 to 0xfffff7f84000:
   0x0000fffff7f83000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f83004:	910003fd	mov	x29, sp
   0x0000fffff7f83008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f8300c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f83010:	d13003ff	sub	sp, sp, #0xc00
   0x0000fffff7f83014:	aa0003f3	mov	x19, x0
   0x0000fffff7f83018:	aa0103f4	mov	x20, x1
   0x0000fffff7f8301c:	aa0203f5	mov	x21, x2
   0x0000fffff7f83020:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83024:	912063e1	add	x1, sp, #0x818
   0x0000fffff7f83028:	d2996c02	mov	x2, #0xcb60                	// #52064
   0x0000fffff7f8302c:	f2b557a2	movk	x2, #0xaabd, lsl #16
   0x0000fffff7f83030:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f83034:	d2910410	mov	x16, #0x8820                	// #34848
   0x0000fffff7f83038:	f2b55650	movk	x16, #0xaab2, lsl #16
   0x0000fffff7f8303c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83040:	d63f0200	blr	x16
   0x0000fffff7f83044:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83048:	f90403e9	str	x9, [sp, #2048]
   0x0000fffff7f8304c:	f9401ea9	ldr	x9, [x21, #56]
   0x0000fffff7f83050:	d299da0a	mov	x10, #0xced0                	// #52944
   0x0000fffff7f83054:	f2b557ea	movk	x10, #0xaabf, lsl #16
   0x0000fffff7f83058:	f2d5554a	movk	x10, #0xaaaa, lsl #32
   0x0000fffff7f8305c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83060:	540020e1	b.ne	0xfffff7f8347c  // b.any
   0x0000fffff7f83064:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83068:	aa1303e1	mov	x1, x19
   0x0000fffff7f8306c:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7f83070:	d2846610	mov	x16, #0x2330                	// #9008
   0x0000fffff7f83074:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83078:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8307c:	d63f0200	blr	x16
   0x0000fffff7f83080:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83084:	54001fc0	b.eq	0xfffff7f8347c  // b.none
   0x0000fffff7f83088:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f8308c:	aa1303e1	mov	x1, x19
   0x0000fffff7f83090:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7f83094:	d2846610	mov	x16, #0x2330                	// #9008
   0x0000fffff7f83098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8309c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f830a0:	d63f0200	blr	x16
   0x0000fffff7f830a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f830a8:	54001ea0	b.eq	0xfffff7f8347c  // b.none
   0x0000fffff7f830ac:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f830b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f830b4:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7f830b8:	d2846610	mov	x16, #0x2330                	// #9008
   0x0000fffff7f830bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f830c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f830c4:	d63f0200	blr	x16
   0x0000fffff7f830c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f830cc:	54001d80	b.eq	0xfffff7f8347c  // b.none
   0x0000fffff7f830d0:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f830d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f830d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f830dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f830e0:	54001ce1	b.ne	0xfffff7f8347c  // b.any
   0x0000fffff7f830e4:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f830e8:	f90007e9	str	x9, [sp, #8]
   0x0000fffff7f830ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f830f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f830f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f830f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f830fc:	54001c01	b.ne	0xfffff7f8347c  // b.any
   0x0000fffff7f83100:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7f83104:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7f83108:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8310c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83110:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83114:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83118:	54001b21	b.ne	0xfffff7f8347c  // b.any
   0x0000fffff7f8311c:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f83120:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7f83124:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f83128:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8312c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83130:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83134:	54001a41	b.ne	0xfffff7f8347c  // b.any
   0x0000fffff7f83138:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f8313c:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7f83140:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f83144:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f83148:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8314c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83150:	54001961	b.ne	0xfffff7f8347c  // b.any
   0x0000fffff7f83154:	f9403e69	ldr	x9, [x19, #120]
   0x0000fffff7f83158:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7f8315c:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f83160:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7f83164:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83168:	5400108a	b.ge	0xfffff7f83378  // b.tcont
   0x0000fffff7f8316c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f83170:	f90403e9	str	x9, [sp, #2048]
   0x0000fffff7f83174:	aa1303e0	mov	x0, x19
   0x0000fffff7f83178:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f8317c:	d283f202	mov	x2, #0x1f90                	// #8080
   0x0000fffff7f83180:	f2b55802	movk	x2, #0xaac0, lsl #16
   0x0000fffff7f83184:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f83188:	d286fe03	mov	x3, #0x37f0                	// #14320
   0x0000fffff7f8318c:	f2b55a63	movk	x3, #0xaad3, lsl #16
   0x0000fffff7f83190:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83194:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f83198:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f8319c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f831a0:	d28f0810	mov	x16, #0x7840                	// #30784
   0x0000fffff7f831a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f831a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f831ac:	d63f0200	blr	x16
   0x0000fffff7f831b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f831b4:	54001640	b.eq	0xfffff7f8347c  // b.none
   0x0000fffff7f831b8:	f94017e9	ldr	x9, [sp, #40]
   0x0000fffff7f831bc:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f831c0:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f831c4:	f94013ea	ldr	x10, [sp, #32]
   0x0000fffff7f831c8:	f100015f	cmp	x10, #0x0
   0x0000fffff7f831cc:	54001580	b.eq	0xfffff7f8347c  // b.none
   0x0000fffff7f831d0:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f831d4:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f831d8:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f831dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f831e0:	5280080a	mov	w10, #0x40                  	// #64
   0x0000fffff7f831e4:	72a1000a	movk	w10, #0x800, lsl #16
   0x0000fffff7f831e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f831ec:	54001481	b.ne	0xfffff7f8347c  // b.any
   0x0000fffff7f831f0:	f9401e6b	ldr	x11, [x19, #56]
   0x0000fffff7f831f4:	f9402fea	ldr	x10, [sp, #88]
   0x0000fffff7f831f8:	f100015f	cmp	x10, #0x0
   0x0000fffff7f831fc:	5400140b	b.lt	0xfffff7f8347c  // b.tstop
   0x0000fffff7f83200:	f9401d6c	ldr	x12, [x11, #56]
   0x0000fffff7f83204:	eb0c015f	cmp	x10, x12
   0x0000fffff7f83208:	540013aa	b.ge	0xfffff7f8347c  // b.tcont
   0x0000fffff7f8320c:	f940196d	ldr	x13, [x11, #48]
   0x0000fffff7f83210:	8b0a11ad	add	x13, x13, x10, lsl #4
   0x0000fffff7f83214:	b94001ae	ldr	w14, [x13]
   0x0000fffff7f83218:	5280004f	mov	w15, #0x2                   	// #2
   0x0000fffff7f8321c:	72a0a00f	movk	w15, #0x500, lsl #16
   0x0000fffff7f83220:	eb0f01df	cmp	x14, x15
   0x0000fffff7f83224:	540012c1	b.ne	0xfffff7f8347c  // b.any
   0x0000fffff7f83228:	f94005a9	ldr	x9, [x13, #8]
   0x0000fffff7f8322c:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f83230:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f83234:	f90033e9	str	x9, [sp, #96]
   0x0000fffff7f83238:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f8323c:	d28000aa	mov	x10, #0x5                   	// #5
   0x0000fffff7f83240:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f83244:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f83248:	f90033e9	str	x9, [sp, #96]
   0x0000fffff7f8324c:	f9402be9	ldr	x9, [sp, #80]
   0x0000fffff7f83250:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f83254:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f83258:	f9003fe9	str	x9, [sp, #120]
   0x0000fffff7f8325c:	f94033e9	ldr	x9, [sp, #96]
   0x0000fffff7f83260:	f90043e9	str	x9, [sp, #128]
   0x0000fffff7f83264:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f83268:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f8326c:	f94043e9	ldr	x9, [sp, #128]
   0x0000fffff7f83270:	f94047ea	ldr	x10, [sp, #136]
   0x0000fffff7f83274:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83278:	540002ea	b.ge	0xfffff7f832d4  // b.tcont
   0x0000fffff7f8327c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83280:	f2e7fd09	movk	x9, #0x3fe8, lsl #48
   0x0000fffff7f83284:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f83288:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f8328c:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f83290:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83294:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f83298:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8329c:	f2e7fa09	movk	x9, #0x3fd0, lsl #48
   0x0000fffff7f832a0:	f9004be9	str	x9, [sp, #144]
   0x0000fffff7f832a4:	f9403fe9	ldr	x9, [sp, #120]
   0x0000fffff7f832a8:	9e620120	scvtf	d0, x9
   0x0000fffff7f832ac:	fd404be1	ldr	d1, [sp, #144]
   0x0000fffff7f832b0:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f832b4:	fd004be0	str	d0, [sp, #144]
   0x0000fffff7f832b8:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f832bc:	fd404be1	ldr	d1, [sp, #144]
   0x0000fffff7f832c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f832c4:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f832c8:	f94047e9	ldr	x9, [sp, #136]
   0x0000fffff7f832cc:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f832d0:	14000016	b	0xfffff7f83328
   0x0000fffff7f832d4:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f832d8:	f2e7fc09	movk	x9, #0x3fe0, lsl #48
   0x0000fffff7f832dc:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f832e0:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f832e4:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f832e8:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f832ec:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f832f0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f832f4:	f2e7fc09	movk	x9, #0x3fe0, lsl #48
   0x0000fffff7f832f8:	f9004be9	str	x9, [sp, #144]
   0x0000fffff7f832fc:	f9403fe9	ldr	x9, [sp, #120]
   0x0000fffff7f83300:	9e620120	scvtf	d0, x9
   0x0000fffff7f83304:	fd404be1	ldr	d1, [sp, #144]
   0x0000fffff7f83308:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f8330c:	fd004be0	str	d0, [sp, #144]
   0x0000fffff7f83310:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f83314:	fd404be1	ldr	d1, [sp, #144]
   0x0000fffff7f83318:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8331c:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f83320:	f94047e9	ldr	x9, [sp, #136]
   0x0000fffff7f83324:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f83328:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7f8332c:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7f83330:	d28865a9	mov	x9, #0x432d                	// #17197
   0x0000fffff7f83334:	f2bd6389	movk	x9, #0xeb1c, lsl #16
   0x0000fffff7f83338:	f2c6dc49	movk	x9, #0x36e2, lsl #32
   0x0000fffff7f8333c:	f2e7e349	movk	x9, #0x3f1a, lsl #48
   0x0000fffff7f83340:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f83344:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7f83348:	fd4023e1	ldr	d1, [sp, #64]
   0x0000fffff7f8334c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83350:	fd0023e0	str	d0, [sp, #64]
   0x0000fffff7f83354:	fd401be0	ldr	d0, [sp, #48]
   0x0000fffff7f83358:	fd4023e1	ldr	d1, [sp, #64]
   0x0000fffff7f8335c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83360:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7f83364:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f83368:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f8336c:	91000529	add	x9, x9, #0x1
   0x0000fffff7f83370:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7f83374:	17ffff7a	b	0xfffff7f8315c
   0x0000fffff7f83378:	f94403e9	ldr	x9, [sp, #2048]
   0x0000fffff7f8337c:	f100013f	cmp	x9, #0x0
   0x0000fffff7f83380:	54000640	b.eq	0xfffff7f83448  // b.none
   0x0000fffff7f83384:	aa1303e0	mov	x0, x19
   0x0000fffff7f83388:	d28000a1	mov	x1, #0x5                   	// #5
   0x0000fffff7f8338c:	9100a3e2	add	x2, sp, #0x28
   0x0000fffff7f83390:	d285ee90	mov	x16, #0x2f74                	// #12148
   0x0000fffff7f83394:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8339c:	d63f0200	blr	x16
   0x0000fffff7f833a0:	aa1303e0	mov	x0, x19
   0x0000fffff7f833a4:	d28000c1	mov	x1, #0x6                   	// #6
   0x0000fffff7f833a8:	9100c3e2	add	x2, sp, #0x30
   0x0000fffff7f833ac:	d285ee90	mov	x16, #0x2f74                	// #12148
   0x0000fffff7f833b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f833b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f833b8:	d63f0200	blr	x16
   0x0000fffff7f833bc:	aa1303e0	mov	x0, x19
   0x0000fffff7f833c0:	d28000e1	mov	x1, #0x7                   	// #7
   0x0000fffff7f833c4:	f9401fe2	ldr	x2, [sp, #56]
   0x0000fffff7f833c8:	d284ee10	mov	x16, #0x2770                	// #10096
   0x0000fffff7f833cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f833d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f833d4:	d63f0200	blr	x16
   0x0000fffff7f833d8:	aa1303e0	mov	x0, x19
   0x0000fffff7f833dc:	d2800101	mov	x1, #0x8                   	// #8
   0x0000fffff7f833e0:	f94023e2	ldr	x2, [sp, #64]
   0x0000fffff7f833e4:	d284ee10	mov	x16, #0x2770                	// #10096
   0x0000fffff7f833e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f833ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f833f0:	d63f0200	blr	x16
   0x0000fffff7f833f4:	aa1303e0	mov	x0, x19
   0x0000fffff7f833f8:	d2800141	mov	x1, #0xa                   	// #10
   0x0000fffff7f833fc:	910143e2	add	x2, sp, #0x50
   0x0000fffff7f83400:	d285ee90	mov	x16, #0x2f74                	// #12148
   0x0000fffff7f83404:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83408:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8340c:	d63f0200	blr	x16
   0x0000fffff7f83410:	aa1303e0	mov	x0, x19
   0x0000fffff7f83414:	d2800161	mov	x1, #0xb                   	// #11
   0x0000fffff7f83418:	f9402fe2	ldr	x2, [sp, #88]
   0x0000fffff7f8341c:	d284ee10	mov	x16, #0x2770                	// #10096
   0x0000fffff7f83420:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83424:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83428:	d63f0200	blr	x16
   0x0000fffff7f8342c:	aa1303e0	mov	x0, x19
   0x0000fffff7f83430:	d2800181	mov	x1, #0xc                   	// #12
   0x0000fffff7f83434:	f94033e2	ldr	x2, [sp, #96]
   0x0000fffff7f83438:	d284ee10	mov	x16, #0x2770                	// #10096
   0x0000fffff7f8343c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83440:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83444:	d63f0200	blr	x16
   0x0000fffff7f83448:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f8344c:	f9000289	str	x9, [x20]
   0x0000fffff7f83450:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83454:	d284be10	mov	x16, #0x25f0                	// #9712
   0x0000fffff7f83458:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8345c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83460:	d63f0200	blr	x16
   0x0000fffff7f83464:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f83468:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f8346c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f83470:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f83474:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f83478:	d65f03c0	ret
   0x0000fffff7f8347c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83480:	d284c010	mov	x16, #0x2600                	// #9728
   0x0000fffff7f83484:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83488:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8348c:	d63f0200	blr	x16
   0x0000fffff7f83490:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f83494:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f83498:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f8349c:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f834a0:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7f834a4:	d65f03c0	ret
   0x0000fffff7f834a8:	00000000	udf	#0
   0x0000fffff7f834ac:	00000000	udf	#0
   0x0000fffff7f834b0:	00000000	udf	#0
   0x0000fffff7f834b4:	00000000	udf	#0
   0x0000fffff7f834b8:	00000000	udf	#0
   0x0000fffff7f834bc:	00000000	udf	#0
   0x0000fffff7f834c0:	00000000	udf	#0
   0x0000fffff7f834c4:	00000000	udf	#0
   0x0000fffff7f834c8:	00000000	udf	#0
   0x0000fffff7f834cc:	00000000	udf	#0
   0x0000fffff7f834d0:	00000000	udf	#0
   0x0000fffff7f834d4:	00000000	udf	#0
   0x0000fffff7f834d8:	00000000	udf	#0
   0x0000fffff7f834dc:	00000000	udf	#0
   0x0000fffff7f834e0:	00000000	udf	#0
   0x0000fffff7f834e4:	00000000	udf	#0
   0x0000fffff7f834e8:	00000000	udf	#0
   0x0000fffff7f834ec:	00000000	udf	#0
   0x0000fffff7f834f0:	00000000	udf	#0
   0x0000fffff7f834f4:	00000000	udf	#0
   0x0000fffff7f834f8:	00000000	udf	#0
   0x0000fffff7f834fc:	00000000	udf	#0
   0x0000fffff7f83500:	00000000	udf	#0
   0x0000fffff7f83504:	00000000	udf	#0
   0x0000fffff7f83508:	00000000	udf	#0
   0x0000fffff7f8350c:	00000000	udf	#0
   0x0000fffff7f83510:	00000000	udf	#0
   0x0000fffff7f83514:	00000000	udf	#0
   0x0000fffff7f83518:	00000000	udf	#0
   0x0000fffff7f8351c:	00000000	udf	#0
   0x0000fffff7f83520:	00000000	udf	#0
   0x0000fffff7f83524:	00000000	udf	#0
   0x0000fffff7f83528:	00000000	udf	#0
   0x0000fffff7f8352c:	00000000	udf	#0
   0x0000fffff7f83530:	00000000	udf	#0
   0x0000fffff7f83534:	00000000	udf	#0
   0x0000fffff7f83538:	00000000	udf	#0
   0x0000fffff7f8353c:	00000000	udf	#0
   0x0000fffff7f83540:	00000000	udf	#0
   0x0000fffff7f83544:	00000000	udf	#0
   0x0000fffff7f83548:	00000000	udf	#0
   0x0000fffff7f8354c:	00000000	udf	#0
   0x0000fffff7f83550:	00000000	udf	#0
   0x0000fffff7f83554:	00000000	udf	#0
   0x0000fffff7f83558:	00000000	udf	#0
   0x0000fffff7f8355c:	00000000	udf	#0
   0x0000fffff7f83560:	00000000	udf	#0
   0x0000fffff7f83564:	00000000	udf	#0
   0x0000fffff7f83568:	00000000	udf	#0
   0x0000fffff7f8356c:	00000000	udf	#0
   0x0000fffff7f83570:	00000000	udf	#0
   0x0000fffff7f83574:	00000000	udf	#0
   0x0000fffff7f83578:	00000000	udf	#0
   0x0000fffff7f8357c:	00000000	udf	#0
   0x0000fffff7f83580:	00000000	udf	#0
   0x0000fffff7f83584:	00000000	udf	#0
   0x0000fffff7f83588:	00000000	udf	#0
   0x0000fffff7f8358c:	00000000	udf	#0
   0x0000fffff7f83590:	00000000	udf	#0
   0x0000fffff7f83594:	00000000	udf	#0
   0x0000fffff7f83598:	00000000	udf	#0
   0x0000fffff7f8359c:	00000000	udf	#0
   0x0000fffff7f835a0:	00000000	udf	#0
   0x0000fffff7f835a4:	00000000	udf	#0
   0x0000fffff7f835a8:	00000000	udf	#0
   0x0000fffff7f835ac:	00000000	udf	#0
   0x0000fffff7f835b0:	00000000	udf	#0
   0x0000fffff7f835b4:	00000000	udf	#0
   0x0000fffff7f835b8:	00000000	udf	#0
   0x0000fffff7f835bc:	00000000	udf	#0
   0x0000fffff7f835c0:	00000000	udf	#0
   0x0000fffff7f835c4:	00000000	udf	#0
   0x0000fffff7f835c8:	00000000	udf	#0
   0x0000fffff7f835cc:	00000000	udf	#0
   0x0000fffff7f835d0:	00000000	udf	#0
   0x0000fffff7f835d4:	00000000	udf	#0
   0x0000fffff7f835d8:	00000000	udf	#0
   0x0000fffff7f835dc:	00000000	udf	#0
   0x0000fffff7f835e0:	00000000	udf	#0
   0x0000fffff7f835e4:	00000000	udf	#0
   0x0000fffff7f835e8:	00000000	udf	#0
   0x0000fffff7f835ec:	00000000	udf	#0
   0x0000fffff7f835f0:	00000000	udf	#0
   0x0000fffff7f835f4:	00000000	udf	#0
   0x0000fffff7f835f8:	00000000	udf	#0
   0x0000fffff7f835fc:	00000000	udf	#0
   0x0000fffff7f83600:	00000000	udf	#0
   0x0000fffff7f83604:	00000000	udf	#0
   0x0000fffff7f83608:	00000000	udf	#0
   0x0000fffff7f8360c:	00000000	udf	#0
   0x0000fffff7f83610:	00000000	udf	#0
   0x0000fffff7f83614:	00000000	udf	#0
   0x0000fffff7f83618:	00000000	udf	#0
   0x0000fffff7f8361c:	00000000	udf	#0
   0x0000fffff7f83620:	00000000	udf	#0
   0x0000fffff7f83624:	00000000	udf	#0
   0x0000fffff7f83628:	00000000	udf	#0
   0x0000fffff7f8362c:	00000000	udf	#0
   0x0000fffff7f83630:	00000000	udf	#0
   0x0000fffff7f83634:	00000000	udf	#0
   0x0000fffff7f83638:	00000000	udf	#0
   0x0000fffff7f8363c:	00000000	udf	#0
   0x0000fffff7f83640:	00000000	udf	#0
   0x0000fffff7f83644:	00000000	udf	#0
   0x0000fffff7f83648:	00000000	udf	#0
   0x0000fffff7f8364c:	00000000	udf	#0
   0x0000fffff7f83650:	00000000	udf	#0
   0x0000fffff7f83654:	00000000	udf	#0
   0x0000fffff7f83658:	00000000	udf	#0
   0x0000fffff7f8365c:	00000000	udf	#0
   0x0000fffff7f83660:	00000000	udf	#0
   0x0000fffff7f83664:	00000000	udf	#0
   0x0000fffff7f83668:	00000000	udf	#0
   0x0000fffff7f8366c:	00000000	udf	#0
   0x0000fffff7f83670:	00000000	udf	#0
   0x0000fffff7f83674:	00000000	udf	#0
   0x0000fffff7f83678:	00000000	udf	#0
   0x0000fffff7f8367c:	00000000	udf	#0
   0x0000fffff7f83680:	00000000	udf	#0
   0x0000fffff7f83684:	00000000	udf	#0
   0x0000fffff7f83688:	00000000	udf	#0
   0x0000fffff7f8368c:	00000000	udf	#0
   0x0000fffff7f83690:	00000000	udf	#0
   0x0000fffff7f83694:	00000000	udf	#0
   0x0000fffff7f83698:	00000000	udf	#0
   0x0000fffff7f8369c:	00000000	udf	#0
   0x0000fffff7f836a0:	00000000	udf	#0
   0x0000fffff7f836a4:	00000000	udf	#0
   0x0000fffff7f836a8:	00000000	udf	#0
   0x0000fffff7f836ac:	00000000	udf	#0
   0x0000fffff7f836b0:	00000000	udf	#0
   0x0000fffff7f836b4:	00000000	udf	#0
   0x0000fffff7f836b8:	00000000	udf	#0
   0x0000fffff7f836bc:	00000000	udf	#0
   0x0000fffff7f836c0:	00000000	udf	#0
   0x0000fffff7f836c4:	00000000	udf	#0
   0x0000fffff7f836c8:	00000000	udf	#0
   0x0000fffff7f836cc:	00000000	udf	#0
   0x0000fffff7f836d0:	00000000	udf	#0
   0x0000fffff7f836d4:	00000000	udf	#0
   0x0000fffff7f836d8:	00000000	udf	#0
   0x0000fffff7f836dc:	00000000	udf	#0
   0x0000fffff7f836e0:	00000000	udf	#0
   0x0000fffff7f836e4:	00000000	udf	#0
   0x0000fffff7f836e8:	00000000	udf	#0
   0x0000fffff7f836ec:	00000000	udf	#0
   0x0000fffff7f836f0:	00000000	udf	#0
   0x0000fffff7f836f4:	00000000	udf	#0
   0x0000fffff7f836f8:	00000000	udf	#0
   0x0000fffff7f836fc:	00000000	udf	#0
   0x0000fffff7f83700:	00000000	udf	#0
   0x0000fffff7f83704:	00000000	udf	#0
   0x0000fffff7f83708:	00000000	udf	#0
   0x0000fffff7f8370c:	00000000	udf	#0
   0x0000fffff7f83710:	00000000	udf	#0
   0x0000fffff7f83714:	00000000	udf	#0
   0x0000fffff7f83718:	00000000	udf	#0
   0x0000fffff7f8371c:	00000000	udf	#0
   0x0000fffff7f83720:	00000000	udf	#0
   0x0000fffff7f83724:	00000000	udf	#0
   0x0000fffff7f83728:	00000000	udf	#0
   0x0000fffff7f8372c:	00000000	udf	#0
   0x0000fffff7f83730:	00000000	udf	#0
   0x0000fffff7f83734:	00000000	udf	#0
   0x0000fffff7f83738:	00000000	udf	#0
   0x0000fffff7f8373c:	00000000	udf	#0
   0x0000fffff7f83740:	00000000	udf	#0
   0x0000fffff7f83744:	00000000	udf	#0
   0x0000fffff7f83748:	00000000	udf	#0
   0x0000fffff7f8374c:	00000000	udf	#0
   0x0000fffff7f83750:	00000000	udf	#0
   0x0000fffff7f83754:	00000000	udf	#0
   0x0000fffff7f83758:	00000000	udf	#0
   0x0000fffff7f8375c:	00000000	udf	#0
   0x0000fffff7f83760:	00000000	udf	#0
   0x0000fffff7f83764:	00000000	udf	#0
   0x0000fffff7f83768:	00000000	udf	#0
   0x0000fffff7f8376c:	00000000	udf	#0
   0x0000fffff7f83770:	00000000	udf	#0
   0x0000fffff7f83774:	00000000	udf	#0
   0x0000fffff7f83778:	00000000	udf	#0
   0x0000fffff7f8377c:	00000000	udf	#0
   0x0000fffff7f83780:	00000000	udf	#0
   0x0000fffff7f83784:	00000000	udf	#0
   0x0000fffff7f83788:	00000000	udf	#0
   0x0000fffff7f8378c:	00000000	udf	#0
   0x0000fffff7f83790:	00000000	udf	#0
   0x0000fffff7f83794:	00000000	udf	#0
   0x0000fffff7f83798:	00000000	udf	#0
   0x0000fffff7f8379c:	00000000	udf	#0
   0x0000fffff7f837a0:	00000000	udf	#0
   0x0000fffff7f837a4:	00000000	udf	#0
   0x0000fffff7f837a8:	00000000	udf	#0
   0x0000fffff7f837ac:	00000000	udf	#0
   0x0000fffff7f837b0:	00000000	udf	#0
   0x0000fffff7f837b4:	00000000	udf	#0
   0x0000fffff7f837b8:	00000000	udf	#0
   0x0000fffff7f837bc:	00000000	udf	#0
   0x0000fffff7f837c0:	00000000	udf	#0
   0x0000fffff7f837c4:	00000000	udf	#0
   0x0000fffff7f837c8:	00000000	udf	#0
   0x0000fffff7f837cc:	00000000	udf	#0
   0x0000fffff7f837d0:	00000000	udf	#0
   0x0000fffff7f837d4:	00000000	udf	#0
   0x0000fffff7f837d8:	00000000	udf	#0
   0x0000fffff7f837dc:	00000000	udf	#0
   0x0000fffff7f837e0:	00000000	udf	#0
   0x0000fffff7f837e4:	00000000	udf	#0
   0x0000fffff7f837e8:	00000000	udf	#0
   0x0000fffff7f837ec:	00000000	udf	#0
   0x0000fffff7f837f0:	00000000	udf	#0
   0x0000fffff7f837f4:	00000000	udf	#0
   0x0000fffff7f837f8:	00000000	udf	#0
   0x0000fffff7f837fc:	00000000	udf	#0
   0x0000fffff7f83800:	00000000	udf	#0
   0x0000fffff7f83804:	00000000	udf	#0
   0x0000fffff7f83808:	00000000	udf	#0
   0x0000fffff7f8380c:	00000000	udf	#0
   0x0000fffff7f83810:	00000000	udf	#0
   0x0000fffff7f83814:	00000000	udf	#0
   0x0000fffff7f83818:	00000000	udf	#0
   0x0000fffff7f8381c:	00000000	udf	#0
   0x0000fffff7f83820:	00000000	udf	#0
   0x0000fffff7f83824:	00000000	udf	#0
   0x0000fffff7f83828:	00000000	udf	#0
   0x0000fffff7f8382c:	00000000	udf	#0
   0x0000fffff7f83830:	00000000	udf	#0
   0x0000fffff7f83834:	00000000	udf	#0
   0x0000fffff7f83838:	00000000	udf	#0
   0x0000fffff7f8383c:	00000000	udf	#0
   0x0000fffff7f83840:	00000000	udf	#0
   0x0000fffff7f83844:	00000000	udf	#0
   0x0000fffff7f83848:	00000000	udf	#0
   0x0000fffff7f8384c:	00000000	udf	#0
   0x0000fffff7f83850:	00000000	udf	#0
   0x0000fffff7f83854:	00000000	udf	#0
   0x0000fffff7f83858:	00000000	udf	#0
   0x0000fffff7f8385c:	00000000	udf	#0
   0x0000fffff7f83860:	00000000	udf	#0
   0x0000fffff7f83864:	00000000	udf	#0
   0x0000fffff7f83868:	00000000	udf	#0
   0x0000fffff7f8386c:	00000000	udf	#0
   0x0000fffff7f83870:	00000000	udf	#0
   0x0000fffff7f83874:	00000000	udf	#0
   0x0000fffff7f83878:	00000000	udf	#0
   0x0000fffff7f8387c:	00000000	udf	#0
   0x0000fffff7f83880:	00000000	udf	#0
   0x0000fffff7f83884:	00000000	udf	#0
   0x0000fffff7f83888:	00000000	udf	#0
   0x0000fffff7f8388c:	00000000	udf	#0
   0x0000fffff7f83890:	00000000	udf	#0
   0x0000fffff7f83894:	00000000	udf	#0
   0x0000fffff7f83898:	00000000	udf	#0
   0x0000fffff7f8389c:	00000000	udf	#0
   0x0000fffff7f838a0:	00000000	udf	#0
   0x0000fffff7f838a4:	00000000	udf	#0
   0x0000fffff7f838a8:	00000000	udf	#0
   0x0000fffff7f838ac:	00000000	udf	#0
   0x0000fffff7f838b0:	00000000	udf	#0
   0x0000fffff7f838b4:	00000000	udf	#0
   0x0000fffff7f838b8:	00000000	udf	#0
   0x0000fffff7f838bc:	00000000	udf	#0
   0x0000fffff7f838c0:	00000000	udf	#0
   0x0000fffff7f838c4:	00000000	udf	#0
   0x0000fffff7f838c8:	00000000	udf	#0
   0x0000fffff7f838cc:	00000000	udf	#0
   0x0000fffff7f838d0:	00000000	udf	#0
   0x0000fffff7f838d4:	00000000	udf	#0
   0x0000fffff7f838d8:	00000000	udf	#0
   0x0000fffff7f838dc:	00000000	udf	#0
   0x0000fffff7f838e0:	00000000	udf	#0
   0x0000fffff7f838e4:	00000000	udf	#0
   0x0000fffff7f838e8:	00000000	udf	#0
   0x0000fffff7f838ec:	00000000	udf	#0
   0x0000fffff7f838f0:	00000000	udf	#0
   0x0000fffff7f838f4:	00000000	udf	#0
   0x0000fffff7f838f8:	00000000	udf	#0
   0x0000fffff7f838fc:	00000000	udf	#0
   0x0000fffff7f83900:	00000000	udf	#0
   0x0000fffff7f83904:	00000000	udf	#0
   0x0000fffff7f83908:	00000000	udf	#0
   0x0000fffff7f8390c:	00000000	udf	#0
   0x0000fffff7f83910:	00000000	udf	#0
   0x0000fffff7f83914:	00000000	udf	#0
   0x0000fffff7f83918:	00000000	udf	#0
   0x0000fffff7f8391c:	00000000	udf	#0
   0x0000fffff7f83920:	00000000	udf	#0
   0x0000fffff7f83924:	00000000	udf	#0
   0x0000fffff7f83928:	00000000	udf	#0
   0x0000fffff7f8392c:	00000000	udf	#0
   0x0000fffff7f83930:	00000000	udf	#0
   0x0000fffff7f83934:	00000000	udf	#0
   0x0000fffff7f83938:	00000000	udf	#0
   0x0000fffff7f8393c:	00000000	udf	#0
   0x0000fffff7f83940:	00000000	udf	#0
   0x0000fffff7f83944:	00000000	udf	#0
   0x0000fffff7f83948:	00000000	udf	#0
   0x0000fffff7f8394c:	00000000	udf	#0
   0x0000fffff7f83950:	00000000	udf	#0
   0x0000fffff7f83954:	00000000	udf	#0
   0x0000fffff7f83958:	00000000	udf	#0
   0x0000fffff7f8395c:	00000000	udf	#0
   0x0000fffff7f83960:	00000000	udf	#0
   0x0000fffff7f83964:	00000000	udf	#0
   0x0000fffff7f83968:	00000000	udf	#0
   0x0000fffff7f8396c:	00000000	udf	#0
   0x0000fffff7f83970:	00000000	udf	#0
   0x0000fffff7f83974:	00000000	udf	#0
   0x0000fffff7f83978:	00000000	udf	#0
   0x0000fffff7f8397c:	00000000	udf	#0
   0x0000fffff7f83980:	00000000	udf	#0
   0x0000fffff7f83984:	00000000	udf	#0
   0x0000fffff7f83988:	00000000	udf	#0
   0x0000fffff7f8398c:	00000000	udf	#0
   0x0000fffff7f83990:	00000000	udf	#0
   0x0000fffff7f83994:	00000000	udf	#0
   0x0000fffff7f83998:	00000000	udf	#0
   0x0000fffff7f8399c:	00000000	udf	#0
   0x0000fffff7f839a0:	00000000	udf	#0
   0x0000fffff7f839a4:	00000000	udf	#0
   0x0000fffff7f839a8:	00000000	udf	#0
   0x0000fffff7f839ac:	00000000	udf	#0
   0x0000fffff7f839b0:	00000000	udf	#0
   0x0000fffff7f839b4:	00000000	udf	#0
   0x0000fffff7f839b8:	00000000	udf	#0
   0x0000fffff7f839bc:	00000000	udf	#0
   0x0000fffff7f839c0:	00000000	udf	#0
   0x0000fffff7f839c4:	00000000	udf	#0
   0x0000fffff7f839c8:	00000000	udf	#0
   0x0000fffff7f839cc:	00000000	udf	#0
   0x0000fffff7f839d0:	00000000	udf	#0
   0x0000fffff7f839d4:	00000000	udf	#0
   0x0000fffff7f839d8:	00000000	udf	#0
   0x0000fffff7f839dc:	00000000	udf	#0
   0x0000fffff7f839e0:	00000000	udf	#0
   0x0000fffff7f839e4:	00000000	udf	#0
   0x0000fffff7f839e8:	00000000	udf	#0
   0x0000fffff7f839ec:	00000000	udf	#0
   0x0000fffff7f839f0:	00000000	udf	#0
   0x0000fffff7f839f4:	00000000	udf	#0
   0x0000fffff7f839f8:	00000000	udf	#0
   0x0000fffff7f839fc:	00000000	udf	#0
   0x0000fffff7f83a00:	00000000	udf	#0
   0x0000fffff7f83a04:	00000000	udf	#0
   0x0000fffff7f83a08:	00000000	udf	#0
   0x0000fffff7f83a0c:	00000000	udf	#0
   0x0000fffff7f83a10:	00000000	udf	#0
   0x0000fffff7f83a14:	00000000	udf	#0
   0x0000fffff7f83a18:	00000000	udf	#0
   0x0000fffff7f83a1c:	00000000	udf	#0
   0x0000fffff7f83a20:	00000000	udf	#0
   0x0000fffff7f83a24:	00000000	udf	#0
   0x0000fffff7f83a28:	00000000	udf	#0
   0x0000fffff7f83a2c:	00000000	udf	#0
   0x0000fffff7f83a30:	00000000	udf	#0
   0x0000fffff7f83a34:	00000000	udf	#0
   0x0000fffff7f83a38:	00000000	udf	#0
   0x0000fffff7f83a3c:	00000000	udf	#0
   0x0000fffff7f83a40:	00000000	udf	#0
   0x0000fffff7f83a44:	00000000	udf	#0
   0x0000fffff7f83a48:	00000000	udf	#0
   0x0000fffff7f83a4c:	00000000	udf	#0
   0x0000fffff7f83a50:	00000000	udf	#0
   0x0000fffff7f83a54:	00000000	udf	#0
   0x0000fffff7f83a58:	00000000	udf	#0
   0x0000fffff7f83a5c:	00000000	udf	#0
   0x0000fffff7f83a60:	00000000	udf	#0
   0x0000fffff7f83a64:	00000000	udf	#0
   0x0000fffff7f83a68:	00000000	udf	#0
   0x0000fffff7f83a6c:	00000000	udf	#0
   0x0000fffff7f83a70:	00000000	udf	#0
   0x0000fffff7f83a74:	00000000	udf	#0
   0x0000fffff7f83a78:	00000000	udf	#0
   0x0000fffff7f83a7c:	00000000	udf	#0
   0x0000fffff7f83a80:	00000000	udf	#0
   0x0000fffff7f83a84:	00000000	udf	#0
   0x0000fffff7f83a88:	00000000	udf	#0
   0x0000fffff7f83a8c:	00000000	udf	#0
   0x0000fffff7f83a90:	00000000	udf	#0
   0x0000fffff7f83a94:	00000000	udf	#0
   0x0000fffff7f83a98:	00000000	udf	#0
   0x0000fffff7f83a9c:	00000000	udf	#0
   0x0000fffff7f83aa0:	00000000	udf	#0
   0x0000fffff7f83aa4:	00000000	udf	#0
   0x0000fffff7f83aa8:	00000000	udf	#0
   0x0000fffff7f83aac:	00000000	udf	#0
   0x0000fffff7f83ab0:	00000000	udf	#0
   0x0000fffff7f83ab4:	00000000	udf	#0
   0x0000fffff7f83ab8:	00000000	udf	#0
   0x0000fffff7f83abc:	00000000	udf	#0
   0x0000fffff7f83ac0:	00000000	udf	#0
   0x0000fffff7f83ac4:	00000000	udf	#0
   0x0000fffff7f83ac8:	00000000	udf	#0
   0x0000fffff7f83acc:	00000000	udf	#0
   0x0000fffff7f83ad0:	00000000	udf	#0
   0x0000fffff7f83ad4:	00000000	udf	#0
   0x0000fffff7f83ad8:	00000000	udf	#0
   0x0000fffff7f83adc:	00000000	udf	#0
   0x0000fffff7f83ae0:	00000000	udf	#0
   0x0000fffff7f83ae4:	00000000	udf	#0
   0x0000fffff7f83ae8:	00000000	udf	#0
   0x0000fffff7f83aec:	00000000	udf	#0
   0x0000fffff7f83af0:	00000000	udf	#0
   0x0000fffff7f83af4:	00000000	udf	#0
   0x0000fffff7f83af8:	00000000	udf	#0
   0x0000fffff7f83afc:	00000000	udf	#0
   0x0000fffff7f83b00:	00000000	udf	#0
   0x0000fffff7f83b04:	00000000	udf	#0
   0x0000fffff7f83b08:	00000000	udf	#0
   0x0000fffff7f83b0c:	00000000	udf	#0
   0x0000fffff7f83b10:	00000000	udf	#0
   0x0000fffff7f83b14:	00000000	udf	#0
   0x0000fffff7f83b18:	00000000	udf	#0
   0x0000fffff7f83b1c:	00000000	udf	#0
   0x0000fffff7f83b20:	00000000	udf	#0
   0x0000fffff7f83b24:	00000000	udf	#0
   0x0000fffff7f83b28:	00000000	udf	#0
   0x0000fffff7f83b2c:	00000000	udf	#0
   0x0000fffff7f83b30:	00000000	udf	#0
   0x0000fffff7f83b34:	00000000	udf	#0
   0x0000fffff7f83b38:	00000000	udf	#0
   0x0000fffff7f83b3c:	00000000	udf	#0
   0x0000fffff7f83b40:	00000000	udf	#0
   0x0000fffff7f83b44:	00000000	udf	#0
   0x0000fffff7f83b48:	00000000	udf	#0
   0x0000fffff7f83b4c:	00000000	udf	#0
   0x0000fffff7f83b50:	00000000	udf	#0
   0x0000fffff7f83b54:	00000000	udf	#0
   0x0000fffff7f83b58:	00000000	udf	#0
   0x0000fffff7f83b5c:	00000000	udf	#0
   0x0000fffff7f83b60:	00000000	udf	#0
   0x0000fffff7f83b64:	00000000	udf	#0
   0x0000fffff7f83b68:	00000000	udf	#0
   0x0000fffff7f83b6c:	00000000	udf	#0
   0x0000fffff7f83b70:	00000000	udf	#0
   0x0000fffff7f83b74:	00000000	udf	#0
   0x0000fffff7f83b78:	00000000	udf	#0
   0x0000fffff7f83b7c:	00000000	udf	#0
   0x0000fffff7f83b80:	00000000	udf	#0
   0x0000fffff7f83b84:	00000000	udf	#0
   0x0000fffff7f83b88:	00000000	udf	#0
   0x0000fffff7f83b8c:	00000000	udf	#0
   0x0000fffff7f83b90:	00000000	udf	#0
   0x0000fffff7f83b94:	00000000	udf	#0
   0x0000fffff7f83b98:	00000000	udf	#0
   0x0000fffff7f83b9c:	00000000	udf	#0
   0x0000fffff7f83ba0:	00000000	udf	#0
   0x0000fffff7f83ba4:	00000000	udf	#0
   0x0000fffff7f83ba8:	00000000	udf	#0
   0x0000fffff7f83bac:	00000000	udf	#0
   0x0000fffff7f83bb0:	00000000	udf	#0
   0x0000fffff7f83bb4:	00000000	udf	#0
   0x0000fffff7f83bb8:	00000000	udf	#0
   0x0000fffff7f83bbc:	00000000	udf	#0
   0x0000fffff7f83bc0:	00000000	udf	#0
   0x0000fffff7f83bc4:	00000000	udf	#0
   0x0000fffff7f83bc8:	00000000	udf	#0
   0x0000fffff7f83bcc:	00000000	udf	#0
   0x0000fffff7f83bd0:	00000000	udf	#0
   0x0000fffff7f83bd4:	00000000	udf	#0
   0x0000fffff7f83bd8:	00000000	udf	#0
   0x0000fffff7f83bdc:	00000000	udf	#0
   0x0000fffff7f83be0:	00000000	udf	#0
   0x0000fffff7f83be4:	00000000	udf	#0
   0x0000fffff7f83be8:	00000000	udf	#0
   0x0000fffff7f83bec:	00000000	udf	#0
   0x0000fffff7f83bf0:	00000000	udf	#0
   0x0000fffff7f83bf4:	00000000	udf	#0
   0x0000fffff7f83bf8:	00000000	udf	#0
   0x0000fffff7f83bfc:	00000000	udf	#0
   0x0000fffff7f83c00:	00000000	udf	#0
   0x0000fffff7f83c04:	00000000	udf	#0
   0x0000fffff7f83c08:	00000000	udf	#0
   0x0000fffff7f83c0c:	00000000	udf	#0
   0x0000fffff7f83c10:	00000000	udf	#0
   0x0000fffff7f83c14:	00000000	udf	#0
   0x0000fffff7f83c18:	00000000	udf	#0
   0x0000fffff7f83c1c:	00000000	udf	#0
   0x0000fffff7f83c20:	00000000	udf	#0
   0x0000fffff7f83c24:	00000000	udf	#0
   0x0000fffff7f83c28:	00000000	udf	#0
   0x0000fffff7f83c2c:	00000000	udf	#0
   0x0000fffff7f83c30:	00000000	udf	#0
   0x0000fffff7f83c34:	00000000	udf	#0
   0x0000fffff7f83c38:	00000000	udf	#0
   0x0000fffff7f83c3c:	00000000	udf	#0
   0x0000fffff7f83c40:	00000000	udf	#0
   0x0000fffff7f83c44:	00000000	udf	#0
   0x0000fffff7f83c48:	00000000	udf	#0
   0x0000fffff7f83c4c:	00000000	udf	#0
   0x0000fffff7f83c50:	00000000	udf	#0
   0x0000fffff7f83c54:	00000000	udf	#0
   0x0000fffff7f83c58:	00000000	udf	#0
   0x0000fffff7f83c5c:	00000000	udf	#0
   0x0000fffff7f83c60:	00000000	udf	#0
   0x0000fffff7f83c64:	00000000	udf	#0
   0x0000fffff7f83c68:	00000000	udf	#0
   0x0000fffff7f83c6c:	00000000	udf	#0
   0x0000fffff7f83c70:	00000000	udf	#0
   0x0000fffff7f83c74:	00000000	udf	#0
   0x0000fffff7f83c78:	00000000	udf	#0
   0x0000fffff7f83c7c:	00000000	udf	#0
   0x0000fffff7f83c80:	00000000	udf	#0
   0x0000fffff7f83c84:	00000000	udf	#0
   0x0000fffff7f83c88:	00000000	udf	#0
   0x0000fffff7f83c8c:	00000000	udf	#0
   0x0000fffff7f83c90:	00000000	udf	#0
   0x0000fffff7f83c94:	00000000	udf	#0
   0x0000fffff7f83c98:	00000000	udf	#0
   0x0000fffff7f83c9c:	00000000	udf	#0
   0x0000fffff7f83ca0:	00000000	udf	#0
   0x0000fffff7f83ca4:	00000000	udf	#0
   0x0000fffff7f83ca8:	00000000	udf	#0
   0x0000fffff7f83cac:	00000000	udf	#0
   0x0000fffff7f83cb0:	00000000	udf	#0
   0x0000fffff7f83cb4:	00000000	udf	#0
   0x0000fffff7f83cb8:	00000000	udf	#0
   0x0000fffff7f83cbc:	00000000	udf	#0
   0x0000fffff7f83cc0:	00000000	udf	#0
   0x0000fffff7f83cc4:	00000000	udf	#0
   0x0000fffff7f83cc8:	00000000	udf	#0
   0x0000fffff7f83ccc:	00000000	udf	#0
   0x0000fffff7f83cd0:	00000000	udf	#0
   0x0000fffff7f83cd4:	00000000	udf	#0
   0x0000fffff7f83cd8:	00000000	udf	#0
   0x0000fffff7f83cdc:	00000000	udf	#0
   0x0000fffff7f83ce0:	00000000	udf	#0
   0x0000fffff7f83ce4:	00000000	udf	#0
   0x0000fffff7f83ce8:	00000000	udf	#0
   0x0000fffff7f83cec:	00000000	udf	#0
   0x0000fffff7f83cf0:	00000000	udf	#0
   0x0000fffff7f83cf4:	00000000	udf	#0
   0x0000fffff7f83cf8:	00000000	udf	#0
   0x0000fffff7f83cfc:	00000000	udf	#0
   0x0000fffff7f83d00:	00000000	udf	#0
   0x0000fffff7f83d04:	00000000	udf	#0
   0x0000fffff7f83d08:	00000000	udf	#0
   0x0000fffff7f83d0c:	00000000	udf	#0
   0x0000fffff7f83d10:	00000000	udf	#0
   0x0000fffff7f83d14:	00000000	udf	#0
   0x0000fffff7f83d18:	00000000	udf	#0
   0x0000fffff7f83d1c:	00000000	udf	#0
   0x0000fffff7f83d20:	00000000	udf	#0
   0x0000fffff7f83d24:	00000000	udf	#0
   0x0000fffff7f83d28:	00000000	udf	#0
   0x0000fffff7f83d2c:	00000000	udf	#0
   0x0000fffff7f83d30:	00000000	udf	#0
   0x0000fffff7f83d34:	00000000	udf	#0
   0x0000fffff7f83d38:	00000000	udf	#0
   0x0000fffff7f83d3c:	00000000	udf	#0
   0x0000fffff7f83d40:	00000000	udf	#0
   0x0000fffff7f83d44:	00000000	udf	#0
   0x0000fffff7f83d48:	00000000	udf	#0
   0x0000fffff7f83d4c:	00000000	udf	#0
   0x0000fffff7f83d50:	00000000	udf	#0
   0x0000fffff7f83d54:	00000000	udf	#0
   0x0000fffff7f83d58:	00000000	udf	#0
   0x0000fffff7f83d5c:	00000000	udf	#0
   0x0000fffff7f83d60:	00000000	udf	#0
   0x0000fffff7f83d64:	00000000	udf	#0
   0x0000fffff7f83d68:	00000000	udf	#0
   0x0000fffff7f83d6c:	00000000	udf	#0
   0x0000fffff7f83d70:	00000000	udf	#0
   0x0000fffff7f83d74:	00000000	udf	#0
   0x0000fffff7f83d78:	00000000	udf	#0
   0x0000fffff7f83d7c:	00000000	udf	#0
   0x0000fffff7f83d80:	00000000	udf	#0
   0x0000fffff7f83d84:	00000000	udf	#0
   0x0000fffff7f83d88:	00000000	udf	#0
   0x0000fffff7f83d8c:	00000000	udf	#0
   0x0000fffff7f83d90:	00000000	udf	#0
   0x0000fffff7f83d94:	00000000	udf	#0
   0x0000fffff7f83d98:	00000000	udf	#0
   0x0000fffff7f83d9c:	00000000	udf	#0
   0x0000fffff7f83da0:	00000000	udf	#0
   0x0000fffff7f83da4:	00000000	udf	#0
   0x0000fffff7f83da8:	00000000	udf	#0
   0x0000fffff7f83dac:	00000000	udf	#0
   0x0000fffff7f83db0:	00000000	udf	#0
   0x0000fffff7f83db4:	00000000	udf	#0
   0x0000fffff7f83db8:	00000000	udf	#0
   0x0000fffff7f83dbc:	00000000	udf	#0
   0x0000fffff7f83dc0:	00000000	udf	#0
   0x0000fffff7f83dc4:	00000000	udf	#0
   0x0000fffff7f83dc8:	00000000	udf	#0
   0x0000fffff7f83dcc:	00000000	udf	#0
   0x0000fffff7f83dd0:	00000000	udf	#0
   0x0000fffff7f83dd4:	00000000	udf	#0
   0x0000fffff7f83dd8:	00000000	udf	#0
   0x0000fffff7f83ddc:	00000000	udf	#0
   0x0000fffff7f83de0:	00000000	udf	#0
   0x0000fffff7f83de4:	00000000	udf	#0
   0x0000fffff7f83de8:	00000000	udf	#0
   0x0000fffff7f83dec:	00000000	udf	#0
   0x0000fffff7f83df0:	00000000	udf	#0
   0x0000fffff7f83df4:	00000000	udf	#0
   0x0000fffff7f83df8:	00000000	udf	#0
   0x0000fffff7f83dfc:	00000000	udf	#0
   0x0000fffff7f83e00:	00000000	udf	#0
   0x0000fffff7f83e04:	00000000	udf	#0
   0x0000fffff7f83e08:	00000000	udf	#0
   0x0000fffff7f83e0c:	00000000	udf	#0
   0x0000fffff7f83e10:	00000000	udf	#0
   0x0000fffff7f83e14:	00000000	udf	#0
   0x0000fffff7f83e18:	00000000	udf	#0
   0x0000fffff7f83e1c:	00000000	udf	#0
   0x0000fffff7f83e20:	00000000	udf	#0
   0x0000fffff7f83e24:	00000000	udf	#0
   0x0000fffff7f83e28:	00000000	udf	#0
   0x0000fffff7f83e2c:	00000000	udf	#0
   0x0000fffff7f83e30:	00000000	udf	#0
   0x0000fffff7f83e34:	00000000	udf	#0
   0x0000fffff7f83e38:	00000000	udf	#0
   0x0000fffff7f83e3c:	00000000	udf	#0
   0x0000fffff7f83e40:	00000000	udf	#0
   0x0000fffff7f83e44:	00000000	udf	#0
   0x0000fffff7f83e48:	00000000	udf	#0
   0x0000fffff7f83e4c:	00000000	udf	#0
   0x0000fffff7f83e50:	00000000	udf	#0
   0x0000fffff7f83e54:	00000000	udf	#0
   0x0000fffff7f83e58:	00000000	udf	#0
   0x0000fffff7f83e5c:	00000000	udf	#0
   0x0000fffff7f83e60:	00000000	udf	#0
   0x0000fffff7f83e64:	00000000	udf	#0
   0x0000fffff7f83e68:	00000000	udf	#0
   0x0000fffff7f83e6c:	00000000	udf	#0
   0x0000fffff7f83e70:	00000000	udf	#0
   0x0000fffff7f83e74:	00000000	udf	#0
   0x0000fffff7f83e78:	00000000	udf	#0
   0x0000fffff7f83e7c:	00000000	udf	#0
   0x0000fffff7f83e80:	00000000	udf	#0
   0x0000fffff7f83e84:	00000000	udf	#0
   0x0000fffff7f83e88:	00000000	udf	#0
   0x0000fffff7f83e8c:	00000000	udf	#0
   0x0000fffff7f83e90:	00000000	udf	#0
   0x0000fffff7f83e94:	00000000	udf	#0
   0x0000fffff7f83e98:	00000000	udf	#0
   0x0000fffff7f83e9c:	00000000	udf	#0
   0x0000fffff7f83ea0:	00000000	udf	#0
   0x0000fffff7f83ea4:	00000000	udf	#0
   0x0000fffff7f83ea8:	00000000	udf	#0
   0x0000fffff7f83eac:	00000000	udf	#0
   0x0000fffff7f83eb0:	00000000	udf	#0
   0x0000fffff7f83eb4:	00000000	udf	#0
   0x0000fffff7f83eb8:	00000000	udf	#0
   0x0000fffff7f83ebc:	00000000	udf	#0
   0x0000fffff7f83ec0:	00000000	udf	#0
   0x0000fffff7f83ec4:	00000000	udf	#0
   0x0000fffff7f83ec8:	00000000	udf	#0
   0x0000fffff7f83ecc:	00000000	udf	#0
   0x0000fffff7f83ed0:	00000000	udf	#0
   0x0000fffff7f83ed4:	00000000	udf	#0
   0x0000fffff7f83ed8:	00000000	udf	#0
   0x0000fffff7f83edc:	00000000	udf	#0
   0x0000fffff7f83ee0:	00000000	udf	#0
   0x0000fffff7f83ee4:	00000000	udf	#0
   0x0000fffff7f83ee8:	00000000	udf	#0
   0x0000fffff7f83eec:	00000000	udf	#0
   0x0000fffff7f83ef0:	00000000	udf	#0
   0x0000fffff7f83ef4:	00000000	udf	#0
   0x0000fffff7f83ef8:	00000000	udf	#0
   0x0000fffff7f83efc:	00000000	udf	#0
   0x0000fffff7f83f00:	00000000	udf	#0
   0x0000fffff7f83f04:	00000000	udf	#0
   0x0000fffff7f83f08:	00000000	udf	#0
   0x0000fffff7f83f0c:	00000000	udf	#0
   0x0000fffff7f83f10:	00000000	udf	#0
   0x0000fffff7f83f14:	00000000	udf	#0
   0x0000fffff7f83f18:	00000000	udf	#0
   0x0000fffff7f83f1c:	00000000	udf	#0
   0x0000fffff7f83f20:	00000000	udf	#0
   0x0000fffff7f83f24:	00000000	udf	#0
   0x0000fffff7f83f28:	00000000	udf	#0
   0x0000fffff7f83f2c:	00000000	udf	#0
   0x0000fffff7f83f30:	00000000	udf	#0
   0x0000fffff7f83f34:	00000000	udf	#0
   0x0000fffff7f83f38:	00000000	udf	#0
   0x0000fffff7f83f3c:	00000000	udf	#0
   0x0000fffff7f83f40:	00000000	udf	#0
   0x0000fffff7f83f44:	00000000	udf	#0
   0x0000fffff7f83f48:	00000000	udf	#0
   0x0000fffff7f83f4c:	00000000	udf	#0
   0x0000fffff7f83f50:	00000000	udf	#0
   0x0000fffff7f83f54:	00000000	udf	#0
   0x0000fffff7f83f58:	00000000	udf	#0
   0x0000fffff7f83f5c:	00000000	udf	#0
   0x0000fffff7f83f60:	00000000	udf	#0
   0x0000fffff7f83f64:	00000000	udf	#0
   0x0000fffff7f83f68:	00000000	udf	#0
   0x0000fffff7f83f6c:	00000000	udf	#0
   0x0000fffff7f83f70:	00000000	udf	#0
   0x0000fffff7f83f74:	00000000	udf	#0
   0x0000fffff7f83f78:	00000000	udf	#0
   0x0000fffff7f83f7c:	00000000	udf	#0
   0x0000fffff7f83f80:	00000000	udf	#0
   0x0000fffff7f83f84:	00000000	udf	#0
   0x0000fffff7f83f88:	00000000	udf	#0
   0x0000fffff7f83f8c:	00000000	udf	#0
   0x0000fffff7f83f90:	00000000	udf	#0
   0x0000fffff7f83f94:	00000000	udf	#0
   0x0000fffff7f83f98:	00000000	udf	#0
   0x0000fffff7f83f9c:	00000000	udf	#0
   0x0000fffff7f83fa0:	00000000	udf	#0
   0x0000fffff7f83fa4:	00000000	udf	#0
   0x0000fffff7f83fa8:	00000000	udf	#0
   0x0000fffff7f83fac:	00000000	udf	#0
   0x0000fffff7f83fb0:	00000000	udf	#0
   0x0000fffff7f83fb4:	00000000	udf	#0
   0x0000fffff7f83fb8:	00000000	udf	#0
   0x0000fffff7f83fbc:	00000000	udf	#0
   0x0000fffff7f83fc0:	00000000	udf	#0
   0x0000fffff7f83fc4:	00000000	udf	#0
   0x0000fffff7f83fc8:	00000000	udf	#0
   0x0000fffff7f83fcc:	00000000	udf	#0
   0x0000fffff7f83fd0:	00000000	udf	#0
   0x0000fffff7f83fd4:	00000000	udf	#0
   0x0000fffff7f83fd8:	00000000	udf	#0
   0x0000fffff7f83fdc:	00000000	udf	#0
   0x0000fffff7f83fe0:	00000000	udf	#0
   0x0000fffff7f83fe4:	00000000	udf	#0
   0x0000fffff7f83fe8:	00000000	udf	#0
   0x0000fffff7f83fec:	00000000	udf	#0
   0x0000fffff7f83ff0:	00000000	udf	#0
   0x0000fffff7f83ff4:	00000000	udf	#0
   0x0000fffff7f83ff8:	00000000	udf	#0
   0x0000fffff7f83ffc:	00000000	udf	#0
End of assembler dump.
