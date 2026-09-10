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
   0x0000fffff7f83060:	54005681	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f83064:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83068:	aa1303e1	mov	x1, x19
   0x0000fffff7f8306c:	d2800042	mov	x2, #0x2                   	// #2
   0x0000fffff7f83070:	d2843a10	mov	x16, #0x21d0                	// #8656
   0x0000fffff7f83074:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83078:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8307c:	d63f0200	blr	x16
   0x0000fffff7f83080:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83084:	54005560	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83088:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f8308c:	aa1303e1	mov	x1, x19
   0x0000fffff7f83090:	d2800062	mov	x2, #0x3                   	// #3
   0x0000fffff7f83094:	d2843a10	mov	x16, #0x21d0                	// #8656
   0x0000fffff7f83098:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8309c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f830a0:	d63f0200	blr	x16
   0x0000fffff7f830a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f830a8:	54005440	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f830ac:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f830b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f830b4:	d2800082	mov	x2, #0x4                   	// #4
   0x0000fffff7f830b8:	d2843a10	mov	x16, #0x21d0                	// #8656
   0x0000fffff7f830bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f830c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f830c4:	d63f0200	blr	x16
   0x0000fffff7f830c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f830cc:	54005320	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f830d0:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f830d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f830d8:	d28000a2	mov	x2, #0x5                   	// #5
   0x0000fffff7f830dc:	d2843a10	mov	x16, #0x21d0                	// #8656
   0x0000fffff7f830e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f830e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f830e8:	d63f0200	blr	x16
   0x0000fffff7f830ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f830f0:	54005200	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f830f4:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f830f8:	aa1303e1	mov	x1, x19
   0x0000fffff7f830fc:	d28000c2	mov	x2, #0x6                   	// #6
   0x0000fffff7f83100:	d2843a10	mov	x16, #0x21d0                	// #8656
   0x0000fffff7f83104:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83108:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8310c:	d63f0200	blr	x16
   0x0000fffff7f83110:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83114:	540050e0	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83118:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f8311c:	aa1303e1	mov	x1, x19
   0x0000fffff7f83120:	d28000e2	mov	x2, #0x7                   	// #7
   0x0000fffff7f83124:	d2843a10	mov	x16, #0x21d0                	// #8656
   0x0000fffff7f83128:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8312c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83130:	d63f0200	blr	x16
   0x0000fffff7f83134:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83138:	54004fc0	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f8313c:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83140:	aa1303e1	mov	x1, x19
   0x0000fffff7f83144:	d2800102	mov	x2, #0x8                   	// #8
   0x0000fffff7f83148:	d2843a10	mov	x16, #0x21d0                	// #8656
   0x0000fffff7f8314c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83150:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83154:	d63f0200	blr	x16
   0x0000fffff7f83158:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8315c:	54004ea0	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83160:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83164:	aa1303e1	mov	x1, x19
   0x0000fffff7f83168:	d2800122	mov	x2, #0x9                   	// #9
   0x0000fffff7f8316c:	d2843a10	mov	x16, #0x21d0                	// #8656
   0x0000fffff7f83170:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83174:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83178:	d63f0200	blr	x16
   0x0000fffff7f8317c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83180:	54004d80	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83184:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83188:	aa1303e1	mov	x1, x19
   0x0000fffff7f8318c:	d2800142	mov	x2, #0xa                   	// #10
   0x0000fffff7f83190:	d2843a10	mov	x16, #0x21d0                	// #8656
   0x0000fffff7f83194:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83198:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8319c:	d63f0200	blr	x16
   0x0000fffff7f831a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f831a4:	54004c60	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f831a8:	b9401269	ldr	w9, [x19, #16]
   0x0000fffff7f831ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f831b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f831b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f831b8:	54004bc1	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f831bc:	f9400e69	ldr	x9, [x19, #24]
   0x0000fffff7f831c0:	f90007e9	str	x9, [sp, #8]
   0x0000fffff7f831c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f831c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f831cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f831d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f831d4:	54004ae1	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f831d8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7f831dc:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7f831e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f831e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f831e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f831ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7f831f0:	54004a01	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f831f4:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7f831f8:	fd000fe0	str	d0, [sp, #24]
   0x0000fffff7f831fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7f83200:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83204:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83208:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8320c:	54004921	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f83210:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7f83214:	fd0013e0	str	d0, [sp, #32]
   0x0000fffff7f83218:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7f8321c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83220:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83224:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83228:	54004841	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f8322c:	fd402e60	ldr	d0, [x19, #88]
   0x0000fffff7f83230:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7f83234:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7f83238:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f8323c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83240:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83244:	54004761	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f83248:	fd403660	ldr	d0, [x19, #104]
   0x0000fffff7f8324c:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7f83250:	b9407269	ldr	w9, [x19, #112]
   0x0000fffff7f83254:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83258:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f8325c:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83260:	54004681	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f83264:	fd403e60	ldr	d0, [x19, #120]
   0x0000fffff7f83268:	fd001fe0	str	d0, [sp, #56]
   0x0000fffff7f8326c:	b9408269	ldr	w9, [x19, #128]
   0x0000fffff7f83270:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83274:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83278:	eb0a013f	cmp	x9, x10
   0x0000fffff7f8327c:	540045a1	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f83280:	fd404660	ldr	d0, [x19, #136]
   0x0000fffff7f83284:	fd0023e0	str	d0, [sp, #64]
   0x0000fffff7f83288:	b9409269	ldr	w9, [x19, #144]
   0x0000fffff7f8328c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7f83290:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f83294:	eb0a013f	cmp	x9, x10
   0x0000fffff7f83298:	540044c1	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f8329c:	fd404e60	ldr	d0, [x19, #152]
   0x0000fffff7f832a0:	fd0027e0	str	d0, [sp, #72]
   0x0000fffff7f832a4:	b940a269	ldr	w9, [x19, #160]
   0x0000fffff7f832a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f832ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f832b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f832b4:	540043e1	b.ne	0xfffff7f83b30  // b.any
   0x0000fffff7f832b8:	f9405669	ldr	x9, [x19, #168]
   0x0000fffff7f832bc:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f832c0:	14000227	b	0xfffff7f83b5c
   0x0000fffff7f832c4:	f9402be9	ldr	x9, [sp, #80]
   0x0000fffff7f832c8:	f94007ea	ldr	x10, [sp, #8]
   0x0000fffff7f832cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7f832d0:	5400368a	b.ge	0xfffff7f839a0  // b.tcont
   0x0000fffff7f832d4:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f832d8:	f90403e9	str	x9, [sp, #2048]
   0x0000fffff7f832dc:	14000011	b	0xfffff7f83320
   0x0000fffff7f832e0:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f832e4:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f832e8:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f832ec:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f832f0:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f832f4:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f832f8:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f832fc:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f83300:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f83304:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83308:	d28edc10	mov	x16, #0x76e0                	// #30432
   0x0000fffff7f8330c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83310:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83314:	d63f0200	blr	x16
   0x0000fffff7f83318:	f100001f	cmp	x0, #0x0
   0x0000fffff7f8331c:	540040a0	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83320:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7f83324:	1e604010	fmov	d16, d0
   0x0000fffff7f83328:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f8332c:	f9402be9	ldr	x9, [sp, #80]
   0x0000fffff7f83330:	d28002ea	mov	x10, #0x17                  	// #23
   0x0000fffff7f83334:	9aca0d2b	sdiv	x11, x9, x10
   0x0000fffff7f83338:	9b0aa569	msub	x9, x11, x10, x9
   0x0000fffff7f8333c:	9e670131	fmov	d17, x9
   0x0000fffff7f83340:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83344:	f2e7fd89	movk	x9, #0x3fec, lsl #48
   0x0000fffff7f83348:	9e670132	fmov	d18, x9
   0x0000fffff7f8334c:	1e604200	fmov	d0, d16
   0x0000fffff7f83350:	1e604241	fmov	d1, d18
   0x0000fffff7f83354:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83358:	1e604013	fmov	d19, d0
   0x0000fffff7f8335c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83360:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f83364:	9e670134	fmov	d20, x9
   0x0000fffff7f83368:	1e604280	fmov	d0, d20
   0x0000fffff7f8336c:	1e604241	fmov	d1, d18
   0x0000fffff7f83370:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f83374:	1e604014	fmov	d20, d0
   0x0000fffff7f83378:	9e660229	fmov	x9, d17
   0x0000fffff7f8337c:	9e620120	scvtf	d0, x9
   0x0000fffff7f83380:	1e604281	fmov	d1, d20
   0x0000fffff7f83384:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83388:	1e604014	fmov	d20, d0
   0x0000fffff7f8338c:	1e604260	fmov	d0, d19
   0x0000fffff7f83390:	1e604281	fmov	d1, d20
   0x0000fffff7f83394:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83398:	1e604013	fmov	d19, d0
   0x0000fffff7f8339c:	1e604260	fmov	d0, d19
   0x0000fffff7f833a0:	1e604015	fmov	d21, d0
   0x0000fffff7f833a4:	1e6042a0	fmov	d0, d21
   0x0000fffff7f833a8:	fd000be0	str	d0, [sp, #16]
   0x0000fffff7f833ac:	fd0037f0	str	d16, [sp, #104]
   0x0000fffff7f833b0:	fd003bf1	str	d17, [sp, #112]
   0x0000fffff7f833b4:	fd003ff2	str	d18, [sp, #120]
   0x0000fffff7f833b8:	fd0043f3	str	d19, [sp, #128]
   0x0000fffff7f833bc:	fd0047f4	str	d20, [sp, #136]
   0x0000fffff7f833c0:	fd002ff5	str	d21, [sp, #88]
   0x0000fffff7f833c4:	14000011	b	0xfffff7f83408
   0x0000fffff7f833c8:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f833cc:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f833d0:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f833d4:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f833d8:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f833dc:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f833e0:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f833e4:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f833e8:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f833ec:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f833f0:	d28edc10	mov	x16, #0x76e0                	// #30432
   0x0000fffff7f833f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f833f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f833fc:	d63f0200	blr	x16
   0x0000fffff7f83400:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83404:	54003960	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83408:	fd400fe0	ldr	d0, [sp, #24]
   0x0000fffff7f8340c:	1e604010	fmov	d16, d0
   0x0000fffff7f83410:	fd400be0	ldr	d0, [sp, #16]
   0x0000fffff7f83414:	1e604011	fmov	d17, d0
   0x0000fffff7f83418:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8341c:	f2e7fd09	movk	x9, #0x3fe8, lsl #48
   0x0000fffff7f83420:	9e670132	fmov	d18, x9
   0x0000fffff7f83424:	1e604200	fmov	d0, d16
   0x0000fffff7f83428:	1e604241	fmov	d1, d18
   0x0000fffff7f8342c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83430:	1e604013	fmov	d19, d0
   0x0000fffff7f83434:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83438:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f8343c:	9e670134	fmov	d20, x9
   0x0000fffff7f83440:	1e604280	fmov	d0, d20
   0x0000fffff7f83444:	1e604241	fmov	d1, d18
   0x0000fffff7f83448:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f8344c:	1e604014	fmov	d20, d0
   0x0000fffff7f83450:	1e604220	fmov	d0, d17
   0x0000fffff7f83454:	1e604281	fmov	d1, d20
   0x0000fffff7f83458:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f8345c:	1e604014	fmov	d20, d0
   0x0000fffff7f83460:	1e604260	fmov	d0, d19
   0x0000fffff7f83464:	1e604281	fmov	d1, d20
   0x0000fffff7f83468:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f8346c:	1e604013	fmov	d19, d0
   0x0000fffff7f83470:	1e604260	fmov	d0, d19
   0x0000fffff7f83474:	1e604015	fmov	d21, d0
   0x0000fffff7f83478:	1e6042a0	fmov	d0, d21
   0x0000fffff7f8347c:	fd000fe0	str	d0, [sp, #24]
   0x0000fffff7f83480:	fd0037f0	str	d16, [sp, #104]
   0x0000fffff7f83484:	fd003bf1	str	d17, [sp, #112]
   0x0000fffff7f83488:	fd003ff2	str	d18, [sp, #120]
   0x0000fffff7f8348c:	fd0043f3	str	d19, [sp, #128]
   0x0000fffff7f83490:	fd0047f4	str	d20, [sp, #136]
   0x0000fffff7f83494:	fd002ff5	str	d21, [sp, #88]
   0x0000fffff7f83498:	14000011	b	0xfffff7f834dc
   0x0000fffff7f8349c:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f834a0:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f834a4:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f834a8:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f834ac:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f834b0:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f834b4:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f834b8:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f834bc:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f834c0:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f834c4:	d28edc10	mov	x16, #0x76e0                	// #30432
   0x0000fffff7f834c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f834cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f834d0:	d63f0200	blr	x16
   0x0000fffff7f834d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f834d8:	540032c0	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f834dc:	fd4013e0	ldr	d0, [sp, #32]
   0x0000fffff7f834e0:	1e604010	fmov	d16, d0
   0x0000fffff7f834e4:	fd400fe0	ldr	d0, [sp, #24]
   0x0000fffff7f834e8:	1e604011	fmov	d17, d0
   0x0000fffff7f834ec:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f834f0:	f2e7fc89	movk	x9, #0x3fe4, lsl #48
   0x0000fffff7f834f4:	9e670132	fmov	d18, x9
   0x0000fffff7f834f8:	1e604200	fmov	d0, d16
   0x0000fffff7f834fc:	1e604241	fmov	d1, d18
   0x0000fffff7f83500:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83504:	1e604013	fmov	d19, d0
   0x0000fffff7f83508:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8350c:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f83510:	9e670134	fmov	d20, x9
   0x0000fffff7f83514:	1e604280	fmov	d0, d20
   0x0000fffff7f83518:	1e604241	fmov	d1, d18
   0x0000fffff7f8351c:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f83520:	1e604014	fmov	d20, d0
   0x0000fffff7f83524:	1e604220	fmov	d0, d17
   0x0000fffff7f83528:	1e604281	fmov	d1, d20
   0x0000fffff7f8352c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83530:	1e604014	fmov	d20, d0
   0x0000fffff7f83534:	1e604260	fmov	d0, d19
   0x0000fffff7f83538:	1e604281	fmov	d1, d20
   0x0000fffff7f8353c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83540:	1e604013	fmov	d19, d0
   0x0000fffff7f83544:	1e604260	fmov	d0, d19
   0x0000fffff7f83548:	1e604015	fmov	d21, d0
   0x0000fffff7f8354c:	1e6042a0	fmov	d0, d21
   0x0000fffff7f83550:	fd0013e0	str	d0, [sp, #32]
   0x0000fffff7f83554:	fd0037f0	str	d16, [sp, #104]
   0x0000fffff7f83558:	fd003bf1	str	d17, [sp, #112]
   0x0000fffff7f8355c:	fd003ff2	str	d18, [sp, #120]
   0x0000fffff7f83560:	fd0043f3	str	d19, [sp, #128]
   0x0000fffff7f83564:	fd0047f4	str	d20, [sp, #136]
   0x0000fffff7f83568:	fd002ff5	str	d21, [sp, #88]
   0x0000fffff7f8356c:	14000011	b	0xfffff7f835b0
   0x0000fffff7f83570:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f83574:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f83578:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f8357c:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f83580:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f83584:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f83588:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f8358c:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f83590:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f83594:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83598:	d28edc10	mov	x16, #0x76e0                	// #30432
   0x0000fffff7f8359c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f835a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f835a4:	d63f0200	blr	x16
   0x0000fffff7f835a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f835ac:	54002c20	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f835b0:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7f835b4:	1e604010	fmov	d16, d0
   0x0000fffff7f835b8:	fd4013e0	ldr	d0, [sp, #32]
   0x0000fffff7f835bc:	1e604011	fmov	d17, d0
   0x0000fffff7f835c0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f835c4:	f2e7fc09	movk	x9, #0x3fe0, lsl #48
   0x0000fffff7f835c8:	9e670132	fmov	d18, x9
   0x0000fffff7f835cc:	1e604200	fmov	d0, d16
   0x0000fffff7f835d0:	1e604241	fmov	d1, d18
   0x0000fffff7f835d4:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f835d8:	1e604013	fmov	d19, d0
   0x0000fffff7f835dc:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f835e0:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f835e4:	9e670134	fmov	d20, x9
   0x0000fffff7f835e8:	1e604280	fmov	d0, d20
   0x0000fffff7f835ec:	1e604241	fmov	d1, d18
   0x0000fffff7f835f0:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f835f4:	1e604014	fmov	d20, d0
   0x0000fffff7f835f8:	1e604220	fmov	d0, d17
   0x0000fffff7f835fc:	1e604281	fmov	d1, d20
   0x0000fffff7f83600:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83604:	1e604014	fmov	d20, d0
   0x0000fffff7f83608:	1e604260	fmov	d0, d19
   0x0000fffff7f8360c:	1e604281	fmov	d1, d20
   0x0000fffff7f83610:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83614:	1e604013	fmov	d19, d0
   0x0000fffff7f83618:	1e604260	fmov	d0, d19
   0x0000fffff7f8361c:	1e604015	fmov	d21, d0
   0x0000fffff7f83620:	1e6042a0	fmov	d0, d21
   0x0000fffff7f83624:	fd0017e0	str	d0, [sp, #40]
   0x0000fffff7f83628:	fd0037f0	str	d16, [sp, #104]
   0x0000fffff7f8362c:	fd003bf1	str	d17, [sp, #112]
   0x0000fffff7f83630:	fd003ff2	str	d18, [sp, #120]
   0x0000fffff7f83634:	fd0043f3	str	d19, [sp, #128]
   0x0000fffff7f83638:	fd0047f4	str	d20, [sp, #136]
   0x0000fffff7f8363c:	fd002ff5	str	d21, [sp, #88]
   0x0000fffff7f83640:	14000011	b	0xfffff7f83684
   0x0000fffff7f83644:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f83648:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f8364c:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f83650:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f83654:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f83658:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f8365c:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83660:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f83664:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f83668:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f8366c:	d28edc10	mov	x16, #0x76e0                	// #30432
   0x0000fffff7f83670:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83674:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83678:	d63f0200	blr	x16
   0x0000fffff7f8367c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83680:	54002580	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83684:	fd401be0	ldr	d0, [sp, #48]
   0x0000fffff7f83688:	1e604010	fmov	d16, d0
   0x0000fffff7f8368c:	fd4017e0	ldr	d0, [sp, #40]
   0x0000fffff7f83690:	1e604011	fmov	d17, d0
   0x0000fffff7f83694:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83698:	f2e7fd89	movk	x9, #0x3fec, lsl #48
   0x0000fffff7f8369c:	9e670132	fmov	d18, x9
   0x0000fffff7f836a0:	1e604200	fmov	d0, d16
   0x0000fffff7f836a4:	1e604241	fmov	d1, d18
   0x0000fffff7f836a8:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f836ac:	1e604013	fmov	d19, d0
   0x0000fffff7f836b0:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f836b4:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f836b8:	9e670134	fmov	d20, x9
   0x0000fffff7f836bc:	1e604280	fmov	d0, d20
   0x0000fffff7f836c0:	1e604241	fmov	d1, d18
   0x0000fffff7f836c4:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f836c8:	1e604014	fmov	d20, d0
   0x0000fffff7f836cc:	1e604220	fmov	d0, d17
   0x0000fffff7f836d0:	1e604281	fmov	d1, d20
   0x0000fffff7f836d4:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f836d8:	1e604014	fmov	d20, d0
   0x0000fffff7f836dc:	1e604260	fmov	d0, d19
   0x0000fffff7f836e0:	1e604281	fmov	d1, d20
   0x0000fffff7f836e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f836e8:	1e604013	fmov	d19, d0
   0x0000fffff7f836ec:	1e604260	fmov	d0, d19
   0x0000fffff7f836f0:	1e604015	fmov	d21, d0
   0x0000fffff7f836f4:	1e6042a0	fmov	d0, d21
   0x0000fffff7f836f8:	fd001be0	str	d0, [sp, #48]
   0x0000fffff7f836fc:	fd0037f0	str	d16, [sp, #104]
   0x0000fffff7f83700:	fd003bf1	str	d17, [sp, #112]
   0x0000fffff7f83704:	fd003ff2	str	d18, [sp, #120]
   0x0000fffff7f83708:	fd0043f3	str	d19, [sp, #128]
   0x0000fffff7f8370c:	fd0047f4	str	d20, [sp, #136]
   0x0000fffff7f83710:	fd002ff5	str	d21, [sp, #88]
   0x0000fffff7f83714:	14000011	b	0xfffff7f83758
   0x0000fffff7f83718:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f8371c:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f83720:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f83724:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f83728:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f8372c:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f83730:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83734:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f83738:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f8373c:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83740:	d28edc10	mov	x16, #0x76e0                	// #30432
   0x0000fffff7f83744:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83748:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f8374c:	d63f0200	blr	x16
   0x0000fffff7f83750:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83754:	54001ee0	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83758:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7f8375c:	1e604010	fmov	d16, d0
   0x0000fffff7f83760:	fd401be0	ldr	d0, [sp, #48]
   0x0000fffff7f83764:	1e604011	fmov	d17, d0
   0x0000fffff7f83768:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8376c:	f2e7fd09	movk	x9, #0x3fe8, lsl #48
   0x0000fffff7f83770:	9e670132	fmov	d18, x9
   0x0000fffff7f83774:	1e604200	fmov	d0, d16
   0x0000fffff7f83778:	1e604241	fmov	d1, d18
   0x0000fffff7f8377c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83780:	1e604013	fmov	d19, d0
   0x0000fffff7f83784:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83788:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f8378c:	9e670134	fmov	d20, x9
   0x0000fffff7f83790:	1e604280	fmov	d0, d20
   0x0000fffff7f83794:	1e604241	fmov	d1, d18
   0x0000fffff7f83798:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f8379c:	1e604014	fmov	d20, d0
   0x0000fffff7f837a0:	1e604220	fmov	d0, d17
   0x0000fffff7f837a4:	1e604281	fmov	d1, d20
   0x0000fffff7f837a8:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f837ac:	1e604014	fmov	d20, d0
   0x0000fffff7f837b0:	1e604260	fmov	d0, d19
   0x0000fffff7f837b4:	1e604281	fmov	d1, d20
   0x0000fffff7f837b8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f837bc:	1e604013	fmov	d19, d0
   0x0000fffff7f837c0:	1e604260	fmov	d0, d19
   0x0000fffff7f837c4:	1e604015	fmov	d21, d0
   0x0000fffff7f837c8:	1e6042a0	fmov	d0, d21
   0x0000fffff7f837cc:	fd001fe0	str	d0, [sp, #56]
   0x0000fffff7f837d0:	fd0037f0	str	d16, [sp, #104]
   0x0000fffff7f837d4:	fd003bf1	str	d17, [sp, #112]
   0x0000fffff7f837d8:	fd003ff2	str	d18, [sp, #120]
   0x0000fffff7f837dc:	fd0043f3	str	d19, [sp, #128]
   0x0000fffff7f837e0:	fd0047f4	str	d20, [sp, #136]
   0x0000fffff7f837e4:	fd002ff5	str	d21, [sp, #88]
   0x0000fffff7f837e8:	14000011	b	0xfffff7f8382c
   0x0000fffff7f837ec:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f837f0:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f837f4:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f837f8:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f837fc:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f83800:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f83804:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83808:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f8380c:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f83810:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83814:	d28edc10	mov	x16, #0x76e0                	// #30432
   0x0000fffff7f83818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f8381c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83820:	d63f0200	blr	x16
   0x0000fffff7f83824:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83828:	54001840	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f8382c:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7f83830:	1e604010	fmov	d16, d0
   0x0000fffff7f83834:	fd401fe0	ldr	d0, [sp, #56]
   0x0000fffff7f83838:	1e604011	fmov	d17, d0
   0x0000fffff7f8383c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83840:	f2e7fc89	movk	x9, #0x3fe4, lsl #48
   0x0000fffff7f83844:	9e670132	fmov	d18, x9
   0x0000fffff7f83848:	1e604200	fmov	d0, d16
   0x0000fffff7f8384c:	1e604241	fmov	d1, d18
   0x0000fffff7f83850:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83854:	1e604013	fmov	d19, d0
   0x0000fffff7f83858:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f8385c:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f83860:	9e670134	fmov	d20, x9
   0x0000fffff7f83864:	1e604280	fmov	d0, d20
   0x0000fffff7f83868:	1e604241	fmov	d1, d18
   0x0000fffff7f8386c:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f83870:	1e604014	fmov	d20, d0
   0x0000fffff7f83874:	1e604220	fmov	d0, d17
   0x0000fffff7f83878:	1e604281	fmov	d1, d20
   0x0000fffff7f8387c:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83880:	1e604014	fmov	d20, d0
   0x0000fffff7f83884:	1e604260	fmov	d0, d19
   0x0000fffff7f83888:	1e604281	fmov	d1, d20
   0x0000fffff7f8388c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83890:	1e604013	fmov	d19, d0
   0x0000fffff7f83894:	1e604260	fmov	d0, d19
   0x0000fffff7f83898:	1e604015	fmov	d21, d0
   0x0000fffff7f8389c:	1e6042a0	fmov	d0, d21
   0x0000fffff7f838a0:	fd0023e0	str	d0, [sp, #64]
   0x0000fffff7f838a4:	fd0037f0	str	d16, [sp, #104]
   0x0000fffff7f838a8:	fd003bf1	str	d17, [sp, #112]
   0x0000fffff7f838ac:	fd003ff2	str	d18, [sp, #120]
   0x0000fffff7f838b0:	fd0043f3	str	d19, [sp, #128]
   0x0000fffff7f838b4:	fd0047f4	str	d20, [sp, #136]
   0x0000fffff7f838b8:	fd002ff5	str	d21, [sp, #88]
   0x0000fffff7f838bc:	14000011	b	0xfffff7f83900
   0x0000fffff7f838c0:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f838c4:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f838c8:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f838cc:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f838d0:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f838d4:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f838d8:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f838dc:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f838e0:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f838e4:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f838e8:	d28edc10	mov	x16, #0x76e0                	// #30432
   0x0000fffff7f838ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f838f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f838f4:	d63f0200	blr	x16
   0x0000fffff7f838f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f838fc:	540011a0	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83900:	fd4027e0	ldr	d0, [sp, #72]
   0x0000fffff7f83904:	1e604010	fmov	d16, d0
   0x0000fffff7f83908:	fd4023e0	ldr	d0, [sp, #64]
   0x0000fffff7f8390c:	1e604011	fmov	d17, d0
   0x0000fffff7f83910:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83914:	f2e7fc09	movk	x9, #0x3fe0, lsl #48
   0x0000fffff7f83918:	9e670132	fmov	d18, x9
   0x0000fffff7f8391c:	1e604200	fmov	d0, d16
   0x0000fffff7f83920:	1e604241	fmov	d1, d18
   0x0000fffff7f83924:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83928:	1e604013	fmov	d19, d0
   0x0000fffff7f8392c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f83930:	f2e7fe09	movk	x9, #0x3ff0, lsl #48
   0x0000fffff7f83934:	9e670134	fmov	d20, x9
   0x0000fffff7f83938:	1e604280	fmov	d0, d20
   0x0000fffff7f8393c:	1e604241	fmov	d1, d18
   0x0000fffff7f83940:	1e613800	fsub	d0, d0, d1
   0x0000fffff7f83944:	1e604014	fmov	d20, d0
   0x0000fffff7f83948:	1e604220	fmov	d0, d17
   0x0000fffff7f8394c:	1e604281	fmov	d1, d20
   0x0000fffff7f83950:	1e610800	fmul	d0, d0, d1
   0x0000fffff7f83954:	1e604014	fmov	d20, d0
   0x0000fffff7f83958:	1e604260	fmov	d0, d19
   0x0000fffff7f8395c:	1e604281	fmov	d1, d20
   0x0000fffff7f83960:	1e612800	fadd	d0, d0, d1
   0x0000fffff7f83964:	1e604013	fmov	d19, d0
   0x0000fffff7f83968:	1e604260	fmov	d0, d19
   0x0000fffff7f8396c:	1e604015	fmov	d21, d0
   0x0000fffff7f83970:	1e6042a0	fmov	d0, d21
   0x0000fffff7f83974:	fd0027e0	str	d0, [sp, #72]
   0x0000fffff7f83978:	f9402be9	ldr	x9, [sp, #80]
   0x0000fffff7f8397c:	f9002fe9	str	x9, [sp, #88]
   0x0000fffff7f83980:	91000529	add	x9, x9, #0x1
   0x0000fffff7f83984:	f9002be9	str	x9, [sp, #80]
   0x0000fffff7f83988:	fd0037f0	str	d16, [sp, #104]
   0x0000fffff7f8398c:	fd003bf1	str	d17, [sp, #112]
   0x0000fffff7f83990:	fd003ff2	str	d18, [sp, #120]
   0x0000fffff7f83994:	fd0043f3	str	d19, [sp, #128]
   0x0000fffff7f83998:	fd0047f4	str	d20, [sp, #136]
   0x0000fffff7f8399c:	17fffe4a	b	0xfffff7f832c4
   0x0000fffff7f839a0:	f94403e9	ldr	x9, [sp, #2048]
   0x0000fffff7f839a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7f839a8:	54000aa0	b.eq	0xfffff7f83afc  // b.none
   0x0000fffff7f839ac:	aa1303e0	mov	x0, x19
   0x0000fffff7f839b0:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f839b4:	910043e2	add	x2, sp, #0x10
   0x0000fffff7f839b8:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f839bc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f839c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f839c4:	d63f0200	blr	x16
   0x0000fffff7f839c8:	aa1303e0	mov	x0, x19
   0x0000fffff7f839cc:	d2800061	mov	x1, #0x3                   	// #3
   0x0000fffff7f839d0:	910063e2	add	x2, sp, #0x18
   0x0000fffff7f839d4:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f839d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f839dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f839e0:	d63f0200	blr	x16
   0x0000fffff7f839e4:	aa1303e0	mov	x0, x19
   0x0000fffff7f839e8:	d2800081	mov	x1, #0x4                   	// #4
   0x0000fffff7f839ec:	910083e2	add	x2, sp, #0x20
   0x0000fffff7f839f0:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f839f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f839f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f839fc:	d63f0200	blr	x16
   0x0000fffff7f83a00:	aa1303e0	mov	x0, x19
   0x0000fffff7f83a04:	d28000a1	mov	x1, #0x5                   	// #5
   0x0000fffff7f83a08:	9100a3e2	add	x2, sp, #0x28
   0x0000fffff7f83a0c:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f83a10:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a18:	d63f0200	blr	x16
   0x0000fffff7f83a1c:	aa1303e0	mov	x0, x19
   0x0000fffff7f83a20:	d28000c1	mov	x1, #0x6                   	// #6
   0x0000fffff7f83a24:	9100c3e2	add	x2, sp, #0x30
   0x0000fffff7f83a28:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f83a2c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a34:	d63f0200	blr	x16
   0x0000fffff7f83a38:	aa1303e0	mov	x0, x19
   0x0000fffff7f83a3c:	d28000e1	mov	x1, #0x7                   	// #7
   0x0000fffff7f83a40:	9100e3e2	add	x2, sp, #0x38
   0x0000fffff7f83a44:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f83a48:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a4c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a50:	d63f0200	blr	x16
   0x0000fffff7f83a54:	aa1303e0	mov	x0, x19
   0x0000fffff7f83a58:	d2800101	mov	x1, #0x8                   	// #8
   0x0000fffff7f83a5c:	910103e2	add	x2, sp, #0x40
   0x0000fffff7f83a60:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f83a64:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a6c:	d63f0200	blr	x16
   0x0000fffff7f83a70:	aa1303e0	mov	x0, x19
   0x0000fffff7f83a74:	d2800121	mov	x1, #0x9                   	// #9
   0x0000fffff7f83a78:	910123e2	add	x2, sp, #0x48
   0x0000fffff7f83a7c:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f83a80:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83a84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83a88:	d63f0200	blr	x16
   0x0000fffff7f83a8c:	aa1303e0	mov	x0, x19
   0x0000fffff7f83a90:	d2800141	mov	x1, #0xa                   	// #10
   0x0000fffff7f83a94:	f9402be2	ldr	x2, [sp, #80]
   0x0000fffff7f83a98:	d284c210	mov	x16, #0x2610                	// #9744
   0x0000fffff7f83a9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83aa0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83aa4:	d63f0200	blr	x16
   0x0000fffff7f83aa8:	aa1303e0	mov	x0, x19
   0x0000fffff7f83aac:	d2800161	mov	x1, #0xb                   	// #11
   0x0000fffff7f83ab0:	f9402fe2	ldr	x2, [sp, #88]
   0x0000fffff7f83ab4:	d284c210	mov	x16, #0x2610                	// #9744
   0x0000fffff7f83ab8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83abc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83ac0:	d63f0200	blr	x16
   0x0000fffff7f83ac4:	aa1303e0	mov	x0, x19
   0x0000fffff7f83ac8:	d28001a1	mov	x1, #0xd                   	// #13
   0x0000fffff7f83acc:	9101a3e2	add	x2, sp, #0x68
   0x0000fffff7f83ad0:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f83ad4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83ad8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83adc:	d63f0200	blr	x16
   0x0000fffff7f83ae0:	aa1303e0	mov	x0, x19
   0x0000fffff7f83ae4:	d28001c1	mov	x1, #0xe                   	// #14
   0x0000fffff7f83ae8:	9101c3e2	add	x2, sp, #0x70
   0x0000fffff7f83aec:	d285c290	mov	x16, #0x2e14                	// #11796
   0x0000fffff7f83af0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83af4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83af8:	d63f0200	blr	x16
   0x0000fffff7f83afc:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f83b00:	f9000289	str	x9, [x20]
   0x0000fffff7f83b04:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83b08:	d2849210	mov	x16, #0x2490                	// #9360
   0x0000fffff7f83b0c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83b10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83b14:	d63f0200	blr	x16
   0x0000fffff7f83b18:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f83b1c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f83b20:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f83b24:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f83b28:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f83b2c:	d65f03c0	ret
   0x0000fffff7f83b30:	911fe3e0	add	x0, sp, #0x7f8
   0x0000fffff7f83b34:	d2849410	mov	x16, #0x24a0                	// #9376
   0x0000fffff7f83b38:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83b3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83b40:	d63f0200	blr	x16
   0x0000fffff7f83b44:	913003ff	add	sp, sp, #0xc00
   0x0000fffff7f83b48:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f83b4c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f83b50:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f83b54:	d2800000	mov	x0, #0x0                   	// #0
   0x0000fffff7f83b58:	d65f03c0	ret
   0x0000fffff7f83b5c:	aa1303e0	mov	x0, x19
   0x0000fffff7f83b60:	d2800001	mov	x1, #0x0                   	// #0
   0x0000fffff7f83b64:	d2810d02	mov	x2, #0x868                 	// #2152
   0x0000fffff7f83b68:	f2b55822	movk	x2, #0xaac1, lsl #16
   0x0000fffff7f83b6c:	f2d55542	movk	x2, #0xaaaa, lsl #32
   0x0000fffff7f83b70:	d2966803	mov	x3, #0xb340                	// #45888
   0x0000fffff7f83b74:	f2b55a43	movk	x3, #0xaad2, lsl #16
   0x0000fffff7f83b78:	f2d55543	movk	x3, #0xaaaa, lsl #32
   0x0000fffff7f83b7c:	d299dd04	mov	x4, #0xcee8                	// #52968
   0x0000fffff7f83b80:	f2b557e4	movk	x4, #0xaabf, lsl #16
   0x0000fffff7f83b84:	f2d55544	movk	x4, #0xaaaa, lsl #32
   0x0000fffff7f83b88:	d28edc10	mov	x16, #0x76e0                	// #30432
   0x0000fffff7f83b8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f83b90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f83b94:	d63f0200	blr	x16
   0x0000fffff7f83b98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f83b9c:	54fffca0	b.eq	0xfffff7f83b30  // b.none
   0x0000fffff7f83ba0:	17fffdc9	b	0xfffff7f832c4
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
