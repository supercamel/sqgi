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
   0x0000fffff7fb2058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb205c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb2060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb2064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb2068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb206c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb2070:	36d801d1	tbz	w17, #27, 0xfffff7fb20a8
   0x0000fffff7fb2074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb207c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2080:	54000281	b.ne	0xfffff7fb20d0  // b.any
   0x0000fffff7fb2084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fb2088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb208c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb209c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb20a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb20a4:	54000169	b.ls	0xfffff7fb20d0  // b.plast
   0x0000fffff7fb20a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb20ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb20b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb20b4:	36d80091	tbz	w17, #27, 0xfffff7fb20c4
   0x0000fffff7fb20b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb20bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb20c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb20c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb20c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb20cc:	1400000e	b	0xfffff7fb2104
   0x0000fffff7fb20d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb20d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb20d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb20dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb20e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fb20e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb20e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb20ec:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb20f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb20f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb20f8:	d63f0200	blr	x16
   0x0000fffff7fb20fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2100:	5400d800	b.eq	0xfffff7fb3c00  // b.none
   0x0000fffff7fb2104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb2108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb210c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fb2110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb2114:	36d80211	tbz	w17, #27, 0xfffff7fb2154
   0x0000fffff7fb2118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb211c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2124:	540001e1	b.ne	0xfffff7fb2160  // b.any
   0x0000fffff7fb2128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb212c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb213c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2148:	540000c9	b.ls	0xfffff7fb2160  // b.plast
   0x0000fffff7fb214c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb215c:	1400000e	b	0xfffff7fb2194
   0x0000fffff7fb2160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2168:	aa1303e1	mov	x1, x19
   0x0000fffff7fb216c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fb2174:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2178:	aa1603e5	mov	x5, x22
   0x0000fffff7fb217c:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb2180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2188:	d63f0200	blr	x16
   0x0000fffff7fb218c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2190:	5400d3c0	b.eq	0xfffff7fb3c08  // b.none
   0x0000fffff7fb2194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb219c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb21a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb21a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb21a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb21ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb21b0:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb21b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb21b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb21bc:	d63f0200	blr	x16
   0x0000fffff7fb21c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb21c4:	5400d260	b.eq	0xfffff7fb3c10  // b.none
   0x0000fffff7fb21c8:	14000001	b	0xfffff7fb21cc
   0x0000fffff7fb21cc:	14000001	b	0xfffff7fb21d0
   0x0000fffff7fb21d0:	14000001	b	0xfffff7fb21d4
   0x0000fffff7fb21d4:	14000001	b	0xfffff7fb21d8
   0x0000fffff7fb21d8:	14000001	b	0xfffff7fb21dc
   0x0000fffff7fb21dc:	14000001	b	0xfffff7fb21e0
   0x0000fffff7fb21e0:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb21e4:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb21e8:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb21ec:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb21f0:	36d80211	tbz	w17, #27, 0xfffff7fb2230
   0x0000fffff7fb21f4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb21f8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb21fc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2200:	540001e1	b.ne	0xfffff7fb223c  // b.any
   0x0000fffff7fb2204:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2208:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb220c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2210:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2214:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2218:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb221c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2220:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2224:	540000c9	b.ls	0xfffff7fb223c  // b.plast
   0x0000fffff7fb2228:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb222c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2230:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2234:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2238:	1400000e	b	0xfffff7fb2270
   0x0000fffff7fb223c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2240:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2244:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2248:	aa1503e2	mov	x2, x21
   0x0000fffff7fb224c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb2250:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2254:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2258:	d2853610	mov	x16, #0x29b0                	// #10672
   0x0000fffff7fb225c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2260:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2264:	d63f0200	blr	x16
   0x0000fffff7fb2268:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb226c:	5400cd60	b.eq	0xfffff7fb3c18  // b.none
   0x0000fffff7fb2270:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2274:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2278:	aa1303e1	mov	x1, x19
   0x0000fffff7fb227c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2280:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb2284:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2288:	aa1603e5	mov	x5, x22
   0x0000fffff7fb228c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb2290:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2294:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2298:	d63f0200	blr	x16
   0x0000fffff7fb229c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb22a0:	5400cc00	b.eq	0xfffff7fb3c20  // b.none
   0x0000fffff7fb22a4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb22a8:	37d806a9	tbnz	w9, #27, 0xfffff7fb237c
   0x0000fffff7fb22ac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb22b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb22b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb22bc:	540001c1	b.ne	0xfffff7fb22f4  // b.any
   0x0000fffff7fb22c0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb22c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb22c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb22d0:	54000121	b.ne	0xfffff7fb22f4  // b.any
   0x0000fffff7fb22d4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb22d8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb22dc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb22e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb22e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22e8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb22ec:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb22f0:	14000030	b	0xfffff7fb23b0
   0x0000fffff7fb22f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb22f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb22fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2300:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2304:	54000120	b.eq	0xfffff7fb2328  // b.none
   0x0000fffff7fb2308:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb230c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2310:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2314:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2318:	54000321	b.ne	0xfffff7fb237c  // b.any
   0x0000fffff7fb231c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2320:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2324:	14000002	b	0xfffff7fb232c
   0x0000fffff7fb2328:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb232c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2330:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2338:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb233c:	54000120	b.eq	0xfffff7fb2360  // b.none
   0x0000fffff7fb2340:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2344:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2348:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb234c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2350:	54000161	b.ne	0xfffff7fb237c  // b.any
   0x0000fffff7fb2354:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2358:	9e620121	scvtf	d1, x9
   0x0000fffff7fb235c:	14000002	b	0xfffff7fb2364
   0x0000fffff7fb2360:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb2364:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2368:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb236c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2374:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb2378:	17ffffde	b	0xfffff7fb22f0
   0x0000fffff7fb237c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2380:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2384:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2388:	aa1503e2	mov	x2, x21
   0x0000fffff7fb238c:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb2390:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2394:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2398:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb239c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb23a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb23a4:	d63f0200	blr	x16
   0x0000fffff7fb23a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb23ac:	5400c3e0	b.eq	0xfffff7fb3c28  // b.none
   0x0000fffff7fb23b0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb23b4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb23b8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb23bc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb23c0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb23c4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb23c8:	36d801d1	tbz	w17, #27, 0xfffff7fb2400
   0x0000fffff7fb23cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb23d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb23d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb23d8:	54000281	b.ne	0xfffff7fb2428  // b.any
   0x0000fffff7fb23dc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb23e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb23e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb23e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb23ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb23f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb23f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb23f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb23fc:	54000169	b.ls	0xfffff7fb2428  // b.plast
   0x0000fffff7fb2400:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2404:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2408:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb240c:	36d80091	tbz	w17, #27, 0xfffff7fb241c
   0x0000fffff7fb2410:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2414:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2418:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb241c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb2420:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb2424:	1400000e	b	0xfffff7fb245c
   0x0000fffff7fb2428:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb242c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2430:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2434:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2438:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb243c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2440:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2444:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb2448:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb244c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2450:	d63f0200	blr	x16
   0x0000fffff7fb2454:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2458:	5400bec0	b.eq	0xfffff7fb3c30  // b.none
   0x0000fffff7fb245c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2460:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2464:	540003a0	b.eq	0xfffff7fb24d8  // b.none
   0x0000fffff7fb2468:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb246c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb2470:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2474:	36d801d1	tbz	w17, #27, 0xfffff7fb24ac
   0x0000fffff7fb2478:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb247c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2480:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2484:	540002a1	b.ne	0xfffff7fb24d8  // b.any
   0x0000fffff7fb2488:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb248c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2490:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2494:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2498:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb249c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb24a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb24a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb24a8:	54000189	b.ls	0xfffff7fb24d8  // b.plast
   0x0000fffff7fb24ac:	36d8008d	tbz	w13, #27, 0xfffff7fb24bc
   0x0000fffff7fb24b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb24b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb24b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb24bc:	36d80091	tbz	w17, #27, 0xfffff7fb24cc
   0x0000fffff7fb24c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb24c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb24c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb24cc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb24d0:	b900016d	str	w13, [x11]
   0x0000fffff7fb24d4:	1400000e	b	0xfffff7fb250c
   0x0000fffff7fb24d8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb24dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb24e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb24e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb24e8:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb24ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fb24f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb24f4:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb24f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb24fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2500:	d63f0200	blr	x16
   0x0000fffff7fb2504:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2508:	5400b980	b.eq	0xfffff7fb3c38  // b.none
   0x0000fffff7fb250c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2510:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2514:	540004a0	b.eq	0xfffff7fb25a8  // b.none
   0x0000fffff7fb2518:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb251c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2520:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2524:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2528:	54000400	b.eq	0xfffff7fb25a8  // b.none
   0x0000fffff7fb252c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2530:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2534:	36d801d1	tbz	w17, #27, 0xfffff7fb256c
   0x0000fffff7fb2538:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb253c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2540:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2544:	54000321	b.ne	0xfffff7fb25a8  // b.any
   0x0000fffff7fb2548:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb254c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2550:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2554:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2558:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb255c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2560:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2564:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2568:	54000209	b.ls	0xfffff7fb25a8  // b.plast
   0x0000fffff7fb256c:	36d8008d	tbz	w13, #27, 0xfffff7fb257c
   0x0000fffff7fb2570:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2574:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2578:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb257c:	36d80091	tbz	w17, #27, 0xfffff7fb258c
   0x0000fffff7fb2580:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2584:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2588:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb258c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb2590:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb2594:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2598:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb259c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb25a0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb25a4:	1400000e	b	0xfffff7fb25dc
   0x0000fffff7fb25a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb25ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb25b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb25b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb25b8:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb25bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb25c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb25c4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb25c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb25cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb25d0:	d63f0200	blr	x16
   0x0000fffff7fb25d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb25d8:	5400b340	b.eq	0xfffff7fb3c40  // b.none
   0x0000fffff7fb25dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb25e0:	37d806a9	tbnz	w9, #27, 0xfffff7fb26b4
   0x0000fffff7fb25e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb25e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb25ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb25f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb25f4:	540001c1	b.ne	0xfffff7fb262c  // b.any
   0x0000fffff7fb25f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb25fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2608:	54000121	b.ne	0xfffff7fb262c  // b.any
   0x0000fffff7fb260c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2610:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb2614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb261c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2620:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb2624:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb2628:	14000030	b	0xfffff7fb26e8
   0x0000fffff7fb262c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2630:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb263c:	54000120	b.eq	0xfffff7fb2660  // b.none
   0x0000fffff7fb2640:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb264c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2650:	54000321	b.ne	0xfffff7fb26b4  // b.any
   0x0000fffff7fb2654:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2658:	9e620120	scvtf	d0, x9
   0x0000fffff7fb265c:	14000002	b	0xfffff7fb2664
   0x0000fffff7fb2660:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb2664:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2668:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb266c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2674:	54000120	b.eq	0xfffff7fb2698  // b.none
   0x0000fffff7fb2678:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb267c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2688:	54000161	b.ne	0xfffff7fb26b4  // b.any
   0x0000fffff7fb268c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2690:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2694:	14000002	b	0xfffff7fb269c
   0x0000fffff7fb2698:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb269c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb26a0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb26a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb26a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb26ac:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb26b0:	17ffffde	b	0xfffff7fb2628
   0x0000fffff7fb26b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb26b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb26bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb26c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb26c4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb26c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb26cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb26d0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb26d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb26d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb26dc:	d63f0200	blr	x16
   0x0000fffff7fb26e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb26e4:	5400ab20	b.eq	0xfffff7fb3c48  // b.none
   0x0000fffff7fb26e8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb26ec:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb26f0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb26f4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb26f8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb26fc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb2700:	36d801d1	tbz	w17, #27, 0xfffff7fb2738
   0x0000fffff7fb2704:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2708:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb270c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2710:	54000281	b.ne	0xfffff7fb2760  // b.any
   0x0000fffff7fb2714:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb2718:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb271c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2720:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2724:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2728:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb272c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2730:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2734:	54000169	b.ls	0xfffff7fb2760  // b.plast
   0x0000fffff7fb2738:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb273c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2740:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2744:	36d80091	tbz	w17, #27, 0xfffff7fb2754
   0x0000fffff7fb2748:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb274c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2750:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2754:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb2758:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb275c:	1400000e	b	0xfffff7fb2794
   0x0000fffff7fb2760:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2764:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2768:	aa1303e1	mov	x1, x19
   0x0000fffff7fb276c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2770:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb2774:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2778:	aa1603e5	mov	x5, x22
   0x0000fffff7fb277c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb2780:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2784:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2788:	d63f0200	blr	x16
   0x0000fffff7fb278c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2790:	5400a600	b.eq	0xfffff7fb3c50  // b.none
   0x0000fffff7fb2794:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2798:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb279c:	540003a0	b.eq	0xfffff7fb2810  // b.none
   0x0000fffff7fb27a0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb27a4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb27a8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb27ac:	36d801d1	tbz	w17, #27, 0xfffff7fb27e4
   0x0000fffff7fb27b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb27b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb27b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb27bc:	540002a1	b.ne	0xfffff7fb2810  // b.any
   0x0000fffff7fb27c0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb27c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb27c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb27cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb27d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb27d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb27d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb27dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb27e0:	54000189	b.ls	0xfffff7fb2810  // b.plast
   0x0000fffff7fb27e4:	36d8008d	tbz	w13, #27, 0xfffff7fb27f4
   0x0000fffff7fb27e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb27ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb27f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb27f4:	36d80091	tbz	w17, #27, 0xfffff7fb2804
   0x0000fffff7fb27f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb27fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2800:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2804:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2808:	b900016d	str	w13, [x11]
   0x0000fffff7fb280c:	1400000e	b	0xfffff7fb2844
   0x0000fffff7fb2810:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2818:	aa1303e1	mov	x1, x19
   0x0000fffff7fb281c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2820:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb2824:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2828:	aa1603e5	mov	x5, x22
   0x0000fffff7fb282c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb2830:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2838:	d63f0200	blr	x16
   0x0000fffff7fb283c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2840:	5400a0c0	b.eq	0xfffff7fb3c58  // b.none
   0x0000fffff7fb2844:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2848:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb284c:	540004a0	b.eq	0xfffff7fb28e0  // b.none
   0x0000fffff7fb2850:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2854:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2858:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb285c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2860:	54000400	b.eq	0xfffff7fb28e0  // b.none
   0x0000fffff7fb2864:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2868:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb286c:	36d801d1	tbz	w17, #27, 0xfffff7fb28a4
   0x0000fffff7fb2870:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2874:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2878:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb287c:	54000321	b.ne	0xfffff7fb28e0  // b.any
   0x0000fffff7fb2880:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2884:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2888:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb288c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2890:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2894:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2898:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb289c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb28a0:	54000209	b.ls	0xfffff7fb28e0  // b.plast
   0x0000fffff7fb28a4:	36d8008d	tbz	w13, #27, 0xfffff7fb28b4
   0x0000fffff7fb28a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb28ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb28b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb28b4:	36d80091	tbz	w17, #27, 0xfffff7fb28c4
   0x0000fffff7fb28b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb28bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb28c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb28c4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb28c8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb28cc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb28d0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb28d4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb28d8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb28dc:	1400000e	b	0xfffff7fb2914
   0x0000fffff7fb28e0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb28e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb28e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb28ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fb28f0:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb28f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb28f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb28fc:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb2900:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2908:	d63f0200	blr	x16
   0x0000fffff7fb290c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2910:	54009a80	b.eq	0xfffff7fb3c60  // b.none
   0x0000fffff7fb2914:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2918:	37d806a9	tbnz	w9, #27, 0xfffff7fb29ec
   0x0000fffff7fb291c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2920:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2928:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb292c:	540001c1	b.ne	0xfffff7fb2964  // b.any
   0x0000fffff7fb2930:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb293c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2940:	54000121	b.ne	0xfffff7fb2964  // b.any
   0x0000fffff7fb2944:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2948:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb294c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2958:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb295c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb2960:	14000030	b	0xfffff7fb2a20
   0x0000fffff7fb2964:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2968:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb296c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2970:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2974:	54000120	b.eq	0xfffff7fb2998  // b.none
   0x0000fffff7fb2978:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb297c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2984:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2988:	54000321	b.ne	0xfffff7fb29ec  // b.any
   0x0000fffff7fb298c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2990:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2994:	14000002	b	0xfffff7fb299c
   0x0000fffff7fb2998:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb299c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb29a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb29a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb29a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb29ac:	54000120	b.eq	0xfffff7fb29d0  // b.none
   0x0000fffff7fb29b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb29b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb29b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb29bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb29c0:	54000161	b.ne	0xfffff7fb29ec  // b.any
   0x0000fffff7fb29c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb29c8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb29cc:	14000002	b	0xfffff7fb29d4
   0x0000fffff7fb29d0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb29d4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb29d8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb29dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb29e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb29e4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb29e8:	17ffffde	b	0xfffff7fb2960
   0x0000fffff7fb29ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb29f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb29f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb29f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb29fc:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb2a00:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2a04:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2a08:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb2a0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2a10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2a14:	d63f0200	blr	x16
   0x0000fffff7fb2a18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2a1c:	54009260	b.eq	0xfffff7fb3c68  // b.none
   0x0000fffff7fb2a20:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb2a24:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb2a28:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb2a2c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb2a30:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb2a34:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb2a38:	36d801d1	tbz	w17, #27, 0xfffff7fb2a70
   0x0000fffff7fb2a3c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2a40:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2a44:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2a48:	54000281	b.ne	0xfffff7fb2a98  // b.any
   0x0000fffff7fb2a4c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb2a50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2a54:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2a58:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2a5c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2a60:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2a64:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2a68:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2a6c:	54000169	b.ls	0xfffff7fb2a98  // b.plast
   0x0000fffff7fb2a70:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2a74:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2a78:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2a7c:	36d80091	tbz	w17, #27, 0xfffff7fb2a8c
   0x0000fffff7fb2a80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2a84:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2a88:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2a8c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb2a90:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb2a94:	1400000e	b	0xfffff7fb2acc
   0x0000fffff7fb2a98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2a9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2aa0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2aa4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2aa8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb2aac:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2ab0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2ab4:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb2ab8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2abc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2ac0:	d63f0200	blr	x16
   0x0000fffff7fb2ac4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2ac8:	54008d40	b.eq	0xfffff7fb3c70  // b.none
   0x0000fffff7fb2acc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2ad0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2ad4:	540003a0	b.eq	0xfffff7fb2b48  // b.none
   0x0000fffff7fb2ad8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb2adc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb2ae0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2ae4:	36d801d1	tbz	w17, #27, 0xfffff7fb2b1c
   0x0000fffff7fb2ae8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2aec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2af0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2af4:	540002a1	b.ne	0xfffff7fb2b48  // b.any
   0x0000fffff7fb2af8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb2afc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2b00:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2b04:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2b08:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2b0c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2b10:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2b14:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2b18:	54000189	b.ls	0xfffff7fb2b48  // b.plast
   0x0000fffff7fb2b1c:	36d8008d	tbz	w13, #27, 0xfffff7fb2b2c
   0x0000fffff7fb2b20:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2b24:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2b28:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2b2c:	36d80091	tbz	w17, #27, 0xfffff7fb2b3c
   0x0000fffff7fb2b30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2b34:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2b38:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2b3c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2b40:	b900016d	str	w13, [x11]
   0x0000fffff7fb2b44:	1400000e	b	0xfffff7fb2b7c
   0x0000fffff7fb2b48:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2b4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2b50:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2b54:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2b58:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb2b5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2b60:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2b64:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb2b68:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2b6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2b70:	d63f0200	blr	x16
   0x0000fffff7fb2b74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2b78:	54008800	b.eq	0xfffff7fb3c78  // b.none
   0x0000fffff7fb2b7c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2b80:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2b84:	540004a0	b.eq	0xfffff7fb2c18  // b.none
   0x0000fffff7fb2b88:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2b8c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2b90:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2b94:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2b98:	54000400	b.eq	0xfffff7fb2c18  // b.none
   0x0000fffff7fb2b9c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2ba0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2ba4:	36d801d1	tbz	w17, #27, 0xfffff7fb2bdc
   0x0000fffff7fb2ba8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2bac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2bb0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2bb4:	54000321	b.ne	0xfffff7fb2c18  // b.any
   0x0000fffff7fb2bb8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2bbc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2bc0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2bc4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2bc8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2bcc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2bd0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2bd4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2bd8:	54000209	b.ls	0xfffff7fb2c18  // b.plast
   0x0000fffff7fb2bdc:	36d8008d	tbz	w13, #27, 0xfffff7fb2bec
   0x0000fffff7fb2be0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2be4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2be8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2bec:	36d80091	tbz	w17, #27, 0xfffff7fb2bfc
   0x0000fffff7fb2bf0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2bf4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2bf8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2bfc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb2c00:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb2c04:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2c08:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2c0c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb2c10:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb2c14:	1400000e	b	0xfffff7fb2c4c
   0x0000fffff7fb2c18:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2c1c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2c20:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2c24:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2c28:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb2c2c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2c30:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2c34:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb2c38:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2c3c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2c40:	d63f0200	blr	x16
   0x0000fffff7fb2c44:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2c48:	540081c0	b.eq	0xfffff7fb3c80  // b.none
   0x0000fffff7fb2c4c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2c50:	37d806a9	tbnz	w9, #27, 0xfffff7fb2d24
   0x0000fffff7fb2c54:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2c58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c60:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c64:	540001c1	b.ne	0xfffff7fb2c9c  // b.any
   0x0000fffff7fb2c68:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2c6c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c70:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c74:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c78:	54000121	b.ne	0xfffff7fb2c9c  // b.any
   0x0000fffff7fb2c7c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2c80:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb2c84:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2c88:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c90:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb2c94:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb2c98:	14000030	b	0xfffff7fb2d58
   0x0000fffff7fb2c9c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2ca0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2ca4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ca8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2cac:	54000120	b.eq	0xfffff7fb2cd0  // b.none
   0x0000fffff7fb2cb0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2cb4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2cb8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2cbc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2cc0:	54000321	b.ne	0xfffff7fb2d24  // b.any
   0x0000fffff7fb2cc4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2cc8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2ccc:	14000002	b	0xfffff7fb2cd4
   0x0000fffff7fb2cd0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb2cd4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2cd8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2cdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ce0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2ce4:	54000120	b.eq	0xfffff7fb2d08  // b.none
   0x0000fffff7fb2ce8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2cec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2cf0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2cf4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2cf8:	54000161	b.ne	0xfffff7fb2d24  // b.any
   0x0000fffff7fb2cfc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb2d00:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2d04:	14000002	b	0xfffff7fb2d0c
   0x0000fffff7fb2d08:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb2d0c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2d10:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb2d14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2d18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2d1c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb2d20:	17ffffde	b	0xfffff7fb2c98
   0x0000fffff7fb2d24:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2d28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2d2c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2d30:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2d34:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb2d38:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2d3c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2d40:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb2d44:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2d48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2d4c:	d63f0200	blr	x16
   0x0000fffff7fb2d50:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2d54:	540079a0	b.eq	0xfffff7fb3c88  // b.none
   0x0000fffff7fb2d58:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb2d5c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb2d60:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb2d64:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb2d68:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb2d6c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb2d70:	36d801d1	tbz	w17, #27, 0xfffff7fb2da8
   0x0000fffff7fb2d74:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2d78:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2d7c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2d80:	54000281	b.ne	0xfffff7fb2dd0  // b.any
   0x0000fffff7fb2d84:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb2d88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2d8c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2d90:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2d94:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2d98:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2d9c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2da0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2da4:	54000169	b.ls	0xfffff7fb2dd0  // b.plast
   0x0000fffff7fb2da8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2dac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2db0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2db4:	36d80091	tbz	w17, #27, 0xfffff7fb2dc4
   0x0000fffff7fb2db8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2dbc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2dc0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2dc4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb2dc8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb2dcc:	1400000e	b	0xfffff7fb2e04
   0x0000fffff7fb2dd0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2dd4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2dd8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2ddc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2de0:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb2de4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2de8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2dec:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb2df0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2df4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2df8:	d63f0200	blr	x16
   0x0000fffff7fb2dfc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2e00:	54007480	b.eq	0xfffff7fb3c90  // b.none
   0x0000fffff7fb2e04:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2e08:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2e0c:	540003a0	b.eq	0xfffff7fb2e80  // b.none
   0x0000fffff7fb2e10:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb2e14:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb2e18:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2e1c:	36d801d1	tbz	w17, #27, 0xfffff7fb2e54
   0x0000fffff7fb2e20:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2e24:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2e28:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2e2c:	540002a1	b.ne	0xfffff7fb2e80  // b.any
   0x0000fffff7fb2e30:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb2e34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2e38:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2e3c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2e40:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2e44:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2e48:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2e4c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2e50:	54000189	b.ls	0xfffff7fb2e80  // b.plast
   0x0000fffff7fb2e54:	36d8008d	tbz	w13, #27, 0xfffff7fb2e64
   0x0000fffff7fb2e58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2e5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2e60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2e64:	36d80091	tbz	w17, #27, 0xfffff7fb2e74
   0x0000fffff7fb2e68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2e6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2e70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2e74:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2e78:	b900016d	str	w13, [x11]
   0x0000fffff7fb2e7c:	1400000e	b	0xfffff7fb2eb4
   0x0000fffff7fb2e80:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2e84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2e88:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2e8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2e90:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb2e94:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2e98:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2e9c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb2ea0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2ea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2ea8:	d63f0200	blr	x16
   0x0000fffff7fb2eac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2eb0:	54006f40	b.eq	0xfffff7fb3c98  // b.none
   0x0000fffff7fb2eb4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2eb8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2ebc:	540004a0	b.eq	0xfffff7fb2f50  // b.none
   0x0000fffff7fb2ec0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2ec4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2ec8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2ecc:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2ed0:	54000400	b.eq	0xfffff7fb2f50  // b.none
   0x0000fffff7fb2ed4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2ed8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2edc:	36d801d1	tbz	w17, #27, 0xfffff7fb2f14
   0x0000fffff7fb2ee0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2ee4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2ee8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2eec:	54000321	b.ne	0xfffff7fb2f50  // b.any
   0x0000fffff7fb2ef0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2ef4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2ef8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2efc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2f00:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2f04:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2f08:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2f0c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2f10:	54000209	b.ls	0xfffff7fb2f50  // b.plast
   0x0000fffff7fb2f14:	36d8008d	tbz	w13, #27, 0xfffff7fb2f24
   0x0000fffff7fb2f18:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2f1c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2f20:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2f24:	36d80091	tbz	w17, #27, 0xfffff7fb2f34
   0x0000fffff7fb2f28:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2f2c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2f30:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2f34:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb2f38:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb2f3c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2f40:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2f44:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb2f48:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb2f4c:	1400000e	b	0xfffff7fb2f84
   0x0000fffff7fb2f50:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2f54:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2f58:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2f5c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2f60:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb2f64:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2f68:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2f6c:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb2f70:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2f74:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2f78:	d63f0200	blr	x16
   0x0000fffff7fb2f7c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2f80:	54006900	b.eq	0xfffff7fb3ca0  // b.none
   0x0000fffff7fb2f84:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2f88:	37d806a9	tbnz	w9, #27, 0xfffff7fb305c
   0x0000fffff7fb2f8c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2f90:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2f94:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2f98:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2f9c:	540001c1	b.ne	0xfffff7fb2fd4  // b.any
   0x0000fffff7fb2fa0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb2fa4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2fa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2fac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2fb0:	54000121	b.ne	0xfffff7fb2fd4  // b.any
   0x0000fffff7fb2fb4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2fb8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb2fbc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2fc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2fc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2fc8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb2fcc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb2fd0:	14000030	b	0xfffff7fb3090
   0x0000fffff7fb2fd4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2fd8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2fdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2fe0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2fe4:	54000120	b.eq	0xfffff7fb3008  // b.none
   0x0000fffff7fb2fe8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2fec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2ff0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ff4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2ff8:	54000321	b.ne	0xfffff7fb305c  // b.any
   0x0000fffff7fb2ffc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3000:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3004:	14000002	b	0xfffff7fb300c
   0x0000fffff7fb3008:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb300c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3010:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3014:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3018:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb301c:	54000120	b.eq	0xfffff7fb3040  // b.none
   0x0000fffff7fb3020:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3024:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3028:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb302c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3030:	54000161	b.ne	0xfffff7fb305c  // b.any
   0x0000fffff7fb3034:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb3038:	9e620121	scvtf	d1, x9
   0x0000fffff7fb303c:	14000002	b	0xfffff7fb3044
   0x0000fffff7fb3040:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb3044:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3048:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb304c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3050:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3054:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb3058:	17ffffde	b	0xfffff7fb2fd0
   0x0000fffff7fb305c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3060:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3064:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3068:	aa1503e2	mov	x2, x21
   0x0000fffff7fb306c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb3070:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3074:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3078:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb307c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3080:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3084:	d63f0200	blr	x16
   0x0000fffff7fb3088:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb308c:	540060e0	b.eq	0xfffff7fb3ca8  // b.none
   0x0000fffff7fb3090:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb3094:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb3098:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb309c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb30a0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb30a4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb30a8:	36d801d1	tbz	w17, #27, 0xfffff7fb30e0
   0x0000fffff7fb30ac:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb30b0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb30b4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb30b8:	54000281	b.ne	0xfffff7fb3108  // b.any
   0x0000fffff7fb30bc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb30c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb30c4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb30c8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb30cc:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb30d0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb30d4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb30d8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb30dc:	54000169	b.ls	0xfffff7fb3108  // b.plast
   0x0000fffff7fb30e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb30e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb30e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb30ec:	36d80091	tbz	w17, #27, 0xfffff7fb30fc
   0x0000fffff7fb30f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb30f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb30f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb30fc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb3100:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb3104:	1400000e	b	0xfffff7fb313c
   0x0000fffff7fb3108:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb310c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3110:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3114:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3118:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb311c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3120:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3124:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb3128:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb312c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3130:	d63f0200	blr	x16
   0x0000fffff7fb3134:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3138:	54005bc0	b.eq	0xfffff7fb3cb0  // b.none
   0x0000fffff7fb313c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3140:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3144:	540003a0	b.eq	0xfffff7fb31b8  // b.none
   0x0000fffff7fb3148:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb314c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb3150:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb3154:	36d801d1	tbz	w17, #27, 0xfffff7fb318c
   0x0000fffff7fb3158:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb315c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3160:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3164:	540002a1	b.ne	0xfffff7fb31b8  // b.any
   0x0000fffff7fb3168:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb316c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3170:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3174:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3178:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb317c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3180:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3184:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3188:	54000189	b.ls	0xfffff7fb31b8  // b.plast
   0x0000fffff7fb318c:	36d8008d	tbz	w13, #27, 0xfffff7fb319c
   0x0000fffff7fb3190:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3194:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3198:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb319c:	36d80091	tbz	w17, #27, 0xfffff7fb31ac
   0x0000fffff7fb31a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb31a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb31a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb31ac:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb31b0:	b900016d	str	w13, [x11]
   0x0000fffff7fb31b4:	1400000e	b	0xfffff7fb31ec
   0x0000fffff7fb31b8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb31bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb31c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb31c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb31c8:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb31cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb31d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb31d4:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb31d8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb31dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb31e0:	d63f0200	blr	x16
   0x0000fffff7fb31e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb31e8:	54005680	b.eq	0xfffff7fb3cb8  // b.none
   0x0000fffff7fb31ec:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb31f0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb31f4:	540004a0	b.eq	0xfffff7fb3288  // b.none
   0x0000fffff7fb31f8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb31fc:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3200:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb3204:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3208:	54000400	b.eq	0xfffff7fb3288  // b.none
   0x0000fffff7fb320c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3210:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb3214:	36d801d1	tbz	w17, #27, 0xfffff7fb324c
   0x0000fffff7fb3218:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb321c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3220:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3224:	54000321	b.ne	0xfffff7fb3288  // b.any
   0x0000fffff7fb3228:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb322c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3230:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3234:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3238:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb323c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3240:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3244:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3248:	54000209	b.ls	0xfffff7fb3288  // b.plast
   0x0000fffff7fb324c:	36d8008d	tbz	w13, #27, 0xfffff7fb325c
   0x0000fffff7fb3250:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3254:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3258:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb325c:	36d80091	tbz	w17, #27, 0xfffff7fb326c
   0x0000fffff7fb3260:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3264:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3268:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb326c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb3270:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb3274:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3278:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb327c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb3280:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb3284:	1400000e	b	0xfffff7fb32bc
   0x0000fffff7fb3288:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb328c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3290:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3294:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3298:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb329c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb32a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb32a4:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb32a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb32ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb32b0:	d63f0200	blr	x16
   0x0000fffff7fb32b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb32b8:	54005040	b.eq	0xfffff7fb3cc0  // b.none
   0x0000fffff7fb32bc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb32c0:	37d806a9	tbnz	w9, #27, 0xfffff7fb3394
   0x0000fffff7fb32c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb32c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb32cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb32d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb32d4:	540001c1	b.ne	0xfffff7fb330c  // b.any
   0x0000fffff7fb32d8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb32dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb32e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb32e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb32e8:	54000121	b.ne	0xfffff7fb330c  // b.any
   0x0000fffff7fb32ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb32f0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb32f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb32f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb32fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3300:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb3304:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb3308:	14000030	b	0xfffff7fb33c8
   0x0000fffff7fb330c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3310:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3314:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3318:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb331c:	54000120	b.eq	0xfffff7fb3340  // b.none
   0x0000fffff7fb3320:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3324:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3328:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb332c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3330:	54000321	b.ne	0xfffff7fb3394  // b.any
   0x0000fffff7fb3334:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3338:	9e620120	scvtf	d0, x9
   0x0000fffff7fb333c:	14000002	b	0xfffff7fb3344
   0x0000fffff7fb3340:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb3344:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3348:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb334c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3350:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3354:	54000120	b.eq	0xfffff7fb3378  // b.none
   0x0000fffff7fb3358:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb335c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3360:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3364:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3368:	54000161	b.ne	0xfffff7fb3394  // b.any
   0x0000fffff7fb336c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb3370:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3374:	14000002	b	0xfffff7fb337c
   0x0000fffff7fb3378:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb337c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3380:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb3384:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3388:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb338c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb3390:	17ffffde	b	0xfffff7fb3308
   0x0000fffff7fb3394:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3398:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb339c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb33a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb33a4:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb33a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb33ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb33b0:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb33b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb33b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb33bc:	d63f0200	blr	x16
   0x0000fffff7fb33c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb33c4:	54004820	b.eq	0xfffff7fb3cc8  // b.none
   0x0000fffff7fb33c8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb33cc:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb33d0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb33d4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb33d8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb33dc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb33e0:	36d801d1	tbz	w17, #27, 0xfffff7fb3418
   0x0000fffff7fb33e4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb33e8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb33ec:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb33f0:	54000281	b.ne	0xfffff7fb3440  // b.any
   0x0000fffff7fb33f4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb33f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb33fc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3400:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3404:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3408:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb340c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3410:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3414:	54000169	b.ls	0xfffff7fb3440  // b.plast
   0x0000fffff7fb3418:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb341c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3420:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3424:	36d80091	tbz	w17, #27, 0xfffff7fb3434
   0x0000fffff7fb3428:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb342c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3430:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3434:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb3438:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb343c:	1400000e	b	0xfffff7fb3474
   0x0000fffff7fb3440:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3444:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3448:	aa1303e1	mov	x1, x19
   0x0000fffff7fb344c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3450:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb3454:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3458:	aa1603e5	mov	x5, x22
   0x0000fffff7fb345c:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb3460:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3464:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3468:	d63f0200	blr	x16
   0x0000fffff7fb346c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3470:	54004300	b.eq	0xfffff7fb3cd0  // b.none
   0x0000fffff7fb3474:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3478:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb347c:	540003a0	b.eq	0xfffff7fb34f0  // b.none
   0x0000fffff7fb3480:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb3484:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb3488:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb348c:	36d801d1	tbz	w17, #27, 0xfffff7fb34c4
   0x0000fffff7fb3490:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3494:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3498:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb349c:	540002a1	b.ne	0xfffff7fb34f0  // b.any
   0x0000fffff7fb34a0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb34a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb34a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb34ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb34b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb34b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb34b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb34bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb34c0:	54000189	b.ls	0xfffff7fb34f0  // b.plast
   0x0000fffff7fb34c4:	36d8008d	tbz	w13, #27, 0xfffff7fb34d4
   0x0000fffff7fb34c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb34cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb34d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb34d4:	36d80091	tbz	w17, #27, 0xfffff7fb34e4
   0x0000fffff7fb34d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb34dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb34e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb34e4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb34e8:	b900016d	str	w13, [x11]
   0x0000fffff7fb34ec:	1400000e	b	0xfffff7fb3524
   0x0000fffff7fb34f0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb34f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb34f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb34fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3500:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb3504:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3508:	aa1603e5	mov	x5, x22
   0x0000fffff7fb350c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb3510:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3514:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3518:	d63f0200	blr	x16
   0x0000fffff7fb351c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3520:	54003dc0	b.eq	0xfffff7fb3cd8  // b.none
   0x0000fffff7fb3524:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3528:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb352c:	540004a0	b.eq	0xfffff7fb35c0  // b.none
   0x0000fffff7fb3530:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb3534:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3538:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb353c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3540:	54000400	b.eq	0xfffff7fb35c0  // b.none
   0x0000fffff7fb3544:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3548:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb354c:	36d801d1	tbz	w17, #27, 0xfffff7fb3584
   0x0000fffff7fb3550:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3554:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3558:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb355c:	54000321	b.ne	0xfffff7fb35c0  // b.any
   0x0000fffff7fb3560:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3564:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3568:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb356c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3570:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3574:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3578:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb357c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3580:	54000209	b.ls	0xfffff7fb35c0  // b.plast
   0x0000fffff7fb3584:	36d8008d	tbz	w13, #27, 0xfffff7fb3594
   0x0000fffff7fb3588:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb358c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3590:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3594:	36d80091	tbz	w17, #27, 0xfffff7fb35a4
   0x0000fffff7fb3598:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb359c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb35a0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb35a4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb35a8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb35ac:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb35b0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb35b4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb35b8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb35bc:	1400000e	b	0xfffff7fb35f4
   0x0000fffff7fb35c0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb35c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb35c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb35cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb35d0:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb35d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb35d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb35dc:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb35e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb35e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb35e8:	d63f0200	blr	x16
   0x0000fffff7fb35ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb35f0:	54003780	b.eq	0xfffff7fb3ce0  // b.none
   0x0000fffff7fb35f4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb35f8:	37d806a9	tbnz	w9, #27, 0xfffff7fb36cc
   0x0000fffff7fb35fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3608:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb360c:	540001c1	b.ne	0xfffff7fb3644  // b.any
   0x0000fffff7fb3610:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3614:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3618:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb361c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3620:	54000121	b.ne	0xfffff7fb3644  // b.any
   0x0000fffff7fb3624:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3628:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb362c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3630:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3638:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb363c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb3640:	14000030	b	0xfffff7fb3700
   0x0000fffff7fb3644:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3648:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb364c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3650:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3654:	54000120	b.eq	0xfffff7fb3678  // b.none
   0x0000fffff7fb3658:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb365c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3660:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3664:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3668:	54000321	b.ne	0xfffff7fb36cc  // b.any
   0x0000fffff7fb366c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3670:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3674:	14000002	b	0xfffff7fb367c
   0x0000fffff7fb3678:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb367c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3680:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3684:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3688:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb368c:	54000120	b.eq	0xfffff7fb36b0  // b.none
   0x0000fffff7fb3690:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb3694:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3698:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb369c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb36a0:	54000161	b.ne	0xfffff7fb36cc  // b.any
   0x0000fffff7fb36a4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb36a8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb36ac:	14000002	b	0xfffff7fb36b4
   0x0000fffff7fb36b0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb36b4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb36b8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb36bc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb36c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb36c4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb36c8:	17ffffde	b	0xfffff7fb3640
   0x0000fffff7fb36cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb36d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb36d4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb36d8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb36dc:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb36e0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb36e4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb36e8:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb36ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb36f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb36f4:	d63f0200	blr	x16
   0x0000fffff7fb36f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb36fc:	54002f60	b.eq	0xfffff7fb3ce8  // b.none
   0x0000fffff7fb3700:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb3704:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb3708:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb370c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb3710:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb3714:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb3718:	36d801d1	tbz	w17, #27, 0xfffff7fb3750
   0x0000fffff7fb371c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3720:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3724:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3728:	54000281	b.ne	0xfffff7fb3778  // b.any
   0x0000fffff7fb372c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb3730:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3734:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3738:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb373c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3740:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3744:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3748:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb374c:	54000169	b.ls	0xfffff7fb3778  // b.plast
   0x0000fffff7fb3750:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3754:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3758:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb375c:	36d80091	tbz	w17, #27, 0xfffff7fb376c
   0x0000fffff7fb3760:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3764:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3768:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb376c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb3770:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb3774:	1400000e	b	0xfffff7fb37ac
   0x0000fffff7fb3778:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb377c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3780:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3784:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3788:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb378c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3790:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3794:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb3798:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb379c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb37a0:	d63f0200	blr	x16
   0x0000fffff7fb37a4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb37a8:	54002a40	b.eq	0xfffff7fb3cf0  // b.none
   0x0000fffff7fb37ac:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb37b0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb37b4:	540003a0	b.eq	0xfffff7fb3828  // b.none
   0x0000fffff7fb37b8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb37bc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb37c0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb37c4:	36d801d1	tbz	w17, #27, 0xfffff7fb37fc
   0x0000fffff7fb37c8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb37cc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb37d0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb37d4:	540002a1	b.ne	0xfffff7fb3828  // b.any
   0x0000fffff7fb37d8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb37dc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb37e0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb37e4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb37e8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb37ec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb37f0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb37f4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb37f8:	54000189	b.ls	0xfffff7fb3828  // b.plast
   0x0000fffff7fb37fc:	36d8008d	tbz	w13, #27, 0xfffff7fb380c
   0x0000fffff7fb3800:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3804:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3808:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb380c:	36d80091	tbz	w17, #27, 0xfffff7fb381c
   0x0000fffff7fb3810:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3814:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3818:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb381c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb3820:	b900016d	str	w13, [x11]
   0x0000fffff7fb3824:	1400000e	b	0xfffff7fb385c
   0x0000fffff7fb3828:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb382c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3830:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3834:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3838:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fb383c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3840:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3844:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb3848:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb384c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3850:	d63f0200	blr	x16
   0x0000fffff7fb3854:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3858:	54002500	b.eq	0xfffff7fb3cf8  // b.none
   0x0000fffff7fb385c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3860:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3864:	540004a0	b.eq	0xfffff7fb38f8  // b.none
   0x0000fffff7fb3868:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb386c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3870:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb3874:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3878:	54000400	b.eq	0xfffff7fb38f8  // b.none
   0x0000fffff7fb387c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3880:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb3884:	36d801d1	tbz	w17, #27, 0xfffff7fb38bc
   0x0000fffff7fb3888:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb388c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3890:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3894:	54000321	b.ne	0xfffff7fb38f8  // b.any
   0x0000fffff7fb3898:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb389c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb38a0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb38a4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb38a8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb38ac:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb38b0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb38b4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb38b8:	54000209	b.ls	0xfffff7fb38f8  // b.plast
   0x0000fffff7fb38bc:	36d8008d	tbz	w13, #27, 0xfffff7fb38cc
   0x0000fffff7fb38c0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb38c4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb38c8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb38cc:	36d80091	tbz	w17, #27, 0xfffff7fb38dc
   0x0000fffff7fb38d0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb38d4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb38d8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb38dc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fb38e0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb38e4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb38e8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb38ec:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb38f0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb38f4:	1400000e	b	0xfffff7fb392c
   0x0000fffff7fb38f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb38fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3900:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3904:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3908:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fb390c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3910:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3914:	d2930e10	mov	x16, #0x9870                	// #39024
   0x0000fffff7fb3918:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb391c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3920:	d63f0200	blr	x16
   0x0000fffff7fb3924:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3928:	54001ec0	b.eq	0xfffff7fb3d00  // b.none
   0x0000fffff7fb392c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3930:	37d806a9	tbnz	w9, #27, 0xfffff7fb3a04
   0x0000fffff7fb3934:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb393c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3940:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3944:	540001c1	b.ne	0xfffff7fb397c  // b.any
   0x0000fffff7fb3948:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb394c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3954:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3958:	54000121	b.ne	0xfffff7fb397c  // b.any
   0x0000fffff7fb395c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3960:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fb3964:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3968:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb396c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3970:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fb3974:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb3978:	14000030	b	0xfffff7fb3a38
   0x0000fffff7fb397c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3980:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3984:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3988:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb398c:	54000120	b.eq	0xfffff7fb39b0  // b.none
   0x0000fffff7fb3990:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3994:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb399c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb39a0:	54000321	b.ne	0xfffff7fb3a04  // b.any
   0x0000fffff7fb39a4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb39a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb39ac:	14000002	b	0xfffff7fb39b4
   0x0000fffff7fb39b0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fb39b4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb39b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb39bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb39c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb39c4:	54000120	b.eq	0xfffff7fb39e8  // b.none
   0x0000fffff7fb39c8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fb39cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb39d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb39d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb39d8:	54000161	b.ne	0xfffff7fb3a04  // b.any
   0x0000fffff7fb39dc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fb39e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb39e4:	14000002	b	0xfffff7fb39ec
   0x0000fffff7fb39e8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fb39ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb39f0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fb39f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb39f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb39fc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fb3a00:	17ffffde	b	0xfffff7fb3978
   0x0000fffff7fb3a04:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3a08:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3a0c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3a10:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3a14:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fb3a18:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3a1c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3a20:	d294bc90	mov	x16, #0xa5e4                	// #42468
   0x0000fffff7fb3a24:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3a28:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3a2c:	d63f0200	blr	x16
   0x0000fffff7fb3a30:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3a34:	540016a0	b.eq	0xfffff7fb3d08  // b.none
   0x0000fffff7fb3a38:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb3a3c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb3a40:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb3a44:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb3a48:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb3a4c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fb3a50:	36d801d1	tbz	w17, #27, 0xfffff7fb3a88
   0x0000fffff7fb3a54:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3a58:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3a5c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3a60:	54000281	b.ne	0xfffff7fb3ab0  // b.any
   0x0000fffff7fb3a64:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fb3a68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3a6c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3a70:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3a74:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3a78:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3a7c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3a80:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3a84:	54000169	b.ls	0xfffff7fb3ab0  // b.plast
   0x0000fffff7fb3a88:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3a8c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3a90:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3a94:	36d80091	tbz	w17, #27, 0xfffff7fb3aa4
   0x0000fffff7fb3a98:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3a9c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3aa0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3aa4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fb3aa8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fb3aac:	1400000e	b	0xfffff7fb3ae4
   0x0000fffff7fb3ab0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3ab4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3ab8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3abc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3ac0:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fb3ac4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3ac8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3acc:	d2956210	mov	x16, #0xab10                	// #43792
   0x0000fffff7fb3ad0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3ad4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3ad8:	d63f0200	blr	x16
   0x0000fffff7fb3adc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3ae0:	54001180	b.eq	0xfffff7fb3d10  // b.none
   0x0000fffff7fb3ae4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3ae8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3aec:	540003a0	b.eq	0xfffff7fb3b60  // b.none
   0x0000fffff7fb3af0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fb3af4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fb3af8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb3afc:	36d801d1	tbz	w17, #27, 0xfffff7fb3b34
   0x0000fffff7fb3b00:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3b04:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3b08:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3b0c:	540002a1	b.ne	0xfffff7fb3b60  // b.any
   0x0000fffff7fb3b10:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb3b14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3b18:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3b1c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3b20:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3b24:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3b28:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3b2c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3b30:	54000189	b.ls	0xfffff7fb3b60  // b.plast
   0x0000fffff7fb3b34:	36d8008d	tbz	w13, #27, 0xfffff7fb3b44
   0x0000fffff7fb3b38:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3b3c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3b40:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3b44:	36d80091	tbz	w17, #27, 0xfffff7fb3b54
   0x0000fffff7fb3b48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3b4c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3b50:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3b54:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb3b58:	b900016d	str	w13, [x11]
   0x0000fffff7fb3b5c:	1400000e	b	0xfffff7fb3b94
   0x0000fffff7fb3b60:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb3b64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3b68:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3b6c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3b70:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fb3b74:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3b78:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3b7c:	d2829810	mov	x16, #0x14c0                	// #5312
   0x0000fffff7fb3b80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3b84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3b88:	d63f0200	blr	x16
   0x0000fffff7fb3b8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3b90:	54000c40	b.eq	0xfffff7fb3d18  // b.none
   0x0000fffff7fb3b94:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3b98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3b9c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3ba0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3ba4:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fb3ba8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3bac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3bb0:	d2869090	mov	x16, #0x3484                	// #13444
   0x0000fffff7fb3bb4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3bb8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3bbc:	d63f0200	blr	x16
   0x0000fffff7fb3bc0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb3bc4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb3bc8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb3bcc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb3bd0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb3bd4:	d65f03c0	ret
   0x0000fffff7fb3bd8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3bdc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3be0:	b900028a	str	w10, [x20]
   0x0000fffff7fb3be4:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb3be8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb3bec:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb3bf0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb3bf4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb3bf8:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb3bfc:	d65f03c0	ret
   0x0000fffff7fb3c00:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb3c04:	17fffff5	b	0xfffff7fb3bd8
   0x0000fffff7fb3c08:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb3c0c:	17fffff3	b	0xfffff7fb3bd8
   0x0000fffff7fb3c10:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb3c14:	17fffff1	b	0xfffff7fb3bd8
   0x0000fffff7fb3c18:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb3c1c:	17ffffef	b	0xfffff7fb3bd8
   0x0000fffff7fb3c20:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb3c24:	17ffffed	b	0xfffff7fb3bd8
   0x0000fffff7fb3c28:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb3c2c:	17ffffeb	b	0xfffff7fb3bd8
   0x0000fffff7fb3c30:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb3c34:	17ffffe9	b	0xfffff7fb3bd8
   0x0000fffff7fb3c38:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb3c3c:	17ffffe7	b	0xfffff7fb3bd8
   0x0000fffff7fb3c40:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb3c44:	17ffffe5	b	0xfffff7fb3bd8
   0x0000fffff7fb3c48:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb3c4c:	17ffffe3	b	0xfffff7fb3bd8
   0x0000fffff7fb3c50:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb3c54:	17ffffe1	b	0xfffff7fb3bd8
   0x0000fffff7fb3c58:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb3c5c:	17ffffdf	b	0xfffff7fb3bd8
   0x0000fffff7fb3c60:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb3c64:	17ffffdd	b	0xfffff7fb3bd8
   0x0000fffff7fb3c68:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb3c6c:	17ffffdb	b	0xfffff7fb3bd8
   0x0000fffff7fb3c70:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb3c74:	17ffffd9	b	0xfffff7fb3bd8
   0x0000fffff7fb3c78:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb3c7c:	17ffffd7	b	0xfffff7fb3bd8
   0x0000fffff7fb3c80:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb3c84:	17ffffd5	b	0xfffff7fb3bd8
   0x0000fffff7fb3c88:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb3c8c:	17ffffd3	b	0xfffff7fb3bd8
   0x0000fffff7fb3c90:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb3c94:	17ffffd1	b	0xfffff7fb3bd8
   0x0000fffff7fb3c98:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb3c9c:	17ffffcf	b	0xfffff7fb3bd8
   0x0000fffff7fb3ca0:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb3ca4:	17ffffcd	b	0xfffff7fb3bd8
   0x0000fffff7fb3ca8:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb3cac:	17ffffcb	b	0xfffff7fb3bd8
   0x0000fffff7fb3cb0:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb3cb4:	17ffffc9	b	0xfffff7fb3bd8
   0x0000fffff7fb3cb8:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb3cbc:	17ffffc7	b	0xfffff7fb3bd8
   0x0000fffff7fb3cc0:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb3cc4:	17ffffc5	b	0xfffff7fb3bd8
   0x0000fffff7fb3cc8:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb3ccc:	17ffffc3	b	0xfffff7fb3bd8
   0x0000fffff7fb3cd0:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb3cd4:	17ffffc1	b	0xfffff7fb3bd8
   0x0000fffff7fb3cd8:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb3cdc:	17ffffbf	b	0xfffff7fb3bd8
   0x0000fffff7fb3ce0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb3ce4:	17ffffbd	b	0xfffff7fb3bd8
   0x0000fffff7fb3ce8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb3cec:	17ffffbb	b	0xfffff7fb3bd8
   0x0000fffff7fb3cf0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fb3cf4:	17ffffb9	b	0xfffff7fb3bd8
   0x0000fffff7fb3cf8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fb3cfc:	17ffffb7	b	0xfffff7fb3bd8
   0x0000fffff7fb3d00:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fb3d04:	17ffffb5	b	0xfffff7fb3bd8
   0x0000fffff7fb3d08:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fb3d0c:	17ffffb3	b	0xfffff7fb3bd8
   0x0000fffff7fb3d10:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fb3d14:	17ffffb1	b	0xfffff7fb3bd8
   0x0000fffff7fb3d18:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fb3d1c:	17ffffaf	b	0xfffff7fb3bd8
   0x0000fffff7fb3d20:	00000000	udf	#0
   0x0000fffff7fb3d24:	00000000	udf	#0
   0x0000fffff7fb3d28:	00000000	udf	#0
   0x0000fffff7fb3d2c:	00000000	udf	#0
   0x0000fffff7fb3d30:	00000000	udf	#0
   0x0000fffff7fb3d34:	00000000	udf	#0
   0x0000fffff7fb3d38:	00000000	udf	#0
   0x0000fffff7fb3d3c:	00000000	udf	#0
   0x0000fffff7fb3d40:	00000000	udf	#0
   0x0000fffff7fb3d44:	00000000	udf	#0
   0x0000fffff7fb3d48:	00000000	udf	#0
   0x0000fffff7fb3d4c:	00000000	udf	#0
   0x0000fffff7fb3d50:	00000000	udf	#0
   0x0000fffff7fb3d54:	00000000	udf	#0
   0x0000fffff7fb3d58:	00000000	udf	#0
   0x0000fffff7fb3d5c:	00000000	udf	#0
   0x0000fffff7fb3d60:	00000000	udf	#0
   0x0000fffff7fb3d64:	00000000	udf	#0
   0x0000fffff7fb3d68:	00000000	udf	#0
   0x0000fffff7fb3d6c:	00000000	udf	#0
   0x0000fffff7fb3d70:	00000000	udf	#0
   0x0000fffff7fb3d74:	00000000	udf	#0
   0x0000fffff7fb3d78:	00000000	udf	#0
   0x0000fffff7fb3d7c:	00000000	udf	#0
   0x0000fffff7fb3d80:	00000000	udf	#0
   0x0000fffff7fb3d84:	00000000	udf	#0
   0x0000fffff7fb3d88:	00000000	udf	#0
   0x0000fffff7fb3d8c:	00000000	udf	#0
   0x0000fffff7fb3d90:	00000000	udf	#0
   0x0000fffff7fb3d94:	00000000	udf	#0
   0x0000fffff7fb3d98:	00000000	udf	#0
   0x0000fffff7fb3d9c:	00000000	udf	#0
   0x0000fffff7fb3da0:	00000000	udf	#0
   0x0000fffff7fb3da4:	00000000	udf	#0
   0x0000fffff7fb3da8:	00000000	udf	#0
   0x0000fffff7fb3dac:	00000000	udf	#0
   0x0000fffff7fb3db0:	00000000	udf	#0
   0x0000fffff7fb3db4:	00000000	udf	#0
   0x0000fffff7fb3db8:	00000000	udf	#0
   0x0000fffff7fb3dbc:	00000000	udf	#0
   0x0000fffff7fb3dc0:	00000000	udf	#0
   0x0000fffff7fb3dc4:	00000000	udf	#0
   0x0000fffff7fb3dc8:	00000000	udf	#0
   0x0000fffff7fb3dcc:	00000000	udf	#0
   0x0000fffff7fb3dd0:	00000000	udf	#0
   0x0000fffff7fb3dd4:	00000000	udf	#0
   0x0000fffff7fb3dd8:	00000000	udf	#0
   0x0000fffff7fb3ddc:	00000000	udf	#0
   0x0000fffff7fb3de0:	00000000	udf	#0
   0x0000fffff7fb3de4:	00000000	udf	#0
   0x0000fffff7fb3de8:	00000000	udf	#0
   0x0000fffff7fb3dec:	00000000	udf	#0
   0x0000fffff7fb3df0:	00000000	udf	#0
   0x0000fffff7fb3df4:	00000000	udf	#0
   0x0000fffff7fb3df8:	00000000	udf	#0
   0x0000fffff7fb3dfc:	00000000	udf	#0
   0x0000fffff7fb3e00:	00000000	udf	#0
   0x0000fffff7fb3e04:	00000000	udf	#0
   0x0000fffff7fb3e08:	00000000	udf	#0
   0x0000fffff7fb3e0c:	00000000	udf	#0
   0x0000fffff7fb3e10:	00000000	udf	#0
   0x0000fffff7fb3e14:	00000000	udf	#0
   0x0000fffff7fb3e18:	00000000	udf	#0
   0x0000fffff7fb3e1c:	00000000	udf	#0
   0x0000fffff7fb3e20:	00000000	udf	#0
   0x0000fffff7fb3e24:	00000000	udf	#0
   0x0000fffff7fb3e28:	00000000	udf	#0
   0x0000fffff7fb3e2c:	00000000	udf	#0
   0x0000fffff7fb3e30:	00000000	udf	#0
   0x0000fffff7fb3e34:	00000000	udf	#0
   0x0000fffff7fb3e38:	00000000	udf	#0
   0x0000fffff7fb3e3c:	00000000	udf	#0
   0x0000fffff7fb3e40:	00000000	udf	#0
   0x0000fffff7fb3e44:	00000000	udf	#0
   0x0000fffff7fb3e48:	00000000	udf	#0
   0x0000fffff7fb3e4c:	00000000	udf	#0
   0x0000fffff7fb3e50:	00000000	udf	#0
   0x0000fffff7fb3e54:	00000000	udf	#0
   0x0000fffff7fb3e58:	00000000	udf	#0
   0x0000fffff7fb3e5c:	00000000	udf	#0
   0x0000fffff7fb3e60:	00000000	udf	#0
   0x0000fffff7fb3e64:	00000000	udf	#0
   0x0000fffff7fb3e68:	00000000	udf	#0
   0x0000fffff7fb3e6c:	00000000	udf	#0
   0x0000fffff7fb3e70:	00000000	udf	#0
   0x0000fffff7fb3e74:	00000000	udf	#0
   0x0000fffff7fb3e78:	00000000	udf	#0
   0x0000fffff7fb3e7c:	00000000	udf	#0
   0x0000fffff7fb3e80:	00000000	udf	#0
   0x0000fffff7fb3e84:	00000000	udf	#0
   0x0000fffff7fb3e88:	00000000	udf	#0
   0x0000fffff7fb3e8c:	00000000	udf	#0
   0x0000fffff7fb3e90:	00000000	udf	#0
   0x0000fffff7fb3e94:	00000000	udf	#0
   0x0000fffff7fb3e98:	00000000	udf	#0
   0x0000fffff7fb3e9c:	00000000	udf	#0
   0x0000fffff7fb3ea0:	00000000	udf	#0
   0x0000fffff7fb3ea4:	00000000	udf	#0
   0x0000fffff7fb3ea8:	00000000	udf	#0
   0x0000fffff7fb3eac:	00000000	udf	#0
   0x0000fffff7fb3eb0:	00000000	udf	#0
   0x0000fffff7fb3eb4:	00000000	udf	#0
   0x0000fffff7fb3eb8:	00000000	udf	#0
   0x0000fffff7fb3ebc:	00000000	udf	#0
   0x0000fffff7fb3ec0:	00000000	udf	#0
   0x0000fffff7fb3ec4:	00000000	udf	#0
   0x0000fffff7fb3ec8:	00000000	udf	#0
   0x0000fffff7fb3ecc:	00000000	udf	#0
   0x0000fffff7fb3ed0:	00000000	udf	#0
   0x0000fffff7fb3ed4:	00000000	udf	#0
   0x0000fffff7fb3ed8:	00000000	udf	#0
   0x0000fffff7fb3edc:	00000000	udf	#0
   0x0000fffff7fb3ee0:	00000000	udf	#0
   0x0000fffff7fb3ee4:	00000000	udf	#0
   0x0000fffff7fb3ee8:	00000000	udf	#0
   0x0000fffff7fb3eec:	00000000	udf	#0
   0x0000fffff7fb3ef0:	00000000	udf	#0
   0x0000fffff7fb3ef4:	00000000	udf	#0
   0x0000fffff7fb3ef8:	00000000	udf	#0
   0x0000fffff7fb3efc:	00000000	udf	#0
   0x0000fffff7fb3f00:	00000000	udf	#0
   0x0000fffff7fb3f04:	00000000	udf	#0
   0x0000fffff7fb3f08:	00000000	udf	#0
   0x0000fffff7fb3f0c:	00000000	udf	#0
   0x0000fffff7fb3f10:	00000000	udf	#0
   0x0000fffff7fb3f14:	00000000	udf	#0
   0x0000fffff7fb3f18:	00000000	udf	#0
   0x0000fffff7fb3f1c:	00000000	udf	#0
   0x0000fffff7fb3f20:	00000000	udf	#0
   0x0000fffff7fb3f24:	00000000	udf	#0
   0x0000fffff7fb3f28:	00000000	udf	#0
   0x0000fffff7fb3f2c:	00000000	udf	#0
   0x0000fffff7fb3f30:	00000000	udf	#0
   0x0000fffff7fb3f34:	00000000	udf	#0
   0x0000fffff7fb3f38:	00000000	udf	#0
   0x0000fffff7fb3f3c:	00000000	udf	#0
   0x0000fffff7fb3f40:	00000000	udf	#0
   0x0000fffff7fb3f44:	00000000	udf	#0
   0x0000fffff7fb3f48:	00000000	udf	#0
   0x0000fffff7fb3f4c:	00000000	udf	#0
   0x0000fffff7fb3f50:	00000000	udf	#0
   0x0000fffff7fb3f54:	00000000	udf	#0
   0x0000fffff7fb3f58:	00000000	udf	#0
   0x0000fffff7fb3f5c:	00000000	udf	#0
   0x0000fffff7fb3f60:	00000000	udf	#0
   0x0000fffff7fb3f64:	00000000	udf	#0
   0x0000fffff7fb3f68:	00000000	udf	#0
   0x0000fffff7fb3f6c:	00000000	udf	#0
   0x0000fffff7fb3f70:	00000000	udf	#0
   0x0000fffff7fb3f74:	00000000	udf	#0
   0x0000fffff7fb3f78:	00000000	udf	#0
   0x0000fffff7fb3f7c:	00000000	udf	#0
   0x0000fffff7fb3f80:	00000000	udf	#0
   0x0000fffff7fb3f84:	00000000	udf	#0
   0x0000fffff7fb3f88:	00000000	udf	#0
   0x0000fffff7fb3f8c:	00000000	udf	#0
   0x0000fffff7fb3f90:	00000000	udf	#0
   0x0000fffff7fb3f94:	00000000	udf	#0
   0x0000fffff7fb3f98:	00000000	udf	#0
   0x0000fffff7fb3f9c:	00000000	udf	#0
   0x0000fffff7fb3fa0:	00000000	udf	#0
   0x0000fffff7fb3fa4:	00000000	udf	#0
   0x0000fffff7fb3fa8:	00000000	udf	#0
   0x0000fffff7fb3fac:	00000000	udf	#0
   0x0000fffff7fb3fb0:	00000000	udf	#0
   0x0000fffff7fb3fb4:	00000000	udf	#0
   0x0000fffff7fb3fb8:	00000000	udf	#0
   0x0000fffff7fb3fbc:	00000000	udf	#0
   0x0000fffff7fb3fc0:	00000000	udf	#0
   0x0000fffff7fb3fc4:	00000000	udf	#0
   0x0000fffff7fb3fc8:	00000000	udf	#0
   0x0000fffff7fb3fcc:	00000000	udf	#0
   0x0000fffff7fb3fd0:	00000000	udf	#0
   0x0000fffff7fb3fd4:	00000000	udf	#0
   0x0000fffff7fb3fd8:	00000000	udf	#0
   0x0000fffff7fb3fdc:	00000000	udf	#0
   0x0000fffff7fb3fe0:	00000000	udf	#0
   0x0000fffff7fb3fe4:	00000000	udf	#0
   0x0000fffff7fb3fe8:	00000000	udf	#0
   0x0000fffff7fb3fec:	00000000	udf	#0
   0x0000fffff7fb3ff0:	00000000	udf	#0
   0x0000fffff7fb3ff4:	00000000	udf	#0
   0x0000fffff7fb3ff8:	00000000	udf	#0
   0x0000fffff7fb3ffc:	00000000	udf	#0
End of assembler dump.
