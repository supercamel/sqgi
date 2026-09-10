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
   0x0000fffff7fa2038:	d29ea810	mov	x16, #0xf540                	// #62784
   0x0000fffff7fa203c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7fa2040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2044:	d63f0200	blr	x16
   0x0000fffff7fa2048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7fa204c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7fa2050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7fa2054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7fa2058:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa205c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa2060:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa2064:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa2068:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa206c:	b9402271	ldr	w17, [x19, #32]
   0x0000fffff7fa2070:	36d801d1	tbz	w17, #27, 0xfffff7fa20a8
   0x0000fffff7fa2074:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2078:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa207c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2080:	54000281	b.ne	0xfffff7fa20d0  // b.any
   0x0000fffff7fa2084:	f940166f	ldr	x15, [x19, #40]
   0x0000fffff7fa2088:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa208c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2090:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2094:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2098:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa209c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa20a0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa20a4:	54000169	b.ls	0xfffff7fa20d0  // b.plast
   0x0000fffff7fa20a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa20ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa20b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa20b4:	36d80091	tbz	w17, #27, 0xfffff7fa20c4
   0x0000fffff7fa20b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa20bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa20c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa20c4:	f900166c	str	x12, [x19, #40]
   0x0000fffff7fa20c8:	b900226d	str	w13, [x19, #32]
   0x0000fffff7fa20cc:	1400000e	b	0xfffff7fa2104
   0x0000fffff7fa20d0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa20d4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa20d8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa20dc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa20e0:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7fa20e4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa20e8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa20ec:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa20f0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa20f4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa20f8:	d63f0200	blr	x16
   0x0000fffff7fa20fc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2100:	5400d900	b.eq	0xfffff7fa3c20  // b.none
   0x0000fffff7fa2104:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa2108:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa210c:	d280002c	mov	x12, #0x1                   	// #1
   0x0000fffff7fa2110:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa2114:	36d80211	tbz	w17, #27, 0xfffff7fa2154
   0x0000fffff7fa2118:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa211c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2120:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2124:	540001e1	b.ne	0xfffff7fa2160  // b.any
   0x0000fffff7fa2128:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa212c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2130:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2134:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2138:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa213c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2140:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2144:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2148:	540000c9	b.ls	0xfffff7fa2160  // b.plast
   0x0000fffff7fa214c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2150:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2154:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa2158:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa215c:	1400000e	b	0xfffff7fa2194
   0x0000fffff7fa2160:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2164:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2168:	aa1303e1	mov	x1, x19
   0x0000fffff7fa216c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2170:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7fa2174:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2178:	aa1603e5	mov	x5, x22
   0x0000fffff7fa217c:	d2855410	mov	x16, #0x2aa0                	// #10912
   0x0000fffff7fa2180:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2184:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2188:	d63f0200	blr	x16
   0x0000fffff7fa218c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2190:	5400d4c0	b.eq	0xfffff7fa3c28  // b.none
   0x0000fffff7fa2194:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2198:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa219c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa21a0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa21a4:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7fa21a8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa21ac:	aa1603e5	mov	x5, x22
   0x0000fffff7fa21b0:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa21b4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa21b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa21bc:	d63f0200	blr	x16
   0x0000fffff7fa21c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa21c4:	5400d360	b.eq	0xfffff7fa3c30  // b.none
   0x0000fffff7fa21c8:	14000001	b	0xfffff7fa21cc
   0x0000fffff7fa21cc:	14000001	b	0xfffff7fa21d0
   0x0000fffff7fa21d0:	14000001	b	0xfffff7fa21d4
   0x0000fffff7fa21d4:	14000001	b	0xfffff7fa21d8
   0x0000fffff7fa21d8:	14000001	b	0xfffff7fa21dc
   0x0000fffff7fa21dc:	14000001	b	0xfffff7fa21e0
   0x0000fffff7fa21e0:	14000001	b	0xfffff7fa21e4
   0x0000fffff7fa21e4:	14000001	b	0xfffff7fa21e8
   0x0000fffff7fa21e8:	14000001	b	0xfffff7fa21ec
   0x0000fffff7fa21ec:	14000001	b	0xfffff7fa21f0
   0x0000fffff7fa21f0:	14000001	b	0xfffff7fa21f4
   0x0000fffff7fa21f4:	14000001	b	0xfffff7fa21f8
   0x0000fffff7fa21f8:	14000001	b	0xfffff7fa21fc
   0x0000fffff7fa21fc:	14000001	b	0xfffff7fa2200
   0x0000fffff7fa2200:	5280004d	mov	w13, #0x2                   	// #2
   0x0000fffff7fa2204:	72a0a00d	movk	w13, #0x500, lsl #16
   0x0000fffff7fa2208:	d280000c	mov	x12, #0x0                   	// #0
   0x0000fffff7fa220c:	b9403271	ldr	w17, [x19, #48]
   0x0000fffff7fa2210:	36d80211	tbz	w17, #27, 0xfffff7fa2250
   0x0000fffff7fa2214:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2218:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa221c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2220:	540001e1	b.ne	0xfffff7fa225c  // b.any
   0x0000fffff7fa2224:	f9401e6f	ldr	x15, [x19, #56]
   0x0000fffff7fa2228:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa222c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2230:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2234:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2238:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa223c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2240:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2244:	540000c9	b.ls	0xfffff7fa225c  // b.plast
   0x0000fffff7fa2248:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa224c:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2250:	f9001e6c	str	x12, [x19, #56]
   0x0000fffff7fa2254:	b900326d	str	w13, [x19, #48]
   0x0000fffff7fa2258:	1400000e	b	0xfffff7fa2290
   0x0000fffff7fa225c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2260:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2264:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2268:	aa1503e2	mov	x2, x21
   0x0000fffff7fa226c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7fa2270:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2274:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2278:	d2855410	mov	x16, #0x2aa0                	// #10912
   0x0000fffff7fa227c:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2280:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2284:	d63f0200	blr	x16
   0x0000fffff7fa2288:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa228c:	5400cd60	b.eq	0xfffff7fa3c38  // b.none
   0x0000fffff7fa2290:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2294:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2298:	aa1303e1	mov	x1, x19
   0x0000fffff7fa229c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa22a0:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7fa22a4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa22a8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa22ac:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa22b0:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa22b4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa22b8:	d63f0200	blr	x16
   0x0000fffff7fa22bc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa22c0:	5400cc00	b.eq	0xfffff7fa3c40  // b.none
   0x0000fffff7fa22c4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa22c8:	37d806a9	tbnz	w9, #27, 0xfffff7fa239c
   0x0000fffff7fa22cc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa22d0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa22d4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa22d8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa22dc:	540001c1	b.ne	0xfffff7fa2314  // b.any
   0x0000fffff7fa22e0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa22e4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa22e8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa22ec:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa22f0:	54000121	b.ne	0xfffff7fa2314  // b.any
   0x0000fffff7fa22f4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa22f8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa22fc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2300:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2304:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2308:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa230c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa2310:	14000030	b	0xfffff7fa23d0
   0x0000fffff7fa2314:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2318:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa231c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2320:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2324:	54000120	b.eq	0xfffff7fa2348  // b.none
   0x0000fffff7fa2328:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa232c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2330:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2334:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2338:	54000321	b.ne	0xfffff7fa239c  // b.any
   0x0000fffff7fa233c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2340:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2344:	14000002	b	0xfffff7fa234c
   0x0000fffff7fa2348:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa234c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2350:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2354:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2358:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa235c:	54000120	b.eq	0xfffff7fa2380  // b.none
   0x0000fffff7fa2360:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2364:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2368:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa236c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2370:	54000161	b.ne	0xfffff7fa239c  // b.any
   0x0000fffff7fa2374:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2378:	9e620121	scvtf	d1, x9
   0x0000fffff7fa237c:	14000002	b	0xfffff7fa2384
   0x0000fffff7fa2380:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa2384:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2388:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa238c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2390:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2394:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa2398:	17ffffde	b	0xfffff7fa2310
   0x0000fffff7fa239c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa23a0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa23a4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa23a8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa23ac:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7fa23b0:	aa1403e4	mov	x4, x20
   0x0000fffff7fa23b4:	aa1603e5	mov	x5, x22
   0x0000fffff7fa23b8:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa23bc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa23c0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa23c4:	d63f0200	blr	x16
   0x0000fffff7fa23c8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa23cc:	5400c3e0	b.eq	0xfffff7fa3c48  // b.none
   0x0000fffff7fa23d0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa23d4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa23d8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa23dc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa23e0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa23e4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa23e8:	36d801d1	tbz	w17, #27, 0xfffff7fa2420
   0x0000fffff7fa23ec:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa23f0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa23f4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa23f8:	54000281	b.ne	0xfffff7fa2448  // b.any
   0x0000fffff7fa23fc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa2400:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2404:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2408:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa240c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2410:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2414:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2418:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa241c:	54000169	b.ls	0xfffff7fa2448  // b.plast
   0x0000fffff7fa2420:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2424:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2428:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa242c:	36d80091	tbz	w17, #27, 0xfffff7fa243c
   0x0000fffff7fa2430:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2434:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2438:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa243c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa2440:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa2444:	1400000e	b	0xfffff7fa247c
   0x0000fffff7fa2448:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa244c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2450:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2454:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2458:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7fa245c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2460:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2464:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa2468:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa246c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2470:	d63f0200	blr	x16
   0x0000fffff7fa2474:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2478:	5400bec0	b.eq	0xfffff7fa3c50  // b.none
   0x0000fffff7fa247c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa2480:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2484:	540003a0	b.eq	0xfffff7fa24f8  // b.none
   0x0000fffff7fa2488:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa248c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa2490:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa2494:	36d801d1	tbz	w17, #27, 0xfffff7fa24cc
   0x0000fffff7fa2498:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa249c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa24a0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa24a4:	540002a1	b.ne	0xfffff7fa24f8  // b.any
   0x0000fffff7fa24a8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa24ac:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa24b0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa24b4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa24b8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa24bc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa24c0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa24c4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa24c8:	54000189	b.ls	0xfffff7fa24f8  // b.plast
   0x0000fffff7fa24cc:	36d8008d	tbz	w13, #27, 0xfffff7fa24dc
   0x0000fffff7fa24d0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa24d4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa24d8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa24dc:	36d80091	tbz	w17, #27, 0xfffff7fa24ec
   0x0000fffff7fa24e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa24e4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa24e8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa24ec:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa24f0:	b900016d	str	w13, [x11]
   0x0000fffff7fa24f4:	1400000e	b	0xfffff7fa252c
   0x0000fffff7fa24f8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa24fc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2500:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2504:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2508:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7fa250c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2510:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2514:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa2518:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa251c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2520:	d63f0200	blr	x16
   0x0000fffff7fa2524:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2528:	5400b980	b.eq	0xfffff7fa3c58  // b.none
   0x0000fffff7fa252c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa2530:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2534:	540004a0	b.eq	0xfffff7fa25c8  // b.none
   0x0000fffff7fa2538:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa253c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa2540:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa2544:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa2548:	54000400	b.eq	0xfffff7fa25c8  // b.none
   0x0000fffff7fa254c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa2550:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa2554:	36d801d1	tbz	w17, #27, 0xfffff7fa258c
   0x0000fffff7fa2558:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa255c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2560:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2564:	54000321	b.ne	0xfffff7fa25c8  // b.any
   0x0000fffff7fa2568:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa256c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2570:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2574:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2578:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa257c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2580:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2584:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2588:	54000209	b.ls	0xfffff7fa25c8  // b.plast
   0x0000fffff7fa258c:	36d8008d	tbz	w13, #27, 0xfffff7fa259c
   0x0000fffff7fa2590:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2594:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2598:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa259c:	36d80091	tbz	w17, #27, 0xfffff7fa25ac
   0x0000fffff7fa25a0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa25a4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa25a8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa25ac:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa25b0:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa25b4:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa25b8:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa25bc:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa25c0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa25c4:	1400000e	b	0xfffff7fa25fc
   0x0000fffff7fa25c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa25cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa25d0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa25d4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa25d8:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7fa25dc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa25e0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa25e4:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa25e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa25ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa25f0:	d63f0200	blr	x16
   0x0000fffff7fa25f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa25f8:	5400b340	b.eq	0xfffff7fa3c60  // b.none
   0x0000fffff7fa25fc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2600:	37d806a9	tbnz	w9, #27, 0xfffff7fa26d4
   0x0000fffff7fa2604:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2608:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa260c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2610:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2614:	540001c1	b.ne	0xfffff7fa264c  // b.any
   0x0000fffff7fa2618:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa261c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2620:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2624:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2628:	54000121	b.ne	0xfffff7fa264c  // b.any
   0x0000fffff7fa262c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2630:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa2634:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2638:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa263c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2640:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa2644:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa2648:	14000030	b	0xfffff7fa2708
   0x0000fffff7fa264c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2650:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2658:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa265c:	54000120	b.eq	0xfffff7fa2680  // b.none
   0x0000fffff7fa2660:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2664:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2668:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa266c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2670:	54000321	b.ne	0xfffff7fa26d4  // b.any
   0x0000fffff7fa2674:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2678:	9e620120	scvtf	d0, x9
   0x0000fffff7fa267c:	14000002	b	0xfffff7fa2684
   0x0000fffff7fa2680:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa2684:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2688:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa268c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2690:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2694:	54000120	b.eq	0xfffff7fa26b8  // b.none
   0x0000fffff7fa2698:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa269c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa26a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa26a8:	54000161	b.ne	0xfffff7fa26d4  // b.any
   0x0000fffff7fa26ac:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa26b0:	9e620121	scvtf	d1, x9
   0x0000fffff7fa26b4:	14000002	b	0xfffff7fa26bc
   0x0000fffff7fa26b8:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa26bc:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa26c0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa26c4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa26c8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa26cc:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa26d0:	17ffffde	b	0xfffff7fa2648
   0x0000fffff7fa26d4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa26d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa26dc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa26e0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa26e4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7fa26e8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa26ec:	aa1603e5	mov	x5, x22
   0x0000fffff7fa26f0:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa26f4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa26f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa26fc:	d63f0200	blr	x16
   0x0000fffff7fa2700:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2704:	5400ab20	b.eq	0xfffff7fa3c68  // b.none
   0x0000fffff7fa2708:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa270c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa2710:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa2714:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa2718:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa271c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa2720:	36d801d1	tbz	w17, #27, 0xfffff7fa2758
   0x0000fffff7fa2724:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2728:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa272c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2730:	54000281	b.ne	0xfffff7fa2780  // b.any
   0x0000fffff7fa2734:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa2738:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa273c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2740:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2744:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2748:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa274c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2750:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2754:	54000169	b.ls	0xfffff7fa2780  // b.plast
   0x0000fffff7fa2758:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa275c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2760:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2764:	36d80091	tbz	w17, #27, 0xfffff7fa2774
   0x0000fffff7fa2768:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa276c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2770:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2774:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa2778:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa277c:	1400000e	b	0xfffff7fa27b4
   0x0000fffff7fa2780:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2784:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2788:	aa1303e1	mov	x1, x19
   0x0000fffff7fa278c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2790:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7fa2794:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2798:	aa1603e5	mov	x5, x22
   0x0000fffff7fa279c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa27a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa27a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa27a8:	d63f0200	blr	x16
   0x0000fffff7fa27ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa27b0:	5400a600	b.eq	0xfffff7fa3c70  // b.none
   0x0000fffff7fa27b4:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa27b8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa27bc:	540003a0	b.eq	0xfffff7fa2830  // b.none
   0x0000fffff7fa27c0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa27c4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa27c8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa27cc:	36d801d1	tbz	w17, #27, 0xfffff7fa2804
   0x0000fffff7fa27d0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa27d4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa27d8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa27dc:	540002a1	b.ne	0xfffff7fa2830  // b.any
   0x0000fffff7fa27e0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa27e4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa27e8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa27ec:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa27f0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa27f4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa27f8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa27fc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2800:	54000189	b.ls	0xfffff7fa2830  // b.plast
   0x0000fffff7fa2804:	36d8008d	tbz	w13, #27, 0xfffff7fa2814
   0x0000fffff7fa2808:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa280c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2810:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2814:	36d80091	tbz	w17, #27, 0xfffff7fa2824
   0x0000fffff7fa2818:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa281c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2820:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2824:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa2828:	b900016d	str	w13, [x11]
   0x0000fffff7fa282c:	1400000e	b	0xfffff7fa2864
   0x0000fffff7fa2830:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2834:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2838:	aa1303e1	mov	x1, x19
   0x0000fffff7fa283c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2840:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7fa2844:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2848:	aa1603e5	mov	x5, x22
   0x0000fffff7fa284c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa2850:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2854:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2858:	d63f0200	blr	x16
   0x0000fffff7fa285c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2860:	5400a0c0	b.eq	0xfffff7fa3c78  // b.none
   0x0000fffff7fa2864:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa2868:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa286c:	540004a0	b.eq	0xfffff7fa2900  // b.none
   0x0000fffff7fa2870:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa2874:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa2878:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa287c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa2880:	54000400	b.eq	0xfffff7fa2900  // b.none
   0x0000fffff7fa2884:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa2888:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa288c:	36d801d1	tbz	w17, #27, 0xfffff7fa28c4
   0x0000fffff7fa2890:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2894:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2898:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa289c:	54000321	b.ne	0xfffff7fa2900  // b.any
   0x0000fffff7fa28a0:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa28a4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa28a8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa28ac:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa28b0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa28b4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa28b8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa28bc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa28c0:	54000209	b.ls	0xfffff7fa2900  // b.plast
   0x0000fffff7fa28c4:	36d8008d	tbz	w13, #27, 0xfffff7fa28d4
   0x0000fffff7fa28c8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa28cc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa28d0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa28d4:	36d80091	tbz	w17, #27, 0xfffff7fa28e4
   0x0000fffff7fa28d8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa28dc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa28e0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa28e4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa28e8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa28ec:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa28f0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa28f4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa28f8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa28fc:	1400000e	b	0xfffff7fa2934
   0x0000fffff7fa2900:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2904:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2908:	aa1303e1	mov	x1, x19
   0x0000fffff7fa290c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2910:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7fa2914:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2918:	aa1603e5	mov	x5, x22
   0x0000fffff7fa291c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa2920:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2924:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2928:	d63f0200	blr	x16
   0x0000fffff7fa292c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2930:	54009a80	b.eq	0xfffff7fa3c80  // b.none
   0x0000fffff7fa2934:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2938:	37d806a9	tbnz	w9, #27, 0xfffff7fa2a0c
   0x0000fffff7fa293c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2940:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2944:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2948:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa294c:	540001c1	b.ne	0xfffff7fa2984  // b.any
   0x0000fffff7fa2950:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2954:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2958:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa295c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2960:	54000121	b.ne	0xfffff7fa2984  // b.any
   0x0000fffff7fa2964:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2968:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa296c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2970:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2974:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2978:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa297c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa2980:	14000030	b	0xfffff7fa2a40
   0x0000fffff7fa2984:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2988:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa298c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2990:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2994:	54000120	b.eq	0xfffff7fa29b8  // b.none
   0x0000fffff7fa2998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa299c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa29a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa29a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa29a8:	54000321	b.ne	0xfffff7fa2a0c  // b.any
   0x0000fffff7fa29ac:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa29b0:	9e620120	scvtf	d0, x9
   0x0000fffff7fa29b4:	14000002	b	0xfffff7fa29bc
   0x0000fffff7fa29b8:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa29bc:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa29c0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa29c4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa29c8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa29cc:	54000120	b.eq	0xfffff7fa29f0  // b.none
   0x0000fffff7fa29d0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa29d4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa29d8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa29dc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa29e0:	54000161	b.ne	0xfffff7fa2a0c  // b.any
   0x0000fffff7fa29e4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa29e8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa29ec:	14000002	b	0xfffff7fa29f4
   0x0000fffff7fa29f0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa29f4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa29f8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa29fc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2a00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2a04:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa2a08:	17ffffde	b	0xfffff7fa2980
   0x0000fffff7fa2a0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2a10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2a14:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2a18:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2a1c:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7fa2a20:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2a24:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2a28:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa2a2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2a30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2a34:	d63f0200	blr	x16
   0x0000fffff7fa2a38:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2a3c:	54009260	b.eq	0xfffff7fa3c88  // b.none
   0x0000fffff7fa2a40:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa2a44:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa2a48:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa2a4c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa2a50:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa2a54:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa2a58:	36d801d1	tbz	w17, #27, 0xfffff7fa2a90
   0x0000fffff7fa2a5c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2a60:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2a64:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2a68:	54000281	b.ne	0xfffff7fa2ab8  // b.any
   0x0000fffff7fa2a6c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa2a70:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2a74:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2a78:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2a7c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2a80:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2a84:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2a88:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2a8c:	54000169	b.ls	0xfffff7fa2ab8  // b.plast
   0x0000fffff7fa2a90:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2a94:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2a98:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2a9c:	36d80091	tbz	w17, #27, 0xfffff7fa2aac
   0x0000fffff7fa2aa0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2aa4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2aa8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2aac:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa2ab0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa2ab4:	1400000e	b	0xfffff7fa2aec
   0x0000fffff7fa2ab8:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2abc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2ac0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2ac4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2ac8:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7fa2acc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2ad0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2ad4:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa2ad8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2adc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2ae0:	d63f0200	blr	x16
   0x0000fffff7fa2ae4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2ae8:	54008d40	b.eq	0xfffff7fa3c90  // b.none
   0x0000fffff7fa2aec:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa2af0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2af4:	540003a0	b.eq	0xfffff7fa2b68  // b.none
   0x0000fffff7fa2af8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa2afc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa2b00:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa2b04:	36d801d1	tbz	w17, #27, 0xfffff7fa2b3c
   0x0000fffff7fa2b08:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2b0c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2b10:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2b14:	540002a1	b.ne	0xfffff7fa2b68  // b.any
   0x0000fffff7fa2b18:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa2b1c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2b20:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2b24:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2b28:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2b2c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2b30:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2b34:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2b38:	54000189	b.ls	0xfffff7fa2b68  // b.plast
   0x0000fffff7fa2b3c:	36d8008d	tbz	w13, #27, 0xfffff7fa2b4c
   0x0000fffff7fa2b40:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2b44:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2b48:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2b4c:	36d80091	tbz	w17, #27, 0xfffff7fa2b5c
   0x0000fffff7fa2b50:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2b54:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2b58:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2b5c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa2b60:	b900016d	str	w13, [x11]
   0x0000fffff7fa2b64:	1400000e	b	0xfffff7fa2b9c
   0x0000fffff7fa2b68:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2b6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2b70:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2b74:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2b78:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7fa2b7c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2b80:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2b84:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa2b88:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2b8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2b90:	d63f0200	blr	x16
   0x0000fffff7fa2b94:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2b98:	54008800	b.eq	0xfffff7fa3c98  // b.none
   0x0000fffff7fa2b9c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa2ba0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2ba4:	540004a0	b.eq	0xfffff7fa2c38  // b.none
   0x0000fffff7fa2ba8:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa2bac:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa2bb0:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa2bb4:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa2bb8:	54000400	b.eq	0xfffff7fa2c38  // b.none
   0x0000fffff7fa2bbc:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa2bc0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa2bc4:	36d801d1	tbz	w17, #27, 0xfffff7fa2bfc
   0x0000fffff7fa2bc8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2bcc:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2bd0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2bd4:	54000321	b.ne	0xfffff7fa2c38  // b.any
   0x0000fffff7fa2bd8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa2bdc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2be0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2be4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2be8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2bec:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2bf0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2bf4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2bf8:	54000209	b.ls	0xfffff7fa2c38  // b.plast
   0x0000fffff7fa2bfc:	36d8008d	tbz	w13, #27, 0xfffff7fa2c0c
   0x0000fffff7fa2c00:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2c04:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2c08:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2c0c:	36d80091	tbz	w17, #27, 0xfffff7fa2c1c
   0x0000fffff7fa2c10:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2c14:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2c18:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2c1c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa2c20:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa2c24:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa2c28:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa2c2c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa2c30:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa2c34:	1400000e	b	0xfffff7fa2c6c
   0x0000fffff7fa2c38:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2c3c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2c40:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2c44:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2c48:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7fa2c4c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2c50:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2c54:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa2c58:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2c5c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2c60:	d63f0200	blr	x16
   0x0000fffff7fa2c64:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2c68:	540081c0	b.eq	0xfffff7fa3ca0  // b.none
   0x0000fffff7fa2c6c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2c70:	37d806a9	tbnz	w9, #27, 0xfffff7fa2d44
   0x0000fffff7fa2c74:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2c78:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2c7c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c80:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2c84:	540001c1	b.ne	0xfffff7fa2cbc  // b.any
   0x0000fffff7fa2c88:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2c8c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2c90:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2c94:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2c98:	54000121	b.ne	0xfffff7fa2cbc  // b.any
   0x0000fffff7fa2c9c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2ca0:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa2ca4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2ca8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2cac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2cb0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa2cb4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa2cb8:	14000030	b	0xfffff7fa2d78
   0x0000fffff7fa2cbc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2cc0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2cc4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2cc8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2ccc:	54000120	b.eq	0xfffff7fa2cf0  // b.none
   0x0000fffff7fa2cd0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2cd4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2cd8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2cdc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2ce0:	54000321	b.ne	0xfffff7fa2d44  // b.any
   0x0000fffff7fa2ce4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2ce8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa2cec:	14000002	b	0xfffff7fa2cf4
   0x0000fffff7fa2cf0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa2cf4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2cf8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2cfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2d00:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2d04:	54000120	b.eq	0xfffff7fa2d28  // b.none
   0x0000fffff7fa2d08:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2d0c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2d10:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2d14:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2d18:	54000161	b.ne	0xfffff7fa2d44  // b.any
   0x0000fffff7fa2d1c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa2d20:	9e620121	scvtf	d1, x9
   0x0000fffff7fa2d24:	14000002	b	0xfffff7fa2d2c
   0x0000fffff7fa2d28:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa2d2c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa2d30:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa2d34:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2d38:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2d3c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa2d40:	17ffffde	b	0xfffff7fa2cb8
   0x0000fffff7fa2d44:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2d48:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2d4c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2d50:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2d54:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7fa2d58:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2d5c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2d60:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa2d64:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2d68:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2d6c:	d63f0200	blr	x16
   0x0000fffff7fa2d70:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2d74:	540079a0	b.eq	0xfffff7fa3ca8  // b.none
   0x0000fffff7fa2d78:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa2d7c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa2d80:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa2d84:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa2d88:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa2d8c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa2d90:	36d801d1	tbz	w17, #27, 0xfffff7fa2dc8
   0x0000fffff7fa2d94:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2d98:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2d9c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2da0:	54000281	b.ne	0xfffff7fa2df0  // b.any
   0x0000fffff7fa2da4:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa2da8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2dac:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2db0:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2db4:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2db8:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2dbc:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2dc0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2dc4:	54000169	b.ls	0xfffff7fa2df0  // b.plast
   0x0000fffff7fa2dc8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2dcc:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2dd0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2dd4:	36d80091	tbz	w17, #27, 0xfffff7fa2de4
   0x0000fffff7fa2dd8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2ddc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2de0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2de4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa2de8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa2dec:	1400000e	b	0xfffff7fa2e24
   0x0000fffff7fa2df0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa2df4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2df8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2dfc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2e00:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7fa2e04:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2e08:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2e0c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa2e10:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2e14:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2e18:	d63f0200	blr	x16
   0x0000fffff7fa2e1c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2e20:	54007480	b.eq	0xfffff7fa3cb0  // b.none
   0x0000fffff7fa2e24:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa2e28:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2e2c:	540003a0	b.eq	0xfffff7fa2ea0  // b.none
   0x0000fffff7fa2e30:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa2e34:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa2e38:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa2e3c:	36d801d1	tbz	w17, #27, 0xfffff7fa2e74
   0x0000fffff7fa2e40:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2e44:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2e48:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2e4c:	540002a1	b.ne	0xfffff7fa2ea0  // b.any
   0x0000fffff7fa2e50:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa2e54:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2e58:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2e5c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2e60:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2e64:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2e68:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2e6c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2e70:	54000189	b.ls	0xfffff7fa2ea0  // b.plast
   0x0000fffff7fa2e74:	36d8008d	tbz	w13, #27, 0xfffff7fa2e84
   0x0000fffff7fa2e78:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2e7c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2e80:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2e84:	36d80091	tbz	w17, #27, 0xfffff7fa2e94
   0x0000fffff7fa2e88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2e8c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2e90:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2e94:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa2e98:	b900016d	str	w13, [x11]
   0x0000fffff7fa2e9c:	1400000e	b	0xfffff7fa2ed4
   0x0000fffff7fa2ea0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa2ea4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2ea8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2eac:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2eb0:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7fa2eb4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2eb8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2ebc:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa2ec0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa2ec4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2ec8:	d63f0200	blr	x16
   0x0000fffff7fa2ecc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2ed0:	54006f40	b.eq	0xfffff7fa3cb8  // b.none
   0x0000fffff7fa2ed4:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa2ed8:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa2edc:	540004a0	b.eq	0xfffff7fa2f70  // b.none
   0x0000fffff7fa2ee0:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa2ee4:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa2ee8:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa2eec:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa2ef0:	54000400	b.eq	0xfffff7fa2f70  // b.none
   0x0000fffff7fa2ef4:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa2ef8:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa2efc:	36d801d1	tbz	w17, #27, 0xfffff7fa2f34
   0x0000fffff7fa2f00:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa2f04:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa2f08:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa2f0c:	54000321	b.ne	0xfffff7fa2f70  // b.any
   0x0000fffff7fa2f10:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa2f14:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2f18:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa2f1c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa2f20:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa2f24:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa2f28:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa2f2c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa2f30:	54000209	b.ls	0xfffff7fa2f70  // b.plast
   0x0000fffff7fa2f34:	36d8008d	tbz	w13, #27, 0xfffff7fa2f44
   0x0000fffff7fa2f38:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa2f3c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa2f40:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa2f44:	36d80091	tbz	w17, #27, 0xfffff7fa2f54
   0x0000fffff7fa2f48:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa2f4c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa2f50:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa2f54:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa2f58:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa2f5c:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa2f60:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa2f64:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa2f68:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa2f6c:	1400000e	b	0xfffff7fa2fa4
   0x0000fffff7fa2f70:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa2f74:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa2f78:	aa1303e1	mov	x1, x19
   0x0000fffff7fa2f7c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa2f80:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7fa2f84:	aa1403e4	mov	x4, x20
   0x0000fffff7fa2f88:	aa1603e5	mov	x5, x22
   0x0000fffff7fa2f8c:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa2f90:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa2f94:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa2f98:	d63f0200	blr	x16
   0x0000fffff7fa2f9c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa2fa0:	54006900	b.eq	0xfffff7fa3cc0  // b.none
   0x0000fffff7fa2fa4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2fa8:	37d806a9	tbnz	w9, #27, 0xfffff7fa307c
   0x0000fffff7fa2fac:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2fb0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2fb4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2fb8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2fbc:	540001c1	b.ne	0xfffff7fa2ff4  // b.any
   0x0000fffff7fa2fc0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa2fc4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2fc8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2fcc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa2fd0:	54000121	b.ne	0xfffff7fa2ff4  // b.any
   0x0000fffff7fa2fd4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa2fd8:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa2fdc:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa2fe0:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa2fe4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa2fe8:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa2fec:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa2ff0:	14000030	b	0xfffff7fa30b0
   0x0000fffff7fa2ff4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa2ff8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa2ffc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3000:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3004:	54000120	b.eq	0xfffff7fa3028  // b.none
   0x0000fffff7fa3008:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa300c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3010:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3014:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3018:	54000321	b.ne	0xfffff7fa307c  // b.any
   0x0000fffff7fa301c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3020:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3024:	14000002	b	0xfffff7fa302c
   0x0000fffff7fa3028:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa302c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3030:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3034:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3038:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa303c:	54000120	b.eq	0xfffff7fa3060  // b.none
   0x0000fffff7fa3040:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3044:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3048:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa304c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3050:	54000161	b.ne	0xfffff7fa307c  // b.any
   0x0000fffff7fa3054:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3058:	9e620121	scvtf	d1, x9
   0x0000fffff7fa305c:	14000002	b	0xfffff7fa3064
   0x0000fffff7fa3060:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa3064:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3068:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa306c:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3070:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3074:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3078:	17ffffde	b	0xfffff7fa2ff0
   0x0000fffff7fa307c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3080:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3084:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3088:	aa1503e2	mov	x2, x21
   0x0000fffff7fa308c:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7fa3090:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3094:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3098:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa309c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa30a0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa30a4:	d63f0200	blr	x16
   0x0000fffff7fa30a8:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa30ac:	540060e0	b.eq	0xfffff7fa3cc8  // b.none
   0x0000fffff7fa30b0:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa30b4:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa30b8:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa30bc:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa30c0:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa30c4:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa30c8:	36d801d1	tbz	w17, #27, 0xfffff7fa3100
   0x0000fffff7fa30cc:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa30d0:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa30d4:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa30d8:	54000281	b.ne	0xfffff7fa3128  // b.any
   0x0000fffff7fa30dc:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa30e0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa30e4:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa30e8:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa30ec:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa30f0:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa30f4:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa30f8:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa30fc:	54000169	b.ls	0xfffff7fa3128  // b.plast
   0x0000fffff7fa3100:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3104:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3108:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa310c:	36d80091	tbz	w17, #27, 0xfffff7fa311c
   0x0000fffff7fa3110:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3114:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3118:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa311c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa3120:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa3124:	1400000e	b	0xfffff7fa315c
   0x0000fffff7fa3128:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa312c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3130:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3134:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3138:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7fa313c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3140:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3144:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa3148:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa314c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3150:	d63f0200	blr	x16
   0x0000fffff7fa3154:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3158:	54005bc0	b.eq	0xfffff7fa3cd0  // b.none
   0x0000fffff7fa315c:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa3160:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3164:	540003a0	b.eq	0xfffff7fa31d8  // b.none
   0x0000fffff7fa3168:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa316c:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa3170:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa3174:	36d801d1	tbz	w17, #27, 0xfffff7fa31ac
   0x0000fffff7fa3178:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa317c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3180:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3184:	540002a1	b.ne	0xfffff7fa31d8  // b.any
   0x0000fffff7fa3188:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa318c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3190:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3194:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3198:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa319c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa31a0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa31a4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa31a8:	54000189	b.ls	0xfffff7fa31d8  // b.plast
   0x0000fffff7fa31ac:	36d8008d	tbz	w13, #27, 0xfffff7fa31bc
   0x0000fffff7fa31b0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa31b4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa31b8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa31bc:	36d80091	tbz	w17, #27, 0xfffff7fa31cc
   0x0000fffff7fa31c0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa31c4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa31c8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa31cc:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa31d0:	b900016d	str	w13, [x11]
   0x0000fffff7fa31d4:	1400000e	b	0xfffff7fa320c
   0x0000fffff7fa31d8:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa31dc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa31e0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa31e4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa31e8:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7fa31ec:	aa1403e4	mov	x4, x20
   0x0000fffff7fa31f0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa31f4:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa31f8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa31fc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3200:	d63f0200	blr	x16
   0x0000fffff7fa3204:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3208:	54005680	b.eq	0xfffff7fa3cd8  // b.none
   0x0000fffff7fa320c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3210:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3214:	540004a0	b.eq	0xfffff7fa32a8  // b.none
   0x0000fffff7fa3218:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa321c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa3220:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa3224:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa3228:	54000400	b.eq	0xfffff7fa32a8  // b.none
   0x0000fffff7fa322c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3230:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa3234:	36d801d1	tbz	w17, #27, 0xfffff7fa326c
   0x0000fffff7fa3238:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa323c:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3240:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3244:	54000321	b.ne	0xfffff7fa32a8  // b.any
   0x0000fffff7fa3248:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa324c:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3250:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3254:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3258:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa325c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3260:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3264:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3268:	54000209	b.ls	0xfffff7fa32a8  // b.plast
   0x0000fffff7fa326c:	36d8008d	tbz	w13, #27, 0xfffff7fa327c
   0x0000fffff7fa3270:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3274:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3278:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa327c:	36d80091	tbz	w17, #27, 0xfffff7fa328c
   0x0000fffff7fa3280:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3284:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3288:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa328c:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa3290:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa3294:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3298:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa329c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa32a0:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa32a4:	1400000e	b	0xfffff7fa32dc
   0x0000fffff7fa32a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa32ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa32b0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa32b4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa32b8:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7fa32bc:	aa1403e4	mov	x4, x20
   0x0000fffff7fa32c0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa32c4:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa32c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa32cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa32d0:	d63f0200	blr	x16
   0x0000fffff7fa32d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa32d8:	54005040	b.eq	0xfffff7fa3ce0  // b.none
   0x0000fffff7fa32dc:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa32e0:	37d806a9	tbnz	w9, #27, 0xfffff7fa33b4
   0x0000fffff7fa32e4:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa32e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa32ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa32f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa32f4:	540001c1	b.ne	0xfffff7fa332c  // b.any
   0x0000fffff7fa32f8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa32fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3300:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3304:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3308:	54000121	b.ne	0xfffff7fa332c  // b.any
   0x0000fffff7fa330c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3310:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa3314:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3318:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa331c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3320:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3324:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3328:	14000030	b	0xfffff7fa33e8
   0x0000fffff7fa332c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3330:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3334:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3338:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa333c:	54000120	b.eq	0xfffff7fa3360  // b.none
   0x0000fffff7fa3340:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3344:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3348:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa334c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3350:	54000321	b.ne	0xfffff7fa33b4  // b.any
   0x0000fffff7fa3354:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3358:	9e620120	scvtf	d0, x9
   0x0000fffff7fa335c:	14000002	b	0xfffff7fa3364
   0x0000fffff7fa3360:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa3364:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3368:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa336c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3370:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3374:	54000120	b.eq	0xfffff7fa3398  // b.none
   0x0000fffff7fa3378:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa337c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3380:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3384:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3388:	54000161	b.ne	0xfffff7fa33b4  // b.any
   0x0000fffff7fa338c:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3390:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3394:	14000002	b	0xfffff7fa339c
   0x0000fffff7fa3398:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa339c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa33a0:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa33a4:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa33a8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa33ac:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa33b0:	17ffffde	b	0xfffff7fa3328
   0x0000fffff7fa33b4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa33b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa33bc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa33c0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa33c4:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7fa33c8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa33cc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa33d0:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa33d4:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa33d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa33dc:	d63f0200	blr	x16
   0x0000fffff7fa33e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa33e4:	54004820	b.eq	0xfffff7fa3ce8  // b.none
   0x0000fffff7fa33e8:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa33ec:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa33f0:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa33f4:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa33f8:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa33fc:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa3400:	36d801d1	tbz	w17, #27, 0xfffff7fa3438
   0x0000fffff7fa3404:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3408:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa340c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3410:	54000281	b.ne	0xfffff7fa3460  // b.any
   0x0000fffff7fa3414:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa3418:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa341c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3420:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3424:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3428:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa342c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3430:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3434:	54000169	b.ls	0xfffff7fa3460  // b.plast
   0x0000fffff7fa3438:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa343c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3440:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa3444:	36d80091	tbz	w17, #27, 0xfffff7fa3454
   0x0000fffff7fa3448:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa344c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3450:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3454:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa3458:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa345c:	1400000e	b	0xfffff7fa3494
   0x0000fffff7fa3460:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3468:	aa1303e1	mov	x1, x19
   0x0000fffff7fa346c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3470:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7fa3474:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3478:	aa1603e5	mov	x5, x22
   0x0000fffff7fa347c:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa3480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3488:	d63f0200	blr	x16
   0x0000fffff7fa348c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3490:	54004300	b.eq	0xfffff7fa3cf0  // b.none
   0x0000fffff7fa3494:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa3498:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa349c:	540003a0	b.eq	0xfffff7fa3510  // b.none
   0x0000fffff7fa34a0:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa34a4:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa34a8:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa34ac:	36d801d1	tbz	w17, #27, 0xfffff7fa34e4
   0x0000fffff7fa34b0:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa34b4:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa34b8:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa34bc:	540002a1	b.ne	0xfffff7fa3510  // b.any
   0x0000fffff7fa34c0:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa34c4:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa34c8:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa34cc:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa34d0:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa34d4:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa34d8:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa34dc:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa34e0:	54000189	b.ls	0xfffff7fa3510  // b.plast
   0x0000fffff7fa34e4:	36d8008d	tbz	w13, #27, 0xfffff7fa34f4
   0x0000fffff7fa34e8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa34ec:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa34f0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa34f4:	36d80091	tbz	w17, #27, 0xfffff7fa3504
   0x0000fffff7fa34f8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa34fc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3500:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3504:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa3508:	b900016d	str	w13, [x11]
   0x0000fffff7fa350c:	1400000e	b	0xfffff7fa3544
   0x0000fffff7fa3510:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa3514:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3518:	aa1303e1	mov	x1, x19
   0x0000fffff7fa351c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3520:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7fa3524:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3528:	aa1603e5	mov	x5, x22
   0x0000fffff7fa352c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa3530:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3534:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3538:	d63f0200	blr	x16
   0x0000fffff7fa353c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3540:	54003dc0	b.eq	0xfffff7fa3cf8  // b.none
   0x0000fffff7fa3544:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3548:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa354c:	540004a0	b.eq	0xfffff7fa35e0  // b.none
   0x0000fffff7fa3550:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa3554:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa3558:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa355c:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa3560:	54000400	b.eq	0xfffff7fa35e0  // b.none
   0x0000fffff7fa3564:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa3568:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa356c:	36d801d1	tbz	w17, #27, 0xfffff7fa35a4
   0x0000fffff7fa3570:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3574:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3578:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa357c:	54000321	b.ne	0xfffff7fa35e0  // b.any
   0x0000fffff7fa3580:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa3584:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3588:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa358c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3590:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3594:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3598:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa359c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa35a0:	54000209	b.ls	0xfffff7fa35e0  // b.plast
   0x0000fffff7fa35a4:	36d8008d	tbz	w13, #27, 0xfffff7fa35b4
   0x0000fffff7fa35a8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa35ac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa35b0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa35b4:	36d80091	tbz	w17, #27, 0xfffff7fa35c4
   0x0000fffff7fa35b8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa35bc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa35c0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa35c4:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa35c8:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa35cc:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa35d0:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa35d4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa35d8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa35dc:	1400000e	b	0xfffff7fa3614
   0x0000fffff7fa35e0:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa35e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa35e8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa35ec:	aa1503e2	mov	x2, x21
   0x0000fffff7fa35f0:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7fa35f4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa35f8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa35fc:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa3600:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3604:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3608:	d63f0200	blr	x16
   0x0000fffff7fa360c:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3610:	54003780	b.eq	0xfffff7fa3d00  // b.none
   0x0000fffff7fa3614:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3618:	37d806a9	tbnz	w9, #27, 0xfffff7fa36ec
   0x0000fffff7fa361c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3620:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3624:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3628:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa362c:	540001c1	b.ne	0xfffff7fa3664  // b.any
   0x0000fffff7fa3630:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa3634:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3638:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa363c:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3640:	54000121	b.ne	0xfffff7fa3664  // b.any
   0x0000fffff7fa3644:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3648:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa364c:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3650:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3654:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3658:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa365c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3660:	14000030	b	0xfffff7fa3720
   0x0000fffff7fa3664:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3668:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa366c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3670:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3674:	54000120	b.eq	0xfffff7fa3698  // b.none
   0x0000fffff7fa3678:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa367c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3680:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3684:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3688:	54000321	b.ne	0xfffff7fa36ec  // b.any
   0x0000fffff7fa368c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3690:	9e620120	scvtf	d0, x9
   0x0000fffff7fa3694:	14000002	b	0xfffff7fa369c
   0x0000fffff7fa3698:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa369c:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa36a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa36a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa36a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa36ac:	54000120	b.eq	0xfffff7fa36d0  // b.none
   0x0000fffff7fa36b0:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa36b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa36b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa36bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa36c0:	54000161	b.ne	0xfffff7fa36ec  // b.any
   0x0000fffff7fa36c4:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa36c8:	9e620121	scvtf	d1, x9
   0x0000fffff7fa36cc:	14000002	b	0xfffff7fa36d4
   0x0000fffff7fa36d0:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa36d4:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa36d8:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa36dc:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa36e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa36e4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa36e8:	17ffffde	b	0xfffff7fa3660
   0x0000fffff7fa36ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa36f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa36f4:	aa1303e1	mov	x1, x19
   0x0000fffff7fa36f8:	aa1503e2	mov	x2, x21
   0x0000fffff7fa36fc:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7fa3700:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3704:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3708:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa370c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3710:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3714:	d63f0200	blr	x16
   0x0000fffff7fa3718:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa371c:	54002f60	b.eq	0xfffff7fa3d08  // b.none
   0x0000fffff7fa3720:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa3724:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa3728:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa372c:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa3730:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa3734:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa3738:	36d801d1	tbz	w17, #27, 0xfffff7fa3770
   0x0000fffff7fa373c:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3740:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3744:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3748:	54000281	b.ne	0xfffff7fa3798  // b.any
   0x0000fffff7fa374c:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa3750:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3754:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3758:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa375c:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3760:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3764:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3768:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa376c:	54000169	b.ls	0xfffff7fa3798  // b.plast
   0x0000fffff7fa3770:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3774:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3778:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa377c:	36d80091	tbz	w17, #27, 0xfffff7fa378c
   0x0000fffff7fa3780:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3784:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3788:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa378c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa3790:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa3794:	1400000e	b	0xfffff7fa37cc
   0x0000fffff7fa3798:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa379c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa37a0:	aa1303e1	mov	x1, x19
   0x0000fffff7fa37a4:	aa1503e2	mov	x2, x21
   0x0000fffff7fa37a8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7fa37ac:	aa1403e4	mov	x4, x20
   0x0000fffff7fa37b0:	aa1603e5	mov	x5, x22
   0x0000fffff7fa37b4:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa37b8:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa37bc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa37c0:	d63f0200	blr	x16
   0x0000fffff7fa37c4:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa37c8:	54002a40	b.eq	0xfffff7fa3d10  // b.none
   0x0000fffff7fa37cc:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa37d0:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa37d4:	540003a0	b.eq	0xfffff7fa3848  // b.none
   0x0000fffff7fa37d8:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa37dc:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa37e0:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa37e4:	36d801d1	tbz	w17, #27, 0xfffff7fa381c
   0x0000fffff7fa37e8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa37ec:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa37f0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa37f4:	540002a1	b.ne	0xfffff7fa3848  // b.any
   0x0000fffff7fa37f8:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa37fc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3800:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3804:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3808:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa380c:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3810:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3814:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3818:	54000189	b.ls	0xfffff7fa3848  // b.plast
   0x0000fffff7fa381c:	36d8008d	tbz	w13, #27, 0xfffff7fa382c
   0x0000fffff7fa3820:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3824:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3828:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa382c:	36d80091	tbz	w17, #27, 0xfffff7fa383c
   0x0000fffff7fa3830:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3834:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3838:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa383c:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa3840:	b900016d	str	w13, [x11]
   0x0000fffff7fa3844:	1400000e	b	0xfffff7fa387c
   0x0000fffff7fa3848:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa384c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3850:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3854:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3858:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7fa385c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3860:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3864:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa3868:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa386c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3870:	d63f0200	blr	x16
   0x0000fffff7fa3874:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3878:	54002500	b.eq	0xfffff7fa3d18  // b.none
   0x0000fffff7fa387c:	f94027eb	ldr	x11, [sp, #72]
   0x0000fffff7fa3880:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3884:	540004a0	b.eq	0xfffff7fa3918  // b.none
   0x0000fffff7fa3888:	b940016d	ldr	w13, [x11]
   0x0000fffff7fa388c:	52800009	mov	w9, #0x0                   	// #0
   0x0000fffff7fa3890:	72a10029	movk	w9, #0x801, lsl #16
   0x0000fffff7fa3894:	eb0901bf	cmp	x13, x9
   0x0000fffff7fa3898:	54000400	b.eq	0xfffff7fa3918  // b.none
   0x0000fffff7fa389c:	f940056c	ldr	x12, [x11, #8]
   0x0000fffff7fa38a0:	b940b2d1	ldr	w17, [x22, #176]
   0x0000fffff7fa38a4:	36d801d1	tbz	w17, #27, 0xfffff7fa38dc
   0x0000fffff7fa38a8:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa38ac:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa38b0:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa38b4:	54000321	b.ne	0xfffff7fa3918  // b.any
   0x0000fffff7fa38b8:	f9405ecf	ldr	x15, [x22, #184]
   0x0000fffff7fa38bc:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa38c0:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa38c4:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa38c8:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa38cc:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa38d0:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa38d4:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa38d8:	54000209	b.ls	0xfffff7fa3918  // b.plast
   0x0000fffff7fa38dc:	36d8008d	tbz	w13, #27, 0xfffff7fa38ec
   0x0000fffff7fa38e0:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa38e4:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa38e8:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa38ec:	36d80091	tbz	w17, #27, 0xfffff7fa38fc
   0x0000fffff7fa38f0:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa38f4:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa38f8:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa38fc:	b940426e	ldr	w14, [x19, #64]
   0x0000fffff7fa3900:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa3904:	f9005ecf	str	x15, [x22, #184]
   0x0000fffff7fa3908:	b900b2ce	str	w14, [x22, #176]
   0x0000fffff7fa390c:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa3910:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa3914:	1400000e	b	0xfffff7fa394c
   0x0000fffff7fa3918:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7fa391c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3920:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3924:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3928:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7fa392c:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3930:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3934:	d293f810	mov	x16, #0x9fc0                	// #40896
   0x0000fffff7fa3938:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa393c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3940:	d63f0200	blr	x16
   0x0000fffff7fa3944:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3948:	54001ec0	b.eq	0xfffff7fa3d20  // b.none
   0x0000fffff7fa394c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3950:	37d806a9	tbnz	w9, #27, 0xfffff7fa3a24
   0x0000fffff7fa3954:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa3958:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa395c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3960:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3964:	540001c1	b.ne	0xfffff7fa399c  // b.any
   0x0000fffff7fa3968:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa396c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3970:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3974:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa3978:	54000121	b.ne	0xfffff7fa399c  // b.any
   0x0000fffff7fa397c:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa3980:	f940266a	ldr	x10, [x19, #72]
   0x0000fffff7fa3984:	8b0a0129	add	x9, x9, x10
   0x0000fffff7fa3988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa398c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3990:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7fa3994:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3998:	14000030	b	0xfffff7fa3a58
   0x0000fffff7fa399c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa39a0:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa39a4:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39a8:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa39ac:	54000120	b.eq	0xfffff7fa39d0  // b.none
   0x0000fffff7fa39b0:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7fa39b4:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa39b8:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39bc:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa39c0:	54000321	b.ne	0xfffff7fa3a24  // b.any
   0x0000fffff7fa39c4:	f9401e69	ldr	x9, [x19, #56]
   0x0000fffff7fa39c8:	9e620120	scvtf	d0, x9
   0x0000fffff7fa39cc:	14000002	b	0xfffff7fa39d4
   0x0000fffff7fa39d0:	fd401e60	ldr	d0, [x19, #56]
   0x0000fffff7fa39d4:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa39d8:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa39dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39e0:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa39e4:	54000120	b.eq	0xfffff7fa3a08  // b.none
   0x0000fffff7fa39e8:	b9404269	ldr	w9, [x19, #64]
   0x0000fffff7fa39ec:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa39f0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa39f4:	eb0a013f	cmp	x9, x10
   0x0000fffff7fa39f8:	54000161	b.ne	0xfffff7fa3a24  // b.any
   0x0000fffff7fa39fc:	f9402669	ldr	x9, [x19, #72]
   0x0000fffff7fa3a00:	9e620121	scvtf	d1, x9
   0x0000fffff7fa3a04:	14000002	b	0xfffff7fa3a0c
   0x0000fffff7fa3a08:	fd402661	ldr	d1, [x19, #72]
   0x0000fffff7fa3a0c:	1e612800	fadd	d0, d0, d1
   0x0000fffff7fa3a10:	fd001e60	str	d0, [x19, #56]
   0x0000fffff7fa3a14:	5280008a	mov	w10, #0x4                   	// #4
   0x0000fffff7fa3a18:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3a1c:	b900326a	str	w10, [x19, #48]
   0x0000fffff7fa3a20:	17ffffde	b	0xfffff7fa3998
   0x0000fffff7fa3a24:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3a28:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3a2c:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3a30:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3a34:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7fa3a38:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3a3c:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3a40:	d294d890	mov	x16, #0xa6c4                	// #42692
   0x0000fffff7fa3a44:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3a48:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3a4c:	d63f0200	blr	x16
   0x0000fffff7fa3a50:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3a54:	540016a0	b.eq	0xfffff7fa3d28  // b.none
   0x0000fffff7fa3a58:	5280020d	mov	w13, #0x10                  	// #16
   0x0000fffff7fa3a5c:	72a1000d	movk	w13, #0x800, lsl #16
   0x0000fffff7fa3a60:	d299ba0c	mov	x12, #0xcdd0                	// #52688
   0x0000fffff7fa3a64:	f2b5580c	movk	x12, #0xaac0, lsl #16
   0x0000fffff7fa3a68:	f2d5554c	movk	x12, #0xaaaa, lsl #32
   0x0000fffff7fa3a6c:	b9404271	ldr	w17, [x19, #64]
   0x0000fffff7fa3a70:	36d801d1	tbz	w17, #27, 0xfffff7fa3aa8
   0x0000fffff7fa3a74:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3a78:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3a7c:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3a80:	54000281	b.ne	0xfffff7fa3ad0  // b.any
   0x0000fffff7fa3a84:	f940266f	ldr	x15, [x19, #72]
   0x0000fffff7fa3a88:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3a8c:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3a90:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3a94:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3a98:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3a9c:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3aa0:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3aa4:	54000169	b.ls	0xfffff7fa3ad0  // b.plast
   0x0000fffff7fa3aa8:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3aac:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3ab0:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa3ab4:	36d80091	tbz	w17, #27, 0xfffff7fa3ac4
   0x0000fffff7fa3ab8:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3abc:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3ac0:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3ac4:	f900266c	str	x12, [x19, #72]
   0x0000fffff7fa3ac8:	b900426d	str	w13, [x19, #64]
   0x0000fffff7fa3acc:	1400000e	b	0xfffff7fa3b04
   0x0000fffff7fa3ad0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3ad4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3ad8:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3adc:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3ae0:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7fa3ae4:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3ae8:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3aec:	d2957e10	mov	x16, #0xabf0                	// #44016
   0x0000fffff7fa3af0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3af4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3af8:	d63f0200	blr	x16
   0x0000fffff7fa3afc:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3b00:	54001180	b.eq	0xfffff7fa3d30  // b.none
   0x0000fffff7fa3b04:	f94017eb	ldr	x11, [sp, #40]
   0x0000fffff7fa3b08:	f100017f	cmp	x11, #0x0
   0x0000fffff7fa3b0c:	540003a0	b.eq	0xfffff7fa3b80  // b.none
   0x0000fffff7fa3b10:	b940326d	ldr	w13, [x19, #48]
   0x0000fffff7fa3b14:	f9401e6c	ldr	x12, [x19, #56]
   0x0000fffff7fa3b18:	b9400171	ldr	w17, [x11]
   0x0000fffff7fa3b1c:	36d801d1	tbz	w17, #27, 0xfffff7fa3b54
   0x0000fffff7fa3b20:	f94003e9	ldr	x9, [sp]
   0x0000fffff7fa3b24:	f9401529	ldr	x9, [x9, #40]
   0x0000fffff7fa3b28:	f100013f	cmp	x9, #0x0
   0x0000fffff7fa3b2c:	540002a1	b.ne	0xfffff7fa3b80  // b.any
   0x0000fffff7fa3b30:	f940056f	ldr	x15, [x11, #8]
   0x0000fffff7fa3b34:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3b38:	d29fffe9	mov	x9, #0xffff                	// #65535
   0x0000fffff7fa3b3c:	f2afffe9	movk	x9, #0x7fff, lsl #16
   0x0000fffff7fa3b40:	f2dfffe9	movk	x9, #0xffff, lsl #32
   0x0000fffff7fa3b44:	f2ffffe9	movk	x9, #0xffff, lsl #48
   0x0000fffff7fa3b48:	8a0901ca	and	x10, x14, x9
   0x0000fffff7fa3b4c:	f100055f	cmp	x10, #0x1
   0x0000fffff7fa3b50:	54000189	b.ls	0xfffff7fa3b80  // b.plast
   0x0000fffff7fa3b54:	36d8008d	tbz	w13, #27, 0xfffff7fa3b64
   0x0000fffff7fa3b58:	f9400589	ldr	x9, [x12, #8]
   0x0000fffff7fa3b5c:	91000529	add	x9, x9, #0x1
   0x0000fffff7fa3b60:	f9000589	str	x9, [x12, #8]
   0x0000fffff7fa3b64:	36d80091	tbz	w17, #27, 0xfffff7fa3b74
   0x0000fffff7fa3b68:	f94005ee	ldr	x14, [x15, #8]
   0x0000fffff7fa3b6c:	d10005ce	sub	x14, x14, #0x1
   0x0000fffff7fa3b70:	f90005ee	str	x14, [x15, #8]
   0x0000fffff7fa3b74:	f900056c	str	x12, [x11, #8]
   0x0000fffff7fa3b78:	b900016d	str	w13, [x11]
   0x0000fffff7fa3b7c:	1400000e	b	0xfffff7fa3bb4
   0x0000fffff7fa3b80:	910043e6	add	x6, sp, #0x10
   0x0000fffff7fa3b84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3b88:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3b8c:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3b90:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7fa3b94:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3b98:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3b9c:	d2835810	mov	x16, #0x1ac0                	// #6848
   0x0000fffff7fa3ba0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7fa3ba4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3ba8:	d63f0200	blr	x16
   0x0000fffff7fa3bac:	f100001f	cmp	x0, #0x0
   0x0000fffff7fa3bb0:	54000c40	b.eq	0xfffff7fa3d38  // b.none
   0x0000fffff7fa3bb4:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7fa3bb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7fa3bbc:	aa1303e1	mov	x1, x19
   0x0000fffff7fa3bc0:	aa1503e2	mov	x2, x21
   0x0000fffff7fa3bc4:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7fa3bc8:	aa1403e4	mov	x4, x20
   0x0000fffff7fa3bcc:	aa1603e5	mov	x5, x22
   0x0000fffff7fa3bd0:	d286ae90	mov	x16, #0x3574                	// #13684
   0x0000fffff7fa3bd4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7fa3bd8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7fa3bdc:	d63f0200	blr	x16
   0x0000fffff7fa3be0:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa3be4:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa3be8:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa3bec:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa3bf0:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7fa3bf4:	d65f03c0	ret
   0x0000fffff7fa3bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7fa3bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7fa3c00:	b900028a	str	w10, [x20]
   0x0000fffff7fa3c04:	f9000689	str	x9, [x20, #8]
   0x0000fffff7fa3c08:	910143ff	add	sp, sp, #0x50
   0x0000fffff7fa3c0c:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7fa3c10:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7fa3c14:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7fa3c18:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7fa3c1c:	d65f03c0	ret
   0x0000fffff7fa3c20:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7fa3c24:	17fffff5	b	0xfffff7fa3bf8
   0x0000fffff7fa3c28:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7fa3c2c:	17fffff3	b	0xfffff7fa3bf8
   0x0000fffff7fa3c30:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7fa3c34:	17fffff1	b	0xfffff7fa3bf8
   0x0000fffff7fa3c38:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7fa3c3c:	17ffffef	b	0xfffff7fa3bf8
   0x0000fffff7fa3c40:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7fa3c44:	17ffffed	b	0xfffff7fa3bf8
   0x0000fffff7fa3c48:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7fa3c4c:	17ffffeb	b	0xfffff7fa3bf8
   0x0000fffff7fa3c50:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7fa3c54:	17ffffe9	b	0xfffff7fa3bf8
   0x0000fffff7fa3c58:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7fa3c5c:	17ffffe7	b	0xfffff7fa3bf8
   0x0000fffff7fa3c60:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7fa3c64:	17ffffe5	b	0xfffff7fa3bf8
   0x0000fffff7fa3c68:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7fa3c6c:	17ffffe3	b	0xfffff7fa3bf8
   0x0000fffff7fa3c70:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7fa3c74:	17ffffe1	b	0xfffff7fa3bf8
   0x0000fffff7fa3c78:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7fa3c7c:	17ffffdf	b	0xfffff7fa3bf8
   0x0000fffff7fa3c80:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7fa3c84:	17ffffdd	b	0xfffff7fa3bf8
   0x0000fffff7fa3c88:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7fa3c8c:	17ffffdb	b	0xfffff7fa3bf8
   0x0000fffff7fa3c90:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7fa3c94:	17ffffd9	b	0xfffff7fa3bf8
   0x0000fffff7fa3c98:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7fa3c9c:	17ffffd7	b	0xfffff7fa3bf8
   0x0000fffff7fa3ca0:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7fa3ca4:	17ffffd5	b	0xfffff7fa3bf8
   0x0000fffff7fa3ca8:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7fa3cac:	17ffffd3	b	0xfffff7fa3bf8
   0x0000fffff7fa3cb0:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7fa3cb4:	17ffffd1	b	0xfffff7fa3bf8
   0x0000fffff7fa3cb8:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7fa3cbc:	17ffffcf	b	0xfffff7fa3bf8
   0x0000fffff7fa3cc0:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7fa3cc4:	17ffffcd	b	0xfffff7fa3bf8
   0x0000fffff7fa3cc8:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7fa3ccc:	17ffffcb	b	0xfffff7fa3bf8
   0x0000fffff7fa3cd0:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7fa3cd4:	17ffffc9	b	0xfffff7fa3bf8
   0x0000fffff7fa3cd8:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7fa3cdc:	17ffffc7	b	0xfffff7fa3bf8
   0x0000fffff7fa3ce0:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7fa3ce4:	17ffffc5	b	0xfffff7fa3bf8
   0x0000fffff7fa3ce8:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7fa3cec:	17ffffc3	b	0xfffff7fa3bf8
   0x0000fffff7fa3cf0:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7fa3cf4:	17ffffc1	b	0xfffff7fa3bf8
   0x0000fffff7fa3cf8:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7fa3cfc:	17ffffbf	b	0xfffff7fa3bf8
   0x0000fffff7fa3d00:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7fa3d04:	17ffffbd	b	0xfffff7fa3bf8
   0x0000fffff7fa3d08:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7fa3d0c:	17ffffbb	b	0xfffff7fa3bf8
   0x0000fffff7fa3d10:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7fa3d14:	17ffffb9	b	0xfffff7fa3bf8
   0x0000fffff7fa3d18:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7fa3d1c:	17ffffb7	b	0xfffff7fa3bf8
   0x0000fffff7fa3d20:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7fa3d24:	17ffffb5	b	0xfffff7fa3bf8
   0x0000fffff7fa3d28:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7fa3d2c:	17ffffb3	b	0xfffff7fa3bf8
   0x0000fffff7fa3d30:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7fa3d34:	17ffffb1	b	0xfffff7fa3bf8
   0x0000fffff7fa3d38:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7fa3d3c:	17ffffaf	b	0xfffff7fa3bf8
   0x0000fffff7fa3d40:	00000000	udf	#0
   0x0000fffff7fa3d44:	00000000	udf	#0
   0x0000fffff7fa3d48:	00000000	udf	#0
   0x0000fffff7fa3d4c:	00000000	udf	#0
   0x0000fffff7fa3d50:	00000000	udf	#0
   0x0000fffff7fa3d54:	00000000	udf	#0
   0x0000fffff7fa3d58:	00000000	udf	#0
   0x0000fffff7fa3d5c:	00000000	udf	#0
   0x0000fffff7fa3d60:	00000000	udf	#0
   0x0000fffff7fa3d64:	00000000	udf	#0
   0x0000fffff7fa3d68:	00000000	udf	#0
   0x0000fffff7fa3d6c:	00000000	udf	#0
   0x0000fffff7fa3d70:	00000000	udf	#0
   0x0000fffff7fa3d74:	00000000	udf	#0
   0x0000fffff7fa3d78:	00000000	udf	#0
   0x0000fffff7fa3d7c:	00000000	udf	#0
   0x0000fffff7fa3d80:	00000000	udf	#0
   0x0000fffff7fa3d84:	00000000	udf	#0
   0x0000fffff7fa3d88:	00000000	udf	#0
   0x0000fffff7fa3d8c:	00000000	udf	#0
   0x0000fffff7fa3d90:	00000000	udf	#0
   0x0000fffff7fa3d94:	00000000	udf	#0
   0x0000fffff7fa3d98:	00000000	udf	#0
   0x0000fffff7fa3d9c:	00000000	udf	#0
   0x0000fffff7fa3da0:	00000000	udf	#0
   0x0000fffff7fa3da4:	00000000	udf	#0
   0x0000fffff7fa3da8:	00000000	udf	#0
   0x0000fffff7fa3dac:	00000000	udf	#0
   0x0000fffff7fa3db0:	00000000	udf	#0
   0x0000fffff7fa3db4:	00000000	udf	#0
   0x0000fffff7fa3db8:	00000000	udf	#0
   0x0000fffff7fa3dbc:	00000000	udf	#0
   0x0000fffff7fa3dc0:	00000000	udf	#0
   0x0000fffff7fa3dc4:	00000000	udf	#0
   0x0000fffff7fa3dc8:	00000000	udf	#0
   0x0000fffff7fa3dcc:	00000000	udf	#0
   0x0000fffff7fa3dd0:	00000000	udf	#0
   0x0000fffff7fa3dd4:	00000000	udf	#0
   0x0000fffff7fa3dd8:	00000000	udf	#0
   0x0000fffff7fa3ddc:	00000000	udf	#0
   0x0000fffff7fa3de0:	00000000	udf	#0
   0x0000fffff7fa3de4:	00000000	udf	#0
   0x0000fffff7fa3de8:	00000000	udf	#0
   0x0000fffff7fa3dec:	00000000	udf	#0
   0x0000fffff7fa3df0:	00000000	udf	#0
   0x0000fffff7fa3df4:	00000000	udf	#0
   0x0000fffff7fa3df8:	00000000	udf	#0
   0x0000fffff7fa3dfc:	00000000	udf	#0
   0x0000fffff7fa3e00:	00000000	udf	#0
   0x0000fffff7fa3e04:	00000000	udf	#0
   0x0000fffff7fa3e08:	00000000	udf	#0
   0x0000fffff7fa3e0c:	00000000	udf	#0
   0x0000fffff7fa3e10:	00000000	udf	#0
   0x0000fffff7fa3e14:	00000000	udf	#0
   0x0000fffff7fa3e18:	00000000	udf	#0
   0x0000fffff7fa3e1c:	00000000	udf	#0
   0x0000fffff7fa3e20:	00000000	udf	#0
   0x0000fffff7fa3e24:	00000000	udf	#0
   0x0000fffff7fa3e28:	00000000	udf	#0
   0x0000fffff7fa3e2c:	00000000	udf	#0
   0x0000fffff7fa3e30:	00000000	udf	#0
   0x0000fffff7fa3e34:	00000000	udf	#0
   0x0000fffff7fa3e38:	00000000	udf	#0
   0x0000fffff7fa3e3c:	00000000	udf	#0
   0x0000fffff7fa3e40:	00000000	udf	#0
   0x0000fffff7fa3e44:	00000000	udf	#0
   0x0000fffff7fa3e48:	00000000	udf	#0
   0x0000fffff7fa3e4c:	00000000	udf	#0
   0x0000fffff7fa3e50:	00000000	udf	#0
   0x0000fffff7fa3e54:	00000000	udf	#0
   0x0000fffff7fa3e58:	00000000	udf	#0
   0x0000fffff7fa3e5c:	00000000	udf	#0
   0x0000fffff7fa3e60:	00000000	udf	#0
   0x0000fffff7fa3e64:	00000000	udf	#0
   0x0000fffff7fa3e68:	00000000	udf	#0
   0x0000fffff7fa3e6c:	00000000	udf	#0
   0x0000fffff7fa3e70:	00000000	udf	#0
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
