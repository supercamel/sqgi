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
   0x0000fffff7f83060:	540050a1	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f83064:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83068:	aa1303e1	mov	x1, x19
   0x0000fffff7f8306c:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7f83070:	d2824410	mov	x16, #0x1220                	// #4640
   0x0000fffff7f83074:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83078:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8307c:	d63f0200	blr	x16
   0x0000fffff7f83080:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83084:	54004f80	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f83088:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f8308c:	aa1303e1	mov	x1, x19
   0x0000fffff7f83090:	d2800062	mov	x2, #0x3                   	// #3
   0x0000fffff7f83094:	d2824410	mov	x16, #0x1220                	// #4640
   0x0000fffff7f83098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8309c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f830a0:	d63f0200	blr	x16
   0x0000fffff7f830a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f830a8:	54004e60	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f830ac:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f830b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f830b4:	d2800082	mov	x2, #0x4                   	// #4
   0x0000fffff7f830b8:	d2824410	mov	x16, #0x1220                	// #4640
   0x0000fffff7f830bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f830c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f830c4:	d63f0200	blr	x16
   0x0000fffff7f830c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f830cc:	54004d40	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f830d0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f830d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f830d8:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7f830dc:	d2824410	mov	x16, #0x1220                	// #4640
   0x0000fffff7f830e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f830e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f830e8:	d63f0200	blr	x16
   0x0000fffff7f830ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f830f0:	54004c20	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f830f4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f830f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f830fc:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7f83100:	d2824410	mov	x16, #0x1220                	// #4640
   0x0000fffff7f83104:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83108:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8310c:	d63f0200	blr	x16
   0x0000fffff7f83110:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83114:	54004b00	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f83118:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f8311c:	aa1303e1	mov	x1, x19
   0x0000fffff7f83120:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7f83124:	d2824410	mov	x16, #0x1220                	// #4640
   0x0000fffff7f83128:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8312c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83130:	d63f0200	blr	x16
   0x0000fffff7f83134:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83138:	540049e0	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f8313c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83140:	aa1303e1	mov	x1, x19
   0x0000fffff7f83144:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7f83148:	d2824410	mov	x16, #0x1220                	// #4640
   0x0000fffff7f8314c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83150:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83154:	d63f0200	blr	x16
   0x0000fffff7f83158:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8315c:	540048c0	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f83160:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83164:	aa1303e1	mov	x1, x19
   0x0000fffff7f83168:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f8316c:	d2824410	mov	x16, #0x1220                	// #4640
   0x0000fffff7f83170:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83174:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83178:	d63f0200	blr	x16
   0x0000fffff7f8317c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83180:	540047a0	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f83184:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83188:	aa1303e1	mov	x1, x19
   0x0000fffff7f8318c:	d2800142	mov	x2, #0xa                   	// #10
   0x0000fffff7f83190:	d2824410	mov	x16, #0x1220                	// #4640
   0x0000fffff7f83194:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83198:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8319c:	d63f0200	blr	x16
   0x0000fffff7f831a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f831a4:	54004680	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f831a8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f831ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f831b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f831b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f831b8:	540045e1	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f831bc:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f831c0:	f90007e9	str	x9, [sp, #8]
   0x0000fffff7f831c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f831c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f831cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f831d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f831d4:	54004501	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f831d8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7f831dc:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7f831e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f831e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f831e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f831ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f831f0:	54004421	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f831f4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f831f8:	fd000fe0	str	d0, [sp, #24]
   0x0000fffff7f831fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f83200:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83204:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83208:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8320c:	54004341	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f83210:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f83214:	fd0013e0	str	d0, [sp, #32]
   0x0000fffff7f83218:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8321c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83220:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83224:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83228:	54004261	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f8322c:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f83230:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7f83234:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f83238:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8323c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83240:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83244:	54004181	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f83248:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f8324c:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7f83250:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f83254:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8325c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83260:	540040a1	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f83264:	fd403e60	ldr	d0, [x19, #120]
   0x0000fffff7f83268:	fd001fe0	str	d0, [sp, #56]
   0x0000fffff7f8326c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f83270:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83274:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83278:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8327c:	54003fc1	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f83280:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f83284:	fd0023e0	str	d0, [sp, #64]
   0x0000fffff7f83288:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8328c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83290:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83294:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83298:	54003ee1	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f8329c:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7f832a0:	fd0027e0	str	d0, [sp, #72]
   0x0000fffff7f832a4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f832a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f832ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f832b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f832b4:	54003e01	b.ne	0xfffff7f83a74  // b.any
   0x0000fffff7f832b8:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f832bc:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f832c0:	f9402be9	ldr	x9, [sp, #80]
   0x0000fffff7f832c4:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7f832c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7f832cc:	540030ca	b.ge	0xfffff7f838e4  // b.tcont
   0x0000fffff7f832d0:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f832d4:	f90403e9	str	x9, [sp, #2048]
   0x0000fffff7f832d8:	aa1303e0	mov	x0, x19
   0x0000fffff7f832dc:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f832e0:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f832e4:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f832e8:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f832ec:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f832f0:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f832f4:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f832f8:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f832fc:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f83300:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83304:	d28c7a10	mov	x16, #0x63d0                	// #25552
   0x0000fffff7f83308:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8330c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83310:	d63f0200	blr	x16
   0x0000fffff7f83314:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83318:	54003ae0	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f8331c:	f9400be9	ldr	x9, [sp, #16]
   0x0000fffff7f83320:	f90037e9	str	x9, [sp, #104]
   0x0000fffff7f83324:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f83328:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f8332c:	f9402be9	ldr	x9, [sp, #80]
   0x0000fffff7f83330:	d28002ea	mov	x10, #0x17                  	// #23
   0x0000fffff7f83334:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f83338:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f8333c:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f83340:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83344:	f2e7fd89	movk	x9, #0x3fec, lsl #48
   0x0000fffff7f83348:	f9003fe9	str	x9, [sp, #120]
   0x0000fffff7f8334c:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f83350:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f83354:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83358:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f8335c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83360:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f83364:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f83368:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f8336c:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f83370:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f83374:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f83378:	f9403be9	ldr	x9, [sp, #112]
   0x0000fffff7f8337c:	9e620120	scvtf	d0, x9
   0x0000fffff7f83380:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f83384:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83388:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f8338c:	fd4043e0	ldr	d0, [sp, #128]
   0x0000fffff7f83390:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f83394:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83398:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f8339c:	f94043e9	ldr	x9, [sp, #128]
   0x0000fffff7f833a0:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f833a4:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f833a8:	f9000be9	str	x9, [sp, #16]
   0x0000fffff7f833ac:	aa1303e0	mov	x0, x19
   0x0000fffff7f833b0:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f833b4:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f833b8:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f833bc:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f833c0:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f833c4:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f833c8:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f833cc:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f833d0:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f833d4:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f833d8:	d28c7a10	mov	x16, #0x63d0                	// #25552
   0x0000fffff7f833dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f833e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f833e4:	d63f0200	blr	x16
   0x0000fffff7f833e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f833ec:	54003440	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f833f0:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7f833f4:	f90037e9	str	x9, [sp, #104]
   0x0000fffff7f833f8:	f9400be9	ldr	x9, [sp, #16]
   0x0000fffff7f833fc:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f83400:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83404:	f2e7fd09	movk	x9, #0x3fe8, lsl #48
   0x0000fffff7f83408:	f9003fe9	str	x9, [sp, #120]
   0x0000fffff7f8340c:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f83410:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f83414:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83418:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f8341c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83420:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f83424:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f83428:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f8342c:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f83430:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f83434:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f83438:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f8343c:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f83440:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83444:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f83448:	fd4043e0	ldr	d0, [sp, #128]
   0x0000fffff7f8344c:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f83450:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83454:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f83458:	f94043e9	ldr	x9, [sp, #128]
   0x0000fffff7f8345c:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f83460:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f83464:	f9000fe9	str	x9, [sp, #24]
   0x0000fffff7f83468:	aa1303e0	mov	x0, x19
   0x0000fffff7f8346c:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f83470:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f83474:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f83478:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f8347c:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f83480:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f83484:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83488:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f8348c:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f83490:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83494:	d28c7a10	mov	x16, #0x63d0                	// #25552
   0x0000fffff7f83498:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8349c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f834a0:	d63f0200	blr	x16
   0x0000fffff7f834a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f834a8:	54002e60	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f834ac:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7f834b0:	f90037e9	str	x9, [sp, #104]
   0x0000fffff7f834b4:	f9400fe9	ldr	x9, [sp, #24]
   0x0000fffff7f834b8:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f834bc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f834c0:	f2e7fc89	movk	x9, #0x3fe4, lsl #48
   0x0000fffff7f834c4:	f9003fe9	str	x9, [sp, #120]
   0x0000fffff7f834c8:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f834cc:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f834d0:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f834d4:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f834d8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f834dc:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f834e0:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f834e4:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f834e8:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f834ec:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f834f0:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f834f4:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f834f8:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f834fc:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83500:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f83504:	fd4043e0	ldr	d0, [sp, #128]
   0x0000fffff7f83508:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f8350c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83510:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f83514:	f94043e9	ldr	x9, [sp, #128]
   0x0000fffff7f83518:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f8351c:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f83520:	f90013e9	str	x9, [sp, #32]
   0x0000fffff7f83524:	aa1303e0	mov	x0, x19
   0x0000fffff7f83528:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f8352c:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f83530:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f83534:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f83538:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f8353c:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f83540:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83544:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f83548:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f8354c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83550:	d28c7a10	mov	x16, #0x63d0                	// #25552
   0x0000fffff7f83554:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83558:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8355c:	d63f0200	blr	x16
   0x0000fffff7f83560:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83564:	54002880	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f83568:	f94017e9	ldr	x9, [sp, #40]
   0x0000fffff7f8356c:	f90037e9	str	x9, [sp, #104]
   0x0000fffff7f83570:	f94013e9	ldr	x9, [sp, #32]
   0x0000fffff7f83574:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f83578:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8357c:	f2e7fc09	movk	x9, #0x3fe0, lsl #48
   0x0000fffff7f83580:	f9003fe9	str	x9, [sp, #120]
   0x0000fffff7f83584:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f83588:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f8358c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83590:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f83594:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83598:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f8359c:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f835a0:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f835a4:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f835a8:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f835ac:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f835b0:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f835b4:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f835b8:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f835bc:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f835c0:	fd4043e0	ldr	d0, [sp, #128]
   0x0000fffff7f835c4:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f835c8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f835cc:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f835d0:	f94043e9	ldr	x9, [sp, #128]
   0x0000fffff7f835d4:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f835d8:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f835dc:	f90017e9	str	x9, [sp, #40]
   0x0000fffff7f835e0:	aa1303e0	mov	x0, x19
   0x0000fffff7f835e4:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f835e8:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f835ec:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f835f0:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f835f4:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f835f8:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f835fc:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83600:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f83604:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f83608:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f8360c:	d28c7a10	mov	x16, #0x63d0                	// #25552
   0x0000fffff7f83610:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83614:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83618:	d63f0200	blr	x16
   0x0000fffff7f8361c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83620:	540022a0	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f83624:	f9401be9	ldr	x9, [sp, #48]
   0x0000fffff7f83628:	f90037e9	str	x9, [sp, #104]
   0x0000fffff7f8362c:	f94017e9	ldr	x9, [sp, #40]
   0x0000fffff7f83630:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f83634:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83638:	f2e7fd89	movk	x9, #0x3fec, lsl #48
   0x0000fffff7f8363c:	f9003fe9	str	x9, [sp, #120]
   0x0000fffff7f83640:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f83644:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f83648:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f8364c:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f83650:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83654:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f83658:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f8365c:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f83660:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f83664:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f83668:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f8366c:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f83670:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f83674:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83678:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f8367c:	fd4043e0	ldr	d0, [sp, #128]
   0x0000fffff7f83680:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f83684:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83688:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f8368c:	f94043e9	ldr	x9, [sp, #128]
   0x0000fffff7f83690:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f83694:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f83698:	f9001be9	str	x9, [sp, #48]
   0x0000fffff7f8369c:	aa1303e0	mov	x0, x19
   0x0000fffff7f836a0:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f836a4:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f836a8:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f836ac:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f836b0:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f836b4:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f836b8:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f836bc:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f836c0:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f836c4:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f836c8:	d28c7a10	mov	x16, #0x63d0                	// #25552
   0x0000fffff7f836cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f836d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f836d4:	d63f0200	blr	x16
   0x0000fffff7f836d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f836dc:	54001cc0	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f836e0:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f836e4:	f90037e9	str	x9, [sp, #104]
   0x0000fffff7f836e8:	f9401be9	ldr	x9, [sp, #48]
   0x0000fffff7f836ec:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f836f0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f836f4:	f2e7fd09	movk	x9, #0x3fe8, lsl #48
   0x0000fffff7f836f8:	f9003fe9	str	x9, [sp, #120]
   0x0000fffff7f836fc:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f83700:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f83704:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83708:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f8370c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83710:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f83714:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f83718:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f8371c:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f83720:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f83724:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f83728:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f8372c:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f83730:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83734:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f83738:	fd4043e0	ldr	d0, [sp, #128]
   0x0000fffff7f8373c:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f83740:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83744:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f83748:	f94043e9	ldr	x9, [sp, #128]
   0x0000fffff7f8374c:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f83750:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f83754:	f9001fe9	str	x9, [sp, #56]
   0x0000fffff7f83758:	aa1303e0	mov	x0, x19
   0x0000fffff7f8375c:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f83760:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f83764:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f83768:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f8376c:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f83770:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f83774:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83778:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f8377c:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f83780:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83784:	d28c7a10	mov	x16, #0x63d0                	// #25552
   0x0000fffff7f83788:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8378c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83790:	d63f0200	blr	x16
   0x0000fffff7f83794:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83798:	540016e0	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f8379c:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7f837a0:	f90037e9	str	x9, [sp, #104]
   0x0000fffff7f837a4:	f9401fe9	ldr	x9, [sp, #56]
   0x0000fffff7f837a8:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f837ac:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f837b0:	f2e7fc89	movk	x9, #0x3fe4, lsl #48
   0x0000fffff7f837b4:	f9003fe9	str	x9, [sp, #120]
   0x0000fffff7f837b8:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f837bc:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f837c0:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f837c4:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f837c8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f837cc:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f837d0:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f837d4:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f837d8:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f837dc:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f837e0:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f837e4:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f837e8:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f837ec:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f837f0:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f837f4:	fd4043e0	ldr	d0, [sp, #128]
   0x0000fffff7f837f8:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f837fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83800:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f83804:	f94043e9	ldr	x9, [sp, #128]
   0x0000fffff7f83808:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f8380c:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f83810:	f90023e9	str	x9, [sp, #64]
   0x0000fffff7f83814:	aa1303e0	mov	x0, x19
   0x0000fffff7f83818:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f8381c:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f83820:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f83824:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f83828:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f8382c:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f83830:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83834:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f83838:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f8383c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83840:	d28c7a10	mov	x16, #0x63d0                	// #25552
   0x0000fffff7f83844:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83848:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8384c:	d63f0200	blr	x16
   0x0000fffff7f83850:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83854:	54001100	b.eq	0xfffff7f83a74  // b.none
   0x0000fffff7f83858:	f94027e9	ldr	x9, [sp, #72]
   0x0000fffff7f8385c:	f90037e9	str	x9, [sp, #104]
   0x0000fffff7f83860:	f94023e9	ldr	x9, [sp, #64]
   0x0000fffff7f83864:	f9003be9	str	x9, [sp, #112]
   0x0000fffff7f83868:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8386c:	f2e7fc09	movk	x9, #0x3fe0, lsl #48
   0x0000fffff7f83870:	f9003fe9	str	x9, [sp, #120]
   0x0000fffff7f83874:	fd4037e0	ldr	d0, [sp, #104]
   0x0000fffff7f83878:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f8387c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83880:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f83884:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83888:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f8388c:	f90047e9	str	x9, [sp, #136]
   0x0000fffff7f83890:	fd4047e0	ldr	d0, [sp, #136]
   0x0000fffff7f83894:	fd403fe1	ldr	d1, [sp, #120]
   0x0000fffff7f83898:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f8389c:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f838a0:	fd403be0	ldr	d0, [sp, #112]
   0x0000fffff7f838a4:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f838a8:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f838ac:	fd0047e0	str	d0, [sp, #136]
   0x0000fffff7f838b0:	fd4043e0	ldr	d0, [sp, #128]
   0x0000fffff7f838b4:	fd4047e1	ldr	d1, [sp, #136]
   0x0000fffff7f838b8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f838bc:	fd0043e0	str	d0, [sp, #128]
   0x0000fffff7f838c0:	f94043e9	ldr	x9, [sp, #128]
   0x0000fffff7f838c4:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f838c8:	f9402fe9	ldr	x9, [sp, #88]
   0x0000fffff7f838cc:	f90027e9	str	x9, [sp, #72]
   0x0000fffff7f838d0:	f9402be9	ldr	x9, [sp, #80]
   0x0000fffff7f838d4:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f838d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7f838dc:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f838e0:	17fffe78	b	0xfffff7f832c0
   0x0000fffff7f838e4:	f94403e9	ldr	x9, [sp, #2048]
   0x0000fffff7f838e8:	f100013f	cmp	x9, #0x0
   0x0000fffff7f838ec:	54000aa0	b.eq	0xfffff7f83a40  // b.none
   0x0000fffff7f838f0:	aa1303e0	mov	x0, x19
   0x0000fffff7f838f4:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f838f8:	910043e2	add	x2, sp, #0x10
   0x0000fffff7f838fc:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f83900:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83908:	d63f0200	blr	x16
   0x0000fffff7f8390c:	aa1303e0	mov	x0, x19
   0x0000fffff7f83910:	d2800061	mov	x1, #0x3                   	// #3
   0x0000fffff7f83914:	910063e2	add	x2, sp, #0x18
   0x0000fffff7f83918:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f8391c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83920:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83924:	d63f0200	blr	x16
   0x0000fffff7f83928:	aa1303e0	mov	x0, x19
   0x0000fffff7f8392c:	d2800081	mov	x1, #0x4                   	// #4
   0x0000fffff7f83930:	910083e2	add	x2, sp, #0x20
   0x0000fffff7f83934:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f83938:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8393c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83940:	d63f0200	blr	x16
   0x0000fffff7f83944:	aa1303e0	mov	x0, x19
   0x0000fffff7f83948:	d28000a1	mov	x1, #0x5                   	// #5
   0x0000fffff7f8394c:	9100a3e2	add	x2, sp, #0x28
   0x0000fffff7f83950:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f83954:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83958:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8395c:	d63f0200	blr	x16
   0x0000fffff7f83960:	aa1303e0	mov	x0, x19
   0x0000fffff7f83964:	d28000c1	mov	x1, #0x6                   	// #6
   0x0000fffff7f83968:	9100c3e2	add	x2, sp, #0x30
   0x0000fffff7f8396c:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f83970:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83974:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83978:	d63f0200	blr	x16
   0x0000fffff7f8397c:	aa1303e0	mov	x0, x19
   0x0000fffff7f83980:	d28000e1	mov	x1, #0x7                   	// #7
   0x0000fffff7f83984:	9100e3e2	add	x2, sp, #0x38
   0x0000fffff7f83988:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f8398c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83990:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83994:	d63f0200	blr	x16
   0x0000fffff7f83998:	aa1303e0	mov	x0, x19
   0x0000fffff7f8399c:	d2800101	mov	x1, #0x8                   	// #8
   0x0000fffff7f839a0:	910103e2	add	x2, sp, #0x40
   0x0000fffff7f839a4:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f839a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f839ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f839b0:	d63f0200	blr	x16
   0x0000fffff7f839b4:	aa1303e0	mov	x0, x19
   0x0000fffff7f839b8:	d2800121	mov	x1, #0x9                   	// #9
   0x0000fffff7f839bc:	910123e2	add	x2, sp, #0x48
   0x0000fffff7f839c0:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f839c4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f839c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f839cc:	d63f0200	blr	x16
   0x0000fffff7f839d0:	aa1303e0	mov	x0, x19
   0x0000fffff7f839d4:	d2800141	mov	x1, #0xa                   	// #10
   0x0000fffff7f839d8:	f9402be2	ldr	x2, [sp, #80]
   0x0000fffff7f839dc:	d282cc10	mov	x16, #0x1660                	// #5728
   0x0000fffff7f839e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f839e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f839e8:	d63f0200	blr	x16
   0x0000fffff7f839ec:	aa1303e0	mov	x0, x19
   0x0000fffff7f839f0:	d2800161	mov	x1, #0xb                   	// #11
   0x0000fffff7f839f4:	f9402fe2	ldr	x2, [sp, #88]
   0x0000fffff7f839f8:	d282cc10	mov	x16, #0x1660                	// #5728
   0x0000fffff7f839fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a00:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a04:	d63f0200	blr	x16
   0x0000fffff7f83a08:	aa1303e0	mov	x0, x19
   0x0000fffff7f83a0c:	d28001a1	mov	x1, #0xd                   	// #13
   0x0000fffff7f83a10:	9101a3e2	add	x2, sp, #0x68
   0x0000fffff7f83a14:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f83a18:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a20:	d63f0200	blr	x16
   0x0000fffff7f83a24:	aa1303e0	mov	x0, x19
   0x0000fffff7f83a28:	d28001c1	mov	x1, #0xe                   	// #14
   0x0000fffff7f83a2c:	9101c3e2	add	x2, sp, #0x70
   0x0000fffff7f83a30:	d283cc90	mov	x16, #0x1e64                	// #7780
   0x0000fffff7f83a34:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a38:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a3c:	d63f0200	blr	x16
   0x0000fffff7f83a40:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f83a44:	f9000289	str	x9, [x20]
   0x0000fffff7f83a48:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83a4c:	d2829c10	mov	x16, #0x14e0                	// #5344
   0x0000fffff7f83a50:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a58:	d63f0200	blr	x16
   0x0000fffff7f83a5c:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f83a60:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f83a64:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f83a68:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f83a6c:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f83a70:	d65f03c0	ret
   0x0000fffff7f83a74:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83a78:	d2829e10	mov	x16, #0x14f0                	// #5360
   0x0000fffff7f83a7c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a80:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a84:	d63f0200	blr	x16
   0x0000fffff7f83a88:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f83a8c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f83a90:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f83a94:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f83a98:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7f83a9c:	d65f03c0	ret
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
