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
   0x0000fffff7fb20ec:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb20f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb20f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb20f8:	d63f0200	blr	x16
   0x0000fffff7fb20fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2100:	5400d740	b.eq	0xfffff7fb3be8  // b.none
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
   0x0000fffff7fb217c:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb2180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2188:	d63f0200	blr	x16
   0x0000fffff7fb218c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2190:	5400d300	b.eq	0xfffff7fb3bf0  // b.none
   0x0000fffff7fb2194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb219c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb21a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb21a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fb21a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb21ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fb21b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb21b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb21b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb21bc:	d63f0200	blr	x16
   0x0000fffff7fb21c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb21c4:	5400d1a0	b.eq	0xfffff7fb3bf8  // b.none
   0x0000fffff7fb21c8:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fb21cc:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fb21d0:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fb21d4:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fb21d8:	36d80211	tbz	w17, #27, 0xfffff7fb2218
   0x0000fffff7fb21dc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb21e0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb21e4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb21e8:	540001e1	b.ne	0xfffff7fb2224  // b.any
   0x0000fffff7fb21ec:	f940166f	ldr	x15, [x19, #40]
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
   0x0000fffff7fb2218:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fb221c:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fb2220:	1400000e	b	0xfffff7fb2258
   0x0000fffff7fb2224:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2228:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb222c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2230:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2234:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fb2238:	aa1403e4	mov	x4, x20
   0x0000fffff7fb223c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2240:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fb2244:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2248:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb224c:	d63f0200	blr	x16
   0x0000fffff7fb2250:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2254:	5400cd60	b.eq	0xfffff7fb3c00  // b.none
   0x0000fffff7fb2258:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb225c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2260:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2264:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2268:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fb226c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2270:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2274:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2278:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb227c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2280:	d63f0200	blr	x16
   0x0000fffff7fb2284:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2288:	5400cc00	b.eq	0xfffff7fb3c08  // b.none
   0x0000fffff7fb228c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2290:	37d806a9	tbnz	w9, #27, 0xfffff7fb2364
   0x0000fffff7fb2294:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2298:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb229c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb22a4:	540001c1	b.ne	0xfffff7fb22dc  // b.any
   0x0000fffff7fb22a8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb22ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb22b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb22b8:	54000121	b.ne	0xfffff7fb22dc  // b.any
   0x0000fffff7fb22bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb22c0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb22c4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb22c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb22cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22d0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb22d4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb22d8:	14000030	b	0xfffff7fb2398
   0x0000fffff7fb22dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb22e0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb22e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb22ec:	54000120	b.eq	0xfffff7fb2310  // b.none
   0x0000fffff7fb22f0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb22f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb22f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb22fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2300:	54000321	b.ne	0xfffff7fb2364  // b.any
   0x0000fffff7fb2304:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2308:	9e620120	scvtf	d0, x9
   0x0000fffff7fb230c:	14000002	b	0xfffff7fb2314
   0x0000fffff7fb2310:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb2314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb231c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2320:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2324:	54000120	b.eq	0xfffff7fb2348  // b.none
   0x0000fffff7fb2328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb232c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2334:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2338:	54000161	b.ne	0xfffff7fb2364  // b.any
   0x0000fffff7fb233c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2340:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2344:	14000002	b	0xfffff7fb234c
   0x0000fffff7fb2348:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb234c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2350:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb2354:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2358:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb235c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2360:	17ffffde	b	0xfffff7fb22d8
   0x0000fffff7fb2364:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2368:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb236c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2370:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2374:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fb2378:	aa1403e4	mov	x4, x20
   0x0000fffff7fb237c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2380:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb2384:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2388:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb238c:	d63f0200	blr	x16
   0x0000fffff7fb2390:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2394:	5400c3e0	b.eq	0xfffff7fb3c10  // b.none
   0x0000fffff7fb2398:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb239c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb23a0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb23a4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb23a8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb23ac:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb23b0:	36d801d1	tbz	w17, #27, 0xfffff7fb23e8
   0x0000fffff7fb23b4:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb23b8:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb23bc:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb23c0:	54000281	b.ne	0xfffff7fb2410  // b.any
   0x0000fffff7fb23c4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb23c8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb23cc:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb23d0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb23d4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb23d8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb23dc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb23e0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb23e4:	54000169	b.ls	0xfffff7fb2410  // b.plast
   0x0000fffff7fb23e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb23ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb23f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb23f4:	36d80091	tbz	w17, #27, 0xfffff7fb2404
   0x0000fffff7fb23f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb23fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2400:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2404:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2408:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb240c:	1400000e	b	0xfffff7fb2444
   0x0000fffff7fb2410:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2414:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2418:	aa1303e1	mov	x1, x19
   0x0000fffff7fb241c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2420:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fb2424:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2428:	aa1603e5	mov	x5, x22
   0x0000fffff7fb242c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb2430:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2434:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2438:	d63f0200	blr	x16
   0x0000fffff7fb243c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2440:	5400bec0	b.eq	0xfffff7fb3c18  // b.none
   0x0000fffff7fb2444:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2448:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb244c:	540003a0	b.eq	0xfffff7fb24c0  // b.none
   0x0000fffff7fb2450:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb2454:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb2458:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb245c:	36d801d1	tbz	w17, #27, 0xfffff7fb2494
   0x0000fffff7fb2460:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2464:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2468:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb246c:	540002a1	b.ne	0xfffff7fb24c0  // b.any
   0x0000fffff7fb2470:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb2474:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2478:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb247c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2480:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2484:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2488:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb248c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2490:	54000189	b.ls	0xfffff7fb24c0  // b.plast
   0x0000fffff7fb2494:	36d8008d	tbz	w13, #27, 0xfffff7fb24a4
   0x0000fffff7fb2498:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb249c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb24a0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb24a4:	36d80091	tbz	w17, #27, 0xfffff7fb24b4
   0x0000fffff7fb24a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb24ac:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb24b0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb24b4:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb24b8:	b900016d	str	w13, [x11]
   0x0000fffff7fb24bc:	1400000e	b	0xfffff7fb24f4
   0x0000fffff7fb24c0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb24c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb24c8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb24cc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb24d0:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fb24d4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb24d8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb24dc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb24e0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb24e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb24e8:	d63f0200	blr	x16
   0x0000fffff7fb24ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb24f0:	5400b980	b.eq	0xfffff7fb3c20  // b.none
   0x0000fffff7fb24f4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb24f8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb24fc:	540004a0	b.eq	0xfffff7fb2590  // b.none
   0x0000fffff7fb2500:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2504:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2508:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb250c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2510:	54000400	b.eq	0xfffff7fb2590  // b.none
   0x0000fffff7fb2514:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2518:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb251c:	36d801d1	tbz	w17, #27, 0xfffff7fb2554
   0x0000fffff7fb2520:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2524:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2528:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb252c:	54000321	b.ne	0xfffff7fb2590  // b.any
   0x0000fffff7fb2530:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2534:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2538:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb253c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2540:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2544:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2548:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb254c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2550:	54000209	b.ls	0xfffff7fb2590  // b.plast
   0x0000fffff7fb2554:	36d8008d	tbz	w13, #27, 0xfffff7fb2564
   0x0000fffff7fb2558:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb255c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2560:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2564:	36d80091	tbz	w17, #27, 0xfffff7fb2574
   0x0000fffff7fb2568:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb256c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2570:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2574:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb2578:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb257c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2580:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2584:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2588:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb258c:	1400000e	b	0xfffff7fb25c4
   0x0000fffff7fb2590:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2594:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2598:	aa1303e1	mov	x1, x19
   0x0000fffff7fb259c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb25a0:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fb25a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb25a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb25ac:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb25b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb25b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb25b8:	d63f0200	blr	x16
   0x0000fffff7fb25bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb25c0:	5400b340	b.eq	0xfffff7fb3c28  // b.none
   0x0000fffff7fb25c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb25c8:	37d806a9	tbnz	w9, #27, 0xfffff7fb269c
   0x0000fffff7fb25cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb25d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb25d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb25d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb25dc:	540001c1	b.ne	0xfffff7fb2614  // b.any
   0x0000fffff7fb25e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb25e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb25e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb25ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb25f0:	54000121	b.ne	0xfffff7fb2614  // b.any
   0x0000fffff7fb25f4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb25f8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb25fc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2600:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2604:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2608:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb260c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2610:	14000030	b	0xfffff7fb26d0
   0x0000fffff7fb2614:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2618:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb261c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2620:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2624:	54000120	b.eq	0xfffff7fb2648  // b.none
   0x0000fffff7fb2628:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb262c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2630:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2634:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2638:	54000321	b.ne	0xfffff7fb269c  // b.any
   0x0000fffff7fb263c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2640:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2644:	14000002	b	0xfffff7fb264c
   0x0000fffff7fb2648:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb264c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2650:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2658:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb265c:	54000120	b.eq	0xfffff7fb2680  // b.none
   0x0000fffff7fb2660:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2664:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb266c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2670:	54000161	b.ne	0xfffff7fb269c  // b.any
   0x0000fffff7fb2674:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2678:	9e620121	scvtf	d1, x9
   0x0000fffff7fb267c:	14000002	b	0xfffff7fb2684
   0x0000fffff7fb2680:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb2684:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2688:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb268c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2690:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2694:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2698:	17ffffde	b	0xfffff7fb2610
   0x0000fffff7fb269c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb26a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb26a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb26a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb26ac:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fb26b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fb26b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fb26b8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb26bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb26c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb26c4:	d63f0200	blr	x16
   0x0000fffff7fb26c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb26cc:	5400ab20	b.eq	0xfffff7fb3c30  // b.none
   0x0000fffff7fb26d0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb26d4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb26d8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb26dc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb26e0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb26e4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb26e8:	36d801d1	tbz	w17, #27, 0xfffff7fb2720
   0x0000fffff7fb26ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb26f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb26f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb26f8:	54000281	b.ne	0xfffff7fb2748  // b.any
   0x0000fffff7fb26fc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2700:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2704:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2708:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb270c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2710:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2714:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2718:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb271c:	54000169	b.ls	0xfffff7fb2748  // b.plast
   0x0000fffff7fb2720:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2724:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2728:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb272c:	36d80091	tbz	w17, #27, 0xfffff7fb273c
   0x0000fffff7fb2730:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2734:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2738:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb273c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2740:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2744:	1400000e	b	0xfffff7fb277c
   0x0000fffff7fb2748:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb274c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2750:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2754:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2758:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fb275c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2760:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2764:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb2768:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb276c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2770:	d63f0200	blr	x16
   0x0000fffff7fb2774:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2778:	5400a600	b.eq	0xfffff7fb3c38  // b.none
   0x0000fffff7fb277c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2780:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2784:	540003a0	b.eq	0xfffff7fb27f8  // b.none
   0x0000fffff7fb2788:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb278c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb2790:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2794:	36d801d1	tbz	w17, #27, 0xfffff7fb27cc
   0x0000fffff7fb2798:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb279c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb27a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb27a4:	540002a1	b.ne	0xfffff7fb27f8  // b.any
   0x0000fffff7fb27a8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb27ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb27b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb27b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb27b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb27bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb27c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb27c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb27c8:	54000189	b.ls	0xfffff7fb27f8  // b.plast
   0x0000fffff7fb27cc:	36d8008d	tbz	w13, #27, 0xfffff7fb27dc
   0x0000fffff7fb27d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb27d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb27d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb27dc:	36d80091	tbz	w17, #27, 0xfffff7fb27ec
   0x0000fffff7fb27e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb27e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb27e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb27ec:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb27f0:	b900016d	str	w13, [x11]
   0x0000fffff7fb27f4:	1400000e	b	0xfffff7fb282c
   0x0000fffff7fb27f8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb27fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2800:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2804:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2808:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fb280c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2810:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2814:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb2818:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb281c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2820:	d63f0200	blr	x16
   0x0000fffff7fb2824:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2828:	5400a0c0	b.eq	0xfffff7fb3c40  // b.none
   0x0000fffff7fb282c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2830:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2834:	540004a0	b.eq	0xfffff7fb28c8  // b.none
   0x0000fffff7fb2838:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb283c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2840:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2844:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2848:	54000400	b.eq	0xfffff7fb28c8  // b.none
   0x0000fffff7fb284c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2850:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2854:	36d801d1	tbz	w17, #27, 0xfffff7fb288c
   0x0000fffff7fb2858:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb285c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2860:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2864:	54000321	b.ne	0xfffff7fb28c8  // b.any
   0x0000fffff7fb2868:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb286c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2870:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2874:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2878:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb287c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2880:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2884:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2888:	54000209	b.ls	0xfffff7fb28c8  // b.plast
   0x0000fffff7fb288c:	36d8008d	tbz	w13, #27, 0xfffff7fb289c
   0x0000fffff7fb2890:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2894:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2898:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb289c:	36d80091	tbz	w17, #27, 0xfffff7fb28ac
   0x0000fffff7fb28a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb28a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb28a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb28ac:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb28b0:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb28b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb28b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb28bc:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb28c0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb28c4:	1400000e	b	0xfffff7fb28fc
   0x0000fffff7fb28c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb28cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb28d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb28d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb28d8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fb28dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb28e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb28e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb28e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb28ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb28f0:	d63f0200	blr	x16
   0x0000fffff7fb28f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb28f8:	54009a80	b.eq	0xfffff7fb3c48  // b.none
   0x0000fffff7fb28fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2900:	37d806a9	tbnz	w9, #27, 0xfffff7fb29d4
   0x0000fffff7fb2904:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb290c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2910:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2914:	540001c1	b.ne	0xfffff7fb294c  // b.any
   0x0000fffff7fb2918:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb291c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2920:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2924:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2928:	54000121	b.ne	0xfffff7fb294c  // b.any
   0x0000fffff7fb292c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2930:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb2934:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2938:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb293c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2940:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb2944:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2948:	14000030	b	0xfffff7fb2a08
   0x0000fffff7fb294c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2950:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2958:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb295c:	54000120	b.eq	0xfffff7fb2980  // b.none
   0x0000fffff7fb2960:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2964:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2968:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb296c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2970:	54000321	b.ne	0xfffff7fb29d4  // b.any
   0x0000fffff7fb2974:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2978:	9e620120	scvtf	d0, x9
   0x0000fffff7fb297c:	14000002	b	0xfffff7fb2984
   0x0000fffff7fb2980:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb2984:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb298c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2994:	54000120	b.eq	0xfffff7fb29b8  // b.none
   0x0000fffff7fb2998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb299c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb29a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb29a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb29a8:	54000161	b.ne	0xfffff7fb29d4  // b.any
   0x0000fffff7fb29ac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb29b0:	9e620121	scvtf	d1, x9
   0x0000fffff7fb29b4:	14000002	b	0xfffff7fb29bc
   0x0000fffff7fb29b8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb29bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb29c0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb29c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb29c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb29cc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb29d0:	17ffffde	b	0xfffff7fb2948
   0x0000fffff7fb29d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb29d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb29dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb29e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb29e4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fb29e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb29ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fb29f0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb29f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb29f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb29fc:	d63f0200	blr	x16
   0x0000fffff7fb2a00:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2a04:	54009260	b.eq	0xfffff7fb3c50  // b.none
   0x0000fffff7fb2a08:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb2a0c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb2a10:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb2a14:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb2a18:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb2a1c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb2a20:	36d801d1	tbz	w17, #27, 0xfffff7fb2a58
   0x0000fffff7fb2a24:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2a28:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2a2c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2a30:	54000281	b.ne	0xfffff7fb2a80  // b.any
   0x0000fffff7fb2a34:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2a38:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2a3c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2a40:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2a44:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2a48:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2a4c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2a50:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2a54:	54000169	b.ls	0xfffff7fb2a80  // b.plast
   0x0000fffff7fb2a58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2a5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2a60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2a64:	36d80091	tbz	w17, #27, 0xfffff7fb2a74
   0x0000fffff7fb2a68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2a6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2a70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2a74:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2a78:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2a7c:	1400000e	b	0xfffff7fb2ab4
   0x0000fffff7fb2a80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2a84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2a88:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2a8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2a90:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fb2a94:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2a98:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2a9c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb2aa0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2aa4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2aa8:	d63f0200	blr	x16
   0x0000fffff7fb2aac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2ab0:	54008d40	b.eq	0xfffff7fb3c58  // b.none
   0x0000fffff7fb2ab4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2ab8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2abc:	540003a0	b.eq	0xfffff7fb2b30  // b.none
   0x0000fffff7fb2ac0:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb2ac4:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb2ac8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2acc:	36d801d1	tbz	w17, #27, 0xfffff7fb2b04
   0x0000fffff7fb2ad0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2ad4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2ad8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2adc:	540002a1	b.ne	0xfffff7fb2b30  // b.any
   0x0000fffff7fb2ae0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb2ae4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2ae8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2aec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2af0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2af4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2af8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2afc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2b00:	54000189	b.ls	0xfffff7fb2b30  // b.plast
   0x0000fffff7fb2b04:	36d8008d	tbz	w13, #27, 0xfffff7fb2b14
   0x0000fffff7fb2b08:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2b0c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2b10:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2b14:	36d80091	tbz	w17, #27, 0xfffff7fb2b24
   0x0000fffff7fb2b18:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2b1c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2b20:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2b24:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2b28:	b900016d	str	w13, [x11]
   0x0000fffff7fb2b2c:	1400000e	b	0xfffff7fb2b64
   0x0000fffff7fb2b30:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2b34:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2b38:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2b3c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2b40:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fb2b44:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2b48:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2b4c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb2b50:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2b54:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2b58:	d63f0200	blr	x16
   0x0000fffff7fb2b5c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2b60:	54008800	b.eq	0xfffff7fb3c60  // b.none
   0x0000fffff7fb2b64:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2b68:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2b6c:	540004a0	b.eq	0xfffff7fb2c00  // b.none
   0x0000fffff7fb2b70:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2b74:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2b78:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2b7c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2b80:	54000400	b.eq	0xfffff7fb2c00  // b.none
   0x0000fffff7fb2b84:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2b88:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2b8c:	36d801d1	tbz	w17, #27, 0xfffff7fb2bc4
   0x0000fffff7fb2b90:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2b94:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2b98:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2b9c:	54000321	b.ne	0xfffff7fb2c00  // b.any
   0x0000fffff7fb2ba0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2ba4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2ba8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2bac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2bb0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2bb4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2bb8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2bbc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2bc0:	54000209	b.ls	0xfffff7fb2c00  // b.plast
   0x0000fffff7fb2bc4:	36d8008d	tbz	w13, #27, 0xfffff7fb2bd4
   0x0000fffff7fb2bc8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2bcc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2bd0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2bd4:	36d80091	tbz	w17, #27, 0xfffff7fb2be4
   0x0000fffff7fb2bd8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2bdc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2be0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2be4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb2be8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2bec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2bf0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2bf4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2bf8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2bfc:	1400000e	b	0xfffff7fb2c34
   0x0000fffff7fb2c00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2c04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2c08:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2c0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2c10:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fb2c14:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2c18:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2c1c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2c20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2c24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2c28:	d63f0200	blr	x16
   0x0000fffff7fb2c2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2c30:	540081c0	b.eq	0xfffff7fb3c68  // b.none
   0x0000fffff7fb2c34:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2c38:	37d806a9	tbnz	w9, #27, 0xfffff7fb2d0c
   0x0000fffff7fb2c3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2c40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c4c:	540001c1	b.ne	0xfffff7fb2c84  // b.any
   0x0000fffff7fb2c50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2c54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c60:	54000121	b.ne	0xfffff7fb2c84  // b.any
   0x0000fffff7fb2c64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2c68:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb2c6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2c70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2c74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c78:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb2c7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2c80:	14000030	b	0xfffff7fb2d40
   0x0000fffff7fb2c84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2c88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2c8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2c90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2c94:	54000120	b.eq	0xfffff7fb2cb8  // b.none
   0x0000fffff7fb2c98:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2c9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2ca0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2ca4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2ca8:	54000321	b.ne	0xfffff7fb2d0c  // b.any
   0x0000fffff7fb2cac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2cb0:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2cb4:	14000002	b	0xfffff7fb2cbc
   0x0000fffff7fb2cb8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb2cbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2cc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2cc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2ccc:	54000120	b.eq	0xfffff7fb2cf0  // b.none
   0x0000fffff7fb2cd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2cd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2cd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2cdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2ce0:	54000161	b.ne	0xfffff7fb2d0c  // b.any
   0x0000fffff7fb2ce4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb2ce8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb2cec:	14000002	b	0xfffff7fb2cf4
   0x0000fffff7fb2cf0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb2cf4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb2cf8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb2cfc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2d04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2d08:	17ffffde	b	0xfffff7fb2c80
   0x0000fffff7fb2d0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2d10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2d14:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2d18:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2d1c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fb2d20:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2d24:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2d28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb2d2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2d30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2d34:	d63f0200	blr	x16
   0x0000fffff7fb2d38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2d3c:	540079a0	b.eq	0xfffff7fb3c70  // b.none
   0x0000fffff7fb2d40:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb2d44:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb2d48:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb2d4c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb2d50:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb2d54:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb2d58:	36d801d1	tbz	w17, #27, 0xfffff7fb2d90
   0x0000fffff7fb2d5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2d60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2d64:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2d68:	54000281	b.ne	0xfffff7fb2db8  // b.any
   0x0000fffff7fb2d6c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2d70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2d74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2d78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2d7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2d80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2d84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2d88:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2d8c:	54000169	b.ls	0xfffff7fb2db8  // b.plast
   0x0000fffff7fb2d90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2d94:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2d98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2d9c:	36d80091	tbz	w17, #27, 0xfffff7fb2dac
   0x0000fffff7fb2da0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2da4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2da8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2dac:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2db0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2db4:	1400000e	b	0xfffff7fb2dec
   0x0000fffff7fb2db8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb2dbc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2dc0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2dc4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2dc8:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fb2dcc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2dd0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2dd4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb2dd8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb2ddc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2de0:	d63f0200	blr	x16
   0x0000fffff7fb2de4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2de8:	54007480	b.eq	0xfffff7fb3c78  // b.none
   0x0000fffff7fb2dec:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb2df0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2df4:	540003a0	b.eq	0xfffff7fb2e68  // b.none
   0x0000fffff7fb2df8:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb2dfc:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb2e00:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb2e04:	36d801d1	tbz	w17, #27, 0xfffff7fb2e3c
   0x0000fffff7fb2e08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2e0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2e10:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2e14:	540002a1	b.ne	0xfffff7fb2e68  // b.any
   0x0000fffff7fb2e18:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb2e1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2e20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2e24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2e28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2e2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2e30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2e34:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2e38:	54000189	b.ls	0xfffff7fb2e68  // b.plast
   0x0000fffff7fb2e3c:	36d8008d	tbz	w13, #27, 0xfffff7fb2e4c
   0x0000fffff7fb2e40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2e44:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2e48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2e4c:	36d80091	tbz	w17, #27, 0xfffff7fb2e5c
   0x0000fffff7fb2e50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2e54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2e58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2e5c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb2e60:	b900016d	str	w13, [x11]
   0x0000fffff7fb2e64:	1400000e	b	0xfffff7fb2e9c
   0x0000fffff7fb2e68:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb2e6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2e70:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2e74:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2e78:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fb2e7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2e80:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2e84:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb2e88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2e8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2e90:	d63f0200	blr	x16
   0x0000fffff7fb2e94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2e98:	54006f40	b.eq	0xfffff7fb3c80  // b.none
   0x0000fffff7fb2e9c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb2ea0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb2ea4:	540004a0	b.eq	0xfffff7fb2f38  // b.none
   0x0000fffff7fb2ea8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb2eac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb2eb0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb2eb4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb2eb8:	54000400	b.eq	0xfffff7fb2f38  // b.none
   0x0000fffff7fb2ebc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb2ec0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb2ec4:	36d801d1	tbz	w17, #27, 0xfffff7fb2efc
   0x0000fffff7fb2ec8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb2ecc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb2ed0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb2ed4:	54000321	b.ne	0xfffff7fb2f38  // b.any
   0x0000fffff7fb2ed8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb2edc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2ee0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb2ee4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb2ee8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb2eec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb2ef0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb2ef4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb2ef8:	54000209	b.ls	0xfffff7fb2f38  // b.plast
   0x0000fffff7fb2efc:	36d8008d	tbz	w13, #27, 0xfffff7fb2f0c
   0x0000fffff7fb2f00:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb2f04:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb2f08:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb2f0c:	36d80091	tbz	w17, #27, 0xfffff7fb2f1c
   0x0000fffff7fb2f10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb2f14:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb2f18:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb2f1c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb2f20:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb2f24:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb2f28:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb2f2c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb2f30:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb2f34:	1400000e	b	0xfffff7fb2f6c
   0x0000fffff7fb2f38:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb2f3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb2f40:	aa1303e1	mov	x1, x19
   0x0000fffff7fb2f44:	aa1503e2	mov	x2, x21
   0x0000fffff7fb2f48:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fb2f4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb2f50:	aa1603e5	mov	x5, x22
   0x0000fffff7fb2f54:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb2f58:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb2f5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb2f60:	d63f0200	blr	x16
   0x0000fffff7fb2f64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb2f68:	54006900	b.eq	0xfffff7fb3c88  // b.none
   0x0000fffff7fb2f6c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2f70:	37d806a9	tbnz	w9, #27, 0xfffff7fb3044
   0x0000fffff7fb2f74:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2f78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2f7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2f80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2f84:	540001c1	b.ne	0xfffff7fb2fbc  // b.any
   0x0000fffff7fb2f88:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2f8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2f90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2f94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2f98:	54000121	b.ne	0xfffff7fb2fbc  // b.any
   0x0000fffff7fb2f9c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2fa0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb2fa4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb2fa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2fac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2fb0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb2fb4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb2fb8:	14000030	b	0xfffff7fb3078
   0x0000fffff7fb2fbc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2fc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2fc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2fc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2fcc:	54000120	b.eq	0xfffff7fb2ff0  // b.none
   0x0000fffff7fb2fd0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb2fd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb2fd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb2fdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb2fe0:	54000321	b.ne	0xfffff7fb3044  // b.any
   0x0000fffff7fb2fe4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb2fe8:	9e620120	scvtf	d0, x9
   0x0000fffff7fb2fec:	14000002	b	0xfffff7fb2ff4
   0x0000fffff7fb2ff0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb2ff4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb2ff8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb2ffc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3000:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3004:	54000120	b.eq	0xfffff7fb3028  // b.none
   0x0000fffff7fb3008:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb300c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3014:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3018:	54000161	b.ne	0xfffff7fb3044  // b.any
   0x0000fffff7fb301c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3020:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3024:	14000002	b	0xfffff7fb302c
   0x0000fffff7fb3028:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb302c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3030:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb3034:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3038:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb303c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3040:	17ffffde	b	0xfffff7fb2fb8
   0x0000fffff7fb3044:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3048:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb304c:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3050:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3054:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fb3058:	aa1403e4	mov	x4, x20
   0x0000fffff7fb305c:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3060:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb3064:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3068:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb306c:	d63f0200	blr	x16
   0x0000fffff7fb3070:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3074:	540060e0	b.eq	0xfffff7fb3c90  // b.none
   0x0000fffff7fb3078:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb307c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb3080:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb3084:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb3088:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb308c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb3090:	36d801d1	tbz	w17, #27, 0xfffff7fb30c8
   0x0000fffff7fb3094:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3098:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb309c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb30a0:	54000281	b.ne	0xfffff7fb30f0  // b.any
   0x0000fffff7fb30a4:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb30a8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb30ac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb30b0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb30b4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb30b8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb30bc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb30c0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb30c4:	54000169	b.ls	0xfffff7fb30f0  // b.plast
   0x0000fffff7fb30c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb30cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb30d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb30d4:	36d80091	tbz	w17, #27, 0xfffff7fb30e4
   0x0000fffff7fb30d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb30dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb30e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb30e4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb30e8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb30ec:	1400000e	b	0xfffff7fb3124
   0x0000fffff7fb30f0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb30f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb30f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb30fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3100:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fb3104:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3108:	aa1603e5	mov	x5, x22
   0x0000fffff7fb310c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb3110:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3114:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3118:	d63f0200	blr	x16
   0x0000fffff7fb311c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3120:	54005bc0	b.eq	0xfffff7fb3c98  // b.none
   0x0000fffff7fb3124:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3128:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb312c:	540003a0	b.eq	0xfffff7fb31a0  // b.none
   0x0000fffff7fb3130:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb3134:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb3138:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb313c:	36d801d1	tbz	w17, #27, 0xfffff7fb3174
   0x0000fffff7fb3140:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3144:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3148:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb314c:	540002a1	b.ne	0xfffff7fb31a0  // b.any
   0x0000fffff7fb3150:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb3154:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3158:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb315c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3160:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3164:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3168:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb316c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3170:	54000189	b.ls	0xfffff7fb31a0  // b.plast
   0x0000fffff7fb3174:	36d8008d	tbz	w13, #27, 0xfffff7fb3184
   0x0000fffff7fb3178:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb317c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3180:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3184:	36d80091	tbz	w17, #27, 0xfffff7fb3194
   0x0000fffff7fb3188:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb318c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3190:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3194:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb3198:	b900016d	str	w13, [x11]
   0x0000fffff7fb319c:	1400000e	b	0xfffff7fb31d4
   0x0000fffff7fb31a0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb31a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb31a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb31ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fb31b0:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fb31b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb31b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb31bc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb31c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb31c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb31c8:	d63f0200	blr	x16
   0x0000fffff7fb31cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb31d0:	54005680	b.eq	0xfffff7fb3ca0  // b.none
   0x0000fffff7fb31d4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb31d8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb31dc:	540004a0	b.eq	0xfffff7fb3270  // b.none
   0x0000fffff7fb31e0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb31e4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb31e8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb31ec:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb31f0:	54000400	b.eq	0xfffff7fb3270  // b.none
   0x0000fffff7fb31f4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb31f8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb31fc:	36d801d1	tbz	w17, #27, 0xfffff7fb3234
   0x0000fffff7fb3200:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3204:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3208:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb320c:	54000321	b.ne	0xfffff7fb3270  // b.any
   0x0000fffff7fb3210:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3214:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3218:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb321c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3220:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3224:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3228:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb322c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3230:	54000209	b.ls	0xfffff7fb3270  // b.plast
   0x0000fffff7fb3234:	36d8008d	tbz	w13, #27, 0xfffff7fb3244
   0x0000fffff7fb3238:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb323c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3240:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3244:	36d80091	tbz	w17, #27, 0xfffff7fb3254
   0x0000fffff7fb3248:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb324c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3250:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3254:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb3258:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb325c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3260:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb3264:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3268:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb326c:	1400000e	b	0xfffff7fb32a4
   0x0000fffff7fb3270:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb3274:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3278:	aa1303e1	mov	x1, x19
   0x0000fffff7fb327c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3280:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fb3284:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3288:	aa1603e5	mov	x5, x22
   0x0000fffff7fb328c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb3290:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3294:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3298:	d63f0200	blr	x16
   0x0000fffff7fb329c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb32a0:	54005040	b.eq	0xfffff7fb3ca8  // b.none
   0x0000fffff7fb32a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb32a8:	37d806a9	tbnz	w9, #27, 0xfffff7fb337c
   0x0000fffff7fb32ac:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb32b0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb32b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb32b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb32bc:	540001c1	b.ne	0xfffff7fb32f4  // b.any
   0x0000fffff7fb32c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb32c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb32c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb32cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb32d0:	54000121	b.ne	0xfffff7fb32f4  // b.any
   0x0000fffff7fb32d4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb32d8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb32dc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb32e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb32e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb32e8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb32ec:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb32f0:	14000030	b	0xfffff7fb33b0
   0x0000fffff7fb32f4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb32f8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb32fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3300:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3304:	54000120	b.eq	0xfffff7fb3328  // b.none
   0x0000fffff7fb3308:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb330c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3310:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3314:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3318:	54000321	b.ne	0xfffff7fb337c  // b.any
   0x0000fffff7fb331c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3320:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3324:	14000002	b	0xfffff7fb332c
   0x0000fffff7fb3328:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb332c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3330:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3338:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb333c:	54000120	b.eq	0xfffff7fb3360  // b.none
   0x0000fffff7fb3340:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3344:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3348:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb334c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3350:	54000161	b.ne	0xfffff7fb337c  // b.any
   0x0000fffff7fb3354:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3358:	9e620121	scvtf	d1, x9
   0x0000fffff7fb335c:	14000002	b	0xfffff7fb3364
   0x0000fffff7fb3360:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb3364:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb3368:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb336c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3370:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3374:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3378:	17ffffde	b	0xfffff7fb32f0
   0x0000fffff7fb337c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3380:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3384:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3388:	aa1503e2	mov	x2, x21
   0x0000fffff7fb338c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fb3390:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3394:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3398:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb339c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb33a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb33a4:	d63f0200	blr	x16
   0x0000fffff7fb33a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb33ac:	54004820	b.eq	0xfffff7fb3cb0  // b.none
   0x0000fffff7fb33b0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb33b4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb33b8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb33bc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb33c0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb33c4:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb33c8:	36d801d1	tbz	w17, #27, 0xfffff7fb3400
   0x0000fffff7fb33cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb33d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb33d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb33d8:	54000281	b.ne	0xfffff7fb3428  // b.any
   0x0000fffff7fb33dc:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb33e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb33e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb33e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb33ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb33f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb33f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb33f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb33fc:	54000169	b.ls	0xfffff7fb3428  // b.plast
   0x0000fffff7fb3400:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3404:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3408:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb340c:	36d80091	tbz	w17, #27, 0xfffff7fb341c
   0x0000fffff7fb3410:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3414:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3418:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb341c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3420:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb3424:	1400000e	b	0xfffff7fb345c
   0x0000fffff7fb3428:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb342c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3430:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3434:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3438:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fb343c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3440:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3444:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb3448:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb344c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3450:	d63f0200	blr	x16
   0x0000fffff7fb3454:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3458:	54004300	b.eq	0xfffff7fb3cb8  // b.none
   0x0000fffff7fb345c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3460:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3464:	540003a0	b.eq	0xfffff7fb34d8  // b.none
   0x0000fffff7fb3468:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb346c:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb3470:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb3474:	36d801d1	tbz	w17, #27, 0xfffff7fb34ac
   0x0000fffff7fb3478:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb347c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3480:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3484:	540002a1	b.ne	0xfffff7fb34d8  // b.any
   0x0000fffff7fb3488:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb348c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3490:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3494:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3498:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb349c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb34a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb34a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb34a8:	54000189	b.ls	0xfffff7fb34d8  // b.plast
   0x0000fffff7fb34ac:	36d8008d	tbz	w13, #27, 0xfffff7fb34bc
   0x0000fffff7fb34b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb34b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb34b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb34bc:	36d80091	tbz	w17, #27, 0xfffff7fb34cc
   0x0000fffff7fb34c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb34c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb34c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb34cc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb34d0:	b900016d	str	w13, [x11]
   0x0000fffff7fb34d4:	1400000e	b	0xfffff7fb350c
   0x0000fffff7fb34d8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb34dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb34e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb34e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb34e8:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fb34ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fb34f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb34f4:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb34f8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb34fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3500:	d63f0200	blr	x16
   0x0000fffff7fb3504:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3508:	54003dc0	b.eq	0xfffff7fb3cc0  // b.none
   0x0000fffff7fb350c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3510:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3514:	540004a0	b.eq	0xfffff7fb35a8  // b.none
   0x0000fffff7fb3518:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb351c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3520:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb3524:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3528:	54000400	b.eq	0xfffff7fb35a8  // b.none
   0x0000fffff7fb352c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3530:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb3534:	36d801d1	tbz	w17, #27, 0xfffff7fb356c
   0x0000fffff7fb3538:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb353c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3540:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3544:	54000321	b.ne	0xfffff7fb35a8  // b.any
   0x0000fffff7fb3548:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb354c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3550:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3554:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3558:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb355c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3560:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3564:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3568:	54000209	b.ls	0xfffff7fb35a8  // b.plast
   0x0000fffff7fb356c:	36d8008d	tbz	w13, #27, 0xfffff7fb357c
   0x0000fffff7fb3570:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3574:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3578:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb357c:	36d80091	tbz	w17, #27, 0xfffff7fb358c
   0x0000fffff7fb3580:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3584:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3588:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb358c:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb3590:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb3594:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb3598:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb359c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb35a0:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb35a4:	1400000e	b	0xfffff7fb35dc
   0x0000fffff7fb35a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb35ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb35b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb35b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb35b8:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fb35bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fb35c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb35c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb35c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb35cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb35d0:	d63f0200	blr	x16
   0x0000fffff7fb35d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb35d8:	54003780	b.eq	0xfffff7fb3cc8  // b.none
   0x0000fffff7fb35dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb35e0:	37d806a9	tbnz	w9, #27, 0xfffff7fb36b4
   0x0000fffff7fb35e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb35e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb35ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb35f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb35f4:	540001c1	b.ne	0xfffff7fb362c  // b.any
   0x0000fffff7fb35f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb35fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3604:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3608:	54000121	b.ne	0xfffff7fb362c  // b.any
   0x0000fffff7fb360c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3610:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb3614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb361c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3620:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb3624:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3628:	14000030	b	0xfffff7fb36e8
   0x0000fffff7fb362c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3630:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb3634:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3638:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb363c:	54000120	b.eq	0xfffff7fb3660  // b.none
   0x0000fffff7fb3640:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3644:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb364c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3650:	54000321	b.ne	0xfffff7fb36b4  // b.any
   0x0000fffff7fb3654:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3658:	9e620120	scvtf	d0, x9
   0x0000fffff7fb365c:	14000002	b	0xfffff7fb3664
   0x0000fffff7fb3660:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb3664:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3668:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb366c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3674:	54000120	b.eq	0xfffff7fb3698  // b.none
   0x0000fffff7fb3678:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb367c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3688:	54000161	b.ne	0xfffff7fb36b4  // b.any
   0x0000fffff7fb368c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb3690:	9e620121	scvtf	d1, x9
   0x0000fffff7fb3694:	14000002	b	0xfffff7fb369c
   0x0000fffff7fb3698:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb369c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb36a0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb36a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb36a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb36ac:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb36b0:	17ffffde	b	0xfffff7fb3628
   0x0000fffff7fb36b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb36b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb36bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fb36c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fb36c4:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fb36c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fb36cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fb36d0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb36d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb36d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb36dc:	d63f0200	blr	x16
   0x0000fffff7fb36e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb36e4:	54002f60	b.eq	0xfffff7fb3cd0  // b.none
   0x0000fffff7fb36e8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb36ec:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb36f0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb36f4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb36f8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb36fc:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb3700:	36d801d1	tbz	w17, #27, 0xfffff7fb3738
   0x0000fffff7fb3704:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3708:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb370c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3710:	54000281	b.ne	0xfffff7fb3760  // b.any
   0x0000fffff7fb3714:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb3718:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb371c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3720:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3724:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3728:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb372c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3730:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3734:	54000169	b.ls	0xfffff7fb3760  // b.plast
   0x0000fffff7fb3738:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb373c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3740:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3744:	36d80091	tbz	w17, #27, 0xfffff7fb3754
   0x0000fffff7fb3748:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb374c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3750:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3754:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3758:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb375c:	1400000e	b	0xfffff7fb3794
   0x0000fffff7fb3760:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3764:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3768:	aa1303e1	mov	x1, x19
   0x0000fffff7fb376c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3770:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fb3774:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3778:	aa1603e5	mov	x5, x22
   0x0000fffff7fb377c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb3780:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3784:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3788:	d63f0200	blr	x16
   0x0000fffff7fb378c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3790:	54002a40	b.eq	0xfffff7fb3cd8  // b.none
   0x0000fffff7fb3794:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3798:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb379c:	540003a0	b.eq	0xfffff7fb3810  // b.none
   0x0000fffff7fb37a0:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb37a4:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb37a8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb37ac:	36d801d1	tbz	w17, #27, 0xfffff7fb37e4
   0x0000fffff7fb37b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb37b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb37b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb37bc:	540002a1	b.ne	0xfffff7fb3810  // b.any
   0x0000fffff7fb37c0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb37c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb37c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb37cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb37d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb37d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb37d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb37dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb37e0:	54000189	b.ls	0xfffff7fb3810  // b.plast
   0x0000fffff7fb37e4:	36d8008d	tbz	w13, #27, 0xfffff7fb37f4
   0x0000fffff7fb37e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb37ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb37f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb37f4:	36d80091	tbz	w17, #27, 0xfffff7fb3804
   0x0000fffff7fb37f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb37fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3800:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3804:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb3808:	b900016d	str	w13, [x11]
   0x0000fffff7fb380c:	1400000e	b	0xfffff7fb3844
   0x0000fffff7fb3810:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb3814:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3818:	aa1303e1	mov	x1, x19
   0x0000fffff7fb381c:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3820:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fb3824:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3828:	aa1603e5	mov	x5, x22
   0x0000fffff7fb382c:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb3830:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3834:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3838:	d63f0200	blr	x16
   0x0000fffff7fb383c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3840:	54002500	b.eq	0xfffff7fb3ce0  // b.none
   0x0000fffff7fb3844:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fb3848:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb384c:	540004a0	b.eq	0xfffff7fb38e0  // b.none
   0x0000fffff7fb3850:	b940016d	ldr	w13, [x11]
   0x0000fffff7fb3854:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fb3858:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fb385c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fb3860:	54000400	b.eq	0xfffff7fb38e0  // b.none
   0x0000fffff7fb3864:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fb3868:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fb386c:	36d801d1	tbz	w17, #27, 0xfffff7fb38a4
   0x0000fffff7fb3870:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3874:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3878:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb387c:	54000321	b.ne	0xfffff7fb38e0  // b.any
   0x0000fffff7fb3880:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fb3884:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3888:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb388c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3890:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3894:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3898:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb389c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb38a0:	54000209	b.ls	0xfffff7fb38e0  // b.plast
   0x0000fffff7fb38a4:	36d8008d	tbz	w13, #27, 0xfffff7fb38b4
   0x0000fffff7fb38a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb38ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb38b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb38b4:	36d80091	tbz	w17, #27, 0xfffff7fb38c4
   0x0000fffff7fb38b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb38bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb38c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb38c4:	b940326e	ldr	w14, [x19, #48]
   0x0000fffff7fb38c8:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb38cc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fb38d0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fb38d4:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb38d8:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb38dc:	1400000e	b	0xfffff7fb3914
   0x0000fffff7fb38e0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fb38e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb38e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fb38ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fb38f0:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fb38f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fb38f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fb38fc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fb3900:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3908:	d63f0200	blr	x16
   0x0000fffff7fb390c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3910:	54001ec0	b.eq	0xfffff7fb3ce8  // b.none
   0x0000fffff7fb3914:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3918:	37d806a9	tbnz	w9, #27, 0xfffff7fb39ec
   0x0000fffff7fb391c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3920:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3928:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb392c:	540001c1	b.ne	0xfffff7fb3964  // b.any
   0x0000fffff7fb3930:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb3934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb393c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3940:	54000121	b.ne	0xfffff7fb3964  // b.any
   0x0000fffff7fb3944:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3948:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fb394c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fb3950:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3954:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3958:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fb395c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb3960:	14000030	b	0xfffff7fb3a20
   0x0000fffff7fb3964:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb3968:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb396c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3970:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3974:	54000120	b.eq	0xfffff7fb3998  // b.none
   0x0000fffff7fb3978:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fb397c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3980:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3984:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb3988:	54000321	b.ne	0xfffff7fb39ec  // b.any
   0x0000fffff7fb398c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fb3990:	9e620120	scvtf	d0, x9
   0x0000fffff7fb3994:	14000002	b	0xfffff7fb399c
   0x0000fffff7fb3998:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fb399c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb39a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb39a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb39a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb39ac:	54000120	b.eq	0xfffff7fb39d0  // b.none
   0x0000fffff7fb39b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fb39b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb39b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb39bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fb39c0:	54000161	b.ne	0xfffff7fb39ec  // b.any
   0x0000fffff7fb39c4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fb39c8:	9e620121	scvtf	d1, x9
   0x0000fffff7fb39cc:	14000002	b	0xfffff7fb39d4
   0x0000fffff7fb39d0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fb39d4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fb39d8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fb39dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fb39e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb39e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fb39e8:	17ffffde	b	0xfffff7fb3960
   0x0000fffff7fb39ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb39f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb39f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fb39f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fb39fc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fb3a00:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3a04:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3a08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fb3a0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3a10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3a14:	d63f0200	blr	x16
   0x0000fffff7fb3a18:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3a1c:	540016a0	b.eq	0xfffff7fb3cf0  // b.none
   0x0000fffff7fb3a20:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fb3a24:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fb3a28:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fb3a2c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fb3a30:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fb3a34:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fb3a38:	36d801d1	tbz	w17, #27, 0xfffff7fb3a70
   0x0000fffff7fb3a3c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3a40:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3a44:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3a48:	54000281	b.ne	0xfffff7fb3a98  // b.any
   0x0000fffff7fb3a4c:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fb3a50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3a54:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3a58:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3a5c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3a60:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3a64:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3a68:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3a6c:	54000169	b.ls	0xfffff7fb3a98  // b.plast
   0x0000fffff7fb3a70:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3a74:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3a78:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3a7c:	36d80091	tbz	w17, #27, 0xfffff7fb3a8c
   0x0000fffff7fb3a80:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3a84:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3a88:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3a8c:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fb3a90:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fb3a94:	1400000e	b	0xfffff7fb3acc
   0x0000fffff7fb3a98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3a9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3aa0:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3aa4:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3aa8:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fb3aac:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3ab0:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3ab4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fb3ab8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fb3abc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3ac0:	d63f0200	blr	x16
   0x0000fffff7fb3ac4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3ac8:	54001180	b.eq	0xfffff7fb3cf8  // b.none
   0x0000fffff7fb3acc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fb3ad0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fb3ad4:	540003a0	b.eq	0xfffff7fb3b48  // b.none
   0x0000fffff7fb3ad8:	b940226d	ldr	w13, [x19, #32]
   0x0000fffff7fb3adc:	f940166c	ldr	x12, [x19, #40]
   0x0000fffff7fb3ae0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fb3ae4:	36d801d1	tbz	w17, #27, 0xfffff7fb3b1c
   0x0000fffff7fb3ae8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fb3aec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fb3af0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fb3af4:	540002a1	b.ne	0xfffff7fb3b48  // b.any
   0x0000fffff7fb3af8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fb3afc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3b00:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fb3b04:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fb3b08:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fb3b0c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fb3b10:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fb3b14:	f100055f	cmp	x10, #0x1
   0x0000fffff7fb3b18:	54000189	b.ls	0xfffff7fb3b48  // b.plast
   0x0000fffff7fb3b1c:	36d8008d	tbz	w13, #27, 0xfffff7fb3b2c
   0x0000fffff7fb3b20:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fb3b24:	91000529	add	x9, x9, #0x1
   0x0000fffff7fb3b28:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fb3b2c:	36d80091	tbz	w17, #27, 0xfffff7fb3b3c
   0x0000fffff7fb3b30:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fb3b34:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fb3b38:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fb3b3c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fb3b40:	b900016d	str	w13, [x11]
   0x0000fffff7fb3b44:	1400000e	b	0xfffff7fb3b7c
   0x0000fffff7fb3b48:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fb3b4c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3b50:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3b54:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3b58:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fb3b5c:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3b60:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3b64:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fb3b68:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3b6c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3b70:	d63f0200	blr	x16
   0x0000fffff7fb3b74:	f100001f	cmp	x0, #0x0
   0x0000fffff7fb3b78:	54000c40	b.eq	0xfffff7fb3d00  // b.none
   0x0000fffff7fb3b7c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fb3b80:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fb3b84:	aa1303e1	mov	x1, x19
   0x0000fffff7fb3b88:	aa1503e2	mov	x2, x21
   0x0000fffff7fb3b8c:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fb3b90:	aa1403e4	mov	x4, x20
   0x0000fffff7fb3b94:	aa1603e5	mov	x5, x22
   0x0000fffff7fb3b98:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fb3b9c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fb3ba0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fb3ba4:	d63f0200	blr	x16
   0x0000fffff7fb3ba8:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb3bac:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb3bb0:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb3bb4:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb3bb8:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fb3bbc:	d65f03c0	ret
   0x0000fffff7fb3bc0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fb3bc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fb3bc8:	b900028a	str	w10, [x20]
   0x0000fffff7fb3bcc:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fb3bd0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fb3bd4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fb3bd8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fb3bdc:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fb3be0:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fb3be4:	d65f03c0	ret
   0x0000fffff7fb3be8:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fb3bec:	17fffff5	b	0xfffff7fb3bc0
   0x0000fffff7fb3bf0:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fb3bf4:	17fffff3	b	0xfffff7fb3bc0
   0x0000fffff7fb3bf8:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fb3bfc:	17fffff1	b	0xfffff7fb3bc0
   0x0000fffff7fb3c00:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fb3c04:	17ffffef	b	0xfffff7fb3bc0
   0x0000fffff7fb3c08:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fb3c0c:	17ffffed	b	0xfffff7fb3bc0
   0x0000fffff7fb3c10:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fb3c14:	17ffffeb	b	0xfffff7fb3bc0
   0x0000fffff7fb3c18:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fb3c1c:	17ffffe9	b	0xfffff7fb3bc0
   0x0000fffff7fb3c20:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fb3c24:	17ffffe7	b	0xfffff7fb3bc0
   0x0000fffff7fb3c28:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fb3c2c:	17ffffe5	b	0xfffff7fb3bc0
   0x0000fffff7fb3c30:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fb3c34:	17ffffe3	b	0xfffff7fb3bc0
   0x0000fffff7fb3c38:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fb3c3c:	17ffffe1	b	0xfffff7fb3bc0
   0x0000fffff7fb3c40:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fb3c44:	17ffffdf	b	0xfffff7fb3bc0
   0x0000fffff7fb3c48:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fb3c4c:	17ffffdd	b	0xfffff7fb3bc0
   0x0000fffff7fb3c50:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fb3c54:	17ffffdb	b	0xfffff7fb3bc0
   0x0000fffff7fb3c58:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fb3c5c:	17ffffd9	b	0xfffff7fb3bc0
   0x0000fffff7fb3c60:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fb3c64:	17ffffd7	b	0xfffff7fb3bc0
   0x0000fffff7fb3c68:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fb3c6c:	17ffffd5	b	0xfffff7fb3bc0
   0x0000fffff7fb3c70:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fb3c74:	17ffffd3	b	0xfffff7fb3bc0
   0x0000fffff7fb3c78:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fb3c7c:	17ffffd1	b	0xfffff7fb3bc0
   0x0000fffff7fb3c80:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fb3c84:	17ffffcf	b	0xfffff7fb3bc0
   0x0000fffff7fb3c88:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fb3c8c:	17ffffcd	b	0xfffff7fb3bc0
   0x0000fffff7fb3c90:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fb3c94:	17ffffcb	b	0xfffff7fb3bc0
   0x0000fffff7fb3c98:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fb3c9c:	17ffffc9	b	0xfffff7fb3bc0
   0x0000fffff7fb3ca0:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fb3ca4:	17ffffc7	b	0xfffff7fb3bc0
   0x0000fffff7fb3ca8:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fb3cac:	17ffffc5	b	0xfffff7fb3bc0
   0x0000fffff7fb3cb0:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fb3cb4:	17ffffc3	b	0xfffff7fb3bc0
   0x0000fffff7fb3cb8:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fb3cbc:	17ffffc1	b	0xfffff7fb3bc0
   0x0000fffff7fb3cc0:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fb3cc4:	17ffffbf	b	0xfffff7fb3bc0
   0x0000fffff7fb3cc8:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fb3ccc:	17ffffbd	b	0xfffff7fb3bc0
   0x0000fffff7fb3cd0:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fb3cd4:	17ffffbb	b	0xfffff7fb3bc0
   0x0000fffff7fb3cd8:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fb3cdc:	17ffffb9	b	0xfffff7fb3bc0
   0x0000fffff7fb3ce0:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fb3ce4:	17ffffb7	b	0xfffff7fb3bc0
   0x0000fffff7fb3ce8:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fb3cec:	17ffffb5	b	0xfffff7fb3bc0
   0x0000fffff7fb3cf0:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fb3cf4:	17ffffb3	b	0xfffff7fb3bc0
   0x0000fffff7fb3cf8:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fb3cfc:	17ffffb1	b	0xfffff7fb3bc0
   0x0000fffff7fb3d00:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fb3d04:	17ffffaf	b	0xfffff7fb3bc0
   0x0000fffff7fb3d08:	00000000	udf	#0
   0x0000fffff7fb3d0c:	00000000	udf	#0
   0x0000fffff7fb3d10:	00000000	udf	#0
   0x0000fffff7fb3d14:	00000000	udf	#0
   0x0000fffff7fb3d18:	00000000	udf	#0
   0x0000fffff7fb3d1c:	00000000	udf	#0
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
