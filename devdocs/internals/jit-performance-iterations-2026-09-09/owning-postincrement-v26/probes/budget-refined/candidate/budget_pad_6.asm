Dump of assembler code from 0xfffff7fb2000 to 0xfffff7fb4000:
   0x0000fffff7fb2000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fb2004:	910003fd	mov	x29, sp
   0x0000fffff7fb2008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fb200c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fb2010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fb2014:	aa0003f3	mov	x19, x0
   0x0000fffff7fb2018:	aa0103f4	mov	x20, x1
   0x0000fffff7fb201c:	aa0203f5	mov	x21, x2
   0x0000fffff7fb2020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fb2024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fb2028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fb202c:	f90003e9	str	x9, [sp]
   0x0000fffff7fb2030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fb2034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fb2038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fb203c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fb2040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2044:	d63f0200	blr	x16
   0x0000fffff7fb2048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fb204c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fb2050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fb2054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fb2058:	14000001	b	0xfffff7fb205c
   0x0000fffff7fb205c:	14000001	b	0xfffff7fb2060
   0x0000fffff7fb2060:	14000001	b	0xfffff7fb2064
   0x0000fffff7fb2064:	14000001	b	0xfffff7fb2068
   0x0000fffff7fb2068:	14000001	b	0xfffff7fb206c
   0x0000fffff7fb206c:	14000001	b	0xfffff7fb2070
   0x0000fffff7fb2070:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb2074:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb2078:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb207c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb2080:	36d80211	tbz	w17, #27, 0xfffff7fb20c0
   0x0000fffff7fb2084:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2088:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb208c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2090:	540001e1	b.ne	0xfffff7fb20cc  // b.any
   0x0000fffff7fb2094:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb2098:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb209c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb20a0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb20a4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb20a8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb20ac:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb20b0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb20b4:	540000c9	b.ls	0xfffff7fb20cc  // b.plast
   0x0000fffff7fb20b8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb20bc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb20c0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb20c4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb20c8:	1400000e	b	0xfffff7fb2100
   0x0000fffff7fb20cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb20d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb20d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb20d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb20dc:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb20e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb20e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb20e8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb20ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb20f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb20f4:	d63f0200	blr	x16
   0x0000fffff7fb20f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb20fc:	5400ef60	b.eq	0xfffff7fb3ee8  // b.none
   0x0000fffff7fb2100:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb2104:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb2108:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb210c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fb2110:	36d80211	tbz	w17, #27, 0xfffff7fb2150
   0x0000fffff7fb2114:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2118:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb211c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2120:	540001e1	b.ne	0xfffff7fb215c  // b.any
   0x0000fffff7fb2124:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fb2128:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb212c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2130:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2134:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2138:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb213c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2140:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2144:	540000c9	b.ls	0xfffff7fb215c  // b.plast
   0x0000fffff7fb2148:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb214c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2150:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fb2154:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb2158:	1400000e	b	0xfffff7fb2190
   0x0000fffff7fb215c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2160:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2164:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2168:	aa1503e2	mov	x2, x21
   0x0000fffff7fb216c:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb2170:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2174:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2178:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb217c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2180:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2184:	d63f0200	blr	x16
   0x0000fffff7fb2188:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb218c:	5400eb20	b.eq	0xfffff7fb3ef0  // b.none
   0x0000fffff7fb2190:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb2194:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2198:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb219c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb21a0:	54000421	b.ne	0xfffff7fb2224  // b.any
   0x0000fffff7fb21a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb21a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb21ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb21b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb21b4:	54000381	b.ne	0xfffff7fb2224  // b.any
   0x0000fffff7fb21b8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fb21bc:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fb21c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb21c4:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fb21c8:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fb21cc:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fb21d0:	91000580	add	x0, x12, #0x1
   0x0000fffff7fb21d4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb21d8:	36d80211	tbz	w17, #27, 0xfffff7fb2218
   0x0000fffff7fb21dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb21e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb21e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb21e8:	540001e1	b.ne	0xfffff7fb2224  // b.any
   0x0000fffff7fb21ec:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb21f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb21f4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb21f8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb21fc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2200:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2204:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2208:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb220c:	540000c9	b.ls	0xfffff7fb2224  // b.plast
   0x0000fffff7fb2210:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2214:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2218:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fb221c:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fb2220:	1400000e	b	0xfffff7fb2258
   0x0000fffff7fb2224:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2228:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb222c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2230:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2234:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb2238:	aa1403e4	mov	x4, x20
   0x0000fffff7fb223c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2240:	d2909810	mov	x16, #0x84c0                	// #33984
   0x0000fffff7fb2244:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb224c:	d63f0200	blr	x16
   0x0000fffff7fb2250:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2254:	5400e520	b.eq	0xfffff7fb3ef8  // b.none
   0x0000fffff7fb2258:	f100041f	cmp	x0, #0x1
   0x0000fffff7fb225c:	5400e100	b.eq	0xfffff7fb3e7c  // b.none
   0x0000fffff7fb2260:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb2264:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb2268:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fb226c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb2270:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb2274:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fb2278:	36d801d1	tbz	w17, #27, 0xfffff7fb22b0
   0x0000fffff7fb227c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2280:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2284:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2288:	54000281	b.ne	0xfffff7fb22d8  // b.any
   0x0000fffff7fb228c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb2290:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2294:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2298:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb229c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb22a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb22a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb22a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb22ac:	54000169	b.ls	0xfffff7fb22d8  // b.plast
   0x0000fffff7fb22b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb22b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb22b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb22bc:	36d80091	tbz	w17, #27, 0xfffff7fb22cc
   0x0000fffff7fb22c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb22c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb22c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb22cc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb22d0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb22d4:	1400000e	b	0xfffff7fb230c
   0x0000fffff7fb22d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb22dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb22e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb22e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb22e8:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb22ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fb22f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb22f4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb22f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb22fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2300:	d63f0200	blr	x16
   0x0000fffff7fb2304:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2308:	5400dfc0	b.eq	0xfffff7fb3f00  // b.none
   0x0000fffff7fb230c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2310:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2314:	540003a0	b.eq	0xfffff7fb2388  // b.none
   0x0000fffff7fb2318:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fb231c:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fb2320:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2324:	36d801d1	tbz	w17, #27, 0xfffff7fb235c
   0x0000fffff7fb2328:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb232c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2330:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2334:	540002a1	b.ne	0xfffff7fb2388  // b.any
   0x0000fffff7fb2338:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb233c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2340:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2344:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2348:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb234c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2350:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2354:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2358:	54000189	b.ls	0xfffff7fb2388  // b.plast
   0x0000fffff7fb235c:	36d8008d	tbz	w13, #27, 0xfffff7fb236c
   0x0000fffff7fb2360:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2364:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2368:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb236c:	36d80091	tbz	w17, #27, 0xfffff7fb237c
   0x0000fffff7fb2370:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2374:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2378:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb237c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2380:	b900016d	str	w13, [x11]
   0x0000fffff7fb2384:	1400000e	b	0xfffff7fb23bc
   0x0000fffff7fb2388:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb238c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2390:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2394:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2398:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb239c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb23a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb23a4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb23a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb23ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb23b0:	d63f0200	blr	x16
   0x0000fffff7fb23b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb23b8:	5400da80	b.eq	0xfffff7fb3f08  // b.none
   0x0000fffff7fb23bc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb23c0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb23c4:	540004a0	b.eq	0xfffff7fb2458  // b.none
   0x0000fffff7fb23c8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb23cc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb23d0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb23d4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb23d8:	54000400	b.eq	0xfffff7fb2458  // b.none
   0x0000fffff7fb23dc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb23e0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb23e4:	36d801d1	tbz	w17, #27, 0xfffff7fb241c
   0x0000fffff7fb23e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb23ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb23f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb23f4:	54000321	b.ne	0xfffff7fb2458  // b.any
   0x0000fffff7fb23f8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb23fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2400:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2404:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2408:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb240c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2410:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2414:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2418:	54000209	b.ls	0xfffff7fb2458  // b.plast
   0x0000fffff7fb241c:	36d8008d	tbz	w13, #27, 0xfffff7fb242c
   0x0000fffff7fb2420:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2424:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2428:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb242c:	36d80091	tbz	w17, #27, 0xfffff7fb243c
   0x0000fffff7fb2430:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2434:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2438:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb243c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb2440:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb2444:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2448:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb244c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb2450:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb2454:	1400000e	b	0xfffff7fb248c
   0x0000fffff7fb2458:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb245c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2460:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2464:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2468:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb246c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2470:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2474:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2478:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb247c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2480:	d63f0200	blr	x16
   0x0000fffff7fb2484:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2488:	5400d440	b.eq	0xfffff7fb3f10  // b.none
   0x0000fffff7fb248c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2490:	37d806a9	tbnz	w9, #27, 0xfffff7fb2564
   0x0000fffff7fb2494:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2498:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb249c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb24a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb24a4:	540001c1	b.ne	0xfffff7fb24dc  // b.any
   0x0000fffff7fb24a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb24ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb24b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb24b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb24b8:	54000121	b.ne	0xfffff7fb24dc  // b.any
   0x0000fffff7fb24bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb24c0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb24c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb24c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb24cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb24d0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb24d4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb24d8:	14000030	b	0xfffff7fb2598
   0x0000fffff7fb24dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb24e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb24e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb24e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb24ec:	54000120	b.eq	0xfffff7fb2510  // b.none
   0x0000fffff7fb24f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb24f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb24f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb24fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2500:	54000321	b.ne	0xfffff7fb2564  // b.any
   0x0000fffff7fb2504:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2508:	9e620120	scvtf	d0, x9
   0x0000fffff7fb250c:	14000002	b	0xfffff7fb2514
   0x0000fffff7fb2510:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb2514:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2518:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb251c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2520:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2524:	54000120	b.eq	0xfffff7fb2548  // b.none
   0x0000fffff7fb2528:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb252c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2530:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2534:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2538:	54000161	b.ne	0xfffff7fb2564  // b.any
   0x0000fffff7fb253c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb2540:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2544:	14000002	b	0xfffff7fb254c
   0x0000fffff7fb2548:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb254c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2550:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb2554:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb255c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb2560:	17ffffde	b	0xfffff7fb24d8
   0x0000fffff7fb2564:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2568:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb256c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2570:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2574:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb2578:	aa1403e4	mov	x4, x20
   0x0000fffff7fb257c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2580:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb2584:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2588:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb258c:	d63f0200	blr	x16
   0x0000fffff7fb2590:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2594:	5400cc20	b.eq	0xfffff7fb3f18  // b.none
   0x0000fffff7fb2598:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb259c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb25a0:	540004a0	b.eq	0xfffff7fb2634  // b.none
   0x0000fffff7fb25a4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb25a8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb25ac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb25b0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb25b4:	54000400	b.eq	0xfffff7fb2634  // b.none
   0x0000fffff7fb25b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb25bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb25c0:	36d801d1	tbz	w17, #27, 0xfffff7fb25f8
   0x0000fffff7fb25c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb25c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb25cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb25d0:	54000321	b.ne	0xfffff7fb2634  // b.any
   0x0000fffff7fb25d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb25d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb25dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb25e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb25e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb25e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb25ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb25f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb25f4:	54000209	b.ls	0xfffff7fb2634  // b.plast
   0x0000fffff7fb25f8:	36d8008d	tbz	w13, #27, 0xfffff7fb2608
   0x0000fffff7fb25fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2600:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2604:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2608:	36d80091	tbz	w17, #27, 0xfffff7fb2618
   0x0000fffff7fb260c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2610:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2614:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2618:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb261c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb2620:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2624:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2628:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb262c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb2630:	1400000e	b	0xfffff7fb2668
   0x0000fffff7fb2634:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2638:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb263c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2640:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2644:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb2648:	aa1403e4	mov	x4, x20
   0x0000fffff7fb264c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2650:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2654:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2658:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb265c:	d63f0200	blr	x16
   0x0000fffff7fb2660:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2664:	5400c5e0	b.eq	0xfffff7fb3f20  // b.none
   0x0000fffff7fb2668:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb266c:	37d806a9	tbnz	w9, #27, 0xfffff7fb2740
   0x0000fffff7fb2670:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2674:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2678:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb267c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2680:	540001c1	b.ne	0xfffff7fb26b8  // b.any
   0x0000fffff7fb2684:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2688:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb268c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2690:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2694:	54000121	b.ne	0xfffff7fb26b8  // b.any
   0x0000fffff7fb2698:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb269c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb26a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb26a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb26a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb26ac:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb26b0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb26b4:	14000030	b	0xfffff7fb2774
   0x0000fffff7fb26b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb26bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb26c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb26c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb26c8:	54000120	b.eq	0xfffff7fb26ec  // b.none
   0x0000fffff7fb26cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb26d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb26d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb26d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb26dc:	54000321	b.ne	0xfffff7fb2740  // b.any
   0x0000fffff7fb26e0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb26e4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb26e8:	14000002	b	0xfffff7fb26f0
   0x0000fffff7fb26ec:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb26f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb26f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb26f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb26fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2700:	54000120	b.eq	0xfffff7fb2724  // b.none
   0x0000fffff7fb2704:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2708:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb270c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2710:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2714:	54000161	b.ne	0xfffff7fb2740  // b.any
   0x0000fffff7fb2718:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb271c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2720:	14000002	b	0xfffff7fb2728
   0x0000fffff7fb2724:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb2728:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb272c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb2730:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2738:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb273c:	17ffffde	b	0xfffff7fb26b4
   0x0000fffff7fb2740:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2744:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2748:	aa1303e1	mov	x1, x19
   0x0000fffff7fb274c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2750:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb2754:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2758:	aa1603e5	mov	x5, x22
   0x0000fffff7fb275c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb2760:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2764:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2768:	d63f0200	blr	x16
   0x0000fffff7fb276c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2770:	5400bdc0	b.eq	0xfffff7fb3f28  // b.none
   0x0000fffff7fb2774:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2778:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb277c:	540004a0	b.eq	0xfffff7fb2810  // b.none
   0x0000fffff7fb2780:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2784:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2788:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb278c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2790:	54000400	b.eq	0xfffff7fb2810  // b.none
   0x0000fffff7fb2794:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2798:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb279c:	36d801d1	tbz	w17, #27, 0xfffff7fb27d4
   0x0000fffff7fb27a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb27a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb27a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb27ac:	54000321	b.ne	0xfffff7fb2810  // b.any
   0x0000fffff7fb27b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb27b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb27b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb27bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb27c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb27c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb27c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb27cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb27d0:	54000209	b.ls	0xfffff7fb2810  // b.plast
   0x0000fffff7fb27d4:	36d8008d	tbz	w13, #27, 0xfffff7fb27e4
   0x0000fffff7fb27d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb27dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb27e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb27e4:	36d80091	tbz	w17, #27, 0xfffff7fb27f4
   0x0000fffff7fb27e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb27ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb27f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb27f4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb27f8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb27fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2800:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2804:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb2808:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb280c:	1400000e	b	0xfffff7fb2844
   0x0000fffff7fb2810:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2818:	aa1303e1	mov	x1, x19
   0x0000fffff7fb281c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2820:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb2824:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2828:	aa1603e5	mov	x5, x22
   0x0000fffff7fb282c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2830:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2838:	d63f0200	blr	x16
   0x0000fffff7fb283c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2840:	5400b780	b.eq	0xfffff7fb3f30  // b.none
   0x0000fffff7fb2844:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2848:	37d806a9	tbnz	w9, #27, 0xfffff7fb291c
   0x0000fffff7fb284c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2850:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2854:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2858:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb285c:	540001c1	b.ne	0xfffff7fb2894  // b.any
   0x0000fffff7fb2860:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2864:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2868:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb286c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2870:	54000121	b.ne	0xfffff7fb2894  // b.any
   0x0000fffff7fb2874:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2878:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb287c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2880:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2884:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2888:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb288c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb2890:	14000030	b	0xfffff7fb2950
   0x0000fffff7fb2894:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2898:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb289c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb28a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb28a4:	54000120	b.eq	0xfffff7fb28c8  // b.none
   0x0000fffff7fb28a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb28ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb28b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb28b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb28b8:	54000321	b.ne	0xfffff7fb291c  // b.any
   0x0000fffff7fb28bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb28c0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb28c4:	14000002	b	0xfffff7fb28cc
   0x0000fffff7fb28c8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb28cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb28d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb28d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb28d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb28dc:	54000120	b.eq	0xfffff7fb2900  // b.none
   0x0000fffff7fb28e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb28e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb28e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb28ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb28f0:	54000161	b.ne	0xfffff7fb291c  // b.any
   0x0000fffff7fb28f4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb28f8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb28fc:	14000002	b	0xfffff7fb2904
   0x0000fffff7fb2900:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb2904:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2908:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb290c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2914:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb2918:	17ffffde	b	0xfffff7fb2890
   0x0000fffff7fb291c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2920:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2924:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2928:	aa1503e2	mov	x2, x21
   0x0000fffff7fb292c:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb2930:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2934:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2938:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb293c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2940:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2944:	d63f0200	blr	x16
   0x0000fffff7fb2948:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb294c:	5400af60	b.eq	0xfffff7fb3f38  // b.none
   0x0000fffff7fb2950:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2954:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2958:	540004a0	b.eq	0xfffff7fb29ec  // b.none
   0x0000fffff7fb295c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2960:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2964:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2968:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb296c:	54000400	b.eq	0xfffff7fb29ec  // b.none
   0x0000fffff7fb2970:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2974:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2978:	36d801d1	tbz	w17, #27, 0xfffff7fb29b0
   0x0000fffff7fb297c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2980:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2984:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2988:	54000321	b.ne	0xfffff7fb29ec  // b.any
   0x0000fffff7fb298c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2990:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2994:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2998:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb299c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb29a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb29a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb29a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb29ac:	54000209	b.ls	0xfffff7fb29ec  // b.plast
   0x0000fffff7fb29b0:	36d8008d	tbz	w13, #27, 0xfffff7fb29c0
   0x0000fffff7fb29b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb29b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb29bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb29c0:	36d80091	tbz	w17, #27, 0xfffff7fb29d0
   0x0000fffff7fb29c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb29c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb29cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb29d0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb29d4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb29d8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb29dc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb29e0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb29e4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb29e8:	1400000e	b	0xfffff7fb2a20
   0x0000fffff7fb29ec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb29f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb29f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb29f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb29fc:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb2a00:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2a04:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2a08:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2a0c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2a10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2a14:	d63f0200	blr	x16
   0x0000fffff7fb2a18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2a1c:	5400a920	b.eq	0xfffff7fb3f40  // b.none
   0x0000fffff7fb2a20:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2a24:	37d806a9	tbnz	w9, #27, 0xfffff7fb2af8
   0x0000fffff7fb2a28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2a2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2a30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2a34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2a38:	540001c1	b.ne	0xfffff7fb2a70  // b.any
   0x0000fffff7fb2a3c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2a40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2a44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2a48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2a4c:	54000121	b.ne	0xfffff7fb2a70  // b.any
   0x0000fffff7fb2a50:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2a54:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb2a58:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2a5c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2a60:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2a64:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb2a68:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb2a6c:	14000030	b	0xfffff7fb2b2c
   0x0000fffff7fb2a70:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2a74:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2a78:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2a7c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2a80:	54000120	b.eq	0xfffff7fb2aa4  // b.none
   0x0000fffff7fb2a84:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2a88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2a8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2a90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2a94:	54000321	b.ne	0xfffff7fb2af8  // b.any
   0x0000fffff7fb2a98:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2a9c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2aa0:	14000002	b	0xfffff7fb2aa8
   0x0000fffff7fb2aa4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb2aa8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2aac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2ab0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ab4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2ab8:	54000120	b.eq	0xfffff7fb2adc  // b.none
   0x0000fffff7fb2abc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2ac0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2ac4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ac8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2acc:	54000161	b.ne	0xfffff7fb2af8  // b.any
   0x0000fffff7fb2ad0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb2ad4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2ad8:	14000002	b	0xfffff7fb2ae0
   0x0000fffff7fb2adc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb2ae0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2ae4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb2ae8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2aec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2af0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb2af4:	17ffffde	b	0xfffff7fb2a6c
   0x0000fffff7fb2af8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2afc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2b00:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2b04:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2b08:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb2b0c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2b10:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2b14:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb2b18:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2b1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2b20:	d63f0200	blr	x16
   0x0000fffff7fb2b24:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2b28:	5400a100	b.eq	0xfffff7fb3f48  // b.none
   0x0000fffff7fb2b2c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2b30:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2b34:	540004a0	b.eq	0xfffff7fb2bc8  // b.none
   0x0000fffff7fb2b38:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2b3c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2b40:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2b44:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2b48:	54000400	b.eq	0xfffff7fb2bc8  // b.none
   0x0000fffff7fb2b4c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2b50:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2b54:	36d801d1	tbz	w17, #27, 0xfffff7fb2b8c
   0x0000fffff7fb2b58:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2b5c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2b60:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2b64:	54000321	b.ne	0xfffff7fb2bc8  // b.any
   0x0000fffff7fb2b68:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2b6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2b70:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2b74:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2b78:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2b7c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2b80:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2b84:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2b88:	54000209	b.ls	0xfffff7fb2bc8  // b.plast
   0x0000fffff7fb2b8c:	36d8008d	tbz	w13, #27, 0xfffff7fb2b9c
   0x0000fffff7fb2b90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2b94:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2b98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2b9c:	36d80091	tbz	w17, #27, 0xfffff7fb2bac
   0x0000fffff7fb2ba0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2ba4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2ba8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2bac:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb2bb0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb2bb4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2bb8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2bbc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb2bc0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb2bc4:	1400000e	b	0xfffff7fb2bfc
   0x0000fffff7fb2bc8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2bcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2bd0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2bd4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2bd8:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb2bdc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2be0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2be4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2be8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2bec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2bf0:	d63f0200	blr	x16
   0x0000fffff7fb2bf4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2bf8:	54009ac0	b.eq	0xfffff7fb3f50  // b.none
   0x0000fffff7fb2bfc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2c00:	37d806a9	tbnz	w9, #27, 0xfffff7fb2cd4
   0x0000fffff7fb2c04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2c08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c14:	540001c1	b.ne	0xfffff7fb2c4c  // b.any
   0x0000fffff7fb2c18:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2c1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c28:	54000121	b.ne	0xfffff7fb2c4c  // b.any
   0x0000fffff7fb2c2c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2c30:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb2c34:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2c38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c40:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb2c44:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb2c48:	14000030	b	0xfffff7fb2d08
   0x0000fffff7fb2c4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2c50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2c54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c5c:	54000120	b.eq	0xfffff7fb2c80  // b.none
   0x0000fffff7fb2c60:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2c64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c70:	54000321	b.ne	0xfffff7fb2cd4  // b.any
   0x0000fffff7fb2c74:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2c78:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2c7c:	14000002	b	0xfffff7fb2c84
   0x0000fffff7fb2c80:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb2c84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2c88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c94:	54000120	b.eq	0xfffff7fb2cb8  // b.none
   0x0000fffff7fb2c98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2c9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2ca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ca4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2ca8:	54000161	b.ne	0xfffff7fb2cd4  // b.any
   0x0000fffff7fb2cac:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb2cb0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2cb4:	14000002	b	0xfffff7fb2cbc
   0x0000fffff7fb2cb8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb2cbc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2cc0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb2cc4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2cc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ccc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb2cd0:	17ffffde	b	0xfffff7fb2c48
   0x0000fffff7fb2cd4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2cd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2cdc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2ce0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2ce4:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb2ce8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2cec:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2cf0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb2cf4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2cf8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2cfc:	d63f0200	blr	x16
   0x0000fffff7fb2d00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2d04:	540092a0	b.eq	0xfffff7fb3f58  // b.none
   0x0000fffff7fb2d08:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2d0c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2d10:	540004a0	b.eq	0xfffff7fb2da4  // b.none
   0x0000fffff7fb2d14:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2d18:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2d1c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2d20:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2d24:	54000400	b.eq	0xfffff7fb2da4  // b.none
   0x0000fffff7fb2d28:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2d2c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2d30:	36d801d1	tbz	w17, #27, 0xfffff7fb2d68
   0x0000fffff7fb2d34:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2d38:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2d3c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2d40:	54000321	b.ne	0xfffff7fb2da4  // b.any
   0x0000fffff7fb2d44:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2d48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2d4c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2d50:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2d54:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2d58:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2d5c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2d60:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2d64:	54000209	b.ls	0xfffff7fb2da4  // b.plast
   0x0000fffff7fb2d68:	36d8008d	tbz	w13, #27, 0xfffff7fb2d78
   0x0000fffff7fb2d6c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2d70:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2d74:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2d78:	36d80091	tbz	w17, #27, 0xfffff7fb2d88
   0x0000fffff7fb2d7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2d80:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2d84:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2d88:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb2d8c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb2d90:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2d94:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2d98:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb2d9c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb2da0:	1400000e	b	0xfffff7fb2dd8
   0x0000fffff7fb2da4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2da8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2dac:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2db0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2db4:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb2db8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2dbc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2dc0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2dc4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2dc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2dcc:	d63f0200	blr	x16
   0x0000fffff7fb2dd0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2dd4:	54008c60	b.eq	0xfffff7fb3f60  // b.none
   0x0000fffff7fb2dd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2ddc:	37d806a9	tbnz	w9, #27, 0xfffff7fb2eb0
   0x0000fffff7fb2de0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2de4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2de8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2dec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2df0:	540001c1	b.ne	0xfffff7fb2e28  // b.any
   0x0000fffff7fb2df4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2df8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2dfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2e00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2e04:	54000121	b.ne	0xfffff7fb2e28  // b.any
   0x0000fffff7fb2e08:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2e0c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb2e10:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2e14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2e18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2e1c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb2e20:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb2e24:	14000030	b	0xfffff7fb2ee4
   0x0000fffff7fb2e28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2e2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2e30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2e34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2e38:	54000120	b.eq	0xfffff7fb2e5c  // b.none
   0x0000fffff7fb2e3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2e40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2e44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2e48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2e4c:	54000321	b.ne	0xfffff7fb2eb0  // b.any
   0x0000fffff7fb2e50:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2e54:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2e58:	14000002	b	0xfffff7fb2e60
   0x0000fffff7fb2e5c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb2e60:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2e64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2e68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2e6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2e70:	54000120	b.eq	0xfffff7fb2e94  // b.none
   0x0000fffff7fb2e74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2e78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2e7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2e80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2e84:	54000161	b.ne	0xfffff7fb2eb0  // b.any
   0x0000fffff7fb2e88:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb2e8c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2e90:	14000002	b	0xfffff7fb2e98
   0x0000fffff7fb2e94:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb2e98:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2e9c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb2ea0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2ea4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ea8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb2eac:	17ffffde	b	0xfffff7fb2e24
   0x0000fffff7fb2eb0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2eb4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2eb8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2ebc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2ec0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb2ec4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2ec8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2ecc:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb2ed0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2ed4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2ed8:	d63f0200	blr	x16
   0x0000fffff7fb2edc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2ee0:	54008440	b.eq	0xfffff7fb3f68  // b.none
   0x0000fffff7fb2ee4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2ee8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2eec:	540004a0	b.eq	0xfffff7fb2f80  // b.none
   0x0000fffff7fb2ef0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2ef4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2ef8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2efc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2f00:	54000400	b.eq	0xfffff7fb2f80  // b.none
   0x0000fffff7fb2f04:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2f08:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2f0c:	36d801d1	tbz	w17, #27, 0xfffff7fb2f44
   0x0000fffff7fb2f10:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2f14:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2f18:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2f1c:	54000321	b.ne	0xfffff7fb2f80  // b.any
   0x0000fffff7fb2f20:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2f24:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2f28:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2f2c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2f30:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2f34:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2f38:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2f3c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2f40:	54000209	b.ls	0xfffff7fb2f80  // b.plast
   0x0000fffff7fb2f44:	36d8008d	tbz	w13, #27, 0xfffff7fb2f54
   0x0000fffff7fb2f48:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2f4c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2f50:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2f54:	36d80091	tbz	w17, #27, 0xfffff7fb2f64
   0x0000fffff7fb2f58:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2f5c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2f60:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2f64:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb2f68:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb2f6c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2f70:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2f74:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb2f78:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb2f7c:	1400000e	b	0xfffff7fb2fb4
   0x0000fffff7fb2f80:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2f84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2f88:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2f8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2f90:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb2f94:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2f98:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2f9c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2fa0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2fa4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2fa8:	d63f0200	blr	x16
   0x0000fffff7fb2fac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2fb0:	54007e00	b.eq	0xfffff7fb3f70  // b.none
   0x0000fffff7fb2fb4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2fb8:	37d806a9	tbnz	w9, #27, 0xfffff7fb308c
   0x0000fffff7fb2fbc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2fc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2fc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2fc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2fcc:	540001c1	b.ne	0xfffff7fb3004  // b.any
   0x0000fffff7fb2fd0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb2fd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2fd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2fdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2fe0:	54000121	b.ne	0xfffff7fb3004  // b.any
   0x0000fffff7fb2fe4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2fe8:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb2fec:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2ff0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2ff4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ff8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb2ffc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3000:	14000030	b	0xfffff7fb30c0
   0x0000fffff7fb3004:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3008:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb300c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3010:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3014:	54000120	b.eq	0xfffff7fb3038  // b.none
   0x0000fffff7fb3018:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb301c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3020:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3024:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3028:	54000321	b.ne	0xfffff7fb308c  // b.any
   0x0000fffff7fb302c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb3030:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3034:	14000002	b	0xfffff7fb303c
   0x0000fffff7fb3038:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb303c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3040:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3044:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3048:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb304c:	54000120	b.eq	0xfffff7fb3070  // b.none
   0x0000fffff7fb3050:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3054:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3058:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb305c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3060:	54000161	b.ne	0xfffff7fb308c  // b.any
   0x0000fffff7fb3064:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb3068:	9e620121	scvtf	d1, x9
   0x0000fffff7fb306c:	14000002	b	0xfffff7fb3074
   0x0000fffff7fb3070:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb3074:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3078:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb307c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3080:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3084:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3088:	17ffffde	b	0xfffff7fb3000
   0x0000fffff7fb308c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3090:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3094:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3098:	aa1503e2	mov	x2, x21
   0x0000fffff7fb309c:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb30a0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb30a4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb30a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb30ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb30b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb30b4:	d63f0200	blr	x16
   0x0000fffff7fb30b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb30bc:	540075e0	b.eq	0xfffff7fb3f78  // b.none
   0x0000fffff7fb30c0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb30c4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb30c8:	540004a0	b.eq	0xfffff7fb315c  // b.none
   0x0000fffff7fb30cc:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb30d0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb30d4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb30d8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb30dc:	54000400	b.eq	0xfffff7fb315c  // b.none
   0x0000fffff7fb30e0:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb30e4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb30e8:	36d801d1	tbz	w17, #27, 0xfffff7fb3120
   0x0000fffff7fb30ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb30f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb30f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb30f8:	54000321	b.ne	0xfffff7fb315c  // b.any
   0x0000fffff7fb30fc:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3100:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3104:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3108:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb310c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3110:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3114:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3118:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb311c:	54000209	b.ls	0xfffff7fb315c  // b.plast
   0x0000fffff7fb3120:	36d8008d	tbz	w13, #27, 0xfffff7fb3130
   0x0000fffff7fb3124:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3128:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb312c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3130:	36d80091	tbz	w17, #27, 0xfffff7fb3140
   0x0000fffff7fb3134:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3138:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb313c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3140:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb3144:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb3148:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb314c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb3150:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb3154:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb3158:	1400000e	b	0xfffff7fb3190
   0x0000fffff7fb315c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb3160:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3164:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3168:	aa1503e2	mov	x2, x21
   0x0000fffff7fb316c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb3170:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3174:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3178:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb317c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3180:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3184:	d63f0200	blr	x16
   0x0000fffff7fb3188:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb318c:	54006fa0	b.eq	0xfffff7fb3f80  // b.none
   0x0000fffff7fb3190:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3194:	37d806a9	tbnz	w9, #27, 0xfffff7fb3268
   0x0000fffff7fb3198:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb319c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb31a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb31a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb31a8:	540001c1	b.ne	0xfffff7fb31e0  // b.any
   0x0000fffff7fb31ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb31b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb31b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb31b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb31bc:	54000121	b.ne	0xfffff7fb31e0  // b.any
   0x0000fffff7fb31c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb31c4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb31c8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb31cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb31d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb31d4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb31d8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb31dc:	14000030	b	0xfffff7fb329c
   0x0000fffff7fb31e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb31e4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb31e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb31ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb31f0:	54000120	b.eq	0xfffff7fb3214  // b.none
   0x0000fffff7fb31f4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb31f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb31fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3200:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3204:	54000321	b.ne	0xfffff7fb3268  // b.any
   0x0000fffff7fb3208:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb320c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3210:	14000002	b	0xfffff7fb3218
   0x0000fffff7fb3214:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb3218:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb321c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3220:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3224:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3228:	54000120	b.eq	0xfffff7fb324c  // b.none
   0x0000fffff7fb322c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3230:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3234:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3238:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb323c:	54000161	b.ne	0xfffff7fb3268  // b.any
   0x0000fffff7fb3240:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb3244:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3248:	14000002	b	0xfffff7fb3250
   0x0000fffff7fb324c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb3250:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3254:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb3258:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb325c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3260:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3264:	17ffffde	b	0xfffff7fb31dc
   0x0000fffff7fb3268:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb326c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3270:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3274:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3278:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb327c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3280:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3284:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb3288:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb328c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3290:	d63f0200	blr	x16
   0x0000fffff7fb3294:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3298:	54006780	b.eq	0xfffff7fb3f88  // b.none
   0x0000fffff7fb329c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb32a0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb32a4:	540004a0	b.eq	0xfffff7fb3338  // b.none
   0x0000fffff7fb32a8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb32ac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb32b0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb32b4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb32b8:	54000400	b.eq	0xfffff7fb3338  // b.none
   0x0000fffff7fb32bc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb32c0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb32c4:	36d801d1	tbz	w17, #27, 0xfffff7fb32fc
   0x0000fffff7fb32c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb32cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb32d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb32d4:	54000321	b.ne	0xfffff7fb3338  // b.any
   0x0000fffff7fb32d8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb32dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb32e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb32e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb32e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb32ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb32f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb32f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb32f8:	54000209	b.ls	0xfffff7fb3338  // b.plast
   0x0000fffff7fb32fc:	36d8008d	tbz	w13, #27, 0xfffff7fb330c
   0x0000fffff7fb3300:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3304:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3308:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb330c:	36d80091	tbz	w17, #27, 0xfffff7fb331c
   0x0000fffff7fb3310:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3314:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3318:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb331c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb3320:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb3324:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3328:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb332c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb3330:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb3334:	1400000e	b	0xfffff7fb336c
   0x0000fffff7fb3338:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb333c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3340:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3344:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3348:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb334c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3350:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3354:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb3358:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb335c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3360:	d63f0200	blr	x16
   0x0000fffff7fb3364:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3368:	54006140	b.eq	0xfffff7fb3f90  // b.none
   0x0000fffff7fb336c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3370:	37d806a9	tbnz	w9, #27, 0xfffff7fb3444
   0x0000fffff7fb3374:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3378:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb337c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3380:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3384:	540001c1	b.ne	0xfffff7fb33bc  // b.any
   0x0000fffff7fb3388:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb338c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3390:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3394:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3398:	54000121	b.ne	0xfffff7fb33bc  // b.any
   0x0000fffff7fb339c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb33a0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb33a4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb33a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb33ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb33b0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb33b4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb33b8:	14000030	b	0xfffff7fb3478
   0x0000fffff7fb33bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb33c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb33c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb33c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb33cc:	54000120	b.eq	0xfffff7fb33f0  // b.none
   0x0000fffff7fb33d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb33d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb33d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb33dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb33e0:	54000321	b.ne	0xfffff7fb3444  // b.any
   0x0000fffff7fb33e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb33e8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb33ec:	14000002	b	0xfffff7fb33f4
   0x0000fffff7fb33f0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb33f4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb33f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb33fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3400:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3404:	54000120	b.eq	0xfffff7fb3428  // b.none
   0x0000fffff7fb3408:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb340c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3410:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3414:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3418:	54000161	b.ne	0xfffff7fb3444  // b.any
   0x0000fffff7fb341c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb3420:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3424:	14000002	b	0xfffff7fb342c
   0x0000fffff7fb3428:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb342c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3430:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb3434:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3438:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb343c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3440:	17ffffde	b	0xfffff7fb33b8
   0x0000fffff7fb3444:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3448:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb344c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3450:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3454:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb3458:	aa1403e4	mov	x4, x20
   0x0000fffff7fb345c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3460:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb3464:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3468:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb346c:	d63f0200	blr	x16
   0x0000fffff7fb3470:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3474:	54005920	b.eq	0xfffff7fb3f98  // b.none
   0x0000fffff7fb3478:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb347c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3480:	540004a0	b.eq	0xfffff7fb3514  // b.none
   0x0000fffff7fb3484:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb3488:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb348c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb3490:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3494:	54000400	b.eq	0xfffff7fb3514  // b.none
   0x0000fffff7fb3498:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb349c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb34a0:	36d801d1	tbz	w17, #27, 0xfffff7fb34d8
   0x0000fffff7fb34a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb34a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb34ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb34b0:	54000321	b.ne	0xfffff7fb3514  // b.any
   0x0000fffff7fb34b4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb34b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb34bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb34c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb34c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb34c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb34cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb34d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb34d4:	54000209	b.ls	0xfffff7fb3514  // b.plast
   0x0000fffff7fb34d8:	36d8008d	tbz	w13, #27, 0xfffff7fb34e8
   0x0000fffff7fb34dc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb34e0:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb34e4:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb34e8:	36d80091	tbz	w17, #27, 0xfffff7fb34f8
   0x0000fffff7fb34ec:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb34f0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb34f4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb34f8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb34fc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb3500:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3504:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb3508:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb350c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb3510:	1400000e	b	0xfffff7fb3548
   0x0000fffff7fb3514:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb3518:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb351c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3520:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3524:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb3528:	aa1403e4	mov	x4, x20
   0x0000fffff7fb352c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3530:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb3534:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3538:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb353c:	d63f0200	blr	x16
   0x0000fffff7fb3540:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3544:	540052e0	b.eq	0xfffff7fb3fa0  // b.none
   0x0000fffff7fb3548:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb354c:	37d806a9	tbnz	w9, #27, 0xfffff7fb3620
   0x0000fffff7fb3550:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3554:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb355c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3560:	540001c1	b.ne	0xfffff7fb3598  // b.any
   0x0000fffff7fb3564:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3568:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb356c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3570:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3574:	54000121	b.ne	0xfffff7fb3598  // b.any
   0x0000fffff7fb3578:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb357c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb3580:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3584:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3588:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb358c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb3590:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3594:	14000030	b	0xfffff7fb3654
   0x0000fffff7fb3598:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb359c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb35a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb35a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb35a8:	54000120	b.eq	0xfffff7fb35cc  // b.none
   0x0000fffff7fb35ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb35b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb35b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb35b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb35bc:	54000321	b.ne	0xfffff7fb3620  // b.any
   0x0000fffff7fb35c0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb35c4:	9e620120	scvtf	d0, x9
   0x0000fffff7fb35c8:	14000002	b	0xfffff7fb35d0
   0x0000fffff7fb35cc:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb35d0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb35d4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb35d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb35dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb35e0:	54000120	b.eq	0xfffff7fb3604  // b.none
   0x0000fffff7fb35e4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb35e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb35ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb35f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb35f4:	54000161	b.ne	0xfffff7fb3620  // b.any
   0x0000fffff7fb35f8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb35fc:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3600:	14000002	b	0xfffff7fb3608
   0x0000fffff7fb3604:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb3608:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb360c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb3610:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3614:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3618:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb361c:	17ffffde	b	0xfffff7fb3594
   0x0000fffff7fb3620:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3624:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3628:	aa1303e1	mov	x1, x19
   0x0000fffff7fb362c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3630:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb3634:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3638:	aa1603e5	mov	x5, x22
   0x0000fffff7fb363c:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb3640:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3644:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3648:	d63f0200	blr	x16
   0x0000fffff7fb364c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3650:	54004ac0	b.eq	0xfffff7fb3fa8  // b.none
   0x0000fffff7fb3654:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3658:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb365c:	540004a0	b.eq	0xfffff7fb36f0  // b.none
   0x0000fffff7fb3660:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb3664:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3668:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb366c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3670:	54000400	b.eq	0xfffff7fb36f0  // b.none
   0x0000fffff7fb3674:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3678:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb367c:	36d801d1	tbz	w17, #27, 0xfffff7fb36b4
   0x0000fffff7fb3680:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3684:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3688:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb368c:	54000321	b.ne	0xfffff7fb36f0  // b.any
   0x0000fffff7fb3690:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3694:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3698:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb369c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb36a0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb36a4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb36a8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb36ac:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb36b0:	54000209	b.ls	0xfffff7fb36f0  // b.plast
   0x0000fffff7fb36b4:	36d8008d	tbz	w13, #27, 0xfffff7fb36c4
   0x0000fffff7fb36b8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb36bc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb36c0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb36c4:	36d80091	tbz	w17, #27, 0xfffff7fb36d4
   0x0000fffff7fb36c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb36cc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb36d0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb36d4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb36d8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb36dc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb36e0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb36e4:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb36e8:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb36ec:	1400000e	b	0xfffff7fb3724
   0x0000fffff7fb36f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb36f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb36f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb36fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3700:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb3704:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3708:	aa1603e5	mov	x5, x22
   0x0000fffff7fb370c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb3710:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3714:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3718:	d63f0200	blr	x16
   0x0000fffff7fb371c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3720:	54004480	b.eq	0xfffff7fb3fb0  // b.none
   0x0000fffff7fb3724:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3728:	37d806a9	tbnz	w9, #27, 0xfffff7fb37fc
   0x0000fffff7fb372c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3730:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3738:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb373c:	540001c1	b.ne	0xfffff7fb3774  // b.any
   0x0000fffff7fb3740:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3744:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb374c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3750:	54000121	b.ne	0xfffff7fb3774  // b.any
   0x0000fffff7fb3754:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb3758:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb375c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3760:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3764:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3768:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb376c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3770:	14000030	b	0xfffff7fb3830
   0x0000fffff7fb3774:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3778:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb377c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3780:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3784:	54000120	b.eq	0xfffff7fb37a8  // b.none
   0x0000fffff7fb3788:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb378c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3790:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3794:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3798:	54000321	b.ne	0xfffff7fb37fc  // b.any
   0x0000fffff7fb379c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb37a0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb37a4:	14000002	b	0xfffff7fb37ac
   0x0000fffff7fb37a8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb37ac:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb37b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb37b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb37b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb37bc:	54000120	b.eq	0xfffff7fb37e0  // b.none
   0x0000fffff7fb37c0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb37c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb37c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb37cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb37d0:	54000161	b.ne	0xfffff7fb37fc  // b.any
   0x0000fffff7fb37d4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb37d8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb37dc:	14000002	b	0xfffff7fb37e4
   0x0000fffff7fb37e0:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb37e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb37e8:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb37ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb37f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb37f4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb37f8:	17ffffde	b	0xfffff7fb3770
   0x0000fffff7fb37fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3800:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3804:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3808:	aa1503e2	mov	x2, x21
   0x0000fffff7fb380c:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb3810:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3814:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3818:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb381c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3820:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3824:	d63f0200	blr	x16
   0x0000fffff7fb3828:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb382c:	54003c60	b.eq	0xfffff7fb3fb8  // b.none
   0x0000fffff7fb3830:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3834:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3838:	540004a0	b.eq	0xfffff7fb38cc  // b.none
   0x0000fffff7fb383c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb3840:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3844:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb3848:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb384c:	54000400	b.eq	0xfffff7fb38cc  // b.none
   0x0000fffff7fb3850:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3854:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb3858:	36d801d1	tbz	w17, #27, 0xfffff7fb3890
   0x0000fffff7fb385c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3860:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3864:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3868:	54000321	b.ne	0xfffff7fb38cc  // b.any
   0x0000fffff7fb386c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3870:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3874:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3878:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb387c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3880:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3884:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3888:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb388c:	54000209	b.ls	0xfffff7fb38cc  // b.plast
   0x0000fffff7fb3890:	36d8008d	tbz	w13, #27, 0xfffff7fb38a0
   0x0000fffff7fb3894:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3898:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb389c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb38a0:	36d80091	tbz	w17, #27, 0xfffff7fb38b0
   0x0000fffff7fb38a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb38a8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb38ac:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb38b0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb38b4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb38b8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb38bc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb38c0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb38c4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb38c8:	1400000e	b	0xfffff7fb3900
   0x0000fffff7fb38cc:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb38d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb38d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb38d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb38dc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb38e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb38e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb38e8:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb38ec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb38f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb38f4:	d63f0200	blr	x16
   0x0000fffff7fb38f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb38fc:	54003620	b.eq	0xfffff7fb3fc0  // b.none
   0x0000fffff7fb3900:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3904:	37d806a9	tbnz	w9, #27, 0xfffff7fb39d8
   0x0000fffff7fb3908:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb390c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3910:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3914:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3918:	540001c1	b.ne	0xfffff7fb3950  // b.any
   0x0000fffff7fb391c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3920:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3928:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb392c:	54000121	b.ne	0xfffff7fb3950  // b.any
   0x0000fffff7fb3930:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb3934:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb3938:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb393c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3940:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3944:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb3948:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb394c:	14000030	b	0xfffff7fb3a0c
   0x0000fffff7fb3950:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3954:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb395c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3960:	54000120	b.eq	0xfffff7fb3984  // b.none
   0x0000fffff7fb3964:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb396c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3970:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3974:	54000321	b.ne	0xfffff7fb39d8  // b.any
   0x0000fffff7fb3978:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb397c:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3980:	14000002	b	0xfffff7fb3988
   0x0000fffff7fb3984:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb3988:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb398c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3990:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3994:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3998:	54000120	b.eq	0xfffff7fb39bc  // b.none
   0x0000fffff7fb399c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb39a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb39a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb39a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb39ac:	54000161	b.ne	0xfffff7fb39d8  // b.any
   0x0000fffff7fb39b0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb39b4:	9e620121	scvtf	d1, x9
   0x0000fffff7fb39b8:	14000002	b	0xfffff7fb39c0
   0x0000fffff7fb39bc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb39c0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb39c4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb39c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb39cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb39d0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb39d4:	17ffffde	b	0xfffff7fb394c
   0x0000fffff7fb39d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb39dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb39e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb39e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb39e8:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb39ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fb39f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb39f4:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb39f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb39fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3a00:	d63f0200	blr	x16
   0x0000fffff7fb3a04:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3a08:	54002e00	b.eq	0xfffff7fb3fc8  // b.none
   0x0000fffff7fb3a0c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3a10:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3a14:	540004a0	b.eq	0xfffff7fb3aa8  // b.none
   0x0000fffff7fb3a18:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb3a1c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3a20:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb3a24:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3a28:	54000400	b.eq	0xfffff7fb3aa8  // b.none
   0x0000fffff7fb3a2c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3a30:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb3a34:	36d801d1	tbz	w17, #27, 0xfffff7fb3a6c
   0x0000fffff7fb3a38:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3a3c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3a40:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3a44:	54000321	b.ne	0xfffff7fb3aa8  // b.any
   0x0000fffff7fb3a48:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3a4c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3a50:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3a54:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3a58:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3a5c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3a60:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3a64:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3a68:	54000209	b.ls	0xfffff7fb3aa8  // b.plast
   0x0000fffff7fb3a6c:	36d8008d	tbz	w13, #27, 0xfffff7fb3a7c
   0x0000fffff7fb3a70:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3a74:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3a78:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3a7c:	36d80091	tbz	w17, #27, 0xfffff7fb3a8c
   0x0000fffff7fb3a80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3a84:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3a88:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3a8c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb3a90:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb3a94:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3a98:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb3a9c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb3aa0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb3aa4:	1400000e	b	0xfffff7fb3adc
   0x0000fffff7fb3aa8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb3aac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3ab0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3ab4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3ab8:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb3abc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3ac0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3ac4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb3ac8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3acc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3ad0:	d63f0200	blr	x16
   0x0000fffff7fb3ad4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3ad8:	540027c0	b.eq	0xfffff7fb3fd0  // b.none
   0x0000fffff7fb3adc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3ae0:	37d806a9	tbnz	w9, #27, 0xfffff7fb3bb4
   0x0000fffff7fb3ae4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3ae8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3aec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3af0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3af4:	540001c1	b.ne	0xfffff7fb3b2c  // b.any
   0x0000fffff7fb3af8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3afc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3b00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3b04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3b08:	54000121	b.ne	0xfffff7fb3b2c  // b.any
   0x0000fffff7fb3b0c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb3b10:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb3b14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3b18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3b1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3b20:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb3b24:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3b28:	14000030	b	0xfffff7fb3be8
   0x0000fffff7fb3b2c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3b30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3b34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3b38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3b3c:	54000120	b.eq	0xfffff7fb3b60  // b.none
   0x0000fffff7fb3b40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3b44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3b48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3b4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3b50:	54000321	b.ne	0xfffff7fb3bb4  // b.any
   0x0000fffff7fb3b54:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb3b58:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3b5c:	14000002	b	0xfffff7fb3b64
   0x0000fffff7fb3b60:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb3b64:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3b68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3b6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3b70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3b74:	54000120	b.eq	0xfffff7fb3b98  // b.none
   0x0000fffff7fb3b78:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3b7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3b80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3b84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3b88:	54000161	b.ne	0xfffff7fb3bb4  // b.any
   0x0000fffff7fb3b8c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb3b90:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3b94:	14000002	b	0xfffff7fb3b9c
   0x0000fffff7fb3b98:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb3b9c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3ba0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb3ba4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3ba8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3bac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3bb0:	17ffffde	b	0xfffff7fb3b28
   0x0000fffff7fb3bb4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3bb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3bbc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3bc0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3bc4:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb3bc8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3bcc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3bd0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb3bd4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3bd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3bdc:	d63f0200	blr	x16
   0x0000fffff7fb3be0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3be4:	54001fa0	b.eq	0xfffff7fb3fd8  // b.none
   0x0000fffff7fb3be8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3bec:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3bf0:	540004a0	b.eq	0xfffff7fb3c84  // b.none
   0x0000fffff7fb3bf4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb3bf8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3bfc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb3c00:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3c04:	54000400	b.eq	0xfffff7fb3c84  // b.none
   0x0000fffff7fb3c08:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3c0c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb3c10:	36d801d1	tbz	w17, #27, 0xfffff7fb3c48
   0x0000fffff7fb3c14:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3c18:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3c1c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3c20:	54000321	b.ne	0xfffff7fb3c84  // b.any
   0x0000fffff7fb3c24:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3c28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3c2c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3c30:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3c34:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3c38:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3c3c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3c40:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3c44:	54000209	b.ls	0xfffff7fb3c84  // b.plast
   0x0000fffff7fb3c48:	36d8008d	tbz	w13, #27, 0xfffff7fb3c58
   0x0000fffff7fb3c4c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3c50:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3c54:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3c58:	36d80091	tbz	w17, #27, 0xfffff7fb3c68
   0x0000fffff7fb3c5c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3c60:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3c64:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3c68:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fb3c6c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb3c70:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3c74:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb3c78:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb3c7c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb3c80:	1400000e	b	0xfffff7fb3cb8
   0x0000fffff7fb3c84:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb3c88:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3c8c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3c90:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3c94:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb3c98:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3c9c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3ca0:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb3ca4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3ca8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3cac:	d63f0200	blr	x16
   0x0000fffff7fb3cb0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3cb4:	54001960	b.eq	0xfffff7fb3fe0  // b.none
   0x0000fffff7fb3cb8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3cbc:	37d806a9	tbnz	w9, #27, 0xfffff7fb3d90
   0x0000fffff7fb3cc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3cc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3cc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3ccc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3cd0:	540001c1	b.ne	0xfffff7fb3d08  // b.any
   0x0000fffff7fb3cd4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3cd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3cdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3ce0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3ce4:	54000121	b.ne	0xfffff7fb3d08  // b.any
   0x0000fffff7fb3ce8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb3cec:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fb3cf0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3cf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3cf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3cfc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fb3d00:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3d04:	14000030	b	0xfffff7fb3dc4
   0x0000fffff7fb3d08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3d0c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3d10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3d14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3d18:	54000120	b.eq	0xfffff7fb3d3c  // b.none
   0x0000fffff7fb3d1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3d20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3d24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3d28:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3d2c:	54000321	b.ne	0xfffff7fb3d90  // b.any
   0x0000fffff7fb3d30:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb3d34:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3d38:	14000002	b	0xfffff7fb3d40
   0x0000fffff7fb3d3c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fb3d40:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3d44:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3d48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3d4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3d50:	54000120	b.eq	0xfffff7fb3d74  // b.none
   0x0000fffff7fb3d54:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fb3d58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3d5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3d60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3d64:	54000161	b.ne	0xfffff7fb3d90  // b.any
   0x0000fffff7fb3d68:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fb3d6c:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3d70:	14000002	b	0xfffff7fb3d78
   0x0000fffff7fb3d74:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fb3d78:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3d7c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fb3d80:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3d84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3d88:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fb3d8c:	17ffffde	b	0xfffff7fb3d04
   0x0000fffff7fb3d90:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3d94:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3d98:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3d9c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3da0:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb3da4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3da8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3dac:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb3db0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3db4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3db8:	d63f0200	blr	x16
   0x0000fffff7fb3dbc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3dc0:	54001140	b.eq	0xfffff7fb3fe8  // b.none
   0x0000fffff7fb3dc4:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fb3dc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3dcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3dd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3dd4:	54000381	b.ne	0xfffff7fb3e44  // b.any
   0x0000fffff7fb3dd8:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fb3ddc:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fb3de0:	8b0a018b	add	x11, x12, x10
   0x0000fffff7fb3de4:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fb3de8:	36d80211	tbz	w17, #27, 0xfffff7fb3e28
   0x0000fffff7fb3dec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3df0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3df4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3df8:	54000261	b.ne	0xfffff7fb3e44  // b.any
   0x0000fffff7fb3dfc:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fb3e00:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3e04:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3e08:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3e0c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3e10:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3e14:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3e18:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3e1c:	54000149	b.ls	0xfffff7fb3e44  // b.plast
   0x0000fffff7fb3e20:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3e24:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3e28:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb3e2c:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb3e30:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fb3e34:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fb3e38:	f9002e6b	str	x11, [x19, #88]
   0x0000fffff7fb3e3c:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fb3e40:	1400000e	b	0xfffff7fb3e78
   0x0000fffff7fb3e44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3e48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3e4c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3e50:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3e54:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb3e58:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3e5c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3e60:	d2916810	mov	x16, #0x8b40                	// #35648
   0x0000fffff7fb3e64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3e68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3e6c:	d63f0200	blr	x16
   0x0000fffff7fb3e70:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3e74:	54000be0	b.eq	0xfffff7fb3ff0  // b.none
   0x0000fffff7fb3e78:	17fff8c6	b	0xfffff7fb2190
   0x0000fffff7fb3e7c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3e80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3e84:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3e88:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3e8c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fb3e90:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3e94:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3e98:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fb3e9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3ea0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3ea4:	d63f0200	blr	x16
   0x0000fffff7fb3ea8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb3eac:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb3eb0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb3eb4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb3eb8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb3ebc:	d65f03c0	ret
   0x0000fffff7fb3ec0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3ec4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3ec8:	b900028a	str	w10, [x20]
   0x0000fffff7fb3ecc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb3ed0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb3ed4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb3ed8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb3edc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb3ee0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb3ee4:	d65f03c0	ret
   0x0000fffff7fb3ee8:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb3eec:	17fffff5	b	0xfffff7fb3ec0
   0x0000fffff7fb3ef0:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb3ef4:	17fffff3	b	0xfffff7fb3ec0
   0x0000fffff7fb3ef8:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb3efc:	17fffff1	b	0xfffff7fb3ec0
   0x0000fffff7fb3f00:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb3f04:	17ffffef	b	0xfffff7fb3ec0
   0x0000fffff7fb3f08:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb3f0c:	17ffffed	b	0xfffff7fb3ec0
   0x0000fffff7fb3f10:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb3f14:	17ffffeb	b	0xfffff7fb3ec0
   0x0000fffff7fb3f18:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb3f1c:	17ffffe9	b	0xfffff7fb3ec0
   0x0000fffff7fb3f20:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb3f24:	17ffffe7	b	0xfffff7fb3ec0
   0x0000fffff7fb3f28:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb3f2c:	17ffffe5	b	0xfffff7fb3ec0
   0x0000fffff7fb3f30:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb3f34:	17ffffe3	b	0xfffff7fb3ec0
   0x0000fffff7fb3f38:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb3f3c:	17ffffe1	b	0xfffff7fb3ec0
   0x0000fffff7fb3f40:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb3f44:	17ffffdf	b	0xfffff7fb3ec0
   0x0000fffff7fb3f48:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb3f4c:	17ffffdd	b	0xfffff7fb3ec0
   0x0000fffff7fb3f50:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb3f54:	17ffffdb	b	0xfffff7fb3ec0
   0x0000fffff7fb3f58:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb3f5c:	17ffffd9	b	0xfffff7fb3ec0
   0x0000fffff7fb3f60:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb3f64:	17ffffd7	b	0xfffff7fb3ec0
   0x0000fffff7fb3f68:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb3f6c:	17ffffd5	b	0xfffff7fb3ec0
   0x0000fffff7fb3f70:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb3f74:	17ffffd3	b	0xfffff7fb3ec0
   0x0000fffff7fb3f78:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb3f7c:	17ffffd1	b	0xfffff7fb3ec0
   0x0000fffff7fb3f80:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb3f84:	17ffffcf	b	0xfffff7fb3ec0
   0x0000fffff7fb3f88:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb3f8c:	17ffffcd	b	0xfffff7fb3ec0
   0x0000fffff7fb3f90:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb3f94:	17ffffcb	b	0xfffff7fb3ec0
   0x0000fffff7fb3f98:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb3f9c:	17ffffc9	b	0xfffff7fb3ec0
   0x0000fffff7fb3fa0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb3fa4:	17ffffc7	b	0xfffff7fb3ec0
   0x0000fffff7fb3fa8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb3fac:	17ffffc5	b	0xfffff7fb3ec0
   0x0000fffff7fb3fb0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb3fb4:	17ffffc3	b	0xfffff7fb3ec0
   0x0000fffff7fb3fb8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb3fbc:	17ffffc1	b	0xfffff7fb3ec0
   0x0000fffff7fb3fc0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb3fc4:	17ffffbf	b	0xfffff7fb3ec0
   0x0000fffff7fb3fc8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb3fcc:	17ffffbd	b	0xfffff7fb3ec0
   0x0000fffff7fb3fd0:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb3fd4:	17ffffbb	b	0xfffff7fb3ec0
   0x0000fffff7fb3fd8:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb3fdc:	17ffffb9	b	0xfffff7fb3ec0
   0x0000fffff7fb3fe0:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb3fe4:	17ffffb7	b	0xfffff7fb3ec0
   0x0000fffff7fb3fe8:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb3fec:	17ffffb5	b	0xfffff7fb3ec0
   0x0000fffff7fb3ff0:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fb3ff4:	17ffffb3	b	0xfffff7fb3ec0
   0x0000fffff7fb3ff8:	00000000	udf	#0
   0x0000fffff7fb3ffc:	00000000	udf	#0
End of assembler dump.
