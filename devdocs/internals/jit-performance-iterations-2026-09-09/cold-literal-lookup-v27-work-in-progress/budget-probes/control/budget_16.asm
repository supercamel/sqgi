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
   0x0000fffff7fa2058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa205c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2060:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2064:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa206c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2070:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2074:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa2078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa207c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2080:	d63f0200	blr	x16
   0x0000fffff7fa2084:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2088:	5400de60	b.eq	0xfffff7fa3c54  // b.none
   0x0000fffff7fa208c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2090:	37d800e9	tbnz	w9, #27, 0xfffff7fa20ac
   0x0000fffff7fa2094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa2098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa209c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa20a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa20a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa20a8:	1400000e	b	0xfffff7fa20e0
   0x0000fffff7fa20ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa20b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa20b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa20b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa20bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa20c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa20c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa20c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa20cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa20d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa20d4:	d63f0200	blr	x16
   0x0000fffff7fa20d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa20dc:	5400dc00	b.eq	0xfffff7fa3c5c  // b.none
   0x0000fffff7fa20e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa20e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa20e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa20ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa20f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa20f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa20f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa20fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa2100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2108:	d63f0200	blr	x16
   0x0000fffff7fa210c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2110:	5400daa0	b.eq	0xfffff7fa3c64  // b.none
   0x0000fffff7fa2114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2118:	37d800e9	tbnz	w9, #27, 0xfffff7fa2134
   0x0000fffff7fa211c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa2120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa212c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2130:	1400000e	b	0xfffff7fa2168
   0x0000fffff7fa2134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa213c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2140:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7fa2148:	aa1403e4	mov	x4, x20
   0x0000fffff7fa214c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2150:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7fa2154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa215c:	d63f0200	blr	x16
   0x0000fffff7fa2160:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2164:	5400d840	b.eq	0xfffff7fa3c6c  // b.none
   0x0000fffff7fa2168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa216c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2170:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2174:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7fa217c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2180:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa2188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa218c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2190:	d63f0200	blr	x16
   0x0000fffff7fa2194:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2198:	5400d6e0	b.eq	0xfffff7fa3c74  // b.none
   0x0000fffff7fa219c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa21a0:	37d806a9	tbnz	w9, #27, 0xfffff7fa2274
   0x0000fffff7fa21a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa21a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa21ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa21b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa21b4:	540001c1	b.ne	0xfffff7fa21ec  // b.any
   0x0000fffff7fa21b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa21bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa21c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa21c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa21c8:	54000121	b.ne	0xfffff7fa21ec  // b.any
   0x0000fffff7fa21cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa21d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa21d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa21d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa21dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa21e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa21e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa21e8:	14000030	b	0xfffff7fa22a8
   0x0000fffff7fa21ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa21f0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa21f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa21f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa21fc:	54000120	b.eq	0xfffff7fa2220  // b.none
   0x0000fffff7fa2200:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2204:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2208:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa220c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2210:	54000321	b.ne	0xfffff7fa2274  // b.any
   0x0000fffff7fa2214:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2218:	9e620120	scvtf	d0, x9
   0x0000fffff7fa221c:	14000002	b	0xfffff7fa2224
   0x0000fffff7fa2220:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa2224:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2228:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa222c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2230:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2234:	54000120	b.eq	0xfffff7fa2258  // b.none
   0x0000fffff7fa2238:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa223c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2240:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2244:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2248:	54000161	b.ne	0xfffff7fa2274  // b.any
   0x0000fffff7fa224c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2250:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2254:	14000002	b	0xfffff7fa225c
   0x0000fffff7fa2258:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa225c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2260:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa2264:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2268:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa226c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2270:	17ffffde	b	0xfffff7fa21e8
   0x0000fffff7fa2274:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2278:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa227c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2280:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2284:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7fa2288:	aa1403e4	mov	x4, x20
   0x0000fffff7fa228c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2290:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa2294:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2298:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa229c:	d63f0200	blr	x16
   0x0000fffff7fa22a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa22a4:	5400cec0	b.eq	0xfffff7fa3c7c  // b.none
   0x0000fffff7fa22a8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa22ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa22b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa22b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa22b8:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7fa22bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa22c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa22c4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa22c8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa22cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa22d0:	d63f0200	blr	x16
   0x0000fffff7fa22d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa22d8:	5400cd60	b.eq	0xfffff7fa3c84  // b.none
   0x0000fffff7fa22dc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa22e0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa22e4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa22e8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa22ec:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7fa22f0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa22f4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa22f8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa22fc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2300:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2304:	d63f0200	blr	x16
   0x0000fffff7fa2308:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa230c:	5400cc00	b.eq	0xfffff7fa3c8c  // b.none
   0x0000fffff7fa2310:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2314:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2318:	aa1303e1	mov	x1, x19
   0x0000fffff7fa231c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2320:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7fa2324:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2328:	aa1603e5	mov	x5, x22
   0x0000fffff7fa232c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa2330:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2334:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2338:	d63f0200	blr	x16
   0x0000fffff7fa233c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2340:	5400caa0	b.eq	0xfffff7fa3c94  // b.none
   0x0000fffff7fa2344:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2348:	37d806a9	tbnz	w9, #27, 0xfffff7fa241c
   0x0000fffff7fa234c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2350:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2354:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2358:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa235c:	540001c1	b.ne	0xfffff7fa2394  // b.any
   0x0000fffff7fa2360:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2364:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa236c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2370:	54000121	b.ne	0xfffff7fa2394  // b.any
   0x0000fffff7fa2374:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2378:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa237c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2380:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2384:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2388:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa238c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2390:	14000030	b	0xfffff7fa2450
   0x0000fffff7fa2394:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2398:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa239c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa23a0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa23a4:	54000120	b.eq	0xfffff7fa23c8  // b.none
   0x0000fffff7fa23a8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa23ac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa23b0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa23b4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa23b8:	54000321	b.ne	0xfffff7fa241c  // b.any
   0x0000fffff7fa23bc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa23c0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa23c4:	14000002	b	0xfffff7fa23cc
   0x0000fffff7fa23c8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa23cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa23d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa23d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa23d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa23dc:	54000120	b.eq	0xfffff7fa2400  // b.none
   0x0000fffff7fa23e0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa23e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa23e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa23ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa23f0:	54000161	b.ne	0xfffff7fa241c  // b.any
   0x0000fffff7fa23f4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa23f8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa23fc:	14000002	b	0xfffff7fa2404
   0x0000fffff7fa2400:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa2404:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2408:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa240c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2410:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2414:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2418:	17ffffde	b	0xfffff7fa2390
   0x0000fffff7fa241c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2420:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2424:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2428:	aa1503e2	mov	x2, x21
   0x0000fffff7fa242c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7fa2430:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2434:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2438:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa243c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2440:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2444:	d63f0200	blr	x16
   0x0000fffff7fa2448:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa244c:	5400c280	b.eq	0xfffff7fa3c9c  // b.none
   0x0000fffff7fa2450:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2454:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2458:	aa1303e1	mov	x1, x19
   0x0000fffff7fa245c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2460:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7fa2464:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2468:	aa1603e5	mov	x5, x22
   0x0000fffff7fa246c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa2470:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2474:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2478:	d63f0200	blr	x16
   0x0000fffff7fa247c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2480:	5400c120	b.eq	0xfffff7fa3ca4  // b.none
   0x0000fffff7fa2484:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2488:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa248c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2490:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2494:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7fa2498:	aa1403e4	mov	x4, x20
   0x0000fffff7fa249c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa24a0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa24a4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa24a8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa24ac:	d63f0200	blr	x16
   0x0000fffff7fa24b0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa24b4:	5400bfc0	b.eq	0xfffff7fa3cac  // b.none
   0x0000fffff7fa24b8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa24bc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa24c0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa24c4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa24c8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7fa24cc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa24d0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa24d4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa24d8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa24dc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa24e0:	d63f0200	blr	x16
   0x0000fffff7fa24e4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa24e8:	5400be60	b.eq	0xfffff7fa3cb4  // b.none
   0x0000fffff7fa24ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa24f0:	37d806a9	tbnz	w9, #27, 0xfffff7fa25c4
   0x0000fffff7fa24f4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa24f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa24fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2500:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2504:	540001c1	b.ne	0xfffff7fa253c  // b.any
   0x0000fffff7fa2508:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa250c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2510:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2514:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2518:	54000121	b.ne	0xfffff7fa253c  // b.any
   0x0000fffff7fa251c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2520:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa2524:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2528:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa252c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2530:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa2534:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2538:	14000030	b	0xfffff7fa25f8
   0x0000fffff7fa253c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2540:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2544:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2548:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa254c:	54000120	b.eq	0xfffff7fa2570  // b.none
   0x0000fffff7fa2550:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2554:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2558:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa255c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2560:	54000321	b.ne	0xfffff7fa25c4  // b.any
   0x0000fffff7fa2564:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2568:	9e620120	scvtf	d0, x9
   0x0000fffff7fa256c:	14000002	b	0xfffff7fa2574
   0x0000fffff7fa2570:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa2574:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2578:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa257c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2580:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2584:	54000120	b.eq	0xfffff7fa25a8  // b.none
   0x0000fffff7fa2588:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa258c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2590:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2594:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2598:	54000161	b.ne	0xfffff7fa25c4  // b.any
   0x0000fffff7fa259c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa25a0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa25a4:	14000002	b	0xfffff7fa25ac
   0x0000fffff7fa25a8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa25ac:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa25b0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa25b4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa25b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa25bc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa25c0:	17ffffde	b	0xfffff7fa2538
   0x0000fffff7fa25c4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa25c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa25cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa25d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa25d4:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7fa25d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa25dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa25e0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa25e4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa25e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa25ec:	d63f0200	blr	x16
   0x0000fffff7fa25f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa25f4:	5400b640	b.eq	0xfffff7fa3cbc  // b.none
   0x0000fffff7fa25f8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa25fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2600:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2604:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2608:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7fa260c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2610:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2614:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa2618:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa261c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2620:	d63f0200	blr	x16
   0x0000fffff7fa2624:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2628:	5400b4e0	b.eq	0xfffff7fa3cc4  // b.none
   0x0000fffff7fa262c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2630:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2634:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2638:	aa1503e2	mov	x2, x21
   0x0000fffff7fa263c:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7fa2640:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2644:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2648:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa264c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2650:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2654:	d63f0200	blr	x16
   0x0000fffff7fa2658:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa265c:	5400b380	b.eq	0xfffff7fa3ccc  // b.none
   0x0000fffff7fa2660:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2664:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2668:	aa1303e1	mov	x1, x19
   0x0000fffff7fa266c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2670:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7fa2674:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2678:	aa1603e5	mov	x5, x22
   0x0000fffff7fa267c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa2680:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2688:	d63f0200	blr	x16
   0x0000fffff7fa268c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2690:	5400b220	b.eq	0xfffff7fa3cd4  // b.none
   0x0000fffff7fa2694:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2698:	37d806a9	tbnz	w9, #27, 0xfffff7fa276c
   0x0000fffff7fa269c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa26a0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa26a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa26ac:	540001c1	b.ne	0xfffff7fa26e4  // b.any
   0x0000fffff7fa26b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa26b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa26b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa26c0:	54000121	b.ne	0xfffff7fa26e4  // b.any
   0x0000fffff7fa26c4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa26c8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa26cc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa26d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa26d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26d8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa26dc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa26e0:	14000030	b	0xfffff7fa27a0
   0x0000fffff7fa26e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa26e8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa26ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa26f4:	54000120	b.eq	0xfffff7fa2718  // b.none
   0x0000fffff7fa26f8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa26fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2700:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2704:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2708:	54000321	b.ne	0xfffff7fa276c  // b.any
   0x0000fffff7fa270c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2710:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2714:	14000002	b	0xfffff7fa271c
   0x0000fffff7fa2718:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa271c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2720:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2724:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2728:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa272c:	54000120	b.eq	0xfffff7fa2750  // b.none
   0x0000fffff7fa2730:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2734:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2738:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa273c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2740:	54000161	b.ne	0xfffff7fa276c  // b.any
   0x0000fffff7fa2744:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2748:	9e620121	scvtf	d1, x9
   0x0000fffff7fa274c:	14000002	b	0xfffff7fa2754
   0x0000fffff7fa2750:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa2754:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2758:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa275c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2764:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2768:	17ffffde	b	0xfffff7fa26e0
   0x0000fffff7fa276c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2770:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2774:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2778:	aa1503e2	mov	x2, x21
   0x0000fffff7fa277c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa2780:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2784:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2788:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa278c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2790:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2794:	d63f0200	blr	x16
   0x0000fffff7fa2798:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa279c:	5400aa00	b.eq	0xfffff7fa3cdc  // b.none
   0x0000fffff7fa27a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa27a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa27a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa27ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa27b0:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa27b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa27b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa27bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa27c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa27c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa27c8:	d63f0200	blr	x16
   0x0000fffff7fa27cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa27d0:	5400a8a0	b.eq	0xfffff7fa3ce4  // b.none
   0x0000fffff7fa27d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa27d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa27dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa27e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa27e4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa27e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa27ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa27f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa27f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa27f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa27fc:	d63f0200	blr	x16
   0x0000fffff7fa2800:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2804:	5400a740	b.eq	0xfffff7fa3cec  // b.none
   0x0000fffff7fa2808:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa280c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2810:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2814:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2818:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa281c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2820:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2824:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa2828:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa282c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2830:	d63f0200	blr	x16
   0x0000fffff7fa2834:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2838:	5400a5e0	b.eq	0xfffff7fa3cf4  // b.none
   0x0000fffff7fa283c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2840:	37d806a9	tbnz	w9, #27, 0xfffff7fa2914
   0x0000fffff7fa2844:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2848:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa284c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2850:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2854:	540001c1	b.ne	0xfffff7fa288c  // b.any
   0x0000fffff7fa2858:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa285c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2860:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2864:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2868:	54000121	b.ne	0xfffff7fa288c  // b.any
   0x0000fffff7fa286c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2870:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa2874:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2878:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa287c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2880:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa2884:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2888:	14000030	b	0xfffff7fa2948
   0x0000fffff7fa288c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2890:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2894:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2898:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa289c:	54000120	b.eq	0xfffff7fa28c0  // b.none
   0x0000fffff7fa28a0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa28a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa28a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa28ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa28b0:	54000321	b.ne	0xfffff7fa2914  // b.any
   0x0000fffff7fa28b4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa28b8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa28bc:	14000002	b	0xfffff7fa28c4
   0x0000fffff7fa28c0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa28c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa28c8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa28cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa28d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa28d4:	54000120	b.eq	0xfffff7fa28f8  // b.none
   0x0000fffff7fa28d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa28dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa28e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa28e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa28e8:	54000161	b.ne	0xfffff7fa2914  // b.any
   0x0000fffff7fa28ec:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa28f0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa28f4:	14000002	b	0xfffff7fa28fc
   0x0000fffff7fa28f8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa28fc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2900:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa2904:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2908:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa290c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2910:	17ffffde	b	0xfffff7fa2888
   0x0000fffff7fa2914:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2918:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa291c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2920:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2924:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa2928:	aa1403e4	mov	x4, x20
   0x0000fffff7fa292c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2930:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa2934:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa293c:	d63f0200	blr	x16
   0x0000fffff7fa2940:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2944:	54009dc0	b.eq	0xfffff7fa3cfc  // b.none
   0x0000fffff7fa2948:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa294c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2950:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2954:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2958:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa295c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2960:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2964:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa2968:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa296c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2970:	d63f0200	blr	x16
   0x0000fffff7fa2974:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2978:	54009c60	b.eq	0xfffff7fa3d04  // b.none
   0x0000fffff7fa297c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2980:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2984:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2988:	aa1503e2	mov	x2, x21
   0x0000fffff7fa298c:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa2990:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2994:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2998:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa299c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa29a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa29a4:	d63f0200	blr	x16
   0x0000fffff7fa29a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa29ac:	54009b00	b.eq	0xfffff7fa3d0c  // b.none
   0x0000fffff7fa29b0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa29b4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa29b8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa29bc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa29c0:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa29c4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa29c8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa29cc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa29d0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa29d4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa29d8:	d63f0200	blr	x16
   0x0000fffff7fa29dc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa29e0:	540099a0	b.eq	0xfffff7fa3d14  // b.none
   0x0000fffff7fa29e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa29e8:	37d806a9	tbnz	w9, #27, 0xfffff7fa2abc
   0x0000fffff7fa29ec:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa29f0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa29f4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa29f8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa29fc:	540001c1	b.ne	0xfffff7fa2a34  // b.any
   0x0000fffff7fa2a00:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2a04:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2a08:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a0c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2a10:	54000121	b.ne	0xfffff7fa2a34  // b.any
   0x0000fffff7fa2a14:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2a18:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa2a1c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2a20:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2a24:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a28:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa2a2c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2a30:	14000030	b	0xfffff7fa2af0
   0x0000fffff7fa2a34:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2a38:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2a3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a40:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2a44:	54000120	b.eq	0xfffff7fa2a68  // b.none
   0x0000fffff7fa2a48:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2a4c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2a50:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a54:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2a58:	54000321	b.ne	0xfffff7fa2abc  // b.any
   0x0000fffff7fa2a5c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2a60:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2a64:	14000002	b	0xfffff7fa2a6c
   0x0000fffff7fa2a68:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa2a6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2a70:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2a74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a78:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2a7c:	54000120	b.eq	0xfffff7fa2aa0  // b.none
   0x0000fffff7fa2a80:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2a84:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2a88:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a8c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2a90:	54000161	b.ne	0xfffff7fa2abc  // b.any
   0x0000fffff7fa2a94:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2a98:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2a9c:	14000002	b	0xfffff7fa2aa4
   0x0000fffff7fa2aa0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa2aa4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2aa8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa2aac:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2ab0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ab4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2ab8:	17ffffde	b	0xfffff7fa2a30
   0x0000fffff7fa2abc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2ac0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2ac4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2ac8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2acc:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa2ad0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2ad4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2ad8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa2adc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2ae0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2ae4:	d63f0200	blr	x16
   0x0000fffff7fa2ae8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2aec:	54009180	b.eq	0xfffff7fa3d1c  // b.none
   0x0000fffff7fa2af0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2af4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2af8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2afc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2b00:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa2b04:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2b08:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2b0c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa2b10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2b14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2b18:	d63f0200	blr	x16
   0x0000fffff7fa2b1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2b20:	54009020	b.eq	0xfffff7fa3d24  // b.none
   0x0000fffff7fa2b24:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2b28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2b2c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2b30:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2b34:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa2b38:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2b3c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2b40:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa2b44:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2b48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2b4c:	d63f0200	blr	x16
   0x0000fffff7fa2b50:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2b54:	54008ec0	b.eq	0xfffff7fa3d2c  // b.none
   0x0000fffff7fa2b58:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2b5c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2b60:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2b64:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2b68:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa2b6c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2b70:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2b74:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa2b78:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2b7c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2b80:	d63f0200	blr	x16
   0x0000fffff7fa2b84:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2b88:	54008d60	b.eq	0xfffff7fa3d34  // b.none
   0x0000fffff7fa2b8c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2b90:	37d806a9	tbnz	w9, #27, 0xfffff7fa2c64
   0x0000fffff7fa2b94:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2b98:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2b9c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ba0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2ba4:	540001c1	b.ne	0xfffff7fa2bdc  // b.any
   0x0000fffff7fa2ba8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2bac:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2bb0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2bb4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2bb8:	54000121	b.ne	0xfffff7fa2bdc  // b.any
   0x0000fffff7fa2bbc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2bc0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa2bc4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2bc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2bcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2bd0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa2bd4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2bd8:	14000030	b	0xfffff7fa2c98
   0x0000fffff7fa2bdc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2be0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2be4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2be8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2bec:	54000120	b.eq	0xfffff7fa2c10  // b.none
   0x0000fffff7fa2bf0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2bf4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2bf8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2bfc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2c00:	54000321	b.ne	0xfffff7fa2c64  // b.any
   0x0000fffff7fa2c04:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2c08:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2c0c:	14000002	b	0xfffff7fa2c14
   0x0000fffff7fa2c10:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa2c14:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2c18:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2c1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c20:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2c24:	54000120	b.eq	0xfffff7fa2c48  // b.none
   0x0000fffff7fa2c28:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2c2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2c30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c34:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2c38:	54000161	b.ne	0xfffff7fa2c64  // b.any
   0x0000fffff7fa2c3c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2c40:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2c44:	14000002	b	0xfffff7fa2c4c
   0x0000fffff7fa2c48:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa2c4c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2c50:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa2c54:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2c58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c5c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2c60:	17ffffde	b	0xfffff7fa2bd8
   0x0000fffff7fa2c64:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2c68:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2c6c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2c70:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2c74:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa2c78:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2c7c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2c80:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa2c84:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2c88:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2c8c:	d63f0200	blr	x16
   0x0000fffff7fa2c90:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2c94:	54008540	b.eq	0xfffff7fa3d3c  // b.none
   0x0000fffff7fa2c98:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2c9c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2ca0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2ca4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2ca8:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa2cac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2cb0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2cb4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa2cb8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2cbc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2cc0:	d63f0200	blr	x16
   0x0000fffff7fa2cc4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2cc8:	540083e0	b.eq	0xfffff7fa3d44  // b.none
   0x0000fffff7fa2ccc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2cd0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2cd4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2cd8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2cdc:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa2ce0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2ce4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2ce8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa2cec:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2cf0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2cf4:	d63f0200	blr	x16
   0x0000fffff7fa2cf8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2cfc:	54008280	b.eq	0xfffff7fa3d4c  // b.none
   0x0000fffff7fa2d00:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2d04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2d08:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2d0c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2d10:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa2d14:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2d18:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2d1c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa2d20:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2d24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2d28:	d63f0200	blr	x16
   0x0000fffff7fa2d2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2d30:	54008120	b.eq	0xfffff7fa3d54  // b.none
   0x0000fffff7fa2d34:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2d38:	37d806a9	tbnz	w9, #27, 0xfffff7fa2e0c
   0x0000fffff7fa2d3c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2d40:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2d44:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2d48:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2d4c:	540001c1	b.ne	0xfffff7fa2d84  // b.any
   0x0000fffff7fa2d50:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2d54:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2d58:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2d5c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2d60:	54000121	b.ne	0xfffff7fa2d84  // b.any
   0x0000fffff7fa2d64:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2d68:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa2d6c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2d70:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2d74:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2d78:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa2d7c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2d80:	14000030	b	0xfffff7fa2e40
   0x0000fffff7fa2d84:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2d88:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2d8c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2d90:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2d94:	54000120	b.eq	0xfffff7fa2db8  // b.none
   0x0000fffff7fa2d98:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2d9c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2da0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2da4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2da8:	54000321	b.ne	0xfffff7fa2e0c  // b.any
   0x0000fffff7fa2dac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2db0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2db4:	14000002	b	0xfffff7fa2dbc
   0x0000fffff7fa2db8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa2dbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2dc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2dc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2dc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2dcc:	54000120	b.eq	0xfffff7fa2df0  // b.none
   0x0000fffff7fa2dd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2dd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2dd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ddc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2de0:	54000161	b.ne	0xfffff7fa2e0c  // b.any
   0x0000fffff7fa2de4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2de8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2dec:	14000002	b	0xfffff7fa2df4
   0x0000fffff7fa2df0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa2df4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2df8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa2dfc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2e00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2e04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2e08:	17ffffde	b	0xfffff7fa2d80
   0x0000fffff7fa2e0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2e10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2e14:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2e18:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2e1c:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa2e20:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2e24:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2e28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa2e2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2e30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2e34:	d63f0200	blr	x16
   0x0000fffff7fa2e38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2e3c:	54007900	b.eq	0xfffff7fa3d5c  // b.none
   0x0000fffff7fa2e40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2e44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2e48:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2e4c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2e50:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa2e54:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2e58:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2e5c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa2e60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2e64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2e68:	d63f0200	blr	x16
   0x0000fffff7fa2e6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2e70:	540077a0	b.eq	0xfffff7fa3d64  // b.none
   0x0000fffff7fa2e74:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2e78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2e7c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2e80:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2e84:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa2e88:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2e8c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2e90:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa2e94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2e98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2e9c:	d63f0200	blr	x16
   0x0000fffff7fa2ea0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2ea4:	54007640	b.eq	0xfffff7fa3d6c  // b.none
   0x0000fffff7fa2ea8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2eac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2eb0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2eb4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2eb8:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa2ebc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2ec0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2ec4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa2ec8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2ecc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2ed0:	d63f0200	blr	x16
   0x0000fffff7fa2ed4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2ed8:	540074e0	b.eq	0xfffff7fa3d74  // b.none
   0x0000fffff7fa2edc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2ee0:	37d806a9	tbnz	w9, #27, 0xfffff7fa2fb4
   0x0000fffff7fa2ee4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2ee8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2eec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2ef0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2ef4:	540001c1	b.ne	0xfffff7fa2f2c  // b.any
   0x0000fffff7fa2ef8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2efc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2f00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2f04:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2f08:	54000121	b.ne	0xfffff7fa2f2c  // b.any
   0x0000fffff7fa2f0c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2f10:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa2f14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2f18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2f1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2f20:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa2f24:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2f28:	14000030	b	0xfffff7fa2fe8
   0x0000fffff7fa2f2c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2f30:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2f34:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2f38:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2f3c:	54000120	b.eq	0xfffff7fa2f60  // b.none
   0x0000fffff7fa2f40:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa2f44:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2f48:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2f4c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2f50:	54000321	b.ne	0xfffff7fa2fb4  // b.any
   0x0000fffff7fa2f54:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa2f58:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2f5c:	14000002	b	0xfffff7fa2f64
   0x0000fffff7fa2f60:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa2f64:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2f68:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2f6c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2f70:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2f74:	54000120	b.eq	0xfffff7fa2f98  // b.none
   0x0000fffff7fa2f78:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2f7c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2f80:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2f84:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2f88:	54000161	b.ne	0xfffff7fa2fb4  // b.any
   0x0000fffff7fa2f8c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2f90:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2f94:	14000002	b	0xfffff7fa2f9c
   0x0000fffff7fa2f98:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa2f9c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2fa0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa2fa4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2fa8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2fac:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa2fb0:	17ffffde	b	0xfffff7fa2f28
   0x0000fffff7fa2fb4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2fb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2fbc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2fc0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2fc4:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa2fc8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2fcc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2fd0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa2fd4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2fd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2fdc:	d63f0200	blr	x16
   0x0000fffff7fa2fe0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2fe4:	54006cc0	b.eq	0xfffff7fa3d7c  // b.none
   0x0000fffff7fa2fe8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2fec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2ff0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2ff4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2ff8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa2ffc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3000:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3004:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa3008:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa300c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3010:	d63f0200	blr	x16
   0x0000fffff7fa3014:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3018:	54006b60	b.eq	0xfffff7fa3d84  // b.none
   0x0000fffff7fa301c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa3020:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3024:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3028:	aa1503e2	mov	x2, x21
   0x0000fffff7fa302c:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa3030:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3034:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3038:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa303c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3044:	d63f0200	blr	x16
   0x0000fffff7fa3048:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa304c:	54006a00	b.eq	0xfffff7fa3d8c  // b.none
   0x0000fffff7fa3050:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3054:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3058:	aa1303e1	mov	x1, x19
   0x0000fffff7fa305c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3060:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa3064:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3068:	aa1603e5	mov	x5, x22
   0x0000fffff7fa306c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa3070:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3074:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3078:	d63f0200	blr	x16
   0x0000fffff7fa307c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3080:	540068a0	b.eq	0xfffff7fa3d94  // b.none
   0x0000fffff7fa3084:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3088:	37d806a9	tbnz	w9, #27, 0xfffff7fa315c
   0x0000fffff7fa308c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3090:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3094:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3098:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa309c:	540001c1	b.ne	0xfffff7fa30d4  // b.any
   0x0000fffff7fa30a0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa30a4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa30a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa30ac:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa30b0:	54000121	b.ne	0xfffff7fa30d4  // b.any
   0x0000fffff7fa30b4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa30b8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa30bc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa30c0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa30c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa30c8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa30cc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa30d0:	14000030	b	0xfffff7fa3190
   0x0000fffff7fa30d4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa30d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa30dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa30e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa30e4:	54000120	b.eq	0xfffff7fa3108  // b.none
   0x0000fffff7fa30e8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa30ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa30f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa30f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa30f8:	54000321	b.ne	0xfffff7fa315c  // b.any
   0x0000fffff7fa30fc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa3100:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3104:	14000002	b	0xfffff7fa310c
   0x0000fffff7fa3108:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa310c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3110:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3114:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3118:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa311c:	54000120	b.eq	0xfffff7fa3140  // b.none
   0x0000fffff7fa3120:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3124:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3128:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa312c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3130:	54000161	b.ne	0xfffff7fa315c  // b.any
   0x0000fffff7fa3134:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3138:	9e620121	scvtf	d1, x9
   0x0000fffff7fa313c:	14000002	b	0xfffff7fa3144
   0x0000fffff7fa3140:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa3144:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3148:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa314c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3150:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3154:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa3158:	17ffffde	b	0xfffff7fa30d0
   0x0000fffff7fa315c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3160:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3164:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3168:	aa1503e2	mov	x2, x21
   0x0000fffff7fa316c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa3170:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3174:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3178:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa317c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3180:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3184:	d63f0200	blr	x16
   0x0000fffff7fa3188:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa318c:	54006080	b.eq	0xfffff7fa3d9c  // b.none
   0x0000fffff7fa3190:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3194:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3198:	aa1303e1	mov	x1, x19
   0x0000fffff7fa319c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa31a0:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa31a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa31a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa31ac:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa31b0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa31b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa31b8:	d63f0200	blr	x16
   0x0000fffff7fa31bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa31c0:	54005f20	b.eq	0xfffff7fa3da4  // b.none
   0x0000fffff7fa31c4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa31c8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa31cc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa31d0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa31d4:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa31d8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa31dc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa31e0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa31e4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa31e8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa31ec:	d63f0200	blr	x16
   0x0000fffff7fa31f0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa31f4:	54005dc0	b.eq	0xfffff7fa3dac  // b.none
   0x0000fffff7fa31f8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa31fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3200:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3204:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3208:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa320c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3210:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3214:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa3218:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa321c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3220:	d63f0200	blr	x16
   0x0000fffff7fa3224:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3228:	54005c60	b.eq	0xfffff7fa3db4  // b.none
   0x0000fffff7fa322c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3230:	37d806a9	tbnz	w9, #27, 0xfffff7fa3304
   0x0000fffff7fa3234:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3238:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa323c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3240:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3244:	540001c1	b.ne	0xfffff7fa327c  // b.any
   0x0000fffff7fa3248:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa324c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3250:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3254:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3258:	54000121	b.ne	0xfffff7fa327c  // b.any
   0x0000fffff7fa325c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa3260:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa3264:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3268:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa326c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3270:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa3274:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa3278:	14000030	b	0xfffff7fa3338
   0x0000fffff7fa327c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3280:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3284:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3288:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa328c:	54000120	b.eq	0xfffff7fa32b0  // b.none
   0x0000fffff7fa3290:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3294:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3298:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa329c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa32a0:	54000321	b.ne	0xfffff7fa3304  // b.any
   0x0000fffff7fa32a4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa32a8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa32ac:	14000002	b	0xfffff7fa32b4
   0x0000fffff7fa32b0:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa32b4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa32b8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa32bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa32c0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa32c4:	54000120	b.eq	0xfffff7fa32e8  // b.none
   0x0000fffff7fa32c8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa32cc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa32d0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa32d4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa32d8:	54000161	b.ne	0xfffff7fa3304  // b.any
   0x0000fffff7fa32dc:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa32e0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa32e4:	14000002	b	0xfffff7fa32ec
   0x0000fffff7fa32e8:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa32ec:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa32f0:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa32f4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa32f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa32fc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa3300:	17ffffde	b	0xfffff7fa3278
   0x0000fffff7fa3304:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3308:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa330c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3310:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3314:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa3318:	aa1403e4	mov	x4, x20
   0x0000fffff7fa331c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3320:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa3324:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3328:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa332c:	d63f0200	blr	x16
   0x0000fffff7fa3330:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3334:	54005440	b.eq	0xfffff7fa3dbc  // b.none
   0x0000fffff7fa3338:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa333c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3340:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3344:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3348:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa334c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3350:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3354:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa3358:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa335c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3360:	d63f0200	blr	x16
   0x0000fffff7fa3364:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3368:	540052e0	b.eq	0xfffff7fa3dc4  // b.none
   0x0000fffff7fa336c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa3370:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3374:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3378:	aa1503e2	mov	x2, x21
   0x0000fffff7fa337c:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa3380:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3384:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3388:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa338c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3390:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3394:	d63f0200	blr	x16
   0x0000fffff7fa3398:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa339c:	54005180	b.eq	0xfffff7fa3dcc  // b.none
   0x0000fffff7fa33a0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa33a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa33a8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa33ac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa33b0:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fa33b4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa33b8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa33bc:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa33c0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa33c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa33c8:	d63f0200	blr	x16
   0x0000fffff7fa33cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa33d0:	54005020	b.eq	0xfffff7fa3dd4  // b.none
   0x0000fffff7fa33d4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa33d8:	37d806a9	tbnz	w9, #27, 0xfffff7fa34ac
   0x0000fffff7fa33dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa33e0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa33e4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa33e8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa33ec:	540001c1	b.ne	0xfffff7fa3424  // b.any
   0x0000fffff7fa33f0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa33f4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa33f8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa33fc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3400:	54000121	b.ne	0xfffff7fa3424  // b.any
   0x0000fffff7fa3404:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa3408:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa340c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3410:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3414:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3418:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa341c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa3420:	14000030	b	0xfffff7fa34e0
   0x0000fffff7fa3424:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3428:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa342c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3430:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3434:	54000120	b.eq	0xfffff7fa3458  // b.none
   0x0000fffff7fa3438:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa343c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3440:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3444:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3448:	54000321	b.ne	0xfffff7fa34ac  // b.any
   0x0000fffff7fa344c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa3450:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3454:	14000002	b	0xfffff7fa345c
   0x0000fffff7fa3458:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa345c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3460:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3464:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3468:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa346c:	54000120	b.eq	0xfffff7fa3490  // b.none
   0x0000fffff7fa3470:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3474:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3478:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa347c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3480:	54000161	b.ne	0xfffff7fa34ac  // b.any
   0x0000fffff7fa3484:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3488:	9e620121	scvtf	d1, x9
   0x0000fffff7fa348c:	14000002	b	0xfffff7fa3494
   0x0000fffff7fa3490:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa3494:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3498:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa349c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa34a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa34a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa34a8:	17ffffde	b	0xfffff7fa3420
   0x0000fffff7fa34ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa34b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa34b4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa34b8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa34bc:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7fa34c0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa34c4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa34c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa34cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa34d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa34d4:	d63f0200	blr	x16
   0x0000fffff7fa34d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa34dc:	54004800	b.eq	0xfffff7fa3ddc  // b.none
   0x0000fffff7fa34e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa34e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa34e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa34ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa34f0:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7fa34f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa34f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa34fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa3500:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3504:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3508:	d63f0200	blr	x16
   0x0000fffff7fa350c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3510:	540046a0	b.eq	0xfffff7fa3de4  // b.none
   0x0000fffff7fa3514:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa3518:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa351c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3520:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3524:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7fa3528:	aa1403e4	mov	x4, x20
   0x0000fffff7fa352c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3530:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa3534:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3538:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa353c:	d63f0200	blr	x16
   0x0000fffff7fa3540:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3544:	54004540	b.eq	0xfffff7fa3dec  // b.none
   0x0000fffff7fa3548:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa354c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3550:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3554:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3558:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7fa355c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3560:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3564:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa3568:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa356c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3570:	d63f0200	blr	x16
   0x0000fffff7fa3574:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3578:	540043e0	b.eq	0xfffff7fa3df4  // b.none
   0x0000fffff7fa357c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3580:	37d806a9	tbnz	w9, #27, 0xfffff7fa3654
   0x0000fffff7fa3584:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3588:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa358c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3590:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3594:	540001c1	b.ne	0xfffff7fa35cc  // b.any
   0x0000fffff7fa3598:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa359c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa35a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa35a8:	54000121	b.ne	0xfffff7fa35cc  // b.any
   0x0000fffff7fa35ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa35b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa35b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa35b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa35bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa35c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa35c8:	14000030	b	0xfffff7fa3688
   0x0000fffff7fa35cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa35d0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa35d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa35dc:	54000120	b.eq	0xfffff7fa3600  // b.none
   0x0000fffff7fa35e0:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa35e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa35e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa35ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa35f0:	54000321	b.ne	0xfffff7fa3654  // b.any
   0x0000fffff7fa35f4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa35f8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa35fc:	14000002	b	0xfffff7fa3604
   0x0000fffff7fa3600:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa3604:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3608:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa360c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3610:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3614:	54000120	b.eq	0xfffff7fa3638  // b.none
   0x0000fffff7fa3618:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa361c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3624:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3628:	54000161	b.ne	0xfffff7fa3654  // b.any
   0x0000fffff7fa362c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3630:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3634:	14000002	b	0xfffff7fa363c
   0x0000fffff7fa3638:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa363c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3640:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa3644:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3648:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa364c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa3650:	17ffffde	b	0xfffff7fa35c8
   0x0000fffff7fa3654:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3658:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa365c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3660:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3664:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7fa3668:	aa1403e4	mov	x4, x20
   0x0000fffff7fa366c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3670:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa3674:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3678:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa367c:	d63f0200	blr	x16
   0x0000fffff7fa3680:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3684:	54003bc0	b.eq	0xfffff7fa3dfc  // b.none
   0x0000fffff7fa3688:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa368c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3690:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3694:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3698:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7fa369c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa36a0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa36a4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa36a8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa36ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa36b0:	d63f0200	blr	x16
   0x0000fffff7fa36b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa36b8:	54003a60	b.eq	0xfffff7fa3e04  // b.none
   0x0000fffff7fa36bc:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa36c0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa36c4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa36c8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa36cc:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7fa36d0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa36d4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa36d8:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa36dc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa36e0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa36e4:	d63f0200	blr	x16
   0x0000fffff7fa36e8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa36ec:	54003900	b.eq	0xfffff7fa3e0c  // b.none
   0x0000fffff7fa36f0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa36f4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa36f8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa36fc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3700:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7fa3704:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3708:	aa1603e5	mov	x5, x22
   0x0000fffff7fa370c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa3710:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3714:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3718:	d63f0200	blr	x16
   0x0000fffff7fa371c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3720:	540037a0	b.eq	0xfffff7fa3e14  // b.none
   0x0000fffff7fa3724:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3728:	37d806a9	tbnz	w9, #27, 0xfffff7fa37fc
   0x0000fffff7fa372c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3730:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3734:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3738:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa373c:	540001c1	b.ne	0xfffff7fa3774  // b.any
   0x0000fffff7fa3740:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3744:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3748:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa374c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3750:	54000121	b.ne	0xfffff7fa3774  // b.any
   0x0000fffff7fa3754:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa3758:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa375c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3760:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3764:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3768:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa376c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa3770:	14000030	b	0xfffff7fa3830
   0x0000fffff7fa3774:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3778:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa377c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3780:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3784:	54000120	b.eq	0xfffff7fa37a8  // b.none
   0x0000fffff7fa3788:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa378c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3790:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3794:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3798:	54000321	b.ne	0xfffff7fa37fc  // b.any
   0x0000fffff7fa379c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa37a0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa37a4:	14000002	b	0xfffff7fa37ac
   0x0000fffff7fa37a8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa37ac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa37b0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa37b4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37b8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa37bc:	54000120	b.eq	0xfffff7fa37e0  // b.none
   0x0000fffff7fa37c0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa37c4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa37c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37cc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa37d0:	54000161	b.ne	0xfffff7fa37fc  // b.any
   0x0000fffff7fa37d4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa37d8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa37dc:	14000002	b	0xfffff7fa37e4
   0x0000fffff7fa37e0:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa37e4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa37e8:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa37ec:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa37f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa37f4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa37f8:	17ffffde	b	0xfffff7fa3770
   0x0000fffff7fa37fc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3800:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3804:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3808:	aa1503e2	mov	x2, x21
   0x0000fffff7fa380c:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7fa3810:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3814:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3818:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa381c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3820:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3824:	d63f0200	blr	x16
   0x0000fffff7fa3828:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa382c:	54002f80	b.eq	0xfffff7fa3e1c  // b.none
   0x0000fffff7fa3830:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3834:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3838:	aa1303e1	mov	x1, x19
   0x0000fffff7fa383c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3840:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7fa3844:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3848:	aa1603e5	mov	x5, x22
   0x0000fffff7fa384c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa3850:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3854:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3858:	d63f0200	blr	x16
   0x0000fffff7fa385c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3860:	54002e20	b.eq	0xfffff7fa3e24  // b.none
   0x0000fffff7fa3864:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa3868:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa386c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3870:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3874:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7fa3878:	aa1403e4	mov	x4, x20
   0x0000fffff7fa387c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3880:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa3884:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3888:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa388c:	d63f0200	blr	x16
   0x0000fffff7fa3890:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3894:	54002cc0	b.eq	0xfffff7fa3e2c  // b.none
   0x0000fffff7fa3898:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa389c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa38a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa38a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa38a8:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7fa38ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa38b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa38b4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa38b8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa38bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa38c0:	d63f0200	blr	x16
   0x0000fffff7fa38c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa38c8:	54002b60	b.eq	0xfffff7fa3e34  // b.none
   0x0000fffff7fa38cc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa38d0:	37d806a9	tbnz	w9, #27, 0xfffff7fa39a4
   0x0000fffff7fa38d4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa38d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa38dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa38e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa38e4:	540001c1	b.ne	0xfffff7fa391c  // b.any
   0x0000fffff7fa38e8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa38ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa38f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa38f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa38f8:	54000121	b.ne	0xfffff7fa391c  // b.any
   0x0000fffff7fa38fc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa3900:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa3904:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3908:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa390c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3910:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa3914:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa3918:	14000030	b	0xfffff7fa39d8
   0x0000fffff7fa391c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3920:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3924:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3928:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa392c:	54000120	b.eq	0xfffff7fa3950  // b.none
   0x0000fffff7fa3930:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3934:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3938:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa393c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3940:	54000321	b.ne	0xfffff7fa39a4  // b.any
   0x0000fffff7fa3944:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa3948:	9e620120	scvtf	d0, x9
   0x0000fffff7fa394c:	14000002	b	0xfffff7fa3954
   0x0000fffff7fa3950:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa3954:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3958:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa395c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3964:	54000120	b.eq	0xfffff7fa3988  // b.none
   0x0000fffff7fa3968:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa396c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3974:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3978:	54000161	b.ne	0xfffff7fa39a4  // b.any
   0x0000fffff7fa397c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3980:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3984:	14000002	b	0xfffff7fa398c
   0x0000fffff7fa3988:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa398c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3990:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa3994:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3998:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa399c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa39a0:	17ffffde	b	0xfffff7fa3918
   0x0000fffff7fa39a4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa39a8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa39ac:	aa1303e1	mov	x1, x19
   0x0000fffff7fa39b0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa39b4:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7fa39b8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa39bc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa39c0:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa39c4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa39c8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa39cc:	d63f0200	blr	x16
   0x0000fffff7fa39d0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa39d4:	54002340	b.eq	0xfffff7fa3e3c  // b.none
   0x0000fffff7fa39d8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa39dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa39e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa39e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa39e8:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7fa39ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fa39f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa39f4:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa39f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa39fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3a00:	d63f0200	blr	x16
   0x0000fffff7fa3a04:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3a08:	540021e0	b.eq	0xfffff7fa3e44  // b.none
   0x0000fffff7fa3a0c:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa3a10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3a14:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3a18:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3a1c:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7fa3a20:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3a24:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3a28:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa3a2c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3a30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3a34:	d63f0200	blr	x16
   0x0000fffff7fa3a38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3a3c:	54002080	b.eq	0xfffff7fa3e4c  // b.none
   0x0000fffff7fa3a40:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa3a44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3a48:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3a4c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3a50:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7fa3a54:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3a58:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3a5c:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7fa3a60:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3a64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3a68:	d63f0200	blr	x16
   0x0000fffff7fa3a6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3a70:	54001f20	b.eq	0xfffff7fa3e54  // b.none
   0x0000fffff7fa3a74:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3a78:	37d806a9	tbnz	w9, #27, 0xfffff7fa3b4c
   0x0000fffff7fa3a7c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3a80:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3a84:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3a88:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3a8c:	540001c1	b.ne	0xfffff7fa3ac4  // b.any
   0x0000fffff7fa3a90:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3a94:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3a98:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3a9c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3aa0:	54000121	b.ne	0xfffff7fa3ac4  // b.any
   0x0000fffff7fa3aa4:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa3aa8:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7fa3aac:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3ab0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3ab4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3ab8:	f9001669	str	x9, [x19, #40]
   0x0000fffff7fa3abc:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa3ac0:	14000030	b	0xfffff7fa3b80
   0x0000fffff7fa3ac4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3ac8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3acc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3ad0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3ad4:	54000120	b.eq	0xfffff7fa3af8  // b.none
   0x0000fffff7fa3ad8:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7fa3adc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3ae0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3ae4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3ae8:	54000321	b.ne	0xfffff7fa3b4c  // b.any
   0x0000fffff7fa3aec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7fa3af0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3af4:	14000002	b	0xfffff7fa3afc
   0x0000fffff7fa3af8:	fd401660	ldr	d0, [x19, #40]
   0x0000fffff7fa3afc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3b00:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3b04:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b08:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b0c:	54000120	b.eq	0xfffff7fa3b30  // b.none
   0x0000fffff7fa3b10:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3b14:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3b18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b1c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3b20:	54000161	b.ne	0xfffff7fa3b4c  // b.any
   0x0000fffff7fa3b24:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3b28:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3b2c:	14000002	b	0xfffff7fa3b34
   0x0000fffff7fa3b30:	fd401e61	ldr	d1, [x19, #56]
   0x0000fffff7fa3b34:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3b38:	fd001660	str	d0, [x19, #40]
   0x0000fffff7fa3b3c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3b40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3b44:	b900226a	str	w10, [x19, #32]
   0x0000fffff7fa3b48:	17ffffde	b	0xfffff7fa3ac0
   0x0000fffff7fa3b4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3b50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3b54:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3b58:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3b5c:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7fa3b60:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3b64:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3b68:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7fa3b6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3b70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3b74:	d63f0200	blr	x16
   0x0000fffff7fa3b78:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3b7c:	54001700	b.eq	0xfffff7fa3e5c  // b.none
   0x0000fffff7fa3b80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3b84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3b88:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3b8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3b90:	d2800843	mov	x3, #0x42                  	// #66
   0x0000fffff7fa3b94:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3b98:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3b9c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7fa3ba0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3ba4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3ba8:	d63f0200	blr	x16
   0x0000fffff7fa3bac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3bb0:	540015a0	b.eq	0xfffff7fa3e64  // b.none
   0x0000fffff7fa3bb4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa3bb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3bbc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3bc0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3bc4:	d2800863	mov	x3, #0x43                  	// #67
   0x0000fffff7fa3bc8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3bcc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3bd0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7fa3bd4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3bd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3bdc:	d63f0200	blr	x16
   0x0000fffff7fa3be0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3be4:	54001440	b.eq	0xfffff7fa3e6c  // b.none
   0x0000fffff7fa3be8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3bec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3bf0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3bf4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3bf8:	d2800883	mov	x3, #0x44                  	// #68
   0x0000fffff7fa3bfc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3c00:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3c04:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7fa3c08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3c0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3c10:	d63f0200	blr	x16
   0x0000fffff7fa3c14:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa3c18:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa3c1c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa3c20:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa3c24:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa3c28:	d65f03c0	ret
   0x0000fffff7fa3c2c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3c30:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3c34:	b900028a	str	w10, [x20]
   0x0000fffff7fa3c38:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa3c3c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa3c40:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa3c44:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa3c48:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa3c4c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa3c50:	d65f03c0	ret
   0x0000fffff7fa3c54:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa3c58:	17fffff5	b	0xfffff7fa3c2c
   0x0000fffff7fa3c5c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa3c60:	17fffff3	b	0xfffff7fa3c2c
   0x0000fffff7fa3c64:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa3c68:	17fffff1	b	0xfffff7fa3c2c
   0x0000fffff7fa3c6c:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7fa3c70:	17ffffef	b	0xfffff7fa3c2c
   0x0000fffff7fa3c74:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7fa3c78:	17ffffed	b	0xfffff7fa3c2c
   0x0000fffff7fa3c7c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7fa3c80:	17ffffeb	b	0xfffff7fa3c2c
   0x0000fffff7fa3c84:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7fa3c88:	17ffffe9	b	0xfffff7fa3c2c
   0x0000fffff7fa3c8c:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7fa3c90:	17ffffe7	b	0xfffff7fa3c2c
   0x0000fffff7fa3c94:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7fa3c98:	17ffffe5	b	0xfffff7fa3c2c
   0x0000fffff7fa3c9c:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7fa3ca0:	17ffffe3	b	0xfffff7fa3c2c
   0x0000fffff7fa3ca4:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7fa3ca8:	17ffffe1	b	0xfffff7fa3c2c
   0x0000fffff7fa3cac:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7fa3cb0:	17ffffdf	b	0xfffff7fa3c2c
   0x0000fffff7fa3cb4:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7fa3cb8:	17ffffdd	b	0xfffff7fa3c2c
   0x0000fffff7fa3cbc:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7fa3cc0:	17ffffdb	b	0xfffff7fa3c2c
   0x0000fffff7fa3cc4:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7fa3cc8:	17ffffd9	b	0xfffff7fa3c2c
   0x0000fffff7fa3ccc:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7fa3cd0:	17ffffd7	b	0xfffff7fa3c2c
   0x0000fffff7fa3cd4:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7fa3cd8:	17ffffd5	b	0xfffff7fa3c2c
   0x0000fffff7fa3cdc:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa3ce0:	17ffffd3	b	0xfffff7fa3c2c
   0x0000fffff7fa3ce4:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa3ce8:	17ffffd1	b	0xfffff7fa3c2c
   0x0000fffff7fa3cec:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa3cf0:	17ffffcf	b	0xfffff7fa3c2c
   0x0000fffff7fa3cf4:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa3cf8:	17ffffcd	b	0xfffff7fa3c2c
   0x0000fffff7fa3cfc:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa3d00:	17ffffcb	b	0xfffff7fa3c2c
   0x0000fffff7fa3d04:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa3d08:	17ffffc9	b	0xfffff7fa3c2c
   0x0000fffff7fa3d0c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa3d10:	17ffffc7	b	0xfffff7fa3c2c
   0x0000fffff7fa3d14:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa3d18:	17ffffc5	b	0xfffff7fa3c2c
   0x0000fffff7fa3d1c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa3d20:	17ffffc3	b	0xfffff7fa3c2c
   0x0000fffff7fa3d24:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa3d28:	17ffffc1	b	0xfffff7fa3c2c
   0x0000fffff7fa3d2c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa3d30:	17ffffbf	b	0xfffff7fa3c2c
   0x0000fffff7fa3d34:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa3d38:	17ffffbd	b	0xfffff7fa3c2c
   0x0000fffff7fa3d3c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa3d40:	17ffffbb	b	0xfffff7fa3c2c
   0x0000fffff7fa3d44:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa3d48:	17ffffb9	b	0xfffff7fa3c2c
   0x0000fffff7fa3d4c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa3d50:	17ffffb7	b	0xfffff7fa3c2c
   0x0000fffff7fa3d54:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa3d58:	17ffffb5	b	0xfffff7fa3c2c
   0x0000fffff7fa3d5c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa3d60:	17ffffb3	b	0xfffff7fa3c2c
   0x0000fffff7fa3d64:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa3d68:	17ffffb1	b	0xfffff7fa3c2c
   0x0000fffff7fa3d6c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa3d70:	17ffffaf	b	0xfffff7fa3c2c
   0x0000fffff7fa3d74:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa3d78:	17ffffad	b	0xfffff7fa3c2c
   0x0000fffff7fa3d7c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa3d80:	17ffffab	b	0xfffff7fa3c2c
   0x0000fffff7fa3d84:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa3d88:	17ffffa9	b	0xfffff7fa3c2c
   0x0000fffff7fa3d8c:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa3d90:	17ffffa7	b	0xfffff7fa3c2c
   0x0000fffff7fa3d94:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa3d98:	17ffffa5	b	0xfffff7fa3c2c
   0x0000fffff7fa3d9c:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa3da0:	17ffffa3	b	0xfffff7fa3c2c
   0x0000fffff7fa3da4:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa3da8:	17ffffa1	b	0xfffff7fa3c2c
   0x0000fffff7fa3dac:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa3db0:	17ffff9f	b	0xfffff7fa3c2c
   0x0000fffff7fa3db4:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa3db8:	17ffff9d	b	0xfffff7fa3c2c
   0x0000fffff7fa3dbc:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa3dc0:	17ffff9b	b	0xfffff7fa3c2c
   0x0000fffff7fa3dc4:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa3dc8:	17ffff99	b	0xfffff7fa3c2c
   0x0000fffff7fa3dcc:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fa3dd0:	17ffff97	b	0xfffff7fa3c2c
   0x0000fffff7fa3dd4:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7fa3dd8:	17ffff95	b	0xfffff7fa3c2c
   0x0000fffff7fa3ddc:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7fa3de0:	17ffff93	b	0xfffff7fa3c2c
   0x0000fffff7fa3de4:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7fa3de8:	17ffff91	b	0xfffff7fa3c2c
   0x0000fffff7fa3dec:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7fa3df0:	17ffff8f	b	0xfffff7fa3c2c
   0x0000fffff7fa3df4:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7fa3df8:	17ffff8d	b	0xfffff7fa3c2c
   0x0000fffff7fa3dfc:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7fa3e00:	17ffff8b	b	0xfffff7fa3c2c
   0x0000fffff7fa3e04:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7fa3e08:	17ffff89	b	0xfffff7fa3c2c
   0x0000fffff7fa3e0c:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7fa3e10:	17ffff87	b	0xfffff7fa3c2c
   0x0000fffff7fa3e14:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7fa3e18:	17ffff85	b	0xfffff7fa3c2c
   0x0000fffff7fa3e1c:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7fa3e20:	17ffff83	b	0xfffff7fa3c2c
   0x0000fffff7fa3e24:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7fa3e28:	17ffff81	b	0xfffff7fa3c2c
   0x0000fffff7fa3e2c:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7fa3e30:	17ffff7f	b	0xfffff7fa3c2c
   0x0000fffff7fa3e34:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7fa3e38:	17ffff7d	b	0xfffff7fa3c2c
   0x0000fffff7fa3e3c:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7fa3e40:	17ffff7b	b	0xfffff7fa3c2c
   0x0000fffff7fa3e44:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7fa3e48:	17ffff79	b	0xfffff7fa3c2c
   0x0000fffff7fa3e4c:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7fa3e50:	17ffff77	b	0xfffff7fa3c2c
   0x0000fffff7fa3e54:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7fa3e58:	17ffff75	b	0xfffff7fa3c2c
   0x0000fffff7fa3e5c:	d2800829	mov	x9, #0x41                  	// #65
   0x0000fffff7fa3e60:	17ffff73	b	0xfffff7fa3c2c
   0x0000fffff7fa3e64:	d2800849	mov	x9, #0x42                  	// #66
   0x0000fffff7fa3e68:	17ffff71	b	0xfffff7fa3c2c
   0x0000fffff7fa3e6c:	d2800869	mov	x9, #0x43                  	// #67
   0x0000fffff7fa3e70:	17ffff6f	b	0xfffff7fa3c2c
   0x0000fffff7fa3e74:	00000000	udf	#0
   0x0000fffff7fa3e78:	00000000	udf	#0
   0x0000fffff7fa3e7c:	00000000	udf	#0
   0x0000fffff7fa3e80:	00000000	udf	#0
   0x0000fffff7fa3e84:	00000000	udf	#0
   0x0000fffff7fa3e88:	00000000	udf	#0
   0x0000fffff7fa3e8c:	00000000	udf	#0
   0x0000fffff7fa3e90:	00000000	udf	#0
   0x0000fffff7fa3e94:	00000000	udf	#0
   0x0000fffff7fa3e98:	00000000	udf	#0
   0x0000fffff7fa3e9c:	00000000	udf	#0
   0x0000fffff7fa3ea0:	00000000	udf	#0
   0x0000fffff7fa3ea4:	00000000	udf	#0
   0x0000fffff7fa3ea8:	00000000	udf	#0
   0x0000fffff7fa3eac:	00000000	udf	#0
   0x0000fffff7fa3eb0:	00000000	udf	#0
   0x0000fffff7fa3eb4:	00000000	udf	#0
   0x0000fffff7fa3eb8:	00000000	udf	#0
   0x0000fffff7fa3ebc:	00000000	udf	#0
   0x0000fffff7fa3ec0:	00000000	udf	#0
   0x0000fffff7fa3ec4:	00000000	udf	#0
   0x0000fffff7fa3ec8:	00000000	udf	#0
   0x0000fffff7fa3ecc:	00000000	udf	#0
   0x0000fffff7fa3ed0:	00000000	udf	#0
   0x0000fffff7fa3ed4:	00000000	udf	#0
   0x0000fffff7fa3ed8:	00000000	udf	#0
   0x0000fffff7fa3edc:	00000000	udf	#0
   0x0000fffff7fa3ee0:	00000000	udf	#0
   0x0000fffff7fa3ee4:	00000000	udf	#0
   0x0000fffff7fa3ee8:	00000000	udf	#0
   0x0000fffff7fa3eec:	00000000	udf	#0
   0x0000fffff7fa3ef0:	00000000	udf	#0
   0x0000fffff7fa3ef4:	00000000	udf	#0
   0x0000fffff7fa3ef8:	00000000	udf	#0
   0x0000fffff7fa3efc:	00000000	udf	#0
   0x0000fffff7fa3f00:	00000000	udf	#0
   0x0000fffff7fa3f04:	00000000	udf	#0
   0x0000fffff7fa3f08:	00000000	udf	#0
   0x0000fffff7fa3f0c:	00000000	udf	#0
   0x0000fffff7fa3f10:	00000000	udf	#0
   0x0000fffff7fa3f14:	00000000	udf	#0
   0x0000fffff7fa3f18:	00000000	udf	#0
   0x0000fffff7fa3f1c:	00000000	udf	#0
   0x0000fffff7fa3f20:	00000000	udf	#0
   0x0000fffff7fa3f24:	00000000	udf	#0
   0x0000fffff7fa3f28:	00000000	udf	#0
   0x0000fffff7fa3f2c:	00000000	udf	#0
   0x0000fffff7fa3f30:	00000000	udf	#0
   0x0000fffff7fa3f34:	00000000	udf	#0
   0x0000fffff7fa3f38:	00000000	udf	#0
   0x0000fffff7fa3f3c:	00000000	udf	#0
   0x0000fffff7fa3f40:	00000000	udf	#0
   0x0000fffff7fa3f44:	00000000	udf	#0
   0x0000fffff7fa3f48:	00000000	udf	#0
   0x0000fffff7fa3f4c:	00000000	udf	#0
   0x0000fffff7fa3f50:	00000000	udf	#0
   0x0000fffff7fa3f54:	00000000	udf	#0
   0x0000fffff7fa3f58:	00000000	udf	#0
   0x0000fffff7fa3f5c:	00000000	udf	#0
   0x0000fffff7fa3f60:	00000000	udf	#0
   0x0000fffff7fa3f64:	00000000	udf	#0
   0x0000fffff7fa3f68:	00000000	udf	#0
   0x0000fffff7fa3f6c:	00000000	udf	#0
   0x0000fffff7fa3f70:	00000000	udf	#0
   0x0000fffff7fa3f74:	00000000	udf	#0
   0x0000fffff7fa3f78:	00000000	udf	#0
   0x0000fffff7fa3f7c:	00000000	udf	#0
   0x0000fffff7fa3f80:	00000000	udf	#0
   0x0000fffff7fa3f84:	00000000	udf	#0
   0x0000fffff7fa3f88:	00000000	udf	#0
   0x0000fffff7fa3f8c:	00000000	udf	#0
   0x0000fffff7fa3f90:	00000000	udf	#0
   0x0000fffff7fa3f94:	00000000	udf	#0
   0x0000fffff7fa3f98:	00000000	udf	#0
   0x0000fffff7fa3f9c:	00000000	udf	#0
   0x0000fffff7fa3fa0:	00000000	udf	#0
   0x0000fffff7fa3fa4:	00000000	udf	#0
   0x0000fffff7fa3fa8:	00000000	udf	#0
   0x0000fffff7fa3fac:	00000000	udf	#0
   0x0000fffff7fa3fb0:	00000000	udf	#0
   0x0000fffff7fa3fb4:	00000000	udf	#0
   0x0000fffff7fa3fb8:	00000000	udf	#0
   0x0000fffff7fa3fbc:	00000000	udf	#0
   0x0000fffff7fa3fc0:	00000000	udf	#0
   0x0000fffff7fa3fc4:	00000000	udf	#0
   0x0000fffff7fa3fc8:	00000000	udf	#0
   0x0000fffff7fa3fcc:	00000000	udf	#0
   0x0000fffff7fa3fd0:	00000000	udf	#0
   0x0000fffff7fa3fd4:	00000000	udf	#0
   0x0000fffff7fa3fd8:	00000000	udf	#0
   0x0000fffff7fa3fdc:	00000000	udf	#0
   0x0000fffff7fa3fe0:	00000000	udf	#0
   0x0000fffff7fa3fe4:	00000000	udf	#0
   0x0000fffff7fa3fe8:	00000000	udf	#0
   0x0000fffff7fa3fec:	00000000	udf	#0
   0x0000fffff7fa3ff0:	00000000	udf	#0
   0x0000fffff7fa3ff4:	00000000	udf	#0
   0x0000fffff7fa3ff8:	00000000	udf	#0
   0x0000fffff7fa3ffc:	00000000	udf	#0
End of assembler dump.
