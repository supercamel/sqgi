Dump of assembler code from 0xfffff7f98000 to 0xfffff7f9a000:
   0x0000fffff7f98000:	a9bf7bfd	stp	x29, x30, [sp, #-16]!
   0x0000fffff7f98004:	910003fd	mov	x29, sp
   0x0000fffff7f98008:	a9bf53f3	stp	x19, x20, [sp, #-16]!
   0x0000fffff7f9800c:	a9bf5bf5	stp	x21, x22, [sp, #-16]!
   0x0000fffff7f98010:	d10143ff	sub	sp, sp, #0x50
   0x0000fffff7f98014:	aa0003f3	mov	x19, x0
   0x0000fffff7f98018:	aa0103f4	mov	x20, x1
   0x0000fffff7f9801c:	aa0203f5	mov	x21, x2
   0x0000fffff7f98020:	d2996c09	mov	x9, #0xcb60                	// #52064
   0x0000fffff7f98024:	f2b557a9	movk	x9, #0xaabd, lsl #16
   0x0000fffff7f98028:	f2d55549	movk	x9, #0xaaaa, lsl #32
   0x0000fffff7f9802c:	f90003e9	str	x9, [sp]
   0x0000fffff7f98030:	910043e0	add	x0, sp, #0x10
   0x0000fffff7f98034:	d2800041	mov	x1, #0x2                   	// #2
   0x0000fffff7f98038:	d29e5a10	mov	x16, #0xf2d0                	// #62160
   0x0000fffff7f9803c:	f2b55670	movk	x16, #0xaab3, lsl #16
   0x0000fffff7f98040:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98044:	d63f0200	blr	x16
   0x0000fffff7f98048:	d2997016	mov	x22, #0xcb80                	// #52096
   0x0000fffff7f9804c:	f2b557b6	movk	x22, #0xaabd, lsl #16
   0x0000fffff7f98050:	f2d55556	movk	x22, #0xaaaa, lsl #32
   0x0000fffff7f98054:	f94002d6	ldr	x22, [x22]
   0x0000fffff7f98058:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9805c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98060:	aa1303e1	mov	x1, x19
   0x0000fffff7f98064:	aa1503e2	mov	x2, x21
   0x0000fffff7f98068:	d2800003	mov	x3, #0x0                   	// #0
   0x0000fffff7f9806c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98070:	aa1603e5	mov	x5, x22
   0x0000fffff7f98074:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98078:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f9807c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98080:	d63f0200	blr	x16
   0x0000fffff7f98084:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98088:	5400c760	b.eq	0xfffff7f99974  // b.none
   0x0000fffff7f9808c:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98090:	37d800e9	tbnz	w9, #27, 0xfffff7f980ac
   0x0000fffff7f98094:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f98098:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9809c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f980a0:	f9001e69	str	x9, [x19, #56]
   0x0000fffff7f980a4:	b900326a	str	w10, [x19, #48]
   0x0000fffff7f980a8:	1400000e	b	0xfffff7f980e0
   0x0000fffff7f980ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f980b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f980b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f980b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f980bc:	d2800023	mov	x3, #0x1                   	// #1
   0x0000fffff7f980c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f980c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f980c8:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f980cc:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f980d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f980d4:	d63f0200	blr	x16
   0x0000fffff7f980d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f980dc:	5400c500	b.eq	0xfffff7f9997c  // b.none
   0x0000fffff7f980e0:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f980e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f980e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f980ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f980f0:	d2800043	mov	x3, #0x2                   	// #2
   0x0000fffff7f980f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f980f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f980fc:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98100:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98104:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98108:	d63f0200	blr	x16
   0x0000fffff7f9810c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98110:	5400c3a0	b.eq	0xfffff7f99984  // b.none
   0x0000fffff7f98114:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98118:	37d800e9	tbnz	w9, #27, 0xfffff7f98134
   0x0000fffff7f9811c:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f98120:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98124:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98128:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f9812c:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98130:	1400000e	b	0xfffff7f98168
   0x0000fffff7f98134:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98138:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9813c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98140:	aa1503e2	mov	x2, x21
   0x0000fffff7f98144:	d2800063	mov	x3, #0x3                   	// #3
   0x0000fffff7f98148:	aa1403e4	mov	x4, x20
   0x0000fffff7f9814c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98150:	d2854610	mov	x16, #0x2a30                	// #10800
   0x0000fffff7f98154:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98158:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9815c:	d63f0200	blr	x16
   0x0000fffff7f98160:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98164:	5400c140	b.eq	0xfffff7f9998c  // b.none
   0x0000fffff7f98168:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9816c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98170:	aa1303e1	mov	x1, x19
   0x0000fffff7f98174:	aa1503e2	mov	x2, x21
   0x0000fffff7f98178:	d2800083	mov	x3, #0x4                   	// #4
   0x0000fffff7f9817c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98180:	aa1603e5	mov	x5, x22
   0x0000fffff7f98184:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98188:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9818c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98190:	d63f0200	blr	x16
   0x0000fffff7f98194:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98198:	5400bfe0	b.eq	0xfffff7f99994  // b.none
   0x0000fffff7f9819c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f981a0:	37d80269	tbnz	w9, #27, 0xfffff7f981ec
   0x0000fffff7f981a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f981a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f981ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f981b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f981b4:	540001c1	b.ne	0xfffff7f981ec  // b.any
   0x0000fffff7f981b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f981bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f981c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f981c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f981c8:	54000121	b.ne	0xfffff7f981ec  // b.any
   0x0000fffff7f981cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f981d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f981d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f981d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f981dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f981e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f981e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f981e8:	1400000e	b	0xfffff7f98220
   0x0000fffff7f981ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f981f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f981f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f981f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f981fc:	d28000a3	mov	x3, #0x5                   	// #5
   0x0000fffff7f98200:	aa1403e4	mov	x4, x20
   0x0000fffff7f98204:	aa1603e5	mov	x5, x22
   0x0000fffff7f98208:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9820c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98210:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98214:	d63f0200	blr	x16
   0x0000fffff7f98218:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9821c:	5400bc00	b.eq	0xfffff7f9999c  // b.none
   0x0000fffff7f98220:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98224:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98228:	aa1303e1	mov	x1, x19
   0x0000fffff7f9822c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98230:	d28000c3	mov	x3, #0x6                   	// #6
   0x0000fffff7f98234:	aa1403e4	mov	x4, x20
   0x0000fffff7f98238:	aa1603e5	mov	x5, x22
   0x0000fffff7f9823c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98240:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98244:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98248:	d63f0200	blr	x16
   0x0000fffff7f9824c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98250:	5400baa0	b.eq	0xfffff7f999a4  // b.none
   0x0000fffff7f98254:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98258:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9825c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98260:	aa1503e2	mov	x2, x21
   0x0000fffff7f98264:	d28000e3	mov	x3, #0x7                   	// #7
   0x0000fffff7f98268:	aa1403e4	mov	x4, x20
   0x0000fffff7f9826c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98270:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98274:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98278:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9827c:	d63f0200	blr	x16
   0x0000fffff7f98280:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98284:	5400b940	b.eq	0xfffff7f999ac  // b.none
   0x0000fffff7f98288:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9828c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98290:	aa1303e1	mov	x1, x19
   0x0000fffff7f98294:	aa1503e2	mov	x2, x21
   0x0000fffff7f98298:	d2800103	mov	x3, #0x8                   	// #8
   0x0000fffff7f9829c:	aa1403e4	mov	x4, x20
   0x0000fffff7f982a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f982a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f982a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f982ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f982b0:	d63f0200	blr	x16
   0x0000fffff7f982b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f982b8:	5400b7e0	b.eq	0xfffff7f999b4  // b.none
   0x0000fffff7f982bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f982c0:	37d80269	tbnz	w9, #27, 0xfffff7f9830c
   0x0000fffff7f982c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f982c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f982cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f982d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f982d4:	540001c1	b.ne	0xfffff7f9830c  // b.any
   0x0000fffff7f982d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f982dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f982e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f982e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f982e8:	54000121	b.ne	0xfffff7f9830c  // b.any
   0x0000fffff7f982ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f982f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f982f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f982f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f982fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98300:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98304:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98308:	1400000e	b	0xfffff7f98340
   0x0000fffff7f9830c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98310:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98314:	aa1303e1	mov	x1, x19
   0x0000fffff7f98318:	aa1503e2	mov	x2, x21
   0x0000fffff7f9831c:	d2800123	mov	x3, #0x9                   	// #9
   0x0000fffff7f98320:	aa1403e4	mov	x4, x20
   0x0000fffff7f98324:	aa1603e5	mov	x5, x22
   0x0000fffff7f98328:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9832c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98330:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98334:	d63f0200	blr	x16
   0x0000fffff7f98338:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9833c:	5400b400	b.eq	0xfffff7f999bc  // b.none
   0x0000fffff7f98340:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98344:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98348:	aa1303e1	mov	x1, x19
   0x0000fffff7f9834c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98350:	d2800143	mov	x3, #0xa                   	// #10
   0x0000fffff7f98354:	aa1403e4	mov	x4, x20
   0x0000fffff7f98358:	aa1603e5	mov	x5, x22
   0x0000fffff7f9835c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98360:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98364:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98368:	d63f0200	blr	x16
   0x0000fffff7f9836c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98370:	5400b2a0	b.eq	0xfffff7f999c4  // b.none
   0x0000fffff7f98374:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98378:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9837c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98380:	aa1503e2	mov	x2, x21
   0x0000fffff7f98384:	d2800163	mov	x3, #0xb                   	// #11
   0x0000fffff7f98388:	aa1403e4	mov	x4, x20
   0x0000fffff7f9838c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98390:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98394:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98398:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9839c:	d63f0200	blr	x16
   0x0000fffff7f983a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f983a4:	5400b140	b.eq	0xfffff7f999cc  // b.none
   0x0000fffff7f983a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f983ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f983b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f983b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f983b8:	d2800183	mov	x3, #0xc                   	// #12
   0x0000fffff7f983bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f983c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f983c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f983c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f983cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f983d0:	d63f0200	blr	x16
   0x0000fffff7f983d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f983d8:	5400afe0	b.eq	0xfffff7f999d4  // b.none
   0x0000fffff7f983dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f983e0:	37d80269	tbnz	w9, #27, 0xfffff7f9842c
   0x0000fffff7f983e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f983e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f983ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f983f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f983f4:	540001c1	b.ne	0xfffff7f9842c  // b.any
   0x0000fffff7f983f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f983fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98400:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98404:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98408:	54000121	b.ne	0xfffff7f9842c  // b.any
   0x0000fffff7f9840c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98410:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98414:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98418:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9841c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98420:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98424:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98428:	1400000e	b	0xfffff7f98460
   0x0000fffff7f9842c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98430:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98434:	aa1303e1	mov	x1, x19
   0x0000fffff7f98438:	aa1503e2	mov	x2, x21
   0x0000fffff7f9843c:	d28001a3	mov	x3, #0xd                   	// #13
   0x0000fffff7f98440:	aa1403e4	mov	x4, x20
   0x0000fffff7f98444:	aa1603e5	mov	x5, x22
   0x0000fffff7f98448:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9844c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98450:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98454:	d63f0200	blr	x16
   0x0000fffff7f98458:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9845c:	5400ac00	b.eq	0xfffff7f999dc  // b.none
   0x0000fffff7f98460:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98464:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98468:	aa1303e1	mov	x1, x19
   0x0000fffff7f9846c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98470:	d28001c3	mov	x3, #0xe                   	// #14
   0x0000fffff7f98474:	aa1403e4	mov	x4, x20
   0x0000fffff7f98478:	aa1603e5	mov	x5, x22
   0x0000fffff7f9847c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98480:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98484:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98488:	d63f0200	blr	x16
   0x0000fffff7f9848c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98490:	5400aaa0	b.eq	0xfffff7f999e4  // b.none
   0x0000fffff7f98494:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98498:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9849c:	aa1303e1	mov	x1, x19
   0x0000fffff7f984a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f984a4:	d28001e3	mov	x3, #0xf                   	// #15
   0x0000fffff7f984a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f984ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f984b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f984b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f984b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f984bc:	d63f0200	blr	x16
   0x0000fffff7f984c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f984c4:	5400a940	b.eq	0xfffff7f999ec  // b.none
   0x0000fffff7f984c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f984cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f984d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f984d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f984d8:	d2800203	mov	x3, #0x10                  	// #16
   0x0000fffff7f984dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f984e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f984e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f984e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f984ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f984f0:	d63f0200	blr	x16
   0x0000fffff7f984f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f984f8:	5400a7e0	b.eq	0xfffff7f999f4  // b.none
   0x0000fffff7f984fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98500:	37d80269	tbnz	w9, #27, 0xfffff7f9854c
   0x0000fffff7f98504:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98508:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9850c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98510:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98514:	540001c1	b.ne	0xfffff7f9854c  // b.any
   0x0000fffff7f98518:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9851c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98520:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98524:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98528:	54000121	b.ne	0xfffff7f9854c  // b.any
   0x0000fffff7f9852c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98530:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98534:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98538:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9853c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98540:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98544:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98548:	1400000e	b	0xfffff7f98580
   0x0000fffff7f9854c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98550:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98554:	aa1303e1	mov	x1, x19
   0x0000fffff7f98558:	aa1503e2	mov	x2, x21
   0x0000fffff7f9855c:	d2800223	mov	x3, #0x11                  	// #17
   0x0000fffff7f98560:	aa1403e4	mov	x4, x20
   0x0000fffff7f98564:	aa1603e5	mov	x5, x22
   0x0000fffff7f98568:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9856c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98570:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98574:	d63f0200	blr	x16
   0x0000fffff7f98578:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9857c:	5400a400	b.eq	0xfffff7f999fc  // b.none
   0x0000fffff7f98580:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98584:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98588:	aa1303e1	mov	x1, x19
   0x0000fffff7f9858c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98590:	d2800243	mov	x3, #0x12                  	// #18
   0x0000fffff7f98594:	aa1403e4	mov	x4, x20
   0x0000fffff7f98598:	aa1603e5	mov	x5, x22
   0x0000fffff7f9859c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f985a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f985a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f985a8:	d63f0200	blr	x16
   0x0000fffff7f985ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f985b0:	5400a2a0	b.eq	0xfffff7f99a04  // b.none
   0x0000fffff7f985b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f985b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f985bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f985c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f985c4:	d2800263	mov	x3, #0x13                  	// #19
   0x0000fffff7f985c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f985cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f985d0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f985d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f985d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f985dc:	d63f0200	blr	x16
   0x0000fffff7f985e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f985e4:	5400a140	b.eq	0xfffff7f99a0c  // b.none
   0x0000fffff7f985e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f985ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f985f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f985f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f985f8:	d2800283	mov	x3, #0x14                  	// #20
   0x0000fffff7f985fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f98600:	aa1603e5	mov	x5, x22
   0x0000fffff7f98604:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98608:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9860c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98610:	d63f0200	blr	x16
   0x0000fffff7f98614:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98618:	54009fe0	b.eq	0xfffff7f99a14  // b.none
   0x0000fffff7f9861c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98620:	37d80269	tbnz	w9, #27, 0xfffff7f9866c
   0x0000fffff7f98624:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98628:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9862c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98630:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98634:	540001c1	b.ne	0xfffff7f9866c  // b.any
   0x0000fffff7f98638:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9863c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98640:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98644:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98648:	54000121	b.ne	0xfffff7f9866c  // b.any
   0x0000fffff7f9864c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98650:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98654:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98658:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9865c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98660:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98664:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98668:	1400000e	b	0xfffff7f986a0
   0x0000fffff7f9866c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98670:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98674:	aa1303e1	mov	x1, x19
   0x0000fffff7f98678:	aa1503e2	mov	x2, x21
   0x0000fffff7f9867c:	d28002a3	mov	x3, #0x15                  	// #21
   0x0000fffff7f98680:	aa1403e4	mov	x4, x20
   0x0000fffff7f98684:	aa1603e5	mov	x5, x22
   0x0000fffff7f98688:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9868c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98690:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98694:	d63f0200	blr	x16
   0x0000fffff7f98698:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9869c:	54009c00	b.eq	0xfffff7f99a1c  // b.none
   0x0000fffff7f986a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f986a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f986a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f986ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f986b0:	d28002c3	mov	x3, #0x16                  	// #22
   0x0000fffff7f986b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f986b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f986bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f986c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f986c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f986c8:	d63f0200	blr	x16
   0x0000fffff7f986cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f986d0:	54009aa0	b.eq	0xfffff7f99a24  // b.none
   0x0000fffff7f986d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f986d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f986dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f986e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f986e4:	d28002e3	mov	x3, #0x17                  	// #23
   0x0000fffff7f986e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f986ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f986f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f986f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f986f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f986fc:	d63f0200	blr	x16
   0x0000fffff7f98700:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98704:	54009940	b.eq	0xfffff7f99a2c  // b.none
   0x0000fffff7f98708:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9870c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98710:	aa1303e1	mov	x1, x19
   0x0000fffff7f98714:	aa1503e2	mov	x2, x21
   0x0000fffff7f98718:	d2800303	mov	x3, #0x18                  	// #24
   0x0000fffff7f9871c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98720:	aa1603e5	mov	x5, x22
   0x0000fffff7f98724:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98728:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9872c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98730:	d63f0200	blr	x16
   0x0000fffff7f98734:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98738:	540097e0	b.eq	0xfffff7f99a34  // b.none
   0x0000fffff7f9873c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98740:	37d80269	tbnz	w9, #27, 0xfffff7f9878c
   0x0000fffff7f98744:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98748:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9874c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98750:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98754:	540001c1	b.ne	0xfffff7f9878c  // b.any
   0x0000fffff7f98758:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9875c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98760:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98764:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98768:	54000121	b.ne	0xfffff7f9878c  // b.any
   0x0000fffff7f9876c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98770:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98774:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98778:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9877c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98780:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98784:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98788:	1400000e	b	0xfffff7f987c0
   0x0000fffff7f9878c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98790:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98794:	aa1303e1	mov	x1, x19
   0x0000fffff7f98798:	aa1503e2	mov	x2, x21
   0x0000fffff7f9879c:	d2800323	mov	x3, #0x19                  	// #25
   0x0000fffff7f987a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f987a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f987a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f987ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f987b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f987b4:	d63f0200	blr	x16
   0x0000fffff7f987b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f987bc:	54009400	b.eq	0xfffff7f99a3c  // b.none
   0x0000fffff7f987c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f987c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f987c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f987cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f987d0:	d2800343	mov	x3, #0x1a                  	// #26
   0x0000fffff7f987d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f987d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f987dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f987e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f987e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f987e8:	d63f0200	blr	x16
   0x0000fffff7f987ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f987f0:	540092a0	b.eq	0xfffff7f99a44  // b.none
   0x0000fffff7f987f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f987f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f987fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f98800:	aa1503e2	mov	x2, x21
   0x0000fffff7f98804:	d2800363	mov	x3, #0x1b                  	// #27
   0x0000fffff7f98808:	aa1403e4	mov	x4, x20
   0x0000fffff7f9880c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98810:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98814:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98818:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9881c:	d63f0200	blr	x16
   0x0000fffff7f98820:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98824:	54009140	b.eq	0xfffff7f99a4c  // b.none
   0x0000fffff7f98828:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9882c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98830:	aa1303e1	mov	x1, x19
   0x0000fffff7f98834:	aa1503e2	mov	x2, x21
   0x0000fffff7f98838:	d2800383	mov	x3, #0x1c                  	// #28
   0x0000fffff7f9883c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98840:	aa1603e5	mov	x5, x22
   0x0000fffff7f98844:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98848:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9884c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98850:	d63f0200	blr	x16
   0x0000fffff7f98854:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98858:	54008fe0	b.eq	0xfffff7f99a54  // b.none
   0x0000fffff7f9885c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98860:	37d80269	tbnz	w9, #27, 0xfffff7f988ac
   0x0000fffff7f98864:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98868:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9886c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98870:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98874:	540001c1	b.ne	0xfffff7f988ac  // b.any
   0x0000fffff7f98878:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9887c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98880:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98884:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98888:	54000121	b.ne	0xfffff7f988ac  // b.any
   0x0000fffff7f9888c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98890:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98894:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98898:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9889c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f988a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f988a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f988a8:	1400000e	b	0xfffff7f988e0
   0x0000fffff7f988ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f988b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f988b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f988b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f988bc:	d28003a3	mov	x3, #0x1d                  	// #29
   0x0000fffff7f988c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f988c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f988c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f988cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f988d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f988d4:	d63f0200	blr	x16
   0x0000fffff7f988d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f988dc:	54008c00	b.eq	0xfffff7f99a5c  // b.none
   0x0000fffff7f988e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f988e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f988e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f988ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f988f0:	d28003c3	mov	x3, #0x1e                  	// #30
   0x0000fffff7f988f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f988f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f988fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98900:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98904:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98908:	d63f0200	blr	x16
   0x0000fffff7f9890c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98910:	54008aa0	b.eq	0xfffff7f99a64  // b.none
   0x0000fffff7f98914:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98918:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9891c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98920:	aa1503e2	mov	x2, x21
   0x0000fffff7f98924:	d28003e3	mov	x3, #0x1f                  	// #31
   0x0000fffff7f98928:	aa1403e4	mov	x4, x20
   0x0000fffff7f9892c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98930:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98934:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98938:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9893c:	d63f0200	blr	x16
   0x0000fffff7f98940:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98944:	54008940	b.eq	0xfffff7f99a6c  // b.none
   0x0000fffff7f98948:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9894c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98950:	aa1303e1	mov	x1, x19
   0x0000fffff7f98954:	aa1503e2	mov	x2, x21
   0x0000fffff7f98958:	d2800403	mov	x3, #0x20                  	// #32
   0x0000fffff7f9895c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98960:	aa1603e5	mov	x5, x22
   0x0000fffff7f98964:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98968:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9896c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98970:	d63f0200	blr	x16
   0x0000fffff7f98974:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98978:	540087e0	b.eq	0xfffff7f99a74  // b.none
   0x0000fffff7f9897c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98980:	37d80269	tbnz	w9, #27, 0xfffff7f989cc
   0x0000fffff7f98984:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98988:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9898c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98990:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98994:	540001c1	b.ne	0xfffff7f989cc  // b.any
   0x0000fffff7f98998:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9899c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f989a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f989a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f989a8:	54000121	b.ne	0xfffff7f989cc  // b.any
   0x0000fffff7f989ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f989b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f989b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f989b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f989bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f989c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f989c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f989c8:	1400000e	b	0xfffff7f98a00
   0x0000fffff7f989cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f989d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f989d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f989d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f989dc:	d2800423	mov	x3, #0x21                  	// #33
   0x0000fffff7f989e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f989e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f989e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f989ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f989f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f989f4:	d63f0200	blr	x16
   0x0000fffff7f989f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f989fc:	54008400	b.eq	0xfffff7f99a7c  // b.none
   0x0000fffff7f98a00:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98a04:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98a08:	aa1303e1	mov	x1, x19
   0x0000fffff7f98a0c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98a10:	d2800443	mov	x3, #0x22                  	// #34
   0x0000fffff7f98a14:	aa1403e4	mov	x4, x20
   0x0000fffff7f98a18:	aa1603e5	mov	x5, x22
   0x0000fffff7f98a1c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98a20:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98a24:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98a28:	d63f0200	blr	x16
   0x0000fffff7f98a2c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98a30:	540082a0	b.eq	0xfffff7f99a84  // b.none
   0x0000fffff7f98a34:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98a38:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98a3c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98a40:	aa1503e2	mov	x2, x21
   0x0000fffff7f98a44:	d2800463	mov	x3, #0x23                  	// #35
   0x0000fffff7f98a48:	aa1403e4	mov	x4, x20
   0x0000fffff7f98a4c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98a50:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98a54:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98a58:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98a5c:	d63f0200	blr	x16
   0x0000fffff7f98a60:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98a64:	54008140	b.eq	0xfffff7f99a8c  // b.none
   0x0000fffff7f98a68:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98a6c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98a70:	aa1303e1	mov	x1, x19
   0x0000fffff7f98a74:	aa1503e2	mov	x2, x21
   0x0000fffff7f98a78:	d2800483	mov	x3, #0x24                  	// #36
   0x0000fffff7f98a7c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98a80:	aa1603e5	mov	x5, x22
   0x0000fffff7f98a84:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98a88:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98a8c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98a90:	d63f0200	blr	x16
   0x0000fffff7f98a94:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98a98:	54007fe0	b.eq	0xfffff7f99a94  // b.none
   0x0000fffff7f98a9c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98aa0:	37d80269	tbnz	w9, #27, 0xfffff7f98aec
   0x0000fffff7f98aa4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98aa8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98aac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ab0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98ab4:	540001c1	b.ne	0xfffff7f98aec  // b.any
   0x0000fffff7f98ab8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98abc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98ac0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ac4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98ac8:	54000121	b.ne	0xfffff7f98aec  // b.any
   0x0000fffff7f98acc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98ad0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98ad4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98ad8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98adc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98ae0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98ae4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98ae8:	1400000e	b	0xfffff7f98b20
   0x0000fffff7f98aec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98af0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98af4:	aa1303e1	mov	x1, x19
   0x0000fffff7f98af8:	aa1503e2	mov	x2, x21
   0x0000fffff7f98afc:	d28004a3	mov	x3, #0x25                  	// #37
   0x0000fffff7f98b00:	aa1403e4	mov	x4, x20
   0x0000fffff7f98b04:	aa1603e5	mov	x5, x22
   0x0000fffff7f98b08:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98b0c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98b10:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98b14:	d63f0200	blr	x16
   0x0000fffff7f98b18:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98b1c:	54007c00	b.eq	0xfffff7f99a9c  // b.none
   0x0000fffff7f98b20:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98b24:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98b28:	aa1303e1	mov	x1, x19
   0x0000fffff7f98b2c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98b30:	d28004c3	mov	x3, #0x26                  	// #38
   0x0000fffff7f98b34:	aa1403e4	mov	x4, x20
   0x0000fffff7f98b38:	aa1603e5	mov	x5, x22
   0x0000fffff7f98b3c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98b40:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98b44:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98b48:	d63f0200	blr	x16
   0x0000fffff7f98b4c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98b50:	54007aa0	b.eq	0xfffff7f99aa4  // b.none
   0x0000fffff7f98b54:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98b58:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98b5c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98b60:	aa1503e2	mov	x2, x21
   0x0000fffff7f98b64:	d28004e3	mov	x3, #0x27                  	// #39
   0x0000fffff7f98b68:	aa1403e4	mov	x4, x20
   0x0000fffff7f98b6c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98b70:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98b74:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98b78:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98b7c:	d63f0200	blr	x16
   0x0000fffff7f98b80:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98b84:	54007940	b.eq	0xfffff7f99aac  // b.none
   0x0000fffff7f98b88:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98b8c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98b90:	aa1303e1	mov	x1, x19
   0x0000fffff7f98b94:	aa1503e2	mov	x2, x21
   0x0000fffff7f98b98:	d2800503	mov	x3, #0x28                  	// #40
   0x0000fffff7f98b9c:	aa1403e4	mov	x4, x20
   0x0000fffff7f98ba0:	aa1603e5	mov	x5, x22
   0x0000fffff7f98ba4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98ba8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98bac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98bb0:	d63f0200	blr	x16
   0x0000fffff7f98bb4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98bb8:	540077e0	b.eq	0xfffff7f99ab4  // b.none
   0x0000fffff7f98bbc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98bc0:	37d80269	tbnz	w9, #27, 0xfffff7f98c0c
   0x0000fffff7f98bc4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98bc8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98bcc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98bd0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98bd4:	540001c1	b.ne	0xfffff7f98c0c  // b.any
   0x0000fffff7f98bd8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98bdc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98be0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98be4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98be8:	54000121	b.ne	0xfffff7f98c0c  // b.any
   0x0000fffff7f98bec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98bf0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98bf4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98bf8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98bfc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98c00:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98c04:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98c08:	1400000e	b	0xfffff7f98c40
   0x0000fffff7f98c0c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98c10:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98c14:	aa1303e1	mov	x1, x19
   0x0000fffff7f98c18:	aa1503e2	mov	x2, x21
   0x0000fffff7f98c1c:	d2800523	mov	x3, #0x29                  	// #41
   0x0000fffff7f98c20:	aa1403e4	mov	x4, x20
   0x0000fffff7f98c24:	aa1603e5	mov	x5, x22
   0x0000fffff7f98c28:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98c2c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98c30:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98c34:	d63f0200	blr	x16
   0x0000fffff7f98c38:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98c3c:	54007400	b.eq	0xfffff7f99abc  // b.none
   0x0000fffff7f98c40:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98c44:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98c48:	aa1303e1	mov	x1, x19
   0x0000fffff7f98c4c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98c50:	d2800543	mov	x3, #0x2a                  	// #42
   0x0000fffff7f98c54:	aa1403e4	mov	x4, x20
   0x0000fffff7f98c58:	aa1603e5	mov	x5, x22
   0x0000fffff7f98c5c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98c60:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98c64:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98c68:	d63f0200	blr	x16
   0x0000fffff7f98c6c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98c70:	540072a0	b.eq	0xfffff7f99ac4  // b.none
   0x0000fffff7f98c74:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98c78:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98c7c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98c80:	aa1503e2	mov	x2, x21
   0x0000fffff7f98c84:	d2800563	mov	x3, #0x2b                  	// #43
   0x0000fffff7f98c88:	aa1403e4	mov	x4, x20
   0x0000fffff7f98c8c:	aa1603e5	mov	x5, x22
   0x0000fffff7f98c90:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98c94:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98c98:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98c9c:	d63f0200	blr	x16
   0x0000fffff7f98ca0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98ca4:	54007140	b.eq	0xfffff7f99acc  // b.none
   0x0000fffff7f98ca8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98cac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98cb0:	aa1303e1	mov	x1, x19
   0x0000fffff7f98cb4:	aa1503e2	mov	x2, x21
   0x0000fffff7f98cb8:	d2800583	mov	x3, #0x2c                  	// #44
   0x0000fffff7f98cbc:	aa1403e4	mov	x4, x20
   0x0000fffff7f98cc0:	aa1603e5	mov	x5, x22
   0x0000fffff7f98cc4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98cc8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98ccc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98cd0:	d63f0200	blr	x16
   0x0000fffff7f98cd4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98cd8:	54006fe0	b.eq	0xfffff7f99ad4  // b.none
   0x0000fffff7f98cdc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98ce0:	37d80269	tbnz	w9, #27, 0xfffff7f98d2c
   0x0000fffff7f98ce4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98ce8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98cec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98cf0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98cf4:	540001c1	b.ne	0xfffff7f98d2c  // b.any
   0x0000fffff7f98cf8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98cfc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98d00:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98d04:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98d08:	54000121	b.ne	0xfffff7f98d2c  // b.any
   0x0000fffff7f98d0c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98d10:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98d14:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98d18:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98d1c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98d20:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98d24:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98d28:	1400000e	b	0xfffff7f98d60
   0x0000fffff7f98d2c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98d30:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98d34:	aa1303e1	mov	x1, x19
   0x0000fffff7f98d38:	aa1503e2	mov	x2, x21
   0x0000fffff7f98d3c:	d28005a3	mov	x3, #0x2d                  	// #45
   0x0000fffff7f98d40:	aa1403e4	mov	x4, x20
   0x0000fffff7f98d44:	aa1603e5	mov	x5, x22
   0x0000fffff7f98d48:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98d4c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98d50:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98d54:	d63f0200	blr	x16
   0x0000fffff7f98d58:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98d5c:	54006c00	b.eq	0xfffff7f99adc  // b.none
   0x0000fffff7f98d60:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98d64:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98d68:	aa1303e1	mov	x1, x19
   0x0000fffff7f98d6c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98d70:	d28005c3	mov	x3, #0x2e                  	// #46
   0x0000fffff7f98d74:	aa1403e4	mov	x4, x20
   0x0000fffff7f98d78:	aa1603e5	mov	x5, x22
   0x0000fffff7f98d7c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98d80:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98d84:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98d88:	d63f0200	blr	x16
   0x0000fffff7f98d8c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98d90:	54006aa0	b.eq	0xfffff7f99ae4  // b.none
   0x0000fffff7f98d94:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98d98:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98d9c:	aa1303e1	mov	x1, x19
   0x0000fffff7f98da0:	aa1503e2	mov	x2, x21
   0x0000fffff7f98da4:	d28005e3	mov	x3, #0x2f                  	// #47
   0x0000fffff7f98da8:	aa1403e4	mov	x4, x20
   0x0000fffff7f98dac:	aa1603e5	mov	x5, x22
   0x0000fffff7f98db0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98db4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98db8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98dbc:	d63f0200	blr	x16
   0x0000fffff7f98dc0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98dc4:	54006940	b.eq	0xfffff7f99aec  // b.none
   0x0000fffff7f98dc8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98dcc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98dd0:	aa1303e1	mov	x1, x19
   0x0000fffff7f98dd4:	aa1503e2	mov	x2, x21
   0x0000fffff7f98dd8:	d2800603	mov	x3, #0x30                  	// #48
   0x0000fffff7f98ddc:	aa1403e4	mov	x4, x20
   0x0000fffff7f98de0:	aa1603e5	mov	x5, x22
   0x0000fffff7f98de4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98de8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98dec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98df0:	d63f0200	blr	x16
   0x0000fffff7f98df4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98df8:	540067e0	b.eq	0xfffff7f99af4  // b.none
   0x0000fffff7f98dfc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98e00:	37d80269	tbnz	w9, #27, 0xfffff7f98e4c
   0x0000fffff7f98e04:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98e08:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98e0c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98e10:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98e14:	540001c1	b.ne	0xfffff7f98e4c  // b.any
   0x0000fffff7f98e18:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98e1c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98e20:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98e24:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98e28:	54000121	b.ne	0xfffff7f98e4c  // b.any
   0x0000fffff7f98e2c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98e30:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98e34:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98e38:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98e3c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98e40:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98e44:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98e48:	1400000e	b	0xfffff7f98e80
   0x0000fffff7f98e4c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98e50:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98e54:	aa1303e1	mov	x1, x19
   0x0000fffff7f98e58:	aa1503e2	mov	x2, x21
   0x0000fffff7f98e5c:	d2800623	mov	x3, #0x31                  	// #49
   0x0000fffff7f98e60:	aa1403e4	mov	x4, x20
   0x0000fffff7f98e64:	aa1603e5	mov	x5, x22
   0x0000fffff7f98e68:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98e6c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98e70:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98e74:	d63f0200	blr	x16
   0x0000fffff7f98e78:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98e7c:	54006400	b.eq	0xfffff7f99afc  // b.none
   0x0000fffff7f98e80:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98e84:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98e88:	aa1303e1	mov	x1, x19
   0x0000fffff7f98e8c:	aa1503e2	mov	x2, x21
   0x0000fffff7f98e90:	d2800643	mov	x3, #0x32                  	// #50
   0x0000fffff7f98e94:	aa1403e4	mov	x4, x20
   0x0000fffff7f98e98:	aa1603e5	mov	x5, x22
   0x0000fffff7f98e9c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98ea0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98ea4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98ea8:	d63f0200	blr	x16
   0x0000fffff7f98eac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98eb0:	540062a0	b.eq	0xfffff7f99b04  // b.none
   0x0000fffff7f98eb4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98eb8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98ebc:	aa1303e1	mov	x1, x19
   0x0000fffff7f98ec0:	aa1503e2	mov	x2, x21
   0x0000fffff7f98ec4:	d2800663	mov	x3, #0x33                  	// #51
   0x0000fffff7f98ec8:	aa1403e4	mov	x4, x20
   0x0000fffff7f98ecc:	aa1603e5	mov	x5, x22
   0x0000fffff7f98ed0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98ed4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98ed8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98edc:	d63f0200	blr	x16
   0x0000fffff7f98ee0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98ee4:	54006140	b.eq	0xfffff7f99b0c  // b.none
   0x0000fffff7f98ee8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f98eec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98ef0:	aa1303e1	mov	x1, x19
   0x0000fffff7f98ef4:	aa1503e2	mov	x2, x21
   0x0000fffff7f98ef8:	d2800683	mov	x3, #0x34                  	// #52
   0x0000fffff7f98efc:	aa1403e4	mov	x4, x20
   0x0000fffff7f98f00:	aa1603e5	mov	x5, x22
   0x0000fffff7f98f04:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f98f08:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98f0c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98f10:	d63f0200	blr	x16
   0x0000fffff7f98f14:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98f18:	54005fe0	b.eq	0xfffff7f99b14  // b.none
   0x0000fffff7f98f1c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98f20:	37d80269	tbnz	w9, #27, 0xfffff7f98f6c
   0x0000fffff7f98f24:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f98f28:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98f2c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98f30:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98f34:	540001c1	b.ne	0xfffff7f98f6c  // b.any
   0x0000fffff7f98f38:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f98f3c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98f40:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98f44:	eb0a013f	cmp	x9, x10
   0x0000fffff7f98f48:	54000121	b.ne	0xfffff7f98f6c  // b.any
   0x0000fffff7f98f4c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f98f50:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f98f54:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f98f58:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f98f5c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f98f60:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f98f64:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f98f68:	1400000e	b	0xfffff7f98fa0
   0x0000fffff7f98f6c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98f70:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98f74:	aa1303e1	mov	x1, x19
   0x0000fffff7f98f78:	aa1503e2	mov	x2, x21
   0x0000fffff7f98f7c:	d28006a3	mov	x3, #0x35                  	// #53
   0x0000fffff7f98f80:	aa1403e4	mov	x4, x20
   0x0000fffff7f98f84:	aa1603e5	mov	x5, x22
   0x0000fffff7f98f88:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f98f8c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98f90:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98f94:	d63f0200	blr	x16
   0x0000fffff7f98f98:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98f9c:	54005c00	b.eq	0xfffff7f99b1c  // b.none
   0x0000fffff7f98fa0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f98fa4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98fa8:	aa1303e1	mov	x1, x19
   0x0000fffff7f98fac:	aa1503e2	mov	x2, x21
   0x0000fffff7f98fb0:	d28006c3	mov	x3, #0x36                  	// #54
   0x0000fffff7f98fb4:	aa1403e4	mov	x4, x20
   0x0000fffff7f98fb8:	aa1603e5	mov	x5, x22
   0x0000fffff7f98fbc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f98fc0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f98fc4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98fc8:	d63f0200	blr	x16
   0x0000fffff7f98fcc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f98fd0:	54005aa0	b.eq	0xfffff7f99b24  // b.none
   0x0000fffff7f98fd4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f98fd8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f98fdc:	aa1303e1	mov	x1, x19
   0x0000fffff7f98fe0:	aa1503e2	mov	x2, x21
   0x0000fffff7f98fe4:	d28006e3	mov	x3, #0x37                  	// #55
   0x0000fffff7f98fe8:	aa1403e4	mov	x4, x20
   0x0000fffff7f98fec:	aa1603e5	mov	x5, x22
   0x0000fffff7f98ff0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f98ff4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f98ff8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f98ffc:	d63f0200	blr	x16
   0x0000fffff7f99000:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99004:	54005940	b.eq	0xfffff7f99b2c  // b.none
   0x0000fffff7f99008:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9900c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99010:	aa1303e1	mov	x1, x19
   0x0000fffff7f99014:	aa1503e2	mov	x2, x21
   0x0000fffff7f99018:	d2800703	mov	x3, #0x38                  	// #56
   0x0000fffff7f9901c:	aa1403e4	mov	x4, x20
   0x0000fffff7f99020:	aa1603e5	mov	x5, x22
   0x0000fffff7f99024:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99028:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9902c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99030:	d63f0200	blr	x16
   0x0000fffff7f99034:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99038:	540057e0	b.eq	0xfffff7f99b34  // b.none
   0x0000fffff7f9903c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99040:	37d80269	tbnz	w9, #27, 0xfffff7f9908c
   0x0000fffff7f99044:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99048:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9904c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99050:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99054:	540001c1	b.ne	0xfffff7f9908c  // b.any
   0x0000fffff7f99058:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9905c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99060:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99064:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99068:	54000121	b.ne	0xfffff7f9908c  // b.any
   0x0000fffff7f9906c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f99070:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f99074:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99078:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9907c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99080:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f99084:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f99088:	1400000e	b	0xfffff7f990c0
   0x0000fffff7f9908c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99090:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99094:	aa1303e1	mov	x1, x19
   0x0000fffff7f99098:	aa1503e2	mov	x2, x21
   0x0000fffff7f9909c:	d2800723	mov	x3, #0x39                  	// #57
   0x0000fffff7f990a0:	aa1403e4	mov	x4, x20
   0x0000fffff7f990a4:	aa1603e5	mov	x5, x22
   0x0000fffff7f990a8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f990ac:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f990b0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f990b4:	d63f0200	blr	x16
   0x0000fffff7f990b8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f990bc:	54005400	b.eq	0xfffff7f99b3c  // b.none
   0x0000fffff7f990c0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f990c4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f990c8:	aa1303e1	mov	x1, x19
   0x0000fffff7f990cc:	aa1503e2	mov	x2, x21
   0x0000fffff7f990d0:	d2800743	mov	x3, #0x3a                  	// #58
   0x0000fffff7f990d4:	aa1403e4	mov	x4, x20
   0x0000fffff7f990d8:	aa1603e5	mov	x5, x22
   0x0000fffff7f990dc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f990e0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f990e4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f990e8:	d63f0200	blr	x16
   0x0000fffff7f990ec:	f100001f	cmp	x0, #0x0
   0x0000fffff7f990f0:	540052a0	b.eq	0xfffff7f99b44  // b.none
   0x0000fffff7f990f4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f990f8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f990fc:	aa1303e1	mov	x1, x19
   0x0000fffff7f99100:	aa1503e2	mov	x2, x21
   0x0000fffff7f99104:	d2800763	mov	x3, #0x3b                  	// #59
   0x0000fffff7f99108:	aa1403e4	mov	x4, x20
   0x0000fffff7f9910c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99110:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f99114:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99118:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9911c:	d63f0200	blr	x16
   0x0000fffff7f99120:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99124:	54005140	b.eq	0xfffff7f99b4c  // b.none
   0x0000fffff7f99128:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9912c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99130:	aa1303e1	mov	x1, x19
   0x0000fffff7f99134:	aa1503e2	mov	x2, x21
   0x0000fffff7f99138:	d2800783	mov	x3, #0x3c                  	// #60
   0x0000fffff7f9913c:	aa1403e4	mov	x4, x20
   0x0000fffff7f99140:	aa1603e5	mov	x5, x22
   0x0000fffff7f99144:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99148:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9914c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99150:	d63f0200	blr	x16
   0x0000fffff7f99154:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99158:	54004fe0	b.eq	0xfffff7f99b54  // b.none
   0x0000fffff7f9915c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99160:	37d80269	tbnz	w9, #27, 0xfffff7f991ac
   0x0000fffff7f99164:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99168:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9916c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99170:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99174:	540001c1	b.ne	0xfffff7f991ac  // b.any
   0x0000fffff7f99178:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9917c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99180:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99184:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99188:	54000121	b.ne	0xfffff7f991ac  // b.any
   0x0000fffff7f9918c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f99190:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f99194:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99198:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9919c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f991a0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f991a4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f991a8:	1400000e	b	0xfffff7f991e0
   0x0000fffff7f991ac:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f991b0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f991b4:	aa1303e1	mov	x1, x19
   0x0000fffff7f991b8:	aa1503e2	mov	x2, x21
   0x0000fffff7f991bc:	d28007a3	mov	x3, #0x3d                  	// #61
   0x0000fffff7f991c0:	aa1403e4	mov	x4, x20
   0x0000fffff7f991c4:	aa1603e5	mov	x5, x22
   0x0000fffff7f991c8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f991cc:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f991d0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f991d4:	d63f0200	blr	x16
   0x0000fffff7f991d8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f991dc:	54004c00	b.eq	0xfffff7f99b5c  // b.none
   0x0000fffff7f991e0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f991e4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f991e8:	aa1303e1	mov	x1, x19
   0x0000fffff7f991ec:	aa1503e2	mov	x2, x21
   0x0000fffff7f991f0:	d28007c3	mov	x3, #0x3e                  	// #62
   0x0000fffff7f991f4:	aa1403e4	mov	x4, x20
   0x0000fffff7f991f8:	aa1603e5	mov	x5, x22
   0x0000fffff7f991fc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f99200:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99204:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99208:	d63f0200	blr	x16
   0x0000fffff7f9920c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99210:	54004aa0	b.eq	0xfffff7f99b64  // b.none
   0x0000fffff7f99214:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f99218:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9921c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99220:	aa1503e2	mov	x2, x21
   0x0000fffff7f99224:	d28007e3	mov	x3, #0x3f                  	// #63
   0x0000fffff7f99228:	aa1403e4	mov	x4, x20
   0x0000fffff7f9922c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99230:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f99234:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99238:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9923c:	d63f0200	blr	x16
   0x0000fffff7f99240:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99244:	54004940	b.eq	0xfffff7f99b6c  // b.none
   0x0000fffff7f99248:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9924c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99250:	aa1303e1	mov	x1, x19
   0x0000fffff7f99254:	aa1503e2	mov	x2, x21
   0x0000fffff7f99258:	d2800803	mov	x3, #0x40                  	// #64
   0x0000fffff7f9925c:	aa1403e4	mov	x4, x20
   0x0000fffff7f99260:	aa1603e5	mov	x5, x22
   0x0000fffff7f99264:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99268:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9926c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99270:	d63f0200	blr	x16
   0x0000fffff7f99274:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99278:	540047e0	b.eq	0xfffff7f99b74  // b.none
   0x0000fffff7f9927c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99280:	37d80269	tbnz	w9, #27, 0xfffff7f992cc
   0x0000fffff7f99284:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99288:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9928c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99290:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99294:	540001c1	b.ne	0xfffff7f992cc  // b.any
   0x0000fffff7f99298:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9929c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f992a0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f992a4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f992a8:	54000121	b.ne	0xfffff7f992cc  // b.any
   0x0000fffff7f992ac:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f992b0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f992b4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f992b8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f992bc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f992c0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f992c4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f992c8:	1400000e	b	0xfffff7f99300
   0x0000fffff7f992cc:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f992d0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f992d4:	aa1303e1	mov	x1, x19
   0x0000fffff7f992d8:	aa1503e2	mov	x2, x21
   0x0000fffff7f992dc:	d2800823	mov	x3, #0x41                  	// #65
   0x0000fffff7f992e0:	aa1403e4	mov	x4, x20
   0x0000fffff7f992e4:	aa1603e5	mov	x5, x22
   0x0000fffff7f992e8:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f992ec:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f992f0:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f992f4:	d63f0200	blr	x16
   0x0000fffff7f992f8:	f100001f	cmp	x0, #0x0
   0x0000fffff7f992fc:	54004400	b.eq	0xfffff7f99b7c  // b.none
   0x0000fffff7f99300:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99304:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99308:	aa1303e1	mov	x1, x19
   0x0000fffff7f9930c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99310:	d2800843	mov	x3, #0x42                  	// #66
   0x0000fffff7f99314:	aa1403e4	mov	x4, x20
   0x0000fffff7f99318:	aa1603e5	mov	x5, x22
   0x0000fffff7f9931c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f99320:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99324:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99328:	d63f0200	blr	x16
   0x0000fffff7f9932c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99330:	540042a0	b.eq	0xfffff7f99b84  // b.none
   0x0000fffff7f99334:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f99338:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9933c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99340:	aa1503e2	mov	x2, x21
   0x0000fffff7f99344:	d2800863	mov	x3, #0x43                  	// #67
   0x0000fffff7f99348:	aa1403e4	mov	x4, x20
   0x0000fffff7f9934c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99350:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f99354:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99358:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9935c:	d63f0200	blr	x16
   0x0000fffff7f99360:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99364:	54004140	b.eq	0xfffff7f99b8c  // b.none
   0x0000fffff7f99368:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9936c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99370:	aa1303e1	mov	x1, x19
   0x0000fffff7f99374:	aa1503e2	mov	x2, x21
   0x0000fffff7f99378:	d2800883	mov	x3, #0x44                  	// #68
   0x0000fffff7f9937c:	aa1403e4	mov	x4, x20
   0x0000fffff7f99380:	aa1603e5	mov	x5, x22
   0x0000fffff7f99384:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99388:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9938c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99390:	d63f0200	blr	x16
   0x0000fffff7f99394:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99398:	54003fe0	b.eq	0xfffff7f99b94  // b.none
   0x0000fffff7f9939c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f993a0:	37d80269	tbnz	w9, #27, 0xfffff7f993ec
   0x0000fffff7f993a4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f993a8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f993ac:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993b0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f993b4:	540001c1	b.ne	0xfffff7f993ec  // b.any
   0x0000fffff7f993b8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f993bc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f993c0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993c4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f993c8:	54000121	b.ne	0xfffff7f993ec  // b.any
   0x0000fffff7f993cc:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f993d0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f993d4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f993d8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f993dc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f993e0:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f993e4:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f993e8:	1400000e	b	0xfffff7f99420
   0x0000fffff7f993ec:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f993f0:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f993f4:	aa1303e1	mov	x1, x19
   0x0000fffff7f993f8:	aa1503e2	mov	x2, x21
   0x0000fffff7f993fc:	d28008a3	mov	x3, #0x45                  	// #69
   0x0000fffff7f99400:	aa1403e4	mov	x4, x20
   0x0000fffff7f99404:	aa1603e5	mov	x5, x22
   0x0000fffff7f99408:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9940c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99410:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99414:	d63f0200	blr	x16
   0x0000fffff7f99418:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9941c:	54003c00	b.eq	0xfffff7f99b9c  // b.none
   0x0000fffff7f99420:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99424:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99428:	aa1303e1	mov	x1, x19
   0x0000fffff7f9942c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99430:	d28008c3	mov	x3, #0x46                  	// #70
   0x0000fffff7f99434:	aa1403e4	mov	x4, x20
   0x0000fffff7f99438:	aa1603e5	mov	x5, x22
   0x0000fffff7f9943c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f99440:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99444:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99448:	d63f0200	blr	x16
   0x0000fffff7f9944c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99450:	54003aa0	b.eq	0xfffff7f99ba4  // b.none
   0x0000fffff7f99454:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f99458:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9945c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99460:	aa1503e2	mov	x2, x21
   0x0000fffff7f99464:	d28008e3	mov	x3, #0x47                  	// #71
   0x0000fffff7f99468:	aa1403e4	mov	x4, x20
   0x0000fffff7f9946c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99470:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f99474:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99478:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9947c:	d63f0200	blr	x16
   0x0000fffff7f99480:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99484:	54003940	b.eq	0xfffff7f99bac  // b.none
   0x0000fffff7f99488:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f9948c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99490:	aa1303e1	mov	x1, x19
   0x0000fffff7f99494:	aa1503e2	mov	x2, x21
   0x0000fffff7f99498:	d2800903	mov	x3, #0x48                  	// #72
   0x0000fffff7f9949c:	aa1403e4	mov	x4, x20
   0x0000fffff7f994a0:	aa1603e5	mov	x5, x22
   0x0000fffff7f994a4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f994a8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f994ac:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f994b0:	d63f0200	blr	x16
   0x0000fffff7f994b4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f994b8:	540037e0	b.eq	0xfffff7f99bb4  // b.none
   0x0000fffff7f994bc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f994c0:	37d80269	tbnz	w9, #27, 0xfffff7f9950c
   0x0000fffff7f994c4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f994c8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f994cc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f994d0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f994d4:	540001c1	b.ne	0xfffff7f9950c  // b.any
   0x0000fffff7f994d8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f994dc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f994e0:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f994e4:	eb0a013f	cmp	x9, x10
   0x0000fffff7f994e8:	54000121	b.ne	0xfffff7f9950c  // b.any
   0x0000fffff7f994ec:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f994f0:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f994f4:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f994f8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f994fc:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99500:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f99504:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f99508:	1400000e	b	0xfffff7f99540
   0x0000fffff7f9950c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99510:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99514:	aa1303e1	mov	x1, x19
   0x0000fffff7f99518:	aa1503e2	mov	x2, x21
   0x0000fffff7f9951c:	d2800923	mov	x3, #0x49                  	// #73
   0x0000fffff7f99520:	aa1403e4	mov	x4, x20
   0x0000fffff7f99524:	aa1603e5	mov	x5, x22
   0x0000fffff7f99528:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9952c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99530:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99534:	d63f0200	blr	x16
   0x0000fffff7f99538:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9953c:	54003400	b.eq	0xfffff7f99bbc  // b.none
   0x0000fffff7f99540:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99544:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99548:	aa1303e1	mov	x1, x19
   0x0000fffff7f9954c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99550:	d2800943	mov	x3, #0x4a                  	// #74
   0x0000fffff7f99554:	aa1403e4	mov	x4, x20
   0x0000fffff7f99558:	aa1603e5	mov	x5, x22
   0x0000fffff7f9955c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f99560:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99564:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99568:	d63f0200	blr	x16
   0x0000fffff7f9956c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99570:	540032a0	b.eq	0xfffff7f99bc4  // b.none
   0x0000fffff7f99574:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f99578:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9957c:	aa1303e1	mov	x1, x19
   0x0000fffff7f99580:	aa1503e2	mov	x2, x21
   0x0000fffff7f99584:	d2800963	mov	x3, #0x4b                  	// #75
   0x0000fffff7f99588:	aa1403e4	mov	x4, x20
   0x0000fffff7f9958c:	aa1603e5	mov	x5, x22
   0x0000fffff7f99590:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f99594:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f99598:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f9959c:	d63f0200	blr	x16
   0x0000fffff7f995a0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f995a4:	54003140	b.eq	0xfffff7f99bcc  // b.none
   0x0000fffff7f995a8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f995ac:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f995b0:	aa1303e1	mov	x1, x19
   0x0000fffff7f995b4:	aa1503e2	mov	x2, x21
   0x0000fffff7f995b8:	d2800983	mov	x3, #0x4c                  	// #76
   0x0000fffff7f995bc:	aa1403e4	mov	x4, x20
   0x0000fffff7f995c0:	aa1603e5	mov	x5, x22
   0x0000fffff7f995c4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f995c8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f995cc:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f995d0:	d63f0200	blr	x16
   0x0000fffff7f995d4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f995d8:	54002fe0	b.eq	0xfffff7f99bd4  // b.none
   0x0000fffff7f995dc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f995e0:	37d80269	tbnz	w9, #27, 0xfffff7f9962c
   0x0000fffff7f995e4:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f995e8:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f995ec:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f995f0:	eb0a013f	cmp	x9, x10
   0x0000fffff7f995f4:	540001c1	b.ne	0xfffff7f9962c  // b.any
   0x0000fffff7f995f8:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f995fc:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99600:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99604:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99608:	54000121	b.ne	0xfffff7f9962c  // b.any
   0x0000fffff7f9960c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f99610:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f99614:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99618:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9961c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99620:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f99624:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f99628:	1400000e	b	0xfffff7f99660
   0x0000fffff7f9962c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99630:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99634:	aa1303e1	mov	x1, x19
   0x0000fffff7f99638:	aa1503e2	mov	x2, x21
   0x0000fffff7f9963c:	d28009a3	mov	x3, #0x4d                  	// #77
   0x0000fffff7f99640:	aa1403e4	mov	x4, x20
   0x0000fffff7f99644:	aa1603e5	mov	x5, x22
   0x0000fffff7f99648:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9964c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99650:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99654:	d63f0200	blr	x16
   0x0000fffff7f99658:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9965c:	54002c00	b.eq	0xfffff7f99bdc  // b.none
   0x0000fffff7f99660:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99664:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99668:	aa1303e1	mov	x1, x19
   0x0000fffff7f9966c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99670:	d28009c3	mov	x3, #0x4e                  	// #78
   0x0000fffff7f99674:	aa1403e4	mov	x4, x20
   0x0000fffff7f99678:	aa1603e5	mov	x5, x22
   0x0000fffff7f9967c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f99680:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99684:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99688:	d63f0200	blr	x16
   0x0000fffff7f9968c:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99690:	54002aa0	b.eq	0xfffff7f99be4  // b.none
   0x0000fffff7f99694:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f99698:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f9969c:	aa1303e1	mov	x1, x19
   0x0000fffff7f996a0:	aa1503e2	mov	x2, x21
   0x0000fffff7f996a4:	d28009e3	mov	x3, #0x4f                  	// #79
   0x0000fffff7f996a8:	aa1403e4	mov	x4, x20
   0x0000fffff7f996ac:	aa1603e5	mov	x5, x22
   0x0000fffff7f996b0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f996b4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f996b8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f996bc:	d63f0200	blr	x16
   0x0000fffff7f996c0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f996c4:	54002940	b.eq	0xfffff7f99bec  // b.none
   0x0000fffff7f996c8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f996cc:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f996d0:	aa1303e1	mov	x1, x19
   0x0000fffff7f996d4:	aa1503e2	mov	x2, x21
   0x0000fffff7f996d8:	d2800a03	mov	x3, #0x50                  	// #80
   0x0000fffff7f996dc:	aa1403e4	mov	x4, x20
   0x0000fffff7f996e0:	aa1603e5	mov	x5, x22
   0x0000fffff7f996e4:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f996e8:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f996ec:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f996f0:	d63f0200	blr	x16
   0x0000fffff7f996f4:	f100001f	cmp	x0, #0x0
   0x0000fffff7f996f8:	540027e0	b.eq	0xfffff7f99bf4  // b.none
   0x0000fffff7f996fc:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99700:	37d80269	tbnz	w9, #27, 0xfffff7f9974c
   0x0000fffff7f99704:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99708:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9970c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99710:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99714:	540001c1	b.ne	0xfffff7f9974c  // b.any
   0x0000fffff7f99718:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9971c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99720:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99724:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99728:	54000121	b.ne	0xfffff7f9974c  // b.any
   0x0000fffff7f9972c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f99730:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f99734:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99738:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9973c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99740:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f99744:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f99748:	1400000e	b	0xfffff7f99780
   0x0000fffff7f9974c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99750:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99754:	aa1303e1	mov	x1, x19
   0x0000fffff7f99758:	aa1503e2	mov	x2, x21
   0x0000fffff7f9975c:	d2800a23	mov	x3, #0x51                  	// #81
   0x0000fffff7f99760:	aa1403e4	mov	x4, x20
   0x0000fffff7f99764:	aa1603e5	mov	x5, x22
   0x0000fffff7f99768:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9976c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99770:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99774:	d63f0200	blr	x16
   0x0000fffff7f99778:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9977c:	54002400	b.eq	0xfffff7f99bfc  // b.none
   0x0000fffff7f99780:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99784:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99788:	aa1303e1	mov	x1, x19
   0x0000fffff7f9978c:	aa1503e2	mov	x2, x21
   0x0000fffff7f99790:	d2800a43	mov	x3, #0x52                  	// #82
   0x0000fffff7f99794:	aa1403e4	mov	x4, x20
   0x0000fffff7f99798:	aa1603e5	mov	x5, x22
   0x0000fffff7f9979c:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f997a0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f997a4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f997a8:	d63f0200	blr	x16
   0x0000fffff7f997ac:	f100001f	cmp	x0, #0x0
   0x0000fffff7f997b0:	540022a0	b.eq	0xfffff7f99c04  // b.none
   0x0000fffff7f997b4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f997b8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f997bc:	aa1303e1	mov	x1, x19
   0x0000fffff7f997c0:	aa1503e2	mov	x2, x21
   0x0000fffff7f997c4:	d2800a63	mov	x3, #0x53                  	// #83
   0x0000fffff7f997c8:	aa1403e4	mov	x4, x20
   0x0000fffff7f997cc:	aa1603e5	mov	x5, x22
   0x0000fffff7f997d0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f997d4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f997d8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f997dc:	d63f0200	blr	x16
   0x0000fffff7f997e0:	f100001f	cmp	x0, #0x0
   0x0000fffff7f997e4:	54002140	b.eq	0xfffff7f99c0c  // b.none
   0x0000fffff7f997e8:	9100c3e6	add	x6, sp, #0x30
   0x0000fffff7f997ec:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f997f0:	aa1303e1	mov	x1, x19
   0x0000fffff7f997f4:	aa1503e2	mov	x2, x21
   0x0000fffff7f997f8:	d2800a83	mov	x3, #0x54                  	// #84
   0x0000fffff7f997fc:	aa1403e4	mov	x4, x20
   0x0000fffff7f99800:	aa1603e5	mov	x5, x22
   0x0000fffff7f99804:	d294be10	mov	x16, #0xa5f0                	// #42480
   0x0000fffff7f99808:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9980c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99810:	d63f0200	blr	x16
   0x0000fffff7f99814:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99818:	54001fe0	b.eq	0xfffff7f99c14  // b.none
   0x0000fffff7f9981c:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99820:	37d80269	tbnz	w9, #27, 0xfffff7f9986c
   0x0000fffff7f99824:	b9402269	ldr	w9, [x19, #32]
   0x0000fffff7f99828:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9982c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99830:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99834:	540001c1	b.ne	0xfffff7f9986c  // b.any
   0x0000fffff7f99838:	b9403269	ldr	w9, [x19, #48]
   0x0000fffff7f9983c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99840:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99844:	eb0a013f	cmp	x9, x10
   0x0000fffff7f99848:	54000121	b.ne	0xfffff7f9986c  // b.any
   0x0000fffff7f9984c:	f9401669	ldr	x9, [x19, #40]
   0x0000fffff7f99850:	f9401e6a	ldr	x10, [x19, #56]
   0x0000fffff7f99854:	8b0a0129	add	x9, x9, x10
   0x0000fffff7f99858:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f9985c:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99860:	f9001669	str	x9, [x19, #40]
   0x0000fffff7f99864:	b900226a	str	w10, [x19, #32]
   0x0000fffff7f99868:	1400000e	b	0xfffff7f998a0
   0x0000fffff7f9986c:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f99870:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99874:	aa1303e1	mov	x1, x19
   0x0000fffff7f99878:	aa1503e2	mov	x2, x21
   0x0000fffff7f9987c:	d2800aa3	mov	x3, #0x55                  	// #85
   0x0000fffff7f99880:	aa1403e4	mov	x4, x20
   0x0000fffff7f99884:	aa1603e5	mov	x5, x22
   0x0000fffff7f99888:	d2934290	mov	x16, #0x9a14                	// #39444
   0x0000fffff7f9988c:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f99890:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99894:	d63f0200	blr	x16
   0x0000fffff7f99898:	f100001f	cmp	x0, #0x0
   0x0000fffff7f9989c:	54001c00	b.eq	0xfffff7f99c1c  // b.none
   0x0000fffff7f998a0:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f998a4:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f998a8:	aa1303e1	mov	x1, x19
   0x0000fffff7f998ac:	aa1503e2	mov	x2, x21
   0x0000fffff7f998b0:	d2800ac3	mov	x3, #0x56                  	// #86
   0x0000fffff7f998b4:	aa1403e4	mov	x4, x20
   0x0000fffff7f998b8:	aa1603e5	mov	x5, x22
   0x0000fffff7f998bc:	d293e810	mov	x16, #0x9f40                	// #40768
   0x0000fffff7f998c0:	f2b556b0	movk	x16, #0xaab5, lsl #16
   0x0000fffff7f998c4:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f998c8:	d63f0200	blr	x16
   0x0000fffff7f998cc:	f100001f	cmp	x0, #0x0
   0x0000fffff7f998d0:	54001aa0	b.eq	0xfffff7f99c24  // b.none
   0x0000fffff7f998d4:	910043e6	add	x6, sp, #0x10
   0x0000fffff7f998d8:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f998dc:	aa1303e1	mov	x1, x19
   0x0000fffff7f998e0:	aa1503e2	mov	x2, x21
   0x0000fffff7f998e4:	d2800ae3	mov	x3, #0x57                  	// #87
   0x0000fffff7f998e8:	aa1403e4	mov	x4, x20
   0x0000fffff7f998ec:	aa1603e5	mov	x5, x22
   0x0000fffff7f998f0:	d29dca10	mov	x16, #0xee50                	// #61008
   0x0000fffff7f998f4:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f998f8:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f998fc:	d63f0200	blr	x16
   0x0000fffff7f99900:	f100001f	cmp	x0, #0x0
   0x0000fffff7f99904:	54001940	b.eq	0xfffff7f99c2c  // b.none
   0x0000fffff7f99908:	d2800006	mov	x6, #0x0                   	// #0
   0x0000fffff7f9990c:	f94003e0	ldr	x0, [sp]
   0x0000fffff7f99910:	aa1303e1	mov	x1, x19
   0x0000fffff7f99914:	aa1503e2	mov	x2, x21
   0x0000fffff7f99918:	d2800b03	mov	x3, #0x58                  	// #88
   0x0000fffff7f9991c:	aa1403e4	mov	x4, x20
   0x0000fffff7f99920:	aa1603e5	mov	x5, x22
   0x0000fffff7f99924:	d286a090	mov	x16, #0x3504                	// #13572
   0x0000fffff7f99928:	f2b55690	movk	x16, #0xaab4, lsl #16
   0x0000fffff7f9992c:	f2d55550	movk	x16, #0xaaaa, lsl #32
   0x0000fffff7f99930:	d63f0200	blr	x16
   0x0000fffff7f99934:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f99938:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f9993c:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f99940:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f99944:	d2800020	mov	x0, #0x1                   	// #1
   0x0000fffff7f99948:	d65f03c0	ret
   0x0000fffff7f9994c:	5280004a	mov	w10, #0x2                   	// #2
   0x0000fffff7f99950:	72a0a00a	movk	w10, #0x500, lsl #16
   0x0000fffff7f99954:	b900028a	str	w10, [x20]
   0x0000fffff7f99958:	f9000689	str	x9, [x20, #8]
   0x0000fffff7f9995c:	910143ff	add	sp, sp, #0x50
   0x0000fffff7f99960:	a8c15bf5	ldp	x21, x22, [sp], #16
   0x0000fffff7f99964:	a8c153f3	ldp	x19, x20, [sp], #16
   0x0000fffff7f99968:	a8c17bfd	ldp	x29, x30, [sp], #16
   0x0000fffff7f9996c:	d2800040	mov	x0, #0x2                   	// #2
   0x0000fffff7f99970:	d65f03c0	ret
   0x0000fffff7f99974:	d2800009	mov	x9, #0x0                   	// #0
   0x0000fffff7f99978:	17fffff5	b	0xfffff7f9994c
   0x0000fffff7f9997c:	d2800029	mov	x9, #0x1                   	// #1
   0x0000fffff7f99980:	17fffff3	b	0xfffff7f9994c
   0x0000fffff7f99984:	d2800049	mov	x9, #0x2                   	// #2
   0x0000fffff7f99988:	17fffff1	b	0xfffff7f9994c
   0x0000fffff7f9998c:	d2800069	mov	x9, #0x3                   	// #3
   0x0000fffff7f99990:	17ffffef	b	0xfffff7f9994c
   0x0000fffff7f99994:	d2800089	mov	x9, #0x4                   	// #4
   0x0000fffff7f99998:	17ffffed	b	0xfffff7f9994c
   0x0000fffff7f9999c:	d28000a9	mov	x9, #0x5                   	// #5
   0x0000fffff7f999a0:	17ffffeb	b	0xfffff7f9994c
   0x0000fffff7f999a4:	d28000c9	mov	x9, #0x6                   	// #6
   0x0000fffff7f999a8:	17ffffe9	b	0xfffff7f9994c
   0x0000fffff7f999ac:	d28000e9	mov	x9, #0x7                   	// #7
   0x0000fffff7f999b0:	17ffffe7	b	0xfffff7f9994c
   0x0000fffff7f999b4:	d2800109	mov	x9, #0x8                   	// #8
   0x0000fffff7f999b8:	17ffffe5	b	0xfffff7f9994c
   0x0000fffff7f999bc:	d2800129	mov	x9, #0x9                   	// #9
   0x0000fffff7f999c0:	17ffffe3	b	0xfffff7f9994c
   0x0000fffff7f999c4:	d2800149	mov	x9, #0xa                   	// #10
   0x0000fffff7f999c8:	17ffffe1	b	0xfffff7f9994c
   0x0000fffff7f999cc:	d2800169	mov	x9, #0xb                   	// #11
   0x0000fffff7f999d0:	17ffffdf	b	0xfffff7f9994c
   0x0000fffff7f999d4:	d2800189	mov	x9, #0xc                   	// #12
   0x0000fffff7f999d8:	17ffffdd	b	0xfffff7f9994c
   0x0000fffff7f999dc:	d28001a9	mov	x9, #0xd                   	// #13
   0x0000fffff7f999e0:	17ffffdb	b	0xfffff7f9994c
   0x0000fffff7f999e4:	d28001c9	mov	x9, #0xe                   	// #14
   0x0000fffff7f999e8:	17ffffd9	b	0xfffff7f9994c
   0x0000fffff7f999ec:	d28001e9	mov	x9, #0xf                   	// #15
   0x0000fffff7f999f0:	17ffffd7	b	0xfffff7f9994c
   0x0000fffff7f999f4:	d2800209	mov	x9, #0x10                  	// #16
   0x0000fffff7f999f8:	17ffffd5	b	0xfffff7f9994c
   0x0000fffff7f999fc:	d2800229	mov	x9, #0x11                  	// #17
   0x0000fffff7f99a00:	17ffffd3	b	0xfffff7f9994c
   0x0000fffff7f99a04:	d2800249	mov	x9, #0x12                  	// #18
   0x0000fffff7f99a08:	17ffffd1	b	0xfffff7f9994c
   0x0000fffff7f99a0c:	d2800269	mov	x9, #0x13                  	// #19
   0x0000fffff7f99a10:	17ffffcf	b	0xfffff7f9994c
   0x0000fffff7f99a14:	d2800289	mov	x9, #0x14                  	// #20
   0x0000fffff7f99a18:	17ffffcd	b	0xfffff7f9994c
   0x0000fffff7f99a1c:	d28002a9	mov	x9, #0x15                  	// #21
   0x0000fffff7f99a20:	17ffffcb	b	0xfffff7f9994c
   0x0000fffff7f99a24:	d28002c9	mov	x9, #0x16                  	// #22
   0x0000fffff7f99a28:	17ffffc9	b	0xfffff7f9994c
   0x0000fffff7f99a2c:	d28002e9	mov	x9, #0x17                  	// #23
   0x0000fffff7f99a30:	17ffffc7	b	0xfffff7f9994c
   0x0000fffff7f99a34:	d2800309	mov	x9, #0x18                  	// #24
   0x0000fffff7f99a38:	17ffffc5	b	0xfffff7f9994c
   0x0000fffff7f99a3c:	d2800329	mov	x9, #0x19                  	// #25
   0x0000fffff7f99a40:	17ffffc3	b	0xfffff7f9994c
   0x0000fffff7f99a44:	d2800349	mov	x9, #0x1a                  	// #26
   0x0000fffff7f99a48:	17ffffc1	b	0xfffff7f9994c
   0x0000fffff7f99a4c:	d2800369	mov	x9, #0x1b                  	// #27
   0x0000fffff7f99a50:	17ffffbf	b	0xfffff7f9994c
   0x0000fffff7f99a54:	d2800389	mov	x9, #0x1c                  	// #28
   0x0000fffff7f99a58:	17ffffbd	b	0xfffff7f9994c
   0x0000fffff7f99a5c:	d28003a9	mov	x9, #0x1d                  	// #29
   0x0000fffff7f99a60:	17ffffbb	b	0xfffff7f9994c
   0x0000fffff7f99a64:	d28003c9	mov	x9, #0x1e                  	// #30
   0x0000fffff7f99a68:	17ffffb9	b	0xfffff7f9994c
   0x0000fffff7f99a6c:	d28003e9	mov	x9, #0x1f                  	// #31
   0x0000fffff7f99a70:	17ffffb7	b	0xfffff7f9994c
   0x0000fffff7f99a74:	d2800409	mov	x9, #0x20                  	// #32
   0x0000fffff7f99a78:	17ffffb5	b	0xfffff7f9994c
   0x0000fffff7f99a7c:	d2800429	mov	x9, #0x21                  	// #33
   0x0000fffff7f99a80:	17ffffb3	b	0xfffff7f9994c
   0x0000fffff7f99a84:	d2800449	mov	x9, #0x22                  	// #34
   0x0000fffff7f99a88:	17ffffb1	b	0xfffff7f9994c
   0x0000fffff7f99a8c:	d2800469	mov	x9, #0x23                  	// #35
   0x0000fffff7f99a90:	17ffffaf	b	0xfffff7f9994c
   0x0000fffff7f99a94:	d2800489	mov	x9, #0x24                  	// #36
   0x0000fffff7f99a98:	17ffffad	b	0xfffff7f9994c
   0x0000fffff7f99a9c:	d28004a9	mov	x9, #0x25                  	// #37
   0x0000fffff7f99aa0:	17ffffab	b	0xfffff7f9994c
   0x0000fffff7f99aa4:	d28004c9	mov	x9, #0x26                  	// #38
   0x0000fffff7f99aa8:	17ffffa9	b	0xfffff7f9994c
   0x0000fffff7f99aac:	d28004e9	mov	x9, #0x27                  	// #39
   0x0000fffff7f99ab0:	17ffffa7	b	0xfffff7f9994c
   0x0000fffff7f99ab4:	d2800509	mov	x9, #0x28                  	// #40
   0x0000fffff7f99ab8:	17ffffa5	b	0xfffff7f9994c
   0x0000fffff7f99abc:	d2800529	mov	x9, #0x29                  	// #41
   0x0000fffff7f99ac0:	17ffffa3	b	0xfffff7f9994c
   0x0000fffff7f99ac4:	d2800549	mov	x9, #0x2a                  	// #42
   0x0000fffff7f99ac8:	17ffffa1	b	0xfffff7f9994c
   0x0000fffff7f99acc:	d2800569	mov	x9, #0x2b                  	// #43
   0x0000fffff7f99ad0:	17ffff9f	b	0xfffff7f9994c
   0x0000fffff7f99ad4:	d2800589	mov	x9, #0x2c                  	// #44
   0x0000fffff7f99ad8:	17ffff9d	b	0xfffff7f9994c
   0x0000fffff7f99adc:	d28005a9	mov	x9, #0x2d                  	// #45
   0x0000fffff7f99ae0:	17ffff9b	b	0xfffff7f9994c
   0x0000fffff7f99ae4:	d28005c9	mov	x9, #0x2e                  	// #46
   0x0000fffff7f99ae8:	17ffff99	b	0xfffff7f9994c
   0x0000fffff7f99aec:	d28005e9	mov	x9, #0x2f                  	// #47
   0x0000fffff7f99af0:	17ffff97	b	0xfffff7f9994c
   0x0000fffff7f99af4:	d2800609	mov	x9, #0x30                  	// #48
   0x0000fffff7f99af8:	17ffff95	b	0xfffff7f9994c
   0x0000fffff7f99afc:	d2800629	mov	x9, #0x31                  	// #49
   0x0000fffff7f99b00:	17ffff93	b	0xfffff7f9994c
   0x0000fffff7f99b04:	d2800649	mov	x9, #0x32                  	// #50
   0x0000fffff7f99b08:	17ffff91	b	0xfffff7f9994c
   0x0000fffff7f99b0c:	d2800669	mov	x9, #0x33                  	// #51
   0x0000fffff7f99b10:	17ffff8f	b	0xfffff7f9994c
   0x0000fffff7f99b14:	d2800689	mov	x9, #0x34                  	// #52
   0x0000fffff7f99b18:	17ffff8d	b	0xfffff7f9994c
   0x0000fffff7f99b1c:	d28006a9	mov	x9, #0x35                  	// #53
   0x0000fffff7f99b20:	17ffff8b	b	0xfffff7f9994c
   0x0000fffff7f99b24:	d28006c9	mov	x9, #0x36                  	// #54
   0x0000fffff7f99b28:	17ffff89	b	0xfffff7f9994c
   0x0000fffff7f99b2c:	d28006e9	mov	x9, #0x37                  	// #55
   0x0000fffff7f99b30:	17ffff87	b	0xfffff7f9994c
   0x0000fffff7f99b34:	d2800709	mov	x9, #0x38                  	// #56
   0x0000fffff7f99b38:	17ffff85	b	0xfffff7f9994c
   0x0000fffff7f99b3c:	d2800729	mov	x9, #0x39                  	// #57
   0x0000fffff7f99b40:	17ffff83	b	0xfffff7f9994c
   0x0000fffff7f99b44:	d2800749	mov	x9, #0x3a                  	// #58
   0x0000fffff7f99b48:	17ffff81	b	0xfffff7f9994c
   0x0000fffff7f99b4c:	d2800769	mov	x9, #0x3b                  	// #59
   0x0000fffff7f99b50:	17ffff7f	b	0xfffff7f9994c
   0x0000fffff7f99b54:	d2800789	mov	x9, #0x3c                  	// #60
   0x0000fffff7f99b58:	17ffff7d	b	0xfffff7f9994c
   0x0000fffff7f99b5c:	d28007a9	mov	x9, #0x3d                  	// #61
   0x0000fffff7f99b60:	17ffff7b	b	0xfffff7f9994c
   0x0000fffff7f99b64:	d28007c9	mov	x9, #0x3e                  	// #62
   0x0000fffff7f99b68:	17ffff79	b	0xfffff7f9994c
   0x0000fffff7f99b6c:	d28007e9	mov	x9, #0x3f                  	// #63
   0x0000fffff7f99b70:	17ffff77	b	0xfffff7f9994c
   0x0000fffff7f99b74:	d2800809	mov	x9, #0x40                  	// #64
   0x0000fffff7f99b78:	17ffff75	b	0xfffff7f9994c
   0x0000fffff7f99b7c:	d2800829	mov	x9, #0x41                  	// #65
   0x0000fffff7f99b80:	17ffff73	b	0xfffff7f9994c
   0x0000fffff7f99b84:	d2800849	mov	x9, #0x42                  	// #66
   0x0000fffff7f99b88:	17ffff71	b	0xfffff7f9994c
   0x0000fffff7f99b8c:	d2800869	mov	x9, #0x43                  	// #67
   0x0000fffff7f99b90:	17ffff6f	b	0xfffff7f9994c
   0x0000fffff7f99b94:	d2800889	mov	x9, #0x44                  	// #68
   0x0000fffff7f99b98:	17ffff6d	b	0xfffff7f9994c
   0x0000fffff7f99b9c:	d28008a9	mov	x9, #0x45                  	// #69
   0x0000fffff7f99ba0:	17ffff6b	b	0xfffff7f9994c
   0x0000fffff7f99ba4:	d28008c9	mov	x9, #0x46                  	// #70
   0x0000fffff7f99ba8:	17ffff69	b	0xfffff7f9994c
   0x0000fffff7f99bac:	d28008e9	mov	x9, #0x47                  	// #71
   0x0000fffff7f99bb0:	17ffff67	b	0xfffff7f9994c
   0x0000fffff7f99bb4:	d2800909	mov	x9, #0x48                  	// #72
   0x0000fffff7f99bb8:	17ffff65	b	0xfffff7f9994c
   0x0000fffff7f99bbc:	d2800929	mov	x9, #0x49                  	// #73
   0x0000fffff7f99bc0:	17ffff63	b	0xfffff7f9994c
   0x0000fffff7f99bc4:	d2800949	mov	x9, #0x4a                  	// #74
   0x0000fffff7f99bc8:	17ffff61	b	0xfffff7f9994c
   0x0000fffff7f99bcc:	d2800969	mov	x9, #0x4b                  	// #75
   0x0000fffff7f99bd0:	17ffff5f	b	0xfffff7f9994c
   0x0000fffff7f99bd4:	d2800989	mov	x9, #0x4c                  	// #76
   0x0000fffff7f99bd8:	17ffff5d	b	0xfffff7f9994c
   0x0000fffff7f99bdc:	d28009a9	mov	x9, #0x4d                  	// #77
   0x0000fffff7f99be0:	17ffff5b	b	0xfffff7f9994c
   0x0000fffff7f99be4:	d28009c9	mov	x9, #0x4e                  	// #78
   0x0000fffff7f99be8:	17ffff59	b	0xfffff7f9994c
   0x0000fffff7f99bec:	d28009e9	mov	x9, #0x4f                  	// #79
   0x0000fffff7f99bf0:	17ffff57	b	0xfffff7f9994c
   0x0000fffff7f99bf4:	d2800a09	mov	x9, #0x50                  	// #80
   0x0000fffff7f99bf8:	17ffff55	b	0xfffff7f9994c
   0x0000fffff7f99bfc:	d2800a29	mov	x9, #0x51                  	// #81
   0x0000fffff7f99c00:	17ffff53	b	0xfffff7f9994c
   0x0000fffff7f99c04:	d2800a49	mov	x9, #0x52                  	// #82
   0x0000fffff7f99c08:	17ffff51	b	0xfffff7f9994c
   0x0000fffff7f99c0c:	d2800a69	mov	x9, #0x53                  	// #83
   0x0000fffff7f99c10:	17ffff4f	b	0xfffff7f9994c
   0x0000fffff7f99c14:	d2800a89	mov	x9, #0x54                  	// #84
   0x0000fffff7f99c18:	17ffff4d	b	0xfffff7f9994c
   0x0000fffff7f99c1c:	d2800aa9	mov	x9, #0x55                  	// #85
   0x0000fffff7f99c20:	17ffff4b	b	0xfffff7f9994c
   0x0000fffff7f99c24:	d2800ac9	mov	x9, #0x56                  	// #86
   0x0000fffff7f99c28:	17ffff49	b	0xfffff7f9994c
   0x0000fffff7f99c2c:	d2800ae9	mov	x9, #0x57                  	// #87
   0x0000fffff7f99c30:	17ffff47	b	0xfffff7f9994c
   0x0000fffff7f99c34:	00000000	udf	#0
   0x0000fffff7f99c38:	00000000	udf	#0
   0x0000fffff7f99c3c:	00000000	udf	#0
   0x0000fffff7f99c40:	00000000	udf	#0
   0x0000fffff7f99c44:	00000000	udf	#0
   0x0000fffff7f99c48:	00000000	udf	#0
   0x0000fffff7f99c4c:	00000000	udf	#0
   0x0000fffff7f99c50:	00000000	udf	#0
   0x0000fffff7f99c54:	00000000	udf	#0
   0x0000fffff7f99c58:	00000000	udf	#0
   0x0000fffff7f99c5c:	00000000	udf	#0
   0x0000fffff7f99c60:	00000000	udf	#0
   0x0000fffff7f99c64:	00000000	udf	#0
   0x0000fffff7f99c68:	00000000	udf	#0
   0x0000fffff7f99c6c:	00000000	udf	#0
   0x0000fffff7f99c70:	00000000	udf	#0
   0x0000fffff7f99c74:	00000000	udf	#0
   0x0000fffff7f99c78:	00000000	udf	#0
   0x0000fffff7f99c7c:	00000000	udf	#0
   0x0000fffff7f99c80:	00000000	udf	#0
   0x0000fffff7f99c84:	00000000	udf	#0
   0x0000fffff7f99c88:	00000000	udf	#0
   0x0000fffff7f99c8c:	00000000	udf	#0
   0x0000fffff7f99c90:	00000000	udf	#0
   0x0000fffff7f99c94:	00000000	udf	#0
   0x0000fffff7f99c98:	00000000	udf	#0
   0x0000fffff7f99c9c:	00000000	udf	#0
   0x0000fffff7f99ca0:	00000000	udf	#0
   0x0000fffff7f99ca4:	00000000	udf	#0
   0x0000fffff7f99ca8:	00000000	udf	#0
   0x0000fffff7f99cac:	00000000	udf	#0
   0x0000fffff7f99cb0:	00000000	udf	#0
   0x0000fffff7f99cb4:	00000000	udf	#0
   0x0000fffff7f99cb8:	00000000	udf	#0
   0x0000fffff7f99cbc:	00000000	udf	#0
   0x0000fffff7f99cc0:	00000000	udf	#0
   0x0000fffff7f99cc4:	00000000	udf	#0
   0x0000fffff7f99cc8:	00000000	udf	#0
   0x0000fffff7f99ccc:	00000000	udf	#0
   0x0000fffff7f99cd0:	00000000	udf	#0
   0x0000fffff7f99cd4:	00000000	udf	#0
   0x0000fffff7f99cd8:	00000000	udf	#0
   0x0000fffff7f99cdc:	00000000	udf	#0
   0x0000fffff7f99ce0:	00000000	udf	#0
   0x0000fffff7f99ce4:	00000000	udf	#0
   0x0000fffff7f99ce8:	00000000	udf	#0
   0x0000fffff7f99cec:	00000000	udf	#0
   0x0000fffff7f99cf0:	00000000	udf	#0
   0x0000fffff7f99cf4:	00000000	udf	#0
   0x0000fffff7f99cf8:	00000000	udf	#0
   0x0000fffff7f99cfc:	00000000	udf	#0
   0x0000fffff7f99d00:	00000000	udf	#0
   0x0000fffff7f99d04:	00000000	udf	#0
   0x0000fffff7f99d08:	00000000	udf	#0
   0x0000fffff7f99d0c:	00000000	udf	#0
   0x0000fffff7f99d10:	00000000	udf	#0
   0x0000fffff7f99d14:	00000000	udf	#0
   0x0000fffff7f99d18:	00000000	udf	#0
   0x0000fffff7f99d1c:	00000000	udf	#0
   0x0000fffff7f99d20:	00000000	udf	#0
   0x0000fffff7f99d24:	00000000	udf	#0
   0x0000fffff7f99d28:	00000000	udf	#0
   0x0000fffff7f99d2c:	00000000	udf	#0
   0x0000fffff7f99d30:	00000000	udf	#0
   0x0000fffff7f99d34:	00000000	udf	#0
   0x0000fffff7f99d38:	00000000	udf	#0
   0x0000fffff7f99d3c:	00000000	udf	#0
   0x0000fffff7f99d40:	00000000	udf	#0
   0x0000fffff7f99d44:	00000000	udf	#0
   0x0000fffff7f99d48:	00000000	udf	#0
   0x0000fffff7f99d4c:	00000000	udf	#0
   0x0000fffff7f99d50:	00000000	udf	#0
   0x0000fffff7f99d54:	00000000	udf	#0
   0x0000fffff7f99d58:	00000000	udf	#0
   0x0000fffff7f99d5c:	00000000	udf	#0
   0x0000fffff7f99d60:	00000000	udf	#0
   0x0000fffff7f99d64:	00000000	udf	#0
   0x0000fffff7f99d68:	00000000	udf	#0
   0x0000fffff7f99d6c:	00000000	udf	#0
   0x0000fffff7f99d70:	00000000	udf	#0
   0x0000fffff7f99d74:	00000000	udf	#0
   0x0000fffff7f99d78:	00000000	udf	#0
   0x0000fffff7f99d7c:	00000000	udf	#0
   0x0000fffff7f99d80:	00000000	udf	#0
   0x0000fffff7f99d84:	00000000	udf	#0
   0x0000fffff7f99d88:	00000000	udf	#0
   0x0000fffff7f99d8c:	00000000	udf	#0
   0x0000fffff7f99d90:	00000000	udf	#0
   0x0000fffff7f99d94:	00000000	udf	#0
   0x0000fffff7f99d98:	00000000	udf	#0
   0x0000fffff7f99d9c:	00000000	udf	#0
   0x0000fffff7f99da0:	00000000	udf	#0
   0x0000fffff7f99da4:	00000000	udf	#0
   0x0000fffff7f99da8:	00000000	udf	#0
   0x0000fffff7f99dac:	00000000	udf	#0
   0x0000fffff7f99db0:	00000000	udf	#0
   0x0000fffff7f99db4:	00000000	udf	#0
   0x0000fffff7f99db8:	00000000	udf	#0
   0x0000fffff7f99dbc:	00000000	udf	#0
   0x0000fffff7f99dc0:	00000000	udf	#0
   0x0000fffff7f99dc4:	00000000	udf	#0
   0x0000fffff7f99dc8:	00000000	udf	#0
   0x0000fffff7f99dcc:	00000000	udf	#0
   0x0000fffff7f99dd0:	00000000	udf	#0
   0x0000fffff7f99dd4:	00000000	udf	#0
   0x0000fffff7f99dd8:	00000000	udf	#0
   0x0000fffff7f99ddc:	00000000	udf	#0
   0x0000fffff7f99de0:	00000000	udf	#0
   0x0000fffff7f99de4:	00000000	udf	#0
   0x0000fffff7f99de8:	00000000	udf	#0
   0x0000fffff7f99dec:	00000000	udf	#0
   0x0000fffff7f99df0:	00000000	udf	#0
   0x0000fffff7f99df4:	00000000	udf	#0
   0x0000fffff7f99df8:	00000000	udf	#0
   0x0000fffff7f99dfc:	00000000	udf	#0
   0x0000fffff7f99e00:	00000000	udf	#0
   0x0000fffff7f99e04:	00000000	udf	#0
   0x0000fffff7f99e08:	00000000	udf	#0
   0x0000fffff7f99e0c:	00000000	udf	#0
   0x0000fffff7f99e10:	00000000	udf	#0
   0x0000fffff7f99e14:	00000000	udf	#0
   0x0000fffff7f99e18:	00000000	udf	#0
   0x0000fffff7f99e1c:	00000000	udf	#0
   0x0000fffff7f99e20:	00000000	udf	#0
   0x0000fffff7f99e24:	00000000	udf	#0
   0x0000fffff7f99e28:	00000000	udf	#0
   0x0000fffff7f99e2c:	00000000	udf	#0
   0x0000fffff7f99e30:	00000000	udf	#0
   0x0000fffff7f99e34:	00000000	udf	#0
   0x0000fffff7f99e38:	00000000	udf	#0
   0x0000fffff7f99e3c:	00000000	udf	#0
   0x0000fffff7f99e40:	00000000	udf	#0
   0x0000fffff7f99e44:	00000000	udf	#0
   0x0000fffff7f99e48:	00000000	udf	#0
   0x0000fffff7f99e4c:	00000000	udf	#0
   0x0000fffff7f99e50:	00000000	udf	#0
   0x0000fffff7f99e54:	00000000	udf	#0
   0x0000fffff7f99e58:	00000000	udf	#0
   0x0000fffff7f99e5c:	00000000	udf	#0
   0x0000fffff7f99e60:	00000000	udf	#0
   0x0000fffff7f99e64:	00000000	udf	#0
   0x0000fffff7f99e68:	00000000	udf	#0
   0x0000fffff7f99e6c:	00000000	udf	#0
   0x0000fffff7f99e70:	00000000	udf	#0
   0x0000fffff7f99e74:	00000000	udf	#0
   0x0000fffff7f99e78:	00000000	udf	#0
   0x0000fffff7f99e7c:	00000000	udf	#0
   0x0000fffff7f99e80:	00000000	udf	#0
   0x0000fffff7f99e84:	00000000	udf	#0
   0x0000fffff7f99e88:	00000000	udf	#0
   0x0000fffff7f99e8c:	00000000	udf	#0
   0x0000fffff7f99e90:	00000000	udf	#0
   0x0000fffff7f99e94:	00000000	udf	#0
   0x0000fffff7f99e98:	00000000	udf	#0
   0x0000fffff7f99e9c:	00000000	udf	#0
   0x0000fffff7f99ea0:	00000000	udf	#0
   0x0000fffff7f99ea4:	00000000	udf	#0
   0x0000fffff7f99ea8:	00000000	udf	#0
   0x0000fffff7f99eac:	00000000	udf	#0
   0x0000fffff7f99eb0:	00000000	udf	#0
   0x0000fffff7f99eb4:	00000000	udf	#0
   0x0000fffff7f99eb8:	00000000	udf	#0
   0x0000fffff7f99ebc:	00000000	udf	#0
   0x0000fffff7f99ec0:	00000000	udf	#0
   0x0000fffff7f99ec4:	00000000	udf	#0
   0x0000fffff7f99ec8:	00000000	udf	#0
   0x0000fffff7f99ecc:	00000000	udf	#0
   0x0000fffff7f99ed0:	00000000	udf	#0
   0x0000fffff7f99ed4:	00000000	udf	#0
   0x0000fffff7f99ed8:	00000000	udf	#0
   0x0000fffff7f99edc:	00000000	udf	#0
   0x0000fffff7f99ee0:	00000000	udf	#0
   0x0000fffff7f99ee4:	00000000	udf	#0
   0x0000fffff7f99ee8:	00000000	udf	#0
   0x0000fffff7f99eec:	00000000	udf	#0
   0x0000fffff7f99ef0:	00000000	udf	#0
   0x0000fffff7f99ef4:	00000000	udf	#0
   0x0000fffff7f99ef8:	00000000	udf	#0
   0x0000fffff7f99efc:	00000000	udf	#0
   0x0000fffff7f99f00:	00000000	udf	#0
   0x0000fffff7f99f04:	00000000	udf	#0
   0x0000fffff7f99f08:	00000000	udf	#0
   0x0000fffff7f99f0c:	00000000	udf	#0
   0x0000fffff7f99f10:	00000000	udf	#0
   0x0000fffff7f99f14:	00000000	udf	#0
   0x0000fffff7f99f18:	00000000	udf	#0
   0x0000fffff7f99f1c:	00000000	udf	#0
   0x0000fffff7f99f20:	00000000	udf	#0
   0x0000fffff7f99f24:	00000000	udf	#0
   0x0000fffff7f99f28:	00000000	udf	#0
   0x0000fffff7f99f2c:	00000000	udf	#0
   0x0000fffff7f99f30:	00000000	udf	#0
   0x0000fffff7f99f34:	00000000	udf	#0
   0x0000fffff7f99f38:	00000000	udf	#0
   0x0000fffff7f99f3c:	00000000	udf	#0
   0x0000fffff7f99f40:	00000000	udf	#0
   0x0000fffff7f99f44:	00000000	udf	#0
   0x0000fffff7f99f48:	00000000	udf	#0
   0x0000fffff7f99f4c:	00000000	udf	#0
   0x0000fffff7f99f50:	00000000	udf	#0
   0x0000fffff7f99f54:	00000000	udf	#0
   0x0000fffff7f99f58:	00000000	udf	#0
   0x0000fffff7f99f5c:	00000000	udf	#0
   0x0000fffff7f99f60:	00000000	udf	#0
   0x0000fffff7f99f64:	00000000	udf	#0
   0x0000fffff7f99f68:	00000000	udf	#0
   0x0000fffff7f99f6c:	00000000	udf	#0
   0x0000fffff7f99f70:	00000000	udf	#0
   0x0000fffff7f99f74:	00000000	udf	#0
   0x0000fffff7f99f78:	00000000	udf	#0
   0x0000fffff7f99f7c:	00000000	udf	#0
   0x0000fffff7f99f80:	00000000	udf	#0
   0x0000fffff7f99f84:	00000000	udf	#0
   0x0000fffff7f99f88:	00000000	udf	#0
   0x0000fffff7f99f8c:	00000000	udf	#0
   0x0000fffff7f99f90:	00000000	udf	#0
   0x0000fffff7f99f94:	00000000	udf	#0
   0x0000fffff7f99f98:	00000000	udf	#0
   0x0000fffff7f99f9c:	00000000	udf	#0
   0x0000fffff7f99fa0:	00000000	udf	#0
   0x0000fffff7f99fa4:	00000000	udf	#0
   0x0000fffff7f99fa8:	00000000	udf	#0
   0x0000fffff7f99fac:	00000000	udf	#0
   0x0000fffff7f99fb0:	00000000	udf	#0
   0x0000fffff7f99fb4:	00000000	udf	#0
   0x0000fffff7f99fb8:	00000000	udf	#0
   0x0000fffff7f99fbc:	00000000	udf	#0
   0x0000fffff7f99fc0:	00000000	udf	#0
   0x0000fffff7f99fc4:	00000000	udf	#0
   0x0000fffff7f99fc8:	00000000	udf	#0
   0x0000fffff7f99fcc:	00000000	udf	#0
   0x0000fffff7f99fd0:	00000000	udf	#0
   0x0000fffff7f99fd4:	00000000	udf	#0
   0x0000fffff7f99fd8:	00000000	udf	#0
   0x0000fffff7f99fdc:	00000000	udf	#0
   0x0000fffff7f99fe0:	00000000	udf	#0
   0x0000fffff7f99fe4:	00000000	udf	#0
   0x0000fffff7f99fe8:	00000000	udf	#0
   0x0000fffff7f99fec:	00000000	udf	#0
   0x0000fffff7f99ff0:	00000000	udf	#0
   0x0000fffff7f99ff4:	00000000	udf	#0
   0x0000fffff7f99ff8:	00000000	udf	#0
   0x0000fffff7f99ffc:	00000000	udf	#0
End of assembler dump.
