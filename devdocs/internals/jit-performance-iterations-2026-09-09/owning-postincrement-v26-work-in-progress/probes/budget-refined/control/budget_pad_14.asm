Dump of assembler code from 0xfffff7fa2000 to 0xfffff7fa4000:
   0x0000fffff7fa2000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7fa2004:	910003fd	mov	x29, sp
   0x0000fffff7fa2008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7fa200c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7fa2010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7fa2014:	aa0003f3	mov	x19, x0
   0x0000fffff7fa2018:	aa0103f4	mov	x20, x1
   0x0000fffff7fa201c:	aa0203f5	mov	x21, x2
   0x0000fffff7fa2020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7fa2024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7fa2028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7fa202c:	f90003e9	str	x9, [sp]
   0x0000fffff7fa2030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7fa2034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7fa2038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7fa203c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa2040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2044:	d63f0200	blr	x16
   0x0000fffff7fa2048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa204c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa2050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa2054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa2058:	14000001	b	0xfffff7fa205c
   0x0000fffff7fa205c:	14000001	b	0xfffff7fa2060
   0x0000fffff7fa2060:	14000001	b	0xfffff7fa2064
   0x0000fffff7fa2064:	14000001	b	0xfffff7fa2068
   0x0000fffff7fa2068:	14000001	b	0xfffff7fa206c
   0x0000fffff7fa206c:	14000001	b	0xfffff7fa2070
   0x0000fffff7fa2070:	14000001	b	0xfffff7fa2074
   0x0000fffff7fa2074:	14000001	b	0xfffff7fa2078
   0x0000fffff7fa2078:	14000001	b	0xfffff7fa207c
   0x0000fffff7fa207c:	14000001	b	0xfffff7fa2080
   0x0000fffff7fa2080:	14000001	b	0xfffff7fa2084
   0x0000fffff7fa2084:	14000001	b	0xfffff7fa2088
   0x0000fffff7fa2088:	14000001	b	0xfffff7fa208c
   0x0000fffff7fa208c:	14000001	b	0xfffff7fa2090
   0x0000fffff7fa2090:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa2094:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa2098:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa209c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa20a0:	36d80211	tbz	w17, #27, 0xfffff7fa20e0
   0x0000fffff7fa20a4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa20a8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa20ac:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa20b0:	540001e1	b.ne	0xfffff7fa20ec  // b.any
   0x0000fffff7fa20b4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa20b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa20bc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa20c0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa20c4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa20c8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa20cc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa20d0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa20d4:	540000c9	b.ls	0xfffff7fa20ec  // b.plast
   0x0000fffff7fa20d8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa20dc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa20e0:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa20e4:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa20e8:	1400000e	b	0xfffff7fa2120
   0x0000fffff7fa20ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa20f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa20f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa20f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa20fc:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa2100:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2104:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2108:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa210c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2110:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2114:	d63f0200	blr	x16
   0x0000fffff7fa2118:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa211c:	5400ede0	b.eq	0xfffff7fa3ed8  // b.none
   0x0000fffff7fa2120:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa2124:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa2128:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa212c:	b9405271	ldr	w17, [x19, #80]
   0x0000fffff7fa2130:	36d80211	tbz	w17, #27, 0xfffff7fa2170
   0x0000fffff7fa2134:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2138:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa213c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2140:	540001e1	b.ne	0xfffff7fa217c  // b.any
   0x0000fffff7fa2144:	f9402e6f	ldr	x15, [x19, #88]
   0x0000fffff7fa2148:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa214c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2150:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2154:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2158:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa215c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2160:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2164:	540000c9	b.ls	0xfffff7fa217c  // b.plast
   0x0000fffff7fa2168:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa216c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2170:	f9002e6c	str	x12, [x19, #88]
   0x0000fffff7fa2174:	b900526d	str	w13, [x19, #80]
   0x0000fffff7fa2178:	1400000e	b	0xfffff7fa21b0
   0x0000fffff7fa217c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2180:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2184:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2188:	aa1503e2	mov	x2, x21
   0x0000fffff7fa218c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa2190:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2194:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2198:	d2856410	mov	x16, #0x2b20                	// #11040
   0x0000fffff7fa219c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa21a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa21a4:	d63f0200	blr	x16
   0x0000fffff7fa21a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa21ac:	5400e9a0	b.eq	0xfffff7fa3ee0  // b.none
   0x0000fffff7fa21b0:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa21b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa21b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa21bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa21c0:	54000421	b.ne	0xfffff7fa2244  // b.any
   0x0000fffff7fa21c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa21c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa21cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa21d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa21d4:	54000381	b.ne	0xfffff7fa2244  // b.any
   0x0000fffff7fa21d8:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa21dc:	f940166a	ldr	x10, [x19, #40]
   0x0000fffff7fa21e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa21e4:	9a9fa7ec	cset	x12, lt	// lt = tstop
   0x0000fffff7fa21e8:	5280010d	mov	w13, #0x8                   	// #8
   0x0000fffff7fa21ec:	72a0200d	movk	w13, #0x100, lsl #16
   0x0000fffff7fa21f0:	91000580	add	x0, x12, #0x1
   0x0000fffff7fa21f4:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa21f8:	36d80211	tbz	w17, #27, 0xfffff7fa2238
   0x0000fffff7fa21fc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2200:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2204:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2208:	540001e1	b.ne	0xfffff7fa2244  // b.any
   0x0000fffff7fa220c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa2210:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2214:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2218:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa221c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2220:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2224:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2228:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa222c:	540000c9	b.ls	0xfffff7fa2244  // b.plast
   0x0000fffff7fa2230:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2234:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2238:	f9005ecc	str	x12, [x22, #184]
   0x0000fffff7fa223c:	b900b2cd	str	w13, [x22, #176]
   0x0000fffff7fa2240:	1400000e	b	0xfffff7fa2278
   0x0000fffff7fa2244:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2248:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa224c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2250:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2254:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa2258:	aa1403e4	mov	x4, x20
   0x0000fffff7fa225c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2260:	d28fec90	mov	x16, #0x7f64                	// #32612
   0x0000fffff7fa2264:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2268:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa226c:	d63f0200	blr	x16
   0x0000fffff7fa2270:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2274:	5400e3a0	b.eq	0xfffff7fa3ee8  // b.none
   0x0000fffff7fa2278:	f100041f	cmp	x0, #0x1
   0x0000fffff7fa227c:	5400df80	b.eq	0xfffff7fa3e6c  // b.none
   0x0000fffff7fa2280:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa2284:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa2288:	d299d20c	mov	x12, #0xce90                	// #52880
   0x0000fffff7fa228c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa2290:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa2294:	b9406271	ldr	w17, [x19, #96]
   0x0000fffff7fa2298:	36d801d1	tbz	w17, #27, 0xfffff7fa22d0
   0x0000fffff7fa229c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa22a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa22a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa22a8:	54000281	b.ne	0xfffff7fa22f8  // b.any
   0x0000fffff7fa22ac:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa22b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa22b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa22b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa22bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa22c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa22c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa22c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa22cc:	54000169	b.ls	0xfffff7fa22f8  // b.plast
   0x0000fffff7fa22d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa22d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa22d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa22dc:	36d80091	tbz	w17, #27, 0xfffff7fa22ec
   0x0000fffff7fa22e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa22e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa22e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa22ec:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa22f0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa22f4:	1400000e	b	0xfffff7fa232c
   0x0000fffff7fa22f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa22fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2300:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2304:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2308:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa230c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2310:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2314:	d2933c10	mov	x16, #0x99e0                	// #39392
   0x0000fffff7fa2318:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa231c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2320:	d63f0200	blr	x16
   0x0000fffff7fa2324:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2328:	5400de40	b.eq	0xfffff7fa3ef0  // b.none
   0x0000fffff7fa232c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa2330:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2334:	540003a0	b.eq	0xfffff7fa23a8  // b.none
   0x0000fffff7fa2338:	b940526d	ldr	w13, [x19, #80]
   0x0000fffff7fa233c:	f9402e6c	ldr	x12, [x19, #88]
   0x0000fffff7fa2340:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa2344:	36d801d1	tbz	w17, #27, 0xfffff7fa237c
   0x0000fffff7fa2348:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa234c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2350:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2354:	540002a1	b.ne	0xfffff7fa23a8  // b.any
   0x0000fffff7fa2358:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa235c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2360:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2364:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2368:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa236c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2370:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2374:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2378:	54000189	b.ls	0xfffff7fa23a8  // b.plast
   0x0000fffff7fa237c:	36d8008d	tbz	w13, #27, 0xfffff7fa238c
   0x0000fffff7fa2380:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2384:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2388:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa238c:	36d80091	tbz	w17, #27, 0xfffff7fa239c
   0x0000fffff7fa2390:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2394:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2398:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa239c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa23a0:	b900016d	str	w13, [x11]
   0x0000fffff7fa23a4:	1400000e	b	0xfffff7fa23dc
   0x0000fffff7fa23a8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa23ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa23b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa23b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa23b8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa23bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa23c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa23c4:	d29e2e10	mov	x16, #0xf170                	// #61808
   0x0000fffff7fa23c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa23cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa23d0:	d63f0200	blr	x16
   0x0000fffff7fa23d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa23d8:	5400d900	b.eq	0xfffff7fa3ef8  // b.none
   0x0000fffff7fa23dc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa23e0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa23e4:	540004a0	b.eq	0xfffff7fa2478  // b.none
   0x0000fffff7fa23e8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa23ec:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa23f0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa23f4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa23f8:	54000400	b.eq	0xfffff7fa2478  // b.none
   0x0000fffff7fa23fc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa2400:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa2404:	36d801d1	tbz	w17, #27, 0xfffff7fa243c
   0x0000fffff7fa2408:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa240c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2410:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2414:	54000321	b.ne	0xfffff7fa2478  // b.any
   0x0000fffff7fa2418:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa241c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2420:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2424:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2428:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa242c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2430:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2434:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2438:	54000209	b.ls	0xfffff7fa2478  // b.plast
   0x0000fffff7fa243c:	36d8008d	tbz	w13, #27, 0xfffff7fa244c
   0x0000fffff7fa2440:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2444:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2448:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa244c:	36d80091	tbz	w17, #27, 0xfffff7fa245c
   0x0000fffff7fa2450:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2454:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2458:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa245c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa2460:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa2464:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa2468:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa246c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa2470:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa2474:	1400000e	b	0xfffff7fa24ac
   0x0000fffff7fa2478:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa247c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2480:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2484:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2488:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa248c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2490:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2494:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa2498:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa249c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa24a0:	d63f0200	blr	x16
   0x0000fffff7fa24a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa24a8:	5400d2c0	b.eq	0xfffff7fa3f00  // b.none
   0x0000fffff7fa24ac:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa24b0:	37d806a9	tbnz	w9, #27, 0xfffff7fa2584
   0x0000fffff7fa24b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa24b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa24bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa24c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa24c4:	540001c1	b.ne	0xfffff7fa24fc  // b.any
   0x0000fffff7fa24c8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa24cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa24d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa24d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa24d8:	54000121	b.ne	0xfffff7fa24fc  // b.any
   0x0000fffff7fa24dc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa24e0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa24e4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa24e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa24ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa24f0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa24f4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa24f8:	14000030	b	0xfffff7fa25b8
   0x0000fffff7fa24fc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2500:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2504:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2508:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa250c:	54000120	b.eq	0xfffff7fa2530  // b.none
   0x0000fffff7fa2510:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2514:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2518:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa251c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2520:	54000321	b.ne	0xfffff7fa2584  // b.any
   0x0000fffff7fa2524:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2528:	9e620120	scvtf	d0, x9
   0x0000fffff7fa252c:	14000002	b	0xfffff7fa2534
   0x0000fffff7fa2530:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa2534:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2538:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa253c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2540:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2544:	54000120	b.eq	0xfffff7fa2568  // b.none
   0x0000fffff7fa2548:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa254c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2550:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2554:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2558:	54000161	b.ne	0xfffff7fa2584  // b.any
   0x0000fffff7fa255c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa2560:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2564:	14000002	b	0xfffff7fa256c
   0x0000fffff7fa2568:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa256c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2570:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa2574:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2578:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa257c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa2580:	17ffffde	b	0xfffff7fa24f8
   0x0000fffff7fa2584:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2588:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa258c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2590:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2594:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa2598:	aa1403e4	mov	x4, x20
   0x0000fffff7fa259c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa25a0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa25a4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa25a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa25ac:	d63f0200	blr	x16
   0x0000fffff7fa25b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa25b4:	5400caa0	b.eq	0xfffff7fa3f08  // b.none
   0x0000fffff7fa25b8:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa25bc:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa25c0:	540004a0	b.eq	0xfffff7fa2654  // b.none
   0x0000fffff7fa25c4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa25c8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa25cc:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa25d0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa25d4:	54000400	b.eq	0xfffff7fa2654  // b.none
   0x0000fffff7fa25d8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa25dc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa25e0:	36d801d1	tbz	w17, #27, 0xfffff7fa2618
   0x0000fffff7fa25e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa25e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa25ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa25f0:	54000321	b.ne	0xfffff7fa2654  // b.any
   0x0000fffff7fa25f4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa25f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa25fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2600:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2604:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2608:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa260c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2610:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2614:	54000209	b.ls	0xfffff7fa2654  // b.plast
   0x0000fffff7fa2618:	36d8008d	tbz	w13, #27, 0xfffff7fa2628
   0x0000fffff7fa261c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2620:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2624:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2628:	36d80091	tbz	w17, #27, 0xfffff7fa2638
   0x0000fffff7fa262c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2630:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2634:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2638:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa263c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa2640:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa2644:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa2648:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa264c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa2650:	1400000e	b	0xfffff7fa2688
   0x0000fffff7fa2654:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2658:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa265c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2660:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2664:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa2668:	aa1403e4	mov	x4, x20
   0x0000fffff7fa266c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2670:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa2674:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2678:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa267c:	d63f0200	blr	x16
   0x0000fffff7fa2680:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2684:	5400c460	b.eq	0xfffff7fa3f10  // b.none
   0x0000fffff7fa2688:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa268c:	37d806a9	tbnz	w9, #27, 0xfffff7fa2760
   0x0000fffff7fa2690:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa269c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa26a0:	540001c1	b.ne	0xfffff7fa26d8  // b.any
   0x0000fffff7fa26a4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa26a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa26ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa26b4:	54000121	b.ne	0xfffff7fa26d8  // b.any
   0x0000fffff7fa26b8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa26bc:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa26c0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa26c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa26c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26cc:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa26d0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa26d4:	14000030	b	0xfffff7fa2794
   0x0000fffff7fa26d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa26dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa26e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa26e8:	54000120	b.eq	0xfffff7fa270c  // b.none
   0x0000fffff7fa26ec:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa26f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa26f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa26fc:	54000321	b.ne	0xfffff7fa2760  // b.any
   0x0000fffff7fa2700:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2704:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2708:	14000002	b	0xfffff7fa2710
   0x0000fffff7fa270c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa2710:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2714:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2718:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa271c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2720:	54000120	b.eq	0xfffff7fa2744  // b.none
   0x0000fffff7fa2724:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2728:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa272c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2730:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2734:	54000161	b.ne	0xfffff7fa2760  // b.any
   0x0000fffff7fa2738:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa273c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2740:	14000002	b	0xfffff7fa2748
   0x0000fffff7fa2744:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa2748:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa274c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa2750:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2754:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2758:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa275c:	17ffffde	b	0xfffff7fa26d4
   0x0000fffff7fa2760:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2764:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2768:	aa1303e1	mov	x1, x19
   0x0000fffff7fa276c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2770:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa2774:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2778:	aa1603e5	mov	x5, x22
   0x0000fffff7fa277c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa2780:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2784:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2788:	d63f0200	blr	x16
   0x0000fffff7fa278c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2790:	5400bc40	b.eq	0xfffff7fa3f18  // b.none
   0x0000fffff7fa2794:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa2798:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa279c:	540004a0	b.eq	0xfffff7fa2830  // b.none
   0x0000fffff7fa27a0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa27a4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa27a8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa27ac:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa27b0:	54000400	b.eq	0xfffff7fa2830  // b.none
   0x0000fffff7fa27b4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa27b8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa27bc:	36d801d1	tbz	w17, #27, 0xfffff7fa27f4
   0x0000fffff7fa27c0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa27c4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa27c8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa27cc:	54000321	b.ne	0xfffff7fa2830  // b.any
   0x0000fffff7fa27d0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa27d4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa27d8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa27dc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa27e0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa27e4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa27e8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa27ec:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa27f0:	54000209	b.ls	0xfffff7fa2830  // b.plast
   0x0000fffff7fa27f4:	36d8008d	tbz	w13, #27, 0xfffff7fa2804
   0x0000fffff7fa27f8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa27fc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2800:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2804:	36d80091	tbz	w17, #27, 0xfffff7fa2814
   0x0000fffff7fa2808:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa280c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2810:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2814:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa2818:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa281c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa2820:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa2824:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa2828:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa282c:	1400000e	b	0xfffff7fa2864
   0x0000fffff7fa2830:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2834:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2838:	aa1303e1	mov	x1, x19
   0x0000fffff7fa283c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2840:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa2844:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2848:	aa1603e5	mov	x5, x22
   0x0000fffff7fa284c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa2850:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2854:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2858:	d63f0200	blr	x16
   0x0000fffff7fa285c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2860:	5400b600	b.eq	0xfffff7fa3f20  // b.none
   0x0000fffff7fa2864:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2868:	37d806a9	tbnz	w9, #27, 0xfffff7fa293c
   0x0000fffff7fa286c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2870:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2874:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2878:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa287c:	540001c1	b.ne	0xfffff7fa28b4  // b.any
   0x0000fffff7fa2880:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2884:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2888:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa288c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2890:	54000121	b.ne	0xfffff7fa28b4  // b.any
   0x0000fffff7fa2894:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2898:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa289c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa28a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa28a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa28a8:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa28ac:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa28b0:	14000030	b	0xfffff7fa2970
   0x0000fffff7fa28b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa28b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa28bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa28c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa28c4:	54000120	b.eq	0xfffff7fa28e8  // b.none
   0x0000fffff7fa28c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa28cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa28d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa28d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa28d8:	54000321	b.ne	0xfffff7fa293c  // b.any
   0x0000fffff7fa28dc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa28e0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa28e4:	14000002	b	0xfffff7fa28ec
   0x0000fffff7fa28e8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa28ec:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa28f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa28f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa28f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa28fc:	54000120	b.eq	0xfffff7fa2920  // b.none
   0x0000fffff7fa2900:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2904:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2908:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa290c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2910:	54000161	b.ne	0xfffff7fa293c  // b.any
   0x0000fffff7fa2914:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa2918:	9e620121	scvtf	d1, x9
   0x0000fffff7fa291c:	14000002	b	0xfffff7fa2924
   0x0000fffff7fa2920:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa2924:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2928:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa292c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2934:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa2938:	17ffffde	b	0xfffff7fa28b0
   0x0000fffff7fa293c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2940:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2944:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2948:	aa1503e2	mov	x2, x21
   0x0000fffff7fa294c:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa2950:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2954:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2958:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa295c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2960:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2964:	d63f0200	blr	x16
   0x0000fffff7fa2968:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa296c:	5400ade0	b.eq	0xfffff7fa3f28  // b.none
   0x0000fffff7fa2970:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa2974:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2978:	540004a0	b.eq	0xfffff7fa2a0c  // b.none
   0x0000fffff7fa297c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa2980:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa2984:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa2988:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa298c:	54000400	b.eq	0xfffff7fa2a0c  // b.none
   0x0000fffff7fa2990:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa2994:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa2998:	36d801d1	tbz	w17, #27, 0xfffff7fa29d0
   0x0000fffff7fa299c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa29a0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa29a4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa29a8:	54000321	b.ne	0xfffff7fa2a0c  // b.any
   0x0000fffff7fa29ac:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa29b0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa29b4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa29b8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa29bc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa29c0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa29c4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa29c8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa29cc:	54000209	b.ls	0xfffff7fa2a0c  // b.plast
   0x0000fffff7fa29d0:	36d8008d	tbz	w13, #27, 0xfffff7fa29e0
   0x0000fffff7fa29d4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa29d8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa29dc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa29e0:	36d80091	tbz	w17, #27, 0xfffff7fa29f0
   0x0000fffff7fa29e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa29e8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa29ec:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa29f0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa29f4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa29f8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa29fc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa2a00:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa2a04:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa2a08:	1400000e	b	0xfffff7fa2a40
   0x0000fffff7fa2a0c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2a10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2a14:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2a18:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2a1c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa2a20:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2a24:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2a28:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa2a2c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2a30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2a34:	d63f0200	blr	x16
   0x0000fffff7fa2a38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2a3c:	5400a7a0	b.eq	0xfffff7fa3f30  // b.none
   0x0000fffff7fa2a40:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2a44:	37d806a9	tbnz	w9, #27, 0xfffff7fa2b18
   0x0000fffff7fa2a48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2a4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2a50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2a58:	540001c1	b.ne	0xfffff7fa2a90  // b.any
   0x0000fffff7fa2a5c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2a60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2a64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2a6c:	54000121	b.ne	0xfffff7fa2a90  // b.any
   0x0000fffff7fa2a70:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2a74:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa2a78:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2a7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2a80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a84:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa2a88:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa2a8c:	14000030	b	0xfffff7fa2b4c
   0x0000fffff7fa2a90:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2a94:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2a98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2aa0:	54000120	b.eq	0xfffff7fa2ac4  // b.none
   0x0000fffff7fa2aa4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2ab4:	54000321	b.ne	0xfffff7fa2b18  // b.any
   0x0000fffff7fa2ab8:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2abc:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2ac0:	14000002	b	0xfffff7fa2ac8
   0x0000fffff7fa2ac4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa2ac8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2acc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2ad0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ad4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2ad8:	54000120	b.eq	0xfffff7fa2afc  // b.none
   0x0000fffff7fa2adc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2ae0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2ae4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ae8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2aec:	54000161	b.ne	0xfffff7fa2b18  // b.any
   0x0000fffff7fa2af0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa2af4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2af8:	14000002	b	0xfffff7fa2b00
   0x0000fffff7fa2afc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa2b00:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2b04:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa2b08:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2b0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2b10:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa2b14:	17ffffde	b	0xfffff7fa2a8c
   0x0000fffff7fa2b18:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2b1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2b20:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2b24:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2b28:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa2b2c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2b30:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2b34:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa2b38:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2b3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2b40:	d63f0200	blr	x16
   0x0000fffff7fa2b44:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2b48:	54009f80	b.eq	0xfffff7fa3f38  // b.none
   0x0000fffff7fa2b4c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa2b50:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2b54:	540004a0	b.eq	0xfffff7fa2be8  // b.none
   0x0000fffff7fa2b58:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa2b5c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa2b60:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa2b64:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa2b68:	54000400	b.eq	0xfffff7fa2be8  // b.none
   0x0000fffff7fa2b6c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa2b70:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa2b74:	36d801d1	tbz	w17, #27, 0xfffff7fa2bac
   0x0000fffff7fa2b78:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2b7c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2b80:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2b84:	54000321	b.ne	0xfffff7fa2be8  // b.any
   0x0000fffff7fa2b88:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa2b8c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2b90:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2b94:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2b98:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2b9c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2ba0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2ba4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2ba8:	54000209	b.ls	0xfffff7fa2be8  // b.plast
   0x0000fffff7fa2bac:	36d8008d	tbz	w13, #27, 0xfffff7fa2bbc
   0x0000fffff7fa2bb0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2bb4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2bb8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2bbc:	36d80091	tbz	w17, #27, 0xfffff7fa2bcc
   0x0000fffff7fa2bc0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2bc4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2bc8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2bcc:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa2bd0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa2bd4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa2bd8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa2bdc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa2be0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa2be4:	1400000e	b	0xfffff7fa2c1c
   0x0000fffff7fa2be8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2bec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2bf0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2bf4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2bf8:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa2bfc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2c00:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2c04:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa2c08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2c0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2c10:	d63f0200	blr	x16
   0x0000fffff7fa2c14:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2c18:	54009940	b.eq	0xfffff7fa3f40  // b.none
   0x0000fffff7fa2c1c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2c20:	37d806a9	tbnz	w9, #27, 0xfffff7fa2cf4
   0x0000fffff7fa2c24:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2c28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2c2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c30:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2c34:	540001c1	b.ne	0xfffff7fa2c6c  // b.any
   0x0000fffff7fa2c38:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2c3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2c40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c44:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2c48:	54000121	b.ne	0xfffff7fa2c6c  // b.any
   0x0000fffff7fa2c4c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2c50:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa2c54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2c58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2c5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c60:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa2c64:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa2c68:	14000030	b	0xfffff7fa2d28
   0x0000fffff7fa2c6c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2c70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2c74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2c7c:	54000120	b.eq	0xfffff7fa2ca0  // b.none
   0x0000fffff7fa2c80:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2c84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2c88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2c90:	54000321	b.ne	0xfffff7fa2cf4  // b.any
   0x0000fffff7fa2c94:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2c98:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2c9c:	14000002	b	0xfffff7fa2ca4
   0x0000fffff7fa2ca0:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa2ca4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2ca8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2cac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2cb0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2cb4:	54000120	b.eq	0xfffff7fa2cd8  // b.none
   0x0000fffff7fa2cb8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2cbc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2cc0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2cc4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2cc8:	54000161	b.ne	0xfffff7fa2cf4  // b.any
   0x0000fffff7fa2ccc:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa2cd0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2cd4:	14000002	b	0xfffff7fa2cdc
   0x0000fffff7fa2cd8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa2cdc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2ce0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa2ce4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2ce8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2cec:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa2cf0:	17ffffde	b	0xfffff7fa2c68
   0x0000fffff7fa2cf4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2cf8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2cfc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2d00:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2d04:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa2d08:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2d0c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2d10:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa2d14:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2d18:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2d1c:	d63f0200	blr	x16
   0x0000fffff7fa2d20:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2d24:	54009120	b.eq	0xfffff7fa3f48  // b.none
   0x0000fffff7fa2d28:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa2d2c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2d30:	540004a0	b.eq	0xfffff7fa2dc4  // b.none
   0x0000fffff7fa2d34:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa2d38:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa2d3c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa2d40:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa2d44:	54000400	b.eq	0xfffff7fa2dc4  // b.none
   0x0000fffff7fa2d48:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa2d4c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa2d50:	36d801d1	tbz	w17, #27, 0xfffff7fa2d88
   0x0000fffff7fa2d54:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2d58:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2d5c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2d60:	54000321	b.ne	0xfffff7fa2dc4  // b.any
   0x0000fffff7fa2d64:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa2d68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2d6c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2d70:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2d74:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2d78:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2d7c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2d80:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2d84:	54000209	b.ls	0xfffff7fa2dc4  // b.plast
   0x0000fffff7fa2d88:	36d8008d	tbz	w13, #27, 0xfffff7fa2d98
   0x0000fffff7fa2d8c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2d90:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2d94:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2d98:	36d80091	tbz	w17, #27, 0xfffff7fa2da8
   0x0000fffff7fa2d9c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2da0:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2da4:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2da8:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa2dac:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa2db0:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa2db4:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa2db8:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa2dbc:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa2dc0:	1400000e	b	0xfffff7fa2df8
   0x0000fffff7fa2dc4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2dc8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2dcc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2dd0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2dd4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa2dd8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2ddc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2de0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa2de4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2de8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2dec:	d63f0200	blr	x16
   0x0000fffff7fa2df0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2df4:	54008ae0	b.eq	0xfffff7fa3f50  // b.none
   0x0000fffff7fa2df8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2dfc:	37d806a9	tbnz	w9, #27, 0xfffff7fa2ed0
   0x0000fffff7fa2e00:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2e04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2e08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2e0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2e10:	540001c1	b.ne	0xfffff7fa2e48  // b.any
   0x0000fffff7fa2e14:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2e18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2e1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2e20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2e24:	54000121	b.ne	0xfffff7fa2e48  // b.any
   0x0000fffff7fa2e28:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2e2c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa2e30:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2e34:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2e38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2e3c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa2e40:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa2e44:	14000030	b	0xfffff7fa2f04
   0x0000fffff7fa2e48:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2e4c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2e50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2e54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2e58:	54000120	b.eq	0xfffff7fa2e7c  // b.none
   0x0000fffff7fa2e5c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2e60:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2e64:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2e68:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2e6c:	54000321	b.ne	0xfffff7fa2ed0  // b.any
   0x0000fffff7fa2e70:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2e74:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2e78:	14000002	b	0xfffff7fa2e80
   0x0000fffff7fa2e7c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa2e80:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2e84:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2e88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2e8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2e90:	54000120	b.eq	0xfffff7fa2eb4  // b.none
   0x0000fffff7fa2e94:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2e98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2e9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ea0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2ea4:	54000161	b.ne	0xfffff7fa2ed0  // b.any
   0x0000fffff7fa2ea8:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa2eac:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2eb0:	14000002	b	0xfffff7fa2eb8
   0x0000fffff7fa2eb4:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa2eb8:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2ebc:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa2ec0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2ec4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ec8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa2ecc:	17ffffde	b	0xfffff7fa2e44
   0x0000fffff7fa2ed0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2ed4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2ed8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2edc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2ee0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa2ee4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2ee8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2eec:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa2ef0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2ef4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2ef8:	d63f0200	blr	x16
   0x0000fffff7fa2efc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2f00:	540082c0	b.eq	0xfffff7fa3f58  // b.none
   0x0000fffff7fa2f04:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa2f08:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2f0c:	540004a0	b.eq	0xfffff7fa2fa0  // b.none
   0x0000fffff7fa2f10:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa2f14:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa2f18:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa2f1c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa2f20:	54000400	b.eq	0xfffff7fa2fa0  // b.none
   0x0000fffff7fa2f24:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa2f28:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa2f2c:	36d801d1	tbz	w17, #27, 0xfffff7fa2f64
   0x0000fffff7fa2f30:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2f34:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2f38:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2f3c:	54000321	b.ne	0xfffff7fa2fa0  // b.any
   0x0000fffff7fa2f40:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa2f44:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2f48:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2f4c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2f50:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2f54:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2f58:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2f5c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2f60:	54000209	b.ls	0xfffff7fa2fa0  // b.plast
   0x0000fffff7fa2f64:	36d8008d	tbz	w13, #27, 0xfffff7fa2f74
   0x0000fffff7fa2f68:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2f6c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2f70:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2f74:	36d80091	tbz	w17, #27, 0xfffff7fa2f84
   0x0000fffff7fa2f78:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2f7c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2f80:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2f84:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa2f88:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa2f8c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa2f90:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa2f94:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa2f98:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa2f9c:	1400000e	b	0xfffff7fa2fd4
   0x0000fffff7fa2fa0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2fa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2fa8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2fac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2fb0:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa2fb4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2fb8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2fbc:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa2fc0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2fc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2fc8:	d63f0200	blr	x16
   0x0000fffff7fa2fcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2fd0:	54007c80	b.eq	0xfffff7fa3f60  // b.none
   0x0000fffff7fa2fd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2fd8:	37d806a9	tbnz	w9, #27, 0xfffff7fa30ac
   0x0000fffff7fa2fdc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2fe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2fe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2fe8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2fec:	540001c1	b.ne	0xfffff7fa3024  // b.any
   0x0000fffff7fa2ff0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa2ff4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2ff8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ffc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3000:	54000121	b.ne	0xfffff7fa3024  // b.any
   0x0000fffff7fa3004:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3008:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa300c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3010:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3014:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3018:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa301c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa3020:	14000030	b	0xfffff7fa30e0
   0x0000fffff7fa3024:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3028:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa302c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3030:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3034:	54000120	b.eq	0xfffff7fa3058  // b.none
   0x0000fffff7fa3038:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa303c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3040:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3044:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3048:	54000321	b.ne	0xfffff7fa30ac  // b.any
   0x0000fffff7fa304c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3050:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3054:	14000002	b	0xfffff7fa305c
   0x0000fffff7fa3058:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa305c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3060:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3064:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3068:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa306c:	54000120	b.eq	0xfffff7fa3090  // b.none
   0x0000fffff7fa3070:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3074:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3078:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa307c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3080:	54000161	b.ne	0xfffff7fa30ac  // b.any
   0x0000fffff7fa3084:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa3088:	9e620121	scvtf	d1, x9
   0x0000fffff7fa308c:	14000002	b	0xfffff7fa3094
   0x0000fffff7fa3090:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa3094:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3098:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa309c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa30a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa30a4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa30a8:	17ffffde	b	0xfffff7fa3020
   0x0000fffff7fa30ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa30b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa30b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa30b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa30bc:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa30c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa30c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa30c8:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa30cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa30d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa30d4:	d63f0200	blr	x16
   0x0000fffff7fa30d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa30dc:	54007460	b.eq	0xfffff7fa3f68  // b.none
   0x0000fffff7fa30e0:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa30e4:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa30e8:	540004a0	b.eq	0xfffff7fa317c  // b.none
   0x0000fffff7fa30ec:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa30f0:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa30f4:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa30f8:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa30fc:	54000400	b.eq	0xfffff7fa317c  // b.none
   0x0000fffff7fa3100:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3104:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3108:	36d801d1	tbz	w17, #27, 0xfffff7fa3140
   0x0000fffff7fa310c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3110:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3114:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3118:	54000321	b.ne	0xfffff7fa317c  // b.any
   0x0000fffff7fa311c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3120:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3124:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3128:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa312c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3130:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3134:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3138:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa313c:	54000209	b.ls	0xfffff7fa317c  // b.plast
   0x0000fffff7fa3140:	36d8008d	tbz	w13, #27, 0xfffff7fa3150
   0x0000fffff7fa3144:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3148:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa314c:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa3150:	36d80091	tbz	w17, #27, 0xfffff7fa3160
   0x0000fffff7fa3154:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3158:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa315c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3160:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa3164:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa3168:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa316c:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3170:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa3174:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa3178:	1400000e	b	0xfffff7fa31b0
   0x0000fffff7fa317c:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3180:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3184:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3188:	aa1503e2	mov	x2, x21
   0x0000fffff7fa318c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa3190:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3194:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3198:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa319c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa31a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa31a4:	d63f0200	blr	x16
   0x0000fffff7fa31a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa31ac:	54006e20	b.eq	0xfffff7fa3f70  // b.none
   0x0000fffff7fa31b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa31b4:	37d806a9	tbnz	w9, #27, 0xfffff7fa3288
   0x0000fffff7fa31b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa31bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa31c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa31c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa31c8:	540001c1	b.ne	0xfffff7fa3200  // b.any
   0x0000fffff7fa31cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa31d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa31d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa31d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa31dc:	54000121	b.ne	0xfffff7fa3200  // b.any
   0x0000fffff7fa31e0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa31e4:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa31e8:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa31ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa31f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa31f4:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa31f8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa31fc:	14000030	b	0xfffff7fa32bc
   0x0000fffff7fa3200:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3204:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa320c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3210:	54000120	b.eq	0xfffff7fa3234  // b.none
   0x0000fffff7fa3214:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3218:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa321c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3220:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3224:	54000321	b.ne	0xfffff7fa3288  // b.any
   0x0000fffff7fa3228:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa322c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3230:	14000002	b	0xfffff7fa3238
   0x0000fffff7fa3234:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa3238:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa323c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3244:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3248:	54000120	b.eq	0xfffff7fa326c  // b.none
   0x0000fffff7fa324c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3250:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3254:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3258:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa325c:	54000161	b.ne	0xfffff7fa3288  // b.any
   0x0000fffff7fa3260:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa3264:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3268:	14000002	b	0xfffff7fa3270
   0x0000fffff7fa326c:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa3270:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3274:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa3278:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa327c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3280:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa3284:	17ffffde	b	0xfffff7fa31fc
   0x0000fffff7fa3288:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa328c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3290:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3294:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3298:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa329c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa32a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa32a4:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa32a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa32ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa32b0:	d63f0200	blr	x16
   0x0000fffff7fa32b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa32b8:	54006600	b.eq	0xfffff7fa3f78  // b.none
   0x0000fffff7fa32bc:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa32c0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa32c4:	540004a0	b.eq	0xfffff7fa3358  // b.none
   0x0000fffff7fa32c8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa32cc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa32d0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa32d4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa32d8:	54000400	b.eq	0xfffff7fa3358  // b.none
   0x0000fffff7fa32dc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa32e0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa32e4:	36d801d1	tbz	w17, #27, 0xfffff7fa331c
   0x0000fffff7fa32e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa32ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa32f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa32f4:	54000321	b.ne	0xfffff7fa3358  // b.any
   0x0000fffff7fa32f8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa32fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3300:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3304:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3308:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa330c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3310:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3314:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3318:	54000209	b.ls	0xfffff7fa3358  // b.plast
   0x0000fffff7fa331c:	36d8008d	tbz	w13, #27, 0xfffff7fa332c
   0x0000fffff7fa3320:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3324:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3328:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa332c:	36d80091	tbz	w17, #27, 0xfffff7fa333c
   0x0000fffff7fa3330:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3334:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3338:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa333c:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa3340:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa3344:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3348:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa334c:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa3350:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa3354:	1400000e	b	0xfffff7fa338c
   0x0000fffff7fa3358:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa335c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3360:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3364:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3368:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa336c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3370:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3374:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3378:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa337c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3380:	d63f0200	blr	x16
   0x0000fffff7fa3384:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3388:	54005fc0	b.eq	0xfffff7fa3f80  // b.none
   0x0000fffff7fa338c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3390:	37d806a9	tbnz	w9, #27, 0xfffff7fa3464
   0x0000fffff7fa3394:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3398:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa339c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa33a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa33a4:	540001c1	b.ne	0xfffff7fa33dc  // b.any
   0x0000fffff7fa33a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa33ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa33b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa33b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa33b8:	54000121	b.ne	0xfffff7fa33dc  // b.any
   0x0000fffff7fa33bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa33c0:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa33c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa33c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa33cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa33d0:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa33d4:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa33d8:	14000030	b	0xfffff7fa3498
   0x0000fffff7fa33dc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa33e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa33e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa33e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa33ec:	54000120	b.eq	0xfffff7fa3410  // b.none
   0x0000fffff7fa33f0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa33f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa33f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa33fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3400:	54000321	b.ne	0xfffff7fa3464  // b.any
   0x0000fffff7fa3404:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3408:	9e620120	scvtf	d0, x9
   0x0000fffff7fa340c:	14000002	b	0xfffff7fa3414
   0x0000fffff7fa3410:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa3414:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3418:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa341c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3420:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3424:	54000120	b.eq	0xfffff7fa3448  // b.none
   0x0000fffff7fa3428:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa342c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3430:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3434:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3438:	54000161	b.ne	0xfffff7fa3464  // b.any
   0x0000fffff7fa343c:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa3440:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3444:	14000002	b	0xfffff7fa344c
   0x0000fffff7fa3448:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa344c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3450:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa3454:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3458:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa345c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa3460:	17ffffde	b	0xfffff7fa33d8
   0x0000fffff7fa3464:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3468:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa346c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3470:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3474:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa3478:	aa1403e4	mov	x4, x20
   0x0000fffff7fa347c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3480:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3484:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3488:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa348c:	d63f0200	blr	x16
   0x0000fffff7fa3490:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3494:	540057a0	b.eq	0xfffff7fa3f88  // b.none
   0x0000fffff7fa3498:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa349c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa34a0:	540004a0	b.eq	0xfffff7fa3534  // b.none
   0x0000fffff7fa34a4:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa34a8:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa34ac:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa34b0:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa34b4:	54000400	b.eq	0xfffff7fa3534  // b.none
   0x0000fffff7fa34b8:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa34bc:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa34c0:	36d801d1	tbz	w17, #27, 0xfffff7fa34f8
   0x0000fffff7fa34c4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa34c8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa34cc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa34d0:	54000321	b.ne	0xfffff7fa3534  // b.any
   0x0000fffff7fa34d4:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa34d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa34dc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa34e0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa34e4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa34e8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa34ec:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa34f0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa34f4:	54000209	b.ls	0xfffff7fa3534  // b.plast
   0x0000fffff7fa34f8:	36d8008d	tbz	w13, #27, 0xfffff7fa3508
   0x0000fffff7fa34fc:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3500:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3504:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa3508:	36d80091	tbz	w17, #27, 0xfffff7fa3518
   0x0000fffff7fa350c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3510:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3514:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3518:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa351c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa3520:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3524:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3528:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa352c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa3530:	1400000e	b	0xfffff7fa3568
   0x0000fffff7fa3534:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3538:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa353c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3540:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3544:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa3548:	aa1403e4	mov	x4, x20
   0x0000fffff7fa354c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3550:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3554:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3558:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa355c:	d63f0200	blr	x16
   0x0000fffff7fa3560:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3564:	54005160	b.eq	0xfffff7fa3f90  // b.none
   0x0000fffff7fa3568:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa356c:	37d806a9	tbnz	w9, #27, 0xfffff7fa3640
   0x0000fffff7fa3570:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3574:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3578:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa357c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3580:	540001c1	b.ne	0xfffff7fa35b8  // b.any
   0x0000fffff7fa3584:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3588:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa358c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3590:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3594:	54000121	b.ne	0xfffff7fa35b8  // b.any
   0x0000fffff7fa3598:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa359c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa35a0:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa35a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa35a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35ac:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa35b0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa35b4:	14000030	b	0xfffff7fa3674
   0x0000fffff7fa35b8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa35bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa35c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa35c8:	54000120	b.eq	0xfffff7fa35ec  // b.none
   0x0000fffff7fa35cc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa35d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa35d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa35dc:	54000321	b.ne	0xfffff7fa3640  // b.any
   0x0000fffff7fa35e0:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa35e4:	9e620120	scvtf	d0, x9
   0x0000fffff7fa35e8:	14000002	b	0xfffff7fa35f0
   0x0000fffff7fa35ec:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa35f0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa35f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa35f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3600:	54000120	b.eq	0xfffff7fa3624  // b.none
   0x0000fffff7fa3604:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3608:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa360c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3610:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3614:	54000161	b.ne	0xfffff7fa3640  // b.any
   0x0000fffff7fa3618:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa361c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3620:	14000002	b	0xfffff7fa3628
   0x0000fffff7fa3624:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa3628:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa362c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa3630:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3638:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa363c:	17ffffde	b	0xfffff7fa35b4
   0x0000fffff7fa3640:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3644:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3648:	aa1303e1	mov	x1, x19
   0x0000fffff7fa364c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3650:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa3654:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3658:	aa1603e5	mov	x5, x22
   0x0000fffff7fa365c:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3660:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3664:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3668:	d63f0200	blr	x16
   0x0000fffff7fa366c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3670:	54004940	b.eq	0xfffff7fa3f98  // b.none
   0x0000fffff7fa3674:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3678:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa367c:	540004a0	b.eq	0xfffff7fa3710  // b.none
   0x0000fffff7fa3680:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3684:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa3688:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa368c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa3690:	54000400	b.eq	0xfffff7fa3710  // b.none
   0x0000fffff7fa3694:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3698:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa369c:	36d801d1	tbz	w17, #27, 0xfffff7fa36d4
   0x0000fffff7fa36a0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa36a4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa36a8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa36ac:	54000321	b.ne	0xfffff7fa3710  // b.any
   0x0000fffff7fa36b0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa36b4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa36b8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa36bc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa36c0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa36c4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa36c8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa36cc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa36d0:	54000209	b.ls	0xfffff7fa3710  // b.plast
   0x0000fffff7fa36d4:	36d8008d	tbz	w13, #27, 0xfffff7fa36e4
   0x0000fffff7fa36d8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa36dc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa36e0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa36e4:	36d80091	tbz	w17, #27, 0xfffff7fa36f4
   0x0000fffff7fa36e8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa36ec:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa36f0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa36f4:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa36f8:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa36fc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3700:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3704:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa3708:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa370c:	1400000e	b	0xfffff7fa3744
   0x0000fffff7fa3710:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3714:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3718:	aa1303e1	mov	x1, x19
   0x0000fffff7fa371c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3720:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa3724:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3728:	aa1603e5	mov	x5, x22
   0x0000fffff7fa372c:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3730:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3734:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3738:	d63f0200	blr	x16
   0x0000fffff7fa373c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3740:	54004300	b.eq	0xfffff7fa3fa0  // b.none
   0x0000fffff7fa3744:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3748:	37d806a9	tbnz	w9, #27, 0xfffff7fa381c
   0x0000fffff7fa374c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3750:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3754:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3758:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa375c:	540001c1	b.ne	0xfffff7fa3794  // b.any
   0x0000fffff7fa3760:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3764:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3768:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa376c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3770:	54000121	b.ne	0xfffff7fa3794  // b.any
   0x0000fffff7fa3774:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3778:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa377c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3780:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3784:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3788:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa378c:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa3790:	14000030	b	0xfffff7fa3850
   0x0000fffff7fa3794:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3798:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa379c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa37a4:	54000120	b.eq	0xfffff7fa37c8  // b.none
   0x0000fffff7fa37a8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa37ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa37b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa37b8:	54000321	b.ne	0xfffff7fa381c  // b.any
   0x0000fffff7fa37bc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa37c0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa37c4:	14000002	b	0xfffff7fa37cc
   0x0000fffff7fa37c8:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa37cc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa37d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa37d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa37dc:	54000120	b.eq	0xfffff7fa3800  // b.none
   0x0000fffff7fa37e0:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa37e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa37e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa37f0:	54000161	b.ne	0xfffff7fa381c  // b.any
   0x0000fffff7fa37f4:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa37f8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa37fc:	14000002	b	0xfffff7fa3804
   0x0000fffff7fa3800:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa3804:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3808:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa380c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3810:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3814:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa3818:	17ffffde	b	0xfffff7fa3790
   0x0000fffff7fa381c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3820:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3824:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3828:	aa1503e2	mov	x2, x21
   0x0000fffff7fa382c:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa3830:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3834:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3838:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa383c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3840:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3844:	d63f0200	blr	x16
   0x0000fffff7fa3848:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa384c:	54003ae0	b.eq	0xfffff7fa3fa8  // b.none
   0x0000fffff7fa3850:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3854:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3858:	540004a0	b.eq	0xfffff7fa38ec  // b.none
   0x0000fffff7fa385c:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3860:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa3864:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa3868:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa386c:	54000400	b.eq	0xfffff7fa38ec  // b.none
   0x0000fffff7fa3870:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3874:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3878:	36d801d1	tbz	w17, #27, 0xfffff7fa38b0
   0x0000fffff7fa387c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3880:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3884:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3888:	54000321	b.ne	0xfffff7fa38ec  // b.any
   0x0000fffff7fa388c:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3890:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3894:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3898:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa389c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa38a0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa38a4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa38a8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa38ac:	54000209	b.ls	0xfffff7fa38ec  // b.plast
   0x0000fffff7fa38b0:	36d8008d	tbz	w13, #27, 0xfffff7fa38c0
   0x0000fffff7fa38b4:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa38b8:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa38bc:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa38c0:	36d80091	tbz	w17, #27, 0xfffff7fa38d0
   0x0000fffff7fa38c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa38c8:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa38cc:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa38d0:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa38d4:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa38d8:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa38dc:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa38e0:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa38e4:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa38e8:	1400000e	b	0xfffff7fa3920
   0x0000fffff7fa38ec:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa38f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa38f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa38f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa38fc:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa3900:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3904:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3908:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa390c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3910:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3914:	d63f0200	blr	x16
   0x0000fffff7fa3918:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa391c:	540034a0	b.eq	0xfffff7fa3fb0  // b.none
   0x0000fffff7fa3920:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3924:	37d806a9	tbnz	w9, #27, 0xfffff7fa39f8
   0x0000fffff7fa3928:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa392c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3930:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3934:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3938:	540001c1	b.ne	0xfffff7fa3970  // b.any
   0x0000fffff7fa393c:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3940:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3948:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa394c:	54000121	b.ne	0xfffff7fa3970  // b.any
   0x0000fffff7fa3950:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3954:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa3958:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa395c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3960:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3964:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa3968:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa396c:	14000030	b	0xfffff7fa3a2c
   0x0000fffff7fa3970:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3974:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3978:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa397c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3980:	54000120	b.eq	0xfffff7fa39a4  // b.none
   0x0000fffff7fa3984:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa398c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3994:	54000321	b.ne	0xfffff7fa39f8  // b.any
   0x0000fffff7fa3998:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa399c:	9e620120	scvtf	d0, x9
   0x0000fffff7fa39a0:	14000002	b	0xfffff7fa39a8
   0x0000fffff7fa39a4:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa39a8:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa39ac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa39b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa39b8:	54000120	b.eq	0xfffff7fa39dc  // b.none
   0x0000fffff7fa39bc:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa39c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa39c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa39cc:	54000161	b.ne	0xfffff7fa39f8  // b.any
   0x0000fffff7fa39d0:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa39d4:	9e620121	scvtf	d1, x9
   0x0000fffff7fa39d8:	14000002	b	0xfffff7fa39e0
   0x0000fffff7fa39dc:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa39e0:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa39e4:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa39e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa39ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39f0:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa39f4:	17ffffde	b	0xfffff7fa396c
   0x0000fffff7fa39f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa39fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3a00:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3a04:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3a08:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa3a0c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3a10:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3a14:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3a18:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3a1c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3a20:	d63f0200	blr	x16
   0x0000fffff7fa3a24:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3a28:	54002c80	b.eq	0xfffff7fa3fb8  // b.none
   0x0000fffff7fa3a2c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3a30:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3a34:	540004a0	b.eq	0xfffff7fa3ac8  // b.none
   0x0000fffff7fa3a38:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3a3c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa3a40:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa3a44:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa3a48:	54000400	b.eq	0xfffff7fa3ac8  // b.none
   0x0000fffff7fa3a4c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3a50:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3a54:	36d801d1	tbz	w17, #27, 0xfffff7fa3a8c
   0x0000fffff7fa3a58:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3a5c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3a60:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3a64:	54000321	b.ne	0xfffff7fa3ac8  // b.any
   0x0000fffff7fa3a68:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3a6c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3a70:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3a74:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3a78:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3a7c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3a80:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3a84:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3a88:	54000209	b.ls	0xfffff7fa3ac8  // b.plast
   0x0000fffff7fa3a8c:	36d8008d	tbz	w13, #27, 0xfffff7fa3a9c
   0x0000fffff7fa3a90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3a94:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3a98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa3a9c:	36d80091	tbz	w17, #27, 0xfffff7fa3aac
   0x0000fffff7fa3aa0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3aa4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3aa8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3aac:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa3ab0:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa3ab4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3ab8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3abc:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa3ac0:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa3ac4:	1400000e	b	0xfffff7fa3afc
   0x0000fffff7fa3ac8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3acc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3ad0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3ad4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3ad8:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa3adc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3ae0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3ae4:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3ae8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3aec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3af0:	d63f0200	blr	x16
   0x0000fffff7fa3af4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3af8:	54002640	b.eq	0xfffff7fa3fc0  // b.none
   0x0000fffff7fa3afc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3b00:	37d806a9	tbnz	w9, #27, 0xfffff7fa3bd4
   0x0000fffff7fa3b04:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3b08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3b0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b10:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b14:	540001c1	b.ne	0xfffff7fa3b4c  // b.any
   0x0000fffff7fa3b18:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3b1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3b20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b24:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b28:	54000121	b.ne	0xfffff7fa3b4c  // b.any
   0x0000fffff7fa3b2c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3b30:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa3b34:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3b38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3b3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b40:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa3b44:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa3b48:	14000030	b	0xfffff7fa3c08
   0x0000fffff7fa3b4c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3b50:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3b54:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b58:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b5c:	54000120	b.eq	0xfffff7fa3b80  // b.none
   0x0000fffff7fa3b60:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3b64:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3b68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b70:	54000321	b.ne	0xfffff7fa3bd4  // b.any
   0x0000fffff7fa3b74:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3b78:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3b7c:	14000002	b	0xfffff7fa3b84
   0x0000fffff7fa3b80:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa3b84:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3b88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3b8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b94:	54000120	b.eq	0xfffff7fa3bb8  // b.none
   0x0000fffff7fa3b98:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3b9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3ba0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3ba4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3ba8:	54000161	b.ne	0xfffff7fa3bd4  // b.any
   0x0000fffff7fa3bac:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa3bb0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3bb4:	14000002	b	0xfffff7fa3bbc
   0x0000fffff7fa3bb8:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa3bbc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3bc0:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa3bc4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3bc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3bcc:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa3bd0:	17ffffde	b	0xfffff7fa3b48
   0x0000fffff7fa3bd4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3bd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3bdc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3be0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3be4:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa3be8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3bec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3bf0:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3bf4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3bf8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3bfc:	d63f0200	blr	x16
   0x0000fffff7fa3c00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3c04:	54001e20	b.eq	0xfffff7fa3fc8  // b.none
   0x0000fffff7fa3c08:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3c0c:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3c10:	540004a0	b.eq	0xfffff7fa3ca4  // b.none
   0x0000fffff7fa3c14:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3c18:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa3c1c:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa3c20:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa3c24:	54000400	b.eq	0xfffff7fa3ca4  // b.none
   0x0000fffff7fa3c28:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3c2c:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3c30:	36d801d1	tbz	w17, #27, 0xfffff7fa3c68
   0x0000fffff7fa3c34:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3c38:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3c3c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3c40:	54000321	b.ne	0xfffff7fa3ca4  // b.any
   0x0000fffff7fa3c44:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3c48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3c4c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3c50:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3c54:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3c58:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3c5c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3c60:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3c64:	54000209	b.ls	0xfffff7fa3ca4  // b.plast
   0x0000fffff7fa3c68:	36d8008d	tbz	w13, #27, 0xfffff7fa3c78
   0x0000fffff7fa3c6c:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3c70:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3c74:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa3c78:	36d80091	tbz	w17, #27, 0xfffff7fa3c88
   0x0000fffff7fa3c7c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3c80:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3c84:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3c88:	b940626e	ldr	w14, [x19, #96]
   0x0000fffff7fa3c8c:	f940366f	ldr	x15, [x19, #104]
   0x0000fffff7fa3c90:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3c94:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa3c98:	f900366c	str	x12, [x19, #104]
   0x0000fffff7fa3c9c:	b900626d	str	w13, [x19, #96]
   0x0000fffff7fa3ca0:	1400000e	b	0xfffff7fa3cd8
   0x0000fffff7fa3ca4:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3ca8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3cac:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3cb0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3cb4:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa3cb8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3cbc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3cc0:	d2952210	mov	x16, #0xa910                	// #43280
   0x0000fffff7fa3cc4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3cc8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3ccc:	d63f0200	blr	x16
   0x0000fffff7fa3cd0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3cd4:	540017e0	b.eq	0xfffff7fa3fd0  // b.none
   0x0000fffff7fa3cd8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3cdc:	37d806a9	tbnz	w9, #27, 0xfffff7fa3db0
   0x0000fffff7fa3ce0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3ce4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3ce8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3cec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3cf0:	540001c1	b.ne	0xfffff7fa3d28  // b.any
   0x0000fffff7fa3cf4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3cf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3cfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3d04:	54000121	b.ne	0xfffff7fa3d28  // b.any
   0x0000fffff7fa3d08:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3d0c:	f940366a	ldr	x10, [x19, #104]
   0x0000fffff7fa3d10:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3d14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3d18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d1c:	f9002669	str	x9, [x19, #72]
   0x0000fffff7fa3d20:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa3d24:	14000030	b	0xfffff7fa3de4
   0x0000fffff7fa3d28:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3d2c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3d30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3d38:	54000120	b.eq	0xfffff7fa3d5c  // b.none
   0x0000fffff7fa3d3c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3d40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3d44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3d4c:	54000321	b.ne	0xfffff7fa3db0  // b.any
   0x0000fffff7fa3d50:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3d54:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3d58:	14000002	b	0xfffff7fa3d60
   0x0000fffff7fa3d5c:	fd402660	ldr	d0, [x19, #72]
   0x0000fffff7fa3d60:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3d64:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3d68:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d6c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3d70:	54000120	b.eq	0xfffff7fa3d94  // b.none
   0x0000fffff7fa3d74:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3d78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3d7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3d80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3d84:	54000161	b.ne	0xfffff7fa3db0  // b.any
   0x0000fffff7fa3d88:	f9403669	ldr	x9, [x19, #104]
   0x0000fffff7fa3d8c:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3d90:	14000002	b	0xfffff7fa3d98
   0x0000fffff7fa3d94:	fd403661	ldr	d1, [x19, #104]
   0x0000fffff7fa3d98:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3d9c:	fd002660	str	d0, [x19, #72]
   0x0000fffff7fa3da0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3da4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3da8:	b900426a	str	w10, [x19, #64]
   0x0000fffff7fa3dac:	17ffffde	b	0xfffff7fa3d24
   0x0000fffff7fa3db0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3db4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3db8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3dbc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3dc0:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa3dc4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3dc8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3dcc:	d2929690	mov	x16, #0x94b4                	// #38068
   0x0000fffff7fa3dd0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3dd4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3dd8:	d63f0200	blr	x16
   0x0000fffff7fa3ddc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3de0:	54000fc0	b.eq	0xfffff7fa3fd8  // b.none
   0x0000fffff7fa3de4:	b9406269	ldr	w9, [x19, #96]
   0x0000fffff7fa3de8:	37d80269	tbnz	w9, #27, 0xfffff7fa3e34
   0x0000fffff7fa3dec:	b9405269	ldr	w9, [x19, #80]
   0x0000fffff7fa3df0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3df4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3df8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3dfc:	540001c1	b.ne	0xfffff7fa3e34  // b.any
   0x0000fffff7fa3e00:	f9402e69	ldr	x9, [x19, #88]
   0x0000fffff7fa3e04:	d280002a	mov	x10, #0x1                   	// #1
   0x0000fffff7fa3e08:	8b0a012b	add	x11, x9, x10
   0x0000fffff7fa3e0c:	f9003669	str	x9, [x19, #104]
   0x0000fffff7fa3e10:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3e14:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3e18:	b900626a	str	w10, [x19, #96]
   0x0000fffff7fa3e1c:	aa0b03e9	mov	x9, x11
   0x0000fffff7fa3e20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3e24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3e28:	f9002e69	str	x9, [x19, #88]
   0x0000fffff7fa3e2c:	b900526a	str	w10, [x19, #80]
   0x0000fffff7fa3e30:	1400000e	b	0xfffff7fa3e68
   0x0000fffff7fa3e34:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3e38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3e3c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3e40:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3e44:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa3e48:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3e4c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3e50:	d290bc10	mov	x16, #0x85e0                	// #34272
   0x0000fffff7fa3e54:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3e58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3e5c:	d63f0200	blr	x16
   0x0000fffff7fa3e60:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3e64:	54000be0	b.eq	0xfffff7fa3fe0  // b.none
   0x0000fffff7fa3e68:	17fff8d2	b	0xfffff7fa21b0
   0x0000fffff7fa3e6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3e70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3e74:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3e78:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3e7c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7fa3e80:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3e84:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3e88:	d286be90	mov	x16, #0x35f4                	// #13812
   0x0000fffff7fa3e8c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3e90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3e94:	d63f0200	blr	x16
   0x0000fffff7fa3e98:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa3e9c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa3ea0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa3ea4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa3ea8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa3eac:	d65f03c0	ret
   0x0000fffff7fa3eb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3eb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3eb8:	b900028a	str	w10, [x20]
   0x0000fffff7fa3ebc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa3ec0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa3ec4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa3ec8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa3ecc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa3ed0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa3ed4:	d65f03c0	ret
   0x0000fffff7fa3ed8:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa3edc:	17fffff5	b	0xfffff7fa3eb0
   0x0000fffff7fa3ee0:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa3ee4:	17fffff3	b	0xfffff7fa3eb0
   0x0000fffff7fa3ee8:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa3eec:	17fffff1	b	0xfffff7fa3eb0
   0x0000fffff7fa3ef0:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa3ef4:	17ffffef	b	0xfffff7fa3eb0
   0x0000fffff7fa3ef8:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa3efc:	17ffffed	b	0xfffff7fa3eb0
   0x0000fffff7fa3f00:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa3f04:	17ffffeb	b	0xfffff7fa3eb0
   0x0000fffff7fa3f08:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa3f0c:	17ffffe9	b	0xfffff7fa3eb0
   0x0000fffff7fa3f10:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa3f14:	17ffffe7	b	0xfffff7fa3eb0
   0x0000fffff7fa3f18:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa3f1c:	17ffffe5	b	0xfffff7fa3eb0
   0x0000fffff7fa3f20:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa3f24:	17ffffe3	b	0xfffff7fa3eb0
   0x0000fffff7fa3f28:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa3f2c:	17ffffe1	b	0xfffff7fa3eb0
   0x0000fffff7fa3f30:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa3f34:	17ffffdf	b	0xfffff7fa3eb0
   0x0000fffff7fa3f38:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa3f3c:	17ffffdd	b	0xfffff7fa3eb0
   0x0000fffff7fa3f40:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa3f44:	17ffffdb	b	0xfffff7fa3eb0
   0x0000fffff7fa3f48:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa3f4c:	17ffffd9	b	0xfffff7fa3eb0
   0x0000fffff7fa3f50:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa3f54:	17ffffd7	b	0xfffff7fa3eb0
   0x0000fffff7fa3f58:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa3f5c:	17ffffd5	b	0xfffff7fa3eb0
   0x0000fffff7fa3f60:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa3f64:	17ffffd3	b	0xfffff7fa3eb0
   0x0000fffff7fa3f68:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa3f6c:	17ffffd1	b	0xfffff7fa3eb0
   0x0000fffff7fa3f70:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa3f74:	17ffffcf	b	0xfffff7fa3eb0
   0x0000fffff7fa3f78:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa3f7c:	17ffffcd	b	0xfffff7fa3eb0
   0x0000fffff7fa3f80:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa3f84:	17ffffcb	b	0xfffff7fa3eb0
   0x0000fffff7fa3f88:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa3f8c:	17ffffc9	b	0xfffff7fa3eb0
   0x0000fffff7fa3f90:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa3f94:	17ffffc7	b	0xfffff7fa3eb0
   0x0000fffff7fa3f98:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa3f9c:	17ffffc5	b	0xfffff7fa3eb0
   0x0000fffff7fa3fa0:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa3fa4:	17ffffc3	b	0xfffff7fa3eb0
   0x0000fffff7fa3fa8:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa3fac:	17ffffc1	b	0xfffff7fa3eb0
   0x0000fffff7fa3fb0:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa3fb4:	17ffffbf	b	0xfffff7fa3eb0
   0x0000fffff7fa3fb8:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa3fbc:	17ffffbd	b	0xfffff7fa3eb0
   0x0000fffff7fa3fc0:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa3fc4:	17ffffbb	b	0xfffff7fa3eb0
   0x0000fffff7fa3fc8:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa3fcc:	17ffffb9	b	0xfffff7fa3eb0
   0x0000fffff7fa3fd0:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa3fd4:	17ffffb7	b	0xfffff7fa3eb0
   0x0000fffff7fa3fd8:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa3fdc:	17ffffb5	b	0xfffff7fa3eb0
   0x0000fffff7fa3fe0:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fa3fe4:	17ffffb3	b	0xfffff7fa3eb0
   0x0000fffff7fa3fe8:	00000000	udf	#0
   0x0000fffff7fa3fec:	00000000	udf	#0
   0x0000fffff7fa3ff0:	00000000	udf	#0
   0x0000fffff7fa3ff4:	00000000	udf	#0
   0x0000fffff7fa3ff8:	00000000	udf	#0
   0x0000fffff7fa3ffc:	00000000	udf	#0
End of assembler dump.
