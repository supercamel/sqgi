
/tmp/sqgi-v21-native-profile/floats/638430-4.bin:     file format binary


Disassembly of section .data:

0000ffff9c6d2000 <.data>:
    ffff9c6d2000:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    ffff9c6d2004:	910003fd 	mov	x29, sp
    ffff9c6d2008:	a9bf53f3 	stp	x19, x20, [sp, #-16]!
    ffff9c6d200c:	a9bf5bf5 	stp	x21, x22, [sp, #-16]!
    ffff9c6d2010:	d13003ff 	sub	sp, sp, #0xc00
    ffff9c6d2014:	aa0003f3 	mov	x19, x0
    ffff9c6d2018:	aa0103f4 	mov	x20, x1
    ffff9c6d201c:	aa0203f5 	mov	x21, x2
    ffff9c6d2020:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d2024:	912063e1 	add	x1, sp, #0x818
    ffff9c6d2028:	d2856c02 	mov	x2, #0x2b60                	// #11104
    ffff9c6d202c:	f2ba7742 	movk	x2, #0xd3ba, lsl #16
    ffff9c6d2030:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d2034:	d2910410 	mov	x16, #0x8820                	// #34848
    ffff9c6d2038:	f2ba2290 	movk	x16, #0xd114, lsl #16
    ffff9c6d203c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d2040:	d63f0200 	blr	x16
    ffff9c6d2044:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d2048:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d204c:	f9401ea9 	ldr	x9, [x21, #56]
    ffff9c6d2050:	d285da0a 	mov	x10, #0x2ed0                	// #11984
    ffff9c6d2054:	f2ba778a 	movk	x10, #0xd3bc, lsl #16
    ffff9c6d2058:	f2d5554a 	movk	x10, #0xaaaa, lsl #32
    ffff9c6d205c:	eb0a013f 	cmp	x9, x10
    ffff9c6d2060:	54001d01 	b.ne	0xffff9c6d2400  // b.any
    ffff9c6d2064:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d2068:	aa1303e1 	mov	x1, x19
    ffff9c6d206c:	d2800042 	mov	x2, #0x2                   	// #2
    ffff9c6d2070:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d2074:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d2078:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d207c:	d63f0200 	blr	x16
    ffff9c6d2080:	f100001f 	cmp	x0, #0x0
    ffff9c6d2084:	54001be0 	b.eq	0xffff9c6d2400  // b.none
    ffff9c6d2088:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d208c:	aa1303e1 	mov	x1, x19
    ffff9c6d2090:	d2800062 	mov	x2, #0x3                   	// #3
    ffff9c6d2094:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d2098:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d209c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d20a0:	d63f0200 	blr	x16
    ffff9c6d20a4:	f100001f 	cmp	x0, #0x0
    ffff9c6d20a8:	54001ac0 	b.eq	0xffff9c6d2400  // b.none
    ffff9c6d20ac:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d20b0:	aa1303e1 	mov	x1, x19
    ffff9c6d20b4:	d2800082 	mov	x2, #0x4                   	// #4
    ffff9c6d20b8:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d20bc:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d20c0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d20c4:	d63f0200 	blr	x16
    ffff9c6d20c8:	f100001f 	cmp	x0, #0x0
    ffff9c6d20cc:	540019a0 	b.eq	0xffff9c6d2400  // b.none
    ffff9c6d20d0:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d20d4:	aa1303e1 	mov	x1, x19
    ffff9c6d20d8:	d28000a2 	mov	x2, #0x5                   	// #5
    ffff9c6d20dc:	d2822610 	mov	x16, #0x1130                	// #4400
    ffff9c6d20e0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d20e4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d20e8:	d63f0200 	blr	x16
    ffff9c6d20ec:	f100001f 	cmp	x0, #0x0
    ffff9c6d20f0:	54001880 	b.eq	0xffff9c6d2400  // b.none
    ffff9c6d20f4:	b9401269 	ldr	w9, [x19, #16]
    ffff9c6d20f8:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d20fc:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d2100:	eb0a013f 	cmp	x9, x10
    ffff9c6d2104:	540017e1 	b.ne	0xffff9c6d2400  // b.any
    ffff9c6d2108:	f9400e69 	ldr	x9, [x19, #24]
    ffff9c6d210c:	f90007e9 	str	x9, [sp, #8]
    ffff9c6d2110:	b9402269 	ldr	w9, [x19, #32]
    ffff9c6d2114:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d2118:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d211c:	eb0a013f 	cmp	x9, x10
    ffff9c6d2120:	54001701 	b.ne	0xffff9c6d2400  // b.any
    ffff9c6d2124:	fd401660 	ldr	d0, [x19, #40]
    ffff9c6d2128:	fd000be0 	str	d0, [sp, #16]
    ffff9c6d212c:	b9403269 	ldr	w9, [x19, #48]
    ffff9c6d2130:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d2134:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d2138:	eb0a013f 	cmp	x9, x10
    ffff9c6d213c:	54001621 	b.ne	0xffff9c6d2400  // b.any
    ffff9c6d2140:	fd401e60 	ldr	d0, [x19, #56]
    ffff9c6d2144:	fd000fe0 	str	d0, [sp, #24]
    ffff9c6d2148:	b9404269 	ldr	w9, [x19, #64]
    ffff9c6d214c:	5280008a 	mov	w10, #0x4                   	// #4
    ffff9c6d2150:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d2154:	eb0a013f 	cmp	x9, x10
    ffff9c6d2158:	54001541 	b.ne	0xffff9c6d2400  // b.any
    ffff9c6d215c:	fd402660 	ldr	d0, [x19, #72]
    ffff9c6d2160:	fd0013e0 	str	d0, [sp, #32]
    ffff9c6d2164:	b9405269 	ldr	w9, [x19, #80]
    ffff9c6d2168:	5280004a 	mov	w10, #0x2                   	// #2
    ffff9c6d216c:	72a0a00a 	movk	w10, #0x500, lsl #16
    ffff9c6d2170:	eb0a013f 	cmp	x9, x10
    ffff9c6d2174:	54001461 	b.ne	0xffff9c6d2400  // b.any
    ffff9c6d2178:	f9402e69 	ldr	x9, [x19, #88]
    ffff9c6d217c:	f90017e9 	str	x9, [sp, #40]
    ffff9c6d2180:	140000ab 	b	0xffff9c6d242c
    ffff9c6d2184:	f94017e9 	ldr	x9, [sp, #40]
    ffff9c6d2188:	f94007ea 	ldr	x10, [sp, #8]
    ffff9c6d218c:	eb0a013f 	cmp	x9, x10
    ffff9c6d2190:	54000b6a 	b.ge	0xffff9c6d22fc  // b.tcont
    ffff9c6d2194:	d2800029 	mov	x9, #0x1                   	// #1
    ffff9c6d2198:	f90403e9 	str	x9, [sp, #2048]
    ffff9c6d219c:	14000011 	b	0xffff9c6d21e0
    ffff9c6d21a0:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d21a4:	d28fda02 	mov	x2, #0x7ed0                	// #32464
    ffff9c6d21a8:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d21ac:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d21b0:	d282b803 	mov	x3, #0x15c0                	// #5568
    ffff9c6d21b4:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d21b8:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d21bc:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d21c0:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d21c4:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d21c8:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d21cc:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d21d0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d21d4:	d63f0200 	blr	x16
    ffff9c6d21d8:	f100001f 	cmp	x0, #0x0
    ffff9c6d21dc:	54001120 	b.eq	0xffff9c6d2400  // b.none
    ffff9c6d21e0:	f9400be9 	ldr	x9, [sp, #16]
    ffff9c6d21e4:	f90023e9 	str	x9, [sp, #64]
    ffff9c6d21e8:	f9400fe9 	ldr	x9, [sp, #24]
    ffff9c6d21ec:	f90027e9 	str	x9, [sp, #72]
    ffff9c6d21f0:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d21f4:	f2dc0009 	movk	x9, #0xe000, lsl #32
    ffff9c6d21f8:	f2e7fde9 	movk	x9, #0x3fef, lsl #48
    ffff9c6d21fc:	f9002be9 	str	x9, [sp, #80]
    ffff9c6d2200:	fd4027e0 	ldr	d0, [sp, #72]
    ffff9c6d2204:	fd402be1 	ldr	d1, [sp, #80]
    ffff9c6d2208:	1e610800 	fmul	d0, d0, d1
    ffff9c6d220c:	fd002be0 	str	d0, [sp, #80]
    ffff9c6d2210:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d2214:	f2e7f209 	movk	x9, #0x3f90, lsl #48
    ffff9c6d2218:	f9002fe9 	str	x9, [sp, #88]
    ffff9c6d221c:	fd4023e0 	ldr	d0, [sp, #64]
    ffff9c6d2220:	fd402fe1 	ldr	d1, [sp, #88]
    ffff9c6d2224:	1e610800 	fmul	d0, d0, d1
    ffff9c6d2228:	fd002fe0 	str	d0, [sp, #88]
    ffff9c6d222c:	fd402be0 	ldr	d0, [sp, #80]
    ffff9c6d2230:	fd402fe1 	ldr	d1, [sp, #88]
    ffff9c6d2234:	1e613800 	fsub	d0, d0, d1
    ffff9c6d2238:	fd002be0 	str	d0, [sp, #80]
    ffff9c6d223c:	f9402be9 	ldr	x9, [sp, #80]
    ffff9c6d2240:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d2244:	d2800229 	mov	x9, #0x11                  	// #17
    ffff9c6d2248:	f9001fe9 	str	x9, [sp, #56]
    ffff9c6d224c:	f94017e9 	ldr	x9, [sp, #40]
    ffff9c6d2250:	d280022a 	mov	x10, #0x11                  	// #17
    ffff9c6d2254:	9aca0d2b 	sdiv	x11, x9, x10
    ffff9c6d2258:	9b0aa569 	msub	x9, x11, x10, x9
    ffff9c6d225c:	f9001fe9 	str	x9, [sp, #56]
    ffff9c6d2260:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d2264:	f2e7ea09 	movk	x9, #0x3f50, lsl #48
    ffff9c6d2268:	f90023e9 	str	x9, [sp, #64]
    ffff9c6d226c:	f9401fe9 	ldr	x9, [sp, #56]
    ffff9c6d2270:	9e620120 	scvtf	d0, x9
    ffff9c6d2274:	fd4023e1 	ldr	d1, [sp, #64]
    ffff9c6d2278:	1e610800 	fmul	d0, d0, d1
    ffff9c6d227c:	fd001fe0 	str	d0, [sp, #56]
    ffff9c6d2280:	fd401be0 	ldr	d0, [sp, #48]
    ffff9c6d2284:	fd401fe1 	ldr	d1, [sp, #56]
    ffff9c6d2288:	1e612800 	fadd	d0, d0, d1
    ffff9c6d228c:	fd000fe0 	str	d0, [sp, #24]
    ffff9c6d2290:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d2294:	f2e7f809 	movk	x9, #0x3fc0, lsl #48
    ffff9c6d2298:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d229c:	fd400fe0 	ldr	d0, [sp, #24]
    ffff9c6d22a0:	fd401be1 	ldr	d1, [sp, #48]
    ffff9c6d22a4:	1e610800 	fmul	d0, d0, d1
    ffff9c6d22a8:	fd001be0 	str	d0, [sp, #48]
    ffff9c6d22ac:	fd400be0 	ldr	d0, [sp, #16]
    ffff9c6d22b0:	fd401be1 	ldr	d1, [sp, #48]
    ffff9c6d22b4:	1e612800 	fadd	d0, d0, d1
    ffff9c6d22b8:	fd000be0 	str	d0, [sp, #16]
    ffff9c6d22bc:	d2800009 	mov	x9, #0x0                   	// #0
    ffff9c6d22c0:	f2e7f209 	movk	x9, #0x3f90, lsl #48
    ffff9c6d22c4:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d22c8:	fd400be0 	ldr	d0, [sp, #16]
    ffff9c6d22cc:	fd401be1 	ldr	d1, [sp, #48]
    ffff9c6d22d0:	1e610800 	fmul	d0, d0, d1
    ffff9c6d22d4:	fd001be0 	str	d0, [sp, #48]
    ffff9c6d22d8:	fd4013e0 	ldr	d0, [sp, #32]
    ffff9c6d22dc:	fd401be1 	ldr	d1, [sp, #48]
    ffff9c6d22e0:	1e612800 	fadd	d0, d0, d1
    ffff9c6d22e4:	fd0013e0 	str	d0, [sp, #32]
    ffff9c6d22e8:	f94017e9 	ldr	x9, [sp, #40]
    ffff9c6d22ec:	f9001be9 	str	x9, [sp, #48]
    ffff9c6d22f0:	91000529 	add	x9, x9, #0x1
    ffff9c6d22f4:	f90017e9 	str	x9, [sp, #40]
    ffff9c6d22f8:	17ffffa3 	b	0xffff9c6d2184
    ffff9c6d22fc:	f94403e9 	ldr	x9, [sp, #2048]
    ffff9c6d2300:	f100013f 	cmp	x9, #0x0
    ffff9c6d2304:	54000640 	b.eq	0xffff9c6d23cc  // b.none
    ffff9c6d2308:	aa1303e0 	mov	x0, x19
    ffff9c6d230c:	d2800041 	mov	x1, #0x2                   	// #2
    ffff9c6d2310:	910043e2 	add	x2, sp, #0x10
    ffff9c6d2314:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d2318:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d231c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d2320:	d63f0200 	blr	x16
    ffff9c6d2324:	aa1303e0 	mov	x0, x19
    ffff9c6d2328:	d2800061 	mov	x1, #0x3                   	// #3
    ffff9c6d232c:	910063e2 	add	x2, sp, #0x18
    ffff9c6d2330:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d2334:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d2338:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d233c:	d63f0200 	blr	x16
    ffff9c6d2340:	aa1303e0 	mov	x0, x19
    ffff9c6d2344:	d2800081 	mov	x1, #0x4                   	// #4
    ffff9c6d2348:	910083e2 	add	x2, sp, #0x20
    ffff9c6d234c:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d2350:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d2354:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d2358:	d63f0200 	blr	x16
    ffff9c6d235c:	aa1303e0 	mov	x0, x19
    ffff9c6d2360:	d28000a1 	mov	x1, #0x5                   	// #5
    ffff9c6d2364:	f94017e2 	ldr	x2, [sp, #40]
    ffff9c6d2368:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d236c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d2370:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d2374:	d63f0200 	blr	x16
    ffff9c6d2378:	aa1303e0 	mov	x0, x19
    ffff9c6d237c:	d28000c1 	mov	x1, #0x6                   	// #6
    ffff9c6d2380:	f9401be2 	ldr	x2, [sp, #48]
    ffff9c6d2384:	d282ae10 	mov	x16, #0x1570                	// #5488
    ffff9c6d2388:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d238c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d2390:	d63f0200 	blr	x16
    ffff9c6d2394:	aa1303e0 	mov	x0, x19
    ffff9c6d2398:	d28000e1 	mov	x1, #0x7                   	// #7
    ffff9c6d239c:	9100e3e2 	add	x2, sp, #0x38
    ffff9c6d23a0:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d23a4:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d23a8:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d23ac:	d63f0200 	blr	x16
    ffff9c6d23b0:	aa1303e0 	mov	x0, x19
    ffff9c6d23b4:	d2800121 	mov	x1, #0x9                   	// #9
    ffff9c6d23b8:	910123e2 	add	x2, sp, #0x48
    ffff9c6d23bc:	d283ae90 	mov	x16, #0x1d74                	// #7540
    ffff9c6d23c0:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d23c4:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d23c8:	d63f0200 	blr	x16
    ffff9c6d23cc:	d2800289 	mov	x9, #0x14                  	// #20
    ffff9c6d23d0:	f9000289 	str	x9, [x20]
    ffff9c6d23d4:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d23d8:	d2827e10 	mov	x16, #0x13f0                	// #5104
    ffff9c6d23dc:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d23e0:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d23e4:	d63f0200 	blr	x16
    ffff9c6d23e8:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d23ec:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d23f0:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d23f4:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d23f8:	d2800020 	mov	x0, #0x1                   	// #1
    ffff9c6d23fc:	d65f03c0 	ret
    ffff9c6d2400:	911fe3e0 	add	x0, sp, #0x7f8
    ffff9c6d2404:	d2828010 	mov	x16, #0x1400                	// #5120
    ffff9c6d2408:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d240c:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d2410:	d63f0200 	blr	x16
    ffff9c6d2414:	913003ff 	add	sp, sp, #0xc00
    ffff9c6d2418:	a8c15bf5 	ldp	x21, x22, [sp], #16
    ffff9c6d241c:	a8c153f3 	ldp	x19, x20, [sp], #16
    ffff9c6d2420:	a8c17bfd 	ldp	x29, x30, [sp], #16
    ffff9c6d2424:	d2800000 	mov	x0, #0x0                   	// #0
    ffff9c6d2428:	d65f03c0 	ret
    ffff9c6d242c:	aa1303e0 	mov	x0, x19
    ffff9c6d2430:	d2800001 	mov	x1, #0x0                   	// #0
    ffff9c6d2434:	d28fda02 	mov	x2, #0x7ed0                	// #32464
    ffff9c6d2438:	f2ba77a2 	movk	x2, #0xd3bd, lsl #16
    ffff9c6d243c:	f2d55542 	movk	x2, #0xaaaa, lsl #32
    ffff9c6d2440:	d282b803 	mov	x3, #0x15c0                	// #5568
    ffff9c6d2444:	f2ba79e3 	movk	x3, #0xd3cf, lsl #16
    ffff9c6d2448:	f2d55543 	movk	x3, #0xaaaa, lsl #32
    ffff9c6d244c:	d285dd04 	mov	x4, #0x2ee8                	// #12008
    ffff9c6d2450:	f2ba7784 	movk	x4, #0xd3bc, lsl #16
    ffff9c6d2454:	f2d55544 	movk	x4, #0xaaaa, lsl #32
    ffff9c6d2458:	d28cc810 	mov	x16, #0x6640                	// #26176
    ffff9c6d245c:	f2ba22d0 	movk	x16, #0xd116, lsl #16
    ffff9c6d2460:	f2d55550 	movk	x16, #0xaaaa, lsl #32
    ffff9c6d2464:	d63f0200 	blr	x16
    ffff9c6d2468:	f100001f 	cmp	x0, #0x0
    ffff9c6d246c:	54fffca0 	b.eq	0xffff9c6d2400  // b.none
    ffff9c6d2470:	17ffff45 	b	0xffff9c6d2184
